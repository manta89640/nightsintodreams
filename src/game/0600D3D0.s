	.include "macro.inc"
	.include "saturn.inc"
	.include "game/core.inc"

! Sound driver (SDDRVS) host commands: SND_HOST_SLOTS slots of SNDCMD_LEN
! bytes at SCSP_RAM + SND_HOST_CMDS. The game queues them in snd_cmd_ring.
.equ SND_HOST_CMDS,     0x700
.equ SND_HOST_SLOTS,    8
.equ SND_AREA_MAP,      0xA000  ! area map in SCSP RAM
.equ SND_DRV_MONO,      0x483   ! 0x80 = mono
.equ SNDCMD_CODE,       0       ! b: command, 0 = slot free
.equ SNDCMD_P1,         2       ! b: parameters P1..
.equ SNDCMD_P2,         3
.equ SNDCMD_P3,         4
.equ SNDCMD_P4,         5
.equ SNDCMD_P5,         6
.equ SNDCMD_LEN,        16
.equ SND_RING_LEN,      32      ! entries in snd_cmd_ring

! Commands
.equ SNDC_SEQ_START,    0x01
.equ SNDC_SEQ_STOP,     0x02
.equ SNDC_SEQ_PAUSE,    0x03
.equ SNDC_SEQ_CONTINUE, 0x04
.equ SNDC_SEQ_VOLUME,   0x05
.equ SNDC_SEQ_STOP_ALL, 0x06
.equ SNDC_MAP_CHANGE,   0x08
.equ SNDC_MIDI_DIRECT,  0x09
.equ SNDC_SEQ_PAN,      0x0E
.equ SNDC_RESET,        0x10    ! sent at start-up with P1-P5 = 1
.equ SNDC_CHAN_PAN,     0x11    ! P1-P4 = the four snd_pan values | 0x80
.equ SNDC_CMD16,        0x16
.equ SNDC_SEQ_TRANSPOSE, 0x17
.equ SNDC_SEQ_LEVEL,    0x18
.equ SNDC_CDDA_LEVEL,   -0x80   ! 0x80
.equ SNDC_CDDA_PAN,     -0x7F   ! 0x81
.equ SNDC_EFFECT_CHANGE, -0x7D  ! 0x83
.equ SNDC_MIXER_CHANGE, -0x79   ! 0x87

! snd_voices: 8 positional sound slots
.equ VOICE_TIMER,       0       ! w: frames left
.equ VOICE_PRIORITY,    2       ! b
.equ VOICE_CTRL,        3       ! b: sequence control number
.equ VOICE_OWNER,       4       ! object body
.equ VOICE_LEN,         8
.equ SND_PAN_SENT,      8       ! snd_pan: the four pans, then the four last sent
.equ SND_VOLUME_SENT,   8       ! snd_ctrl_volume: eight volumes, then the last sent

! Object bodies
.equ FADE_LEVEL,        OBJ_WORK0       ! w: snd_level_*_task
.equ SNDTEST_BANK,      0               ! b: dbg_sound_test_task
.equ SNDTEST_SONG,      1
.equ SNDTEST_REPEAT,    2               ! b: auto-repeat delay
.equ SNDTEST_PAN,       3
.equ LINEWIN_ID,        OBJ_WORK16      ! w: linewin_project_shape

	.section .text.0600D3D0,"ax",@progbits
	.p2align 2

! Copy vdp2_default_palette to vdp2_cram_shadow and write 32 grey gouraud
! tables (4 colours each) at VDP1 VRAM + 0xC000.
	glabel vdp_init_palette_gouraud
	mov.l	.L0600D3FC,r3
	mova	.Lvdp2_default_palette,r0
	mov.w	.L0600D400,r1
.L0600D3D6:
	mov.w	@r0+,r2
	mov.w	r2,@r3
	dt	r1
	bf/s	.L0600D3D6
	add	#2,r3
	mov	#0,r0
	mov.l	.L0600D404,r3
	mov	#32,r1
	mov.w	.L0600D402,r2
.L0600D3E8:
	mov.w	r0,@(0,r3)
	mov.w	r0,@(2,r3)
	mov.w	r0,@(4,r3)
	mov.w	r0,@(6,r3)
	add	r2,r0
	dt	r1
	bf/s	.L0600D3E8
	add	#8,r3
	rts
	nop
.L0600D3FC:
	.long vdp2_cram_shadow
.L0600D400:
	.short 0x0100
.L0600D402:
	.short 0x0421
.L0600D404:
	.long VDP1_VRAM + 0xC000
	endlabel vdp_init_palette_gouraud

! Unused: copy 64 pairs of longs from r2 to r3.
	glabel vdp_copy_pairs_64
	mov.w	.L0600D41C,r8
.L0600D40A:
	mov.l	@r2+,r9
	mov.l	@r2+,r0
	mov.l	r9,@r3
	mov.l	r0,@(4,r3)
	add	#8,r3
	dt	r8
	bf	.L0600D40A
	rts
	nop
.L0600D41C:
	.short 0x0040
	endlabel vdp_copy_pairs_64

! Unused: copy 24 pairs of longs from r2 to r3.
	glabel vdp_copy_pairs_24
	mov.w	.L0600D432,r8
.L0600D420:
	mov.l	@r2+,r9
	mov.l	@r2+,r0
	mov.l	r9,@r3
	mov.l	r0,@(4,r3)
	add	#8,r3
	dt	r8
	bf	.L0600D420
	rts
	nop
.L0600D432:
	.short 0x0018
	endlabel vdp_copy_pairs_24

! Unused: copy 8 pairs of longs from r2 to r3.
	glabel vdp_copy_pairs_8
	mov.w	.L0600D448,r8
.L0600D436:
	mov.l	@r2+,r9
	mov.l	@r2+,r0
	mov.l	r9,@r3
	mov.l	r0,@(4,r3)
	add	#8,r3
	dt	r8
	bf	.L0600D436
	rts
	nop
.L0600D448:
	.short 0x0008
	endlabel vdp_copy_pairs_8

! Unused: copy 4 pairs of longs from r2 to r3.
	glabel vdp_copy_pairs_4
	mov.w	.L0600D45E,r8
.L0600D44C:
	mov.l	@r2+,r9
	mov.l	@r2+,r0
	mov.l	r9,@r3
	mov.l	r0,@(4,r3)
	add	#8,r3
	dt	r8
	bf	.L0600D44C
	rts
	nop
.L0600D45E:
	.short 0x0004
	endlabel vdp_copy_pairs_4

! Wait for SCU DMA to be idle, then DMA vdp2_cram_shadow to VDP2 colour RAM
! (0x1000 bytes, or 0x800 in the 1024-colour RAM mode).
	glabel vdp2_cram_upload
	mov.l	.L0600D49C,r3
	mov.l	.L0600D4A0,r4
	mov.w	.L0600D498,r5
	mov.w	@(GBR_VDP2_RAMCTL,gbr),r0
	shlr8	r0
	tst	#16,r0
	bf	.Lwait_dma
	shlr	r5
.Lwait_dma:
	mov.l	.L0600D4A4,r7
	mov.l	@r7,r7
	mov.l	.L0600D4A8,r6
	tst	r6,r7
	bf	.Lwait_dma
	mov.l	.L0600D4AC,r7
	mov	r4,r6
	mov.l	r6,@(SCU_D0W_OFS,r7)
	mov	r3,r6
	mov.l	r6,@r7			! SCU_D0R_OFS
	mov	r5,r6
	mov.l	r6,@(SCU_D0C_OFS,r7)
	mov.w	.L0600D49A,r6
	mov.l	r6,@(SCU_D0AD_OFS,r7)
	mov	#7,r6
	mov.l	r6,@(SCU_D0MD_OFS,r7)
	mov.w	.L0600D49A,r6
	mov.l	r6,@(SCU_D0EN_OFS,r7)
	rts
	nop
.L0600D498:
	.short 0x1000
.L0600D49A:
	.short 0x0101
.L0600D49C:
	.long vdp2_cram_shadow
.L0600D4A0:
	.long VDP2_CRAM
.L0600D4A4:
	.long SCU_REGS + 0x7C
.L0600D4A8:
	.long 0x00010030
.L0600D4AC:
	.long SCU_REGS
	endlabel vdp2_cram_upload

! Unused: copy 4 pairs of RGB colours from r2 to r3, setting bit 15.
	glabel vdp_copy_colors_4
	mov.w	.L0600D4CA,r8
	mov.l	.L0600D4CC,r10
.L0600D4B4:
	mov.l	@r2+,r9
	mov.l	@r2+,r0
	or	r10,r9
	or	r10,r0
	mov.l	r9,@r3
	mov.l	r0,@(4,r3)
	add	#8,r3
	dt	r8
	bf	.L0600D4B4
	rts
	nop
.L0600D4CA:
	.short 0x0004
.L0600D4CC:
	.long 0x80008000
	endlabel vdp_copy_colors_4

! r0 = RGB555 r4 + (r5 - r4) * r0 / 256 per channel, with bit 15 set.
! Clobbers r8-r13.
	glabel vdp_rgb555_lerp
	mov	#-1,r8
	extu.w	r8,r8
	shlr	r8
	and	r8,r4
	and	r8,r5
	shll8	r0
	mov	#31,r9
	mov	r4,r10
	mov	r5,r11
	and	r9,r10
	and	r9,r11
	sub	r10,r11
	shll16	r11
	dmuls.l	r0,r11
	sts	mach,r13
	add	r10,r13
	shll2	r9
	shll2	r9
	shll	r9
	mov	r4,r10
	mov	r5,r11
	and	r9,r10
	and	r9,r11
	sub	r10,r11
	shll16	r11
	dmuls.l	r0,r11
	sts	mach,r12
	add	r10,r12
	and	r9,r12
	shll2	r9
	shll2	r9
	shll	r9
	mov	r4,r10
	mov	r5,r11
	and	r9,r10
	and	r9,r11
	sub	r10,r11
	shll16	r11
	dmuls.l	r0,r11
	sts	mach,r11
	add	r10,r11
	and	r9,r11
	add	#1,r8
	mov	r8,r0
	or	r11,r0
	or	r12,r0
	rts
	or	r13,r0
	endlabel vdp_rgb555_lerp

! Build fogged colour tables in VDP1 VRAM: for each of r7 16-colour
! palettes from r2, 8 tables stepping towards the fog colour by r6 (16.16).
! The word at r0 + 4 is the first table (VRAM / 8). Clobbers r0, r2-r14.
	glabel vdp1_build_fog_cluts
	mov.l	r1,@-r15
	shll2	r7
	shll2	r7
	mov	r0,r1
	mov.w	@(4,r1),r0
	shll2	r0
	shll	r0
	mov.l	.L0600D5F4,r1
	add	r0,r1
.Lnext_palette:
	mov.w	@(GBR_FOG_B,gbr),r0
	mov	r0,r8
	mov.w	@(GBR_FOG_G,gbr),r0
	mov	r0,r9
	mov.w	@(GBR_FOG_R,gbr),r0
	mov	r0,r10
	mov	#31,r11
	mov.w	@r2+,r0
	mov	r0,r5
	and	r11,r5
	mov	r5,r13
	sub	r10,r5
	neg	r5,r5
	dmuls.l	r6,r5
	sts	macl,r5
	shar	r5
	shar	r5
	shar	r5
	shll2	r11
	shll2	r11
	shll	r11
	mov	r0,r4
	and	r11,r4
	mov	r4,r12
	sub	r9,r4
	neg	r4,r4
	dmuls.l	r6,r4
	sts	macl,r4
	shar	r4
	shar	r4
	shar	r4
	shll2	r11
	shll2	r11
	shll	r11
	mov	r0,r3
	and	r11,r3
	mov	r3,r11
	sub	r8,r3
	neg	r3,r3
	dmuls.l	r6,r3
	sts	macl,r3
	shar	r3
	shar	r3
	shar	r3
	shll16	r11
	shll16	r12
	shll16	r13
	mov	#8,r14
	mov.w	.L0600D5F0,r9
