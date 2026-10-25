	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601E4B0,"ax",@progbits
	.p2align 2
	.byte 0x89, 0x08

	glabel func_0601E4B2
	sts.l	pr,@-r15
	mov.l	.L0601E4C8,r2
	mov.l	.L0601E4CC,r0
	jsr	@r0
	nop
	mov.l	.L0601E4D0,r0
	mov.l	r0,@(12,r3)
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0601E4C8:
	.long obj_list_load_scene
.L0601E4CC:
	.long obj_alloc
.L0601E4D0:
	.long func_0601E4D4
	endlabel func_0601E4B2

	glabel func_0601E4D4
	mov.l	.L0601E4F8,r2
	mov.l	r2,@(44,r1)
	mov.b	@(22,gbr),r0
	shlr	r0
	add	#8,r0
	mov.w	r0,@(20,r1)
	mov.w	.L0601E4F2,r0
	mov.w	r0,@(26,r1)
	mov.w	.L0601E4F4,r0
	mov.w	r0,@(22,r1)
	mov.l	.L0601E4FC,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601E4F2:
	.short 0x0000
.L0601E4F4:
	.short 0x0100
	.byte 0x00, 0x00
.L0601E4F8:
	.long D_060137A4
.L0601E4FC:
	.long func_0601E500
	endlabel func_0601E4D4

	glabel func_0601E500
	sts.l	pr,@-r15
	mov.w	@(26,r1),r0
	mov	r0,r8
	mov.w	.L0601E538,r9
	mov.w	.L0601E53A,r10
	mov.l	.L0601E53C,r0
	jsr	@r0
	nop
	mov	r8,r0
	mov.l	.L0601E540,r10
	jsr	@r10
	mov.w	r0,@(26,r1)
	shll	r10
	shll	r11
	shll8	r10
	shll8	r11
	mov.l	.L0601E544,r8
	mov.l	.L0601E548,r9
	sub	r10,r8
	sub	r11,r9
	mov.l	r8,@(48,r1)
	mov.l	r9,@(52,r1)
	mov.l	.L0601E54C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0601E538:
	.short 0x0000
.L0601E53A:
	.short 0x0400
.L0601E53C:
	.long math_angle_step_toward
.L0601E540:
	.long math_sincos
.L0601E544:
	.long 0x00B00000
.L0601E548:
	.long 0x00C60000
.L0601E54C:
	.long spr_draw_obj
	endlabel func_0601E500

	glabel func_0601E550
	sts.l	pr,@-r15
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bt	.L0601E578
	mov.l	.L0601E580,r2
	mov.l	.L0601E584,r0
	jsr	@r0
	nop
	mov.l	.L0601E588,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r1,@(16,r3)
	mov.l	.L0601E58C,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601E590,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0601E594,r0
	mov.l	r0,@(56,r3)
	mov.b	@(1,r1),r0
	mov.b	r0,@(1,r3)
.L0601E578:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601E580:
	.long obj_list_load_scene
.L0601E584:
	.long obj_alloc
.L0601E588:
	.long func_0601E598
.L0601E58C:
	.long 0x00E00000
.L0601E590:
	.long 0x00B40000
.L0601E594:
	.long 0x00000000
	endlabel func_0601E550

	glabel func_0601E598
	mov.w	.L0601E5AE,r0
	mov.w	r0,@(22,r1)
	mov.w	.L0601E5B0,r0
	mov.w	r0,@(28,r1)
	mov.l	.L0601E5B4,r2
	mov.l	r2,@(44,r1)
	mov.l	.L0601E5B8,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601E5AE:
	.short 0x0120
.L0601E5B0:
	.short 0x1FFC
	.byte 0x00, 0x00
.L0601E5B4:
	.long D_0601D780
.L0601E5B8:
	.long func_0601E5BC
	endlabel func_0601E598

	glabel func_0601E5BC
	mov.l	@(16,r1),r3
	mov.b	@(0,r3),r0
	tst	r0,r0
	bt	.L0601E5D0
	mov.l	.L0601E5CC,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0601E5CC:
	.long obj_free
