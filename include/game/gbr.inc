/*
 * The GBR block: globals at GBR = 0x060FFC00 (gbr_block), set in _start
 * and never changed outside func_0600F212, which points GBR at cache RAM
 * while the 0600EE48 renderer runs. Offsets are for @(disp,gbr); the same
 * variable reached absolutely is a symbol named without the GBR_ prefix.
 * GBR_VDP2_* is a shadow of the VDP2 registers (GBR_VDP2_TVMD + register
 * offset), DMAed to VDP2_REGS at every VBlank-IN.
 * The comment gives the access size(s) and what the variable holds.
 */

.equ GBR_GAME_MODE,           0x000   ! b: index into main-loop table D_06004214 (19 entries); boot=14, soft reset=2, 13=stage load, 1=gameplay
.equ GBR_VSYNC_FLAGS,         0x001   ! b: only cleared; bit0 read by vsync wait func_06004BAE (SCU mask / SCU+0x98)
.equ GBR_FRAME_DIV,           0x002   ! b: reload for +3 (vblanks per tick-1); written once as word with +3 by func_060044C4
.equ GBR_VBLANK_COUNT,        0x003   ! b: VBlank-IN --; func_06004BAE waits until <0 then reloads from +2
.equ GBR_DMA_TBL_OFF0,        0x004   ! w: write offset into SCU indirect-DMA table D_060F0800 (12-byte entries, func_060045BC); VBlank fires+resets; abs alias D_060FFC04+0x20000000
.equ GBR_DMA_TBL_OFF1,        0x006   ! w: same for D_060F0C00 (used when +0x6E!=0)
.equ GBR_VBLANK_HOOK,         0x008   ! VBlank-IN calls it if non-zero (abs D_060FFC08+0x20000000); setter is dead code in .data.06004614
.equ GBR_TICK_COUNT,          0x00C   ! l: +1 per game tick (func_06004F24, 0602F266, 0604517C...); zeroed in _start
.equ GBR_TIME_LEFT,           0x010   ! l: mare timer in frames from D_0602F06C[stage] or 0x1C20; -1/tick, floor 0; frozen by +0x1C bit0 / +0x26
.equ GBR_STAGE,               0x014   ! b: stage id 0..15: even=dream, odd=its boss, 12/14 special; per-stage table index everywhere (207 acc)
.equ GBR_NEXT_STAGE,          0x015   ! b: stage to load, copied to +0x14 by stage init func_0602E51E; -1=none
.equ GBR_DREAM,               0x016   ! b: last non-boss stage (copy of +0x14 when even); -1=none
.equ GBR_UNK_17,              0x017   ! b: ++ in mare logic 0603D9E8; results test >1
.equ GBR_UNK_18,              0x018   ! b: ++ (cap 127) next to score+=100 in 06016BF0; results test >3
.equ GBR_BOSS_STAGE,          0x019   ! b: pending boss stage (dream+1), -1=none
.equ GBR_UNK_1A,              0x01A   ! b: obj->unk4/60 (0601C540); read abs by results 060464CC
.equ GBR_RANK,                0x01B   ! b: grade from per-dream table (0601C160); -1=none; results compare 11/14
.equ GBR_DEBUG_FLAGS,         0x01C   ! w: init 0x02A0 in _start; bit0 freeze timer, bit3 debug (CPU meter/HUD toggle/stage skip), bit4 demo/title, 0x4000 HUD hidden
.equ GBR_UNK_1E,              0x01E   ! b: only ever written 0; read as player/camera index next to +0x1F
.equ GBR_PLAYER,              0x01F   ! b: current player 0/1 for per-player pass in 2P
.equ GBR_BUF_SEL,             0x020   ! b: xor 2 toggle; selects 256-byte half of D_060FBBFC
.equ GBR_UNK_21,              0x021   ! b: counter in 06033D5C
.equ GBR_LOADING,             0x022   ! b: 1 while stage loads (0602E51E): VBlank runs obj_list_6 and renders from the interrupt (func_06004CE8/06004E60)
.equ GBR_HUD_OFF,             0x023   ! b: debug-key toggle, clears VDP2 text VRAM+0x5C000; gates CPU meter; set at stage init from +0x1C&0x4000 or demo<0
.equ GBR_PAUSE_SUB,           0x024   ! b: set 1 on pausing, toggled in pause path (0602F104)
.equ GBR_UNK_25,              0x025   ! b: set 1 by 0602B5CC (stage setup), tested by 060321E4
.equ GBR_TIMER_FREEZE,        0x026   ! b: timer does not count while set (only cleared)
.equ GBR_UNK_27,              0x027   ! b: cleared by 06044DEC; tested in player code 060248A2/060255C8
.equ GBR_SLAVE_JOB_FN,        0x028   ! slave SH-2 (code in .data.06005E58, GBR=0x260FFC00) stores the running job fn here, 0 when idle
.equ GBR_SLAVE_RING_WR,       0x02C   ! b: slave job ring write index (&7); master func_06006070 via D_060FFC2C+0x20000000; ring D_060FE48C 8x8 bytes
.equ GBR_SLAVE_RING_RD,       0x02D   ! b: slave job ring read index, advanced by slave main loop
.equ GBR_SLAVE_REQ,           0x02E   ! b: set 1 by func_06006094 when a special slave job is queued; cleared before obj lists run, tested after
.equ GBR_VDP1_ALT_STATE,      0x02F   ! b: VBlank sets 2 when +0x30==1
.equ GBR_VDP1_ALT_SRC,        0x030   ! b: ==1: VBlank DMAs VDP1 list from +0x330/+0x334 instead of +0x328/+0x32C (only written 0)
.equ GBR_UNK_32,              0x032   ! b: only cleared (_start, 0601E4B0)
.equ GBR_UNK_33,              0x033   ! b: cleared at load; func_0601B5DC returns early if set
.equ GBR_UNK_LIST_COUNT,      0x034   ! w: abs D_060FFC34 only: per-frame entry count in D_060C9000 (cap 0x200)
.equ GBR_SLAVE_JOB_A,         0x036   ! b: slave: <0 => run job from D_060FE3FC then clear; word read by master func_06006094 (-1 = both busy)
.equ GBR_SLAVE_JOB_B,         0x037   ! b: slave: second job slot (D_060FE444), cleared by slave
.equ GBR_SND_RING_WR,         0x038   ! b: sound command ring write index (&31), func_0600E3B0
.equ GBR_SND_RING_RD,         0x039   ! b: sound ring read index, func_0600E3DC
.equ GBR_SND_SLOT,            0x03A   ! b: SCSP mailbox slot index
.equ GBR_MODEL_FLAG,          0x03B   ! b: set from model data; draw code skips func_0600CA7A rotations when set (060289B0/294B0/29E70)
.equ GBR_TWO_PLAYER,          0x03C   ! b: split-screen 2P: per-player passes, VDP1 lists D_060DC000/D_060B0000, terrain renderer skipped; -1 set by 060481EC
.equ GBR_CD_MUSIC,            0x03D   ! b: CD-DA state 0 stop/1 play/2 special; pause path calls func_06006B20/B48
.equ GBR_VDP1_READY,          0x03E   ! b: -1 when VDP1 command list complete (func_06004F24); VBlank clears and DMAs lists to VDP1 VRAM
.equ GBR_FREEZE,              0x03F   ! b: -1 while menu func_0600EAD8/0600ECF0 open; ~30 handlers + timer skip work
.equ GBR_VDP1_CMD_MAX,        0x040   ! w: (+0x2E4)>>5 = 32-byte VDP1 command slots per list (72 'mov.l r0,@(64,gbr)' in 0601D2E4 are 0xC210 filler data, excluded)
.equ GBR_CULL_PARITY,         0x044   ! w: xor 1 per use, ORed with 0x80 into obj+30
.equ GBR_PAUSED,              0x046   ! w: xor 1 on Start (+0x4F bit7) on the draw pass unless +0x7F set
.equ GBR_VDP1_LEFT0,          0x048   ! w: free VDP1 command slots list 0 (=+0x40-10, counted down)
.equ GBR_VDP1_LEFT1,          0x04A   ! w: free slots list 1 (also abs D_060FFC4A)
.equ GBR_PAD1_HELD,           0x04C   ! w: game P1 buttons held (copied from +0x54 as long pair; overridden by demo replay)
.equ GBR_PAD1_TRIG,           0x04E   ! w: game P1 newly pressed
.equ GBR_PAD2_HELD,           0x050   ! w: game P2 held
.equ GBR_PAD2_TRIG,           0x052   ! w: game P2 newly pressed
.equ GBR_PAD1_RAW_HELD,       0x054   ! w: set in VBlank func_060049B0 from D_060FEF5E[port]; ==0x00F0 => soft reset in _start
.equ GBR_PAD1_RAW_TRIG,       0x056   ! w: from D_060FEF76 (new & ~old)
.equ GBR_PAD2_RAW_HELD,       0x058   ! w: second connected port, held
.equ GBR_PAD2_RAW_TRIG,       0x05A   ! w: second port, newly pressed
.equ GBR_VDP1_WP0,            0x05C   ! l: VDP1 command write pointer list 0 (start +0x328); VBlank DMA length = wp-base
.equ GBR_VDP1_WP1,            0x060   ! l: VDP1 command write pointer list 1 (start +0x32C)
.equ GBR_SPR_SCALE_X,         0x064   ! w: sprite scale 8.8 (0x100=1.0); also -1/0/1 scratch in 06017A98
.equ GBR_SPR_SCALE_Y,         0x066   ! w: second sprite scale
.equ GBR_UNK_6A,              0x06A   ! b: only cleared at stage start
.equ GBR_DEMO_MODE,           0x06B   ! b: 0 play, 1 attract demo (input replay + PRESS START), 2 other playback, -1 ending?; gates soft reset and SFX
.equ GBR_STAGE_FLAGS,         0x06C   ! b: bit0 by 0601B7B2, bit7 by 0601BA80 (bit7 doubles score)
.equ GBR_TICK_MOD5,           0x06D   ! b: 0..4 cycling counter
.equ GBR_DRAW_PASS,           0x06E   ! b: 0=logic-only tick, 1=tick that renders; func_06004F24 patches ~8 draw funcs to rts/nop from it; selects DMA table 0/1
.equ GBR_LAG_COUNT,           0x06F   ! b: VBlank +1 when no new list, 0 after DMA; main loop waits while non-zero; shown by CPU meter
.equ GBR_GOURAUD_PTR,         0x070   ! l: gouraud/colour table write pointer (func_0600CF6C stores it back)
.equ GBR_FBCR_MODE,           0x074   ! w: VDP1 framebuffer swap request (non-zero=manual, <0=no swap)
.equ GBR_FBCR_WAIT,           0x076   ! w: countdown reloaded from +0x74; VBlank-OUT writes VDP1_FBCR
.equ GBR_MTX,                 0x078   ! l: matrix stack pointer (include/game/gbr.nch)
.equ GBR_MTX_DEPTH,           0x07C   ! w: matrix stack depth (include/game/gbr.nch)
.equ GBR_UNK_7E,              0x07E   ! b: only cleared in func_060044C4
.equ GBR_PAUSE_LOCK,          0x07F   ! b: -1 at stage start; Start cannot pause while set
.equ GBR_WRAP_LIMIT,          0x084   ! w: scratch in func_0600D9E4 (ring wrap limit)
.equ GBR_SAVE_R7,             0x086   ! w: scratch save of r7 in model drawers 06020BF8/06020DAC
.equ GBR_FOG_NEAR,            0x088   ! w: 0x140 at stage init; (z>>16)-near, vertex skipped if negative
.equ GBR_FOG_SCALE,           0x08A   ! w: 0x555 (~1/48) times (z-near) -> fog level 0..7
.equ GBR_FADE_TARGET_COL,     0x08C   ! w: RGB555 target of palette fade func_0600D4D0; per-dream table in 0602B5CC
.equ GBR_FOG_R,               0x08E   ! w: fog colour R (bits 0-4), lerped by fog level
.equ GBR_FOG_G,               0x090   ! w: fog colour G (bits 5-9)
.equ GBR_FOG_B,               0x092   ! w: fog colour B (bits 10-14)
.equ GBR_RELEASE_ACTIVE_CAM,  0x094   ! b: set 1 by 06045D8E; next stage init moves *D_060F30A4 to obj_list_7 and clears it
.equ GBR_DEBUG_OPTS,          0x095   ! b: debug-menu bits 0-3 printed ON/OFF by 06045ED4 (bit0 clamp timer, bit1 = debug meter, bit2/3 misc)
.equ GBR_NEAREST_X,           0x096   ! w: integer x of object closest to player (0603D6F8), target for 0603D336
.equ GBR_NEAREST_Y,           0x098   ! w: same, y
.equ GBR_NEAREST_Z,           0x09A   ! w: same, z
.equ GBR_NEAREST_DIST2,       0x09C   ! l: running min squared distance, reset to 0x3FFF0001 per frame
.equ GBR_CAM_X,               0x0A0   ! l: camera pos 16.16 (0602FF50, 06030230...); 0xA0-0xC3 copied as 9 longs into cache RAM by func_0600F212
.equ GBR_CAM_Y,               0x0A4   ! l: camera y
.equ GBR_CAM_Z,               0x0A8   ! l: camera z
.equ GBR_CAM_SIN_YAW,         0x0AC   ! w: 2.14 in high half of long (written w, read l)
.equ GBR_CAM_COS_YAW,         0x0B0   ! w: same layout
.equ GBR_CAM_SIN_PITCH,       0x0B4   ! w: same layout
.equ GBR_CAM_COS_PITCH,       0x0B8   ! w: same layout
.equ GBR_CAM_FOCAL_COPY,      0x0BC   ! w: =0x100 in 0602FF50, never read
.equ GBR_CAM_FOCAL,           0x0BE   ! w: =0x100; projectors divide (focal<<32)/z with the SH-2 divider
.equ GBR_CAM_PITCH,           0x0C0   ! w: camera pitch (cam obj+22); light vector rotation, bg scroll
.equ GBR_CAM_YAW,             0x0C2   ! w: camera yaw (cam obj+24); billboards rotate by -yaw
.equ GBR_CAM_FOCUS_X,         0x0C4   ! l: focus point (player obj x), added to camera target when +0xD2 bit1
.equ GBR_CAM_FOCUS_Y,         0x0C8   ! l: focus y
.equ GBR_CAM_FOCUS_Z,         0x0CC   ! l: focus z
.equ GBR_CAM_FOCUS_YAW,       0x0D0   ! w: focus object heading (obj+24)
.equ GBR_CAM_FLAGS,           0x0D2   ! w: camera mode bits in low byte (bit0/1/2); high byte written as byte D_060FFCD2 (0/-1/127) by cache-GBR renderer
.equ GBR_VDP2_TVMD,           0x0E0   ! w: VDP2 shadow (0xE0..0x1FF = VDP2 regs 0x000..0x11F, SCU-DMA'd to VDP2_REGS every VBlank-IN); 0x8000 DISP set by 0602B93E, cleared by 0602B94A
.equ GBR_VDP2_RAMCTL,         0x0EE   ! w: shadow RAMCTL (table init 0x1000; byte access = high byte)
.equ GBR_VDP2_CYCA0,          0x0F0   ! l: shadow CYCA0L/U (VRAM cycle pattern A0) as long
.equ GBR_VDP2_CYCA1,          0x0F4   ! l: shadow CYCA1 (long)
.equ GBR_VDP2_CYCB0,          0x0F8   ! l: shadow CYCB0 (long/word)
.equ GBR_VDP2_CYCB1,          0x0FC   ! l: shadow CYCB1 (long)
.equ GBR_VDP2_BGON,           0x100   ! w: shadow BGON (screen enable)
.equ GBR_VDP2_SFSEL,          0x104   ! w: shadow SFSEL
.equ GBR_VDP2_CHCTLA,         0x108   ! w: shadow CHCTLA (also byte halves 0x108/0x109)
.equ GBR_VDP2_CHCTLB,         0x10A   ! b: shadow CHCTLB high byte
.equ GBR_VDP2_PNCN0,          0x110   ! w: shadow PNCN0 (pattern name ctl NBG0)
.equ GBR_VDP2_PNCN1,          0x112   ! w: shadow PNCN1
.equ GBR_VDP2_PNCN2,          0x114   ! w: shadow PNCN2
.equ GBR_VDP2_PNCN3,          0x116   ! w: shadow PNCN3
.equ GBR_VDP2_PLSZ_LO,        0x11B   ! b: shadow PLSZ low byte
.equ GBR_VDP2_MPOFN,          0x11C   ! w: shadow MPOFN
.equ GBR_VDP2_MPABN0,         0x120   ! b: shadow MPABN0..MPCDN3 0x120-0x12F, written bytewise by 060464CC
.equ GBR_VDP2_SCXN0,          0x150   ! l: shadow SCXIN0/SCXDN0 (NBG0 X scroll 16.16)
.equ GBR_VDP2_SCYN0,          0x154   ! l: shadow SCYN0
.equ GBR_VDP2_ZMXN0,          0x158   ! l: shadow ZMXN0
.equ GBR_VDP2_ZMYN0,          0x15C   ! l: shadow ZMYN0
.equ GBR_VDP2_SCXN1,          0x160   ! l: shadow SCXN1 (word = integer part)
.equ GBR_VDP2_SCYN1,          0x164   ! l: shadow SCYN1
.equ GBR_VDP2_ZMXN1,          0x168   ! l: shadow ZMXN1
.equ GBR_VDP2_ZMYN1,          0x16C   ! l: shadow ZMYN1
.equ GBR_VDP2_SCXN2,          0x170   ! w: shadow SCXN2
.equ GBR_VDP2_SCXN3,          0x174   ! w: shadow SCXN3
.equ GBR_VDP2_SCYN3,          0x176   ! w: shadow SCYN3
.equ GBR_VDP2_ZMCTL,          0x178   ! b: shadow ZMCTL high byte
.equ GBR_VDP2_SCRCTL_LO,      0x17B   ! b: SCRCTL low byte
.equ GBR_VDP2_BKTA,           0x18C   ! l: shadow BKTA (back screen table address)
.equ GBR_VDP2_KTCTL,          0x194   ! l: shadow KTCTL+KTAOF (long)
.equ GBR_VDP2_OVPNR,          0x198   ! l: shadow OVPNRA+OVPNRB (long)
.equ GBR_VDP2_WPSY0,          0x1A2   ! w: shadow WPSY0 (window 0 start Y) 0602C4D0
.equ GBR_VDP2_WPEY0,          0x1A6   ! w: shadow WPEY0
.equ GBR_VDP2_WPSY1,          0x1AA   ! w: shadow WPSY1
.equ GBR_VDP2_WPEY1,          0x1AE   ! w: shadow WPEY1
.equ GBR_VDP2_LWTA0,          0x1B8   ! l: shadow LWTA0 (line window table 0)
.equ GBR_VDP2_LWTA1,          0x1BC   ! l: shadow LWTA1
.equ GBR_VDP2_SPCTL,          0x1C0   ! w: shadow SPCTL
.equ GBR_VDP2_CCCTL,          0x1CC   ! w: shadow CCCTL (colour calc enable)
.equ GBR_VDP2_PRISA,          0x1D0   ! w: shadow PRISA (pointer base for PRISA..PRISD block writes)
.equ GBR_VDP2_PRINA,          0x1D8   ! w: shadow PRINA (pointer base for PRINA/PRINB/PRIR)
.equ GBR_VDP2_CCRNA,          0x1E8   ! w: shadow CCRNA
.equ GBR_VDP2_CLOFSL,         0x1F2   ! w: shadow CLOFSL (colour offset select); CLOFEN itself only from init table
.equ GBR_VDP2_COAR,           0x1F4   ! w: shadow COAR: colour offset A red (fade; 0xFF = white at stage load)
.equ GBR_VDP2_COAG,           0x1F6   ! w: shadow COAG
.equ GBR_VDP2_COAB,           0x1F8   ! w: shadow COAB
.equ GBR_VDP2_COBR,           0x1FA   ! w: shadow COBR (colour offset B)
.equ GBR_VDP2_COBG,           0x1FC   ! w: shadow COBG
.equ GBR_VDP2_COBB,           0x1FE   ! w: shadow COBB
.equ GBR_BG_SCROLL_X,         0x200   ! l: set by 0602B5CC; 0602C8D8 adds camera lateral motion
.equ GBR_BG_SCROLL_Y,         0x204   ! l: same, (cam_y-obj_y)
.equ GBR_BG_PITCH_SCROLL,     0x208   ! l: (pitch<<32)/0x23B1EA, never read
.equ GBR_BG_YAW_SCROLL,       0x20C   ! l: (yaw<<32)/0x200000, never read
.equ GBR_UNK_210,             0x210   ! l: 0x210-0x21C only zeroed by func_0602C34A
.equ GBR_GROUND_FN,           0x220   ! l: terrain height query r2=x r3=z -> r4 flag, r5 height; per-dream table .L0600F004 (func_0600EE48); default func_060450F0
.equ GBR_GROUND_FN2,          0x224   ! l: second per-dream query (table +0x40); default func_060450FC
.equ GBR_LIGHT2_DIR,          0x228   ! l: 0x228-0x233 (D_060FFE28): direction set by 06034804/06022208, read by 0604E2B8
.equ GBR_LIGHT_DIR,           0x234   ! l: 0x234-0x23F: passed to light_set_dir by 06033D5C/06033F58/060340C4; no writer found
.equ GBR_PUSH_VX,             0x240   ! l: velocity impulse accumulated by 0603EDCC, added to player obj+32 and cleared
.equ GBR_PUSH_VY,             0x244   ! l: same, obj+36
.equ GBR_HELD_ANGLE,          0x24C   ! l: replaces angle in 060265E8 when obj+30 bit3 (grab/carry?)
.equ GBR_PLAY_STATE,          0x250   ! per-player game state 2x16 bytes (P1 0x250, P2 0x260), base D_060FFE50 (85 refs), indexed obj+9*16; +0 popup slot
.equ GBR_UNK_REC,             0x270   ! per-player 16-byte records 0x270/0x280 (index obj+9*16); +0 timer (0x1E0 / 1, -- by 060168DA)
.equ GBR_SCORE,               0x290   ! l: P1 score D_060FFE90[player] += points (x2 if +0x6C bit7); moved to mare_score at mare end
.equ GBR_MARE_SCORE,          0x298   ! l: 0x298-0x2A7 (D_060FFE98) per-mare scores, summed at boss/results, saved to records
.equ GBR_MARE_TIME,           0x2A8   ! l: 0x2A8-0x2B7 (D_060FFEA8) = +0x2C8 at mare end, /60 for display
.equ GBR_GRADE,               0x2B8   ! b: 0x2B8-0x2BD (D_060FFEB8) per-mare grade 0=A (0601D136 vs D_0601D1F8); [4]=boss, [5]=whole dream
.equ GBR_CHIPS_NEEDED,        0x2C0   ! l: 20 at mare start; compared to blue_chips (+0x258); counted down on chip tally (mostly abs D_060FFEC0)
.equ GBR_CHIPS_QUOTA,         0x2C4   ! l: copy of 20 next to +0x2C0, never read
.equ GBR_PLAY_TIME,           0x2C8   ! l: frames of play time, ++ per gameplay frame (0602F266), /60 for display, stored to mare_time
.equ GBR_UNK_2CC,             0x2CC   ! l: only zeroed in stage init
.equ GBR_UNK_2D0,             0x2D0   ! l: only zeroed in stage init
.equ GBR_SLAVE_IDLE_COUNT,    0x2D8   ! l: master writes -1 per frame; slave idle loop counts FRT overflows; VBlank meter prints (0x6D60-v)>>7
.equ GBR_PLACE_LIST,          0x2DC   ! l: stage object-placement list (16-byte entries) from D_06011AA4[stage]
.equ GBR_PLACE_RADIUS,        0x2E0   ! l: per-stage activation window half-width (D_060111B0[stage])
.equ GBR_VDP1_AREA_SIZE,      0x2E4   ! l: VDP1 command area half size, 0x6000 default (_start), per stage by 0601EB14
.equ GBR_LINEWIN_SHAPE_PTR,   0x2E8   ! l: write pointer into 2D point list D_060F95F8/D_060FA5F8 (0x800/player)
.equ GBR_LINEWIN_SPAN_PTR,    0x2EC   ! l: base of VDP2 line table being built (D_060F8DF8 P1 / D_060F9178 P2)
.equ GBR_RAND_VALUE,          0x2F0   ! l: rand output/seed: func_06007B96 result; particle code uses it as LCG state
.equ GBR_RAND_SEED,           0x2F4   ! l: internal state of func_06007B96
.equ GBR_PROJ_X,              0x2F8   ! l: scratch screen X of primitive being emitted
.equ GBR_PROJ_Y,              0x2FC   ! l: scratch screen Y (+112)
.equ GBR_PROJ_Z,              0x300   ! l: scratch depth for Z-sort insert func_06036EE0
.equ GBR_FAR_CLIP_OBJ,        0x310   ! l: 0x03000000 at stage init; objects with z>= culled; abs D_060FFF10 in func_0600F212
.equ GBR_FAR_CLIP,            0x314   ! l: same value as +0x310; polygon/sprite submit clip
.equ GBR_MAX_Z,               0x318   ! l: farthest polygon Z this frame (reset by 0601F068)
.equ GBR_MAX_Z_CMD,           0x31C   ! l: VDP1 command of that polygon
.equ GBR_VDP1_DMA_LEN0,       0x320   ! l: byte count of last VDP1 list-0 DMA (VBlank-IN)
.equ GBR_VDP1_DMA_LEN1,       0x324   ! l: same, list 1
.equ GBR_VDP1_LIST0,          0x328   ! l: VDP1 cmd buffer 0 in WRAM (D_060DC000 in _start); Z-sort link uses (cmd-base)>>3
.equ GBR_VDP1_LIST1,          0x32C   ! l: buffer 1 = +0x328 + +0x2E4
.equ GBR_VDP1_ALT0,           0x330   ! l: alternate buffer 0 (D_060B0000), used when +0x30==1
.equ GBR_VDP1_ALT1,           0x334   ! l: alternate buffer 1 = +0x330 + +0x2E4
.equ GBR_ZSORT_BIAS_A,        0x338   ! l: depth bias before Z-bucket insert (func_0601F434/0601F88C)
.equ GBR_ZSORT_BIAS_B,        0x33C   ! l: same for 0601FD92/060200BC renderer
.equ GBR_VDP1_ADDRTBL_PTR,    0x340   ! l: write ptr (D_060F0400) of VDP1 VRAM-address/8 table, texture loader func_0601ED20
.equ GBR_TEX_VRAM_OFS,        0x344   ! l: VDP1 VRAM texture alloc offset (starts 0x19800)
.equ GBR_TEX_VRAM_PTR,        0x348   ! l: VDP1 VRAM upload pointer (starts VDP1_VRAM+0x10000)
.equ GBR_TEXDESC_PTR0,        0x34C   ! l: cursor into texture descriptor table D_060ED000
.equ GBR_TEXDESC_PTR1,        0x350   ! l: cursor into D_060EE800
.equ GBR_TEXDESC_MARK0,       0x354   ! l: +0x34C saved after stage set load (0601EBA8)
.equ GBR_TEXDESC_MARK1,       0x358   ! l: +0x350 saved (write only)
.equ GBR_TEX_VRAM_OFS_MARK,   0x35C   ! l: saved +0x344, debug VRAM usage print
.equ GBR_TEX_VRAM_PTR_MARK,   0x360   ! l: saved +0x348
.equ GBR_MARE_MAX_LINK,       0x364   ! w: 0x364-0x36B (D_060FFF64) best link chain per mare
.equ GBR_SPAWN_WIN,           0x370   ! w: 0x370-0x38F activation-window bounds in X/Z-sorted placement lists, interleaved P1 (0x370..) / P2 (0x374..) (func_060113FA)
.equ GBR_SPAWN_WIN_P2,        0x374   ! w: P2 column of the same array (base D_060FFF74)
.equ GBR_PLACE_COUNT,         0x390   ! l: number of placement entries (060111D0/0601125A)
.equ GBR_MOVIE_ID,            0x396   ! b: movie number for PRGMOVIE overlay (mode 16 loads, 17 running)
.equ GBR_MOVIE_STATE,         0x397   ! b: written only by overlay; _start soft-reset allowed in mode 17 when >=4
.equ GBR_NEXT_GAME_MODE,      0x398   ! b: requested game mode (-1 none); copied to +0 at end of gameplay frame by 0602F104

! Per-player play state, 2 x PLAY_SIZE at GBR_PLAY_STATE (play_state)
.equ PLAY_POPUP_SLOT,         0       ! popup slot
.equ PLAY_POPUP_Y,            1       ! popup y
.equ PLAY_LINK_TIMER,         2       ! 64 on each link, link count resets at 0
.equ PLAY_MARE,               3       ! current mare 0..3 (D_060FFE53); indexes mare score/time/grade arrays
.equ PLAY_MARE_REACHED,       4       ! furthest mare (cap 3)
.equ PLAY_EVENT_FLAGS,        5       ! bit0/bit4 set by timed event funcs (table 0601BDFC)
.equ PLAY_PENDING_CNT,        6       ! +1 per item (cap 255), x10 into score then cleared; HUD
.equ PLAY_DASH_POWER,         7       ! 40 at mare start, +1/+2 cap 100 (guess: dash gauge)
.equ PLAY_BLUE_CHIPS,         8       ! +1 cap 99; spent against chips_needed (+0x2C0)
.equ PLAY_IDEYA_STATE,        9       ! -1 at mare start, 1 when capture broken
.equ PLAY_CAPTURE_FLAGS,      10      ! bit0/1/2 capture state
.equ PLAY_UNK_B,              11      ! only cleared
.equ PLAY_EFFECT_TIMER,       12      ! 600 (10 s) by 06043198, counted down by 0601B3C4
.equ PLAY_LINK_COUNT,         14      ! ++ per link; best link per mare -> +0x364[mare]
.equ PLAY_SIZE,               16

! Per-player records of unclear purpose, 2 x UNK_REC_SIZE at GBR_UNK_REC
.equ UNK_REC_TIMER,           0       ! 0x1E0 or 1, counted down by 060168DA
.equ UNK_REC_UNK2,            2       ! 06018720 stores r0 before freeing obj
.equ UNK_REC_DIST,            4       ! math_sqrt result (06018720)
.equ UNK_REC_X,               6       ! integer pos (06017F80)
.equ UNK_REC_Y,               8       ! integer pos
.equ UNK_REC_Z,               10      ! integer pos
.equ UNK_REC_UNK12,           12      ! =obj+18
.equ UNK_REC_SIZE,            16
