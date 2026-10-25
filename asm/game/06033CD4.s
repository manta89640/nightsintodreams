	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06033CD4,"ax",@progbits
	.p2align 2
	.byte 0x00, 0x00

	glabel func_06033CD6
	mov.b	@(149,gbr),r0
	tst	#4,r0
	bf	.L06033D04
	mov.l	.L06033D0C,r2
	mov.l	r2,@(44,r1)
	mov.b	@(22,gbr),r0
	cmp/pz	r0
	bf	.L06033D04
	shlr	r0
	mov.w	r0,@(20,r1)
	mov.l	.L06033D10,r0
	mov.l	r0,@(48,r1)
	mov.l	.L06033D14,r0
	mov.l	r0,@(52,r1)
	mov.w	.L06033D08,r0
	mov.w	r0,@(22,r1)
	mov.w	r0,@(24,r1)
	mov	#1,r0
	mov.l	.L06033D18,r2
	mov.w	r0,@r2
	mov.l	.L06033D1C,r0
	mov.l	r0,@-r1
	add	#4,r1
.L06033D04:
	rts
	nop
.L06033D08:
	.short 0x0100
	.byte 0x00, 0x00
.L06033D0C:
	.long D_060137A4
.L06033D10:
	.long 0x00B00000
.L06033D14:
	.long 0x00200000
.L06033D18:
	.long D_06033CA0 + 0x34
.L06033D1C:
	.long func_06033D20
	endlabel func_06033CD6

	glabel func_06033D20
	mov.l	.L06033D2C,r2
	mov.w	@r2,r0
	tst	r0,r0
	bf	func_06033D30
	rts
	nop
.L06033D2C:
	.long D_06033CA0 + 0x34
	endlabel func_06033D20

	glabel func_06033D30
	sts.l	pr,@-r15
	mov.l	.L06033D40,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06033D40:
	.long spr_draw_obj
	endlabel func_06033D30

	.section .data.06033D44,"aw",@progbits
	.p2align 2
	.byte 0x90, 0x07, 0xD3, 0x04, 0x81, 0x1E, 0xE0, 0x00, 0x81, 0x10, 0x81, 0x12, 0x21, 0x36, 0x00, 0x0B
	.byte 0x71, 0x04, 0x19, 0x0E
	.long func_06033D5C
