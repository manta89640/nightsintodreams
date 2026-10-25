	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601030C,"ax",@progbits
	.p2align 2

	glabel func_0601030C
	mov.l	r9,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	sts.l	pr,@-r15
	mov.l	.L06010340,r6
	bsr	func_060104EC
	mov	#0,r5
	mov	r5,r4
	mov.l	.L06010344,r6
	mov	#-1,r5
	bsr	func_060104EC
	shlr2	r5
	bsr	func_06010594
	nop
	lds.l	@r15+,pr
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	rts
	mov.l	@r15+,r9
	.byte 0x00, 0x00
.L06010340:
	.long D_060D9414 + 0x20000000
.L06010344:
	.long D_060D930C + 0x20000000
	endlabel func_0601030C

	glabel func_06010348
	mov.l	r9,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	sts.l	pr,@-r15
	mov.l	.L06010380,r4
	mov.l	.L06010384,r5
	cmp/gt	r2,r4
	bt	.L06010394
	cmp/ge	r5,r2
	bt	.L06010394
	mov.l	.L06010388,r4
	mov.l	.L0601038C,r5
	cmp/gt	r3,r4
	bt	.L06010394
	cmp/ge	r5,r3
	bt	.L06010394
	mov.l	.L06010390,r6
	bsr	func_060104EC
	mov	#-1,r5
	mov.l	@(52,r1),r0
	cmp/ge	r0,r5
	bf	.L06010394
	bra	.L060103F0
	mov	#0,r4
	.byte 0x00, 0x00
.L06010380:
	.long 0x0A000000
.L06010384:
	.long 0x0DC00000
.L06010388:
	.long 0x0A800000
.L0601038C:
	.long 0x14A00000
.L06010390:
	.long D_060D9414 + 0x20000000
.L06010394:
	bsr	func_06010658
	nop
	bf	.L060103C8
	mov.l	@(52,r1),r0
	cmp/hs	r0,r5
	bf	.L060103B4
	mov.l	r5,@-r15
	mov.l	.L060103B0,r6
	bsr	func_060104EC
	mov	#0,r5
	mov	r5,r4
	bra	.L060103F0
	mov.l	@r15+,r5
	.byte 0x00, 0x00
.L060103B0:
	.long D_060D9414 + 0x20000000
.L060103B4:
	mov	r5,r4
	mov.l	.L060103C4,r6
	mov	#-1,r5
	bsr	func_060104EC
	shlr2	r5
	bra	.L060103F0
	nop
	.byte 0x00, 0x00
.L060103C4:
	.long D_060D930C + 0x20000000
.L060103C8:
	bsr	func_060109B0
	nop
	bf	.L060103E0
	mov.l	r5,@-r15
	mov.l	.L060103DC,r6
	bsr	func_060104EC
	mov	#0,r5
	mov	r5,r4
	bra	.L060103F0
	mov.l	@r15+,r5
.L060103DC:
	.long D_060D9414 + 0x20000000
.L060103E0:
	mov.l	.L06010404,r6
	bsr	func_060104EC
	mov	#0,r5
	mov	r5,r4
	mov.l	.L06010408,r6
	mov	#-1,r5
	bsr	func_060104EC
	shlr2	r5
.L060103F0:
	bsr	func_06010594
	nop
	lds.l	@r15+,pr
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	rts
	mov.l	@r15+,r9
.L06010404:
	.long D_060D9414 + 0x20000000
.L06010408:
	.long D_060D930C + 0x20000000
	endlabel func_06010348

	glabel func_0601040C
	mov	#1,r4
	mov	#4,r5
	shll8	r5
	rts
	shll16	r5
	.byte 0x00, 0x09
	endlabel func_0601040C

	glabel func_06010418
	mov.l	@(60,r1),r0
	mov.l	.L06010430,r8
	cmp/ge	r8,r0
	bf	.L06010440
	mov.l	.L06010434,r8
	cmp/ge	r8,r0
	bt	.L06010440
	mov.l	.L06010438,r4
	mov.l	.L0601043C,r5
	bra	.L06010444
	nop
	.byte 0x00, 0x00
.L06010430:
	.long 0x0C000000
.L06010434:
	.long 0x14200000
.L06010438:
	.long 0x01600000
.L0601043C:
	.long 0x03100000
.L06010440:
	mov.l	.L06010448,r4
	mov.l	.L0601044C,r5
.L06010444:
	rts
	nop
.L06010448:
	.long 0x01600000
.L0601044C:
	.long 0x03E00000
	endlabel func_06010418

	glabel func_06010450
	mov	#112,r4
	shll2	r4
	shll16	r4
	mov	#4,r5
	shll8	r5
	rts
	shll16	r5
	.byte 0x00, 0x09
	endlabel func_06010450

	glabel func_06010460
	mov	#96,r4
	shll2	r4
	shll16	r4
	mov	#4,r5
	shll8	r5
	rts
	shll16	r5
	.byte 0x00, 0x09
	endlabel func_06010460

	glabel func_06010470
	mov.l	.L0601048C,r4
	mov.l	@r4,r4
	mov	#31,r0
	mov.b	@(r0,r4),r0
	cmp/eq	#1,r0
	bt	.L06010490
	mov	#64,r4
	shll2	r4
	shll16	r4
	mov.w	.L06010488,r5
	rts
	shll16	r5
.L06010488:
	.short 0x0400
	.byte 0x00, 0x00
.L0601048C:
	.long player_obj
.L06010490:
	mov	#0,r4
	mov.w	.L06010498,r5
	rts
	shll16	r5
.L06010498:
	.short 0x0220
	.byte 0x00, 0x09
	endlabel func_06010470

	glabel func_0601049C
	mov	#1,r4
	shll8	r4
	shll16	r4
	mov	#4,r5
	shll8	r5
	rts
	shll16	r5
	.byte 0x00, 0x09
	endlabel func_0601049C

	glabel func_060104AC
	mov.l	.L060104C8,r4
	mov.l	@r4,r4
	mov	#31,r0
	mov.b	@(r0,r4),r0
	mov	#10,r5
	cmp/ge	r5,r0
	bf	.L060104CC
	mov.w	.L060104C4,r4
	shll16	r4
	mov.w	.L060104C6,r5
	rts
	shll16	r5
.L060104C4:
	.short 0x0000
.L060104C6:
	.short 0x1400
.L060104C8:
	.long player_obj
.L060104CC:
	mov.w	.L060104D6,r4
	shll16	r4
	mov.w	.L060104D8,r5
	rts
	shll16	r5
.L060104D6:
	.short 0x1000
.L060104D8:
	.short 0x1400
	.byte 0x00, 0x09
	endlabel func_060104AC

	glabel func_060104DC
	mov.w	.L060104E6,r4
	shll16	r4
	mov.w	.L060104E8,r5
	rts
	shll16	r5
