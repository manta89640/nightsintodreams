# NiGHTS into Dreams... decompilation

[![Progress](https://bytematch.dev/manta89640/nightsintodreams.svg)](https://bytematch.dev/manta89640/nightsintodreams)

A work-in-progress matching decompilation of the Sega Saturn release of
**NiGHTS into Dreams...** (Sonic Team, 1996). The long-term goal is a native Nintendo 3DS port.

**This repository contains no game code or assets.** You need your own dump of the game.
The tools read it locally, and the generated disassembly stays in `build/`, which is never
committed.

## Target

| | |
|---|---|
| Release | Nights into Dreams... (USA, Brazil) |
| Product | MK-81020 V1.000, mastered 1996-06-19 (internal tag `PREFINAL 13,JUN.1996`) |
| Main program | `0NIGHTS`, loaded and started at `0x06004000` |
| Source | Game code is hand-written SH-2 assembly; the SBL library is C built with Hitachi SHC (see [docs/disc-layout.md](docs/disc-layout.md#how-the-program-was-built)) |
| Libraries | SBL 2.10 (`STM_SBL` / `GFS_SBL Version 2.10 1996-02-01`) |
| Track 01 SHA-1 | `06c9913005cf5c7c1b5335f6317f26546c19f800` |

## Setup

Requirements: Python 3.11+, make, a C compiler (to build binutils), curl and jq.
Ghidra 11+ is optional. Matching library C needs your own copy of Hitachi SHC 5.0 in
`compile/` (ignored by git) and wine.

```sh
make toolchain   # builds sh-elf binutils 2.47 and downloads objdiff-cli into toolchain/
cp /path/to/your/dump/* dump/
make setup       # extract the disc, decompress PRS archives, verify checksums
make check       # disassemble 0NIGHTS, reassemble, link, and compare SHA-1
```

`make check` must always print `build/usa/0NIGHTS: OK`. A change that breaks it doesn't get committed.

Other targets:

| Target | What it does |
|---|---|
| `make test` | Tool tests: SH-2 disassembler round trip (all 65536 opcodes), the SHC translation, and [c2asm](docs/c2asm.md) (every game unit lifted to the C dialect and recompiled byte for byte) |
| `make report` | objdiff progress report in `build/usa/report.json` |
| `make upload` | Upload that report to [bytematch.dev](https://bytematch.dev/manta89640/nightsintodreams). Needs `BYTEMATCH_TOKEN`. |
| `make ghidra` | Headless Ghidra project with the Saturn memory map, in `build/ghidra/` |

## How the split works

`tools/split.py` reads `config/usa/0NIGHTS.toml`, `symbols.txt` and `units.txt`, then:

1. finds code by recursive descent from every known function, from function pointers
   in literal pools and pointer tables, and from SHC prologues in unclaimed bytes
2. writes GNU as source in which every address is a symbol:
   - functions are `func_XXXXXXXX` until named in `symbols.txt`
   - data is `D_XXXXXXXX`
   - hardware registers and BIOS vectors come from `include/saturn.inc`
3. writes one file per unit in `units.txt`, with code in `.text.*` sections and data
   in `.data.*` sections, and generates the linker script, `build/usa/units.mk` and
   `objdiff.json`

Values that only look like addresses (16.16 fixed point in the Low WRAM range,
negative numbers in the on-chip register range, ASCII text) are only symbolized
when the code actually uses them as addresses.

## Units and progress

`0NIGHTS` is split into units in three progress categories: `game` (hand-written
assembly), `sbl` (the SBL library) and `shclib` (the Hitachi C runtime). A unit can
only start where no PC-relative reference crosses. `split.py --units` proposes
boundaries, and `split.py` rejects any boundary that breaks the rule.

Every unit is generated into `build/usa/asm/` as the objdiff **target**. A unit counts
as done once its matching source is committed under `src/`. That source is built as the
objdiff **base** and linked in place of the generated file, so `make check` always
verifies the committed source.

There are two kinds of source:

- **Matching source** (`src/<unit>.s`, or C for SBL objects that SHC 5.0 compiles
  exactly). It rebuilds the original byte for byte. The game was written in assembly,
  so its matching source is reviewed assembly.
- **Port source** (`port/<unit>.c`). This is readable C for the 3DS port. It doesn't
  match byte for byte, but it must behave the same as the original, which the c2asm
  SH-2 interpreter and differential test check (see [docs/c2asm.md](docs/c2asm.md)).

`asm/game/` is a committed snapshot of the generated, not yet reviewed game assembly,
so the code can be read without a dump. `make export-asm` refreshes it after symbol
changes, and `make check` says when it's out of date. It isn't built and doesn't
count as progress.

To claim a game unit (details in [docs/conversion.md](docs/conversion.md)):

1. Copy `build/usa/asm/<unit>.s` (same as `asm/<unit>.s`) to `src/<unit>.s`.
2. Give its functions and data real names with `tools/rename.py` (which updates the
   symbol files and every source). objdiff matches symbols by name.
3. Replace raw struct and GBR offsets with named constants from `include/game/*.inc`,
   and comment the parts that are hard to follow, and nothing else.
4. Run `make check`, then `make report` (the unit should show 100%). Commit and `make upload`.

### SBL

The SBL library was C, built by an older Hitachi SHC than any available today.

- Objects that SHC 5.0 reproduces exactly are linked as C (`src/sbl/<unit>.c`,
  marked `complete` in `units.txt`).
- Every other object's matching source is its labelled assembly (`src/sbl/<unit>.s`),
  with the C kept beside it as `<unit>.ref.c`. `make refc` compiles every `.ref.c` and
  reports how many functions still match as C.
- `tools/shc.py` runs SHC 5.0 under wine (`-cpu=sh2 -optimize=1 -rtnext`; a file can
  add flags with a first-line `/* shc-flags: ... */` comment). `tools/shc2gas.py`
  turns SHC's assembly into GNU as source, and `make test` checks that translation
  against Hitachi's own linker, byte for byte.
- `python3 tools/fncmp.py sbl/<unit>` lists which functions match. Add a function
  name for an instruction-by-instruction diff.
- SHC pools constants per source file, so a C file has to contain the same functions,
  in the same order, as the original object.

## Layout

```
config/usa/      split config, symbols and checksums for the USA release
docs/            research notes and the roadmap
include/         assembler macros and the Saturn memory map
tests/           tool tests
tools/           extraction, decompression, disassembly and analysis
dump/            your disc image (ignored)
extracted/       files pulled from your disc image (ignored)
asm/game/       snapshot of the unreviewed game assembly (make export-asm)
build/           generated assembly, objects, reports (ignored)
toolchain/       locally built binutils and objdiff (ignored)
```

## Legal

NiGHTS into Dreams... is © SEGA. This is an unofficial fan project, with no affiliation to
or endorsement from SEGA or Sonic Team. Don't open issues or pull requests that contain
game data, disc images, generated assembly, or code copied from Sega's SDKs.
