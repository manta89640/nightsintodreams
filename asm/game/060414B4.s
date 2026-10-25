	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060414B4,"ax",@progbits
	.p2align 2

	glabel func_060414B4
	mov.l	.L060414D8,r2
	mov.l	r2,@(44,r1)
	mov.w	.L060414D2,r0
	mov.w	r0,@(28,r1)
	mov.w	.L060414D4,r0
	mov.w	r0,@(22,r1)
	mov	#-1,r0
	mov.b	r0,@(1,r1)
	mov	#4,r0
	mov.b	r0,@(2,r1)
	mov.l	.L060414DC,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L060414D2:
	.short 0x1B04
.L060414D4:
	.short 0x0100
	.byte 0x00, 0x00
.L060414D8:
	.long D_06013FCE
.L060414DC:
	.long func_060414E0
	endlabel func_060414B4

	glabel func_060414E0
	mov.l	.L060414F0,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L060414F4
	bra	.L06041500
	nop
	.byte 0x00, 0x00
.L060414F0:
	.long player_obj
.L060414F4:
	mov.l	.L060414FC,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L060414FC:
	.long obj_free
.L06041500:
	sts.l	pr,@-r15
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L0604150C
	bra	.L06041768
	nop
.L0604150C:
	mov.l	@(36,r1),r0
	mov.l	.L06041544,r8
	add	r8,r0
	mov.l	r0,@(36,r1)
	cmp/pz	r0
	bf	.L0604151C
	mov	#0,r0
	mov.b	r0,@(1,r1)
.L0604151C:
	mov.l	@(48,r1),r2
	mov.l	@(32,r1),r0
	add	r0,r2
	mov.l	r2,@(48,r1)
	mov.l	@(56,r1),r3
	mov.l	@(40,r1),r0
	add	r0,r3
	mov.l	r3,@(56,r1)
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	.L06041548,r0
	sub	r0,r5
	mov.l	@(52,r1),r8
	mov.l	@(36,r1),r0
	add	r0,r8
	cmp/ge	r5,r8
	bt	.L0604154C
	bra	.L060416C8
	nop
.L06041544:
	.long 0x00001C00
.L06041548:
	.long 0x00100000
.L0604154C:
	mov.l	r5,@(52,r1)
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	mov.l	@(548,gbr),r0
	jsr	@r0
	nop
	mov.l	.L06041570,r2
	mov.b	@(20,gbr),r0
	and	#14,r0
	shll	r0
	mov.l	@(r0,r2),r0
	extu.b	r4,r4
	mov.b	@(r0,r4),r0
	cmp/eq	#1,r0
	bf	.L06041574
	mov	#1,r0
	bra	.L06041580
	mov.w	r0,@(0,r1)
.L06041570:
	.long D_060259D4
