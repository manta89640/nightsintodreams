	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601B1A4,"ax",@progbits
	.p2align 2

	glabel func_0601B1A4
	sts.l	pr,@-r15
	mov.l	.L0601B1E8,r2
	mov.l	.L0601B1EC,r0
	jsr	@r0
	nop
	mov	r3,r10
	mov.l	.L0601B1F0,r0
	mov.l	r0,@(12,r10)
	add	#16,r10
	mov.l	.L0601B1E8,r2
	mov.l	.L0601B1EC,r0
	jsr	@r0
	nop
	mov.l	.L0601B1F4,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L0601B1F8,r6
	mov.l	r6,@(56,r10)
	mov.l	.L0601B1FC,r6
	mov.l	r6,@(56,r3)
	mov	#3,r0
	mov.w	r0,@(20,r10)
	mov	#4,r0
	mov.w	r0,@(20,r3)
	mov.w	.L0601B1E2,r0
	mov.w	r0,@(18,r10)
	mov.w	.L0601B1E4,r0
	mov.w	r0,@(18,r3)
	lds.l	@r15+,pr
	rts
	nop
.L0601B1E2:
	.short 0x0040
.L0601B1E4:
	.short 0x0050
	.byte 0x00, 0x00
.L0601B1E8:
	.long obj_list_stage
.L0601B1EC:
	.long obj_alloc
.L0601B1F0:
	.long func_0601B200
.L0601B1F4:
	.long func_0601B210
.L0601B1F8:
	.long 0x00140000
.L0601B1FC:
	.long 0x00100000
	endlabel func_0601B1A4

	glabel func_0601B200
	mov.l	.L0601B20C,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L0601B220
	nop
	.byte 0x00, 0x00
.L0601B20C:
	.long func_0601B24C
	endlabel func_0601B200

	glabel func_0601B210
	mov.l	.L0601B21C,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L0601B220
	nop
	.byte 0x00, 0x00
.L0601B21C:
	.long func_0601B280
.L0601B220:
	mov.l	.L0601B23C,r4
	mov.l	.L0601B240,r5
	mov.l	r4,@(48,r1)
	mov.l	r5,@(52,r1)
	mov.l	.L0601B244,r2
	mov.l	r2,@(44,r1)
	mov.w	.L0601B238,r0
	mov.w	r0,@(26,r1)
	mov.l	.L0601B248,r0
	mov.l	r0,@(32,r1)
	rts
	nop
.L0601B238:
	.short 0x4000
	.byte 0x00, 0x00
.L0601B23C:
	.long 0x00B00000
.L0601B240:
	.long 0x00700000
.L0601B244:
	.long D_0601440E
.L0601B248:
	.long 0x00040000
	endlabel func_0601B210

	glabel func_0601B24C
	sts.l	pr,@-r15
	bsr	func_0601B2C4
	nop
	tst	r0,r0
	bt	.L0601B264
	lds.l	@r15+,pr
	mov.l	.L0601B260,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0601B260:
	.long obj_free
.L0601B264:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0601B270
	lds.l	@r15+,pr
	rts
	nop
.L0601B270:
	mov.l	.L0601B27C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0601B27C:
	.long spr_draw_obj
	endlabel func_0601B24C

	glabel func_0601B280
	sts.l	pr,@-r15
	bsr	func_0601B2C4
	nop
	tst	r0,r0
	bt	.L0601B2A8
	mov.l	@(16,gbr),r0
	mov.l	.L0601B2A0,r8
	sub	r8,r0
	cmp/pl	r0
	bt	.L0601B296
	mov	#1,r0
.L0601B296:
	mov.l	r0,@(16,gbr)
	lds.l	@r15+,pr
	mov.l	.L0601B2A4,r0
	jmp	@r0
	nop
.L0601B2A0:
	.long 0x0000012C
.L0601B2A4:
	.long obj_free
.L0601B2A8:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0601B2B4
	lds.l	@r15+,pr
	rts
	nop
