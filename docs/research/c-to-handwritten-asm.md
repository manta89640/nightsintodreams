# Matching the hand-written game code from C: feasibility and design

Can the game code in `0NIGHTS` (hand-written SH-2 assembly) be written as C, or a C dialect,
that a project-specific compiler turns back into the original bytes? And could that same C
serve the 3DS port?

## Summary

- **Matching is feasible, but only with a deterministic "structured assembler" that uses C
  syntax.** An optimizing compiler won't get there. A 1,100-line Python prototype
  (`build/research/c2asm/`) compiles a register-pinned C dialect into GNU as source:
  - 12 real game functions (520 bytes, from 5 units) came out byte-identical to `0NIGHTS`.
  - One of them is the whole `.text` of unit `game/0600D1A0`, the object-list core.
  - Linked in place of the generated assembly, that unit gives the correct SHA-1 for the full
    program, and objdiff scores all six of its functions at 100%.
- **The same source also compiles to portable C.** The prototype's second backend emits
  register-machine C. It ran 3,000 random machine states against the original bytes in an
  SH-2 interpreter, and every final state was identical. Mutating the source is caught by
  this test.
- **The game was written with Hitachi's assembler (asmsh), using its automatic literal
  pools.** A replay of asmsh's documented placement rules puts 96.4% of the 9,071 literal
  references exactly where they are in the binary. That pass is the only "clever" part a
  matching compiler needs, and the prototype implements it.
- **The game code is unusual but regular:**
  - Most functions take an object pointer in `r1` (58%).
  - GBR points at a fixed 1 KB work area at `0x060FFC00`. Only one function ever points it
    anywhere else.
  - There are almost no stack frames.
  - About 59% of delay slots hold a `nop`.
  - Calls go `mov.l #f,r0; jsr @r0` 70% of the time.
  - There are repeated macro-like sequences, such as "set next handler", which appears 207
    times.
- **No published project has matched hand-written assembly byte for byte from C.** Every
  hand-asm project keeps the assembly as the source, embeds it in C, or writes C that behaves
  the same but doesn't match the bytes ([prior art](#1-prior-art)). This design would be new,
  but it is closest to Wiz/TERSE-style high-level assemblers.
- **Recommendation:**
  1. Keep assembly as the source of truth for now.
  2. Adopt asmsh-style `mov.l #sym,rN` with a literal-pool pass right away.
  3. Then grow the prototype into a real tool with two backends: matching asm and portable
     C. Add a lifter (asm → dialect) and an emulator-based differential test.
  4. Track dialect coverage as its own objdiff category, and track port coverage separately.

Prototype results are measured. Effort figures and the parts of the ISA the prototype doesn't
cover yet are estimates, and are marked as such.

---

## 1. Prior art

The only items listed are ones verified to exist, either on their project page or through
the GitHub API. Several Saturn and Dreamcast projects are new (created in 2026, with
single-digit stars), so treat them as early-stage.

### Hand-written assembly games: the assembly stays the source

| Project | What it does | Byte-matching from C? |
|---|---|---|
| [s1disasm](https://github.com/sonicretro/s1disasm), [s2disasm](https://github.com/sonicretro/s2disasm), [skdisasm](https://github.com/sonicretro/skdisasm) | Commented 68000 disassemblies that rebuild the ROMs | No. The assembly is the source. |
| [pokered](https://github.com/pret/pokered), [pokecrystal](https://github.com/pret/pokecrystal) | GB disassemblies in RGBDS | No. pret only does C decomps of games that were C originally. |
| [rage-racer-decomp](https://github.com/khasinski/rage-racer-decomp), [sm64ds-decomp](https://github.com/SMarioMan/sm64ds-decomp), [BFM-decomp](https://github.com/Druthulu/BFM-decomp) | C decomps that keep hand-written routines as assembly (`HANDWRITTEN_ASM`, `INCLUDE_ASM`) and count them as done | No |
| [asm-processor](https://github.com/simonlindholm/asm-processor) | `GLOBAL_ASM()` blocks inside compiled C, patched into the object | No, it's an escape hatch. |

### Custom or recovered compilers (all for code that was compiled originally)

| Project | Relevance |
|---|---|
| [agbcc](https://github.com/pret/agbcc) | Patched GCC 2.95 for GBA decomps. pret code uses `register T x asm("r4")` to steer allocation. This pins registers on top of a real compiler; it doesn't reproduce hand-written assembly. |
| [camelot-gcc](https://github.com/Coaltergeist/camelot-gcc) | Patched GCC 2.96/3.0 to match Golden Sun. Decomps do patch compiler internals. |
| [old-gcc](https://github.com/decompals/old-gcc), [ido-static-recomp](https://github.com/decompals/ido-static-recomp) | Recovered compilers for PS1 and N64 decomps |
| [decomp-permuter](https://github.com/simonlindholm/decomp-permuter), [asm-differ](https://github.com/simonlindholm/asm-differ), [m2c](https://github.com/matt-kempster/m2c) | Matching tooling. m2c lists an `sh2` target and produces a C starting point, not matching code. |
| [sotn-decomp](https://github.com/Xeeynamo/sotn-decomp) | Matching decomp whose Saturn build uses Cygnus GCC 2.7-96Q3 |
| [tgm2p-decomp](https://github.com/masonc15/tgm2p-decomp) | SH-2 arcade matching decomp with SHC 5.0, about 60% verified. Unmatched code stays `.s`. It notes that SHC literal pools are shared across functions. |
| [decomp.me PR #2115](https://github.com/decompme/decomp.me/pull/2115) | Adds SHC 5.0 for SH-2 to decomp.me |

### C that behaves the same but doesn't match (the port side)

| Project | Method |
|---|---|
| [OpenRCT2](https://github.com/OpenRCT2/OpenRCT2) | RCT2 was hand-written x86. Each function was rewritten in C inside a DLL hooked into the original exe, which allowed hybrid execution until all of it was replaced. Calls into the original passed explicit register sets. |
| [OpenTTD](https://wiki.openttd.org/en/Archive/OpenTTD/OpenTTD%20History) | TTD (hand-written x86) was reverse-engineered into C by hand |
| [zelda3](https://github.com/snesrev/zelda3), [sm](https://github.com/snesrev/sm) | Hand-written C reimplementations of SNES assembly games. They can run the original alongside and compare RAM every frame. This is the best-documented case of differential verification. |
| [Sonic 3 A.I.R.](https://github.com/Eukaryot/sonic3air) | 68000 code converted into "lemonscript" that keeps registers and raw memory (`D0.u16 = u16[A0 + 0x30]`), with address hooks per function. It's close to this prototype's portable-C output. |
| [SuperMarioBros-C](https://github.com/MitchellSternke/SuperMarioBros-C) | Generates C++ from `smbdis.asm`, one line per 6502 instruction |
| [masm2c](https://github.com/xor2003/masm2c) | Translates 16-bit MASM to C, checked instruction by instruction against DOSBox |
| [N64Recomp](https://github.com/N64Recomp/N64Recomp), [XenonRecomp](https://github.com/hedge-dev/XenonRecomp) | Static recompilation to C/C++ |
| [saturn-recomp](https://github.com/callumjenkins/saturn-recomp), [satrecomp](https://github.com/tmcleroy/satrecomp), [SaturnRecomp](https://github.com/sonsegajp/SaturnRecomp) | Early-stage Saturn static-recompilation toolkits. saturn-recomp verifies against Beetle Saturn; satrecomp verifies against Ymir. SaturnRecomp's launcher targets NiGHTS, but it's still an interpreter. |
| [dc-decomp-kickoff](https://github.com/consolesplayingconsoles/dc-decomp-kickoff) | Dreamcast (SH-4): one `.s` per function rebuilt byte-identically. A function is "done" when its C behaves like the original in a simulator, and byte-identical C is a bonus tier. This is the closest existing match to option (d) below. |

### C with explicit registers, and structured assemblers

- GCC's [explicit register variables](https://gcc.gnu.org/onlinedocs/gcc/Explicit-Register-Variables.html)
  only guarantee placement at `asm` operands. GCC's SH backend has
  [GBR built-ins](https://gcc.gnu.org/onlinedocs/gcc/SH-Built-in-Functions.html). Neither
  controls the instruction stream.
- [Renesas SHC](https://www.renesas.com/en/document/apn/sh-compiler-application-note-2-compiler-use-guide-pragma-extension-guide)
  has `#pragma gbr_base` and `global_register`. The documentation is for later SHC releases;
  it wasn't confirmed which of these exist in SHC 5.0.
- [Wiz](https://github.com/wiz-lang/wiz), [TERSE](https://www.terse.com/), [NESHLA](https://neshla.sourceforge.net/),
  [Millfork](https://github.com/KarolS/millfork) and [HLA](https://en.wikipedia.org/wiki/High_Level_Assembly)
  are high-level assemblers. Their statements map predictably to instructions, and the
  programmer picks the registers. This is the design family the prototype belongs to. None of
  them targets SH-2.

### Emulator cores for differential testing

- [Ymir](https://github.com/StrikerX3/Ymir) has a separate core library (`ymir-core`).
- [Beetle Saturn](https://github.com/libretro/beetle-saturn-libretro) has the Mednafen
  `sh7095` core.
- The [MAME SH-2 core](https://github.com/mamedev/mame/tree/master/src/devices/cpu/sh).
- [Unicorn](https://github.com/unicorn-engine/unicorn) does **not** support SuperH.

**Conclusion:** byte-matching hand-written assembly from C has no precedent. Inside matching
projects, hand-written assembly either stays assembly or gets an equivalent C twin that
doesn't match.

---

## 2. What the game code looks like

### Method

The scripts reuse `tools/split.py`'s analysis, so they see the same 1,395 game functions and
398 library functions as `build/usa/asm`.

- `analyze_game.py` builds a CFG for each function and runs interprocedural liveness:
  - A function's inputs are the registers it (or a callee) reads before writing.
  - Its outputs are the registers its direct callers read after the call that it may have
    changed.
  - Registers that are pushed and popped count as saved.
  - Tail calls (`bra`/`jmp` into another function) are followed.
  - An unresolved indirect call counts as using and clobbering nothing.
- `pools.py` and `poolsim.py` test the literal-pool hypotheses.
- `extra_stats.py` and `coverage.py` count idioms and instruction forms.

The results are approximate where the liveness model is: GBR counts as an input when it is
read, and outputs are only visible for functions called directly.

The "inputs in r0–r3" figure here (72%) is higher than the 44% in
[disc-layout.md](../disc-layout.md#how-the-program-was-built). This analysis is
interprocedural: a function also needs whatever its callees read on entry.

### Calling conventions

| Input register | Game | SBL (SHC C) |
|---|---|---|
| r0 | 7% | 6% |
| **r1** | **58%** | 1% |
| r2 | 15% | 2% |
| r3 | 8% | 2% |
| r4 / r5 / r6 / r7 | 12% / 11% / 7% / 5% | 87% / 47% / 24% / 11% |
| r8–r11 | 3–5% each | 0–3% |
| r12 / r13 / r14 | 10% / 6% / 7% | 1% / 0% / 73% (frame pointer) |
| GBR | 54% (directly or through callees) | 0% |

| Input class (game) | Functions |
|---|---|
| r0–r3 only | 692 (50%) |
| no register inputs | 217 (16%) |
| r0–r3 + r8–r14 | 146 (10%) |
| r0–r3 + r4–r7 | 98 (7%) |
| r8–r14 only | 76 (5%) |
| r0–r3 + r4–r7 + r8–r14 | 64 (5%) |
| r4–r7 only (looks like the C ABI) | 59 (4%) |
| r4–r7 + r8–r14 | 43 (3%) |

The most common exact input sets:

| Inputs | Functions |
|---|---|
| `r1` | 522 |
| none | 217 |
| `r1,r2` | 58 |
| `r2` | 38 |
| `r1,r12,r13` | 36 |
| `r14` | 33 |
| `r1,r12` | 27 |
| `r0` | 24 |
| `r4,r5,r6` | 16 |

**Outputs are rare.**
- Of the 565 functions with direct callers, 389 have no output any caller reads.
- `r0` is an output for 12% of them.
- The rest return in whatever register suits: r14, r1, r5, r2, r3, or pairs such as
  `r5,r6`.
- The sine/cosine helper called from `func_0600CC8E` returns `r10`/`r11`.

**The object system explains `r1`.** Unit `game/0600D1A0` is the object-list core:
- An object is a 16-byte node `{next, prev, ?, handler}` followed by its body.
- `func_0600D1F8` walks a list and calls each node's handler with `r1` = body.
- A handler picks the next frame's handler with `mov.l #f,r0; mov.l r0,@-r1; add #4,r1`,
  which writes body−4. That sequence appears 207 times.
- 772 game functions are never called or jumped to directly, only through pointers. Most are
  handlers like this.

### GBR

- GBR is set to `D_060FFC00` in `_start`.
- 11 other `ldc rN,gbr` load the same value again, most of them after `stc.l gbr,@-r15`,
  which looks like interrupt-time entry points that must not trust GBR.
- Only one function points GBR anywhere else: `func_0600F212` sets it to `0xC0000000` (the
  SH7604's cache-as-RAM area), copies a block there, and restores it with
  `ldc.l @r15+,gbr`. This was checked by reading the literal behind each `ldc`.
- 550 functions (39%) access GBR directly, at 205 distinct offsets from 0 to 912:

  | Access width | Count |
  |---|---|
  | `mov.b` | 952 |
  | `mov.w` | 532 |
  | `mov.l` | 779 |
  | `@(r0,gbr)` (read-modify-write) | 1 |

- The busiest offsets are 20 (217×), 110 (160×), 64, 12, 0, 544 and 107.
- 23 offsets are accessed at more than one width.
- 580 pool loads take absolute addresses inside the same 1 KB window. For example, the object
  free list `D_060FFFE0` is GBR+0x3E0, yet it is accessed absolutely.

**The GBR window is a struct of globals, with a few variables reached both ways.**

### Frames, calls and delay slots

| | Game | |
|---|---|---|
| Leaf functions (no calls) | 558 | 40% |
| Functions that save `pr` | 858 | as the first instruction: 548; later: 310 |
| Functions that save no GPR | 1,020 | 73% |
| Functions that allocate stack (`add #-N,r15`) | 25 | |
| Functions with a frame pointer (`mov r15,r14`) | 0 | |
| Functions with `@(d,r15)` locals | 14 | |

| Call instruction | Count |
|---|---|
| `jsr @r0` | 2,047 |
| `jsr @r14` | 251 |
| `jsr @r2` | 211 |
| `jsr @r10` | 205 |
| `jsr` through other registers | 222 |
| `bsr` | 746 |
| `bsrf` | 88 |
| tail `jmp` | 304 |
| tail `bra` | 171 |

`bsr` calls always go to the same unit (692 calls to function entries). But 69 `jsr` calls
also have same-unit targets within `bsr` range, so the choice between `jsr` and `bsr` is the
author's and has to be spelled out in the source.

| Delay slots | `nop` / total |
|---|---|
| `rts` | 1,231 / 1,647 (75%) |
| `jsr` | 1,804 / 2,936 (61%) |
| `bra` | 719 / 1,461 (49%) |
| `bsr` | 551 / 746 (74%) |
| `bf/s`, `bt/s` | 5 / 455 (1%) |
| **all game** | **4,517 / 7,639 (59%)** |
| all SBL (SHC) | 484 / 2,301 (21%) |

The filled slots hold `mov` (862), `mov.l` (652), `add` (580), `mov.w` (412), `mov.b` (243),
`lds.l @r15+,pr` (108) and `shll16` (41). The author filled slots selectively, so no fixed
rule can predict them; the source has to say which statement goes in the slot.

### Literal pools: the game was assembled with asmsh's automatic literal pools

The Hitachi SuperH assembler manual
([section 9](https://antime.kapsi.fi/sega/files/e702090_superh.pdf)) describes its pool
rules:
- `MOV.W #imm,Rn` and `MOV.L #imm,Rn` are extended instructions.
- Each literal goes to the nearest pool point after it. A pool point is after an
  unconditional branch and its delay slot, unless the slot has a label or `.NOPOOL` follows.
- Inside a pool, words come first, then an `H'0000` alignment halfword, then longwords.
- Equal literals of the same size share one slot.
- Extended instructions may not sit in delay slots.

The game matches these rules:

| Test | Result |
|---|---|
| Pool blocks that start right after an unconditional branch's delay slot | 2,029 / 2,030 |
| Mixed blocks with words before longs | 596 / 602 |
| Multi-entry blocks in first-reference order | 1,563 / 1,580 |
| Duplicate values inside one block | 3 |
| Alignment padding that is `0x0000` (not `nop`) | all |
| PC-relative loads in delay slots | **0 / 6,892** |
| Literal references placed exactly by a replay of the rules (`poolsim.py`) | **8,743 / 9,071 (96.4%)** |
| Pool blocks reproduced exactly | 1,958 / 2,030 (96.5%) |
| Pool points skipped although literals were pending (`.NOPOOL` or a labelled slot) | 90 |

The values also show which size the author asked for:
- 306 `mov.l` literals would fit in 16 bits.
- 360 `mov.w` literals would fit in `mov #imm8`.

So the author wrote sizes explicitly (asmsh's "size specification mode"), and the source has
to carry the size too.

The remaining 3.6% of references are mostly hand-placed data and different orderings, which
look like explicit `.DATA` tables or labels. They would need explicit pool labels.

**Consequence:** the matching source never has to spell out pool labels. A post-pass that
copies asmsh's rules reproduces them. This applies just as much to the current asm-as-source
convention.

### Idioms (likely original assembler macros)

| Sequence | Count |
|---|---|
| `mov.l #f,r0; jsr @r0` (call through r0) | 1,626 |
| `lds.l @r15+,pr; rts; nop` | 613 |
| `dmuls.l a,b; sts mach,r0; sts macl,x; xtrct r0,x` (16.16 multiply) | 293 (639 `dmuls.l` in total) |
| `mov.b @(d,gbr),r0; tst r0,r0; bt/bf` (GBR flag test) | 284 |
| `mov.l #f,r0; mov.l r0,@-r1; add #4,r1` (set next handler) | 207 |
| `stc sr,r0; and rX,r0; or #imm,r0; ldc r0,sr` (interrupt mask) | 30 |
| `mov.x @rS+,r0; mov.x r0,@rD; dt rC; bf/s; add #k,rD` (copy loop) | 37 |
| `mov.l r6..r0,@-r15; sts.l pr,@-r15` (save block) | 109 occurrences in 69 functions |

12 groups of byte-identical functions cover 32 functions in total.

The multiply sequences are often interleaved with unrelated instructions, for example
`dmuls.l r9,r12; sub r0,r11; sts mach,r13`. The scheduling was done by hand, so a multiply
"intrinsic" can't always be a single statement.

### How regular is register allocation?

- **Convention-driven:**
  - `r1` is the object, `r0` the scratch and call register (GBR and `@(disp)` byte/word forms
    force it).
  - `r15` is the stack, and `r12`/`r13`/`r14` carry context.
  - `mov.l` pool loads go into `r0` (3,484), `r2` (1,595), `r3` (617) and `r4` (535).
  - Base registers for `@(disp,rN)` are `r1` (4,311), `r3` (1,458), `r2` (1,092) and `r12`
    (1,038).
- **Ad hoc per function:**
  - Loop counters are spread out: `dt` uses r7 (158), r2 (82), r14 (64), r0 (62) and r4 (54).
  - Helpers pick whichever free registers suit their callers. For example,
    `func_060359EC` copies from r7 to r2 with a count in r6.
  - 140 functions share code with a neighbour or fall through into it.
  - Only 1 `braf` jump table was detected. Dispatch goes through function pointers instead.

**This is a human allocating registers with conventions, and no algorithm reproduces those
choices.** That rules out any approach where a compiler chooses the registers.

### Representative functions

Each excerpt is the generated GNU as source.

**`func_06039170`** (12 bytes, input `r1`): sets the next handler.
```
mov.l .L06039178,r0   ; func_0603917C
mov.l r0,@-r1
rts
add   #4,r1
```

**`func_0600CA4E`** (20 bytes, GBR only): a countdown that returns 1 in the delay slot.
```
mov.w @(124,gbr),r0 ; cmp/pl r0 ; bf .L1
add #-1,r0 ; mov.w r0,@(124,gbr)
mov.l @(120,gbr),r0 ; add #-48,r0 ; mov.l r0,@(120,gbr)
.L1: rts ; mov #1,r0
```

**`func_060359EC`** (14 bytes, inputs `r2,r6,r7`): the loop label is the entry point.
```
mov.l @r7+,r0 ; mov.l r0,@r2 ; dt r6 ; bf/s func_060359EC ; add #4,r2 ; rts ; nop
```

**`func_060508C4`** (inputs `r0,r2,r3`): an indexed tail jump that saves a scratch register.
```
mov.l r3,@-r15 ; mov.l .L,r3 ; mov.l @(r0,r3),r3 ; add #-4,r0 ; jmp @r3 ; mov.l @(r0,r2),r0
```

**`func_060227D8`** (inputs `r1,r12,r13` through callees): a near call, a far call, then a
tail `bra` after restoring `pr`.
```
sts.l pr,@-r15 ; bsr func_06022F48 ; nop ; mov.l .L,r0 ; jsr @r0 ; nop
lds.l @r15+,pr ; bra func_06022EE8 ; nop
```

**`func_0600CC8E`** (excerpt): `pr` is saved mid-function around a single call to a
sin/cos helper that returns `r10`/`r11`. The fixed-point rotation that follows is scheduled
by hand.
```
mov.w @(194,gbr),r0 ; sts.l pr,@-r15 ; mov.l .L,r10 ; jsr @r10 ; nop ; lds.l @r15+,pr
shll2 r10 ; shll2 r11
dmuls.l r11,r5 ; sts mach,r0 ; sts macl,r3 ; xtrct r0,r3
dmuls.l r10,r7 ; sts mach,r0 ; sts macl,r2 ; xtrct r0,r2 ; sub r2,r3 ...
```

**`func_0600D1F8`** (56 bytes) and **`func_0603917C`** (124 bytes) are shown next to their C
in [section 4](#4-prototype).

**`_start`** (396 bytes):
- masks interrupts through `sr`
- sets `r15` and `ldc r0,gbr`
- clears memory with `dt`/`bf/s` loops
- initialises dozens of GBR variables (`mov #0,r0; mov.b r0,@(47,gbr)` …)

The largest functions run to 2 KB (811 instructions; for example `func_0602E51E` and
`func_06028CC8`).

---

## 3. Design options

| | (a) Register-pinned C dialect, 1:1 code generator | (b) Lift to C-like IR and regenerate by pattern | (c) Existing compiler (GCC/LLVM SH, tcc, chibicc) plus constraints | (d) Keep asm as the matching source; write separate C for the port |
|---|---|---|---|---|
| How much could match | All of it in principle: each statement is one instruction, so anything is expressible. **Prototype: 12/12 functions matched.** 69% of functions use only forms the prototype supports today; the rest need intrinsics (section 4). | Same as (a) if the patterns are complete, but every unmatched pattern needs a fallback | Close to 0% beyond trivial leaves. GCC does its own allocation, scheduling, delay-slot filling, pools and prologues, and can't express a different calling convention per function. | 100% already (the generated asm) |
| Effort | Compiler: 2–4 weeks to cover the ISA, jump tables, shared tails and intrinsics *(estimate)*. Lifter: 2–3 weeks *(estimate)*. Then naming/typing per function, the same work as for asm. | Pattern library grows with the idioms; complex | Large, for little return: you end up rewriting the backend, which is (a) | None for matching. The port C is a full rewrite with a test harness. |
| Readability | "C-shaped assembly": structured `if`/`while`/`do`, struct fields, named GBR globals, no pool labels or `nop`s. Still one statement per instruction, with registers visible. | Similar to (a), but the source is generated, not written | Would be real C if it worked | asm stays asm. The port C can be idiomatic. |
| Usable for the 3DS port | **Yes, mechanically**: the second backend emits register-machine C, differentially tested (section 4). It's portable and correct but not idiomatic. | Yes, same as (a) | Yes | Yes, and the most idiomatic, but nothing ties it to the matching source. Drift is caught only by testing. |
| Main risk | Language creep; large functions stay long | Brittleness | Doesn't converge | Two sources of truth |

**(b) is best used as a tool for (a).** The dialect is 1:1 with the asm, so lifting asm into
the dialect is mechanical:
- recover `if`/`while`/`do` from branch shapes
- turn `@(d,rN)` into fields once types are known
- turn GBR offsets into names

The round trip is checked by the same byte comparison. So (b) becomes the dialect's
bootstrap (an "m2c for this dialect") rather than a separate approach.

**(c) is rejected.** GCC's register variables don't fix the instruction stream, its SH
backend follows the Hitachi ABI, and its literal pools follow GCC's own rules. This is the
same conclusion the agbcc projects reached for code that *was* compiled, and the game's code
wasn't.

**(d) is the honest baseline.** It's what OpenRCT2, zelda3 and dc-decomp-kickoff do. Its
weakness is that the readable C lives apart from the matching source.

---

## 4. Prototype

All of it lives in `build/research/c2asm/`, which is ignored by git:

| File | What it is |
|---|---|
| `c2asm.py` | Lexer, parser, code generator, asmsh pool pass, portable-C backend (~1,100 lines) |
| `verify.py` | Compiles, assembles with `sh-elf-as --isa=sh2 -big -I include`, links at the original address and compares bytes against `extracted/usa/files/0NIGHTS` |
| `sh2interp.py`, `difftest.py`, `regc_rt.h` | SH-2 interpreter, differential test, runtime header for the emitted C |
| `src/*.c` | Dialect sources for the 12 functions |
| `run_all.sh` | Runs everything |

### The dialect

| Source | Emits |
|---|---|
| `r0`..`r15`, or `register Node *node asm("r1");` | Registers. An alias only adds a type for `->` and `*`. |
| `__gbr(124) s16 g_124;` | A GBR-relative global: `mov.w @(124,gbr),r0` (r0 only, as on the CPU) |
| `extern Node *D_060FFFE0;` / `&sym` / `func_X` | A symbol. `rN = &sym` emits `mov.l #sym,rN` (an asmsh extended instruction). `rN = sym` emits `mov.l #sym,rN; mov.l @rN,rN`. |
| `rN = imm` | `mov #imm` for −128..127, else `mov.w #` for 16-bit values, else `mov.l #`. `__w()`/`__l()` force a size. |
| `p->f` | `mov.x @(d,rP)`. An out-of-range offset becomes `mov #d,r0` + `@(r0,rP)`. Byte and word fields go through r0, as the CPU requires. |
| `*p`, `*(u32 *)r7++`, `*(u32 *)--r1` | `@rN`, `@rN+`, `@-rN`. `p->f` with `f` at 0 still emits `@(0,rN)`: it is a different encoding from `@rN`, and the original uses both. |
| `+= -= &= \|= ^= <<= >>=`, `= -x`, `= ~x`, `= (s16)x` | `add`/`sub`/`and`/`or`/`xor`, shifts, `neg`, `not`, `exts`/`extu` |
| `if (a > b)`, `<`, `==`, `(r0 & 4) != 0`, `r1 <= 0`, `--r6 != 0`, `T` | One compare (`cmp/gt b,a`, `cmp/gt a,b`, `cmp/eq`, `tst #4,r0`, `cmp/pl`, `dt`) and `bt`/`bf` by sense. Operand order follows the source, so the bytes are deterministic. |
| `if`/`else`, `while`, `do … while`, labels and `goto` | Fixed layouts. `if (c) goto L` branches straight to L. |
| `stmt slot(x);` | Puts `x` in the delay slot of that `return`, `goto`, call, `if` or `do-while` (`bt/s`/`bf/s`). Without `slot`, the slot is `nop`. |
| `f();`, `__bsr f();`, `(*r9)();`, `return f();` | `mov.l #f,r0; jsr @r0`, `bsr f`, `jsr @r9`, and the tail forms `jmp`/`bra` |
| `push(r1)`, `pop(pr)` | `mov.l r1,@-r15`, `lds.l @r15+,pr` (`sts.l`/`stc.l` for pr, gbr, mach and macl). They can go anywhere, including delay slots. |
| `__nopool;` | asmsh `.NOPOOL` |

Anything that doesn't fit in one instruction is an error: "no single instruction for this
assignment", or "this load can only target r0". The compiler never picks registers or
reorders code. The pool pass places literals with asmsh's rules (section 2) and writes them
as explicit labels for GNU as.

### Results (measured)

| Source | Functions | Bytes | Unit | Result |
|---|---|---|---|---|
| `objlist.c` | `func_0600D1A0`, `…D1F8`, `…D230`, `…D24A`, `…D290`, `…D2A8` (the entire `.text` of the unit) | 320 | `game/0600D1A0` | **byte-identical** |
| `gbr_countdown.c` | `func_0600CA4E` | 20 | `game/0600C9C8` | **byte-identical** |
| `copy_longs.c` | `func_060359EC` | 14 | `game/0603564C` | **byte-identical** |
| `set_handler.c` | `func_06039170` | 12 | `game/060389B4` | **byte-identical** |
| `obj_flag.c` | `func_060389D4` | 8 | `game/060389B4` | **byte-identical** |
| `tvmd.c` | `func_0602B94A` | 22 | `game/0602B500` | **byte-identical** |
| `follow_parent.c` | `func_0603917C` | 124 | `game/060389B4` | **byte-identical** |

Further checks on `game/0600D1A0`:
- **objdiff:** the compiled text plus the unit's data section, as a base object against
  `build/usa/asm/game/0600D1A0.o`, scores 100% on all six functions and on both sections.
  That includes relocations, since `objdiff-cli diff` compares symbol relocations as well as
  bytes.
- **Full link:** the program linked from `build/usa/0NIGHTS.ld` with this object in place of
  the generated one has SHA-1 `08faf86952b8f68ddd7b212ab297ab815c6b8067`, the value in
  `config/usa/0NIGHTS.toml`.
- **Differential test:**
  - 3,000 random states, about 250 per function, were run through the emitted C (host `cc`)
    and through the original bytes in `sh2interp.py`. All 3,000 were identical.
  - The states are well-formed object lists, random GBR contents, random registers, and
    stubbed callees that log their inputs.
  - The comparison covers all registers, the 1 MB memory window (except the stack page,
    where only the SH-2 pushes `pr`) and the stub call log.
  - Three source mutations were all caught: a changed constant, an `if … slot(...)` turned
    into a normal `if`, and a changed `tst` mask.

**All 12 functions matched on their first successful compile.** The fixes made along the way
were to the tool (the linker script, alignment for functions that start at a 2-mod-4
address, and the GNU as limit on `bsr` to an undefined symbol), never to the sources.

### Side by side: `func_0600D1F8` (runs every object's handler)

```c
void func_0600D1F8(void)               /* r2 = list */
{
    register Node *node asm("r1");

    push(pr);                          // sts.l pr,@-r15
    r1 = *(u32 *)r2;                   // mov.l @r2,r1
loop:
    if (r1 <= 0)                       // cmp/pl r1
        goto done;                     // bf    done
    r0 = node->handler;                // mov.l @(12,r1),r0
    r1 += 16;                          // add   #16,r1
    push(r1);                          // mov.l r1,@-r15
    (*r0)();                           // jsr @r0 ; nop
    pop(r0);                           // mov.l @r15+,r0
    if (r1 != r0)                      // cmp/eq r0,r1
        goto replaced;                 // bf    replaced
next:
    r1 += -16;
    r0 = D_060FFFE0;                   // mov.l #D_060FFFE0,r0 ; mov.l @r0,r0
    if (r1 == r0)                      // cmp/eq r0,r1 ; bf
        r1 = node->prev;               // mov.l @(4,r1),r1
    goto loop slot(r1 = node->next);   // bra loop ; mov.l @(0,r1),r1   + pool here
done:
    pop(pr);
    return;
replaced:
    r1 = r0;
    goto next;
}
```

`func_0603917C` (124 bytes) exercises the less common forms, all matched:
- out-of-range fields through `r0`
- `tst #4,r0`
- a tail call through `r9` with `pop(pr)` in its slot
- `__bsr f() slot(r2 <<= 16)`
- `(*r2)() slot(g_100 = r0)`
- a final `return func_0600CA4E() slot(pop(pr))`
- two pools, one with a word literal ahead of the longs

The portable C for it begins:
```c
R(4) = LD32(R(1) + R(0));      /* after R(0) = 64: the r0 side effect is kept */
R(0) = (u32)(s8)LD8(R(4) + 4);
if (((s32)R(0) != 7)) { goto gone; }
```

### What the prototype does not cover (speculative until built)

- **Instruction forms with no statement yet:** in all, 3,758 of about 84,000 reached game
  instructions (4.5%), but they touch 31% of functions:

  | Forms | Instructions | Functions |
  |---|---|---|
  | multiply/MAC (`dmuls`, `muls`, `mac`, `sts macl`/`mach`) | 2,680 | 285 |
  | `movt`/`swap`/`xtrct` | 615 | 203 |
  | `sr`/`gbr`/`pr` register moves | 101 | 40 |
  | carry/rotate | 119 | 35 |
  | `mova` | 41 | 31 |
  | `braf`/`bsrf` | 90 | 17 |
  | division | 70 | 2 |

  Each would map to an intrinsic statement, for example `mac = (s64)r11 * r7;`,
  `r3 = macl;`, `r3 = xtrct(r0, r3);`, `T = r0 == 0; r2 = T;`. A sugar such as
  `r3 = fxmul(r11, r7) via r0` would cover the 293 cases where the multiply sequence isn't
  interleaved.
- **Cross-function control flow:**
  - 140 functions share tails or fall through, which needs "fall into the next function" and
    labels shared across functions.
  - Code still sitting in `.data` sections, such as the bytes after `func_0600D2A8`, has to
    be found first (a split problem).
- **The remaining 3.6% of literals** that asmsh's rules don't place need explicit `.DATA`
  pools or `__nopool` hints, and a lifter would have to infer them.
- **The lifter (asm → dialect)** wasn't built. All 12 sources were written by hand from the
  generated asm.
- **The portable C** is register-machine C: registers are globals and memory is behind
  accessors. Turning it into idiomatic C for the port is separate, manual work.
- **Performance** of that C on the 3DS wasn't measured. Static recompilers suggest it's
  adequate (an ARM11 at 268 MHz against two 28.6 MHz SH-2s).
- **The interpreter** covers only the integer subset these functions use. A full test harness
  should embed a real core, such as Ymir or Mednafen's `sh7095`.

---

## 5. Recommendation

1. **Keep assembly as the matching source for now.** It already matches, and
   `make check` stays the gate.
2. **Adopt asmsh-style literals now.** It's cheap and independent of everything else.
   - Teach `split.py` to emit `mov.l #sym,rN` / `mov.w #imm,rN`, with no pool labels.
   - Add a pool pass (`poolsim.py`'s rules, already 96.4% exact) in front of `sh-elf-as`, and
     keep explicit labels for the remaining 3.6%.
   - This removes about 9,000 pool labels from the source and matches how the code was
     written.
3. **Build the dialect properly** (`tools/c2asm/`), using this prototype's design:
   - every SH-2 instruction as a statement, with intrinsics for MAC, `movt`, `xtrct`, `swap`,
     `sr` and `mova`
   - jump tables, shared tails, `.NOPOOL`
   - a lifter that turns `build/usa/asm/<unit>.s` into `<unit>.c` with structured control
     flow, and is tested by round-tripping all 193 units byte for byte. This is the key
     milestone: once every unit round-trips, the dialect can express the whole game.
   - type and struct files under `include/` shared by both backends (GBR globals, the object
     node, object bodies)
4. **Add the differential harness for the port**, using an embedded Saturn core (Ymir or
   Mednafen):
   - Run each function's emitted C against the original bytes from many states, as here.
   - Later, check idiomatic rewrites against the dialect version in the same way.
5. **Write the port's game logic** by starting from the emitted C and rewriting hot or
   important functions into idiomatic C. Keep the dialect as the matching source; the
   rewrites only need to pass the differential test, like OpenRCT2 and dc-decomp-kickoff.

### Measuring progress

| Metric | How |
|---|---|
| Matching (objdiff/bytematch) | A game unit's base object is built from `src/<unit>.c` through c2asm. objdiff then scores it per function, as in section 4. The asm-as-source convention already scores 100%, so add a progress category (for example `game_c`, "Game (C dialect)") for units whose source is the dialect, and keep `game` for named and documented units. Units can carry more than one category. |
| Lifter coverage | Number of the 193 game units that round-trip asm → dialect → identical bytes (a CI-style local check) |
| Port coverage | Number of functions whose emitted C passes the differential test, and separately the number with idiomatic rewrites that pass. Report these outside objdiff; a JSON next to `report.json` is enough. |
| Invariant | `make check` stays the gate: every committed dialect unit has to rebuild `0NIGHTS` with the same SHA-1 |

---

## Appendix: running the prototype

You need `make check` to have run once (toolchain and extracted files present) and a host
`cc`.

```sh
cd build/research/c2asm
./run_all.sh            # all 7 sources: compile, assemble, link, compare; then 3,000 differential tests
python3 verify.py src/objlist.c 0x0600D1A0          # one source at its original address
python3 c2asm.py src/objlist.c -o out/objlist.s --origin 0x0600D1A0   # just the GNU as
python3 c2asm.py src/objlist.c --emit-c -o out/objlist_port.c         # portable C
python3 difftest.py 3000

# analysis behind section 2
python3 analyze_game.py > analysis.txt   # conventions, GBR, frames, delay slots, pools, idioms
python3 pools.py                         # pool layout tests
python3 poolsim.py                       # replay of asmsh's literal pool rules
python3 extra_stats.py                   # shared code, pointer-only functions, idiom counts
python3 coverage.py                      # instruction forms the dialect does not yet cover
./showfn.sh func_0600D1F8                # print a function from build/usa/asm
```

The objdiff check for `game/0600D1A0`:
```sh
python3 c2asm.py src/objlist.c -o out/unit_0600D1A0.s --origin 0x0600D1A0
awk '/\.section \.data\.0600D2E0/{p=1} p' ../../usa/asm/game/0600D1A0.s >> out/unit_0600D1A0.s
../../../toolchain/bin/sh-elf-as --isa=sh2 -big -I ../../../include -o out/unit_0600D1A0.o out/unit_0600D1A0.s
../../../toolchain/bin/objdiff-cli diff -1 ../../usa/asm/game/0600D1A0.o -2 out/unit_0600D1A0.o -o - --format json-pretty
```