.L0600D5A4:
	mov	#31,r8
	shll16	r8
	mov	r13,r10
	and	r8,r10
	mov	r12,r0
	shll2	r8
	shll2	r8
	shll	r8
	and	r8,r0
	or	r0,r10
	mov	r11,r0
	shll2	r8
	shll2	r8
	shll	r8
	and	r8,r0
	or	r0,r10
	mov	#1,r8
	rotr	r8
	or	r8,r10
	shlr16	r10
	mov.w	r10,@r1
	add	r5,r13
	add	r4,r12
	add	r3,r11
	dt	r14
	bf/s	.L0600D5A4
	add	#32,r1
	add	#-30,r1
	add	#-1,r7
	mov	r7,r0
	tst	#15,r0
	bt	.L0600D5E6
	add	r9,r1
.L0600D5E6:
	tst	r7,r7
	bf	.Lnext_palette
	mov.l	@r15+,r1
	rts
	nop
.L0600D5F0:
	.short 0xFF20
	.byte 0x00, 0x00
.L0600D5F4:
	.long VDP1_VRAM
.Lvdp2_default_palette:
	.short	0x8000, 0xFFFF, 0xA000, 0xEE52, 0xFE94, 0xFFFF, 0x8000, 0x8000
	.short	0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.short	0xFFFF, 0xFBDE, 0x8000, 0x837F, 0x825F, 0x813F, 0x801F, 0xFECC
	.short	0xFDE8, 0xFFFF, 0xFC00, 0x8240, 0x8160, 0xFFFF, 0x8954, 0xA279
	.short	0xFFFF, 0xF800, 0xF000, 0xE800, 0xE000, 0xD800, 0xD000, 0xC800
	.short	0xC000, 0xB800, 0xB000, 0xA800, 0xA000, 0x9800, 0x9000, 0x8800
	endlabel vdp1_build_fog_cluts

! Spawn linewin_task in obj_list_stage, then clear the span tables now and
! (as this object's handler, .Llinewin_clear) every frame.
	glabel linewin_spawn
	sts.l	pr,@-r15
	mov.l	.L0600D82C,r2
	mov.l	.L0600D830,r0
	jsr	@r0
	nop
	mov.l	.L0600D834,r2
	mov.l	r2,@(NODE_HANDLER,r3)
	add	#16,r3
	mov.l	.L0600D838,r2
	mov.l	r2,@-r1
	add	#4,r1
	lds.l	@r15+,pr
.Llinewin_clear:
	mov.l	.L0600D83C,r4
	mov.l	.L0600D840,r5
	mov	#0,r0
.L0600D816:
	mov.l	r0,@r4
	dt	r5
	bf/s	.L0600D816
	add	#4,r4
	mov	#-1,r0
	mov.l	.L0600D844,r2
	mov.w	r0,@r2
	mov.l	.L0600D848,r2
	mov.w	r0,@r2
	rts
	nop
.L0600D82C:
	.long obj_list_stage
.L0600D830:
	.long obj_alloc
.L0600D834:
	.long linewin_task
.L0600D838:
	.long .Llinewin_clear
.L0600D83C:
	.long linewin_spans_a
.L0600D840:
	.long 0x000000E0
.L0600D844:
	.long linewin_shapes_a
.L0600D848:
	.long linewin_shapes_b
	endlabel linewin_spawn

! Each frame: rasterize the projected shapes into the span tables.
	glabel linewin_task
	sts.l	pr,@-r15
	mov.l	.L0600D85C,r14
	jsr	@r14
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0600D85C:
	.long linewin_rasterize_all
	endlabel linewin_task

! Project the shape r2 ({count, count * {x, y, z, pad} words}) of object r1
! to screen points appended at GBR_LINEWIN_SHAPE_PTR. Appends the -1
! terminator only when a vertex is on screen; gives up when a vertex is
! behind the camera (z < 16). Clobbers r0, r2-r14.
	glabel linewin_project_shape
	sts.l	pr,@-r15
	mov.l	@(OBJ_X,r1),r4
	mov.l	@(OBJ_Y,r1),r5
	mov.l	@(OBJ_Z,r1),r6
	mov.l	.L0600D8F4,r3
	mov.l	@r3+,r12
	mov.l	@r3+,r13
	sub	r12,r4
	mov.l	@r3+,r12
	sub	r13,r5
	sub	r12,r6
	mov	r4,r0
	mov.l	r0,@(GBR_PROJ_X,gbr)
	mov	r6,r0
	mov.l	r0,@(GBR_PROJ_Z,gbr)
	mov.l	@r3+,r8
	mov.l	@r3+,r9
	mov.l	@r3+,r10
	mov.l	@r3+,r11
	mov	r2,r3
	mov.l	@r3+,r7
	mov	r7,r6
	mov.l	r1,@-r15
	mov.l	@(GBR_LINEWIN_SHAPE_PTR,gbr),r0
	mov	r0,r2
	mov.w	r7,@r2
	add	#2,r2
	mov.w	@(LINEWIN_ID,r1),r0
	mov.w	r0,@r2
	add	#2,r2
	mov.w	@r3+,r12
	mov.w	@r3+,r13
	mov.w	@r3+,r14
	add	#2,r3
	shll16	r12
	shll16	r13
	shll16	r14
	mov.l	@(GBR_PROJ_X,gbr),r0
	add	r0,r12
	mov.l	@(GBR_PROJ_Z,gbr),r0
	add	r5,r13
	add	r0,r14
	shll2	r12
	shll2	r14
	dmuls.l	r14,r8
	sts	mach,r0
	dmuls.l	r14,r9
	sts	mach,r1
	dmuls.l	r12,r8
	sts	mach,r14
	dmuls.l	r12,r9
	sts	mach,r12
	sub	r0,r12
	add	r1,r14
	shll2	r13
	shll2	r14
	dmuls.l	r13,r10
	sts	mach,r0
	dmuls.l	r14,r10
	sts	mach,r1
	dmuls.l	r13,r11
	sts	mach,r13
	dmuls.l	r14,r11
	sts	mach,r14
	sub	r1,r13
	add	r0,r14
.Lnext_vertex:
	mov	#16,r0
	shll16	r0
	cmp/ge	r0,r14
	bt	.L0600D8F8
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
.L0600D8F4:
	.long camera
.L0600D8F8:
	mov.w	@(GBR_CAM_FOCAL,gbr),r0
	mov	#-128,r1
	shll	r1
	mov.l	r14,@(DIVU_DVSR,r1)
	mov.l	r0,@(DIVU_DVDNTH,r1)
	mov	#0,r0
	mov.l	r0,@(DIVU_DVDNTL,r1)
	mov.l	r12,@-r15
	mov.l	r13,@-r15
	mov.w	@r3+,r12
	mov.w	@r3+,r13
	mov.w	@r3+,r14
	add	#2,r3
	shll16	r12
	shll16	r13
	shll16	r14
	mov.l	@(GBR_PROJ_X,gbr),r0
	add	r0,r12
	mov.l	@(GBR_PROJ_Z,gbr),r0
	add	r5,r13
	add	r0,r14
	shll2	r12
	shll2	r14
	dmuls.l	r14,r8
	sts	mach,r0
	dmuls.l	r14,r9
	sts	mach,r1
	dmuls.l	r12,r8
	sts	mach,r14
	dmuls.l	r12,r9
	sts	mach,r12
	sub	r0,r12
	add	r1,r14
	shll2	r13
	shll2	r14
	dmuls.l	r13,r10
	sts	mach,r0
	dmuls.l	r14,r10
	sts	mach,r1
	dmuls.l	r13,r11
	sts	mach,r13
	dmuls.l	r14,r11
	sts	mach,r14
	sub	r1,r13
	add	r0,r14
	mov.l	@r15+,r1
	mov.l	@r15+,r0
	mov	#-128,r4
	shll	r4
	mov.l	@(DIVU_QUOT,r4),r4
	dmuls.l	r4,r0
	sts	mach,r0
	dmuls.l	r4,r1
	sts	mach,r1
	mov	#88,r4
	shll	r4
	cmp/ge	r4,r0
	bt	.Lvertex_off_screen
	add	r0,r4
	cmp/pz	r4
	bf	.Lvertex_off_screen
	mov	#112,r4
	cmp/ge	r4,r1
	bt	.Lvertex_off_screen
	add	r1,r4
	cmp/pz	r4
	bt	.Lstore_vertex
.Lvertex_off_screen:
	add	#-1,r6
.Lstore_vertex:
	mov	#88,r4
	shll	r4
	add	r4,r0
	mov	#112,r4
	add	r4,r1
	mov.w	r0,@r2
	add	#2,r2
	mov.w	r1,@r2
	add	#2,r2
	dt	r7
	bf	.Lnext_vertex
	tst	r6,r6
	bt	.L0600D99E
	mov	#-1,r0
	mov.w	r0,@r2
.L0600D99E:
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
	endlabel linewin_project_shape

! Rasterize both shape lists into their span tables.
	glabel linewin_rasterize_all
	sts.l	pr,@-r15
	mov.l	r1,@-r15
	mov.l	.L0600D9D4,r1
	mov.l	.L0600D9D8,r0
	mov.l	r0,@(GBR_LINEWIN_SPAN_PTR,gbr)
	mov.w	@r1+,r7
	cmp/pz	r7
	bf	.L0600D9BA
	bsr	linewin_rasterize_poly
	nop
.L0600D9BA:
	mov.l	.L0600D9DC,r1
	mov.l	.L0600D9E0,r0
	mov.l	r0,@(GBR_LINEWIN_SPAN_PTR,gbr)
	mov.w	@r1+,r7
	cmp/pz	r7
	bf	.L0600D9CA
	bsr	linewin_rasterize_poly
	nop
.L0600D9CA:
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0600D9D4:
	.long linewin_shapes_a
.L0600D9D8:
	.long linewin_spans_a
.L0600D9DC:
	.long linewin_shapes_b
.L0600D9E0:
	.long linewin_spans_b
	endlabel linewin_rasterize_all

! Rasterize the shape at r1 (r7 vertices) into the span table at
! GBR_LINEWIN_SPAN_PTR. Vertices are copied to poly_scratch as 8-byte
! {index * 4, x, y << 16} records and sorted by y, then the left and right
! edges are walked down. Clobbers r0, r2-r14.
	glabel linewin_rasterize_poly
	sts.l	pr,@-r15
	mov.w	@r1+,r0
	mov	r1,r8
	mov	r7,r14
	mov.l	.L0600DA3C,r2
	mov	r7,r14
	add	#-1,r7
	shll2	r7
	mov	r7,r0
	mov.w	r0,@(GBR_WRAP_LIMIT,gbr)
	mov	#0,r6
.L0600D9FA:
	mov.w	r6,@r2
	mov.w	@(0,r8),r0
	mov.w	r0,@(2,r2)
	mov.w	@(2,r8),r0
	shll16	r0
	mov.l	r0,@(4,r2)
	add	#4,r8
	add	#8,r2
	dt	r14
	bf/s	.L0600D9FA
	add	#4,r6
	mov	#-1,r0
	mov.l	r0,@(0,r2)
	mov.l	.L0600DA3C,r2
	mov	r2,r13
.Lsort_vertices:
	mov.l	@(8,r2),r8
	cmp/pz	r8
	bf	.L0600DA44
	mov.l	@(12,r2),r8
	mov.l	@(4,r2),r9
	cmp/ge	r9,r8
	bt	.L0600DA40
	mov.l	r8,@(4,r2)
	mov.l	r9,@(12,r2)
	mov.l	@(0,r2),r8
	mov.l	@(8,r2),r9
	mov.l	r8,@(8,r2)
	mov.l	r9,@(0,r2)
	add	#-8,r2
	cmp/ge	r13,r2
	bt	.Lsort_vertices
	bra	.Lsort_vertices
	mov	r13,r2
.L0600DA3C:
	.long poly_scratch
.L0600DA40:
	bra	.Lsort_vertices
	add	#8,r2
.L0600DA44:
	mov.l	@(GBR_LINEWIN_SPAN_PTR,gbr),r0
	mov	r0,r2
	mov.l	.L0600DA8C,r9
	mov.w	@r9+,r10
	mov.w	@r9+,r3
	shll16	r3
	mov	r3,r4
	mov.w	@r9+,r5
	mov	r5,r14
	shll2	r5
	add	r5,r2
	add	#2,r9
	mov	r9,r8
	mov	r10,r5
	mov	r10,r6
	add	#-4,r5
	add	#4,r6
.Lnext_edge_pair:
	mov.w	@(GBR_WRAP_LIMIT,gbr),r0
	cmp/pz	r5
	bt	.L0600DA6E
	mov	r0,r5
.L0600DA6E:
	cmp/ge	r0,r6
	bf	.L0600DA74
	mov	#0,r6
.L0600DA74:
	shll16	r14
.Lfind_left:
	mov.w	@r8,r0
	cmp/pz	r0
	bf	.Lrasterize_done
	mov.l	@(4,r8),r13
	cmp/gt	r14,r13
	bf	.L0600DA86
	cmp/eq	r5,r0
	bt	.Lfound_left
.L0600DA86:
	bra	.Lfind_left
	add	#8,r8
	.byte 0x00, 0x00
.L0600DA8C:
	.long poly_scratch
.Lfound_left:
	mov	r0,r5
.Lfind_right:
	mov.w	@r9,r0
	cmp/pz	r0
	bf	.Lrasterize_done
	mov.l	@(4,r8),r13
	cmp/gt	r14,r13
	bf	.L0600DAA2
	cmp/eq	r6,r0
	bt	.Lfound_right
.L0600DAA2:
	bra	.Lfind_right
	add	#8,r9
.Lrasterize_done:
	lds.l	@r15+,pr
	rts
	nop
.Lfound_right:
	mov	r0,r6
	swap.w	r14,r14
	exts.w	r14,r14
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov.w	@(4,r8),r0
	mov	r0,r10
	sub	r14,r10
	mov.w	@(2,r8),r0
	shll16	r0
	sub	r3,r0
	mov	#-128,r13
	shll	r13
	mov.l	r10,@(DIVU_DVSR,r13)
	mov.l	r0,@(DIVU_DVDNT,r13)
	mov.l	@(DIVU_QUOT,r13),r7
	mov.w	@(4,r9),r0
	mov	r0,r11
	sub	r14,r11
	mov.w	@(2,r9),r0
	shll16	r0
	sub	r4,r0
	mov.l	r11,@(DIVU_DVSR,r13)
	mov.l	r0,@(DIVU_DVDNT,r13)
	mov.l	@(DIVU_QUOT,r13),r8
	cmp/ge	r10,r11
	bf	.L0600DAE8
	add	#-4,r5
	bra	.Lfill_edges
	mov	r10,r12
.L0600DAE8:
	add	#4,r6
	mov	r11,r12
.Lfill_edges:
	add	r12,r14
	mov.l	r14,@-r15
	mov.l	r10,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov	r12,r14
	bsr	linewin_fill_edge_spans
	nop
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r10
	mov.l	@r15+,r14
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	bra	.Lnext_edge_pair
	nop
	endlabel linewin_rasterize_poly

! Write r14 lines of {x0, x1} spans at r2 from the edges r3 and r4
! (16.16, stepping by r7 and r8), clipped to 0..351 and to the table.
	glabel linewin_fill_edge_spans
	cmp/pl	r14
	bt	.Lnext_line
	rts
	nop
.Lnext_line:
	add	r7,r3
	add	r8,r4
	mov.l	@(GBR_LINEWIN_SPAN_PTR,gbr),r0
	cmp/ge	r0,r2
	bf	.Lskip_line
	mov.w	.L0600DB86,r11
	add	r11,r0
	cmp/ge	r0,r2
	bt	.Lskip_line
	mov	r3,r5
	mov	r4,r6
	cmp/ge	r5,r6
	bt	.L0600DB34
	mov	r5,r11
	mov	r6,r5
	mov	r11,r6
.L0600DB34:
	cmp/pz	r5
	bt	.L0600DB3A
	mov	#0,r5
.L0600DB3A:
	cmp/pz	r6
	bt	.L0600DB40
	mov	#0,r6
.L0600DB40:
	shlr16	r5
	shlr16	r6
	mov.l	.L0600DB8C,r11
	cmp/ge	r11,r5
	bf	.L0600DB4C
	mov	r11,r5
.L0600DB4C:
	cmp/ge	r11,r6
	bf	.L0600DB52
	mov	r11,r6
.L0600DB52:
	cmp/ge	r5,r6
	bt	.L0600DB5C
	mov	r5,r11
	mov	r6,r5
	mov	r11,r6
.L0600DB5C:
	mov.w	.L0600DB88,r11
	cmp/gt	r11,r5
	bt	.Lskip_line
	cmp/gt	r11,r6
	bf	.L0600DB68
	mov	r11,r6
.L0600DB68:
	cmp/pz	r6
	bf	.Lskip_line
	cmp/pz	r5
	bt	.L0600DB72
	mov	#0,r5
.L0600DB72:
	add	r5,r5
	add	r6,r6
	mov.w	r5,@r2
	add	#2,r2
	mov.w	r6,@r2
	add	#2,r2
	dt	r14
	bf	.Lnext_line
	rts
	nop
.L0600DB86:
	.short 0x0380
.L0600DB88:
	.short 0x015F
	.byte 0x00, 0x00
.L0600DB8C:
	.long 0x0000015F
.Lskip_line:
	add	#4,r2
	dt	r14
	bf	.Lnext_line
	rts
	nop
	.byte 0x00, 0x00
	endlabel linewin_fill_edge_spans

! Wait (with a timeout) until the driver has taken every host command.
! Clobbers r7-r9, r13, r14.
	glabel snd_wait_driver_idle
	mov.w	.L0600DBC0,r13
.Lpoll_slots:
	mov	#0,r8
	mov.l	.L0600DBC4,r9
	mov	#8,r14
.L0600DBA4:
	mov.b	@r9,r0
	or	r0,r8
	add	#16,r9
	dt	r14
	bf	.L0600DBA4
	tst	r8,r8
	bt	.Lidle
	mov.l	.L0600DBC8,r7
.Ldelay:
	dt	r7
	bf	.Ldelay
	dt	r13
	bf	.Lpoll_slots
.Lidle:
	rts
	nop
.L0600DBC0:
	.short 0x0020
	.byte 0x00, 0x00
.L0600DBC4:
	.long SCSP_RAM + 0x700
.L0600DBC8:
	.long 0x000C3500
	endlabel snd_wait_driver_idle

! Reset the driver, load the driver and this stage's sound data (except in
! game mode 2, with GBR_DEMO_MODE < 0 and on boss and special stages), mark
! the area map loaded, empty the command ring and set the default mix, map
! and effects.
	glabel snd_init_stage
	sts.l	pr,@-r15
	bsr	snd_wait_driver_idle
	nop
	mov.l	.L0600DC78,r4
	mov	#1,r0
	mov.b	r0,@(SNDCMD_P1,r4)
	mov.b	r0,@(SNDCMD_P2,r4)
	mov.b	r0,@(SNDCMD_P3,r4)
	mov.b	r0,@(SNDCMD_P4,r4)
	mov.b	r0,@(SNDCMD_P5,r4)
	mov	#SNDC_RESET,r0
	mov.b	r0,@(SNDCMD_CODE,r4)
	bsr	snd_wait_driver_idle
	nop
	mov.l	.L0600DC7C,r0
	jsr	@r0
	nop
	mov.l	.L0600DC80,r0
	jsr	@r0
	nop
	mov.b	@(GBR_GAME_MODE,gbr),r0
	cmp/eq	#2,r0
	bt	.Lmark_area_map
	mov.b	@(GBR_DEMO_MODE,gbr),r0
	cmp/pz	r0
	bf	.Lmark_area_map
	mov.b	@(GBR_STAGE,gbr),r0
	tst	#1,r0
	bf	.Lmark_area_map
	mov	#12,r8
	cmp/ge	r8,r0
	bt	.Lmark_area_map
	mov.l	.L0600DC84,r0
	jsr	@r0
	nop
	bsr	snd_upload_area_map_tones
	nop
