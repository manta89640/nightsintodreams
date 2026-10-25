	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060407E0,"ax",@progbits
	.p2align 2

	glabel func_060407E0
	sts.l	pr,@-r15
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L060407EC
	bra	.L06040932
	nop
.L060407EC:
	mov.w	.L060408BE,r0
	mov.w	r0,@(28,r1)
	mov.l	.L060408C4,r8
	mov.w	@(4,r1),r0
	shll8	r0
	dmuls.l	r0,r8
	sts	macl,r8
	mov.l	.L060408C8,r10
	jsr	@r10
	nop
	cmp/pz	r0
	bf	.L06040880
	mov.b	@(0,r1),r0
	tst	#1,r0
	bt	.L06040842
	mov.w	.L060408C0,r8
	bsr	func_06040A90
	nop
	cmp/pz	r0
	bf	.L06040842
	bsr	func_060408DC
	nop
	mov.b	@(0,r1),r0
	and	#2,r0
	mov.b	r0,@(0,r1)
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#13,r6
	mov.l	.L060408CC,r0
	jsr	@r0
	mov	#5,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L060408D0,r12
	bsr	func_06040AFC
	nop
.L06040842:
	mov.b	@(0,r1),r0
	tst	#2,r0
	bt	.L06040880
	mov.w	.L060408C2,r8
	bsr	func_06040A90
	nop
	cmp/pz	r0
	bf	.L06040880
	bsr	func_060408DC
	nop
	mov.b	@(0,r1),r0
	and	#1,r0
	mov.b	r0,@(0,r1)
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#13,r6
	mov.l	.L060408CC,r0
	jsr	@r0
	mov	#5,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L060408D4,r12
	bsr	func_06040AFC
	nop
.L06040880:
	mov.b	@(0,r1),r0
	tst	r0,r0
	bf	.L060408BA
	mov	#60,r0
	mov.w	r0,@(8,r1)
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	tst	r2,r2
	bt	.L06040896
	mov	#-2,r0
	mov.b	r0,@(1,r2)
.L06040896:
	mov.l	.L060408D8,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#14,r6
	mov.l	.L060408CC,r0
	jsr	@r0
	mov	#5,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L060408BA:
	bra	.L06040932
	nop
.L060408BE:
	.short 0x1B04
.L060408C0:
	.short 0xC000
.L060408C2:
	.short 0x0000
.L060408C4:
	.long 0x00000080
.L060408C8:
	.long obj_find_near_player
.L060408CC:
	.long snd_seq_start
.L060408D0:
	.long D_060806F0
.L060408D4:
	.long D_060807BC
.L060408D8:
	.long func_06040918
	endlabel func_060407E0

	glabel func_060408DC
	sts.l	pr,@-r15
	mov	r0,r6
	mov.l	.L0604090C,r7
	mov.b	@(7,r7),r0
	add	#2,r0
	mov	#100,r8
	cmp/ge	r8,r0
	bf	.L060408EE
	mov	r8,r0
.L060408EE:
	mov.b	r0,@(7,r7)
	mov.w	.L06040908,r3
	mov	#1,r9
	mov.l	.L06040910,r0
	jsr	@r0
	nop
	add	#1,r2
	muls.w	r2,r3
	sts	macl,r0
	lds.l	@r15+,pr
	mov.l	.L06040914,r14
	jmp	@r14
	nop
.L06040908:
	.short 0x000A
	.byte 0x00, 0x00
.L0604090C:
	.long play_state
.L06040910:
	.long func_0603D6E0
.L06040914:
	.long func_0601A2BC
	endlabel func_060408DC

	glabel func_06040918
	mov.w	@(8,r1),r0
	dt	r0
	bf	.L06040928
	mov.l	.L06040924,r0
	jmp	@r0
	nop
.L06040924:
	.long obj_free
.L06040928:
	mov.w	r0,@(8,r1)
	sts.l	pr,@-r15
	mov.w	@(4,r1),r0
	add	#16,r0
	mov.w	r0,@(4,r1)
.L06040932:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0604093E
	lds.l	@r15+,pr
	rts
	nop
