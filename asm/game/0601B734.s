	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601B734,"ax",@progbits
	.p2align 2
	.byte 0x00, 0x00

	glabel func_0601B736
	mov.l	.L0601B744,r4
	mov.l	r1,@r4
	mov.l	.L0601B748,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601B744:
	.long D_060F30C4
.L0601B748:
	.long func_0601B74C
	endlabel func_0601B736

	glabel func_0601B74C
	sts.l	pr,@-r15
	mov.l	.L0601B784,r7
	mov.w	@(28,gbr),r0
	shlr2	r0
	shlr2	r0
	shlr	r0
	mov	#5,r14
	mov.l	.L0601B788,r13
.L0601B75C:
	mov.l	@r13+,r12
	tst	#1,r0
	bt	.L0601B772
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r0,@-r15
	jsr	@r12
	nop
	mov.l	@r15+,r0
	mov.l	@r15+,r13
	mov.l	@r15+,r14
.L0601B772:
	shlr	r0
	dt	r14
	bf	.L0601B75C
	mov	#0,r0
	mov.b	r0,@(10,r7)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601B784:
	.long D_060FFE50
.L0601B788:
	.long D_0601B78C
	endlabel func_0601B74C

	.section .data.0601B78C,"aw",@progbits
	.p2align 2
	dlabel D_0601B78C
	.long func_0601B7A0
	.long func_0601B7B2
	.long func_0601B7F0
	.long func_0601B820
	.long func_0601B848
