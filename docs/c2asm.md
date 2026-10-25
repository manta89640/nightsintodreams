# c2asm: C-syntax assembly, SH-2 interpreter and differential test

> The project's matching source is reviewed assembly (`src/<unit>.s`), not this
> dialect. c2asm's SH-2 interpreter and differential test are what check the
> non-matching port C (`port/`) against the original code. The dialect is still a
> convenient way to read a unit as structured code (`c2asm lift`).

The game code in `0NIGHTS` is hand-written SH-2 assembly, so no C compiler can
reproduce it. `tools/c2asm` is a project-specific compiler for a C dialect in which
every statement is exactly one instruction, or a short fixed sequence. The source
fixes the instruction stream; the compiler never chooses registers or reorders code.
What it adds over plain assembly:

- C syntax and structured `if`/`else`/`do`/`while`
- named struct fields and GBR variables
- literal pools placed automatically, the way the original assembler placed them

Background and the design comparison are in
[research/c-to-handwritten-asm.md](research/c-to-handwritten-asm.md).

| Part | File |
|---|---|
| Parser | `tools/c2asm/lang.py` |
| SH-2 backend and asmsh literal pools | `tools/c2asm/sh.py` |
| Lifter (generated asm → dialect) | `tools/c2asm/lift.py` |
| Portable C backend and runtime | `tools/c2asm/portc.py`, `tools/c2asm/rt/` |
| SH-2 interpreter and differential test | `tools/c2asm/interp.py`, `tools/c2asm/difftest.py` |
| Object comparison | `tools/c2asm/elfobj.py` |
| Tests | `tests/test_c2asm.py`, `tests/c2asm/*.nc` (run by `make test`) |

```sh
python3 tools/c2asm compile src.nc -o out.s     # dialect -> GNU as (sh-elf-as --isa=sh2 -big -I include)
python3 tools/c2asm emit-c src.nc -o out.c      # dialect -> portable C
python3 tools/c2asm lift build/usa/asm/game/0600D1A0.s -o 0600D1A0.nc
python3 tools/c2asm roundtrip [game/UNIT ...]   # lift + compile every game unit, compare objects
python3 tools/c2asm/difftest.py [--cases N]     # C backend vs the original bytes
```

## Where it stands

All of these numbers can be reproduced with `make test` after `make check`.

| Check | Result |
|---|---|
| Every SH-2 opcode that is not PC-relative, plus every PC-relative form for each register: lift, compile, assemble, compare with the original object | 36,199 instructions identical |
| Hand-written dialect (`tests/c2asm/*.nc`) against the bytes in `0NIGHTS` | 12/12 functions identical |
| Every linked game unit: lift, compile, assemble, then compare section bytes, relocations and global symbols with the target object | 191/191 units, 1,422/1,422 functions, 205,986/205,986 function bytes |
| `0NIGHTS` linked from the 191 lifted objects | SHA-1 `08faf869…` (matches) |
| Differential test, 8 random states per function | 1,248 functions with identical runs, **0 with a difference**, 174 only inconclusive |

The lifter produces:
- 10,456 literals placed by asmsh's pool rules, and 445 explicit labelled loads
- 92 `__nopool;` markers
- 2,457 `if` blocks, 69 `if`/`else` and 419 `do`/`while` loops recovered from branches

## The dialect

A file is a list of sections, each holding functions and data:

```c
__section(".text.0600D1A0");

void func_0600D1A0(void)
{
    register Node *node asm("r1");      // a typed name for r1 (no code)

    r1 += -16;
    r2 = node->next;                    // mov.l @(0,r1),r2
    if (r2 > 0) {                       // cmp/pl r2; bf .Lend
        ...
        return slot(*(s32 *)r4 = r0);   // rts; mov.l r0,@r4
    }
    ...
}
```

Registers are `r0`–`r15`, `T`, `sr`, `gbr`, `vbr`, `pr`, `mach`, `macl` and `mac`
(`mach:macl`). A raw register is an `s32`. `register T name asm("rN")` gives a
register a type, so that `->` and pointer comparisons work. Labels are `name:` and
are local to the file; `object name:` makes a global data or code label (`dlabel`).
`__gbr(off) T name;` declares a GBR variable, and `extern T name;` an absolute one
(`rN = name` then loads it through `rN`).

### Statements and the instructions they become

