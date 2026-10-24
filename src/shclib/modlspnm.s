	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06050A3C,"ax",@progbits
	.p2align 2

! SHC runtime __modlspnm (what -division=nomask calls): signed r1 % r0, remainder in r0,
! from the SH-2 divide unit with interrupts left enabled (the -division=peripheral
! routine __modlsp masks them). Only r0 changes. No divide-by-zero check.
	glabel _modlspnm
	mov.l	r2,@-r15
	mov.l	r3,@-r15
	mov.w	.L06050A56,r3
	mov	#0,r2
	mov.l	r0,@r3		! SH2_DVSR = divisor
	add	#8,r3
	mov.l	r2,@r3		! SH2_DVCR = 0: no overflow interrupt
	mov.l	r1,@-r3		! SH2_DVDNT = dividend starts a 32/32 division
	add	#12,r3
	mov.l	@r3,r0		! SH2_DVDNTH (the read waits for the result)
	mov.l	@r15+,r3
	rts
	mov.l	@r15+,r2
.L06050A56:
	.short SH2_DVSR & 0xFFFF
	endlabel _modlspnm
