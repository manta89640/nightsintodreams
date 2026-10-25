	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060079CC,"ax",@progbits
	.p2align 2

	glabel load_sel_program
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L060079FC,r4
	mov.l	.L06007A00,r0
	mov.l	.L06007A04,r5
	jsr	@r0
	nop
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
	.byte 0x00, 0x00
.L060079FC:
	.long D_060512AA
.L06007A00:
	.long file_load
.L06007A04:
	.long D_060C0000
	endlabel load_sel_program

	glabel load_over
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06007A38,r4
	mov.l	.L06007A3C,r0
	mov.l	.L06007A40,r5
	jsr	@r0
	nop
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
	.byte 0x00, 0x00
.L06007A38:
	.long D_060512E3
.L06007A3C:
	.long file_load
.L06007A40:
	.long D_00200000
	endlabel load_over

	glabel load_end_program
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06007A74,r4
	mov.l	.L06007A78,r0
	mov.l	.L06007A7C,r5
	jsr	@r0
	nop
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
	.byte 0x00, 0x00
.L06007A74:
	.long D_06051334
.L06007A78:
	.long file_load
.L06007A7C:
	.long D_060C0000
	endlabel load_end_program

	.section .data.06007A80,"aw",@progbits
	.p2align 2
	dlabel hint_names_j
	.long D_06051345
	.long D_06051350
	.long D_0605135B
	.long D_06051366
	.long D_06051371
	dlabel hint_names_e
	.long D_0605137C
	.long D_06051387
	.long D_06051392
	.long D_0605139D
	.long D_060513A8
