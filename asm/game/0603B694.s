	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603B694,"ax",@progbits
	.p2align 2

	glabel func_0603B694
	sts.l	pr,@-r15
	mov.b	@(12,r1),r0
	mov.l	.L0603B6B8,r3
	extu.b	r0,r0
	mov.b	@(r0,r3),r0
	mov.l	.L0603B6BC,r3
	extu.b	r0,r0
	shll	r0
	mov.l	.L0603B6C0,r7
	mov.w	@(r0,r3),r2
	jsr	@r7
	add	r3,r2
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603B6C4
	lds.l	@r15+,pr
	rts
	nop
.L0603B6B8:
	.long D_060398BA
.L0603B6BC:
	.long D_06039A2E
.L0603B6C0:
	.long func_0601EF98
.L0603B6C4:
	mov.l	.L0603B6E4,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	.L0603B6E8,r0
	mov.l	@(52,r1),r5
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.w	.L0603B6E0,r0
	bsr	func_0603B6F0
	mov.w	r0,@(100,gbr)
	mov.l	.L0603B6EC,r0
	jmp	@r0
	lds.l	@r15+,pr
.L0603B6E0:
	.short 0x0100
	.byte 0x00, 0x00
.L0603B6E4:
	.long func_0600CA24
.L0603B6E8:
	.long func_0600CBDA
.L0603B6EC:
	.long func_0600CA4E
	endlabel func_0603B694

	glabel func_0603B6F0
	sts.l	pr,@-r15
	mov.l	.L0603B720,r2
	mov.l	@(120,gbr),r0
	jsr	@r2
	mov	r0,r3
	mov	#30,r0
	mov.b	@(r0,r1),r2
	mov.w	@(20,r1),r0
	mov.l	@(44,r1),r4
	shll	r0
	mov.w	@(r0,r4),r0
	mov.l	r1,@-r15
	extu.w	r0,r0
	add	r0,r4
	mov	r4,r5
	mov.l	@(8,r1),r1
.L0603B710:
	mov.w	@r5,r0
	cmp/pz	r0
	bf	.L0603B724
	mov.b	@(8,r5),r0
	cmp/eq	#0,r0
	bt	.L0603B726
	bra	.L0603B710
	add	#10,r5
.L0603B720:
	.long func_060370BA
.L0603B724:
	add	#-10,r5
.L0603B726:
	mov.b	@(9,r5),r0
	mov.l	.L0603B740,r7
	shll2	r0
	add	r0,r1
.L0603B72E:
	mov.w	@r4,r0
	cmp/pz	r0
	bt	.L0603B744
	mov.l	@r15+,r1
	mov	r3,r0
	lds.l	@r15+,pr
	rts
	mov.l	r0,@(92,gbr)
	.byte 0x00, 0x00
.L0603B740:
	.long D_060672F0
.L0603B744:
	mov.b	@(1,r4),r0
	mov.l	.L0603B830,r5
	extu.b	r0,r0
	shll	r0
	mov.b	@(r0,r5),r6
	mov.b	@(8,r4),r0
	mov	r0,r13
	cmp/eq	#9,r0
	bf	.L0603B758
	mov	#0,r13
.L0603B758:
	mov	#20,r11
	mov.l	r1,@-r15
	muls.w	r11,r13
	mov.l	.L0603B834,r0
	sts	macl,r13
	mov.l	@r0,r8
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
	mov.l	.L0603B838,r0
	add	#12,r3
	mov.l	@r0,r0
	mov.w	r13,@-r3
	add	r0,r12
	mov.l	.L0603B83C,r0
	mov.w	r12,@-r3
	mov.l	@r0,r0
	shll2	r11
	add	r0,r11
	mov.w	r11,@-r3
	add	#-6,r3
	mov.l	@(760,gbr),r0
	mov.w	.L0603B82C,r12
	mov	r0,r5
	mov.w	r12,@r3
	mov.l	@(764,gbr),r0
	mov.l	.L0603B840,r10
	mov	r0,r6
	mov	#0,r0
	or	#136,r0
	mov.w	r0,@(4,r3)
	mov	#4,r8
	mov.w	@(6,r4),r0
	jsr	@r10
	neg	r0,r0
	shll2	r10
	shll2	r11
	add	#12,r3
