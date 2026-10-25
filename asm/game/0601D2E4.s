	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601D2E4,"ax",@progbits
	.p2align 2

	glabel func_0601D2E4
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	mov.l	r0,@(64,gbr)
	dlabel lbl_0601D374
	mov.l	.L0601D3B8,r2
	mov.b	@(2,r1),r0
	shll	r0
	mov.w	@(r0,r2),r0
	mov.w	r0,@(22,r1)
	mov.w	r0,@(8,r1)
	mov.w	.L0601D3B2,r0
	mov.w	r0,@(28,r1)
	mov.l	.L0601D3BC,r3
	mov.l	.L0601D3C0,r2
	mov.w	.L0601D3B4,r7
.L0601D38A:
	mov.w	@r2+,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L0601D38A
	add	#2,r3
	mov	#0,r0
	mov.b	r0,@(4,r1)
	mov.b	r0,@(5,r1)
	mov.b	r0,@(6,r1)
	mov.b	r0,@(12,r1)
	mov.b	@(2,r1),r0
	mov.b	r0,@(10,r1)
	mov.l	.L0601D3C4,r10
	mov	#5,r0
	mov.b	r0,@r10
	mov.l	.L0601D3C8,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601D3B2:
	.short 0x1B20
.L0601D3B4:
	.short 0x0048
	.byte 0x00, 0x00
.L0601D3B8:
	.long D_0601D2D8
.L0601D3BC:
	.long VDP1_VRAM + 0xD900
.L0601D3C0:
	.long func_0601D2E4
.L0601D3C4:
	.long D_0601D0B2
.L0601D3C8:
	.long func_0601D3CC
	endlabel func_0601D2E4

	glabel func_0601D3CC
	mov.l	@(16,r1),r3
	mov.b	@(0,r3),r0
	tst	r0,r0
	bt	func_0601D3E0
	mov.l	.L0601D3DC,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0601D3DC:
	.long obj_free
	endlabel func_0601D3CC

	glabel func_0601D3E0
	sts.l	pr,@-r15
	mov.l	.L0601D408,r10
	mov.b	@r10,r0
	cmp/eq	#40,r0
	bt	.L0601D3F0
	mov.l	.L0601D40C,r3
	bsr	func_0601D478
	nop
.L0601D3F0:
	mov.b	@(6,r1),r0
	cmp/eq	#-1,r0
	bt	.L0601D3FA
	bsr	func_0601D494
	nop
.L0601D3FA:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0601D410
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601D408:
	.long D_0601D0B1
.L0601D40C:
	.long D_0601DC78
.L0601D410:
	mov.l	.L0601D450,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0601D454,r6
	mov.l	.L0601D458,r0
	jsr	@r0
	nop
	mov.l	@(60,r1),r0
	mov	r0,r4
	mov	r0,r5
	mov.l	.L0601D45C,r6
	mov.l	.L0601D460,r0
	jsr	@r0
	nop
	mov.w	@(22,r1),r0
	mov.l	.L0601D464,r2
	jsr	@r2
	nop
	mov.l	.L0601D468,r2
	mov.l	.L0601D46C,r6
	mov.l	.L0601D470,r0
	jsr	@r0
	nop
	mov.l	.L0601D474,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601D450:
	.long mtx_push_identity
.L0601D454:
	.long 0x01000000
.L0601D458:
	.long mtx_translate
.L0601D45C:
	.long 0x00030000
.L0601D460:
	.long mtx_scale
.L0601D464:
	.long mtx_rot_x
.L0601D468:
	.long D_06051D48
.L0601D46C:
	.long 0xFF200000
.L0601D470:
	.long func_0601F428
.L0601D474:
	.long mtx_pop
	endlabel func_0601D3E0

	glabel func_0601D478
	mov.l	.L0601D490,r10
	mov.l	@(60,r1),r2
	mov.b	@r10,r0
	shll2	r0
	mov.l	@(r0,r3),r0
	mov.l	r0,@(60,r1)
	mov.b	@r10,r0
	add	#1,r0
	mov.b	r0,@r10
	rts
	nop
	.byte 0x00, 0x00
.L0601D490:
	.long D_0601D0B1
	endlabel func_0601D478

	glabel func_0601D494
	sts.l	pr,@-r15
	mov.l	@(16,r1),r3
	mov.w	@(8,r3),r0
	mov	r0,r2
	mov.b	@(7,r1),r0
	mov.l	.L0601D4BC,r3
	mov.b	@(r0,r3),r8
	mov.l	.L0601D4C0,r3
	mov.b	@(r0,r3),r9
	shll2	r0
	mov.l	.L0601D4C4,r2
	mov.l	@(r0,r2),r0
	cmp/eq	#0,r0
	bt	.L0601D4B4
	jsr	@r0
	nop
.L0601D4B4:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601D4BC:
	.long D_0601D4C8
.L0601D4C0:
	.long D_0601D4D0
.L0601D4C4:
	.long D_0601D4D8
	dlabel D_0601D4C8
	.byte 0x03, 0x07, 0x07, 0x0F, 0x00, 0x09, 0x00, 0x09
	dlabel D_0601D4D0
	.byte 0x03, 0x01, 0x01, 0x00, 0x00, 0x09, 0x00, 0x09
	dlabel D_0601D4D8
	.long func_0601D50C
	.long func_0601D50C
	.long func_0601D584
	.long func_0601D610
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_0601D4EC
	.byte 0x02, 0xAA, 0x05, 0x55, 0x07, 0xFF, 0x0A, 0xAA, 0x0B, 0x54, 0x0F, 0xFF, 0x12, 0xA9, 0x15, 0x55
	.byte 0x17, 0xFF, 0x1A, 0xAA, 0x1B, 0x54, 0x1F, 0xFF, 0x22, 0xA9, 0x25, 0x55, 0x27, 0xFF, 0x2A, 0xAA
	endlabel func_0601D494

	glabel func_0601D50C
	sts.l	pr,@-r15
	mov.l	@(12,gbr),r0
	tst	#7,r0
	bf	.L0601D514
.L0601D514:
	mov.b	@(12,r1),r0
	add	#1,r0
	mov.b	r0,@(12,r1)
	cmp/eq	r0,r8
	mov.b	@(10,r1),r0
	bf	.L0601D544
	mov	#0,r0
	mov.b	r0,@(12,r1)
	mov.l	.L0601D568,r10
	mov.b	@r10,r0
	dt	r0
	bf	.L0601D534
	mov.b	@(7,r1),r0
	add	#1,r0
	mov.b	r0,@(7,r1)
	mov	#1,r0