.L06041574:
	mov.b	@(2,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bt	.L060415CC
	mov.w	.L06041596,r0
	mov.w	r0,@(6,r1)
.L06041580:
	xor	r0,r0
	mov.l	r0,@(0,r1)
	mov.l	r0,@(24,r1)
	mov	#1,r0
	mov.b	r0,@(1,r1)
	mov.l	.L06041598,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	bra	.L06041774
	nop
.L06041596:
	.short 0x0384
.L06041598:
	.long .L06041774
	.byte 0xD9, 0x0A, 0x58, 0x18, 0x38, 0x9D, 0x00, 0x0A, 0x08, 0x1A, 0x28, 0x0D, 0x11, 0x88, 0x58, 0x19
	.byte 0x38, 0x9D, 0x00, 0x0A, 0x08, 0x1A, 0x28, 0x0D, 0x68, 0x8B, 0x11, 0x89, 0x58, 0x1A, 0x38, 0x9D
	.byte 0x00, 0x0A, 0x08, 0x1A, 0x28, 0x0D, 0x11, 0x8A, 0xA0, 0x81, 0x00, 0x09, 0x00, 0x00, 0x80, 0x00
.L060415CC:
	mov.b	r0,@(2,r1)
	mov.l	@(48,r1),r2
	mov	#8,r9
	shll16	r9
	add	r9,r2
	mov.l	@(56,r1),r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	.L060416B0,r0
	sub	r0,r5
	mov	r5,r12
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	mov	#8,r9
	shll16	r9
	add	r9,r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	.L060416B0,r0
	sub	r0,r5
	mov	r5,r13
	mov.l	@(52,r1),r0
	sub	r0,r12
	sub	r0,r13
	mov	#8,r4
	shll16	r4
	mov	r12,r5
	mov	#0,r6
	mov	#0,r8
	mov	r13,r9
	mov	#8,r10
	shll16	r10
	bsr	func_060417AC
	nop
	mov	r11,r4
	mov	r12,r5
	mov	r13,r6
	mov.l	@(32,r1),r2
	mov.l	@(40,r1),r3
	mov.l	.L060416B4,r0
	jsr	@r0
	nop
	mov	r0,r7
	mov	r4,r2
	mov	r6,r3
	mov.l	.L060416B4,r0
	jsr	@r0
	nop
	mov	r0,r12
	mov.l	.L060416B8,r10
	jsr	@r10
	neg	r0,r0
	mov.l	.L060416BC,r0
	jsr	@r0
	nop
	mov	r4,r2
	mov	r5,r3
	mov.l	.L060416B4,r0
	jsr	@r0
	nop
	mov.w	.L060416AE,r13
	sub	r0,r13
	exts.w	r13,r13
	mov.l	@(32,r1),r4
	mov.l	@(36,r1),r5
	mov.l	@(40,r1),r6
	mov.l	.L060416B8,r10
	jsr	@r10
	neg	r7,r0
	mov.l	.L060416BC,r0
	jsr	@r0
	nop
	mov.l	.L060416B8,r10
	jsr	@r10
	neg	r13,r0
	mov.l	.L060416C0,r0
	jsr	@r0
	nop
	neg	r5,r5
	mov.l	.L060416B8,r10
	jsr	@r10
	mov	r13,r0
	mov.l	.L060416C0,r0
	jsr	@r0
	nop
	add	r7,r12
	shar	r12
	mov.l	.L060416B8,r10
	jsr	@r10
	mov	r12,r0
	mov.l	.L060416BC,r0
	jsr	@r0
	nop
	mov.l	.L060416C4,r8
	dmuls.l	r8,r4
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	dmuls.l	r8,r5
	sts	mach,r0
	sts	macl,r5
	xtrct	r0,r5
	dmuls.l	r8,r6
	sts	mach,r0
	sts	macl,r6
	xtrct	r0,r6
	mov.l	r4,@(32,r1)
	mov.l	r5,@(36,r1)
	mov.l	r6,@(40,r1)
	bra	.L060416CA
	nop
.L060416AE:
	.short 0x4000
.L060416B0:
	.long 0x00100000
.L060416B4:
	.long math_atan2
.L060416B8:
	.long math_sincos
.L060416BC:
	.long math_rotate_xz
.L060416C0:
	.long math_rotate2d_inv
.L060416C4:
	.long 0x0000C000
.L060416C8:
	mov.l	r8,@(52,r1)
.L060416CA:
	mov.b	@(1,r1),r0
	tst	r0,r0
	bf	.L06041728
	mov.l	.L06041710,r0
	jsr	@r0
	nop
	mov.l	.L06041714,r8
	mov.l	.L06041718,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bf	.L06041728
	mov.l	.L0604171C,r10
	jsr	@r10
	nop
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#15,r6
	mov.l	.L06041720,r0
	jsr	@r0
	mov	#5,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L06041706:
	lds.l	@r15+,pr
	mov.l	.L06041724,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06041710:
	.long func_0603D6F8
.L06041714:
	.long 0x00200020
.L06041718:
	.long obj_find_near_player
.L0604171C:
	.long func_060429B4
.L06041720:
	.long snd_seq_start
.L06041724:
	.long obj_free
.L06041728:
	mov.l	.L0604175C,r0
	jsr	@r0
	mov	#16,r8
	cmp/pz	r0
	bf	.L06041768
	mov.l	.L06041760,r10
	jsr	@r10
	nop
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#16,r6
	mov.l	.L06041764,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	bra	.L06041706
	nop
	.byte 0x00, 0x00
.L0604175C:
	.long func_06017C90
.L06041760:
	.long func_060429B4
.L06041764:
	.long snd_seq_start
.L06041768:
	mov.l	.L06041770,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06041770:
	.long lbl_06042902
.L06041774:
	mov.w	@(6,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bf	.L060417A0
	mov.w	r0,@(6,r1)
	mov.w	.L06041796,r8
	cmp/ge	r8,r0
	bt	.L06041788
	mov	#2,r0
	mov.b	r0,@(1,r1)
.L06041788:
	sts.l	pr,@-r15
	mov.l	.L06041798,r0
	jsr	@r0
	nop
	mov.l	.L0604179C,r0
	jmp	@r0
	nop
.L06041796:
	.short 0x003C
.L06041798:
	.long func_0603D6F8
.L0604179C:
	.long lbl_06042898
.L060417A0:
	mov.l	.L060417A8,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L060417A8:
	.long obj_free
	endlabel func_060414E0

	glabel func_060417AC
	dmuls.l	r5,r10
	sts	mach,r0
	sts	macl,r11
	xtrct	r0,r11
	dmuls.l	r6,r9
	sts	mach,r0
	sts	macl,r12
	xtrct	r0,r12
	sub	r12,r11
	dmuls.l	r6,r8
	sts	mach,r0
	sts	macl,r12
	xtrct	r0,r12
	dmuls.l	r4,r10
	sts	mach,r0
	sts	macl,r13
	xtrct	r0,r13
	sub	r13,r12
	dmuls.l	r4,r9
	sts	mach,r0
	sts	macl,r13
	xtrct	r0,r13
	dmuls.l	r5,r8
	sts	mach,r0
	sts	macl,r14
	xtrct	r0,r14
	sub	r14,r13
	rts
	nop
	endlabel func_060417AC

	glabel func_060417E6
	mov.l	.L060417FC,r2
	mov.l	r2,@(44,r1)
	mov	#90,r0
	mov.w	r0,@(8,r1)
	mov.l	.L06041800,r0
	mov.l	r0,@(4,r1)
	mov.l	.L06041804,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L060417FC:
	.long D_060B84BC
.L06041800:
	.long 0x00080000
.L06041804:
	.long func_06041808
	endlabel func_060417E6

	glabel func_06041808
	mov.w	@(8,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bt	.L0604181C
	mov.l	.L06041818,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06041818:
	.long obj_free
.L0604181C:
	mov.w	r0,@(8,r1)
	sts.l	pr,@-r15
	mov.l	@(52,r1),r5
	mov.l	@(36,r1),r0
	mov.l	.L06041860,r8
	add	r8,r0
	mov.l	r0,@(36,r1)
	add	r0,r5
	mov.l	r5,@(52,r1)
	mov.l	@(4,r1),r5
	mov.l	.L06041864,r0
	add	r0,r5
	mov.l	r5,@(4,r1)
	mov.w	@(24,r1),r0
	mov.w	.L0604185A,r8
	add	r8,r0
	mov.w	r0,@(24,r1)
	mov.w	@(26,r1),r0
	mov.w	.L0604185C,r8
	add	r8,r0
	mov.w	r0,@(26,r1)
	mov.l	.L06041868,r2
	mov.l	.L0604186C,r14
	jsr	@r14
	nop
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06041870
	lds.l	@r15+,pr
	rts
	nop
.L0604185A:
	.short 0x0200
.L0604185C:
	.short 0xFC00
	.byte 0x00, 0x00
.L06041860:
	.long 0x00001000
.L06041864:
	.long 0x0000C000
.L06041868:
	.long D_060B87BC
.L0604186C:
	.long spr_anim_step
.L06041870:
	mov.l	.L060418D8,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L060418DC,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L060418E0,r10
	jsr	@r10
	mov.w	@(24,r1),r0
	mov.l	.L060418E4,r10
	jsr	@r10
	mov.w	@(26,r1),r0
	mov.l	.L060418E8,r8
	mov.l	.L060418EC,r10
	jsr	@r10
	add	r8,r0
	mov.l	.L060418D8,r0
	jsr	@r0
	nop
	mov.l	@(4,r1),r4
	mov	#0,r5
	mov.l	.L060418DC,r0
	jsr	@r0
	mov	#0,r6
	mov.l	.L060418F0,r0
	jsr	@r0
	nop
	mov.l	.L060418F4,r0
	jsr	@r0
	nop
	mov.l	.L060418D8,r0
	jsr	@r0
	nop
	mov.l	@(4,r1),r4
	neg	r4,r4
	mov	#0,r5
	mov.l	.L060418DC,r0
	jsr	@r0
	mov	#0,r6
	mov.l	.L060418F0,r0
	jsr	@r0
	nop
	mov.l	.L060418F4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L060418F4,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L060418D8:
	.long mtx_push
.L060418DC:
	.long mtx_translate
.L060418E0:
	.long mtx_rot_y
.L060418E4:
	.long math_sin
.L060418E8:
	.long 0x00004000
.L060418EC:
	.long mtx_rot_z
.L060418F0:
	.long spr_draw_billboard_unscaled
.L060418F4:
	.long mtx_pop
	endlabel func_06041808

	glabel func_060418F8
	mov.l	.L06041910,r2
	mov.l	r2,@(44,r1)
	mov	#90,r0
	mov.w	r0,@(8,r1)
	mov.l	.L06041914,r0
	mov.l	r0,@(4,r1)
	mov.l	.L06041918,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
	.byte 0x00, 0x00
.L06041910:
	.long D_060B84BC
.L06041914:
	.long 0x00080000
.L06041918:
	.long func_0604191C
	endlabel func_060418F8

	glabel func_0604191C
	mov.w	@(8,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bt	.L06041930
	mov.l	.L0604192C,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0604192C:
	.long obj_free
.L06041930:
	mov.w	r0,@(8,r1)
	sts.l	pr,@-r15
	mov.l	@(32,r1),r0
	mov.l	.L060419A0,r8
	sub	r8,r0
	mov.l	r0,@(32,r1)
	mov	#0,r4
	mov.l	@(32,r1),r5
	mov	#0,r6
	mov.l	.L060419A4,r10
	jsr	@r10
	mov.w	@(26,r1),r0
	mov.l	.L060419A8,r0
	jsr	@r0
	nop
	mov.w	@(24,r1),r0
	mov.l	.L060419A4,r10
	jsr	@r10
	nop
	mov.l	.L060419AC,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r0
	sub	r4,r0
	mov.l	r0,@(48,r1)
	mov.l	@(52,r1),r0
	add	r5,r0
	mov.l	r0,@(52,r1)
	mov.l	@(56,r1),r0
	add	r6,r0
	mov.l	r0,@(56,r1)
	mov.l	@(4,r1),r5
	mov.l	.L060419B0,r0
	add	r0,r5
	mov.l	r5,@(4,r1)
	mov.w	@(8,r1),r0
	mov.w	.L0604199A,r8
	add	r8,r0
	mov.w	r0,@(8,r1)
	mov.w	@(10,r1),r0
	mov.w	.L0604199C,r8
	add	r8,r0
	mov.w	r0,@(10,r1)
	mov.l	.L060419B4,r2
	mov.l	.L060419B8,r14
	jsr	@r14
	nop
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L060419BC
	lds.l	@r15+,pr
	rts
	nop
.L0604199A:
	.short 0x0200
.L0604199C:
	.short 0xFC00
	.byte 0x00, 0x00
.L060419A0:
	.long 0x00001000
.L060419A4:
	.long math_sincos
.L060419A8:
	.long math_rotate2d_inv
.L060419AC:
	.long math_rotate_xz
.L060419B0:
	.long 0x0000C000
.L060419B4:
	.long D_060B87BC
.L060419B8:
	.long spr_anim_step
.L060419BC:
	mov.l	.L06041A20,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06041A24,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06041A28,r10
	jsr	@r10
	mov.w	@(8,r1),r0
	mov.w	@(10,r1),r0
	mov.l	.L06041A2C,r8
	mov.l	.L06041A30,r10
	jsr	@r10
	add	r8,r0
	mov.l	.L06041A20,r0
	jsr	@r0
	nop
	mov.l	@(4,r1),r4
	mov	#0,r5
	mov.l	.L06041A24,r0
	jsr	@r0
	mov	#0,r6
	mov.l	.L06041A34,r0
	jsr	@r0
	nop
	mov.l	.L06041A38,r0
	jsr	@r0
	nop
	mov.l	.L06041A20,r0
	jsr	@r0
	nop
	mov.l	@(4,r1),r4
	neg	r4,r4
	mov	#0,r5
	mov.l	.L06041A24,r0
	jsr	@r0
	mov	#0,r6
	mov.l	.L06041A34,r0
	jsr	@r0
	nop
	mov.l	.L06041A38,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L06041A38,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06041A20:
	.long mtx_push
.L06041A24:
	.long mtx_translate
.L06041A28:
	.long mtx_rot_y
.L06041A2C:
	.long 0x00004000
.L06041A30:
	.long mtx_rot_z
.L06041A34:
	.long spr_draw_billboard_unscaled
.L06041A38:
	.long mtx_pop
	endlabel func_0604191C

	glabel func_06041A3C
	sts.l	pr,@-r15
	mov.w	.L06041A60,r11
	mov	#127,r12
	mov.l	.L06041A64,r0
	jsr	@r0
	nop
	bt	.L06041A58
	mov	#3,r8
	mov.w	.L06041A62,r9
	mov	#3,r5
	mov	#13,r6
	mov.l	.L06041A68,r0
	jsr	@r0
	mov	#6,r4
.L06041A58:
	lds.l	@r15+,pr
	mov.l	.L06041A6C,r0
	jmp	@r0
	nop
.L06041A60:
	.short 0x00C0
.L06041A62:
	.short 0x006E
.L06041A64:
	.long snd_calc_distance_volume
.L06041A68:
	.long snd_play_positional
.L06041A6C:
	.long func_0603D014
	endlabel func_06041A3C

	glabel func_06041A70
	sts.l	pr,@-r15
	mov.l	.L06041A94,r2
	mov.l	.L06041A98,r0
	jsr	@r0
	nop
	mov.l	.L06041A9C,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r9,@(0,r3)
	mov.l	r4,@(48,r3)
	mov.l	r5,@(52,r3)
	mov.l	r6,@(56,r3)
	mov	r10,r0
	mov.w	r0,@(4,r3)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06041A94:
	.long obj_list_effect
.L06041A98:
	.long obj_alloc
.L06041A9C:
	.long func_06041AA0
	endlabel func_06041A70

	glabel func_06041AA0
	mov.w	@(4,r1),r0
	add	#-1,r0
	cmp/pl	r0
	bt	.L06041AB4
	mov.l	.L06041AB0,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06041AB0:
	.long obj_free
.L06041AB4:
	mov.w	r0,@(4,r1)
	mov.l	@(12,gbr),r0
	tst	#1,r0
	bt	.L06041AC0
	rts
	nop
.L06041AC0:
	sts.l	pr,@-r15
	mov.l	@(0,r1),r4
	cmp/pl	r4
	bt	.L06041ACA
	mov	r1,r4
.L06041ACA:
	mov	#2,r7
.L06041ACC:
	mov.l	.L06041B40,r2
	mov.l	.L06041B44,r0
	jsr	@r0
	nop
	mov.l	.L06041B48,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	@(48,r4),r0
	mov.l	r0,@(48,r3)
	mov.l	@(52,r4),r0
	mov.l	r0,@(52,r3)
	mov.l	@(56,r4),r0
	mov.l	r0,@(56,r3)
	mov.l	r4,@-r15
	mov.l	.L06041B4C,r0
	jsr	@r0
	nop
	mov.l	.L06041B50,r4
	and	r0,r4
	mov.l	.L06041B54,r0
	add	r0,r4
	mov	#0,r5
	mov	#0,r6
	mov.l	.L06041B4C,r0
	jsr	@r0
	nop
	mov.l	.L06041B58,r10
	jsr	@r10
	nop
	mov.l	.L06041B5C,r0
	jsr	@r0
	nop
	mov.l	.L06041B4C,r0
	jsr	@r0
	nop
	mov.l	.L06041B58,r10
	jsr	@r10
	nop
	mov.l	.L06041B60,r0
	jsr	@r0
	nop
	mov.l	r4,@(32,r3)
	mov.l	r5,@(36,r3)
	mov.l	r6,@(40,r3)
	mov	#32,r0
	mov.w	r0,@(4,r3)
	mov.l	.L06041B64,r2
	mov.l	r2,@(44,r3)
	mov.w	.L06041B3C,r0
	mov.w	r0,@(22,r3)
	mov.l	@r15+,r4
	dt	r7
	bf	.L06041ACC
	lds.l	@r15+,pr
	rts
	nop
.L06041B3C:
	.short 0x0180
	.byte 0x00, 0x00
.L06041B40:
	.long obj_list_effect
.L06041B44:
	.long obj_alloc
.L06041B48:
	.long func_06041B68
.L06041B4C:
	.long math_rand
.L06041B50:
	.long 0x0007FFFF
.L06041B54:
	.long 0x00040000
.L06041B58:
	.long math_sincos
.L06041B5C:
	.long math_rotate_xz
.L06041B60:
	.long math_rotate2d_inv
.L06041B64:
	.long D_060139CC
	endlabel func_06041AA0

	glabel func_06041B68
	mov.w	@(4,r1),r0
	add	#-1,r0
	cmp/pl	r0
	bt	.L06041B7C
	mov.l	.L06041B78,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06041B78:
	.long obj_free
.L06041B7C:
	mov.w	r0,@(4,r1)
	sts.l	pr,@-r15
	mov.l	@(52,r1),r8
	mov.l	@(36,r1),r9
	mov.l	.L06041BA4,r0
	add	r0,r9
	mov.l	r9,@(36,r1)
	add	r9,r8
	mov.l	r8,@(52,r1)
	mov.l	.L06041BA8,r2
	mov.l	.L06041BAC,r14
	jsr	@r14
	nop
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06041BB0
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06041BA4:
	.long 0x00002000
.L06041BA8:
	.long D_06013A8C
.L06041BAC:
	.long spr_anim_step
.L06041BB0:
	mov.l	.L06041BD4,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06041BD8,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06041BDC,r0
	jsr	@r0
	nop
	mov.l	.L06041BE0,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06041BD4:
	.long mtx_push
.L06041BD8:
	.long mtx_translate
.L06041BDC:
	.long spr_draw_billboard
.L06041BE0:
	.long mtx_pop
	endlabel func_06041B68

	.section .data.06041BE4,"aw",@progbits
	.p2align 2
	.byte 0x66, 0x36, 0x46, 0x08, 0x65, 0x0D, 0x40, 0x29, 0x40, 0x08, 0x02, 0x3E, 0x70, 0x04, 0x30, 0x67
	.byte 0x8B, 0x01, 0x30, 0x68, 0x70, 0xFC, 0x03, 0x3E, 0x47, 0x08, 0xDE, 0x12, 0x6A, 0x24, 0x6B, 0x34
	.byte 0x3B, 0xA8, 0x4B, 0x28, 0x35, 0xBD, 0x0D, 0x0A, 0x3D, 0xAC, 0x4D, 0x18, 0x4D, 0x08, 0x6A, 0x24
	.byte 0x6B, 0x34, 0x3B, 0xA8, 0x4B, 0x28, 0x35, 0xBD, 0x0B, 0x0A, 0x3B, 0xAC, 0x4B, 0x08, 0x4B, 0x08
	.byte 0x4B, 0x00, 0x3D, 0xBC, 0x6A, 0x24, 0x6B, 0x34, 0x3B, 0xA8, 0x4B, 0x28, 0x35, 0xBD, 0x0B, 0x0A
	.byte 0x3B, 0xAC, 0x3D, 0xBC, 0x2D, 0xEB, 0x24, 0xD1, 0x74, 0x02, 0x47, 0x10, 0x8B, 0xDE, 0x4F, 0x26
	.byte 0x00, 0x0B, 0x00, 0x09, 0x00, 0x00, 0x80, 0x00