.L060104E6:
	.short 0x0256
.L060104E8:
	.short 0x05AA
	.byte 0x00, 0x09
	endlabel func_060104DC

	glabel func_060104EC
	mov.w	@r6+,r7
	mov.w	@r6+,r8
	shll8	r7
	shll8	r8
	shll16	r7
	shll16	r8
	cmp/hs	r7,r2
	bt	.L0601058E
	cmp/hs	r8,r3
	bt	.L0601058E
	mov	r3,r7
	shlr16	r7
	shlr8	r7
	shll2	r7
	add	r7,r6
	mov.l	@r6,r6
	mov	r2,r7
	shlr16	r7
	shlr8	r7
	shll2	r7
	add	r7,r6
	mov.l	@r6,r6
	swap.w	r3,r0
	cmp/pl	r6
	bf	.L0601058E
	and	#224,r0
	add	r0,r6
	shlr2	r0
	shlr	r0
	add	r0,r6
	swap.w	r2,r0
	and	#224,r0
	add	#1,r0
	rotr	r0
	shlr2	r0
	add	r0,r6
	add	#8,r6
	mov	#-1,r0
	mov.l	@(36,r6),r8
	mov.l	@(40,r6),r9
	cmp/eq	r8,r0
	bt	.L0601058E
	cmp/eq	r9,r0
	bt	.L0601058E
	mov.l	@(4,r6),r7
	mov.l	@r6,r6
	cmp/eq	r7,r0
	bt	.L0601058E
	cmp/eq	r6,r0
	bt	.L0601058E
	mov	#8,r10
	shll8	r10
	shll16	r10
	shll16	r6
	shll16	r8
	sub	r6,r8
	dmuls.l	r10,r8
	swap.w	r3,r0
	sts	mach,r8
	and	#31,r0
	dmuls.l	r0,r8
	shll16	r7
	sts	macl,r8
	shll16	r9
	add	r8,r6
	sub	r7,r9
	dmuls.l	r10,r9
	sts	mach,r9
	dmuls.l	r0,r9
	sts	macl,r9
	add	r9,r7
	sub	r6,r7
	dmuls.l	r10,r7
	swap.w	r2,r0
	sts	mach,r7
	and	#31,r0
	dmuls.l	r0,r7
	sts	macl,r5
	add	r6,r5
	rts
	shlr2	r5
.L0601058E:
	rts
	nop
	.byte 0x00, 0x09
	endlabel func_060104EC

	glabel func_06010594
	mov.b	@(32,gbr),r0
	mov.l	.L060105DC,r6
	shll8	r0
	add	r0,r6
	mov.b	@r6,r7
	add	#8,r6
	tst	r7,r7
	bt	.L06010654
	sts.l	pr,@-r15
.L060105A6:
	mov.l	r7,@-r15
	mov.l	@r6+,r8
	mov.l	@r6+,r9
	mov.l	@(48,r8),r12
	mov.w	@(24,r8),r0
	mov.l	@(56,r8),r13
	tst	r0,r0
	bt	.L060105E4
	mov.l	.L060105E0,r10
	sub	r2,r12
	jsr	@r10
	neg	r12,r12
	shll2	r10
	dmuls.l	r10,r12
	sub	r3,r13
	sts	mach,r0
	neg	r13,r13
	dmuls.l	r10,r13
	shll2	r11
	sts	mach,r14
	dmuls.l	r11,r12
	sts	mach,r12
	dmuls.l	r11,r13
	sub	r14,r12
	sts	mach,r13
	bra	.L060105F4
	add	r0,r13
.L060105DC:
	.long D_060FBBFC
.L060105E0:
	.long math_sincos
.L060105E4:
	sub	r2,r12
	sub	r3,r13
	neg	r12,r12
	neg	r13,r13
	shlr16	r12
	shlr16	r13
	exts.w	r12,r12
	exts.w	r13,r13
.L060105F4:
	mov.w	@r9+,r14
	mov.l	@(52,r1),r10
	mov.l	@(52,r8),r11
	mov	#12,r7
	cmp/gt	r11,r10
	bf	.L0601060C
	dlabel lbl_06010600
	mov	r14,r10
	dlabel lbl_06010602
	add	#-1,r10
	mulu.w	r7,r10
	sts	macl,r10
	mov	#-12,r7
	add	r10,r9
.L0601060C:
	mov	r9,r10
	add	#4,r10
	mov.w	@r10+,r0
	mov.w	@r10+,r11
	cmp/gt	r12,r0
	bt	.L06010646
	cmp/gt	r13,r11
	bt	.L06010646
	mov.w	@r10+,r0
	mov.w	@r10,r11
	cmp/gt	r0,r12
	bt	.L06010646
	cmp/gt	r11,r13
	bt	.L06010646
	mov.w	@(2,r9),r0
	mov.l	@(52,r8),r11
	shll16	r0
	add	r0,r11
	cmp/pz	r7
	mov.l	@r15+,r7
	bt	.L0601063E
	cmp/gt	r11,r4
	bt	.L06010652
	bra	.L06010652
	mov	r11,r4
.L0601063E:
	cmp/gt	r5,r11
	bt	.L06010652
	bra	.L06010652
	mov	r11,r5
.L06010646:
	dt	r14
	bf/s	.L0601060C
	add	r7,r9
	mov.l	@r15+,r7
	dt	r7
	bf	.L060105A6
.L06010652:
	lds.l	@r15+,pr
.L06010654:
	rts
	nop
	endlabel func_06010594

	glabel func_06010658
	mov.l	.L0601069C,r4
	mov.l	.L060106A0,r5
	mov.l	@r4+,r6
	mov.l	@r4+,r7
	cmp/gt	r2,r6
	bt	.L06010696
	cmp/gt	r7,r2
	bt	.L06010696
	mov.l	@r4+,r6
	mov.l	@r4+,r7
	cmp/gt	r3,r6
	bt	.L06010696
	cmp/gt	r7,r3
	bt	.L06010696
	mov	#8,r6
.L06010676:
	mov.l	@r5,r7
	mov.l	@(4,r5),r8
	cmp/gt	r2,r7
	bt	.L0601068E
	cmp/gt	r8,r2
	bt	.L0601068E
	mov.l	@(8,r5),r7
	mov.l	@(12,r5),r8
	cmp/gt	r3,r7
	bt	.L0601068E
	cmp/gt	r8,r3
	bf	.L060106A4
.L0601068E:
	add	#16,r5
	dt	r6
	bf/s	.L06010676
	add	#16,r4
.L06010696:
	bra	.L06010800
	nop
	.byte 0x00, 0x00
.L0601069C:
	.long D_06010F70
.L060106A0:
	.long D_06011000
