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
