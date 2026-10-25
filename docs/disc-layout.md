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
- `0x06051248` is `"SDDRVS.TSK"`, the sound driver that `load_sound_driver` loads into
  SCSP RAM. From `0x060512A0` on comes a pool of every other filename the game loads
  (`TITLE.PRS` … `M10.ADP`). It's a plain string pool, not an index: code and tables
  point at the strings, and GFS looks each one up with `GFS_NameToId` (see
  [Loading files](#loading-files)).
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

## Loading files

The loader is game code in `0NIGHTS` (`config/usa/symbols/game_loader.txt`), on top of SBL GFS:

- `file_queue(name, dest, status, 2)` adds an entry `{name, dest, status}` to a 16-entry
  ring (`file_queue_entries`). `file_open_next` then opens up to 4 files at once
  (`GFS_NameToId`, `GFS_Open`, `GFS_GetFileSize`, `GFS_NwCdRead`) and counts them in
  `file_busy_count`.
- `file_server`, called every frame from the main loop, reads sectors with `GFS_NwFread`
  into an 8 KB buffer at `0x06002000`. It then **decompresses the PRS stream straight to
  `dest`** with a resumable 10-state machine (`prs_state`), so the game never keeps a
  compressed copy in memory. There is no separate PRS routine.
- `file_load(name, dest)` queues one file and calls `file_server` until
  `file_busy_count` reaches 0. `file_queue_list` queues a list terminated by a negative word.
- `load_sound_driver` resets the 68000 through SMPC, clears sound RAM and `GFS_Load`s
  `SDDRVS.TSK` (68000 code, not compressed) to `0x25A00000`.

The game byte at `GBR+20` selects the dream and the stage. Even values are `P`, the
normal stage, and odd values are `M`, the boss stage (the sound table pairs `ALPSSND`
with `FROGSND`, `SNOWSND` with `FATSND`, and so on). The index is `(dream - 1) * 2 + M`.
Most per-dream tables are indexed with `GBR+20 >> 1`.

### Load addresses

Every load passes a fixed destination, so each file always has the same address:

| File | Address | Loaded by | Kind |
|---|---|---|---|
| `PRG1P`–`PRG6P` | `0x060B0000` | `load_dream_program` | **code**, normal stage of dream 1–6 |
| `PRG7P`, `PRG1M`–`PRG7M` | `0x060C0000` | `load_dream_program` | **code**, dream 7 and boss stages |
| `SEL` | `0x060C0000` | `load_sel_program` | **code**, dream select |
| `END` | `0x060C0000`, entered at `+4` | `load_end_program`, `run_end_program` | **code**, ending |
| `PRGMOVIE` | `0x060B9800`, entered at `+4` | `run_movie_program` | **code**, FMV player (`M*.CPK`/`M*.ADP`) |
| `PCOMH`, `MCOMH` | `0x06080000` | `load_dream_data` | data with absolute pointers (P / M common) |
| `RDnPH` | `0x06098000` | `load_dream_data` | data with absolute pointers |
| `RDnMH` | `0x06086000` | `load_dream_data` | data with absolute pointers |
| `PCOM` | `0x00270000` | `load_dream_data` | data |
| `MCOM` | `0x0029F000` | `load_dream_data` | data |
| `RDnP` | `0x00200010` | `load_dream_data` | data |
| `RDnM` | `0x00200000` (`RD4M`: `0x00210000`) | `load_dream_data` | data |
| `RD7M2` | `0x00200000` | `load_rd7m2` | data |
| `DEMOnn` | `0x06073000` | `load_dream_data` (attract mode) | input recordings |
| `AL1P`–`AL6P` | `0x06080000` | `load_alife` | A-Life (Nightopian) data |
| `GRD*` | `0x00200000` | `load_landscape` | landscape geometry |
| `GTX*` | `0x05C68800` (VDP1 VRAM) | `load_landscape` | landscape textures |
| `PLTEX`, `PLMOT` | `0x00280000`, `0x002A0000` | `load_title_data` | player textures and motion |
| `TITLE`, `SEGALOGO`, `KEIKOKU`/`KEIKOKUP`, `SELECT`, `OVER` | `0x00200000` | various | data |
| `HINTn{J,E}` | `0x06080000` | `load_hint` (language flag in `0x0604DBB7`) | data |
| `*SND` | `0x25A0A000` (sound RAM) | `load_sound_bank` | SCSP sound banks |
| `*SEQ` | `0x00200000` | `load_sequence` | sound sequences |

`SELECT_S` and `SELECTH` are loaded by `SEL`, and `ENDING*` and `NAME` by `END`. Their
destinations still have to be read from those overlays. Self-pointer counts put
`SELECTH` around `0x06076000`. P and M programs overlap (`PRG5P` runs to `0x060C9F7C`),
so only one stage program is resident at a time. `0NIGHTS` also uses `0x060B0000`–`0x060CFFFF` as
buffers in modes that have no program loaded there. That's why the split finds many
`D_060Bxxxx` symbols in it.

So the SH-2 code overlays are the 17 files `PRG1P`–`PRG7P`, `PRG1M`–`PRG7M`, `PRGMOVIE`,
`SEL` and `END`. Everything else is data (`OVER` and the `HINT*` files start with `0x00000009` but
contain no code). `PRG1M`, `PRG3M`, `PRG4M`, `PRG5M` and `PRG7M` start with zero words
(`PRG5M` with pointers at `+0xC`) rather than code, so their entry points still have to
be found.

`extracted/usa/files/EXTRA/` contains the bonus PC wallpapers (BMP) included on the disc.
