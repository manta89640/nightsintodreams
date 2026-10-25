	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060204E4,"ax",@progbits
	.p2align 2

	glabel func_060204E4
	nop
	nop
	mov.w	@(24,r1),r0
	bra	.L060204F6
	mov.w	r0,@(102,gbr)
	endlabel func_060204E4

	glabel func_060204EE
	nop
	nop
	mov.w	.L0602055E,r0
	mov.w	r0,@(102,gbr)
.L060204F6:
	sts.l	pr,@-r15
	mov.l	@(92,gbr),r0
	mov	r0,r3
	mov.l	@(60,r1),r7
	mov.w	@(22,r1),r0
	mov.w	r0,@(100,gbr)
	mov.l	@(44,r1),r2
	mov.w	@(20,r1),r0
	add	r0,r0
	mov.w	@(r0,r2),r0
	add	r0,r2
.L0602050C:
	mov.w	@r2,r0
	cmp/pz	r0
	bf	.L06020570
	mov.w	@r2,r0
	cmp/pl	r0
	bf	.L06020570
	mov.l	.L06020564,r9
	add	#-1,r0
	shll2	r0
	shll	r0
	add	r0,r9
	mov.l	@r9,r13
	mov.l	r13,@(8,r3)
	mov.l	@(48,r1),r4
	swap.w	r4,r4
	exts.w	r4,r4
	mov.l	@(52,r1),r5
	swap.w	r5,r5
	exts.w	r5,r5
	mov.b	@(9,r2),r0
	mov.w	.L06020560,r12
	or	r0,r12
	mov.w	r12,@r3
	and	#15,r0
	shll2	r0
	mov.l	.L06020568,r6
	mov.l	@(r0,r6),r6
	jsr	@r6
	nop
	mov.l	@(56,r1),r6
	mov.w	@(6,r2),r0
	bsr	func_06020A7C
	mov.w	r0,@(4,r3)
	mov.w	@(28,r1),r0
	mov.w	r0,@(28,r3)
	mov.l	.L0602056C,r14
	jsr	@r14
	nop
	add	#20,r2
	bra	.L0602050C
	add	#32,r3
.L0602055E:
	.short 0x0100
.L06020560:
	.short 0x1000
	.byte 0x00, 0x00
.L06020564:
	.long D_060EE800
.L06020568:
	.long D_06020630
.L0602056C:
	.long func_0601F1EC
.L06020570:
	lds.l	@r15+,pr
	mov	r3,r0
	rts
	mov.l	r0,@(92,gbr)
	endlabel func_060204EE

	glabel func_06020578
	nop
	nop
	sts.l	pr,@-r15
	mov.l	@(92,gbr),r0
	mov	r0,r3
	mov.l	@(60,r1),r7
	mov.w	@(22,r1),r0
	mov.w	r0,@(100,gbr)
	mov.w	.L06020600,r0
	mov.w	r0,@(102,gbr)
	mov.l	@(44,r1),r2
	mov.w	@(20,r1),r0
	add	r0,r0
	mov.w	@(r0,r2),r0
	add	r0,r2
.L06020596:
	mov.w	@r2,r0
	cmp/pz	r0
	bf	.L06020614
	mov.w	@r2,r0
	cmp/pl	r0
	bf	.L06020614
	mov.l	.L06020608,r9
	add	#-1,r0
	shll2	r0
	shll	r0
	add	r0,r9
	mov.l	@r9,r13
	mov.l	r13,@(8,r3)
	mov.l	@(48,r1),r4
	mov.l	@(352,gbr),r0
	sub	r0,r4
	swap.w	r4,r4
	exts.w	r4,r4
	mov.w	.L06020602,r0
	add	r0,r4
	add	r0,r0
	add	#-1,r0
	and	r0,r4
	add	#1,r0
	shar	r0
	sub	r0,r4
	mov.l	@(52,r1),r5
	mov.l	@(356,gbr),r0
	sub	r0,r5
	swap.w	r5,r5
	exts.w	r5,r5
	mov.b	@(9,r2),r0
	mov.w	lbl_06020604,r12
	or	r0,r12
	mov.w	r12,@r3
	and	#15,r0
	shll2	r0
	mov.l	.L0602060C,r6
	mov.l	@(r0,r6),r6
	jsr	@r6
	nop
	mov.l	@(56,r1),r6
	mov.w	@(6,r2),r0
	bsr	func_06020A7C
	mov.w	r0,@(4,r3)
	mov.w	@(28,r1),r0
	mov.w	r0,@(28,r3)
	mov.l	.L06020610,r14
	jsr	@r14
	nop
	add	#20,r2
	bra	.L06020596
	add	#32,r3
.L06020600:
	.short 0x0100
.L06020602:
	.short 0x0400
	dlabel lbl_06020604
	.short 0x1000
	.byte 0x00, 0x00
.L06020608:
	.long D_060EE800
.L0602060C:
	.long D_0602061C
.L06020610:
	.long func_0601F1EC
.L06020614:
	lds.l	@r15+,pr
	mov	r3,r0
	rts
	mov.l	r0,@(92,gbr)
	dlabel D_0602061C
	.long func_06020644
	.long func_0602083A
	.long .L060207F6
	.long func_060206A8
	.long func_06020832
	dlabel D_06020630
	.long func_06020644
	.long func_06020898
	.long .L060207F6
	.long func_060206A8
	.long func_06020832
	endlabel func_06020578

	glabel func_06020644
	mov.w	@(2,r2),r0
	add	r4,r0
	mov.w	r0,@(12,r3)
	mov.w	@(4,r2),r0
	add	r5,r0
	rts
	mov.w	r0,@(14,r3)
	.byte 0x60, 0xD3, 0xC9, 0xFF, 0x6E, 0x03, 0x4D, 0x19, 0x6D, 0xDC, 0x4D, 0x08, 0x4D, 0x00, 0x85, 0x21
	.byte 0x6B, 0x03, 0x85, 0x22, 0x6C, 0x03, 0x3D, 0xBC, 0x3E, 0xCC, 0xC5, 0x32, 0x2B, 0x0F, 0x0B, 0x1A
	.byte 0x2C, 0x0F, 0x0C, 0x1A, 0x2D, 0x0F, 0x0D, 0x1A, 0x2E, 0x0F, 0x0E, 0x1A, 0x4B, 0x19, 0x6B, 0xBF
	.byte 0x4C, 0x19, 0x6C, 0xCF, 0x4D, 0x19, 0x6D, 0xDF, 0x4E, 0x19, 0x6E, 0xEF, 0x3B, 0x4C, 0x3D, 0x4C
	.byte 0x3C, 0x5C, 0x3E, 0x5C, 0x60, 0xB3, 0x81, 0x36, 0x60, 0xC3, 0x81, 0x37, 0x60, 0xD3, 0x81, 0x3A
	.byte 0x60, 0xE3, 0x00, 0x0B, 0x81, 0x3B
	endlabel func_06020644

	glabel func_060206A8
	mov.w	@r3,r14
	mov.w	.L06020760,r0
	and	r0,r14
	mov	#2,r0
	or	r0,r14
	mov.w	r14,@r3
	mov.w	@(10,r2),r0
	neg	r0,r8
	mov.w	@(26,r1),r0
	neg	r0,r0
	add	#8,r0
	add	#8,r8
	extu.w	r0,r0
	extu.w	r8,r8
	mov.l	.L06020764,r10
	shlr2	r0
	shlr2	r0
	mov.l	.L06020768,r11
	shll	r0
	shlr2	r8
	shlr2	r8
	shll	r8
	mov	r10,r12
	mov	r11,r13
	mov.w	@(r0,r10),r10
	mov.w	@(r0,r11),r11
	mov	r8,r0
	mov.w	@(r0,r12),r12
	mov.w	@(r0,r13),r13
	shll2	r12
	shll2	r13
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#64,r0
	bf	.L06020776
	mov.l	.L0602076C,r6
	add	#12,r3
