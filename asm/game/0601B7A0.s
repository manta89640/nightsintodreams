	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601B7A0,"ax",@progbits
	.p2align 2

	glabel func_0601B7A0
	sts.l	pr,@-r15
	mov.b	@(10,r7),r0
	tst	#2,r0
	bt	.L0601B7AC
	bsr	func_0601B870
	nop
.L0601B7AC:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_0601B7A0

	glabel func_0601B7B2
	sts.l	pr,@-r15
	mov.b	@(10,r7),r0
	tst	#1,r0
	bt	.L0601B7C6
	mov.l	.L0601B7E4,r2
	mov.l	.L0601B7E8,r0
	jsr	@r0
	nop
	mov.l	.L0601B7EC,r0
	mov.l	r0,@(12,r3)
.L0601B7C6:
	mov.b	@(10,r7),r0
	tst	#2,r0
	bt	.L0601B7DC
	mov.b	@(20,gbr),r0
	cmp/eq	#12,r0
	bt	.L0601B7DC
	cmp/eq	#14,r0
	bt	.L0601B7DC
	mov.b	@(108,gbr),r0
	or	#1,r0
	mov.b	r0,@(108,gbr)
.L0601B7DC:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601B7E4:
	.long D_060FFFB8
.L0601B7E8:
	.long func_0600D0D0
.L0601B7EC:
	.long func_0601B974
	endlabel func_0601B7B2

	glabel func_0601B7F0
	sts.l	pr,@-r15
	mov.b	@(10,r7),r0
	tst	#2,r0
	bt	.L0601B80E
	mov.b	@(20,gbr),r0
	cmp/eq	#12,r0
	bt	.L0601B80E
	cmp/eq	#14,r0
	bt	.L0601B80E
	mov.l	.L0601B814,r2
	mov.l	.L0601B818,r0
	jsr	@r0
	nop
	mov.l	.L0601B81C,r0
	mov.l	r0,@(12,r3)
.L0601B80E:
	lds.l	@r15+,pr
	rts
	nop
.L0601B814:
	.long D_060FFFB8
.L0601B818:
	.long func_0600D0D0
.L0601B81C:
	.long func_0601BA80
	endlabel func_0601B7F0

	glabel func_0601B820
	sts.l	pr,@-r15
	mov.b	@(10,r7),r0
	tst	#4,r0
	bt	.L0601B834
	mov.l	.L0601B83C,r2
	mov.l	.L0601B840,r0
	jsr	@r0
	nop
	mov.l	.L0601B844,r0
	mov.l	r0,@(12,r3)
.L0601B834:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601B83C:
	.long D_060FFFB8
.L0601B840:
	.long func_0600D0D0
.L0601B844:
	.long func_0601BB26
	endlabel func_0601B820

	glabel func_0601B848
	sts.l	pr,@-r15
	mov.b	@(10,r7),r0
	tst	#4,r0
	bt	.L0601B85C
	mov.l	.L0601B864,r2
	mov.l	.L0601B868,r0
	jsr	@r0
	nop
	mov.l	.L0601B86C,r0
	mov.l	r0,@(12,r3)
.L0601B85C:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601B864:
	.long D_060FFFB8
.L0601B868:
	.long func_0600D0D0
.L0601B86C:
	.long func_0601D0B4
	endlabel func_0601B848

	glabel func_0601B870
	sts.l	pr,@-r15
	mov.l	.L0601B8F8,r7
	mov.l	.L0601B8FC,r2
	mov.l	.L0601B900,r0
	jsr	@r0
	nop
	mov.l	.L0601B904,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L0601B908,r2
	mov.l	r2,@(44,r3)
	mov.l	.L0601B90C,r2
	mov.l	r2,@(60,r3)
	mov.l	.L0601B910,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601B914,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0601B918,r0
	mov.l	r0,@(56,r3)
	mov.l	.L0601B91C,r0
	mov.l	r0,@(32,r3)
	mov.l	.L0601B920,r0
	mov.l	r0,@(36,r3)
	mov.l	@(712,gbr),r0
	mov	#60,r13
	mov	#-128,r14
	shll	r14
	mov.l	r13,@(0,r14)
	mov.l	r0,@(4,r14)
	mov.l	@(28,r14),r0
	mov.l	r0,@-r15
	mov	#40,r14
	cmp/gt	r14,r0
	bt	.L0601B8BA
	mov.l	.L0601B924,r4
	mov	#1,r14
	mov.b	r14,@r4
.L0601B8BA:
	mov.l	.L0601B928,r14
	jsr	@r14
	mov	r0,r4
	mov	#3,r14
	mov.l	.L0601B92C,r5
	mov.l	.L0601B930,r10
	jsr	@r10
	mov	r0,r4
	mov.l	@r15+,r8
	mov	#120,r0
	sub	r8,r0
	cmp/pz	r0
	bt	.L0601B8D6
	mov	#0,r0
.L0601B8D6:
	mov	#100,r8
	mulu.w	r0,r8
	sts	macl,r8
	mov.l	@(656,gbr),r0
	add	r8,r0
	mov.l	r0,@(656,gbr)
	mov.l	.L0601B928,r14
	jsr	@r14
	mov	r8,r4
	mov	#5,r14
	mov.l	.L0601B934,r5
	mov.l	.L0601B930,r10
	jsr	@r10
	mov	r0,r4
	lds.l	@r15+,pr
	rts
	nop
.L0601B8F8:
	.long D_060FFE50
.L0601B8FC:
	.long D_060FFFB8
.L0601B900:
	.long func_0600D0D0
.L0601B904:
	.long func_06019A88
.L0601B908:
	.long D_0601B938
.L0601B90C:
	.long D_0601B958
.L0601B910:
	.long 0xFFFFFFE7
.L0601B914:
	.long 0x0000000B
.L0601B918:
	.long 0x0000012C
.L0601B91C:
	.long 0x00000029
.L0601B920:
	.long 0x00000000
.L0601B924:
	.long D_0604DBB3
.L0601B928:
	.long func_0601CB9A
.L0601B92C:
	.long D_0601B944
.L0601B930:
	.long func_06019D10
.L0601B934:
	.long D_0601B952
	endlabel func_0601B870

	.section .data.0601B938,"aw",@progbits
	.p2align 2
	dlabel D_0601B938
	.byte 0x40, 0x32, 0x54, 0x40, 0x30, 0x49, 0x4D, 0x45, 0x3A, 0x20, 0x20, 0x20
	dlabel D_0601B944
	.byte 0x20, 0x20, 0x30, 0xFF, 0x40, 0x34, 0x42, 0x40, 0x30, 0x4F, 0x4E, 0x55, 0x53, 0x3A
	dlabel D_0601B952
	.byte 0x20, 0x20, 0x20, 0x20
	dlabel D_0601B956
	.byte 0x30, 0xFE
	dlabel D_0601B958
	.byte 0x40, 0x30, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFF, 0x40, 0x30
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFE
