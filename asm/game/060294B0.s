	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060294B0,"ax",@progbits
	.p2align 2

	glabel func_060294B0
	sts.l	pr,@-r15
	mov.l	.L060294D0,r4
	mov	#4,r6
.L060294B6:
	mov.b	@r4,r0
	tst	r0,r0
	bt	.L060294C2
	mov	r6,r2
	bsr	func_060294D4
	add	#-1,r2
.L060294C2:
	add	#-1,r4
	dt	r6
	bf	.L060294B6
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L060294D0:
	.long D_060294AF
	endlabel func_060294B0

	glabel func_060294D4
	mov.l	.L06029510,r5
	add	r2,r5
	mov.b	@r5,r0
	xor	#1,r0
	mov.b	r0,@r5
	shll2	r2
	shll	r2
	mov.l	.L06029514,r0
	add	r0,r2
	mov.l	@r2,r2
	mov	#15,r7
.L060294EA:
	mov.l	@r2+,r5
	add	#12,r5
	mov.l	@r5+,r9
	mov.l	@r5+,r10
	add	#4,r10
	mov	#1,r8
	shll8	r8
.L060294F8:
	mov.w	@r10,r0
	xor	r8,r0
	mov.w	r0,@r10
	dt	r9
	bf/s	.L060294F8
	add	#16,r10
	dt	r7
	bf/s	.L060294EA
	nop
	rts
	nop
	.byte 0x00, 0x00
.L06029510:
	.long D_060294AC
.L06029514:
	.long D_060288C4
	endlabel func_060294D4

	glabel func_06029518
	sts.l	pr,@-r15
	mov.l	.L06029534,r0
	jsr	@r0
	nop
	mov.l	@(16,r1),r2
	mov.l	@r2+,r7
	mov.l	@r2+,r8
	mov.l	@r2+,r9
	mov.l	@(8,r1),r2
	mov.b	@(1,r2),r0
	tst	#4,r0
	bt	.L06029538
	bra	.L06029658
	nop
.L06029534:
	.long func_0600CA24
.L06029538:
	mov.w	@(22,r1),r0
	mov.l	.L06029648,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r9
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	sub	r2,r3
	dmuls.l	r11,r9
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	add	r2,r9
	mov	r3,r7
	mov.w	@(26,r1),r0
	mov.l	.L06029648,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r8
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	add	r4,r3
	dmuls.l	r11,r8
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	sub	r4,r8
	mov	r3,r7
	mov.l	@(8,r1),r2
	mov	#56,r0
	add	r0,r2
	mov.w	@r2+,r3
	shll16	r3
	mov.w	@r2,r4
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.w	@(24,r1),r0
	sub	r4,r0
	sub	r4,r0
	mov.l	.L06029648,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r9
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	sub	r2,r3
	dmuls.l	r11,r9
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	add	r2,r9
	mov	r3,r7
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	sub	r7,r4
	sub	r8,r5
	sub	r9,r6
	mov.l	@r15+,r7
	mov.l	@r15+,r8
	mov.l	r8,@-r15
	mov	r8,r0
	neg	r0,r0
	mov.l	.L06029648,r10
	jsr	@r10
	nop
	neg	r10,r10
	neg	r11,r11
	shll2	r10
	shll2	r11
	dmuls.l	r7,r10
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	dmuls.l	r7,r11
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	add	r2,r4
	add	r3,r6
	mov.l	.L0602964C,r0
	jsr	@r0
	nop
	mov.l	@(44,r1),r4
	mov	r4,r0
	shar	r0
	shar	r0
	shar	r0
	add	r0,r4
	mov	r4,r5
	mov	r4,r6
	mov.l	.L06029650,r0
	jsr	@r0
	neg	r6,r6
	mov.l	@r15+,r8
	add	r8,r8
	mov.w	@(24,r1),r0
	add	r8,r0
	mov.l	.L06029654,r2
	jsr	@r2
	nop
	bra	.L0602977A
	mov	#0,r8
.L06029648:
	.long func_06007BD8
.L0602964C:
	.long func_0600CBDA
.L06029650:
	.long func_0600D018
.L06029654:
	.long func_0600CAF8
