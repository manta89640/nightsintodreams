	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603BAD0,"ax",@progbits
	.p2align 2

	glabel func_0603BAD0
	sts.l	pr,@-r15
	mov	#1,r0
	bra	.L0603BB30
	mov.b	r0,@(13,r1)
	endlabel func_0603BAD0

	glabel func_0603BAD8
	sts.l	pr,@-r15
	mov.l	.L0603BB00,r0
	mov.b	@r0,r0
	cmp/eq	#0,r0
	bt	.L0603BB14
	mov.l	.L0603BB04,r3
	mov.l	.L0603BB08,r2
	jsr	@r3
	nop
	mov.l	.L0603BB0C,r4
	mov.l	r4,@(12,r3)
	mov.l	.L0603BB10,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov	#0,r0
	mov.b	r0,@(14,r1)
	mov.b	r0,@(15,r1)
	mov	#2,r0
	bra	.L0603BB30
	mov.b	r0,@(13,r1)
.L0603BB00:
	.long D_060CFFA2
.L0603BB04:
	.long obj_alloc
.L0603BB08:
	.long obj_list_effect
.L0603BB0C:
	.long func_0603BD26
.L0603BB10:
	.long func_0603BCB6
.L0603BB14:
	mov.l	.L0603BB48,r7
	mov	#4,r0
	mov.b	@(r0,r7),r7
	mov	#3,r8
	cmp/ge	r8,r7
	bf	.L0603BB2C
	mov.l	.L0603BB4C,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov	#0,r0
	mov.b	r0,@(14,r1)
	mov.b	r0,@(15,r1)
.L0603BB2C:
	mov	#3,r0
	mov.b	r0,@(13,r1)
.L0603BB30:
	mov.b	@(13,r1),r0
	mov.l	.L0603BB50,r2
	mov.l	.L0603BB54,r3
	shll2	r0
	jsr	@r3
	mov.l	@(r0,r2),r2
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603BB58
	lds.l	@r15+,pr
	rts
	nop
.L0603BB48:
	.long play_state
.L0603BB4C:
	.long func_0603BB88
.L0603BB50:
	.long D_0603BE4C
.L0603BB54:
	.long spr_anim_step
.L0603BB58:
	bsr	func_0603BDA8
	nop
	mov.l	.L0603BB78,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	.L0603BB7C,r0
	mov.l	@(52,r1),r5
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L0603BB80,r0
	jsr	@r0
	nop
	mov.l	.L0603BB84,r0
	jmp	@r0
	lds.l	@r15+,pr
.L0603BB78:
	.long mtx_push
.L0603BB7C:
	.long mtx_translate
.L0603BB80:
	.long spr_draw_billboard
.L0603BB84:
	.long mtx_pop
	endlabel func_0603BAD8

	glabel func_0603BB88
	sts.l	pr,@-r15
	mov.l	.L0603BBB0,r0
	mov.b	@r0,r0
	cmp/eq	#0,r0
	bt	.L0603BBC4
	mov.l	.L0603BBB4,r3
	mov.l	.L0603BBB8,r2
	jsr	@r3
	nop
	mov.l	.L0603BBBC,r4
	mov.l	r4,@(12,r3)
	mov.l	.L0603BBC0,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov	#0,r0
	mov.b	r0,@(14,r1)
	mov.b	r0,@(15,r1)
	mov	#2,r0
	bra	.L0603BB30
	mov.b	r0,@(13,r1)
.L0603BBB0:
	.long D_060CFFA2
.L0603BBB4:
	.long obj_alloc
.L0603BBB8:
	.long obj_list_effect
.L0603BBBC:
	.long func_0603BD26
.L0603BBC0:
	.long func_0603BCB6
.L0603BBC4:
	mov.l	.L0603BC00,r0
	mov	#32,r8
	jsr	@r0
	shll16	r8
	cmp/pz	r0
	bf	.L0603BC10
	mov.b	@(25,gbr),r0
	cmp/pz	r0
	bt	.L0603BC10
	mov.l	.L0603BC04,r3
	mov.l	.L0603BC08,r2
	jsr	@r3
	nop
	mov.l	.L0603BC0C,r4
	mov.l	r4,@(12,r3)
	add	#16,r3
	mov.l	@(48,r1),r0
	mov.l	r0,@(48,r3)
	mov.l	@(52,r1),r0
	mov.l	r0,@(52,r3)
	mov.l	@(56,r1),r0
	mov.l	r0,@(56,r3)
	bsr	func_0603BC16
	nop
	mov	#0,r0
	mov.b	r0,@(14,r1)
	mov.b	r0,@(15,r1)
	mov	#4,r0
	bra	.L0603BB30
	mov.b	r0,@(13,r1)
.L0603BC00:
	.long obj_find_near_player
