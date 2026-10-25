	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06044790,"ax",@progbits
	.p2align 2

	glabel func_06044790
	sts.l	pr,@-r15
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L0604479C
	bra	.L060447BC
	nop
.L0604479C:
	mov.b	@(6,r1),r0
	mov.l	.L060447AC,r3
	shll	r0
	mov.w	@(r0,r3),r0
	add	r0,r3
	jmp	@r3
	nop
	.byte 0x00, 0x00
.L060447AC:
	.long D_060447B0
	dlabel D_060447B0
	.byte 0x01, 0x54, 0x01, 0xB0, 0x01, 0xD4, 0x02, 0x44, 0x02, 0x66, 0x02, 0xA4
.L060447BC:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L060447C8
	lds.l	@r15+,pr
	rts
	nop
.L060447C8:
	mov.l	.L060448C0,r0
	jsr	@r0
	nop
	mov.l	@(44,r1),r0
	cmp/pz	r0
	bf	.L06044832
	mov.l	.L060448C4,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	.L060448C8,r0
	mov.l	@(52,r1),r5
	mov.l	.L060448CC,r7
	add	r7,r5
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L060448C4,r0
	jsr	@r0
	nop
	mov.l	.L060448D0,r7
	mov.l	.L060448D4,r0
	mov.w	@(r0,r7),r0
	neg	r0,r0
	mov.l	.L060448D8,r14
	jsr	@r14
	nop
	mov.l	.L060448DC,r4
	mov.l	.L060448C8,r0
	mov.l	.L060448DC,r5
	mov.l	.L060448E0,r6
	jsr	@r0
	nop
	mov.w	@(22,r1),r0
	swap.b	r0,r0
	extu.w	r0,r0
	mov.l	.L060448E4,r14
	jsr	@r14
	mov	r0,r4
	mov	#3,r14
	mov.l	.L060448E8,r10
	jsr	@r10
	nop
	mov.w	.L060448B8,r0
	mov.w	r0,@(28,r1)
	mov.l	.L060448EC,r0
	jsr	@r0
	nop
	mov.l	.L060448F0,r0
	jsr	@r0
	nop
	mov.l	.L060448F0,r0
	jsr	@r0
	nop
.L06044832:
	mov.l	.L060448C4,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	.L060448C8,r0
	mov.l	@(52,r1),r5
	mov.l	.L060448CC,r7
	add	r7,r5
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	@(8,r1),r0
	mov	r0,r4
	mov	r0,r5
	mov	r0,r6
	mov.l	.L060448F4,r0
	jsr	@r0
	nop
	mov.l	.L060448F8,r4
	mov.l	@r4,r4
	mov.l	@(8,r4),r12
	mov.w	@(24,r1),r0
	mov	r0,r2
	mov.b	@(1,r12),r0
	tst	#1,r0
	bt	.L06044868
	mov.w	.L060448BA,r0
	add	r0,r2
.L06044868:
	mov	r2,r0
	mov.l	.L060448D8,r14
	jsr	@r14
	nop
	mov.l	.L060448C4,r0
	jsr	@r0
	nop
	mov.w	@(26,r1),r0
	mov.l	.L060448FC,r14
	jsr	@r14
	nop
	mov.w	.L060448BC,r0
	mov.w	r0,@(28,r1)
	mov	#64,r0
	mov.l	@(r0,r1),r2
	mov.l	.L06044900,r0
	jsr	@r0
	nop
	mov.l	.L060448F0,r0
	jsr	@r0
	nop
	mov.w	.L060448BE,r0
	mov.l	.L060448D8,r14
	jsr	@r14
	nop
	mov.w	@(26,r1),r0
	mov.l	.L060448FC,r14
	jsr	@r14
	nop
	mov	#64,r0
	mov.l	@(r0,r1),r2
	mov.l	.L06044900,r0
	jsr	@r0
	nop
	mov.l	.L060448F0,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L060448B8:
	.short 0x1FFC
.L060448BA:
	.short 0x4000
.L060448BC:
	.short 0xADB8
.L060448BE:
	.short 0x8000
.L060448C0:
	.long path_place_obj
.L060448C4:
	.long mtx_push
.L060448C8:
	.long mtx_translate
.L060448CC:
	.long 0xFFF00000
.L060448D0:
	.long camera
.L060448D4:
	.long D_060FFCC2
.L060448D8:
	.long mtx_rot_y
.L060448DC:
	.long 0x00000000
.L060448E0:
	.long 0xFFDE0000
.L060448E4:
	.long math_bin_to_bcd
.L060448E8:
	.long spr_build_number
.L060448EC:
	.long spr_draw_billboard_unscaled
.L060448F0:
	.long mtx_pop
.L060448F4:
	.long mtx_scale
.L060448F8:
	.long player_obj
.L060448FC:
	.long mtx_rot_z
.L06044900:
	.long poly_draw_model_color
	endlabel func_06044790

	glabel func_06044904
	sts.l	pr,@-r15
	mov.l	.L06044950,r0
	mov.l	.L06044954,r8
	jsr	@r0
	nop
	cmp/eq	#0,r0
	bf	.L06044948
	mov	#1,r0
	mov.b	r0,@(6,r1)
	mov.l	.L06044958,r7
	mov.w	@(14,r7),r0
	mov.w	r0,@(4,r1)
	mov.w	.L0604494C,r0
	mov.b	r0,@(13,r1)
	bsr	func_06044C48
	nop
	mov.b	@(6,r1),r0
	cmp/eq	#1,r0
	bf	.L06044948
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#70,r6
	mov.l	.L0604495C,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L06044948:
	bra	.L060447BC
	lds.l	@r15+,pr
