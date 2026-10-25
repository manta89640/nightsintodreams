	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06043CF8,"ax",@progbits
	.p2align 2

	glabel func_06043CF8
	sts.l	pr,@-r15
	mov.l	.L06043D20,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L06043D30
	mov.l	@(8,r1),r2
	mov.l	.L06043D24,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	mov.w	@(26,r1),r0
	mov	r0,r13
	mov.l	.L06043D28,r0
	lds	r0,pr
	mov.l	.L06043D2C,r0
	jmp	@r0
	mov	#4,r7
.L06043D20:
	.long player_obj
.L06043D24:
	.long 0x00010000
.L06043D28:
	.long .L06043D54
.L06043D2C:
	.long func_06017A98
.L06043D30:
	mov.w	@(22,r1),r0
	cmp/eq	#0,r0
	bt	.L06043D54
	mov.l	@(8,r1),r2
	mov.l	.L06043D88,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	mov.w	@(26,r1),r0
	mov	r0,r13
	mov.l	.L06043D8C,r0
	jsr	@r0
	mov	#4,r7
	mov.l	.L06043D90,r2
	bsr	func_06043DB2
	mov.l	@r2,r2
.L06043D54:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06043DAC
	mov.l	.L06043D94,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06043D98,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06043D9C,r13
	jsr	@r13
	mov.w	@(24,r1),r0
	mov.w	@(26,r1),r0
	tst	r0,r0
	bt	.L06043D7C
	mov.l	.L06043DA0,r13
	jsr	@r13
	nop
.L06043D7C:
	mov.l	.L06043DA4,r0
	jsr	@r0
	mov.l	@(16,r1),r2
	mov.l	.L06043DA8,r0
	jmp	@r0
	lds.l	@r15+,pr
.L06043D88:
	.long 0x00010000
.L06043D8C:
	.long func_06017A98
.L06043D90:
	.long player_obj
.L06043D94:
	.long mtx_push
.L06043D98:
	.long mtx_translate
.L06043D9C:
	.long mtx_rot_y
.L06043DA0:
	.long mtx_rot_z
.L06043DA4:
	.long poly_draw_model_color
.L06043DA8:
	.long mtx_pop
.L06043DAC:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06043CF8

	glabel func_06043DB2
	cmp/pz	r0
	bf	.L06043E02
	mov	r14,r0
	tst	#6,r0
	bt	.L06043DFC
	mov.l	.L06043DF8,r3
	tst	#2,r0
	bf	.L06043DCE
	mov.w	.L06043DF4,r4
	mov.w	@(26,r2),r0
	add	r4,r0
	extu.w	r0,r0
	cmp/gt	r3,r0
	bf	.L06043DEA
.L06043DCE:
	mov.w	@(4,r2),r0
	neg	r0,r0
	add	r3,r0
.L06043DD4:
	mov.w	r0,@(4,r2)
	mov.w	r0,@(26,r2)
	mov.l	@(12,r2),r13
	mov.w	r0,@(10,r13)
	mov.w	r0,@(8,r13)
	mov.b	@(2,r13),r0
	tst	r0,r0
	bt	.L06043DEA
	mov.l	@(40,r13),r0
	shlr	r0
	mov.l	r0,@(40,r13)
.L06043DEA:
	mov.l	@(36,r1),r3
	mov.l	r3,@(52,r2)
	mov.l	@(32,r1),r4
	rts
	mov.l	r4,@(60,r2)
.L06043DF4:
	.short 0x4000
	.byte 0x00, 0x00
.L06043DF8:
	.long 0x00008000
.L06043DFC:
	mov.w	@(4,r2),r0
	bra	.L06043DD4
	neg	r0,r0
.L06043E02:
	mov.l	@(60,r2),r3
	mov.l	@(52,r2),r4
	mov.l	r3,@(32,r1)
	rts
	mov.l	r4,@(36,r1)
	.byte 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01
	.byte 0x40, 0x2B, 0x00, 0x09
	.long obj_free
	endlabel func_06043DB2

	glabel func_06043E24
	sts.l	pr,@-r15
	mov.l	.L06043E50,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L06043E5C
	mov.l	@(8,r1),r2
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	mov.w	@(26,r1),r0
	mov	r0,r13
	mov.l	.L06043E54,r0
	lds	r0,pr
	mov.l	.L06043E58,r0
	jmp	@r0
	mov	#4,r7
