	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601BA80,"ax",@progbits
	.p2align 2

	glabel func_0601BA80
	sts.l	pr,@-r15
	mov.l	.L0601BAC4,r7
	mov.l	.L0601BAC8,r2
	mov.l	.L0601BACC,r0
	jsr	@r0
	nop
	mov.l	.L0601BAD0,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L0601BAD4,r2
	mov.l	r2,@(44,r3)
	mov.l	.L0601BAD8,r2
	mov.l	r2,@(60,r3)
	mov.l	.L0601BADC,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0601BAE0,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0601BAE4,r0
	mov.l	r0,@(56,r3)
	mov.l	.L0601BAE8,r0
	mov.l	r0,@(32,r3)
	mov.l	.L0601BAEC,r0
	mov.l	r0,@(36,r3)
	mov.b	@(20,gbr),r0
	mov	#12,r8
	cmp/ge	r8,r0
	bt	.L0601BABC
	mov.b	@(108,gbr),r0
	or	#128,r0
	mov.b	r0,@(108,gbr)
.L0601BABC:
	lds.l	@r15+,pr
	mov.l	.L0601BAF0,r0
	jmp	@r0
	nop
.L0601BAC4:
	.long play_state
.L0601BAC8:
	.long obj_list_effect
.L0601BACC:
	.long obj_alloc
.L0601BAD0:
	.long func_06019A88
.L0601BAD4:
	.long D_0601BAF4
.L0601BAD8:
	.long D_0601BB10
.L0601BADC:
	.long 0xFFFFFFF1
.L0601BAE0:
	.long 0x00000008
.L0601BAE4:
	.long 0x0000012C
.L0601BAE8:
	.long 0x0000001D
.L0601BAEC:
	.long 0x00000000
.L0601BAF0:
	.long obj_free
	endlabel func_0601BA80

	.section .data.0601BAF4,"aw",@progbits
	.p2align 2
	dlabel D_0601BAF4
	.byte 0x40, 0x34, 0x42, 0x40, 0x31, 0x4F, 0x4E, 0x55, 0x53, 0x40, 0x34, 0x54, 0x40, 0x31, 0x49, 0x4D
	.byte 0x45, 0x20, 0x53, 0x54, 0x41, 0x52, 0x54, 0x40, 0x34, 0x21, 0x21, 0xFE
	dlabel D_0601BB10
	.byte 0x40, 0x30, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20
