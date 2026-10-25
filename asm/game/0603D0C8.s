	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603D0C8,"ax",@progbits
	.p2align 2

	glabel func_0603D0C8
	sts.l	pr,@-r15
	mov.l	.L0603D100,r3
	mov.l	@r3,r3
	mov.l	@(48,r3),r4
	mov.l	@(48,r1),r0
	sub	r0,r4
	mov.l	@(52,r3),r5
	mov.l	@(52,r1),r0
	sub	r0,r5
	mov.l	@(56,r3),r6
	mov.l	@(56,r1),r0
	sub	r0,r6
	swap.w	r4,r4
	swap.w	r5,r5
	swap.w	r6,r6
	exts.w	r4,r4
	exts.w	r5,r5
	exts.w	r6,r6
	mov.l	.L0603D104,r0
	jsr	@r0
	nop
	mov.w	.L0603D0FC,r8
	cmp/ge	r8,r0
	lds.l	@r15+,pr
	rts
	nop
.L0603D0FC:
	.short 0x0300
	.byte 0x00, 0x00
.L0603D100:
	.long cam_obj
.L0603D104:
	.long math_length3d
	endlabel func_0603D0C8

	glabel func_0603D108
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov.b	@(1,r2),r0
	cmp/pz	r0
	bt	func_0603D120
	mov	#1,r0
	mov.b	r0,@(1,r2)
	mov.l	.L0603D11C,r0
	jmp	@r0
	nop
.L0603D11C:
	.long obj_free
	endlabel func_0603D108

	glabel func_0603D120
	sts.l	pr,@-r15
	mov.w	@(4,r1),r0
	mov.w	r0,@(22,r1)
	mov.l	@(0,r1),r2
	mov.l	.L0603D13C,r14
	jsr	@r14
	nop
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603D140
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0603D13C:
	.long spr_anim_step
.L0603D140:
	mov.l	.L0603D160,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0603D164,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L0603D168,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L0603D16C,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0603D160:
	.long mtx_push
.L0603D164:
	.long mtx_translate
.L0603D168:
	.long spr_draw_billboard
.L0603D16C:
	.long mtx_pop
	endlabel func_0603D120

	glabel func_0603D170
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov.b	@(1,r2),r0
	cmp/pz	r0
	bt	func_0603D188
	mov	#1,r0
	mov.b	r0,@(1,r2)
	mov.l	.L0603D184,r0
	jmp	@r0
	nop
.L0603D184:
	.long obj_free
	endlabel func_0603D170

	glabel func_0603D188
	sts.l	pr,@-r15
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603D196
	lds.l	@r15+,pr
	rts
	nop
.L0603D196:
	mov.w	@(4,r1),r0
	mov.w	r0,@(22,r1)
	mov.l	.L0603D1B8,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0603D1BC,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L0603D1C0,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L0603D1C4,r0
	jmp	@r0
	nop
.L0603D1B8:
	.long mtx_push
.L0603D1BC:
	.long mtx_translate
.L0603D1C0:
	.long spr_draw_billboard
.L0603D1C4:
	.long mtx_pop
	endlabel func_0603D188

	.section .data.0603D1C8,"aw",@progbits
	.p2align 2
	.byte 0xD2, 0x05, 0x11, 0x2B, 0xE0, 0x00, 0x81, 0x1A, 0x80, 0x1E, 0x80, 0x1F, 0xD0, 0x03, 0x21, 0x06
	.byte 0x71, 0x04, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x00
	.long D_060B8318
	.long D_0603D1E8
	dlabel D_0603D1E8
	.byte 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01
	.byte 0x40, 0x2B, 0x00, 0x09
	.long obj_free
