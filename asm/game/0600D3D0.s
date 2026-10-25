	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0600D3D0,"ax",@progbits
	.p2align 2

	glabel vdp_init_palette_gouraud
	mov.l	.L0600D3FC,r3
	mova	.L0600D5F8,r0
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

	glabel vdp2_cram_upload
	mov.l	.L0600D49C,r3
	mov.l	.L0600D4A0,r4
	mov.w	.L0600D498,r5
	mov.w	@(238,gbr),r0
	shlr8	r0
	tst	#16,r0
	bf	.L0600D470
	shlr	r5
.L0600D470:
	mov.l	.L0600D4A4,r7
	mov.l	@r7,r7
	mov.l	.L0600D4A8,r6
	tst	r6,r7
	bf	.L0600D470
	mov.l	.L0600D4AC,r7
	mov	r4,r6
	mov.l	r6,@(4,r7)
	mov	r3,r6
	mov.l	r6,@r7
	mov	r5,r6
	mov.l	r6,@(8,r7)
	mov.w	.L0600D49A,r6
	mov.l	r6,@(12,r7)
	mov	#7,r6
	mov.l	r6,@(20,r7)
	mov.w	.L0600D49A,r6
	mov.l	r6,@(16,r7)
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
.L0600D542:
	mov.w	@(146,gbr),r0
	mov	r0,r8
	mov.w	@(144,gbr),r0
	mov	r0,r9
	mov.w	@(142,gbr),r0
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
	bf	.L0600D542
	mov.l	@r15+,r1
	rts
	nop
.L0600D5F0:
	.short 0xFF20
	.byte 0x00, 0x00
.L0600D5F4:
	.long VDP1_VRAM
.L0600D5F8:
	.byte 0x80, 0x00, 0xFF, 0xFF, 0xA0, 0x00, 0xEE, 0x52, 0xFE, 0x94, 0xFF, 0xFF, 0x80, 0x00, 0x80, 0x00
	.byte 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x80, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFB, 0xDE, 0x80, 0x00, 0x83, 0x7F, 0x82, 0x5F, 0x81, 0x3F, 0x80, 0x1F, 0xFE, 0xCC
	.byte 0xFD, 0xE8, 0xFF, 0xFF, 0xFC, 0x00, 0x82, 0x40, 0x81, 0x60, 0xFF, 0xFF, 0x89, 0x54, 0xA2, 0x79
	.byte 0xFF, 0xFF, 0xF8, 0x00, 0xF0, 0x00, 0xE8, 0x00, 0xE0, 0x00, 0xD8, 0x00, 0xD0, 0x00, 0xC8, 0x00
	.byte 0xC0, 0x00, 0xB8, 0x00, 0xB0, 0x00, 0xA8, 0x00, 0xA0, 0x00, 0x98, 0x00, 0x90, 0x00, 0x88, 0x00
	endlabel vdp1_build_fog_cluts

	glabel linewin_spawn
	sts.l	pr,@-r15
	mov.l	.L0600D82C,r2
	mov.l	.L0600D830,r0
	jsr	@r0
	nop
	mov.l	.L0600D834,r2
	mov.l	r2,@(12,r3)
	add	#16,r3
	mov.l	.L0600D838,r2
	mov.l	r2,@-r1
	add	#4,r1
	lds.l	@r15+,pr
.L0600D810:
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
	.long .L0600D810
.L0600D83C:
	.long linewin_spans_a
.L0600D840:
	.long 0x000000E0
.L0600D844:
	.long linewin_shapes_a
.L0600D848:
	.long linewin_shapes_b
	endlabel linewin_spawn

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

	glabel linewin_project_shape
	sts.l	pr,@-r15
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.l	.L0600D8F4,r3
	mov.l	@r3+,r12
	mov.l	@r3+,r13
	sub	r12,r4
	mov.l	@r3+,r12
	sub	r13,r5
	sub	r12,r6
	mov	r4,r0
	mov.l	r0,@(760,gbr)
	mov	r6,r0
	mov.l	r0,@(768,gbr)
	mov.l	@r3+,r8
	mov.l	@r3+,r9
	mov.l	@r3+,r10
	mov.l	@r3+,r11
	mov	r2,r3
	mov.l	@r3+,r7
	mov	r7,r6
	mov.l	r1,@-r15
	mov.l	@(744,gbr),r0
	mov	r0,r2
	mov.w	r7,@r2
	add	#2,r2
	mov.w	@(16,r1),r0
	mov.w	r0,@r2
	add	#2,r2
	mov.w	@r3+,r12
	mov.w	@r3+,r13
	mov.w	@r3+,r14
	add	#2,r3
	shll16	r12
	shll16	r13
	shll16	r14
	mov.l	@(760,gbr),r0
	add	r0,r12
	mov.l	@(768,gbr),r0
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
.L0600D8E4:
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
	mov.w	@(190,gbr),r0
	mov	#-128,r1
	shll	r1
	mov.l	r14,@(0,r1)
	mov.l	r0,@(16,r1)
	mov	#0,r0
	mov.l	r0,@(20,r1)
	mov.l	r12,@-r15
	mov.l	r13,@-r15
	mov.w	@r3+,r12
	mov.w	@r3+,r13
	mov.w	@r3+,r14
	add	#2,r3
	shll16	r12
	shll16	r13
	shll16	r14
	mov.l	@(760,gbr),r0
	add	r0,r12
	mov.l	@(768,gbr),r0
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
	mov.l	@(28,r4),r4
	dmuls.l	r4,r0
	sts	mach,r0
	dmuls.l	r4,r1
	sts	mach,r1
	mov	#88,r4
	shll	r4
	cmp/ge	r4,r0
	bt	.L0600D97E
	add	r0,r4
	cmp/pz	r4
	bf	.L0600D97E
	mov	#112,r4
	cmp/ge	r4,r1
	bt	.L0600D97E
	add	r1,r4
	cmp/pz	r4
	bt	.L0600D980