.L0604494C:
	.short 0x00FF
	.byte 0x00, 0x00
.L06044950:
	.long obj_find_near_player
.L06044954:
	.long 0x00360000
.L06044958:
	.long play_state
.L0604495C:
	.long snd_seq_start
	.byte 0x84, 0x1D, 0x40, 0x10, 0x80, 0x1D, 0x8B, 0x21, 0xE0, 0x00, 0x80, 0x1F, 0xD0, 0x03, 0x11, 0x08
	.byte 0xD0, 0x03, 0x11, 0x09, 0xE0, 0x04, 0x80, 0x16, 0xAF, 0x20, 0x00, 0x09, 0xFF, 0xFC, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0xD7, 0x06, 0x84, 0x72, 0x88, 0x00, 0x8B, 0x0F, 0xE0, 0x00, 0x80, 0x1F
	.byte 0xD0, 0x04, 0x11, 0x08, 0xD0, 0x04, 0x11, 0x09, 0xE0, 0x04, 0x80, 0x16, 0xAF, 0x0E, 0x00, 0x09
	.long play_state
	.byte 0xFF, 0xFC, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0xB1, 0xA2, 0x00, 0x09, 0xD7, 0x0E, 0x85, 0x77
	.byte 0x62, 0x03, 0x85, 0x12, 0x32, 0x00, 0x89, 0x19, 0x32, 0x08, 0x85, 0x77, 0x81, 0x12, 0x42, 0x15
	.byte 0x8B, 0x14, 0x85, 0x1B, 0x60, 0x08, 0x60, 0x0C, 0x30, 0x28, 0x40, 0x15, 0x40, 0x18, 0x81, 0x1B
	.byte 0xE0, 0x02, 0x80, 0x16, 0x89, 0x0A, 0x90, 0x06, 0x81, 0x1B, 0xE0, 0x00, 0x80, 0x1F, 0xE0, 0x03
	.byte 0x80, 0x16, 0xAE, 0xE9, 0x00, 0x09, 0x00, 0x00
	.long play_state
	.byte 0xAE, 0xE4, 0x00, 0x09, 0xB1, 0x7E, 0x00, 0x09, 0x85, 0x1D, 0x92, 0x0A, 0x30, 0x2C, 0x81, 0x1D
	.byte 0x92, 0x08, 0x32, 0x03, 0x8B, 0x03, 0x60, 0x23, 0x81, 0x1D, 0xE0, 0x05, 0x80, 0x16, 0xAE, 0xD5
	.byte 0x00, 0x09, 0xF8, 0x00, 0xCA, 0xAB, 0xD0, 0x0B, 0x52, 0x1F, 0x32, 0x0C, 0x11, 0x2F, 0xD0, 0x0A
	.byte 0x52, 0x1D, 0x32, 0x0C, 0x11, 0x2D, 0x84, 0x1F, 0x70, 0x01, 0x80, 0x1F, 0x88, 0x28, 0x8B, 0x0F
	.byte 0x4F, 0x26, 0xE0, 0xF8, 0x02, 0x1E, 0x22, 0x28, 0x89, 0x01, 0xE0, 0xFE, 0x80, 0x21, 0xD0, 0x03
	.byte 0x40, 0x2B, 0x00, 0x09, 0x00, 0x02, 0x00, 0x00, 0xFF, 0xFE, 0x00, 0x00
	.long obj_free
	.byte 0xAE, 0xB4, 0x00, 0x09
	endlabel func_06044904

	glabel func_06044A54
	sts.l	pr,@-r15
	bsr	func_06044CF4
	nop
	mov.b	@(15,r1),r0
	add	#1,r0
	mov.b	r0,@(15,r1)
	mov.l	.L06044A74,r2
.L06044A62:
	mov.l	@r2+,r8
	cmp/pz	r8
	bf	.L06044A7E
	cmp/eq	r8,r0
	bt	.L06044A78
	add	#4,r2
	bra	.L06044A62
	add	#4,r8
	.byte 0x00, 0x00
.L06044A74:
	.long D_06044A84
.L06044A78:
	mov.l	@r2+,r2
	jsr	@r2
	nop
.L06044A7E:
	lds.l	@r15+,pr
	bra	.L060447BC
	nop
	dlabel D_06044A84
	.byte 0x00, 0x00, 0x00, 0x01
	.long func_06044AB0
	.byte 0x00, 0x00, 0x00, 0x0C
	.long func_06044B4C
	.byte 0x00, 0x00, 0x00, 0x17
	.long func_06044BE0
	.byte 0x00, 0x00, 0x00, 0x46
	.long func_06044C28
	.byte 0x00, 0x00, 0x00, 0x47
	.long func_06044C2E
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	endlabel func_06044A54

	glabel func_06044AB0
	sts.l	pr,@-r15
	mov.l	.L06044ACC,r2
	mov.l	.L06044AD0,r0
	jsr	@r0
	nop
	mov.l	.L06044AD4,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	bsr	func_06044D80
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06044ACC:
	.long obj_list_effect
.L06044AD0:
	.long obj_alloc
.L06044AD4:
	.long func_06044AD8
	endlabel func_06044AB0

	glabel func_06044AD8
	mov	#64,r0
	mov.l	.L06044AE8,r2
	mov.l	r2,@(r0,r1)
	mov.l	.L06044AEC,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L06044AE8:
	.long D_0608A908
.L06044AEC:
	.long func_06044AF0
	endlabel func_06044AD8

	glabel func_06044AF0
	mov.l	@(0,r1),r3
	mov.b	@(14,r3),r0
	tst	r0,r0
	bt	.L06044B18
	mov.l	.L06044B10,r0
	mov.l	r0,@(0,r1)
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	tst	r2,r2
	bt	.L06044B08
	mov	#-2,r0
	mov.b	r0,@(1,r2)
