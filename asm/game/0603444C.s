	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603444C,"ax",@progbits
	.p2align 2
	.byte 0xD4, 0x15

	glabel func_0603444E
	sts.l	pr,@-r15
	mov.l	r1,@r4
	add	#4,r4
	mov	#-1,r0
	mov.b	r0,@(2,r1)
	mov	#5,r14
	mov	#1,r13
	mov.w	.L060344A0,r12
	mov	#0,r11
.L06034460:
	mov.l	.L060344A8,r2
	mov.l	.L060344AC,r0
	jsr	@r0
	nop
	mov.l	.L060344B0,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r3,@r4
	add	#4,r4
	mov	r13,r0
	mov.b	r0,@r3
	shll	r13
	mov	#0,r0
	mov.b	r0,@(1,r3)
	mov	#64,r0
	mov.w	r11,@(r0,r3)
	mov	#66,r0
	mov.w	r11,@(r0,r3)
	mov	#68,r0
	mov.w	r11,@(r0,r3)
	add	r12,r11
	swap.b	r11,r0
	exts.b	r0,r0
	mov.b	r0,@(3,r3)
	mov.l	r1,@(4,r3)
	dt	r14
	bf	.L06034460
	mov.l	.L060344B4,r0
	lds.l	@r15+,pr
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L060344A0:
	.short 0x4000
	.byte 0x00, 0x00
	.long D_060F30A8
.L060344A8:
	.long obj_list_manager
.L060344AC:
	.long obj_alloc
.L060344B0:
	.long func_060344BC
.L060344B4:
	.long func_060344B8
	endlabel func_0603444E

	glabel func_060344B8
	rts
	nop
	endlabel func_060344B8

	glabel func_060344BC
	mov.l	.L060344E8,r0
	mov.l	r0,@(44,r1)
	mov.b	@r1,r3
	mov	#0,r0
	mov	#4,r2
.L060344C6:
	shlr	r3
	bt	.L060344D0
	add	#1,r0
	dt	r2
	bf	.L060344C6
.L060344D0:
	mov.b	r0,@(2,r1)
	mov.w	r0,@(18,r1)
	mov	#0,r0
	mov.w	r0,@(22,r1)
	mov.w	.L060344E6,r3
	mov	#70,r0
	mov.w	r3,@(r0,r1)
	mov.l	.L060344EC,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L060344E6:
	.short 0x0500
.L060344E8:
	.long D_06014B6A
.L060344EC:
	.long func_060344F0
	endlabel func_060344BC

	glabel func_060344F0
	sts.l	pr,@-r15
	mov.l	@(4,r1),r2
	mov.b	@r1,r3
	mov.b	@r2,r4
	tst	r3,r4
	bt	.L06034504
	mov.b	@(1,r2),r0
	xor	r3,r4
	mov.b	r4,@r2
	mov.b	r0,@(1,r1)
.L06034504:
	mov.b	@(1,r1),r0
	cmp/eq	#-1,r0
	bt	.L06034554
	mov.l	.L06034528,r3
	shll2	r0
	mov.l	@(r0,r3),r3
	jsr	@r3
	nop
	mov.l	.L0603452C,r2
	mov.l	.L06034530,r0
	jsr	@r0
	nop
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06034534
	lds.l	@r15+,pr
	rts
	nop
.L06034528:
	.long D_0603456C
.L0603452C:
	.long D_06014CCA
.L06034530:
	.long spr_anim_step
.L06034534:
	bsr	func_06034A3C
	nop
	mov.l	.L0603455C,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	.L06034560,r0
	mov.l	@(52,r1),r5
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06034564,r2
	jsr	@r2
	nop
	mov.l	.L06034568,r0
	jsr	@r0
	nop
.L06034554:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0603455C:
	.long mtx_push
.L06034560:
	.long mtx_translate
.L06034564:
	.long spr_draw_billboard