.L0601D534:
	mov.b	r0,@r10
	mov.b	@(10,r1),r0
	add	#1,r0
	mov	#6,r3
	cmp/eq	r0,r3
	bf	.L0601D542
	add	#-6,r0
.L0601D542:
	sett
.L0601D544:
	mov.b	r0,@(10,r1)
	bt	.L0601D570
	shll	r9
	mov.l	.L0601D56C,r2
	mov	r9,r0
	mov.w	@(r0,r2),r2
	mov.w	@(22,r1),r0
	sub	r2,r0
	cmp/pz	r0
	bt	.L0601D55C
	mov.w	.L0601D564,r2
	add	r2,r0
.L0601D55C:
	mov.w	r0,@(22,r1)
	lds.l	@r15+,pr
	rts
	nop
.L0601D564:
	.short 0xFFFC
	.byte 0x00, 0x00
.L0601D568:
	.long D_0601D0B2
.L0601D56C:
	.long D_0601D4EC
.L0601D570:
	mov.b	@(10,r1),r0
	mov.l	.L0601D580,r2
	shll	r0
	mov.w	@(r0,r2),r0
	mov.w	r0,@(22,r1)
	lds.l	@r15+,pr
	rts
	nop
.L0601D580:
	.long D_0601D2D8
	endlabel func_0601D50C

	glabel func_0601D584
	sts.l	pr,@-r15
	mov.b	@(12,r1),r0
	add	#1,r0
	mov.b	r0,@(12,r1)
	cmp/eq	r0,r8
	mov.b	@(10,r1),r0
	bf	.L0601D5B6
	mov	#0,r0
	mov.b	r0,@(12,r1)
	mov.l	.L0601D5D8,r10
	mov.b	@r10,r0
	dt	r0
	bf	.L0601D5A6
	mov.b	@(7,r1),r0
	add	#1,r0
	mov.b	r0,@(7,r1)
	mov	#10,r0
.L0601D5A6:
	mov.b	r0,@r10
	mov.b	@(10,r1),r0
	add	#1,r0
	mov	#6,r3
	cmp/eq	r0,r3
	bf	.L0601D5B4
	add	#-6,r0
.L0601D5B4:
	sett
.L0601D5B6:
	mov.b	r0,@(10,r1)
	bt	.L0601D5E0
	shll	r9
	mov.l	.L0601D5DC,r2
	mov	r9,r0
	mov.w	@(r0,r2),r2
	mov.w	@(22,r1),r0
	sub	r2,r0
	cmp/pz	r0
	bt	.L0601D5CE
	mov.w	.L0601D5D6,r2
	add	r2,r0
.L0601D5CE:
	mov.w	r0,@(22,r1)
	lds.l	@r15+,pr
	rts
	nop
.L0601D5D6:
	.short 0xFFFC
.L0601D5D8:
	.long D_0601D0B2
.L0601D5DC:
	.long D_0601D4EC
.L0601D5E0:
	mov.b	@(10,r1),r0
	mov.l	.L0601D60C,r2
	shll	r0
	mov.w	@(r0,r2),r0
	mov.w	r0,@(22,r1)
	mov.b	@(2,r1),r0
	mov	r0,r2
	mov.b	@(10,r1),r0
	cmp/ge	r0,r2
	bt	.L0601D5F6
	add	#6,r2
.L0601D5F6:
	sub	r0,r2
	mov	r2,r0
	mov	#4,r3
	cmp/gt	r0,r3
	bf	.L0601D602
	add	#6,r3
.L0601D602:
	mov.b	r0,@(11,r1)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601D60C:
	.long D_0601D2D8
	endlabel func_0601D584

	glabel func_0601D610
	sts.l	pr,@-r15
	mov.b	@(11,r1),r0
	cmp/eq	#0,r0
	bt	.L0601D67E
	mov.b	@(12,r1),r0
	add	#1,r0
	mov.b	r0,@(12,r1)
	cmp/eq	#16,r0
	mov.b	@(10,r1),r0
	bf	.L0601D640
	mov	#0,r0
	mov.b	r0,@(12,r1)
	mov.b	@(11,r1),r0
	dt	r0
	mov.b	r0,@(11,r1)
	mov	#0,r0
	mov.b	r0,@(12,r1)
	mov.b	@(10,r1),r0
	add	#1,r0
	mov	#6,r3
	cmp/eq	r3,r0
	bf	.L0601D63E
	add	#-6,r0
.L0601D63E:
	sett
.L0601D640:
	mov.b	r0,@(10,r1)
	bt	.L0601D664
	mov.l	.L0601D660,r2
	mov.w	@r2,r2
	mov.w	@(22,r1),r0
	sub	r2,r0
	cmp/pz	r0
	bt	.L0601D654
	mov.w	.L0601D65C,r2
	add	r2,r0
.L0601D654:
	mov.w	r0,@(22,r1)
	lds.l	@r15+,pr
	rts
	nop
.L0601D65C:
	.short 0xFFFC
	.byte 0x00, 0x00
.L0601D660:
	.long D_0601D4EC
.L0601D664:
	mov.b	@(10,r1),r0
	mov.l	.L0601D674,r2
	shll	r0
	mov.w	@(r0,r2),r0
	mov.w	r0,@(22,r1)
	lds.l	@r15+,pr
	rts
	nop
.L0601D674:
	.long D_0601D2D8
	.byte 0x4F, 0x26, 0x00, 0x0B, 0x00, 0x09
.L0601D67E:
	mov.b	@(2,r1),r0
	mov.l	.L0601D6D4,r2
	shll	r0
	mov.w	@(r0,r2),r0
	mov.w	r0,@(22,r1)
	mov.l	.L0601D6D8,r3
	mov.l	.L0601D6DC,r4
	mov.b	@(2,r1),r0
	shll2	r0
	mov.l	@(r0,r4),r2
	mov.w	.L0601D6D2,r7
.L0601D694:
	mov.w	@r2+,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L0601D694
	add	#2,r3
	mov.b	@(27,gbr),r0
	cmp/pz	r0
	bf	.L0601D6C2
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#57,r6
	mov.l	.L0601D6E0,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L0601D6C2:
	mov	#-1,r0
	mov.b	r0,@(6,r1)
	mov	#0,r0
	mov.l	.L0601D6E4,r2
	mov.b	r0,@r2
	lds.l	@r15+,pr
	rts
	nop