.L060206F4:
	mov.b	@r6+,r0
	mov.w	@(r0,r2),r8
	tst	r0,r0
	bt	.L06020770
	mov.b	@r6+,r0
	mov.w	@(r0,r2),r14
	shll16	r8
	dlabel lbl_06020702
	shll16	r14
	dmuls.l	r12,r8
	sts	mach,r0
	dmuls.l	r12,r14
	sts	mach,r7
	dmuls.l	r13,r14
	sts	mach,r14
	dmuls.l	r13,r8
	sts	mach,r8
	add	r7,r8
	sub	r0,r14
	mov.w	@(2,r2),r0
	add	r0,r8
	mov.w	@(4,r2),r0
	add	r0,r14
	mov.w	@(100,gbr),r0
	muls.w	r0,r8
	sts	macl,r8
	muls.w	r0,r14
	sts	macl,r14
	shlr8	r8
	exts.w	r8,r8
	shlr8	r14
	exts.w	r14,r14
	muls.w	r10,r8
	sts	macl,r0
	muls.w	r10,r14
	sts	macl,r7
	muls.w	r11,r14
	sts	macl,r14
	muls.w	r11,r8
	sts	macl,r8
	add	r7,r8
	sub	r0,r14
	shll2	r8
	shll2	r14
	swap.w	r8,r8
	exts.w	r8,r8
	swap.w	r14,r14
	exts.w	r14,r14
	add	r4,r8
	add	r5,r14
	mov.w	r8,@r3
	add	#2,r3
	mov.w	r14,@r3
	bra	.L060206F4
	add	#2,r3
.L06020760:
	.short 0xFFF0
	.byte 0x00, 0x00
.L06020764:
	.long D_06007E04
.L06020768:
	.long D_06008604
.L0602076C:
	.long D_060207EC
.L06020770:
	add	#-28,r3
	rts
	nop
.L06020776:
	mov.l	.L060207E8,r6
	add	#12,r3
.L0602077A:
	mov.b	@r6+,r0
	mov.w	@(r0,r2),r8
	tst	r0,r0
	bt	.L06020770
	mov.b	@r6+,r0
	mov.w	@(r0,r2),r14
	shll16	r8
	shll16	r14
	dmuls.l	r12,r8
	sts	mach,r0
	dmuls.l	r12,r14
	sts	mach,r7
	dmuls.l	r13,r14
	sts	mach,r14
	dmuls.l	r13,r8
	sts	mach,r8
	add	r7,r8
	sub	r0,r14
	mov.w	@(2,r2),r0
	add	r0,r8
	mov.w	@(4,r2),r0
	add	r0,r14
	mov.w	@(100,gbr),r0
	muls.w	r0,r8
	sts	macl,r8
	muls.w	r0,r14
	sts	macl,r14
	shlr8	r8
	exts.w	r8,r8
	shlr8	r14
	exts.w	r14,r14
	neg	r8,r8
	muls.w	r10,r8
	sts	macl,r0
	muls.w	r10,r14
	sts	macl,r7
	muls.w	r11,r14
	sts	macl,r14
	muls.w	r11,r8
	sts	macl,r8
	add	r7,r8
	sub	r0,r14
	shll2	r8
	shll2	r14
	swap.w	r8,r8
	exts.w	r8,r8
	swap.w	r14,r14
	exts.w	r14,r14
	add	r4,r8
	add	r5,r14
	mov.w	r8,@r3
	add	#2,r3
	mov.w	r14,@r3
	bra	.L0602077A
	add	#2,r3
.L060207E8:
	.long D_060207EC
	dlabel D_060207EC
	.byte 0x0C, 0x0E, 0x10, 0x0E, 0x10, 0x12, 0x0C, 0x12, 0x00, 0x00
.L060207F6:
	mov.w	@(2,r2),r0
	mov	r0,r13
	mov.w	@(4,r2),r0
	mov	r0,r14
	add	r4,r13
	add	r5,r14
	mov	#4,r10
	mov	#12,r8
	add	r3,r8
