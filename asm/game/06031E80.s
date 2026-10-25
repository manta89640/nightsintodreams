	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06031E80,"ax",@progbits
	.p2align 2

	glabel func_06031E80
	mov.l	r1,@-r15
	sts.l	pr,@-r15
	mov.l	.L06031EA4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	@r15+,r1
	mov	#0,r0
	mov.w	r0,@(8,r1)
	mov.l	.L06031EA8,r2
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bt	.L06031E9C
	mov.l	.L06031EAC,r2
.L06031E9C:
	mov.l	r2,@-r1
	add	#4,r1
	rts
	nop
.L06031EA4:
	.long func_0604DF68
.L06031EA8:
	.long func_06031EB0
.L06031EAC:
	.long func_06032350
	endlabel func_06031E80

	glabel func_06031EB0
	sts.l	pr,@-r15
	bsr	func_06031EE4
	nop
	mov.l	@(52,r1),r8
	mov.l	@(36,r1),r9
	mov.l	.L06031ED8,r0
	mov.l	.L06031EDC,r10
	cmp/ge	r10,r0
	bf	.L06031EC4
	mov	r10,r0
.L06031EC4:
	add	r0,r9
	mov.l	r9,@(36,r1)
	add	r9,r8
	mov.l	r8,@(52,r1)
	mov.l	.L06031EE0,r2
	mov.l	r8,@r2
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06031ED8:
	.long 0x00000400
.L06031EDC:
	.long 0x00010000
.L06031EE0:
	.long VDP2_REGS + 0x74
	endlabel func_06031EB0

	glabel func_06031EE4
	sts.l	pr,@-r15
	mov.w	@(8,r1),r0
	add	#1,r0
	mov.w	r0,@(8,r1)
	mov.l	.L06031F00,r2
.L06031EEE:
	mov.l	@r2+,r8
	cmp/pz	r8
	bf	.L06031F0A
	cmp/eq	r8,r0
	bt	.L06031F04
	add	#4,r2
	bra	.L06031EEE
	add	#4,r8
	.byte 0x00, 0x00
.L06031F00:
	.long D_06031F10
.L06031F04:
	mov.l	@r2+,r2
	jsr	@r2
	nop
.L06031F0A:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06031EE4

	.section .data.06031F10,"aw",@progbits
	.p2align 2
	dlabel D_06031F10
	.byte 0x00, 0x00, 0x00, 0x01
	.long func_0601E398
	.byte 0x00, 0x00, 0x00, 0x0B
	.long func_0601E3E0
	.byte 0x00, 0x00, 0x00, 0x0C
	.long func_0601E408
	.byte 0x00, 0x00, 0x00, 0x10
	.long func_0601E408
	.byte 0x00, 0x00, 0x00, 0x1E
	.long func_0601E550
	.byte 0x00, 0x00, 0x00, 0x1F
	.long func_0601E60C
	.byte 0x00, 0x00, 0x00, 0x28
	.long func_0601E6B8
	.byte 0x00, 0x00, 0x00, 0x5A
	.long func_060321B8
	.byte 0x00, 0x00, 0x00, 0x64
	.long func_060321E4
	.byte 0x00, 0x00, 0x00, 0x6E
	.long func_06031FAC
	.byte 0x00, 0x00, 0x00, 0x82
	.long func_06032260
	.byte 0x00, 0x00, 0x00, 0xAA
	.long func_060321CC
	.byte 0x00, 0x00, 0x00, 0xAF
	.long func_06031FD4
	.byte 0x00, 0x00, 0x00, 0xB3
	.long func_06031FD4
	.byte 0x00, 0x00, 0x00, 0xB4
	.long func_060322A0
	.byte 0x00, 0x00, 0x00, 0xCD
	.long func_06031FFC
	.byte 0x00, 0x00, 0x00, 0xD1
	.long func_06031FFC
	.byte 0x00, 0x00, 0x00, 0xD2
	.long func_060322E0
	.byte 0x00, 0x00, 0x00, 0xF0
	.long func_06032320
	.byte 0xFF, 0xFF, 0xFF, 0xFF