.L06043E50:
	.long player_obj
.L06043E54:
	.long .L06043E84
.L06043E58:
	.long func_06017A98
.L06043E5C:
	mov.w	@(22,r1),r0
	cmp/eq	#0,r0
	bt	.L06043E84
	mov.l	@(8,r1),r2
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	mov.w	@(26,r1),r0
	mov	r0,r13
	mov.l	.L06043EC8,r0
	jsr	@r0
	mov	#4,r7
	mov.l	.L06043ECC,r2
	bsr	func_06043DB2
	mov.l	@r2,r2
.L06043E84:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06043EEC
	mov.l	.L06043ED0,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06043ED4,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r4
	mov	r0,r5
	mov.l	.L06043ED8,r2
	jsr	@r2
	mov	r0,r6
	mov.l	.L06043EDC,r13
	jsr	@r13
	mov.w	@(24,r1),r0
	mov.w	@(26,r1),r0
	tst	r0,r0
	bt	.L06043EBA
	mov.l	.L06043EE0,r13
	jsr	@r13
	nop
.L06043EBA:
	mov.l	.L06043EE4,r0
	jsr	@r0
	mov.l	@(16,r1),r2
	mov.l	.L06043EE8,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L06043EC8:
	.long func_06017A98
.L06043ECC:
	.long player_obj
.L06043ED0:
	.long mtx_push
.L06043ED4:
	.long mtx_translate
.L06043ED8:
	.long mtx_scale
.L06043EDC:
	.long mtx_rot_y
.L06043EE0:
	.long mtx_rot_z
.L06043EE4:
	.long poly_draw_model_color
.L06043EE8:
	.long mtx_pop
.L06043EEC:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x09
	endlabel func_06043E24

	glabel func_06043EF4
	mov	#8,r7
	sub	r6,r7
.L06043EF8:
	mov.w	@r2,r8
	mov.w	@r3,r9
	mov.w	.L06043F54,r0
	and	r0,r8
	and	r0,r9
	mulu.w	r6,r8
	sts	macl,r8
	mulu.w	r7,r9
	sts	macl,r9
	add	r9,r8
	shlr2	r8
	shlr	r8
	mov.w	@r2,r9
	mov.w	@r3,r10
	mov.w	.L06043F56,r0
	and	r0,r9
	and	r0,r10
	mulu.w	r6,r9
	sts	macl,r9
	mulu.w	r7,r10
	sts	macl,r10
	add	r10,r9
	shlr2	r9
	shlr	r9
	and	r0,r9
	mov.w	@r2+,r10
	mov.w	@r3+,r11
	mov.w	.L06043F58,r0
	and	r0,r10
	and	r0,r11
	mulu.w	r6,r10
	sts	macl,r10
	mulu.w	r7,r11
	sts	macl,r11
	add	r11,r10
	shlr2	r10
	shlr	r10
	and	r0,r10
	or	r10,r9
	or	r9,r8
	mov.w	r8,@r5
	add	#2,r5
	dt	r4
	bf	.L06043EF8
	rts
	nop
.L06043F54:
	.short 0x001F
.L06043F56:
	.short 0x03E0
