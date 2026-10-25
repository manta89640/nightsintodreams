	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060400FC,"ax",@progbits
	.p2align 2

	glabel func_060400FC
	sts.l	pr,@-r15
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L06040108
	bra	.L060401D8
	nop
.L06040108:
	mov.w	@(22,r1),r0
	mov.w	.L06040156,r4
	add	r4,r0
	mov.w	r0,@(22,r1)
	mov.l	.L06040158,r8
	mov.w	@(4,r1),r0
	shll8	r0
	dmuls.l	r0,r8
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	mov.l	.L0604015C,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bf	.L060401D8
	mov.l	.L06040160,r2
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	mov.w	@(26,r1),r0
	mov	r0,r13
	mov.l	.L06040164,r10
	jsr	@r10
	nop
	cmp/pz	r0
	bf	.L060401D8
	mov.l	.L06040168,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L0604016C
	bra	.L060401B4
	nop
.L06040156:
	.short 0x0080
.L06040158:
	.long 0x00500000
.L0604015C:
	.long obj_find_near_player
.L06040160:
	.long D_060402AA
.L06040164:
	.long func_060175BE
.L06040168:
	.long player_obj
.L0604016C:
	mov.l	r0,@-r15
	mov.l	.L060401E8,r7
	shll2	r0
	shll2	r0
	add	r0,r7
	mov.w	.L060401E4,r0
	mov.w	r0,@(0,r7)
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bf	.L0604019C
	mov.b	@(61,gbr),r0
	cmp/eq	#2,r0
	bt	.L0604019C
	mov.l	r1,@-r15
	mov	#1,r0
	mov.b	r0,@(61,gbr)
	mov	#3,r4
	mov.l	.L060401EC,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	mov.l	.L060401F0,r0
	jsr	@r0
	nop
.L0604019C:
	mov.l	.L060401F4,r2
	mov.l	@r15+,r0
	shll8	r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.w	.L060401E6,r7
	mov	#0,r0
.L060401AC:
	mov.l	r0,@(12,r2)
	dt	r7
	bf/s	.L060401AC
	add	#16,r2
.L060401B4:
	mov	#60,r0
	mov.w	r0,@(8,r1)
	mov.l	.L060401F8,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.l	.L060401FC,r4
	mov.l	@r4,r4
	mov	#0,r0
	mov.w	r0,@(2,r4)
	mov.l	.L06040200,r2
	mov	#48,r7
	mov	#0,r0
.L060401CC:
	mov.b	r0,@r2
	dt	r7
	bf/s	.L060401CC
	add	#1,r2
	mov.l	.L06040204,r2
	mov.w	r0,@r2
.L060401D8:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06040208
	lds.l	@r15+,pr
	rts
	nop
.L060401E4:
	.short 0x01E0
.L060401E6:
	.short 0x0100
.L060401E8:
	.long D_060FFE70
.L060401EC:
	.long cd_play_track
.L060401F0:
	.long snd_bgm_fade_out
.L060401F4:
	.long D_060F6DF8
.L060401F8:
	.long func_06040280
.L060401FC:
	.long D_060F3088
.L06040200:
	.long D_06016888
.L06040204:
	.long D_060168B8
.L06040208:
	mov.l	.L0604025C,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06040260,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r4
	mov	r0,r5
	mov.l	.L06040264,r14
	jsr	@r14
	mov	r0,r6
	mov.l	.L06040268,r14
	jsr	@r14
	mov.w	@(24,r1),r0
	mov.l	.L0604026C,r14
	jsr	@r14
	mov.w	@(26,r1),r0
	mov.b	@(108,gbr),r0
	tst	#128,r0
	mov.w	@(22,r1),r0
	bt	.L0604023E
	mov.w	.L06040258,r8
	add	r8,r0
.L0604023E:
	mov.l	.L06040270,r14
	jsr	@r14
	mov.w	r0,@(22,r1)
	mov.l	.L06040274,r2
	mov.l	.L06040278,r0
	jsr	@r0
	nop
	mov.l	.L0604027C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06040258:
	.short 0xFE00
	.byte 0x00, 0x00
.L0604025C:
	.long mtx_push
.L06040260:
	.long mtx_translate
.L06040264:
	.long mtx_scale
.L06040268:
	.long mtx_rot_y
.L0604026C:
	.long mtx_rot_z
.L06040270:
	.long mtx_rot_x
.L06040274:
	.long D_06080330
.L06040278:
	.long poly_draw_model_color
.L0604027C:
	.long mtx_pop
	endlabel func_060400FC

	glabel func_06040280
	mov.w	@(8,r1),r0
	dt	r0
	bf	.L0604029C
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	tst	r2,r2
	bt	.L06040292
	mov	#-2,r0
	mov.b	r0,@(1,r2)
.L06040292:
	mov.l	.L06040298,r0
	jmp	@r0
	nop
.L06040298:
	.long obj_free
.L0604029C:
	mov.w	r0,@(8,r1)
	sts.l	pr,@-r15
	mov.w	@(4,r1),r0
	add	#-16,r0
	mov.w	r0,@(4,r1)
	bra	.L060401D8
	nop
	dlabel D_060402AA
	.byte 0x00, 0x00
	endlabel func_06040280

	.section .data.060402AC,"aw",@progbits
	.p2align 2
	.byte 0x40, 0x30, 0x2D, 0x20, 0x40, 0x32, 0x41, 0x40, 0x30, 0x43, 0x52, 0x4F, 0x42, 0x41, 0x54, 0xFE
	.byte 0x40, 0x30, 0x20, 0x54, 0x40, 0x32, 0x49, 0x40, 0x30, 0x4D, 0x45, 0x21, 0x21, 0x20, 0x2D, 0xFE
	.byte 0x40, 0x30, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFE, 0x09, 0xE0, 0xF8
	.byte 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x07, 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01, 0x40, 0x2B
	.byte 0x00, 0x09, 0x00, 0x00
	.long obj_free