.L060106A4:
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	@r4,r5
	mov.l	@(8,r4),r6
	sub	r5,r2
	mov.l	@(12,r4),r5
	sub	r6,r3
	mov.l	@(4,r5),r14
	mov.l	@r5,r5
	extu.w	r14,r14
	add	#-1,r14
	add	#12,r5
	mov	r5,r7
	add	#84,r7
	mov	r5,r6
	mov	r7,r8
	add	#96,r6
	add	#96,r8
.L060106C8:
	mov.l	@r7,r0
	mov.l	@r5,r9
	mov	r2,r10
	sub	r0,r9
	sub	r0,r10
	mov.l	@(8,r7),r0
	mov.l	@(8,r5),r11
	mov	r3,r12
	sub	r0,r12
	dmuls.l	r9,r12
	sub	r0,r11
	sts	mach,r13
	neg	r11,r11
	dmuls.l	r11,r10
	sts	mach,r0
	add	r13,r0
	cmp/pz	r0
	bf	.L06010758
	mov.l	@r5,r0
	mov.l	@r6,r9
	mov	r2,r10
	sub	r0,r9
	sub	r0,r10
	mov.l	@(8,r5),r0
	mov.l	@(8,r6),r11
	mov	r3,r12
	sub	r0,r12
	dmuls.l	r9,r12
	sub	r0,r11
	sts	mach,r13
	neg	r11,r11
	dmuls.l	r11,r10
	sts	mach,r0
	add	r13,r0
	cmp/pz	r0
	bf	.L06010758
	mov.l	@r6,r0
	mov.l	@r8,r9
	mov	r2,r10
	sub	r0,r9
	sub	r0,r10
	mov.l	@(8,r6),r0
	mov.l	@(8,r8),r11
	mov	r3,r12
	sub	r0,r12
	dmuls.l	r9,r12
	sub	r0,r11
	sts	mach,r13
	neg	r11,r11
	dmuls.l	r11,r10
	sts	mach,r0
	add	r13,r0
	cmp/pz	r0
	bf	.L06010758
	mov.l	@r8,r0
	mov.l	@r7,r9
	mov	r2,r10
	sub	r0,r9
	sub	r0,r10
	mov.l	@(8,r8),r0
	mov.l	@(8,r7),r11
	mov	r3,r12
	sub	r0,r12
	dmuls.l	r9,r12
	sub	r0,r11
	sts	mach,r13
	neg	r11,r11
	dmuls.l	r11,r10
	sts	mach,r0
	add	r13,r0
	cmp/pz	r0
	bt	.L06010768
.L06010758:
	add	#96,r5
	add	#96,r6
	add	#96,r7
	dt	r14
	bf/s	.L060106C8
	add	#96,r8
	bra	.L060107FC
	nop
.L06010768:
	mov	r5,r14
	mov.w	@r6,r0
	mov	r0,r8
	mov.w	@(4,r6),r0
	mov	r0,r9
	mov.w	@(8,r6),r0
	mov	r0,r10
	mov.w	@r5,r0
	mov	r0,r11
	mov.w	@(4,r5),r0
	mov	r0,r12
	mov.w	@(8,r5),r0
	mov	r0,r13
	sub	r11,r8
	sub	r12,r9
	sub	r13,r10
	mov.w	@r7,r0
	sub	r0,r11
	mov.w	@(4,r7),r0
	sub	r0,r12
	mov.w	@(8,r7),r0
	sub	r0,r13
	muls.w	r10,r12
	sts	macl,r5
	muls.w	r9,r13
	sts	macl,r0
	sub	r0,r5
	muls.w	r8,r13
	sts	macl,r6
	muls.w	r10,r11
	sts	macl,r0
	sub	r0,r6
	muls.w	r9,r11
	sts	macl,r7
	muls.w	r8,r12
	sts	macl,r0
	sub	r0,r7
	mov.w	@r14,r0
	mov.l	@(4,r14),r12
	mov	r0,r11
	mov.w	@(8,r14),r0
	mov.l	@(4,r4),r4
	mov	r0,r13
	add	r4,r12
	shlr16	r12
	exts.w	r12,r12
	shlr16	r2
	shlr16	r3
	exts.w	r2,r2
	exts.w	r3,r3
	muls.w	r5,r11
	sts	macl,r14
	muls.w	r6,r12
	sts	macl,r0
	muls.w	r7,r13
	add	r0,r14
	sts	macl,r0
	muls.w	r5,r2
	add	r0,r14
	sts	macl,r13
	muls.w	r7,r3
	sts	macl,r0
	add	r0,r13
	sub	r13,r14
	mov	#-1,r0
	shll8	r0
	mov.l	r6,@(0,r0)
	mov.l	r14,@(4,r0)
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	sett
	mov.l	@(28,r0),r5
	rts
	shll16	r5
.L060107FC:
	mov.l	@r15+,r2
	mov.l	@r15+,r3
.L06010800:
	rts
	clrt
	endlabel func_06010658

	glabel func_06010804
	mov.l	.L06010848,r4
	mov.l	.L0601084C,r5
	mov.l	@r4+,r6
	mov.l	@r4+,r7
	cmp/gt	r2,r6
	bt	.L06010842
	cmp/gt	r7,r2
	bt	.L06010842
	mov.l	@r4+,r6
	mov.l	@r4+,r7
	cmp/gt	r3,r6
	bt	.L06010842
	cmp/gt	r7,r3
	bt	.L06010842
	mov	#8,r6
.L06010822:
	mov.l	@r5,r7
	mov.l	@(4,r5),r8
	cmp/gt	r2,r7
	bt	.L0601083A
	cmp/gt	r8,r2
	bt	.L0601083A
	mov.l	@(8,r5),r7
	mov.l	@(12,r5),r8
	cmp/gt	r3,r7
	bt	.L0601083A
	cmp/gt	r8,r3
	bf	.L06010850
.L0601083A:
	add	#16,r5
	dt	r6
	bf/s	.L06010822
	add	#16,r4
.L06010842:
	bra	.L060109AC
	nop
	.byte 0x00, 0x00
.L06010848:
	.long D_06010F70
.L0601084C:
	.long D_06011000
.L06010850:
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	@r4,r5
	mov.l	@(8,r4),r6
	sub	r5,r2
	mov.l	@(12,r4),r5
	sub	r6,r3
	mov.l	@(4,r5),r14
	mov.l	@r5,r5
	extu.w	r14,r14
	add	#-1,r14
	add	#12,r5
	mov	r5,r7
	add	#84,r7
	mov	r5,r6
	mov	r7,r8
	add	#96,r6
	add	#96,r8
