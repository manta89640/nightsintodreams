	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060506B0,"ax",@progbits
	.p2align 2

	glabel run_end_program
	sts.l	pr,@-r15
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#240,r0
	ldc	r0,sr
	mov.l	.L060506D0,r4
	mov.l	.L060506D4,r0
	mov.l	.L060506D8,r5
	jsr	@r0
	nop
	mov.l	.L060506DC,r0
	jmp	@r0
	lds.l	@r15+,pr
.L060506D0:
	.long D_06051334
.L060506D4:
	.long file_load
.L060506D8:
	.long D_060C0000
.L060506DC:
	.long D_060C0004
	endlabel run_end_program