.L0600D97E:
	add	#-1,r6
.L0600D980:
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
	bf	.L0600D8E4
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

	glabel linewin_rasterize_all
	sts.l	pr,@-r15
	mov.l	r1,@-r15
	mov.l	.L0600D9D4,r1
	mov.l	.L0600D9D8,r0
	mov.l	r0,@(748,gbr)
	mov.w	@r1+,r7
	cmp/pz	r7
	bf	.L0600D9BA
	bsr	linewin_rasterize_poly
	nop
.L0600D9BA:
	mov.l	.L0600D9DC,r1
	mov.l	.L0600D9E0,r0
	mov.l	r0,@(748,gbr)
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
	mov.w	r0,@(132,gbr)
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
.L0600DA18:
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
	bt	.L0600DA18
	bra	.L0600DA18
	mov	r13,r2
.L0600DA3C:
	.long poly_scratch
.L0600DA40:
	bra	.L0600DA18
	add	#8,r2
.L0600DA44:
	mov.l	@(748,gbr),r0
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
.L0600DA66:
	mov.w	@(132,gbr),r0
	cmp/pz	r5
	bt	.L0600DA6E
	mov	r0,r5
.L0600DA6E:
	cmp/ge	r0,r6
	bf	.L0600DA74
	mov	#0,r6
.L0600DA74:
	shll16	r14
.L0600DA76:
	mov.w	@r8,r0
	cmp/pz	r0
	bf	.L0600DAA6
	mov.l	@(4,r8),r13
	cmp/gt	r14,r13
	bf	.L0600DA86
	cmp/eq	r5,r0
	bt	.L0600DA90
.L0600DA86:
	bra	.L0600DA76
	add	#8,r8
	.byte 0x00, 0x00
.L0600DA8C:
	.long poly_scratch
.L0600DA90:
	mov	r0,r5
.L0600DA92:
	mov.w	@r9,r0
	cmp/pz	r0
	bf	.L0600DAA6
	mov.l	@(4,r8),r13
	cmp/gt	r14,r13
	bf	.L0600DAA2
	cmp/eq	r6,r0
	bt	.L0600DAAC
.L0600DAA2:
	bra	.L0600DA92
	add	#8,r9
.L0600DAA6:
	lds.l	@r15+,pr
	rts
	nop
.L0600DAAC:
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
	mov.l	r10,@(0,r13)
	mov.l	r0,@(4,r13)
	mov.l	@(28,r13),r7
	mov.w	@(4,r9),r0
	mov	r0,r11
	sub	r14,r11
	mov.w	@(2,r9),r0
	shll16	r0
	sub	r4,r0
	mov.l	r11,@(0,r13)
	mov.l	r0,@(4,r13)
	mov.l	@(28,r13),r8
	cmp/ge	r10,r11
	bf	.L0600DAE8
	add	#-4,r5
	bra	.L0600DAEC
	mov	r10,r12
.L0600DAE8:
	add	#4,r6
	mov	r11,r12
.L0600DAEC:
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
	bra	.L0600DA66
	nop
	endlabel linewin_rasterize_poly

	glabel linewin_fill_edge_spans
	cmp/pl	r14
	bt	.L0600DB14
	rts
	nop
.L0600DB14:
	add	r7,r3
	add	r8,r4
	mov.l	@(748,gbr),r0
	cmp/ge	r0,r2
	bf	.L0600DB90
	mov.w	.L0600DB86,r11
	add	r11,r0
	cmp/ge	r0,r2
	bt	.L0600DB90
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
	bt	.L0600DB90
	cmp/gt	r11,r6
	bf	.L0600DB68
	mov	r11,r6
.L0600DB68:
	cmp/pz	r6
	bf	.L0600DB90
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
	bf	.L0600DB14
	rts
	nop
.L0600DB86:
	.short 0x0380
.L0600DB88:
	.short 0x015F
	.byte 0x00, 0x00
.L0600DB8C:
	.long 0x0000015F
.L0600DB90:
	add	#4,r2
	dt	r14
	bf	.L0600DB14
	rts
	nop
	.byte 0x00, 0x00
	endlabel linewin_fill_edge_spans

	glabel snd_wait_driver_idle
	mov.w	.L0600DBC0,r13
.L0600DB9E:
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
	bt	.L0600DBBC
	mov.l	.L0600DBC8,r7
.L0600DBB4:
	dt	r7
	bf	.L0600DBB4
	dt	r13
	bf	.L0600DB9E
.L0600DBBC:
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

	glabel snd_init_stage
	sts.l	pr,@-r15
	bsr	snd_wait_driver_idle
	nop
	mov.l	.L0600DC78,r4
	mov	#1,r0
	mov.b	r0,@(2,r4)
	mov.b	r0,@(3,r4)
	mov.b	r0,@(4,r4)
	mov.b	r0,@(5,r4)
	mov.b	r0,@(6,r4)
	mov	#16,r0
	mov.b	r0,@(0,r4)
	bsr	snd_wait_driver_idle
	nop
	mov.l	.L0600DC7C,r0
	jsr	@r0
	nop
	mov.l	.L0600DC80,r0
	jsr	@r0
	nop
	mov.b	@(0,gbr),r0
	cmp/eq	#2,r0
	bt	.L0600DC16
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bf	.L0600DC16
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L0600DC16
	mov	#12,r8
	cmp/ge	r8,r0
	bt	.L0600DC16
	mov.l	.L0600DC84,r0
	jsr	@r0
	nop
	bsr	snd_upload_area_map_tones
	nop
.L0600DC16:
	mov.l	.L0600DC88,r2
	mov.w	.L0600DC72,r7
	mov.w	.L0600DC74,r8