.L0601E5D0:
	sts.l	pr,@-r15
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0601E5DE
	lds.l	@r15+,pr
	rts
	nop
.L0601E5DE:
	mov.l	.L0601E5FC,r2
	mov.l	@r2,r4
	mov.l	.L0601E600,r14
	jsr	@r14
	mov	#6,r14
	mov.l	.L0601E604,r13
	jsr	@r13
	nop
	mov.l	.L0601E608,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601E5FC:
	.long score
.L0601E600:
	.long math_bin_to_bcd
.L0601E604:
	.long spr_build_number
.L0601E608:
	.long spr_draw_obj
	endlabel func_0601E5BC

	glabel func_0601E60C
	sts.l	pr,@-r15
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bt	.L0601E62C
	mov.l	.L0601E634,r2
	mov.l	.L0601E638,r0
	jsr	@r0
	nop
	mov.l	.L0601E63C,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r1,@(16,r3)
	mov.l	.L0601E640,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601E644,r0
	mov.l	r0,@(52,r3)
.L0601E62C:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601E634:
	.long obj_list_load_scene
.L0601E638:
	.long obj_alloc
.L0601E63C:
	.long func_0601E648
.L0601E640:
	.long 0x00740000
.L0601E644:
	.long 0x00C60000
	endlabel func_0601E60C

	glabel func_0601E648
	mov.w	.L0601E662,r0
	mov.w	r0,@(22,r1)
	mov.l	.L0601E664,r0
	mov.l	r0,@(56,r1)
	mov.l	.L0601E668,r2
	mov.l	r2,@(44,r1)
	mov	#0,r0
	mov.b	r0,@(12,r1)
	mov.l	.L0601E66C,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601E662:
	.short 0x0100
.L0601E664:
	.long 0x00000000
.L0601E668:
	.long D_06013064
.L0601E66C:
	.long func_0601E670
	endlabel func_0601E648

	glabel func_0601E670
	mov.l	@(16,r1),r3
	mov.b	@(0,r3),r0
	tst	r0,r0
	bt	.L0601E684
	mov.l	.L0601E680,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0601E680:
	.long obj_free
.L0601E684:
	sts.l	pr,@-r15
	mov.l	.L0601E6B0,r0
	jsr	@r0
	nop
	cmp/eq	#1,r0
	bf	.L0601E6A8
	mov.b	@(12,r1),r0
	add	#1,r0
	cmp/eq	#20,r0
	bf	.L0601E69A
	mov	#0,r0
.L0601E69A:
	mov.b	r0,@(12,r1)
	mov	#9,r2
	cmp/gt	r2,r0
	bt	.L0601E6A8
	mov.l	.L0601E6B4,r0
	jsr	@r0
	nop
.L0601E6A8:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601E6B0:
	.long func_06047444
