	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06017400,"ax",@progbits
	.p2align 2

	glabel func_06017400
	mov.l	@(48,r1),r4
	mov.l	@(56,r1),r5
	mov.b	@(30,gbr),r0
	mov	r0,r7
	dmuls.l	r8,r8
	sts	mach,r8
.L0601740C:
	mov.l	.L0601743C,r9
	mov	r7,r0
	shll2	r0
	add	r0,r9
	mov.l	@r9,r9
	mov.l	@(48,r9),r0
	sub	r4,r0
	dmuls.l	r0,r0
	sts	mach,r10
	cmp/ge	r8,r10
	bt	.L06017430
	mov.l	@(56,r9),r0
	sub	r5,r0
	dmuls.l	r0,r0
	sts	mach,r0
	add	r0,r10
	cmp/ge	r8,r10
	bf	.L06017436
.L06017430:
	add	#-1,r7
	cmp/pz	r7
	bt	.L0601740C
.L06017436:
	rts
	mov	r7,r0
	.byte 0x00, 0x00
.L0601743C:
	.long D_060F3064
	endlabel func_06017400

	glabel func_06017440
	dmuls.l	r4,r4
	sts	mach,r0
	cmp/ge	r8,r0
	bt	.L06017456
	dmuls.l	r5,r5
	sts	mach,r9
	add	r9,r0
	cmp/ge	r8,r0
	bt	.L06017456
	rts
	mov	#0,r0
.L06017456:
	rts
	mov	#-1,r0
	endlabel func_06017440

	glabel func_0601745A
	sts.l	pr,@-r15
	mov.b	@(30,gbr),r0
	mov	r0,r14
	mov.l	r5,@-r15
	mov.l	r4,@-r15
.L06017464:
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	.L060174D4,r6
	mov	r14,r0
	shll2	r0
	add	r0,r6
	mov.l	@r6,r6
	mov	#31,r0
	mov.b	@(r0,r1),r8
	mov.b	@(r0,r6),r9
	cmp/eq	r8,r9
	bf	.L060174C2
	mov.l	@(52,r6),r7
	mov.l	@(60,r6),r6
	mov.l	.L060174D8,r10
	mov	r14,r0
	shll8	r0
	shll2	r0
	shll2	r0
	add	r0,r10
	mov.l	.L060174DC,r0
	add	r14,r0
	add	r14,r0
	mov.w	@r0,r0
	add	#-16,r0
	mov.w	.L060174D2,r11
	and	r11,r0
	add	r0,r10
	mov.w	@(12,r10),r0
	shll16	r0
	mov	r0,r8
	mov.l	@(4,r10),r9
	mov	r8,r0
	sub	r6,r0
	mov	#32,r10
	shll16	r10
	cmp/ge	r10,r0
	bt	.L060174C2
	neg	r10,r10
	cmp/gt	r10,r0
	bf	.L060174C2
	bsr	func_060174E0
	nop
	cmp/pz	r0
	bt	.L060174C8
.L060174C2:
	add	#-1,r14
	cmp/pz	r14
	bt	.L06017464
.L060174C8:
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	lds.l	@r15+,pr
	rts
	mov	r14,r0
.L060174D2:
	.short 0x0FF0
.L060174D4:
	.long D_060F3064
.L060174D8:
	.long D_060F1000
.L060174DC:
	.long D_060F3060
	endlabel func_0601745A

	glabel func_060174E0
	mov.l	.L06017524,r0
	and	r0,r6
	and	r0,r7
	and	r0,r8
	and	r0,r9
	sub	r2,r4
	sub	r3,r5
	sub	r2,r6
	sub	r3,r7
	dmuls.l	r6,r5
	sts	mach,r0
	sts	macl,r6
	xtrct	r0,r6
	dmuls.l	r7,r4
	sts	mach,r0
	sts	macl,r7
	xtrct	r0,r7
	sub	r6,r7
	sub	r2,r8
	sub	r3,r9
	dmuls.l	r8,r5
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	dmuls.l	r9,r4
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	sub	r8,r9
	xor	r7,r9
	cmp/pz	r9
	bf	.L06017528
	rts
	mov	#-1,r0
.L06017524:
	.long 0xFFFF0000
.L06017528:
	rts
	mov	#0,r0
	endlabel func_060174E0

	glabel func_0601752C
	mov.l	r1,@-r15
	sts.l	pr,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	@r8+,r1
	sub	r4,r1
	mov.l	@r8+,r2
	sub	r5,r2
	mov.l	@r8+,r3
	sub	r6,r3
	mov.l	@r9+,r0
	neg	r4,r4
	add	r0,r4
	mov.l	@r9+,r0
	neg	r5,r5
	add	r0,r5
	mov.l	@r9+,r0
	neg	r6,r6
	add	r0,r6
	tst	r12,r12
	bt	.L06017560
	mov.l	.L060175B0,r10
	jsr	@r10
	mov	r12,r0
	bsr	func_06017BD0
	nop
.L06017560:
	tst	r13,r13
	bt	.L0601756E
	mov.l	.L060175B0,r10
	jsr	@r10
	mov	r13,r0
	bsr	func_06017C1E
	nop
.L0601756E:
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	xor	r4,r1
	cmp/pz	r1
	bt	.L060175B4
	mov.w	@r8+,r0
	tst	r0,r0
	bt	.L060175A4
	dmuls.l	r9,r0
	sts	macl,r0
	cmp/ge	r0,r6
	bf	.L060175B4
	mov.w	@r8+,r0
	dmuls.l	r9,r0
	sts	macl,r0
	cmp/ge	r0,r5
	bf	.L060175B4
	mov.w	@r8+,r0
	dmuls.l	r9,r0
	sts	macl,r0
	cmp/gt	r0,r6
	bt	.L060175B4
	mov.w	@r8+,r0
	dmuls.l	r9,r0
	sts	macl,r0
	cmp/gt	r0,r5
	bt	.L060175B4
.L060175A4:
	mov	#0,r0
	lds.l	@r15+,pr
	mov.l	@r15+,r1
	rts
	nop
	.byte 0x00, 0x00
.L060175B0:
	.long func_06007BD8
.L060175B4:
	mov	#-1,r0
	lds.l	@r15+,pr
	mov.l	@r15+,r1
	rts
	nop
	endlabel func_0601752C

	glabel func_060175BE
	sts.l	pr,@-r15
	mov.b	@(30,gbr),r0
	mov	r0,r7
.L060175C4:
	mov.l	.L06017620,r9
	mov	r7,r0
	shll2	r0
	add	r0,r9
	mov.l	@r9,r9
	add	#48,r9
	mov.l	.L06017624,r8
	mov	r7,r0
	shll8	r0
	shll2	r0
	shll2	r0
	add	r0,r8
	mov.l	.L06017628,r0
	add	r7,r0
	add	r7,r0
	mov.w	@r0,r0
	add	#-16,r0
	mov.w	.L0601761C,r11
	and	r11,r0
	add	r0,r8
	tst	r7,r7
	bt	.L060175FA
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
.L060175FA:
	bsr	func_0601752C
	nop
	tst	r7,r7
	bt	.L0601760C
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L0601760C:
	cmp/pz	r0
	bt	.L06017616
	add	#-1,r7
	cmp/pz	r7
	bt	.L060175C4
.L06017616:
	lds.l	@r15+,pr
	rts
	mov	r7,r0
.L0601761C:
	.short 0x0FF0
	.byte 0x00, 0x00
.L06017620:
	.long D_060F3064
.L06017624:
	.long D_060F1000
.L06017628:
	.long D_060F3060
	endlabel func_060175BE

	glabel func_0601762C
	sts.l	pr,@-r15
	mov.l	@r8+,r0
	neg	r4,r4
	add	r0,r4
	mov.l	@r8+,r0
	neg	r5,r5
	add	r0,r5
	mov.l	@r8+,r0
	neg	r6,r6
	add	r0,r6
	tst	r12,r12
	bt	.L0601764E
	mov.l	.L060176B4,r10
	jsr	@r10
	mov	r12,r0
	bsr	func_06017B7C
	nop
.L0601764E:
	tst	r13,r13
	bt	.L0601765C
	mov.l	.L060176B4,r10
	jsr	@r10
	mov	r13,r0
	bsr	func_06017BA6
	nop
.L0601765C:
	mov.w	@r2+,r8
	mov.w	@r2+,r10
	dmuls.l	r3,r10
	sts	macl,r10
	mov	#32,r0
	shll16	r0
	sub	r0,r10
	cmp/ge	r10,r5
	bf	.L060176F4
	mov.w	@r2+,r10
	dmuls.l	r3,r10
	sts	macl,r10
	add	r0,r10
	cmp/gt	r10,r5
	bt	.L060176F4
	tst	r8,r8
	bf	.L060176B8
	mov.w	@r2+,r8
	dmuls.l	r3,r8
	sts	macl,r8
	sub	r8,r4
	mov.w	@r2+,r8
	dmuls.l	r3,r8
	sts	macl,r8
	sub	r8,r6
	mov.w	@r2+,r8
	dmuls.l	r3,r8
	sts	macl,r8
	mov	#8,r0
	shll16	r0
	add	r0,r8
	dmuls.l	r8,r8
	sts	mach,r8
	dmuls.l	r4,r4
	sts	mach,r0
	cmp/ge	r8,r0
	bt	.L060176F4
	dmuls.l	r6,r6
	sts	mach,r9
	add	r9,r0
	cmp/ge	r8,r0
	bt	.L060176F4
	bra	.L060176EC
	nop
.L060176B4:
	.long func_06007BD8
.L060176B8:
	mov.w	@r2+,r10
	dmuls.l	r3,r10
	sts	macl,r10
	mov	#8,r0
	shll16	r0
	sub	r0,r10
	cmp/ge	r10,r4
	bf	.L060176F4
	mov.w	@r2+,r10
	dmuls.l	r3,r10
	sts	macl,r10
	sub	r0,r10
	cmp/ge	r10,r6
	bf	.L060176F4
	mov.w	@r2+,r10
	dmuls.l	r3,r10
	sts	macl,r10
	add	r0,r10
	cmp/gt	r10,r4
	bt	.L060176F4
	mov.w	@r2+,r10
	dmuls.l	r3,r10
	sts	macl,r10
	add	r0,r10
	cmp/gt	r10,r6
	bt	.L060176F4
