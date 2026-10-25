	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06007AA8,"ax",@progbits
	.p2align 2

	glabel load_hint
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06007AF4,r2
	mov.b	@r2,r0
	cmp/pz	r0
	bf	.L06007AE0
	mov.l	.L06007AF8,r2
	tst	#64,r0
	bt	.L06007AC8
	mov.l	.L06007AFC,r2
.L06007AC8:
	and	#63,r0
	mov	r0,r3
	mov	#-4,r0
.L06007ACE:
	add	#4,r0
	add	#-5,r3
	cmp/pz	r3
	bt	.L06007ACE
	mov.l	@(r0,r2),r4
	mov.l	.L06007B00,r0
	mov.l	.L06007B04,r5
	jsr	@r0
	nop
.L06007AE0:
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
.L06007AF4:
	.long D_0604DBB7
.L06007AF8:
	.long hint_names_j
.L06007AFC:
	.long hint_names_e
.L06007B00:
	.long file_load
.L06007B04:
	.long D_06080000
	endlabel load_hint

	glabel load_rd7m2
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06007B38,r4
	mov.l	.L06007B3C,r0
	mov.l	.L06007B40,r5
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
.L06007B38:
	.long D_0605167C
.L06007B3C:
	.long file_load
.L06007B40:
	.long D_00200000
	endlabel load_rd7m2

	.section .data.06007B44,"aw",@progbits
	.p2align 2
	.byte 0x00, 0x0B, 0x6F, 0x43, 0xE1, 0xA4, 0x41, 0x08, 0xE0, 0x11, 0x80, 0x12, 0x00, 0x09, 0x00, 0x09
	.byte 0x00, 0x09, 0x00, 0x09, 0x00, 0x09, 0x00, 0x09, 0x00, 0x09, 0x00, 0x09, 0x00, 0x09, 0x00, 0x09
	.byte 0x00, 0x0B, 0x00, 0x09, 0xE1, 0xA4, 0x41, 0x08, 0xE0, 0x00, 0x80, 0x12, 0x00, 0x09, 0x00, 0x09
	.byte 0x00, 0x09, 0x00, 0x09, 0x00, 0x09, 0x00, 0x09, 0x00, 0x09, 0x00, 0x09, 0x00, 0x09, 0x00, 0x09
	.byte 0x00, 0x09, 0x00, 0x09, 0x00, 0x09, 0x00, 0x0B, 0x00, 0x09, 0xE1, 0xA4, 0x41, 0x08, 0x00, 0x0B