.L0600DC1C:
	mov.w	@(4,r2),r0
	or	r8,r0
	mov.w	r0,@(4,r2)
	add	#8,r2
	dt	r7
	bf	.L0600DC1C
	mov.l	.L0600DC8C,r0
	jsr	@r0
	nop
	mov	#0,r0
	mov.b	r0,@(56,gbr)
	mov.b	r0,@(57,gbr)
	mov.b	r0,@(58,gbr)
	bsr	snd_cmd_alloc
	nop
	mov	#16,r0
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
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L0600DC94
	bra	.L0600DC96
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
	.long load_sound_bank
.L0600DC84:
	.long load_sequence
.L0600DC88:
	.long SCSP_RAM + 0xA000
.L0600DC8C:
	.long smpc_sndon
.L0600DC90:
	.long snd_apply_stereo_mono
.L0600DC94:
	mov	#0,r4
.L0600DC96:
	bsr	snd_effect_change
	nop
	mov.b	@(20,gbr),r0
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

	glabel snd_reset
	sts.l	pr,@-r15
	bsr	snd_wait_driver_idle
	nop
	mov.l	.L0600DD20,r4
	mov	#1,r0
	mov.b	r0,@(2,r4)
	mov.b	r0,@(3,r4)
	mov.b	r0,@(4,r4)
	mov.b	r0,@(5,r4)
	mov.b	r0,@(6,r4)
	mov	#16,r0
	mov.b	r0,@(0,r4)
	bsr	snd_wait_driver_idle
	nop
	mov	#0,r0
	mov.b	r0,@(56,gbr)
	mov.b	r0,@(57,gbr)
	mov.b	r0,@(58,gbr)
	bsr	snd_cmd_alloc
	nop
	mov	#16,r0
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
	mov	#-127,r0
	mov.b	r0,@r3
	mov	r4,r0
	mov.b	r0,@(2,r3)
	mov	r5,r0
	mov.b	r0,@(3,r3)
.L0600DD56:
	lds.l	@r15+,pr
	rts
	nop
.L0600DD5C:
	.long D_060CB000
.L0600DD60:
	.long SCSP_RAM + 0x483
	endlabel snd_apply_stereo_mono

	glabel snd_upload_area_map_tones
	sts.l	pr,@-r15
	mov.b	@(107,gbr),r0
	cmp/eq	#1,r0
	bt	.L0600DD9A
	cmp/eq	#0,r0
	bt	.L0600DD7C
	mov.l	.L0600DD78,r5
	bra	.L0600DD94
	nop
	.byte 0x00, 0x00
.L0600DD78:
	.long D_060CE000
.L0600DD7C:
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bt	.L0600DD86
	bra	.L0600DDC4
	nop
.L0600DD86:
	mov	#12,r2
	cmp/ge	r2,r0
	bt	.L0600DDC4
	shll2	r0
	shll8	r0
	mov.l	.L0600DDA8,r5
	add	r0,r5
.L0600DD94:
	mov.l	@r5,r0
	cmp/eq	#-1,r0
	bf	.L0600DDB0
.L0600DD9A:
	mov.l	.L0600DDAC,r2
	mov	#0,r0
	mov.l	r0,@(4,r2)
	mov.l	r0,@(8,r2)
	bra	.L0600DDC4
	nop
	.byte 0x00, 0x00
.L0600DDA8:
	.long 0x002FC000
.L0600DDAC:
	.long snd_tone_select
.L0600DDB0:
	mov.b	@(20,gbr),r0
	shll2	r0
	shll	r0
	mov.l	.L0600DDEC,r2
	add	r0,r2
	mov.l	.L0600DDF0,r3
	mov.l	@(4,r2),r0
	mov.l	r0,@(4,r3)
	mov.l	@(8,r2),r0
	mov.l	r0,@(8,r3)
.L0600DDC4:
	mov.l	.L0600DDF4,r7
	mov.l	.L0600DDF8,r4
	mov.l	.L0600DDFC,r5
	mov.w	.L0600DDEA,r6
	bsr	mem_copy_bytes
	nop
	mov.l	.L0600DE00,r2
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	@r2+,r14
	mov	r7,r8
	mov.l	.L0600DDF8,r9
.L0600DDE0:
	mov.b	@r9,r0
	cmp/eq	#16,r0
	bt	.L0600DE04
	bra	.L0600DDE0
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
.L0600DE04:
	cmp/pl	r14
	bf	.L0600DE94
	mov.b	@r8,r6
	add	#1,r8
	mov.b	@(0,gbr),r0
	cmp/eq	#3,r0
	bf	.L0600DE4A
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
	mov.b	@(20,gbr),r0
	mov.w	@(r0,r4),r0
	mov	#50,r4
	cmp/ge	r4,r0
	bf	.L0600DE48
	bra	.L0600DE4A
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
.L0600DE48:
	mov	#0,r6
.L0600DE4A:
	mov	r6,r0
	cmp/pz	r0
	bf	.L0600DE56
	mov	#3,r6
	cmp/gt	r6,r0
	bf	.L0600DE58
.L0600DE56:
	mov	#0,r0
.L0600DE58:
	mov	r0,r6
	mov.l	.L0600DE88,r4
	mov.b	@(20,gbr),r0
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
	bra	.L0600DE04
	add	#-1,r14
	.byte 0x00, 0x00
.L0600DE88:
	.long snd_variant_order_table
.L0600DE8C:
	.long 0x0007FFFF
.L0600DE90:
	.long SCSP_RAM
.L0600DE94:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x09
	dlabel snd_variant_order_table
	.byte 0x00, 0x03, 0x01, 0x02, 0x00, 0x01, 0x03, 0x02, 0x00, 0x01, 0x02, 0x03, 0x00, 0x02, 0x01, 0x03
	.byte 0x00, 0x01, 0x03, 0x02, 0x00, 0x03, 0x02, 0x01
	endlabel snd_upload_area_map_tones

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

	glabel snd_reroll_tone_variants
	sts.l	pr,@-r15
	mov.l	.L0600DEDC,r2
	mov.b	@(22,gbr),r0
	tst	#1,r0
	bt	.L0600DEE0
	bra	.L0600E038
	nop
	.byte 0x00, 0x00