.L06043F58:
	.short 0x7C00
	.byte 0x4F, 0x22, 0xD2, 0x1D, 0xD0, 0x1E, 0x40, 0x0B, 0x00, 0x09, 0xD0, 0x1D, 0x13, 0x03, 0x73, 0x10
	.byte 0xC6, 0xBC, 0xD2, 0x1C, 0x02, 0x07, 0x02, 0x1A, 0xD0, 0x1C, 0x30, 0x2C, 0xC2, 0xBC, 0x22, 0x59
	.byte 0x45, 0x21, 0x32, 0x58, 0x50, 0x1D, 0x32, 0x0C, 0x13, 0x2D, 0x65, 0x43, 0xC6, 0xBC, 0xD2, 0x15
	.byte 0x02, 0x07, 0x02, 0x1A, 0xD0, 0x15, 0x30, 0x2C, 0xC2, 0xBC, 0x22, 0x49, 0x44, 0x21, 0x32, 0x48
	.byte 0x50, 0x1C, 0x32, 0x0C, 0x13, 0x2C, 0xC6, 0xBC, 0xD2, 0x0F, 0x02, 0x07, 0x02, 0x1A, 0xD0, 0x0E
	.byte 0x30, 0x2C, 0xC2, 0xBC, 0x22, 0x59, 0x32, 0x48, 0x50, 0x1E, 0x32, 0x0C, 0x13, 0x2E, 0xC6, 0xBC
	.byte 0xD2, 0x09, 0x02, 0x07, 0x02, 0x1A, 0xD0, 0x08, 0x30, 0x2C, 0xC2, 0xBC, 0x60, 0x63, 0x81, 0x31
	.byte 0x60, 0x73, 0x4F, 0x26, 0x00, 0x0B, 0x80, 0x31, 0x00, 0x00
	.long obj_list_effect
	.long obj_alloc
	.long func_0604400C
	.byte 0x41, 0xC6, 0x4E, 0x6D, 0x00, 0x00, 0x30, 0x39
	dlabel D_06043FE8
	.long D_06013D1E
	.long D_06013D38
	.long D_06013D52
	.long D_06013D6C
	.long D_06013D86
	.long D_06013D6C
	.long D_06013D52
	.long D_06013D38
	.long D_06013D1E
	endlabel func_06043EF4

	glabel func_0604400C
	mov.w	.L06044032,r0
	mov.w	r0,@(22,r1)
	mov.l	.L06044034,r2
	mov.l	r2,@(44,r1)
	mov	#11,r0
	mov.b	r0,@(0,r1)
	xor	r0,r0
	mov.w	r0,@(20,r1)
	mov.w	r0,@(14,r1)
	mov.b	@(1,r1),r0
	shll2	r0
	mov.l	.L06044038,r2
	add	r2,r0
	mov.l	@r0,r0
	mov.l	r0,@(4,r1)
	mov.l	.L0604403C,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06044032:
	.short 0x0300
.L06044034:
	.long D_06013AAE
.L06044038:
	.long D_06043FE8
.L0604403C:
	.long func_06044040
	endlabel func_0604400C

	glabel func_06044040
	mov.w	@(2,r1),r0
	dt	r0
	bt	.L0604404A
	rts
	mov.w	r0,@(2,r1)
.L0604404A:
	mov.l	.L06044054,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
	.byte 0x00, 0x00
.L06044054:
	.long func_06044058
	endlabel func_06044040

	glabel func_06044058
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06044098
	sts.l	pr,@-r15
	mov.l	.L06044084,r0
	jsr	@r0
	mov.l	@(4,r1),r2
	mov.l	.L06044088,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0604408C,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06044090,r0
	jsr	@r0
	nop
	mov.l	.L06044094,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L06044084:
	.long spr_anim_step
.L06044088:
	.long mtx_push
.L0604408C:
	.long mtx_translate
.L06044090:
	.long spr_draw_billboard
.L06044094:
	.long mtx_pop
.L06044098:
	mov.b	@(0,r1),r0
	add	#-1,r0
	tst	r0,r0
	bt	.L060440AC
	mov.b	r0,@(0,r1)
	mov.l	.L060440A8,r0
	jmp	@r0
	mov.l	@(4,r1),r2
.L060440A8:
	.long spr_anim_step
