	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06041064,"ax",@progbits
	.p2align 2

	glabel func_06041064
	sts.l	pr,@-r15
	mov.b	@(1,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bf	.L06041070
	mov.b	r0,@(1,r1)
.L06041070:
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L0604107A
	bra	.L0604112C
	nop
.L0604107A:
	mov.l	.L060410C4,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L0604112C
	mov.l	.L060410C8,r2
	mov.l	.L060410CC,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov	#0,r12
	mov	#0,r13
	mov.l	.L060410D0,r0
	jsr	@r0
	mov	#4,r7
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L060410D4,r0
	sub	r0,r5
	mov.l	@(56,r1),r6
	mov.l	.L060410D8,r8
	mov.l	.L060410DC,r14
	jsr	@r14
	nop
	cmp/pz	r0
	bf	.L0604112C
	mov.b	@(0,r1),r0
	cmp/eq	#1,r0
	bf	.L060410E0
	mov	#0,r0
	mov.b	r0,@(0,r1)
	bsr	func_0604131C
	nop
	bsr	func_0604131C
	nop
	bra	.L0604112C
	nop
.L060410C4:
	.long player_obj
.L060410C8:
	.long D_06041034
.L060410CC:
	.long 0x00010000
.L060410D0:
	.long func_06017A98
.L060410D4:
	.long 0x003C0000
.L060410D8:
	.long 0x00460000
.L060410DC:
	.long func_060172E4
.L060410E0:
	mov.l	.L06041138,r9
	mov.l	@r9,r9
	mov.l	@(8,r9),r9
	mov.w	@(14,r9),r0
	tst	#15,r0
	bt	.L0604112C
	mov.b	@(1,r1),r0
	cmp/pl	r0
	bt	.L0604112C
	mov	#30,r0
	mov.b	r0,@(1,r1)
	mov.l	.L0604113C,r2
	mov.l	.L06041140,r4
	mov	#8,r7
.L060410FC:
	mov.l	.L06041144,r0
	jsr	@r0
	nop
	mov.l	.L06041148,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L06041138,r9
	mov.l	@r9,r9
	mov.l	@(48,r9),r0
	mov.l	@r4+,r8
	add	r8,r0
	mov.l	r0,@(48,r3)
	mov.l	@(52,r9),r0
	mov.l	.L0604114C,r8
	sub	r8,r0
	mov.l	r0,@(52,r3)
	mov.l	@(56,r9),r0
	mov.l	@r4+,r8
	add	r8,r0
	mov.l	r0,@(56,r3)
	mov.l	@r4+,r0
	mov.l	r0,@(36,r1)
	dt	r7
	bf	.L060410FC
.L0604112C:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06041150
	lds.l	@r15+,pr
	rts
	nop
.L06041138:
	.long player_obj
.L0604113C:
	.long obj_list_effect
.L06041140:
	.long D_060412BC
.L06041144:
	.long obj_alloc
.L06041148:
	.long func_060417E6
.L0604114C:
	.long 0x00100000
.L06041150:
	mov.l	.L0604117C,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06041180,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06041184,r10
	jsr	@r10
	mov.w	@(194,gbr),r0
	mov.l	.L06041188,r2
	mov.l	.L0604118C,r0
	jsr	@r0
	nop
	mov.l	.L06041190,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604117C:
	.long mtx_push
.L06041180:
	.long mtx_translate
.L06041184:
	.long mtx_rot_y
.L06041188:
	.long D_0609B9E8
.L0604118C:
	.long poly_draw_model_color
.L06041190:
	.long mtx_pop
	.byte 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01
	.byte 0x40, 0x2B, 0x00, 0x09
	.long obj_free
	endlabel func_06041064

	glabel func_060411AC
	sts.l	pr,@-r15
	mov.b	@(1,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bf	.L060411B8
	mov.b	r0,@(1,r1)
.L060411B8:
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L060411C2
	bra	.L06041254
	nop
.L060411C2:
	mov.l	.L060411F8,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L06041254
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L060411FC,r0
	sub	r0,r5
	mov.l	@(56,r1),r6
	mov.l	.L06041200,r8
	mov.l	.L06041204,r14
	jsr	@r14
	nop
	cmp/pz	r0
	bf	.L06041254
	mov.b	@(0,r1),r0
	cmp/eq	#1,r0
	bf	.L06041208
	mov	#0,r0
	mov.b	r0,@(0,r1)
	bsr	func_0604131C
	nop
	bsr	func_0604131C
	nop
	bra	.L06041254
	nop
.L060411F8:
	.long player_obj
.L060411FC:
	.long 0x003C0000
.L06041200:
	.long 0x00460000
.L06041204:
	.long func_060172E4
.L06041208:
	mov.l	.L06041260,r9
	mov.l	@r9,r9
	mov.l	@(8,r9),r9
	mov.w	@(14,r9),r0
	tst	#15,r0
	bt	.L06041254
	mov.b	@(1,r1),r0
	cmp/pl	r0
	bt	.L06041254
	mov	#30,r0
	mov.b	r0,@(1,r1)
	mov.l	.L06041264,r2
	mov.l	.L06041268,r4
	mov	#8,r7
.L06041224:
	mov.l	.L0604126C,r0
	jsr	@r0
	nop
	mov.l	.L06041270,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L06041260,r9
	mov.l	@r9,r9
	mov.l	@(48,r9),r0
	mov.l	@r4+,r8
	add	r8,r0
	mov.l	r0,@(48,r3)
	mov.l	@(52,r9),r0
	mov.l	.L06041274,r8
	sub	r8,r0
	mov.l	r0,@(52,r3)
	mov.l	@(56,r9),r0
	mov.l	@r4+,r8
	add	r8,r0
	mov.l	r0,@(56,r3)
	mov.l	@r4+,r0
	mov.l	r0,@(36,r1)
	dt	r7
	bf	.L06041224
.L06041254:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06041278
	lds.l	@r15+,pr
	rts
	nop
.L06041260:
	.long player_obj
.L06041264:
	.long obj_list_effect
.L06041268:
	.long D_060412BC
.L0604126C:
	.long obj_alloc
.L06041270:
	.long func_060417E6
.L06041274:
	.long 0x00100000
.L06041278:
	mov.l	.L060412A4,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L060412A8,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L060412AC,r10
	jsr	@r10
	mov.w	@(194,gbr),r0
	mov.l	.L060412B0,r2
	mov.l	.L060412B4,r0
	jsr	@r0
	nop
	mov.l	.L060412B8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L060412A4:
	.long mtx_push
.L060412A8:
	.long mtx_translate
.L060412AC:
	.long mtx_rot_y
.L060412B0:
	.long D_0609BAC8
.L060412B4:
	.long poly_draw_model_color
.L060412B8:
	.long mtx_pop
	dlabel D_060412BC
	.byte 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFD, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFC, 0xFF, 0xFD, 0x70, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04
	.byte 0xFF, 0xFD, 0x90, 0x00, 0xFF, 0xFF, 0xFF, 0xF8, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFD, 0x60, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0xFF, 0xFD, 0x68, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x04, 0xFF, 0xFD, 0xA0, 0x00, 0xFF, 0xFF, 0xFF, 0xFC, 0xFF, 0xFF, 0xFF, 0xFC
	.byte 0xFF, 0xFD, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xF8, 0xFF, 0xFD, 0x88, 0x00
	endlabel func_060411AC

	glabel func_0604131C
	sts.l	pr,@-r15
	mov.l	.L06041368,r2
	mov.l	.L0604136C,r0
	jsr	@r0
	nop
	mov.l	.L06041370,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	@(48,r1),r0
	mov.l	r0,@(48,r3)
	mov.l	@(52,r1),r0
	mov.l	r0,@(52,r3)
	mov.l	@(56,r1),r0
	mov.l	r0,@(56,r3)
	mov.l	.L06041374,r0
	jsr	@r0
	nop
	mov.l	.L06041378,r12
	mov.l	.L0604137C,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r10,r12
	sts	mach,r0
	sts	macl,r10
	xtrct	r0,r10
	dmuls.l	r11,r12
	sts	mach,r0
	sts	macl,r11
	xtrct	r0,r11
	mov.l	r11,@(32,r3)
	mov.l	r10,@(40,r3)
	mov.l	.L06041380,r0
	mov.l	r0,@(36,r3)
	lds.l	@r15+,pr
	rts
	nop
.L06041368:
	.long obj_list_effect
.L0604136C:
	.long obj_alloc
.L06041370:
	.long func_060414B4
.L06041374:
	.long math_rand
.L06041378:
	.long 0x00008000
.L0604137C:
	.long math_sincos
.L06041380:
	.long 0xFFFB8000
	endlabel func_0604131C

	glabel func_06041384
	sts.l	pr,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#35,r6
	mov.l	.L060413D0,r0
	jsr	@r0
	mov	#4,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L060413D4,r14
	mov	#0,r0
	mov.l	r0,@(656,gbr)
	mov.b	@(8,r14),r0
	mov	#50,r8
	cmp/ge	r8,r0
	bf	.L060413B4
	mov	r8,r0
.L060413B4:
	mov	r0,r7
	mov	#0,r0
	mov.b	r0,@(8,r14)
	mov.l	.L060413D8,r2
	mov.l	.L060413DC,r4
	mov.l	@r4,r4
	mov.l	.L060413E0,r5
	mov	#0,r6
	cmp/pl	r7
	bt	.L060413E4
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L060413D0:
	.long snd_seq_start
.L060413D4:
	.long play_state
.L060413D8:
	.long obj_list_effect
.L060413DC:
	.long player_obj
.L060413E0:
	.long D_06041450
.L060413E4:
	mov.l	.L06041440,r0
	jsr	@r0
	nop
	mov.l	.L06041444,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	@(48,r4),r0
	mov.l	r0,@(48,r3)
	mov.l	@(52,r4),r0
	mov.l	r0,@(52,r3)
	mov.l	@(56,r4),r0
	mov.l	r0,@(56,r3)
	mov.l	@r5+,r0
	cmp/pz	r0
	bt	.L06041406
	mov.l	.L06041448,r5
	mov.l	@r5+,r0
.L06041406:
	add	r0,r6
	mov	r6,r0
	mov.l	@r5+,r8
	mov.l	@r5+,r9
	mov.l	.L0604144C,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r10,r8
	sts	mach,r0
	sts	macl,r10
	xtrct	r0,r10
	dmuls.l	r11,r8
	sts	mach,r0
	sts	macl,r11
	xtrct	r0,r11
	mov.l	r11,@(32,r3)
	mov.l	r10,@(40,r3)
	mov	r9,r0
	shar	r0
	shar	r0
	add	r0,r9
	mov.l	r9,@(36,r3)
	dt	r7
	bf	.L060413E4
	lds.l	@r15+,pr
	rts
	nop
.L06041440:
	.long obj_alloc
.L06041444:
	.long func_060414B4
.L06041448:
	.long D_06041450
.L0604144C:
	.long math_sincos
	endlabel func_06041384

	.section .data.06041450,"aw",@progbits
	.p2align 2
	dlabel D_06041450
	.byte 0x00, 0x00, 0x88, 0x20, 0x00, 0x04, 0x00, 0x00, 0xFF, 0xFD, 0x00, 0x00, 0x00, 0x00, 0x88, 0x10
	.byte 0x00, 0x03, 0x00, 0x00, 0xFF, 0xFC, 0x80, 0x00, 0x00, 0x00, 0x49, 0x90, 0x00, 0x04, 0x80, 0x00
	.byte 0xFF, 0xFD, 0x80, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x02, 0x80, 0x00, 0xFF, 0xFC, 0x80, 0x00
	.byte 0x00, 0x00, 0x66, 0x00, 0x00, 0x01, 0x00, 0x00, 0xFF, 0xFB, 0xC0, 0x00, 0x00, 0x00, 0x45, 0x10
	.byte 0x00, 0x00, 0x80, 0x00, 0xFF, 0xFB, 0x80, 0x00, 0x00, 0x00, 0x43, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0xFF, 0xFC, 0x00, 0x00, 0x00, 0x00, 0x4E, 0x70, 0x00, 0x03, 0x80, 0x00, 0xFF, 0xFC, 0xF0, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF
