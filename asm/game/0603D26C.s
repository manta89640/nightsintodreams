	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603D26C,"ax",@progbits
	.p2align 2

	glabel func_0603D26C
	sts.l	pr,@-r15
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603D27A
	lds.l	@r15+,pr
	rts
	nop
.L0603D27A:
	mov.l	.L0603D2C8,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0603D2CC,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r4
	mov	r0,r5
	mov.l	.L0603D2D0,r14
	jsr	@r14
	mov	r0,r6
	mov.w	@(2,r1),r0
	mov	r0,r4
	mov.w	@(24,r1),r0
	add	r4,r0
	mov.l	.L0603D2D4,r14
	jsr	@r14
	mov.w	r0,@(24,r1)
	mov.l	.L0603D2D8,r14
	jsr	@r14
	mov.w	@(22,r1),r0
	mov.l	@(48,r1),r0
	shlr2	r0
	and	#3,r0
	shll2	r0
	mov.l	.L0603D2DC,r2
	mov.l	.L0603D2E0,r0
	jsr	@r0
	nop
	mov.l	.L0603D2E4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0603D2C8:
	.long mtx_push
.L0603D2CC:
	.long mtx_translate
.L0603D2D0:
	.long mtx_scale
.L0603D2D4:
	.long mtx_rot_y
.L0603D2D8:
	.long mtx_rot_x
.L0603D2DC:
	.long D_0609BBBC
.L0603D2E0:
	.long poly_draw_model_color
.L0603D2E4:
	.long mtx_pop
	endlabel func_0603D26C

	.section .data.0603D2E8,"aw",@progbits
	.p2align 2
	.long D_0609BBBC
	.long D_0609BBD0
	.long D_0609BBE4
	.long D_0609BBF8
	dlabel D_0603D2F8
	.byte 0x00, 0x00, 0x00, 0x00, 0x4F, 0x22, 0xE0, 0x00, 0x81, 0x1D, 0x81, 0x13, 0xD6, 0x1A, 0x90, 0x31
	.byte 0x81, 0x60, 0x81, 0x61, 0x81, 0x62, 0x81, 0x63, 0xD6, 0x18, 0x90, 0x2C, 0x81, 0x60, 0x81, 0x61
	.byte 0x81, 0x62, 0x81, 0x63, 0xD2, 0x16, 0xD0, 0x17, 0x40, 0x0B, 0x00, 0x09, 0xD0, 0x16, 0x13, 0x03
	.byte 0x73, 0x10, 0xE0, 0x00, 0xC2, 0x27, 0xD0, 0x15, 0x21, 0x06, 0x71, 0x04