.L06010874:
	mov.l	@r7,r0
	mov.l	@r5,r9
	mov	r2,r10
	sub	r0,r9
	sub	r0,r10
	mov.l	@(8,r7),r0
	mov.l	@(8,r5),r11
	mov	r3,r12
	sub	r0,r12
	dmuls.l	r9,r12
	sub	r0,r11
	sts	mach,r13
	neg	r11,r11
	dmuls.l	r11,r10
	sts	mach,r0
	add	r13,r0
	cmp/pz	r0
	bf	.L06010904
	mov.l	@r5,r0
	mov.l	@r6,r9
	mov	r2,r10
	sub	r0,r9
	sub	r0,r10
	mov.l	@(8,r5),r0
	mov.l	@(8,r6),r11
	mov	r3,r12
	sub	r0,r12
	dmuls.l	r9,r12
	sub	r0,r11
	sts	mach,r13
	neg	r11,r11
	dmuls.l	r11,r10
	sts	mach,r0
	add	r13,r0
	cmp/pz	r0
	bf	.L06010904
	mov.l	@r6,r0
	mov.l	@r8,r9
	mov	r2,r10
	sub	r0,r9
	sub	r0,r10
	mov.l	@(8,r6),r0
	mov.l	@(8,r8),r11
	mov	r3,r12
	sub	r0,r12
	dmuls.l	r9,r12
	sub	r0,r11
	sts	mach,r13
	neg	r11,r11
	dmuls.l	r11,r10
	sts	mach,r0
	add	r13,r0
	cmp/pz	r0
	bf	.L06010904
	mov.l	@r8,r0
	mov.l	@r7,r9
	mov	r2,r10
	sub	r0,r9
	sub	r0,r10
	mov.l	@(8,r8),r0
	mov.l	@(8,r7),r11
	mov	r3,r12
	sub	r0,r12
	dmuls.l	r9,r12
	sub	r0,r11
	sts	mach,r13
	neg	r11,r11
	dmuls.l	r11,r10
	sts	mach,r0
	add	r13,r0
	cmp/pz	r0
	bt	.L06010914
.L06010904:
	add	#96,r5
	add	#96,r6
	add	#96,r7
	dt	r14
	bf/s	.L06010874
	add	#96,r8
	bra	.L060109A8
	nop
.L06010914:
	mov	r5,r14
	mov.w	@r6,r0
	mov	r0,r8
	mov.w	@(4,r6),r0
	mov	r0,r9
	mov.w	@(8,r6),r0
	mov	r0,r10
	mov.w	@r5,r0
	mov	r0,r11
	mov.w	@(4,r5),r0
	mov	r0,r12
	mov.w	@(8,r5),r0
	mov	r0,r13
	sub	r11,r8
	sub	r12,r9
	sub	r13,r10
	mov.w	@r7,r0
	sub	r0,r11
	mov.w	@(4,r7),r0
	sub	r0,r12
	mov.w	@(8,r7),r0
	sub	r0,r13
	muls.w	r10,r12
	sts	macl,r5
	muls.w	r9,r13
	sts	macl,r0
	sub	r0,r5
	muls.w	r8,r13
	sts	macl,r6
	muls.w	r10,r11
	sts	macl,r0
	sub	r0,r6
	muls.w	r9,r11
	sts	macl,r7
	muls.w	r8,r12
	sts	macl,r0
	sub	r0,r7
	mov.w	@r14,r0
	mov.l	@(4,r14),r12
	mov	r0,r11
	mov.w	@(8,r14),r0
	mov.l	@(4,r4),r4
	mov	r0,r13
	add	r4,r12
	shlr16	r12
	exts.w	r12,r12
	shlr16	r2
	shlr16	r3
	exts.w	r2,r2
	exts.w	r3,r3
	muls.w	r5,r11
	sts	macl,r14
	muls.w	r6,r12
	sts	macl,r0
	muls.w	r7,r13
	add	r0,r14
	sts	macl,r0
	muls.w	r5,r2
	add	r0,r14
	sts	macl,r13
	muls.w	r7,r3
	sts	macl,r0
	add	r0,r13
	sub	r13,r14
	mov	#-1,r0
	shll8	r0
	mov.l	r6,@(0,r0)
	mov.l	r14,@(4,r0)
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	sett
	mov.l	@(28,r0),r5
	rts
	shll16	r5
.L060109A8:
	mov.l	@r15+,r2
	mov.l	@r15+,r3
.L060109AC:
	rts
	clrt
	endlabel func_06010804

	glabel func_060109B0
	mov.l	.L060109F4,r4
	mov.l	.L060109F8,r5
	mov.l	@r4+,r6
	mov.l	@r4+,r7
	cmp/gt	r2,r6
	bt	.L060109EE
	cmp/gt	r7,r2
	bt	.L060109EE
	mov.l	@r4+,r6
	mov.l	@r4+,r7
	cmp/gt	r3,r6
	bt	.L060109EE
	cmp/gt	r7,r3
	bt	.L060109EE
	mov	#9,r6
.L060109CE:
	mov.l	@r5,r7
	mov.l	@(4,r5),r8
	cmp/gt	r2,r7
	bt	.L060109E6
	cmp/gt	r8,r2
	bt	.L060109E6
	mov.l	@(8,r5),r7
	mov.l	@(12,r5),r8
	cmp/gt	r3,r7
	bt	.L060109E6
	cmp/gt	r8,r3
	bf	.L060109FC
.L060109E6:
	add	#16,r5
	dt	r6
	bf/s	.L060109CE
	add	#16,r4
.L060109EE:
	bra	.L06010B9C
	nop
	.byte 0x00, 0x00
.L060109F4:
	.long D_06011080
.L060109F8:
	.long D_06011120
.L060109FC:
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	@r4,r5
	mov.l	@(8,r4),r6
	sub	r5,r2
	mov.l	@(12,r4),r5
	sub	r6,r3
	mov.l	@(4,r5),r14
	mov.l	@r5,r5
	extu.w	r14,r14
	add	#-1,r14
	add	#12,r5
	mov	#102,r0
	shll	r0
	mov	r5,r7
	add	r0,r5
	add	#12,r0
	mov	r5,r6
	mov	r7,r8
	add	r0,r6
	add	r0,r8
