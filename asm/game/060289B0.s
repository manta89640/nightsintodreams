	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060289B0,"ax",@progbits
	.p2align 2

	glabel func_060289B0
	sts.l	pr,@-r15
	mov.l	.L06028C5C,r0
	jsr	@r0
	nop
	mov.l	@(16,r1),r2
	mov.l	@r2+,r7
	mov.l	@r2+,r8
	mov.l	@r2+,r9
	neg	r9,r9
	mov.w	@(22,r1),r0
	mov.l	.L06028C60,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r9
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	sub	r2,r3
	dmuls.l	r11,r9
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	add	r2,r9
	mov	r3,r7
	mov.w	@(26,r1),r0
	mov.l	.L06028C60,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r8
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	add	r4,r3
	dmuls.l	r11,r8
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	sub	r4,r8
	mov	r3,r7
	mov.w	@(24,r1),r0
	neg	r0,r0
	mov.l	.L06028C60,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r9
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	sub	r2,r3
	dmuls.l	r11,r9
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	add	r2,r9
	mov	r3,r7
	neg	r7,r4
	neg	r8,r5
	neg	r9,r6
	mov.l	.L06028C64,r0
	jsr	@r0
	nop
	mov.l	@(44,r1),r4
	mov.l	@(44,r1),r5
	mov.l	@(44,r1),r6
	mov.l	.L06028C68,r0
	jsr	@r0
	nop
	mov.w	@(24,r1),r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	nop
	mov.l	@(12,r1),r4
	mov.w	@(20,r4),r0
	mov.w	.L06028C58,r2
	add	r0,r2
	mov.w	@(26,r1),r0
	add	r2,r0
	neg	r0,r0
	sub	r2,r0
	mov.l	.L06028C70,r2
	jsr	@r2
	nop
	mov.l	@(12,r1),r4
	mov.w	@(14,r4),r0
	mov	r0,r2
	mov.w	@(22,r1),r0
	sub	r2,r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	nop
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C70,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	cmp/pl	r0
	bt	.L06028AC8
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028AC8:
	mov.l	.L06028C78,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	add	r2,r0
	mov.l	.L06028C70,r2
	jsr	@r2
	nop
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028AFA
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028AFA:
	mov.l	.L06028C78,r0
	jsr	@r0
	nop
	mov.l	.L06028C78,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	add	r2,r0
	mov.l	.L06028C70,r2
	jsr	@r2
	nop
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028B32
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028B32:
	mov.l	.L06028C7C,r11
	mov.l	.L06028C80,r10
	mov.l	.L06028C84,r0
	jsr	@r0
	mov	#1,r9
	mov.l	.L06028C88,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C70,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028B64
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028B64:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C70,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028B86
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028B86:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C70,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028BA8
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028BA8:
	add	#-12,r14
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C8C,r11
	mov.l	.L06028C80,r10
	mov.l	.L06028C84,r0
	jsr	@r0
	mov	#1,r9
	mov.l	.L06028C88,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C70,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028BE6
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028BE6:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C70,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028C08
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028C08:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C70,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028C2A
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028C2A:
	add	#-12,r14
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C90,r11
	mov.l	.L06028C80,r10
	mov.l	.L06028C84,r0
	jsr	@r0
	mov	#1,r9
	mov.l	.L06028C88,r0
	jsr	@r0
	nop
	mov.l	.L06028C88,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	lds.l	@r15+,pr
	rts
	nop
.L06028C58:
	.short 0x4000
	.byte 0x00, 0x00
.L06028C5C:
	.long mtx_push_identity
.L06028C60:
	.long math_sincos
.L06028C64:
	.long mtx_translate
.L06028C68:
	.long mtx_scale
.L06028C6C:
	.long mtx_rot_y
.L06028C70:
	.long mtx_rot_z
.L06028C74:
	.long mtx_rot_x
.L06028C78:
	.long mtx_push