.L06034568:
	.long mtx_pop
	dlabel D_0603456C
	.long func_060347F0
	.long func_060347B4
	.long func_060345FA
	.long func_060346CC
	.long func_060347D0
	.long func_06034714
	.long .L06034726
	.long func_060347C2
	.long func_060347E0
	.long func_06034660
	.long func_060345A0
	.long func_060345BA
	.long func_06034642
	endlabel func_060344F0

	glabel func_060345A0
	mov	#0,r0
	mov.w	r0,@(22,r1)
	mov.w	.L060345B8,r3
	mov	#70,r0
	mov.w	r3,@(r0,r1)
	mov	#72,r0
	mov	#0,r3
	mov.w	r3,@(r0,r1)
	mov	#2,r0
	mov.b	r0,@(1,r1)
	bra	.L06034802
	nop
.L060345B8:
	.short 0x0500
	endlabel func_060345A0

	glabel func_060345BA
	mov.w	.L060345E2,r3
	mov	#70,r0
	mov.w	r3,@(r0,r1)
	mov.w	@(22,r1),r0
	add	#-2,r0
	cmp/pz	r0
	bt	.L060345CA
	mov	#0,r0
.L060345CA:
	mov.w	r0,@(22,r1)
	cmp/eq	#0,r0
	bt	func_06034642
	mov	#0,r3
	shll16	r3
	mov	#72,r0
	mov.l	@(r0,r1),r2
	cmp/gt	r3,r2
	bf	.L060345E6
	mov.w	.L060345E4,r3
	bra	.L060345EE
	add	r3,r2
.L060345E2:
	.short 0x0500
.L060345E4:
	.short 0xC000
.L060345E6:
	cmp/gt	r2,r3
	bf	.L060345EE
	mov.w	.L060345F8,r3
	add	r3,r2
.L060345EE:
	mov.l	r2,@(r0,r1)
	mov	r2,r3
	shlr16	r3
	bra	.L06034802
	nop
.L060345F8:
	.short 0x4000
	endlabel func_060345BA

	glabel func_060345FA
	mov.w	.L06034628,r3
	mov	#70,r0
	mov.w	r3,@(r0,r1)
	mov.w	.L0603462A,r3
	mov.b	@(0,gbr),r0
	cmp/eq	#0,r0
	bf	.L0603460A
	shar	r3
.L0603460A:
	mov.w	@(22,r1),r0
	add	#2,r0
	cmp/ge	r3,r0
	bf	.L06034614
	mov	r3,r0
.L06034614:
	mov.w	r0,@(22,r1)
	mov	#32,r3
	shll16	r3
	mov	#72,r0
	mov.l	@(r0,r1),r2
	cmp/gt	r3,r2
	bf	.L0603462E
	mov.w	.L0603462C,r3
	bra	.L06034636
	add	r3,r2
.L06034628:
	.short 0x0500
.L0603462A:
	.short 0x0100
.L0603462C:
	.short 0xC000
.L0603462E:
	cmp/gt	r2,r3
	bf	.L06034636
	mov.w	.L06034640,r3
	add	r3,r2
.L06034636:
	mov.l	r2,@(r0,r1)
	mov	r2,r3
	shlr16	r3
	bra	.L06034802
	nop
.L06034640:
	.short 0x4000
	endlabel func_060345FA

	glabel func_06034642
	mov.w	.L0603465E,r3
	mov	#70,r0
	mov.w	r3,@(r0,r1)
	mov	#0,r0
	mov.w	r0,@(22,r1)
	mov	#72,r0
	mov	#0,r3
	mov.w	r3,@(r0,r1)
	mov	#0,r3
	mov.l	r3,@(48,r1)
	mov.l	r3,@(52,r1)
	mov.l	r3,@(56,r1)
	rts
	nop
.L0603465E:
	.short 0x0500
	endlabel func_06034642

	glabel func_06034660
	mov.l	.L0603467C,r0
	mov.w	@r0,r0
	tst	r0,r0
	bt	.L06034684
	mov.l	.L06034680,r7
	mov.b	@(3,r7),r0
	mov	r0,r8
	mov.b	@(2,r1),r0
	add	#-1,r0
	cmp/eq	r0,r8
	bt	.L06034684
	bra	.L06034554
	nop
	.byte 0x00, 0x00