.L060176EC:
	mov	#0,r0
	lds.l	@r15+,pr
	rts
	nop
.L060176F4:
	mov	#-1,r0
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_0601762C

	glabel func_060176FC
	mov.l	r1,@-r15
	sts.l	pr,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	@r8+,r1
	sub	r4,r1
	mov.l	@r8+,r2
	sub	r5,r2
	mov.l	@r8+,r3
	sub	r6,r3
	mov.l	@r9+,r0
	neg	r4,r4
	add	r0,r4
	mov.l	@r9+,r0
	neg	r5,r5
	add	r0,r5
	mov.l	@r9+,r0
	neg	r6,r6
	add	r0,r6
	mov	#2,r0
	shll16	r0
	add	r0,r5
	tst	r12,r12
	bt	.L0601773C
	mov.l	.L060177C4,r10
	jsr	@r10
	mov	r12,r0
	bsr	func_06017BD0
	nop
.L0601773C:
	tst	r13,r13
	bt	.L0601774A
	mov.l	.L060177C4,r10
	jsr	@r10
	mov	r13,r0
	bsr	func_06017C1E
	nop
.L0601774A:
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.w	@r8+,r10
	mov.w	@r8+,r12
	dmuls.l	r9,r12
	sts	macl,r12
	mov	#32,r0
	shll16	r0
	sub	r0,r12
	cmp/ge	r12,r5
	bf	.L0601785C
	mov.w	@r8+,r13
	dmuls.l	r9,r13
	sts	macl,r13
	add	r0,r13
	cmp/gt	r13,r5
	bt	.L0601785C
	tst	r10,r10
	bf	.L06017868
	mov.w	@(0,r8),r0
	dmuls.l	r9,r0
	sts	macl,r10
	sub	r10,r4
	mov.w	@(2,r8),r0
	dmuls.l	r9,r0
	sts	macl,r11
	sub	r11,r6
	mov.w	@(4,r8),r0
	dmuls.l	r9,r0
	sts	macl,r14
	mov	#8,r0
	shll16	r0
	add	r0,r14
	dmuls.l	r14,r14
	sts	mach,r9
	dmuls.l	r4,r4
	sts	mach,r0
	cmp/ge	r9,r0
	bt	.L0601785C
	dmuls.l	r6,r6
	sts	mach,r1
	add	r1,r0
	cmp/ge	r9,r0
	bt	.L0601785C
	mov	#4,r0
	shll16	r0
	add	r12,r0
	cmp/gt	r0,r2
	bt	.L060177C8
	mov	#-4,r0
	shll16	r0
	add	r13,r0
	cmp/ge	r0,r2
	bt	.L060177DC
	mov	#4,r14
	add	r10,r4
	add	r11,r6
	bra	.L06017818
	mov	r12,r5
.L060177C4:
	.long func_06007BD8
.L060177C8:
	mov	#-4,r0
	shll16	r0
	add	r13,r0
	cmp/ge	r0,r2
	bf	.L060177DC
	mov	#2,r14
	add	r10,r4
	add	r11,r6
	bra	.L06017818
	mov	r13,r5
.L060177DC:
	mov	r4,r2
	mov	r6,r3
	mov	r10,r4
	mov	r11,r6
	mov	r14,r12
	mov.l	.L06017810,r0
	jsr	@r0
	nop
	mov.l	.L06017814,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r10,r12
	sts	mach,r0
	sts	macl,r10
	xtrct	r0,r10
	dmuls.l	r11,r12
	sts	mach,r0
	sts	macl,r11
	xtrct	r0,r11
	add	r11,r4
	add	r10,r6
	mov	#1,r14
	bra	.L06017818
	nop
.L06017810:
	.long func_06007C1C
.L06017814:
	.long func_06007BD8
.L06017818:
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	tst	r13,r13
	bt	.L0601782A
	mov.l	.L06017858,r10
	jsr	@r10
	neg	r13,r0
	bsr	func_06017BA6
	nop
.L0601782A:
	tst	r12,r12
	bt	.L06017838
	mov.l	.L06017858,r10
	jsr	@r10
	neg	r12,r0
	bsr	func_06017B7C
	nop
.L06017838:
	mov	r4,r12
	mov	r6,r13
	mov.l	@r15+,r1
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	r14,@-r15
	and	r7,r14
	add	r1,r4
	add	r2,r5
	add	r3,r6
	mov	r14,r0
	mov.l	@r15+,r14
	lds.l	@r15+,pr
	mov.l	@r15+,r1
	rts
	nop
.L06017858:
	.long func_06007BD8
.L0601785C:
	add	#20,r15
	mov	#-1,r0
	lds.l	@r15+,pr
	mov.l	@r15+,r1
	rts
	nop
.L06017868:
	mov.w	@r8+,r10
	dmuls.l	r9,r10
	sts	macl,r10
	mov	#8,r0
	shll16	r0
	sub	r0,r10
	cmp/ge	r10,r4
	bf	.L0601785C
	mov.w	@r8+,r11
	dmuls.l	r9,r11
	sts	macl,r11
	sub	r0,r11
	cmp/ge	r11,r6
	bf	.L0601785C
	mov.w	@r8+,r14
	dmuls.l	r9,r14
	sts	macl,r14
	add	r0,r14
	cmp/gt	r14,r4
	bt	.L0601785C
	mov.w	@r8+,r8
	dmuls.l	r9,r8
	sts	macl,r8
	add	r0,r8
	cmp/gt	r8,r6
	bt	.L0601785C
	mov	r11,r9
	mov	r8,r11
	mov	r10,r8
	mov	r14,r10
	mov	#4,r0
	shll16	r0
	add	r12,r0
	cmp/gt	r0,r2
	bt	.L060178BE
	mov	#-4,r0
	shll16	r0
	add	r13,r0
	cmp/ge	r0,r2
	bt	.L060178CE
	mov	#4,r14
	bra	.L06017818
	mov	r12,r5
.L060178BE:
	mov	#-4,r0
	shll16	r0
	add	r13,r0
	cmp/ge	r0,r2
	bf	.L060178CE
	mov	#2,r14
	bra	.L06017818
	mov	r13,r5
.L060178CE:
	mov	#4,r0
	shll16	r0
	add	r8,r0
	cmp/gt	r0,r1
	bf	.L060178F0
	mov	#-4,r0
	shll16	r0
	add	r10,r0
	cmp/ge	r0,r1
	bt	.L060178FC
	mov	#4,r0
	shll16	r0
	add	r9,r0
	cmp/gt	r0,r3
	bf	.L06017940
	bra	.L06017948
	nop
.L060178F0:
	cmp/gt	r9,r3
	bf	.L06017908
	cmp/ge	r11,r3
	bt	.L06017916
	bra	.L06017950
	nop
.L060178FC:
	cmp/gt	r9,r3
	bf	.L06017924
	cmp/ge	r11,r3
	bt	.L06017932
	bra	.L06017958
	nop
.L06017908:
	mov	r8,r12
	bsr	func_06017960
	mov	r9,r13
	cmp/pz	r0
	bt	.L06017940
	bra	.L06017950
	nop
.L06017916:
	mov	r8,r12
	bsr	func_06017960
	mov	r11,r13
	cmp/pz	r0
	bt	.L06017950
	bra	.L06017948
	nop
.L06017924:
	mov	r10,r12
	bsr	func_06017960
	mov	r9,r13
	cmp/pz	r0
	bt	.L06017958
	bra	.L06017940
	nop
.L06017932:
	mov	r10,r12
	bsr	func_06017960
	mov	r11,r13
	cmp/pz	r0
	bt	.L06017948
	bra	.L06017958
	nop
.L06017940:
	mov	r9,r6
	mov	#1,r14
	bra	.L06017818
	nop
.L06017948:
	mov	r11,r6
	mov	#1,r14
	bra	.L06017818
	nop
.L06017950:
	mov	r8,r4
	mov	#1,r14
	bra	.L06017818
	nop
.L06017958:
	mov	r10,r4
	mov	#1,r14
	bra	.L06017818
	nop
	endlabel func_060176FC

	glabel func_06017960
	sub	r1,r12
	sub	r3,r13
	mov	r6,r14
	sub	r3,r14
	dmuls.l	r12,r14
	sts	mach,r0
	sts	macl,r14
	xtrct	r0,r14
	mov.l	r14,@-r15
	mov	r4,r14
	sub	r1,r14
	dmuls.l	r13,r14
	sts	mach,r14
	sts	macl,r0
	xtrct	r14,r0
	mov.l	@r15+,r14
	rts
	sub	r14,r0
	endlabel func_06017960

	glabel func_06017984
	mov.l	.L060179B0,r8
	mov.l	@r8,r8
	mov	#30,r9
	add	r9,r8
	add	r1,r9
	mov.b	@r9,r0
	tst	#8,r0
	bt	.L060179AA
	and	#247,r0
	mov.b	r0,@r9
	mov.b	@r8,r0
	tst	#8,r0
	bt	.L060179AA
	and	#247,r0
	mov.b	r0,@r8
	add	#-30,r8
	mov.l	@(8,r8),r8
	mov	#1,r0
	mov.b	r0,@(8,r8)
.L060179AA:
	rts
	nop
	.byte 0x00, 0x00
.L060179B0:
	.long D_060F3064
	endlabel func_06017984

	glabel func_060179B4
	sts.l	pr,@-r15
	mov.l	.L06017A1C,r9
	mov.l	@r9,r9
	add	#48,r9
	mov.l	.L06017A20,r8
	mov.l	.L06017A24,r0
	mov.w	@r0,r0
	add	#-16,r0
	mov.w	.L06017A18,r11
	and	r11,r0
	add	r0,r8
	bsr	func_060176FC
	nop
	cmp/pz	r0
	bf	.L06017A90
	mov.l	.L06017A1C,r9
	mov.l	@r9,r9
	tst	r0,r0
	bt	.L06017A28
	mov.l	@(36,r9),r0
	cmp/pz	r0
	bf	.L06017A90
	mov.l	.L06017A20,r8
	mov.l	.L06017A24,r0
	mov.w	@r0,r0
	add	r0,r8
	mov.l	r4,@(0,r8)
	mov.l	r5,@(4,r8)
	mov.l	r6,@(8,r8)
	mov.l	r4,@(48,r9)
	mov.l	r5,@(52,r9)
	mov.l	r6,@(56,r9)
	mov	#30,r10
	mov	r10,r11
	add	r1,r10
	add	r9,r11
	mov.b	@r10,r0
	or	#8,r0
	mov.b	r0,@r10
	mov.b	@r11,r0
	or	#8,r0
	mov.b	r0,@r11
	mov.l	@(12,r9),r10
	mov	#0,r0
	mov.w	r0,@(4,r10)
	mov.l	r0,@(588,gbr)
	mov	#1,r0
	lds.l	@r15+,pr
	rts
	nop