.L06010A26:
	mov.l	@r7,r0
	mov.l	@r5,r9
	mov	r2,r10
	sub	r0,r9
	sub	r0,r10
	mov.l	@(8,r7),r0
	mov.l	@(8,r5),r11
	mov	r3,r12
	sub	r0,r12
	dmuls.l	r9,r12
	sub	r0,r11
	sts	mach,r13
	neg	r11,r11
	dmuls.l	r11,r10
	sts	mach,r0
	add	r13,r0
	cmp/pz	r0
	bf	.L06010AB6
	mov.l	@r5,r0
	mov.l	@r6,r9
	mov	r2,r10
	sub	r0,r9
	sub	r0,r10
	mov.l	@(8,r5),r0
	mov.l	@(8,r6),r11
	mov	r3,r12
	sub	r0,r12
	dmuls.l	r9,r12
	sub	r0,r11
	sts	mach,r13
	neg	r11,r11
	dmuls.l	r11,r10
	sts	mach,r0
	add	r13,r0
	cmp/pz	r0
	bf	.L06010AB6
	mov.l	@r6,r0
	mov.l	@r8,r9
	mov	r2,r10
	sub	r0,r9
	sub	r0,r10
	mov.l	@(8,r6),r0
	mov.l	@(8,r8),r11
	mov	r3,r12
	sub	r0,r12
	dmuls.l	r9,r12
	sub	r0,r11
	sts	mach,r13
	neg	r11,r11
	dmuls.l	r11,r10
	sts	mach,r0
	add	r13,r0
	cmp/pz	r0
	bf	.L06010AB6
	mov.l	@r8,r0
	mov.l	@r7,r9
	mov	r2,r10
	sub	r0,r9
	sub	r0,r10
	mov.l	@(8,r8),r0
	mov.l	@(8,r7),r11
	mov	r3,r12
	sub	r0,r12
	dmuls.l	r9,r12
	sub	r0,r11
	sts	mach,r13
	neg	r11,r11
	dmuls.l	r11,r10
	sts	mach,r0
	add	r13,r0
	cmp/pz	r0
	bt	.L06010ACA
.L06010AB6:
	mov	#108,r0
	shll	r0
	add	r0,r5
	add	r0,r6
	add	r0,r7
	dt	r14
	bf/s	.L06010A26
	add	r0,r8
	bra	.L06010B98
	nop
.L06010ACA:
	mov	r7,r5
	mov	r8,r6
	add	#12,r5
	add	#12,r6
	mov	#16,r14
.L06010AD4:
	mov.l	@r5,r0
	mov.l	@r6,r9
	mov	r2,r10
	sub	r0,r9
	sub	r0,r10
	mov.l	@(8,r5),r0
	mov.l	@(8,r6),r11
	mov	r3,r12
	sub	r0,r12
	dmuls.l	r9,r12
	sub	r0,r11
	sts	mach,r13
	neg	r11,r11
	dmuls.l	r11,r10
	sts	mach,r0
	add	r13,r0
	cmp/pz	r0
	bt	.L06010B04
	add	#12,r5
	add	#12,r6
	add	#12,r7
	dt	r14
	bf/s	.L06010AD4
	add	#12,r8
.L06010B04:
	mov	r5,r14
	mov.w	@r6,r0
	mov	r0,r8
	mov.w	@(4,r6),r0
	mov	r0,r9
	mov.w	@(8,r6),r0
	mov	r0,r10
	mov.w	@r5,r0
	mov	r0,r11
	mov.w	@(4,r5),r0
	mov	r0,r12
	mov.w	@(8,r5),r0
	mov	r0,r13
	sub	r11,r8
	sub	r12,r9
	sub	r13,r10
	mov.w	@r7,r0
	sub	r0,r11
	mov.w	@(4,r7),r0
	sub	r0,r12
	mov.w	@(8,r7),r0
	sub	r0,r13
	muls.w	r10,r12
	sts	macl,r5
	muls.w	r9,r13
	sts	macl,r0
	sub	r0,r5
	muls.w	r8,r13
	sts	macl,r6
	muls.w	r10,r11
	sts	macl,r0
	sub	r0,r6
	muls.w	r9,r11
	sts	macl,r7
	muls.w	r8,r12
	sts	macl,r0
	sub	r0,r7
	mov.w	@r14,r0
	mov.l	@(4,r14),r12
	mov	r0,r11
	mov.w	@(8,r14),r0
	mov.l	@(4,r4),r4
	mov	r0,r13
	add	r4,r12
	shlr16	r12
	exts.w	r12,r12
	shlr16	r2
	shlr16	r3
	exts.w	r2,r2
	exts.w	r3,r3
	muls.w	r5,r11
	sts	macl,r14
	muls.w	r6,r12
	sts	macl,r0
	muls.w	r7,r13
	add	r0,r14
	sts	macl,r0
	muls.w	r5,r2
	add	r0,r14
	sts	macl,r13
	muls.w	r7,r3
	sts	macl,r0
	add	r0,r13
	sub	r13,r14
	mov	#-1,r0
	shll8	r0
	mov.l	r6,@(0,r0)
	mov.l	r14,@(4,r0)
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	sett
	mov.l	@(28,r0),r5
	rts
	shll16	r5
.L06010B98:
	mov.l	@r15+,r2
	mov.l	@r15+,r3
.L06010B9C:
	rts
	clrt
	endlabel func_060109B0

	glabel func_06010BA0
	bra	.L06010C08
	nop
	endlabel func_06010BA0

	glabel func_06010BA4
	sts.l	pr,@-r15
	bsr	func_06010804
	nop
	lds.l	@r15+,pr
	bf	.L06010BB8
	mov.l	@(52,r1),r0
	cmp/hs	r0,r5
	bf	.L06010BB8
	rts
	mov	#72,r4
.L06010BB8:
	mov.l	.L06010BEC,r4
	mov.l	.L06010BF0,r5
	cmp/gt	r2,r4
	bt	.L06010C08
	cmp/ge	r5,r2
	bt	.L06010C08
	mov.l	.L06010BF4,r4
	mov.l	.L06010BF8,r5
	cmp/gt	r3,r4
	bt	.L06010C08
	cmp/ge	r5,r3
	bt	.L06010C08
	sts.l	pr,@-r15
	mov.l	.L06010BFC,r6
	bsr	func_060104EC
	mov	#-1,r5
	mov.l	@(52,r1),r0
	lds.l	@r15+,pr
	cmp/ge	r0,r5
	bf	.L06010C08
	mov.l	.L06010C00,r6
	mov.l	.L06010C04,r5
	bt	.L06010C0C
	nop
	dlabel lbl_06010BE8
	rts
	mov	#0,r4
.L06010BEC:
	.long 0x0A000000
.L06010BF0:
	.long 0x0DC00000
.L06010BF4:
	.long 0x0A800000
.L06010BF8:
	.long 0x14A00000
.L06010BFC:
	.long D_060D9414 + 0x20000000
.L06010C00:
	.long D_060D9414
.L06010C04:
	.long D_060D9418
.L06010C08:
	mov.l	.L06010C60,r6
	mov.l	.L06010C64,r5