.L0601D6D2:
	.short 0x0048
.L0601D6D4:
	.long D_0601D2D8
.L0601D6D8:
	.long VDP1_VRAM + 0xD900
.L0601D6DC:
	.long D_0601D6E8
.L0601D6E0:
	.long snd_seq_start
.L0601D6E4:
	.long D_0601D0B1
	dlabel D_0601D6E8
	.long func_0601D2E4
	.long func_0601D2E4
	.long func_0601D2E4
	.long func_0601D2E4
	.long func_0601D2E4
	.long func_0601D2E4
	.long D_060523F4
	.long D_06052484
	.long D_06052514
	.long D_060525A4
	.long D_06052634
	.long D_060526C4
	dlabel D_0601D718
	.byte 0xDA, 0x04, 0x84, 0x11, 0x40, 0x08, 0x09, 0xAE, 0x58, 0x11, 0x39, 0x8C, 0x0A, 0x96, 0x00, 0x0B
	.byte 0x00, 0x09, 0x00, 0x00
	.long mare_score
	endlabel func_0601D610

	glabel func_0601D730
	sts.l	pr,@-r15
	mov.l	.L0601D758,r2
	mov.l	.L0601D75C,r0
	jsr	@r0
	nop
	mov.l	.L0601D760,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r1,@(16,r3)
	mov.l	.L0601D764,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601D768,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0601D76C,r7
	mov.l	.L0601D770,r10
	mov.b	@(21,gbr),r0
	cmp/pz	r0
	bf	.L0601D774
	bra	.L0601D776
	mov	#4,r0
.L0601D758:
	.long obj_list_effect
.L0601D75C:
	.long obj_alloc
.L0601D760:
	.long func_0601D970
.L0601D764:
	.long 0x00D00000
.L0601D768:
	.long 0x00AC0000
.L0601D76C:
	.long play_state
.L0601D770:
	.long mare_score
.L0601D774:
	mov.b	@(3,r7),r0
.L0601D776:
	add	#-1,r0
	mov.b	r0,@(1,r3)
	lds.l	@r15+,pr
	rts
	nop
	dlabel D_0601D780
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	endlabel func_0601D730

	glabel func_0601D970
	mov.l	.L0601D990,r0
	mov.l	r0,@(56,r1)
	mov.w	.L0601D98A,r0
	mov.w	r0,@(22,r1)
	mov.w	.L0601D98C,r0
	mov.w	r0,@(28,r1)
	mov.l	.L0601D994,r2
	mov.l	r2,@(44,r1)
	mov.l	.L0601D998,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601D98A:
	.short 0x0100
.L0601D98C:
	.short 0x1FFF
	.byte 0x00, 0x00
.L0601D990:
	.long 0x00000000
.L0601D994:
	.long D_0601D780
.L0601D998:
	.long func_0601D99C
	endlabel func_0601D970

	glabel func_0601D99C
	mov.l	@(16,r1),r3
	mov.b	@(0,r3),r0
	tst	r0,r0
	bt	func_0601D9B0
	mov.l	.L0601D9AC,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0601D9AC:
	.long obj_free
	endlabel func_0601D99C

	glabel func_0601D9B0
	sts.l	pr,@-r15
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0601D9BE
	lds.l	@r15+,pr
	rts
	nop
.L0601D9BE:
	mov.l	.L0601D9E0,r10
	mov.b	@(1,r1),r0
	shll2	r0
	mov.l	@(r0,r10),r0
	mov.l	.L0601D9E4,r14
	jsr	@r14
	mov	r0,r4
	mov	#6,r14
	mov.l	.L0601D9E8,r13
	jsr	@r13
	nop
	mov.l	.L0601D9EC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0601D9E0:
	.long mare_score
.L0601D9E4:
	.long math_bin_to_bcd
.L0601D9E8:
	.long spr_build_number
.L0601D9EC:
	.long spr_draw_obj
	endlabel func_0601D9B0

	glabel func_0601D9F0
	mov.b	@(107,gbr),r0
	tst	r0,r0
	bt	func_0601D9FA
	rts
	nop
	endlabel func_0601D9F0

	glabel func_0601D9FA
	sts.l	pr,@-r15
	mov.l	.L0601DA30,r2
	mov.l	.L0601DA34,r0
	jsr	@r0
	nop
	mov.l	.L0601DA38,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r1,@(16,r3)
	mov.l	.L0601DA3C,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601DA40,r0
	mov.l	r0,@(52,r3)
	mov.b	@(20,gbr),r0
	shlr	r0
	mov.b	r0,@(1,r3)
	mov.b	@(1,r1),r0
	mov.b	r0,@(0,r3)
	mov.l	.L0601DA44,r10
	shll2	r0
	mov.l	@(r0,r10),r8
	mov	r8,r0
	mov.l	r0,@(4,r3)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601DA30:
	.long obj_list_effect
.L0601DA34:
	.long obj_alloc
.L0601DA38:
	.long func_0601DA48
.L0601DA3C:
	.long 0x00740000
.L0601DA40:
	.long 0x00BA0000
.L0601DA44:
	.long mare_score
	endlabel func_0601D9FA

	glabel func_0601DA48
	mov.w	.L0601DA64,r0
	mov.w	r0,@(22,r1)
	mov.l	.L0601DA68,r0
	mov.l	r0,@(56,r1)
	mov.l	.L0601DA6C,r2
	mov.l	r2,@(44,r1)
	mov	#0,r0
	mov.b	r0,@(12,r1)
	mov.b	r0,@(2,r1)
	mov.l	.L0601DA70,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601DA64:
	.short 0x0100
	.byte 0x00, 0x00
.L0601DA68:
	.long 0x00000000
.L0601DA6C:
	.long D_06013064
.L0601DA70:
	.long func_0601DA74
	endlabel func_0601DA48

	glabel func_0601DA74
	mov.l	@(16,r1),r3
	mov.b	@(0,r3),r0
	tst	r0,r0
	bt	func_0601DA88
	mov.l	.L0601DA84,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0601DA84:
	.long obj_free
	endlabel func_0601DA74

	glabel func_0601DA88
	sts.l	pr,@-r15
	mov.b	@(1,r1),r0
	mov	r0,r4
	mov.b	@(0,r1),r0
	mov	r0,r5
	mov.l	@(4,r1),r0
	mov	r0,r6
	mov.l	.L0601DAC8,r0
	jsr	@r0
	nop
	cmp/eq	#1,r0
	bf	.L0601DAC2
	mov.b	@(2,r1),r0
	cmp/eq	#0,r0
	bf	.L0601DAAA
	add	#1,r0
	mov.b	r0,@(2,r1)