.L06017A18:
	.short 0x0FF0
	.byte 0x00, 0x00
.L06017A1C:
	.long D_060F3064
.L06017A20:
	.long D_060F1000
.L06017A24:
	.long D_060F3060
.L06017A28:
	mov.l	.L06017A80,r8
	mov.l	.L06017A84,r0
	mov.w	@r0,r0
	add	r0,r8
	mov.l	r4,@(0,r8)
	mov.l	r5,@(4,r8)
	mov.l	r6,@(8,r8)
	mov.l	r4,@(48,r9)
	mov.l	r5,@(52,r9)
	mov.l	r6,@(56,r9)
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov	#31,r0
	mov.b	@(r0,r1),r0
	mov.l	.L06017A88,r6
	jsr	@r6
	mov.l	@(60,r1),r3
	mov	r12,r0
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov	r12,r4
	mov	r13,r6
	mov.l	.L06017A8C,r10
	jsr	@r10
	nop
	bsr	func_06017B7C
	nop
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@(60,r1),r0
	add	r4,r0
	mov.l	r0,@(12,r8)
	mov.l	r0,@(60,r9)
	mov	#31,r0
	mov.b	@(r0,r1),r8
	mov.b	r8,@(r0,r9)
	mov	#0,r0
	lds.l	@r15+,pr
	rts
	nop
.L06017A80:
	.long D_060F1000
.L06017A84:
	.long D_060F3060
.L06017A88:
	.long func_06018EB4
.L06017A8C:
	.long func_06007BD8
.L06017A90:
	mov	#-1,r0
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_060179B4

	glabel func_06017A98
	sts.l	pr,@-r15
	mov	#-1,r0
	mov.w	r0,@(100,gbr)
	mov	#0,r0
	mov.w	r0,@(102,gbr)
	mov.l	@r2+,r8
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	dmuls.l	r8,r3
	sts	macl,r8
	mov.l	.L06017B08,r14
	jsr	@r14
	nop
	cmp/pz	r0
	bt	.L06017B14
.L06017AC2:
	mov.w	@(100,gbr),r0
	cmp/eq	#1,r0
	bt	.L06017ACE
	mov.l	.L06017B0C,r0
	jsr	@r0
	nop
.L06017ACE:
	add	#32,r15
	mov.w	@(100,gbr),r0
	cmp/pz	r0
	bf	.L06017AFE
	mov.l	.L06017B10,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bf	.L06017AFE
	mov.l	.L06017B10,r4
	mov.l	@r4,r4
	mov.l	@(12,r4),r4
	mov.l	@(44,r4),r0
	mov	#4,r5
	shll16	r5
	cmp/ge	r5,r0
	bf	.L06017AF2
	mov.l	r5,@(44,r4)
.L06017AF2:
	mov.l	@(40,r4),r0
	mov	#4,r5
	shll16	r5
	cmp/ge	r5,r0
	bf	.L06017AFE
	mov.l	r5,@(40,r4)
.L06017AFE:
	mov.w	@(102,gbr),r0
	mov	r0,r14
	lds.l	@r15+,pr
	rts
	mov.w	@(100,gbr),r0
.L06017B08:
	.long func_060172DE
.L06017B0C:
	.long func_06017984
.L06017B10:
	.long D_060F3064
.L06017B14:
	mov.l	@(0,r15),r0
	mov.l	@r0+,r2
	cmp/pz	r2
	bf	.L06017AC2
	mov.l	r0,@(0,r15)
	mov.l	@(4,r15),r3
	mov.l	@(8,r15),r4
	mov.l	@(12,r15),r5
	mov.l	@(16,r15),r6
	mov.l	@(20,r15),r7
	mov.l	@(24,r15),r12
	mov.l	@(28,r15),r13
	bsr	func_060179B4
	nop
	cmp/eq	#1,r0
	bf	.L06017B3C
	mov.w	r0,@(100,gbr)
	mov	r14,r0
	bra	.L06017B14
	mov.w	r0,@(102,gbr)
.L06017B3C:
	tst	r0,r0
	bf	.L06017B4E
	mov.w	@(100,gbr),r0
	cmp/pl	r0
	bt	.L06017B4E
	mov	#0,r0
	mov.w	r0,@(100,gbr)
	mov	r14,r0
	mov.w	r0,@(102,gbr)
.L06017B4E:
	bra	.L06017B14
	nop
	endlabel func_06017A98

	glabel func_06017B52
	shll2	r10
	shll2	r11
	dmuls.l	r10,r6
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	dmuls.l	r10,r5
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r11,r5
	sts	mach,r0
	sts	macl,r5
	xtrct	r0,r5
	dmuls.l	r11,r6
	sts	mach,r0
	sts	macl,r6
	xtrct	r0,r6
	sub	r9,r6
	rts
	add	r8,r5
	endlabel func_06017B52

	glabel func_06017B7C
	shll2	r10
	shll2	r11
	dmuls.l	r10,r6
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	dmuls.l	r10,r4
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r11,r4
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	dmuls.l	r11,r6
	sts	mach,r0
	sts	macl,r6
	xtrct	r0,r6
	add	r9,r6
	rts
	sub	r8,r4
	endlabel func_06017B7C

	glabel func_06017BA6
	shll2	r10
	shll2	r11
	dmuls.l	r10,r5
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	dmuls.l	r10,r4
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r11,r4
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	dmuls.l	r11,r5
	sts	mach,r0
	sts	macl,r5
	xtrct	r0,r5
	sub	r9,r5
	rts
	add	r8,r4
	endlabel func_06017BA6

	glabel func_06017BD0
	shll2	r10
	shll2	r11
	dmuls.l	r10,r3
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	dmuls.l	r10,r1
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r11,r1
	sts	mach,r0
	sts	macl,r1
	xtrct	r0,r1
	dmuls.l	r11,r3
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	add	r9,r3
	sub	r8,r1
	dmuls.l	r10,r6
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	dmuls.l	r10,r4
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r11,r4
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	dmuls.l	r11,r6
	sts	mach,r0
	sts	macl,r6
	xtrct	r0,r6
	add	r9,r6
	rts
	sub	r8,r4
	endlabel func_06017BD0

	glabel func_06017C1E
	shll2	r10
	shll2	r11
	dmuls.l	r10,r2
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	dmuls.l	r10,r1
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r11,r1
	sts	mach,r0
	sts	macl,r1
	xtrct	r0,r1
	dmuls.l	r11,r2
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	sub	r9,r2
	add	r8,r1
	dmuls.l	r10,r5
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	dmuls.l	r10,r4
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r11,r4
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	dmuls.l	r11,r5
	sts	mach,r0
	sts	macl,r5
	xtrct	r0,r5
	sub	r9,r5
	rts
	add	r8,r4
	endlabel func_06017C1E

	glabel func_06017C6C
	dmuls.l	r4,r4
	sts	mach,r0
	cmp/ge	r8,r0
	bt	.L06017C8C
	dmuls.l	r5,r5
	sts	mach,r9
	add	r9,r0
	cmp/ge	r8,r0
	bt	.L06017C8C
	dmuls.l	r6,r6
	sts	mach,r9
	add	r9,r0
	cmp/ge	r8,r0
	bt	.L06017C8C
	rts
	mov	#0,r0
.L06017C8C:
	rts
	mov	#-1,r0
	endlabel func_06017C6C

	glabel func_06017C90
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.b	@(30,gbr),r0
	mov	r0,r7
	mov.l	r5,@-r15
	mov.l	r4,@-r15
.L06017C9E:
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	.L06017D0C,r2
	add	r7,r2
	mov.b	@r2,r0
	tst	r0,r0
	bt	.L06017D00
	mov.l	.L06017D10,r2
	mov	r7,r0
	shll2	r0
	add	r0,r2
	mov.l	@r2,r2
	mov.l	.L06017D14,r3
	mov	r7,r0
	shll2	r0
	add	r0,r3
	mov.l	@r3,r3
	mov.l	@(48,r3),r0
	sub	r0,r4
	mov.l	@(52,r3),r0
	sub	r0,r5
	mov.l	@(56,r3),r0
	sub	r0,r6
	mov.l	@(40,r3),r10
	mov	#8,r0
	cmp/gt	r0,r10
	bf	.L06017D00
	add	r8,r10
	muls.w	r10,r10
	sts	macl,r10
	dmuls.l	r4,r4
	sts	mach,r9
	cmp/ge	r10,r9
	bt	.L06017D00
	mov	r9,r0
	dmuls.l	r5,r5
	sts	mach,r9
	cmp/ge	r10,r9
	bt	.L06017D00
	add	r9,r0
	dmuls.l	r6,r6
	sts	mach,r9
	cmp/ge	r10,r9
	bt	.L06017D00
	add	r9,r0
	cmp/ge	r10,r0
	bf	.L06017D18
.L06017D00:
	add	#-1,r7
	cmp/pz	r7
	bt	.L06017C9E
	bra	.L06017D28
	nop
	.byte 0x00, 0x00
.L06017D0C:
	.long D_060F30EC
.L06017D10:
	.long D_060F3064
.L06017D14:
	.long D_060F3090
.L06017D18:
	mov.l	.L06017D30,r4
	mov.b	@r4,r0
	add	#1,r0
	mov	#127,r8
	cmp/gt	r8,r0
	bf	.L06017D26
	mov	r8,r0
.L06017D26:
	mov.b	r0,@r4
.L06017D28:
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	rts
	mov	r7,r0
