	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06035A74,"ax",@progbits
	.p2align 2
	.byte 0xD2, 0x05

	glabel func_06035A76
	sts.l	pr,@-r15
	mov.l	@r2,r2
	cmp/pl	r2
	bf	.L06035B34
	mov.l	.L06035A90,r12
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06035A94
	bra	.L06035A96
	mov	#-1,r11
	.byte 0x00, 0x00
	.long D_060CFFC4
.L06035A90:
	.long func_060172E4
.L06035A94:
	mov	#0,r11
.L06035A96:
	mov.w	@(2,r1),r0
	mov.w	.L06035ACC,r4
	add	#1,r0
	cmp/hs	r4,r0
	bt	.L06035B0C
	tst	#7,r0
	bf/s	.L06035B40
	mov.w	r0,@(2,r1)
	mov.w	.L06035ACE,r14
	shll16	r14
.L06035AAA:
	mov.l	@r2,r3
	cmp/pl	r3
	bt/s	.L06035AE6
	mov.l	@(4,r2),r13
	mov.l	@(48,r2),r4
	mov.l	@(52,r2),r5
	mov.l	@(56,r2),r6
	jsr	@r12
	mov	r14,r8
	cmp/pz	r0
	bt	.L06035AD0
	mov.l	r14,@-r15
	bsr	func_06035B5C
	mov.l	r12,@-r15
	mov.l	@r15+,r12
	bra	.L06035AE6
	mov.l	@r15+,r14
.L06035ACC:
	.short 0x1770
.L06035ACE:
	.short 0x0400
.L06035AD0:
	mov.l	r2,@-r15
	mov.l	.L06035B00,r0
	mov.l	.L06035B04,r2
	jsr	@r0
	nop
	mov.l	@r15+,r2
	mov.l	.L06035B08,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r3,@r2
	mov.l	r2,@r3
.L06035AE6:
	mov.b	@(13,r2),r0
	and	r11,r0
	mov.b	r0,@(13,r2)
	mov	r13,r2
	cmp/pl	r2
	bt	.L06035AAA
.L06035AF2:
	cmp/pz	r11
	bf	.L06035AFA
	bsr	func_06035CB8
	nop
.L06035AFA:
	lds.l	@r15+,pr
	rts
	nop
.L06035B00:
	.long obj_alloc
.L06035B04:
	.long obj_list_stage
.L06035B08:
	.long func_06036044
.L06035B0C:
	mov	#0,r0
	mov.w	r0,@(2,r1)
.L06035B10:
	mov.b	@(15,r2),r0
	and	#48,r0
	cmp/eq	#32,r0
	bf	.L06035B24
	mov	#69,r0
	mov.b	@(r0,r2),r3
	cmp/pl	r3
	bf	.L06035B22
	add	#-1,r3
.L06035B22:
	mov.b	r3,@(r0,r2)
.L06035B24:
	mov.b	@(13,r2),r0
	and	r11,r0
	mov.b	r0,@(13,r2)
	mov.l	@(4,r2),r2
	cmp/pl	r2
	bt	.L06035B10
	bra	.L06035AF2
	nop
.L06035B34:
	mov.l	.L06035B3C,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L06035B3C:
	.long obj_free
.L06035B40:
	mov.l	@r2,r0
	cmp/eq	#0,r0
	bf/s	.L06035B4C
	mov.l	@(4,r2),r13
	bsr	func_06035B5C
	nop
.L06035B4C:
	mov.b	@(13,r2),r0
	and	r11,r0
	mov.b	r0,@(13,r2)
	mov	r13,r2
	cmp/pl	r2
	bt	.L06035B40
	bra	.L06035AF2
	nop
	endlabel func_06035A76

	glabel func_06035B5C
	mov.b	@(15,r2),r0
	tst	#64,r0
	bt	.L06035B6C
	and	#48,r0
	cmp/eq	#0,r0
	bt	.L06035B6C
	cmp/eq	#16,r0
	bf	.L06035B70
.L06035B6C:
	rts
	nop
.L06035B70:
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	bsr	func_06035BA0
	mov.l	r11,@-r15
	mov	#64,r0
	mov.b	@(r0,r2),r8
	mov	#65,r0
	bsr	func_06035DFC
	mov.b	r8,@(r0,r2)
	bsr	func_06035E28
	nop
	bsr	func_06035F90
	nop
	mov.l	.L06035B9C,r0
	jsr	@r0
	mov.l	r2,@-r15
	bsr	func_06035FBA
	mov.l	@r15+,r2
	mov.l	@r15+,r11
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r13
.L06035B9C:
	.long path_place_obj
	endlabel func_06035B5C

	glabel func_06035BA0
	mov.b	@(14,r2),r0
	sts.l	pr,@-r15
	tst	#64,r0
	bf	.L06035C74
	mov.b	@(15,r2),r0
	tst	#128,r0
	bf	.L06035C0C
	mov.b	@(13,r2),r0
	tst	#8,r0
	bt	.L06035BEE
	and	#192,r0
	exts.b	r0,r0
	cmp/eq	#-128,r0
	bt	.L06035BD0
	cmp/eq	#-64,r0
	bt	.L06035BDE
	cmp/eq	#0,r0
	bt	.L06035BEA
.L06035BC4:
	bsr	func_06036940
	nop
	cmp/eq	#2,r0
	bt	.L06035C7E
	bra	.L06035C8E
	nop
.L06035BD0:
	mov.l	@(28,r2),r3
	mov	#64,r0
	mov.b	@(r0,r3),r0
	cmp/eq	#-1,r0
	bt	.L06035C7A
	bra	.L06035C86
	nop
.L06035BDE:
	bsr	func_06036940
	nop
	mov	#14,r0
	mov.b	@(r0,r3),r0
	tst	#16,r0
	bf	.L06035C7A
.L06035BEA:
	bra	.L06035C8E
	nop
.L06035BEE:
	tst	#4,r0
	bt	.L06035C8E
	and	#48,r0
	cmp/eq	#32,r0
	bt	.L06035C92
	cmp/eq	#48,r0
	bt	.L06035C92
	cmp/eq	#0,r0
	bt	.L06035BEA
.L06035C00:
	bsr	func_06036946
	nop
	cmp/eq	#2,r0
	bt	.L06035C96
	bra	.L06035C8E
	nop
.L06035C0C:
	mov.b	@(13,r2),r0
	tst	#8,r0
	bt	.L06035C4E
	and	#192,r0
	exts.b	r0,r0
	cmp/eq	#-64,r0
	bt	.L06035BC4
	cmp/eq	#64,r0
	bt	.L06035C3E
	cmp/eq	#0,r0
	bt	.L06035C8E
	bsr	func_06036940
	nop
	mov	#14,r0
	mov.b	@(r0,r2),r0
	tst	#16,r0
	bf	.L06035C9A
	bra	.L06035C8E
	nop
	.byte 0xE0, 0x40, 0x00, 0x3C, 0x88, 0xFF, 0x89, 0x2F, 0xA0, 0x24, 0x00, 0x09
.L06035C3E:
	bsr	func_06036940
	nop
	mov	#14,r0
	mov.b	@(r0,r2),r0
	tst	#16,r0
	bf	.L06035C9A
	bra	.L06035C8E
	nop
.L06035C4E:
	tst	#4,r0
	bt	.L06035C8E
	and	#48,r0
	cmp/eq	#32,r0
	bt	.L06035C64
	cmp/eq	#16,r0
	bt	.L06035C64
	cmp/eq	#0,r0
	bt	.L06035C8E
	bra	.L06035C00
	nop
.L06035C64:
	bsr	func_06036946
	nop
	mov	#14,r0
	mov.b	@(r0,r2),r0
	tst	#16,r0
	bf	.L06035C9E
	bra	.L06035C8E
	nop
.L06035C74:
	mov	#65,r0
	bra	.L06035CA4
	mov.b	@(r0,r2),r4
.L06035C7A:
	bra	.L06035CA0
	mov	#22,r4
.L06035C7E:
	bra	.L06035CA0
	mov	#32,r4
	.byte 0xA0, 0x0F, 0xE4, 0x23
.L06035C86:
	bra	.L06035CA4
	mov	#21,r4
	.byte 0xA0, 0x0B, 0xE4, 0x22
.L06035C8E:
	bra	.L06035CA4
	mov	#0,r4
.L06035C92:
	bra	.L06035CA0
	mov	#26,r4
.L06035C96:
	bra	.L06035CA0
	mov	#33,r4
.L06035C9A:
	bra	.L06035CA0
	mov	#68,r4
.L06035C9E:
	mov	#28,r4
.L06035CA0:
	mov	#0,r0
	mov.w	r0,@(24,r2)
.L06035CA4:
	mov	#64,r0
	mov.b	r4,@(r0,r2)
	mov.l	.L06035CB4,r0
	shll2	r4
	mov.l	@(r0,r4),r4
	jmp	@r4
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L06035CB4:
	.long D_060395B0
	endlabel func_06035BA0

	glabel func_06035CB8
	mov.l	.L06035D20,r14
	sts.l	pr,@-r15
	mov.l	@r14,r14
.L06035CBE:
	mov.b	@(14,r14),r0
	cmp/pz	r0
	bf	.L06035D5C
	mov.l	@(4,r14),r12
.L06035CC6:
	cmp/pl	r12
	bf	.L06035D5C
	mov.b	@(14,r12),r0
	cmp/pz	r0
	bf	.L06035D58
	mov	#12,r0
	mov.b	@(r0,r14),r3
	mov.b	@(r0,r12),r4
	cmp/eq	r3,r4
	bf	.L06035D58
	mov.l	@(60,r14),r8
	mov.l	@(60,r12),r3
	mov	#16,r6
	sub	r8,r3
	mov	#13,r0
	shll16	r6
	mov.b	@(r0,r14),r4
	cmp/ge	r6,r3
	bt/s	.L06035D68
	mov.b	@(r0,r12),r5
	neg	r6,r6
	cmp/gt	r3,r6
	bt	.L06035D68
	mov.l	@(52,r14),r9
	mov.l	@(52,r12),r7
	sub	r9,r7
	cmp/gt	r7,r6
	bt	.L06035D68
	neg	r6,r6
	cmp/ge	r6,r7
	bt	.L06035D68
	mov	#1,r2
	shll16	r2
	shar	r6
	mov	#2,r0
	cmp/pl	r3
	bt/s	.L06035D24
	not	r0,r11
	or	r0,r5
	neg	r6,r6
	cmp/gt	r3,r6
	bt/s	.L06035D32
	and	r11,r4
	bra	.L06035D2C
	neg	r2,r2
.L06035D20:
	.long D_060CFFC4
.L06035D24:
	or	r0,r4
	cmp/ge	r6,r3
	bt/s	.L06035D32
	and	r11,r5
.L06035D2C:
	mov.l	@(60,r12),r8
	add	r2,r8
	mov.l	r8,@(60,r12)
.L06035D32:
	mov.l	r12,@(28,r14)
	mov.l	r14,@(28,r12)
	mov	#8,r9
	or	r9,r4
	or	r9,r5
	mov	#-64,r8
	mov	#63,r9
	mov	#15,r0
	mov.b	@(r0,r14),r6
	mov.b	@(r0,r12),r7
	and	r9,r4
	and	r9,r5
	and	r8,r7
	and	r8,r6
	or	r7,r4
	or	r6,r5
	mov	#13,r0
	mov.b	r4,@(r0,r14)
	mov.b	r5,@(r0,r12)
.L06035D58:
	bra	.L06035CC6
	mov.l	@(4,r12),r12
.L06035D5C:
	mov.l	@(4,r14),r14
	cmp/pl	r14
	bt	.L06035CBE
	lds.l	@r15+,pr
	rts
	nop
.L06035D68:
	mov	#67,r0
	mov.b	@(r0,r14),r0
	and	#15,r0
	shll2	r0
	shll2	r0
	swap.w	r0,r6
	cmp/gt	r6,r3
	bt	.L06035D58
	neg	r6,r6
	cmp/gt	r3,r6
	bt	.L06035D58
	mov	#4,r6
	cmp/pl	r3
	bt/s	.L06035D8E
	mov	#1,r0
	or	r0,r5
	not	r0,r0
	bra	.L06035D94
	and	r0,r4
.L06035D8E:
	or	r0,r4
	not	r0,r0
	and	r0,r5
.L06035D94:
	or	r6,r4
	mov	#-64,r8
	extu.b	r8,r8
	mov.b	@(15,r12),r0
	mov	#-49,r9
	and	r9,r4
	and	r8,r0
	shlr2	r0
	or	r4,r0
	mov.b	r0,@(13,r14)
	mov.l	r12,@(32,r14)
	or	r6,r5
	mov.b	@(15,r14),r0
	and	r9,r5
	and	r8,r0
	shlr2	r0
	or	r5,r0
	mov.b	r0,@(13,r12)
	bra	.L06035D58
	mov.l	r14,@(32,r12)
	endlabel func_06035CB8

	glabel func_06035DBC
	mov.l	.L06035DE8,r3
	mov.l	@r3,r2
	cmp/pl	r2
	bf	.L06035DF0
	mov.l	@(4,r2),r0
	mov.l	r0,@r3
	cmp/pl	r0
	bf	.L06035DD0
	mov.l	@(8,r2),r3
	mov.l	r3,@(8,r0)
.L06035DD0:
	mov.l	.L06035DEC,r3
	mov.l	@r3,r0
	cmp/pl	r0
	bf	.L06035DF4
	mov.l	@(4,r0),r3
	mov.l	r3,@(4,r2)
	cmp/pl	r3
	bf	.L06035DE2
	mov.l	r2,@(8,r3)
.L06035DE2:
	mov.l	r2,@(4,r0)
	rts
	mov.l	r0,@(8,r2)
.L06035DE8:
	.long D_060CFFC8
.L06035DEC:
	.long D_060CFFC4
.L06035DF0:
	rts
	mov	#-1,r2
.L06035DF4:
	mov.l	r2,@r3
	mov.l	r0,@(4,r2)
	rts
	mov.l	r0,@(8,r2)
	endlabel func_06035DBC

	glabel func_06035DFC
	mov.w	@(18,r2),r0
	cmp/pl	r0
	bt	.L06035E0A
	cmp/pz	r0
	bt	.L06035E10
.L06035E06:
	rts
	nop
.L06035E0A:
	add	#-1,r0
	rts
	mov.w	r0,@(18,r2)
.L06035E10:
	mov.w	.L06035E24,r6
	mov.l	@(40,r2),r4
	shll8	r6
	cmp/ge	r6,r4
	bt	.L06035E06
	mov.w	.L06035E26,r5
	shll8	r5
	add	r5,r4
	rts
	mov.l	r4,@(40,r2)
.L06035E24:
	.short 0x0100
.L06035E26:
	.short 0x0040
	endlabel func_06035DFC

	glabel func_06035E28
	mov.b	@(15,r2),r0
	tst	#48,r0
	bt	.L06035EB0
	mov	#120,r0
	mov.l	@(r0,r2),r3
	mov.l	@r2,r4
	add	#1,r3
	mov.l	r3,@(r0,r2)
	cmp/pl	r4
	bt	.L06035E42
	mov	#7,r4
	tst	r4,r3
	bf	.L06035EB0
.L06035E42:
	sts.l	pr,@-r15
	bsr	func_06035EBC
	nop
	lds.l	@r15+,pr
	mov.l	@(60,r2),r6
	mov.l	@(52,r2),r7
	mov.l	@(36,r2),r4
	mov.l	@(40,r2),r5
	add	r4,r6
	add	r5,r7
	mov.l	r6,@(60,r2)
	mov.l	r7,@(52,r2)
	mov.l	r2,@-r15
	mov.l	@(544,gbr),r0
	sts.l	pr,@-r15
	mov.l	@(56,r2),r3
	jsr	@r0
	mov.l	@(48,r2),r2
	lds.l	@r15+,pr
	mov.l	@r15+,r2
	mov	#16,r0
	mov	#16,r3
	shll16	r0
	shll16	r3
	mov.l	@(52,r2),r6
	add	r0,r4
	sub	r3,r5
	cmp/eq	r6,r5
	bt	.L06035E86
	cmp/gt	r6,r5
	bt	.L06035EA0
	mov	#0,r0
	mov.l	r5,@(52,r2)
	mov.l	r0,@(40,r2)
.L06035E86:
	mov.b	@(15,r2),r0
	mov.l	.L06035E9C,r3
	and	#12,r0
	shlr	r0
	mov.w	@(r0,r3),r0
	mov.w	r0,@(18,r2)
	mov.b	@(14,r2),r0
	or	#1,r0
	bra	.L06035EB0
	mov.b	r0,@(14,r2)
	.byte 0x00, 0x00
.L06035E9C:
	.long D_06035EB4
.L06035EA0:
	mov.b	@(14,r2),r0
	and	#254,r0
	mov.b	r0,@(14,r2)
	cmp/gt	r4,r6
	bt	.L06035EB0
	mov	#0,r0
	mov.l	r4,@(52,r2)
	mov.l	r0,@(40,r2)
.L06035EB0:
	rts
	nop
	dlabel D_06035EB4
	.byte 0x02, 0x58, 0x04, 0xB0, 0x07, 0x08, 0xFF, 0xFF
	endlabel func_06035E28

	glabel func_06035EBC
	mov.l	@(60,r2),r3
	mov	#12,r0
	mov.l	r3,@(60,r1)
	mov.b	@(r0,r2),r3
	mov	#31,r0
	mov.b	r3,@(r0,r1)
	sts.l	pr,@-r15
	mov.l	.L06035F74,r3
	mov.b	@(20,gbr),r0
	and	#254,r0
	mov.w	@(r0,r3),r0
	add	r0,r3
	mov.l	@(48,r2),r13
	mov.l	@(56,r2),r14
	mov.l	r2,@-r15
	mov.l	.L06035F78,r2
	mov.l	@r2,r2
	mov.l	.L06035F7C,r8
.L06035EE0:
	mov.w	@r3+,r4
	cmp/pz	r4
	bf	.L06035F88
	mov	#31,r0
	mov.b	r4,@(r0,r2)
	mov.w	@r3+,r4
	shll16	r4
	mov.w	@r3+,r5
	shll16	r5
	mov.w	@r3+,r6
	shll16	r6
	mov	r13,r0
	sub	r4,r0
	cmp/gt	r8,r0
	bt	.L06035F84
	neg	r8,r8
	cmp/gt	r0,r8
	bt/s	.L06035F84
	neg	r8,r8
	mov	r14,r0
	sub	r5,r0
	cmp/gt	r8,r0
	bt	.L06035F84
	neg	r8,r8
	cmp/gt	r0,r8
	bt/s	.L06035F84
	neg	r8,r8
	mov.l	r6,@(60,r2)
	mov.l	.L06035F80,r0
	jsr	@r0
	mov.l	r8,@-r15
	mov.l	@r15+,r8
	cmp/ge	r8,r0
	bt	.L06035F84
	neg	r8,r8
	cmp/gt	r0,r8
	bt/s	.L06035F84
	neg	r8,r8
	cmp/pl	r0
	bf	.L06035F32
	neg	r8,r8
.L06035F32:
	add	r0,r8
	mov.l	@r15+,r2
	mov.l	@(60,r2),r3
	add	r8,r3
	mov.l	r3,@(60,r2)
	mov.l	@(36,r2),r0
	neg	r0,r0
	mov.l	r0,@(36,r2)
	mov.l	@(44,r2),r0
	neg	r0,r0
	mov.l	r0,@(44,r2)
	mov.w	@(18,r2),r0
	cmp/eq	#0,r0
	bt	.L06035F64
	mov.w	.L06035F70,r3
	mov.w	@(20,r2),r0
	cmp/ge	r3,r0
	bt	.L06035F68
	mov.l	@(40,r2),r3
	mov	#-2,r0
	shll16	r0
	cmp/gt	r0,r3
	bt	.L06035F62
	mov	r3,r0
.L06035F62:
	mov.l	r0,@(40,r2)
.L06035F64:
	mov.w	.L06035F72,r0
	mov.w	r0,@(20,r2)
.L06035F68:
	lds.l	@r15+,pr
	mov	#-1,r0
	rts
	mov.w	r0,@(22,r2)
.L06035F70:
	.short 0x00F0
.L06035F72:
	.short 0x0258
.L06035F74:
	.long D_060397B6
.L06035F78:
	.long D_06035A70
.L06035F7C:
	.long 0x00900000
.L06035F80:
	.long func_06018D64
.L06035F84:
	bra	.L06035EE0
	nop
.L06035F88:
	mov.l	@r15+,r2
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06035EBC

	glabel func_06035F90
	mov.l	@(48,r2),r3
	mov.l	@(52,r2),r4
	mov.l	@(56,r2),r5
	mov.l	r3,@(48,r1)
	mov.l	r4,@(52,r1)
	mov.l	r5,@(56,r1)
	mov.l	@(60,r2),r3
	mov.l	@(36,r2),r4
	mov.l	@(40,r2),r5
	mov.l	r3,@(60,r1)
	mov.l	r4,@(32,r1)
	mov.l	r5,@(36,r1)
	mov.l	@(44,r2),r3
	mov	#12,r0
	add	r2,r0
	mov.l	r3,@(40,r1)
	mov	#31,r4
	mov.b	@r0,r3
	add	r1,r4
	rts
	mov.b	r3,@r4
	endlabel func_06035F90

	glabel func_06035FBA
	mov.l	@(48,r1),r3
	mov.l	@(52,r1),r4
	mov.l	@(56,r1),r5
	mov.l	r3,@(48,r2)
	mov.l	r4,@(52,r2)
	mov.l	r5,@(56,r2)
	mov.l	@(60,r1),r3
	mov.l	@(32,r1),r4
	mov.l	@(36,r1),r5
	mov.l	r3,@(60,r2)
	mov.l	r4,@(36,r2)
	mov.l	r5,@(40,r2)
	mov.l	@(40,r1),r3
	mov	#31,r0
	add	r1,r0
	mov.l	r3,@(44,r2)
	mov	#12,r5
	mov.b	@r0,r3
	add	r2,r5
	rts
	mov.b	r3,@r5
	endlabel func_06035FBA

	glabel func_06035FE4
	mov.b	@(15,r2),r0
	and	#207,r0
	mov.b	r0,@(15,r2)
	mov	#-1,r0
	mov.l	r0,@r2
	mov.l	@(4,r2),r3
	cmp/pl	r3
	bf	.L06036028
	mov.l	@(8,r2),r4
	cmp/pl	r4
	bt/s	.L06036008
	mov.l	r4,@(8,r3)
	mov.l	.L06036004,r4
	bra	.L0603600A
	mov.l	r3,@r4
	.byte 0x00, 0x00
.L06036004:
	.long D_060CFFC4
.L06036008:
	mov.l	r3,@(4,r4)
.L0603600A:
	mov.l	.L06036024,r4
	mov.l	@r4,r0
	cmp/pl	r0
	bf	.L06036032
	mov.l	r0,@(8,r2)
	mov.l	@(4,r0),r3
	mov.l	r2,@(4,r0)
	mov.l	r3,@(4,r2)
	cmp/pl	r0
	bf	.L06036020
	mov.l	r2,@(8,r3)
.L06036020:
	rts
	nop
.L06036024:
	.long D_060CFFC8
.L06036028:
	mov.l	@(8,r2),r4
	cmp/pl	r4
	bf	.L0603603A
	bra	.L0603600A
	mov.l	r3,@(4,r4)
.L06036032:
	mov.l	r2,@r4
	mov.l	r0,@(8,r2)
	rts
	mov.l	r0,@(4,r2)