.L0603467C:
	.long D_060329D4
.L06034680:
	.long play_state
.L06034684:
	mov.w	.L060346B2,r3
	mov	#70,r0
	mov.w	r3,@(r0,r1)
	mov.w	.L060346B4,r3
	mov.b	@(0,gbr),r0
	cmp/eq	#0,r0
	bf	.L06034694
	shar	r3
.L06034694:
	mov.w	@(22,r1),r0
	add	#2,r0
	cmp/ge	r3,r0
	bf	.L0603469E
	mov	r3,r0
.L0603469E:
	mov.w	r0,@(22,r1)
	mov	#3,r3
	shll16	r3
	mov	#72,r0
	mov.l	@(r0,r1),r2
	cmp/gt	r3,r2
	bf	.L060346B8
	mov.w	.L060346B6,r3
	bra	.L060346C0
	add	r3,r2
.L060346B2:
	.short 0x0500
.L060346B4:
	.short 0x0100
.L060346B6:
	.short 0xC000
.L060346B8:
	cmp/gt	r2,r3
	bf	.L060346C0
	mov.w	.L060346CA,r3
	add	r3,r2
.L060346C0:
	mov.l	r2,@(r0,r1)
	mov	r2,r3
	shlr16	r3
	bra	func_0603483C
	nop
.L060346CA:
	.short 0x4000
	endlabel func_06034660

	glabel func_060346CC
	mov.w	.L060346FA,r3
	mov	#70,r0
	mov.w	r3,@(r0,r1)
	mov.w	.L060346FC,r3
	mov.b	@(0,gbr),r0
	cmp/eq	#0,r0
	bf	.L060346DC
	shar	r3
.L060346DC:
	mov.w	@(22,r1),r0
	add	#2,r0
	cmp/ge	r3,r0
	bf	.L060346E6
	mov	r3,r0
.L060346E6:
	mov.w	r0,@(22,r1)
	mov	#32,r3
	shll16	r3
	mov	#72,r0
	mov.l	@(r0,r1),r2
	cmp/gt	r3,r2
	bf	.L06034700
	mov.w	.L060346FE,r3
	bra	.L06034708
	add	r3,r2
.L060346FA:
	.short 0x0500
.L060346FC:
	.short 0x0100
.L060346FE:
	.short 0xC000
.L06034700:
	cmp/gt	r2,r3
	bf	.L06034708
	mov.w	.L06034712,r3
	add	r3,r2
.L06034708:
	mov.l	r2,@(r0,r1)
	mov	r2,r3
	shlr16	r3
	bra	func_0603483C
	nop
.L06034712:
	.short 0x4000
	endlabel func_060346CC

	glabel func_06034714
	mov	#0,r2
	mov	#64,r0
	mov.w	r2,@(r0,r1)
	mov	#66,r0
	mov.w	r2,@(r0,r1)
	mov	#68,r0
	mov.w	r2,@(r0,r1)
	mov	#6,r0
	mov.b	r0,@(1,r1)
.L06034726:
	mov	#70,r0
	mov.w	@(r0,r1),r3
	add	#16,r3
	mov.w	.L0603475E,r4
	cmp/gt	r4,r3
	bf	.L06034734
	mov	r4,r3
.L06034734:
	mov.w	r3,@(r0,r1)
	mov.w	.L06034760,r3
	mov.b	@(0,gbr),r0
	cmp/eq	#0,r0
	bf	.L06034740
	shar	r3
.L06034740:
	mov.w	@(22,r1),r0
	add	#2,r0
	cmp/ge	r3,r0
	bf	.L0603474A
	mov	r3,r0