.L0603BC04:
	.long obj_alloc
.L0603BC08:
	.long obj_list_effect
.L0603BC0C:
	.long func_0603BD26
.L0603BC10:
	mov	#1,r0
	bra	.L0603BB30
	mov.b	r0,@(13,r1)
	endlabel func_0603BB88

	glabel func_0603BC16
	mov.l	.L0603BC64,r7
	sts.l	pr,@-r15
	mov.b	@(6,r7),r0
	extu.b	r0,r0
	tst	r0,r0
	bt	.L0603BC78
	mov	#10,r8
	mulu.w	r0,r8
	sts	macl,r9
	mov	#0,r0
	mov.b	r0,@(6,r7)
	mov	#0,r6
	mov.l	.L0603BC68,r14
	mov	r9,r0
	jsr	@r14
	mov	#1,r9
	mov	#1,r5
	mov.l	.L0603BC6C,r0
	mov	#26,r6
	jsr	@r0
	mov	#3,r4
	mov.l	.L0603BC70,r5
	mov.l	@r5,r5
	mov	#64,r0
	mov.b	@(r0,r5),r0
	tst	r0,r0
	bf	.L0603BC78
	mov.l	@(8,r5),r12
	mov.b	@(2,r12),r0
	tst	r0,r0
	bf	.L0603BC78
	mov.l	@(32,r5),r5
	cmp/pz	r5
	bf	.L0603BC74
	mov.w	.L0603BC60,r0
	bra	.L0603BC76
	nop
.L0603BC60:
	.short 0x0061
	.byte 0x00, 0x00
.L0603BC64:
	.long play_state
.L0603BC68:
	.long func_0601A27C
.L0603BC6C:
	.long snd_seq_start
.L0603BC70:
	.long player_obj
.L0603BC74:
	mov.w	.L0603BC82,r0
.L0603BC76:
	mov.w	r0,@(22,r12)
.L0603BC78:
	mov.l	.L0603BC84,r0
	lds.l	@r15+,pr
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L0603BC82:
	.short 0x0061
.L0603BC84:
	.long func_0603BC88
	endlabel func_0603BC16

	glabel func_0603BC88
	sts.l	pr,@-r15
	mov.l	.L0603BCA8,r0
	mov.w	.L0603BCA6,r8
	jsr	@r0
	shll16	r8
	cmp/pz	r0
	bt	.L0603BCB0
	lds.l	@r15+,pr
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov	#2,r0
	mov.b	r0,@(1,r2)
	mov.l	.L0603BCAC,r0
	jmp	@r0
	nop
.L0603BCA6:
	.short 0x0300
.L0603BCA8:
	.long obj_find_near_player
.L0603BCAC:
	.long obj_free
.L0603BCB0:
	mov	#4,r0
	bra	.L0603BB30
	mov.b	r0,@(13,r1)
	endlabel func_0603BC88

	glabel func_0603BCB6
	sts.l	pr,@-r15
	mov.l	.L0603BCE0,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov	#64,r4
	mov.w	@(24,r1),r0
	shll8	r4
	add	r4,r0
	mov.l	.L0603BCE4,r10
	jsr	@r10
	neg	r0,r0
	shll2	r10
	shll2	r10
	shll2	r11
	shll2	r11
	mov.l	r10,@(32,r1)
	mov.l	r11,@(40,r1)
	mov	#2,r0
	bra	.L0603BB30
	mov.b	r0,@(13,r1)
	.byte 0x00, 0x00
.L0603BCE0:
	.long func_0603BCE8
.L0603BCE4:
	.long math_sincos
	endlabel func_0603BCB6

	glabel func_0603BCE8
	sts.l	pr,@-r15
	mov.l	.L0603BD08,r0
	mov.w	.L0603BD06,r8
	jsr	@r0
	shll16	r8
	cmp/pz	r0
	bt	.L0603BD10
	lds.l	@r15+,pr
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov	#2,r0
	mov.b	r0,@(1,r2)
	mov.l	.L0603BD0C,r0
	jmp	@r0
	nop
.L0603BD06:
	.short 0x0400
.L0603BD08:
	.long obj_find_near_player
.L0603BD0C:
	.long obj_free
.L0603BD10:
	mov.l	@(32,r1),r0
	mov.l	@(40,r1),r3
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r4
	add	r0,r2
	add	r3,r4
	mov.l	r2,@(48,r1)
	mov.l	r4,@(56,r1)
	mov	#2,r0
	bra	.L0603BB30
	mov.b	r0,@(13,r1)
	endlabel func_0603BCE8

	glabel func_0603BD26
	sts.l	pr,@-r15
	mov.l	.L0603BD68,r3
	mov.w	.L0603BD66,r0
	mov.l	r3,@(44,r1)
	mov.w	r0,@(22,r1)
	mov	#64,r4
	mov.w	@(24,r1),r0
	shll8	r4
	add	r4,r0
	mov.l	.L0603BD6C,r10
	jsr	@r10
	neg	r0,r0
	shll2	r10
	shll	r10
	shll2	r11
	shll	r11
	mov.l	r10,@(32,r1)
	mov.l	r11,@(40,r1)
	mov	#-4,r12
	shll16	r12
	mov.l	r12,@(36,r1)
	lds.l	@r15+,pr
	mov.l	.L0603BD70,r0
	mov.l	r0,@-r1
	add	#4,r1
