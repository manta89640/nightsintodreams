# Disc layout (USA, MK-81020 V1.000)

The disc has 21 tracks:

| Track | Mode | Contents |
|---|---|---|
| 01 | MODE1/2352 | IP.BIN (system area), the ISO9660 filesystem, and files at LBA < 19560 |
| 02 | MODE2/2352 | Continuation of the same filesystem: Cinepak FMV (`M*.CPK`) and ADPCM (`M*.ADP`) |
| 03–21 | CDDA | Boss themes, jingles, replay and ending music |

The two data tracks share a single LBA space, so the extractor reads across both.

## IP.BIN

- Product `MK-81020`, version `V1.000`, date `19960619`, areas `JTU`
- Peripherals `EJ`: standard control pad plus the 3D Control Pad
- 1st Read address `0x06004000`, IP size `0x1800`

## Files that alias CD audio

Some `.SFD` directory entries point exactly at index 01 of an audio track. They aren't
data: the game uses them to locate CDDA tracks by name through GFS.

| File | Track | | File | Track |
|---|---|---|---|---|
| ACROBAT.SFD | 03 | | REALA1.SFD | 11 |
| TIMEUP.SFD | 04 | | REALA2.SFD | 12 |
| TOMARE.SFD | 05 | | JACKLE.SFD | 13 |
| PIAOVER.SFD | 06 | | GULPO.SFD | 14 |
| MAREOVER.SFD | 07 | | WIZEMAN1.SFD | 15 |
| GILLWING.SFD | 08 | | WIZEMAN2.SFD | 16 |
| PUFFY.SFD | 09 | | RDSEL.SFD | 17 |
| CLAWZ.SFD | 10 | | REPLAY1–3.SFD | 18–20 |
| | | | ENDING.SFD | 21 |

## Compression

All 128 `.PRS` files use Sega's PRS LZ77 format (the one later used in Sonic Adventure and
PSO). `tools/prs.py` decompresses all of them without errors.

## Main program: 0NIGHTS

- 447,868 bytes, loaded at `0x06004000` in High Work RAM, so it ends at `0x0607157C`
- Linked against SBL 2.10. The `STM_SBL` and `GFS_SBL` version strings are at `0x060710CC`.
- `0x06051248` holds a NUL-separated table of every filename the game loads by name. It's
  probably the index space the file loader uses.
- The split currently finds 1,793 functions: 246 KB of code (including literal pools and
  in-function tables) and 202 KB of data.
- Rough layout:
  - `0x06004000`–`0x0604C000`: game code, interleaved with its data tables
  - `0x0604C000`–`0x06066000`: mostly data, including the filename table
  - `0x06066000`–`0x06070C48`: second code block, probably SBL and runtime library code,
    since the SBL version strings follow it
- `0x06007E04` is a 16-bit sine table: 4096 = 1.0, with a step of 2π/1024.
- The program reaches the BIOS through the function vectors at `0x06000300`. For example,
  it calls `SYS_SETUINT(0x40/0x41, handler)` to install the VBlank-IN/OUT handlers.
- A hidden name-entry list contains `SONIC`, `MILES`, `KNUCKLES`, `AMY` and `FANG`.

### How the program was built

**The game code (`0x06004000`–`0x06066000`) is hand-written SH-2 assembly.** About 1,340
functions break the SHC/C calling convention in ways a compiler wouldn't:

| | Game code | Library code |
|---|---|---|
| Functions that read `r0`–`r3` as inputs | 44% | 4% |
| Functions that address globals through GBR | 23% | 0% |
| Functions that read `r8`–`r14` without saving them | 11% | 1% |

Other telltale signs in the game code:
- object pointers are passed implicitly in `r1`/`r12`
- `sts.l pr` appears in the middle of functions
- scratch registers are saved and restored
- helpers like `func_0600D0D0` take their inputs in `r2`/`r3`

**The library block (`0x06066000`–`0x06070C48`) is SHC-compiled C**, which fits SBL 2.10.
It has standard prologues (callee-saved registers pushed `r14` down to `r8`, `MACL` saved)
and calls through `r2`/`r3`.

Matching with Hitachi SHC 5.0 (Release 31), using `-cpu=sh2 -optimize=1 -rtnext`:

| Function | Result |
|---|---|
| `func_060704CC`, `func_060704DE` (struct table byte getters) | exact match |
| `func_06068612` (reads `SH2_DMAOR` into a 2-word struct) | exact match |
| `func_060685E2` (sets bit 0 of a DMA channel's CHCR) | one instruction-order swap |

What this means:
- The library can be matched as C with SHC.
- The game code's "source" is assembly. Its decomp is the labelled, commented
  disassembly; matching is automatic, and the work is naming and documenting.
- The 3DS port will need the game logic rewritten as C (non-matching, behavior-checked)
  or translated from SH-2.

`PRG1P` has no callee-saved register pushes at all, so the overlays are probably assembly too.

## Overlays (decompressed PRS)

| Group | Files | Notes |
|---|---|---|
| Per-dream code | `PRG1P`–`PRG7P`, `PRG1M`–`PRG7M`, `PRGMOVIE` | Most start with `4F22` (`sts.l pr,@-r15`), so they're SH-2 code |
| Common + per-dream data | `PCOM`/`PCOMH`, `MCOM`/`MCOMH`, `RDn{P,M}[H]` | `*H` files start with tables of `0x0608xxxx` / `0x0609xxxx` pointers, so they're position-dependent |
| Landscapes | `GRD*` (geometry?), `GTX*` (textures?) | One per world |
| Player | `PLMOT` (motion), `PLTEX` (textures) | |
| Sound | `*SND` (banks), `*SEQ` (sequences), `SDDRVS.TSK` (68000 sound driver for the SCSP) | |
| UI / misc | `TITLE`, `SEL*`, `NAME`, `HINT*{J,E}`, `KEIKOKU*`, `SEGALOGO`, `DEMO*`, `ENDING*` | `DEMO*` are probably attract-mode input recordings |

Still unknown: what the `P`/`M` suffix means, and where each overlay gets loaded. The next
step is to find the loader that indexes the filename table and record each overlay's load
address.

`extracted/usa/files/EXTRA/` contains the bonus PC wallpapers (BMP) included on the disc.