.L06017D30:
	.long D_0604DBB2
	endlabel func_06017C90

	glabel func_06017D34
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov	r0,r7
	mov.l	.L06017D94,r2
	add	r7,r2
	mov.b	@r2,r0
	tst	r0,r0
	bt	.L06017D90
	mov.l	.L06017D98,r2
	mov	r7,r0
	shll2	r0
	add	r0,r2
	mov.l	@r2,r2
	mov.l	.L06017D9C,r3
	mov	r7,r0
	shll2	r0
	add	r0,r3
	mov.l	@r3,r3
	mov.l	@(48,r3),r0
	sub	r0,r4
	mov.l	@(52,r3),r0
	sub	r0,r5
	mov.l	@(56,r3),r0
	sub	r0,r6
	mov.l	@(40,r3),r10
	add	r8,r10
	muls.w	r10,r10
	sts	macl,r10
	dmuls.l	r4,r4
	sts	mach,r9
	cmp/ge	r10,r9
	bt	.L06017D90
	mov	r9,r0
	dmuls.l	r5,r5
	sts	mach,r9
	cmp/ge	r10,r9
	bt	.L06017D90
	add	r9,r0
	dmuls.l	r6,r6
	sts	mach,r9
	cmp/ge	r10,r9
	bt	.L06017D90
	add	r9,r0
	cmp/ge	r10,r0
	bf	.L06017DA0
.L06017D90:
	rts
	mov	#-1,r0
.L06017D94:
	.long D_060F30EC
.L06017D98:
	.long D_060F3064
.L06017D9C:
	.long D_060F3090
.L06017DA0:
	rts
	mov	r7,r0
	.byte 0x54, 0x1C, 0x55, 0x1D, 0x64, 0x49, 0x65, 0x59, 0x64, 0x4F, 0x65, 0x5F, 0x68, 0x43, 0x69, 0x53
	.byte 0x9A, 0x0D, 0x28, 0xA9, 0xEA, 0xC0, 0x28, 0xA9, 0x29, 0xA9, 0xDA, 0x05, 0x49, 0x21, 0x68, 0x88
	.byte 0x68, 0x8E, 0x48, 0x08, 0x3A, 0x8C, 0x3A, 0x9C, 0x60, 0xA0, 0x00, 0x0B, 0x60, 0x0B, 0x07, 0xFF
	.long D_06017DD8
	dlabel D_06017DD8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	endlabel func_06017D34

	glabel func_06017ED8
	sts.l	pr,@-r15
	mov.l	.L06017F68,r4
	mov.b	@(9,r1),r0
	shll2	r0
	add	r0,r4
	mov.l	@r4,r4
	mov	#0,r0
	mov.w	r0,@(18,r1)
	mov.w	r0,@(20,r1)
	mov.l	.L06017F6C,r2
	mov.b	r0,@r2
	mov.b	r0,@(1,r2)
	mov	#-1,r0
	mov.l	r0,@(32,r1)
	mov.l	r0,@(36,r1)
	mov.l	.L06017F70,r2
	mov.b	@(9,r1),r0
	shll	r0
	add	r0,r2
	mov	#0,r0
	mov.w	r0,@r2
	mov.w	.L06017F64,r7
	mov.l	.L06017F74,r2
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.l	@(48,r4),r8
	mov.l	@(52,r4),r9
	mov.l	@(56,r4),r10
	mov.l	@(60,r4),r0
	swap.w	r0,r12
	mov.w	@(26,r4),r0
	mov	r0,r11
.L06017F1E:
	mov.l	r8,@r2
	add	#4,r2
	mov.l	r9,@r2
	add	#4,r2
	mov.l	r10,@r2
	add	#4,r2
	mov.w	r12,@r2
	add	#2,r2
	mov.w	r11,@r2
	add	#2,r2
	dt	r7
	bf	.L06017F1E
	mov	#0,r0
	mov.w	r0,@(2,r1)
	mov.l	.L06017F78,r2
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll	r0
	add	r0,r2
	mov.w	.L06017F66,r7
	mov	#0,r0
.L06017F4A:
	mov.l	r0,@r2
	mov.l	r0,@(4,r2)
	mov.l	r0,@(8,r2)
	mov.l	r0,@(12,r2)
	dt	r7
	bf/s	.L06017F4A
	add	#16,r2
	mov.l	.L06017F7C,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L06017F64:
	.short 0x0100
.L06017F66:
	.short 0x004C
.L06017F68:
	.long D_060F3064
.L06017F6C:
	.long D_060F30EC
.L06017F70:
	.long D_060F3060
.L06017F74:
	.long D_060F1000
.L06017F78:
	.long D_060F6DF8
.L06017F7C:
	.long func_06017F80
	endlabel func_06017ED8

	glabel func_06017F80
	sts.l	pr,@-r15
	mov.l	.L06017FDC,r4
	mov.b	@(9,r1),r0
	shll2	r0
	add	r0,r4
	mov.l	@r4,r4
	mov.b	@(6,r4),r0
	tst	r0,r0
	bt	.L06017F98
	mov.l	@(8,r4),r12
	mov	#0,r0
	mov.b	r0,@(7,r12)
.L06017F98:
	mov.l	.L06017FE0,r2
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.l	.L06017FE4,r3
	mov.b	@(9,r1),r0
	shll	r0
	add	r0,r3
	mov.w	@r3,r0
	add	#16,r0
	mov.w	.L06017FD8,r8
	and	r8,r0
	mov.w	r0,@r3
	add	r0,r2
	mov.l	@(48,r4),r0
	mov.l	r0,@(0,r2)
	mov.l	@(52,r4),r0
	mov.l	r0,@(4,r2)
	mov.l	@(56,r4),r0
	mov.l	r0,@(8,r2)
	mov.l	@(60,r4),r0
	swap.w	r0,r0
	mov.w	r0,@(12,r2)
	mov.w	@(26,r4),r0
	mov.w	r0,@(14,r2)
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L06017FE8
	bra	.L060182B6
	nop
.L06017FD8:
	.short 0x0FF0
	.byte 0x00, 0x00
.L06017FDC:
	.long D_060F3064
.L06017FE0:
	.long D_060F1000
.L06017FE4:
	.long D_060F3060
.L06017FE8:
	mov.l	@(8,r4),r12
	mov.b	@(7,r12),r0
	tst	r0,r0
	bt	.L0601804A
	mov.b	@(9,r1),r0
	tst	r0,r0
	bf	.L06018024
	mov.l	r8,@-r15
	mov.l	r2,@-r15
	mov.l	r0,@-r15
	mov.l	.L06018020,r2
	mov	#0,r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.b	@(2,r2),r0
	mov	#100,r8
	cmp/gt	r0,r8
	bf	.L06018016
	mov	r8,r0
	mov.b	r0,@(2,r2)
	mov	#1,r0
	mov.b	r0,@(0,r2)
.L06018016:
	mov.l	@r15+,r0
	mov.l	@r15+,r2
	mov.l	@r15+,r8
	bra	.L0601804A
	nop
.L06018020:
	.long D_060FEA2C
.L06018024:
	mov.l	r8,@-r15
	mov.l	r2,@-r15
	mov.l	r0,@-r15
	mov.l	.L060180D0,r2
	mov	#1,r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.b	@(2,r2),r0
	mov	#100,r8
	cmp/gt	r0,r8
	bf	.L06018044
	mov	r8,r0
	mov.b	r0,@(2,r2)
	mov	#1,r0
	mov.b	r0,@(0,r2)
.L06018044:
	mov.l	@r15+,r0
	mov.l	@r15+,r2
	mov.l	@r15+,r8
.L0601804A:
	mov.l	@(8,r4),r12
	mov.b	@(7,r12),r0
	tst	r0,r0
	bt	.L060180BC
	mov.l	@(12,gbr),r0
	tst	#3,r0
	bf	.L060180BC
	mov.l	@(32,r4),r3
	mov.l	@(36,r4),r2
	dmuls.l	r2,r2
	sts	mach,r2
	dmuls.l	r3,r3
	sts	mach,r3
	add	r2,r3
	mov.l	.L060180D4,r0
	cmp/ge	r0,r3
	bf	.L060180BC
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L0601808A
	mov.l	.L060180D8,r0
	mov.l	@r0,r0
	mov.l	@(8,r0),r0
	mov.b	@(2,r0),r0
	tst	#1,r0
	bt	.L0601808A
	mov.l	.L060180DC,r0
	mov.l	@r0,r0
	mov.l	@(8,r0),r0
	mov.b	@(2,r0),r0
	tst	#1,r0
	bf	.L060180BC
.L0601808A:
	mov.l	.L060180E0,r2
	mov.l	.L060180E4,r0
	jsr	@r0
	nop
	mov.l	.L060180E8,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	@(48,r4),r0
	mov.l	r0,@(48,r3)
	mov.l	@(52,r4),r0
	mov.l	r0,@(52,r3)
	mov.l	@(56,r4),r0
	mov.l	r0,@(56,r3)
	mov.w	@(24,r4),r0
	mov.w	r0,@(24,r3)
	mov.l	r3,@-r15
	mov.l	@(32,r4),r3
	mov.l	@(36,r4),r2
	neg	r2,r2
	neg	r3,r3
	mov.l	.L060180EC,r0
	jsr	@r0
	nop
	mov.l	@r15+,r3
	mov.w	r0,@(26,r3)
.L060180BC:
	mov.l	.L060180F0,r7
	mov.b	@(9,r1),r0
	shll2	r0
	shll2	r0
	add	r0,r7
	mov.w	@(0,r7),r0
	cmp/pl	r0
	bf	.L060180F4
	bra	.L06018318
	nop
.L060180D0:
	.long D_060FEA2C
.L060180D4:
	.long 0x00000019
.L060180D8:
	.long D_060F3064
.L060180DC:
	.long D_060F3068
.L060180E0:
	.long D_060FFFB8
.L060180E4:
	.long func_0600D0D0
.L060180E8:
	.long func_06018BD8
.L060180EC:
	.long func_06007C1C
.L060180F0:
	.long D_060FFE70
.L060180F4:
	mov.l	.L06018110,r14
	mov.b	@(9,r1),r0
	shll2	r0
	add	r0,r14
	mov.l	@r14,r14
	mov.b	@(20,gbr),r0
	cmp/eq	#7,r0
	bt	.L06018114
	mov.b	@(7,r14),r0
	tst	#112,r0
	bt	.L06018114
	bra	.L060182B6
	nop
	.byte 0x00, 0x00
.L06018110:
	.long D_060F3064
.L06018114:
	mov.l	@(12,gbr),r0
	tst	#1,r0
	bt	.L0601811E
	bra	.L060182B6
	nop
.L0601811E:
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L06018132
	mov.l	@(12,gbr),r0
	and	#6,r0
	shlr	r0
	tst	#2,r0
	bt	.L06018132
	bra	.L060182B6
	nop
