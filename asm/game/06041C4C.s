	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06041C4C,"ax",@progbits
	.p2align 2

	glabel func_06041C4C
	mov.l	r0,@-r15
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06041C5C
	mov.l	@r4,r6
	mov.l	@(12,gbr),r0
	cmp/eq	r0,r6
	bf	.L06041C62
.L06041C5C:
	mov.l	@r15+,r0
	rts
	nop
.L06041C62:
	mov.l	r0,@r4
	add	#12,r4
	mov.l	@r15+,r0
	mov.l	@r3+,r6
	add	#-1,r6
	shll2	r6
	extu.w	r0,r5
	shlr16	r0
	shll2	r0
	mov.l	@(r0,r3),r2
	add	#4,r0
	cmp/gt	r6,r0
	bf	.L06041C80
	sub	r6,r0
	add	#-4,r0
.L06041C80:
	mov.l	@(r0,r3),r3
	endlabel func_06041C4C

	glabel func_06041C82
	mov.l	@(4,r7),r7
.L06041C84:
	mov.l	@r2+,r8
	mov.l	@r3+,r9
	sub	r8,r9
	dmuls.l	r9,r5
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	add	r9,r8
	mov.l	r8,@r4
	mov.l	@r2+,r8
	mov.l	@r3+,r9
	sub	r8,r9
	dmuls.l	r9,r5
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	add	r9,r8
	mov.l	r8,@(4,r4)
	mov.l	@r2+,r8
	mov.l	@r3+,r9
	sub	r8,r9
	dmuls.l	r9,r5
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	add	r9,r8
	mov.l	r8,@(8,r4)
	dt	r7
	bf/s	.L06041C84
	add	#12,r4
	rts
	nop
	endlabel func_06041C82

	glabel func_06041CC4
	mov.l	@(4,r7),r7
	add	#1,r7
.L06041CC8:
	mov.l	@r2+,r8
	mov.l	@r3+,r9
	sub	r8,r9
	dmuls.l	r9,r5
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	add	r9,r8
	mov.l	r8,@r4
	mov.l	@r2+,r8
	mov.l	@r3+,r9
	sub	r8,r9
	dmuls.l	r9,r5
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	add	r9,r8
	mov.l	r8,@(4,r4)
	mov.l	@r2+,r8
	mov.l	@r3+,r9
	sub	r8,r9
	dmuls.l	r9,r5
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	add	r9,r8
	mov.l	r8,@(8,r4)
	dt	r7
	bf/s	.L06041CC8
	add	#12,r4
	rts
	nop
	endlabel func_06041CC4

	glabel func_06041D08
	sts.l	pr,@-r15
	mov.l	@r6+,r9
	add	#-1,r9
	mov.l	@(44,r1),r8
	extu.w	r8,r5
	swap.w	r8,r0
	extu.w	r0,r0
	cmp/ge	r9,r0
	bt	.L06041D1E
	mov	r0,r9
	add	#1,r9
.L06041D1E:
	shll2	r0
	shll	r0
	shll2	r9
	shll	r9
	mov.l	@(r0,r6),r10
	mov	r9,r0
	mov.l	@(r0,r6),r11
.L06041D2C:
	mov.l	@r13+,r7
	mov.l	@r10+,r2
	mov.l	@r11+,r3
	mov.l	r4,@r7
	mov.l	.L06041D44,r0
	jsr	@r0
	nop
	dt	r14
	bf	.L06041D2C
	lds.l	@r15+,pr
	rts
	nop
.L06041D44:
	.long func_06041CC4
	endlabel func_06041D08

	.section .data.06041D48,"aw",@progbits
	.p2align 2
	.byte 0xE0, 0x00, 0x21, 0x01, 0xD0, 0x06, 0x21, 0x06