.L0603603A:
	mov.l	.L06036040,r3
	bra	.L0603600A
	mov.l	r4,@r3
.L06036040:
	.long D_060CFFC4
	endlabel func_06035FE4

	glabel func_06036044
	mov.b	@(20,gbr),r0
	mov.l	.L06036078,r3
	shlr	r0
	shll2	r0
	mov.l	@(r0,r3),r3
	mov.l	r3,@(44,r1)
	sts.l	pr,@-r15
	bsr	func_06035F90
	mov.l	@r1,r2
	mov.l	.L0603607C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.b	@(15,r2),r0
	and	#48,r0
	cmp/eq	#16,r0
	bt	.L0603611C
	cmp/eq	#0,r0
	bt	.L06036134
	mov.b	@(15,r2),r0
	tst	#192,r0
	bt	.L060360A4
	tst	#64,r0
	bf	.L06036080
	bra	.L06036094
	nop
.L06036078:
	.long D_06039594
.L0603607C:
	.long func_0603725C
.L06036080:
	tst	#128,r0
	bf	.L06036094
	mov.l	.L0603609C,r0
	mov.b	@r0,r0
	mov	#3,r3
	cmp/ge	r3,r0
	bf	.L06036094
	mov	#66,r0
	mov	#0,r3
	mov.b	r3,@(r0,r2)
.L06036094:
	mov.l	.L060360A0,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L0603609C:
	.long D_060CFFA2
.L060360A0:
	.long func_060362EC
.L060360A4:
	mov.b	@(15,r2),r0
	and	#3,r0
	mov	#2,r3
	cmp/ge	r3,r0
	bf	.L060360E8
	mov	#116,r0
	mov.b	@(r0,r2),r3
	mov	#-128,r4
	or	r4,r3
	mov.b	r3,@(r0,r2)
	mov.l	.L0603610C,r3
	mov.b	@(0,r3),r0
	cmp/pz	r0
	bt	.L060360E8
	mov	#0,r0
	mov.b	r0,@(0,r3)
	mov.l	.L06036110,r4
	mov.b	@(20,gbr),r0
	mov.w	@(r0,r4),r5
	add	r5,r4
	mov.w	@r4+,r8
	mov.l	.L06036114,r7
	mov.l	@r7,r0
	rotl	r0
	xor	r2,r0
	mov.l	r0,@r7
	mov	#0,r7
	mov	#-1,r14
	shll8	r14
	mov.l	r8,@(0,r14)
	mov.l	r7,@(16,r14)
	mov.l	r0,@(20,r14)
	mov.l	@(24,r14),r0
	mov.b	r0,@(1,r3)
.L060360E8:
	mov.l	.L06036110,r4
	mov.b	@(20,gbr),r0
	mov.w	@(r0,r4),r5
	add	r5,r4
	mov.b	@(1,r3),r0
	add	#2,r4
	shll2	r0
	add	r0,r4
	mov.w	@r4+,r5
	mov	#12,r0
	mov.b	r5,@(r0,r2)
	mov.w	@r4,r5
	shll16	r5
	mov.l	r5,@(60,r2)
	mov.l	.L06036118,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L0603610C:
	.long snd_tone_select
.L06036110:
	.long D_06039734
.L06036114:
	.long D_06035A6C
.L06036118:
	.long func_060366B4
.L0603611C:
	mov	#24,r4
	mov	#64,r0
	mov.b	r4,@(r0,r2)
	mov	#0,r0
	mov.l	r0,@(36,r2)
	mov.l	.L06036130,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
	.byte 0x00, 0x00
.L06036130:
	.long func_06036140
.L06036134:
	mov.l	.L0603613C,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L0603613C:
	.long func_0603625C
	endlabel func_06036044

	glabel func_06036140
	mov.w	@(30,r1),r0
	sts.l	pr,@-r15
	cmp/pz	r0
	bt/s	.L0603616C
	mov.l	@r1,r2
	mov.l	.L06036164,r12
	mov.w	.L06036160,r8
	jsr	@r12
	shll16	r8
	cmp/pz	r0
	bt	.L0603616C
	mov	#0,r0
	mov.l	.L06036168,r3
	mov.l	r0,@r2
	jmp	@r3
	lds.l	@r15+,pr
.L06036160:
	.short 0x0480
	.byte 0x00, 0x00
.L06036164:
	.long obj_find_near_player
.L06036168:
	.long obj_free
.L0603616C:
	mov.b	@(15,r2),r0
	and	#48,r0
	cmp/eq	#48,r0
	bt	.L060361A8
	mov.l	.L06036198,r0
	jsr	@r0
	nop
	mov.l	.L0603619C,r8
	mov.l	@r8,r8
	mov	#31,r0
	mov.b	@(r0,r8),r8
	mov.b	@(12,r2),r0
	cmp/eq	r0,r8
	bf	.L06036194
	mov.l	.L060361A0,r9
	mov.l	.L060361A4,r0
	mov.l	r2,@-r15
	jsr	@r0
	mov	#40,r8
	mov.l	@r15+,r2
.L06036194:
	bra	.L060361C8
	mov.w	@(26,r2),r0
.L06036198:
	.long func_06037360
.L0603619C:
	.long player_obj
.L060361A0:
	.long 0x80000008
.L060361A4:
	.long func_06016824
.L060361A8:
	mov.b	@(15,r2),r0
	tst	#192,r0
	bt	.L060361B8
	mov.l	.L060361B4,r4
	bra	.L060361BA
	nop
.L060361B4:
	.long func_060362EC
.L060361B8:
	mov.l	.L0603621C,r4
.L060361BA:
	mov.l	.L06036220,r0
	mov.l	r4,@-r1
	jsr	@r0
	add	#4,r1
	mov	#0,r0
	mov.w	r0,@(24,r2)
	mov.w	.L06036218,r0
.L060361C8:
	bsr	func_06035E28
	mov.w	r0,@(100,gbr)
	bsr	func_06035F90
	nop
	mov.l	.L06036224,r0
	jsr	@r0
	mov.l	r2,@-r15
	mov.l	@r15+,r2
	bsr	func_06035FBA
	nop
	mov	#64,r0
	mov.b	@(r0,r2),r5
	mov	#65,r0
	mov.b	@(r0,r2),r0
	mov.l	r2,@-r15
	cmp/eq	r5,r0
	bt	.L060361F2
	mov	#0,r0
	mov.w	r0,@(20,r1)
	mov.b	r0,@(14,r1)
	mov.b	r0,@(15,r1)
.L060361F2:
	mov.l	.L06036228,r3
	mov	#65,r0
	mov.b	r5,@(r0,r2)
	extu.b	r5,r0
	mov.b	@(r0,r3),r0
	mov.l	.L0603622C,r3
	extu.b	r0,r0
	shll	r0
	mov.l	.L06036230,r7
	mov.w	@(r0,r3),r2
	jsr	@r7
	add	r3,r2
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06036234
	mov.l	@r15+,r2
	lds.l	@r15+,pr
	rts
	nop
.L06036218:
	.short 0x0100
	.byte 0x00, 0x00
.L0603621C:
	.long func_060366B4
.L06036220:
	.long func_060373E4
.L06036224:
	.long path_place_obj
.L06036228:
	.long D_060398BA
.L0603622C:
	.long D_06039A2E
.L06036230:
	.long spr_anim_step
.L06036234:
	mov.l	.L06036250,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	.L06036254,r0
	mov.l	@(52,r1),r5
	jsr	@r0
	mov.l	@(56,r1),r6
	bsr	func_06036CF6
	mov.l	@r15+,r2
	mov.l	.L06036258,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L06036250:
	.long mtx_push
.L06036254:
	.long mtx_translate
.L06036258:
	.long mtx_pop
	endlabel func_06036140

	glabel func_0603625C
	sts.l	pr,@-r15
	mov.w	@(30,r1),r0
	cmp/pz	r0
	bt/s	.L06036288
	mov.l	@r1,r2
	mov.l	.L06036280,r12
	mov.w	.L0603627C,r8
	jsr	@r12
	shll16	r8
	cmp/pz	r0
	bt	.L06036288
	mov	#0,r3
	mov.l	.L06036284,r0
	mov.l	r3,@r2
	jmp	@r0
	lds.l	@r15+,pr
.L0603627C:
	.short 0x0480
	.byte 0x00, 0x00
.L06036280:
	.long obj_find_near_player
.L06036284:
	.long obj_free
.L06036288:
	mov.w	.L060362B4,r0
	mov.w	r0,@(100,gbr)
	mov	#64,r0
	mov.b	@(r0,r2),r0
	mov.l	.L060362B8,r3
	extu.b	r0,r0
	mov.b	@(r0,r3),r0
	mov.l	r2,@-r15
	extu.b	r0,r0
	mov.l	.L060362BC,r3
	add	r0,r0
	mov.l	.L060362C0,r7
	mov.w	@(r0,r3),r2
	jsr	@r7
	add	r3,r2
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L060362C4
	mov.l	@r15+,r2
	lds.l	@r15+,pr
	rts
	nop
.L060362B4:
	.short 0x0100
	.byte 0x00, 0x00
.L060362B8:
	.long D_060398BA
.L060362BC:
	.long D_06039A2E
.L060362C0:
	.long spr_anim_step
.L060362C4:
	mov.l	.L060362E0,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	.L060362E4,r0
	mov.l	@(52,r1),r5
	jsr	@r0
	mov.l	@(56,r1),r6
	bsr	func_06036CF6
	mov.l	@r15+,r2
	mov.l	.L060362E8,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L060362E0:
	.long mtx_push
.L060362E4:
	.long mtx_translate
.L060362E8:
	.long mtx_pop
	endlabel func_0603625C

	glabel func_060362EC
	sts.l	pr,@-r15
	mov.w	@(30,r1),r0
	cmp/pz	r0
	bt/s	.L06036340
	mov.l	@r1,r2
	mov.l	.L06036328,r12
	mov.w	.L06036326,r8
	jsr	@r12
	shll16	r8
	cmp/pz	r0
	bt	.L06036340
	mov	#69,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#0,r0
	bf	.L06036330
	mov	#6,r4
	mov	#64,r0
	mov.b	r4,@(r0,r2)
	mov.b	@(15,r2),r0
	mov.l	.L0603632C,r3
	extu.b	r0,r0
	shll2	r0
	shlr8	r0
	mov.b	@(r0,r3),r4
	add	#-1,r4
	bsr	func_06035FE4
	mov.b	r4,@(r0,r3)
	bra	.L06036334
	nop
.L06036326:
	.short 0x0480
.L06036328:
	.long obj_find_near_player
.L0603632C:
	.long D_060CFFCC
.L06036330:
	mov	#0,r0
	mov.l	r0,@r2
.L06036334:
	mov.l	.L0603633C,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L0603633C:
	.long obj_free
.L06036340:
	mov	#64,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#6,r0
	bt	.L060363B0
	mov.b	@(15,r2),r0
	and	#48,r0
	cmp/eq	#48,r0
	bt	.L060363C8
	mov.l	.L0603637C,r0
	mov.l	r2,@-r15
	jsr	@r0
	mov	#16,r8
	mov.l	@r15+,r2
	cmp/pz	r0
	bf	.L060363E0
	mov.w	r0,@(18,r2)
	mov.b	@(15,r2),r0
	tst	#128,r0
	bf	.L06036388
	mov.l	.L06036380,r3
	mov.b	@r3,r4
	add	#1,r4
	mov.b	r4,@r3
	mov	#1,r5
	mov.l	.L06036384,r0
	mov	#41,r6
	jsr	@r0
	mov	#3,r4
	bra	.L06036392
	nop
.L0603637C:
	.long func_06017C90
.L06036380:
	.long D_060CFFA2
.L06036384:
	.long snd_seq_start
.L06036388:
	mov	#1,r5
	mov.l	.L060363C0,r0
	mov	#44,r6
	jsr	@r0
	mov	#3,r4
.L06036392:
	mov	#30,r0
	mov	#0,r3
	mov.b	r3,@(r0,r1)
	mov.b	@(13,r2),r0
	tst	#1,r0
	bt	.L060363B0
	mov.l	@(32,r2),r3
	mov.l	@r3,r0
	cmp/pl	r0
	bf	.L060363B0
	mov	#66,r0
	mov.b	@(r0,r3),r4
	mov	#-16,r5
	and	r5,r4
	mov.b	r4,@(r0,r3)
.L060363B0:
	bsr	func_06037278
	nop
	mov.l	@r2,r0
	cmp/eq	#-1,r0
	bf	.L060363FA
	mov.l	.L060363C4,r0
	jmp	@r0
	lds.l	@r15+,pr
.L060363C0:
	.long snd_seq_start
.L060363C4:
	.long obj_free
.L060363C8:
	mov.l	.L060363DC,r0
	jsr	@r0
	nop
	mov	#0,r0
	mov.w	r0,@(24,r2)
	mov.w	.L060363D8,r0
	bra	.L060363E8
	mov.w	r0,@(100,gbr)
.L060363D8:
	.short 0x0100
	.byte 0x00, 0x00
.L060363DC:
	.long func_060373E4
.L060363E0:
	bsr	func_060364E8
	nop
	bsr	func_06035DFC
	nop
.L060363E8:
	bsr	func_06035E28
	nop
	bsr	func_06035F90
	nop
	mov.l	.L0603643C,r0
	jsr	@r0
	mov.l	r2,@-r15
	bsr	func_06035FBA
	mov.l	@r15+,r2
.L060363FA:
	mov	#64,r0
	mov.b	@(r0,r2),r5
	mov	#65,r0
	mov.b	@(r0,r2),r6
	cmp/eq	r6,r5
	bt/s	.L06036416
	mov.b	r5,@(r0,r2)
	mov.l	.L06036440,r0
	mov.b	@(r0,r6),r6
	mov	#0,r0
	mov.w	r0,@(20,r1)
	cmp/pz	r6
	bt/s	.L06036478
	mov.w	r0,@(14,r1)
.L06036416:
	mov.l	.L06036444,r3
	extu.b	r5,r0
	mov.b	@(r0,r3),r5
	mov.l	r2,@-r15
	mov.l	.L06036448,r3
	extu.b	r5,r0
	shll	r0
	mov.l	.L0603644C,r7
	mov.w	@(r0,r3),r2
	jsr	@r7
	add	r3,r2
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06036450
	mov.l	@r15+,r2
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0603643C:
	.long path_place_obj
.L06036440:
	.long D_0603946E
.L06036444:
	.long D_060398BA
.L06036448:
	.long D_06039A2E
.L0603644C:
	.long spr_anim_step
.L06036450:
	mov.l	.L0603646C,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	.L06036470,r0
	mov.l	@(52,r1),r5
	jsr	@r0
	mov.l	@(56,r1),r6
	bsr	func_06036CF6
	mov.l	@r15+,r2
	mov.l	.L06036474,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L0603646C:
	.long mtx_push
.L06036470:
	.long mtx_translate
.L06036474:
	.long mtx_pop
.L06036478:
	mov	#0,r0
	mov.w	r0,@(24,r2)
	mov.b	@(14,r2),r0
	mov.l	r2,@-r15
	mov	r0,r7
	mov.l	.L060364D8,r0
	mov.l	.L060364DC,r2
	jsr	@r0
	nop
	mov.l	.L060364E0,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov	r6,r0
	mov.w	r0,@(2,r3)
	mov	#0,r0
	mov.b	r0,@(4,r3)
	mov.l	.L060364E4,r4
	mov.w	.L060364D4,r0
	mov.l	r4,@(44,r3)
	mov.l	@(48,r1),r2
	mov.w	r0,@r3
	mov.l	@(52,r1),r4
	mov.l	r2,@(48,r3)
	mov	#0,r0
	mov.l	r4,@(52,r3)
	mov.l	@(56,r1),r6
	mov.w	r0,@(26,r3)
	mov.l	@(60,r1),r2
	mov.l	r6,@(56,r3)
	mov.w	@(30,r1),r0
	mov.l	r2,@(60,r3)
	mov.w	r0,@(30,r3)
	mov	r7,r0
	mov	#2,r2
	and	#2,r0
	shll16	r2
	cmp/eq	#0,r0
	bt	.L060364C6
	neg	r2,r2
.L060364C6:
	mov.l	r2,@(32,r3)
	mov.l	r2,@(40,r3)
	mov	#-4,r4
	shll16	r4
	mov.l	r4,@(36,r3)
	bra	.L06036416
	mov.l	@r15+,r2
.L060364D4:
	.short 0x00B4
	.byte 0x00, 0x00
.L060364D8:
	.long obj_alloc
.L060364DC:
	.long obj_list_stage
.L060364E0:
	.long func_06038CCC
.L060364E4:
	.long D_0603A914
	endlabel func_060362EC

	glabel func_060364E8
	sts.l	pr,@-r15
	mov	#30,r0
	mov.b	@(r0,r1),r0
	tst	#2,r0
	bf	.L06036510
	tst	#4,r0
	bf	.L0603650A
	mov	#69,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#0,r0
	bt	.L06036514
	mov.b	@(14,r2),r0
	tst	#64,r0
	bt	.L06036518
	mov	#65,r0
	bra	.L0603668C
	mov.b	@(r0,r2),r4
.L0603650A:
	mov	#0,r3
	mov	#30,r0
	mov.b	r3,@(r0,r1)
.L06036510:
	bra	.L06036692
	mov	#2,r4
.L06036514:
	bra	.L06036692
	mov	#17,r4
.L06036518:
	mov.b	@(15,r2),r0
	tst	#128,r0
	bf	.L06036586
	mov.b	@(13,r2),r0
	tst	#8,r0
	bt	.L06036564
	and	#192,r0
	exts.b	r0,r0
	cmp/eq	#-128,r0
	bt	.L06036544
	cmp/eq	#-64,r0
	bt	.L06036554
	cmp/eq	#0,r0
	bt	.L06036560
.L06036534:
	bsr	func_06036940
	nop
	cmp/eq	#2,r0
	bt	.L060365E6
	cmp/eq	#1,r0
	bt	.L060365EA
	bra	.L06036652
	nop
.L06036544:
	bsr	func_06036940
	nop
	mov	#64,r0
	mov.b	@(r0,r3),r0
	cmp/eq	#-1,r0
	bt	.L060365E2
	bra	.L060365EE
	nop
.L06036554:
	bsr	func_06036940
	nop
	mov	#14,r0
	mov.b	@(r0,r3),r0
	tst	#16,r0
	bf	.L060365E2
.L06036560:
	bra	.L06036652
	nop
.L06036564:
	tst	#4,r0
	bt	.L06036652
	and	#48,r0
	cmp/eq	#32,r0
	bt	.L0603663C
	cmp/eq	#48,r0
	bt	.L0603663C
	cmp/eq	#0,r0
	bt	.L06036560
.L06036576:
	bsr	func_06036946
	nop
	cmp/eq	#2,r0
	bt	.L06036640
	cmp/eq	#1,r0
	bt	.L06036634
	bra	.L06036652
	nop
.L06036586:
	mov.b	@(13,r2),r0
	tst	#8,r0
	bt	.L060365BC
	and	#192,r0
	exts.b	r0,r0
	cmp/eq	#-64,r0
	bt	.L06036534
	cmp/eq	#64,r0
	bt	.L060365AC
	cmp/eq	#0,r0
	bt	.L06036652
	bsr	func_06036940
	nop
	mov	#64,r0
	mov.b	@(r0,r3),r0
	cmp/eq	#-1,r0
	bt	.L060365E2
	bra	.L060365EE
	nop
.L060365AC:
	bsr	func_06036940
	nop
	mov	#14,r0
	mov.b	@(r0,r2),r0
	tst	#16,r0
	bf	.L06036644
	bra	.L06036652
	nop
.L060365BC:
	tst	#4,r0
	bt	.L06036652
	and	#48,r0
	cmp/eq	#48,r0
	bt	.L06036576
	cmp/eq	#32,r0
	bt	.L060365D2
	cmp/eq	#16,r0
	bt	.L060365D2
	bra	.L06036652
	nop
.L060365D2:
	bsr	func_06036946
	nop
	mov	#14,r0
	mov.b	@(r0,r2),r0
	tst	#16,r0
	bf	.L06036648
	bra	.L06036652
	nop
.L060365E2:
	bra	.L06036692
	mov	#22,r4
.L060365E6:
	bra	.L06036692
	mov	#32,r4
.L060365EA:
	bra	.L0603668C
	mov	#35,r4
.L060365EE:
	mov.b	@(15,r2),r0
	tst	#128,r0
	bf	.L06036608
	mov	#1,r5
	mov.l	.L06036604,r0
	mov	#41,r6
	jsr	@r0
	mov	#3,r4
	bra	.L06036612
	nop
	.byte 0x00, 0x00
.L06036604:
	.long snd_seq_start
.L06036608:
	mov	#1,r5
	mov.l	.L06036628,r0
	mov	#44,r6
	jsr	@r0
	mov	#3,r4
.L06036612:
	mov.l	.L0603662C,r0
	mov.l	r0,@-r1
	bsr	func_06037300
	add	#4,r1
	mov.l	@r2,r0
	cmp/eq	#-1,r0
	bf	.L0603664C
	mov.l	.L06036630,r2
	jmp	@r2
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L06036628:
	.long snd_seq_start
.L0603662C:
	.long func_0603689C
.L06036630:
	.long obj_free
.L06036634:
	bra	.L0603668C
	mov	#34,r4
.L06036638:
	bra	.L0603668C
	mov	#0,r4
.L0603663C:
	bra	.L06036688
	mov	#26,r4
.L06036640:
	bra	.L06036688
	mov	#33,r4
.L06036644:
	bra	.L06036692
	mov	#68,r4
.L06036648:
	bra	.L06036688
	mov	#28,r4
.L0603664C:
	lds.l	@r15+,pr
	rts
	nop
.L06036652:
	mov	#67,r0
	mov.b	@(r0,r2),r0
	mov.l	r2,@-r15
	and	#15,r0
	mov	r0,r8
	shll2	r8
	mov.l	.L06036680,r0
	shll2	r8
	jsr	@r0
	shll16	r8
	cmp/pz	r0
	bf/s	.L06036638
	mov.l	@r15+,r2
	mov	#66,r0
	mov.b	@(r0,r2),r0
	and	#15,r0
	add	#-2,r0
	cmp/pl	r0
	bt	.L06036684
	cmp/pz	r0
	bt	.L06036638
	bra	.L06036688
	mov	#15,r4
.L06036680:
	.long obj_find_near_player
.L06036684:
	bra	.L06036688
	mov	#4,r4
.L06036688:
	mov	#0,r0
	mov.w	r0,@(24,r2)
.L0603668C:
	mov	#64,r0
	bra	.L0603669A
	mov.b	r4,@(r0,r2)
.L06036692:
	mov	#64,r0
	mov.b	r4,@(r0,r2)
	mov	#0,r0
	mov.w	r0,@(24,r2)
.L0603669A:
	mov	#64,r0
	mov.b	@(r0,r2),r0
	mov.l	.L060366B0,r3
	shll2	r0
	mov.l	@(r0,r3),r4
	mov.w	.L060366AC,r0
	lds.l	@r15+,pr
	jmp	@r4
	mov.w	r0,@(100,gbr)
.L060366AC:
	.short 0x0100
	.byte 0x00, 0x00
