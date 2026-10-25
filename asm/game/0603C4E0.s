	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603C4E0,"ax",@progbits
	.p2align 2
	.byte 0x66, 0xF6

	glabel func_0603C4E2
	sts.l	pr,@-r15
	mov.l	.L0603C584,r12
	mov.l	@(48,r1),r4
	mov.l	@r12,r12
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.l	@(48,r12),r7
	mov.l	@(52,r12),r8
	mov.l	@(56,r12),r9
	mov.l	r7,@(32,r1)
	mov.l	r8,@(36,r1)
	mov.l	r9,@(40,r1)
	sub	r7,r4
	sub	r8,r5
	sub	r9,r6
	mov	r1,r7
	add	#32,r7
	mov.w	@(18,r12),r0
	mov	#8,r8
	cmp/pz	r0
	bf/s	.L0603C510
	shll8	r8
	neg	r8,r8
.L0603C510:
	shll16	r8
	mov.l	r8,@(36,r7)
	mov.l	.L0603C588,r8
	mov.w	@(24,r12),r0
	jsr	@r8
	mov.w	r0,@(2,r7)
	shll2	r4
	dmuls.l	r10,r4
	shll2	r6
	sts	mach,r8
	dmuls.l	r10,r6
	shlr16	r5
	sts	mach,r9
	dmuls.l	r11,r4
	exts.w	r5,r5
	sts	mach,r4
	dmuls.l	r11,r6
	sub	r9,r4
	sts	mach,r6
	mov.l	.L0603C58C,r11
	add	r8,r6
	mov	r4,r2
	jsr	@r11
	mov	r5,r3
	muls.w	r4,r4
	mov.w	r0,@(6,r7)
	sts	macl,r4
	muls.w	r5,r5
	sts	macl,r0
	mov.l	.L0603C590,r12
	add	r0,r4
	jsr	@r12
	mov	r4,r0
	mov	r0,r2
	jsr	@r11
	mov	r6,r3
	muls.w	r6,r6
	mov.w	r0,@(10,r7)
	sts	macl,r0
	jsr	@r12
	add	r4,r0
	shll2	r0
	shll16	r0
	mov.l	r0,@(60,r1)
	shlr2	r0
	shlr2	r0
	shlr2	r0
	mov.l	r0,@(44,r7)
	mov.w	@(22,r1),r0
	shll16	r0
	shlr2	r0
	shlr2	r0
	lds.l	@r15+,pr
	shlr2	r0
	rts
	mov.l	r0,@(40,r7)
	.long func_0600E4C4
.L0603C584:
	.long D_060F3090
.L0603C588:
	.long func_06007BD8
.L0603C58C:
	.long func_06007C1C
.L0603C590:
	.long func_06007CF0
	endlabel func_0603C4E2

	glabel func_0603C594
	mov	r1,r3
	add	#64,r3
	mov.l	@(60,r1),r4
	mov.l	@(12,r3),r0
	sub	r0,r4
	cmp/pz	r4
	bt	.L0603C5A6
	rts
	clrt
.L0603C5A6:
	sts.l	pr,@-r15
	mov.l	r4,@(60,r1)
	mov	r1,r2
	mov.l	.L0603C640,r7
	add	#32,r2
	jsr	@r7
	mov.w	@(10,r2),r0
	dmuls.l	r10,r4
	sts	mach,r6
	dmuls.l	r11,r4
	shll16	r6
	sts	mach,r4
	mov.w	@(4,r3),r0
	mov	r0,r5
	mov.w	@(26,r1),r0
	add	r5,r0
	mov.w	r0,@(26,r1)
	mov.w	@(6,r2),r0
	add	r5,r0
	jsr	@r7
	mov.w	r0,@(6,r2)
	shll2	r4
	muls.w	r10,r4
	sts	macl,r5
	muls.w	r11,r4
	sts	macl,r4
	mov.w	@(2,r2),r0
	jsr	@r7
	neg	r0,r0
	shll2	r10
	dmuls.l	r10,r4
	shll2	r11
	sts	mach,r0
	sts	macl,r8
	dmuls.l	r10,r6
	xtrct	r0,r8
	sts	mach,r0
	sts	macl,r9
	dmuls.l	r11,r4
	xtrct	r0,r9
	sts	mach,r0
	sts	macl,r4
	dmuls.l	r11,r6
	xtrct	r0,r4
	sts	mach,r0
	sts	macl,r6
	sub	r9,r4
	xtrct	r0,r6
	add	r8,r6
	mov.w	@r2,r0
	shll16	r0
	add	r4,r0
	mov.l	r0,@(48,r1)
	mov.w	@(4,r2),r0
	shll16	r0
	add	r5,r0
	mov.l	r0,@(52,r1)
	mov.w	@(8,r2),r0
	shll16	r0
	add	r6,r0
	mov.l	r0,@(56,r1)
	mov.w	@(22,r1),r0
	swap.w	r0,r4
	mov.w	@(6,r3),r0
	extu.w	r0,r0
	mov.l	@(8,r3),r5
	or	r4,r0
	sub	r5,r0
	cmp/pz	r0
	bt	.L0603C634
	mov	#0,r0
