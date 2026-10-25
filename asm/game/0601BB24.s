	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601BB24,"ax",@progbits
	.p2align 2
	.byte 0xFE, 0x09

	glabel func_0601BB26
	sts.l	pr,@-r15
	mov.l	.L0601BB60,r7
	mov.l	.L0601BB64,r2
	mov.l	.L0601BB68,r0
	jsr	@r0
	nop
	mov.l	.L0601BB6C,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L0601BB70,r2
	mov.l	r2,@(44,r3)
	mov.l	.L0601BB74,r2
	mov.l	r2,@(60,r3)
	mov.l	.L0601BB78,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601BB7C,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0601BB80,r0
	mov.l	r0,@(56,r3)
	mov.l	.L0601BB84,r0
	mov.l	r0,@(32,r3)
	mov.l	.L0601BB88,r0
	mov.l	r0,@(36,r3)
	mov.l	.L0601BB8C,r8
	mov.b	@(21,gbr),r0
	cmp/pz	r0
	bf	.L0601BB90
	bra	.L0601BB92
	mov	#4,r0
.L0601BB60:
	.long play_state
.L0601BB64:
	.long obj_list_effect
.L0601BB68:
	.long obj_alloc
.L0601BB6C:
	.long func_06019A88
.L0601BB70:
	.long D_0601B938
.L0601BB74:
	.long D_0601B958
.L0601BB78:
	.long 0xFFFFFFE7
.L0601BB7C:
	.long 0x0000000B
.L0601BB80:
	.long 0x0000012C
.L0601BB84:
	.long 0x00000025
.L0601BB88:
	.long 0x00000000
.L0601BB8C:
	.long mare_time
.L0601BB90:
	mov.b	@(3,r7),r0
.L0601BB92:
	add	#-1,r0
	shll2	r0
	mov.l	@(r0,r8),r0
	mov	#60,r13
	mov	#-128,r14
	shll	r14
	mov.l	r13,@(0,r14)
	mov.l	r0,@(4,r14)
	mov.l	@(28,r14),r0
	mov.l	r0,@-r15
	mov.l	.L0601BBD4,r14
	jsr	@r14
	mov	r0,r4
	mov	#3,r14
	mov.l	.L0601BBD8,r5
	mov.l	.L0601BBDC,r10
	jsr	@r10
	mov	r0,r4
	mov.l	@r15+,r8
	mov	#120,r0
	sub	r8,r0
	cmp/pz	r0
	bt	.L0601BBC2
	mov	#0,r0
.L0601BBC2:
	mov	#50,r8
	mulu.w	r0,r8
	sts	macl,r8
	mov.l	.L0601BBE0,r10
	mov.b	@(21,gbr),r0
	cmp/pz	r0
	bf	.L0601BBE4
	bra	.L0601BBE6
	mov	#4,r0
.L0601BBD4:
	.long math_bin_to_bcd
.L0601BBD8:
	.long D_0601B944
.L0601BBDC:
	.long txt_bcd_to_ascii
.L0601BBE0:
	.long mare_score
.L0601BBE4:
	mov.b	@(3,r7),r0
.L0601BBE6:
	add	#-1,r0
	shll2	r0
	mov.l	@(r0,r10),r9
	add	r8,r9
	mov.l	r9,@(r0,r10)
	mov.l	.L0601BC08,r14
	jsr	@r14
	mov	r8,r4
	mov	#5,r14
	mov.l	.L0601BC0C,r5
	mov.l	.L0601BC10,r10
	jsr	@r10
	mov	r0,r4
	lds.l	@r15+,pr
	mov.l	.L0601BC14,r0
	jmp	@r0
	nop
.L0601BC08:
	.long math_bin_to_bcd
.L0601BC0C:
	.long D_0601B956
.L0601BC10:
	.long txt_bcd_to_ascii
.L0601BC14:
	.long obj_free
	endlabel func_0601BB26

	.section .data.0601BC18,"aw",@progbits
	.p2align 2
	dlabel D_0601BC18
	.byte 0x40, 0x33, 0x43, 0x40, 0x31, 0x48, 0x49, 0x50, 0x53, 0x3A, 0x20, 0x20
	dlabel D_0601BC24
	.byte 0x20, 0x20, 0x30, 0xFF, 0x40, 0x34, 0x42, 0x40, 0x31, 0x4F, 0x4E, 0x55, 0x53, 0x3A
	dlabel D_0601BC32
	.byte 0x20, 0x20, 0x20, 0x20, 0x30, 0xFE
	dlabel D_0601BC38
	.byte 0x40, 0x30, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFF, 0x40, 0x30
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFE
	dlabel D_0601BC54
	.byte 0x00, 0x00, 0x00, 0x00, 0xC6, 0x04, 0x20, 0x08, 0x89, 0x0D, 0xD4, 0x08, 0x24, 0x12, 0x85, 0x12
	.byte 0x70, 0xFF, 0x40, 0x15, 0x8B, 0x0C, 0x81, 0x12, 0xC5, 0x44, 0x70, 0xF8, 0x98, 0x05, 0x30, 0x83
	.byte 0x89, 0x00, 0x60, 0x83, 0xC1, 0x44, 0x00, 0x0B, 0x00, 0x09, 0x01, 0x80
	.long D_0601BC54
	.byte 0xE0, 0xFF, 0xC0, 0x33, 0xE0, 0x01, 0xC0, 0x7F, 0xC4, 0x14, 0xE8, 0x0C, 0x30, 0x83, 0x89, 0x12
