	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06050674,"ax",@progbits
	.p2align 2

	glabel func_06050674
	sts.l	pr,@-r15
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#240,r0
	ldc	r0,sr
	mov.l	.L06050694,r4
	mov.l	.L06050698,r0
	mov.l	.L0605069C,r5
	jsr	@r0
	nop
	mov.l	.L060506A0,r0
	jmp	@r0
	lds.l	@r15+,pr
.L06050694:
	.long D_060517ED
.L06050698:
	.long cd_load_file
.L0605069C:
	.long D_060B9800
.L060506A0:
	.long D_060B9804
	endlabel func_06050674

	.section .data.060506A4,"aw",@progbits
	.p2align 2
	dlabel D_060506A4
	.byte 0xD0, 0x01, 0x40, 0x2B, 0x00, 0x09, 0x00, 0x00
	.long D_060B9800