.L0603C634:
	mov.w	r0,@(6,r3)
	shlr16	r0
	mov.w	r0,@(22,r1)
	lds.l	@r15+,pr
	rts
	sett
.L0603C640:
	.long func_06007BD8
	endlabel func_0603C594

	.section .data.0603C644,"aw",@progbits
	.p2align 2
	.byte 0x00, 0x1C, 0x00, 0x1C, 0x00, 0x1C, 0x00, 0x1C, 0x38, 0x35, 0x38, 0x35, 0x38, 0x35, 0x38, 0x35
	.byte 0x03, 0x3F, 0x03, 0x3F, 0x03, 0x3F, 0x03, 0x3F, 0x18, 0x1D, 0x18, 0x1D, 0x18, 0x1D, 0x18, 0x1D
	.byte 0x0B, 0x1F, 0x0B, 0x1F, 0x0B, 0x1F, 0x0B, 0x1F, 0x38, 0x35, 0x38, 0x35, 0x38, 0x35, 0x38, 0x35
	.byte 0x53, 0x31, 0x53, 0x31, 0x53, 0x31, 0x53, 0x31, 0x18, 0x1D, 0x18, 0x1D, 0x18, 0x1D, 0x18, 0x1D
	.byte 0x28, 0x18, 0x28, 0x18, 0x28, 0x18, 0x28, 0x18, 0x00, 0x1C, 0x00, 0x1C, 0x00, 0x1C, 0x00, 0x1C
	.byte 0x02, 0x9F, 0x02, 0x9F, 0x02, 0x9F, 0x02, 0x9F, 0x18, 0x1D, 0x18, 0x1D, 0x18, 0x1D, 0x18, 0x1D
	.byte 0x28, 0x18, 0x28, 0x18, 0x28, 0x18, 0x28, 0x18, 0x38, 0x35, 0x38, 0x35, 0x38, 0x35, 0x38, 0x35
	.byte 0x03, 0x3A, 0x03, 0x3A, 0x03, 0x3A, 0x03, 0x3A, 0x18, 0x1D, 0x18, 0x1D, 0x18, 0x1D, 0x18, 0x1D
	.byte 0x28, 0x18, 0x28, 0x18, 0x28, 0x18, 0x28, 0x18, 0x0B, 0x1F, 0x0B, 0x1F, 0x0B, 0x1F, 0x0B, 0x1F
	.byte 0x03, 0xE0, 0x03, 0xE0, 0x03, 0xE0, 0x03, 0xE0, 0x18, 0x1D, 0x18, 0x1D, 0x18, 0x1D, 0x18, 0x1D
	.byte 0x00, 0x1C, 0x00, 0x1C, 0x00, 0x1C, 0x00, 0x1C, 0x0B, 0x1F, 0x0B, 0x1F, 0x0B, 0x1F, 0x0B, 0x1F
	.byte 0x12, 0xC0, 0x12, 0xC0, 0x12, 0xC0, 0x12, 0xC0, 0x18, 0x1D, 0x18, 0x1D, 0x18, 0x1D, 0x18, 0x1D
