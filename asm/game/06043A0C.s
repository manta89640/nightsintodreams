	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06043A0C,"ax",@progbits
	.p2align 2

	glabel func_06043A0C
	sts.l	pr,@-r15
	cmp/eq	#30,r0
	bt	.L06043A28
	mov.l	.L06043A18,r0
	jmp	@r0
	nop
.L06043A18:
	.long lbl_06042B8A
	.byte 0xD0, 0x01, 0x40, 0x2B, 0x00, 0x09, 0x00, 0x00
	.long func_0600D1A0
.L06043A28:
	mov	#2,r0
	mov.l	.L06043A30,r2
	jmp	@r2
	mov.b	r0,@(1,r1)
.L06043A30:
	.long lbl_06042B8A
	endlabel func_06043A0C

	glabel func_06043A34
	mov.w	.L06043A4E,r0
	mov.w	r0,@(22,r1)
	mov.l	.L06043A50,r2
	mov.l	r2,@(44,r1)
	mov	#11,r0
	mov.w	r0,@(0,r1)
	xor	r0,r0
	mov.w	r0,@(20,r1)
	mov.w	r0,@(14,r1)
	mov.l	.L06043A54,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06043A4E:
	.short 0x0180
.L06043A50:
	.long D_060149FC
.L06043A54:
	.long func_06043A58
	endlabel func_06043A34

	glabel func_06043A58
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06043A8C
	sts.l	pr,@-r15
	mov.l	.L06043A7C,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06043A80,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06043A84,r0
	jsr	@r0
	nop
	mov.l	.L06043A88,r0
	jmp	@r0
	lds.l	@r15+,pr
.L06043A7C:
	.long func_0600CA24
.L06043A80:
	.long func_0600CBDA
.L06043A84:
	.long func_06020906
.L06043A88:
	.long func_0600CA4E
.L06043A8C:
	mov.w	@(0,r1),r0
	add	#-1,r0
	tst	r0,r0
	bt	.L06043AA8
	mov.w	r0,@(0,r1)
	mov.l	.L06043AA0,r2
	mov.l	.L06043AA4,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06043AA0:
	.long D_06014AA0
.L06043AA4:
	.long func_0601EF98
.L06043AA8:
	mov.l	.L06043AB0,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06043AB0:
	.long func_0600D1A0
	endlabel func_06043A58

	.section .data.06043AB4,"aw",@progbits
	.p2align 2
	dlabel D_06043AB4
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_06043AB8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD2, 0x08, 0x11, 0x24, 0xD3, 0x08, 0x11, 0x3A
	.byte 0x20, 0x0A, 0x81, 0x11, 0x81, 0x12, 0x11, 0x00, 0x85, 0x1B, 0x40, 0x19, 0x40, 0x09, 0x40, 0x09
	.byte 0x80, 0x11, 0xD0, 0x04, 0x21, 0x06, 0x00, 0x0B, 0x71, 0x04, 0x00, 0x00
	.long D_0608C718
	.long D_0608CB94
	.long func_06043AF0