.L06020808:
	mov.w	@r7+,r11
	mov.w	@r7+,r12
	mov.w	@r7+,r0
	muls.w	r0,r11
	sts	macl,r11
	muls.w	r0,r12
	sts	macl,r12
	shlr8	r11
	exts.w	r11,r11
	shlr8	r12
	exts.w	r12,r12
	add	r13,r11
	mov.w	r11,@r8
	add	#2,r8
	add	r14,r12
	mov.w	r12,@r8
	add	#2,r8
	dt	r10
	bf	.L06020808
	rts
	nop
	endlabel func_060206A8

	glabel func_06020832
	mov.w	@(2,r2),r0
	mov.w	r0,@(6,r3)
	bra	.L060207F6
	nop
	endlabel func_06020832

	glabel func_0602083A
	mov	r13,r0
	and	#255,r0
	mov	r0,r14
	shlr8	r13
	extu.b	r13,r13
	shll2	r13
	shll	r13
	mov.w	@(2,r2),r0
	mov	r0,r11
	mov.w	@(4,r2),r0
	mov	r0,r12
	add	r11,r13
	add	r12,r14
	mov.w	@(100,gbr),r0
	muls.w	r0,r11
	sts	macl,r11
	muls.w	r0,r13
	sts	macl,r13
	mov	r0,r8
	mov.w	@(102,gbr),r0
	mulu.w	r0,r8
	sts	macl,r0
	dmuls.l	r0,r12
	sts	macl,r12
	dmuls.l	r0,r14
	sts	macl,r14
	shlr8	r11
	exts.w	r11,r11
	shlr8	r13
	exts.w	r13,r13
	swap.w	r12,r12
	exts.w	r12,r12
	swap.w	r14,r14
	exts.w	r14,r14
	add	r4,r11
	add	r4,r13
	add	r5,r12
	add	r5,r14
	mov	r11,r0
	mov.w	r0,@(12,r3)
	mov	r12,r0
	mov.w	r0,@(14,r3)
	mov	r13,r0
	mov.w	r0,@(20,r3)
	mov	r14,r0
	rts
	mov.w	r0,@(22,r3)
	endlabel func_0602083A

	glabel func_06020898
	mov	r13,r0
	and	#255,r0
	mov	r0,r14
	shlr8	r13
	extu.b	r13,r13
	shll2	r13
	shll	r13
	mov.w	@(2,r2),r0
	mov	r0,r11
	mov.w	@(4,r2),r0
	mov	r0,r12
	add	r11,r13
	add	#-1,r13
	add	r12,r14
	add	#-1,r14
	mov.w	@(100,gbr),r0
	muls.w	r0,r11
	sts	macl,r11
	muls.w	r0,r13
	sts	macl,r13
	mov	r0,r8
	mov.w	@(102,gbr),r0
	mulu.w	r0,r8
	sts	macl,r0
	dmuls.l	r0,r12
	sts	macl,r12
	dmuls.l	r0,r14
	sts	macl,r14
	shlr8	r11
	exts.w	r11,r11
	shlr8	r13
	exts.w	r13,r13
	swap.w	r12,r12
	exts.w	r12,r12
	swap.w	r14,r14
	exts.w	r14,r14
	add	r4,r11
	add	r4,r13
	add	r5,r12
	add	r5,r14
	mov	r11,r0
	mov.w	r0,@(12,r3)
	mov	r12,r0
	mov.w	r0,@(14,r3)
	mov	r13,r0
	mov.w	r0,@(20,r3)
	mov	r14,r0
	rts
	mov.w	r0,@(22,r3)
	endlabel func_06020898

	glabel func_060208FA
	nop
	nop
	mov.w	.L06020904,r0
	bra	.L0602090E
	mov.w	r0,@(100,gbr)
.L06020904:
	.short 0x0100
	endlabel func_060208FA

	glabel func_06020906
	nop
	nop
	mov.w	@(22,r1),r0
	mov.w	r0,@(100,gbr)
.L0602090E:
	mov.w	.L06020974,r0
	mov.w	r0,@(102,gbr)
	endlabel func_06020906

	glabel func_06020912
	sts.l	pr,@-r15
	mov.l	@(120,gbr),r0
	mov	r0,r3
	mov.l	@(12,r3),r4
	add	#16,r3
	mov.l	@(12,r3),r5
	add	#16,r3
	mov.l	@(12,r3),r6
	mov.l	@(788,gbr),r0
	cmp/ge	r0,r6
	bt	.L0602095A
	mov	#32,r0
	shll16	r0
	cmp/ge	r0,r6
	bf	.L0602095A
	mov.l	.L06020978,r12
	mov.l	.L06020978,r13
	mov.l	.L0602097C,r0
	dmuls.l	r0,r6
	sts	mach,r0
	add	r0,r0
	add	r12,r0
	cmp/gt	r0,r4
	bt	.L0602095A
	neg	r0,r0
	cmp/ge	r0,r4
	bf	.L0602095A
	mov.l	.L06020980,r0
	dmuls.l	r0,r6
	sts	mach,r0
	add	r13,r0
	cmp/gt	r0,r5
	bt	.L0602095A
	neg	r0,r0
	cmp/ge	r0,r5
	bt	.L06020984