.L0604093E:
	mov.l	.L060409C8,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L060409CC,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r4
	mov.b	@(108,gbr),r0
	tst	#128,r0
	bt	.L06040966
	mov.l	.L060409D0,r5
	mov.l	@r5,r0
	dmuls.l	r0,r4
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
.L06040966:
	mov	r4,r5
	mov.l	.L060409D4,r14
	jsr	@r14
	mov	r4,r6
	mov.l	.L060409D8,r14
	jsr	@r14
	mov.w	@(24,r1),r0
	mov.l	.L060409DC,r14
	jsr	@r14
	mov.w	@(26,r1),r0
	mov.l	.L060409E0,r14
	jsr	@r14
	mov.w	@(22,r1),r0
	mov	#3,r3
	mov.b	@(0,r1),r0
	tst	#3,r0
	bt	.L0604099A
	mov	#0,r3
	mov.b	@(0,r1),r0
	tst	#1,r0
	bf	.L06040992
	mov	#2,r3
.L06040992:
	mov.b	@(0,r1),r0
	tst	#2,r0
	bf	.L0604099A
	mov	#1,r3
.L0604099A:
	mov.l	.L060409E4,r0
	jsr	@r0
	nop
	shll2	r3
	shll2	r3
	shll2	r2
	add	r2,r3
	mov.b	@(20,gbr),r0
	cmp/eq	#8,r0
	bt	.L060409F4
	mov.l	.L060409E8,r2
	add	r3,r2
	mov.l	@r2,r2
	mov.l	.L060409EC,r0
	jsr	@r0
	nop
	mov.l	.L060409F0,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L060409C8:
	.long mtx_push
.L060409CC:
	.long mtx_translate
.L060409D0:
	.long D_0603D2F8
.L060409D4:
	.long mtx_scale
.L060409D8:
	.long mtx_rot_y
.L060409DC:
	.long mtx_rot_z
.L060409E0:
	.long mtx_rot_x
.L060409E4:
	.long func_0603D6E0
.L060409E8:
	.long D_06040A50
.L060409EC:
	.long poly_draw_model_color
.L060409F0:
	.long mtx_pop
.L060409F4:
	mov.w	@(2,r1),r0
	shlr2	r0
	shlr2	r0
	cmp/eq	#1,r0
	bt	.L06040A0E
	mov.l	.L06040A3C,r2
	add	r3,r2
	mov.l	@r2,r2
	mov.l	r2,@-r15
	mov.l	.L06040A40,r0
	jsr	@r0
	nop
	mov.l	@r15+,r2
.L06040A0E:
	mov.w	@(2,r1),r0
	shlr2	r0
	shlr2	r0
	cmp/eq	#0,r0
	bt	.L06040A2E
	mov.l	r2,@-r15
	mov	#0,r4
	mov	#0,r5
	mov.l	.L06040A44,r6
	mov.l	.L06040A48,r0
	jsr	@r0
	nop
	mov.l	@r15+,r2
	mov.l	.L06040A40,r0
	jsr	@r0
	nop
.L06040A2E:
	mov.l	.L06040A4C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06040A3C:
	.long D_06040A50
.L06040A40:
	.long poly_draw_model_color
.L06040A44:
	.long 0x00800000
.L06040A48:
	.long mtx_translate
.L06040A4C:
	.long mtx_pop
	dlabel D_06040A50
	.long D_06082154
	.long D_06082168
	.long D_0608217C
	.long D_06082190
	.long D_060821A4
	.long D_060821B8
	.long D_060821CC
	.long D_060821E0
	.long D_060821F4
	.long D_06082208
	.long D_0608221C
	.long D_06082230
	.long D_06082244
	.long D_06082258
	.long D_0608226C
	.long D_06082280
	endlabel func_06040918

	glabel func_06040A90
	sts.l	pr,@-r15
	mov.w	@(22,r1),r0
	tst	r0,r0
	bt	.L06040AC0
	mov.l	.L06040AB8,r2
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	sub	r8,r0
	mov	r0,r12
	mov	#0,r13
	mov.l	.L06040ABC,r10
	jsr	@r10
	nop
	bra	.L06040ADE
	nop
.L06040AB8:
	.long D_06040AF4
.L06040ABC:
	.long func_060175BE
.L06040AC0:
	mov.l	.L06040AE4,r2
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	mov.w	@(26,r1),r0
	add	r8,r0
	mov	r0,r13
	mov.l	.L06040AE8,r10
	jsr	@r10
	nop