.L0600DEDC:
	.long snd_tone_bank_table
.L0600DEE0:
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
	bt	.L0600E038
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
.L0600DF90:
	mov.b	@r8,r0
	cmp/pz	r0
	bt	.L0600DFE4
	add	#1,r0
	mov.b	r0,@r8
	mov.b	@r10,r0
	bsr	math_rand_range
	nop
	mov	r9,r12
	mov	#8,r2
	mov	#0,r11
.L0600DFA6:
	mov.b	@r12,r13
	cmp/eq	r13,r3
	bf	.L0600DFD2
	cmp/eq	r11,r0
	bf	.L0600DFD0
	mov	#-1,r13
	bra	.L0600DFDA
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
	bt	.L0600E03E
	bra	.L0600DFA6
	add	#1,r12
.L0600DFDA:
	mov.b	@r10,r0
	add	#-1,r0
	mov.b	r0,@r10
	bra	.L0600DF90
	add	#1,r14
.L0600DFE4:
	add	#1,r8
	add	#1,r10
	add	#1,r3
	mov	#4,r0
	cmp/ge	r0,r3
	bf	.L0600DF90
	mov.l	.L0600E01C,r8
	mov	#0,r3
	mov	r7,r9
.L0600DFF6:
	mov.b	@r8,r0
	cmp/pl	r0
	bf	.L0600E02E
	add	#-1,r0
	mov.b	r0,@r8
	mov	r14,r0
	bsr	math_rand_range
	nop
	mov	r9,r12
	mov	#8,r2
	mov	#0,r11
.L0600E00C:
	mov.b	@r12,r13
	cmp/pz	r13
	bt	.L0600E022
	cmp/eq	r11,r0
	bf	.L0600E020
	bra	.L0600E02A
	mov.b	r3,@r12
	.byte 0x00, 0x00
.L0600E01C:
	.long snd_variant_counts_delta
.L0600E020:
	add	#1,r11
.L0600E022:
	dt	r2
	bt	.L0600E03E
	bra	.L0600E00C
	add	#1,r12
.L0600E02A:
	bra	.L0600DFF6
	add	#-1,r14
.L0600E02E:
	add	#1,r8
	add	#1,r3
	mov	#4,r0
	cmp/ge	r0,r3
	bf	.L0600DFF6
.L0600E038:
	lds.l	@r15+,pr
	rts
	nop
.L0600E03E:
	mov.l	.L0600E060,r8
	mov.l	.L0600E064,r9
	mov	#0,r6
	mov	#4,r7
.L0600E046:
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
	bf	.L0600E046
	bra	.L0600E038
	nop
	.byte 0x00, 0x00
.L0600E060:
	.long snd_tone_variants
.L0600E064:
	.long snd_variant_counts_new
	endlabel snd_reroll_tone_variants

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
	mov.l	r13,@(0,r10)
	mov.l	r0,@(4,r10)
	mov.l	@(28,r10),r0
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
	bt	.L0600E11A
.L0600E0DA:
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
	bf	.L0600E0DA