.L06044B08:
	mov.l	.L06044B14,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06044B10:
	.long 0x00000000
.L06044B14:
	.long obj_free
.L06044B18:
	sts.l	pr,@-r15
	bsr	func_06044D5C
	nop
	mov.l	@(8,r1),r0
	mov.l	.L06044B34,r2
	cmp/eq	r0,r2
	bt	.L06044B3C
	bsr	func_06044DC0
	nop
	mov.l	.L06044B38,r0
	jsr	@r0
	nop
	bra	.L06044832
	nop
.L06044B34:
	.long 0x0000CCCC
.L06044B38:
	.long path_place_obj
.L06044B3C:
	mov.w	.L06044B44,r3
	mov.l	.L06044B48,r0
	jmp	@r0
	nop
.L06044B44:
	.short 0xD556
	.byte 0x00, 0x00
.L06044B48:
	.long func_06044DD6
	endlabel func_06044AF0

	glabel func_06044B4C
	sts.l	pr,@-r15
	mov.l	.L06044B68,r2
	mov.l	.L06044B6C,r0
	jsr	@r0
	nop
	mov.l	.L06044B70,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	bsr	func_06044D80
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06044B68:
	.long obj_list_effect
.L06044B6C:
	.long obj_alloc
.L06044B70:
	.long func_06044B74
	endlabel func_06044B4C

	glabel func_06044B74
	mov	#64,r0
	mov.l	.L06044B84,r2
	mov.l	r2,@(r0,r1)
	mov.l	.L06044B88,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L06044B84:
	.long D_0608A91C
.L06044B88:
	.long func_06044B8C
	endlabel func_06044B74

	glabel func_06044B8C
	mov.l	@(0,r1),r3
	mov.b	@(14,r3),r0
	tst	r0,r0
	bt	.L06044BAC
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	tst	r2,r2
	bt	.L06044BA0
	mov	#-2,r0
	mov.b	r0,@(1,r2)
.L06044BA0:
	mov.l	.L06044BA8,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06044BA8:
	.long obj_free
.L06044BAC:
	sts.l	pr,@-r15
	bsr	func_06044D5C
	nop
	mov.l	@(8,r1),r0
	mov.l	.L06044BC8,r2
	cmp/eq	r0,r2
	bt	.L06044BD0
	bsr	func_06044DC0
	nop
	mov.l	.L06044BCC,r0
	jsr	@r0
	nop
	bra	.L06044832
	nop
.L06044BC8:
	.long 0x00009999
.L06044BCC:
	.long path_place_obj
.L06044BD0:
	mov.w	.L06044BD8,r3
	mov.l	.L06044BDC,r0
	jmp	@r0
	nop
.L06044BD8:
	.short 0xE000
	.byte 0x00, 0x00
.L06044BDC:
	.long func_06044DD6
	endlabel func_06044B8C

	glabel func_06044BE0
	sts.l	pr,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#71,r6
	mov.l	.L06044C1C,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.w	.L06044C1A,r0
	mov	#1,r9
	mov.l	.L06044C20,r3
	jsr	@r3
	mov	#0,r6
	mov	r1,r9
	mov	#50,r10
	mov.l	.L06044C24,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06044C1A:
	.short 0x03E8
.L06044C1C:
	.long snd_seq_start
.L06044C20:
	.long func_0601A27C
.L06044C24:
	.long func_06041A70
	endlabel func_06044BE0

	glabel func_06044C28
	mov	#1,r0
	rts
	mov.b	r0,@(14,r1)
	endlabel func_06044C28

	glabel func_06044C2E
	lds.l	@r15+,pr
	lds.l	@r15+,pr
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	tst	r2,r2
	bt	.L06044C3E
	mov	#-2,r0
	mov.b	r0,@(1,r2)
.L06044C3E:
	mov.l	.L06044C44,r0
	jmp	@r0
	nop
.L06044C44:
	.long obj_free
	endlabel func_06044C2E

	glabel func_06044C48
	sts.l	pr,@-r15
	mov.l	.L06044C60,r0
	jsr	@r0
	nop
	mov	r0,r4
	mov.l	.L06044C64,r2
	cmp/eq	r2,r0
	bf	.L06044C68
	mov	#0,r0
	mov.b	r0,@(6,r1)
	bra	.L06044C8E
	nop
.L06044C60:
	.long func_06018D60
.L06044C64:
	.long 0x7FFFFFFF
.L06044C68:
	cmp/pz	r0
	bt	.L06044C6E
	neg	r0,r0
.L06044C6E:
	mov	r0,r2
	mov	#32,r0
	mov.l	r2,@(r0,r1)
	mov.l	.L06044C94,r2
	mov.l	@r2,r2
	mov.l	@(52,r1),r3
	mov.l	@(52,r2),r5
	sub	r3,r5
	cmp/pz	r5
	bt	.L06044C84
	neg	r5,r5
.L06044C84:
	mov	#36,r0
	mov.l	r5,@(r0,r1)
	mov	#31,r0
	mov.b	@(r0,r2),r3
	mov.b	r3,@(r0,r1)
.L06044C8E:
	lds.l	@r15+,pr
	rts
	nop
.L06044C94:
	.long player_obj
	endlabel func_06044C48

	glabel func_06044C98
	sts.l	pr,@-r15
	mov.l	.L06044CDC,r12
	mov.b	@(0,r12),r0
	cmp/eq	#20,r0
	bt	.L06044CD4
	mov	#32,r0
	mov.l	@(r0,r1),r2
	mov.l	.L06044CE0,r4
	cmp/ge	r4,r2
	bt	.L06044CB0
	mov.l	.L06044CE4,r3
	add	r3,r2