.L0601E6B4:
	.long spr_draw_obj
	endlabel func_0601E670

	glabel func_0601E6B8
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bt	.L0601E73E
	sts.l	pr,@-r15
	mov.l	.L0601E708,r2
	mov.l	.L0601E70C,r0
	jsr	@r0
	nop
	mov.l	.L0601E710,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r1,@(16,r3)
	mov.l	.L0601E714,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601E718,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0601E71C,r0
	mov.l	r0,@(40,r3)
	mov.l	.L0601E720,r2
	mov.b	@(22,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov	#5,r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	.L0601E724,r10
	mov.l	@r10,r8
	mov.l	.L0601E728,r9
	mov	#0,r7
.L0601E6F4:
	mov.l	@r9+,r0
	dmuls.l	r0,r2
	sts	mach,r0
	sts	macl,r10
	xtrct	r0,r10
	cmp/ge	r10,r8
	bt	.L0601E72C
	add	#1,r7
	bra	.L0601E6F4
	nop
.L0601E708:
	.long obj_list_load_scene
.L0601E70C:
	.long obj_alloc
.L0601E710:
	.long func_0601E290
.L0601E714:
	.long 0x00000000
.L0601E718:
	.long 0x00080000
.L0601E71C:
	.long D_06051D48
.L0601E720:
	.long D_0601D210
.L0601E724:
	.long score
.L0601E728:
	.long D_0601D1F8
.L0601E72C:
	mov	r7,r0
	mov.b	r0,@(2,r3)
	mov.l	.L0601E744,r2
	mov	#5,r0
	mov.b	r7,@(r0,r2)
	mov	#1,r0
	mov.l	.L0601E748,r2
	mov.b	r0,@r2
	lds.l	@r15+,pr
.L0601E73E:
	rts
	nop
	.byte 0x00, 0x00
.L0601E744:
	.long grade
.L0601E748:
	.long D_0601D0B1
	endlabel func_0601E6B8

	glabel func_0601E74C
	sts.l	pr,@-r15
	mov.l	.L0601E770,r2
	mov.l	.L0601E774,r0
	jsr	@r0
	nop
	mov.l	.L0601E778,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L0601E77C,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601E780,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0601E784,r0
	mov.l	r0,@(40,r3)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601E770:
	.long obj_list_stage
.L0601E774:
	.long obj_alloc
.L0601E778:
	.long func_0601E788
.L0601E77C:
	.long 0x00000000
.L0601E780:
	.long 0x00280000
.L0601E784:
	.long D_06051D48
	endlabel func_0601E74C

	glabel func_0601E788
	mov.w	.L0601E7B2,r0
	mov.w	r0,@(28,r1)
	mov.l	.L0601E7B8,r3
	mov.l	.L0601E7BC,r2
	mov.l	.L0601E7C0,r2
	mov.w	.L0601E7B4,r7
.L0601E794:
	mov.w	@r2+,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L0601E794
	add	#2,r3
	mov	#-1,r0
	mov.b	r0,@(10,r1)
	mov.w	.L0601E7B6,r0
	mov.w	r0,@(4,r1)
	mov.w	r0,@(0,r1)
	mov.l	.L0601E7C4,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601E7B2:
	.short 0x1B20
.L0601E7B4:
	.short 0x0048
.L0601E7B6:
	.short 0x0000
.L0601E7B8:
	.long VDP1_VRAM + 0xD900
.L0601E7BC:
	.long D_06052364
.L0601E7C0:
	.long func_0601D2E4
.L0601E7C4:
	.long func_0601E7C8
	endlabel func_0601E788

	glabel func_0601E7C8
	sts.l	pr,@-r15
	mov.l	.L0601E7F4,r2
	mov.b	@(10,r1),r0
	cmp/pz	r0
	bf	.L0601E830
	shll	r0
	mov.w	@(r0,r2),r0
	mov.w	r0,@(8,r1)
	bsr	func_0601E864
	nop
	mov.w	@(22,r1),r0
	mov.w	.L0601E7F0,r2
	add	r2,r0
	mov.w	r0,@(26,r1)
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0601E7F8
	lds.l	@r15+,pr
	rts
	nop
.L0601E7F0:
	.short 0xF000
	.byte 0x00, 0x00
.L0601E7F4:
	.long D_0601D2D8
.L0601E7F8:
	mov.l	.L0601E838,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0601E83C,r6
	mov.l	.L0601E840,r0
	jsr	@r0
	nop
	mov.l	.L0601E844,r0
	mov	r0,r4
	mov	r0,r5
	mov.l	.L0601E848,r6
	mov.l	.L0601E84C,r0
	jsr	@r0
	nop
	mov.w	@(26,r1),r0
	mov.l	.L0601E850,r2
	jsr	@r2
	nop
	mov.l	.L0601E854,r2
	mov.l	.L0601E858,r6
	mov.l	.L0601E85C,r0
	jsr	@r0
	nop
	mov.l	.L0601E860,r0
	jsr	@r0
	nop
.L0601E830:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601E838:
	.long mtx_push_identity
.L0601E83C:
	.long 0x01000000
.L0601E840:
	.long mtx_translate
.L0601E844:
	.long 0x00020000
.L0601E848:
	.long 0x00030000
.L0601E84C:
	.long mtx_scale
.L0601E850:
	.long mtx_rot_x
.L0601E854:
	.long D_06051D48
.L0601E858:
	.long 0xFF200000
.L0601E85C:
	.long func_0601F428
.L0601E860:
	.long mtx_pop
	endlabel func_0601E7C8

	glabel func_0601E864
	mov	#8,r0
	mov.w	@(r0,r1),r2
	mov.w	@(22,r1),r0
	cmp/eq	r0,r2
	bt	.L0601E880
	sts.l	pr,@-r15
	mov	r0,r8
	mov.l	.L0601E8A0,r0
	mov.w	.L0601E89A,r10
	jsr	@r0
	mov	r2,r9
	mov	#22,r0
	mov.w	r8,@(r0,r1)
	lds.l	@r15+,pr
.L0601E880:
	mov.l	.L0601E8A4,r3
	mov.l	.L0601E8A8,r4
	mov.b	@(10,r1),r0
	shll2	r0
	mov.l	@(r0,r4),r2
	mov.w	.L0601E89C,r7
.L0601E88C:
	mov.w	@r2+,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L0601E88C
	add	#2,r3
	rts
	nop
.L0601E89A:
	.short 0x0600
.L0601E89C:
	.short 0x0048
	.byte 0x00, 0x00
.L0601E8A0:
	.long math_angle_step_toward
.L0601E8A4:
	.long VDP1_VRAM + 0xD900
.L0601E8A8:
	.long D_0601D6E8
	endlabel func_0601E864

	glabel func_0601E8AC
	mov.b	@(27,gbr),r0
	cmp/pl	r0
	bt	.L0601E8B6
	rts
	nop
.L0601E8B6:
	mov.l	.L0601E914,r0
	mov.l	@r0,r0
	mov.l	.L0601E918,r3
	add	r0,r3
	mov	#80,r9
	mov.l	.L0601E91C,r0
	mov.b	@r0,r0
	mulu.w	r0,r9
	mov	r3,r4
	sts	macl,r9
	add	r9,r4
	mov	r4,r5
	add	#32,r5
	mov.l	@(656,gbr),r0
	mov	r0,r8
	mov.b	@(22,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r5),r9
	cmp/ge	r9,r8
	bf	.L0601E8E2
	mov.l	r8,@(r0,r5)
.L0601E8E2:
	mov.l	.L0601E920,r2
	mov.b	@r2,r7
	mov	r4,r5
	mov	#64,r6
	add	r5,r6
	mov.b	@(22,gbr),r0
	shlr	r0
	mov.b	@(r0,r6),r8
	extu.b	r8,r8
	cmp/ge	r8,r7
	bt	.L0601E8FA
	mov.b	r7,@(r0,r6)
.L0601E8FA:
	mov	r4,r5
	mov	#72,r6
	add	r5,r6
	mov.b	@(25,gbr),r0
	shlr	r0
	mov.b	@(r0,r6),r8
	cmp/pz	r8
	bt	.L0601E924
	mov	#0,r8
	mov.b	r8,@(r0,r6)
	bra	.L0601E932
	mov	#-10,r9
	.byte 0x00, 0x00
.L0601E914:
	.long D_060CB014
.L0601E918:
	.long 0x00000528
.L0601E91C:
	.long D_060CB003
.L0601E920:
	.long D_060FFEBD
.L0601E924:
	add	#2,r8
	mov	#10,r7
	cmp/ge	r7,r8
	bf	.L0601E92E
	mov	r7,r8
.L0601E92E:
	mov.b	r8,@(r0,r6)
	mov	#-1,r9
.L0601E932:
	mov	#8,r7
.L0601E934:
	mov.b	@r6,r0
	cmp/pz	r0
	bf	.L0601E944
	add	r9,r0
	cmp/pz	r0
	bt	.L0601E942
	mov	#0,r0
.L0601E942:
	mov.b	r0,@r6
.L0601E944:
	dt	r7
	bf/s	.L0601E934
	add	#1,r6
	rts
	nop
	.byte 0x00, 0x00
	endlabel func_0601E8AC

	glabel func_0601E950
	mov.l	.L0601E9BC,r7
	mov.l	.L0601E9C0,r6
	mov	#-1,r0
	mov.w	r0,@r7
	mova	.L0601E9E0,r0
	mov	#7,r1
	and	r1,r4
	mov	r4,r1
	shlr2	r1
	mov.b	@(r0,r1),r0
	mov.w	r0,@(0,r6)
	mov	#0,r0
	mov.w	r0,@(2,r6)
	mov	#2,r0
	mov.w	r0,@(4,r6)
	mov	#0,r0
	mov.w	r0,@(6,r6)
	mov.w	r0,@(8,r6)
	mov.w	.L0601E9B6,r0
	mov.w	r0,@(10,r6)
	mov.w	.L0601E9B8,r0
	mov.w	r0,@(64,gbr)
	mov	#0,r0
	mov.b	r0,@(62,gbr)
	mov.w	r0,@(68,gbr)
	mov.l	.L0601E9C4,r9
	mov.w	.L0601E9B8,r7
.L0601E986:
	mov.l	r0,@r9
	dt	r7
	bf/s	.L0601E986
	add	#4,r9
	endlabel func_0601E950

	glabel func_0601E98E
	mov.l	.L0601E9C8,r8
	mov	r8,r0
	mov.l	r0,@(808,gbr)
	mov.l	r0,@(92,gbr)
	mov.l	@(740,gbr),r0
	add	r0,r8
	mov	r8,r0
	mov.l	r0,@(812,gbr)
	mov.l	r0,@(96,gbr)
	mov.l	.L0601E9CC,r8
	mov	r8,r0
	mov.l	r0,@(816,gbr)
	mov.l	@(740,gbr),r0
	add	r0,r8
	mov	r8,r0
	mov.l	r0,@(820,gbr)
	mov	#0,r0
	mov.b	r0,@(50,gbr)
	bra	.L0601E9E2
	nop
.L0601E9B6:
	.short 0x58E0
.L0601E9B8:
	.short 0x0200
	.byte 0x00, 0x00
.L0601E9BC:
	.long VDP1_VRAM
.L0601E9C0:
	.long VDP1_REGS
.L0601E9C4:
	.long D_060F0000
.L0601E9C8:
	.long vdp1_list_buf
.L0601E9CC:
	.long vdp1_alt_list_buf
	.byte 0x00, 0xA0, 0x00, 0x70, 0x00, 0xA0, 0x00, 0x78, 0x00, 0xB0, 0x00, 0x70, 0x00, 0xB0, 0x00, 0x78
.L0601E9E0:
	.byte 0x00, 0x01
.L0601E9E2:
	sts.l	pr,@-r15
	mov.l	.L0601EA14,r2
	mov.l	.L0601EA18,r0
	jsr	@r0
	nop
	mov.l	.L0601EA1C,r2
	mov.l	.L0601EA18,r0
	jsr	@r0
	nop
	mov.l	.L0601EA20,r2
	mov.l	.L0601EA18,r0
	jsr	@r0
	nop
	mov.l	.L0601EA24,r2
	mov.l	.L0601EA18,r0
	jsr	@r0
	nop
	mov.l	.L0601EA28,r2
	mov.l	.L0601EA18,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601EA14:
	.long D_0601EA68
.L0601EA18:
	.long func_0601EA2C
.L0601EA1C:
	.long D_0602B5B0
.L0601EA20:
	.long D_06030064
.L0601EA24:
	.long D_06010F48
.L0601EA28:
	.long D_0603B5D8
	endlabel func_0601E98E

	glabel func_0601EA2C
	mov.l	.L0601EA58,r3
	mov.b	@r3,r3
	cmp/pz	r3
	bt	.L0601EA36
	mov	#0,r3
.L0601EA36:
	mov	#3,r0
	cmp/ge	r0,r3
	bf	.L0601EA3E
	mov	r0,r3
.L0601EA3E:
	shll2	r3
.L0601EA40:
	mov.l	@r2,r8
	cmp/pz	r8
	bf	.L0601EA62
	mov.l	@(4,r2),r9
	mov.l	@(8,r2),r10
	add	r3,r9
	mov.l	@r9,r0
	tst	r10,r10
	bt	.L0601EA5C
	bra	.L0601EA5E
	mov.l	r0,@r8
	.byte 0x00, 0x00
.L0601EA58:
	.long D_060CB001
.L0601EA5C:
	mov.w	r0,@r8
.L0601EA5E:
	bra	.L0601EA40
	add	#12,r2
.L0601EA62:
	rts
	nop
	.byte 0x00, 0x09
	dlabel D_0601EA68
	.long lbl_0601F66C
	.long D_0601EAF0
	.byte 0x00, 0x00, 0x00, 0x01
	.long lbl_0601FE78
	.long D_0601EAF0
	.byte 0x00, 0x00, 0x00, 0x01
	.long lbl_060216D8
	.long D_0601EAF0
	.byte 0x00, 0x00, 0x00, 0x01
	.long lbl_060218B8
	.long D_0601EAF0
	.byte 0x00, 0x00, 0x00, 0x01
	.long lbl_0601F73E
	.long D_0601EAFC
	.byte 0x00, 0x00, 0x00, 0x00
	.long lbl_0601FF6A
	.long D_0601EAFC
	.byte 0x00, 0x00, 0x00, 0x00
	.long lbl_060209AA
	.long D_0601EB08
	.byte 0x00, 0x00, 0x00, 0x00
	.long lbl_06020D5A
	.long D_0601EB08
	.byte 0x00, 0x00, 0x00, 0x00
	.long lbl_06020E9A
	.long D_0601EB08
	.byte 0x00, 0x00, 0x00, 0x00
	.long lbl_06021220
	.long D_0601EB08
	.byte 0x00, 0x00, 0x00, 0x00
	.long lbl_06021302
	.long D_0601EAFC
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_0601EAF0
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0xC7, 0x1C, 0x00, 0x00, 0xE0, 0x00
	dlabel D_0601EAFC
	.byte 0x00, 0x09, 0x30, 0x18, 0x00, 0x09, 0x30, 0x1C, 0x00, 0x09, 0x00, 0x09
	dlabel D_0601EB08
	.byte 0x00, 0x09, 0x30, 0xE8, 0x00, 0x09, 0x30, 0xEC, 0x00, 0x09, 0x00, 0x09
	endlabel func_0601EA2C

	glabel func_0601EB14
	sts.l	pr,@-r15
	mov.b	@(20,gbr),r0
	mov.l	.L0601EB50,r2
	shll2	r0
	mov.l	@(r0,r2),r0
	mov.l	r0,@(740,gbr)
	shlr2	r0
	shlr2	r0
	shlr	r0
	mov.w	r0,@(64,gbr)
	bsr	func_0601E98E
	nop
	mov.l	.L0601EB54,r4
	mov.b	@(20,gbr),r0
	cmp/eq	#13,r0
	bt	.L0601EB38
	cmp/eq	#15,r0
	bf	.L0601EB3A
.L0601EB38:
	mov.l	.L0601EB58,r4
.L0601EB3A:
	mov.w	@r4,r0
	mov.l	.L0601EB5C,r5
	mov.w	r0,@(0,r5)
	mov.w	r0,@(2,r5)
	mov.l	.L0601EB60,r5
	mov.w	r0,@(0,r5)
	mov.w	r0,@(2,r5)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601EB50:
	.long D_0601EB68
.L0601EB54:
	.long D_0601EB64
.L0601EB58:
	.long D_0601EB66
.L0601EB5C:
	.long vdp1_zsort_insert
.L0601EB60:
	.long func_0601F2A6
	dlabel D_0601EB64
	.byte 0x00, 0x09
	dlabel D_0601EB66
	.byte 0x46, 0x21
	endlabel func_0601EB14

	.section .data.0601EB68,"aw",@progbits
	.p2align 2
	dlabel D_0601EB68
	.byte 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x40, 0x00
	.byte 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x60, 0x00