.Lmark_area_map:
	mov.l	.L0600DC88,r2
	mov.w	.L0600DC72,r7
	mov.w	.L0600DC74,r8
.L0600DC1C:
	mov.w	@(4,r2),r0		! area map entry: mark loaded
	or	r8,r0
	mov.w	r0,@(4,r2)
	add	#8,r2
	dt	r7
	bf	.L0600DC1C
	mov.l	.L0600DC8C,r0
	jsr	@r0
	nop
	mov	#0,r0
	mov.b	r0,@(GBR_SND_RING_WR,gbr)
	mov.b	r0,@(GBR_SND_RING_RD,gbr)
	mov.b	r0,@(GBR_SND_SLOT,gbr)
	bsr	snd_cmd_alloc
	nop
	mov	#SNDC_RESET,r0
	mov.b	r0,@r3
	add	#2,r3
	mov	#1,r0
	mov.b	r0,@r3
	add	#1,r3
	mov.b	r0,@r3
	add	#1,r3
	mov.b	r0,@r3
	add	#1,r3
	mov.b	r0,@r3
	add	#1,r3
	mov.b	r0,@r3
	bsr	snd_cmd_flush
	nop
	bsr	snd_init_cdda_mix
	nop
	mov.l	.L0600DC90,r0
	jsr	@r0
	nop
	mov	#0,r4
	bsr	snd_map_change
	nop
	mov.b	@(GBR_STAGE,gbr),r0
	tst	#1,r0
	bf	.L0600DC94
	bra	.Lset_effect
	mov	#0,r4
.L0600DC72:
	.short 0x0020
.L0600DC74:
	.short 0x8000
	.byte 0x00, 0x00
.L0600DC78:
	.long SCSP_RAM + 0x700
.L0600DC7C:
	.long smpc_sndoff
.L0600DC80:
	.long func_06007438
.L0600DC84:
	.long func_060073CC
.L0600DC88:
	.long SCSP_RAM + 0xA000
.L0600DC8C:
	.long smpc_sndon
.L0600DC90:
	.long snd_apply_stereo_mono
.L0600DC94:
	mov	#0,r4
.Lset_effect:
	bsr	snd_effect_change
	nop
	mov.b	@(GBR_STAGE,gbr),r0
	tst	#1,r0
	bf	.L0600DCA8
	mov	#0,r4
	mov	#0,r5
	bra	.L0600DCAC
	nop
.L0600DCA8:
	mov	#0,r4
	mov	#0,r5
.L0600DCAC:
	bsr	snd_mixer_change
	nop
	lds.l	@r15+,pr
	rts
	nop
	endlabel snd_init_stage

! snd_init_stage without loading anything.
	glabel snd_reset
	sts.l	pr,@-r15
	bsr	snd_wait_driver_idle
	nop
	mov.l	.L0600DD20,r4
	mov	#1,r0
	mov.b	r0,@(SNDCMD_P1,r4)
	mov.b	r0,@(SNDCMD_P2,r4)
	mov.b	r0,@(SNDCMD_P3,r4)
	mov.b	r0,@(SNDCMD_P4,r4)
	mov.b	r0,@(SNDCMD_P5,r4)
	mov	#SNDC_RESET,r0
	mov.b	r0,@(SNDCMD_CODE,r4)
	bsr	snd_wait_driver_idle
	nop
	mov	#0,r0
	mov.b	r0,@(GBR_SND_RING_WR,gbr)
	mov.b	r0,@(GBR_SND_RING_RD,gbr)
	mov.b	r0,@(GBR_SND_SLOT,gbr)
	bsr	snd_cmd_alloc
	nop
	mov	#SNDC_RESET,r0
	mov.b	r0,@r3
	add	#2,r3
	mov	#1,r0
	mov.b	r0,@r3
	add	#1,r3
	mov.b	r0,@r3
	add	#1,r3
	mov.b	r0,@r3
	add	#1,r3
	mov.b	r0,@r3
	add	#1,r3
	mov.b	r0,@r3
	bsr	snd_cmd_flush
	nop
	bsr	snd_init_cdda_mix
	nop
	mov.l	.L0600DD24,r0
	jsr	@r0
	nop
	mov	#0,r4
	bsr	snd_map_change
	nop
	mov	#0,r4
	bsr	snd_effect_change
	nop
	mov	#0,r4
	mov	#0,r5
	bsr	snd_mixer_change
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0600DD20:
	.long SCSP_RAM + 0x700