.L060366B0:
	.long D_060395B0
	endlabel func_060364E8

	glabel func_060366B4
	sts.l	pr,@-r15
	mov.w	@(30,r1),r0
	cmp/pz	r0
	bt/s	.L06036700
	mov.l	@r1,r2
	mov.l	.L060366E8,r12
	mov.w	.L060366E6,r8
	jsr	@r12
	shll16	r8
	cmp/pz	r0
	bt	.L06036700
	mov	#69,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#0,r0
	bf	.L060366F0
	mov	#6,r4
	mov	#64,r0
	mov.b	r4,@(r0,r2)
	mov.l	.L060366EC,r3
	mov.b	@r3,r0
	add	#-1,r0
	bsr	func_06035FE4
	mov.b	r0,@r3
	bra	.L060366F4
	nop
.L060366E6:
	.short 0x0480
.L060366E8:
	.long obj_find_near_player
.L060366EC:
	.long D_060CFFCC
.L060366F0:
	mov	#0,r0
	mov.l	r0,@r2
.L060366F4:
	mov.l	.L060366FC,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L060366FC:
	.long obj_free
.L06036700:
	mov	#64,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#6,r0
	bt	.L06036748
	mov.b	@(15,r2),r0
	and	#48,r0
	cmp/eq	#48,r0
	bt	.L06036764
	mov.l	.L06036758,r0
	mov.l	r2,@-r15
	jsr	@r0
	mov	#16,r8
	mov.l	@r15+,r2
	cmp/pz	r0
	bf	.L06036774
	mov.w	r0,@(18,r2)
	mov	#1,r5
	mov.l	.L0603675C,r0
	mov	#41,r6
	jsr	@r0
	mov	#3,r4
	mov	#30,r0
	mov	#0,r3
	mov.b	r3,@(r0,r1)
	mov.b	@(13,r2),r0
	tst	#1,r0
	bt	.L06036748
	mov.l	@(32,r2),r3
	mov.l	@r3,r0
	cmp/pl	r0
	bf	.L06036748
	mov	#66,r0
	mov.b	@(r0,r3),r4
	mov	#-16,r5
	and	r5,r4
	mov.b	r4,@(r0,r3)
.L06036748:
	bsr	func_06037278
	nop
	mov.l	@r2,r0
	cmp/eq	#-1,r0
	bf	.L060367A2
	mov.l	.L06036760,r0
	jmp	@r0
	lds.l	@r15+,pr
.L06036758:
	.long func_06017C90
.L0603675C:
	.long snd_seq_start
.L06036760:
	.long obj_free
.L06036764:
	bsr	func_060373E4
	nop
	mov	#0,r0
	mov.w	r0,@(24,r2)
	mov.w	.L06036772,r0
	bra	.L0603678C
	mov.w	r0,@(100,gbr)
.L06036772:
	.short 0x0100
.L06036774:
	mov	#116,r0
	mov.l	@(r0,r2),r3
	cmp/pz	r3
	bt	.L06036784
	bsr	func_0603686C
	nop
	bra	.L06036788
	nop
.L06036784:
	bsr	func_06036818
	nop
.L06036788:
	bsr	func_06035DFC
	nop
.L0603678C:
	bsr	func_06035E28
	nop
	bsr	func_06035F90
	nop
	mov.l	.L060367E0,r0
	jsr	@r0
	mov.l	r2,@-r15
	mov.l	@r15+,r2
	bsr	func_06035FBA
	mov.l	r2,@-r15
	mov.l	@r15+,r2
.L060367A2:
	mov	#65,r0
	mov.b	@(r0,r2),r6
	mov	#64,r0
	mov.b	@(r0,r2),r5
	mov.l	r2,@-r15
	cmp/eq	r6,r5
	bt	.L060367B8
	mov	#0,r0
	mov.w	r0,@(20,r1)
	mov.b	r0,@(14,r1)
	mov.b	r0,@(15,r1)
.L060367B8:
	mov	#65,r0
	mov.b	r5,@(r0,r2)
	mov.l	.L060367E4,r3
	extu.b	r5,r0
	mov.b	@(r0,r3),r0
	mov.l	.L060367E8,r3
	extu.b	r0,r0
	add	r0,r0
	mov.l	.L060367EC,r7
	mov.w	@(r0,r3),r2
	jsr	@r7
	add	r3,r2
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L060367F0
	mov.l	@r15+,r2
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L060367E0:
	.long path_place_obj
.L060367E4:
	.long D_060398BA
.L060367E8:
	.long D_06039A2E
.L060367EC:
	.long spr_anim_step
.L060367F0:
	mov.l	.L0603680C,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	.L06036810,r0
	mov.l	@(52,r1),r5
	jsr	@r0
	mov.l	@(56,r1),r6
	bsr	func_06036CF6
	mov.l	@r15+,r2
	mov.l	.L06036814,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L0603680C:
	.long mtx_push
.L06036810:
	.long mtx_translate
.L06036814:
	.long mtx_pop
	endlabel func_060366B4

	glabel func_06036818
	sts.l	pr,@-r15
	mov.b	@(14,r2),r0
	tst	#64,r0
	bf	.L06036840
	mov.b	@(13,r2),r0
	tst	#8,r0
	bt	.L06036832
	and	#192,r0
	exts.b	r0,r0
	cmp/eq	#-128,r0
	bt	.L0603684A
	bra	.L06036846
	nop
.L06036832:
	tst	#4,r0
	bt	.L06036846
	and	#48,r0
	tst	#32,r0
	bf	.L0603684A
	bra	.L06036846
	nop
.L06036840:
	mov	#65,r0
	bra	.L0603684E
	mov.b	@(r0,r2),r4
.L06036846:
	bra	.L0603684E
	mov	#79,r4
.L0603684A:
	bra	.L0603684E
	mov	#80,r4
.L0603684E:
	mov	#64,r0
	mov.b	r4,@(r0,r2)
	mov	#64,r0
	mov.b	@(r0,r2),r0
	mov.l	.L06036868,r3
	shll2	r0
	mov.l	@(r0,r3),r4
	mov.w	.L06036864,r0
	lds.l	@r15+,pr
	jmp	@r4
	mov.w	r0,@(100,gbr)
.L06036864:
	.short 0x0100
	.byte 0x00, 0x00
.L06036868:
	.long D_060395B0
	endlabel func_06036818

	glabel func_0603686C
	sts.l	pr,@-r15
	mov.b	@(14,r2),r0
	tst	#64,r0
	bf	.L06036840
	mov.b	@(13,r2),r0
	tst	#8,r0
	bt	.L06036886
	and	#192,r0
	exts.b	r0,r0
	cmp/eq	#-128,r0
	bt	.L0603684A
	bra	.L06036894
	nop
.L06036886:
	tst	#4,r0
	bt	.L06036898
	and	#48,r0
	tst	#32,r0
	bf	.L0603684A
	bra	.L06036894
	nop
.L06036894:
	bra	.L0603684E
	mov	#65,r4
.L06036898:
	bra	.L0603684E
	mov	#66,r4
	endlabel func_0603686C

	glabel func_0603689C
	mov.w	@(30,r1),r0
	sts.l	pr,@-r15
	cmp/pz	r0
	bt/s	.L060368CC
	mov.l	@r1,r2
	mov	#6,r4
	mov	#64,r0
	mov.b	r4,@(r0,r2)
	mov.b	@(15,r2),r0
	mov.l	.L060368C4,r3
	extu.b	r0,r0
	shll2	r0
	shlr8	r0
	mov.b	@(r0,r3),r4
	add	#-1,r4
	bsr	func_06035FE4
	mov.b	r4,@(r0,r3)
	mov.l	.L060368C8,r0
	jmp	@r0
	lds.l	@r15+,pr
.L060368C4:
	.long D_060CFFCC
.L060368C8:
	.long obj_free
.L060368CC:
	bsr	func_06037300
	nop
	mov.l	@r2,r0
	cmp/eq	#-1,r0
	bf	.L060368E0
	mov.l	.L060368DC,r0
	jmp	@r0
	lds.l	@r15+,pr
.L060368DC:
	.long obj_free
.L060368E0:
	mov	#64,r0
	mov.b	@(r0,r2),r4
	mov.l	.L0603690C,r3
	mov	#65,r0
	mov.b	r4,@(r0,r2)
	extu.b	r4,r0
	mov.b	@(r0,r3),r0
	mov.l	.L06036910,r3
	mov.l	r2,@-r15
	extu.b	r0,r0
	add	r0,r0
	mov.l	.L06036914,r7
	mov.w	@(r0,r3),r2
	jsr	@r7
	add	r3,r2
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06036918
	mov.l	@r15+,r2
	lds.l	@r15+,pr
	rts
	nop
.L0603690C:
	.long D_060398BA
.L06036910:
	.long D_06039A2E
.L06036914:
	.long spr_anim_step
.L06036918:
	mov.l	.L06036934,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	.L06036938,r0
	mov.l	@(52,r1),r5
	jsr	@r0
	mov.l	@(56,r1),r6
	bsr	func_06036CF6
	mov.l	@r15+,r2
	mov.l	.L0603693C,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L06036934:
	.long mtx_push
.L06036938:
	.long mtx_translate
.L0603693C:
	.long mtx_pop
	endlabel func_0603689C

	glabel func_06036940
	mov.l	@(28,r2),r3
	bra	.L0603694A
	mov.l	@(28,r3),r4
	endlabel func_06036940

	glabel func_06036946
	mov.l	@(32,r2),r3
	mov.l	@(32,r3),r4
.L0603694A:
	mov	#120,r0
	mov.l	@(r0,r2),r0
	mov.w	.L0603695A,r5
	cmp/ge	r5,r0
	bf/s	.L0603695C
	mov.b	@(14,r2),r0
	bra	.L0603695E
	or	#16,r0
.L0603695A:
	.short 0x4650
.L0603695C:
	and	#239,r0
.L0603695E:
	mov.b	r0,@(14,r2)
	cmp/eq	r2,r4
	bf	.L06036974
	mov.b	@(14,r3),r0
	tst	#16,r0
	bt	.L06036978
	mov.b	@(14,r2),r0
	tst	#16,r0
	bt	.L06036978
	rts
	mov	#2,r0
.L06036974:
	rts
	mov	#0,r0
.L06036978:
	rts
	mov	#1,r0
	endlabel func_06036946

	glabel func_0603697C
	mov.l	.L060369A0,r3
	mov.b	@r3+,r0
	mov.b	@r3+,r5
	extu.b	r0,r4
	extu.b	r5,r5
	mov.b	@r3+,r0
	add	r5,r4
	extu.b	r0,r0
	mov.b	@r3,r5
	add	r0,r4
	extu.b	r5,r5
	mov.w	.L0603699E,r0
	add	r5,r4
	cmp/gt	r0,r4
	bf	.L060369A4
	rts
	nop
.L0603699E:
	.short 0x002A
.L060369A0:
	.long D_060CFFCC
.L060369A4:
	sts.l	pr,@-r15
	bsr	func_06035DBC
	mov.l	r2,@-r15
	cmp/pl	r2
	bt	.L060369B6
	mov.l	@r15+,r2
	lds.l	@r15+,pr
	rts
	nop
.L060369B6:
	mov	r2,r3
	mov.l	@r15+,r2
	mov.l	r1,@-r15
	mov.l	@(28,r2),r1
	mov.l	r8,@-r15
	mov.l	r9,@-r15
	mov.l	r10,@-r15
	mov.l	r11,@-r15
	mov.l	r12,@-r15
	mov.l	r13,@-r15
	mov	#0,r0
	mov.l	r14,@-r15
	mov.l	r0,@r3
	mov	#0,r0
	mov.l	r0,@(12,r3)
	mov.w	r0,@(18,r3)
	mov.l	r0,@(24,r3)
	mov.l	r0,@(28,r3)
	mov.l	r0,@(32,r3)
	mov.l	r0,@(36,r3)
	mov.l	r0,@(44,r3)
	mov.w	r0,@(18,r3)
	mov.w	.L06036AF4,r0
	mov.l	r0,@(20,r3)
	mov	#120,r0
	mov	#0,r4
	mov.l	r4,@(r0,r3)
	mov	#116,r0
	mov.l	r4,@(r0,r3)
	mov	#-7,r5
	shll16	r5
	mov	#64,r8
	mov.l	r5,@(40,r3)
	mov	#26,r0
	mov.w	r8,@(r0,r3)
	mov.b	@(12,r2),r0
	mov.l	@(48,r2),r9
	mov.l	@(52,r2),r5
	mov.l	@(56,r2),r10
	mov.b	r0,@(12,r3)
	mov.l	r9,@(48,r3)
	mov.l	r5,@(52,r3)
	mov.l	r10,@(56,r3)
	mov	#24,r4
	mov	#64,r0
	mov.b	r4,@(r0,r3)
	mov	#65,r0
	mov.l	@(60,r2),r9
	mov.b	r4,@(r0,r3)
	mov.l	r9,@(60,r3)
	mov.l	.L06036AF8,r0
	mov.l	@r0,r14
	rotl	r14
	mov.l	.L06036AFC,r4
	swap.w	r14,r14
	dmuls.l	r14,r4
	sts	macl,r14
	add	r4,r14
	mov.l	r14,@r0
	bsr	func_06036C08
	mov	#96,r0
	mov	#96,r0
	mov.b	r8,@(r0,r3)
	mov	#97,r0
	mov.b	r9,@(r0,r3)
	mov	#98,r0
	mov.b	r10,@(r0,r3)
	mov	#-1,r4
	mov	#70,r0
	cmp/eq	r4,r11
	bt/s	.L06036A48
	mov.b	@(r0,r1),r4
	mov.b	@(r0,r2),r4
.L06036A48:
	mov.b	r4,@(r0,r3)
	mov	#69,r0
	mov.b	r4,@(r0,r3)
	bsr	func_06036C08
	mov	#99,r0
	mov	#99,r0
	mov.b	r8,@(r0,r3)
	mov	#100,r0
	mov.b	r9,@(r0,r3)
	mov	#101,r0
	mov.b	r10,@(r0,r3)
	mov	#-1,r4
	mov	#67,r0
	cmp/eq	r4,r11
	bt/s	.L06036A6A
	mov.b	@(r0,r1),r4
	mov.b	@(r0,r2),r4
.L06036A6A:
	mov	#15,r5
	and	r5,r4
	mov.b	@(r0,r3),r5
	mov	#-16,r6
	and	r6,r5
	or	r4,r5
	mov.b	r5,@(r0,r3)
	mov.l	.L06036AF8,r0
	mov.l	@r0,r14
	rotl	r14
	xor	r2,r14
	mov.l	r14,@r0
	bsr	func_06036C08
	mov	#102,r0
	mov	#102,r0
	mov.b	r8,@(r0,r3)
	mov	#103,r0
	mov.b	r9,@(r0,r3)
	mov	#104,r0
	mov.b	r10,@(r0,r3)
	mov	#-1,r4
	cmp/eq	r4,r11
	bt/s	.L06036A9C
	mov.b	@(15,r1),r0
	mov.b	@(15,r2),r0
.L06036A9C:
	mov.b	r0,@(15,r3)
	bsr	func_06036C08
	mov	#105,r0
	mov	#105,r0
	mov.b	r8,@(r0,r3)
	mov	#106,r0
	mov.b	r9,@(r0,r3)
	mov	#107,r0
	mov.b	r10,@(r0,r3)
	mov	#-1,r4
	mov	#67,r0
	cmp/eq	r4,r11
	bt/s	.L06036ABA
	mov.b	@(r0,r1),r4
	mov.b	@(r0,r2),r4
.L06036ABA:
	mov	#-16,r5
	and	r5,r4
	mov.b	@(r0,r3),r5
	mov	#15,r6
	and	r6,r5
	or	r4,r5
	mov.b	r5,@(r0,r3)
	mov	#66,r0
	mov.b	@(r0,r2),r4
	mov.b	r4,@(r0,r3)
	mov	#68,r0
	mov.b	@(r0,r2),r4
	mov.b	@(r0,r1),r5
	mov	#112,r6
	and	r6,r5
	mov	#7,r6
	and	r6,r4
	or	r4,r5
	mov.b	r5,@(r0,r3)
	mov.l	.L06036AF8,r5
	mov.l	@r5,r0
	rotl	r0
	xor	r2,r0
	mov.l	r0,@r5
	shlr16	r0
	tst	#64,r0
	bt	.L06036B00
	bra	.L06036B02
	mov	#71,r0
.L06036AF4:
	.short 0x0258
	.byte 0x00, 0x00
.L06036AF8:
	.long D_06035A6C
.L06036AFC:
	.long 0x0D81A52B
.L06036B00:
	mov	#72,r0
.L06036B02:
	mov.b	@(r0,r2),r4
	mov	#71,r0
	mov.b	r4,@(r0,r3)
	mov.l	.L06036B1C,r5
	mov.l	@r5,r0
	rotl	r0
	xor	r2,r0
	mov.l	r0,@r5
	shlr16	r0
	tst	#64,r0
	bt	.L06036B20
	bra	.L06036B22
	mov	#71,r0
.L06036B1C:
	.long D_06035A6C
.L06036B20:
	mov	#72,r0
.L06036B22:
	mov.b	@(r0,r1),r5
	mov	#72,r0
	mov.b	r5,@(r0,r3)
	cmp/eq	r4,r5
	bf	.L06036B54
	mov	#23,r6
	add	#5,r4
	cmp/hs	r4,r6
	bt	.L06036B36
	add	#-23,r4
.L06036B36:
	mov.l	.L06036B4C,r5
	mov.l	@r5,r0
	rotl	r0
	xor	r2,r0
	mov.l	r0,@r5
	shlr16	r0
	tst	#8,r0
	bt	.L06036B50
	bra	.L06036B52
	mov	#71,r0
	.byte 0x00, 0x00
.L06036B4C:
	.long D_06035A6C
.L06036B50:
	mov	#72,r0
.L06036B52:
	mov.b	r4,@(r0,r3)
.L06036B54:
	mov.b	@(15,r3),r0
	mov	#-49,r4
	and	r4,r0
	or	#16,r0
	mov.b	r0,@(15,r3)
	mov	#-64,r0
	mov.b	r0,@(14,r3)
	mov.b	@(15,r2),r0
	and	#3,r0
	mov	r0,r8
	mov.b	@(15,r1),r0
	and	#3,r0
	mov	#5,r9
	add	r0,r8
	mov.b	@(15,r3),r0
	cmp/ge	r9,r8
	bf/s	.L06036B7A
	and	#252,r0
	add	#1,r0
.L06036B7A:
	mov.b	r0,@(15,r3)
	mov	#15,r0
	mov.b	@(r0,r1),r4
	mov.b	@(r0,r2),r0
	and	r4,r0
	xor	#192,r0
	tst	#192,r0
	mov	#0,r11
	bf	.L06036B8E
	mov	#1,r11
.L06036B8E:
	mov	#96,r0
	mov.b	@(r0,r3),r7
	mov	#99,r0
	mov.b	@(r0,r3),r8
	mov	#102,r0
	mov.b	@(r0,r3),r9
	mov	#105,r0
	mov.b	@(r0,r3),r10
	mov	r7,r0
	or	r8,r0
	or	r9,r0
	or	r10,r0
	tst	#63,r0
	bt	.L06036BC2
	mov	#63,r0
	tst	r0,r7
	bt	.L06036BD2
	tst	r0,r8
	bt	.L06036BD2
	tst	r0,r9
	bt	.L06036BD2
	tst	r0,r10
	bt	.L06036BD2
	mov	#2,r0
	bra	.L06036BDC
	mov	#-128,r8
.L06036BC2:
	cmp/pl	r11
	bt	.L06036BCC
	mov	#1,r0
	bra	.L06036BDC
	mov	#64,r8
.L06036BCC:
	mov	#0,r0
	bra	.L06036BDC
	mov	#0,r8
.L06036BD2:
	mov	#120,r0
	mov.w	.L06036C02,r8
	mov.l	r8,@(r0,r3)
	mov	#-64,r8
	mov	#3,r0
.L06036BDC:
	mov.l	.L06036C04,r9
	mov.b	@(r0,r9),r7
	add	#1,r7
	mov.b	r7,@(r0,r9)
	mov.b	@(15,r3),r0
	and	#63,r0
	or	r8,r0
	mov.b	r0,@(15,r3)
	mov.l	@r15+,r14
	mov.l	@r15+,r13
	mov.l	@r15+,r12
	mov.l	@r15+,r11
	mov.l	@r15+,r10
	mov.l	@r15+,r9
	mov.l	@r15+,r8
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
.L06036C02:
	.short 0x12C0
.L06036C04:
	.long D_060CFFCC
	endlabel func_0603697C

	glabel func_06036C08
	mov.l	r7,@-r15
	mov.b	@(r0,r2),r8
	mov.b	@(r0,r1),r11
	add	#1,r0
	mov.b	@(r0,r2),r9
	mov.b	@(r0,r1),r12
	add	#1,r0
	mov.b	@(r0,r2),r10
	mov.b	@(r0,r1),r13
	extu.b	r8,r8
	extu.b	r9,r9
	extu.b	r10,r10
	extu.b	r11,r11
	extu.b	r12,r12
	extu.b	r13,r13
	shlr2	r14
	mov.l	.L06036C48,r7
	mov	r8,r4
	mov	r11,r0
	shlr2	r4
	shll2	r0
	shlr2	r4
	shlr8	r0
	add	r4,r0
	cmp/eq	#0,r0
	bt	.L06036C4C
	cmp/eq	#34,r0
	bf	.L06036C5A
	mov	#63,r5
	and	r5,r8
	bra	.L06036C5A
	and	r5,r11
.L06036C48:
	.long D_06036CE6
.L06036C4C:
	mov	#-128,r4
	mov	#63,r5
	extu.b	r4,r4
	and	r5,r8
	and	r5,r11
	or	r4,r8
	or	r4,r11
.L06036C5A:
	mov.b	@(r0,r7),r4
	mov	r14,r0
	and	#3,r0
	shlr2	r14
	cmp/ge	r4,r0
	bt	.L06036C6A
	mov	r11,r8
	mov	#-1,r11
.L06036C6A:
	mov	r9,r4
	mov	r12,r0
	shlr2	r4
	shll2	r0
	shlr2	r4
	shlr8	r0
	add	r4,r0
	cmp/eq	#0,r0
	bt	.L06036C88
	cmp/eq	#34,r0
	bf	.L06036C96
	mov	#63,r5
	and	r5,r9
	bra	.L06036C96
	and	r5,r12
.L06036C88:
	mov	#-128,r4
	mov	#63,r5
	extu.b	r4,r4
	and	r5,r9
	and	r5,r12
	or	r4,r9
	or	r4,r12
.L06036C96:
	mov.b	@(r0,r7),r4
	mov	r14,r0
	and	#3,r0
	shlr2	r14
	cmp/ge	r4,r0
	bt	.L06036CA6
	mov	r12,r9
	mov	#-1,r12
.L06036CA6:
	mov	r10,r4
	mov	r13,r0
	shlr2	r4
	shll2	r0
	shlr2	r4
	shlr8	r0
	add	r4,r0
	cmp/eq	#0,r0
	bt	.L06036CC4
	cmp/eq	#34,r0
	bf	.L06036CD2
	mov	#63,r5
	and	r5,r10
	bra	.L06036CD2
	and	r5,r13
.L06036CC4:
	mov	#-128,r4
	mov	#63,r5
	extu.b	r4,r4
	and	r5,r10
	and	r5,r13
	or	r4,r10
	or	r4,r13
.L06036CD2:
	mov.b	@(r0,r7),r4
	mov	r14,r0
	and	#3,r0
	shlr2	r14
	cmp/ge	r4,r0
	bt	.L06036CE2
	mov	r13,r10
	mov	#-1,r13
