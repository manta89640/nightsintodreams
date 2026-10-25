	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601984C,"ax",@progbits
	.p2align 2
	.byte 0x00, 0x00

	glabel func_0601984E
	sts.l	pr,@-r15
	mov.l	@r3+,r0
	mov.l	.L060198A0,r7
	mov.w	r0,@r7
	mov	#0,r0
	mov.b	r0,@(5,r12)
.L0601985A:
	mov.w	@(8,r12),r0
	mov	r0,r2
	mov.w	@(6,r12),r0
	cmp/eq	r0,r2
	bt	.L060198A4
	mov.w	r0,@(8,r12)
	mov	r0,r2
	mov	#0,r0
	mov.l	r0,@(16,r12)
	mov.b	r0,@(4,r12)
	mov.l	r0,@(40,r12)
	mov.l	r0,@(44,r12)
	mov.l	r0,@(48,r12)
	mov	r2,r0
	shll2	r0
	shll2	r0
	add	r3,r0
	mov.l	@r0+,r2
	mov.l	@r0+,r5
	mov.w	@r0+,r14
	mov.b	@r0+,r8
	mov.b	@r0+,r9
	mov.w	@r0+,r10
	mov.w	@r0+,r11
	tst	r8,r8
	bt	.L060198C8
	mov.l	r5,@-r15
	bsr	func_06019A24
	nop
	mov.l	@r15+,r5
	bsr	func_06019A0C
	nop
	bra	.L060198D0
	mov.l	@(16,r12),r7
	.byte 0x00, 0x00
.L060198A0:
	.long D_060194D4 + 0x378
.L060198A4:
	mov	r2,r0
	shll2	r0
	shll2	r0
	add	r3,r0
	mov.l	@r0+,r2
	mov.l	@r0+,r5
	mov.w	@r0+,r14
	mov.b	@r0+,r8
	mov.b	@r0+,r9
	mov.w	@r0+,r10
	mov.w	@r0+,r11
	mov.b	@(4,r12),r0
	tst	r0,r0
	bt	.L060198C8
	bsr	func_06019A0C
	nop
	bra	.L060198D0
	mov.l	@(16,r12),r7
.L060198C8:
	mov.l	@(16,r12),r7
	mov.l	@(20,r12),r0
	add	r0,r7
	mov.l	r7,@(16,r12)
.L060198D0:
	mov	r7,r0
	shlr16	r0
	cmp/ge	r14,r0
	bf	.L06019920
	mov	#2,r6
	cmp/eq	r6,r9
	bf	.L060198FC
	add	#-1,r0
	shll2	r0
	mov.l	@(r0,r2),r4
	mov.l	r4,@(28,r12)
	mov	#1,r0
	mov.b	r0,@(5,r12)
	extu.w	r7,r0
	shlr16	r7
.L060198EE:
	sub	r14,r7
	cmp/ge	r14,r7
	bt	.L060198EE
	shll16	r7
	or	r0,r7
	bra	.L06019920
	mov.l	r7,@(16,r12)
.L060198FC:
	mov	#4,r6
	cmp/eq	r6,r9
	bf	.L06019914
	add	#-1,r0
	shll2	r0
	mov.l	@(r0,r2),r4
	mov.l	r4,@(28,r12)
	mov	#1,r0
	mov.b	r0,@(5,r12)
	mov	r10,r0
	bra	.L0601985A
	mov.w	r0,@(6,r12)
.L06019914:
	shlr16	r7
	add	#-1,r7
	shll16	r7
	mov.l	r7,@(16,r12)
	mov	#1,r0
	mov.b	r0,@(5,r12)
.L06019920:
	mov.l	@(16,r12),r3
	mov	r3,r4
	shlr16	r4
	tst	r5,r5
	bt	.L0601995A
	mov	r4,r0
	mov	#12,r7
	mulu.w	r7,r0
	sts	macl,r0
	add	r0,r5
	mov.l	@r5+,r0
	mov.l	@(40,r12),r7
	mov.l	r0,@(40,r12)
	sub	r7,r0
	mov.l	@(48,r1),r7
	add	r0,r7
	mov.l	@r5+,r0
	mov.l	@(44,r12),r7
	mov.l	r0,@(44,r12)
	sub	r7,r0
	mov.l	@(52,r1),r7
	sub	r0,r7
	mov.l	r7,@(52,r1)
	mov.l	@r5+,r0
	mov.l	@(48,r12),r7
	mov.l	r0,@(48,r12)
	sub	r7,r0
	mov.l	@(56,r1),r7
	sub	r0,r7
