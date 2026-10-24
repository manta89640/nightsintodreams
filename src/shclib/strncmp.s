	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06050AC0,"ax",@progbits
	.p2align 2

! ANSI strncmp(r4, r5, r6 = n): the difference of the first differing bytes, as unsigned
! char, stopping after a NUL in r4 or n bytes.
! Compiled C, but SHC 5.0 allocates its registers differently, so it stays asm.
	glabel strncmp
	tst	r6,r6
	bf/s	.L06050ACA
	mov	r5,r7
	rts
	mov	#0,r0
.L06050ACA:
	mov	#0,r5
	mov	r5,r3
	cmp/hs	r6,r3
	bt	.L06050AEA
.L06050AD2:
	mov.b	@r4+,r3
	mov.b	@r7+,r2
	cmp/eq	r2,r3
	bf	.L06050AEA
	mov	r4,r2
	add	#-1,r2
	mov.b	@r2,r3
	tst	r3,r3
	bt	.L06050AEA
	add	#1,r5
	cmp/hs	r6,r5
	bf	.L06050AD2
.L06050AEA:
	mov	r4,r0
	add	#-1,r0
	add	#-1,r7
	mov.b	@r0,r0
	extu.b	r0,r0
	mov.b	@r7,r3
	extu.b	r3,r3
	sub	r3,r0
	rts
	nop
	.2byte 0		! linker padding
	endlabel strncmp