.L0601DAAA:
	mov.b	@(12,r1),r0
	add	#1,r0
	cmp/eq	#20,r0
	bf	.L0601DAB4
	mov	#0,r0
.L0601DAB4:
	mov.b	r0,@(12,r1)
	mov	#9,r2
	cmp/gt	r2,r0
	bt	.L0601DAC2
	mov.l	.L0601DACC,r0
	jsr	@r0
	nop
.L0601DAC2:
	lds.l	@r15+,pr
	rts
	nop
.L0601DAC8:
	.long func_06047410
.L0601DACC:
	.long spr_draw_obj
	endlabel func_0601DA88

	glabel func_0601DAD0
	sts.l	pr,@-r15
	mov.l	.L0601DAF8,r2
	mov.l	.L0601DAFC,r0
	jsr	@r0
	nop
	mov.l	.L0601DB00,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r1,@(16,r3)
	mov.l	.L0601DB04,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601DB08,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0601DB0C,r7
	mov.l	.L0601DB10,r10
	mov.b	@(21,gbr),r0
	cmp/pz	r0
	bf	.L0601DB14
	bra	.L0601DB16
	mov	#4,r0
.L0601DAF8:
	.long obj_list_effect
.L0601DAFC:
	.long obj_alloc
.L0601DB00:
	.long func_0601DB34
.L0601DB04:
	.long 0xFFB00000
.L0601DB08:
	.long 0x00180000
.L0601DB0C:
	.long play_state
.L0601DB10:
	.long mare_score
.L0601DB14:
	mov.b	@(3,r7),r0
.L0601DB16:
	add	#-1,r0
	mov.b	r0,@(1,r3)
	mov.l	.L0601DB2C,r0
	mov.l	r0,@(60,r1)
	mov	#0,r0
	mov.l	.L0601DB30,r2
	mov.b	r0,@r2
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601DB2C:
	.long 0x00030000
.L0601DB30:
	.long D_0601D0B0
	endlabel func_0601DAD0

	glabel func_0601DB34
	mov.b	@(1,r1),r0
	mov	#36,r8
	mulu.w	r8,r0
	sts	macl,r8
	mov.l	.L0601DB8C,r9
	mov.w	@(6,r9),r0
	add	r0,r8
	mov.w	r8,@r9
	mov.w	.L0601DB86,r0
	mov.w	r0,@(28,r1)
	mov.l	.L0601DB90,r3
	mov.l	.L0601DB94,r2
	mov.b	@(1,r1),r0
	mov.w	.L0601DB88,r7
	muls.w	r0,r7
	sts	macl,r0
	add	r0,r2
.L0601DB56:
	mov.w	@r2+,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L0601DB56
	add	#2,r3
	sts.l	pr,@-r15
	mov.l	.L0601DB98,r2
	mov.b	@(1,r1),r0
	shll2	r0
	shll2	r0
	shll	r0
	add	r0,r2
	mov.l	.L0601DB8C,r0
	mov.l	.L0601DB9C,r6
	mov	#1,r7
	mov.l	.L0601DBA0,r10
	jsr	@r10
	nop
	lds.l	@r15+,pr
	mov.l	.L0601DBA4,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601DB86:
	.short 0x1B0E
.L0601DB88:
	.short 0x0048
	.byte 0x00, 0x00
.L0601DB8C:
	.long D_060ED660
.L0601DB90:
	.long VDP1_VRAM + 0xD870
.L0601DB94:
	.long D_06052754
.L0601DB98:
	.long D_0601D02C
.L0601DB9C:
	.long 0x0000C000
.L0601DBA0:
	.long vdp1_build_fog_cluts
.L0601DBA4:
	.long func_0601DBA8
	endlabel func_0601DB34

	glabel func_0601DBA8
	mov.l	@(16,r1),r3
	mov.b	@(0,r3),r0
	tst	r0,r0
	bt	.L0601DBBC
	mov.l	.L0601DBB8,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0601DBB8:
	.long obj_free
.L0601DBBC:
	sts.l	pr,@-r15
	mov.l	.L0601DBD8,r10
	mov.b	@r10,r0
	cmp/eq	#40,r0
	bt	.L0601DBCA
	bsr	func_0601DC58
	nop
.L0601DBCA:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0601DBDC
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601DBD8:
	.long D_0601D0B0
.L0601DBDC:
	mov.l	.L0601DC20,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0601DC24,r6
	mov.l	.L0601DC28,r0
	jsr	@r0
	nop
	mov.l	@(60,r1),r0
	mov	r0,r4
	mov	r0,r5
	mov.l	.L0601DC2C,r6
	mov.l	.L0601DC30,r0
	jsr	@r0
	nop
	mov.w	@(22,r1),r0
	mov.l	.L0601DC34,r2
	jsr	@r2
	nop
	mov.l	.L0601DC38,r3
	mov.b	@(1,r1),r0
	shll2	r0
	mov.l	@(r0,r3),r2
	mov.l	.L0601DC3C,r6
	mov.l	.L0601DC40,r0
	jsr	@r0
	nop
	mov.l	.L0601DC44,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0601DC20:
	.long mtx_push_identity
.L0601DC24:
	.long 0x01000000
.L0601DC28:
	.long mtx_translate
.L0601DC2C:
	.long 0x00030000
.L0601DC30:
	.long mtx_scale
.L0601DC34:
	.long mtx_rot_x
.L0601DC38:
	.long D_0601DC48
.L0601DC3C:
	.long 0xFF200000
.L0601DC40:
	.long func_0601F428
.L0601DC44:
	.long mtx_pop
	dlabel D_0601DC48
	.long D_06051FB4
	.long D_060520E8
	.long D_0605221C
	.long D_06052350
	endlabel func_0601DBA8

	glabel func_0601DC58
	mov.l	.L0601DC70,r10
	mov.l	@(60,r1),r2
	mov.b	@r10,r0
	mov.l	.L0601DC74,r3
	shll2	r0
	mov.l	@(r0,r3),r0
	mov.l	r0,@(60,r1)
	mov.b	@r10,r0
	add	#1,r0
	mov.b	r0,@r10
	rts
	nop