.L0600E11A:
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
	.byte 0x00, 0x00, 0x00, 0x07, 0x00, 0x20, 0x10, 0x00, 0x00, 0x20, 0x15, 0x48, 0x00, 0x20, 0x19, 0xDA
	.byte 0x00, 0x20, 0x1F, 0xBC, 0x00, 0x20, 0x23, 0xB0, 0x00, 0x20, 0x33, 0x66, 0x00, 0x20, 0x41, 0x0C
	.byte 0x00, 0x20, 0x4F, 0x66, 0x00, 0x20, 0x5D, 0x02, 0x00, 0x20, 0x67, 0x82, 0x00, 0x20, 0x74, 0x36
	.byte 0x00, 0x20, 0x80, 0x6E, 0x00, 0x20, 0x8B, 0x92, 0x00, 0x20, 0x99, 0xDE, 0x00, 0x20, 0xAB, 0x46
	.byte 0x00, 0x20, 0xBE, 0x54, 0x00, 0x20, 0xCF, 0xFE, 0x00, 0x20, 0xD8, 0x3A, 0x00, 0x20, 0xE0, 0x44
	.byte 0x00, 0x20, 0xE8, 0xF2, 0x00, 0x20, 0xF0, 0x46, 0x00, 0x20, 0xFC, 0x1C, 0x00, 0x21, 0x09, 0xCA
	.byte 0x00, 0x21, 0x17, 0xAE, 0x00, 0x21, 0x25, 0x80, 0x00, 0x21, 0x3C, 0x10, 0x00, 0x21, 0x4C, 0x40
	.byte 0x00, 0x21, 0x61, 0x3A
	dlabel snd_tone_banks_1
	.byte 0x00, 0x00, 0x00, 0x06, 0x00, 0x20, 0x10, 0x00, 0x00, 0x20, 0x1B, 0xF6, 0x00, 0x20, 0x21, 0xB8
	.byte 0x00, 0x20, 0x2F, 0x36, 0x00, 0x20, 0x3C, 0x72, 0x00, 0x20, 0x55, 0x02, 0x00, 0x20, 0x6F, 0xDC
	.byte 0x00, 0x20, 0x8E, 0x0E, 0x00, 0x20, 0xAE, 0x5C, 0x00, 0x20, 0xBC, 0xE6, 0x00, 0x20, 0xC8, 0x82
	.byte 0x00, 0x20, 0xD3, 0x9C, 0x00, 0x20, 0xE4, 0x68, 0x00, 0x20, 0xF3, 0x8C, 0x00, 0x21, 0x01, 0xDC
	.byte 0x00, 0x21, 0x13, 0x9A, 0x00, 0x21, 0x21, 0x12, 0x00, 0x21, 0x4B, 0xCC, 0x00, 0x21, 0x67, 0x94
	.byte 0x00, 0x21, 0x8E, 0x8A, 0x00, 0x21, 0xAA, 0x1E, 0x00, 0x21, 0xD8, 0x4A, 0x00, 0x21, 0xF2, 0x5E
	.byte 0x00, 0x22, 0x14, 0xFA
	dlabel snd_tone_banks_2
	.byte 0x00, 0x00, 0x00, 0x05, 0x00, 0x20, 0x10, 0x00, 0x00, 0x20, 0x12, 0xB8, 0x00, 0x20, 0x17, 0xDE
	.byte 0x00, 0x20, 0x1B, 0x78, 0x00, 0x20, 0x20, 0x10, 0x00, 0x20, 0x47, 0xFC, 0x00, 0x20, 0x69, 0xEA
	.byte 0x00, 0x20, 0x95, 0xD2, 0x00, 0x20, 0xC4, 0xEA, 0x00, 0x20, 0xCE, 0x20, 0x00, 0x20, 0xD7, 0xAC
	.byte 0x00, 0x20, 0xDF, 0x5E, 0x00, 0x20, 0xE8, 0x4E, 0x00, 0x20, 0xFE, 0x1E, 0x00, 0x21, 0x10, 0x26
	.byte 0x00, 0x21, 0x28, 0x28, 0x00, 0x21, 0x40, 0x48, 0x00, 0x21, 0x5B, 0x38, 0x00, 0x21, 0x6D, 0xCE
	.byte 0x00, 0x21, 0x89, 0x70
	dlabel snd_tone_banks_3
	.byte 0x00, 0x00, 0x00, 0x06, 0x00, 0x20, 0x10, 0x00, 0x00, 0x20, 0x19, 0x68, 0x00, 0x20, 0x20, 0x78
	.byte 0x00, 0x20, 0x26, 0x98, 0x00, 0x20, 0x2E, 0x76, 0x00, 0x20, 0x49, 0xA4, 0x00, 0x20, 0x67, 0x12
	.byte 0x00, 0x20, 0x93, 0x26, 0x00, 0x20, 0xB4, 0xB2, 0x00, 0x20, 0xC8, 0x42, 0x00, 0x20, 0xDB, 0x5C
	.byte 0x00, 0x20, 0xF1, 0x6E, 0x00, 0x21, 0x05, 0x0C, 0x00, 0x21, 0x13, 0x76, 0x00, 0x21, 0x1D, 0xD2
	.byte 0x00, 0x21, 0x2E, 0x8A, 0x00, 0x21, 0x3E, 0x84, 0x00, 0x21, 0x49, 0xAE, 0x00, 0x21, 0x56, 0x6A
	.byte 0x00, 0x21, 0x62, 0x90, 0x00, 0x21, 0x6F, 0x76, 0x00, 0x21, 0x8E, 0x5A, 0x00, 0x21, 0xA5, 0x1E
	.byte 0x00, 0x21, 0xC5, 0xAE
	dlabel snd_tone_banks_4
	.byte 0x00, 0x00, 0x00, 0x06, 0x00, 0x20, 0x10, 0x00, 0x00, 0x20, 0x16, 0x88, 0x00, 0x20, 0x1E, 0x6E
	.byte 0x00, 0x20, 0x28, 0x9A, 0x00, 0x20, 0x30, 0x30, 0x00, 0x20, 0x3B, 0x2E, 0x00, 0x20, 0x4D, 0x3E
	.byte 0x00, 0x20, 0x5A, 0x36, 0x00, 0x20, 0x6A, 0x8E, 0x00, 0x20, 0x77, 0x74, 0x00, 0x20, 0x89, 0xF0
	.byte 0x00, 0x20, 0x98, 0x40, 0x00, 0x20, 0xAD, 0x84, 0x00, 0x20, 0xB9, 0x2A, 0x00, 0x20, 0xC5, 0xEA
	.byte 0x00, 0x20, 0xD0, 0xCA, 0x00, 0x20, 0xE0, 0x90, 0x00, 0x20, 0xF4, 0xC0, 0x00, 0x21, 0x0B, 0x12
	.byte 0x00, 0x21, 0x24, 0x56, 0x00, 0x21, 0x3D, 0x70, 0x00, 0x21, 0x54, 0xA0, 0x00, 0x21, 0x69, 0x02
	.byte 0x00, 0x21, 0x80, 0x8E
	dlabel snd_tone_banks_5
	.byte 0x00, 0x00, 0x00, 0x06, 0x00, 0x20, 0x10, 0x00, 0x00, 0x20, 0x19, 0xC8, 0x00, 0x20, 0x21, 0x2C
	.byte 0x00, 0x20, 0x2E, 0x60, 0x00, 0x20, 0x39, 0x06, 0x00, 0x20, 0x54, 0xC8, 0x00, 0x20, 0x6E, 0x10
	.byte 0x00, 0x20, 0x8A, 0x1E, 0x00, 0x20, 0xA3, 0x1A, 0x00, 0x20, 0xBD, 0x42, 0x00, 0x20, 0xD6, 0x4A
	.byte 0x00, 0x20, 0xF0, 0x6C, 0x00, 0x21, 0x0E, 0xA6, 0x00, 0x21, 0x20, 0x62, 0x00, 0x21, 0x3C, 0xF6
	.byte 0x00, 0x21, 0x5B, 0xD8, 0x00, 0x21, 0x80, 0xA4, 0x00, 0x21, 0x97, 0xAC, 0x00, 0x21, 0xAE, 0x12
	.byte 0x00, 0x21, 0xC5, 0x22, 0x00, 0x21, 0xE1, 0x3E, 0x00, 0x21, 0xE8, 0x68, 0x00, 0x21, 0xF2, 0x80
	.byte 0x00, 0x21, 0xFE, 0xD8
	endlabel math_apportion4

	glabel snd_cmd_alloc
	mov.b	@(57,gbr),r0
	mov	r0,r3
	mov.b	@(56,gbr),r0
	add	#1,r0
	and	#31,r0
	cmp/eq	r0,r3
	bt	.L0600E3D8
	mov.b	r0,@(56,gbr)
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

	glabel snd_cmd_flush
	mov.b	@(56,gbr),r0
	mov	r0,r8
	mov.b	@(57,gbr),r0
	cmp/eq	r0,r8
	bt	.L0600E472
	mov	r0,r11
	mov	#8,r12
	mov	#0,r13
	mov.l	.L0600E478,r4
	mov.b	@(58,gbr),r0
	mov	r0,r10
	shll2	r10
	shll2	r10
	add	r4,r10
	mov.b	@r10,r9
	tst	r9,r9
	bf	.L0600E472
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
	bf	.L0600E41E
	add	#1,r13
	add	#1,r0
	dt	r12
	bf/s	.L0600E406
	and	#7,r0