.L0603B7B2:
	mov.b	@r7+,r0
	mov.w	@(r0,r9),r12
	mov.b	@r7+,r0
	mov.w	@(r0,r9),r13
	mov.b	@r4,r0
	shll16	r12
	tst	#16,r0
	bt/s	.L0603B7C6
	shll16	r13
	neg	r12,r12
.L0603B7C6:
	dmuls.l	r10,r12
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
	add	r14,r12
	mov.w	@(2,r4),r0
	add	r0,r12
	mov.w	@(2,r1),r0
	add	r0,r13
	mov.w	@(4,r4),r0
	add	r0,r13
	mov	#64,r14
	tst	r2,r14
	bt	.L0603B7F2
	neg	r12,r12
.L0603B7F2:
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
	bf/s	.L0603B7B2
	add	#2,r3
	add	#-8,r7
	add	#-28,r3
	mov.l	.L0603B844,r14
	mov.l	@(768,gbr),r0
	jsr	@r14
	mov	r0,r6
	mov.l	.L0603B848,r14
	mov.l	@r15+,r1
	jsr	@r14
	add	#10,r4
	bra	.L0603B72E
	add	#32,r3
.L0603B82C:
	.short 0x1002
	.byte 0x00, 0x00
.L0603B830:
	.long D_06039360
.L0603B834:
	.long D_06039584
.L0603B838:
	.long D_060CFFD8
.L0603B83C:
	.long D_060CFFEC
.L0603B840:
	.long func_06007BD8
.L0603B844:
	.long func_06036EE0
.L0603B848:
	.long func_0601F1EC
	endlabel func_0603B6F0

	glabel func_0603B84C
	mov.l	.L0603B888,r3
	mov	#0,r0
	mov.l	r0,@r3
	mov.l	.L0603B88C,r2
	mov	r2,r4
	mov	#0,r10
	mov	#0,r11
	mov	#0,r12
	mov.w	.L0603B884,r13
.L0603B85E:
	mov.l	@r2,r3
	cmp/pz	r3
	bf	.L0603B880
	mov	#64,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#6,r0
	bt	.L0603B880
	cmp/eq	#21,r0
	bt	.L0603B880
	cmp/eq	#17,r0
	bt	.L0603B880
	mov.b	@(15,r2),r0
	and	#192,r0
	mov.w	.L0603B886,r3
	cmp/eq	r3,r0
	bf	.L0603B890
	add	#1,r12
.L0603B880:
	bra	.L0603B9E2
	nop
.L0603B884:
	.short 0x007F
.L0603B886:
	.short 0x0080
.L0603B888:
	.long D_060CFFD4
.L0603B88C:
	.long D_060CC000
.L0603B890:
	mov.b	@(15,r2),r0
	and	#48,r0
	cmp/eq	#0,r0
	bt	.L0603B8A2
	add	#1,r10
	mov	#0,r3
	mov	#64,r0
	bra	.L0603B8A2
	mov.b	r3,@(r0,r2)
