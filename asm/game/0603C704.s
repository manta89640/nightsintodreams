	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603C704,"ax",@progbits
	.p2align 2

	glabel func_0603C704
	sts.l	pr,@-r15
	mov.w	@(8,r1),r0
	mov.l	.L0603C720,r4
	add	r3,r0
	jsr	@r4
	mov.w	r0,@(8,r1)
	muls.w	r10,r2
	mov.l	@(4,r1),r0
	sts	macl,r2
	lds.l	@r15+,pr
	add	r2,r0
	rts
	mov.l	r0,@(52,r1)
	.byte 0x00, 0x00
.L0603C720:
	.long func_06007C08
	endlabel func_0603C704

	.section .data.0603C724,"aw",@progbits
	.p2align 2
	.byte 0x62, 0x13, 0x72, 0x40, 0x12, 0x30, 0xDE, 0x20, 0x12, 0x41, 0x4E, 0x0B
