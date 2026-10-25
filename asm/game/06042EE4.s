	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06042EE4,"ax",@progbits
	.p2align 2

	glabel func_06042EE4
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#29,r6
	mov.l	.L06042F0C,r0
	jsr	@r0
	mov	#4,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L06042F10,r0
	mov.l	r0,@-r1
	lds	r14,pr
	rts
	add	#4,r1
.L06042F0C:
	.long snd_seq_start
.L06042F10:
	.long func_06042F30
	endlabel func_06042EE4

	.section .data.06042F14,"aw",@progbits
	.p2align 2
	.byte 0xD2, 0x03, 0xD0, 0x04, 0x40, 0x0B, 0x00, 0x09, 0xD0, 0x03, 0x4E, 0x2A, 0x00, 0x0B, 0x13, 0x03
	.long obj_list_effect
	.long obj_alloc
	.long func_060330F4