.L06018132:
	mov.l	@(8,r4),r12
	mov.b	@(9,r12),r0
	and	#127,r0
	cmp/eq	#11,r0
	bt	.L0601814C
	mov.l	.L06018154,r2
	mov.l	@r2,r0
	tst	r0,r0
	bf	.L0601814C
	mov.l	@(0,r4),r0
	mov.l	.L06018158,r2
	cmp/ge	r2,r0
	bt	.L0601815C
.L0601814C:
	mov	#-1,r0
	mov.l	r0,@(32,r1)
	bra	.L06018292
	mov.l	r0,@(36,r1)
.L06018154:
	.long D_060446C8
.L06018158:
	.long 0x00010000
.L0601815C:
	mov.l	@(32,r1),r0
	cmp/pz	r0
	bt	.L06018168
	mov.l	@(12,gbr),r0
	mov.l	r0,@(32,r1)
	mov.l	r0,@(36,r1)
.L06018168:
	mov.l	.L060181C4,r6
	mov.l	@(12,gbr),r0
	tst	#2,r0
	bt	.L06018172
	add	#12,r6
.L06018172:
	mov.l	.L060181C8,r3
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll	r0
	add	r0,r3
	mov.w	@(2,r1),r0
	shll2	r0
	shll2	r0
	add	r0,r3
	mov.l	.L060181CC,r2
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.l	.L060181D0,r8
	mov.b	@(9,r1),r0
	shll	r0
	add	r0,r8
	mov.w	@r8,r0
	add	#-16,r0
	mov.w	.L060181C2,r8
	and	r8,r0
	add	r0,r2
	mov.w	@(14,r2),r0
	extu.w	r0,r2
	mov.w	@(26,r4),r0
	extu.w	r0,r0
	sub	r2,r0
	extu.w	r0,r0
	exts.w	r0,r0
	mov.l	.L060181D4,r8
	cmp/ge	r8,r0
	bt	.L060181DC
	neg	r8,r8
	cmp/gt	r8,r0
	bf	.L060181D8
	bra	.L060181E0
	nop
.L060181C2:
	.short 0x0FF0
.L060181C4:
	.long D_060F30CC
.L060181C8:
	.long D_060F6DF8
.L060181CC:
	.long D_060F1000
.L060181D0:
	.long D_060F3060
.L060181D4:
	.long 0x00000400
.L060181D8:
	bra	.L060181E2
	mov	#-1,r8
.L060181DC:
	bra	.L060181E2
	mov	#1,r8
.L060181E0:
	mov	#0,r8
.L060181E2:
	mov.w	@(20,r1),r0
	cmp/eq	r0,r8
	bt	.L06018266
	tst	r0,r0
	bt	.L060181FC
	tst	r8,r8
	bt	.L060181F6
	mov.l	@(12,gbr),r0
	bra	.L06018204
	nop
.L060181F6:
	mov.l	@(12,gbr),r0
	bra	.L06018266
	mov.l	r0,@(32,r1)
.L060181FC:
	mov.w	@(18,r1),r0
	cmp/eq	r0,r8
	bt	.L06018266
	mov.l	@(32,r1),r0
.L06018204:
	mov	r0,r10
	mov.l	@(36,r1),r0
	mov	r0,r9
	mov	r10,r0
	mov.l	r0,@(36,r1)
	mov	r8,r0
	mov.w	r0,@(18,r1)
	mov.w	.L060182E4,r3
	sub	r9,r10
	cmp/ge	r3,r10
	bf	.L0601821C
	mov	r3,r10
.L0601821C:
	mov	r10,r14
	mov.l	@(36,r1),r10
	mov.l	@(12,gbr),r0
	sub	r10,r0
	mov	r0,r10
	cmp/ge	r3,r10
	mov.l	.L060182EC,r3
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll	r0
	add	r0,r3
	bt	.L06018266
	mov.w	@(2,r1),r0
	sub	r10,r0
	cmp/pz	r0
	bt	.L06018242
	mov	r3,r0
	add	#-1,r0
.L06018242:
	shll2	r0
	shll2	r0
	add	#12,r0
	mov.w	.L060182E6,r10
	mov.l	.L060182F0,r9
.L0601824C:
	add	#-16,r0
	cmp/pz	r0
	bt	.L06018254
	mov	r10,r0
.L06018254:
	mov.l	@(r0,r3),r11
	cmp/pl	r11
	bf	.L06018260
	cmp/gt	r9,r11
	bt	.L06018260
	mov.l	r9,@(r0,r3)
.L06018260:
	add	#-1,r14
	cmp/pl	r14
	bt	.L0601824C
.L06018266:
	mov	r8,r0
	mov.w	r0,@(20,r1)
	mov.l	@(48,r4),r0
	mov.l	@r6+,r5
	add	r5,r0
	mov.l	r0,@(0,r3)
	mov.l	@(52,r4),r0
	mov.l	@r6+,r5
	add	r5,r0
	mov.l	r0,@(4,r3)
	mov.l	@(56,r4),r0
	mov.l	@r6+,r5
	add	r5,r0
	mov.l	r0,@(8,r3)
	mov.l	@(8,r4),r12
	mov.b	@(7,r12),r0
	tst	r0,r0
	mov	#1,r0
	bt	.L06018290
	mov.w	.L060182E8,r8
	add	r8,r0
.L06018290:
	mov.l	r0,@(12,r3)
.L06018292:
	mov.w	@(2,r1),r0
	add	#1,r0
	mov.w	.L060182E4,r8
	cmp/ge	r8,r0
	bf	.L0601829E
	mov	#0,r0
.L0601829E:
	mov.w	r0,@(2,r1)
	mov.l	.L060182EC,r3
	shll2	r0
	shll2	r0
	add	r0,r3
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll	r0
	add	r0,r3
	mov	#0,r0
	mov.l	r0,@(12,r3)
.L060182B6:
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L060182C2
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L060182E0
.L060182C2:
	mov.l	.L060182F4,r0
	jsr	@r0
	nop
	mov.l	.L060182EC,r2
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll	r0
	mov.w	.L060182E4,r7
	mov.l	.L060182F8,r14
	jsr	@r14
	add	r0,r2
	mov.l	.L060182FC,r0
	jsr	@r0
	nop
.L060182E0:
	bra	.L0601850C
	nop
.L060182E4:
	.short 0x004C
.L060182E6:
	.short 0x04BC
.L060182E8:
	.short 0x0100
	.byte 0x00, 0x00
.L060182EC:
	.long D_060F6DF8
.L060182F0:
	.long 0x00000074
.L060182F4:
	.long func_0600CA24
.L060182F8:
	.long func_06020BF8
.L060182FC:
	.long func_0600CA4E
	dlabel D_06018300
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_0601830C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
.L06018318:
	mov.l	@(12,gbr),r0
	tst	#1,r0
	bt	.L06018322
	bra	.L060184E8
	nop
.L06018322:
	mov.l	.L06018450,r3
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll	r0
	add	r0,r3
	mov.w	@(2,r1),r0
	shll2	r0
	shll2	r0
	add	r0,r3
	mov.l	.L06018454,r6
	mov.l	@r6+,r5
	shar	r5
	mov.l	@(48,r4),r8
	add	r5,r8
	mov.l	r8,@(0,r3)
	mov.l	r8,@(16,r3)
	mov.l	@r6+,r5
	shar	r5
	mov.l	@(52,r4),r9
	add	r5,r9
	mov.l	r9,@(4,r3)
	mov.l	r9,@(20,r3)
	mov.l	@r6+,r5
	shar	r5
	mov.l	@(56,r4),r10
	add	r5,r10
	mov.l	r10,@(8,r3)
	mov.l	r10,@(24,r3)
	mov	#1,r0
	mov.l	r0,@(12,r3)
	mov.l	r0,@(28,r3)
	mov.l	.L06018450,r3
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll	r0
	add	r0,r3
	mov.w	@(2,r1),r0
	add	#2,r0
	mov.w	.L0601844A,r6
	cmp/ge	r6,r0
	bf	.L0601837A
	mov	#0,r0
.L0601837A:
	shll2	r0
	shll2	r0
	add	r0,r3
	mov.l	.L06018454,r6
	mov.l	@r6+,r5
	mov.l	@(48,r4),r8
	mov.l	@r6+,r5
	mov.l	@(52,r4),r9
	mov.l	@r6+,r5
	mov.l	@(56,r4),r10
	mov.l	.L06018458,r6
	mov.l	@(0,r6),r0
	mov.l	r0,@(0,r3)
	mov.l	@(4,r6),r0
	mov.l	r0,@(4,r3)
	mov.l	@(8,r6),r0
	mov.l	r0,@(8,r3)
	add	#16,r3
	mov.l	.L0601845C,r6
	mov.l	@(0,r6),r0
	mov.l	r0,@(0,r3)
	mov.l	@(4,r6),r0
	mov.l	r0,@(4,r3)
	mov.l	@(8,r6),r0
	mov.l	r0,@(8,r3)
	mov.l	.L06018460,r3
	mov.l	.L06018464,r6
	mov.l	@r6+,r5
	shar	r5
	mov	r5,r0
	shar	r0
	sub	r0,r5
	add	r8,r5
	mov.l	r5,@(0,r3)
	mov.l	@r6+,r5
	shar	r5
	mov	r5,r0
	shar	r0
	sub	r0,r5
	add	r9,r5
	mov.l	r5,@(4,r3)
	mov.l	@r6+,r5
	shar	r5
	mov	r5,r0
	shar	r0
	sub	r0,r5
	add	r10,r5
	mov.l	r5,@(8,r3)
	add	#12,r3
	mov.l	.L06018468,r6
	mov.l	@r6+,r5
	shar	r5
	mov	r5,r0
	shar	r0
	shar	r0
	sub	r0,r5
	add	r8,r5
	mov.l	r5,@(0,r3)
	mov.l	@r6+,r5
	shar	r5
	mov	r5,r0
	shar	r0
	shar	r0
	sub	r0,r5
	add	r9,r5
	mov.l	r5,@(4,r3)
	mov.l	@r6+,r5
	shar	r5
	mov	r5,r0
	shar	r0
	shar	r0
	sub	r0,r5
	add	r10,r5
	mov.l	r5,@(8,r3)
	mov.l	.L0601846C,r2
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.l	.L06018470,r8
	mov.b	@(9,r1),r0
	shll	r0
	add	r0,r8
	mov.w	@r8,r0
	add	#-16,r0
	mov.w	.L0601844C,r8
	and	r8,r0
	add	r0,r2
	mov.w	@(14,r2),r0
	extu.w	r0,r2
	mov.w	@(26,r4),r0
	extu.w	r0,r0
	sub	r2,r0
	extu.w	r0,r0
	exts.w	r0,r0
	mov.l	.L06018474,r8
	cmp/ge	r8,r0
	bt	.L0601847C
	neg	r8,r8
	cmp/gt	r8,r0
	bf	.L06018478
	bra	.L06018480
	nop