.L0603474A:
	mov.w	r0,@(22,r1)
	mov	#0,r3
	shll16	r3
	mov	#72,r0
	mov.l	@(r0,r1),r2
	cmp/gt	r3,r2
	bf	.L06034764
	mov.w	.L06034762,r3
	bra	.L0603476C
	add	r3,r2
.L0603475E:
	.short 0x2000
.L06034760:
	.short 0x0100
.L06034762:
	.short 0xC000
.L06034764:
	cmp/gt	r2,r3
	bf	.L0603476C
	mov.w	.L060347AA,r3
	add	r3,r2
.L0603476C:
	mov.l	r2,@(r0,r1)
	mov	r2,r3
	shlr16	r3
	endlabel func_06034714

	glabel func_06034772
	sts.l	pr,@-r15
	mov.l	.L060347AC,r6
	mov	#32,r7
	mov.l	@r6,r6
	bsr	func_0603489C
	add	#48,r6
	lds.l	@r15+,pr
	mov.l	@(60,r1),r7
	cmp/pl	r7
	bt	.L0603485E
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#31,r6
	mov.l	.L060347B0,r0
	jsr	@r0
	mov	#4,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#2,r0
	rts
	mov.b	r0,@(1,r1)
.L060347AA:
	.short 0x4000
.L060347AC:
	.long player_obj
.L060347B0:
	.long snd_seq_start
	endlabel func_06034772

	glabel func_060347B4
	sts.l	pr,@-r15
	bsr	func_06034862
	nop
	lds.l	@r15+,pr
	mov	#4,r0
	rts
	mov.b	r0,@(1,r1)
	endlabel func_060347B4

	glabel func_060347C2
	sts.l	pr,@-r15
	bsr	func_06034862
	nop
	lds.l	@r15+,pr
	mov	#8,r0
	rts
	mov.b	r0,@(1,r1)
	endlabel func_060347C2

	glabel func_060347D0
	sts.l	pr,@-r15
	bsr	func_060348E2
	nop
	lds.l	@r15+,pr
	bf	.L0603485E
	mov	#0,r0
	rts
	mov.b	r0,@(1,r1)
	endlabel func_060347D0

	glabel func_060347E0
	sts.l	pr,@-r15
	bsr	func_060348E2
	nop
	lds.l	@r15+,pr
	bf	.L0603485E
	mov	#9,r0
	rts
	mov.b	r0,@(1,r1)
	endlabel func_060347E0

	glabel func_060347F0
	mov.w	.L06034800,r3
	mov	#70,r0
	mov.w	r3,@(r0,r1)
	mov	#72,r0
	mov	#0,r3
	mov.w	r3,@(r0,r1)
	rts
	nop
.L06034800:
	.short 0x0500
.L06034802:
	mov.l	.L06034834,r6
	endlabel func_060347F0

	glabel func_06034804
	sts.l	pr,@-r15
	mov.l	@r6,r6
	mov.l	@(48,r6),r7
	mov.l	@(52,r6),r8
	bsr	func_06034956
	mov.l	@(56,r6),r9
	mov.l	r7,@(48,r1)
	mov.l	r8,@(52,r1)
	mov.l	r9,@(56,r1)
	mov.l	@(48,r6),r3
	mov.l	@(52,r6),r4
	bsr	func_060349D0
	mov.l	@(56,r6),r5
	mov.l	.L06034838,r2
	mov	#12,r8
	mulu.w	r8,r0
	sts	macl,r0
	add	r0,r2
	mov.l	r3,@r2
	lds.l	@r15+,pr
	mov.l	r4,@(4,r2)
	rts
	mov.l	r5,@(8,r2)
	.byte 0x00, 0x00
.L06034834:
	.long player_obj
