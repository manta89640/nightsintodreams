	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060509A0,"ax",@progbits
	.p2align 2

! SHC runtime __slow_strcpy, what SHC calls for _builtin_strcpy: strcpy(r0 = dst, r1 = src),
! byte by byte unless both pointers are 4-aligned, which go to __quick_strcpy.
! Returns dst in r0; only r0 and r1 change.
	glabel _slow_strcpy
	mov.l	r3,@-r15
	mov.l	r4,@-r15
	mov	#3,r3
	mov	r0,r4
	and	r3,r4
	and	r1,r3
	or	r4,r3
	tst	r3,r3
	bt	.L060509E4
	mov	r0,r4
	mov.b	@r1+,r0
	mov	r4,r3
.L060509B8:
	cmp/eq	#0,r0
	mov.b	r0,@r3
	bt	.L060509DC
	mov.b	@r1+,r0
	cmp/eq	#0,r0
	mov.b	r0,@(1,r3)
	bt	.L060509DC
	mov.b	@r1+,r0
	cmp/eq	#0,r0
	mov.b	r0,@(2,r3)
	bt	.L060509DC
	mov.b	@r1+,r0
	cmp/eq	#0,r0
	mov.b	r0,@(3,r3)
	bt	.L060509DC
	mov.b	@r1+,r0
	bra	.L060509B8
	add	#4,r3
.L060509DC:
	mov	r4,r0
	mov.l	@r15+,r4
	rts
	mov.l	@r15+,r3
.L060509E4:
	mov.l	.L060509EC,r3
	jmp	@r3
	nop
	.p2align 2
.L060509EC:
	.long _quick_strcpy_body
	endlabel _slow_strcpy