.L0600DD24:
	.long snd_apply_stereo_mono
	endlabel snd_reset

! Apply the mono/stereo option (byte 0 of D_060CB000 non-zero = mono) to the
! driver and to the CD audio pan.
	glabel snd_apply_stereo_mono
	sts.l	pr,@-r15
	mov.l	.L0600DD5C,r2
	mov.b	@r2,r0
	tst	r0,r0
	mov	#0,r0
	mov	#31,r4
	mov	#15,r5
	bt	.L0600DD3E
	mov	#-128,r0
	mov	#0,r4
	mov	#0,r5
.L0600DD3E:
	mov.l	.L0600DD60,r2
	mov.b	r0,@r2
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600DD56
	mov	#SNDC_CDDA_PAN,r0
	mov.b	r0,@r3
	mov	r4,r0
	mov.b	r0,@(SNDCMD_P1,r3)
	mov	r5,r0
	mov.b	r0,@(SNDCMD_P2,r3)
.L0600DD56:
	lds.l	@r15+,pr
	rts
	nop
.L0600DD5C:
	.long D_060CB000
.L0600DD60:
	.long SCSP_RAM + 0x483
	endlabel snd_apply_stereo_mono

! Copy the area map from lwram_buf to SCSP RAM and every tone bank of the
! stage, each in the variant chosen by snd_tone_variants.
	glabel snd_upload_area_map_tones
	sts.l	pr,@-r15
	mov.b	@(GBR_DEMO_MODE,gbr),r0
	cmp/eq	#1,r0
	bt	.Lno_variants
	cmp/eq	#0,r0
	bt	.L0600DD7C
	mov.l	.L0600DD78,r5
	bra	.Lcheck_header
	nop
	.byte 0x00, 0x00
.L0600DD78:
	.long D_060CE000
.L0600DD7C:
	mov.b	@(GBR_STAGE,gbr),r0
	tst	#1,r0
	bt	.Lstage_tones
	bra	.Lcopy_area_map
	nop
.Lstage_tones:
	mov	#12,r2
	cmp/ge	r2,r0
	bt	.Lcopy_area_map
	shll2	r0
	shll8	r0
	mov.l	.L0600DDA8,r5
	add	r0,r5
.Lcheck_header:
	mov.l	@r5,r0
	cmp/eq	#-1,r0
	bf	.Lload_variant_hdr
.Lno_variants:
	mov.l	.L0600DDAC,r2
	mov	#0,r0
	mov.l	r0,@(4,r2)
	mov.l	r0,@(8,r2)
	bra	.Lcopy_area_map
	nop
	.byte 0x00, 0x00
.L0600DDA8:
	.long 0x002FC000
.L0600DDAC:
	.long snd_tone_select
.Lload_variant_hdr:
	mov.b	@(GBR_STAGE,gbr),r0
	shll2	r0
	shll	r0
	mov.l	.L0600DDEC,r2
	add	r0,r2
	mov.l	.L0600DDF0,r3
	mov.l	@(4,r2),r0
	mov.l	r0,@(4,r3)
	mov.l	@(8,r2),r0
	mov.l	r0,@(8,r3)
