	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06040CCC,"ax",@progbits
	.p2align 2

	glabel func_06040CCC
	mov.w	@(8,r1),r0
	dt	r0
	bf	.L06040CDC
	mov.l	.L06040CD8,r0
	jmp	@r0
	nop
.L06040CD8:
	.long obj_free
.L06040CDC:
	mov.w	r0,@(8,r1)
	endlabel func_06040CCC

	glabel func_06040CDE
	sts.l	pr,@-r15
	mov	#12,r8
	cmp/ge	r8,r0
	bt	.L06040D90
	cmp/eq	#11,r0
	bf	.L06040CF2
	mov	#0,r0
	mov.w	r0,@(20,r1)
	mov.b	r0,@(14,r1)
	mov.b	r0,@(15,r1)
.L06040CF2:
	mov.l	@(32,r1),r4
	mov.l	@(48,r1),r5
	add	r4,r5
	mov.l	r5,@(48,r1)
	mov.l	@(40,r1),r4
	mov.l	@(56,r1),r5
	add	r4,r5
	mov.l	r5,@(56,r1)
	mov.l	@(36,r1),r4
	mov.l	@(52,r1),r5
	add	r4,r5
	mov.l	r5,@(52,r1)
	mov.w	.L06040D52,r5
	add	r5,r4
	mov.l	r4,@(36,r1)
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov	#16,r0
	shll16	r0
	add	r0,r4
	sub	r0,r5
	mov.l	@(52,r1),r6
	mov.l	@(36,r1),r7
	cmp/ge	r4,r6
	bt	.L06040D30
	shar	r7
	neg	r7,r7
	mov	r4,r6
.L06040D30:
	cmp/gt	r5,r6
	bf	.L06040D3A
	shar	r7
	neg	r7,r7
	mov	r5,r6
.L06040D3A:
	mov.l	r6,@(52,r1)
	mov.l	r7,@(36,r1)
	mov.l	.L06040D54,r2
	mov.l	.L06040D58,r14
	jsr	@r14
	nop
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06040D5C
	lds.l	@r15+,pr
	rts
	nop
.L06040D52:
	.short 0x3000
.L06040D54:
	.long D_06014238
.L06040D58:
	.long spr_anim_step
.L06040D5C:
	mov.l	.L06040D80,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06040D84,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06040D88,r0
	jsr	@r0
	nop
	mov.l	.L06040D8C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06040D80:
	.long mtx_push
.L06040D84:
	.long mtx_translate
.L06040D88:
	.long spr_draw_billboard_unscaled
.L06040D8C:
	.long mtx_pop
.L06040D90:
	mov.l	.L06040DA4,r2
	mov.l	.L06040DA8,r14
	jsr	@r14
	nop
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06040DAC
	lds.l	@r15+,pr
	rts
	nop
.L06040DA4:
	.long D_0601421E
.L06040DA8:
	.long spr_anim_step
.L06040DAC:
	mov.l	.L06040DD0,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06040DD4,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06040DD8,r0
	jsr	@r0
	nop
	mov.l	.L06040DDC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06040DD0:
	.long mtx_push
.L06040DD4:
	.long mtx_translate
.L06040DD8:
	.long spr_draw_billboard_unscaled
.L06040DDC:
	.long mtx_pop
	endlabel func_06040CDE

	.section .data.06040DE0,"aw",@progbits
	.p2align 2
	.byte 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01
	.byte 0x40, 0x2B, 0x00, 0x09
	.long obj_free