.L0601DC70:
	.long D_0601D0B0
.L0601DC74:
	.long D_0601DC78
	dlabel D_0601DC78
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00
	.byte 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x80, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x80, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x80, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x80, 0x00
	.byte 0x00, 0x01, 0xC0, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x40, 0x00, 0x00, 0x02, 0x80, 0x00
	.byte 0x00, 0x02, 0xC0, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x40, 0x00, 0x00, 0x03, 0x80, 0x00
	.byte 0x00, 0x03, 0xC0, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0xC0, 0x00, 0x00, 0x03, 0x80, 0x00
	.byte 0x00, 0x03, 0x40, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0xC0, 0x00, 0x00, 0x02, 0x80, 0x00
	.byte 0x00, 0x02, 0x40, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x40, 0x00, 0x00, 0x02, 0x80, 0x00
	.byte 0x00, 0x02, 0xC0, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x40, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x02, 0xC0, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x20, 0x00, 0x00, 0x03, 0x00, 0x00
	dlabel D_0601DD18
	.byte 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x80, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x80, 0x00
	.byte 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x80, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x05, 0x80, 0x00
	.byte 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x80, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x80, 0x00
	.byte 0x00, 0x03, 0xC0, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x40, 0x00, 0x00, 0x04, 0x80, 0x00
	.byte 0x00, 0x04, 0xC0, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x40, 0x00, 0x00, 0x05, 0x80, 0x00
	.byte 0x00, 0x05, 0xC0, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x05, 0xC0, 0x00, 0x00, 0x05, 0x80, 0x00
	.byte 0x00, 0x05, 0x40, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0xC0, 0x00, 0x00, 0x04, 0x80, 0x00
	.byte 0x00, 0x04, 0x40, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x40, 0x00, 0x00, 0x04, 0x80, 0x00
	.byte 0x00, 0x04, 0xC0, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x40, 0x00, 0x00, 0x05, 0x00, 0x00
	.byte 0x00, 0x04, 0xC0, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x20, 0x00, 0x00, 0x05, 0x00, 0x00
	dlabel D_0601DDB8
	.byte 0x00, 0x01, 0x40, 0x00, 0x00, 0x01, 0x80, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x80, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0xC0, 0x00, 0x00, 0x02, 0x80, 0x00, 0x00, 0x02, 0x40, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0xC0, 0x00, 0x00, 0x01, 0x80, 0x00, 0x00, 0x01, 0x40, 0x00
	.byte 0x00, 0x01, 0x20, 0x00, 0x00, 0x01, 0x20, 0x00, 0x00, 0x01, 0x40, 0x00, 0x00, 0x01, 0x80, 0x00
	.byte 0x00, 0x01, 0xC0, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x40, 0x00, 0x00, 0x02, 0x80, 0x00
	.byte 0x00, 0x02, 0xC0, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0xC0, 0x00, 0x00, 0x02, 0x80, 0x00
	.byte 0x00, 0x02, 0x40, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0xC0, 0x00, 0x00, 0x01, 0x80, 0x00
	.byte 0x00, 0x01, 0x40, 0x00, 0x00, 0x01, 0x20, 0x00, 0x00, 0x01, 0x40, 0x00, 0x00, 0x01, 0x80, 0x00
	.byte 0x00, 0x02, 0xC0, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x40, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x02, 0xC0, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x20, 0x00, 0x00, 0x02, 0x00, 0x00
	endlabel func_0601DC58

	glabel func_0601DE58
	sts.l	pr,@-r15
	mov.l	.L0601DE68,r7
	mov.b	@(21,gbr),r0
	cmp/pz	r0
	bf	.L0601DE6C
	bra	.L0601DE6E
	mov	#4,r0
	.byte 0x00, 0x00
.L0601DE68:
	.long play_state
.L0601DE6C:
	mov.b	@(3,r7),r0
.L0601DE6E:
	add	#-1,r0
	mov.b	r0,@(1,r1)
	mov.l	.L0601DED4,r2
	mov.l	.L0601DED8,r0
	jsr	@r0
	nop
	mov.l	.L0601DEDC,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L0601DEE0,r2
	mov.l	r2,@(44,r3)
	mov.l	.L0601DEE4,r2
	mov.l	r2,@(60,r3)
	mov.l	.L0601DEE8,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601DEEC,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0601DEF0,r8
	mov.l	r8,@(56,r3)
	mov.l	.L0601DEF4,r0
	mov.l	r0,@(32,r3)
	mov.l	.L0601DEF8,r0
	mov.l	r0,@(36,r3)
	mov.b	@(8,r7),r0
	mov.l	r0,@-r15
	mov.l	.L0601DEFC,r14
	jsr	@r14
	mov	r0,r4
	mov	#3,r14
	mov.l	.L0601DF00,r5
	mov.l	.L0601DF04,r10
	jsr	@r10
	mov	r0,r4
	mov.l	@r15+,r8
	mov	#50,r0
	mulu.w	r0,r8
	sts	macl,r8
	mov.l	r8,@(4,r1)
	mov.l	.L0601DEFC,r14
	jsr	@r14
	mov	r8,r4
	mov	#5,r14
	mov.l	.L0601DF08,r5
	mov.l	.L0601DF04,r10
	jsr	@r10
	mov	r0,r4
	mov	#0,r0
	mov.b	r0,@(8,r7)
	lds.l	@r15+,pr
	rts
	nop
.L0601DED4:
	.long obj_list_effect
.L0601DED8:
	.long obj_alloc
.L0601DEDC:
	.long func_06019A88
.L0601DEE0:
	.long D_0601BC18
.L0601DEE4:
	.long D_0601BC38
.L0601DEE8:
	.long 0xFFFFFFEC
.L0601DEEC:
	.long 0x00000010
.L0601DEF0:
	.long 0x000000F0
.L0601DEF4:
	.long 0x00000024
.L0601DEF8:
	.long 0x00000000
.L0601DEFC:
	.long math_bin_to_bcd
.L0601DF00:
	.long D_0601BC24
.L0601DF04:
	.long txt_bcd_to_ascii