.L06044CB0:
	mov.l	r2,@(r0,r1)
	mov	#36,r0
	mov.l	@(r0,r1),r5
	mov.l	.L06044CE8,r4
	cmp/ge	r4,r5
	bt	.L06044CC0
	mov.l	.L06044CE4,r3
	add	r3,r5
.L06044CC0:
	mov.l	r5,@(r0,r1)
	mov	#40,r0
	mov.l	@(r0,r1),r6
	mov.l	.L06044CEC,r4
	add	r4,r6
	mov.l	.L06044CF0,r4
	cmp/ge	r4,r6
	bf	.L06044CD2
	mov	r4,r6
.L06044CD2:
	mov.l	r6,@(r0,r1)
.L06044CD4:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06044CDC:
	.long player_obj
.L06044CE0:
	.long 0x00400000
.L06044CE4:
	.long 0x00080000
.L06044CE8:
	.long 0x00200000
.L06044CEC:
	.long 0x00000100
.L06044CF0:
	.long 0x00008000
	endlabel func_06044C98

	glabel func_06044CF4
	sts.l	pr,@-r15
	bsr	func_06044C98
	nop
	mov.l	.L06044D4C,r2
	mov.l	@r2,r2
	mov	#31,r0
	mov.b	@(r0,r2),r3
	mov.b	r3,@(r0,r1)
	mov	#40,r0
	mov.l	@(r0,r1),r6
	mov	r6,r0
	mov.l	.L06044D50,r13
	jsr	@r13
	nop
	mov	r10,r11
	shll2	r11
	mov	r6,r0
	mov.l	.L06044D54,r13
	jsr	@r13
	nop
	shll2	r10
	mov	#32,r0
	mov.l	@(r0,r1),r0
	dmuls.l	r11,r0
	sts	mach,r11
	sts	macl,r0
	xtrct	r11,r0
	mov.l	.L06044D58,r4
	mov.l	@(60,r2),r3
	add	r0,r3
	add	r4,r3
	mov.l	r3,@(60,r1)
	mov	#36,r0
	mov.l	@(r0,r1),r5
	dmuls.l	r10,r5
	sts	mach,r10
	sts	macl,r5
	xtrct	r10,r5
	mov.l	@(52,r2),r3
	add	r5,r3
	mov.l	r3,@(52,r1)
	lds.l	@r15+,pr
	rts
	nop
.L06044D4C:
	.long player_obj
.L06044D50:
	.long math_sin
.L06044D54:
	.long math_cos
.L06044D58:
	.long 0x00200000
	endlabel func_06044CF4

	glabel func_06044D5C
	mov.l	@(0,r1),r3
	mov.l	@(60,r3),r0
	mov.l	r0,@(60,r1)
	mov.l	@(48,r3),r0
	mov.l	r0,@(48,r1)
	mov.l	@(52,r3),r0
	mov.l	r0,@(52,r1)
	mov.l	@(56,r3),r0
	mov.l	r0,@(56,r1)
	mov.l	@(32,r3),r0
	mov.l	r0,@(32,r1)
	mov.l	@(36,r3),r0
	mov.l	r0,@(36,r1)
	mov	#31,r0
	mov.b	@(r0,r3),r2
	mov.b	r2,@(r0,r3)
	rts
	nop
	endlabel func_06044D5C

	glabel func_06044D80
	mov.l	r1,@(0,r3)
	mov.l	.L06044DB4,r0
	mov.l	r0,@(44,r1)
	mov.l	r0,@(44,r3)
	mov.l	@(60,r1),r0
	mov.l	r0,@(60,r3)
	mov.l	@(48,r1),r0
	mov.l	r0,@(48,r3)
	mov.l	@(52,r1),r0
	mov.l	.L06044DB8,r2
	add	r2,r0
	mov.l	r0,@(52,r3)
	mov.l	@(56,r1),r0
	mov.l	r0,@(56,r3)
	mov.w	.L06044DB0,r0
	mov.w	r0,@(26,r3)
	mov.b	r0,@(13,r3)
	mov	#31,r0
	mov.b	@(r0,r1),r2
	mov.b	r2,@(r0,r3)
	mov.l	.L06044DBC,r0
	mov.l	r0,@(8,r3)
	rts
	nop
.L06044DB0:
	.short 0x0000
	.byte 0x00, 0x00
.L06044DB4:
	.long 0xFFFFFFFF
.L06044DB8:
	.long 0x00005000
.L06044DBC:
	.long 0x00000010
	endlabel func_06044D80

	glabel func_06044DC0
	mov.l	@(8,r1),r0
	shll2	r0
	shll2	r0
	cmp/ge	r0,r2
	bt	.L06044DD0
	mov	#1,r0
	mov.b	r0,@(13,r1)
	mov	r2,r0
.L06044DD0:
	mov.l	r0,@(8,r1)
	rts
	mov	r3,r0
	endlabel func_06044DC0

	glabel func_06044DD6
	mov.w	@(26,r1),r0
	mov.w	.L06044DEA,r2
	add	r2,r0
	mov.w	r0,@(26,r1)
	cmp/ge	r0,r3
	bf	.L06044DE6
	mov	r3,r0
	mov.w	r0,@(26,r1)
.L06044DE6:
	bra	.L060447BC
	nop