.L0602095A:
	lds.l	@r15+,pr
	mov	#30,r3
	add	r1,r3
	mov.b	@r3,r8
	mov.w	@(68,gbr),r0
	xor	#1,r0
	mov.w	r0,@(68,gbr)
	or	#128,r0
	shlr	r8
	shll	r8
	or	r8,r0
	rts
	mov.b	r0,@r3
.L06020974:
	.short 0x0100
	.byte 0x00, 0x00
.L06020978:
	.long 0x00800000
.L0602097C:
	.long 0x58000000
.L06020980:
	.long 0x7FFFFFFF
.L06020984:
	mov.w	@(30,r1),r0
	mov.w	.L06020A2A,r3
	and	r3,r0
	mov.w	r0,@(30,r1)
	mov.w	@(190,gbr),r0
	mov	#-128,r14
	shll	r14
	mov.l	r6,@(0,r14)
	mov.l	r0,@(16,r14)
	mov	#0,r0
	mov.l	r0,@(20,r14)
	mov.l	@(28,r14),r0
	dmuls.l	r0,r4
	mov	r0,r3
	shlr8	r3
	mov	r0,r14
	shar	r14
	shar	r14
	shar	r14
	dlabel lbl_060209AA
	sub	r14,r0
	sts	mach,r4
	dmuls.l	r0,r5
	sts	mach,r5
	mov.w	@(100,gbr),r0
	muls.w	r0,r3
	sts	macl,r0
	shlr8	r0
	mov.w	r0,@(100,gbr)
	mov.w	.L06020A2C,r0
	add	r0,r4
	mov	#112,r0
	add	r0,r5
	mov	r4,r0
	mov.l	r0,@(760,gbr)
	mov	r5,r0
	mov.l	r0,@(764,gbr)
	mov	r6,r0
	mov.l	r0,@(768,gbr)
	mov.l	@(92,gbr),r0
	mov	r0,r3
	mov.l	@(60,r1),r7
	mov.l	@(44,r1),r2
	mov.w	@(20,r1),r0
	add	r0,r0
	mov.w	@(r0,r2),r0
	add	r0,r2
.L060209E0:
	mov.w	@r2,r0
	cmp/pl	r0
	bf	.L06020A3C
	mov.l	.L06020A30,r9
	add	#-1,r0
	shll2	r0
	shll	r0
	add	r0,r9
	mov.l	@r9,r13
	mov.l	r13,@(8,r3)
	mov.l	@(760,gbr),r0
	mov	r0,r4
	mov.l	@(764,gbr),r0
	mov	r0,r5
	mov.b	@(9,r2),r0
	mov.w	.L06020A2E,r12
	or	r0,r12
	mov.w	r12,@r3
	and	#15,r0
	shll2	r0
	mov.l	.L06020A34,r6
	mov.l	@(r0,r6),r6
	jsr	@r6
	nop
	mov.l	@(768,gbr),r0
	mov	r0,r6
	mov.w	@(6,r2),r0
	bsr	func_06020A7C
	mov.w	r0,@(4,r3)
	mov.w	@(28,r1),r0
	mov.w	r0,@(28,r3)
	mov.l	.L06020A38,r14
	jsr	@r14
	nop
	add	#20,r2
	bra	.L060209E0
	add	#32,r3
.L06020A2A:
	.short 0x7FFF
.L06020A2C:
	.short 0x00B0
.L06020A2E:
	.short 0x1000
.L06020A30:
	.long D_060EE800
.L06020A34:
	.long D_0602061C
.L06020A38:
	.long func_0601F1EC