.L0600E41E:
	mov.b	@(58,gbr),r0
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
	bf	.L0600E480
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
	bt	.L0600E46A
	dt	r14
	bf	.L0600E426
.L0600E46A:
	mov	r9,r0
	mov.b	r0,@(58,gbr)
	mov	r11,r0
	mov.b	r0,@(57,gbr)
.L0600E472:
	rts
	nop
	.byte 0x00, 0x00
.L0600E478:
	.long SCSP_RAM + 0x700
.L0600E47C:
	.long snd_cmd_ring
.L0600E480:
	sts.l	pr,@-r15
	mov.l	.L0600E4BC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	trapa	#1
	nop
	endlabel snd_cmd_flush

	glabel snd_init_cdda_mix
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E4C0
	mov	#-128,r0
	mov.b	r0,@r3
	mov	#-64,r0
	mov.b	r0,@(2,r3)
	mov.b	r0,@(3,r3)
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E4C0
	mov	#-127,r0
	mov.b	r0,@r3
	mov	#31,r0
	mov.b	r0,@(2,r3)
	mov	#15,r0
	mov.b	r0,@(3,r3)
	lds.l	@r15+,pr
	rts
	nop
.L0600E4BC:
	.long smpc_sndoff
.L0600E4C0:
	bra	.L0600E4C0
	nop
	endlabel snd_init_cdda_mix

	glabel snd_seq_start
	mov.l	r0,@-r15
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bf	.L0600E4F2
	mov.l	r3,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E4EE
	mov	#1,r0
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

	glabel snd_seq_stop
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E50C
	mov	#2,r0
	mov.b	r0,@r3
	mov	r4,r0
	mov.b	r0,@(2,r3)
.L0600E50C:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_seq_stop

	glabel snd_seq_pause
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E52C
	mov	#3,r0
	mov.b	r0,@r3
	mov	r4,r0
	mov.b	r0,@(2,r3)
.L0600E52C:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_seq_pause

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

	glabel snd_seq_continue
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E564
	mov	#4,r0
	mov.b	r0,@r3
	mov	r4,r0
	mov.b	r0,@(2,r3)
.L0600E564:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_seq_continue

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

	glabel snd_seq_stop_all
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E598
	mov	#6,r0
	mov.b	r0,@r3
.L0600E598:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_seq_stop_all

	glabel snd_map_change
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E5B8
	mov	#8,r0
	mov.b	r0,@r3
	mov	r4,r0
	mov.b	r0,@(2,r3)
.L0600E5B8:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_map_change

	glabel snd_effect_change
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E5D8
	mov	#-125,r0
	mov.b	r0,@r3
	mov	r4,r0
	mov.b	r0,@(2,r3)
.L0600E5D8:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_effect_change

	glabel snd_mixer_change
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E5FC
	mov	#-121,r0
	mov.b	r0,@r3
	mov	r4,r0
	mov.b	r0,@(2,r3)
	mov	r5,r0
	mov.b	r0,@(3,r3)
.L0600E5FC:
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	rts
	nop
	endlabel snd_mixer_change

	glabel snd_seq_volume
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E624
	mov	#5,r0
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

	glabel snd_seq_level
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E648
	mov	#24,r0
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

	glabel snd_set_ctrl_volume
	mov.l	.L0600E65C,r2
	mov	r4,r0
	mov.b	r5,@(r0,r2)
	rts
	nop
.L0600E65C:
	.long snd_ctrl_volume
	endlabel snd_set_ctrl_volume

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

	glabel snd_spawn_level_fadeout
	sts.l	pr,@-r15
	mov.l	.L0600E68C,r2
	mov.l	.L0600E690,r0
	jsr	@r0
	nop
	mov.l	.L0600E694,r0
	mov.l	r0,@(12,r3)
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

	glabel snd_level_fadeout_task
	sts.l	pr,@-r15
	mov.w	@(0,r1),r0
	add	#2,r0
	mov.w	r0,@(0,r1)
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

	glabel snd_spawn_level_fadein
	sts.l	pr,@-r15
	mov.l	.L0600E6F8,r2
	mov.l	.L0600E6FC,r0
	jsr	@r0
	nop
	mov.l	.L0600E700,r0
	mov.l	r0,@(12,r3)
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

	glabel snd_level_fadein_task
	sts.l	pr,@-r15
	mov.w	@(0,r1),r0
	add	#2,r0
	mov.w	r0,@(0,r1)
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

	glabel snd_spawn_level_dip
	sts.l	pr,@-r15
	mov.l	.L0600E764,r2
	mov.l	.L0600E768,r0
	jsr	@r0
	nop
	mov.l	.L0600E76C,r0
	mov.l	r0,@(12,r3)
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

	glabel snd_level_dip_task
	sts.l	pr,@-r15
	mov.w	@(0,r1),r0
	add	#1,r0
	mov.w	r0,@(0,r1)
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

	glabel snd_spawn_level_undip
	sts.l	pr,@-r15
	mov.l	.L0600E7D0,r2
	mov.l	.L0600E7D4,r0
	jsr	@r0
	nop
	mov.l	.L0600E7D8,r0
	mov.l	r0,@(12,r3)
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

	glabel snd_level_undip_task
	sts.l	pr,@-r15
	mov.w	@(0,r1),r0
	add	#1,r0
	mov.w	r0,@(0,r1)
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

	glabel snd_cmd16
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E83A
	mov	#22,r0
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

	glabel snd_seq_transpose
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E85E
	mov	#23,r0
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

	glabel snd_seq_pan
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E886
	mov	#14,r0
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

	glabel snd_voice_mgr_task
	sts.l	pr,@-r15
	mov.l	.L0600E95C,r2
	mov	#8,r7