.L0601995A:
	extu.w	r3,r5
	shlr16	r3
	mov.l	@(24,r12),r11
	add	#-1,r3
	cmp/pz	r3
	bt	.L0601996A
	bra	.L06019970
	mov.l	@(28,r12),r3
.L0601996A:
	shll2	r3
	add	r2,r3
	mov.l	@r3,r3
.L06019970:
	shll2	r4
	add	r2,r4
	mov.l	@r4,r4
	mov.l	.L06019994,r7
	mov.w	@r7,r7
	mov	r7,r0
	shll	r0
	add	r0,r7
	tst	r5,r5
	bf	.L06019998
.L06019984:
	mov.w	@r3+,r8
	mov.w	r8,@r11
	dt	r7
	bf/s	.L06019984
	add	#2,r11
	bra	.L060199BE
	nop
	.byte 0x00, 0x00
.L06019994:
	.long D_060194D4 + 0x378
.L06019998:
	mov.w	@r3+,r8
	mov.w	@r4+,r9
	extu.w	r8,r8
	extu.w	r9,r9
	sub	r8,r9
	tst	r9,r9
	bt	.L060199B6
	cmp/pz	r9
	bt	.L060199AC
	extu.w	r9,r9
.L060199AC:
	exts.w	r9,r9
	dmuls.l	r9,r5
	sts	macl,r9
	shlr16	r9
	add	r9,r8
.L060199B6:
	mov.w	r8,@r11
	dt	r7
	bf/s	.L06019998
	add	#2,r11
.L060199BE:
	mov.l	@(16,r12),r0
	mov.w	@(12,r12),r0
	tst	r0,r0
	bt	.L06019A00
	mov	r0,r8
	mov.w	@(14,r12),r0
	tst	r0,r0
	bt	.L06019A04
	mov	r0,r9
	mov.l	@(36,r12),r2
	mov.l	@(24,r12),r3
	mov.l	@(32,r12),r4
	mov.l	.L060199FC,r7
	mov.w	@r7,r7
	mov	r7,r0
	shll	r0
	add	r0,r7
.L060199E0:
	mov.w	@r3+,r5
	muls.w	r5,r8
	sts	macl,r5
	mov.w	@r4+,r6
	muls.w	r6,r8
	sts	macl,r6
	add	r5,r6
	shlr8	r6
	mov.w	r6,@r2
	dt	r7
	bf/s	.L060199E0
	add	#2,r2
	bra	.L06019A06
	mov.l	@(36,r12),r12
.L060199FC:
	.long D_060194D4 + 0x378
.L06019A00:
	bra	.L06019A06
	mov.l	@(32,r12),r12
.L06019A04:
	mov.l	@(24,r12),r12
.L06019A06:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_0601984E

	glabel func_06019A0C
	mov.l	@(16,r12),r8
	mov.w	@(10,r12),r0
	add	r0,r8
	mov.l	r8,@(16,r12)
	mov	#1,r0
	shll16	r0
	cmp/ge	r0,r8
	bf	.L06019A20
	mov	#0,r0
	mov.b	r0,@(4,r12)
.L06019A20:
	rts
	nop
	endlabel func_06019A0C

	glabel func_06019A24
	mov.l	@(24,r12),r5
	mov.l	.L06019A58,r6
	mov.l	r6,@(28,r12)
	mov.l	.L06019A5C,r7
	mov.w	@r7,r7
	mov	r7,r0
	shll	r0
	add	r0,r7
.L06019A34:
	mov.w	@r5+,r0
	mov.w	r0,@r6
	add	#2,r6
	dt	r7
	bf	.L06019A34
	mov	r8,r0
	add	#-1,r0
	mov.b	r0,@(4,r12)
	add	#-4,r8
	tst	r8,r8
	bf	.L06019A60
	mov.l	@(20,r12),r0
	shar	r0
	shar	r0
	mov.w	r0,@(10,r12)
	rts
	nop
	.byte 0x00, 0x00
.L06019A58:
	.long D_060195B2
.L06019A5C:
	.long D_060194D4 + 0x378
.L06019A60:
	add	#-4,r8
	tst	r8,r8
	bf	.L06019A74
	mov.l	@(20,r12),r0
	shar	r0
	shar	r0
	shar	r0
	mov.w	r0,@(10,r12)
	rts
	nop
.L06019A74:
	mov.l	@(20,r12),r0
	shar	r0
	shar	r0
	shar	r0
	shar	r0
	mov.w	r0,@(10,r12)
	rts
	nop
	endlabel func_06019A24

	.section .data.06019A84,"aw",@progbits
	.p2align 2
	.byte 0x00, 0x00, 0x00, 0x09