.L06036CE2:
	rts
	mov.l	@r15+,r7
	dlabel D_06036CE6
	.byte 0x01, 0x02, 0x02, 0x00, 0x00, 0x01, 0x02, 0x02, 0x00, 0x00, 0x01, 0x02, 0x02, 0x00, 0x00, 0x01
	endlabel func_06036C08

	glabel func_06036CF6
	sts.l	pr,@-r15
	mov.l	@(120,gbr),r0
	bsr	func_060370BA
	mov	r0,r3
	mov.w	@(20,r1),r0
	mov.l	@(44,r1),r4
	shll	r0
	mov.w	@(r0,r4),r0
	mov.l	r1,@-r15
	extu.w	r0,r0
	add	r0,r4
	mov	#124,r0
	mov	r4,r5
	mov.l	@(r0,r2),r1
.L06036D12:
	mov.w	@r5,r0
	cmp/pz	r0
	bf	.L06036D22
	mov.b	@(8,r5),r0
	cmp/eq	#0,r0
	bt	.L06036D24
	bra	.L06036D12
	add	#10,r5
.L06036D22:
	add	#-10,r5
.L06036D24:
	mov.b	@(9,r5),r0
	mov.l	.L06036D3C,r7
	shll2	r0
	add	r0,r1
.L06036D2C:
	mov.w	@r4,r0
	cmp/pz	r0
	bt	.L06036D40
	mov.l	@r15+,r1
	mov	r3,r0
	lds.l	@r15+,pr
	rts
	mov.l	r0,@(92,gbr)
.L06036D3C:
	.long D_060672F0
.L06036D40:
	mov.b	@(1,r4),r0
	mov.l	.L06036D70,r5
	extu.b	r0,r0
	shll	r0
	mov.b	@(r0,r5),r6
	mov.b	@(8,r4),r0
	mov	#10,r5
	mov	r0,r13
	cmp/eq	r5,r6
	bt/s	.L06036D84
	mov	#0,r14
	cmp/eq	#9,r0
	bt	.L06036D76
	cmp/eq	#8,r0
	bt	.L06036D74
	and	#254,r0
	cmp/eq	#4,r0
	bt	.L06036D7C
	cmp/eq	#6,r0
	bt/s	.L06036D7E
	mov	#105,r0
	bra	.L06036D7E
	mov	#96,r0
	.byte 0x00, 0x00
.L06036D70:
	.long D_06039360
.L06036D74:
	bra	.L06036D7E
.L06036D76:
	mov	#99,r0
	bra	.L06036D7E
	mov	#0,r13
.L06036D7C:
	mov	#102,r0
.L06036D7E:
	mov.b	@(r0,r2),r14
	mov	#63,r11
	and	r11,r14
.L06036D84:
	mov	#20,r11
	mov.l	r1,@-r15
	muls.w	r11,r13
	mov.l	.L06036EC8,r0
	shll2	r14
	sts	macl,r13
	mov.l	@(r0,r14),r8
	mov.b	@(1,r4),r0
	add	r13,r1
	extu.b	r0,r0
	shll2	r0
	shll2	r0
	add	r8,r0
	mov	r0,r9
	mov.w	@r0+,r13
	mov.w	@r0+,r12
	mov.w	@r0+,r11
	add	#12,r3
	mov.l	.L06036ECC,r0
	mov.w	r13,@-r3
	mov.l	@(r0,r14),r0
	add	r0,r12
	mov.l	.L06036ED0,r0
	mov.w	r12,@-r3
	mov.l	@(r0,r14),r0
	shll2	r11
	add	r0,r11
	mov.w	r11,@-r3
	mov	#16,r12
	add	#-6,r3
	mov.b	r12,@r3
	mov	#2,r0
	mov.b	r0,@(1,r3)
	mov	#20,r0
	mov.b	r0,@(4,r3)
	mov	#-120,r0
	mov.l	.L06036ED4,r14
	mov.b	r0,@(5,r3)
	mov.l	@r2,r10
	mov.w	@(26,r10),r0
	jsr	@r14
	neg	r0,r0
	shll2	r10
	shll2	r11
	mov	r10,r5
	mov	r11,r6
	mov.w	@(6,r4),r0
	jsr	@r14
	neg	r0,r0
	shll2	r10
	shll2	r11
	mov	#4,r8
	mov.b	@(14,r2),r0
	mov.l	r2,@-r15
	tst	#2,r0
	add	#12,r3
	bt/s	.L06036DFC
	mov.b	@r4,r2
	mov	#-128,r0
	or	r0,r2
.L06036DFC:
	mov.b	@r7+,r0
	mov	#16,r14
	mov.w	@(r0,r9),r12
	tst	r2,r14
	bt/s	.L06036E0A
	mov.b	@r7+,r0
	neg	r12,r12
.L06036E0A:
	mov	#32,r14
	mov.w	@(r0,r9),r13
	tst	r2,r14
	bt/s	.L06036E16
	shll16	r12
	neg	r13,r13
.L06036E16:
	dmuls.l	r10,r12
	shll16	r13
	sts	mach,r14
	dmuls.l	r10,r13
	sts	mach,r0
	dmuls.l	r11,r12
	sts	mach,r12
	dmuls.l	r11,r13
	add	r0,r12
	sts	mach,r13
	sub	r14,r13
	mov.w	@r1,r14
	mov.w	@(2,r4),r0
	add	r14,r0
	add	r0,r12
	shll16	r12
	mov	#2,r0
	mov.w	@(r0,r1),r14
	mov.w	@(4,r4),r0
	add	r14,r0
	add	r0,r13
	shll16	r13
	dmuls.l	r13,r6
	sts	mach,r0
	dmuls.l	r12,r5
	sts	mach,r14
	sub	r14,r0
	dmuls.l	r12,r6
	sts	mach,r14
	dmuls.l	r13,r5
	mov	r0,r13
	sts	mach,r12
	add	r14,r12
	cmp/pz	r2
	bt	.L06036E5E
	neg	r12,r12
.L06036E5E:
	mov.w	@(100,gbr),r0
	muls.w	r0,r12
	sts	macl,r12
	muls.w	r0,r13
	shlr8	r12
	sts	macl,r13
	exts.w	r12,r12
	shlr8	r13
	mov.l	@(760,gbr),r0
	add	r0,r12
	exts.w	r13,r13
	mov.w	r12,@r3
	mov.l	@(764,gbr),r0
	add	r0,r13
	add	#2,r3
	mov.w	r13,@r3
	dt	r8
	bf/s	.L06036DFC
	add	#2,r3
	add	#-8,r7
	mov.l	@r15+,r2
	add	#-28,r3
	mov.l	@(768,gbr),r0
	bsr	func_06036EE0
	mov	r0,r6
	mov.b	@(15,r2),r0
	tst	#192,r0
	bf	.L06036EBA
	mov.b	@(1,r4),r0
	mov.l	.L06036ED8,r5
	extu.b	r0,r0
	shll	r0
	mov.b	@(r0,r5),r12
	mov	#10,r5
	cmp/eq	r5,r12
	bt	.L06036EBA
	mov	#9,r5
	cmp/eq	r5,r12
	bt	.L06036EBA
	mov	#8,r5
	cmp/eq	r5,r12
	bt	.L06036EBA
	mov.w	.L06036EC6,r14
	mov.w	@(6,r3),r0
	add	r14,r0
	mov.w	r0,@(6,r3)
.L06036EBA:
	mov.l	.L06036EDC,r14
	mov.l	@r15+,r1
	jsr	@r14
	add	#10,r4
	bra	.L06036D2C
	add	#32,r3
.L06036EC6:
	.short 0x0200
.L06036EC8:
	.long D_06039584
.L06036ECC:
	.long D_060CFFD8
.L06036ED0:
	.long D_060CFFEC
.L06036ED4:
	.long math_sincos
.L06036ED8:
	.long D_06039360
.L06036EDC:
	.long vdp1_zsort_insert
	endlabel func_06036CF6

	glabel func_06036EE0
	mov.w	@(138,gbr),r0
	mov	r6,r14
	mov	r0,r12
	shlr16	r14
	mov.w	@(136,gbr),r0
	exts.w	r14,r14
	sub	r0,r14
	cmp/pz	r14
	bf	.L06036F06
	muls.w	r14,r12
	sts	macl,r14
	swap.w	r14,r14
	exts.w	r14,r14
	mov	#8,r0
	cmp/ge	r0,r14
	bf	.L06036F02
	mov	#7,r14
.L06036F02:
	bra	.L06036F08
	shll2	r14
.L06036F06:
	mov	#0,r14
.L06036F08:
	mov.w	@(6,r3),r0
	add	r14,r0
	rts
	mov.w	r0,@(6,r3)
	endlabel func_06036EE0

	glabel func_06036F10
	sts.l	pr,@-r15
	mov.l	@(120,gbr),r0
	bsr	func_060370BA
	mov	r0,r3
	mov.w	@(20,r1),r0
	mov.l	@(44,r1),r4
	shll	r0
	mov.w	@(r0,r4),r0
	mov.l	.L06036F34,r7
	add	r0,r4
.L06036F24:
	mov.w	@r4,r0
	cmp/pz	r0
	bt	.L06036F38
	lds.l	@r15+,pr
	mov	r3,r0
	rts
	mov.l	r0,@(92,gbr)
	.byte 0x00, 0x00
.L06036F34:
	.long D_060672F8
.L06036F38:
	mov.l	.L06037010,r2
	mov.b	@(1,r4),r0
	mov.l	@r2,r2
	extu.b	r0,r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov	#20,r0
	shll8	r0
	or	#136,r0
	mov.l	.L06037014,r9
	mov.w	r0,@(4,r3)
	mov.w	@r2,r0
	mov.l	@r9,r13
	mov.w	r0,@(10,r3)
	mov.w	@(2,r2),r0
	mov.l	.L06037018,r8
	add	r13,r0
	mov.w	r0,@(8,r3)
	mov.w	@(4,r2),r0
	mov.l	@r8,r12
	mov.b	@r4,r13
	shll2	r0
	add	r12,r0
	mov.w	r0,@(6,r3)
	mov.w	.L0603700C,r12
	mov.l	@(760,gbr),r0
	or	r13,r12
	mov	r0,r5
	mov.w	r12,@r3
	mov.l	@(764,gbr),r0
	mov	r0,r6
	mov.l	.L0603701C,r14
	add	#12,r3
	mov.w	@(14,r4),r0
	jsr	@r14
	neg	r0,r0
	shll2	r10
	shll2	r11
	mov	r10,r9
	mov	r11,r2
	mov.w	@(26,r1),r0
	jsr	@r14
	neg	r0,r0
	shll2	r10
	shll2	r11
	mov	#4,r8
.L06036F96:
	mov.b	@r7+,r0
	mov.w	@(r0,r4),r12
	mov.b	@r7+,r0
	shll16	r12
	dmuls.l	r9,r12
	mov.w	@(r0,r4),r13
	shll16	r13
	sts	mach,r14
	dmuls.l	r9,r13
	sts	mach,r0
	dmuls.l	r2,r13
	sts	mach,r13
	dmuls.l	r2,r12
	sub	r14,r13
	sts	mach,r12
	add	r0,r12
	mov.w	@(10,r4),r0
	add	r0,r12
	mov.w	@(12,r4),r0
	shll16	r12
	add	r0,r13
	dmuls.l	r10,r12
	shll16	r13
	sts	mach,r14
	dmuls.l	r10,r13
	sts	mach,r0
	dmuls.l	r11,r13
	sts	mach,r13
	dmuls.l	r11,r12
	sub	r14,r13
	sts	mach,r12
	add	r0,r12
	mov.w	@(100,gbr),r0
	muls.w	r0,r12
	sts	macl,r12
	muls.w	r0,r13
	shlr8	r12
	sts	macl,r13
	exts.w	r12,r12
	shlr8	r13
	add	r5,r12
	exts.w	r13,r13
	mov.w	r12,@r3
	add	r6,r13
	add	#2,r3
	mov.w	r13,@r3
	dt	r8
	bf/s	.L06036F96
	add	#2,r3
	add	#-8,r7
	add	#-28,r3
	mov.l	@(768,gbr),r0
	bsr	func_06036EE0
	mov	r0,r6
	mov.l	.L06037020,r14
	jsr	@r14
	add	#16,r4
	bra	.L06036F24
	add	#32,r3
.L0603700C:
	.short 0x1002
	.byte 0x00, 0x00
.L06037010:
	.long D_06039584
.L06037014:
	.long D_060CFFD8
.L06037018:
	.long D_060CFFEC
.L0603701C:
	.long math_sincos
.L06037020:
	.long vdp1_zsort_insert
	endlabel func_06036F10

	glabel func_06037024
	sts.l	pr,@-r15
	mov.l	@(120,gbr),r0
	bsr	func_060370BA
	mov	r0,r3
	mov.w	.L06037086,r0
	mov.w	r0,@(4,r3)
	mov.l	@(760,gbr),r0
	mov	r0,r5
	mov.l	@(764,gbr),r0
	mov.w	.L06037088,r12
	mov	r0,r6
	mov.w	r12,@r3
	add	#12,r3
	mov.w	r5,@r3
	add	#2,r3
	mov.w	r6,@r3
	add	#2,r3
	mov	#-28,r12
	mov.w	@(100,gbr),r0
	muls.w	r0,r12
	sts	macl,r12
	shlr8	r12
	exts.w	r12,r12
	add	r12,r6
	mov.w	r5,@r3
	add	#2,r3
	mov.w	r6,@r3
	mov.l	@(768,gbr),r0
	add	#-18,r3
	mov	r0,r6
	mov.w	@(138,gbr),r0
	mov	r6,r14
	mov	r0,r12
	shlr16	r14
	exts.w	r14,r14
	mov.w	@(136,gbr),r0
	sub	r0,r14
	cmp/pz	r14
	bf	.L0603708A
	muls.w	r14,r12
	sts	macl,r14
	swap.w	r14,r14
	exts.w	r14,r14
	mov	#8,r0
	cmp/ge	r0,r14
	bf	.L06037082
	mov	#7,r14
.L06037082:
	bra	.L0603708C
	shll	r14
.L06037086:
	.short 0x0CC0
.L06037088:
	.short 0x1006
.L0603708A:
	mov	#0,r14
.L0603708C:
	mov.l	.L060370A4,r12
	add	r12,r14
	mov.l	.L060370A8,r13
	mov.w	@r14,r0
	jsr	@r13
	mov.w	r0,@(6,r3)
	add	#32,r3
	lds.l	@r15+,pr
	mov	r3,r0
	rts
	mov.l	r0,@(92,gbr)
	.byte 0x00, 0x00
.L060370A4:
	.long D_060370AC
.L060370A8:
	.long vdp1_zsort_insert
	dlabel D_060370AC
	.byte 0xCA, 0x52, 0xC2, 0x10, 0xB9, 0xCE, 0xB1, 0x8C, 0xA9, 0x4A, 0xA1, 0x08, 0x98, 0xC6
	endlabel func_06037024

	glabel func_060370BA
	add	#12,r3
	mov.l	@r3+,r4
	add	#12,r3
	mov.l	@r3+,r5
	add	#12,r3
	mov.l	@(788,gbr),r0
	mov.l	@r3+,r6
	cmp/ge	r0,r6
	bt	.L060370FE
	mov.l	.L06037110,r0
	cmp/ge	r0,r6
	bf	.L060370FE
	mov.l	.L06037114,r0
	dmuls.l	r0,r6
	mov.l	.L06037118,r12
	sts	mach,r0
	mov	r12,r13
	shll	r0
	add	r12,r0
	cmp/gt	r0,r4
	bt	.L060370FE
	neg	r0,r0
	cmp/ge	r0,r4
	bf	.L060370FE
	mov	#-1,r0
	shlr	r0
	dmuls.l	r0,r6
	sts	mach,r0
	add	r13,r0
	cmp/gt	r0,r5
	bt	.L060370FE
	neg	r0,r0
	cmp/ge	r0,r5
	bt	.L0603711C
.L060370FE:
	mov.w	@(68,gbr),r0
	mov	#-128,r3
	xor	#1,r0
	lds.l	@r15+,pr
	mov.w	r0,@(68,gbr)
	or	r0,r3
	mov	#30,r0
	rts
	mov.b	r3,@(r0,r1)
.L06037110:
	.long 0x00160000
.L06037114:
	.long 0x58000000
.L06037118:
	.long 0x01280000
.L0603711C:
	mov	#-1,r14
	shll8	r14
	mov.w	@(190,gbr),r0
	mov.l	r6,@(0,r14)
	mov	#0,r3
	mov.l	r0,@(16,r14)
	mov.l	r3,@(20,r14)
	mov.w	.L0603716C,r8
	mov.w	@(30,r1),r0
	and	r8,r0
	mov.w	r0,@(30,r1)
	mov	r6,r0
	mov.l	@(28,r14),r3
	mov.l	r0,@(768,gbr)
	dmuls.l	r3,r4
	mov	r3,r14
	shar	r14
	mov	r3,r0
	sts	mach,r4
	shar	r14
	shar	r14
	shlr8	r3
	dlabel lbl_06037148
	sub	r14,r0
	dmuls.l	r0,r5
	mov.w	@(100,gbr),r0
	sts	mach,r5
	muls.w	r0,r3
	sts	macl,r0
	shlr8	r0
	mov.w	r0,@(100,gbr)
	mov.w	.L0603716E,r0
	mov	#112,r3
	add	r4,r0
	add	r3,r5
	mov.l	r0,@(760,gbr)
	mov	r5,r0
	mov.l	r0,@(764,gbr)
	mov.l	@(92,gbr),r0
	rts
	mov	r0,r3
.L0603716C:
	.short 0x7FFF
.L0603716E:
	.short 0x00B0
	endlabel func_060370BA

	glabel func_06037170
	sts.l	pr,@-r15
	mov.l	@(120,gbr),r0
	bsr	func_060370BA
	mov	r0,r3
	mov.w	@(20,r1),r0
	mov.l	@(44,r1),r4
	shll	r0
	mov.w	@(r0,r4),r0
	mov.l	.L06037194,r7
	add	r0,r4
.L06037184:
	mov.w	@r4,r0
	cmp/pz	r0
	bt	.L06037198
	lds.l	@r15+,pr
	mov	r3,r0
	rts
	mov.l	r0,@(92,gbr)
	.byte 0x00, 0x00
.L06037194:
	.long D_060672F0
.L06037198:
	mov.b	@(1,r4),r0
	mov.l	.L06037248,r2
	extu.b	r0,r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov	#20,r0
	shll8	r0
	or	#136,r0
	mov.l	.L0603724C,r9
	mov.w	r0,@(4,r3)
	mov.w	@r2,r0
	mov.l	@(16,r9),r13
	mov.w	r0,@(10,r3)
	mov.w	@(2,r2),r0
	mov.l	.L06037250,r8
	add	r13,r0
	mov.w	r0,@(8,r3)
	mov.w	@(4,r2),r0
	mov.l	@(16,r8),r12
	mov.b	@r4,r13
	shll2	r0
	add	r12,r0
	mov.w	r0,@(6,r3)
	mov.w	.L06037244,r12
	mov.l	@(760,gbr),r0
	or	r13,r12
	mov	r0,r5
	mov.w	r12,@r3
	mov.l	@(764,gbr),r0
	mov	r0,r6
	mov.l	.L06037254,r14
	add	#12,r3
	mov.w	@(6,r4),r0
	jsr	@r14
	neg	r0,r0
	shll2	r10
	shll2	r11
	mov	#4,r8
.L060371E6:
	mov.b	@r7+,r0
	mov.w	@(r0,r2),r12
	mov.b	@r7+,r0
	shll16	r12
	mov.w	@(r0,r2),r13
	dmuls.l	r10,r12
	shll16	r13
	sts	mach,r14
	dmuls.l	r10,r13
	sts	mach,r0
	dmuls.l	r11,r13
	sts	mach,r13
	dmuls.l	r11,r12
	sub	r14,r13
	sts	mach,r12
	add	r0,r12
	mov.w	@(2,r4),r0
	add	r0,r12
	mov.w	@(4,r4),r0
	add	r0,r13
	mov.w	@(100,gbr),r0
	muls.w	r0,r12
	sts	macl,r12
	muls.w	r0,r13
	shlr8	r12
	sts	macl,r13
	exts.w	r12,r12
	shlr8	r13
	add	r5,r12
	exts.w	r13,r13
	mov.w	r12,@r3
	add	r6,r13
	add	#2,r3
	mov.w	r13,@r3
	dt	r8
	bf/s	.L060371E6
	add	#2,r3
	add	#-8,r7
	add	#-28,r3
	mov.l	@(768,gbr),r0
	bsr	func_06036EE0
	mov	r0,r6
	mov.l	.L06037258,r14
	jsr	@r14
	add	#8,r4
	bra	.L06037184
	add	#32,r3
.L06037244:
	.short 0x1002
	.byte 0x00, 0x00
.L06037248:
	.long D_0603B078
.L0603724C:
	.long D_060CFFD8
.L06037250:
	.long D_060CFFEC
.L06037254:
	.long math_sincos
.L06037258:
	.long vdp1_zsort_insert
	endlabel func_06037170

	glabel func_0603725C
	mov	#96,r0
	mov.b	@(r0,r2),r0
	mov.l	.L06037274,r4
	and	#63,r0
	shll2	r0
	mov.l	@(r0,r4),r4
	mov	#124,r0
	mov.w	@r4,r5
	add	r5,r4
	rts
	mov.l	r4,@(r0,r2)
	.byte 0x00, 0x00
.L06037274:
	.long D_06039574
	endlabel func_0603725C

	glabel func_06037278
	mov	#6,r3
	mov	#64,r0
	mov.b	r3,@(r0,r2)
	mov	#65,r0
	mov.b	@(r0,r2),r0
	sts.l	pr,@-r15
	cmp/eq	r3,r0
	bt	.L060372AC
	mov.b	@(14,r2),r0
	or	#128,r0
	mov.b	r0,@(14,r2)
	mov	#0,r3
	mov	#69,r0
	mov.b	r3,@(r0,r2)
	mov.l	.L060372A8,r3
	mov.l	r2,@-r15
	mov.w	.L060372A6,r0
	jsr	@r3
	mov.w	r0,@(22,r1)
	mov.l	@r15+,r2
	lds.l	@r15+,pr
	rts
	nop
.L060372A6:
	.short 0x0100
.L060372A8:
	.long func_0603C4E2
.L060372AC:
	mov.l	.L060372C0,r0
	mov.l	r2,@-r15
	jsr	@r0
	nop
	mov.l	@r15+,r2
	bf	.L060372C4
	lds.l	@r15+,pr
	mov.w	@(22,r1),r0
	rts
	mov.w	r0,@(100,gbr)
.L060372C0:
	.long func_0603C594
.L060372C4:
	mov.b	@(15,r2),r0
	tst	#128,r0
	bt	.L060372DE
	mov.w	@(18,r2),r0
	mov.l	r2,@-r15
	mov	r0,r6
	mov.l	.L060372F4,r3
	mov.l	r9,@-r15
	mov	#80,r0
	jsr	@r3
	mov	#1,r9
	mov.l	@r15+,r9
	mov.l	@r15+,r2
.L060372DE:
	mov.b	@(15,r2),r0
	mov.l	.L060372F8,r3
	extu.b	r0,r0
	shll2	r0
	shlr8	r0
	mov.b	@(r0,r3),r4
	mov.l	.L060372FC,r6
	add	#-1,r4
	lds.l	@r15+,pr
	jmp	@r6
	mov.b	r4,@(r0,r3)