.L06029658:
	neg	r9,r9
	mov.w	@(22,r1),r0
	mov.l	.L060297A4,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r9
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	sub	r2,r3
	dmuls.l	r11,r9
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	add	r2,r9
	mov	r3,r7
	mov.w	@(26,r1),r0
	mov.l	.L060297A4,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r8
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	add	r4,r3
	dmuls.l	r11,r8
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	sub	r4,r8
	mov	r3,r7
	mov.w	@(24,r1),r0
	neg	r0,r0
	mov.l	.L060297A4,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r9
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	sub	r2,r3
	dmuls.l	r11,r9
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	add	r2,r9
	mov	r3,r7
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	sub	r7,r4
	add	r8,r5
	sub	r9,r6
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov	r5,r0
	mov.l	@(12,r1),r3
	mov.l	@(52,r1),r2
	mov.b	@(2,r3),r0
	shll16	r0
	add	r2,r0
	sub	r5,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@(8,r1),r2
	mov	#56,r3
	add	r3,r2
	mov.w	@r2+,r7
	shll16	r7
	add	r0,r7
	add	r0,r7
	mov.w	@r2,r8
	mov.l	r8,@-r15
	mov	r8,r0
	mov.l	.L060297A4,r10
	jsr	@r10
	nop
	neg	r10,r10
	neg	r11,r11
	shll2	r10
	shll2	r11
	dmuls.l	r7,r10
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	dmuls.l	r7,r11
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	add	r2,r5
	add	r3,r4
	mov.l	.L060297A8,r0
	jsr	@r0
	nop
	mov.l	@(44,r1),r4
	mov	r4,r5
	mov	r4,r6
	mov.l	.L060297AC,r0
	jsr	@r0
	neg	r4,r4
	mov.w	@(24,r1),r0
	neg	r0,r0
	mov.l	.L060297B0,r2
	jsr	@r2
	nop
	mov.l	@r15+,r8
	add	r8,r8
	neg	r8,r8
.L0602977A:
	mov	#64,r2
	shll8	r2
	mov.w	@(26,r1),r0
	add	r2,r0
	neg	r0,r0
	sub	r2,r0
	add	r8,r0
	mov.l	.L060297B4,r2
	jsr	@r2
	nop
	mov.l	@(12,r1),r4
	mov.w	@(14,r4),r0
	mov	r0,r2
	mov.w	@(22,r1),r0
	sub	r2,r0
	mov.l	.L060297B0,r2
	jsr	@r2
	nop
	bra	.L060297B8
	nop
	.byte 0x00, 0x00
.L060297A4:
	.long func_06007BD8
.L060297A8:
	.long func_0600CBDA
.L060297AC:
	.long func_0600D018
.L060297B0:
	.long func_0600CAF8
.L060297B4:
	.long func_0600CB68
.L060297B8:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029B5C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06029B60,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06029B64,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	cmp/pl	r0
	bt	.L060297DA
	mov.l	.L06029B68,r2
	jsr	@r2
	mov.w	@r12+,r0
.L060297DA:
	mov.l	@r13+,r2
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029B6C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	.L06029B70,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029B5C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	add	r2,r0
	mov.l	.L06029B60,r2
	jsr	@r2
	nop
	mov.l	.L06029B64,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06029820
	mov.l	.L06029B68,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06029820:
	mov.l	@r13+,r2
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029B6C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	.L06029B70,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029B5C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	add	r2,r0
	mov.l	.L06029B60,r2
	jsr	@r2
	nop
	mov.l	.L06029B64,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06029866
	mov.l	.L06029B68,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06029866:
	mov.l	@r13+,r2
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029B6C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	.L06029B74,r0
	jsr	@r0
	nop
	mov.l	.L06029B70,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029B5C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06029B60,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06029B64,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L060298A8
	mov.l	.L06029B68,r2
	jsr	@r2
	mov.w	@r12+,r0
.L060298A8:
	mov.l	@r13+,r2
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029B6C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029B5C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06029B60,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06029B64,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L060298DE
	mov.l	.L06029B68,r2
	jsr	@r2
	mov.w	@r12+,r0
.L060298DE:
	mov.l	@r13+,r2
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029B6C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029B5C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06029B60,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06029B64,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06029914
	mov.l	.L06029B68,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06029914:
	mov.l	@r13+,r2
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029B6C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	.L06029B74,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029B5C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06029B60,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06029B64,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06029950
	mov.l	.L06029B68,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06029950:
	mov.l	@r13+,r2
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029B6C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029B5C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06029B60,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06029B64,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06029986
	mov.l	.L06029B68,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06029986:
	mov.l	@r13+,r2
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029B6C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029B5C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06029B60,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06029B64,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L060299BC
	mov.l	.L06029B68,r2
	jsr	@r2
	mov.w	@r12+,r0
