	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060508A8,"ax",@progbits
	.p2align 2

! SHC runtime __divlspnm (what -division=nomask calls): signed r1 / r0, quotient in r0,
! from the SH-2 divide unit with interrupts left enabled (the -division=peripheral
! routine __divlsp masks them). Only r0 changes. No divide-by-zero check.
	glabel _divlspnm
	mov.l	r2,@-r15
	mov.l	r3,@-r15
	mov.w	.L060508C2,r3
	mov	#0,r2
	mov.l	r0,@r3		! SH2_DVSR = divisor
	add	#8,r3
	mov.l	r2,@r3		! SH2_DVCR = 0: no overflow interrupt
	mov.l	r1,@-r3		! SH2_DVDNT = dividend starts a 32/32 division
	add	#16,r3
	mov.l	@r3,r0		! SH2_DVDNTL (the read waits for the result)
	mov.l	@r15+,r3
	rts
	mov.l	@r15+,r2
.L060508C2:
	.short SH2_DVSR & 0xFFFF
	endlabel _divlspnm