.L06028C7C:
	.long D_060289A4
.L06028C80:
	.long D_0602AF54
.L06028C84:
	.long mtx_transform_points
.L06028C88:
	.long mtx_pop
.L06028C8C:
	.long D_060F30CC
.L06028C90:
	.long D_060F30D8
	endlabel func_060289B0

	glabel func_06028C94
	sts.l	pr,@-r15
	mov.l	r12,@-r15
	mov.l	@(8,r1),r12
	mov.b	@(0,r12),r0
	mov	#16,r2
	cmp/eq	r2,r0
	bf	.L06028CBC
	mov.l	@(36,r12),r8
	mov.l	@(40,r12),r9
	mov.l	@(44,r12),r10
	mov.l	.L06028CC4,r7
	mov.l	@r7+,r4
	mov.l	@r7+,r5
	mov.l	@r7+,r6
	sub	r4,r8
	sub	r5,r9
	sub	r6,r10
	mov.l	r8,@(48,r1)
	mov.l	r9,@(52,r1)
	mov.l	r10,@(56,r1)
.L06028CBC:
	mov.l	@r15+,r12
	lds.l	@r15+,pr
	rts
	nop
.L06028CC4:
	.long D_060F30D8
	endlabel func_06028C94

	glabel func_06028CC8
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L06028CD8
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06028CD8
	rts
	nop
.L06028CD8:
	sts.l	pr,@-r15
	mov.l	@(8,r1),r2
	mov.b	@(1,r2),r0
	and	#2,r0
	tst	r0,r0
	bt	.L06028CF6
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06028E38,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
.L06028CF6:
	mov.l	.L06028E3C,r0
	jsr	@r0
	nop
	mov.l	@(16,r1),r2
	mov.l	@r2+,r7
	mov.l	@r2+,r8
	mov.l	@r2+,r9
	neg	r9,r9
	mov.w	@(22,r1),r0
	mov.l	.L06028E40,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r9
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	sub	r2,r3
	dmuls.l	r11,r9
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	add	r2,r9
	mov	r3,r7
	mov.w	@(26,r1),r0
	mov.l	.L06028E40,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r8
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	add	r4,r3
	dmuls.l	r11,r8
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	sub	r4,r8
	mov	r3,r7
	mov.w	@(24,r1),r0
	neg	r0,r0
	mov.l	.L06028E40,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r9
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	sub	r2,r3
	dmuls.l	r11,r9
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	add	r2,r9
	mov	r3,r7
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	sub	r7,r4
	sub	r8,r5
	sub	r9,r6
	mov.l	.L06028E44,r0
	jsr	@r0
	nop
	mov.l	@(44,r1),r4
	mov.l	@(44,r1),r5
	mov.l	@(44,r1),r6
	mov.l	.L06028E48,r0
	jsr	@r0
	nop
	mov.w	@(24,r1),r0
	mov.l	.L06028E4C,r2
	jsr	@r2
	nop
	mov.l	@(12,r1),r4
	mov.w	@(20,r4),r0
	mov	#64,r2
	shll8	r2
	add	r0,r2
	mov.w	@(26,r1),r0
	add	r2,r0
	neg	r0,r0
	sub	r2,r0
	mov.l	.L06028E50,r2
	jsr	@r2
	nop
	mov.l	@(12,r1),r4
	mov.w	@(14,r4),r0
	mov	r0,r2
	mov.w	@(22,r1),r0
	sub	r2,r0
	mov.l	.L06028E4C,r2
	jsr	@r2
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028E44,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028E50,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028E4C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	cmp/pl	r0
	bt	.L06028E0E
	mov.l	.L06028E54,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028E0E:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06028E20
	mov.l	.L06028E58,r0
	jsr	@r0
	nop
.L06028E20:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06028E5C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L06028E60
	nop
	.byte 0x00, 0x00
.L06028E38:
	.long func_06029518
.L06028E3C:
	.long mtx_push