.L0601844A:
	.short 0x0098
.L0601844C:
	.short 0x0FF0
	.byte 0x00, 0x00
.L06018450:
	.long D_060F6DF8
.L06018454:
	.long D_060289A4
.L06018458:
	.long D_0601830C
.L0601845C:
	.long D_06018300
.L06018460:
	.long D_06018300
.L06018464:
	.long D_060F30D8
.L06018468:
	.long D_060F30CC
.L0601846C:
	.long D_060F1000
.L06018470:
	.long D_060F3060
.L06018474:
	.long 0x00000400
.L06018478:
	bra	.L06018482
	mov	#-1,r8
.L0601847C:
	bra	.L06018482
	mov	#1,r8
.L06018480:
	mov	#0,r8
.L06018482:
	mov.w	@(20,r1),r0
	cmp/eq	r0,r8
	bt	.L060184B2
	tst	r0,r0
	bt	.L0601849C
	tst	r8,r8
	bt	.L06018496
	mov.l	@(12,gbr),r0
	bra	.L060184A4
	nop
.L06018496:
	mov.l	@(12,gbr),r0
	bra	.L060184B2
	mov.l	r0,@(32,r1)
.L0601849C:
	mov.w	@(18,r1),r0
	cmp/eq	r0,r8
	bt	.L060184B2
	mov.l	@(32,r1),r0
.L060184A4:
	mov	r0,r10
	mov.l	@(36,r1),r0
	mov	r0,r9
	mov	r10,r0
	mov.l	r0,@(36,r1)
	mov	r8,r0
	mov.w	r0,@(18,r1)
.L060184B2:
	mov	r8,r0
	mov.w	r0,@(20,r1)
	mov.l	@(0,r4),r0
	mov.l	.L0601852C,r2
	cmp/ge	r2,r0
	bt	.L060184C4
	mov	#-1,r0
	mov.l	r0,@(32,r1)
	mov.l	r0,@(36,r1)
.L060184C4:
	mov.l	.L06018530,r3
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll	r0
	add	r0,r3
	mov.w	@(2,r1),r0
	add	#-2,r0
	cmp/pz	r0
	bt	.L060184DA
	mov.w	.L06018526,r0
.L060184DA:
	mov.w	r0,@(2,r1)
	shll2	r0
	shll2	r0
	add	r0,r3
	mov	#0,r0
	mov.l	r0,@(12,r3)
	mov.l	r0,@(28,r3)
.L060184E8:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L0601850C
	mov.l	.L06018534,r0
	jsr	@r0
	nop
	mov.l	.L06018530,r3
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll	r0
	mov.w	.L06018528,r7
	mov.l	.L06018538,r14
	jsr	@r14
	add	r0,r3
	mov.l	.L0601853C,r0
	jsr	@r0
	nop
.L0601850C:
	mov.l	.L06018540,r14
	mov.b	@(9,r1),r0
	shll2	r0
	add	r0,r14
	mov.l	@r14,r14
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L06018544
	mov.b	@(7,r14),r0
	tst	#112,r0
	bt	.L06018544
	bra	.L0601860A
	nop
.L06018526:
	.short 0x0096
.L06018528:
	.short 0x0098
	.byte 0x00, 0x00
.L0601852C:
	.long 0x00010000
.L06018530:
	.long D_060F6DF8
.L06018534:
	.long func_0600CA24
.L06018538:
	.long func_06020DAC
.L0601853C:
	.long func_0600CA4E
.L06018540:
	.long D_060F3064
.L06018544:
	mov.l	.L06018554,r2
	mov.b	@(9,r1),r0
	add	r0,r2
	mov.b	@r2,r0
	tst	r0,r0
	bt	.L06018558
	bra	.L0601860A
	nop
.L06018554:
	.long D_060F30EC
.L06018558:
	mov.l	@(36,r1),r4
	cmp/pz	r4
	bf	.L0601860A
	mov.l	@(12,gbr),r0
	sub	r4,r0
	cmp/pl	r0
	bf	.L0601860A
	mov.w	.L060185CA,r4
	cmp/gt	r4,r0
	bf	.L0601856E
	mov	r4,r0
.L0601856E:
	mov	r0,r7
	mov.l	.L060185D0,r14
	mov.b	@(9,r1),r0
	shll2	r0
	add	r0,r14
	mov.l	@r14,r14
	mov.l	@(48,r14),r11
	mov.l	@(52,r14),r12
	mov.l	@(56,r14),r13
	mov.l	@(8,r14),r0
	mov.b	@(0,r0),r0
	cmp/eq	#16,r0
	bt	.L0601860A
	mov.l	.L060185D4,r2
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.l	.L060185D8,r8
	mov.b	@(9,r1),r0
	shll	r0
	add	r0,r8
	mov.w	@r8,r3
	mov.l	.L060185DC,r8
	mov	#0,r14
.L060185A2:
	add	#1,r14
	mov.w	.L060185CC,r9
	add	#-16,r3
	and	r9,r3
	mov	r3,r10
	add	r2,r10
	mov.l	@(0,r10),r4
	mov.l	@(4,r10),r5
	mov.l	@(8,r10),r6
	sub	r11,r4
	sub	r12,r5
	sub	r13,r6
	bsr	func_06017C6C
	nop
	cmp/pz	r0
	bf	.L060185E0
	dt	r7
	bf	.L060185A2
	bra	.L0601860A
	nop
.L060185CA:
	.short 0x0098
.L060185CC:
	.short 0x0FF0
	.byte 0x00, 0x00
.L060185D0:
	.long D_060F3064
.L060185D4:
	.long D_060F1000
.L060185D8:
	.long D_060F3060
.L060185DC:
	.long 0x00000100
.L060185E0:
	add	#-1,r7
	cmp/pl	r7
	bf	.L0601860A
.L060185E6:
	add	#1,r14
	add	#-16,r3
	mov.w	.L06018610,r9
	and	r9,r3
	mov	r3,r10
	add	r2,r10
	mov.l	@(0,r10),r4
	mov.l	@(4,r10),r5
	mov.l	@(8,r10),r6
	sub	r11,r4
	sub	r12,r5
	sub	r13,r6
	bsr	func_06017C6C
	nop
	cmp/pz	r0
	bt	.L06018612
	dt	r7
	bf	.L060185E6
.L0601860A:
	lds.l	@r15+,pr
	rts
	nop
.L06018610:
	.short 0x0FF0
.L06018612:
	mov.l	.L06018658,r7
	swap.w	r11,r0
	exts.w	r0,r0
	mov.w	r0,@(6,r7)
	swap.w	r12,r0
	exts.w	r0,r0
	mov.w	r0,@(8,r7)
	swap.w	r13,r0
	exts.w	r0,r0
	mov.w	r0,@(10,r7)
	mov	r14,r7
	mov	#32,r14
	cmp/ge	r14,r7
	bf	.L0601860A
	mov	r3,r4
	mov.l	.L0601865C,r3
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll2	r0
	add	r0,r3
	add	r4,r3
	mov.l	.L06018660,r10
	mov.b	@(9,r1),r0
	shll2	r0
	add	r0,r10
	mov.l	@r10,r10
	mov.w	@(14,r3),r0
	mov	r0,r8
	mov.w	@(26,r10),r0
	mov.l	.L06018664,r14
	jsr	@r14
	sub	r8,r0
	bra	.L0601867A
	nop
.L06018658:
	.long D_060FFE70
.L0601865C:
	.long D_060F1000
.L06018660:
	.long D_060F3064
.L06018664:
	.long func_06007C08
	.byte 0x85, 0x19, 0x40, 0x11, 0x89, 0x03, 0x4A, 0x11, 0x8B, 0xCB, 0xA0, 0x02, 0x00, 0x09, 0x4A, 0x15
	.byte 0x89, 0xC7
.L0601867A:
	mov.l	.L06018690,r14
	mov.b	@(9,r1),r0
	shll2	r0
	shll2	r0
	add	r0,r14
	mov.w	@(0,r14),r0
	cmp/pl	r0
	bf	.L06018694
	bra	.L060186C4
	nop
	.byte 0x00, 0x00
.L06018690:
	.long D_060FFE70
.L06018694:
	mov	r7,r14
	mov.l	.L060186F8,r3
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll	r0
	add	r0,r3
	mov.w	@(2,r1),r0
	shll2	r0
	shll2	r0
	add	#12,r0
	mov.w	.L060186F6,r8
	mov.l	.L060186FC,r9
.L060186AE:
	add	#-16,r0
	cmp/pz	r0
	bt	.L060186B6
	mov	r8,r0
.L060186B6:
	mov.l	@(r0,r3),r2
	cmp/gt	r9,r2
	bt	.L060186BE
	mov.l	r9,@(r0,r3)
.L060186BE:
	add	#-1,r14
	cmp/pl	r14
	bt	.L060186AE
.L060186C4:
	mov.l	@(12,gbr),r0
	mov.l	r0,@(36,r1)
	mov.l	.L06018700,r2
	mov.l	.L06018704,r14
	jsr	@r14
	nop
	mov.l	.L06018708,r2
	mov.l	r2,@(12,r3)
	add	#16,r3
	mov.l	r4,@(32,r3)
	mov.l	r7,@(36,r3)
	mov.w	@(18,r1),r0
	mov.l	.L0601870C,r14
	mov.w	r0,@(12,r14)
	mov.w	r0,@(18,r3)
	mov.b	@(9,r1),r0
	mov.b	r0,@(9,r3)
	mov.l	.L06018710,r4
	mov.b	@(9,r1),r0
	shll2	r0
	add	r0,r4
	mov.l	r3,@r4
	lds.l	@r15+,pr
	rts
	nop
.L060186F6:
	.short 0x04BC
.L060186F8:
	.long D_060F6DF8
.L060186FC:
	.long 0x00000074