.L060440AC:
	mov.l	.L060440B4,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L060440B4:
	.long obj_free
	.byte 0x20, 0x0A, 0x81, 0x13, 0xD2, 0x08, 0x11, 0x2B, 0xD4, 0x08, 0x85, 0x12, 0x40, 0x18, 0x34, 0x0D
	.byte 0x00, 0x0A, 0x04, 0x1A, 0x24, 0x0D, 0x11, 0x40, 0x90, 0x04, 0x81, 0x15, 0xD0, 0x04, 0x21, 0x06
	.byte 0x00, 0x0B, 0x71, 0x04, 0x01, 0x00, 0x00, 0x00
	.long D_06014CFA
	.byte 0x00, 0x50, 0x00, 0x00
	.long D_060440EC
	dlabel D_060440EC
	.byte 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01
	.byte 0x40, 0x2B, 0x00, 0x09
	.long obj_free
	endlabel func_06044058

	glabel func_06044104
	sts.l	pr,@-r15
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L06044110
	bra	.L0604417A
	nop
.L06044110:
	mov.l	.L060441F0,r0
	jsr	@r0
	mov.l	@(0,r1),r8
	cmp/pz	r0
	bf	.L0604417A
	mov.l	.L060441F4,r2
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	mov.w	@(26,r1),r0
	mov.l	.L060441F8,r10
	jsr	@r10
	mov	r0,r13
	cmp/pz	r0
	bf	.L0604417A
	mov	r0,r6
	mov.w	.L060441EE,r0
	mov.l	.L060441FC,r14
	jsr	@r14
	mov	#1,r9
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#17,r6
	mov.l	.L06044200,r0
	jsr	@r0
	mov	#5,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L06044204,r7
	mov.b	@(7,r7),r0
	add	#1,r0
	mov	#127,r8
	cmp/ge	r8,r0
	bf	.L0604416E
	mov	r8,r0
.L0604416E:
	mov.b	r0,@(7,r7)
	mov	#16,r0
	mov.w	r0,@(8,r1)
	mov.l	.L06044208,r0
	mov.l	r0,@-r1
	add	#4,r1
.L0604417A:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06044230
	mov.l	.L0604420C,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06044210,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06044214,r14
	jsr	@r14
	mov.w	@(24,r1),r0
	mov.w	@(26,r1),r0
	mov.l	.L06044218,r14
	jsr	@r14
	mov.l	r0,@-r15
	mov.l	.L0604421C,r14
	jsr	@r14
	mov.w	@(22,r1),r0
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r4
	mov	r0,r5
	mov.l	.L06044220,r14
	jsr	@r14
	mov	r0,r6
	mov.w	@(6,r1),r0
	mov.w	r0,@(26,r1)
	mov	#16,r0
	mov.l	.L06044224,r2
	mov.l	r2,@(32,r1)
.L060441BC:
	mov.l	.L0604420C,r2
	jsr	@r2
	mov.l	r0,@-r15
	mov.l	@(32,r1),r2
	mov.l	@r2+,r4
	mov.l	@r2+,r5
	mov.l	@r2+,r6
	add	#12,r2
	mov.l	.L06044210,r0
	jsr	@r0
	mov.l	r2,@(32,r1)
	mov.l	.L06044228,r0
	jsr	@r0
	nop
	mov.l	.L0604422C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r0
	dt	r0
	bf	.L060441BC
	mov.l	@r15+,r0
	mov.w	r0,@(26,r1)
	mov.l	.L0604422C,r0
	jmp	@r0
	lds.l	@r15+,pr
.L060441EE:
	.short 0x000A
.L060441F0:
	.long obj_find_near_player
.L060441F4:
	.long D_060402AA
.L060441F8:
	.long func_060175BE
.L060441FC:
	.long func_0601A2BC
.L06044200:
	.long snd_seq_start
.L06044204:
	.long play_state
.L06044208:
	.long func_0604423E
.L0604420C:
	.long mtx_push
.L06044210:
	.long mtx_translate
.L06044214:
	.long mtx_rot_y
.L06044218:
	.long mtx_rot_z
.L0604421C:
	.long mtx_rot_x
.L06044220:
	.long mtx_scale
.L06044224:
	.long D_06080350
.L06044228:
	.long spr_draw_billboard_unscaled
.L0604422C:
	.long mtx_pop
