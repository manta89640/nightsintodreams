# Converting game units

The game code is hand-written SH-2 assembly, so its matching source is reviewed GNU as
assembly: `src/game/<unit>.s`. The build links it in place of the generated
`build/usa/asm/game/<unit>.s`, and `make check` proves it still matches. Converting a unit
means naming and documenting it; the instructions never change.

A port version of a unit, `port/game/<unit>.c`, is separate: readable C (structs, named
fields, normal control flow) that behaves like the original but doesn't match its bytes.
It is checked against the original code with the SH-2 interpreter in `tools/c2asm/`, not
by byte comparison. Write the matching `.s` first.

Reference units (read them first):

| Unit | Contents |
|---|---|
| `game/06004000` | `_start`: CPU, GBR and globals set-up, the main loop and soft reset |
| `game/06007B94` | `math_`: random numbers, sin/cos, atan2, square roots; `sin_table` |
| `game/0600C9C8` | `mtx_`: the matrix stack; `light_set_dir` |
| `game/0600CF6C` | `light_shade_model`, `mtx_scale`, `obj_init`, `obj_alloc` |
| `game/0600D1A0` | `obj_`: freeing, running and moving objects |
| `game/0600D3D0` | `snd_`: the sound command queue and driver calls; VDP colour helpers; the VDP2 line window; the sound test |

## Workflow

1. `cp build/usa/asm/game/<unit>.s src/game/<unit>.s` and add
   `.include "game/core.inc"` after the `saturn.inc` line.
2. `make -j8 check` must print `build/usa/0NIGHTS: OK`, and
   `python3 tools/fncmp.py game/<unit>` must match every function
   (`fncmp.py game/<unit> <function>` shows a diff). Run both after every step.
3. Name every function and data label the unit defines:
   ```sh
   python3 tools/rename.py 0x0600E3B0 snd_cmd_alloc    # or: rename.py OLD NEW
   ```
   rename.py updates the symbol files and `src/`/`include/`. It renames `func_` entries
   in place in `config/usa/symbols.txt` and appends names for unnamed addresses to its
   end; move every line for your unit from `symbols.txt` into
   `config/usa/symbols/game_<unit>.txt` (e.g. `game_0600D3D0.txt`), keeping
   `// type:func`, so parallel branches never edit the same lines. Use rename.py only for
   symbols: it replaces whole words in every source, including the SBL C.
4. Replace numbers with the constants of `include/game/*.inc`: struct fields
   (`mov.l @(OBJ_X,r1),r4`, `mov.l r0,@(NODE_HANDLER,r3)`), GBR variables
   (`mov.w @(GBR_CAM_YAW,gbr),r0`), hardware offsets, sizes (`add #-OBJ_BODY,r1`).
   Constants only for your unit go in an `.equ` block at the top of its `.s`.
5. Comment what is hard to follow, rewrite data in its real element size (below), and
   name branch labels where it helps.
6. Before committing: `python3 tools/split.py config/usa/0NIGHTS.toml && git checkout
   objdiff.json`.

The Makefile doesn't track `include/game/*.inc`: after changing one, `touch src/game/*.s`.

Only rename symbols your unit defines. Functions and data of other units keep their
generated names in your file; put proposed names in your report.

## Definition of converted

- Every function and data label defined in the unit has a meaningful name, recorded in
  `config/usa/symbols/game_<unit>.txt`. No `func_`, `D_` or `lbl_` names remain for
  things the unit defines.
- Struct field offsets and GBR offsets are named constants wherever the meaning is known.
  Plain numbers remain for array indices, offsets inside a pointer that walks a table,
  and immediates that are just numbers.
- Data tables use their element size (`.short`, `.long`, `.ascii`) and named values;
  blocks of zeros are `.fill`.
- Comments explain only what is hard to follow.
- `make -j8 check` prints OK and `fncmp.py` matches every function.

## Naming

| Kind | Style | Examples |
|---|---|---|
| Functions | `lower_snake_case` with a subsystem prefix | `obj_alloc`, `mtx_rot_x`, `snd_seq_start` |
| Object handlers | the object type, then what the handler does | `snd_level_fadeout_task`, `linewin_spawn` |
| Data | `lower_snake_case` with a prefix; tables end in `_table`, strings start with `str_` | `obj_free_head`, `sin_table`, `str_sound_test` |
| GBR offsets | `GBR_` + `UPPER_SNAKE_CASE` | `GBR_GAME_MODE`, `GBR_MTX` |
| Symbols in the GBR block (0x060FFC00-0x060FFFFF, reached absolutely) | the GBR name in lower case, without the prefix | `play_state` = GBR_PLAY_STATE |
| Struct fields | `STRUCT_FIELD` | `NODE_NEXT`, `OBJ_ROT_Y`, `MTX_TZ`, `DIVU_QUOT` |
| Hardware register offsets from a block base | `_OFS` suffix | `SCU_D0EN_OFS`, `SMPC_SF_OFS` |
| Other constants | `UPPER_SNAKE_CASE` | `SPAWN_CONSUMED`, `SNDC_SEQ_START` |
| Branch labels | `.L` + `lower_snake_case`, unique in the file | `.Lrun_next`, `.Lfree_last` |
| Literal pool labels | keep `.L<address>` | `.L0600D1C4` |