.L06040ADE:
	lds.l	@r15+,pr
	rts
	nop
.L06040AE4:
	.long D_06040AEC
.L06040AE8:
	.long func_060175BE
	dlabel D_06040AEC
	.byte 0xFF, 0xCE, 0xFF, 0x88, 0x00, 0x32, 0x00, 0x00
	dlabel D_06040AF4
	.byte 0xFF, 0x88, 0xFF, 0xCE, 0x00, 0x00, 0x00, 0x32
	endlabel func_06040A90

	glabel func_06040AFC
	sts.l	pr,@-r15
	mov.l	.L06040BBC,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06040BC0,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r4
	mov	r0,r5
	mov.l	.L06040BC4,r14
	jsr	@r14
	mov	r0,r6
	mov.l	.L06040BC8,r14
	jsr	@r14
	mov.w	@(24,r1),r0
	mov.l	.L06040BCC,r14
	jsr	@r14
	mov.w	@(26,r1),r0
	mov.l	.L06040BD0,r14
	jsr	@r14
	mov.w	@(22,r1),r0
	mov	r12,r10
	mov.l	.L06040BD4,r11
	mov.l	.L06040BD8,r0
	jsr	@r0
	mov	#17,r9
	mov.l	.L06040BDC,r0
	jsr	@r0
	nop
	mov.l	.L06040BE0,r4
	mov.l	@r4,r4
	mov.l	@(32,r4),r5
	mov	r5,r0
	shar	r5
	add	r0,r5
	mov.l	.L06040BE4,r14
	jsr	@r14
	mov.w	@(24,r4),r0
	shll2	r10
	shll2	r11
	dmuls.l	r10,r5
	sts	mach,r0
	sts	macl,r6
	xtrct	r0,r6
	neg	r6,r6
	dmuls.l	r11,r5
	sts	mach,r0
	sts	macl,r5
	xtrct	r0,r5
	mov.l	.L06040BD4,r4
	mov.l	.L06040BE8,r2
	mov	#17,r7
.L06040B6C:
	mov.l	.L06040BEC,r0
	jsr	@r0
	nop
	mov.l	.L06040BF0,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.w	.L06040BB6,r0
	mov.w	r0,@(28,r3)
	mov.l	.L06040BF4,r0
	jsr	@r0
	nop
	mov.l	.L06040BF8,r8
	and	r8,r0
	neg	r0,r0
	mov.l	r0,@(36,r3)
	mov.l	r5,@(32,r3)
	mov.l	r6,@(40,r3)
	mov	#0,r0
	mov.w	r0,@(20,r3)
	mov	r7,r0
	add	#12,r0
	mov.w	r0,@(8,r3)
	mov.l	@r4+,r0
	mov.l	r0,@(48,r3)
	mov.l	@r4+,r0
	mov.l	r0,@(52,r3)
	mov.l	@r4+,r0
	mov.l	r0,@(56,r3)
	mov.w	.L06040BB8,r0
	mov.w	r0,@(16,r3)
	mov.l	.L06040BFC,r0
	mov.l	r0,@(44,r3)
	dt	r7
	bf	.L06040B6C
	lds.l	@r15+,pr
	rts
	nop
.L06040BB6:
	.short 0x1B04
.L06040BB8:
	.short 0x0100
	.byte 0x00, 0x00
.L06040BBC:
	.long mtx_push_identity
.L06040BC0:
	.long mtx_translate
.L06040BC4:
	.long mtx_scale
.L06040BC8:
	.long mtx_rot_y
.L06040BCC:
	.long mtx_rot_z
.L06040BD0:
	.long mtx_rot_x
.L06040BD4:
	.long D_06040C00
.L06040BD8:
	.long mtx_transform_points
.L06040BDC:
	.long mtx_pop
.L06040BE0:
	.long player_obj
.L06040BE4:
	.long math_sincos
.L06040BE8:
	.long obj_list_stage
.L06040BEC:
	.long obj_alloc
.L06040BF0:
	.long func_06040CCC
.L06040BF4:
	.long math_rand
.L06040BF8:
	.long 0x0007FFFF
.L06040BFC:
	.long D_06014176
	endlabel func_06040AFC

	.section .data.06040C00,"aw",@progbits
	.p2align 2
	dlabel D_06040C00
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
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