.L06018700:
	.long D_060FFFA8
.L06018704:
	.long func_0600D0D0
.L06018708:
	.long func_06018714
.L0601870C:
	.long D_060FFE70
.L06018710:
	.long D_060F3090
	endlabel func_06017F80

	glabel func_06018714
	mov.l	.L0601871C,r2
	mov.l	r2,@-r1
	rts
	add	#4,r1
.L0601871C:
	.long func_06018720
	endlabel func_06018714

	glabel func_06018720
	sts.l	pr,@-r15
	mov.l	.L0601881C,r2
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.l	@(32,r1),r3
	mov.w	.L06018818,r9
	mov.l	@(36,r1),r7
	mov	#0,r11
	mov	#0,r12
	mov	#0,r13
	mov	#0,r14
.L0601873C:
	and	r9,r3
	mov	r3,r10
	add	r2,r10
	mov.w	@(0,r10),r0
	add	r0,r11
	mov.w	@(4,r10),r0
	add	r0,r12
	mov.w	@(8,r10),r0
	add	r0,r13
	mov.w	@(12,r10),r0
	add	r0,r14
	add	#16,r3
	dt	r7
	bf	.L0601873C
	mov.l	@(36,r1),r7
	mov	#-128,r4
	shll	r4
	mov.l	r7,@(0,r4)
	mov.l	r11,@(4,r4)
	mov.l	@(28,r4),r11
	mov	r11,r0
	shll16	r0
	mov.l	r0,@(48,r1)
	mov.l	r7,@(0,r4)
	mov.l	r12,@(4,r4)
	mov.l	@(28,r4),r12
	mov	r12,r0
	shll16	r0
	mov.l	r0,@(52,r1)
	mov.l	r7,@(0,r4)
	mov.l	r13,@(4,r4)
	mov.l	@(28,r4),r13
	mov	r13,r0
	shll16	r0
	mov.l	r0,@(56,r1)
	mov.l	r7,@(0,r4)
	mov.l	r14,@(4,r4)
	mov.l	@(28,r4),r14
	mov	r14,r0
	shll16	r0
	mov.l	r0,@(60,r1)
	shlr2	r7
	mov.l	.L06018820,r4
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll	r0
	add	r0,r4
	mov.l	r7,@r4
	mov.l	.L06018824,r0
	add	r0,r4
	mov.l	r7,@r4
	add	#4,r4
	mov	#0,r5
	mov.l	.L06018828,r6
	mov.w	.L06018818,r9
	mov.l	@(32,r1),r3
.L060187AE:
	and	r9,r3
	mov	r3,r10
	add	r2,r10
	mov.w	@(0,r10),r0
	sub	r11,r0
	mov.w	r0,@(0,r4)
	muls.w	r0,r0
	sts	macl,r8
	mov.w	@(4,r10),r0
	sub	r12,r0
	mov.w	r0,@(2,r4)
	muls.w	r0,r0
	sts	macl,r0
	add	r0,r8
	mov.w	@(8,r10),r0
	sub	r13,r0
	mov.w	r0,@(4,r4)
	muls.w	r0,r0
	sts	macl,r0
	add	r0,r8
	mov.w	@(12,r10),r0
	sub	r14,r0
	mov.w	r0,@(6,r4)
	add	#8,r4
	cmp/gt	r5,r8
	bf	.L060187E4
	mov	r8,r5
.L060187E4:
	cmp/gt	r6,r8
	bt	.L060187EA
	mov	r8,r6
.L060187EA:
	add	#64,r3
	dt	r7
	bf	.L060187AE
	mov.l	.L0601882C,r13
	jsr	@r13
	mov	r5,r0
	mov	r0,r8
	mov.l	.L06018830,r7
	mov.w	@(12,r7),r0
	tst	r0,r0
	bt	.L06018806
	mov	r8,r0
	shar	r0
	add	r0,r8
.L06018806:
	mov	r8,r0
	mov.l	r0,@(40,r1)
	mov	#12,r8
	cmp/ge	r8,r0
	bt	.L06018838
	lds.l	@r15+,pr
	mov.l	.L06018834,r0
	jmp	@r0
	nop
.L06018818:
	.short 0x0FF0
	.byte 0x00, 0x00
.L0601881C:
	.long D_060F1000
.L06018820:
	.long D_060FA5F8
.L06018824:
	.long 0x00000400
.L06018828:
	.long 0x7FFFFFFF
.L0601882C:
	.long func_06007CF0
.L06018830:
	.long D_060FFE50
.L06018834:
	.long func_0600D1A0
.L06018838:
	mov.l	.L060188E4,r7
	mov.w	r0,@(2,r7)
	mov.l	.L060188E8,r13
	jsr	@r13
	mov	r6,r0
	mov.w	r0,@(4,r7)
	mov.l	.L060188EC,r2
	mov.b	@(9,r1),r0
	add	r0,r2
	mov	#-1,r0
	mov.b	r0,@r2
	mov.l	.L060188F0,r10
	mov.b	@(9,r1),r0
	shll2	r0
	add	r0,r10
	mov.l	@r10,r10
	mov.w	@(24,r10),r0
	mov.w	r0,@(24,r1)
	mov	#15,r0
	mov.w	r0,@(16,r1)
	mov.l	.L060188F4,r0
	mov.l	r0,@(44,r1)
	mov	#30,r0
	mov.w	r0,@(0,r1)
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#6,r6
	mov.l	.L060188F8,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L060188FC,r2
	mov.l	.L06018900,r0
	jsr	@r0
	nop
	mov.l	.L06018904,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	@(48,r1),r0
	mov.l	r0,@(48,r3)
	mov.l	@(52,r1),r0
	mov.l	r0,@(52,r3)
	mov.l	@(56,r1),r0
	mov.l	r0,@(56,r3)
	mov.b	@(9,r1),r0
	mov.b	r0,@(9,r3)
	mov.l	@(40,r1),r0
	mov	r0,r8
	shar	r8
	add	r8,r0
	mov.l	r0,@(40,r3)
	mov	#30,r0
	mov.w	r0,@(0,r3)
	mov	#0,r0
	mov.w	r0,@(26,r3)
	mov.w	r0,@(24,r3)
	mov.l	.L06018908,r2
	mov.b	@(9,r1),r0
	shll8	r0
	add	r0,r2
	mov.w	@(4,r1),r0
	add	#8,r0
	and	#127,r0
	mov	#0,r0
	mov.w	r0,@(4,r1)
	add	r0,r2
	mov	#30,r12
	mov.w	.L060188E2,r14
.L060188D0:
	mov.b	r12,@r2
	add	#1,r2
	dt	r14
	bf	.L060188D0
	lds.l	@r15+,pr
	mov.l	.L0601890C,r2
	mov.l	r2,@-r1
	rts
	add	#4,r1
.L060188E2:
	.short 0x00A2
.L060188E4:
	.long D_060FFE70
.L060188E8:
	.long func_06007CF0
.L060188EC:
	.long D_060F30EC
.L060188F0:
	.long D_060F3064
.L060188F4:
	.long 0x00010000
.L060188F8:
	.long func_0600E4C4
.L060188FC:
	.long D_060FFFB0
.L06018900:
	.long func_0600D0D0
.L06018904:
	.long func_06018A14
.L06018908:
	.long D_060FB5F8
.L0601890C:
	.long func_06018910
	endlabel func_06018720

	glabel func_06018910
	sts.l	pr,@-r15
	mov.l	.L0601892C,r2
	mov.b	@(9,r1),r0
	add	r0,r2
	mov	#0,r0
	mov.b	r0,@r2
	mov.w	@(0,r1),r0
	dt	r0
	bf	.L06018934
	lds.l	@r15+,pr
	mov.l	.L06018930,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0601892C:
	.long D_060F30EC
.L06018930:
	.long func_0600D1A0
.L06018934:
	mov.w	r0,@(0,r1)
	add	#-15,r0
	cmp/pz	r0
	bt	.L06018946
	neg	r0,r0
	mov.l	@(44,r1),r6
	mov.w	.L06018950,r7
	sub	r7,r6
	mov.l	r6,@(44,r1)
.L06018946:
	mov.b	@(30,gbr),r0
	tst	r0,r0
	bt	.L06018952
	bra	.L060189FC
	nop
.L06018950:
	.short 0x1000
.L06018952:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0601895C
	bra	.L060189FC
	nop
.L0601895C:
	mov.l	.L06018A04,r4
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll	r0
	add	r0,r4
	mov.l	.L06018A08,r3
	add	r4,r3
	mov.l	@r4+,r7
	add	#4,r3
	mov.l	@(44,r1),r6
.L06018972:
	mov.w	@r3+,r0
	shll16	r0
	dmuls.l	r6,r0
	sts	mach,r0
	mov.w	r0,@r4
	add	#2,r4
	mov.w	@r3+,r0
	shll16	r0
	dmuls.l	r6,r0
	sts	mach,r0
	mov.w	r0,@r4
	add	#2,r4
	mov.w	@r3+,r0
	shll16	r0
	dmuls.l	r6,r0
	sts	mach,r0
	mov.w	r0,@r4
	add	#2,r4
	mov.w	@r3+,r0
	shll16	r0
	dmuls.l	r6,r0
	sts	mach,r0
	mov.w	r0,@r4
	add	#2,r4
	dt	r7
	bf	.L06018972
	mov.l	.L06018A0C,r2
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll	r0
	add	r2,r0
	mov.l	r0,@(744,gbr)
	mov.l	.L06018A04,r2
	mov.b	@(9,r1),r0
	shll8	r0
	shll2	r0
	shll	r0
	add	r0,r2
	mov.l	.L06018A10,r0
	jsr	@r0
	nop
	mov.l	@(744,gbr),r0
	mov	r0,r3
	mov.w	@r3+,r7
	shar	r7
	shar	r7
	shll2	r7
	add	#2,r3
	mov	#0,r4
	mov	#0,r5
	mov	#4,r14
.L060189DA:
	mov.w	@r3,r0
	add	r0,r4
	mov.w	@(2,r3),r0
	add	r0,r5
	add	r7,r3
	dt	r14
	bf	.L060189DA
	shar	r4
	shar	r4
	shar	r5
	shar	r5
	mov.w	.L06018A02,r0
	sub	r4,r0
	mov.w	r0,@(372,gbr)
	mov.w	.L06018A02,r0
	sub	r5,r0
	mov.w	r0,@(374,gbr)