.L0600E8D6:
	mov.w	@r2,r0
	cmp/pl	r0
	bf	.L0600E8EA
	add	#-1,r0
	mov.w	r0,@r2
	tst	r0,r0
	bf	.L0600E8EA
	mov	#0,r0
	mov.w	r0,@(2,r2)
	mov.l	r0,@(4,r2)
.L0600E8EA:
	dt	r7
	bf/s	.L0600E8D6
	add	#8,r2
	mov.l	.L0600E960,r2
	mov.l	@r2,r0
	mov.l	@(8,r2),r8
	cmp/eq	r0,r8
	bt	.L0600E924
	mov.l	r0,@(8,r2)
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600E924
	mov	#17,r0
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
.L0600E924:
	mov.l	.L0600E964,r2
	mov.l	@(12,gbr),r0
	and	#7,r0
	mov	r0,r9
	mov	#7,r7
	add	#7,r2
.L0600E930:
	mov.b	@r2,r8
	mov.b	@(8,r2),r0
	cmp/pz	r0
	bf	.L0600E940
	cmp/eq	r7,r9
	bf	.L0600E94E
	cmp/eq	r0,r8
	bt	.L0600E94E
.L0600E940:
	mov	r8,r0
	mov.b	r0,@(8,r2)
	mov	r7,r4
	mov	#-128,r5
	add	r0,r5
	bsr	snd_seq_level
	nop
.L0600E94E:
	add	#-1,r2
	add	#-1,r7
	cmp/pz	r7
	bt	.L0600E930
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

	glabel snd_play_positional
	mov.b	@(107,gbr),r0
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
	mov.l	@(4,r2),r3
	cmp/eq	r3,r1
	bt	.L0600E9B6
	mov.b	@(2,r2),r0
	extu.b	r0,r0
	cmp/gt	r0,r10
	bf	.L0600EA1C
.L0600E992:
	mov.w	r9,@r2
	mov.l	r1,@(4,r2)
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600EA1C
	mov	#1,r0
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
.L0600E9B6:
	mov	r10,r0
	mov.b	r0,@(2,r2)
	mov	r4,r0
	mov.b	r0,@(3,r2)
	mov	r10,r5
	bsr	snd_set_ctrl_volume
	nop
	mov	#4,r0
	cmp/ge	r0,r8
	bt	.L0600EA16
	mov	r8,r4
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	mov.l	@(160,gbr),r0
	sub	r0,r2
	mov.l	@(168,gbr),r0
	sub	r0,r3
	mov.l	.L0600EA08,r0
	jsr	@r0
	neg	r2,r2
	mov	r0,r8
	mov.w	@(194,gbr),r0
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
	bra	.L0600EA12
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
	bra	.L0600EA12
	mov	#0,r5
.L0600EA10:
	mov	#30,r5
.L0600EA12:
	bsr	snd_set_chan_pan
	nop
.L0600EA16:
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L0600EA1C:
	lds.l	@r15+,pr
	rts
	mov	#-1,r0
	endlabel snd_play_positional

	glabel snd_calc_distance_volume
	mov.l	.L0600EA78,r7
	mov.l	@r7,r7
	mov.l	@(48,r1),r4
	mov.l	@(48,r7),r0
	sub	r0,r4
	mov.l	@(52,r1),r5
	mov.l	@(52,r7),r0
	sub	r0,r5
	mov.l	@(56,r1),r6
	mov.l	@(56,r7),r0
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

	glabel snd_stop_positional
	sts.l	pr,@-r15
	mov.l	.L0600EAA8,r2
	mov	r8,r0
	shll2	r0
	shll	r0
	add	r0,r2
	mov.l	@(4,r2),r3
	cmp/eq	r3,r1
	bf	.L0600EAA2
	mov	#0,r0
	mov.l	r0,@(0,r2)
	mov.l	r0,@(4,r2)
	bsr	snd_seq_stop
	nop
.L0600EAA2:
	lds.l	@r15+,pr
	rts
	nop
.L0600EAA8:
	.long snd_voices
	endlabel snd_stop_positional

	glabel snd_midi_direct
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	bsr	snd_cmd_alloc
	nop
	tst	r0,r0
	bf	.L0600EACE
	mov	#9,r0
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

	glabel dbg_sound_test_init
	sts.l	pr,@-r15
	mov.w	@(28,gbr),r0
	tst	#8,r0
	bf	.L0600EAE4
	bra	.L0600EB64
	nop