.L06044230:
	mov.w	@(6,r1),r0
	mov.w	.L0604423C,r2
	add	r2,r0
	lds.l	@r15+,pr
	rts
	mov.w	r0,@(6,r1)
.L0604423C:
	.short 0x0200
	endlabel func_06044104

	glabel func_0604423E
	mov.w	@(8,r1),r0
	dt	r0
	bf	.L0604424C
	mov.l	.L060442E0,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov	#44,r0
.L0604424C:
	mov.w	r0,@(8,r1)
	sts.l	pr,@-r15
	mov.w	@(4,r1),r0
	add	#-16,r0
	mov.w	r0,@(4,r1)
	mov.l	.L060442E4,r8
	shll8	r0
	mov.l	r0,@-r15
	dmuls.l	r0,r8
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	mov.l	.L060442E8,r0
	jsr	@r0
	nop
	cmp/pz	r0
	mov.l	@r15+,r3
	bt	.L0604417A
	mov.l	.L060442EC,r2
	mov.l	@r2,r2
	mov.l	@(48,r2),r4
	mov.l	@(52,r2),r5
	mov.l	@(56,r2),r6
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	.L060442F0,r2
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	mov.w	@(26,r1),r0
	mov.w	.L060442DE,r13
	add	r0,r13
	mov.l	.L060442F4,r0
	jsr	@r0
	mov	#0,r7
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L060442EC,r2
	mov.l	@r2,r14
	mov.l	r4,@(48,r14)
	mov.l	r5,@(52,r14)
	mov.l	r6,@(56,r14)
	cmp/eq	#0,r0
	bf	.L060442DA
	mov.w	@(8,r1),r0
	add	#44,r0
	mov.w	r0,@(8,r1)
	mov.l	.L060442E0,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.b	@(6,r14),r0
	tst	r0,r0
	bf	.L06044300
	add	#-4,r14
	mov.l	@r14+,r0
	mov.l	.L060442F8,r10
	cmp/eq	r0,r10
	bt	.L060442DA
	mov.l	.L060442FC,r10
	cmp/eq	r0,r10
	bt	.L060442DA
	mov.l	@(8,r14),r10
	mov.b	@(5,r10),r0
	cmp/pl	r0
	bt	.L060442DA
	mov.l	.L060442F8,r10
	mov.l	r10,@-r14
.L060442DA:
	bra	.L0604417A
	nop
.L060442DE:
	.short 0x4000
.L060442E0:
	.long func_06044354
.L060442E4:
	.long 0x00500000
.L060442E8:
	.long obj_find_near_player
.L060442EC:
	.long player_obj
.L060442F0:
	.long D_0604437C
.L060442F4:
	.long func_06017A98
.L060442F8:
	.long func_0602543A
.L060442FC:
	.long lbl_0602552A
.L06044300:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#2,r5
	mov	#1,r6
	mov.l	.L0604434C,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@(8,r14),r11
	mov.l	@(12,r14),r12
	mov.w	.L06044348,r0
	mov.w	r0,@(22,r11)
	mov	#0,r0
	mov.w	r0,@(24,r11)
	mov.w	.L0604434A,r0
	mov.w	r0,@(28,r11)
	mov	#32,r0
	mov.b	r0,@(1,r11)
	mov	#0,r0
	mov.w	r0,@(14,r11)
	mov.w	r0,@(16,r11)
	mov	#-127,r0
	mov.b	r0,@(8,r11)
	mov.l	@(40,r12),r0
	neg	r0,r0
	mov.l	r0,@(40,r12)
	mov.l	.L06044350,r0
	bra	.L0604417A
	mov.l	r0,@(36,r14)
.L06044348:
	.short 0x00AE
.L0604434A:
	.short 0x009E
.L0604434C:
	.long snd_seq_start
.L06044350:
	.long 0xFFFC0000
	endlabel func_0604423E

	glabel func_06044354
	mov.w	@(8,r1),r0
	dt	r0
	bf	.L06044370
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	tst	r2,r2
	bt	.L06044366
	mov	#-2,r0
	mov.b	r0,@(1,r2)
