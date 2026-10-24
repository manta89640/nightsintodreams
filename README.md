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
| Compiler | Hitachi SHC (see [docs/disc-layout.md](docs/disc-layout.md#compiler)) |
| Libraries | SBL 2.10 (`STM_SBL` / `GFS_SBL Version 2.10 1996-02-01`) |
| Track 01 SHA-1 | `06c9913005cf5c7c1b5335f6317f26546c19f800` |

## Setup

Requirements: Python 3.11+, make, a C compiler (to build binutils), curl and jq.
Ghidra 11+ is optional.

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
| `make test` | Exhaustive SH-2 disassembler round-trip test (all 65536 opcodes) |
| `make report` | objdiff progress report in `build/usa/report.json` |
| `make upload` | Upload that report to [bytematch.dev](https://bytematch.dev/manta89640/nightsintodreams). Needs `BYTEMATCH_TOKEN`. |
| `make ghidra` | Headless Ghidra project with the Saturn memory map, in `build/ghidra/` |

## How the split works

`tools/split.py` reads `config/usa/0NIGHTS.toml` and `config/usa/symbols.txt`, then:

1. finds code by recursive descent from every known function, from function pointers
   in literal pools and pointer tables, and from SHC prologues in unclaimed bytes
2. writes GNU as source in which every address is a symbol:
   - functions are `func_XXXXXXXX` until named in `symbols.txt`
   - data is `D_XXXXXXXX`
   - hardware registers and BIOS vectors come from `include/saturn.inc`
3. puts code in `.text.*` sections and data in `.data.*` sections, laid out at the
   original addresses by a generated linker script

Values that only look like addresses (16.16 fixed point in the Low WRAM range,
negative numbers in the on-chip register range, ASCII text) are only symbolized
when the code actually uses them as addresses.

To name a function or variable, edit `config/usa/symbols.txt` and run `make check`.

## Layout

```
config/usa/      split config, symbols and checksums for the USA release
docs/            research notes and the roadmap
include/         assembler macros and the Saturn memory map
tests/           tool tests
tools/           extraction, decompression, disassembly and analysis
dump/            your disc image (ignored)
extracted/       files pulled from your disc image (ignored)
build/           generated assembly, objects, reports (ignored)
toolchain/       locally built binutils and objdiff (ignored)
```

## Legal

NiGHTS into Dreams... is © SEGA. This is an unofficial fan project, with no affiliation to
or endorsement from SEGA or Sonic Team. Don't open issues or pull requests that contain
game data, disc images, generated assembly, or code copied from Sega's SDKs.