.L0601DF08:
	.long D_0601BC32
	endlabel func_0601DE58

	glabel func_0601DF0C
	sts.l	pr,@-r15
	mov.l	.L0601DF3C,r2
	mov.l	.L0601DF40,r0
	jsr	@r0
	nop
	mov.l	.L0601DF44,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r1,@(16,r3)
	mov.l	.L0601DF48,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601DF4C,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0601DF50,r0
	mov.l	r0,@(40,r3)
	mov.l	.L0601DF54,r2
	mov.b	@(0,r2),r0
	mov.b	r0,@(10,r3)
	mov	#0,r0
	mov.b	r0,@(12,r3)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601DF3C:
	.long obj_list_load_scene
.L0601DF40:
	.long obj_alloc
.L0601DF44:
	.long func_0601E038
.L0601DF48:
	.long 0xFF800000
.L0601DF4C:
	.long 0x00480000
.L0601DF50:
	.long D_06051D48
.L0601DF54:
	.long grade
	endlabel func_0601DF0C

	glabel func_0601DF58
	sts.l	pr,@-r15
	mov.l	.L0601DF88,r2
	mov.l	.L0601DF8C,r0
	jsr	@r0
	nop
	mov.l	.L0601DF90,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r1,@(16,r3)
	mov.l	.L0601DF94,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601DF98,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0601DF9C,r0
	mov.l	r0,@(40,r3)
	mov.l	.L0601DFA0,r2
	mov.b	@(1,r2),r0
	mov.b	r0,@(10,r3)
	mov	#1,r0
	mov.b	r0,@(12,r3)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601DF88:
	.long obj_list_load_scene
.L0601DF8C:
	.long obj_alloc
.L0601DF90:
	.long func_0601E038
.L0601DF94:
	.long 0xFFB80000
.L0601DF98:
	.long 0x00480000
.L0601DF9C:
	.long D_06051D48
.L0601DFA0:
	.long grade
	endlabel func_0601DF58

	glabel func_0601DFA4
	sts.l	pr,@-r15
	mov.l	.L0601DFD4,r2
	mov.l	.L0601DFD8,r0
	jsr	@r0
	nop
	mov.l	.L0601DFDC,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r1,@(16,r3)
	mov.l	.L0601DFE0,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601DFE0,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0601DFE4,r0
	mov.l	r0,@(40,r3)
	mov.l	.L0601DFE8,r2
	mov.b	@(2,r2),r0
	mov.b	r0,@(10,r3)
	mov	#2,r0
	mov.b	r0,@(12,r3)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601DFD4:
	.long obj_list_load_scene
.L0601DFD8:
	.long obj_alloc
.L0601DFDC:
	.long func_0601E038
.L0601DFE0:
	.long 0x00480000
.L0601DFE4:
	.long D_06051D48
.L0601DFE8:
	.long grade
	endlabel func_0601DFA4

	glabel func_0601DFEC
	sts.l	pr,@-r15
	mov.l	.L0601E01C,r2
	mov.l	.L0601E020,r0
	jsr	@r0
	nop
	mov.l	.L0601E024,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r1,@(16,r3)
	mov.l	.L0601E028,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601E02C,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0601E030,r0
	mov.l	r0,@(40,r3)
	mov.l	.L0601E034,r2
	mov.b	@(3,r2),r0
	mov.b	r0,@(10,r3)
	mov	#3,r0
	mov.b	r0,@(12,r3)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601E01C:
	.long obj_list_load_scene
.L0601E020:
	.long obj_alloc
.L0601E024:
	.long func_0601E038
.L0601E028:
	.long 0x00800000
.L0601E02C:
	.long 0x00480000
.L0601E030:
	.long D_06051D48
.L0601E034:
	.long grade
	endlabel func_0601DFEC

	glabel func_0601E038
	mov.l	.L0601E074,r2
	mov.b	@(10,r1),r0
	shll	r0
	mov.w	@(r0,r2),r0
	mov.w	r0,@(22,r1)
	mov.w	r0,@(8,r1)
	mov.w	.L0601E06E,r0
	mov.w	r0,@(28,r1)
	mov.l	.L0601E078,r3
	mov.l	.L0601E07C,r2
	mov.l	.L0601E080,r2
	mov.w	.L0601E070,r7
.L0601E050:
	mov.w	@r2+,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L0601E050
	add	#2,r3
	mov	#0,r0
	mov.b	r0,@(4,r1)
	mov.b	r0,@(5,r1)
	mov.b	r0,@(6,r1)
	mov.b	r0,@(10,r1)
	mov.l	.L0601E084,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601E06E:
	.short 0x1B20
.L0601E070:
	.short 0x0048
	.byte 0x00, 0x00
.L0601E074:
	.long D_0601D2D8
.L0601E078:
	.long VDP1_VRAM + 0xD900
.L0601E07C:
	.long D_06052364
.L0601E080:
	.long func_0601D2E4
.L0601E084:
	.long func_0601E088
	endlabel func_0601E038

	glabel func_0601E088
	mov.l	@(16,r1),r3
	mov.b	@(0,r3),r0
	tst	r0,r0
	bt	.L0601E09C
	mov.l	.L0601E098,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0601E098:
	.long obj_free
.L0601E09C:
	sts.l	pr,@-r15
	mov.b	@(12,r1),r0
	cmp/eq	#40,r0
	bt	.L0601E0A8
	bsr	func_0601E124
	nop
.L0601E0A8:
	mov.w	@(22,r1),r0
	mov.w	.L0601E0BC,r2
	add	r2,r0
	mov.w	r0,@(26,r1)
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0601E0BE
	lds.l	@r15+,pr
	rts
	nop
.L0601E0BC:
	.short 0xF000
.L0601E0BE:
	mov.l	.L0601E0FC,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0601E100,r6
	mov.l	.L0601E104,r0
	jsr	@r0
	nop
	mov.l	@(60,r1),r0
	mov	r0,r4
	mov	r0,r5
	mov.l	.L0601E108,r6
	mov.l	.L0601E10C,r0
	jsr	@r0
	nop
	mov.w	@(26,r1),r0
	mov.l	.L0601E110,r2
	jsr	@r2
	nop
	mov.l	.L0601E114,r2
	mov.l	.L0601E118,r6
	mov.l	.L0601E11C,r0
	jsr	@r0
	nop
	mov.l	.L0601E120,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0601E0FC:
	.long mtx_push_identity
.L0601E100:
	.long 0x01000000
.L0601E104:
	.long mtx_translate
