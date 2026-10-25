	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601D0B4,"ax",@progbits
	.p2align 2

	glabel func_0601D0B4
	sts.l	pr,@-r15
	mov.w	@(8,r1),r0
	add	#1,r0
	mov.w	r0,@(8,r1)
	mov.l	.L0601D0D0,r2
.L0601D0BE:
	mov.l	@r2+,r8
	cmp/pz	r8
	bf	.L0601D0DA
	cmp/eq	r8,r0
	bt	.L0601D0D4
	add	#4,r2
	bra	.L0601D0BE
	add	#4,r8
	.byte 0x00, 0x00
.L0601D0D0:
	.long D_0601D0E0
.L0601D0D4:
	mov.l	@r2+,r2
	jsr	@r2
	nop
.L0601D0DA:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_0601D0B4

	.section .data.0601D0E0,"aw",@progbits
	.p2align 2
	dlabel D_0601D0E0
	.byte 0x00, 0x00, 0x00, 0x01
	.long func_0601DE58
	.byte 0x00, 0x00, 0x00, 0x02
	.long func_0601D730
	.byte 0x00, 0x00, 0x00, 0x03
	.long D_0601D718
	.byte 0x00, 0x00, 0x00, 0x04
	.long func_0601D9F0
	.byte 0x00, 0x00, 0x00, 0x0A
	.long func_0601DAD0
	.byte 0x00, 0x00, 0x00, 0x0B
	.long func_0601D136
	.byte 0x00, 0x00, 0x00, 0xF0
	.long D_0601D130
	.byte 0x00, 0x00, 0x00, 0xF1
	.long D_0601D124
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_0601D124
	.byte 0xD0, 0x01, 0x40, 0x2B, 0x00, 0x09, 0x00, 0x00
	.long obj_free
	dlabel D_0601D130
	.byte 0xE0, 0xFF, 0x00, 0x0B