.L0603B8A2:
	mov	#12,r0
	mov.b	@(r0,r2),r5
	mov	#64,r0
	mov.b	@(r0,r2),r3
	mov	#0,r0
	mov.b	r3,@(r0,r4)
	mov	#66,r0
	mov.b	@(r0,r2),r3
	mov	#1,r0
	mov.b	r3,@(r0,r4)
	mov	#67,r0
	mov.b	@(r0,r2),r3
	mov	#2,r0
	mov.b	r3,@(r0,r4)
	mov	#68,r0
	mov.b	@(r0,r2),r3
	mov	#3,r0
	mov.b	r3,@(r0,r4)
	mov	#69,r0
	mov.b	@(r0,r2),r3
	mov	#4,r0
	mov.b	r3,@(r0,r4)
	mov	#70,r0
	mov.b	@(r0,r2),r3
	mov	#5,r0
	mov.b	r3,@(r0,r4)
	mov	#71,r0
	mov.b	@(r0,r2),r3
	mov	#6,r0
	mov.b	r3,@(r0,r4)
	mov	#72,r0
	mov.b	@(r0,r2),r3
	mov	#7,r0
	mov.b	r3,@(r0,r4)
	mov	#15,r0
	mov.b	@(r0,r2),r3
	mov	#8,r0
	mov.b	r3,@(r0,r4)
	mov	#14,r0
	mov.b	@(r0,r2),r3
	mov	#9,r0
	mov.b	r3,@(r0,r4)
	mov	#96,r0
	mov.b	@(r0,r2),r3
	mov	#10,r0
	mov.b	r3,@(r0,r4)
	mov	#97,r0
	mov.b	@(r0,r2),r3
	mov	#11,r0
	mov.b	r3,@(r0,r4)
	mov	#98,r0
	mov.b	@(r0,r2),r3
	mov	#12,r0
	mov.b	r3,@(r0,r4)
	mov	#99,r0
	mov.b	@(r0,r2),r3
	mov	#13,r0
	mov.b	r3,@(r0,r4)
	mov	#100,r0
	mov.b	@(r0,r2),r3
	mov	#14,r0
	mov.b	r3,@(r0,r4)
	mov	#101,r0
	mov.b	@(r0,r2),r3
	mov	#15,r0
	mov.b	r3,@(r0,r4)
	mov	#102,r0
	mov.b	@(r0,r2),r3
	mov	#16,r0
	mov.b	r3,@(r0,r4)
	mov	#103,r0
	mov.b	@(r0,r2),r3
	mov	#17,r0
	mov.b	r3,@(r0,r4)
	mov	#104,r0
	mov.b	@(r0,r2),r3
	mov	#18,r0
	mov.b	r3,@(r0,r4)
	mov	#105,r0
	mov.b	@(r0,r2),r3
	mov	#19,r0
	mov.b	r3,@(r0,r4)
	mov	#106,r0
	mov.b	@(r0,r2),r3
	mov	#20,r0
	mov.b	r3,@(r0,r4)
	mov	#107,r0
	mov.b	@(r0,r2),r3
	mov	#21,r0
	mov.b	r3,@(r0,r4)
	mov	#120,r0
	mov.l	@(r0,r2),r3
	shlr8	r3
	mov	#22,r0
	mov.b	r3,@(r0,r4)
	mov	#23,r0
	mov.b	r5,@(r0,r4)
	mov	#48,r0
	mov.w	@(r0,r2),r3
	mov	#24,r0
	mov.w	r3,@(r0,r4)
	mov	#52,r0
	mov.w	@(r0,r2),r3
	mov	#26,r0
	mov.w	r3,@(r0,r4)
	mov	#56,r0
	mov.w	@(r0,r2),r3
	mov	#28,r0
	mov.w	r3,@(r0,r4)
	mov	#60,r0
	mov.w	@(r0,r2),r3
	mov	#30,r0
	mov.w	r3,@(r0,r4)
	mov	#8,r0
	mov.b	@(r0,r4),r0
	mov	#3,r3
	and	r0,r3
	add	#1,r3
	mov	#4,r5
	cmp/ge	r5,r3
	bf	.L0603B996
	mov	#3,r3
.L0603B996:
	mov	#-4,r5
	and	r5,r0
	or	r0,r3
	mov	#8,r0
	mov.b	r3,@(r0,r4)
	mov	r3,r0
	and	#48,r0
	cmp/eq	#16,r0
	bf	.L0603B9C8
	add	#1,r11
	mov	r11,r0
	cmp/eq	#1,r0
	bt	.L0603B9B8
	cmp/eq	#3,r0
	bt	.L0603B9F4
	bra	.L0603B9C8
	mov	#2,r11
.L0603B9B8:
	mov.b	@(8,r4),r0
	and	#207,r0
	or	#48,r0
	mov.b	r0,@(8,r4)
	mov	#-64,r0
	mov.b	r0,@(9,r4)
	mov	#25,r0
	mov.b	r0,@(0,r4)
