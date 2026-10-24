# Roadmap

## Phase 0: Foundation (done)

- [x] Extract the cue/bin, including the filesystem that spans both data tracks and the CDDA tracks
- [x] PRS decompressor, tested on all 128 archives
- [x] Checksums for every extracted and decompressed file
- [x] Headless Ghidra import of `0NIGHTS` with the Saturn memory map

## Phase 1: Map the program

- [ ] Find the file loader and the filename-table index, then record the load address of every overlay
- [ ] Identify the SBL 2.10 library functions (GFS, STM, SPR, SCL, PER, DMA, INT) so they can be
      named and skipped. If you have the SBL library objects, Ghidra FunctionID signatures
      do most of this automatically.
- [ ] Identify the compiler. SBL supported both Hitachi SHC and GNU (Cygnus GCC 2.x for SH).
      The output's prologue and epilogue patterns, constant-pool layout and delay-slot
      filling will tell us which. This decides whether a byte-matching build is realistic.
- [ ] Find the main loop, the task/object system, and the master/slave SH-2 split
      (search for `SYS_*` / slave-start calls)
- [ ] Document the data formats: models (`GRD*`, `RD*`), textures (`GTX*`, `PLTEX`),
      motion (`PLMOT`), and the sound banks

## Phase 2: Decompilation

Each function becomes C that is behaviorally identical to the original, with the
Saturn-specific calls routed through a thin platform layer (`platform/`).

- A matching build (C that recompiles to byte-identical code) is the gold standard, but
  only if Phase 1 turns up a compiler we can actually get and run. It isn't required for
  the port.
- Either way, the first build milestone is a round trip: split `0NIGHTS` into asm, data and
  overlays, rebuild it with sh-elf binutils, and get the same SHA-1. That gives every
  later C function a regression check.

## Phase 3: 3DS port

This needs a working native build of the game logic plus a 3DS backend:

| Saturn | 3DS replacement |
|---|---|
| Big-endian SH-2, big-endian data files | Swap bytes when assets load, or read through accessor macros |
| Master + slave SH-2 | Run single-threaded first, then optionally move work to the second core (New 3DS has more headroom) |
| VDP1 distorted sprites and polygons | citro3d textured quads, with VDP1 texture formats converted at load |
| VDP2 scroll layers and rotation planes (floors/sky) | Textured planes, or CPU-rendered layers uploaded as textures |
| SCSP + 68000 driver (`SDDRVS.TSK`) with `*SND`/`*SEQ` banks | Either embed a 68000 + SCSP core, or reimplement the sequencer on ndsp |
| CDDA tracks | Stream from the user's extracted audio through ndsp |
| Cinepak FMV (`M*.CPK`) | Software Cinepak decoder |
| 3D Control Pad | Circle Pad (analog) and D-pad |
| CD/GFS file access | Read from the user's extracted files on SD (never bundled) |

Toolchain: devkitARM plus libctru and citro3d (`dkp-pacman -S 3ds-dev`).

A PC build on the same platform layer (SDL2 + OpenGL) is worth keeping alongside. It's far
quicker to debug than real hardware.
