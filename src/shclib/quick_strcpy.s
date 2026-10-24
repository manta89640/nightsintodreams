	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06050A58,"ax",@progbits
	.p2align 2

! SHC runtime __quick_strcpy: strcpy(r0 = dst, r1 = src) for 4-aligned pointers, a longword
! at a time until cmp/str finds the longword with the NUL, then that one byte by byte.
! Returns dst in r0; only r0 and r1 change. __slow_strcpy pushes r3 and r4 itself and
! jumps to _quick_strcpy_body.
	glabel _quick_strcpy
	mov.l	r3,@-r15
	mov.l	r4,@-r15
	endlabel _quick_strcpy

	glabel _quick_strcpy_body
	mov.l	r5,@-r15
	mov.l	r6,@-r15
	mov	r0,r3
	mov.l	@r1+,r4
	mov	#0,r6		! cmp/str r4,r6 sets T if any byte of r4 is 0
.L06050A66:
	cmp/str	r4,r6
	bt	.L06050A94
	mov.l	@r1+,r5
	mov.l	r4,@r0
	cmp/str	r5,r6
	bt	.L06050A8A
	mov.l	@r1+,r4
	mov.l	r5,@(4,r0)
	cmp/str	r4,r6
	bt	.L06050A8E
	mov.l	@r1+,r5
	mov.l	r4,@(8,r0)
	cmp/str	r5,r6
	bt	.L06050A92
	mov.l	@r1+,r4
	mov.l	r5,@(12,r0)
	bra	.L06050A66
	add	#16,r0
.L06050A8A:
	bra	.L06050A94
	add	#4,r0
.L06050A8E:
	bra	.L06050A94
	add	#8,r0
.L06050A92:
	add	#12,r0
.L06050A94:
	add	#-4,r1
	mov	r0,r6
	mov.b	@r1+,r0
	cmp/eq	#0,r0
	mov.b	r0,@r6
	bt	.L06050AB4
	mov.b	@r1+,r0
	cmp/eq	#0,r0
	mov.b	r0,@(1,r6)
	bt	.L06050AB4
	mov.b	@r1+,r0
	cmp/eq	#0,r0
	mov.b	r0,@(2,r6)
	bt	.L06050AB4
	mov.b	@r1+,r0
	mov.b	r0,@(3,r6)
.L06050AB4:
	mov.l	@r15+,r6
	mov	r3,r0
	mov.l	@r15+,r5
	mov.l	@r15+,r4
	rts
	mov.l	@r15+,r3
	endlabel _quick_strcpy_body
