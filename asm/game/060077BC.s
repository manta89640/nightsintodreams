	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060077BC,"ax",@progbits
	.p2align 2

	glabel func_060077BC
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.b	@(20,gbr),r0
	cmp/eq	#7,r0
	bf	.L060077DC
	mov.l	.L060077D8,r4
	bra	.L060077E4
	nop
.L060077D8:
	.long D_060516EE
.L060077DC:
	shlr	r0
	shll2	r0
	mov.l	.L06007834,r2
	mov.l	@(r0,r2),r4
.L060077E4:
	mov.l	.L06007838,r5
	mov.l	.L0600783C,r6
	mov	#2,r7
	sts.l	pr,@-r15
	mov.l	.L06007840,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	.L06007844,r2
	mov.l	@(r0,r2),r4
	mov.l	.L06007848,r5
	mov.l	.L0600784C,r6
	mov	#2,r7
	sts.l	pr,@-r15
	mov.l	.L06007840,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
.L0600780E:
	sts.l	pr,@-r15
	mov.l	.L06007850,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L06007854,r2
	mov.l	@r2,r0
	tst	r0,r0
	bf	.L0600780E
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	rts
	nop
.L06007834:
	.long D_06007858
.L06007838:
	.long D_00200000
.L0600783C:
	.long D_060D9002
.L06007840:
	.long func_06006C94
.L06007844:
	.long D_06007878
.L06007848:
	.long VDP1_VRAM_CACHED + 0x68800
.L0600784C:
	.long D_060D900A
.L06007850:
	.long func_06006EA0
.L06007854:
	.long D_06064FA4
	endlabel func_060077BC

	.section .data.06007858,"aw",@progbits
	.p2align 2
	dlabel D_06007858
	.long D_060516BC
	.long D_060516C8
	.long D_060516D4
	.long D_060516E1
	.long D_060516FB
	.long D_06051708
	.long D_060516BC
	.long D_060516BC
	dlabel D_06007878
	.long D_06051715
	.long D_06051721
	.long D_0605172D
	.long D_0605173A
	.long D_06051747
	.long D_06051754
	.long D_06051715
	.long D_06051715