.L06010C0C:
	mov.w	@r6+,r7
	mov.w	@r6,r6
	shll8	r7
	shll8	r6
	shll16	r7
	shll16	r6
	cmp/hs	r7,r2
	bt	.L06010C68
	cmp/hs	r6,r3
	bt	.L06010C68
	mov	r3,r6
	shlr16	r6
	shlr8	r6
	shll2	r6
	add	r6,r5
	mov.l	@r5,r5
	mov	r2,r6
	shlr16	r6
	shlr8	r6
	shll2	r6
	add	r6,r5
	mov.l	@r5,r5
	swap.w	r3,r0
	cmp/pl	r5
	bf	.L06010C68
	and	#224,r0
	add	r0,r5
	swap.w	r2,r0
	shlr2	r0
	shlr	r0
	and	#28,r0
	mov.w	.L06010C5C,r4
	add	r0,r5
	add	r4,r5
	mov.w	@r5,r0
	mov.w	.L06010C5E,r4
	cmp/eq	#-1,r0
	bt	.L06010C68
	rts
	and	r0,r4
.L06010C5C:
	.short 0x014C
.L06010C5E:
	.short 0x07FF
.L06010C60:
	.long D_060D930C
.L06010C64:
	.long D_060D9310
.L06010C68:
	rts
	mov	#0,r4
	endlabel func_06010BA4

	glabel func_06010C6C
	mov.l	.L06010CF4,r2
	mov.l	.L06010CF8,r3
	mov.l	@r2,r2
	mov.l	@(32,r2),r4
	mov.l	@(36,r2),r5
	mov.l	r4,@r3
	mov.l	r5,@(4,r3)
	mov.l	r5,@(8,r3)
	mov	#0,r0
	mov.l	r0,@(12,r3)
	mov.l	r0,@(16,r3)
	mov	#120,r0
	shll	r0
	mov.w	r0,@(20,r3)
	mov.l	@(40,r2),r0
	mov.l	r0,@(8,r1)
	mova	.L06010C90,r0
	mov.l	r0,@(4,r1)
.L06010C90:
	mov.b	@(12,r1),r0
	add	#1,r0
	mov.b	r0,@(12,r1)
	and	#15,r0
	shll2	r0
	shll2	r0
	mov.l	@(8,r1),r2
	add	r0,r2
	mov.l	.L06010CFC,r3
	mov	#8,r0
.L06010CA4:
	mov.w	@r2+,r4
	dt	r0
	mov.w	r4,@r3
	bf/s	.L06010CA4
	add	#32,r3
	mov	#120,r0
	shll	r0
	add	r0,r2
	mov.l	.L06010D00,r3
	mov	#8,r0
.L06010CB8:
	mov.w	@r2+,r4
	dt	r0
	mov.w	r4,@r3
	bf/s	.L06010CB8
	add	#32,r3
	sts.l	pr,@-r15
	mov.l	.L06010D04,r0
	jsr	@r0
	mov	#4,r3
	lds.l	@r15+,pr
	mov.l	.L06010D08,r2
	mov.l	.L06010D0C,r3
	mov.b	@r2,r0
	mov.b	@r3,r4
	cmp/eq	r0,r4
	bt	.L06010D14
	mov.b	r0,@r3
	mov.l	.L06010D10,r2
	mov	#-1,r3
	mov	#8,r4
.L06010CE0:
	mov.b	@r2,r0
	tst	r0,r0
	bt	.L06010CE8
	mov.b	r3,@r2
.L06010CE8:
	dt	r4
	bf/s	.L06010CE0
	add	#1,r2
	rts
	nop
	.byte 0x00, 0x00
.L06010CF4:
	.long D_060D9300
.L06010CF8:
	.long D_060DB564
.L06010CFC:
	.long VDP1_VRAM_CACHED + 0x7C508
.L06010D00:
	.long VDP1_VRAM_CACHED + 0x7C600
.L06010D04:
	.long func_06010ED0
.L06010D08:
	.long D_060FFE54 + 0x20000000
.L06010D0C:
	.long D_060DB2EB + 0x20000000
.L06010D10:
	.long D_060DB318
.L06010D14:
	mov.l	.L06010DC4,r10
	mov.l	@r10,r10
	mov.b	@(6,r10),r0
	mov.l	@(8,r10),r11
	tst	r0,r0
	bt	.L06010DE0
	mov.b	@(8,r11),r0
	tst	r0,r0
	bf	.L06010DE0
	mov.l	@(48,r10),r4
	mov.l	@(56,r10),r5
	shlr16	r4
	shlr16	r5
	mov.l	.L06010DC8,r2
	mov.l	.L06010DCC,r3
	mov.l	@r2,r2
	mov.w	.L06010DBC,r6
	mov	#7,r7
	mov	#8,r8
.L06010D3A:
	mov.b	@r3,r0
	tst	r0,r0
	bf	.L06010DD8
	mov.l	@r2,r14
	add	#-4,r14
	mov.w	@r14+,r13
	mov.w	@r14,r14
	sub	r4,r13
	muls.w	r13,r13
	sub	r5,r14
	sts	macl,r13
	muls.w	r14,r14
	sts	macl,r14
	add	r13,r14
	cmp/gt	r6,r14
	bt	.L06010DD8
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#3,r5
	mov	#7,r6
	mov.l	.L06010DD0,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.b	r7,@r3
	mov.l	@(12,r10),r12
	mov.w	.L06010DBE,r0
	mov.w	r0,@(22,r11)
	mov	#0,r0
	mov.w	r0,@(24,r11)
	mov.w	.L06010DC0,r0
	mov.w	r0,@(28,r11)
	mov	#32,r0
	mov.b	r0,@(1,r11)
	mov	#0,r0
	mov.w	r0,@(14,r11)
	mov.w	r0,@(16,r11)
	mov	#-127,r0
	mov.b	r0,@(8,r11)
	mov	#-4,r0
	shll16	r0
	mov.l	r0,@(40,r12)
	mov	#-3,r0
	shll16	r0
	mov.l	r0,@(36,r10)
	sts.l	pr,@-r15
	mov.l	@r2,r3
	mov.l	.L06010DD4,r0
	add	#-4,r3
	mov.w	@r3+,r2
	mov.w	@r3,r3
	sub	r4,r2
	jsr	@r0
	sub	r5,r3
	lds.l	@r15+,pr
	neg	r0,r0
	bra	.L06010DE0
	mov.w	r0,@(24,r10)
.L06010DBC:
	.short 0x2400
.L06010DBE:
	.short 0x00AE
.L06010DC0:
	.short 0x009E
	.byte 0x00, 0x00
.L06010DC4:
	.long player_obj
.L06010DC8:
	.long D_060DB308
.L06010DCC:
	.long D_060DB318
.L06010DD0:
	.long snd_seq_start
.L06010DD4:
	.long math_atan2
.L06010DD8:
	add	#1,r3
	dt	r8
	bf/s	.L06010D3A
	add	#4,r2
