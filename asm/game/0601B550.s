	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601B550,"ax",@progbits
	.p2align 2

	glabel func_0601B550
	mov.l	.L0601B590,r6
	mov.w	.L0601B588,r0
	mov.w	r0,@(0,r6)
	mov.w	r0,@(2,r6)
	mov.w	.L0601B58A,r0
	mov.w	r0,@(4,r6)
	mov.w	r0,@(6,r6)
	mov.w	.L0601B58C,r0
	mov.w	r0,@(28,r1)
	mov	#0,r0
	mov.w	r0,@(20,r1)
	mov.w	r0,@(0,r1)
	mov.w	r0,@(2,r1)
	mov.l	.L0601B594,r0
	mov.l	r0,@(48,r1)
	mov.l	.L0601B598,r2
	mov.l	r2,@(52,r1)
	mov.l	.L0601B59C,r0
	mov.l	r0,@(56,r1)
	mov.w	.L0601B58E,r0
	mov.w	r0,@(22,r1)
	mov	#0,r0
	mov.w	r0,@(24,r1)
	mov.l	.L0601B5A0,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601B588:
	.short 0x4210
.L0601B58A:
	.short 0x001F
.L0601B58C:
	.short 0x1FFA
.L0601B58E:
	.short 0x0100
.L0601B590:
	.long VDP1_VRAM + 0xFFD0
.L0601B594:
	.long 0x009E0000
.L0601B598:
	.long 0x00B40000
.L0601B59C:
	.long 0x00000000
.L0601B5A0:
	.long func_0601B5DC
	endlabel func_0601B550

	.section .data.0601B5A4,"aw",@progbits
	.p2align 2
	dlabel D_0601B5A4
	.byte 0x00, 0x00, 0x00, 0x00
	.long D_06014AB6
	.byte 0x00, 0x00, 0x00, 0x04
	.long D_06014AB6
	.byte 0x00, 0x00, 0x00, 0x09
	.long D_06014ADA
	.byte 0x00, 0x00, 0x00, 0x0E
	.long D_06014AFE
	.byte 0x00, 0x00, 0x00, 0x13
	.long D_06014B22
	.byte 0x00, 0x00, 0x00, 0x18
	.long D_06014B46
	.byte 0x00, 0x00, 0x27, 0x0F
	.long D_06014B46