.L06044366:
	mov.l	.L0604436C,r0
	jmp	@r0
	nop
.L0604436C:
	.long obj_free
.L06044370:
	mov.w	r0,@(8,r1)
	mov.w	@(4,r1),r0
	add	#-16,r0
	mov.w	r0,@(4,r1)
	bra	.L0604417A
	sts.l	pr,@-r15
	dlabel D_0604437C
	.byte 0x00, 0x00, 0x00, 0x64
	.long D_06044388
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_06044388
	.byte 0x00, 0x00, 0xFF, 0xF6, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5A, 0x11, 0x24, 0x11, 0x32
	.byte 0x85, 0x11, 0x40, 0x01, 0x81, 0x1A, 0x90, 0x08, 0x81, 0x11, 0x50, 0x1D, 0x11, 0x01, 0x20, 0x0A
	.byte 0x81, 0x10, 0xD0, 0x02, 0x21, 0x06, 0x00, 0x0B, 0x71, 0x04, 0x02, 0x00
	.long D_060443B8
	dlabel D_060443B8
	.byte 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01
	.byte 0x40, 0x2B, 0x00, 0x09
	.long obj_free
	endlabel func_06044354

	glabel func_060443D0
	sts.l	pr,@-r15
	mov.l	.L060443F8,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L06044408
	mov.l	@(8,r1),r2
	mov.l	.L060443FC,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	mov.w	@(26,r1),r0
	mov	r0,r13
	mov.l	.L06044400,r0
	lds	r0,pr
	mov.l	.L06044404,r0
	jmp	@r0
	mov	#4,r7
.L060443F8:
	.long player_obj
.L060443FC:
	.long 0x00010000
.L06044400:
	.long .L0604442C
.L06044404:
	.long func_06017A98
.L06044408:
	mov.w	@(22,r1),r0
	cmp/eq	#0,r0
	bt	.L0604442C
	mov.l	@(8,r1),r2
	mov.l	.L06044460,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	mov.w	@(26,r1),r0
	mov	r0,r13
	mov.l	.L06044464,r0
	jsr	@r0
	mov	#4,r7
	mov.l	.L06044468,r2
	bsr	func_06043DB2
	mov.l	@r2,r2
.L0604442C:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06044484
	mov.l	.L0604446C,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06044470,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06044474,r13
	jsr	@r13
	mov.w	@(24,r1),r0
	mov.w	@(26,r1),r0
	tst	r0,r0
	bt	.L06044454
	mov.l	.L06044478,r13
	jsr	@r13
	nop
.L06044454:
	mov.l	.L0604447C,r0
	jsr	@r0
	mov.l	@(16,r1),r2
	mov.l	.L06044480,r0
	jmp	@r0
	lds.l	@r15+,pr
.L06044460:
	.long 0x00010000
.L06044464:
	.long func_06017A98
.L06044468:
	.long player_obj
.L0604446C:
	.long mtx_push
.L06044470:
	.long mtx_translate
.L06044474:
	.long mtx_rot_y
.L06044478:
	.long mtx_rot_z
.L0604447C:
	.long poly_draw_model_color
.L06044480:
	.long mtx_pop
.L06044484:
	mov.w	@(2,r1),r0
	mov	r0,r2
	mov.w	@(0,r1),r0
	add	r2,r0
	mov.w	r0,@(0,r1)
	mov.l	.L060444AC,r13
	jsr	@r13
	mov.w	@(0,r1),r0
	mov.w	@(20,r1),r0
	shll16	r0
	mov.l	@(4,r1),r5
	dmuls.l	r0,r10
	sts	mach,r0
	sts	macl,r10
	xtrct	r0,r10
	add	r10,r5
	lds.l	@r15+,pr
	rts
	mov.l	r5,@(52,r1)
	.byte 0x00, 0x00