.Lcopy_area_map:
	mov.l	.L0600DDF4,r7
	mov.l	.L0600DDF8,r4
	mov.l	.L0600DDFC,r5
	mov.w	.L0600DDEA,r6
	bsr	mem_copy_bytes
	nop
	mov.l	.L0600DE00,r2
	mov.b	@(GBR_STAGE,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	@r2+,r14
	mov	r7,r8
	mov.l	.L0600DDF8,r9
.Lfind_tone_entry:
	mov.b	@r9,r0
	cmp/eq	#16,r0
	bt	.Lnext_tone_bank
	bra	.Lfind_tone_entry
	add	#8,r9
.L0600DDEA:
	.short 0x0100
.L0600DDEC:
	.long 0x002FF000
.L0600DDF0:
	.long snd_tone_select
.L0600DDF4:
	.long snd_tone_variants
.L0600DDF8:
	.long lwram_buf
.L0600DDFC:
	.long SCSP_RAM + 0xA000
.L0600DE00:
	.long snd_tone_bank_table
.Lnext_tone_bank:
	cmp/pl	r14
	bf	.Lupload_done
	mov.b	@r8,r6
	add	#1,r8
	mov.b	@(GBR_GAME_MODE,gbr),r0
	cmp/eq	#3,r0
	bf	.Lclamp_variant
	mov.l	.L0600DE3C,r0
	mov.l	@r0,r0
	mov.l	.L0600DE40,r4
	add	r0,r4
	mov.l	.L0600DE44,r5
	mov.b	@r5,r0
	mov.w	.L0600DE38,r10
	mulu.w	r0,r10
	sts	macl,r0
	add	r0,r4
	mov	r4,r5
	add	#16,r4
	mov.b	@(GBR_STAGE,gbr),r0
	mov.w	@(r0,r4),r0
	mov	#50,r4
	cmp/ge	r4,r0
	bf	.Lvariant_locked
	bra	.Lclamp_variant
	nop
.L0600DE38:
	.short 0x0050
	.byte 0x00, 0x00
.L0600DE3C:
	.long D_060CB014
.L0600DE40:
	.long 0x00000528
.L0600DE44:
	.long D_060CB003
.Lvariant_locked:
	mov	#0,r6
.Lclamp_variant:
	mov	r6,r0
	cmp/pz	r0
	bf	.L0600DE56
	mov	#3,r6
	cmp/gt	r6,r0
	bf	.Lpick_variant
.L0600DE56:
	mov	#0,r0
.Lpick_variant:
	mov	r0,r6
	mov.l	.L0600DE88,r4
	mov.b	@(GBR_STAGE,gbr),r0
	shlr	r0
	shll2	r0
	add	r6,r0
	mov.b	@(r0,r4),r0
	shll2	r0
	mov	r0,r10
	mov.l	@(r0,r2),r4
	mov.l	@r9,r5
	mov.l	@(4,r9),r6
	mov.l	.L0600DE8C,r0
	and	r0,r5
	and	r0,r6
	mov.l	.L0600DE90,r0
	add	r0,r5
	bsr	mem_copy_bytes
	nop
	add	#16,r2
	add	#8,r9
	bra	.Lnext_tone_bank
	add	#-1,r14
	.byte 0x00, 0x00
.L0600DE88:
	.long snd_variant_order_table
.L0600DE8C:
	.long 0x0007FFFF
.L0600DE90:
	.long SCSP_RAM
.Lupload_done:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x09
	dlabel snd_variant_order_table
	.byte 0x00, 0x03, 0x01, 0x02, 0x00, 0x01, 0x03, 0x02, 0x00, 0x01, 0x02, 0x03, 0x00, 0x02, 0x01, 0x03
	.byte 0x00, 0x01, 0x03, 0x02, 0x00, 0x03, 0x02, 0x01
	endlabel snd_upload_area_map_tones

! Copy r6 bytes from r4 to r5. Out: r4 and r5 past the blocks.
	glabel mem_copy_bytes
	mov.b	@r4+,r0
	mov.b	r0,@r5
	dt	r6
	bf/s	mem_copy_bytes
	add	#1,r5
	rts
	nop
	.byte 0x00, 0x09
	dlabel snd_weights_cur
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel snd_weights_new
	.byte 0x00, 0x00, 0x00, 0x00
	endlabel mem_copy_bytes

! Share the 8 tone parts out between the 4 variants by the new weights, and
! move randomly picked parts to the variants that gained.
	glabel snd_reroll_tone_variants
	sts.l	pr,@-r15
	mov.l	.L0600DEDC,r2
	mov.b	@(GBR_DREAM,gbr),r0
	tst	#1,r0
	bt	.Lreroll
	bra	.Lreroll_done
	nop
	.byte 0x00, 0x00
.L0600DEDC:
	.long snd_tone_bank_table
.Lreroll:
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	@r2,r14
	mov.l	.L0600DF18,r8
	mov.l	.L0600DF1C,r9
	mov.b	@(0,r8),r0
	mov.b	r0,@(3,r9)
	mov.b	@(1,r8),r0
	mov.b	r0,@(2,r9)
	mov.b	@(2,r8),r0
	mov.b	r0,@(0,r9)
	mov.b	@(3,r8),r0
	mov.b	r0,@(1,r9)
	mov.l	.L0600DF20,r8
	mov.l	.L0600DF24,r9
	mov.l	.L0600DF28,r0
	mov.l	@r0,r0
	cmp/pz	r0
	bt	.L0600DF2C
	mov	#0,r0
	mov.b	r0,@(1,r9)
	mov.b	r0,@(2,r9)
	mov.b	r0,@(3,r9)
	mov	#1,r0
	mov.b	r0,@(0,r9)
	bra	.L0600DF3C
	nop
.L0600DF18:
	.long snd_variant_weights_cur
.L0600DF1C:
	.long snd_weights_cur
.L0600DF20:
	.long snd_variant_weights_new
.L0600DF24:
	.long snd_weights_new
.L0600DF28:
	.long D_060CC000
.L0600DF2C:
	mov.b	@(0,r8),r0
	mov.b	r0,@(3,r9)
	mov.b	@(1,r8),r0
	mov.b	r0,@(2,r9)
	mov.b	@(2,r8),r0
	mov.b	r0,@(0,r9)
	mov.b	@(3,r8),r0
	mov.b	r0,@(1,r9)
.L0600DF3C:
	mov.l	.L0600DFB8,r8
	mov.l	.L0600DFBC,r9
	bsr	math_apportion4
	nop
	mov.l	.L0600DFC0,r8
	mov.l	.L0600DFC4,r9
	bsr	math_apportion4
	nop
	mov.l	.L0600DFBC,r8
	mov.l	.L0600DFC4,r9
	mov.b	@r9+,r10
	mov.b	@r8+,r0
	sub	r0,r10
	mov.b	@r9+,r11
	mov.b	@r8+,r0
	sub	r0,r11
	mov.b	@r9+,r12
	mov.b	@r8+,r0
	sub	r0,r12
	mov.b	@r9+,r13
	mov.b	@r8+,r0
	sub	r0,r13
	mov	r10,r0
	or	r11,r0
	or	r12,r0
	or	r13,r0
	tst	r0,r0
	bt	.Lreroll_done
	mov.l	.L0600DFC8,r8
	mov	r10,r0
	mov.b	r0,@(0,r8)
	mov	r11,r0
	mov.b	r0,@(1,r8)
	mov	r12,r0
	mov.b	r0,@(2,r8)
	mov	r13,r0
	mov.b	r0,@(3,r8)
	mov	#0,r3
	mov	#0,r14
	mov.l	.L0600DFCC,r7
	mov	r7,r9
	mov.l	.L0600DFBC,r10
.Lremove_parts:
	mov.b	@r8,r0
	cmp/pz	r0
	bt	.Lnext_removal
	add	#1,r0
	mov.b	r0,@r8
	mov.b	@r10,r0
	bsr	math_rand_range
	nop
	mov	r9,r12
	mov	#8,r2
	mov	#0,r11
.Lfind_removed:
	mov.b	@r12,r13
	cmp/eq	r13,r3
	bf	.L0600DFD2
	cmp/eq	r11,r0
	bf	.L0600DFD0
	mov	#-1,r13
	bra	.Lremoved
	mov.b	r13,@r12
	.byte 0x00, 0x00
.L0600DFB8:
	.long snd_weights_cur
.L0600DFBC:
	.long snd_variant_counts_cur
.L0600DFC0:
	.long snd_weights_new
.L0600DFC4:
	.long snd_variant_counts_new
.L0600DFC8:
	.long snd_variant_counts_delta
.L0600DFCC:
	.long snd_tone_variants
.L0600DFD0:
	add	#1,r11
.L0600DFD2:
	dt	r2
	bt	.Lreassign_all
	bra	.Lfind_removed
	add	#1,r12
.Lremoved:
	mov.b	@r10,r0
	add	#-1,r0
	mov.b	r0,@r10
	bra	.Lremove_parts
	add	#1,r14
.Lnext_removal:
	add	#1,r8
	add	#1,r10
	add	#1,r3
	mov	#4,r0
	cmp/ge	r0,r3
	bf	.Lremove_parts
	mov.l	.L0600E01C,r8
	mov	#0,r3
	mov	r7,r9
.Ladd_parts:
	mov.b	@r8,r0
	cmp/pl	r0
	bf	.Lnext_addition
	add	#-1,r0
	mov.b	r0,@r8
	mov	r14,r0
	bsr	math_rand_range
	nop
	mov	r9,r12
	mov	#8,r2
	mov	#0,r11
.Lfind_free:
	mov.b	@r12,r13
	cmp/pz	r13
	bt	.L0600E022
	cmp/eq	r11,r0
	bf	.L0600E020
	bra	.Ladded
	mov.b	r3,@r12
	.byte 0x00, 0x00
.L0600E01C:
	.long snd_variant_counts_delta
.L0600E020:
	add	#1,r11
.L0600E022:
	dt	r2
	bt	.Lreassign_all
	bra	.Lfind_free
	add	#1,r12
.Ladded:
	bra	.Ladd_parts
	add	#-1,r14
.Lnext_addition:
	add	#1,r8
	add	#1,r3
	mov	#4,r0
	cmp/ge	r0,r3
	bf	.Ladd_parts
.Lreroll_done:
	lds.l	@r15+,pr
	rts
	nop
.Lreassign_all:
	mov.l	.L0600E060,r8
	mov.l	.L0600E064,r9
	mov	#0,r6
	mov	#4,r7
.Lfill_variant:
	mov.b	@r9+,r14
	tst	r14,r14
	bt	.L0600E054
.L0600E04C:
	mov.b	r6,@r8
	add	#1,r8
	dt	r14
	bf	.L0600E04C
.L0600E054:
	add	#1,r6
	dt	r7
	bf	.Lfill_variant
	bra	.Lreroll_done
	nop
	.byte 0x00, 0x00
.L0600E060:
	.long snd_tone_variants
.L0600E064:
	.long snd_variant_counts_new
	endlabel snd_reroll_tone_variants

! r0 = a random number from 0 to r0 - 1.
	glabel math_rand_range
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.l	r0,@-r15
	mov.l	.L0600E08C,r0
	jsr	@r0
	nop
	mov	r0,r13
	mov.l	@r15+,r0
	extu.w	r13,r13
	dmuls.l	r13,r0
	sts	macl,r0
	swap.w	r0,r0
	exts.w	r0,r0
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	nop
	.byte 0x00, 0x00
.L0600E08C:
	.long math_rand
	endlabel math_rand_range

! Share r14 out between 4 parts by the byte weights at r8, into the bytes at
! r9, giving the rounding remainder to the largest fractions. Clobbers
! r0, r3, r6, r8, r10-r13.
	glabel math_apportion4
	mov.b	@(0,r8),r0
	mov	r0,r13
	mov.b	@(1,r8),r0
	add	r0,r13
	mov.b	@(2,r8),r0
	add	r0,r13
	mov.b	@(3,r8),r0
	add	r0,r13
	tst	r13,r13
	bf	.L0600E0A6
	mov	#1,r13
.L0600E0A6:
	mov	#4,r3
	mov	#0,r11
	mov.l	.L0600E120,r12
.L0600E0AC:
	mov.b	@r8+,r0
	mulu.w	r0,r14
	sts	macl,r0
	shll16	r0
	mov	#-128,r10
	shll	r10
	mov.l	r13,@(DIVU_DVSR,r10)
	mov.l	r0,@(DIVU_DVDNT,r10)
	mov.l	@(DIVU_QUOT,r10),r0
	mov.l	r0,@r12
	add	#4,r12
	swap.w	r0,r0
	exts.w	r0,r0
	mov.b	r0,@r9
	add	r0,r11
	dt	r3
	bf/s	.L0600E0AC
	add	#1,r9
	add	#-4,r9
	neg	r11,r11
	add	r14,r11
	tst	r11,r11
	bt	.Lapportion_done
.Ldistribute_remainder:
	mov.l	.L0600E120,r12
	mov	#0,r0
	mov.l	@(0,r12),r6
	extu.w	r6,r6
	mov.l	@(4,r12),r8
	extu.w	r8,r8
	cmp/ge	r6,r8
	bf	.L0600E0EE
	mov	r8,r6
	mov	#1,r0
.L0600E0EE:
	mov.l	@(8,r12),r8
	extu.w	r8,r8
	cmp/ge	r6,r8
	bf	.L0600E0FA
	mov	r8,r6
	mov	#2,r0
.L0600E0FA:
	mov.l	@(12,r12),r8
	extu.w	r8,r8
	cmp/ge	r6,r8
	bf	.L0600E106
	mov	r8,r6
	mov	#3,r0
.L0600E106:
	mov.b	@(r0,r9),r10
	add	#1,r10
	mov.b	r10,@(r0,r9)
	shll2	r0
	mov.l	@(r0,r12),r10
	shlr16	r10
	shll16	r10
	mov.l	r10,@(r0,r12)
	dt	r11
	bf	.Ldistribute_remainder
.Lapportion_done:
	rts
	nop
	.byte 0x00, 0x00
.L0600E120:
	.long apportion_remainders
	dlabel snd_variant_counts_new
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel snd_variant_counts_cur
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel snd_variant_counts_delta
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel apportion_remainders
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel snd_tone_bank_table
	.long snd_tone_banks_0
	.long snd_tone_banks_1
	.long snd_tone_banks_2
	.long snd_tone_banks_3
	.long snd_tone_banks_4
	.long snd_tone_banks_5
	dlabel snd_tone_banks_0
	.long	7			! banks, then 4 variant addresses each
	.long	0x00201000, 0x00201548, 0x002019DA, 0x00201FBC
	.long	0x002023B0, 0x00203366, 0x0020410C, 0x00204F66
	.long	0x00205D02, 0x00206782, 0x00207436, 0x0020806E
	.long	0x00208B92, 0x002099DE, 0x0020AB46, 0x0020BE54
	.long	0x0020CFFE, 0x0020D83A, 0x0020E044, 0x0020E8F2
	.long	0x0020F046, 0x0020FC1C, 0x002109CA, 0x002117AE
	.long	0x00212580, 0x00213C10, 0x00214C40, 0x0021613A
	dlabel snd_tone_banks_1
	.long	6			! banks, then 4 variant addresses each
	.long	0x00201000, 0x00201BF6, 0x002021B8, 0x00202F36
	.long	0x00203C72, 0x00205502, 0x00206FDC, 0x00208E0E
	.long	0x0020AE5C, 0x0020BCE6, 0x0020C882, 0x0020D39C
	.long	0x0020E468, 0x0020F38C, 0x002101DC, 0x0021139A
	.long	0x00212112, 0x00214BCC, 0x00216794, 0x00218E8A
	.long	0x0021AA1E, 0x0021D84A, 0x0021F25E, 0x002214FA
	dlabel snd_tone_banks_2
	.long	5			! banks, then 4 variant addresses each
	.long	0x00201000, 0x002012B8, 0x002017DE, 0x00201B78
	.long	0x00202010, 0x002047FC, 0x002069EA, 0x002095D2
	.long	0x0020C4EA, 0x0020CE20, 0x0020D7AC, 0x0020DF5E
	.long	0x0020E84E, 0x0020FE1E, 0x00211026, 0x00212828
	.long	0x00214048, 0x00215B38, 0x00216DCE, 0x00218970
	dlabel snd_tone_banks_3
	.long	6			! banks, then 4 variant addresses each
	.long	0x00201000, 0x00201968, 0x00202078, 0x00202698
	.long	0x00202E76, 0x002049A4, 0x00206712, 0x00209326
	.long	0x0020B4B2, 0x0020C842, 0x0020DB5C, 0x0020F16E
	.long	0x0021050C, 0x00211376, 0x00211DD2, 0x00212E8A
	.long	0x00213E84, 0x002149AE, 0x0021566A, 0x00216290
	.long	0x00216F76, 0x00218E5A, 0x0021A51E, 0x0021C5AE
	dlabel snd_tone_banks_4
	.long	6			! banks, then 4 variant addresses each
	.long	0x00201000, 0x00201688, 0x00201E6E, 0x0020289A
	.long	0x00203030, 0x00203B2E, 0x00204D3E, 0x00205A36
	.long	0x00206A8E, 0x00207774, 0x002089F0, 0x00209840
	.long	0x0020AD84, 0x0020B92A, 0x0020C5EA, 0x0020D0CA
	.long	0x0020E090, 0x0020F4C0, 0x00210B12, 0x00212456
	.long	0x00213D70, 0x002154A0, 0x00216902, 0x0021808E
	dlabel snd_tone_banks_5
	.long	6			! banks, then 4 variant addresses each
	.long	0x00201000, 0x002019C8, 0x0020212C, 0x00202E60
	.long	0x00203906, 0x002054C8, 0x00206E10, 0x00208A1E
	.long	0x0020A31A, 0x0020BD42, 0x0020D64A, 0x0020F06C
	.long	0x00210EA6, 0x00212062, 0x00213CF6, 0x00215BD8
	.long	0x002180A4, 0x002197AC, 0x0021AE12, 0x0021C522
	.long	0x0021E13E, 0x0021E868, 0x0021F280, 0x0021FED8
	endlabel math_apportion4

! Out: r0 = 0 and r3 = a new entry in snd_cmd_ring, or r0 = -1 when the
! ring is full.
	glabel snd_cmd_alloc
	mov.b	@(GBR_SND_RING_RD,gbr),r0
	mov	r0,r3
	mov.b	@(GBR_SND_RING_WR,gbr),r0
	add	#1,r0
	and	#31,r0
	cmp/eq	r0,r3
	bt	.L0600E3D8
	mov.b	r0,@(GBR_SND_RING_WR,gbr)
	add	#-1,r0
	and	#31,r0
	mov.l	.L0600E3D4,r3
	shll2	r0
	shll2	r0
	add	r0,r3
	mov	#0,r0
	rts
	mov.l	r0,@r3
	.byte 0x00, 0x00
.L0600E3D4:
	.long snd_cmd_ring
.L0600E3D8:
	rts
	mov	#-1,r0
	endlabel snd_cmd_alloc

! Move queued commands into free host slots (the code word last, so the
! driver never sees half a command). A slot that should be free but is not
! stops the sound CPU and traps. Clobbers r0, r3-r14.
	glabel snd_cmd_flush
	mov.b	@(GBR_SND_RING_WR,gbr),r0
	mov	r0,r8
	mov.b	@(GBR_SND_RING_RD,gbr),r0
	cmp/eq	r0,r8
	bt	.Lflush_done
	mov	r0,r11
	mov	#8,r12
	mov	#0,r13
	mov.l	.L0600E478,r4
	mov.b	@(GBR_SND_SLOT,gbr),r0
	mov	r0,r10
	shll2	r10
	shll2	r10
	add	r4,r10
	mov.b	@r10,r9
	tst	r9,r9
	bf	.Lflush_done
	add	#1,r13
	add	#1,r0
	and	#7,r0
	add	#-1,r12
.L0600E406:
	mov	r0,r10
	shll2	r10
	shll2	r10
	add	r4,r10
	mov.b	@r10,r9
	tst	r9,r9
	bf	.Lcopy_commands
	add	#1,r13
	add	#1,r0
	dt	r12
	bf/s	.L0600E406
	and	#7,r0
.Lcopy_commands:
	mov.b	@(GBR_SND_SLOT,gbr),r0
	mov	r0,r9
	mov.l	.L0600E47C,r3
	mov	r13,r14
.L0600E426:
	mov.l	.L0600E478,r4
	mov	r9,r0
	shll2	r0
	shll2	r0
	add	r0,r4
	mov	r11,r0
	shll2	r0
	shll2	r0
	add	r3,r0
	mov.b	@r4,r13
	tst	r13,r13
	bf	.Lslot_busy
	mov.l	@r0+,r13
	mov.l	@r0+,r12
	mov.l	r12,@(4,r4)
	mov.l	@r0+,r12
	mov.l	r12,@(8,r4)
	mov.l	@r0+,r12
	mov.l	r12,@(12,r4)
	mov	r13,r0
	mov.w	r0,@(2,r4)
	shlr16	r13
	mov.w	r13,@r4
	mov	r11,r0
	add	#1,r0
	and	#31,r0
	mov	r0,r11
	cmp/eq	r0,r8
	add	#1,r9
	mov	#7,r0
	and	r0,r9
	bt	.Lflush_stop
	dt	r14
	bf	.L0600E426
.Lflush_stop:
	mov	r9,r0
	mov.b	r0,@(GBR_SND_SLOT,gbr)
	mov	r11,r0
	mov.b	r0,@(GBR_SND_RING_RD,gbr)
.Lflush_done:
	rts
	nop
	.byte 0x00, 0x00
.L0600E478:
	.long SCSP_RAM + 0x700
.L0600E47C:
	.long snd_cmd_ring
.Lslot_busy:
	sts.l	pr,@-r15
	mov.l	.L0600E4BC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	trapa	#1
	nop
	endlabel snd_cmd_flush

! Queue the CD audio level and pan. Hangs if the ring is full.
	glabel snd_init_cdda_mix
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.Lring_full
	mov	#SNDC_CDDA_LEVEL,r0
	mov.b	r0,@r3
	mov	#-64,r0
	mov.b	r0,@(SNDCMD_P1,r3)
	mov.b	r0,@(SNDCMD_P2,r3)
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.Lring_full
	mov	#SNDC_CDDA_PAN,r0
	mov.b	r0,@r3
	mov	#31,r0
	mov.b	r0,@(SNDCMD_P1,r3)
	mov	#15,r0
	mov.b	r0,@(SNDCMD_P2,r3)
	lds.l	@r15+,pr
	rts
	nop
.L0600E4BC:
	.long smpc_sndoff
.Lring_full:
	bra	.Lring_full
	nop
	endlabel snd_init_cdda_mix

! Start sequence r6 of bank r5 on control r4 (not while GBR_DEMO_MODE < 0).
! Preserves all registers.
	glabel snd_seq_start
	mov.l	r0,@-r15
	mov.b	@(GBR_DEMO_MODE,gbr),r0
	cmp/pz	r0
	bf	.L0600E4F2
	mov.l	r3,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E4EE
	mov	#SNDC_SEQ_START,r0
	mov.b	r0,@r3
	add	#2,r3
	mov.b	r4,@r3
	add	#1,r3
	mov.b	r5,@r3
	add	#1,r3
	mov.b	r6,@r3
	add	#1,r3
	mov	#0,r0
	mov.b	r0,@r3
.L0600E4EE:
	lds.l	@r15+,pr
	mov.l	@r15+,r3
.L0600E4F2:
	rts
	mov.l	@r15+,r0
	endlabel snd_seq_start

! Stop control r4.
	glabel snd_seq_stop
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E50C
	mov	#SNDC_SEQ_STOP,r0
	mov.b	r0,@r3
	mov	r4,r0
	mov.b	r0,@(SNDCMD_P1,r3)
.L0600E50C:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_seq_stop

! Pause control r4.
	glabel snd_seq_pause
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E52C
	mov	#SNDC_SEQ_PAUSE,r0
	mov.b	r0,@r3
	mov	r4,r0
	mov.b	r0,@(SNDCMD_P1,r3)
.L0600E52C:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_seq_pause

! Pause controls 7 to 0.
	glabel snd_seq_pause_all
	mov.l	r7,@-r15
	sts.l	pr,@-r15
	mov	#8,r7
.L0600E53C:
	mov	r7,r4
	bsr	snd_seq_pause
	add	#-1,r4
	dt	r7
	bf	.L0600E53C
	lds.l	@r15+,pr
	mov.l	@r15+,r7
	rts
	nop
	endlabel snd_seq_pause_all

! Continue control r4.
	glabel snd_seq_continue
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E564
	mov	#SNDC_SEQ_CONTINUE,r0
	mov.b	r0,@r3
	mov	r4,r0
	mov.b	r0,@(SNDCMD_P1,r3)
.L0600E564:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_seq_continue

! Continue controls 7 to 0.
	glabel snd_seq_continue_all
	mov.l	r7,@-r15
	sts.l	pr,@-r15
	mov	#8,r7
.L0600E574:
	mov	r7,r4
	bsr	snd_seq_continue
	add	#-1,r4
	dt	r7
	bf	.L0600E574
	lds.l	@r15+,pr
	mov.l	@r15+,r7
	rts
	nop
	endlabel snd_seq_continue_all

! Stop every sequence.
	glabel snd_seq_stop_all
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E598
	mov	#SNDC_SEQ_STOP_ALL,r0
	mov.b	r0,@r3
.L0600E598:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_seq_stop_all

! Switch to sound map r4.
	glabel snd_map_change
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E5B8
	mov	#SNDC_MAP_CHANGE,r0
	mov.b	r0,@r3
	mov	r4,r0
	mov.b	r0,@(SNDCMD_P1,r3)
.L0600E5B8:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_map_change

! Switch to effect bank r4.
	glabel snd_effect_change
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E5D8
	mov	#SNDC_EFFECT_CHANGE,r0
	mov.b	r0,@r3
	mov	r4,r0
	mov.b	r0,@(SNDCMD_P1,r3)
.L0600E5D8:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_effect_change

! Switch to mixer r5 of bank r4.
	glabel snd_mixer_change
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E5FC
	mov	#SNDC_MIXER_CHANGE,r0
	mov.b	r0,@r3
	mov	r4,r0
	mov.b	r0,@(SNDCMD_P1,r3)
	mov	r5,r0
	mov.b	r0,@(SNDCMD_P2,r3)
.L0600E5FC:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_mixer_change

! Fade control r4 to volume r5 at rate r6.
	glabel snd_seq_volume
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E624
	mov	#SNDC_SEQ_VOLUME,r0
	mov.b	r0,@r3
	add	#2,r3
	mov.b	r4,@r3
	add	#1,r3
	mov.b	r5,@r3
	add	#1,r3
	mov.b	r6,@r3
.L0600E624:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_seq_volume

! Set the level offset of control r4 to r5 (signed).
	glabel snd_seq_level
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E648
	mov	#SNDC_SEQ_LEVEL,r0
	mov.b	r0,@r3
	add	#2,r3
	mov.b	r4,@r3
	add	#1,r3
	mov.b	r5,@r3
.L0600E648:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_seq_level

! Set the volume snd_voice_mgr_task keeps sending for control r4 to r5.
	glabel snd_set_ctrl_volume
	mov.l	.L0600E65C,r2
	mov	r4,r0
	mov.b	r5,@(r0,r2)
	rts
	nop
.L0600E65C:
	.long snd_ctrl_volume
	endlabel snd_set_ctrl_volume

! Fade the music (control 0) out.
	glabel snd_bgm_fade_out
	sts.l	pr,@-r15
	mov	#0,r4
	mov	#1,r5
	mov.l	.L0600E674,r0
	jsr	@r0
	mov	#16,r6
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0600E674:
	.long snd_seq_volume
	endlabel snd_bgm_fade_out

! Spawn snd_level_fadeout_task.
	glabel snd_spawn_level_fadeout
	sts.l	pr,@-r15
	mov.l	.L0600E68C,r2
	mov.l	.L0600E690,r0
	jsr	@r0
	nop
	mov.l	.L0600E694,r0
	mov.l	r0,@(NODE_HANDLER,r3)
	lds.l	@r15+,pr
	rts
	nop
.L0600E68C:
	.long obj_list_effect
.L0600E690:
	.long obj_alloc
.L0600E694:
	.long snd_level_fadeout_task
	endlabel snd_spawn_level_fadeout

! Fade the music level down to -127 over 64 frames. Frees itself at the end.
	glabel snd_level_fadeout_task
	sts.l	pr,@-r15
	mov.w	@(FADE_LEVEL,r1),r0
	add	#2,r0
	mov.w	r0,@(FADE_LEVEL,r1)
	mov	#127,r5
	cmp/ge	r5,r0
	bf	.L0600E6B2
	mov	r5,r0
	mov.l	r0,@-r15
	mov.l	.L0600E6C4,r0
	jsr	@r0
	nop
	mov.l	@r15+,r0
.L0600E6B2:
	mov	#0,r5
	mov	#0,r4
	sub	r0,r5
	mov.l	.L0600E6C8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0600E6C4:
	.long obj_free
.L0600E6C8:
	.long snd_seq_level
	endlabel snd_level_fadeout_task

! Fade the music (control 0) in.
	glabel snd_bgm_fade_in
	sts.l	pr,@-r15
	mov	#0,r4
	mov	#127,r5
	mov.l	.L0600E6E0,r0
	jsr	@r0
	mov	#16,r6
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0600E6E0:
	.long snd_seq_volume
	endlabel snd_bgm_fade_in

! Spawn snd_level_fadein_task.
	glabel snd_spawn_level_fadein
	sts.l	pr,@-r15
	mov.l	.L0600E6F8,r2
	mov.l	.L0600E6FC,r0
	jsr	@r0
	nop
	mov.l	.L0600E700,r0
	mov.l	r0,@(NODE_HANDLER,r3)
	lds.l	@r15+,pr
	rts
	nop
.L0600E6F8:
	.long obj_list_effect
.L0600E6FC:
	.long obj_alloc
.L0600E700:
	.long snd_level_fadein_task
	endlabel snd_spawn_level_fadein

! Fade the music level up from -127 over 64 frames. Frees itself at the end.
	glabel snd_level_fadein_task
	sts.l	pr,@-r15
	mov.w	@(FADE_LEVEL,r1),r0
	add	#2,r0
	mov.w	r0,@(FADE_LEVEL,r1)
	mov	#127,r5
	cmp/ge	r5,r0
	bf	.L0600E71E
	mov	r5,r0
	mov.l	r0,@-r15
	mov.l	.L0600E730,r0
	jsr	@r0
	nop
	mov.l	@r15+,r0
.L0600E71E:
	mov	#-127,r5
	mov	#0,r4
	add	r0,r5
	mov.l	.L0600E734,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0600E730:
	.long obj_free
.L0600E734:
	.long snd_seq_level
	endlabel snd_level_fadein_task

! Turn the music (control 0) down to 96.
	glabel snd_bgm_duck
	sts.l	pr,@-r15
	mov	#0,r4
	mov	#96,r5
	mov.l	.L0600E74C,r0
	jsr	@r0
	mov	#16,r6
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0600E74C:
	.long snd_seq_volume
	endlabel snd_bgm_duck

! Spawn snd_level_dip_task.
	glabel snd_spawn_level_dip
	sts.l	pr,@-r15
	mov.l	.L0600E764,r2
	mov.l	.L0600E768,r0
	jsr	@r0
	nop
	mov.l	.L0600E76C,r0
	mov.l	r0,@(NODE_HANDLER,r3)
	lds.l	@r15+,pr
	rts
	nop
.L0600E764:
	.long obj_list_effect
.L0600E768:
	.long obj_alloc
.L0600E76C:
	.long snd_level_dip_task
	endlabel snd_spawn_level_dip

! Lower the music level by 15 over 15 frames. Frees itself at the end.
	glabel snd_level_dip_task
	sts.l	pr,@-r15
	mov.w	@(FADE_LEVEL,r1),r0
	add	#1,r0
	mov.w	r0,@(FADE_LEVEL,r1)
	mov	#15,r5
	cmp/ge	r5,r0
	bf	.L0600E78A
	mov	r5,r0
	mov.l	r0,@-r15
	mov.l	.L0600E79C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r0
.L0600E78A:
	mov	#0,r5
	mov	#0,r4
	sub	r0,r5
	mov.l	.L0600E7A0,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0600E79C:
	.long obj_free
.L0600E7A0:
	.long snd_seq_level
	endlabel snd_level_dip_task

! Turn the music (control 0) back up to 127.
	glabel snd_bgm_unduck
	sts.l	pr,@-r15
	mov	#0,r4
	mov	#127,r5
	mov.l	.L0600E7B8,r0
	jsr	@r0
	mov	#16,r6
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0600E7B8:
	.long snd_seq_volume
	endlabel snd_bgm_unduck

! Spawn snd_level_undip_task.
	glabel snd_spawn_level_undip
	sts.l	pr,@-r15
	mov.l	.L0600E7D0,r2
	mov.l	.L0600E7D4,r0
	jsr	@r0
	nop
	mov.l	.L0600E7D8,r0
	mov.l	r0,@(NODE_HANDLER,r3)
	lds.l	@r15+,pr
	rts
	nop
.L0600E7D0:
	.long obj_list_effect
.L0600E7D4:
	.long obj_alloc
.L0600E7D8:
	.long snd_level_undip_task
	endlabel snd_spawn_level_undip

! Raise the music level by 15 over 15 frames. Frees itself at the end.
	glabel snd_level_undip_task
	sts.l	pr,@-r15
	mov.w	@(FADE_LEVEL,r1),r0
	add	#1,r0
	mov.w	r0,@(FADE_LEVEL,r1)
	mov	#15,r5
	cmp/ge	r5,r0
	bf	.L0600E7F6
	mov	r5,r0
	mov.l	r0,@-r15
	mov.l	.L0600E808,r0
	jsr	@r0
	nop
	mov.l	@r15+,r0
.L0600E7F6:
	mov	#-15,r5
	mov	#0,r4
	add	r0,r5
	mov.l	.L0600E80C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0600E808:
	.long obj_free
.L0600E80C:
	.long snd_seq_level
	endlabel snd_level_undip_task

! Set the pan of positional channel r4 (0-3) to r5 (0-31).
	glabel snd_set_chan_pan
	mov.l	.L0600E81C,r2
	mov	r4,r0
	mov.b	r5,@(r0,r2)
	rts
	nop
	.byte 0x00, 0x00
.L0600E81C:
	.long snd_pan
	endlabel snd_set_chan_pan

! Unused: send command 0x16 with control r4 and the word r5.
	glabel snd_cmd16
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E83A
	mov	#SNDC_CMD16,r0
	mov.b	r0,@r3
	add	#2,r3
	mov.b	r4,@r3
	add	#2,r3
	mov.w	r5,@r3
.L0600E83A:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_cmd16

! Transpose control r4 by r5 semitones.
	glabel snd_seq_transpose
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E85E
	mov	#SNDC_SEQ_TRANSPOSE,r0
	mov.b	r0,@r3
	add	#2,r3
	mov.b	r4,@r3
	add	#1,r3
	mov.b	r5,@r3
.L0600E85E:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_seq_transpose

! Pan control r4 to r5.
	glabel snd_seq_pan
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E886
	mov	#SNDC_SEQ_PAN,r0
	mov.b	r0,@r3
	add	#2,r3
	mov.b	r4,@r3
	add	#1,r3
	mov	#-128,r0
	or	r0,r5
	mov.b	r5,@r3
.L0600E886:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_seq_pan

! First frame of the sound voice manager: clear the voices, pans and
! volumes.
	glabel snd_voice_mgr_init
	mov	#0,r0
	mov.l	.L0600E8C0,r2
	mov	#8,r7
.L0600E896:
	mov.l	r0,@r2
	mov.l	r0,@(4,r2)
	dt	r7
	bf/s	.L0600E896
	add	#8,r2
	mov.l	.L0600E8C4,r2
	mov.l	r0,@r2
	mov.l	r0,@(4,r2)
	mov.l	r0,@(8,r2)
	mov.l	r0,@(12,r2)
	mov.l	.L0600E8C8,r2
	mov.l	r0,@r2
	mov.l	r0,@(4,r2)
	mov.l	r0,@(8,r2)
	mov.l	r0,@(12,r2)
	mov.l	.L0600E8CC,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
	.byte 0x00, 0x00
.L0600E8C0:
	.long snd_voices
.L0600E8C4:
	.long snd_pan
.L0600E8C8:
	.long snd_ctrl_volume
.L0600E8CC:
	.long snd_voice_mgr_task
	endlabel snd_voice_mgr_init

! Each frame: time out the voices, send the channel pans when they changed,
! and resend the volume of control (frame & 7) and of every control marked
! unsent (-1).
	glabel snd_voice_mgr_task
	sts.l	pr,@-r15
	mov.l	.L0600E95C,r2
	mov	#8,r7
.Ltick_voice:
	mov.w	@r2,r0
	cmp/pl	r0
	bf	.Lnext_voice
	add	#-1,r0
	mov.w	r0,@r2
	tst	r0,r0
	bf	.Lnext_voice
	mov	#0,r0
	mov.w	r0,@(VOICE_PRIORITY,r2)
	mov.l	r0,@(VOICE_OWNER,r2)
.Lnext_voice:
	dt	r7
	bf/s	.Ltick_voice
	add	#8,r2
	mov.l	.L0600E960,r2
	mov.l	@r2,r0
	mov.l	@(SND_PAN_SENT,r2),r8
	cmp/eq	r0,r8
	bt	.Lrefresh_volumes
	mov.l	r0,@(SND_PAN_SENT,r2)
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.Lrefresh_volumes
	mov	#SNDC_CHAN_PAN,r0
	mov.b	r0,@r3
	add	#2,r3
	mov	#-128,r8
	mov.b	@r2+,r0
	or	r8,r0
	mov.b	r0,@r3
	mov.b	@r2+,r0
	or	r8,r0
	mov.b	r0,@(1,r3)
	mov.b	@r2+,r0
	or	r8,r0
	mov.b	r0,@(2,r3)
	mov.b	@r2+,r0
	or	r8,r0
	mov.b	r0,@(3,r3)
.Lrefresh_volumes:
	mov.l	.L0600E964,r2
	mov.l	@(GBR_TICK_COUNT,gbr),r0
	and	#7,r0
	mov	r0,r9
	mov	#7,r7
	add	#7,r2
.Lnext_ctrl:
	mov.b	@r2,r8
	mov.b	@(SND_VOLUME_SENT,r2),r0
	cmp/pz	r0
	bf	.L0600E940
	cmp/eq	r7,r9
	bf	.Lskip_ctrl
	cmp/eq	r0,r8
	bt	.Lskip_ctrl
.L0600E940:
	mov	r8,r0
	mov.b	r0,@(SND_VOLUME_SENT,r2)
	mov	r7,r4
	mov	#-128,r5
	add	r0,r5
	bsr	snd_seq_level
	nop
.Lskip_ctrl:
	add	#-1,r2
	add	#-1,r7
	cmp/pz	r7
	bt	.Lnext_ctrl
	lds.l	@r15+,pr
	rts
	nop
.L0600E95C:
	.long snd_voices
.L0600E960:
	.long snd_pan
.L0600E964:
	.long snd_ctrl_volume
	endlabel snd_voice_mgr_task

! Play sequence r6 of bank r5 on control r4 for object r1 in voice r8 for
! r9 frames at volume/priority r10, unless the voice is busy with a higher
! priority. Voices 0-3 are panned by the angle from the camera.
! Out: r0 = 0, or -1 when refused.
	glabel snd_play_positional
	mov.b	@(GBR_DEMO_MODE,gbr),r0
	cmp/pz	r0
	bt	.L0600E972
	rts
	nop
.L0600E972:
	sts.l	pr,@-r15
	mov.l	.L0600EA00,r2
	mov	r8,r0
	shll2	r0
	shll	r0
	add	r0,r2
	mov.w	@r2,r0
	cmp/eq	#0,r0
	bt	.L0600E992
	mov.l	@(VOICE_OWNER,r2),r3
	cmp/eq	r3,r1
	bt	.Lset_voice
	mov.b	@(VOICE_PRIORITY,r2),r0
	extu.b	r0,r0
	cmp/gt	r0,r10
	bf	.Lplay_refused
.L0600E992:
	mov.w	r9,@r2
	mov.l	r1,@(VOICE_OWNER,r2)
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.Lplay_refused
	mov	#SNDC_SEQ_START,r0
	mov.b	r0,@r3
	add	#2,r3
	mov.b	r4,@r3
	add	#1,r3
	mov.b	r5,@r3
	add	#1,r3
	mov.b	r6,@r3
	mov.l	.L0600EA04,r3
	mov	r4,r0
	mov	#-1,r5
	mov.b	r5,@(r0,r3)
.Lset_voice:
	mov	r10,r0
	mov.b	r0,@(VOICE_PRIORITY,r2)
	mov	r4,r0
	mov.b	r0,@(VOICE_CTRL,r2)
	mov	r10,r5
	bsr	snd_set_ctrl_volume
	nop
	mov	#4,r0
	cmp/ge	r0,r8
	bt	.Lplay_ok
	mov	r8,r4
	mov.l	@(OBJ_X,r1),r2
	mov.l	@(OBJ_Z,r1),r3
	mov.l	@(GBR_CAM_X,gbr),r0
	sub	r0,r2
	mov.l	@(GBR_CAM_Z,gbr),r0
	sub	r0,r3
	mov.l	.L0600EA08,r0
	jsr	@r0
	neg	r2,r2
	mov	r0,r8
	mov.w	@(GBR_CAM_YAW,gbr),r0
	sub	r0,r8
	exts.w	r8,r0
	mov.w	.L0600E9FC,r8
	cmp/ge	r8,r0
	bf	.L0600EA10
	cmp/pz	r0
	bf	.L0600EA0C
	mov.w	.L0600E9FE,r8
	mulu.w	r8,r0
	sts	macl,r0
	swap.w	r0,r0
	bra	.Lset_pan
	exts.w	r0,r5
.L0600E9FC:
	.short 0xC000
.L0600E9FE:
	.short 0x003E
.L0600EA00:
	.long snd_voices
.L0600EA04:
	.long snd_ctrl_volume_sent
.L0600EA08:
	.long math_atan2
.L0600EA0C:
	bra	.Lset_pan
	mov	#0,r5
.L0600EA10:
	mov	#30,r5
.Lset_pan:
	bsr	snd_set_chan_pan
	nop
.Lplay_ok:
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.Lplay_refused:
	lds.l	@r15+,pr
	rts
	mov	#-1,r0
	endlabel snd_play_positional

! r10 = r12 minus the distance from object r1 to the player beyond r11, /8.
! Out: T = 1 when the player is r11 + 0x400 away or more. Clobbers r4-r8.
	glabel snd_calc_distance_volume
	mov.l	.L0600EA78,r7
	mov.l	@r7,r7
	mov.l	@(OBJ_X,r1),r4
	mov.l	@(OBJ_X,r7),r0
	sub	r0,r4
	mov.l	@(OBJ_Y,r1),r5
	mov.l	@(OBJ_Y,r7),r0
	sub	r0,r5
	mov.l	@(OBJ_Z,r1),r6
	mov.l	@(OBJ_Z,r7),r0
	sub	r0,r6
	swap.w	r4,r4
	swap.w	r5,r5
	swap.w	r6,r6
	exts.w	r4,r4
	exts.w	r5,r5
	exts.w	r6,r6
	sts.l	pr,@-r15
	mov.l	.L0600EA7C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.w	.L0600EA74,r8
	add	r11,r8
	cmp/ge	r8,r0
	bt	.L0600EA80
	sub	r11,r0
	cmp/pz	r0
	bt	.L0600EA5E
	mov	#0,r0
.L0600EA5E:
	shlr	r0
	shlr	r0
	shlr	r0
	mov	r12,r10
	sub	r0,r10
	cmp/pz	r10
	bt	.L0600EA6E
	mov	#0,r10
.L0600EA6E:
	clrt
	rts
	nop
.L0600EA74:
	.short 0x0400
	.byte 0x00, 0x00
.L0600EA78:
	.long player_obj
.L0600EA7C:
	.long math_length3d
.L0600EA80:
	sett
	rts
	nop
	endlabel snd_calc_distance_volume

! Stop control r4 if voice r8 belongs to object r1.
	glabel snd_stop_positional
	sts.l	pr,@-r15
	mov.l	.L0600EAA8,r2
	mov	r8,r0
	shll2	r0
	shll	r0
	add	r0,r2
	mov.l	@(VOICE_OWNER,r2),r3
	cmp/eq	r3,r1
	bf	.L0600EAA2
	mov	#0,r0
	mov.l	r0,@(VOICE_TIMER,r2)
	mov.l	r0,@(VOICE_OWNER,r2)
	bsr	snd_seq_stop
	nop
.L0600EAA2:
	lds.l	@r15+,pr
	rts
	nop
.L0600EAA8:
	.long snd_voices
	endlabel snd_stop_positional

! Unused: send a MIDI message (P1-P4 = r4-r7).
	glabel snd_midi_direct
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600EACE
	mov	#SNDC_MIDI_DIRECT,r0
	mov.b	r0,@r3
	add	#2,r3
	mov.b	r4,@r3
	add	#1,r3
	mov.b	r5,@r3
	add	#1,r3
	mov.b	r6,@r3
	add	#1,r3
	mov.b	r7,@r3
.L0600EACE:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_midi_direct

! Open the sound test (with debug flag 3) or the sound info screen, which
! also shows the stage's tone variants.
	glabel dbg_sound_test_init
	sts.l	pr,@-r15
	mov.w	@(GBR_DEBUG_FLAGS,gbr),r0
	tst	#8,r0
	bf	.Lsound_test
	bra	.Lsound_info
	nop
.Lsound_test:
	mov.l	.L0600EB48,r2
	mov.l	.L0600EB4C,r0
	jsr	@r0
	nop
	mov.l	.L0600EB50,r2
	mov.l	.L0600EB4C,r0
	jsr	@r0
	nop
	mov	#-1,r0
	mov.b	r0,@(GBR_FREEZE,gbr)
	mov	#0,r0
	mov.b	r0,@(SNDTEST_BANK,r1)
	mov.b	r0,@(SNDTEST_SONG,r1)
	mov.b	r0,@(SNDTEST_REPEAT,r1)
	mov	#15,r0
	mov.b	r0,@(SNDTEST_PAN,r1)
	mov.l	.L0600EB54,r7
	mov.l	.L0600EB58,r2
	mov.b	@(GBR_STAGE,gbr),r0
	tst	#1,r0
	bf	.Lstart_test
	mov	#12,r8
	cmp/ge	r8,r0
	bt	.Lstart_test
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	@r2,r14
	mov	#18,r4
	mov	#16,r5
.L0600EB20:
	mov.b	@r7+,r0
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r14,@-r15
	mov.l	.L0600EB5C,r14
	jsr	@r14
	nop
	mov.l	@r15+,r14
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	add	#1,r4
	dt	r14
	bf	.L0600EB20
.Lstart_test:
	mov.l	.L0600EB60,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0600EB48:
	.long str_sound_test_clear
.L0600EB4C:
	.long txt_print_at
.L0600EB50:
	.long str_sound_test
.L0600EB54:
	.long snd_tone_variants
.L0600EB58:
	.long snd_tone_bank_table
.L0600EB5C:
	.long func_0601CA2E
.L0600EB60:
	.long dbg_sound_test_task
.Lsound_info:
	mov.b	@(GBR_STAGE,gbr),r0
	tst	#1,r0
	bf	.Lstart_info
	mov	#12,r8
	cmp/ge	r8,r0
	bt	.Lstart_info
	mov.l	.L0600EBBC,r2
	mov.l	.L0600EBC0,r0
	jsr	@r0
	nop
	mov.l	.L0600EBC4,r2
	mov.l	.L0600EBC0,r0
	jsr	@r0
	nop
	mov.l	.L0600EBC8,r7
	mov.l	.L0600EBCC,r2
	mov.b	@(GBR_STAGE,gbr),r0
	tst	#1,r0
	bf	.Lstart_info
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	@r2,r14
	mov	#18,r4
	mov	#24,r5
.L0600EB96:
	mov.b	@r7+,r0
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r14,@-r15
	mov.l	.L0600EBD0,r14
	jsr	@r14
	nop
	mov.l	@r15+,r14
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	add	#1,r4
	dt	r14
	bf	.L0600EB96
.Lstart_info:
	mov.l	.L0600EBD4,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L0600EBBC:
	.long str_dss_info_clear
.L0600EBC0:
	.long txt_print_at
.L0600EBC4:
	.long str_dss_info
.L0600EBC8:
	.long snd_tone_variants
.L0600EBCC:
	.long snd_tone_bank_table
.L0600EBD0:
	.long func_0601CA2E
.L0600EBD4:
	.long dbg_sound_info_task
	dlabel str_sound_test
	.short	15, 12
	.ascii	"< SOUND TEST >"
	.byte	0xFF, 0x09
	.ascii	"              "
	.byte	0xFF, 0x09
	.ascii	"      :       "
	.byte	0xFF, 0x09
	.ascii	" < DSS INFO > "
	.byte	0xFF, 0x09
	.ascii	"   ********   "
	.byte	0xFE, 0x09
	dlabel str_sound_test_clear
	.short	15, 12
	.ascii	"              "
	.byte	0xFF, 0x09
	.ascii	"              "
	.byte	0xFF, 0x09
	.ascii	"              "
	.byte	0xFF, 0x09
	.ascii	"              "
	.byte	0xFF, 0x09
	.ascii	"              "
	.byte	0xFE, 0x09
	dlabel str_dss_info
	.short	15, 23
	.ascii	" < DSS INFO > "
	.byte	0xFF, 0x09
	.ascii	"   ********   "
	.byte	0xFE, 0x09
	dlabel str_dss_info_clear
	.short	15, 23
	.ascii	"              "
	.byte	0xFF, 0x09
	.ascii	"              "
	.byte	0xFE, 0x09
	endlabel dbg_sound_test_init

! Close the sound info screen on a button press.
	glabel dbg_sound_info_task
	mov.b	@(GBR_PAD1_TRIG+1,gbr),r0
	cmp/pz	r0
	bt	.L0600ECEC
	sts.l	pr,@-r15
	mov.l	.L0600ECE0,r2
	mov.l	.L0600ECE4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L0600ECE8,r0
	jmp	@r0
	nop
.L0600ECE0:
	.long str_dss_info_clear
.L0600ECE4:
	.long txt_print_at
.L0600ECE8:
	.long obj_free
.L0600ECEC:
	rts
	nop
	endlabel dbg_sound_info_task

! Sound test: the pad picks the bank, song and pan, and starts or stops
! sequences on control 1.
	glabel dbg_sound_test_task
	sts.l	pr,@-r15
	mov.b	@(GBR_PAD1_TRIG+1,gbr),r0
	cmp/pz	r0
	bt	.L0600ED1C
	mov	#0,r0
	mov.b	r0,@(GBR_FREEZE,gbr)
	mov	#0,r0
	mov.w	r0,@(GBR_PAUSED,gbr)
	mov.l	.L0600ED10,r2
	mov.l	.L0600ED14,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L0600ED18,r0
	jmp	@r0
	nop
.L0600ED10:
	.long str_sound_test_clear
.L0600ED14:
	.long txt_print_at
.L0600ED18:
	.long obj_free
.L0600ED1C:
	mov.b	@(SNDTEST_BANK,r1),r0
	mov	r0,r4
	mov.w	@(GBR_PAD1_TRIG,gbr),r0
	tst	#4,r0
	bt	.Lbank_up
	add	#-1,r4
	cmp/pz	r4
	bt	.Lbank_up
	mov	#15,r4
.Lbank_up:
	tst	#8,r0
	bt	.Lstore_bank
	add	#1,r4
	mov	#15,r8
	cmp/gt	r8,r4
	bf	.Lstore_bank
	mov	#0,r4
.Lstore_bank:
	mov	r4,r0
	mov.b	r0,@(SNDTEST_BANK,r1)
	mov	#0,r4
	mov.w	@(GBR_PAD1_TRIG,gbr),r0
	tst	#1,r0
	bt	.L0600ED50
	mov	#15,r0
	mov.b	r0,@(SNDTEST_REPEAT,r1)
	bra	.Lstep_song
	mov	#-1,r4
.L0600ED50:
	tst	#2,r0
	bt	.L0600ED5C
	mov	#15,r0
	mov.b	r0,@(SNDTEST_REPEAT,r1)
	bra	.Lstep_song
	mov	#1,r4
.L0600ED5C:
	mov.b	@(SNDTEST_REPEAT,r1),r0
	mov	r0,r8
	mov	#0,r4
	mov.w	@(GBR_PAD1_HELD,gbr),r0
	tst	#1,r0
	bt	.L0600ED6A
	mov	#-1,r4
.L0600ED6A:
	tst	#2,r0
	bt	.L0600ED70
	mov	#1,r4
.L0600ED70:
	tst	r4,r4
	bt	.Lhandle_buttons
	add	#-1,r8
	cmp/pz	r8
	bf	.L0600ED80
	mov	r8,r0
	bra	.Lhandle_buttons
	mov.b	r0,@(SNDTEST_REPEAT,r1)
.L0600ED80:
	mov	#4,r0
	mov.b	r0,@(SNDTEST_REPEAT,r1)
.Lstep_song:
	mov.b	@(SNDTEST_SONG,r1),r0
	add	r4,r0
	and	#127,r0
	mov.b	r0,@(SNDTEST_SONG,r1)
.Lhandle_buttons:
	mov.w	@(GBR_PAD1_TRIG,gbr),r0
	tst	#64,r0
	bt	.L0600EDA2
	mov	#1,r4
	mov.b	@(SNDTEST_BANK,r1),r0
	mov	r0,r5
	mov.b	@(SNDTEST_SONG,r1),r0
	mov	r0,r6
	mov.l	.L0600EE38,r0
	jsr	@r0
	nop
.L0600EDA2:
	mov.w	@(GBR_PAD1_TRIG,gbr),r0
	tst	#16,r0
	bt	.L0600EDB0
	mov	#1,r4
	mov.l	.L0600EE3C,r0
	jsr	@r0
	nop
.L0600EDB0:
	mov.w	@(GBR_PAD1_TRIG,gbr),r0
	tst	#32,r0
	bt	.L0600EDBC
	mov.l	.L0600EE40,r0
	jsr	@r0
	nop
.L0600EDBC:
	mov.b	@(GBR_PAD1_TRIG,gbr),r0
	tst	#16,r0
	bt	.L0600EDE4
	mov.b	@(SNDTEST_PAN,r1),r0
	add	#-1,r0
	and	#31,r0
	mov.b	r0,@(SNDTEST_PAN,r1)
	mov	r0,r5
	mov	#0,r4
	bsr	snd_set_chan_pan
	nop
	mov	#1,r4
	bsr	snd_set_chan_pan
	nop
	mov	#2,r4
	bsr	snd_set_chan_pan
	nop
	mov	#3,r4
	bsr	snd_set_chan_pan
	nop
.L0600EDE4:
	mov.b	@(GBR_PAD1_TRIG,gbr),r0
	tst	#8,r0
	bt	.L0600EE0C
	mov.b	@(SNDTEST_PAN,r1),r0
	add	#1,r0
	and	#31,r0
	mov.b	r0,@(SNDTEST_PAN,r1)
	mov	r0,r5
	mov	#0,r4
	bsr	snd_set_chan_pan
	nop
	mov	#1,r4
	bsr	snd_set_chan_pan
	nop
	mov	#2,r4
	bsr	snd_set_chan_pan
	nop
	mov	#3,r4
	bsr	snd_set_chan_pan
	nop
.L0600EE0C:
	mov.b	@(SNDTEST_BANK,r1),r0
	mov	#19,r4
	mov	#14,r5
	mov.l	.L0600EE44,r14
	jsr	@r14
	nop
	mov.b	@(SNDTEST_SONG,r1),r0
	mov	#24,r4
	mov	#14,r5
	mov.l	.L0600EE44,r14
	jsr	@r14
	nop
	mov.b	@(SNDTEST_PAN,r1),r0
	mov	#22,r4
	mov	#13,r5
	mov.l	.L0600EE44,r14
	jsr	@r14
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0600EE38:
	.long snd_seq_start
.L0600EE3C:
	.long snd_seq_stop
.L0600EE40:
	.long snd_seq_stop_all
.L0600EE44:
	.long func_0601CA58
	endlabel dbg_sound_test_task
