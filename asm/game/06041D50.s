	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06041D50,"ax",@progbits
	.p2align 2
	.byte 0x71, 0x04

	glabel func_06041D52
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov.b	@(1,r2),r0
	cmp/pz	r0
	bt	.L06041D70
	mov	#1,r0
	mov.b	r0,@(1,r2)
	mov.l	.L06041D6C,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
	.long func_06041D52
.L06041D6C:
	.long func_0600D1A0
.L06041D70:
	mov	#30,r0
	mov.b	@(r0,r1),r0
	tst	#2,r0
	bf	.L06041D9C
	mov.w	@r1,r0
	tst	r0,r0
	bt	func_06041D86
	dt	r0
	mov.w	r0,@r1
	rts
	nop
	endlabel func_06041D52

	glabel func_06041D86
	sts.l	pr,@-r15
	mov	#40,r8
	mov	#1,r9
	mov.l	.L06041D98,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06041D98:
	.long func_06016824
.L06041D9C:
	mov	#90,r0
	rts
	mov.w	r0,@r1
	.byte 0x00, 0x09
	endlabel func_06041D86

	.section .data.06041DA4,"aw",@progbits
	.p2align 2
	dlabel D_06041DA4
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_06041DA8
	.byte 0xD2, 0x1D, 0x22, 0x12