.L06044DEA:
	.short 0xF800
	endlabel func_06044DD6

	glabel func_06044DEC
	sts.l	pr,@-r15
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#240,r0
	ldc	r0,sr
	mov	#0,r0
	mov.w	r0,@(116,gbr)
	mov.w	r0,@(118,gbr)
	mov.b	r0,@(110,gbr)
	mov.b	r0,@(60,gbr)
	mov.b	r0,@(39,gbr)
	mov.b	r0,@(148,gbr)
	mov.b	r0,@(60,gbr)
	mov.b	r0,@(63,gbr)
	mov.b	r0,@(107,gbr)
	mov.l	.L06044F18,r2
	mov.w	r0,@r2
	mov.l	.L06044F1C,r0
	jsr	@r0
	nop
	mov.l	.L06044F20,r2
	mov	#0,r0
	mov.w	r0,@r2
	mov.w	.L06044F0E,r8
	mov.w	@(28,gbr),r0
	tst	#16,r0
	bt	.L06044E2A
	shlr2	r8
.L06044E2A:
	mov	r8,r0
	mov.w	r0,@(2,r2)
	mov.l	.L06044F24,r0
	jsr	@r0
	nop
	mov.l	.L06044F28,r14
	jsr	@r14
	nop
	mov	#0,r0
	mov.b	r0,@(61,gbr)
	mov.l	.L06044F2C,r0
	jsr	@r0
	nop
	mov.l	.L06044F30,r0
	jsr	@r0
	nop
	mov.l	.L06044F34,r3
	mov.l	.L06044F38,r0
	jsr	@r0
	nop
	mov	#0,r0
	mov.b	r0,@(20,gbr)
	mov.l	.L06044F3C,r0
	jsr	@r0
	nop
	mov.l	.L06044F40,r0
	jsr	@r0
	nop
	mov.l	.L06044F44,r0
	jsr	@r0
	nop
	mov.l	.L06044F48,r0
	mov.l	r0,@(784,gbr)
	mov.l	.L06044F48,r0
	mov.l	r0,@(788,gbr)
	mov.w	.L06044F10,r0
	mov.w	r0,@(136,gbr)
	mov.w	.L06044F12,r0
	mov.w	r0,@(138,gbr)
	mov.l	.L06044F4C,r0
	jsr	@r0
	nop
	mov.l	.L06044F50,r14
	jsr	@r14
	nop
	mov.l	.L06044F54,r2
	mov.l	.L06044F58,r0
	jsr	@r0
	nop
	mov.l	.L06044F5C,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mova	.L06044F74,r0
	mov	r0,r4
	mov.l	.L06044F60,r5
	mov.l	.L06044F64,r6
	mov	#-128,r3
	mov	#-116,r1
	shll2	r1
.L06044EA0:
	mov.l	@(12,r3),r0
	and	#3,r0
	cmp/eq	#1,r0
	bt	.L06044EA0
	mov.l	@(48,r3),r0
	mov	#0,r0
	mov.l	r0,@(12,r3)
	mov.b	r0,@r1
	mov.l	r4,@(0,r3)
	mov.l	r5,@(4,r3)
	mov.l	r6,@(8,r3)
	mov.w	.L06044F78,r0
	mov.l	r0,@(12,r3)
	mov	#9,r0
	mov.l	r0,@(48,r3)
	mov	#-128,r1
.L06044EC0:
	mov.l	@(12,r1),r0
	and	#3,r0
	cmp/eq	#1,r0
	bt	.L06044EC0
	mov.l	.L06044F68,r5
	mov.l	.L06044F6C,r0
	mov.w	.L06044F14,r6
	mov	r0,r2
	mov	#-112,r3
	mov	#-116,r1
	shll2	r1
.L06044ED6:
	mov.l	@(12,r3),r0
	and	#3,r0
	cmp/eq	#1,r0
	bt	.L06044ED6
	mov.l	@(32,r3),r0
	mov	#0,r0
	mov.l	r0,@(12,r3)
	mov.b	r0,@r1
	mov.l	r2,@(0,r3)
	mov.l	r5,@(4,r3)
	mov.l	r6,@(8,r3)
	mov.w	.L06044F76,r0
	mov.l	r0,@(12,r3)
	mov	#9,r0
	mov.l	r0,@(32,r3)
	mov	#-112,r1
.L06044EF6:
	mov.l	@(12,r1),r0
	and	#3,r0
	cmp/eq	#1,r0
	bt	.L06044EF6
	mov	#6,r4
	mov.l	.L06044F70,r0
	mov.b	@(r0,r4),r4
	mov.w	@(224,gbr),r0
	or	r4,r0
	mov.w	r0,@(224,gbr)
	bra	.L06044F7A
	nop
.L06044F0E:
	.short 0x0384
.L06044F10:
	.short 0x0080
.L06044F12:
	.short 0x1000
.L06044F14:
	.short 0x0090
	.byte 0x00, 0x00
.L06044F18:
	.long soft_reset_allowed
.L06044F1C:
	.long func_0600454C
.L06044F20:
	.long D_060D9074
.L06044F24:
	.long func_0602B94A
.L06044F28:
	.long snd_init_stage
.L06044F2C:
	.long cd_pause
.L06044F30:
	.long load_title_data
.L06044F34:
	.long 0x00019800
.L06044F38:
	.long func_0601EC94
.L06044F3C:
	.long func_0601EB14
.L06044F40:
	.long vdp1_cmdlist_begin
.L06044F44:
	.long vdp1_cmdlist_end
.L06044F48:
	.long BIOS_WORK
.L06044F4C:
	.long obj_init
.L06044F50:
	.long vdp_init_palette_gouraud
.L06044F54:
	.long obj_list_core
.L06044F58:
	.long obj_alloc
.L06044F5C:
	.long func_060458E0
.L06044F60:
	.long VDP2_VRAM