.L060444AC:
	.long math_sin
	.byte 0xD0, 0x0C, 0x11, 0x03, 0x85, 0x1B, 0x60, 0x0D, 0x40, 0x19, 0x40, 0x08
	endlabel func_060443D0

	glabel func_060444BC
	mov.l	r0,@-r15
	neg	r0,r0
	mov.w	r0,@(6,r1)
	mov.w	@(26,r1),r0
	extu.w	r0,r0
	shlr8	r0
	shll2	r0
	mov.w	r0,@(4,r1)
	shll	r0
	mov.l	@r15+,r2
	add	r2,r0
	mov.l	r0,@(8,r1)
	xor	r0,r0
	mov.w	r0,@(24,r1)
	mov.w	r0,@(26,r1)
	mov.l	.L060444E8,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
	.byte 0x00, 0x00
	.long D_06044588
.L060444E8:
	.long func_060444EC
	endlabel func_060444BC

	glabel func_060444EC
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov.b	@(1,r2),r0
	cmp/pz	r0
	bt	.L06044504
	mov	#1,r0
	mov.b	r0,@(1,r2)
	mov.l	.L06044500,r0
	jmp	@r0
	nop
.L06044500:
	.long obj_free
.L06044504:
	mov.l	.L06044534,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L06044540
	mov.l	@(12,r1),r2
	mov	r2,r3
	mov.l	@(8,r1),r4
	mov.l	r4,@r3
	mov.w	@(6,r1),r0
	add	#14,r3
	mov.w	r0,@r3
	mov.w	@(4,r1),r0
	add	#8,r3
	mov.w	r0,@r3
	mov.l	.L06044538,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	xor	r12,r12
	xor	r13,r13
	mov.l	.L0604453C,r0
	jmp	@r0
	mov	#4,r7
.L06044534:
	.long player_obj
.L06044538:
	.long 0x00010000
.L0604453C:
	.long func_06017A98
.L06044540:
	mov.w	@(2,r1),r0
	tst	r0,r0
	bt	.L06044584
	mov.l	@(12,r1),r2
	mov	r2,r3
	mov.l	@(8,r1),r4
	mov.l	r4,@r3
	mov.w	@(6,r1),r0
	add	#14,r3
	mov.w	r0,@r3
	mov.w	@(4,r1),r0
	add	#8,r3
	mov.w	r0,@r3
	sts.l	pr,@-r15
	mov.l	.L06044578,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	xor	r12,r12
	xor	r13,r13
	mov.l	.L0604457C,r0
	jsr	@r0
	mov	#4,r7
	lds.l	@r15+,pr
	mov.l	.L06044580,r2
	bra	func_06043DB2
	mov.l	@r2,r2
	.byte 0x00, 0x00
.L06044578:
	.long 0x00010000
.L0604457C:
	.long func_06017A98
.L06044580:
	.long player_obj
.L06044584:
	rts
	nop
	dlabel D_06044588
	.byte 0x00, 0x00, 0x00, 0xC8
	.long D_06044594
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_06044594
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x85, 0x12, 0x60, 0x0D
	endlabel func_060444EC

	glabel func_060445A4
	mov.l	r0,@-r15
	neg	r0,r0
	mov.w	r0,@(6,r1)
	mov.w	@(22,r1),r0
	extu.w	r0,r0
	shlr8	r0
	shll2	r0
	mov.w	r0,@(4,r1)
	mov.l	r0,@-r15
	mov.w	@(26,r1),r0
	extu.w	r0,r0
	shlr8	r0
	shll2	r0
	mov.w	r0,@(12,r1)
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	add	r2,r0
	add	r3,r0
	mov.l	r0,@(8,r1)
	mov.l	.L060445DC,r0
	mov.l	r0,@(16,r1)
	xor	r0,r0
	mov.w	r0,@(26,r1)
	mov.l	.L060445E0,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
	.byte 0x00, 0x00
.L060445DC:
	.long D_060446AC
.L060445E0:
	.long func_060445E4
	endlabel func_060445A4

	glabel func_060445E4
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov.b	@(1,r2),r0
	cmp/pz	r0
	bt	.L060445FC
	mov	#1,r0
	mov.b	r0,@(1,r2)
	mov.l	.L060445F8,r0
	jmp	@r0
	nop
