	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603FE70,"ax",@progbits
	.p2align 2

	glabel func_0603FE70
	sts.l	pr,@-r15
	mov.l	.L0603FE98,r0
	jsr	@r0
	nop
	mov.w	.L0603FE94,r8
	and	r8,r0
	add	#8,r0
	mov.w	r0,@(8,r1)
	mov	#0,r0
	mov.l	r0,@(60,r1)
	mov.l	.L0603FE9C,r2
	mov.l	r2,@(44,r1)
	mov.l	.L0603FEA0,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L0603FE94:
	.short 0x007F
	.byte 0x00, 0x00
.L0603FE98:
	.long math_rand
.L0603FE9C:
	.long D_06013FCE
.L0603FEA0:
	.long func_0603FEA4
	endlabel func_0603FE70

	glabel func_0603FEA4
	sts.l	pr,@-r15
	mov.w	@(8,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bt	.L0603FEC2
	mov.l	.L0603FF34,r0
	mov.l	r0,@(44,r1)
	mov.l	.L0603FF38,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.l	.L0603FF3C,r0
	mov.l	r0,@(32,r1)
	mov	#0,r0
	mov.b	r0,@(14,r1)
	mov	#12,r0
.L0603FEC2:
	mov.w	r0,@(8,r1)
	mov.w	@(26,r1),r0
	mov.w	.L0603FF2E,r8
	add	r8,r0
	mov.w	r0,@(26,r1)
	mov.w	@(22,r1),r0
	add	#12,r0
	mov.w	.L0603FF30,r8
	cmp/ge	r8,r0
	bf	.L0603FED8
	mov	r8,r0
.L0603FED8:
	mov.w	r0,@(22,r1)
	mov.l	@(60,r1),r4
	mov.l	.L0603FF40,r0
	add	r0,r4
	mov.l	r4,@(60,r1)
	mov	#0,r5
	mov	#0,r6
	mov.l	.L0603FF44,r10
	jsr	@r10
	mov.w	@(26,r1),r0
	mov.l	.L0603FF48,r0
	jsr	@r0
	nop
	mov.l	.L0603FF44,r10
	jsr	@r10
	mov.w	@(24,r1),r0
	mov.l	.L0603FF4C,r0
	jsr	@r0
	nop
	mov.l	.L0603FF50,r3
	mov.l	@r3,r3
	mov.l	@(48,r3),r0
	add	r0,r4
	mov.l	@(52,r3),r0
	add	r0,r5
	mov.l	@(56,r3),r0
	add	r0,r6
	mov.l	r4,@(48,r1)
	mov.l	r5,@(52,r1)
	mov.l	r6,@(56,r1)
	mov.b	@(13,r1),r0
	tst	r0,r0
	bt	.L0603FF60
	mov.l	.L0603FF54,r2
	mov.l	.L0603FF58,r0
	jsr	@r0
	nop
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603FF5C
	lds.l	@r15+,pr
	rts
	nop
.L0603FF2E:
	.short 0x0111
.L0603FF30:
	.short 0x0180
	.byte 0x00, 0x00
.L0603FF34:
	.long D_06013AAE
.L0603FF38:
	.long func_0603FF66
.L0603FF3C:
	.long 0x00040000
.L0603FF40:
	.long 0x00018000
.L0603FF44:
	.long math_sincos
.L0603FF48:
	.long math_rotate2d_inv
.L0603FF4C:
	.long math_rotate_xz
.L0603FF50:
	.long player_obj
.L0603FF54:
	.long D_06014076
.L0603FF58:
	.long spr_anim_step
.L0603FF5C:
	bsr	func_06040028
	nop
.L0603FF60:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_0603FEA4

	glabel func_0603FF66
	sts.l	pr,@-r15
	mov.w	@(8,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bt	.L0603FF7C
	lds.l	@r15+,pr
	mov.l	.L0603FF78,r0
	jmp	@r0
	nop
.L0603FF78:
	.long obj_free
.L0603FF7C:
	mov.w	r0,@(8,r1)
	mov.l	@(60,r1),r4
	mov.l	@(32,r1),r0
	add	r0,r4
	mov.l	.L0603FFD4,r8
	add	r8,r0
	mov.l	r0,@(32,r1)
	mov.l	r4,@(60,r1)
	mov	#0,r5
	mov	#0,r6
	mov.l	.L0603FFD8,r10
	jsr	@r10
	mov.w	@(26,r1),r0
	mov.l	.L0603FFDC,r0
	jsr	@r0
	nop
	mov.l	.L0603FFD8,r10
	jsr	@r10
	mov.w	@(24,r1),r0
	mov.l	.L0603FFE0,r0
	jsr	@r0
	nop
	mov.l	.L0603FFE4,r3
	mov.l	@r3,r3
	mov.l	@(48,r3),r0
	add	r0,r4
	mov.l	@(52,r3),r0
	add	r0,r5
	mov.l	@(56,r3),r0
	add	r0,r6
	mov.l	r4,@(48,r1)
	mov.l	r5,@(52,r1)
	mov.l	r6,@(56,r1)
	mov.l	@(0,r1),r2
	mov.l	.L0603FFE8,r14
	jsr	@r14
	nop
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603FFEC
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0603FFD4:
	.long 0xFFFFF000
.L0603FFD8:
	.long math_sincos
.L0603FFDC:
	.long math_rotate2d_inv
.L0603FFE0:
	.long math_rotate_xz
.L0603FFE4:
	.long player_obj
.L0603FFE8:
	.long spr_anim_step
.L0603FFEC:
	bsr	func_0603FFF6
	nop
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_0603FF66

	glabel func_0603FFF6
	sts.l	pr,@-r15
	mov.l	.L06040018,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0604001C,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06040020,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L06040024,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06040018:
	.long mtx_push
.L0604001C:
	.long mtx_translate
.L06040020:
	.long spr_draw_billboard
.L06040024:
	.long mtx_pop
	endlabel func_0603FFF6

	glabel func_06040028
	sts.l	pr,@-r15
	mov.w	@(22,r1),r0
	mov.l	r0,@-r15
	mov.w	.L06040054,r0
	mov.w	r0,@(22,r1)
	mov.l	.L06040058,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0604005C,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06040060,r0
	jsr	@r0
	nop
	mov.l	@r15+,r0
	mov.w	r0,@(22,r1)
	lds.l	@r15+,pr
	mov.l	.L06040064,r0
	jmp	@r0
	nop
.L06040054:
	.short 0x00A0
	.byte 0x00, 0x00
.L06040058:
	.long mtx_push
.L0604005C:
	.long mtx_translate
.L06040060:
	.long spr_draw_billboard
.L06040064:
	.long mtx_pop
	endlabel func_06040028

	.section .data.06040068,"aw",@progbits
	.p2align 2
	dlabel D_06040068
	.byte 0x00, 0x00, 0x00, 0x05
	.long D_06089F4C
	.byte 0x00, 0x00, 0x0C, 0xCC
	.long D_06089F4C
	.byte 0x00, 0x00, 0x33, 0x33
	.long D_06089F68
	.byte 0x00, 0x00, 0x33, 0x33
	.long D_06089F84
	.byte 0x00, 0x00, 0x33, 0x33
	.long D_0608A048
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_06040094
	.byte 0x00, 0x00, 0x00, 0x03
	.long D_0608A048
	.byte 0x00, 0x00, 0x08, 0x88
	.long D_0608A064
	.byte 0x00, 0x00, 0x08, 0x88
	.long D_0608A048
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_060400B0
	.byte 0x00, 0x00, 0x00, 0x06
	.long D_0608A048
	.byte 0x00, 0x00, 0x0C, 0xCC
	.long D_0608A064
	.byte 0x00, 0x00, 0x0C, 0xCC
	.long D_0608A048
	.byte 0x00, 0x00, 0x0C, 0xCC
	.long D_0608A09C
	.byte 0x00, 0x00, 0x0C, 0xCC
	.long D_0608A080
	.byte 0x00, 0x00, 0x0C, 0xCC
	.long D_0608A09C
	.byte 0x00, 0x00, 0x0C, 0xCC, 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01
	.byte 0x80, 0x21, 0xD0, 0x01, 0x40, 0x2B, 0x00, 0x09
	.long obj_free
