	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06042F30,"ax",@progbits
	.p2align 2

	glabel func_06042F30
	sts.l	pr,@-r15
	mov.l	.L06042F50,r2
	mov.l	@(36,r1),r4
	mov.l	.L06042F54,r3
	add	r2,r4
	mov.l	r4,@(36,r1)
	mov.l	@(32,r1),r0
	add	r2,r0
	cmp/eq	r3,r0
	bf	.L06042F4A
	mov.l	.L06042F58,r2
	mov.l	r2,@-r1
	add	#4,r1
.L06042F4A:
	bra	.L06042FF6
	mov.l	r0,@(32,r1)
	.byte 0x00, 0x00
.L06042F50:
	.long 0x00002000
.L06042F54:
	.long 0x00008000
.L06042F58:
	.long func_06042F5C
	endlabel func_06042F30

	glabel func_06042F5C
	sts.l	pr,@-r15
	mov.l	.L06042F74,r2
	mov.l	@(32,r1),r0
	mov.l	.L06042F78,r3
	add	r2,r0
	cmp/eq	r3,r0
	bf	.L06042F70
	mov.l	.L06042F7C,r2
	mov.l	r2,@-r1
	add	#4,r1
.L06042F70:
	bra	.L06042FF6
	mov.l	r0,@(32,r1)
.L06042F74:
	.long 0x00002000
.L06042F78:
	.long 0x00018000
.L06042F7C:
	.long func_06042F80
	endlabel func_06042F5C

	glabel func_06042F80
	sts.l	pr,@-r15
	mov.w	.L06042F9E,r2
	mov.l	@(32,r1),r0
	mov.l	.L06042FA0,r3
	sub	r2,r0
	mov.l	r0,@(32,r1)
	mov.l	@(36,r1),r0
	add	r2,r0
	cmp/eq	r3,r0
	bf	.L06042F9A
	mov.l	.L06042FA4,r2
	mov.l	r2,@-r1
	add	#4,r1
.L06042F9A:
	bra	.L06042FF6
	mov.l	r0,@(36,r1)
.L06042F9E:
	.short 0x2000
.L06042FA0:
	.long 0x00018000
.L06042FA4:
	.long func_06042FA8
	endlabel func_06042F80

	glabel func_06042FA8
	sts.l	pr,@-r15
	mov.w	.L06042FC6,r2
	mov.l	@(32,r1),r0
	mov.l	.L06042FC8,r3
	add	r2,r0
	mov.l	r0,@(32,r1)
	mov.l	@(36,r1),r0
	sub	r2,r0
	cmp/eq	r3,r0
	bf	.L06042FC2
	mov.l	.L06042FCC,r2
	mov.l	r2,@-r1
	add	#4,r1
.L06042FC2:
	bra	.L06042FF6
	mov.l	r0,@(36,r1)
.L06042FC6:
	.short 0x2000
.L06042FC8:
	.long 0x00010000
.L06042FCC:
	.long func_06042FD0
	endlabel func_06042FA8

	glabel func_06042FD0
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov.b	@(1,r2),r0
	cmp/pz	r0
	bt	.L06042FE8
	mov	#1,r0
	mov.b	r0,@(1,r2)
	mov.l	.L06042FE4,r0
	jmp	@r0
	nop
.L06042FE4:
	.long obj_free
.L06042FE8:
	sts.l	pr,@-r15
	mov	#32,r8
	mov.l	.L06043068,r0
	jsr	@r0
	shll16	r8
	cmp/pz	r0
	bt	.L060430D8
.L06042FF6:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06043094
	mov.l	.L0604306C,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06043070,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06043074,r13
	jsr	@r13
	mov.w	@(24,r1),r0
	mov.l	@(32,r1),r4
	mov.l	@(36,r1),r5
	mov.l	.L06043078,r14
	jsr	@r14
	mov	r4,r6
	mov.l	@(0,r1),r0
	jsr	@r0
	nop
	mov.l	.L0604306C,r0
	jsr	@r0
	nop
	mov.l	.L06043074,r13
	jsr	@r13
	mov.w	@(14,r1),r0
	mov.l	.L0604307C,r4
	xor	r5,r5
	mov.l	.L06043070,r0
	jsr	@r0
	xor	r6,r6
	mov.l	.L06043080,r2
	mov.l	.L06043084,r0
	jsr	@r0
	nop
	mov.l	.L06043088,r0
	jsr	@r0
	nop
	mov.w	@(14,r1),r0
	mov.l	.L06043074,r13
	jsr	@r13
	neg	r0,r0
	mov.l	.L0604308C,r4
	xor	r5,r5
	mov.l	.L06043070,r0
	jsr	@r0
	xor	r6,r6
	mov.l	.L06043090,r2
	mov.l	.L06043084,r0
	jsr	@r0
	nop
	mov.l	.L06043088,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L06043068:
	.long obj_find_near_player
.L0604306C:
	.long mtx_push
.L06043070:
	.long mtx_translate
.L06043074:
	.long mtx_rot_y
.L06043078:
	.long mtx_scale
.L0604307C:
	.long 0x001C0000
.L06043080:
	.long D_0608E808