.L0601B2B4:
	mov.l	.L0601B2C0,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0601B2C0:
	.long spr_draw_obj
	endlabel func_0601B280

	glabel func_0601B2C4
	sts.l	pr,@-r15
	mov.w	@(22,r1),r0
	mov.w	.L0601B33A,r8
	add	r8,r0
	mov.l	.L0601B340,r10
	jsr	@r10
	mov.w	r0,@(22,r1)
	shll2	r10
	shll2	r10
	shll2	r10
	shll	r10
	mov.w	.L0601B33C,r0
	swap.w	r10,r10
	exts.w	r10,r10
	add	r10,r0
	mov.w	r0,@(22,r1)
	mov.l	.L0601B344,r2
	mov.l	.L0601B348,r3
	mov.l	@(48,r1),r0
	sub	r0,r2
	mov.l	@(52,r1),r0
	sub	r0,r3
	mov.l	.L0601B34C,r10
	jsr	@r10
	nop
	mov	r0,r9
	mov.w	@(26,r1),r0
	mov	r0,r8
	mov.w	.L0601B33E,r10
	mov.l	.L0601B350,r0
	jsr	@r0
	nop
	mov	r8,r0
	mov.w	r0,@(26,r1)
	mov.l	.L0601B354,r10
	jsr	@r10
	nop
	mov.l	@(32,r1),r4
	shll2	r10
	shll2	r11
	dmuls.l	r10,r4
	sts	mach,r4
	sts	macl,r10
	xtrct	r4,r10
	dmuls.l	r11,r4
	sts	mach,r4
	sts	macl,r11
	xtrct	r4,r11
	mov.l	@(48,r1),r2
	add	r11,r2
	mov.l	r2,@(48,r1)
	mov.l	@(52,r1),r2
	add	r10,r2
	mov.l	r2,@(52,r1)
	mov.l	.L0601B348,r0
	cmp/gt	r0,r2
	bt	.L0601B358
	bra	.L0601B35A
	mov	#-1,r0
.L0601B33A:
	.short 0x0800
.L0601B33C:
	.short 0x0100
.L0601B33E:
	.short 0x0200
.L0601B340:
	.long math_sin
.L0601B344:
	.long 0x00BC0000
.L0601B348:
	.long 0x00180000
.L0601B34C:
	.long math_atan2
.L0601B350:
	.long math_angle_step_toward
.L0601B354:
	.long math_sincos
.L0601B358:
	mov	#0,r0
.L0601B35A:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_0601B2C4

	glabel func_0601B360
	mov.l	.L0601B3A8,r4
	mov.l	r1,@r4
	mov.l	.L0601B3AC,r6
	mov.w	.L0601B3A0,r0
	mov.w	r0,@(0,r6)
	mov.w	r0,@(2,r6)
	mov.w	.L0601B3A2,r0
	mov.w	r0,@(4,r6)
	mov.w	r0,@(6,r6)
	mov.w	.L0601B3A4,r0
	mov.w	r0,@(28,r1)
	mov.l	.L0601B3B0,r2
	mov.l	r2,@(44,r1)
	mov	#0,r0
	mov.w	r0,@(20,r1)
	mov.l	.L0601B3B4,r0
	mov.l	r0,@(48,r1)
	mov.l	.L0601B3B8,r2
	mov.l	r2,@(52,r1)
	mov.l	.L0601B3BC,r0
	mov.l	r0,@(56,r1)
	mov.w	.L0601B3A6,r0
	mov.w	r0,@(22,r1)
	mov	#0,r0
	mov.w	r0,@(24,r1)
	mov.l	@(16,gbr),r0
	mov.l	r0,@(0,r1)
	mov.l	.L0601B3C0,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601B3A0:
	.short 0x02D6
.L0601B3A2:
	.short 0x0210
.L0601B3A4:
	.short 0x1FF9
.L0601B3A6:
	.short 0x0100
.L0601B3A8:
	.long D_0601A214
.L0601B3AC:
	.long VDP1_VRAM + 0xFFC8
.L0601B3B0:
	.long D_0601B510
.L0601B3B4:
	.long 0x00BC0000
.L0601B3B8:
	.long 0x00180000
.L0601B3BC:
	.long 0x00000000
.L0601B3C0:
	.long func_0601B3C4
	endlabel func_0601B360

	glabel func_0601B3C4
	mov.l	.L0601B3EC,r7
	mov.w	@(12,r7),r0
	add	#-1,r0
	cmp/pz	r0
	bt	.L0601B3D0
	mov	#0,r0
.L0601B3D0:
	mov.w	r0,@(12,r7)
	sts.l	pr,@-r15
	mov.l	.L0601B3F0,r4
	mov.l	@r4,r4
	mov.b	@(20,gbr),r0
	mov	#12,r8
	cmp/ge	r8,r0
	bt	.L0601B3F4
	mov.b	@(7,r4),r0
	tst	#112,r0
	bt	.L0601B3F4
	lds.l	@r15+,pr
	rts
	nop
