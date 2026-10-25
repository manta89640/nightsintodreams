	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06028904,"ax",@progbits
	.p2align 2

	glabel func_06028904
	sts.l	pr,@-r15
	mov.l	.L06028928,r0
	mov.l	@r0,r0
	cmp/eq	r1,r0
	bf	.L06028938
	mov.l	.L0602892C,r0
	mov.l	r0,@(112,gbr)
	mov.l	@(44,r1),r4
	mov.l	.L06028930,r7
	mov.l	@(0,r7),r5
	mov.l	@(4,r7),r6
	mov.l	@(8,r7),r7
	mov.l	@(112,gbr),r0
	mov.l	.L06028934,r14
	jsr	@r14
	mov	r0,r8
	bra	.L0602894E
	nop
.L06028928:
	.long D_060F3064
.L0602892C:
	.long D_060FEB0C
.L06028930:
	.long D_060FEAAC
.L06028934:
	.long func_0600CC8E
.L06028938:
	mov.l	.L06028988,r0
	mov.l	r0,@(112,gbr)
	mov.l	@(44,r1),r4
	mov.l	.L0602898C,r7
	mov.l	@(0,r7),r5
	mov.l	@(4,r7),r6
	mov.l	@(8,r7),r7
	mov.l	@(112,gbr),r0
	mov.l	.L06028990,r14
	jsr	@r14
	mov	r0,r8
.L0602894E:
	mov.l	.L06028994,r0
	jsr	@r0
	nop
	mov.w	@(28,r1),r0
	extu.w	r0,r0
	shll2	r0
	shll	r0
	mov.l	.L06028998,r2
	add	r2,r0
	mov.l	r0,@(112,gbr)
	mov.l	.L0602899C,r2
	mov.b	@(7,r1),r0
	tst	#1,r0
	bt	.L06028976
	mov.b	@(20,gbr),r0
	cmp/eq	#13,r0
	bt	.L06028974
	cmp/eq	#15,r0
	bf	.L06028976
.L06028974:
	mov.l	.L060289A0,r2
.L06028976:
	mov.w	@(6,r1),r0
	and	#112,r0
	shlr	r0
	add	r0,r2
	mov.l	@r2+,r13
	mov.l	@r2+,r14
	lds.l	@r15+,pr
	rts
	nop
.L06028988:
	.long D_060FEB8C
.L0602898C:
	.long D_060FEAB8
.L06028990:
	.long func_0600CC8E
.L06028994:
	.long func_06029B94
.L06028998:
	.long VDP1_VRAM
.L0602899C:
	.long D_060288C4
.L060289A0:
	.long D_060288E4
	endlabel func_06028904

	.section .data.060289A4,"aw",@progbits
	.p2align 2
	dlabel D_060289A4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