| Statement | Instruction |
|---|---|
| `rn = rm;` `rn = 5;` | `mov` |
| `rn = 0x1234;` `rn = &D_x;` `rn = func_x;` `rn = &sym + 4;` | `mov.w`/`mov.l` literal (asmsh `MOV.W #imm` / `MOV.L #imm`), size chosen from the value |
| `rn = __w(x);` `rn = __l(x);` | forces a word or longword literal |
| `rn = *(s16 *)&label;` | PC-relative load from an explicit label |
| `r0 = __mova(&label);` | `mova` |
| `rn = *(s8 *)rm;` `*(s32 *)rn = rm;` | `mov.b`/`mov.l` through `@rm` / `@rn` |
| `rn = *(s16 *)rm++;` `*(s32 *)--rn = rm;` | `@rm+` / `@-rn` |
| `r0 = *(s8 *)(rm + 4);` `*(s32 *)(rn + 8) = rm;` | `@(disp,rN)`. Displacement 0 is written `(rn + 0)`, which is a different encoding from `@rn`. |
| `rn = *(s32 *)(r0 + rm);` | `@(r0,rm)` |
| `r0 = *(s16 *)(gbr + 124);` or a `__gbr` variable | `@(disp,gbr)` |
| `p->field` | `@(disp,rP)`, or `mov #off,r0` + `@(r0,rP)` when the field is out of range |
| `rn += rm;` `rn += -4;` `rn -= rm;` `rn &= rm;` `r0 &= 0xF0;` (also `\|=`, `^=`) | `add`, `sub`, `and`, `or`, `xor` |
| `rn = -rm;` `rn = ~rm;` `rn = (s8)rm;` `rn = (u16)rm;` | `neg`, `not`, `exts`, `extu` |
| `rn <<= 1/2/8/16;` `rn = (u32)rn >> 1/2/8/16;` `rn >>= 1;` | `shll*`, `shlr*`, `shar` |
| `rn = __rotl(rn);` and `__rotr`, `__rotcl`, `__rotcr`, `__shal` | rotates, `shal` |
| `rn = __addc(rn, rm);` and `__subc`, `__addv`, `__subv`; `rn = __negc(rm);` | carry and overflow forms |
| `rn = __swapb(rm);` `rn = __swapw(rm);` `rn = __xtrct(rm, rn);` | `swap.b`, `swap.w`, `xtrct` |
| `macl = rn * rm;` `macl = (s16)rn * (s16)rm;` `mac = (s64)rn * rm;` | `mul.l`, `muls.w`/`mulu.w`, `dmuls.l`/`dmulu.l` |
| `__macl(rm, rn);` `__macw(rm, rn);` `mac = 0;` | `mac.l`, `mac.w`, `clrmac` |
| `__div0s(rm, rn);` `__div0u();` `__div1(rm, rn);` | division steps |
| `T = rn > rm;` `T = (u32)rn >= (u32)rm;` `T = rn == rm;` `T = r0 == 7;` | `cmp/gt`, `cmp/hs`, `cmp/eq` |
| `T = rn > 0;` `T = rn >= 0;` `T = !rn;` `T = (rn & rm) == 0;` `T = (r0 & 4) == 0;` | `cmp/pl`, `cmp/pz`, `tst` |
| `T = --rn == 0;` `T = __cmpstr(rn, rm);` `T = __tas(rn);` `T = 0;` `T = 1;` `rn = T;` | `dt`, `cmp/str`, `tas.b`, `clrt`, `sett`, `movt` |
| `*(u8 *)(gbr + r0) &= 0x7F;` `T = (*(u8 *)(gbr + r0) & 1) == 0;` | `and.b`/`or.b`/`xor.b`/`tst.b @(r0,gbr)` |
| `sr = rm;` `rn = pr;` `gbr = *(s32 *)rm++;` `*(s32 *)--rn = macl;` | `ldc`/`lds`/`stc`/`sts` and their `.l` forms |
| `push(r8);` `pop(pr);` | `mov.l r8,@-r15`, `lds.l @r15+,pr` and similar |
| `if (cond) goto L;` | the compare, then `bt`/`bf` |
| `if (cond) { ... } [else { ... }]` `do { ... } while (cond);` `while (cond) { ... }` | fixed layouts with `bt`/`bf` and `bra` |
| `goto L;` `goto *rn;` `return;` | `bra`, `jmp`, `rts` |
| `func_x();` `__bsr func_x();` `(*rn)();` | `mov.l #func_x,r0; jsr @r0`, `bsr`, `jsr @rn` |
| `return func_x();` `return (*rn)();` | tail calls through `jmp` |
| `__braf(rn);` `__bsrf(rn);` `__rte();` `__trapa(n);` `__sleep();` `__nop();` | as named |
| `... slot(stmt);` after any branch, call or `return` | puts `stmt` in the delay slot; without it the slot is `nop`. `slot(L: stmt)` labels the slot. |
| `__data { u8 1, 2; u16 x; u32 &sym; char "text"; L: ... }` | data inline (`.byte`, `.short`, `.long`, `.asciz`) |
| `__nopool;` | asmsh `.NOPOOL` |