.L060299BC:
	mov.l	@r13+,r2
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029B6C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	.L06029B74,r0
	jsr	@r0
	nop
	mov.l	.L06029B70,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029B5C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	sub	r2,r0
	mov.l	.L06029B60,r2
	jsr	@r2
	nop
	mov.l	.L06029B64,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06029A08
	mov.l	.L06029B68,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06029A08:
	mov.l	@r13+,r2
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029B6C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029B5C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	sub	r2,r0
	mov.l	.L06029B60,r2
	jsr	@r2
	nop
	mov.l	.L06029B64,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06029A48
	mov.l	.L06029B68,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06029A48:
	mov.l	@r13+,r2
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029B6C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029B5C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06029B60,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06029B64,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06029A7E
	mov.l	.L06029B68,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06029A7E:
	mov.l	@r13+,r2
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029B6C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	.L06029B74,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029B5C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	sub	r2,r0
	mov.l	.L06029B60,r2
	jsr	@r2
	nop
	mov.l	.L06029B64,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06029AC4
	mov.l	.L06029B68,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06029AC4:
	mov.l	@r13+,r2
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029B6C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029B5C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	sub	r2,r0
	mov.l	.L06029B60,r2
	jsr	@r2
	nop
	mov.l	.L06029B64,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06029B04
	mov.l	.L06029B68,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06029B04:
	mov.l	@r13+,r2
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029B6C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029B5C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06029B60,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06029B64,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06029B3A
	mov.l	.L06029B68,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06029B3A:
	mov.l	@r13+,r2
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029B6C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	.L06029B74,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06029B5C:
	.long func_0600CBDA
.L06029B60:
	.long func_0600CB68
.L06029B64:
	.long func_0600CAF8
.L06029B68:
	.long func_0600CA7A
.L06029B6C:
	.long func_0601F42C
.L06029B70:
	.long func_0600CA24
.L06029B74:
	.long func_0600CA4E
	endlabel func_06029518

	glabel func_06029B78
	mov.w	@(28,r12),r0
	cmp/pz	r0
	bf	.L06029B90
	mov	r0,r2
	mov.w	@(22,r12),r0
	cmp/eq	r0,r2
	bf	.L06029B90
	mov	#-1,r0
	mov.w	r0,@(28,r12)
	mov.b	@(1,r12),r0
	and	#207,r0
	mov.b	r0,@(1,r12)
.L06029B90:
	rts
	nop
	endlabel func_06029B78

	glabel func_06029B94
	nop
	mov.l	.L06029BA8,r3
.L06029B98:
	mov.w	@(24,r12),r0
	mov	r0,r2
	mov.w	@(22,r12),r0
	cmp/pz	r0
	bt	.L06029BAC
.L06029BA2:
	bra	.L06029BA2
	nop
	.byte 0x00, 0x00
.L06029BA8:
	.long D_06029ED4
.L06029BAC:
	cmp/eq	r0,r2
	bt	.L06029BE4
	mov.w	r0,@(24,r12)
	mov	r0,r5
	mov	#0,r0
	mov.b	r0,@(11,r12)
	mov	#-1,r8
	cmp/eq	r8,r2
	bt	.L06029BC0
	mov.w	r0,@(26,r12)
.L06029BC0:
	mov	r5,r0
	shll2	r0
	shll2	r0
	add	r3,r0
	mov.l	@r0+,r2
	mov.l	@r0+,r5
	mov.w	@r0+,r8
	mov.w	@r0+,r9
	mov.w	@r0+,r10
	mov.w	@r0+,r11
	tst	r8,r8
	bt	.L06029C08
	mov.l	.L06029BE0,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06029BE0:
	.long func_06029E08
.L06029BE4:
	mov.b	@(11,r12),r0
	tst	r0,r0
	bt	.L06029BF4
	mov.l	.L06029BF0,r0
	jmp	@r0
	nop
.L06029BF0:
	.long func_06029DCE
.L06029BF4:
	mov	r2,r0
	shll2	r0
	shll2	r0
	add	r3,r0
	mov.l	@r0+,r2
	mov.l	@r0+,r5
	mov.w	@r0+,r8
	mov.w	@r0+,r9
	mov.w	@r0+,r10
	mov.w	@r0+,r11
.L06029C08:
	mov	r12,r4
	mov.w	@(26,r4),r0
	mov	r0,r7
	shlr	r0
	shll	r0
	mov.w	@(r0,r2),r12
	exts.w	r12,r12
	tst	r12,r12
	bt/s	.L06029C28
	add	r2,r12
	mov.l	.L06029C24,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06029C24:
	.long .L06029D36