.L0600EAE4:
	mov.l	.L0600EB48,r2
	mov.l	.L0600EB4C,r0
	jsr	@r0
	nop
	mov.l	.L0600EB50,r2
	mov.l	.L0600EB4C,r0
	jsr	@r0
	nop
	mov	#-1,r0
	mov.b	r0,@(63,gbr)
	mov	#0,r0
	mov.b	r0,@(0,r1)
	mov.b	r0,@(1,r1)
	mov.b	r0,@(2,r1)
	mov	#15,r0
	mov.b	r0,@(3,r1)
	mov.l	.L0600EB54,r7
	mov.l	.L0600EB58,r2
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L0600EB3A
	mov	#12,r8
	cmp/ge	r8,r0
	bt	.L0600EB3A
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
.L0600EB3A:
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
.L0600EB64:
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L0600EBB0
	mov	#12,r8
	cmp/ge	r8,r0
	bt	.L0600EBB0
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
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L0600EBB0
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
.L0600EBB0:
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
	.byte 0x00, 0x0F, 0x00, 0x0C, 0x3C, 0x20, 0x53, 0x4F, 0x55, 0x4E, 0x44, 0x20, 0x54, 0x45, 0x53, 0x54
	.byte 0x20, 0x3E, 0xFF, 0x09, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0xFF, 0x09, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3A, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0xFF, 0x09, 0x20, 0x3C, 0x20, 0x44, 0x53, 0x53, 0x20, 0x49, 0x4E, 0x46, 0x4F, 0x20
	.byte 0x3E, 0x20, 0xFF, 0x09, 0x20, 0x20, 0x20, 0x2A, 0x2A, 0x2A, 0x2A, 0x2A, 0x2A, 0x2A, 0x2A, 0x20
	.byte 0x20, 0x20, 0xFE, 0x09
	dlabel str_sound_test_clear
	.byte 0x00, 0x0F, 0x00, 0x0C, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0xFF, 0x09, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0xFF, 0x09, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0xFF, 0x09, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0xFF, 0x09, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0xFE, 0x09
	dlabel str_dss_info
	.byte 0x00, 0x0F, 0x00, 0x17, 0x20, 0x3C, 0x20, 0x44, 0x53, 0x53, 0x20, 0x49, 0x4E, 0x46, 0x4F, 0x20
	.byte 0x3E, 0x20, 0xFF, 0x09, 0x20, 0x20, 0x20, 0x2A, 0x2A, 0x2A, 0x2A, 0x2A, 0x2A, 0x2A, 0x2A, 0x20
	.byte 0x20, 0x20, 0xFE, 0x09
	dlabel str_dss_info_clear
	.byte 0x00, 0x0F, 0x00, 0x17, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0xFF, 0x09, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0xFE, 0x09
	endlabel dbg_sound_test_init

	glabel dbg_sound_info_task
	mov.b	@(79,gbr),r0
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

	glabel dbg_sound_test_task
	sts.l	pr,@-r15
	mov.b	@(79,gbr),r0
	cmp/pz	r0
	bt	.L0600ED1C
	mov	#0,r0
	mov.b	r0,@(63,gbr)
	mov	#0,r0
	mov.w	r0,@(70,gbr)
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
	mov.b	@(0,r1),r0
	mov	r0,r4
	mov.w	@(78,gbr),r0
	tst	#4,r0
	bt	.L0600ED2E
	add	#-1,r4
	cmp/pz	r4
	bt	.L0600ED2E
	mov	#15,r4
.L0600ED2E:
	tst	#8,r0
	bt	.L0600ED3C
	add	#1,r4
	mov	#15,r8
	cmp/gt	r8,r4
	bf	.L0600ED3C
	mov	#0,r4
.L0600ED3C:
	mov	r4,r0
	mov.b	r0,@(0,r1)
	mov	#0,r4
	mov.w	@(78,gbr),r0
	tst	#1,r0
	bt	.L0600ED50
	mov	#15,r0
	mov.b	r0,@(2,r1)
	bra	.L0600ED84
	mov	#-1,r4
.L0600ED50:
	tst	#2,r0
	bt	.L0600ED5C
	mov	#15,r0
	mov.b	r0,@(2,r1)
	bra	.L0600ED84
	mov	#1,r4
.L0600ED5C:
	mov.b	@(2,r1),r0
	mov	r0,r8
	mov	#0,r4
	mov.w	@(76,gbr),r0
	tst	#1,r0
	bt	.L0600ED6A
	mov	#-1,r4
.L0600ED6A:
	tst	#2,r0
	bt	.L0600ED70
	mov	#1,r4
.L0600ED70:
	tst	r4,r4
	bt	.L0600ED8C
	add	#-1,r8
	cmp/pz	r8
	bf	.L0600ED80
	mov	r8,r0
	bra	.L0600ED8C
	mov.b	r0,@(2,r1)
.L0600ED80:
	mov	#4,r0
	mov.b	r0,@(2,r1)
.L0600ED84:
	mov.b	@(1,r1),r0
	add	r4,r0
	and	#127,r0
	mov.b	r0,@(1,r1)
.L0600ED8C:
	mov.w	@(78,gbr),r0
	tst	#64,r0
	bt	.L0600EDA2
	mov	#1,r4
	mov.b	@(0,r1),r0
	mov	r0,r5
	mov.b	@(1,r1),r0
	mov	r0,r6
	mov.l	.L0600EE38,r0
	jsr	@r0
	nop
.L0600EDA2:
	mov.w	@(78,gbr),r0
	tst	#16,r0
	bt	.L0600EDB0
	mov	#1,r4
	mov.l	.L0600EE3C,r0
	jsr	@r0
	nop
.L0600EDB0:
	mov.w	@(78,gbr),r0
	tst	#32,r0
	bt	.L0600EDBC
	mov.l	.L0600EE40,r0
	jsr	@r0
	nop
.L0600EDBC:
	mov.b	@(78,gbr),r0
	tst	#16,r0
	bt	.L0600EDE4
	mov.b	@(3,r1),r0
	add	#-1,r0
	and	#31,r0
	mov.b	r0,@(3,r1)
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
	mov.b	@(78,gbr),r0
	tst	#8,r0
	bt	.L0600EE0C
	mov.b	@(3,r1),r0
	add	#1,r0
	and	#31,r0
	mov.b	r0,@(3,r1)
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
	mov.b	@(0,r1),r0
	mov	#19,r4
	mov	#14,r5
	mov.l	.L0600EE44,r14
	jsr	@r14
	nop
	mov.b	@(1,r1),r0
	mov	#24,r4
	mov	#14,r5
	mov.l	.L0600EE44,r14
	jsr	@r14
	nop
	mov.b	@(3,r1),r0
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
