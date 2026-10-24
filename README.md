# NiGHTS into Dreams... decompilation

A work-in-progress decompilation of the Sega Saturn release of **NiGHTS into Dreams...**
(Sonic Team, 1996), with the goal of a native Nintendo 3DS port.

**This repository contains no game code or assets.** You need your own dump of the game.
Every tool here reads that dump locally, and the build never ships Sega's data.

## Target

| | |
|---|---|
| Release | Nights into Dreams... (USA, Brazil) |
| Product | MK-81020 V1.000, mastered 1996-06-19 (internal tag `PREFINAL 13,JUN.1996`) |
| Main program | `0NIGHTS`, loaded and started at `0x06004000` |
| Libraries | SBL 2.10 (`STM_SBL` / `GFS_SBL Version 2.10 1996-02-01`) |
| Track 01 SHA-1 | `06c9913005cf5c7c1b5335f6317f26546c19f800` |

## Setup

Requirements: Python 3, make, and optionally Ghidra 11+ for analysis.

1. Copy your cue/bin dump into `dump/` (it is git-ignored).
2. Run `make setup`. This will:
   - extract `IP.BIN`, the ISO9660 filesystem, and the CD audio tracks into `extracted/usa/`
   - decompress every `.PRS` archive into `extracted/usa/prs/`
   - verify everything against `config/usa/files.sha1`
3. Optionally run `make ghidra` to create a headless Ghidra project in `build/ghidra/`,
   with the Saturn memory map set up and `0NIGHTS` analyzed.

## Layout

```
config/usa/      expected checksums for the USA release
docs/            research notes and the project roadmap
tools/           extraction, decompression and analysis tooling
dump/            your disc image (ignored)
extracted/       files pulled from your disc image (ignored)
build/           Ghidra project and build output (ignored)
```

See [docs/disc-layout.md](docs/disc-layout.md) for what's on the disc, and
[docs/ROADMAP.md](docs/ROADMAP.md) for the plan.

## Legal

NiGHTS into Dreams... is © SEGA. This is an unofficial fan project, with no affiliation to
or endorsement from SEGA or Sonic Team. Don't open issues or pull requests that contain
game data, ROM or disc images, or code copied from Sega's SDKs.
