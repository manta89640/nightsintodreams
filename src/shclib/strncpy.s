	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06050B00,"ax",@progbits
	.p2align 2

! ANSI strncpy(r4 = dst, r5 = src, r6 = n): copies up to n bytes and pads with NULs to n.
! Compiled C, but SHC 5.0 allocates its registers differently, so it stays asm.
	glabel strncpy
	mov.l	r13,@-r15
	mov	r4,r7
	mov	r5,r1
	mov	#0,r13
	bra	.L06050B14
	mov	r13,r5
.L06050B0C:
	mov.b	@r1+,r3
	add	#1,r5
	mov.b	r3,@r7
	add	#1,r7
.L06050B14:
	cmp/hs	r6,r5
	bt	.L06050B1E
	mov.b	@r1,r3
	tst	r3,r3
	bf	.L06050B0C
.L06050B1E:
	cmp/hs	r6,r5
	bt	.L06050B2C
.L06050B22:
	add	#1,r5
	mov.b	r13,@r7
	cmp/hs	r6,r5
	bf/s	.L06050B22
	add	#1,r7
.L06050B2C:
	mov	r4,r0
	rts
	mov.l	@r15+,r13
	.2byte 0		! linker padding
	endlabel strncpy
