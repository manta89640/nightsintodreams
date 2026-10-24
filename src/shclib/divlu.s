	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060506E0,"ax",@progbits
	.p2align 2

! SHC runtime __divlu: unsigned r1 / r0, quotient in r0. Only r0 and r1 change.
! Division by zero returns 0 and sets errno to 1102 (EDIV).
	glabel _divlu
	tst	r0,r0
	mov.l	r2,@-r15
	bt	.L06050772
	mov	#0,r2		! r2: partial remainder; r1 shifts into the quotient
	div0u
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	div1	r0,r2
	rotcl	r1
	mov	r1,r0
	rts
	mov.l	@r15+,r2
.L06050772:
	mov.l	.L06050780,r2
	mov.l	.L06050784,r1
	mov	#0,r0
	mov.l	r1,@r2
	rts
	mov.l	@r15+,r2
	.p2align 2
.L06050780:
	.long errno
.L06050784:
	.long 1102
	endlabel _divlu