.L06020A3C:
	lds.l	@r15+,pr
	mov	r3,r0
	rts
	mov.l	r0,@(92,gbr)
	.byte 0xC8, 0x08, 0x89, 0x11, 0x6E, 0x63, 0x4E, 0x29, 0xC5, 0x44, 0x3E, 0x08, 0xC5, 0x45, 0x6C, 0x03
	.byte 0x4E, 0x11, 0x8B, 0x0C, 0x2C, 0xEF, 0x0E, 0x1A, 0x6E, 0xE9, 0x6E, 0xEF, 0xE0, 0x08, 0x3E, 0x03
	.byte 0x8B, 0x00, 0xEE, 0x07, 0xA0, 0x04, 0x4E, 0x08, 0x85, 0x19, 0x00, 0x0B, 0x81, 0x33, 0xEE, 0x00
	.byte 0x85, 0x92, 0x30, 0xEC, 0x00, 0x0B, 0x81, 0x33
	endlabel func_06020912

	glabel func_06020A7C
	tst	#8,r0
	bt	.L06020AAA
	mov.b	@(8,r2),r0
	tst	r0,r0
	bf	.L06020ABA
	mov	r6,r14
	shlr16	r14
	mov.w	@(136,gbr),r0
	sub	r0,r14
	mov.w	@(138,gbr),r0
	mov	r0,r12
	cmp/pz	r14
	bf	.L06020AB0
	muls.w	r14,r12
	sts	macl,r14
	swap.w	r14,r14
	exts.w	r14,r14
	mov	#8,r0
	cmp/ge	r0,r14
	bf	.L06020AA6
	mov	#7,r14
.L06020AA6:
	bra	.L06020AB2
	shll2	r14
.L06020AAA:
	mov.w	@(18,r1),r0
	rts
	mov.w	r0,@(6,r3)
.L06020AB0:
	mov	#0,r14
.L06020AB2:
	mov.w	@(4,r9),r0
	add	r14,r0
	rts
	mov.w	r0,@(6,r3)
.L06020ABA:
	mov	r6,r14
	shlr16	r14
	mov.w	@(136,gbr),r0
	sub	r0,r14
	mov.w	@(138,gbr),r0
	mov	r0,r12
	cmp/pz	r14
	bf	.L06020ADE
	muls.w	r14,r12
	sts	macl,r14
	swap.w	r14,r14
	exts.w	r14,r14
	mov	#8,r0
	cmp/ge	r0,r14
	bf	.L06020ADA
	mov	#7,r14
.L06020ADA:
	bra	.L06020AE0
	shll2	r14
.L06020ADE:
	mov	#0,r14
.L06020AE0:
	mov.w	@(4,r9),r0
	add	r0,r14
	mov.w	@(18,r1),r0
	shll2	r0
	shll2	r0
	shll	r0
	add	r14,r0
	rts
	mov.w	r0,@(6,r3)
	dlabel D_06020AF2
	.byte 0x01, 0x02
	endlabel func_06020A7C

	.section .data.06020AF4,"aw",@progbits
	.p2align 2
	.byte 0x03, 0x04, 0x05, 0x06, 0x03, 0x04, 0x05, 0x06, 0x03, 0x04, 0x05, 0x06, 0x03, 0x04, 0x05, 0x06
	.byte 0x03, 0x04, 0x05, 0x06, 0x03, 0x04, 0x05, 0x06, 0x03, 0x04, 0x05, 0x06, 0x03, 0x04, 0x05, 0x06
	.byte 0x03, 0x04, 0x05, 0x06, 0x03, 0x04, 0x05, 0x06, 0x03, 0x04, 0x05, 0x06, 0x03, 0x04, 0x05, 0x06
	.byte 0x03, 0x04, 0x05, 0x06, 0x07, 0x06, 0x07, 0x08, 0x09, 0x08, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09
	.byte 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09
	.byte 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09
	.byte 0x09, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00
	dlabel D_06020B77
	.byte 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08
	.byte 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08
	.byte 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08
	.byte 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08
	.byte 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08
	.byte 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08
	.byte 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08
	.byte 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08, 0x09, 0x08
	.byte 0x09
