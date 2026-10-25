	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06040E9C,"ax",@progbits
	.p2align 2

	glabel func_06040E9C
	sts.l	pr,@-r15
	mov.l	@(12,gbr),r0
	tst	#7,r0
	bf	.L06040F1C
	mov.l	.L06040F24,r2
	mov	#1,r7
.L06040EA8:
	mov.l	.L06040F28,r0
	jsr	@r0
	nop
	mov.l	.L06040F2C,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L06040F30,r0
	jsr	@r0
	nop
	mov.w	.L06040F22,r9
	and	r9,r0
	add	#-127,r0
	shll16	r0
	mov	r0,r4
	mov.l	.L06040F30,r0
	jsr	@r0
	nop
	mov.w	.L06040F22,r9
	and	r9,r0
	add	#-127,r0
	shll16	r0
	mov	r0,r6
	mov	#0,r5
	mov.l	.L06040F34,r10
	jsr	@r10
	mov.w	@(26,r1),r0
	mov.l	.L06040F38,r0
	jsr	@r0
	nop
	mov.l	.L06040F34,r10
	jsr	@r10
	mov.w	@(24,r1),r0
	mov.l	.L06040F3C,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r0
	add	r4,r0
	mov.l	r0,@(48,r3)
	mov.l	@(52,r1),r0
	add	r5,r0
	mov.l	r0,@(52,r3)
	mov.l	@(56,r1),r0
	add	r6,r0
	mov.l	r0,@(56,r3)
	mov.l	.L06040F30,r0
	jsr	@r0
	nop
	mov.l	.L06040F40,r8
	and	r8,r0
	mov.l	.L06040F44,r5
	add	r0,r5
	mov.l	r5,@(32,r3)
	mov.w	@(26,r1),r0
	mov.w	r0,@(26,r3)
	mov.w	@(24,r1),r0
	mov.w	r0,@(24,r3)
	dt	r7
	bf	.L06040EA8
.L06040F1C:
	lds.l	@r15+,pr
	rts
	nop
.L06040F22:
	.short 0x00FF
.L06040F24:
	.long obj_list_effect
.L06040F28:
	.long obj_alloc
.L06040F2C:
	.long func_06040F48
.L06040F30:
	.long math_rand
.L06040F34:
	.long math_sincos
.L06040F38:
	.long math_rotate2d_inv
.L06040F3C:
	.long math_rotate_xz
.L06040F40:
	.long 0x00007FFF
.L06040F44:
	.long 0x00020000
	endlabel func_06040E9C

	glabel func_06040F48
	mov.l	.L06040F64,r2
	mov.l	r2,@(44,r1)
	mov	#120,r0
	mov.w	r0,@(8,r1)
	mov.l	.L06040F68,r0
	mov.l	r0,@(4,r1)
	mov.w	.L06040F62,r0
	mov.w	r0,@(16,r1)
	mov.l	.L06040F6C,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L06040F62:
	.short 0x0080
.L06040F64:
	.long D_060BBD58
.L06040F68:
	.long 0x00080000
.L06040F6C:
	.long func_06040F70
	endlabel func_06040F48

	glabel func_06040F70
	mov.w	@(8,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bt	.L06040F84
	mov.l	.L06040F80,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06040F80:
	.long obj_free
.L06040F84:
	mov.w	r0,@(8,r1)
	endlabel func_06040F70

	glabel func_06040F86
	sts.l	pr,@-r15
	mov.l	@(32,r1),r9
	mov.l	.L06040FC8,r8
	sub	r8,r9
	mov.l	r9,@(32,r1)
	mov.l	@(36,r1),r0
	mov.l	.L06040FCC,r8
	add	r0,r8
	mov.l	r8,@(36,r1)
	mov.l	@(52,r1),r0
	add	r8,r0
	add	r9,r0
	mov.l	r0,@(52,r1)
	mov.l	@(4,r1),r5
	mov.l	.L06040FD0,r0
	add	r0,r5
	mov.l	r5,@(4,r1)
	mov.w	@(8,r1),r0
	mov.w	.L06040FC4,r8
	add	r8,r0
	mov.w	r0,@(8,r1)
	mov.w	@(10,r1),r0
	mov.w	.L06040FC6,r8
	add	r8,r0
	mov.w	r0,@(10,r1)
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06040FD4
	lds.l	@r15+,pr
	rts
	nop
.L06040FC4:
	.short 0x0200
.L06040FC6:
	.short 0xFC00
.L06040FC8:
	.long 0x00001000
.L06040FCC:
	.long 0x00002000
.L06040FD0:
	.long 0x0000C000
.L06040FD4:
	mov.l	.L06041010,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06041014,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06041018,r10
	jsr	@r10
	mov.w	@(8,r1),r0
	mov.w	@(10,r1),r0
	mov.l	.L0604101C,r8
	mov.l	.L06041020,r10
	jsr	@r10
	add	r8,r0
	mov.l	@(4,r1),r4
	mov	r4,r5
	mov.l	.L06041024,r0
	jsr	@r0
	mov	r4,r6
	mov.l	.L06041028,r2
	mov.l	.L0604102C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L06041030,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06041010:
	.long mtx_push
.L06041014:
	.long mtx_translate
.L06041018:
	.long mtx_rot_y
.L0604101C:
	.long 0x00004000
.L06041020:
	.long mtx_rot_z
.L06041024:
	.long mtx_scale
.L06041028:
	.long D_060A2558
.L0604102C:
	.long poly_draw_model_color
.L06041030:
	.long mtx_pop
	endlabel func_06040F86

	.section .data.06041034,"aw",@progbits
	.p2align 2
	dlabel D_06041034
	.byte 0x00, 0x00, 0x00, 0x96
	.long D_06041040
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_06041040
	.byte 0x00, 0x00, 0xFF, 0xB0, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0xE0, 0xF8, 0x02, 0x1E
	.byte 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01, 0x40, 0x2B, 0x00, 0x09
	.long obj_free