.L06034838:
	.long D_060FFE28
	endlabel func_06034804

	glabel func_0603483C
	sts.l	pr,@-r15
	mov.l	@(4,r1),r6
	mov.b	@(2,r1),r0
	mov	#12,r4
	muls.w	r4,r0
	add	#4,r6
	sts	macl,r0
	add	r0,r6
	mov.l	@r6,r7
	mov.l	@(4,r6),r8
	bsr	func_06034956
	mov.l	@(8,r6),r9
	mov.l	r7,@(48,r1)
	lds.l	@r15+,pr
	mov.l	r8,@(52,r1)
	rts
	mov.l	r9,@(56,r1)
.L0603485E:
	rts
	nop
	endlabel func_0603483C

	glabel func_06034862
	mov	#70,r0
	mov.w	@(r0,r1),r3
	add	#16,r3
	mov.w	.L060348DE,r4
	cmp/gt	r4,r3
	bf	.L06034870
	mov	r4,r3
.L06034870:
	mov.w	r3,@(r0,r1)
	mov.w	.L060348E0,r3
	mov.b	@(0,gbr),r0
	cmp/eq	#0,r0
	bf	.L0603487C
	shar	r3
.L0603487C:
	mov.w	@(22,r1),r0
	add	#2,r0
	cmp/ge	r3,r0
	bf	.L06034886
	mov	r3,r0
.L06034886:
	mov.w	r0,@(22,r1)
	mov	#72,r0
	mov	#0,r3
	mov.w	r3,@(r0,r1)
	mov.l	@(4,r1),r6
	mov.b	@(2,r1),r0
	mov	#12,r3
	muls.w	r3,r0
	add	#4,r6
	sts	macl,r0
	add	r0,r6
	endlabel func_06034862

	glabel func_0603489C
	sts.l	pr,@-r15
	mov.l	@r6,r3
	mov.l	@(4,r6),r4
	mov.l	@(8,r6),r5
	mov.l	@(48,r1),r7
	mov.l	@(52,r1),r8
	bsr	func_060349D0
	mov.l	@(56,r1),r9
	mov	#70,r0
	mov.w	@(r0,r1),r0
	shlr8	r0
	dmuls.l	r0,r3
	sts	macl,r3
	mov.l	r3,@(32,r1)
	dmuls.l	r0,r4
	sts	macl,r4
	mov.l	r4,@(36,r1)
	dmuls.l	r0,r5
	sts	macl,r5
	mov.l	r5,@(40,r1)
	sub	r0,r7
	mov.l	r7,@(60,r1)
	mov.l	@(48,r1),r7
	add	r3,r7
	mov.l	r7,@(48,r1)
	mov.l	@(52,r1),r8
	add	r4,r8
	mov.l	r8,@(52,r1)
	mov.l	@(56,r1),r9
	lds.l	@r15+,pr
	add	r5,r9
	rts
	mov.l	r9,@(56,r1)
.L060348DE:
	.short 0x2000
.L060348E0:
	.short 0x0100
	endlabel func_0603489C

	glabel func_060348E2
	mov	#70,r0
	mov.w	@(r0,r1),r3
	add	#16,r3
	mov.w	.L0603494C,r4
	cmp/gt	r4,r3
	bf	.L060348F0
	mov	r4,r3
.L060348F0:
	mov.w	r3,@(r0,r1)
	mov.w	.L0603494E,r3
	mov.b	@(0,gbr),r0
	cmp/eq	#0,r0
	bf	.L060348FC
	shar	r3
.L060348FC:
	mov.w	@(22,r1),r0
	add	#2,r0
	cmp/ge	r3,r0
	bf	.L06034906
	mov	r3,r0
.L06034906:
	mov.w	r0,@(22,r1)
	mov	#72,r0
	mov	#0,r3
	mov.w	r3,@(r0,r1)
	mov.l	@(32,r1),r3
	mov.l	@(36,r1),r4
	mov.l	@(40,r1),r5
	mov.l	@(48,r1),r7
	add	r3,r7
	mov.l	r7,@(48,r1)
	mov.l	@(52,r1),r8
	add	r4,r8
	mov.l	r8,@(52,r1)
	mov.l	@(56,r1),r9
	add	r5,r9
	mov.l	r9,@(56,r1)
	mov.l	@(60,r1),r7
	add	#-6,r7
	cmp/pl	r7
	bt	.L06034950
	mov.l	@(4,r1),r6
	mov.b	@(2,r1),r0
	mov	#12,r3
	muls.w	r3,r0
	add	#4,r6
	sts	macl,r0
	add	r0,r6
	mov.l	@r6,r3
	mov.l	@(4,r6),r4
	mov.l	r3,@(48,r1)
	mov.l	@(8,r6),r5
	mov.l	r4,@(52,r1)
	mov.l	r5,@(56,r1)
	rts
	sett