.L0601E108:
	.long 0x00030000
.L0601E10C:
	.long mtx_scale
.L0601E110:
	.long mtx_rot_x
.L0601E114:
	.long D_06051D48
.L0601E118:
	.long 0xFF200000
.L0601E11C:
	.long func_0601F428
.L0601E120:
	.long mtx_pop
	endlabel func_0601E088

	glabel func_0601E124
	mov.l	@(12,gbr),r0
	tst	#15,r0
	bf	.L0601E12A
.L0601E12A:
	mov.b	@(12,r1),r0
	mov.l	.L0601E140,r3
	shll2	r0
	mov.l	@(r0,r3),r0
	mov.l	r0,@(60,r1)
	mov.b	@(12,r1),r0
	add	#1,r0
	mov.b	r0,@(12,r1)
	rts
	nop
	.byte 0x00, 0x00
.L0601E140:
	.long D_0601DDB8
	endlabel func_0601E124

	glabel func_0601E144
	sts.l	pr,@-r15
	mov.l	.L0601E16C,r2
	mov.l	.L0601E170,r0
	jsr	@r0
	nop
	mov.l	.L0601E174,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r1,@(16,r3)
	mov.l	.L0601E178,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601E17C,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0601E180,r10
	mov.b	@(1,r1),r0
	mov.b	r0,@(1,r3)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601E16C:
	.long obj_list_load_scene
.L0601E170:
	.long obj_alloc
.L0601E174:
	.long func_0601E184
.L0601E178:
	.long 0x00D80000
.L0601E17C:
	.long 0x00680000
.L0601E180:
	.long mare_score
	endlabel func_0601E144

	glabel func_0601E184
	mov.l	.L0601E1A4,r0
	mov.l	r0,@(56,r1)
	mov.w	.L0601E19E,r0
	mov.w	r0,@(22,r1)
	mov.w	.L0601E1A0,r0
	mov.w	r0,@(28,r1)
	mov.l	.L0601E1A8,r2
	mov.l	r2,@(44,r1)
	mov.l	.L0601E1AC,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601E19E:
	.short 0x0120
.L0601E1A0:
	.short 0x1FFF
	.byte 0x00, 0x00
.L0601E1A4:
	.long 0x00000000
.L0601E1A8:
	.long D_0601D780
.L0601E1AC:
	.long func_0601E1B0
	endlabel func_0601E184

	glabel func_0601E1B0
	mov.l	@(16,r1),r3
	mov.b	@(0,r3),r0
	tst	r0,r0
	bt	.L0601E1C4
	mov.l	.L0601E1C0,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0601E1C0:
	.long obj_free
.L0601E1C4:
	sts.l	pr,@-r15
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0601E1D2
	lds.l	@r15+,pr
	rts
	nop
.L0601E1D2:
	mov.l	@(656,gbr),r0
	mov.l	.L0601E1F0,r14
	jsr	@r14
	mov	r0,r4
	mov	#6,r14
	mov.l	.L0601E1F4,r13
	jsr	@r13
	nop
	mov.l	.L0601E1F8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601E1F0:
	.long math_bin_to_bcd
.L0601E1F4:
	.long spr_build_number
.L0601E1F8:
	.long spr_draw_obj
	endlabel func_0601E1B0

	glabel func_0601E1FC
	mov.l	@(12,gbr),r0
	tst	#15,r0
	bf	.L0601E202
