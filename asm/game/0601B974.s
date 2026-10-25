	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601B974,"ax",@progbits
	.p2align 2

	glabel func_0601B974
	sts.l	pr,@-r15
	mov.l	.L0601B9F0,r7
	mov.l	.L0601B9F4,r2
	mov.l	.L0601B9F8,r0
	jsr	@r0
	nop
	mov.l	.L0601B9FC,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L0601BA00,r2
	mov.l	r2,@(44,r3)
	mov.l	.L0601BA04,r2
	mov.l	r2,@(60,r3)
	mov.l	.L0601BA08,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601BA0C,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0601BA10,r0
	mov.l	r0,@(56,r3)
	mov.l	.L0601BA14,r0
	mov.l	r0,@(32,r3)
	mov.l	.L0601BA18,r0
	mov.l	r0,@(36,r3)
	mov.b	@(8,r7),r0
	mov.l	r0,@-r15
	mov.l	.L0601BA1C,r14
	jsr	@r14
	mov	r0,r4
	mov	#2,r14
	mov.l	.L0601BA20,r5
	mov.l	.L0601BA24,r10
	jsr	@r10
	mov	r0,r4
	mov.l	@r15+,r8
	mov	#100,r0
	mulu.w	r0,r8
	sts	macl,r8
	mov.l	@(656,gbr),r0
	add	r8,r0
	mov.l	r0,@(656,gbr)
	mov.l	.L0601BA1C,r14
	jsr	@r14
	mov	r8,r4
	mov	#5,r14
	mov.l	.L0601BA28,r5
	mov.l	.L0601BA24,r10
	jsr	@r10
	mov	r0,r4
	mov.l	.L0601B9F0,r7
	mov.l	.L0601BA2C,r2
	mov.l	@r2,r8
	mov.b	@(8,r7),r0
	sub	r0,r8
	cmp/pl	r8
	bf	.L0601B9E4
	neg	r8,r0
.L0601B9E4:
	mov.b	r0,@(8,r7)
	lds.l	@r15+,pr
	mov.l	.L0601BA30,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0601B9F0:
	.long play_state
.L0601B9F4:
	.long obj_list_effect
.L0601B9F8:
	.long obj_alloc
.L0601B9FC:
	.long func_06019A88
.L0601BA00:
	.long D_0601BA34
.L0601BA04:
	.long D_0601BA5A
.L0601BA08:
	.long 0xFFFFFFEC
.L0601BA0C:
	.long 0x00000010
.L0601BA10:
	.long 0x0000012C
.L0601BA14:
	.long 0x00000020
.L0601BA18:
	.long 0x00000000
.L0601BA1C:
	.long math_bin_to_bcd
.L0601BA20:
	.long D_0601BA42
.L0601BA24:
	.long txt_bcd_to_ascii
.L0601BA28:
	.long D_0601BA51
.L0601BA2C:
	.long chips_needed
.L0601BA30:
	.long obj_free
	endlabel func_0601B974

	.section .data.0601BA34,"aw",@progbits
	.p2align 2
	dlabel D_0601BA34
	.byte 0x40, 0x31, 0x53, 0x48, 0x4F, 0x4F, 0x54, 0x20, 0x43, 0x48, 0x49, 0x50, 0x53, 0x3A
	dlabel D_0601BA42
	.byte 0x20, 0x30, 0xFF, 0x09, 0x40, 0x31, 0x42, 0x4F, 0x4E, 0x55, 0x53, 0x3A, 0x20, 0x20, 0x20
	dlabel D_0601BA51
	.byte 0x20, 0x20, 0x20, 0x20, 0x30, 0x50, 0x54, 0x53, 0xFE
	dlabel D_0601BA5A
	.byte 0x40, 0x30, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0xFF, 0x09, 0x40, 0x30, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0xFE