.L060372F4:
	.long func_0601A27C
.L060372F8:
	.long D_060CFFCC
.L060372FC:
	.long func_06035FE4
	endlabel func_06037278

	glabel func_06037300
	mov	#21,r3
	mov	#64,r0
	mov.b	r3,@(r0,r2)
	mov	#65,r0
	mov.b	@(r0,r2),r0
	cmp/eq	r3,r0
	bt	.L06037318
	mov	#0,r0
	mov.w	r0,@(20,r2)
	mov.b	@(14,r2),r0
	or	#192,r0
	mov.b	r0,@(14,r2)
.L06037318:
	mov.l	@r2,r0
	cmp/eq	#0,r0
	bt	.L06037338
	mov	#20,r0
	mov.w	@(r0,r2),r3
	mov	#50,r4
	cmp/ge	r4,r3
	bt	.L06037338
	add	#1,r3
	mov.w	r3,@(r0,r2)
	mov.w	.L06037336,r0
	shll2	r3
	sub	r3,r0
	rts
	mov.w	r0,@(100,gbr)
.L06037336:
	.short 0x0100
.L06037338:
	mov	#6,r3
	mov	#64,r0
	mov.b	r3,@(r0,r2)
	mov	#0,r3
	mov	#69,r0
	mov.b	r3,@(r0,r2)
	mov.b	@(15,r2),r0
	mov.l	.L06037358,r3
	extu.b	r0,r0
	shll2	r0
	shlr8	r0
	mov.b	@(r0,r3),r4
	mov.l	.L0603735C,r6
	add	#-1,r4
	jmp	@r6
	mov.b	r4,@(r0,r3)
.L06037358:
	.long D_060CFFCC
.L0603735C:
	.long func_06035FE4
	endlabel func_06037300

	glabel func_06037360
	mov	#30,r0
	mov.b	@(r0,r1),r0
	tst	#2,r0
	bf	.L060373A8
	tst	#4,r0
	bf	.L060373C0
	mov.l	.L060373A0,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	cmp/eq	#0,r0
	bt	.L06037386
	sts.l	pr,@-r15
	mov.l	.L060373A4,r0
	mov	#30,r8
	jsr	@r0
	shll16	r8
	lds.l	@r15+,pr
	cmp/pz	r0
	bt	.L060373C0
.L06037386:
	mov.w	.L0603739A,r3
	mov.w	.L0603739C,r4
	shll8	r3
	mov.l	@(40,r2),r0
	shll8	r4
	cmp/ge	r3,r0
	bt	.L060373AE
	add	r4,r0
	bra	.L060373AE
	mov.l	r0,@(40,r2)
.L0603739A:
	.short 0x0200
.L0603739C:
	.short 0x0040
	.byte 0x00, 0x00
.L060373A0:
	.long player_obj
.L060373A4:
	.long obj_find_near_player
.L060373A8:
	mov	#0,r0
	mov.l	r0,@(40,r2)
	mov.l	r0,@(36,r2)
.L060373AE:
	mov.w	@(26,r2),r0
	mov	#1,r3
	shll8	r3
	add	#8,r0
	cmp/gt	r3,r0
	bf	.L060373BC
	mov	r3,r0
.L060373BC:
	rts
	mov.w	r0,@(26,r2)
.L060373C0:
	mov	#66,r0
	mov.b	@(r0,r2),r4
	mov	#112,r5
	and	r4,r5
	mov	#3,r4
	or	r4,r5
	mov	#66,r0
	mov.b	r5,@(r0,r2)
	mov.b	@(15,r2),r0
	and	#207,r0
	or	#48,r0
	mov.b	r0,@(15,r2)
	mov	#30,r0
	mov	#0,r4
	mov.b	r4,@(r0,r1)
	mov	#25,r4
	mov	#64,r0
	mov.b	r4,@(r0,r2)
	endlabel func_06037360

	glabel func_060373E4
	mov.l	@r2,r0
	cmp/pl	r0
	bf	.L06037406
	mov	#65,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#25,r0
	bt	.L060373FE
	mov	#0,r0
	mov.l	r0,@(36,r2)
	mov.l	r0,@(40,r2)
	mov.l	r0,@(44,r2)
	rts
	mov.w	r0,@(26,r2)
.L060373FE:
	mov.b	@(14,r1),r0
	mov	#10,r3
	cmp/eq	r3,r0
	bf	.L06037428
.L06037406:
	mov.b	@(15,r2),r0
	tst	#128,r0
	bf	.L06037414
	mov	#120,r0
	mov	#0,r4
	bra	.L0603741A
	mov.l	r4,@(r0,r2)
.L06037414:
	mov	#120,r0
	mov.w	.L0603742C,r4
	mov.l	r4,@(r0,r2)
.L0603741A:
	mov.b	@(14,r2),r0
	and	#47,r0
	mov.b	r0,@(14,r2)
	mov.b	@(15,r2),r0
	and	#207,r0
	or	#32,r0
	mov.b	r0,@(15,r2)
.L06037428:
	rts
	nop
.L0603742C:
	.short 0x12C0
	endlabel func_060373E4

	glabel func_0603742E
	mov.b	@(14,r2),r0
	or	#192,r0
	bra	func_060375DC
	mov.b	r0,@(14,r2)
	endlabel func_0603742E

	glabel func_06037436
	mov	#116,r0
	mov.l	@(r0,r2),r4
	mov	#4,r5
	tst	r5,r4
	bf	.L06037470
	mov	#0,r0
	mov.w	r0,@(26,r1)
	or	r5,r4
	mov.l	r4,@(r0,r2)
	mov.l	r2,@-r15
	mov.l	.L06037478,r3
	mov.b	@(14,r2),r0
	sts.l	pr,@-r15
	mov.l	.L0603747C,r2
	jsr	@r3
	mov.l	r0,@-r15
	mov.l	.L06037480,r4
	mov.l	r4,@(12,r3)
	mov.l	@r15+,r0
	add	#16,r3
	tst	#2,r0
	bt/s	.L0603746A
	lds.l	@r15+,pr
	mov	#64,r0
	shll8	r0
	mov.w	r0,@(30,r3)
.L0603746A:
	mov.l	@r15+,r2
	add	#64,r3
	mov.l	r2,@r3
.L06037470:
	mov	#0,r0
	bra	func_060375DC
	mov.l	r0,@(36,r2)
	.byte 0x00, 0x00
.L06037478:
	.long obj_alloc
.L0603747C:
	.long obj_list_stage
.L06037480:
	.long func_06038BD4
	endlabel func_06037436

	glabel func_06037484
	mov	#65,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#23,r0
	bt	lbl_0603749C
	mov.l	@r2,r0
	cmp/pl	r0
	bf	.L06037498
	mov.b	@(14,r1),r0
	cmp/eq	#12,r0
	bf	lbl_0603749C
.L06037498:
	bra	func_060375DC
	nop
	dlabel lbl_0603749C
	mov	#23,r4
	mov	#64,r0
	bra	func_060375DC
	mov.b	r4,@(r0,r2)
	endlabel func_06037484

	glabel func_060374A4
	mov	#64,r0
	mov.b	@(r0,r2),r3
	mov	#65,r0
	mov.b	@(r0,r2),r0
	cmp/eq	r3,r0
	bt	.L060374C6
	mov	#0,r3
	mov.l	r3,@(40,r2)
	mov.l	r3,@(36,r2)
	mov.b	@(14,r2),r0
	and	#253,r0
	or	#192,r0
	mov	r0,r3
	mov.b	@(13,r2),r0
	and	#2,r0
	bra	.L060374D0
	or	r3,r0
.L060374C6:
	mov.l	@r2,r0
	cmp/eq	#0,r0
	bf	.L060374D4
	mov.b	@(14,r2),r0
	and	#63,r0
.L060374D0:
	bra	func_060375DC
	mov.b	r0,@(14,r2)
.L060374D4:
	bra	func_060375DC
	nop
	endlabel func_060374A4

	glabel func_060374D8
	mov.l	@r2,r0
	cmp/pl	r0
	bf	.L06037526
	mov	#65,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#19,r0
	bf	.L0603751C
	mov	#66,r0
	mov.b	@(r0,r2),r4
	mov.b	@(24,gbr),r0
	mov	#2,r3
	cmp/ge	r0,r3
	bt	.L060374FC
	mov	#4,r3
	cmp/ge	r0,r3
	bt	.L06037506
	bra	.L06037506
	mov	#3,r4
.L060374FC:
	add	#-1,r4
	cmp/pz	r4
	bt	.L06037506
	bra	.L06037506
	mov	#0,r4
.L06037506:
	mov	#66,r0
	mov.b	r4,@(r0,r2)
	mov	#1,r3
	cmp/gt	r3,r4
	bt	.L06037530
	mov	#124,r0
	mov.w	r0,@(26,r2)
	mov.b	@(14,r2),r0
	or	#64,r0
	bra	func_060375DC
	mov.b	r0,@(14,r2)
.L0603751C:
	mov.w	@(26,r2),r0
	add	#-1,r0
	cmp/pl	r0
	bt/s	.L0603752C
	mov.w	r0,@(26,r2)
.L06037526:
	mov.b	@(14,r2),r0
	and	#191,r0
	mov.b	r0,@(14,r2)
.L0603752C:
	bra	func_060375DC
	nop
.L06037530:
	mov.w	.L06037542,r0
	mov.w	r0,@(20,r2)
	mov	#0,r0
	mov.w	r0,@(24,r2)
	mov.w	r0,@(22,r2)
	mov	#43,r4
	mov	#64,r0
	bra	func_060381BE
	mov.b	r4,@(r0,r2)
.L06037542:
	.short 0x0258
	endlabel func_060374D8

	glabel func_06037544
	mov.l	@r2,r0
	cmp/pl	r0
	bf	.L06037568
	mov	#65,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#8,r0
	bt	.L06037562
	cmp/eq	#82,r0
	bt	.L06037562
	mov	#0,r3
	mov.b	@(14,r2),r0
	mov.l	r3,@(36,r2)
	or	#64,r0
	bra	.L06037570
	mov.b	r0,@(14,r2)
.L06037562:
	mov.b	@(14,r1),r0
	cmp/eq	#7,r0
	bf	.L06037570
.L06037568:
	mov.b	@(14,r2),r0
	xor	#2,r0
	and	#191,r0
	mov.b	r0,@(14,r2)
.L06037570:
	bra	func_060375DC
	nop
	endlabel func_06037544

	glabel func_06037574
	mov.l	@r2,r0
	cmp/pl	r0
	bf	.L060375C2
	mov.b	@(15,r1),r0
	cmp/eq	#2,r0
	bf	.L060375C2
	mov.l	.L060375C8,r0
	mov.w	.L060375C6,r3
	mov.l	@r0,r0
	cmp/ge	r3,r0
	bt	.L060375C2
	sts.l	pr,@-r15
	mov.l	r2,@-r15
	mov.l	.L060375CC,r0
	mov.l	.L060375D0,r2
	jsr	@r0
	nop
	mov.l	.L060375D4,r5
	mov	#25,r0
	mov.l	r5,@(12,r3)
	mov.l	@(52,r1),r5
	add	#16,r3
	mov.w	r0,@(2,r3)
	mov.l	@(48,r1),r4
	mov.l	r5,@(52,r3)
	mov.w	@(194,gbr),r0
	mov.l	r4,@(48,r3)
	neg	r0,r0
	mov.l	@(56,r1),r2
	mov.w	r0,@(24,r3)
	mov.l	r2,@(56,r3)
	mov.l	.L060375D8,r5
	mov.b	@(14,r1),r0
	tst	#1,r0
	bf	.L060375BC
	neg	r5,r5
.L060375BC:
	mov.l	r5,@(32,r3)
	mov.l	@r15+,r2
	lds.l	@r15+,pr
.L060375C2:
	bra	func_060375DC
	nop
.L060375C6:
	.short 0x0200
.L060375C8:
	.long obj_count
.L060375CC:
	.long obj_alloc
.L060375D0:
	.long obj_list_stage
.L060375D4:
	.long func_06038A6C
.L060375D8:
	.long 0x0000C000
	endlabel func_06037574

	glabel func_060375DC
	mov.l	.L060375E4,r0
	jmp	@r0
	mov	#-32,r3
	.byte 0x00, 0x00
.L060375E4:
	.long func_060385FA
	endlabel func_060375DC

	glabel func_060375E8
	mov.l	@r2,r0
	cmp/pl	r0
	bf	.L0603760A
	mov	#64,r0
	mov.b	@(r0,r2),r3
	mov	#65,r0
	mov.b	@(r0,r2),r0
	cmp/eq	r3,r0
	bt	.L06037604
	sts.l	pr,@-r15
	bsr	func_06038468
	nop
	bra	func_060375DC
	lds.l	@r15+,pr
.L06037604:
	mov.b	@(14,r1),r0
	cmp/eq	#12,r0
	bf	.L06037660
.L0603760A:
	mov.b	@(15,r2),r0
	tst	#128,r0
	bf	.L06037618
	mov	#120,r0
	mov	#0,r4
	bra	.L0603761E
	mov.l	r4,@(r0,r2)
.L06037618:
	mov	#120,r0
	mov.w	.L06037664,r4
	mov.l	r4,@(r0,r2)
.L0603761E:
	mov.b	@(14,r2),r0
	and	#47,r0
	mov.b	r0,@(14,r2)
	mov	#69,r0
	mov.b	@(r0,r2),r3
	extu.b	r3,r3
	mov.l	@(28,r2),r4
	mov	#64,r0
	mov.b	@(r0,r4),r0
	cmp/eq	#-1,r0
	bf	.L06037654
	mov	#69,r0
	mov.b	@(r0,r4),r5
	extu.b	r5,r5
	add	#-25,r5
	cmp/pl	r5
	bt	.L0603764E
	mov	#0,r5
	mov.b	@(14,r4),r0
	or	#128,r0
	mov.b	r0,@(14,r4)
	mov	#64,r0
	mov	#6,r6
	mov.b	r6,@(r0,r4)
.L0603764E:
	mov	#69,r0
	mov.b	r5,@(r0,r4)
	add	#-40,r3
.L06037654:
	add	#-10,r3
	cmp/pl	r3
	bt	.L0603765C
	mov	#0,r3
.L0603765C:
	mov	#69,r0
	mov.b	r3,@(r0,r2)
.L06037660:
	bra	func_060375DC
	nop
.L06037664:
	.short 0x12C0
	endlabel func_060375E8

	glabel func_06037666
	mov	#65,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#32,r0
	bt	.L0603767C
	cmp/eq	#68,r0
	bt	.L0603767C
	sts.l	pr,@-r15
	bsr	func_06038468
	nop
	bra	func_060375DC
	lds.l	@r15+,pr
.L0603767C:
	mov.l	@r2,r0
	cmp/pl	r0
	bf	.L06037688
	mov.b	@(14,r1),r0
	cmp/eq	#9,r0
	bf	.L060376B6
.L06037688:
	mov.b	@(15,r2),r0
	tst	#128,r0
	bf/s	.L06037694
	mov	#120,r0
	bra	.L06037696
	mov	#0,r4
.L06037694:
	mov.w	.L060376BA,r4
.L06037696:
	mov.l	r4,@(r0,r2)
	mov.w	.L060376BC,r0
	mov.l	r0,@(20,r2)
	mov.b	@(14,r2),r0
	and	#47,r0
	tst	#2,r0
	bf/s	.L060376A6
	mov.b	r0,@(14,r2)
.L060376A6:
	mov	#69,r0
	mov.b	@(r0,r2),r3
	extu.b	r3,r3
	add	#-10,r3
	cmp/pl	r3
	bt	.L060376B4
	mov	#0,r3
.L060376B4:
	mov.b	r3,@(r0,r2)
.L060376B6:
	bra	func_060375DC
	nop
.L060376BA:
	.short 0x12C0
.L060376BC:
	.short 0x0258
	endlabel func_06037666

	glabel func_060376BE
	mov	#0,r3
	mov.b	@(13,r2),r0
	mov.l	r3,@(36,r2)
	tst	#1,r0
	mov.b	@(14,r2),r0
	bt/s	.L0603770A
	and	#2,r0
	cmp/eq	#2,r0
	bf	.L0603770E
.L060376D0:
	mov.b	@r2,r0
	cmp/eq	#0,r0
	bt	func_060375DC
	mov	#65,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#41,r0
	bt	.L060376E4
	mov	#0,r0
	bra	.L06037706
	mov.b	r0,@(14,r1)
.L060376E4:
	mov.b	@(14,r1),r0
	cmp/eq	#7,r0
	bf	.L06037706
	mov	#71,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#6,r0
	bt	.L060376FA
	mov	#72,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#6,r0
	bf	.L06037702
.L060376FA:
	mov	#7,r3
	mov	#64,r0
	bra	func_06037C92
	mov.b	r3,@(r0,r2)
.L06037702:
	rts
	nop
.L06037706:
	bra	func_060375DC
	nop
.L0603770A:
	cmp/eq	#0,r0
	bt	.L060376D0
.L0603770E:
	mov	#8,r3
	mov	#64,r0
	bra	func_06037544
	mov.b	r3,@(r0,r2)
	endlabel func_060376BE

	glabel func_06037716
	mov.w	@(22,r2),r0
	mov.w	.L0603772A,r4
	add	#1,r0
	cmp/ge	r4,r0
	bf	.L06037726
	mov.w	.L0603772C,r0
	mov.w	r0,@(20,r2)
	mov	#0,r0
.L06037726:
	bra	func_060375DC
	mov.w	r0,@(22,r2)
.L0603772A:
	.short 0x0384
.L0603772C:
	.short 0x0258
	endlabel func_06037716

	glabel func_0603772E
	mov.b	@(14,r2),r0
	or	#64,r0
	mov.b	r0,@(14,r2)
	mov.w	@(22,r2),r0
	mov.w	.L06037752,r4
	add	#1,r0
	cmp/ge	r4,r0
	bf	.L0603774E
	mov	#71,r3
	mov	#64,r0
	mov.b	r3,@(r0,r2)
	mov	#65,r0
	mov.b	r3,@(r0,r2)
	mov	#0,r0
	mov.b	r0,@(14,r1)
	mov.b	r0,@(15,r1)
.L0603774E:
	bra	func_060375DC
	mov.w	r0,@(22,r2)
.L06037752:
	.short 0x04B0
	endlabel func_0603772E

	glabel func_06037754
	mov.w	@(22,r2),r0
	mov.w	.L06037770,r4
	add	#1,r0
	cmp/ge	r4,r0
	bf	.L0603776C
	mov.b	@(14,r2),r0
	and	#191,r0
	mov.b	r0,@(14,r2)
	mov.w	.L06037772,r0
	mov.w	r0,@(20,r2)
	mov	#0,r0
	mov.w	r0,@(24,r2)
.L0603776C:
	bra	func_060375DC
	mov.w	r0,@(22,r2)
.L06037770:
	.short 0x0168
.L06037772:
	.short 0x0258
	endlabel func_06037754

	glabel func_06037774
	mov	#65,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#63,r0
	bt	.L060377BC
	mov.b	@(14,r2),r0
	or	#192,r0
	mov.b	r0,@(14,r2)
	mov	#0,r0
	mov.w	r0,@(26,r2)
	endlabel func_06037774

	glabel func_06037786
	mov.l	r2,@-r15
	mov.l	.L060377B0,r3
	sts.l	pr,@-r15
	mov.l	.L060377B4,r2
	jsr	@r3
	nop
	lds.l	@r15+,pr
	mov.l	.L060377B8,r4
	mov.l	@r15+,r2
	mov.l	r4,@(12,r3)
	mov.l	@(52,r2),r5
	add	#16,r3
	mov.l	r5,@(52,r3)
	mov.l	@(48,r2),r4
	mov.l	@(56,r2),r5
	mov.l	r4,@(48,r3)
	mov.l	r5,@(56,r3)
	add	#64,r3
	rts
	mov.l	r2,@r3
	.byte 0x00, 0x00
.L060377B0:
	.long obj_alloc
.L060377B4:
	.long obj_list_stage
.L060377B8:
	.long func_06038C80
.L060377BC:
	mov.l	@r2,r0
	cmp/eq	#0,r0
	bf	func_06037716
	mov.w	@(26,r2),r0
	mov	#-1,r5
	add	#1,r0
	cmp/eq	r5,r0
	bt/s	func_06037716
	mov.w	r0,@(26,r2)
	mov.b	@(14,r2),r0
	and	#63,r0
	bra	func_06037716
	mov.b	r0,@(14,r2)
	endlabel func_06037786

	glabel func_060377D6
	mov.b	@(14,r2),r0
	mov.l	.L06037804,r4
	and	#111,r0
	mov.b	r0,@(14,r2)
	mov.l	@r4,r5
	mov.l	@(60,r2),r4
	mov.l	@(60,r5),r3
	mov.l	@(32,r5),r0
	cmp/eq	#0,r0
	bt	.L060377F2
	sub	r3,r4
	xor	r0,r4
	cmp/pl	r4
	bf	.L0603782A
.L060377F2:
	mov	#65,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#16,r0
	bf	.L0603780C
	mov	#3,r4
	mov.l	.L06037808,r5
	mov	#64,r0
	jmp	@r5
	mov.b	r4,@(r0,r2)
.L06037804:
	.long player_obj
.L06037808:
	.long func_0603889C
.L0603780C:
	mov.b	@(14,r2),r0
	tst	#2,r0
	bt/s	.L0603781A
	cmp/pl	r3
	bf	.L06037822
	bra	.L0603781C
	nop
.L0603781A:
	bt	.L06037822
.L0603781C:
	mov.b	@(14,r2),r0
	xor	#2,r0
	mov.b	r0,@(14,r2)
.L06037822:
	mov	#16,r4
	mov	#64,r0
	bra	func_0603860C
	mov.b	r4,@(r0,r2)
.L0603782A:
	mov	#18,r4
	mov	#64,r0
	bra	func_06037484
	mov.b	r4,@(r0,r2)
	endlabel func_060377D6

	glabel func_06037832
	mov.l	@r2,r3
	cmp/pl	r3
	bt	.L0603786C
	mov	#17,r0
	mov.b	@(r0,r2),r4
	add	#1,r4
	mov	#120,r5
	mov.b	r4,@(r0,r2)
	cmp/ge	r5,r4
	bf	.L0603786C
	mov	#0,r4
	mov.b	r4,@(r0,r2)
	mov	#22,r0
	mov.w	r4,@(r0,r2)
	mov.b	@(15,r2),r0
	mov.l	.L06037868,r4
	and	#192,r0
	cmp/eq	#64,r0
	bt	.L0603785A
	add	#24,r4
.L0603785A:
	sts.l	pr,@-r15
	bsr	func_06037A64
	nop
	lds.l	@r15+,pr
	mov.w	r0,@(24,r2)
	bra	.L06037882
	mov	r0,r5
.L06037868:
	.long D_0603993D
.L0603786C:
	mov.w	@(20,r2),r0
	cmp/pl	r0
	bf	.L0603787E
	add	#-1,r0
	mov.w	r0,@(20,r2)
	mov	#0,r5
	mov	#24,r0
	bra	.L06037886
	mov.w	r5,@(r0,r2)
.L0603787E:
	mov	#24,r0
	mov.w	@(r0,r2),r5
.L06037882:
	cmp/pl	r5
	bt	.L0603788E
.L06037886:
	mov	#43,r4
	mov	#64,r0
	bra	func_060381BE
	mov.b	r4,@(r0,r2)
