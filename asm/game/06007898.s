	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06007898,"ax",@progbits
	.p2align 2

	glabel load_title_data
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06007904,r4
	mov.l	.L06007908,r5
	mov.l	.L0600790C,r6
	mov	#2,r7
	sts.l	pr,@-r15
	mov.l	.L06007910,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L06007914,r4
	mov.l	.L06007918,r5
	mov.l	.L0600791C,r6
	mov	#2,r7
	sts.l	pr,@-r15
	mov.l	.L06007910,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L06007920,r4
	mov.l	.L06007924,r5
	mov.l	.L06007928,r6
	mov	#2,r7
	sts.l	pr,@-r15
	mov.l	.L06007910,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
.L060078DE:
	sts.l	pr,@-r15
	mov.l	.L0600792C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L06007930,r2
	mov.l	@r2,r0
	tst	r0,r0
	bf	.L060078DE
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
.L06007904:
	.long D_06051542
.L06007908:
	.long D_00280000
.L0600790C:
	.long D_060D900A
.L06007910:
	.long file_queue
.L06007914:
	.long D_06051538
.L06007918:
	.long D_002A0000
.L0600791C:
	.long D_060D900C
.L06007920:
	.long D_060512A0
.L06007924:
	.long D_00200000
.L06007928:
	.long D_060D900E
.L0600792C:
	.long file_server
.L06007930:
	.long file_busy_count
	endlabel load_title_data

	glabel load_dream_program
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.b	@(20,gbr),r0
	shll2	r0
	mov.l	.L0600797C,r2
	mov.l	@(r0,r2),r4
	mov.l	.L06007980,r5
	mov.b	@(20,gbr),r0
	cmp/eq	#14,r0
	bt	.L06007958
	cmp/eq	#12,r0
	bf	.L0600795A
.L06007958:
	mov.l	.L06007984,r5
.L0600795A:
	tst	#1,r0
	bt	.L06007960
	mov.l	.L06007984,r5
.L06007960:
	mov.l	.L06007988,r0
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
.L0600797C:
	.long dream_program_names
.L06007980:
	.long D_060B0000
.L06007984:
	.long D_060C0000
.L06007988:
	.long file_load
	endlabel load_dream_program

	.section .data.0600798C,"aw",@progbits
	.p2align 2
	dlabel dream_program_names
	.long D_06051761
	.long D_060517A7
	.long D_0605176B
	.long D_060517B1
	.long D_06051775
	.long D_060517BB
	.long D_0605177F
	.long D_060517C5
	.long D_06051789
	.long D_060517CF
	.long D_06051793
	.long D_060517D9
	.long D_0605179D
	.long D_060517E3
	.long D_0605179D
	.long D_060517E3