.L06044F64:
	.long 0x00040000
.L06044F68:
	.long vdp2_shadow
.L06044F6C:
	.long vdp2_shadow_defaults
.L06044F70:
	.long lbl_0602B7E4
.L06044F74:
	.byte 0x00, 0x00
.L06044F76:
	.short 0x5601
.L06044F78:
	.short 0x4601
.L06044F7A:
	mov.w	.L06044FD4,r0
	mov.w	r0,@(500,gbr)
	mov.w	r0,@(502,gbr)
	mov.w	r0,@(504,gbr)
	mov.l	.L06044FD8,r4
	mov.l	.L06044FDC,r5
	mov.w	.L06044FD6,r6
.L06044F88:
	mov.l	@r4+,r7
	add	#4,r5
	mov.l	r7,@r5
	dt	r6
	bf	.L06044F88
	mov.l	.L06044FE0,r0
	jsr	@r0
	nop
	mov.l	.L06044FE4,r0
	jsr	@r0
	nop
	mov.l	.L06044FE8,r2
	mov.l	.L06044FEC,r3
	mov.l	.L06044FF0,r7
	shar	r7
.L06044FA6:
	mov.w	@r2+,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L06044FA6
	add	#2,r3
	mov.l	.L06044FF4,r3
	mov	#16,r7
.L06044FB4:
	mov.w	@r2+,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L06044FB4
	add	#2,r3
	mov.l	.L06044FF8,r2
.L06044FC0:
	mov.l	@r2+,r5
	cmp/pz	r5
	bf	.L06045000
	mov.l	@r2+,r4
	mov.l	@r2+,r6
	mov.l	.L06044FFC,r14
	jsr	@r14
	nop
	bra	.L06044FC0
	nop
.L06044FD4:
	.short 0xFF01
.L06044FD6:
	.short 0x0300
.L06044FD8:
	.long D_0602D914
.L06044FDC:
	.long VDP2_VRAM + 0x503FC
.L06044FE0:
	.long func_06004348
.L06044FE4:
	.long func_0602B960
.L06044FE8:
	.long D_060452B4
.L06044FEC:
	.long vdp2_ramctl
.L06044FF0:
	.long 0x00000052
.L06044FF4:
	.long vdp2_prisa
.L06044FF8:
	.long D_06045328
.L06044FFC:
	.long func_06045100
.L06045000:
	mov.l	.L06045020,r8
	mov.l	@r2+,r5
	cmp/pz	r5
	bf	.L06045024
	mov.l	@r2+,r4
	mov.l	@r2+,r6
	shar	r6
.L0604500E:
	mov.l	@r4+,r0
	or	r8,r0
	mov.l	r0,@r5
	dt	r6
	bf/s	.L0604500E
	add	#4,r5
	bra	.L06045000
	nop
	.byte 0x00, 0x00
.L06045020:
	.long 0x80008000
.L06045024:
	mov.l	@r2+,r0
	jsr	@r0
	nop
	mov.l	.L060450C0,r0
	jsr	@r0
	nop
	mov.l	.L060450C4,r0
	jsr	@r0
	nop
	mov.l	.L060450C8,r2
	mov.l	.L060450CC,r0
	jsr	@r0
	nop
	mov.l	.L060450D0,r0
	mov.l	r0,@(12,r3)
	mov.w	.L060450B4,r0
	mov.w	r0,@(460,gbr)
	mov	#0,r0
	mov.b	r0,@(20,gbr)
	mov.b	r0,@(30,gbr)
	mov.b	r0,@(31,gbr)
	mov.l	.L060450D4,r0
	jsr	@r0
	nop
	mov.l	.L060450D8,r0
	jsr	@r0
	nop
	mov.l	.L060450DC,r0
	mov.l	r0,@(544,gbr)
	mov.l	.L060450E0,r0
	mov.l	r0,@(548,gbr)
	mov.l	.L060450E4,r0
	mov.l	r0,@(784,gbr)
	mov.l	.L060450E4,r0
	mov.l	r0,@(788,gbr)
	mov.w	.L060450B6,r0
	mov.w	r0,@(136,gbr)
	mov.w	.L060450B8,r0
	mov.w	r0,@(138,gbr)
	mov.w	.L060450BA,r0
	mov.w	r0,@(140,gbr)
	mov.w	.L060450BA,r0
	mov.w	r0,@(146,gbr)
	mov.w	.L060450BA,r0
	mov.w	r0,@(144,gbr)
	mov.w	.L060450BA,r0
	mov.w	r0,@(142,gbr)
	mov	#3,r0
	mov.b	r0,@(0,gbr)
	mov.l	.L060450E8,r2
	mov	#0,r0
	mov.w	.L060450BC,r7
.L0604508C:
	mov.l	r0,@r2
	dt	r7
	bf/s	.L0604508C
	add	#4,r2
	mov.w	@(28,gbr),r0
	tst	#4,r0
	bf	.L0604509A
.L0604509A:
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#0,r0
	ldc	r0,sr
	mov.l	.L060450EC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L060450B4:
	.short 0x0040
.L060450B6:
	.short 0x0140
.L060450B8:
	.short 0x0555
.L060450BA:
	.short 0x0000
.L060450BC:
	.short 0x0400
	.byte 0x00, 0x00
.L060450C0:
	.long func_0602C390
.L060450C4:
	.long func_0602C4D0
.L060450C8:
	.long obj_list_stage
.L060450CC:
	.long obj_alloc
.L060450D0:
	.long func_06032F74
.L060450D4:
	.long mtx_init
.L060450D8:
	.long mtx_push_identity
.L060450DC:
	.long func_060450F0