.L0603788E:
	mov.b	@(15,r2),r0
	add	#-1,r5
	and	#192,r0
	mov.l	.L060378B4,r4
	cmp/eq	#64,r0
	bt	.L0603789C
	add	#24,r4
.L0603789C:
	add	r4,r5
	mov.b	@r5,r5
	cmp/pz	r5
	bf	.L060378BC
.L060378A4:
	mov	#64,r0
	mov.b	r5,@(r0,r2)
	mov.l	.L060378B8,r0
	shll2	r5
	mov.l	@(r0,r5),r5
	jmp	@r5
	nop
	.byte 0x00, 0x00
.L060378B4:
	.long D_0603990D
.L060378B8:
	.long D_060395B0
.L060378BC:
	neg	r5,r8
	add	#-1,r8
	mov.b	@(20,gbr),r0
	mov.l	.L060378CC,r7
	shll	r0
	add	r8,r0
	bra	.L060378A4
	mov.b	@(r0,r7),r5
.L060378CC:
	.long D_060399CD
	endlabel func_06037832

	glabel func_060378D0
	mov	#65,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#16,r0
	bf	.L060378E0
	mov	#27,r4
	mov	#64,r0
	bra	func_060387FC
	mov.b	r4,@(r0,r2)
.L060378E0:
	mov.b	@(14,r2),r0
	and	#111,r0
	mov.b	r0,@(14,r2)
	mov.l	@(32,r2),r5
	mov.b	@(14,r2),r0
	tst	#2,r0
	bt/s	.L060378F8
	mov.l	@(36,r5),r3
	cmp/pl	r3
	bf	.L06037902
	bra	.L060378FC
	nop
.L060378F8:
	cmp/pl	r3
	bt	.L06037902
.L060378FC:
	mov.b	@(14,r2),r0
	xor	#2,r0
	mov.b	r0,@(14,r2)
.L06037902:
	mov	#16,r4
	mov	#64,r0
	bra	func_0603860C
	mov.b	r4,@(r0,r2)
	endlabel func_060378D0

	glabel func_0603790A
	sts.l	pr,@-r15
	mov.w	@(20,r2),r0
	cmp/pl	r0
	bf	.L06037956
	add	#-1,r0
	mov.w	r0,@(20,r2)
	mov.l	@(32,r2),r3
	mov	#64,r0
	mov.b	@(r0,r3),r0
	cmp/eq	#69,r0
	bf	.L06037924
	bra	func_06037BF6
	mov	#70,r4
.L06037924:
	cmp/eq	#72,r0
	bf	.L0603792C
	bra	func_06037BF6
	mov	#73,r4
.L0603792C:
	cmp/eq	#73,r0
	bf	.L06037934
	bra	func_06037BF6
	mov	#73,r4
.L06037934:
	cmp/eq	#75,r0
	bf	.L0603793C
	bra	func_06037BF6
	mov	#74,r4
.L0603793C:
	cmp/eq	#74,r0
	bf	.L06037944
	bra	func_06037BF6
	mov	#74,r4
.L06037944:
	cmp/eq	#65,r0
	bf	.L0603794C
	bra	func_06037BF6
	mov	#78,r4
.L0603794C:
	mov	#43,r4
	lds.l	@r15+,pr
	mov	#64,r0
	bra	func_060381BE
	mov.b	r4,@(r0,r2)
.L06037956:
	mov.l	@(32,r2),r3
	mov	#64,r0
	mov.b	@(r0,r3),r0
	cmp/eq	#7,r0
	bf	.L06037964
	bra	func_06037BF6
	mov	#14,r4
.L06037964:
	cmp/eq	#36,r0
	bf	.L0603796C
	bra	func_06037BF6
	mov	#14,r4
.L0603796C:
	cmp/eq	#14,r0
	bf	.L06037974
	bra	func_06037BF6
	mov	#7,r4
.L06037974:
	mov.l	.L0603797C,r4
	bra	func_06037B08
	mov.b	@(15,r2),r0
	.byte 0x00, 0x00
.L0603797C:
	.long D_0603996D
	endlabel func_0603790A

	glabel func_06037980
	mov.w	@(20,r2),r0
	cmp/pl	r0
	bf	.L06037992
	add	#-1,r0
	mov.w	r0,@(20,r2)
	mov	#43,r4
	mov	#64,r0
	bra	func_060381BE
	mov.b	r4,@(r0,r2)
.L06037992:
	sts.l	pr,@-r15
	mov.l	@(28,r2),r3
	mov	#64,r0
	mov.b	@(r0,r3),r0
	cmp/eq	#30,r0
	bf	.L060379A2
	bra	func_06037BF6
	mov	#37,r4
.L060379A2:
	mov.l	.L060379A8,r4
	bra	func_06037B08
	mov.b	@(15,r2),r0
.L060379A8:
	.long D_0603999D
	endlabel func_06037980

	glabel func_060379AC
	mov.b	@(14,r2),r0
	mov.l	@(36,r2),r5
	and	#2,r0
	cmp/pl	r5
	bt	.L060379CC
	cmp/pz	r5
	bf	.L060379D8
.L060379BA:
	mov.l	@(32,r2),r5
	mov.l	@(60,r2),r7
	mov.l	@(60,r5),r3
	mov.l	@(52,r2),r8
	mov.l	@(52,r5),r4
	sub	r7,r3
	sub	r8,r4
	bra	func_06038588
	mov	#8,r8
.L060379CC:
	cmp/eq	#2,r0
	bt	.L060379BA
	mov	#8,r4
	mov	#64,r0
	bra	func_06037544
	mov.b	r4,@(r0,r2)
.L060379D8:
	cmp/eq	#0,r0
	bt	.L060379BA
	mov	#8,r4
	mov	#64,r0
	bra	func_06037544
	mov.b	r4,@(r0,r2)
	endlabel func_060379AC

	glabel func_060379E4
	mov.b	@(14,r2),r0
	mov.l	@(36,r2),r5
	and	#2,r0
	cmp/pl	r5
	bt	.L06037A44
	cmp/pz	r5
	bf	.L06037A50
.L060379F2:
	sts.l	pr,@-r15
	mov.l	.L06037A0C,r0
	mov	#80,r8
	jsr	@r0
	shll16	r8
	lds.l	@r15+,pr
	cmp/pz	r0
	bf	.L06037A10
	mov	#14,r4
	mov	#64,r0
	bra	func_06037716
	mov.b	r4,@(r0,r2)
	.byte 0x00, 0x00
.L06037A0C:
	.long obj_find_near_player
.L06037A10:
	mov.l	.L06037A40,r4
	mov.l	@r4,r9
	mov	#67,r0
	mov.b	@(r0,r2),r0
	mov.l	@(60,r9),r3
	and	#240,r0
	shll8	r0
	shll2	r0
	shll	r0
	mov.l	@(52,r9),r4
	mov.l	@(32,r9),r5
	shll16	r0
	cmp/gt	r0,r5
	bt	.L06037A5C
	neg	r0,r0
	cmp/gt	r5,r0
	bt	.L06037A5C
	mov.l	@(60,r2),r7
	mov.l	@(52,r2),r8
	sub	r7,r3
	sub	r8,r4
	bra	func_06038588
	mov	#80,r8
	.byte 0x00, 0x00
.L06037A40:
	.long player_obj
.L06037A44:
	cmp/eq	#2,r0
	bt	.L060379F2
	mov	#8,r4
	mov	#64,r0
	bra	func_06037544
	mov.b	r4,@(r0,r2)
.L06037A50:
	cmp/eq	#0,r0
	bt	.L060379F2
	mov	#8,r4
	mov	#64,r0
	bra	func_06037544
	mov.b	r4,@(r0,r2)
.L06037A5C:
	mov	#13,r4
	mov	#64,r0
	bra	func_06037D5A
	mov.b	r4,@(r0,r2)
	endlabel func_060379E4

	glabel func_06037A64
	mov	#71,r0
	mov.b	@(r0,r2),r0
	mov.l	.L06037A8C,r6
	mov.b	@(r0,r4),r0
	sts.l	pr,@-r15
	cmp/pl	r0
	bf	.L06037A90
	shll	r0
	mov.w	@(r0,r6),r7
	add	r6,r7
	jsr	@r7
	shlr	r0
	cmp/eq	#-1,r0
	bt	.L06037A90
	lds.l	@r15+,pr
	mov	#71,r0
	mov.b	@(r0,r2),r0
	rts
	add	#1,r0
	.byte 0x00, 0x00
.L06037A8C:
	.long .L06037AB8
.L06037A90:
	mov	#72,r0
	mov.b	@(r0,r2),r0
	mov.b	@(r0,r4),r0
	cmp/pl	r0
	bf	.L06037AB2
	shll	r0
	mov.w	@(r0,r6),r7
	add	r6,r7
	jsr	@r7
	shlr	r0
	cmp/eq	#-1,r0
	bt	.L06037AB2
	lds.l	@r15+,pr
	mov	#72,r0
	mov.b	@(r0,r2),r0
	rts
	add	#1,r0
.L06037AB2:
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L06037AB8:
	.short func_06037AE0 - .L06037AB8
	.short func_06037AD6 - .L06037AB8
	.short func_06037AD0 - .L06037AB8
	.short func_06037AE0 - .L06037AB8
	.short func_06037ADA - .L06037AB8
	.short func_06037AE4 - .L06037AB8
	.short func_06037AE0 - .L06037AB8
	.short .L06037AB8 - .L06037AB8
	.short func_06037AF4 - .L06037AB8
	.short func_06037AF4 - .L06037AB8
	.short func_06037AF4 - .L06037AB8
	.short func_06037AF4 - .L06037AB8
	endlabel func_06037A64

	glabel func_06037AD0
	mov.b	@(14,r2),r0
	tst	#1,r0
	bt	func_06037AE0
	endlabel func_06037AD0

	glabel func_06037AD6
	rts
	mov	#1,r0
	endlabel func_06037AD6

	glabel func_06037ADA
	mov.b	@(14,r2),r0
	tst	#1,r0
	bt	func_06037AD6
	endlabel func_06037ADA

	glabel func_06037AE0
	rts
	mov	#-1,r0
	endlabel func_06037AE0

	glabel func_06037AE4
	mov.l	.L06037AF0,r7
	mov.w	@(0,r7),r0
	cmp/eq	#1,r0
	bf	func_06037AE0
	rts
	mov	#1,r0
.L06037AF0:
	.long D_060FFE70
	endlabel func_06037AE4

	glabel func_06037AF4
	mov	#-8,r8
	add	r0,r8
	mov.b	@(20,gbr),r0
	mov.l	.L06037B04,r7
	shll	r0
	add	r8,r0
	rts
	mov.b	@(r0,r7),r0
.L06037B04:
	.long D_060399E5
	endlabel func_06037AF4

	glabel func_06037B08
	tst	#128,r0
	mov	#71,r0
	bt/s	.L06037B1C
	mov.b	@(r0,r2),r0
	mov.l	.L06037B18,r6
	bra	.L06037B1E
	add	#24,r4
	.byte 0x00, 0x00
.L06037B18:
	.long D_06039925
.L06037B1C:
	mov.l	.L06037B3C,r6
.L06037B1E:
	mov.b	@(r0,r4),r0
	mov.l	.L06037B40,r5
	cmp/pl	r0
	bf	.L06037B44
	shll	r0
	mov.w	@(r0,r5),r7
	add	r5,r7
	jsr	@r7
	shlr	r0
	cmp/pz	r0
	bf	.L06037B44
	mov	#71,r0
	mov.b	@(r0,r2),r0
	bra	func_06037BF6
	mov.b	@(r0,r6),r4
.L06037B3C:
	.long D_0603990D
.L06037B40:
	.long .L06037B68
.L06037B44:
	mov	#72,r0
	mov.b	@(r0,r2),r0
	mov.b	@(r0,r4),r0
	cmp/pl	r0
	bf	.L06037B64
	shll	r0
	mov.w	@(r0,r5),r7
	add	r5,r7
	jsr	@r7
	shlr	r0
	cmp/pz	r0
	bf	.L06037B64
	mov	#72,r0
	mov.b	@(r0,r2),r0
	bra	func_06037BF6
	mov.b	@(r0,r6),r4
.L06037B64:
	bra	func_06038124
	lds.l	@r15+,pr
.L06037B68:
	.short func_06037BA6 - .L06037B68
	.short func_06037B94 - .L06037B68
	.short func_06037B8C - .L06037B68
	.short func_06037BB6 - .L06037B68
	.short func_06037B98 - .L06037B68
	.short func_06037BA6 - .L06037B68
	.short func_06037BC0 - .L06037B68
	.short func_06037BCA - .L06037B68
	.short func_06037BA6 - .L06037B68
	.short .L06037B68 - .L06037B68
	.short func_06037BDC - .L06037B68
	.short func_06037BDC - .L06037B68
	.short func_06037BDC - .L06037B68
	.short func_06037BDC - .L06037B68
	.short func_06037BDC - .L06037B68
	.short func_06037BDC - .L06037B68
	.short func_06037BDC - .L06037B68
	.short func_06037BDC - .L06037B68
	endlabel func_06037B08

	glabel func_06037B8C
	mov	#64,r0
	mov.b	@(r0,r3),r0
	cmp/eq	#17,r0
	bf	func_06037BA6
	endlabel func_06037B8C

	glabel func_06037B94
	rts
	mov	#0,r0
	endlabel func_06037B94

	glabel func_06037B98
	mov	#64,r0
	mov.b	@(r0,r3),r0
	cmp/eq	#6,r0
	bt	func_06037BA6
	mov.b	@(14,r3),r0
	tst	#64,r0
	bt	func_06037B94
	endlabel func_06037B98

	glabel func_06037BA6
	rts
	mov	#-1,r0
	.byte 0xE0, 0x40, 0x00, 0x3C, 0x88, 0x06, 0x89, 0xF9, 0x00, 0x0B, 0xE0, 0x00
	endlabel func_06037BA6

	glabel func_06037BB6
	mov.b	@(14,r2),r0
	tst	#1,r0
	bt	func_06037BA6
	rts
	mov	#0,r0
	endlabel func_06037BB6

	glabel func_06037BC0
	mov.b	@(14,r2),r0
	tst	#1,r0
	bf	func_06037BA6
	rts
	mov	#0,r0
	endlabel func_06037BC0

	glabel func_06037BCA
	mov.l	.L06037BD8,r7
	mov.w	@(0,r7),r0
	cmp/eq	#1,r0
	bf	func_06037BA6
	rts
	mov	#0,r0
	.byte 0x00, 0x00
.L06037BD8:
	.long D_060FFE70
	endlabel func_06037BCA

	glabel func_06037BDC
	mov	#-10,r8
	add	r0,r8
	mov.b	@(20,gbr),r0
	mov.l	.L06037C04,r7
	shll2	r0
	add	r0,r8
	add	r8,r7
	mov.b	@r7,r0
	cmp/eq	#-1,r0
	bt	func_06037BA6
	shlr	r8
	mov.l	.L06037C08,r0
	mov.b	@(r0,r8),r4
	endlabel func_06037BDC

	glabel func_06037BF6
	mov	#64,r0
	mov.b	r4,@(r0,r2)
	mov.l	.L06037C0C,r0
	shll2	r4
	mov.l	@(r0,r4),r4
	jmp	@r4
	lds.l	@r15+,pr
.L06037C04:
	.long D_060399FD
.L06037C08:
	.long D_060399CD
.L06037C0C:
	.long D_060395B0
	endlabel func_06037BF6

	glabel func_06037C10
	mov.l	@r2,r0
	cmp/eq	#0,r0
	bt	.L06037C50
	mov.b	@(15,r1),r0
	tst	#15,r0
	bf	.L06037C50
	mov.l	r2,@-r15
	mov.l	.L06037C54,r0
	sts.l	pr,@-r15
	mov.l	.L06037C58,r2
	jsr	@r0
	nop
	mov.l	.L06037C5C,r5
	lds.l	@r15+,pr
	mov.l	r5,@(12,r3)
	mov	#7,r0
	add	#16,r3
	mov.l	@(52,r1),r5
	mov.w	r0,@(2,r3)
	mov	#32,r2
	mov.l	r5,@(52,r3)
	mov.l	@(48,r1),r0
	shll8	r2
	mov.l	r0,@(48,r3)
	mov.l	@(56,r1),r4
	shll	r2
	mov.l	r4,@(56,r3)
	mov.w	@(194,gbr),r0
	mov.l	r2,@(32,r3)
	neg	r0,r0
	mov.l	@r15+,r2
	mov.w	r0,@(24,r3)
.L06037C50:
	bra	func_06037716
	nop
.L06037C54:
	.long obj_alloc
.L06037C58:
	.long obj_list_stage
.L06037C5C:
	.long func_06038A24
	endlabel func_06037C10

	glabel func_06037C60
	mov.b	@(13,r2),r0
	tst	#2,r0
	bf	.L06037C74
	mov.b	@(14,r2),r0
	tst	#2,r0
	bt	.L06037C7A
.L06037C6C:
	mov	#8,r3
	mov	#64,r0
	bra	func_06037544
	mov.b	r3,@(r0,r2)
.L06037C74:
	mov.b	@(14,r2),r0
	tst	#2,r0
	bt	.L06037C6C
.L06037C7A:
	mov.l	@(28,r2),r3
	mov.b	@(14,r3),r0
	tst	#64,r0
	bf	.L06037C8A
	mov	#37,r4
	mov	#64,r0
	bra	func_06037716
	mov.b	r4,@(r0,r3)
.L06037C8A:
	mov	#35,r4
	mov	#64,r0
	bra	func_060375DC
	mov.b	r4,@(r0,r2)
	endlabel func_06037C60

	glabel func_06037C92
	mov	#0,r3
	mov.b	@(13,r2),r0
	mov.l	r3,@(36,r2)
	tst	#1,r0
	mov.b	@(14,r2),r0
	bt/s	.L06037CE0
	and	#2,r0
	cmp/eq	#2,r0
	bf	.L06037CE4
.L06037CA4:
	mov.b	@r2,r0
	cmp/eq	#0,r0
	bt	.L06037CDC
	mov	#65,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#7,r0
	bt	.L06037CB8
	mov	#0,r0
	bra	func_060375DC
	mov.b	r0,@(14,r1)
.L06037CB8:
	mov.b	@(14,r1),r0
	cmp/eq	#12,r0
	bf	.L06037CDC
	mov.l	.L06037CD8,r4
	mov.l	@r4,r0
	rotl	r0
	xor	r2,r0
	mov.l	r0,@r4
	shlr8	r0
	tst	#1,r0
	bf	.L06037CEC
	mov	#14,r4
	mov	#64,r0
	bra	func_06037716
	mov.b	r4,@(r0,r2)
	.byte 0x00, 0x00
.L06037CD8:
	.long D_06035A6C
.L06037CDC:
	bra	func_06037716
	nop
.L06037CE0:
	cmp/eq	#0,r0
	bt	.L06037CA4
.L06037CE4:
	mov	#8,r4
	mov	#64,r0
	bra	func_06037544
	mov.b	r4,@(r0,r2)
.L06037CEC:
	mov	#36,r4
	mov	#64,r0
	bra	lbl_06037CF4
	mov.b	r4,@(r0,r2)
	dlabel lbl_06037CF4
	mov	#0,r3
	mov.b	@(13,r2),r0
	mov.l	r3,@(36,r2)
	tst	#1,r0
	mov.b	@(14,r2),r0
	bt/s	.L06037D4E
	and	#2,r0
	cmp/eq	#2,r0
	bf	.L06037D52
.L06037D06:
	mov.b	@r2,r0
	cmp/eq	#0,r0
	bt	.L06037D4A
	mov	#65,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#36,r0
	bt	.L06037D1A
	mov	#0,r0
	bra	func_060375DC
	mov.b	r0,@(14,r1)
.L06037D1A:
	mov.b	@(14,r1),r0
	cmp/eq	#12,r0
	bf	.L06037D4A
	mov.l	@(32,r2),r3
	mov	#66,r0
	mov.b	@(r0,r2),r4
	mov.b	@(r0,r3),r5
	mov	#3,r6
	and	r6,r4
	and	r6,r5
	mov	#2,r6
	cmp/eq	r6,r4
	bt	.L06037D42
	cmp/eq	r5,r6
	bf	.L06037D42
	mov.b	@(r0,r3),r5
	mov	#-4,r6
	and	r6,r5
	or	r4,r5
	mov.b	r5,@(r0,r3)
.L06037D42:
	mov	#7,r3
	mov	#64,r0
	bra	func_06037C92
	mov.b	r3,@(r0,r2)
.L06037D4A:
	bra	func_060375DC
	nop
.L06037D4E:
	cmp/eq	#0,r0
	bt	.L06037D06
.L06037D52:
	mov	#8,r3
	mov	#64,r0
	bra	func_06037544
	mov.b	r3,@(r0,r2)
	endlabel func_06037C92

	glabel func_06037D5A
	mov	#0,r0
	mov.l	r0,@(36,r2)
	mov.l	.L06037D78,r0
	mov.l	@r0,r0
	mov.l	@(60,r0),r3
	mov.b	@(14,r2),r0
	mov.l	@(60,r2),r4
	sub	r4,r3
	and	#2,r0
	cmp/pl	r3
	bt	.L06037D7C
	cmp/pz	r3
	bf	.L06037D88
.L06037D74:
	bra	func_0603863C
	nop
.L06037D78:
	.long player_obj
.L06037D7C:
	cmp/eq	#2,r0
	bt	.L06037D74
	mov.b	@(14,r2),r0
	xor	#2,r0
	bra	.L06037D74
	mov.b	r0,@(14,r2)
.L06037D88:
	cmp/eq	#0,r0
	bt	.L06037D74
	mov.b	@(14,r2),r0
	xor	#2,r0
	bra	.L06037D74
	mov.b	r0,@(14,r2)
	endlabel func_06037D5A

	glabel func_06037D94
	mov.l	@r2,r0
	sts.l	pr,@-r15
	cmp/eq	#0,r0
	bt	.L06037E56
	mov	#0,r0
	mov.w	r0,@(26,r1)
	mov	#64,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#9,r0
	bf/s	.L06037DD4
	mov.w	@(20,r1),r0
	exts.b	r0,r0
	cmp/eq	#-91,r0
	bf	.L06037DD4
	mov.w	.L06037DCA,r8
	mov.l	.L06037DCC,r0
	jsr	@r0
	shll16	r8
	cmp/pz	r0
	bf	.L06037E14
	mov	#1,r5
	mov.l	.L06037DD0,r0
	mov	#26,r6
	jsr	@r0
	mov	#3,r4
	bra	.L06037E14
	nop
.L06037DCA:
	.short 0x0100
.L06037DCC:
	.long obj_find_near_player
.L06037DD0:
	.long snd_seq_start
.L06037DD4:
	cmp/eq	#104,r0
	bf	.L06037E0E
	mov.w	.L06037DF8,r8
	mov.l	.L06037DFC,r0
	jsr	@r0
	shll16	r8
	cmp/pz	r0
	bf	.L06037E14
	mov.b	@(15,r2),r0
	tst	#128,r0
	bf	.L06037E04
	mov	#1,r5
	mov.l	.L06037E00,r0
	mov	#42,r6
	jsr	@r0
	mov	#3,r4
	bra	.L06037E0E
	nop
.L06037DF8:
	.short 0x0100
	.byte 0x00, 0x00
.L06037DFC:
	.long obj_find_near_player
.L06037E00:
	.long snd_seq_start
.L06037E04:
	mov	#1,r5
	mov.l	.L06037E5C,r0
	mov	#46,r6
	jsr	@r0
	mov	#3,r4
