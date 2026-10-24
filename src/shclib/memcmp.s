	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060509F0,"ax",@progbits
	.p2align 2

! ANSI memcmp(r4, r5, r6 = n): the difference of the first differing bytes, as unsigned char.
! Compiled C, but SHC 5.0 allocates its registers differently, so it stays asm.
	glabel memcmp
	tst	r6,r6
	bf/s	.L060509FA
	mov	r4,r7
	rts
	mov	#0,r0
.L060509FA:
	mov	#0,r4
	mov	r4,r3
	cmp/hs	r6,r3
	bt	.L06050A10
.L06050A02:
	mov.b	@r7+,r3
	mov.b	@r5+,r2
	cmp/eq	r2,r3
	bf	.L06050A10
	add	#1,r4
	cmp/hs	r6,r4
	bf	.L06050A02
.L06050A10:
	mov	r7,r0
	add	#-1,r0
	mov.b	@r0,r0
	add	#-1,r5
	mov.b	@r5,r3
	extu.b	r0,r0
	extu.b	r3,r3
	sub	r3,r0
	rts
	nop
	endlabel memcmp