.L0603494C:
	.short 0x2000
.L0603494E:
	.short 0x0100
.L06034950:
	mov.l	r7,@(60,r1)
	rts
	clrt
	endlabel func_060348E2

	glabel func_06034956
	sts.l	pr,@-r15
	mov	#68,r0
	mov.w	@(r0,r1),r11
	mov	#64,r2
	add	r2,r11
	shll8	r2
	mov.w	r11,@(r0,r1)
	cmp/gt	r2,r11
	bf	.L06034972
	shll	r2
	sub	r11,r2
	mov	r2,r11
	shar	r2
	neg	r2,r2
.L06034972:
	cmp/gt	r2,r11
	bt	.L0603497C
	shll	r2
	sub	r11,r2
	mov	r2,r11
.L0603497C:
	mov.l	.L060349C8,r10
	jsr	@r10
	mov	r11,r0
	shlr2	r10
	shlr2	r10
	exts.w	r10,r10
	mov	#64,r0
	mov.w	@(r0,r1),r2
	add	r10,r2
	mov.l	.L060349CC,r11
	add	#32,r2
	mov.w	r2,@(r0,r1)
	jsr	@r11
	mov	r2,r0
	shll2	r10
	shll2	r11
	dmuls.l	r10,r3
	sts	macl,r10
	dmuls.l	r11,r3
	sts	macl,r11
	add	r10,r7
	add	r11,r9
	mov	#66,r0
	mov.w	@(r0,r1),r2
	mov.w	.L060349C4,r11
	mov.l	.L060349C8,r10
	add	r11,r2
	mov.w	r2,@(r0,r1)
	jsr	@r10
	mov	r2,r0
	shll2	r10
	dmuls.l	r10,r3
	lds.l	@r15+,pr
	sts	macl,r10
	rts
	add	r10,r8
.L060349C4:
	.short 0x0400
	.byte 0x00, 0x00
.L060349C8:
	.long math_sin
.L060349CC:
	.long math_sincos
	endlabel func_06034956

	glabel func_060349D0
	sts.l	pr,@-r15
	mov	#0,r0
	sub	r7,r3
	lds	r0,mach
	sub	r8,r4
	sub	r9,r5
	lds	r0,macl
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov	r15,r7
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov	r15,r8
	mac.l	@r7+,@r8+
	mac.l	@r7+,@r8+
	mac.l	@r7+,@r8+
	add	#24,r15
	mov.l	.L06034A38,r9
	jsr	@r9
	sts	mach,r0
	mov	r0,r7
	shll16	r0
	mov	#-128,r14
	shll	r14
	mov	r3,r8
	shlr16	r8
	mov.l	r0,@(0,r14)
	exts.w	r8,r8
	shll16	r3
	mov.l	r8,@(16,r14)
	mov.l	r3,@(20,r14)
	mov	r4,r8
	shlr16	r8
	exts.w	r8,r8
	shll16	r4
	mov.l	@(28,r14),r3
	mov.l	r0,@(0,r14)
	mov.l	r8,@(16,r14)
	mov.l	r4,@(20,r14)
	mov	r5,r8
	shlr16	r8
	exts.w	r8,r8
	shll16	r5
	mov.l	@(28,r14),r4
	mov.l	r0,@(0,r14)
	mov.l	r8,@(16,r14)
	mov.l	r5,@(20,r14)
	lds.l	@r15+,pr
	rts
	mov.l	@(28,r14),r5