.L06043084:
	.long poly_draw_model
.L06043088:
	.long mtx_pop
.L0604308C:
	.long 0xFFE40000
.L06043090:
	.long D_0608E7AC
.L06043094:
	mov.w	@(10,r1),r0
	mov	r0,r2
	mov.w	@(8,r1),r0
	add	r2,r0
	mov.l	r0,@-r15
	mov.l	.L060430D0,r13
	jsr	@r13
	mov.w	r0,@(8,r1)
	mov.l	.L060430D4,r0
	mov.l	@(12,r1),r5
	dmuls.l	r10,r0
	sts	mach,r10
	sts	macl,r0
	xtrct	r10,r0
	add	r0,r5
	mov.l	r5,@(52,r1)
	mov.l	@r15+,r0
	mov.l	.L060430D0,r13
	jsr	@r13
	shll2	r0
	mov.w	.L060430CC,r0
	dmuls.l	r10,r0
	sts	mach,r10
	sts	macl,r0
	xtrct	r10,r0
	lds.l	@r15+,pr
	rts
	mov.w	r0,@(14,r1)
.L060430CC:
	.short 0x5555
	.byte 0x00, 0x00
.L060430D0:
	.long math_sin
.L060430D4:
	.long 0x00200000
.L060430D8:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#28,r6
	mov.l	.L0604310C,r0
	jsr	@r0
	mov	#4,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@(4,r1),r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov	#2,r0
	mov.b	r0,@(1,r2)
	mov.l	.L06043110,r0
	jmp	@r0
	nop
.L0604310C:
	.long snd_seq_start
.L06043110:
	.long obj_free
	endlabel func_06042FD0

	glabel func_06043114
	sts.l	pr,@-r15
	mov.l	.L06043128,r2
	mov.l	.L0604312C,r0
	jsr	@r0
	nop
	mov.l	.L06043130,r2
	mov.l	.L06043134,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L06043128:
	.long D_0608D424
.L0604312C:
	.long poly_draw_model_color
.L06043130:
	.long D_0608D660
.L06043134:
	.long poly_draw_model
	endlabel func_06043114

	glabel func_06043138
	sts.l	pr,@-r15
	mov.l	.L0604315C,r2
	mov.l	.L06043160,r0
	jsr	@r0
	nop
	mov.l	.L06043164,r2
	mov.l	.L06043168,r0
	jsr	@r0
	nop
	mov.l	.L0604316C,r2
	mov.l	.L06043168,r0
	jsr	@r0
	nop
	mov.l	.L06043170,r2
	mov.l	.L06043168,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L0604315C:
	.long D_0608DD10
.L06043160:
	.long poly_draw_model_color
.L06043164:
	.long D_0608DDFC
.L06043168:
	.long poly_draw_model
.L0604316C:
	.long D_0608DE88
.L06043170:
	.long D_0608DF14
	endlabel func_06043138

	glabel func_06043174
	sts.l	pr,@-r15
	mov.l	.L06043188,r2
	mov.l	.L0604318C,r0
	jsr	@r0
	nop
	mov.l	.L06043190,r2
	mov.l	.L06043194,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L06043188:
	.long D_0608E534
.L0604318C:
	.long poly_draw_model_color
.L06043190:
	.long D_0608E620
.L06043194:
	.long poly_draw_model
	endlabel func_06043174

	glabel func_06043198
	mov.l	.L060431A4,r14
	mov.w	.L060431A0,r0
	rts
	mov.w	r0,@(12,r14)
.L060431A0:
	.short 0x0258
	.byte 0x00, 0x00
.L060431A4:
	.long play_state
	endlabel func_06043198

	glabel func_060431A8
	sts.l	pr,@-r15
	mov.l	.L060431BC,r2
	mov.l	.L060431C0,r0
	jsr	@r0
	nop
	mov.l	.L060431C4,r0
	lds.l	@r15+,pr
	rts
	mov.l	r0,@(12,r3)
	.byte 0x00, 0x00
.L060431BC:
	.long obj_list_effect
.L060431C0:
	.long obj_alloc
.L060431C4:
	.long D_060431D8
	endlabel func_060431A8

	glabel func_060431C8
	mov.l	.L060431D0,r14
	mov	#99,r0
	rts
	mov.b	r0,@(7,r14)
.L060431D0:
	.long play_state
	endlabel func_060431C8

	.section .data.060431D4,"aw",@progbits
	.p2align 2
	dlabel D_060431D4
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_060431D8
	.byte 0xC4, 0x14, 0xD3, 0x13, 0x40, 0x01, 0x40, 0x08, 0x03, 0x3E, 0x11, 0x3B, 0xD4, 0x11, 0x64, 0x42
	.byte 0x65, 0x41, 0x34, 0x5C, 0x11, 0x42, 0xE0, 0x04, 0x80, 0x1C, 0x90, 0x18, 0xD2, 0x0E, 0x22, 0x02
	.byte 0xD7, 0x0E, 0x67, 0x72, 0x52, 0x7C, 0x11, 0x2C, 0x53, 0x7D, 0x11, 0x3D, 0x54, 0x7E, 0x11, 0x4E