.L0601B3EC:
	.long play_state
.L0601B3F0:
	.long player_obj
.L0601B3F4:
	mov.l	.L0601B458,r7
	mov.b	@(5,r7),r0
	tst	#16,r0
	bt	.L0601B406
	mov.l	.L0601B45C,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.l	.L0601B460,r0
	mov.l	r0,@(12,r1)
.L0601B406:
	mov.l	@(16,gbr),r0
	mov	r0,r8
	mov.l	@(0,r1),r0
	cmp/eq	r8,r0
	bt	.L0601B47A
	cmp/gt	r8,r0
	bf	.L0601B468
	add	#-1,r0
	cmp/gt	r8,r0
	bf	.L0601B47A
	mov.w	.L0601B454,r9
	add	r0,r9
	cmp/ge	r8,r9
	bt	.L0601B450
	mov.l	r0,@-r15
	mov.l	@(12,gbr),r0
	tst	#3,r0
	bf	.L0601B448
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#0,r6
	mov.l	.L0601B464,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L0601B448:
	mov.l	@r15+,r0
	add	#-9,r0
	cmp/ge	r8,r0
	bt	.L0601B47A
.L0601B450:
	bra	.L0601B47A
	mov	r8,r0
.L0601B454:
	.short 0xFED4
	.byte 0x00, 0x00
.L0601B458:
	.long play_state
.L0601B45C:
	.long func_0601C480
.L0601B460:
	.long 0xFFFF8000
.L0601B464:
	.long snd_seq_start
.L0601B468:
	add	#60,r0
	cmp/ge	r8,r0
	bf	.L0601B470
	mov	r8,r0
.L0601B470:
	mov.l	r0,@(0,r1)
	mov.w	.L0601B478,r0
	bra	.L0601B4B4
	nop
.L0601B478:
	.short 0x0080
.L0601B47A:
	mov.l	r0,@(0,r1)
	mov.l	.L0601B494,r8
	cmp/ge	r8,r0
	bt	.L0601B498
	sub	r0,r8
	mov.w	@(24,r1),r0
	shll2	r8
	shar	r8
	add	r8,r0
	mov.w	r0,@(24,r1)
	bra	.L0601B49C
	nop
	.byte 0x00, 0x00
.L0601B494:
	.long 0x000004B0
.L0601B498:
	mov	#0,r0
	mov.w	r0,@(24,r1)
.L0601B49C:
	mov.w	@(24,r1),r0
	mov.l	.L0601B4E8,r10
	jsr	@r10
	nop
	mov	r10,r0
	shll8	r0
	shll2	r0
	swap.w	r0,r0
	exts.w	r0,r0
	cmp/pz	r0
	bt	.L0601B4B4
	neg	r0,r0
.L0601B4B4:
	mov.w	.L0601B4E6,r8
	add	r8,r0
	mov.w	r0,@(22,r1)
	mov.l	@(0,r1),r0
	tst	r0,r0
	bt	.L0601B4CE
	mov	r0,r8
	mov	#60,r13
	mov	#-128,r14
	shll	r14
	mov.l	r13,@(0,r14)
	mov.l	r0,@(4,r14)
	mov.l	@(28,r14),r0
.L0601B4CE:
	mov.l	.L0601B4EC,r14
	jsr	@r14
	mov	r0,r4
	mov	#3,r14
	mov.l	.L0601B4F0,r10
	jsr	@r10
	nop
	mov.b	@(35,gbr),r0
	tst	r0,r0
	bt	.L0601B4F4
	bra	.L0601B506
	nop
.L0601B4E6:
	.short 0x0100
.L0601B4E8:
	.long math_sin
.L0601B4EC:
	.long math_bin_to_bcd
.L0601B4F0:
	.long spr_build_number
.L0601B4F4:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0601B500
	lds.l	@r15+,pr
	rts
	nop
.L0601B500:
	mov.l	.L0601B50C,r0
	jsr	@r0
	nop
.L0601B506:
	lds.l	@r15+,pr
	rts
	nop
.L0601B50C:
	.long spr_draw_obj
	endlabel func_0601B3C4

	.section .data.0601B510,"aw",@progbits
	.p2align 2
	dlabel D_0601B510
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
