	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06033BA0,"ax",@progbits
	.p2align 2

	glabel func_06033BA0
	mov.w	@(78,gbr),r0
	tst	#240,r0
	bf	func_06033BAE
	mov.w	@(0,r1),r0
	add	#-1,r0
	cmp/pl	r0
	bt	.L06033BE4
	endlabel func_06033BA0

	glabel func_06033BAE
	sts.l	pr,@-r15
	mov.l	.L06033BD4,r2
	mov.l	.L06033BD8,r0
	jsr	@r0
	nop
	mov.l	.L06033BDC,r0
	mov.l	r0,@(12,r3)
	mov.w	.L06033BD0,r0
	mov.w	r0,@(0,r1)
	mov	#0,r0
	mov.w	r0,@(2,r1)
	mov.l	.L06033BE0,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L06033BD0:
	.short 0x0080
	.byte 0x00, 0x00
.L06033BD4:
	.long obj_list_stage
.L06033BD8:
	.long obj_alloc
.L06033BDC:
	.long func_06033054
.L06033BE0:
	.long func_06033C2C
.L06033BE4:
	mov.w	r0,@(0,r1)
	mov.w	@(2,r1),r0
	mov.w	.L06033C1E,r8
	cmp/ge	r8,r0
	bt	.L06033BF2
	add	#2,r0
	mov.w	r0,@(2,r1)
.L06033BF2:
	mov.l	.L06033C20,r2
	mov.l	.L06033C24,r3
	mov.w	@(2,r1),r0
	mov	r0,r5
	shll8	r5
	mov	#12,r7
.L06033BFE:
	mov.w	@r2,r8
	mov.w	@(24,r2),r0
	add	#2,r2
	sub	r8,r0
	dmuls.l	r0,r5
	sts	mach,r9
	sts	macl,r0
	xtrct	r9,r0
	add	r8,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L06033BFE
	add	#2,r3
	mov.l	.L06033C28,r0
	jmp	@r0
	nop
.L06033C1E:
	.short 0x0100
.L06033C20:
	.long D_06033B58
.L06033C24:
	.long D_060F30F8
.L06033C28:
	.long spr_draw_obj
	endlabel func_06033BAE

	glabel func_06033C2C
	mov.w	@(0,r1),r0
	add	#-1,r0
	cmp/pl	r0
	bt	.L06033C58
	mov.l	.L06033C4C,r2
	mov	#-1,r0
	mov.w	r0,@r2
	mov.l	.L06033C50,r2
	mov	#11,r0
	mov.b	r0,@r2
	mov	#18,r0
	mov.b	r0,@(0,gbr)
	mov.l	.L06033C54,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06033C4C:
	.long D_06033AE0 + 0x28
.L06033C50:
	.long D_0604DBB8
.L06033C54:
	.long obj_free
.L06033C58:
	mov.w	r0,@(0,r1)
	mov.w	@(2,r1),r0
	mov.w	.L06033C92,r8
	cmp/ge	r8,r0
	bt	.L06033C66
	add	#2,r0
	mov.w	r0,@(2,r1)
.L06033C66:
	mov.l	.L06033C94,r2
	mov.l	.L06033C98,r3
	mov.w	@(2,r1),r0
	mov	r0,r5
	shll8	r5
	mov	#12,r7
.L06033C72:
	mov.w	@r2,r8
	mov.w	@(24,r2),r0
	add	#2,r2
	sub	r8,r0
	dmuls.l	r0,r5
	sts	mach,r9
	sts	macl,r0
	xtrct	r9,r0
	add	r8,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L06033C72
	add	#2,r3
	mov.l	.L06033C9C,r0
	jmp	@r0
	nop
.L06033C92:
	.short 0x0100
.L06033C94:
	.long D_06033B70
.L06033C98:
	.long D_060F30F8
.L06033C9C:
	.long spr_draw_obj
	endlabel func_06033C2C

	.section .data.06033CA0,"aw",@progbits
	.p2align 2
	dlabel D_06033CA0
	.byte 0x10, 0x00, 0x00, 0xEE, 0x44, 0xFF, 0x00, 0xF0, 0xFF, 0xFF, 0x00, 0xF2, 0x02, 0x3F, 0x00, 0xF8
	.byte 0xF6, 0x7F, 0x00, 0xFA, 0x01, 0x01, 0x01, 0x00, 0x00, 0x11, 0x01, 0x08, 0x80, 0x00, 0x01, 0x10
	.byte 0x00, 0x02, 0x01, 0x1C, 0x30, 0x30, 0x01, 0x20, 0x07, 0x07, 0x01, 0xD0, 0x00, 0x01, 0x01, 0xD8
	.byte 0xFF, 0xFF, 0xFF, 0xFF