.L0601E202:
	sts.l	pr,@-r15
	mov.l	.L0601E24C,r2
	mov.l	.L0601E250,r0
	jsr	@r0
	nop
	mov.l	.L0601E254,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r1,@(16,r3)
	mov.l	.L0601E258,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601E25C,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0601E260,r0
	mov.l	r0,@(40,r3)
	mov.l	.L0601E264,r2
	mov.b	@(22,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov	#4,r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	.L0601E268,r10
	mov.l	@r10,r8
	mov.l	.L0601E26C,r9
	mov	#0,r7
.L0601E238:
	mov.l	@r9+,r0
	dmuls.l	r0,r2
	sts	mach,r0
	sts	macl,r10
	xtrct	r0,r10
	cmp/ge	r10,r8
	bt	.L0601E270
	add	#1,r7
	bra	.L0601E238
	nop
.L0601E24C:
	.long obj_list_load_scene
.L0601E250:
	.long obj_alloc
.L0601E254:
	.long func_0601E290
.L0601E258:
	.long 0x00000000
.L0601E25C:
	.long 0x00380000
.L0601E260:
	.long D_06051D48
.L0601E264:
	.long D_0601D210
.L0601E268:
	.long score
.L0601E26C:
	.long D_0601D1F8
.L0601E270:
	mov	r7,r0
	mov.b	r0,@(2,r3)
	mov.l	.L0601E288,r2
	mov	#4,r0
	mov.b	r7,@(r0,r2)
	mov	#1,r0
	mov.l	.L0601E28C,r2
	mov.b	r0,@r2
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601E288:
	.long grade
.L0601E28C:
	.long D_0601D0B1
	endlabel func_0601E1FC

	glabel func_0601E290
	mov.l	.L0601E2D4,r2
	mov.b	@(2,r1),r0
	shll	r0
	mov.w	@(r0,r2),r0
	mov.w	r0,@(22,r1)
	mov.w	r0,@(8,r1)
	mov.w	.L0601E2D0,r0
	mov.w	r0,@(28,r1)
	mov.l	.L0601E2D8,r3
	mov.l	.L0601E2DC,r2
	mov.l	.L0601E2E0,r2
	mov.w	.L0601E2D2,r7
.L0601E2A8:
	mov.w	@r2+,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L0601E2A8
	add	#2,r3
	mov	#0,r0
	mov.b	r0,@(4,r1)
	mov.b	r0,@(5,r1)
	mov.b	r0,@(6,r1)
	mov.b	r0,@(12,r1)
	mov.b	@(2,r1),r0
	mov.b	r0,@(10,r1)
	mov.l	.L0601E2E4,r10
	mov	#5,r0
	mov.b	r0,@r10
	mov.l	.L0601E2E8,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601E2D0:
	.short 0x1B20
.L0601E2D2:
	.short 0x0048
.L0601E2D4:
	.long D_0601D2D8
.L0601E2D8:
	.long VDP1_VRAM + 0xD900
.L0601E2DC:
	.long D_06052364
.L0601E2E0:
	.long func_0601D2E4
.L0601E2E4:
	.long D_0601D0B2
.L0601E2E8:
	.long func_0601E2EC
	endlabel func_0601E290

	glabel func_0601E2EC
	mov.l	@(16,r1),r3
	mov.b	@(0,r3),r0
	tst	r0,r0
	bt	.L0601E300
	mov.l	.L0601E2FC,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0601E2FC:
	.long obj_free
.L0601E300:
	sts.l	pr,@-r15
	mov.l	.L0601E328,r10
	mov.b	@r10,r0
	cmp/eq	#40,r0
	bt	.L0601E310
	mov.l	.L0601E32C,r3
	bsr	func_0601D478
	nop
.L0601E310:
	mov.b	@(6,r1),r0
	cmp/eq	#-1,r0
	bt	.L0601E31A
	bsr	func_0601D494
	nop
.L0601E31A:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0601E330
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601E328:
	.long D_0601D0B1
.L0601E32C:
	.long D_0601DD18
.L0601E330:
	mov.l	.L0601E370,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0601E374,r6
	mov.l	.L0601E378,r0
	jsr	@r0
	nop
	mov.l	@(60,r1),r0
	mov	r0,r4
	mov	r0,r5
	mov.l	.L0601E37C,r6
	mov.l	.L0601E380,r0
	jsr	@r0
	nop
	mov.w	@(22,r1),r0
	mov.l	.L0601E384,r2
	jsr	@r2
	nop
	mov.l	.L0601E388,r2
	mov.l	.L0601E38C,r6
	mov.l	.L0601E390,r0
	jsr	@r0
	nop
	mov.l	.L0601E394,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601E370:
	.long mtx_push_identity
.L0601E374:
	.long 0x01000000
.L0601E378:
	.long mtx_translate
.L0601E37C:
	.long 0x00030000
.L0601E380:
	.long mtx_scale
.L0601E384:
	.long mtx_rot_x
.L0601E388:
	.long D_06051D48
.L0601E38C:
	.long 0xFF200000
.L0601E390:
	.long func_0601F428
.L0601E394:
	.long mtx_pop
	endlabel func_0601E2EC

	glabel func_0601E398
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bt	.L0601E3C4
	sts.l	pr,@-r15
	mov.l	.L0601E3C8,r4
	mov.l	@r4,r4
	mov	#2,r0
	mov.b	r0,@(4,r4)
	mov.l	.L0601E3CC,r2
	mov.l	.L0601E3D0,r0
	jsr	@r0
	nop
	mov.l	.L0601E3D4,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L0601E3D8,r0
	mov.l	r0,@(48,r3)
	mov.l	r0,@(52,r3)
	mov.l	r0,@(56,r3)
	mov.l	.L0601E3DC,r4
	mov.l	r3,@r4
	lds.l	@r15+,pr
.L0601E3C4:
	rts
	nop
.L0601E3C8:
	.long cam_obj
.L0601E3CC:
	.long obj_list_load_scene
.L0601E3D0:
	.long obj_alloc
.L0601E3D4:
	.long func_0601E404
.L0601E3D8:
	.long 0x00000000
.L0601E3DC:
	.long active_cam_obj
	endlabel func_0601E398

	glabel func_0601E3E0
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bt	.L0601E3F8
	mov.w	@(498,gbr),r0
	mov.w	.L0601E3FC,r3
	or	r3,r0
	mov.l	.L0601E400,r2
	mov.w	r0,@r2
	mov.w	.L0601E3FE,r0
	mov.w	r0,@(506,gbr)
	mov.w	r0,@(508,gbr)
	mov.w	r0,@(510,gbr)
.L0601E3F8:
	rts
	nop
.L0601E3FC:
	.short 0x0040
.L0601E3FE:
	.short 0x0000
.L0601E400:
	.long VDP2_REGS + 0x112
	endlabel func_0601E3E0

	glabel func_0601E404
	rts
	nop
	endlabel func_0601E404

	glabel func_0601E408
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bt	.L0601E420
	sts.l	pr,@-r15
	mov.l	.L0601E424,r2
	mov.l	.L0601E428,r0
	jsr	@r0
	nop
	mov.l	.L0601E42C,r0
	mov.l	r0,@(12,r3)
	nop
	lds.l	@r15+,pr
.L0601E420:
	rts
	nop
.L0601E424:
	.long obj_list_load_scene
.L0601E428:
	.long obj_alloc
.L0601E42C:
	.long func_0601E430
	endlabel func_0601E408

	glabel func_0601E430
	mov.l	.L0601E454,r2
	mov.l	r2,@(44,r1)
	mov.b	@(22,gbr),r0
	shlr	r0
	add	#16,r0
	mov.w	r0,@(20,r1)
	mov.w	.L0601E44E,r0
	mov.w	r0,@(26,r1)
	mov.w	.L0601E450,r0
	mov.w	r0,@(22,r1)
	mov.l	.L0601E458,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601E44E:
	.short 0x8000
.L0601E450:
	.short 0x0100
	.byte 0x00, 0x00
.L0601E454:
	.long D_060137A4
.L0601E458:
	.long func_0601E45C
	endlabel func_0601E430

	glabel func_0601E45C
	sts.l	pr,@-r15
	mov.w	@(26,r1),r0
	mov	r0,r8
	mov	#0,r9
	mov.w	.L0601E494,r10
	mov.l	.L0601E498,r0
	jsr	@r0
	nop
	mov	r8,r0
	mov.l	.L0601E49C,r10
	jsr	@r10
	mov.w	r0,@(26,r1)
	shll	r10
	shll	r11
	shll8	r10
	shll8	r11
	mov.l	.L0601E4A0,r8
	mov.l	.L0601E4A4,r9
	sub	r10,r8
	sub	r11,r9
	mov.l	r8,@(48,r1)
	mov.l	r9,@(52,r1)
	mov.l	.L0601E4A8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0601E494:
	.short 0x0400
	.byte 0x00, 0x00
.L0601E498:
	.long math_angle_step_toward
.L0601E49C:
	.long math_sincos
.L0601E4A0:
	.long 0x00B00000
.L0601E4A4:
	.long 0x00AD0000
.L0601E4A8:
	.long spr_draw_obj
	endlabel func_0601E45C

	.section .data.0601E4AC,"aw",@progbits
	.p2align 2
	.byte 0xC4, 0x6B, 0x40, 0x11