.L06029C28:
	mov	#2,r0
	cmp/eq	r0,r9
	bf	.L06029C38
.L06029C2E:
	mov	#0,r7
	mov.w	@r2,r12
	exts.w	r12,r12
	bra	.L06029D36
	add	r2,r12
.L06029C38:
	mov	#4,r0
	cmp/eq	r0,r9
	bf	.L06029C5C
	mov	r10,r0
	mov.w	r0,@(22,r4)
	mov	r4,r12
	tst	r11,r11
	bt	.L06029B98
	mov.w	@(22,r1),r0
	add	r11,r0
	mov.w	r0,@(22,r1)
	mov.l	@(16,r1),r2
	add	#14,r2
	mov.w	@r2,r0
	add	r11,r0
	mov.w	r0,@r2
	bra	.L06029B98
	nop
.L06029C5C:
	mov	#5,r0
	cmp/eq	r0,r9
	bf	.L06029D12
	mov.w	@(26,r1),r0
	mov	r0,r7
	mov.w	@(22,r1),r0
	cmp/pz	r0
	bt	.L06029C6E
	neg	r7,r7
.L06029C6E:
	mov	r7,r0
	mov.w	.L06029C90,r6
	and	r6,r7
	tst	r7,r7
	mov.l	.L06029C94,r7
	bf	.L06029C7C
	add	#16,r7
.L06029C7C:
	shlr8	r0
	shlr2	r0
	shlr2	r0
	and	#14,r0
	add	r0,r7
	mov.b	@(9,r4),r0
	cmp/eq	#-117,r0
	bf	.L06029C98
	bra	.L06029CA2
	add	#32,r7
.L06029C90:
	.short 0x1FFF
	.byte 0x00, 0x00
.L06029C94:
	.long D_06029CB2
.L06029C98:
	mov.w	@(6,r1),r0
	and	#112,r0
	cmp/eq	#48,r0
	bf	.L06029CA2
	add	#64,r7
.L06029CA2:
	mov.w	@r7,r7
	mov.w	@(22,r4),r0
	cmp/eq	r0,r7
	bt	.L06029C2E
	mov	r7,r0
	mov.w	r0,@(22,r4)
	bra	.L06029B98
	mov	r4,r12
	dlabel D_06029CB2
	.byte 0x00, 0x1B, 0x00, 0x1A, 0x00, 0x18, 0x00, 0x19, 0x00, 0x19, 0x00, 0x1E, 0x00, 0x1C, 0x00, 0x1B
	.byte 0x00, 0x1B, 0x00, 0x1A, 0x00, 0x1D, 0x00, 0x18, 0x00, 0x19, 0x00, 0x19, 0x00, 0x17, 0x00, 0x1B
	.byte 0x00, 0x66, 0x00, 0x1A, 0x00, 0x18, 0x00, 0x65, 0x00, 0x65, 0x00, 0x64, 0x00, 0x64, 0x00, 0x66
	.byte 0x00, 0x66, 0x00, 0x1A, 0x00, 0x1D, 0x00, 0x18, 0x00, 0x65, 0x00, 0x65, 0x00, 0x64, 0x00, 0x66
	.byte 0x00, 0x1B, 0x00, 0xE7, 0x00, 0x18, 0x00, 0x19, 0x00, 0x19, 0x00, 0xE9, 0x00, 0x1C, 0x00, 0x1B
	.byte 0x00, 0x1B, 0x00, 0xE7, 0x00, 0xE8, 0x00, 0x18, 0x00, 0x19, 0x00, 0x19, 0x00, 0x17, 0x00, 0x1B
.L06029D12:
	mov	#6,r0
	cmp/eq	r0,r9
	bf	.L06029D28
	mov.w	@(22,r4),r0
	mov	r0,r7
	mov.w	@(30,r4),r0
	cmp/eq	r0,r7
	bt	.L06029C2E
	mov.w	r0,@(22,r4)
	bra	.L06029B98
	mov	r4,r12
.L06029D28:
	add	#-1,r7
	mov	r7,r0
	shlr	r0
	shll	r0
	mov.w	@(r0,r2),r12
	exts.w	r12,r12
	add	r2,r12
.L06029D36:
	mov	r7,r0
	add	#1,r0
	mov.w	r0,@(26,r4)
	mov	#0,r7
	mov	r7,r8
	mov	r7,r9
	mov.w	@r12+,r0
	mov.b	r0,@(59,gbr)
	exts.b	r0,r6
	shlr8	r0
	shlr	r0
	bf	.L06029D58
	mov.w	@r12+,r7
	mov.w	@r12+,r5
	extu.w	r5,r5
	shll16	r7
	add	r5,r7
