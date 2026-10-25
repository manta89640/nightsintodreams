	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0604384C,"ax",@progbits
	.p2align 2
	.byte 0x89, 0x10

	glabel func_0604384E
	sts.l	pr,@-r15
	mov.l	@(60,r1),r2
	mov.l	@(52,r1),r3
	mov.l	@(32,r1),r4
	mov.l	@(36,r1),r5
	add	r4,r2
	add	r5,r3
	mov.l	r2,@(60,r1)
	mov.l	.L0604386C,r0
	jsr	@r0
	mov.l	r3,@(52,r1)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604386C:
	.long path_place_obj
	endlabel func_0604384E

	.section .data.06043870,"aw",@progbits
	.p2align 2
	.byte 0x50, 0x10, 0x21, 0x06, 0x71, 0x04, 0x20, 0x0A, 0x80, 0x10, 0xD0, 0x01, 0x00, 0x0B, 0x81, 0x13
	.byte 0x00, 0x00, 0x02, 0x00, 0x85, 0x13, 0x40, 0x10, 0x89, 0x08, 0x81, 0x13
