	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06050788,"ax",@progbits
	.p2align 2

! SHC runtime __modls (the -division=cpu routine): signed r1 % r0 in r0, with the sign of
! the dividend. Only r0 and r1 change. Division by zero returns 0 and sets errno to 1102
! (EDIV). Nothing in 0NIGHTS calls it: SBL's remainders go through __modlspnm.
	glabel _modls
	tst	r0,r0
	mov.l	r2,@-r15
	bt	.L0605083A
	mov.l	r3,@-r15
	mov	#0,r2
	mov.l	r4,@-r15
	! Sign-extend the dividend into r3:r1, and turn a negative one into its
	! one's complement (r4 = 1 remembers it); the add of r4 at the end undoes that.
	div0s	r2,r1
	movt	r4
	subc	r3,r3
	subc	r2,r1
	div0s	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	rotcl	r1
	div1	r0,r3
	! r3 is the remainder of a non-restoring division. If its sign differs from the
	! dividend's, one more div1 (after shar, so the shift cancels out) corrects it.
	div0s	r2,r3
	movt	r2
	xor	r4,r2
	rotcr	r2
	bf	.L0605082E
	div0s	r0,r3
	shar	r3
	div1	r0,r3
.L0605082E:
	add	r4,r3
	mov	r3,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r3
	rts
	mov.l	@r15+,r2
.L0605083A:
	mov.l	.L06050848,r1
	mov.l	.L0605084C,r2
	mov	#0,r0
	mov.l	r2,@r1
	rts
	mov.l	@r15+,r2
	.p2align 2
.L06050848:
	.long errno
.L0605084C:
	.long 1102
	endlabel _modls