.L060450E0:
	.long func_060450FC
.L060450E4:
	.long 0x03000000
.L060450E8:
	.long VDP2_CRAM
.L060450EC:
	.long func_0602B93E
	endlabel func_06044DEC

	glabel func_060450F0
	mov	#1,r4
	mov.l	.L060450F8,r5
	rts
	shll16	r5
.L060450F8:
	.long 0x00001E00
	endlabel func_060450F0

	glabel func_060450FC
	rts
	mov	#1,r4
	endlabel func_060450FC

	glabel func_06045100
	mov.b	@r4+,r0
	mov.b	r0,@r5
	dt	r6
	bf/s	func_06045100
	add	#1,r5
	rts
	nop
	endlabel func_06045100

	glabel func_0604510E
	sts.l	pr,@-r15
	mov.l	.L0604512C,r0
	jsr	@r0
	nop
	mov.l	.L06045130,r0
	jsr	@r0
	nop
.L0604511C:
	mov.b	@(111,gbr),r0
	tst	r0,r0
	bt	.L06045134
	mov.l	.L06045130,r0
	jsr	@r0
	nop
	bra	.L0604511C
	nop
.L0604512C:
	.long func_0602FD1C
.L06045130:
	.long sys_wait_vblank
.L06045134:
	mov.b	@(109,gbr),r0
	add	#1,r0
	mov	#4,r8
	cmp/gt	r8,r0
	bf	.L06045140
	mov	#0,r0
.L06045140:
	mov.b	r0,@(109,gbr)
	mov	#0,r0
	mov.b	r0,@(110,gbr)
	bsr	func_0604517C
	nop
	mov.l	.L06045170,r0
	jsr	@r0
	nop
	mov.l	.L06045174,r0
	jsr	@r0
	nop
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06045164
	mov	#1,r0
	mov.b	r0,@(110,gbr)
	bsr	func_0604517C
	nop
.L06045164:
	mov.l	.L06045178,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06045170:
	.long func_0602F23E
.L06045174:
	.long func_0602FD1C
.L06045178:
	.long sys_wait_vblank
	endlabel func_0604510E

	glabel func_0604517C
	sts.l	pr,@-r15
	mov	#-1,r0
	mov.l	r0,@(728,gbr)
	mov.l	.L06045260,r0
	jsr	@r0
	nop
	mov.l	.L06045264,r4
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06045192
	mov.l	.L06045268,r4
.L06045192:
	mov.w	@r4,r0
	mov.l	.L0604526C,r4
	mov.w	r0,@r4
	mov.l	.L06045270,r4
	mov.w	r0,@r4
	mov.l	.L06045274,r4
	mov.w	r0,@r4
	mov.l	.L06045278,r4
	mov.w	r0,@r4
	mov.l	.L0604527C,r4
	mov.w	r0,@r4
	mov.l	.L06045280,r4
	mov.w	r0,@r4
	mov.l	.L06045284,r4
	mov.w	r0,@r4
	mov.l	.L06045288,r4
	mov.w	r0,@r4
	mov.l	.L0604528C,r0
	jsr	@r0
	nop
	mov.l	.L06045290,r2
	mov.l	.L06045294,r0
	jsr	@r0
	nop
	mov.l	.L06045298,r2
	mov.l	.L06045294,r0
	jsr	@r0
	nop
	mov.l	.L0604529C,r2
	mov.l	.L06045294,r0
	jsr	@r0
	nop
	mov.l	.L060452A0,r2
	mov.l	.L06045294,r0
	jsr	@r0
	nop
	mov.l	.L060452A4,r2
	mov.l	.L06045294,r0
	jsr	@r0
	nop
	mov.l	@(12,gbr),r0
	add	#1,r0
	mov.l	r0,@(12,gbr)
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L060451F8
	mov.l	.L060452A8,r0
	jsr	@r0
	nop
	mov	#-1,r0
	mov.b	r0,@(62,gbr)
.L060451F8:
	lds.l	@r15+,pr
.L060451FA:
	rts
.L060451FC:
	nop
	endlabel func_0604517C

	glabel func_060451FE
	sts.l	pr,@-r15
	mov.l	.L060452AC,r0
	jsr	@r0
	nop
	mov.l	.L060452B0,r0
	jsr	@r0
	nop
	mov	#-1,r0
	mov.l	r0,@(728,gbr)
	mov.l	.L06045260,r0
	jsr	@r0
	nop
	mov.l	@(12,gbr),r0
	add	#1,r0
	mov.l	r0,@(12,gbr)
	mov	#0,r0
	mov.b	r0,@(110,gbr)
	mov.l	.L0604528C,r0
	jsr	@r0
	nop
	mov.l	.L06045290,r2
	mov.l	.L06045294,r0
	jsr	@r0
	nop
	mov.l	.L06045298,r2
	mov.l	.L06045294,r0
	jsr	@r0
	nop
	mov.l	.L0604529C,r2
	mov.l	.L06045294,r0
	jsr	@r0
	nop
	mov.l	.L060452A0,r2
	mov.l	.L06045294,r0
	jsr	@r0
	nop
	mov.l	.L060452A4,r2
	mov.l	.L06045294,r0
	jsr	@r0
	nop
	mov.l	.L060452A8,r0
	jsr	@r0
	nop
	mov	#-1,r0
	mov.b	r0,@(62,gbr)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06045260:
	.long snd_cmd_flush
.L06045264:
	.long .L060451FC
.L06045268:
	.long .L060451FA
.L0604526C:
	.long poly_draw_model
.L06045270:
	.long poly_draw_model_color
.L06045274:
	.long D_0601F4AE
.L06045278:
	.long func_060213DA