Prefixes in use:

| Prefix | Subsystem |
|---|---|
| `obj_` | object lists, allocation, generic object helpers |
| `mtx_`, `math_`, `light_` | matrix stack, fixed-point math, shading |
| `poly_`, `spr_`, `vdp1_` | 3D models, sprites, the VDP1 command lists |
| `vdp2_`, `vdp_` | VDP2 screens, its register shadow and colour RAM; colours for both |
| `linewin_` | the VDP2 line window drawn from projected shapes |
| `snd_`, `smpc_` | the sound driver (SDDRVS) and its command queue; SMPC commands |
| `cd_`, `bup_`, `dma_`, `sys_`, `mem_` | file loading, backup memory, SCU DMA, interrupts/BIOS, memory helpers |
| `txt_` | the text layer on VDP2 cells |
| `player_`, `cam_`, `path_`, `stage_`, `game_` | player characters, camera, course paths, level layout, game modes |
| `dbg_` | debug screens |

Add a prefix when a new subsystem needs one, and mention it in your report. Unused code is
named for what it does and its comment starts with `Unused:`. `unk`/`UNK` names are for
things whose purpose is genuinely unknown; keep them rare.

## Shared constants

`include/game/core.inc` includes all of these; the lead alone edits them. Put proposals
in your report (or an `.equ` block in your unit until they are merged).

| File | Contents |
|---|---|
| `obj.inc` | `NODE_*`, `LIST_*`, `OBJ_*` (the body layout common to most object types, header offsets from the body), `SPAWN_*` |
| `math.inc` | `MTX_*` (3x4 matrix), `VEC_*`, `DIVU_*` (SH-2 division unit), `LIGHT_*`, `MODEL_*`, `RAND_*` |
| `gbr.inc` | every GBR offset the game uses (`GBR_*`, with access sizes and evidence), `PLAY_*` |
| `hw.inc` | `VCMD_*` (VDP1 command table), SCU DMA and SMPC register offsets |

An object type owned by a unit names its work fields there, e.g.
`.equ FADE_LEVEL, OBJ_WORK0`.

## Writing it

- **Calling conventions are per function.** Start each non-trivial function with a comment
  giving what isn't obvious: `! r2 = list. Out: r3 = node, T = 1 on failure. Clobbers r8.`
- **Comments**: register interfaces, implicit layouts, tricks (a terminator that encodes
  its list, sin/cos pushed so that `mac.l` reads them), hardware side effects. Don't
  restate instructions or addresses.
- **Data**: the split emits bytes, and sometimes symbolizes numbers that only look like
  addresses (`.long VDP2_VRAM_CACHED + 0x105FA` inside `sin_table`). Rewrite tables with
  their element size. A hardware equate is absolute, so writing the number keeps the
  object identical; when a number became a `D_`/`lbl_` symbol, keep the symbol (it is a
  relocation) and report it.
- **Code left in data**: code the split holds as bytes (unreferenced, or reached only from
  overlays) can be decoded by adding its address to your symbol file with
  `// type:func`; the split then disassembles it. Otherwise keep the bytes and say what
  they are.
- **GBR**: every unit runs with GBR = gbr_block, except the functions under
  func_0600F212 (unit 0600EE48), which point GBR at cache RAM; don't use `GBR_*` there.

## Core facts

- **Objects** (`obj.inc`): 96-byte nodes from a pool of 384; handlers run with r1 =
  body; `mov.l #f,r0 / mov.l r0,@-r1 / add #4,r1` installs the next frame's handler.
  Lists: `obj_list_core`, `_manager`, `_stage`, `_effect`, `_pause` run each frame (once
  with `GBR_DRAW_PASS` = 0, then with 1); `_load_task` and `_load_scene` run from the
  VBlank handlers while loading; `_unused` is never used. `obj_alloc` (r2 = list) returns
  the node in r3; set `NODE_HANDLER`. `obj_free` frees the body r1.
- **Fixed point**: 16.16; angles are 16 bits per turn; `sin_table` is 2.14.
  `dmuls.l / sts mach / sts macl / xtrct` is the 16.16 multiply.
- **Players**: `player_obj` and `player_obj_p2` hold the player bodies; `OBJ_PLAYER` is
  the player index of per-player objects; `play_state` (GBR_PLAY_STATE) holds 16 bytes per
  player.
- **Game modes**: `GBR_GAME_MODE` indexes `game_mode_table`.

## Port C

`port/game/<unit>.c` reimplements a unit in plain C for the port: functions with real
parameters and return values, structs for objects and globals, normal loops. It should
keep the original's behaviour exactly (including fixed-point rounding), and is checked by
running it and the original code (`tools/c2asm/interp.py`) on the same inputs and
comparing the results. Keep it separate from the matching source; never edit the `.s` to
suit the port.

## Merging (lead)

Branches touch only their own unit sources and symbol files. When a branch renamed a
symbol that another branch's source references by its old name, the link fails after the
merge: replace the old name there and run `make check`. Then check every converted unit:

```sh
make -j8 check
for f in src/game/*.s; do u=game/$(basename $f .s); python3 tools/fncmp.py $u | tail -1; done
```