.L06029D58:
	shlr	r0
	bf	.L06029D66
	mov.w	@r12+,r8
	mov.w	@r12+,r5
	extu.w	r5,r5
	shll16	r8
	add	r5,r8
.L06029D66:
	shlr	r0
	bf	.L06029D74
	mov.w	@r12+,r9
	mov.w	@r12+,r5
	extu.w	r5,r5
	shll16	r9
	add	r5,r9
.L06029D74:
	mov	r12,r4
	mov.l	@(16,r1),r5
	mov.l	r7,@r5
	add	#4,r5
	mov.l	r8,@r5
	add	#4,r5
	mov.l	r9,@r5
	add	#4,r5
	tst	r6,r6
	bf	.L06029D98
	mov	#45,r7
.L06029D8A:
	mov.w	@r4+,r0
	mov.w	r0,@r5
	dt	r7
	bf/s	.L06029D8A
	add	#2,r5
	rts
	nop
.L06029D98:
	mov	#15,r7
	exts.b	r6,r6
	cmp/pl	r6
	bt	.L06029DB4
	mov.w	@r4+,r0
	mov.w	r0,@r5
	add	#2,r5
	mov.w	@r4+,r0
	mov.w	r0,@r5
	add	#2,r5
	mov.w	@r4+,r0
	mov.w	r0,@r5
	add	#2,r5
	mov	#14,r7
.L06029DB4:
	mov.w	@r4+,r0
	mov.w	r0,@r5
	add	#2,r5
	mov.w	@r4+,r0
	mov.w	r0,@r5
	add	#2,r5
	mov	#0,r0
	mov.w	r0,@r5
	dt	r7
	bf/s	.L06029DB4
	add	#2,r5
	rts
	nop
	endlabel func_06029B94

	glabel func_06029DCE
	mov.b	@(11,r12),r0
	dt	r0
	mov.b	r0,@(11,r12)
	mov.l	@(16,r1),r5
	mov	r5,r6
	mov	#104,r0
	extu.b	r0,r0
	add	r0,r6
	mov	#3,r7
.L06029DE0:
	mov.l	@r5,r0
	mov.l	@r6+,r2
	add	r2,r0
	mov.l	r0,@r5
	add	#4,r5
	dt	r7
	bf	.L06029DE0
	mov	r5,r12
	mov	#45,r7
.L06029DF2:
	mov.w	@r5,r0
	mov.w	@r6+,r2
	add	r2,r0
	mov.w	r0,@r5
	add	#2,r5
	dt	r7
	bf	.L06029DF2
	mov	#0,r0
	mov.b	r0,@(59,gbr)
	rts
	nop
	endlabel func_06029DCE

	glabel func_06029E08
	mov	r12,r4
	mov.w	@(26,r4),r0
	shlr	r0
	shll	r0
	mov.w	@(r0,r2),r12
	exts.w	r12,r12
	add	r2,r12
	mov.w	@r12+,r0
	exts.b	r0,r9
	mov	r0,r3
	shlr8	r3
	mov.l	@(16,r1),r5
	mov	r5,r6
	mov	#104,r0
	extu.b	r0,r0
	add	r0,r6
	mov	r8,r0
	add	#-2,r0
	mov.b	r0,@(11,r4)
	mov	r8,r0
	mov.l	.L06029E50,r8
.L06029E32:
	shlr	r0
	bf/s	.L06029E32
	add	#-2,r8
	mov	#3,r7
	mov	#0,r0
	shlr	r3
	bf	.L06029E4A
	mov.w	@r12+,r0
	mov.w	@r12+,r2
	extu.w	r2,r2
	shll16	r0
	add	r2,r0
.L06029E4A:
	mov.l	@r5,r4
	jmp	@r8
	sub	r4,r0
.L06029E50:
	.long D_06029E64
	endlabel func_06029E08

	.section .data.06029E54,"aw",@progbits
	.p2align 2
	.byte 0x40, 0x21, 0x40, 0x21, 0x40, 0x21, 0x40, 0x21, 0x40, 0x21, 0x40, 0x21, 0x40, 0x21, 0x34, 0x0C
	dlabel D_06029E64
	.byte 0x25, 0x42, 0x75, 0x04
	.long D_06024710 + 0x20000000
	.byte 0x8F, 0xE5, 0x76, 0x04
