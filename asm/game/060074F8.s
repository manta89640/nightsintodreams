	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060074F8,"ax",@progbits
	.p2align 2

	glabel load_alife
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	.L06007534,r2
	mov.l	@(r0,r2),r4
	cmp/pz	r4
	bf	.L0600751E
	mov.l	.L06007538,r0
	mov.l	.L0600753C,r5
	jsr	@r0
	nop
.L0600751E:
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
.L06007534:
	.long alife_names
.L06007538:
	.long file_load
.L0600753C:
	.long D_06080000
	endlabel load_alife

	.section .data.06007540,"aw",@progbits
	.p2align 2
	dlabel alife_names
	.long D_06051686
	.long D_0605168F
	.long D_06051698
	.long D_060516A1
	.long D_060516AA
	.long D_060516B3
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