.L0603BD58:
	sts.l	pr,@-r15
	mov.w	@(30,r1),r0
	cmp/pz	r0
	bt	.L0603BD78
	mov.l	.L0603BD74,r0
	jmp	@r0
	lds.l	@r15+,pr
.L0603BD66:
	.short 0x0100
.L0603BD68:
	.long D_06014D12
.L0603BD6C:
	.long math_sincos
.L0603BD70:
	.long .L0603BD58
.L0603BD74:
	.long obj_free
.L0603BD78:
	mov.l	@(32,r1),r3
	mov.l	@(36,r1),r4
	mov.l	@(40,r1),r5
	mov.l	@(48,r1),r6
	mov.l	@(52,r1),r7
	mov.l	@(56,r1),r8
	add	r3,r6
	add	r4,r7
	add	r5,r8
	mov.l	r6,@(48,r1)
	mov.l	r7,@(52,r1)
	mov.l	r8,@(56,r1)
	mov	#64,r0
	shll8	r0
	add	r0,r4
	mov	#6,r0
	shll16	r0
	cmp/ge	r0,r4
	bf	.L0603BDA0
	mov	r0,r4
.L0603BDA0:
	mov.l	r4,@(36,r1)
	mov	#0,r0
	bra	.L0603BB30
	mov.b	r0,@(13,r1)
	endlabel func_0603BD26

	glabel func_0603BDA8
	mov.b	@(13,r1),r0
	cmp/eq	#2,r0
	bt	.L0603BDC0
	cmp/eq	#4,r0
	bt	.L0603BDC0
	mov.l	.L0603BDBC,r2
	cmp/eq	#0,r0
	bf	.L0603BDC4
	bra	.L0603BDC6
	mov	#20,r3
.L0603BDBC:
	.long D_06014D12
.L0603BDC0:
	rts
	nop
.L0603BDC4:
	mov.w	.L0603BE06,r3
.L0603BDC6:
	mov.w	@(20,r1),r0
	shll	r0
	mov.w	@(r0,r2),r0
	add	r0,r2
	add	r3,r2
	sts.l	pr,@-r15
	mov.l	.L0603BE08,r7
	mov.l	r2,@-r15
	mov.b	@(6,r7),r0
	extu.b	r0,r4
	mov.l	.L0603BE0C,r0
	jsr	@r0
	nop
	mov	r0,r7
	mov.l	@r15+,r2
	mov.l	.L0603BE10,r8
	shlr8	r0
	cmp/eq	#0,r0
	bf	.L0603BDEE
	mov	#10,r0
.L0603BDEE:
	shll	r0
	add	r8,r0
	mov.w	@r0,r0
	mov.w	r0,@r2
	add	#20,r2
	mov	r7,r0
	shlr2	r0
	shlr2	r0
	cmp/eq	#0,r0
	bf	.L0603BE14
	bra	.L0603BE16
	mov	#10,r0
.L0603BE06:
	.short 0x00B4
.L0603BE08:
	.long play_state
.L0603BE0C:
	.long math_bin_to_bcd
.L0603BE10:
	.long D_0603BE34
.L0603BE14:
	and	#15,r0
.L0603BE16:
	shll	r0
	add	r8,r0
	mov.w	@r0,r0
	mov.w	r0,@r2
	add	#20,r2
	mov	r7,r0
	and	#15,r0
	shll	r0
	add	r8,r0
	mov.w	@r0,r0
	mov.w	r0,@r2
	add	#20,r2
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_0603BDA8

	.section .data.0603BE34,"aw",@progbits
	.p2align 2
	dlabel D_0603BE34
	.byte 0x00, 0xA1, 0x00, 0x98, 0x00, 0x99, 0x00, 0x9A, 0x00, 0x9B, 0x00, 0x9C, 0x00, 0x9D, 0x00, 0x9E
	.byte 0x00, 0x9F, 0x00, 0xA0, 0x00, 0xA2, 0x00, 0x09
	dlabel D_0603BE4C
	.long D_060166AA
	.long D_060166B0
	.long D_060166D6
	.long D_06016748
	.long D_06016766
	dlabel D_0603BE60
	.byte 0xD2, 0x05, 0x11, 0x2B
