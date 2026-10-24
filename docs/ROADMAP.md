# Roadmap

## Phase 0: Foundation (done)

- [x] Extract the cue/bin, including the filesystem that spans both data tracks and the CDDA tracks
- [x] PRS decompressor, tested on all 128 archives
- [x] Checksums for every extracted and decompressed file
- [x] Headless Ghidra import of `0NIGHTS` with the Saturn memory map
- [x] SH-2 disassembler, verified against GNU as across all 65,536 opcodes
- [x] Split `0NIGHTS` into fully symbolized assembly that rebuilds byte for byte (`make check`)
- [x] objdiff report and bytematch.dev upload (`make report`, `make upload`)

## Phase 1: Map the program

- [ ] Find the file loader and the filename-table index, then record the load address of every overlay
- [ ] Identify the SBL 2.10 library functions (GFS, STM, SPR, SCL, PER, DMA, INT) so they can be
      named and skipped. If you have the SBL library objects, Ghidra FunctionID signatures
      do most of this automatically.
- [x] Work out how the program was built: the game code is hand-written assembly, and
      the SBL library is SHC C. SHC 5.0 runs under wine, and `-optimize=1 -rtnext` already
      matches 3 of the 4 library functions tried.
- [ ] Build pipeline for library C: SHC `-code=asmcode` → translate to GNU as → `sh-elf-as`
      → ELF base objects for objdiff. `elfcnv` only converts linked objects, not relocatable ones.
- [ ] Split `0NIGHTS` into units that match the original object files. The data islands
      between code runs are likely object boundaries.
- [ ] Load and split the `PRG*`/`PCOM`/`MCOM`/`RD*` overlays at their load addresses
- [ ] Find the main loop, the task/object system, and the master/slave SH-2 split
      (search for `SYS_*` / slave-start calls)
- [ ] Document the data formats: models (`GRD*`, `RD*`), textures (`GTX*`, `PLTEX`),
      motion (`PLMOT`), and the sound banks

## Phase 2: Decompilation

- **Library (SHC C):** a matching decomp with objdiff, function by function.
- **Game (hand-written asm):** the source is the labelled, documented disassembly, so it
  always matches. Progress here means naming symbols, splitting the files to match the
  original modules, and documenting behavior.
- **For the port:** game logic rewritten in C that behaves identically (not
  byte-matching), with the Saturn-specific calls routed through a thin platform layer
  (`platform/`).
- The round trip (split `0NIGHTS`, rebuild with sh-elf binutils, same SHA-1) already works
  for the main program. It's the regression check for every C function that replaces asm.

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
