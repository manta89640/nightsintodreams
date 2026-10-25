	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060167B0,"ax",@progbits
	.p2align 2

	glabel func_060167B0
	add	#-1,r15
	swap.w	r5,r15
	swap.w	r5,r15
	add	#89,r3
	add	#89,r3
	add	#89,r3
	mov.l	@r15,r1
	mov	r9,r13
	add	#20,r13
	add	#-1,r15
	add	#-78,r12
	add	#12,r1
	add	#-81,r12
	add	#-120,r12
	add	#99,r12
	add	#-1,r15
	dlabel lbl_060167D0
	mov.b	@(32,gbr),r0
	mov.l	.L060167E4,r2
	mov	r0,r8
	shll8	r8
	add	r8,r2
	mov	#0,r8
	mov.b	r8,@r2
	xor	#2,r0
	rts
	mov.b	r0,@(32,gbr)
.L060167E4:
	.long D_060FBBFC
	endlabel func_060167B0

	glabel func_060167E8
	mov.b	@(32,gbr),r0
	mov.l	.L06016810,r8
	xor	#2,r0
	shll8	r0
	add	r0,r8
	mov.b	@r8,r0
	mov	#63,r9
	cmp/ge	r9,r0
	bt	.L06016814
	mov	r0,r9
	shll2	r0
	shll	r0
	add	#1,r9
	mov.b	r9,@r8
	add	#8,r8
	add	r0,r8
	mov.l	r1,@r8
	mov.l	r2,@(4,r8)
	rts
	mov	#0,r0
.L06016810:
	.long D_060FBBFC
.L06016814:
	rts
	mov	#-1,r0
	endlabel func_060167E8

	glabel func_06016818
	mov.l	.L06016820,r2
	mov	#0,r0
	rts
	mov.l	r0,@r2
.L06016820:
	.long D_060FB7F8
	endlabel func_06016818

	glabel func_06016824
	mov.l	.L06016864,r2
	mov.l	@r2,r4
	mov	#63,r0
	cmp/ge	r0,r4
	bt	.L0601685E
	add	#1,r4
	mov.l	r4,@r2
	add	#-1,r4
	add	#4,r2
	shll2	r4
	shll2	r4
	add	r4,r2
	mov.l	r1,@r2
	add	#4,r2
	mov	#48,r0
	mov.w	@(r0,r1),r4
	add	#4,r0
	mov.w	@(r0,r1),r5
	add	#4,r0
	mov.w	@(r0,r1),r6
	mov.w	r4,@r2
	add	#2,r2
	mov.w	r5,@r2
	add	#2,r2
	mov.w	r6,@r2
	add	#2,r2
	mov.w	r8,@r2
	add	#2,r2
	mov.l	r9,@r2
.L0601685E:
	rts
	nop
	.byte 0x00, 0x00
.L06016864:
	.long D_060FB7F8
	endlabel func_06016824

	.section .data.06016868,"aw",@progbits
	.p2align 2
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_06016888
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_060168B8
	.byte 0x00, 0x00
	dlabel D_060168BA
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