.L06034A38:
	.long math_sqrt
	endlabel func_060349D0

	glabel func_06034A3C
	mov.b	@(3,r1),r0
	add	#4,r0
	mov.b	r0,@(3,r1)
	exts.b	r0,r0
	cmp/pz	r0
	bt	.L06034A4A
	neg	r0,r0
.L06034A4A:
	shll8	r0
	shll	r0
	mov	#1,r4
	shll16	r4
	sub	r0,r4
	mov	r4,r5
	shlr2	r5
	sub	r5,r4
	mov.b	@(2,r1),r0
	shll8	r0
	shlr2	r0
	shlr	r0
	mov.l	.L06034AF8,r2
	mov.l	.L06034AFC,r3
	add	r0,r2
	add	r0,r3
	mov	#16,r5
	mov.w	.L06034AF0,r12
	mov.w	.L06034AF2,r13
	mov.w	.L06034AF4,r14
.L06034A72:
	mov	#-1,r9
	mov.w	@r2+,r6
	extu.w	r9,r9
	sub	r6,r9
	mov	r9,r10
	mov	r9,r11
	and	r12,r9
	dmuls.l	r9,r4
	and	r13,r10
	sts	macl,r9
	dmuls.l	r10,r4
	and	r14,r11
	sts	macl,r10
	shlr16	r9
	dmuls.l	r11,r4
	shlr16	r10
	sts	macl,r11
	mov	r6,r7
	shlr16	r11
	mov	r6,r8
	and	r12,r6
	and	r13,r7
	and	r14,r8
	add	r6,r9
	add	r7,r10
	add	r8,r11
	and	r12,r9
	and	r13,r10
	and	r14,r11
	or	r10,r9
	or	r11,r9
	mov	#1,r0
	shll16	r0
	shlr	r0
	or	r0,r9
	mov.w	r9,@r3
	dt	r5
	bf/s	.L06034A72
	add	#2,r3
	sts.l	pr,@-r15
	mov.l	.L06034AFC,r4
	mov.l	.L06034B00,r5
	mov.w	.L06034AF6,r0
	shll2	r0
	shll	r0
	add	r0,r5
	mov.w	@(4,r5),r0
	mov.l	.L06034B04,r5
	shll	r0
	shll2	r0
	mov	#32,r6
	add	r0,r5
	mov.b	@(2,r1),r0
	mov.l	.L06034B08,r8
	swap.b	r0,r7
	add	r7,r5
	shlr2	r7
	shlr	r7
	jsr	@r8
	add	r7,r4
	lds.l	@r15+,pr
	rts
	nop
.L06034AF0:
	.short 0x001F
.L06034AF2:
	.short 0x03E0
.L06034AF4:
	.short 0x7C00
.L06034AF6:
	.short 0x0025
.L06034AF8:
	.long D_06034B0C
.L06034AFC:
	.long D_06034BAC
.L06034B00:
	.long sprite_texture_table
.L06034B04:
	.long VDP1_VRAM