.L060445F8:
	.long obj_free
.L060445FC:
	mov.l	.L06044644,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L06044650
	mov.l	@(16,r1),r2
	mov	r2,r3
	mov.l	@(8,r1),r4
	mov.l	r4,@r3
	mov.w	@(6,r1),r0
	add	#14,r3
	mov.w	r0,@r3
	add	#4,r3
	mov.w	@(4,r1),r0
	neg	r0,r4
	mov	r0,r6
	mov.w	r4,@r3
	add	#2,r3
	mov.w	@(12,r1),r0
	neg	r0,r5
	mov.w	r5,@r3
	add	#2,r3
	mov.w	r6,@r3
	add	#2,r3
	mov.w	r0,@r3
	mov.l	.L06044648,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	xor	r13,r13
	mov.l	.L0604464C,r0
	jmp	@r0
	mov	#4,r7
	.byte 0x00, 0x00
.L06044644:
	.long player_obj
.L06044648:
	.long 0x00010000
.L0604464C:
	.long func_06017A98
.L06044650:
	mov.w	@(2,r1),r0
	tst	r0,r0
	bt	.L060446A8
	mov.l	@(16,r1),r2
	mov	r2,r3
	mov.l	@(8,r1),r4
	mov.l	r4,@r3
	mov.w	@(6,r1),r0
	add	#14,r3
	mov.w	r0,@r3
	add	#4,r3
	mov.w	@(4,r1),r0
	neg	r0,r4
	mov	r0,r6
	mov.w	r4,@r3
	add	#2,r3
	mov.w	@(12,r1),r0
	neg	r0,r5
	mov.w	r5,@r3
	add	#2,r3
	mov.w	r6,@r3
	add	#2,r3
	mov.w	r0,@r3
	sts.l	pr,@-r15
	mov.l	.L0604469C,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	xor	r13,r13
	mov.l	.L060446A0,r0
	jsr	@r0
	mov	#4,r7
	lds.l	@r15+,pr
	mov.l	.L060446A4,r2
	bra	func_06043DB2
	mov.l	@r2,r2
.L0604469C:
	.long 0x00010000
.L060446A0:
	.long func_06017A98
.L060446A4:
	.long player_obj
.L060446A8:
	rts
	nop
	endlabel func_060445E4

	.section .data.060446AC,"aw",@progbits
	.p2align 2
	dlabel D_060446AC
	.byte 0x00, 0x00, 0x00, 0xC8
	.long D_060446B8
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_060446B8
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09
	dlabel D_060446C8
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x80, 0x16, 0x85, 0x1D, 0x40, 0x19, 0x40, 0x09, 0x40, 0x09
	.byte 0x62, 0x03, 0xE0, 0x07, 0x01, 0x24, 0xE0, 0x00, 0x81, 0x1D, 0xD0, 0x0E, 0x11, 0x0B, 0xE0, 0x00
	.byte 0x81, 0x1D, 0xD0, 0x0D, 0x11, 0x0A, 0xE0, 0x00, 0x80, 0x1D, 0xE0, 0x00, 0x80, 0x1F, 0xD0, 0x0B
	.byte 0x11, 0x02, 0xE0, 0x40, 0xD2, 0x0A, 0x01, 0x26, 0xD6, 0x0A, 0x90, 0x08, 0x81, 0x60, 0x81, 0x61
	.byte 0x90, 0x06, 0x81, 0x62, 0x81, 0x63, 0xC7, 0x18, 0x21, 0x06, 0x00, 0x0B, 0x71, 0x04, 0x43, 0xEC
	.byte 0x11, 0xA0, 0x00, 0x00
	.long D_06044730
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.long D_0608A8F4
	.long VDP1_VRAM + 0xFFE0
	dlabel D_06044730
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x84, 0x16, 0x20, 0x08, 0x8B, 0x0C, 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x07
	.byte 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01, 0x40, 0x2B, 0x00, 0x09, 0x00, 0x00
	.long obj_free
