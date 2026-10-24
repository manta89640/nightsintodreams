	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06050968,"ax",@progbits
	.p2align 2

! SHC runtime __slow_mvn: struct copy of r0 bytes from r2 to r1, a byte at a time, for
! sizes or alignments the longword moves can't take. Only r0 and r1 change.
	glabel _slow_mvn
	mov.l	r2,@-r15
	mov.l	r3,@-r15
	mov.l	r4,@-r15
	cmp/eq	#0,r0
	bt	.L06050998
	mov	r2,r4
	add	r0,r4
.L06050976:
	mov.b	@r2+,r0
	mov.b	r0,@r1
	cmp/hi	r2,r4
	bf	.L06050998
	mov.b	@r2+,r0
	mov.b	r0,@(1,r1)
	cmp/hi	r2,r4
	bf	.L06050998
	mov.b	@r2+,r0
	mov.b	r0,@(2,r1)
	cmp/hi	r2,r4
	bf	.L06050998
	mov.b	@r2+,r0
	mov.b	r0,@(3,r1)
	cmp/hi	r2,r4
	add	#4,r1
	bt	.L06050976
.L06050998:
	mov.l	@r15+,r4
	mov.l	@r15+,r3
	rts
	mov.l	@r15+,r2
	endlabel _slow_mvn
