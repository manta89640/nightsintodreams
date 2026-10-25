	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603D6E0,"ax",@progbits
	.p2align 2

	glabel func_0603D6E0
	mov	#31,r0
	mov.b	@(r0,r1),r0
	mov.l	.L0603D6F0,r2
.L0603D6E6:
	mov.l	@r2+,r8
	cmp/gt	r8,r0
	bf	.L0603D6F4
	bra	.L0603D6E6
	add	#4,r2
.L0603D6F0:
	.long D_0603D6B8
.L0603D6F4:
	rts
	mov.l	@r2,r2
	endlabel func_0603D6E0

	glabel func_0603D6F8
	sts	pr,r14
	mov.l	@(156,gbr),r0
	mov	r0,r8
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.l	.L0603D750,r9
	mov.l	@r9,r9
	mov.l	@(48,r9),r0
	sub	r4,r0
	dmuls.l	r0,r0
	sts	mach,r10
	cmp/ge	r8,r10
	bt	.L0603D74A
	mov.l	@(52,r9),r0
	sub	r5,r0
	dmuls.l	r0,r0
	sts	mach,r0
	add	r0,r10
	cmp/ge	r8,r10
	bt	.L0603D74A
	mov.l	@(56,r9),r0
	sub	r6,r0
	dmuls.l	r0,r0
	sts	mach,r0
	add	r0,r10
	cmp/ge	r8,r10
	bt	.L0603D74A
	mov	r10,r0
	mov.l	r0,@(156,gbr)
	mov	#48,r9
	add	r1,r9
	mov.w	@r9,r0
	add	#4,r9
	mov.w	r0,@(150,gbr)
	mov.w	@r9,r0
	add	#4,r9
	mov.w	r0,@(152,gbr)
	mov.w	@r9,r0
	add	#4,r9
	mov.w	r0,@(154,gbr)
.L0603D74A:
	lds	r14,pr
	rts
	nop
.L0603D750:
	.long player_obj
	endlabel func_0603D6F8

	glabel func_0603D754
	sts.l	pr,@-r15
	mov.l	.L0603D7E4,r2
	mov.w	@(26,r1),r0
	mov.w	.L0603D7DE,r8
	add	r8,r0
	mov.w	r0,@(26,r1)
	mov.l	.L0603D7E8,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	mov.l	.L0603D7EC,r0
	dmuls.l	r0,r10
	sts	macl,r10
	dmuls.l	r0,r11
	sts	macl,r11
	mov.l	r11,@r2
	mov.l	r10,@(4,r2)
	mov	#0,r0
	mov.l	r0,@(8,r2)
	mov	#1,r7
.L0603D77E:
	mov	#4,r11
	mov.l	.L0603D7F0,r3
	mov.w	@r2,r12
	add	#4,r2
	mov.w	@r2,r13
	add	#4,r2
	mov.w	@r2,r14
	add	#4,r2
.L0603D78E:
	mov.w	@r3+,r4
	mov.w	@r3+,r5
	mov.w	@r3+,r6
	sub	r12,r4
	sub	r13,r5
	sub	r14,r6
	mov.l	.L0603D7F4,r0
	jsr	@r0
	mov	#15,r8
	mov.b	r0,@r2
	add	#1,r2
	dt	r11
	bf	.L0603D78E
	dt	r7
	bf	.L0603D77E
	mov.l	.L0603D7E4,r2
	add	#12,r2
	mov	#1,r7
	mov.l	.L0603D7F8,r6
.L0603D7B4:
	mov	#4,r14
.L0603D7B6:
	mov.b	@r2+,r8
	mov	#15,r0
	sub	r8,r0
	shll2	r0
	shll2	r0
	mov.w	.L0603D7E0,r4
	mov.w	.L0603D7E2,r5
	mov.l	.L0603D7FC,r13
	jsr	@r13
	nop
	mov.w	r0,@r6
	add	#2,r6
	dt	r14
	bf	.L0603D7B6
	add	#12,r2
	dt	r7
	bf	.L0603D7B4
	lds.l	@r15+,pr
	rts
	nop
.L0603D7DE:
	.short 0x0800
.L0603D7E0:
	.short 0x2000
.L0603D7E2:
	.short 0x7FFF
.L0603D7E4:
	.long D_0603D818
.L0603D7E8:
	.long math_sincos
.L0603D7EC:
	.long 0x0000000F
.L0603D7F0:
	.long D_0603D800
.L0603D7F4:
	.long math_length3d_capped
.L0603D7F8:
	.long VDP1_VRAM + 0xD828
.L0603D7FC:
	.long vdp_rgb555_lerp
	endlabel func_0603D754

	.section .data.0603D800,"aw",@progbits
	.p2align 2
	dlabel D_0603D800
	.byte 0xFF, 0xF4, 0xFF, 0xF4, 0x00, 0x00, 0x00, 0x0C, 0xFF, 0xF4, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x0C
	.byte 0x00, 0x00, 0xFF, 0xF4, 0x00, 0x0C, 0x00, 0x00
	dlabel D_0603D818
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