.L06010DE0:
	rts
	nop
	endlabel func_06010C6C

	glabel func_06010DE4
	sts.l	pr,@-r15
	mov.l	.L06010E30,r14
	mov	#13,r2
	mov.l	@r14,r14
	shll8	r2
	mov.l	@(48,r14),r0
	shll16	r2
	cmp/gt	r2,r0
	bt	.L06010E94
	mov.l	r0,@(48,r1)
	mov.l	@(48,r14),r2
	mov.l	@(56,r14),r3
	mov.l	r2,@(48,r1)
	mov.l	r3,@(56,r1)
	mov.l	.L06010E34,r2
	mov.w	@r2,r0
	tst	r0,r0
	bt	.L06010E94
	cmp/pl	r0
	bt	.L06010E40
	mov.w	.L06010E2A,r11
	mov	#127,r12
	mov.l	.L06010E38,r0
	jsr	@r0
	nop
	bt	.L06010E94
	mov	#3,r8
	mov.w	.L06010E2C,r9
	mov	#3,r5
	mov	#10,r6
	mov.l	.L06010E3C,r0
	jsr	@r0
	mov	#6,r4
	bra	.L06010E94
	nop
.L06010E2A:
	.short 0x0080
.L06010E2C:
	.short 0x005A
	.byte 0x00, 0x00
.L06010E30:
	.long player_obj
.L06010E34:
	.long D_060DB560
.L06010E38:
	.long snd_calc_distance_volume
.L06010E3C:
	.long snd_play_positional
.L06010E40:
	mov	#0,r0
	mov.w	r0,@r2
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#3,r5
	mov	#11,r6
	mov.l	.L06010E80,r0
	jsr	@r0
	mov	#6,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@(544,gbr),r0
	mov.l	@(48,r14),r2
	jsr	@r0
	mov.l	@(56,r14),r3
	sub	r4,r5
	mov	#12,r2
	shll16	r2
	cmp/gt	r2,r5
	bt	.L06010E94
	mov.b	@(6,r14),r0
	tst	r0,r0
	bf	.L06010E88
	mov.l	.L06010E84,r0
	jmp	@r0
	lds.l	@r15+,pr
.L06010E80:
	.long snd_seq_start
.L06010E84:
	.long func_06024BAC
.L06010E88:
	mov	#1,r0
	mov.l	r0,@(16,gbr)
	mov.l	@(8,r14),r14
	mov.b	@(1,r14),r0
	or	#48,r0
	mov.b	r0,@(1,r14)
.L06010E94:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06010DE4

	glabel func_06010E9A
	mov.l	.L06010EC4,r2
	mov.l	.L06010EC8,r3
	mov.l	@r2,r2
	mov.l	@r2,r4
	mov.l	@(4,r2),r5
	mov.l	r4,@r3
	mov.l	r5,@(4,r3)
	mov.l	r5,@(8,r3)
	mov	#0,r0
	mov.l	r0,@(12,r3)
	mov.l	r0,@(16,r3)
	mov	#120,r0
	shll	r0
	mov.w	r0,@(20,r3)
	mova	.L06010EBC,r0
	mov.l	r0,@(4,r1)
	nop
.L06010EBC:
	mov.l	.L06010ECC,r0
	jmp	@r0
	mov	#7,r3
	.byte 0x00, 0x00
.L06010EC4:
	.long D_060D9300
.L06010EC8:
	.long D_060DB564
.L06010ECC:
	.long func_06010ED0
	endlabel func_06010E9A

	glabel func_06010ED0
	mov.b	@(25,gbr),r0
	cmp/pz	r0
	bt	.L06010F40
	mov.l	.L06010EFC,r2
	mov.w	@(20,r2),r0
	dt	r0
	mov.w	r0,@(20,r2)
	bf	.L06010EE6
	mov.w	r0,@(16,r2)
	mov	r3,r0
	mov.w	r0,@(20,r2)
.L06010EE6:
	mov.w	@(16,r2),r0
	cmp/pz	r0
	bf	.L06010F40
	mov.l	@r2,r3
	mov.l	@(r0,r3),r3
	cmp/pz	r3
	bt	.L06010F00
	mov	r3,r0
	bra	.L06010F40
	mov.w	r0,@(16,r2)
	.byte 0x00, 0x00
.L06010EFC:
	.long D_060DB564
.L06010F00:
	add	#4,r0
	mov.w	r0,@(16,r2)
	mov.l	r3,@(12,r2)
	mov.l	@(8,r2),r3
	mov.l	@r3+,r4
	cmp/pz	r4
	bt	.L06010F14
	mov.l	@(4,r2),r3
	mov.l	r3,@(8,r2)
	mov.l	@r3+,r4
.L06010F14:
	mov.l	@r3+,r0
	mov.l	r3,@(8,r2)
	mov.l	.L06010F44,r2
.L06010F1A:
	mov.l	@r4+,r5
	mov.l	@r4+,r6
	mov.l	@r4+,r7
	mov.l	@r4+,r8
	mov.l	@r4+,r9
	mov.l	@r4+,r10
	mov.l	@r4+,r11
	mov.l	@r4+,r12
	mov.l	r5,@r2
	mov.l	r6,@(4,r2)
	mov.l	r7,@(8,r2)
	mov.l	r8,@(12,r2)
	mov.l	r9,@(16,r2)
	mov.l	r10,@(20,r2)
	mov.l	r11,@(24,r2)
	mov.l	r12,@(28,r2)
	dt	r0
	bf/s	.L06010F1A
	add	#32,r2
.L06010F40:
	rts
	nop