.L06028E40:
	.long math_sincos
.L06028E44:
	.long mtx_translate
.L06028E48:
	.long mtx_scale
.L06028E4C:
	.long mtx_rot_y
.L06028E50:
	.long mtx_rot_z
.L06028E54:
	.long mtx_rot_x
.L06028E58:
	.long light_shade_model
.L06028E5C:
	.long poly_draw_model
.L06028E60:
	mov.l	.L06028EBC,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028EC0,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	add	r2,r0
	mov.l	.L06028EC4,r2
	jsr	@r2
	nop
	mov.l	.L06028EC8,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028E92
	mov.l	.L06028ECC,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028E92:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06028EA4
	mov.l	.L06028ED0,r0
	jsr	@r0
	nop
.L06028EA4:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06028ED4,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L06028ED8
	nop
	.byte 0x00, 0x00
.L06028EBC:
	.long mtx_push
.L06028EC0:
	.long mtx_translate
.L06028EC4:
	.long mtx_rot_z
.L06028EC8:
	.long mtx_rot_y
.L06028ECC:
	.long mtx_rot_x
.L06028ED0:
	.long light_shade_model
.L06028ED4:
	.long poly_draw_model
.L06028ED8:
	mov.l	.L06028F34,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028F38,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	add	r2,r0
	mov.l	.L06028F3C,r2
	jsr	@r2
	nop
	mov.l	.L06028F40,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028F0A
	mov.l	.L06028F44,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028F0A:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06028F1C
	mov.l	.L06028F48,r0
	jsr	@r0
	nop
.L06028F1C:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06028F4C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L06028F50
	nop
	.byte 0x00, 0x00
.L06028F34:
	.long mtx_push
.L06028F38:
	.long mtx_translate
.L06028F3C:
	.long mtx_rot_z
.L06028F40:
	.long mtx_rot_y
.L06028F44:
	.long mtx_rot_x
.L06028F48:
	.long light_shade_model
.L06028F4C:
	.long poly_draw_model
.L06028F50:
	mov.l	.L06028FA8,r0
	jsr	@r0
	nop
	mov.l	.L06028FAC,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028FB0,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028FB4,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028FB8,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028F7E
	mov.l	.L06028FBC,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028F7E:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06028F90
	mov.l	.L06028FC0,r0
	jsr	@r0
	nop
.L06028F90:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06028FC4,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L06028FC8
	nop
	.byte 0x00, 0x00
.L06028FA8:
	.long mtx_pop
.L06028FAC:
	.long mtx_push
.L06028FB0:
	.long mtx_translate
.L06028FB4:
	.long mtx_rot_z
.L06028FB8:
	.long mtx_rot_y
.L06028FBC:
	.long mtx_rot_x
.L06028FC0:
	.long light_shade_model
.L06028FC4:
	.long poly_draw_model
.L06028FC8:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029014,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06029018,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L0602901C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028FEA
	mov.l	.L06029020,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028FEA:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06028FFC
	mov.l	.L06029024,r0
	jsr	@r0
	nop
.L06028FFC:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029028,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L0602902C
	nop
	.byte 0x00, 0x00
.L06029014:
	.long mtx_translate
.L06029018:
	.long mtx_rot_z
.L0602901C:
	.long mtx_rot_y
.L06029020:
	.long mtx_rot_x
.L06029024:
	.long light_shade_model
.L06029028:
	.long poly_draw_model
.L0602902C:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029078,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L0602907C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06029080,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L0602904E
	mov.l	.L06029084,r2
	jsr	@r2
	mov.w	@r12+,r0
.L0602904E:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06029060
	mov.l	.L06029088,r0
	jsr	@r0
	nop
.L06029060:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L0602908C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L06029090
	nop
	.byte 0x00, 0x00
.L06029078:
	.long mtx_translate
.L0602907C:
	.long mtx_rot_z
.L06029080:
	.long mtx_rot_y
