	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06050850,"ax",@progbits
	.p2align 2

! ANSI memmove(r4 = dst, r5 = src, r6 = n), byte by byte, backward when dst is above src.
! Compiled C, but SHC 5.0 allocates its registers differently, so it stays asm.
	glabel memmove
	cmp/eq	r5,r4
	bt	.L0605088E
	cmp/hs	r5,r4
	bt/s	.L06050874
	mov	#0,r7
	mov	r4,r1
	mov	r5,r0
	cmp/hs	r6,r7
	bt/s	.L0605088E
	mov	r7,r5
.L06050864:
	mov.b	@r0+,r3
	add	#1,r5
	mov.b	r3,@r1
	cmp/hs	r6,r5
	bf/s	.L06050864
	add	#1,r1
	bra	.L0605088E
	nop
.L06050874:
	mov	r4,r1
	add	r6,r1
	mov	r5,r0
	add	r6,r0
	cmp/hs	r6,r7
	bt/s	.L0605088E
	mov	r7,r5
.L06050882:
	add	#-1,r0
	mov.b	@r0,r3
	add	#1,r5
	cmp/hs	r6,r5
	bf/s	.L06050882
	mov.b	r3,@-r1
.L0605088E:
	rts
	mov	r4,r0
	.2byte 0		! linker padding
	endlabel memmove