.L060189FC:
	lds.l	@r15+,pr
	rts
	nop
.L06018A02:
	.short 0x0080
.L06018A04:
	.long D_060FA5F8
.L06018A08:
	.long 0x00000400
.L06018A0C:
	.long D_060F95F8
.L06018A10:
	.long func_0600D860
	endlabel func_06018910

	glabel func_06018A14
	mov.w	@(0,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bt	.L06018A28
	mov.l	.L06018A24,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06018A24:
	.long func_0600D1A0
.L06018A28:
	mov.w	r0,@(0,r1)
	mov	#30,r8
	cmp/ge	r8,r0
	bf	.L06018A30
.L06018A30:
	sts.l	pr,@-r15
	mov.l	@(40,r1),r0
	add	#-3,r0
	mov.l	r0,@(40,r1)
	mov.w	@(26,r1),r0
	mov.w	.L06018A5A,r8
	add	r8,r0
	mov.w	r0,@(26,r1)
	mov.w	.L06018A5A,r8
	mov.w	@(24,r1),r0
	add	r8,r0
	mov.w	r0,@(24,r1)
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L06018A5C
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06018A5C
	lds.l	@r15+,pr
	rts
	nop
.L06018A5A:
	.short 0x0100
.L06018A5C:
	mov.l	.L06018A9C,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06018AA0,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	@(40,r1),r0
	shll8	r0
	mov	r0,r4
	mov	r0,r5
	mov.l	.L06018AA4,r14
	jsr	@r14
	mov	r0,r6
	mov.l	.L06018AA8,r2
	jsr	@r2
	mov.w	@(26,r1),r0
	mov.l	.L06018AAC,r2
	jsr	@r2
	mov.w	@(24,r1),r0
	mov.l	.L06018AB0,r2
	mov.b	@(9,r1),r0
	shll8	r0
	add	r0,r2
	mov.l	.L06018AB4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L06018AB8,r0
	jmp	@r0
	nop
.L06018A9C:
	.long func_0600CA24
.L06018AA0:
	.long func_0600CBDA
.L06018AA4:
	.long func_0600D018
.L06018AA8:
	.long func_0600CB68
.L06018AAC:
	.long func_0600CAF8
.L06018AB0:
	.long D_060FB5F8
.L06018AB4:
	.long func_06021120
.L06018AB8:
	.long func_0600CA4E
	endlabel func_06018A14

	glabel func_06018ABC
	sts.l	pr,@-r15
	dmuls.l	r8,r8
	sts	mach,r8
	mov.l	.L06018B14,r3
	mov.w	.L06018B10,r7
	mov	#0,r0
.L06018AC8:
	mov.l	@(12,r3),r10
	tst	r10,r10
	bt	.L06018B00
	mov.l	@(0,r3),r11
	sub	r4,r11
	mov.l	@(4,r3),r12
	sub	r5,r12
	mov.l	@(8,r3),r13
	sub	r6,r13
	mov	#0,r13
	mov	#0,r10
	dmuls.l	r11,r11
	sts	mach,r9
	cmp/ge	r8,r9
	bt	.L06018B00
	add	r9,r10
	dmuls.l	r12,r12
	sts	mach,r9
	cmp/ge	r8,r9
	bt	.L06018B00
	add	r9,r10
	dmuls.l	r13,r13
	sts	mach,r9
	cmp/ge	r8,r9
	bt	.L06018B00
	add	r9,r10
	cmp/ge	r8,r10
	bf	.L06018B18
.L06018B00:
	add	#1,r0
	dt	r7
	bf/s	.L06018AC8
	add	#16,r3
	mov	#-1,r0
	lds.l	@r15+,pr
	rts
	nop
.L06018B10:
	.short 0x004C
	.byte 0x00, 0x00
.L06018B14:
	.long D_060F6DF8
.L06018B18:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06018ABC

	glabel func_06018B1E
	sts.l	pr,@-r15
	mov.l	.L06018B80,r14
	mov.w	@(0,r14),r0
	cmp/pl	r0
	bt	.L06018B76
	mov.l	.L06018B84,r4
	mov.l	@r4,r4
	mov.l	@(36,r4),r4
	cmp/pz	r4
	bf	.L06018B76
	mov.l	@(12,gbr),r0
	sub	r4,r0
	cmp/pl	r0
	bf	.L06018B76
	mov.w	.L06018B7C,r4
	cmp/gt	r4,r0
	bf	.L06018B42
	mov	r4,r0
.L06018B42:
	mov	r0,r7
	mov.l	@(48,r1),r11
	mov.l	@(52,r1),r12
	mov.l	@(56,r1),r13
	mov.l	.L06018B88,r2
	mov.l	.L06018B8C,r3
	mov.w	@r3,r3
	mov	#0,r14
.L06018B52:
	add	#1,r14
	mov.w	.L06018B7E,r9
	add	#-16,r3
	and	r9,r3
	mov	r3,r10
	add	r2,r10
	mov.l	@(0,r10),r4
	mov.l	@(4,r10),r5
	mov.l	@(8,r10),r6
	sub	r11,r4
	sub	r12,r5
	sub	r13,r6
	bsr	func_06017C6C
	nop
	cmp/pz	r0
	bt	.L06018B90
	dt	r7
	bf	.L06018B52
.L06018B76:
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L06018B7C:
	.short 0x0098
.L06018B7E:
	.short 0x0FF0
.L06018B80:
	.long D_060FFE70
.L06018B84:
	.long D_060F3088
.L06018B88:
	.long D_060F1000
.L06018B8C:
	.long D_060F3060
.L06018B90:
	mov.l	.L06018BCC,r4
	mov.l	@r4,r4
	mov.l	@(12,gbr),r0
	sub	r14,r0
	mov.l	r0,@(36,r4)
	mov.l	.L06018BD0,r3
	mov.w	@(2,r4),r0
	shll2	r0
	shll2	r0
	add	#12,r0
	mov.w	.L06018BCA,r8
	mov.l	.L06018BD4,r9
	mov	#76,r7
.L06018BAA:
	add	#-1,r14
	add	#-16,r0
	cmp/pz	r0
	bt	.L06018BB4
	mov	r8,r0
.L06018BB4:
	cmp/pl	r14
	bt	.L06018BC0
	mov.l	@(r0,r3),r2
	cmp/gt	r9,r2
	bt	.L06018BC0
	mov.l	r9,@(r0,r3)
.L06018BC0:
	dt	r7
	bf	.L06018BAA
	lds.l	@r15+,pr
	rts
	mov	#-1,r0
.L06018BCA:
	.short 0x04BC
.L06018BCC:
	.long D_060F3088
.L06018BD0:
	.long D_060F6DF8
.L06018BD4:
	.long 0x00000074
	endlabel func_06018B1E

	glabel func_06018BD8
	mov.w	.L06018C00,r8
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bt	.L06018BE2
	mov.w	.L06018C02,r8
.L06018BE2:
	mov	r8,r0
	mov.w	r0,@(28,r1)
	mov	#48,r0
	mov.w	r0,@(0,r1)
	mov	#0,r0
	mov.w	r0,@(22,r1)
	mov.l	.L06018C04,r0
	mov.l	r0,@-r1
	add	#4,r1
.L06018BF4:
	mov.w	@(0,r1),r0
	dt	r0
	bf	.L06018C0C
	mov.l	.L06018C08,r0
	jmp	@r0
	nop
.L06018C00:
	.short 0x1B04
.L06018C02:
	.short 0x1AF6
.L06018C04:
	.long .L06018BF4
.L06018C08:
	.long func_0600D1A0
.L06018C0C:
	mov.w	r0,@(0,r1)
	endlabel func_06018BD8

	glabel func_06018C0E
	sts.l	pr,@-r15
	mov.w	@(22,r1),r0
	mov.w	.L06018C3A,r8
	add	r8,r0
	mov.w	r0,@(22,r1)
	mov.l	.L06018C3C,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r10
	mov.l	.L06018C40,r0
	add	r10,r0
	mov.l	r0,@(4,r1)
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L06018C44
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06018C44
	lds.l	@r15+,pr
	rts
	nop
.L06018C3A:
	.short 0x02AA
.L06018C3C:
	.long func_06007C08
.L06018C40:
	.long 0x00018000
.L06018C44:
	mov.l	.L06018C98,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06018C9C,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06018CA0,r10
	jsr	@r10
	mov.w	@(24,r1),r0
	mov.w	@(26,r1),r0
	mov.w	.L06018C96,r8
	neg	r0,r0
	mov.l	.L06018CA4,r10
	jsr	@r10
	add	r8,r0
	mov.w	.L06018C96,r0
	mov.l	.L06018CA8,r2
	jsr	@r2
	nop
	mov.l	@(4,r1),r4
	mov.l	@(4,r1),r5
	shar	r5
	shar	r5
	shar	r5
	shar	r5
	mov.l	@(4,r1),r6
	mov.l	.L06018CAC,r0
	jsr	@r0
	nop
	mov.l	.L06018CB0,r2
	mov.l	.L06018CB4,r0
	jsr	@r0
	nop
	mov.l	.L06018CB8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06018C96:
	.short 0x4000
.L06018C98:
	.long func_0600CA24
.L06018C9C:
	.long func_0600CBDA
.L06018CA0:
	.long func_0600CAF8
.L06018CA4:
	.long func_0600CB68
.L06018CA8:
	.long func_0600CA7A
.L06018CAC:
	.long func_0600D018
.L06018CB0:
	.long D_06051A8C
.L06018CB4:
	.long func_0601F434
.L06018CB8:
	.long func_0600CA4E
	endlabel func_06018C0E

	.section .data.06018CBC,"aw",@progbits
	.p2align 2
	dlabel D_06018CBC
	.byte 0x00, 0x00
	dlabel D_06018CBE
	.byte 0x00, 0x01, 0x00, 0x02, 0x00, 0x04, 0x00, 0x08, 0x00, 0x10, 0x00, 0x20, 0x00, 0x40, 0x00, 0x80
	.byte 0x01, 0x00, 0x02, 0x00, 0x04, 0x00, 0x08, 0x00, 0x10, 0x00, 0x20, 0x00, 0x40, 0x00, 0x80, 0x00
	.byte 0x00, 0x09
	dlabel D_06018CE0
	.byte 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x08
	.byte 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x80
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x08, 0x00
	.byte 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x80, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
