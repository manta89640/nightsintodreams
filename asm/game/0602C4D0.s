	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0602C4D0,"ax",@progbits
	.p2align 2

	glabel func_0602C4D0
	sts.l	pr,@-r15
	mov.w	.L0602C504,r0
	mov.w	r0,@(418,gbr)
	mov.w	r0,@(426,gbr)
	mov.w	.L0602C506,r0
	mov.w	r0,@(422,gbr)
	mov.w	r0,@(430,gbr)
	mov.l	.L0602C50C,r2
	mov.l	.L0602C510,r0
	mov.l	r0,@r2
	mov.l	.L0602C514,r2
	mov.l	.L0602C518,r0
	mov.l	r0,@r2
	mov.l	.L0602C51C,r2
	mov.l	.L0602C520,r3
	mov	#0,r0
	mov.w	.L0602C508,r7
.L0602C4F2:
	mov.l	r0,@r2
	mov.l	r0,@r3
	add	#4,r2
	add	#4,r3
	dt	r7
	bf	.L0602C4F2
	lds.l	@r15+,pr
	rts
	nop
.L0602C504:
	.short 0x0000
.L0602C506:
	.short 0x00E0
.L0602C508:
	.short 0x0200
	.byte 0x00, 0x00
.L0602C50C:
	.long D_060FFDB8
.L0602C510:
	.long 0x8002F300
.L0602C514:
	.long D_060FFDBC
.L0602C518:
	.long 0x8002F500
.L0602C51C:
	.long D_060F8DF8
.L0602C520:
	.long VDP2_VRAM + 0x5E600
	endlabel func_0602C4D0

	.section .data.0602C524,"aw",@progbits
	.p2align 2
	.byte 0x7F, 0xFF, 0x80, 0x00, 0xBF, 0xFF, 0x40, 0x00, 0xDF, 0xFF, 0x20, 0x00, 0xEF, 0xFF, 0x10, 0x00
