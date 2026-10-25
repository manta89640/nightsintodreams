	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603D200,"ax",@progbits
	.p2align 2

	glabel func_0603D200
	sts.l	pr,@-r15
	mov.w	@(4,r1),r0
	mov.w	r0,@(22,r1)
	mov.l	.L0603D21C,r2
	mov.l	.L0603D220,r14
	jsr	@r14
	nop
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603D224
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0603D21C:
	.long D_060B8370
.L0603D220:
	.long spr_anim_step
.L0603D224:
	mov.l	.L0603D244,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0603D248,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L0603D24C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L0603D250,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0603D244:
	.long mtx_push
.L0603D248:
	.long mtx_translate
.L0603D24C:
	.long spr_draw_billboard
.L0603D250:
	.long mtx_pop
	endlabel func_0603D200

	.section .data.0603D254,"aw",@progbits
	.p2align 2
	.byte 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01
	.byte 0x40, 0x2B, 0x00, 0x09
	.long obj_free