.L06029084:
	.long mtx_rot_x
.L06029088:
	.long light_shade_model
.L0602908C:
	.long poly_draw_model
.L06029090:
	mov.l	.L060290E0,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L060290E4,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L060290E8,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L060290EC,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L060290B8
	mov.l	.L060290F0,r2
	jsr	@r2
	mov.w	@r12+,r0
.L060290B8:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L060290CA
	mov.l	.L060290F4,r0
	jsr	@r0
	nop
.L060290CA:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L060290F8,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L060290FC
	nop
.L060290E0:
	.long mtx_pop
.L060290E4:
	.long mtx_translate
.L060290E8:
	.long mtx_rot_z
.L060290EC:
	.long mtx_rot_y
.L060290F0:
	.long mtx_rot_x
.L060290F4:
	.long light_shade_model
.L060290F8:
	.long poly_draw_model
.L060290FC:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029148,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L0602914C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06029150,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L0602911E
	mov.l	.L06029154,r2
	jsr	@r2
	mov.w	@r12+,r0
.L0602911E:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06029130
	mov.l	.L06029158,r0
	jsr	@r0
	nop
.L06029130:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L0602915C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L06029160
	nop
	.byte 0x00, 0x00
.L06029148:
	.long mtx_translate
.L0602914C:
	.long mtx_rot_z
.L06029150:
	.long mtx_rot_y
.L06029154:
	.long mtx_rot_x
.L06029158:
	.long light_shade_model
.L0602915C:
	.long poly_draw_model
.L06029160:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L060291AC,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L060291B0,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L060291B4,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06029182
	mov.l	.L060291B8,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06029182:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06029194
	mov.l	.L060291BC,r0
	jsr	@r0
	nop
.L06029194:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L060291C0,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L060291C4
	nop
	.byte 0x00, 0x00
.L060291AC:
	.long mtx_translate
.L060291B0:
	.long mtx_rot_z
.L060291B4:
	.long mtx_rot_y
.L060291B8:
	.long mtx_rot_x
.L060291BC:
	.long light_shade_model
.L060291C0:
	.long poly_draw_model
.L060291C4:
	mov.l	.L06029224,r0
	jsr	@r0
	nop
	mov.l	.L06029228,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L0602922C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	sub	r2,r0
	mov.l	.L06029230,r2
	jsr	@r2
	nop
	mov.l	.L06029234,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L060291FC
	mov.l	.L06029238,r2
	jsr	@r2
	mov.w	@r12+,r0
.L060291FC:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L0602920E
	mov.l	.L0602923C,r0
	jsr	@r0
	nop
.L0602920E:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029240,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L06029244
	nop
.L06029224:
	.long mtx_pop
.L06029228:
	.long mtx_push
.L0602922C:
	.long mtx_translate
.L06029230:
	.long mtx_rot_z
.L06029234:
	.long mtx_rot_y
.L06029238:
	.long mtx_rot_x
.L0602923C:
	.long light_shade_model
.L06029240:
	.long poly_draw_model
.L06029244:
	mov.l	@(12,r1),r3
	mov.b	@(2,r3),r0
	cmp/eq	#0,r0
	bf	.L0602926A
	mov.l	@(8,r1),r2
	mov.w	@(28,r2),r0
	cmp/pz	r0
	bt	.L0602926A
	mov.b	@(8,r2),r0
	tst	r0,r0
	bf	.L0602926A
	add	#8,r13
	add	#24,r14
	add	#8,r12
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L0602933C
	bra	.L0602933C
	add	#4,r12
.L0602926A:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L060292C0,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	sub	r2,r0
	mov.l	.L060292C4,r2
	jsr	@r2
	nop
	mov.l	.L060292C8,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06029296
	mov.l	.L060292CC,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06029296:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L060292A8
	mov.l	.L060292D0,r0
	jsr	@r0
	nop
.L060292A8:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L060292D4,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L060292D8
	nop
	.byte 0x00, 0x00