.L0604527C:
	.long func_06020578
.L06045280:
	.long spr_draw_obj
.L06045284:
	.long spr_draw_billboard_unscaled
.L06045288:
	.long spr_draw_billboard
.L0604528C:
	.long vdp1_cmdlist_begin
.L06045290:
	.long obj_list_core
.L06045294:
	.long obj_run_list
.L06045298:
	.long obj_list_manager
.L0604529C:
	.long obj_list_stage
.L060452A0:
	.long obj_list_effect
.L060452A4:
	.long obj_list_pause
.L060452A8:
	.long vdp1_cmdlist_end
.L060452AC:
	.long func_0602FD1C
.L060452B0:
	.long sys_wait_vblank
	endlabel func_060451FE

	.section .data.060452B4,"aw",@progbits
	.p2align 2
	dlabel D_060452B4
	.byte 0x13, 0x8C, 0x55, 0xFF, 0xFF, 0xFF, 0x55, 0xFF, 0xFF, 0xFF, 0x12, 0x6F, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0x10, 0x11, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0xC0, 0x00, 0xC0, 0x00, 0x80, 0x0A, 0x80, 0x40, 0x40, 0x00, 0x00, 0x04, 0x00, 0x20
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x30, 0x30, 0x30, 0x2E, 0x2D, 0x2D, 0x2D, 0x3A, 0x3A
	.byte 0x3A, 0x3A, 0x20, 0x20, 0x20, 0x20, 0x21, 0x21, 0x21, 0x21, 0x22, 0x22, 0x22, 0x22, 0x23, 0x23
	.byte 0x23, 0x23, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x03, 0x03, 0x07, 0x07, 0x00, 0x01
	.byte 0x00, 0x00, 0x10, 0x07, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x09
	dlabel D_06045328
	.long VDP2_VRAM + 0x2000
	.byte 0x00, 0x20, 0x11, 0x0C, 0x00, 0x02, 0xB5, 0x00
	.long VDP2_VRAM + 0x51000
	.byte 0x00, 0x29, 0x35, 0x9C, 0x00, 0x00, 0x0D, 0x00
	.long VDP2_VRAM + 0x51D00
	.byte 0x00, 0x29, 0x00, 0x34, 0x00, 0x00, 0x16, 0x00
	.long VDP2_VRAM + 0x54A00
	.byte 0x00, 0x29, 0x55, 0x1C, 0x00, 0x00, 0x35, 0x80
	.long D_060D9080
	.byte 0x00, 0x20, 0x10, 0x04, 0x00, 0x00, 0x00, 0x28
	.long D_060D90A8
	.byte 0x00, 0x20, 0x10, 0x2C, 0x00, 0x00, 0x00, 0x28
	.long D_060D90D0
	.byte 0x00, 0x20, 0x10, 0x54, 0x00, 0x00, 0x00, 0x28
	.long D_060D90F8
	.byte 0x00, 0x20, 0x10, 0x7C, 0x00, 0x00, 0x00, 0x28
	.long D_060D9120
	.byte 0x00, 0x20, 0x10, 0xD8, 0x00, 0x00, 0x00, 0x34
	.long D_060D9154
	.byte 0x00, 0x20, 0x10, 0xA4, 0x00, 0x00, 0x00, 0x34
	.long D_060D9188
	.byte 0x00, 0x22, 0xCE, 0xFC, 0x00, 0x00, 0x03, 0x64, 0xFF, 0xFF, 0xFF, 0xFF
	.long D_060CA020
	.byte 0x00, 0x29, 0x42, 0x9C, 0x00, 0x00, 0x00, 0x30
	.long D_060CA080
	.long D_0601CF2C
	.byte 0x00, 0x00, 0x00, 0x10
	.long D_060CA0A0
	.byte 0x00, 0x29, 0x4A, 0xFC, 0x00, 0x00, 0x00, 0x10
	.long D_060CA100
	.byte 0x00, 0x29, 0x16, 0x34, 0x00, 0x00, 0x00, 0x50
	.long D_060CA1A0
	.byte 0x00, 0x29, 0x42, 0xFC, 0x00, 0x00, 0x00, 0x30
	.long D_060CA200
	.byte 0x00, 0x22, 0xC6, 0x0C, 0x00, 0x00, 0x01, 0x00
	.long D_060CA440
	.byte 0x00, 0x29, 0x8A, 0x9C, 0x00, 0x00, 0x00, 0x10, 0xFF, 0xFF, 0xFF, 0xFF
	.long func_06045460
	dlabel D_0604540C
	.byte 0x00, 0x00, 0x02, 0x10, 0x00, 0x10, 0x02, 0x10, 0x00, 0x20, 0x02, 0x10, 0x00, 0x30, 0x02, 0x10
	.byte 0x00, 0x40, 0x02, 0x10, 0x00, 0x50, 0x02, 0x10, 0x00, 0x60, 0x02, 0x10, 0x00, 0x70, 0x02, 0x10
	.byte 0x00, 0x80, 0x02, 0x10, 0x00, 0x90, 0x01, 0x08, 0x00, 0x94, 0x01, 0x08, 0x00, 0x98, 0x01, 0x08
	.byte 0x00, 0x9C, 0x01, 0x08, 0x00, 0xA0, 0x01, 0x08, 0x00, 0xA4, 0x01, 0x08, 0x00, 0xA8, 0x01, 0x08
	.byte 0x00, 0xAC, 0x01, 0x08, 0x00, 0xB0, 0x01, 0x08, 0x00, 0xB4, 0x01, 0x08, 0x00, 0xB8, 0x01, 0x08
	.byte 0x00, 0xBC, 0x01, 0x08