.L0603B9C8:
	mov	#8,r0
	mov.b	@(r0,r4),r0
	and	#48,r0
	cmp/eq	#0,r0
	bt	.L0603B9E0
	mov.b	@(1,r4),r0
	mov.l	.L0603B9F0,r3
	and	#3,r0
	add	r0,r3
	mov.b	@r3,r0
	add	#1,r0
	mov.b	r0,@r3
.L0603B9E0:
	add	#32,r4
.L0603B9E2:
	mov.w	.L0603B9EE,r0
	add	r0,r2
.L0603B9E6:
	dt	r13
	bt	.L0603B9FA
	bra	.L0603B85E
	nop
.L0603B9EE:
	.short 0x0080
.L0603B9F0:
	.long D_060CFFD4
.L0603B9F4:
	mov	#0,r11
	bra	.L0603B9E6
	nop
.L0603B9FA:
	cmp/pl	r10
	bt	.L0603BA00
	mov.l	.L0603BA08,r4
.L0603BA00:
	mov	#-1,r0
	rts
	mov.l	r0,@r4
	.byte 0x00, 0x00
.L0603BA08:
	.long D_060CC000
	endlabel func_0603B84C

	glabel func_0603BA0C
	mov.l	.L0603BA58,r4
	mov.w	.L0603BA54,r3
	mov.b	@(22,gbr),r0
	cmp/pz	r0
	bf	.L0603BA50
	mov	#10,r9
	cmp/ge	r0,r9
	bf	.L0603BA50
	shll2	r0
	shll8	r0
	mov.l	.L0603BA5C,r5
	add	r0,r5
	mov.l	.L0603BA60,r9
.L0603BA26:
	mov.l	@r5,r7
	mov.l	r7,@r9
	mov.l	@r4+,r7
	mov.l	r7,@r5
	add	#4,r9
	add	#4,r5
	dt	r3
	bf	.L0603BA26
	mov.b	@(22,gbr),r0
	and	#254,r0
	shll2	r0
	shll	r0
	mov.l	.L0603BA64,r2
	add	r0,r2
	mov.l	.L0603BA68,r4
	mov.w	@r4,r0
	mov.w	r0,@r2
	mov.l	@(4,r4),r0
	mov.l	r0,@(4,r2)
	mov.l	@(8,r4),r0
	mov.l	r0,@(8,r2)
.L0603BA50:
	rts
	nop
.L0603BA54:
	.short 0x0200
	.byte 0x00, 0x00
.L0603BA58:
	.long D_060CC000
.L0603BA5C:
	.long 0x002FC000
.L0603BA60:
	.long D_060CE000
.L0603BA64:
	.long 0x002FF000
.L0603BA68:
	.long D_060CFFA0
	endlabel func_0603BA0C

	.section .data.0603BA6C,"aw",@progbits
	.p2align 2
	.byte 0xD3, 0x04, 0x90, 0x05, 0xD2, 0x04, 0x11, 0x3B, 0x81, 0x1B, 0x21, 0x26, 0x00, 0x0B, 0x71, 0x04
	.byte 0x01, 0x00, 0x00, 0x00
	.long D_06014D12
	.long D_0603BA88
	dlabel D_0603BA88
	.byte 0xC4, 0x3F, 0x20, 0x08, 0x89, 0x01, 0xA0, 0x1F, 0x00, 0x09, 0xD0, 0x07, 0x60, 0x00, 0x88, 0x00
	.byte 0x8B, 0x10, 0xD7, 0x06, 0xE0, 0x04, 0x07, 0x7C, 0xE8, 0x02, 0x37, 0x83, 0x8B, 0x02, 0xD0, 0x04
	.byte 0x21, 0x06, 0x71, 0x04, 0x00, 0x0B, 0x00, 0x09
	.long D_060CFFA2
	.long D_060FFE50
	.long func_0603BAD8
	.byte 0xE0, 0xF8, 0x02, 0x1E, 0xE0, 0x02, 0x80, 0x21, 0xD0, 0x01, 0x40, 0x2B, 0x00, 0x09, 0x00, 0x00
	.long func_0600D1A0