.L06010F44:
	.long BIOS_WORK_HI + 0x1C00
	endlabel func_06010ED0

	.section .data.06010F48,"aw",@progbits
	.p2align 2
	dlabel D_06010F48
	.long lbl_0600F4F4
	.long D_06010F64
	.byte 0x00, 0x00, 0x00, 0x00
	.long lbl_0600F6E2
	.long D_06010F64
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_06010F64
	.byte 0x00, 0x09, 0x30, 0x18, 0x00, 0x09, 0x30, 0x1C, 0x00, 0x09, 0x00, 0x09
	dlabel D_06010F70
	.byte 0x11, 0x63, 0x00, 0x00, 0x16, 0xFD, 0x00, 0x00, 0x06, 0x83, 0x00, 0x00, 0x11, 0x7D, 0x00, 0x00
	.byte 0x16, 0xDF, 0x00, 0x00, 0x08, 0x13, 0x00, 0x00, 0x0C, 0x1F, 0x00, 0x00
	.long D_0609ACB0
	.byte 0x16, 0xE0, 0x00, 0x00, 0x07, 0x60, 0x00, 0x00, 0x0D, 0xE0, 0x00, 0x00
	.long D_0609B5FC
	.byte 0x16, 0x20, 0x00, 0x00, 0x06, 0x20, 0x00, 0x00, 0x10, 0xC0, 0x00, 0x00
	.long D_0609BF48
	.byte 0x13, 0x40, 0x00, 0x00
	.long VDP2_VRAM_CACHED
	.byte 0x10, 0xE0, 0x00, 0x00
	.long D_0609C894
	.byte 0x12, 0x00, 0x00, 0x00, 0x07, 0x7F, 0x00, 0x00, 0x0E, 0xC0, 0x00, 0x00
	.long D_0609CE60
	.byte 0x11, 0x80, 0x00, 0x00, 0x08, 0xC0, 0x00, 0x00, 0x0C, 0x60, 0x00, 0x00
	.long D_0609DA4C
	.byte 0x11, 0x80, 0x00, 0x00, 0x0A, 0x40, 0x00, 0x00, 0x09, 0x20, 0x00, 0x00
	.long D_0609E638
	.byte 0x11, 0xE0, 0x00, 0x00, 0x0A, 0x9F, 0x00, 0x00, 0x06, 0xE0, 0x00, 0x00
	.long D_0609EB24
	dlabel D_06011000
	.byte 0x16, 0xC2, 0x00, 0x00, 0x16, 0xFC, 0x00, 0x00, 0x0B, 0x9F, 0x00, 0x00, 0x0C, 0xA1, 0x00, 0x00
	.byte 0x16, 0xC3, 0x00, 0x00, 0x16, 0xFD, 0x00, 0x00, 0x0C, 0xA0, 0x00, 0x00, 0x0F, 0x22, 0x00, 0x00
	.byte 0x14, 0x9F, 0x00, 0x00, 0x16, 0xFD, 0x00, 0x00, 0x0F, 0x20, 0x00, 0x00, 0x11, 0x7D, 0x00, 0x00
	.byte 0x12, 0x3B, 0x00, 0x00, 0x14, 0xA0, 0x00, 0x00, 0x0F, 0x34, 0x00, 0x00, 0x11, 0x7D, 0x00, 0x00
	.byte 0x11, 0x63, 0x00, 0x00, 0x12, 0x78, 0x00, 0x00, 0x0D, 0xFE, 0x00, 0x00, 0x0F, 0x35, 0x00, 0x00
	.byte 0x11, 0x63, 0x00, 0x00, 0x11, 0x9D, 0x00, 0x00, 0x0A, 0xBE, 0x00, 0x00, 0x0D, 0xFF, 0x00, 0x00
	.byte 0x11, 0x63, 0x00, 0x00, 0x11, 0x9D, 0x00, 0x00, 0x07, 0x7E, 0x00, 0x00, 0x0A, 0xBF, 0x00, 0x00
	.byte 0x11, 0x63, 0x00, 0x00, 0x12, 0x7F, 0x00, 0x00, 0x06, 0x83, 0x00, 0x00, 0x07, 0x7F, 0x00, 0x00
	dlabel D_06011080
	.byte 0x02, 0x40, 0x00, 0x00, 0x0B, 0xBF, 0x00, 0x00, 0x01, 0xDF, 0x00, 0x00, 0x10, 0xFF, 0x00, 0x00
	.byte 0x09, 0x20, 0x00, 0x00, 0x0A, 0xCA, 0x00, 0x00, 0x0D, 0xA0, 0x00, 0x00
	.long D_060A4804
	.byte 0x09, 0x20, 0x00, 0x00, 0x0B, 0x95, 0x00, 0x00, 0x0B, 0xE0, 0x00, 0x00
	.long D_060A5204
	.byte 0x0A, 0xE0, 0x00, 0x00, 0x0C, 0x81, 0x00, 0x00, 0x0B, 0xE0, 0x00, 0x00
	.long D_060A5C04
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0D, 0x01, 0x00, 0x00, 0x0D, 0x80, 0x00, 0x00
	.long D_060A6310
	.byte 0x0A, 0x60, 0x00, 0x00, 0x0D, 0x91, 0x00, 0x00, 0x0F, 0xA0, 0x00, 0x00
	.long D_060A6D10
	.byte 0x07, 0xA0, 0x00, 0x00, 0x0E, 0x89, 0x00, 0x00, 0x0F, 0xA0, 0x00, 0x00
	.long D_060A7710
	.byte 0x06, 0x60, 0x00, 0x00, 0x0F, 0xDD, 0x00, 0x00, 0x03, 0x3F, 0x00, 0x00
	.long D_060A8110
	.byte 0x03, 0xA0, 0x00, 0x00, 0x0F, 0x66, 0x00, 0x00, 0x03, 0x3F, 0x00, 0x00
	.long D_060A8B10
	.byte 0x03, 0xA0, 0x00, 0x00, 0x0F, 0xF2, 0x00, 0x00
	.long BIOS_WORK
	.long D_060A9510
	dlabel D_06011120
	.byte 0x08, 0x40, 0x00, 0x00, 0x0A, 0x03, 0x00, 0x00, 0x0C, 0xBF, 0x00, 0x00, 0x0E, 0x7F, 0x00, 0x00
	.byte 0x08, 0x40, 0x00, 0x00, 0x0A, 0x01, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x0C, 0xC1, 0x00, 0x00
	.byte 0x09, 0xFF, 0x00, 0x00, 0x0B, 0xBF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x0C, 0xC1, 0x00, 0x00
	.byte 0x0A, 0x40, 0x00, 0x00, 0x0B, 0xBF, 0x00, 0x00, 0x0C, 0xBF, 0x00, 0x00, 0x0E, 0x41, 0x00, 0x00
	.byte 0x08, 0xFF, 0x00, 0x00, 0x0B, 0xBF, 0x00, 0x00, 0x0E, 0x3F, 0x00, 0x00, 0x10, 0xFF, 0x00, 0x00
	.byte 0x06, 0x41, 0x00, 0x00, 0x09, 0x01, 0x00, 0x00, 0x0E, 0x3E, 0x00, 0x00, 0x10, 0xFF, 0x00, 0x00
	.byte 0x04, 0xFF, 0x00, 0x00, 0x07, 0xC0, 0x00, 0x00, 0x01, 0xDF, 0x00, 0x00, 0x04, 0xA1, 0x00, 0x00
	.byte 0x02, 0x40, 0x00, 0x00, 0x05, 0x01, 0x00, 0x00, 0x01, 0xDF, 0x00, 0x00, 0x04, 0xA0, 0x00, 0x00
	.byte 0x02, 0x40, 0x00, 0x00, 0x05, 0x02, 0x00, 0x00, 0x04, 0x9F, 0x00, 0x00, 0x07, 0x5F, 0x00, 0x00
	dlabel D_060111B0
	.byte 0x02, 0x00, 0x04, 0x00, 0x02, 0x00, 0x06, 0x00, 0x02, 0x00, 0x04, 0x00, 0x02, 0x00, 0x04, 0x00
	.byte 0x02, 0x80, 0x04, 0x00, 0x02, 0x00, 0x04, 0x00, 0x07, 0x00, 0x04, 0x00, 0x07, 0x00, 0x04, 0x00