.L06037E0E:
	mov.w	@(20,r1),r0
	cmp/eq	#105,r0
	bf	.L06037E56
.L06037E14:
	mov.b	@(15,r1),r0
	cmp/eq	#2,r0
	bf	.L06037E56
	mov.l	r2,@-r15
	mov.l	.L06037E60,r0
	mov.l	.L06037E64,r2
	jsr	@r0
	nop
	mov.l	.L06037E68,r5
	mov.l	.L06037E6C,r4
	mov.l	@r4,r0
	rotl	r0
	xor	r2,r0
	mov.l	r0,@r4
	mov.l	r5,@(12,r3)
	and	#1,r0
	mov.l	@(52,r1),r6
	add	#16,r3
	mov.l	r6,@(52,r3)
	add	#5,r0
	mov.w	r0,@(2,r3)
	mov.l	@(48,r1),r5
	mov	#32,r2
	mov.l	r5,@(48,r3)
	mov.l	@(56,r1),r4
	shll8	r2
	mov.l	r4,@(56,r3)
	shll	r2
	mov.l	r2,@(32,r3)
	mov.w	@(194,gbr),r0
	mov.l	@r15+,r2
	neg	r0,r0
	mov.w	r0,@(24,r3)
.L06037E56:
	bra	func_06037716
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L06037E5C:
	.long snd_seq_start
.L06037E60:
	.long obj_alloc
.L06037E64:
	.long obj_list_stage
.L06037E68:
	.long func_06038A24
.L06037E6C:
	.long D_06035A6C
	endlabel func_06037D94

	glabel func_06037E70
	mov.l	@r2,r0
	cmp/eq	#0,r0
	bt	.L06037ECE
	mov	#0,r0
	mov.w	r0,@(26,r1)
	mov	#-41,r3
	mov.w	@(20,r1),r0
	extu.b	r3,r3
	cmp/eq	r3,r0
	bf	.L06037ECE
	mov.b	@(15,r1),r0
	cmp/eq	#4,r0
	bf	.L06037ECE
	mov.l	.L06037ED4,r8
	mov.w	.L06037ED2,r7
	mov.l	@r8,r0
	cmp/ge	r7,r0
	bt	.L06037ECE
	mov.l	r2,@-r15
	mov.l	.L06037ED8,r3
	mov.b	@(14,r2),r0
	sts.l	pr,@-r15
	mov.l	.L06037EDC,r2
	jsr	@r3
	mov.l	r0,@-r15
	mov.l	.L06037EE0,r4
	mov.w	@(194,gbr),r0
	mov.l	r4,@(12,r3)
	mov.l	@(52,r1),r5
	add	#16,r3
	neg	r0,r0
	mov.l	r5,@(52,r3)
	mov.l	@(48,r1),r2
	mov.w	r0,@(24,r3)
	mov.l	@(56,r1),r4
	mov.l	r2,@(48,r3)
	mov.l	@r15+,r0
	mov.l	r4,@(56,r3)
	tst	#2,r0
	lds.l	@r15+,pr
	bt/s	.L06037ECA
	mov.l	@r15+,r2
	mov	#64,r0
	shll8	r0
	mov.w	r0,@(30,r3)
.L06037ECA:
	add	#64,r3
	mov.l	r2,@r3
.L06037ECE:
	bra	func_06037716
	nop
.L06037ED2:
	.short 0x0200
.L06037ED4:
	.long obj_count
.L06037ED8:
	.long obj_alloc
.L06037EDC:
	.long obj_list_stage
.L06037EE0:
	.long func_06038ABC
	endlabel func_06037E70

	glabel func_06037EE4
	mov.l	@r2,r0
	cmp/eq	#0,r0
	bt	.L06037F6C
	mov	#25,r3
	mov.b	@(14,r1),r0
	cmp/eq	r3,r0
	bf	.L06037F6C
	mov.b	@(15,r1),r0
	cmp/eq	#2,r0
	bf	.L06037F6C
	mov.b	@(13,r2),r0
	tst	#4,r0
	bt	.L06037F6C
	mov.l	@(32,r2),r6
	mov.w	.L06037F70,r3
	mov	r6,r5
	shlr16	r5
	cmp/eq	r3,r5
	bf	.L06037F6C
	mov.l	r2,@-r15
	mov.l	.L06037F74,r3
	mov.b	@(14,r2),r0
	sts.l	pr,@-r15
	mov.l	.L06037F78,r2
	jsr	@r3
	mov.l	r0,@-r15
	mov.l	.L06037F7C,r4
	mov.l	@(52,r1),r5
	mov.l	r4,@(12,r3)
	mov.l	@(48,r1),r2
	add	#16,r3
	mov.l	@(56,r1),r4
	mov.l	r5,@(52,r3)
	mov.l	@r15+,r0
	mov.l	r2,@(48,r3)
	tst	#2,r0
	mov.l	r4,@(56,r3)
	bt	.L06037F36
	mov	#64,r0
	shll8	r0
	mov.w	r0,@(30,r3)
.L06037F36:
	mov.w	@(194,gbr),r0
	lds.l	@r15+,pr
	neg	r0,r0
	mov.l	@r15+,r2
	mov.w	r0,@(24,r3)
	sts.l	pr,@-r15
	mov.l	@(32,r2),r6
	mov.l	r3,@-r15
	mov.l	@(56,r6),r5
	mov.l	@(52,r6),r4
	mov.l	@(48,r6),r3
	mov.l	@(56,r2),r9
	mov.l	@(52,r2),r8
	mov.l	.L06037F80,r0
	jsr	@r0
	mov.l	@(48,r2),r7
	mov.l	@r15+,r6
	shll2	r3
	shll	r3
	mov.l	r3,@(32,r6)
	shll2	r4
	shll	r4
	mov.l	r4,@(36,r6)
	shll2	r5
	shll	r5
	mov.l	r5,@(40,r6)
	lds.l	@r15+,pr
.L06037F6C:
	bra	.L06038042
	nop
.L06037F70:
	.long D_060C0000
.L06037F74:
	.long obj_alloc
.L06037F78:
	.long obj_list_stage
.L06037F7C:
	.long func_06038B84
.L06037F80:
	.long func_060349D0
	endlabel func_06037EE4

	glabel func_06037F84
	mov.b	@(14,r2),r0
	tst	#1,r0
	bf	.L06037F92
	mov	#0,r0
	mov.l	r0,@(40,r2)
	bra	.L06038042
	mov.l	r0,@(32,r2)
.L06037F92:
	mov	#0,r0
	mov.w	r0,@(26,r1)
	mov	#67,r3
	mov	#64,r0
	bra	func_06037EE4
	mov.b	r3,@(r0,r2)
	endlabel func_06037F84

	glabel func_06037F9E
	mov.w	@(18,r2),r0
	cmp/eq	#0,r0
	bf	.L06037FA8
.L06037FA4:
	bra	func_060375DC
	nop
.L06037FA8:
	sts.l	pr,@-r15
	mov.l	r2,@-r15
	mov.l	@(544,gbr),r0
	mov.l	@(56,r2),r3
	jsr	@r0
	mov.l	@(48,r2),r2
	mov.l	@r15+,r2
	add	r4,r5
	lds.l	@r15+,pr
	shar	r5
	mov.l	@(52,r2),r4
	cmp/ge	r5,r4
	bf	.L06037FA4
	mov	#-1,r3
	shll16	r3
	add	r3,r4
	bra	func_060375DC
	mov.l	r4,@(52,r2)
	endlabel func_06037F9E

	glabel func_06037FCC
	mov.l	@r2,r0
	cmp/eq	#0,r0
	bt	.L06038016
	mov	#25,r3
	mov.b	@(14,r1),r0
	cmp/eq	r3,r0
	bf	.L06038016
	mov.b	@(15,r1),r0
	cmp/eq	#2,r0
	bf	.L06038016
	mov.l	r2,@-r15
	mov.l	.L0603801C,r3
	mov.b	@(14,r2),r0
	sts.l	pr,@-r15
	mov.l	.L06038020,r2
	jsr	@r3
	mov.l	r0,@-r15
	mov.l	.L06038024,r4
	mov.l	@(52,r1),r5
	mov.l	r4,@(12,r3)
	mov.l	@(48,r1),r2
	add	#16,r3
	mov.l	@(56,r1),r4
	mov.l	r5,@(52,r3)
	mov.l	@r15+,r0
	mov.l	r2,@(48,r3)
	tst	#2,r0
	mov.l	r4,@(56,r3)
	bt	.L0603800C
	mov	#64,r0
	shll8	r0
	mov.w	r0,@(30,r3)
.L0603800C:
	mov.w	@(194,gbr),r0
	lds.l	@r15+,pr
	neg	r0,r0
	mov.l	@r15+,r2
	mov.w	r0,@(24,r3)
.L06038016:
	bra	func_06037716
	nop
	.byte 0x00, 0x00
.L0603801C:
	.long obj_alloc
.L06038020:
	.long obj_list_stage
.L06038024:
	.long func_06038B30
	endlabel func_06037FCC

	glabel func_06038028
	mov.b	@(14,r2),r0
	tst	#1,r0
	bf	.L06038032
	bra	.L06038042
	nop
.L06038032:
	mov	#0,r0
	mov.w	r0,@(26,r1)
	mov	#56,r3
	mov	#64,r0
	bra	func_06037FCC
	mov.b	r3,@(r0,r2)
	endlabel func_06038028

	glabel func_0603803E
	mov	#0,r0
	mov.w	r0,@(26,r1)
.L06038042:
	mov	#3,r5
	mov.l	@(40,r2),r0
	shll16	r5
	cmp/ge	r5,r0
	bt	.L06038054
	mov	#32,r3
	shll8	r3
	add	r3,r0
	mov.l	r0,@(40,r2)
.L06038054:
	mov.l	@(52,r2),r3
	add	r0,r3
	rts
	mov.l	r3,@(52,r2)
	endlabel func_0603803E

	glabel func_0603805C
	mov	#116,r0
	mov.l	@(r0,r2),r0
	tst	#1,r0
	bf	func_06038124
	mov.b	@(14,r2),r0
	tst	#1,r0
	bt	.L06038042
	mov	#55,r3
	mov	#64,r0
	mov.b	r3,@(r0,r2)
	dlabel lbl_06038070
	mov	#116,r0
	mov.l	@(r0,r2),r3
	mov	#1,r4
	tst	r4,r3
	bf	.L06038138
	or	r4,r3
	mov.l	r3,@(r0,r2)
	mov.b	@(14,r2),r0
	or	#192,r0
	mov.b	r0,@(14,r2)
	mov	#0,r0
	mov.l	r0,@(36,r2)
	mov.l	r0,@(40,r2)
	mov.l	r0,@(44,r2)
	mov.l	r2,@-r15
	mov.l	.L060380B4,r3
	sts.l	pr,@-r15
	mov.l	.L060380B8,r2
	jsr	@r3
	nop
	lds.l	@r15+,pr
	mov.l	.L060380BC,r4
	mov.l	@r15+,r2
	mov.l	r4,@(12,r3)
	mov.l	@(52,r2),r5
	add	#16,r3
	mov.l	r5,@(52,r3)
	mov.l	@(48,r2),r4
	mov.l	@(56,r2),r5
	mov.l	r4,@(48,r3)
	mov.l	r5,@(56,r3)
	add	#64,r3
	rts
	mov.l	r2,@r3
.L060380B4:
	.long obj_alloc
.L060380B8:
	.long obj_list_stage
.L060380BC:
	.long func_06038C14
	endlabel func_0603805C

	glabel func_060380C0
	mov	#116,r0
	mov.l	@(r0,r2),r0
	tst	#1,r0
	bf	func_06038124
	mov.b	@(14,r2),r0
	tst	#1,r0
	bt	.L06038042
	mov	#59,r3
	mov	#64,r0
	mov.b	r3,@(r0,r2)
	dlabel lbl_060380D4
	mov	#116,r0
	mov.l	@(r0,r2),r3
	mov	#1,r4
	tst	r4,r3
	bf	.L06038138
	or	r4,r3
	mov.l	r3,@(r0,r2)
	mov.b	@(14,r2),r0
	or	#192,r0
	mov.b	r0,@(14,r2)
	mov	#0,r0
	mov.l	r0,@(36,r2)
	mov.l	r0,@(40,r2)
	mov.l	r0,@(44,r2)
	sts.l	pr,@-r15
	mov.l	r2,@-r15
	mov.l	.L06038118,r3
	mov.l	.L0603811C,r2
	jsr	@r3
	nop
	mov.l	.L06038120,r4
	mov.l	@r15+,r2
	mov.l	r4,@(12,r3)
	mov.l	@(52,r2),r5
	add	#16,r3
	mov.l	r5,@(52,r3)
	mov.l	@(48,r2),r4
	mov.l	@(56,r2),r5
	mov.l	r4,@(48,r3)
	mov.l	r5,@(56,r3)
	add	#64,r3
	lds.l	@r15+,pr
	rts
	mov.l	r2,@r3
.L06038118:
	.long obj_alloc
.L0603811C:
	.long obj_list_stage
.L06038120:
	.long func_06038C38
	endlabel func_060380C0

	glabel func_06038124
	mov	#43,r3
	mov	#64,r0
	mov.b	r3,@(r0,r2)
	mov.w	.L06038136,r0
	mov.w	r0,@(20,r2)
	mov	#0,r0
	mov.w	r0,@(24,r2)
	bra	func_060381BE
	mov.w	r0,@(22,r2)
.L06038136:
	.short 0x0258
.L06038138:
	mov	#2,r0
	tst	r0,r3
	bt	.L06038144
	mov.b	@(14,r2),r0
	and	#63,r0
	mov.b	r0,@(14,r2)
.L06038144:
	rts
	nop
	endlabel func_06038124

	glabel func_06038148
	mov	#116,r0
	mov.l	@(r0,r2),r0
	tst	#1,r0
	bf	func_06038124
	mov.b	@(14,r2),r0
	tst	#1,r0
	bt	.L0603815E
	mov	#61,r4
	mov	#64,r0
	bra	lbl_06038162
	mov.b	r4,@(r0,r2)
.L0603815E:
	bra	.L06038042
	nop
	dlabel lbl_06038162
	mov	#116,r0
	mov.l	@(r0,r2),r3
	mov	#1,r4
	tst	r4,r3
	bf	.L06038138
	or	r4,r3
	mov.l	r3,@(r0,r2)
	mov.b	@(14,r2),r0
	or	#192,r0
	mov.b	r0,@(14,r2)
	mov	#0,r0
	mov.l	r0,@(36,r2)
	mov.l	r0,@(40,r2)
	mov.l	r0,@(44,r2)
	mov.l	r2,@-r15
	mov.l	.L060381A8,r3
	sts.l	pr,@-r15
	mov.l	.L060381AC,r2
	jsr	@r3
	nop
	lds.l	@r15+,pr
	mov.l	.L060381B0,r4
	mov.l	@r15+,r2
	mov.l	r4,@(12,r3)
	mov.l	@(52,r2),r5
	add	#16,r3
	mov.l	r5,@(52,r3)
	mov.l	@(48,r2),r4
	mov.l	@(56,r2),r5
	mov.l	r4,@(48,r3)
	mov.l	r5,@(56,r3)
	add	#64,r3
	rts
	mov.l	r2,@r3
	.byte 0x00, 0x00
.L060381A8:
	.long obj_alloc
.L060381AC:
	.long obj_list_stage
.L060381B0:
	.long func_06038C5C
	.byte 0x84, 0x2E, 0xCB, 0xC0, 0x80, 0x2E, 0x00, 0x0B, 0x00, 0x09
	endlabel func_06038148

	glabel func_060381BE
	mov.w	@(18,r2),r0
	sts.l	pr,@-r15
	cmp/eq	#0,r0
	bt	.L06038256
	mov.b	@(15,r2),r0
	mov.l	.L060381D4,r3
	and	#3,r0
	shll2	r0
	mov.l	@(r0,r3),r3
	jmp	@r3
	nop
.L060381D4:
	.long D_060381D8
	dlabel D_060381D8
	.long func_0603823E
	.long func_06038230
	.long func_0603820C
	.long func_060381E8
	endlabel func_060381BE

	glabel func_060381E8
	mov.l	r2,@-r15
	mov.l	@(544,gbr),r0
	mov.l	@(56,r2),r3
	jsr	@r0
	mov.l	@(48,r2),r2
	mov	#16,r3
	mov.l	@r15+,r2
	add	#68,r3
	mov.l	@(52,r2),r4
	shll16	r3
	sub	r3,r5
	cmp/ge	r5,r4
	bf	.L06038256
	mov	#1,r3
	shll16	r3
	add	r3,r4
	bra	.L06038256
	mov.l	r4,@(52,r2)
	endlabel func_060381E8

	glabel func_0603820C
	mov.l	r2,@-r15
	mov.l	@(544,gbr),r0
	mov.l	@(56,r2),r3
	jsr	@r0
	mov.l	@(48,r2),r2
	mov	#16,r3
	mov.l	@r15+,r2
	add	#22,r3
	mov.l	@(52,r2),r4
	shll16	r3
	sub	r3,r5
	cmp/ge	r4,r5
	bt	.L06038256
	mov	#1,r3
	shll16	r3
	sub	r3,r4
	bra	.L06038256
	mov.l	r4,@(52,r2)
	endlabel func_0603820C

	glabel func_06038230
	mov.b	@(14,r2),r0
	tst	#1,r0
	bt	.L06038256
	mov	#-2,r4
	shll16	r4
	bra	.L060382C8
	mov.l	r4,@(40,r2)
	endlabel func_06038230

	glabel func_0603823E
	mov.b	@(14,r2),r0
	tst	#1,r0
	bt	.L06038256
	mov	#-2,r3
	mov.l	@(44,r2),r0
	shll16	r3
	cmp/eq	#0,r0
	mov.l	r3,@(40,r2)
	bt	.L06038252
	neg	r0,r3
.L06038252:
	bra	.L060382C8
	mov.l	r3,@(44,r2)
.L06038256:
	mov.b	@(14,r2),r0
	tst	#1,r0
	bf	.L060382C8
	mov.w	@(22,r2),r0
	add	#1,r0
	mov.w	r0,@(22,r2)
	mov.w	.L060382A0,r4
	tst	r4,r0
	bf	.L0603827A
	mov	#0,r0
	mov.w	r0,@(22,r2)
	mov.l	.L060382A4,r4
	mov.l	@r4,r0
	rotl	r0
	xor	r2,r0
	mov.l	r0,@r4
	tst	#7,r0
	bt	.L060382B0
.L0603827A:
	mov	#67,r0
	mov.b	@(r0,r2),r0
	mov.l	@(44,r2),r3
	and	#240,r0
	mov	r0,r4
	shll8	r4
	shll2	r4
	cmp/pl	r3
	bt/s	.L060382A8
	mov.b	@(14,r2),r0
	cmp/pz	r3
	bf	.L06038296
	tst	#2,r0
	bf	.L060382A8
.L06038296:
	neg	r4,r4
	tst	#2,r0
	bf	.L060382B0
	bra	.L060382C8
	mov.l	r4,@(44,r2)
.L060382A0:
	.short 0x03FF
	.byte 0x00, 0x00
.L060382A4:
	.long D_06035A6C
.L060382A8:
	tst	#2,r0
	bt	.L060382B0
	bra	.L060382C8
	mov.l	r4,@(44,r2)
.L060382B0:
	lds.l	@r15+,pr
	mov.b	@(15,r2),r0
	tst	#192,r0
	bt	.L060382C0
	mov	#8,r4
	mov	#64,r0
	bra	func_06037544
	mov.b	r4,@(r0,r2)
.L060382C0:
	mov	#82,r4
	mov	#64,r0
	bra	func_06037544
	mov.b	r4,@(r0,r2)
.L060382C8:
	mov	#68,r0
	mov.b	@(r0,r2),r0
	mov.l	.L060382F4,r5
	and	#7,r0
	shll2	r0
	mov.l	@(r0,r5),r3
	mov	#16,r0
	mov.b	@(r0,r2),r4
	add	#1,r4
	jsr	@r3
	mov.b	r4,@(r0,r2)
	mov	#68,r0
	mov.b	@(r0,r2),r0
	and	#112,r0
	shlr2	r0
	mov.l	@(r0,r5),r3
	mov	#16,r0
	jsr	@r3
	mov.b	@(r0,r2),r4
	bra	func_0603863C
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L060382F4:
	.long D_060382F8
	dlabel D_060382F8
	.long .L06038318
	.long func_0603831E
	.long func_060383CC
	.long func_06038358
	.long func_06038378
	.long func_06038392
	.long func_060383F0
	.long func_060383AC
.L06038318:
	mov.l	@(44,r2),r3
	rts
	mov.l	r3,@(36,r2)
	endlabel func_0603823E

	glabel func_0603831E
	mov.l	.L06038354,r10
	shll8	r4
	endlabel func_0603831E

	glabel func_06038322
	sts.l	pr,@-r15
	jsr	@r10
	extu.w	r4,r0
	cmp/pz	r11
	bt	.L0603832E
	neg	r11,r11
.L0603832E:
	mov.l	@(44,r2),r3
	shll2	r10
	dmuls.l	r3,r10
	shll2	r11
	lds.l	@r15+,pr
	sts	mach,r0
	sts	macl,r10
	dmuls.l	r3,r11
	xtrct	r0,r10
	mov.w	@(18,r2),r0
	cmp/eq	#0,r0
	bt	.L06038348
	mov.l	r10,@(40,r2)
.L06038348:
	sts	mach,r3
	sts	macl,r11
	xtrct	r3,r11
	rts
	mov.l	r11,@(36,r2)
	.byte 0x00, 0x00
.L06038354:
	.long math_sincos
	endlabel func_06038322

	glabel func_06038358
	mov	#-64,r0
	extu.b	r4,r4
	extu.b	r0,r0
	cmp/ge	r0,r4
	bf	.L06038318
	sub	r0,r4
.L06038364:
	mov.l	.L06038374,r10
	shll8	r4
	endlabel func_06038358

	glabel func_06038368
	sts.l	pr,@-r15
	shll2	r4
	jsr	@r10
	mov	r4,r0
	bra	.L0603832E
	nop
.L06038374:
	.long math_sincos
	endlabel func_06038368

	glabel func_06038378
	extu.b	r4,r0
	tst	#64,r0
	bt	.L06038318
	tst	#128,r0
	bt	.L0603838A
	mov	#-64,r0
	extu.b	r0,r0
	bra	.L06038364
	sub	r0,r4
.L0603838A:
	mov	#64,r0
	sub	r0,r4
	bra	.L06038364
	neg	r4,r4
	endlabel func_06038378

	glabel func_06038392
	mov.l	.L060383A4,r10
	shll8	r4
	endlabel func_06038392

	glabel func_06038396
	sts.l	pr,@-r15
	jsr	@r10
	extu.w	r4,r0
	cmp/pz	r11
	bt	.L060383A8
	bra	.L0603832E
	neg	r11,r11
.L060383A4:
	.long math_sincos
.L060383A8:
	bra	.L0603832E
	neg	r10,r10
	endlabel func_06038396

	glabel func_060383AC
	mov	#-128,r0
	mov.l	@(44,r2),r3
	extu.b	r0,r0
	extu.b	r4,r4
	shar	r3
	cmp/ge	r0,r4
	bt/s	.L060383BE
	mov	r3,r0
	neg	r0,r0
.L060383BE:
	mov	r0,r4
	mov.w	@(18,r2),r0
	cmp/eq	#0,r0
	bt	.L060383C8
	mov.l	r4,@(40,r2)