.L06034B08:
	.long dma_queue_xfer
	endlabel func_06034A3C

	.section .data.06034B0C,"aw",@progbits
	.p2align 2
	dlabel D_06034B0C
	.byte 0x4E, 0x31, 0x30, 0x14, 0x30, 0x18, 0x20, 0x18, 0x10, 0x1C, 0x08, 0x1F, 0x08, 0x5F, 0x10, 0x9F
	.byte 0x20, 0x9F, 0x2C, 0x9F, 0x38, 0xDF, 0x45, 0x3F, 0x55, 0x9F, 0x66, 0x9F, 0x73, 0x3F, 0x7F, 0xFF
	.byte 0x43, 0x6C, 0x45, 0xEF, 0x45, 0xEF, 0x46, 0x10, 0x4A, 0x10, 0x4A, 0x31, 0x4E, 0x31, 0x4E, 0x52
	.byte 0x52, 0x73, 0x56, 0x94, 0x5A, 0xB5, 0x62, 0xF7, 0x67, 0x39, 0x6F, 0x7B, 0x77, 0xBD, 0x7F, 0xFF
	.byte 0x42, 0x10, 0x02, 0x60, 0x02, 0x80, 0x02, 0xA0, 0x02, 0xC0, 0x03, 0x00, 0x03, 0x20, 0x03, 0x40
	.byte 0x03, 0x80, 0x03, 0xA0, 0x03, 0xE0, 0x0B, 0xE2, 0x23, 0xE8, 0x37, 0xF4, 0x47, 0xF1, 0x7F, 0xFF
	.byte 0x4C, 0x00, 0x01, 0xDF, 0x02, 0x3F, 0x02, 0x5F, 0x02, 0x7F, 0x02, 0x9F, 0x02, 0xBF, 0x02, 0xDF
	.byte 0x02, 0xFF, 0x03, 0x1F, 0x03, 0x3F, 0x03, 0x7F, 0x03, 0xFF, 0x17, 0xFF, 0x63, 0xFF, 0x7F, 0xFF
	.byte 0x42, 0x10, 0x7C, 0xC8, 0x7C, 0xC6, 0x7C, 0xC5, 0x7D, 0x04, 0x7D, 0x23, 0x7D, 0x43, 0x7D, 0x83
	.byte 0x7D, 0xE4, 0x7E, 0x25, 0x7E, 0x65, 0x7E, 0xA6, 0x7E, 0xE7, 0x7F, 0x48, 0x7F, 0x98, 0x7F, 0xFF
	dlabel D_06034BAC
	.byte 0x4E, 0x31, 0x30, 0x14, 0x30, 0x18, 0x20, 0x18, 0x10, 0x1C, 0x08, 0x1F, 0x08, 0x5F, 0x10, 0x9F
	.byte 0x20, 0x9F, 0x2C, 0x9F, 0x38, 0xDF, 0x45, 0x3F, 0x55, 0x9F, 0x66, 0x9F, 0x73, 0x3F, 0x7F, 0xFF
	.byte 0x43, 0x6C, 0x45, 0xEF, 0x45, 0xEF, 0x46, 0x10, 0x4A, 0x10, 0x4A, 0x31, 0x4E, 0x31, 0x4E, 0x52
	.byte 0x52, 0x73, 0x56, 0x94, 0x5A, 0xB5, 0x62, 0xF7, 0x67, 0x39, 0x6F, 0x7B, 0x77, 0xBD, 0x7F, 0xFF
	.byte 0x42, 0x10, 0x02, 0x60, 0x02, 0x80, 0x02, 0xA0, 0x02, 0xC0, 0x03, 0x00, 0x03, 0x20, 0x03, 0x40
	.byte 0x03, 0x80, 0x03, 0xA0, 0x03, 0xE0, 0x0B, 0xE2, 0x23, 0xE8, 0x37, 0xF4, 0x47, 0xF1, 0x7F, 0xFF
	.byte 0x4C, 0x00, 0x01, 0xDF, 0x02, 0x3F, 0x02, 0x5F, 0x02, 0x7F, 0x02, 0x9F, 0x02, 0xBF, 0x02, 0xDF
	.byte 0x02, 0xFF, 0x03, 0x1F, 0x03, 0x3F, 0x03, 0x7F, 0x03, 0xFF, 0x17, 0xFF, 0x63, 0xFF, 0x7F, 0xFF
	.byte 0x42, 0x10, 0x7C, 0xC8, 0x7C, 0xC6, 0x7C, 0xC5, 0x7D, 0x04, 0x7D, 0x23, 0x7D, 0x43, 0x7D, 0x83
	.byte 0x7D, 0xE4, 0x7E, 0x25, 0x7E, 0x65, 0x7E, 0xA6, 0x7E, 0xE7, 0x7F, 0x48, 0x7F, 0x98, 0x7F, 0xFF
