	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603D82C,"ax",@progbits
	.p2align 2

	glabel func_0603D82C
	mov.w	.L0603D84A,r0
	mov.w	r0,@(2,r1)
	mov.w	.L0603D84C,r0
	mov.w	r0,@(4,r1)
	mov	#16,r0
	mov.w	r0,@(6,r1)
	mov.l	.L0603D850,r0
	mov.l	r0,@-r1
	add	#4,r1
.L0603D83E:
	mov.w	@(6,r1),r0
	dt	r0
	bf	.L0603D858
	mov.l	.L0603D854,r0
	jmp	@r0
	nop
.L0603D84A:
	.short 0x00FF
.L0603D84C:
	.short 0xFFF0
	.byte 0x00, 0x00
.L0603D850:
	.long .L0603D83E
.L0603D854:
	.long func_0600D1A0
.L0603D858:
	mov.w	r0,@(6,r1)
	mov.w	@(4,r1),r0
	mov	r0,r14
	mov.w	@(2,r1),r0
	add	r14,r0
	mov.w	r0,@(2,r1)
	mov.w	r0,@(500,gbr)
	mov.w	r0,@(502,gbr)
	rts
	mov.w	r0,@(504,gbr)
	endlabel func_0603D82C

	.section .data.0603D86C,"aw",@progbits
	.p2align 2
	.byte 0x85, 0x14, 0x70, 0xFF, 0x40, 0x11, 0x89, 0x05, 0xD0, 0x01, 0x40, 0x2B, 0x00, 0x09, 0x00, 0x00
	.long func_0600D1A0
	.byte 0x81, 0x14, 0xD4, 0x06, 0x64, 0x42, 0x58, 0x4F, 0x50, 0x18, 0x38, 0x0C, 0x14, 0x8F, 0x58, 0x4D
	.byte 0x50, 0x19, 0x38, 0x0C, 0x14, 0x8D, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x00
	.long D_060F3064