Anything else is a compile error, for example `rn == 0` for `rn` other than `r0`
(write `!rn`), or a load into a register other than `r0` that only `r0` can receive.

The canonical forms are what the lifter writes. Some other spellings are accepted
when they mean the same instruction: `rn -= 4` is `add #-4`, and `rn > 0` on a typed
pointer is `cmp/pl`.

### Literal pools

The original was assembled with Hitachi's asmsh, using its automatic literal pools
(SuperH RISC Engine Assembler manual, section 9). c2asm uses the same rules:

- A literal goes to the first pool point after the instruction that uses it. A pool
  point is after an unconditional branch (`bra`, `jmp`, `rts`, `rte`, `braf`) and its
  delay slot, unless the slot carries a label or `__nopool;` follows.
- Inside a pool, words come first, then `H'0000` padding, then longwords.
- Equal literals of the same size share a slot.
- A literal still pending at the end of a section gets a `bra` around its pool.

The lifter keeps a literal automatic only when these rules put it exactly where the
original has it. Everything else stays an explicit `rN = *(s32 *)&label` with the
data in a `__data` block. That covers about 4% of literals, which are hand-placed
tables and different orderings.

## The C backend and the differential test

`emit-c` and the differential test translate the compiler's instruction stream
(after pool placement, so every address is known) into C:

- one function per text section, with every label as an entry point
- registers, T/M/Q/S and MAC in `sh`
- big-endian memory accessors over a 1 MB window
- exact delay-slot ordering

The output is register-level C, like a static recompiler's. It is correct and
portable, not idiomatic. The readable form of the code is the dialect.

`difftest.py` runs every lifted function from random machine states in two ways:
the translated C, and the original bytes in `interp.py` (an independent SH-2
interpreter). It then compares registers, flags, MAC, the whole memory window, and a
log of calls into untranslated code (SBL, BIOS vectors), which both sides stub the
same way. A run is **inconclusive** instead of failing when either side reaches
something the C does not follow:

- a computed call or jump into translated code that is not a label
- a return to a PR other than the one its caller set; some handlers pop their
  caller's return address
- a delay slot that changes PR
- `rte`, `sleep`, `trapa` or MAC saturation
- the step limit; random states often start polling loops

So far every conclusive run has matched. The test also found code that the split
was holding as data (fixed in 1031ff8), since such runs end in bytes that are not
instructions in the source.

## Plugging it into the build (proposal, not wired up)

1. **Sources.** A game unit's source becomes `src/game/<unit>.nc` instead of
   `src/game/<unit>.s`. `python3 tools/c2asm lift build/usa/asm/game/<unit>.s` gives
   the starting point. Names from `symbols.txt` carry over as they do for `.s`
   sources.
2. **Build rule.** `$(BUILD)/src/%.s: src/%.nc tools/c2asm/*.py` runs
   `python3 tools/c2asm compile`, and the existing `$(BUILD)/src/%.o: $(BUILD)/src/%.s`
   rule assembles the result. That object is the objdiff base and is linked in place
   of the generated file, exactly as committed `.s` units are today. `make check`
   then proves the unit byte for byte.
3. **Progress.** Add a progress category, for example `game_c` ("Game (C dialect)"),
   for units whose source is `.nc`. Unit names already decide categories, so this
   could be a `game_c/` prefix in `units.txt`, or an extra category on the unit in
   `objdiff.json`. The existing `game` category keeps counting units claimed as
   `.s`. Port readiness (functions whose C passes the differential test) is a
   separate number, written next to `report.json` by `difftest.py`.
4. **Gate.** `make test` already runs the round trip of every unit and the
   differential test, so a lifter or compiler change can't silently break a unit
   that isn't claimed yet.