.L060383C8:
	rts
	mov.l	r3,@(36,r2)
	endlabel func_060383AC

	glabel func_060383CC
	mov.b	@(14,r2),r0
	extu.b	r4,r4
	tst	#1,r0
	bt	.L060383DA
	mov	#-2,r0
	shll16	r0
	mov.l	r0,@(40,r2)
.L060383DA:
	mov	#1,r0
	shll8	r4
	shll16	r0
	mov.l	@(44,r2),r3
	sub	r4,r0
	dmuls.l	r3,r0
	sts	macl,r0
	sts	mach,r3
	xtrct	r3,r0
	rts
	mov.l	r3,@(36,r2)
	endlabel func_060383CC

	glabel func_060383F0
	extu.b	r4,r0
	tst	#64,r0
	bt	.L06038318
	tst	#128,r0
	bt	.L06038418
	mov	#-64,r0
	extu.b	r0,r0
	sub	r0,r4
	mov.l	.L06038414,r10
	shll8	r4
	endlabel func_060383F0

	glabel func_06038404
	sts.l	pr,@-r15
	shll2	r4
	jsr	@r10
	mov	r4,r0
	cmp/pl	r10
	bf	.L0603832E
	bra	.L0603832E
	neg	r10,r10
.L06038414:
	.long math_sincos
.L06038418:
	mov	#64,r0
	sub	r0,r4
	neg	r4,r4
	mov.l	.L06038434,r10
	shll8	r4
	endlabel func_06038404

	glabel func_06038422
	sts.l	pr,@-r15
	shll2	r4
	jsr	@r10
	mov	r4,r0
	cmp/pz	r10
	bt	.L06038430
	neg	r10,r10
.L06038430:
	bra	.L0603832E
	nop
.L06038434:
	.long math_sincos
	endlabel func_06038422

	glabel func_06038438
	mov.w	@(18,r2),r0
	sts.l	pr,@-r15
	cmp/eq	#0,r0
	bf	.L06038444
.L06038440:
	bra	.L06038256
	nop
.L06038444:
	mov.l	r2,@-r15
	mov.l	@(544,gbr),r0
	mov.l	@(56,r2),r3
	jsr	@r0
	mov.l	@(48,r2),r2
	mov	#16,r3
	mov.l	@r15+,r2
	add	#68,r3
	mov.l	@(52,r2),r4
	shll16	r3
	sub	r3,r5
	cmp/ge	r5,r4
	bf	.L06038440
	mov	#-1,r3
	shll16	r3
	add	r3,r4
	bra	.L06038256
	mov.l	r4,@(52,r2)
	endlabel func_06038438

	glabel func_06038468
	mov.l	@(40,r2),r3
	mov.l	@(36,r2),r5
	neg	r3,r3
	neg	r5,r5
	shar	r3
	shar	r5
	mov.l	r3,@(40,r2)
	mov.l	r5,@(36,r2)
	mov.b	@(14,r2),r0
	mov	#-3,r3
	and	r0,r3
	mov.b	@(13,r2),r0
	and	#2,r0
	or	#192,r0
	or	r3,r0
	mov.b	r0,@(14,r2)
	tst	#2,r0
	bt	.L06038496
	mov.b	@(13,r2),r0
	and	#192,r0
	exts.b	r0,r0
	cmp/eq	#-128,r0
	bf	.L060384FA
.L06038496:
	mov.l	.L060384CC,r0
	sts.l	pr,@-r15
	jsr	@r0
	nop
	mov.l	r2,@-r15
	mov.l	.L060384D0,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bt	.L060384D8
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#18,r6
	mov.l	.L060384D4,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	bra	.L060384F6
	nop
.L060384CC:
	.long func_0603697C
.L060384D0:
	.long func_06018D60
.L060384D4:
	.long snd_seq_start
.L060384D8:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#19,r6
	mov.l	.L06038500,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L060384F6:
	mov.l	@r15+,r2
	lds.l	@r15+,pr
.L060384FA:
	rts
	nop
	.byte 0x00, 0x00
.L06038500:
	.long snd_seq_start
	endlabel func_06038468

	glabel func_06038504
	mov.b	@(15,r2),r0
	tst	#128,r0
	bf	.L06038518
	mov.b	@(13,r2),r0
	tst	#8,r0
	bt	.L06038522
	tst	#128,r0
	bt	.L0603851E
	bra	.L06038522
	nop
.L06038518:
	mov.b	@(13,r2),r0
	tst	#8,r0
	bt	.L06038522
.L0603851E:
	rts
	mov	#1,r0
.L06038522:
	rts
	mov	#0,r0
	endlabel func_06038504

	glabel func_06038526
	cmp/pl	r3
	bf/s	.L06038540
	mov.l	@(36,r2),r5
	mov.w	.L0603853C,r0
	shll8	r0
	cmp/ge	r5,r0
	bt	.L0603854E
	mov.w	.L0603853E,r0
	shll8	r0
	bra	.L0603854E
	add	r5,r0
.L0603853C:
	.short 0xFD40
.L0603853E:
	.short 0xFFC0
.L06038540:
	mov.w	.L0603856C,r0
	shll8	r0
	cmp/ge	r0,r5
	bt	.L0603854E
	mov.w	.L0603856E,r0
	shll8	r0
	add	r5,r0
.L0603854E:
	mov.l	r0,@(36,r2)
	mov.w	@(18,r2),r0
	cmp/eq	#0,r0
	bt/s	.L0603857C
	mov.l	@(40,r2),r0
	mov	#16,r8
	shll8	r8
	cmp/pl	r4
	bt	.L06038570
	mov	#1,r9
	shll16	r9
	cmp/ge	r9,r0
	bt	.L0603857C
	bra	.L0603857A
	add	r8,r0
.L0603856C:
	.short 0x02C0
.L0603856E:
	.short 0x0040
.L06038570:
	mov	#-1,r9
	shll16	r9
	cmp/ge	r0,r9
	bt	.L0603857C
	sub	r8,r0
.L0603857A:
	mov.l	r0,@(40,r2)
.L0603857C:
	rts
	nop
	.byte 0x84, 0x2E, 0xC9, 0xBF, 0x00, 0x0B, 0x80, 0x2E
	endlabel func_06038526

	glabel func_06038588
	mov	#67,r0
	mov.b	@(r0,r2),r0
	shll16	r8
	and	#240,r0
	swap.b	r0,r9
	shll2	r9
	shll	r9
	mov	#64,r7
	shll8	r7
	mov	#0,r5
	mov.l	@(36,r2),r6
	cmp/ge	r8,r3
	bt/s	.L060385D4
	neg	r8,r8
	cmp/ge	r3,r8
	bt	.L060385DC
	mov	#1,r5
.L060385AA:
	mov.w	@(18,r2),r0
	mov.l	r6,@(36,r2)
	cmp/eq	#0,r0
	bt/s	.L060385CE
	mov.l	@(40,r2),r6
	mov	#1,r9
	shll16	r9
	mov	#16,r7
	shll8	r7
	neg	r8,r8
	cmp/ge	r8,r4
	bt	.L060385E6
	neg	r8,r8
	cmp/ge	r4,r8
	bt	.L060385EE
	mov	#2,r0
	or	r0,r5
.L060385CC:
	mov.l	r6,@(40,r2)
.L060385CE:
	mov	#3,r0
	rts
	cmp/eq	r0,r5
.L060385D4:
	cmp/ge	r9,r6
	bt	.L060385AA
	bra	.L060385AA
	add	r7,r6
.L060385DC:
	neg	r9,r9
	cmp/ge	r6,r9
	bt	.L060385AA
	bra	.L060385AA
	sub	r7,r6
.L060385E6:
	cmp/ge	r9,r6
	bt	.L060385CC
	bra	.L060385CC
	add	r7,r6
.L060385EE:
	neg	r9,r9
	cmp/ge	r6,r9
	bt	.L060385CC
	bra	.L060385CC
	sub	r7,r6
	endlabel func_06038588

	glabel func_060385F8
	mov	#-8,r3
	endlabel func_060385F8

	glabel func_060385FA
	mov.l	@(36,r2),r0
	shll8	r3
	dmuls.l	r3,r0
	sts	macl,r5
	sts	mach,r3
	xtrct	r3,r5
	add	r5,r0
	bra	func_0603863C
	mov.l	r0,@(36,r2)
	endlabel func_060385FA

	glabel func_0603860C
	mov.l	@r2,r0
	cmp/eq	#0,r0
	bt	.L06038632
	mov	#65,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#16,r0
	bt	.L0603862A
	mov	#0,r3
	mov.b	@(14,r2),r0
	mov.l	r3,@(36,r2)
	mov.l	r3,@(44,r2)
	or	#64,r0
	mov.l	r3,@(40,r2)
	rts
	mov.b	r0,@(14,r2)
.L0603862A:
	mov.b	@(14,r1),r0
	mov	#8,r3
	cmp/eq	r3,r0
	bf	.L06038638
.L06038632:
	mov.b	@(14,r2),r0
	and	#191,r0
	mov.b	r0,@(14,r2)
.L06038638:
	rts
	nop
	endlabel func_0603860C

	glabel func_0603863C
	mov.w	@(18,r2),r0
	cmp/eq	#0,r0
	mov.l	@(40,r2),r3
	bt	.L0603864C
	cmp/pz	r3
	bt	.L0603864C
	mov.w	.L06038650,r5
	add	r5,r3
.L0603864C:
	rts
	mov.l	r3,@(40,r2)
.L06038650:
	.short 0x2000
	endlabel func_0603863C

	glabel func_06038652
	mov.l	@r2,r0
	cmp/eq	#0,r0
	bt	.L06038662
	mov	#0,r0
	mov.w	r0,@(26,r1)
	mov.b	@(13,r2),r0
	tst	#8,r0
	bf	.L06038676
.L06038662:
	mov.b	@(14,r2),r0
	mov	#3,r3
	or	#64,r0
	shll16	r3
	mov.b	r0,@(14,r2)
	tst	#2,r0
	bf	.L06038672
	neg	r3,r3
.L06038672:
	bra	.L06038042
	mov.l	r3,@(36,r2)
.L06038676:
	mov.l	@(36,r2),r3
	mov	#62,r5
	mov.l	@(40,r2),r4
	neg	r3,r3
	mov	#64,r0
	mov.b	r5,@(r0,r2)
	neg	r4,r4
	mov.l	r3,@(36,r2)
	mov.l	r4,@(40,r2)
	dlabel lbl_06038688
	mov.b	@(14,r2),r0
	or	#192,r0
	mov.b	r0,@(14,r2)
	mov	#1,r4
	mov.l	@(36,r2),r0
	shll16	r4
	cmp/gt	r4,r0
	bt	func_060385F8
	neg	r4,r4
	cmp/ge	r4,r0
	bf	func_060385F8
	mov.b	@(14,r2),r0
	and	#63,r0
	bra	func_060385F8
	mov.b	r0,@(14,r2)
	endlabel func_06038652

	glabel func_060386A6
	mov	#0,r0
	mov.w	r0,@(26,r1)
	mov.b	@(14,r2),r0
	tst	#1,r0
	bf	.L060386C8
	mov.w	.L060386C4,r3
	mov.l	@(40,r2),r0
	shll8	r3
	cmp/ge	r3,r0
	bt	.L060386C0
	mov.w	.L060386C6,r3
	add	r3,r0
	mov.l	r0,@(40,r2)
.L060386C0:
	rts
	nop
.L060386C4:
	.short 0x0200
.L060386C6:
	.short 0x2000
.L060386C8:
	bra	func_06038124
	nop
	endlabel func_060386A6

	glabel func_060386CC
	mov	#0,r0
	mov.w	r0,@(26,r1)
	mov.l	@(44,r2),r0
	mov	#1,r3
	shll16	r3
	cmp/gt	r3,r0
	bf	.L060386DC
	mov	r3,r0
.L060386DC:
	neg	r3,r3
	cmp/gt	r0,r3
	bf	.L060386E4
	mov	r3,r0
.L060386E4:
	cmp/pl	r0
	bt	.L060386FC
	cmp/eq	#0,r0
	bt	.L060386F6
.L060386EC:
	mov.b	@(14,r2),r0
	and	#253,r0
	mov.b	r0,@(14,r2)
	bra	.L06038704
	mov	#-1,r3
.L060386F6:
	mov.b	@(14,r2),r0
	tst	#2,r0
	bt	.L060386EC
.L060386FC:
	mov.b	@(14,r2),r0
	or	#2,r0
	mov.b	r0,@(14,r2)
	mov	#1,r3
.L06038704:
	shll16	r3
	mov.l	r3,@(44,r2)
	bra	.L06038042
	mov.l	r3,@(36,r2)
	dlabel D_0603870C
	.byte 0xA8, 0x03, 0x00, 0x09
	endlabel func_060386CC

	glabel func_06038710
	mov.b	@(14,r2),r0
	mov.l	@(28,r2),r3
	or	#192,r0
	mov.b	r0,@(14,r2)
	mov.l	@(36,r2),r0
	cmp/eq	#0,r0
	bf	.L06038726
	mov	#64,r0
	mov.b	@(r0,r3),r0
	cmp/eq	#38,r0
	bt	.L0603873E
.L06038726:
	mov	#1,r5
	mov.l	@(36,r2),r0
	shll16	r5
	cmp/gt	r5,r0
	bt	.L06038742
	neg	r5,r5
	cmp/ge	r5,r0
	bf	.L06038742
	mov.b	@(14,r2),r0
	and	#63,r0
	bra	func_060385F8
	mov.b	r0,@(14,r2)
.L0603873E:
	rts
	nop
.L06038742:
	bra	func_060385F8
	nop
	endlabel func_06038710

	glabel func_06038746
	mov.b	@(14,r2),r0
	mov	#3,r3
	tst	#2,r0
	shll16	r3
	bf	.L06038752
	neg	r3,r3
.L06038752:
	bra	func_0603863C
	mov.l	r3,@(36,r2)
	endlabel func_06038746

	glabel func_06038756
	sts.l	pr,@-r15
	mov.l	@(32,r2),r3
	mov	#64,r0
	mov.b	@(r0,r3),r0
	cmp/eq	#69,r0
	bt	.L06038786
	mov.b	@(14,r2),r0
	lds.l	@r15+,pr
	and	#191,r0
	rts
	mov.b	r0,@(14,r2)
	endlabel func_06038756

	glabel func_0603876C
	sts.l	pr,@-r15
	mov.l	@(32,r2),r3
	mov	#64,r0
	mov.b	@(r0,r3),r0
	cmp/eq	#75,r0
	bt	.L06038786
	cmp/eq	#74,r0
	bt	.L06038786
	mov.b	@(14,r2),r0
	lds.l	@r15+,pr
	and	#191,r0
	rts
	mov.b	r0,@(14,r2)
.L06038786:
	mov.l	@(60,r2),r4
	mov.l	@(60,r3),r5
	mov.b	@(14,r2),r0
	cmp/ge	r5,r4
	bt	.L06038794
	bra	.L06038796
	or	#2,r0
.L06038794:
	and	#253,r0
.L06038796:
	or	#64,r0
	mov.b	r0,@(14,r2)
	sub	r4,r5
	mov.l	@(52,r3),r4
	mov.l	@(52,r2),r6
	mov	#32,r8
	mov	r5,r3
	bsr	func_06038588
	sub	r6,r4
	bsr	func_06038504
	nop
	cmp/eq	#0,r0
	bt	.L060387B6
	mov.b	@(14,r2),r0
	and	#191,r0
	mov.b	r0,@(14,r2)
.L060387B6:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_0603876C

	glabel func_060387BC
	mov.l	@(32,r2),r3
	mov.l	@(60,r2),r4
	mov.l	@(60,r3),r5
	mov.b	@(14,r2),r0
	cmp/ge	r5,r4
	bt	.L060387D0
	tst	#2,r0
	bt	.L060387F8
	bra	.L060387D4
	nop
.L060387D0:
	tst	#2,r0
	bf	.L060387F8
.L060387D4:
	sub	r4,r5
	mov.l	@(52,r3),r4
	mov.l	@(52,r2),r6
	mov	#64,r8
	sts.l	pr,@-r15
	mov	r5,r3
	bsr	func_06038588
	sub	r6,r4
	lds.l	@r15+,pr
	bt	.L060387F4
	mov	#0,r3
	mov.l	r3,@(36,r2)
	mov.w	@(18,r2),r0
	cmp/eq	#0,r0
	bt	.L060387F4
	mov.l	r3,@(40,r2)
.L060387F4:
	rts
	nop
.L060387F8:
	bra	func_06038124
	nop
	endlabel func_060387BC

	glabel func_060387FC
	mov.b	@(14,r2),r0
	sts.l	pr,@-r15
	or	#64,r0
	mov.b	r0,@(14,r2)
	mov.b	@(13,r2),r0
	tst	#4,r0
	bt/s	.L06038880
	mov.l	@(32,r2),r3
	mov	#64,r0
	mov.b	@(r0,r3),r0
	cmp/eq	#-1,r0
	bt	.L06038836
	cmp/eq	#6,r0
	bf	.L06038842
	mov	#66,r0
	mov.b	@(r0,r2),r0
	mov	#7,r4
	mov	#112,r5
	and	r0,r4
	and	r0,r5
	mov	#3,r6
	add	#2,r4
	cmp/gt	r6,r4
	bf	.L0603882E
	mov	r6,r4
.L0603882E:
	or	r4,r5
	mov	#66,r0
	bra	.L06038874
	mov.b	r5,@(r0,r2)
.L06038836:
	mov.l	@r2,r0
	cmp/pl	r0
	bf	.L06038842
	mov	#1,r4
	mov	#66,r0
	mov.b	r4,@(r0,r2)
.L06038842:
	mov	#65,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#27,r0
	bt	.L06038862
	mov.l	@(60,r2),r0
	mov.l	@(60,r3),r4
	sub	r0,r4
	mov	#67,r0
	mov.b	@(r0,r2),r0
	and	#240,r0
	cmp/pz	r4
	swap.b	r0,r4
	bt/s	.L06038860
	shll2	r4
	neg	r4,r4
.L06038860:
	mov.l	r4,@(44,r2)
.L06038862:
	mov.l	@(52,r2),r0
	mov.l	@(52,r3),r4
	sub	r0,r4
	bsr	func_06038526
	mov.l	@(44,r2),r3
	bsr	func_06038504
	nop
	cmp/eq	#0,r0
	bt	.L0603887A
.L06038874:
	mov.b	@(14,r2),r0
	and	#191,r0
	mov.b	r0,@(14,r2)
.L0603887A:
	lds.l	@r15+,pr
	rts
	nop
.L06038880:
	mov.l	@(60,r2),r0
	mov.l	@(60,r3),r4
	sub	r0,r4
	dmuls.l	r4,r4
	mov.l	.L06038898,r0
	sts	mach,r4
	cmp/ge	r0,r4
	bt	.L06038874
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06038898:
	.long 0x00014400
	endlabel func_060387FC

	glabel func_0603889C
	mov.b	@(14,r2),r0
	sts.l	pr,@-r15
	or	#64,r0
	mov.b	r0,@(14,r2)
	mov.l	.L060388E0,r10
	mov.l	.L060388E4,r3
	mov.l	r2,@-r15
	jsr	@r10
	mov.l	@r3,r2
	mov	r0,r3
	mov.l	@(52,r2),r4
	mov.l	@r15+,r2
	mov.l	@(52,r2),r0
	bsr	func_06038526
	sub	r0,r4
	bsr	func_06038504
	mov.l	r3,@-r15
	cmp/eq	#0,r0
	mov.l	@r15+,r3
	bf	.L060388D2
	mov.w	.L060388DE,r8
	shll16	r8
	cmp/ge	r8,r3
	bt	.L060388D2
	neg	r8,r8
	cmp/gt	r3,r8
	bf	.L060388D8
.L060388D2:
	mov.b	@(14,r2),r0
	and	#191,r0
	mov.b	r0,@(14,r2)
.L060388D8:
	lds.l	@r15+,pr
	rts
	nop
.L060388DE:
	.short 0x0120
.L060388E0:
	.long func_06018D64
.L060388E4:
	.long player_obj
	endlabel func_0603889C

	glabel func_060388E8
	mov.l	@(28,r2),r3
	mov.b	@(14,r3),r0
	tst	#64,r0
	bf	.L0603890E
	mov	#39,r4
	mov	#65,r0
	mov.b	r4,@(r0,r3)
	mov.b	@(14,r3),r0
	or	#64,r0
	mov.b	r0,@(14,r3)
	mov.l	@r3,r4
	mov	#0,r0
	mov.l	r0,@(36,r3)
	mov.l	r0,@(40,r3)
	cmp/pl	r4
	bf/s	.L0603890E
	mov.l	r0,@(44,r3)
	mov.b	r0,@(15,r4)
	mov.b	r0,@(14,r4)
.L0603890E:
	mov.b	@r2,r0
	cmp/eq	#0,r0
	bt	.L06038984
	mov	#13,r5
	mov.b	@(14,r1),r0
	cmp/gt	r5,r0
	bt	.L0603898C
	cmp/eq	r5,r0
	bf	.L0603892C
	mov	#2,r5
	mov.b	@(15,r1),r0
	cmp/eq	r5,r0
	bt	.L0603896C
	cmp/gt	r5,r0
	bt	.L06038964
.L0603892C:
	mov	#65,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#38,r0
	bt	.L06038940
	mov	#0,r0
	mov.b	r0,@(14,r1)
	mov.w	r0,@(26,r1)
	mov.b	@(14,r2),r0
	or	#192,r0
	mov.b	r0,@(14,r2)
.L06038940:
	mov.b	@(14,r1),r0
	mov.l	.L06038968,r5
	shll	r0
	add	r0,r5
	mov.b	@r5+,r4
	mov.b	@(14,r2),r0
	shll16	r4
	tst	#2,r0
	bf	.L06038954
	neg	r4,r4
.L06038954:
	mov.l	@(60,r2),r0
	add	r0,r4
	mov.l	r4,@(60,r3)
	mov.l	@(52,r2),r0
	mov.b	@r5,r4
	shll16	r4
	add	r0,r4
	mov.l	r4,@(52,r3)
.L06038964:
	rts
	nop
.L06038968:
	.long D_0603899A
.L0603896C:
	mov	#64,r0
	mov.b	@(r0,r3),r0
	cmp/eq	#6,r0
	bt	.L06038964
	mov	#6,r4
	mov.b	@(14,r2),r0
	shll16	r4
	tst	#2,r0
	bf	.L06038980
	neg	r4,r4
.L06038980:
	rts
	mov.l	r4,@(36,r3)
.L06038984:
	mov.b	@(14,r2),r0
	and	#63,r0
	bra	.L0603896C
	mov.b	r0,@(14,r2)
.L0603898C:
	mov	#18,r5
	cmp/ge	r5,r0
	bf	.L06038964
	mov.b	@(14,r2),r0
	and	#63,r0
	rts
	mov.b	r0,@(14,r2)
	dlabel D_0603899A
	.byte 0x10, 0x00
	endlabel func_060388E8

	.section .data.0603899C,"aw",@progbits
	.p2align 2
	.byte 0x0F, 0xFA, 0x0A, 0xF6, 0x04, 0xEC, 0x00, 0xEA, 0xFC, 0xEB, 0xF8, 0xEE, 0xF6, 0xF4, 0xF8, 0xF7
	.byte 0xF9, 0xF3, 0xFD, 0xEB, 0x04, 0xED, 0x06, 0xF1