.L060292C0:
	.long mtx_translate
.L060292C4:
	.long mtx_rot_z
.L060292C8:
	.long mtx_rot_y
.L060292CC:
	.long mtx_rot_x
.L060292D0:
	.long light_shade_model
.L060292D4:
	.long poly_draw_model
.L060292D8:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029324,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06029328,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L0602932C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L060292FA
	mov.l	.L06029330,r2
	jsr	@r2
	mov.w	@r12+,r0
.L060292FA:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L0602930C
	mov.l	.L06029334,r0
	jsr	@r0
	nop
.L0602930C:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029338,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L0602933C
	nop
	.byte 0x00, 0x00
.L06029324:
	.long mtx_translate
.L06029328:
	.long mtx_rot_z
.L0602932C:
	.long mtx_rot_y
.L06029330:
	.long mtx_rot_x
.L06029334:
	.long light_shade_model
.L06029338:
	.long poly_draw_model
.L0602933C:
	mov.l	.L06029398,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L0602939C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	sub	r2,r0
	mov.l	.L060293A0,r2
	jsr	@r2
	nop
	mov.l	.L060293A4,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L0602936E
	mov.l	.L060293A8,r2
	jsr	@r2
	mov.w	@r12+,r0
.L0602936E:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06029380
	mov.l	.L060293AC,r0
	jsr	@r0
	nop
.L06029380:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L060293B0,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L060293B4
	nop
	.byte 0x00, 0x00
.L06029398:
	.long mtx_pop
.L0602939C:
	.long mtx_translate
.L060293A0:
	.long mtx_rot_z
.L060293A4:
	.long mtx_rot_y
.L060293A8:
	.long mtx_rot_x
.L060293AC:
	.long light_shade_model
.L060293B0:
	.long poly_draw_model
.L060293B4:
	mov.l	@(12,r1),r3
	mov.b	@(2,r3),r0
	cmp/eq	#0,r0
	bf	.L060293CA
	mov.l	@(8,r1),r2
	mov.w	@(28,r2),r0
	cmp/pz	r0
	bt	.L060293CA
	mov.b	@(8,r2),r0
	tst	r0,r0
	bt	.L0602949C
.L060293CA:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029420,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	sub	r2,r0
	mov.l	.L06029424,r2
	jsr	@r2
	nop
	mov.l	.L06029428,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L060293F6
	mov.l	.L0602942C,r2
	jsr	@r2
	mov.w	@r12+,r0
.L060293F6:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06029408
	mov.l	.L06029430,r0
	jsr	@r0
	nop
.L06029408:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029434,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L06029438
	nop
	.byte 0x00, 0x00
.L06029420:
	.long mtx_translate
.L06029424:
	.long mtx_rot_z
.L06029428:
	.long mtx_rot_y
.L0602942C:
	.long mtx_rot_x
.L06029430:
	.long light_shade_model
.L06029434:
	.long poly_draw_model
.L06029438:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029484,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06029488,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L0602948C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L0602945A
	mov.l	.L06029490,r2
	jsr	@r2
	mov.w	@r12+,r0
.L0602945A:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L0602946C
	mov.l	.L06029494,r0
	jsr	@r0
	nop
.L0602946C:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029498,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L0602949C
	nop
	.byte 0x00, 0x00
.L06029484:
	.long mtx_translate
.L06029488:
	.long mtx_rot_z
.L0602948C:
	.long mtx_rot_y
.L06029490:
	.long mtx_rot_x
.L06029494:
	.long light_shade_model
.L06029498:
	.long poly_draw_model
.L0602949C:
	mov.l	.L060294A8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L060294A8:
	.long mtx_pop
	endlabel func_06028CC8

	.section .data.060294AC,"aw",@progbits
	.p2align 2
	dlabel D_060294AC
	.byte 0x00, 0x00, 0x00
	dlabel D_060294AF
	.byte 0x00
