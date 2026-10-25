	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060111D0,"ax",@progbits
	.p2align 2

	glabel func_060111D0
	sts.l	pr,@-r15
	mov.l	.L06011238,r2
	mov.b	@(20,gbr),r0
	shll	r0
	mov.w	@(r0,r2),r0
	mov.l	r0,@(736,gbr)
	mov.b	@(20,gbr),r0
	mov.l	.L0601123C,r4
	shll2	r0
	mov.l	@(r0,r4),r4
	mov	r4,r0
	mov.l	r0,@(732,gbr)
	mov.l	.L06011240,r8
	mov.l	.L06011244,r9
	mov.l	.L06011248,r10
	mov	r8,r0
	add	#4,r0
	mov.l	r0,@r8
	mov	r9,r0
	add	#4,r0
	mov.l	r0,@r9
	mov	#-1,r0
	mov.l	r0,@(4,r8)
	mov.l	r0,@(4,r9)
	dlabel lbl_06011200
	mov	#0,r11
	mov	#0,r7
.L06011204:
	mov.w	@r4,r0
	cmp/pz	r0
	bf	.L06011250
	add	#1,r7
	mov.w	@(2,r4),r0
	mov	r0,r6
	mov	r8,r2
	mov	#4,r5
	bsr	func_06011806
	mov	#0,r0
	add	#2,r2
	mov.w	r11,@r2
	mov.w	@(6,r4),r0
	mov	r0,r6
	mov	r9,r2
	mov	#4,r5
	bsr	func_06011806
	mov	#0,r0
	add	#2,r2
	mov.w	r11,@r2
	mov.l	.L0601124C,r0
	mov.l	r0,@r10
	add	#4,r10
	add	#16,r4
	bra	.L06011204
	add	#1,r11
.L06011238:
	.long D_060111B0
.L0601123C:
	.long D_06011AA4
.L06011240:
	.long D_060FBFFC
.L06011244:
	.long D_060FCBFC
.L06011248:
	.long D_060FD7FC
.L0601124C:
	.long 0x0001FFFF
.L06011250:
	mov	r7,r0
	mov.l	r0,@(912,gbr)
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_060111D0

	glabel func_0601125A
	sts.l	pr,@-r15
	mov.l	.L06011278,r2
	mov.b	@(20,gbr),r0
	shll	r0
	mov.w	@(r0,r2),r0
	mov.l	r0,@(736,gbr)
	mov.b	@(20,gbr),r0
	mov.l	.L0601127C,r2
	mov.w	@r2,r7
	cmp/eq	r7,r0
	bf	.L06011284
	mov.l	.L06011280,r2
	bra	.L0601128A
	mov	r2,r4
	.byte 0x00, 0x00
.L06011278:
	.long D_060111B0
.L0601127C:
	.long D_002FBFFE
.L06011280:
	.long 0x002F9004
.L06011284:
	mov.l	.L060112E0,r4
	shll2	r0
	mov.l	@(r0,r4),r4
.L0601128A:
	mov	r4,r0
	mov.l	r0,@(732,gbr)
	mov.l	.L060112E4,r8
	mov.l	.L060112E8,r9
	mov.l	.L060112EC,r10
	mov	r8,r0
	add	#4,r0
	mov.l	r0,@r8
	mov	r9,r0
	add	#4,r0
	mov.l	r0,@r9
	mov	#-1,r0
	mov.l	r0,@(4,r8)
	mov.l	r0,@(4,r9)
	mov	#0,r11
	mov	#0,r7
.L060112AA:
	mov.w	@r4,r0
	cmp/pz	r0
	bf	.L060112F4
	add	#1,r7
	mov.w	@(2,r4),r0
	mov	r0,r6
	mov	r8,r2
	mov	#4,r5
	bsr	func_06011806
	mov	#0,r0
	add	#2,r2
	mov.w	r11,@r2
	mov.w	@(6,r4),r0
	mov	r0,r6
	mov	r9,r2
	mov	#4,r5
	bsr	func_06011806
	mov	#0,r0
	add	#2,r2
	mov.w	r11,@r2
	mov.l	.L060112F0,r0
	mov.l	r0,@r10
	add	#4,r10
	add	#16,r4
	bra	.L060112AA
	add	#1,r11
	.byte 0x00, 0x00
.L060112E0:
	.long D_06011AA4
.L060112E4:
	.long D_060FBFFC
.L060112E8:
	.long D_060FCBFC
.L060112EC:
	.long D_060FD7FC
.L060112F0:
	.long 0x0001FFFF
.L060112F4:
	mov	r7,r0
	mov.l	r0,@(912,gbr)
	mov.l	.L0601132C,r3
	mov.w	@(0,r3),r0
	mov	r0,r4
	mov.w	@(8,r3),r0
	mov	r0,r5
	mov.l	.L06011330,r6
	mov.l	.L06011334,r7
	bsr	func_060113FA
	nop
	mov.b	@(30,gbr),r0
	tst	r0,r0
	bt	.L06011322
	mov.l	.L0601132C,r3
	mov.w	@(0,r3),r0
	mov	r0,r4
	mov.w	@(8,r3),r0
	mov	r0,r5
	mov.l	.L06011338,r6
	mov.l	.L0601133C,r7
	bsr	func_060113FA
	nop
.L06011322:
	bsr	func_0601139C
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0601132C:
	.long player_trail
.L06011330:
	.long D_060FD7FE
.L06011334:
	.long spawn_win
.L06011338:
	.long D_060FD7FF
.L0601133C:
	.long spawn_win_p2
	endlabel func_0601125A

	glabel func_06011340
	sts.l	pr,@-r15
	mov.l	.L0601137C,r2
.L06011344:
	mov.l	@r4,r0
	cmp/pz	r0
	bf	.L06011390
	mov.l	.L06011380,r6
	mov.l	.L06011384,r0
	jsr	@r0
	nop
	mov	#8,r0
	mov.l	r6,@(r0,r3)
	mov	r4,r11
	add	#16,r4
	mov.l	.L06011388,r12
	mov.b	@(20,gbr),r0
	shll2	r0
	mov.l	@(r0,r12),r12
	mov.b	@(0,r11),r0
	shll2	r0
	shll2	r0
	add	r0,r12
	mov.w	@(14,r12),r0
	mov.l	.L0601138C,r13
	shll2	r0
	mov.l	@(r0,r13),r0
	jsr	@r0
	nop
	bra	.L06011344
	nop
	.byte 0x00, 0x00
.L0601137C:
	.long obj_list_stage
.L06011380:
	.long D_06011398
.L06011384:
	.long obj_alloc
.L06011388:
	.long D_06011A24
.L0601138C:
	.long D_060118B4
.L06011390:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x09
	dlabel D_06011398
	.byte 0x00, 0x00, 0x00, 0x00
	endlabel func_06011340

	glabel func_0601139C
	sts.l	pr,@-r15
	mov.l	.L060113D8,r2
	mov.l	.L060113DC,r6
	mov.l	@(912,gbr),r0
	mov	r0,r5
	tst	r5,r5
	bt	.L060113F4
	mov.w	.L060113D6,r4
	mov	#0,r9
.L060113AE:
	mov.b	@(1,r6),r0
	cmp/eq	#2,r0
	bt	.L060113EA
	cmp/eq	#-2,r0
	bt	.L060113EA
	mov.w	@(2,r6),r0
	tst	r4,r0
	bt	.L060113C4
	swap.b	r0,r0
	tst	r4,r0
	bf	.L060113E0
.L060113C4:
	mov.b	@(1,r6),r0
	cmp/eq	#1,r0
	mov	#0,r0
	mov.b	r0,@(1,r6)
	bf	.L060113D2
	bsr	func_060114A8
	nop
.L060113D2:
	bra	.L060113EA
	nop
.L060113D6:
	.short 0x00FF
.L060113D8:
	.long obj_list_stage
.L060113DC:
	.long D_060FD7FC
.L060113E0:
	mov.b	@(1,r6),r0
	cmp/eq	#0,r0
	bf	.L060113EA
	mov	#-1,r0
	mov.b	r0,@(1,r6)
.L060113EA:
	add	#1,r9
	add	#4,r6
	add	#-1,r5
	cmp/pl	r5
	bt	.L060113AE
.L060113F4:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_0601139C

	glabel func_060113FA
	mov.l	r5,@-r15
	mov.l	@(736,gbr),r0
	mov	r0,r8
	mov	r4,r9
	sub	r8,r9
	cmp/pz	r9
	bt	.L0601140A
	mov	#0,r9
.L0601140A:
	mov	r4,r10
	add	r8,r10
	mov.l	.L06011420,r4
.L06011410:
	mov.w	@r4,r0
	cmp/pz	r0
	bf	.L06011424
	cmp/ge	r9,r0
	bt	.L06011424
	bra	.L06011410
	add	#4,r4
	.byte 0x00, 0x00
.L06011420:
	.long D_060FC000
.L06011424:
	mov	r4,r0
	mov.l	r0,@(0,r7)
	mov	r4,r5
	mov.w	@r5,r0
	cmp/gt	r10,r0
	bt	.L0601144C
.L06011430:
	mov.w	@r5,r0
	cmp/pz	r0
	bf	.L0601144C
	cmp/gt	r10,r0
	bt	.L0601144C
	add	#2,r5
	mov.w	@r5,r14
	shll2	r14
	add	r6,r14
	mov.b	@r14,r0
	and	#15,r0
	mov.b	r0,@r14
	bra	.L06011430
	add	#2,r5
.L0601144C:
	mov	r5,r0
	mov.l	r0,@(8,r7)
	mov.l	@r15+,r5
	mov.l	@(736,gbr),r0
	mov	r0,r8
	mov	r5,r9
	sub	r8,r9
	cmp/pz	r9
	bt	.L06011460
	mov	#0,r9
.L06011460:
	mov	r5,r10
	add	r8,r10
	mov.l	.L06011474,r4
.L06011466:
	mov.w	@r4,r0
	cmp/pz	r0
	bf	.L06011478
	cmp/ge	r9,r0
	bt	.L06011478
	bra	.L06011466
	add	#4,r4
.L06011474:
	.long D_060FCC00
.L06011478:
	mov	r4,r0
	mov.l	r0,@(16,r7)
	mov	r4,r5
	mov.w	@r5,r0
	cmp/gt	r10,r0
	bt	.L060114A0
.L06011484:
	mov.w	@r5,r0
	cmp/pz	r0
	bf	.L060114A0
	cmp/gt	r10,r0
	bt	.L060114A0
	add	#2,r5
	mov.w	@r5,r14
	shll2	r14
	add	r6,r14
	mov.b	@r14,r0
	and	#240,r0
	mov.b	r0,@r14
	bra	.L06011484
	add	#2,r5
.L060114A0:
	mov	r5,r0
	mov.l	r0,@(24,r7)
	rts
	nop
	endlabel func_060113FA

	glabel func_060114A8
	sts.l	pr,@-r15
	mov.l	.L060114E0,r0
	jsr	@r0
	nop
	mov	#8,r0
	mov.l	r6,@(r0,r3)
	mov.l	@(732,gbr),r0
	mov	r0,r11
	mov.l	.L060114E4,r12
	mov.b	@(20,gbr),r0
	shll2	r0
	mov.l	@(r0,r12),r12
	mov	r9,r0
	shll2	r0
	shll2	r0
	add	r0,r11
	mov.b	@(0,r11),r0
	shll2	r0
	shll2	r0
	add	r0,r12
	mov.w	@(14,r12),r0
	mov.l	.L060114E8,r13
	shll2	r0
	mov.l	@(r0,r13),r0
	lds.l	@r15+,pr
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L060114E0:
	.long obj_alloc
.L060114E4:
	.long D_06011A24
.L060114E8:
	.long D_060118B4
	endlabel func_060114A8

	glabel func_060114EC
	mov.l	.L06011528,r12
	mov.b	@(20,gbr),r0
	shll2	r0
	mov.l	@(r0,r12),r12
.L060114F4:
	mov.l	@r12+,r13
	cmp/pz	r13
	bf	.L06011534
	mov.w	@r12+,r0
	cmp/eq	#-1,r0
	bt	.L06011514
	mov.l	.L0601152C,r7
	mov.w	.L06011526,r14
	cmp/ge	r14,r0
	bt	.L0601150A
	extu.w	r0,r0
.L0601150A:
	shll2	r0
	shll	r0
	add	r7,r0
	mov.l	.L06011530,r14
	add	r0,r14
.L06011514:
	mov.w	@r12+,r7
	shll2	r7
.L06011518:
	mov.w	@r13+,r0
	mov.w	r0,@r14
	add	#2,r14
	dt	r7
	bf	.L06011518
	bra	.L060114F4
	nop
.L06011526:
	.short 0xF800
.L06011528:
	.long D_06011A64
.L0601152C:
	.long 0x0000C000
.L06011530:
	.long VDP1_VRAM
.L06011534:
	rts
	nop
	endlabel func_060114EC

	glabel func_06011538
	sts.l	pr,@-r15
	mov.l	.L06011574,r3
	mov.w	@(0,r3),r0
	mov	r0,r4
	mov.w	@(8,r3),r0
	mov	r0,r5
	mov.l	.L06011578,r6
	mov.l	.L0601157C,r7
	bsr	func_060113FA
	nop
	mov.b	@(30,gbr),r0
	tst	r0,r0
	bt	.L06011564
	mov.l	.L06011574,r3
	mov.w	@(0,r3),r0
	mov	r0,r4
	mov.w	@(8,r3),r0
	mov	r0,r5
	mov.l	.L06011580,r6
	mov.l	.L06011584,r7
	bsr	func_060113FA
	nop
.L06011564:
	bsr	func_0601139C
	nop
	mov.l	.L06011588,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L06011574:
	.long player_trail
.L06011578:
	.long D_060FD7FE
.L0601157C:
	.long spawn_win
.L06011580:
	.long D_060FD7FF
.L06011584:
	.long spawn_win_p2
.L06011588:
	.long func_0601158C
	endlabel func_06011538

	glabel func_0601158C
	sts.l	pr,@-r15
	mov	#0,r2
	mov.l	.L060115B0,r6
	mov.l	.L060115B4,r7
	bsr	func_060115C0
	nop
	mov.b	@(30,gbr),r0
	tst	r0,r0
	bt	.L060115A8
	mov	#1,r2
	mov.l	.L060115B8,r6
	mov.l	.L060115BC,r7
	bsr	func_060115C0
	nop
.L060115A8:
	lds.l	@r15+,pr
	bra	func_0601139C
	nop
	.byte 0x00, 0x00
.L060115B0:
	.long D_060FD7FE
.L060115B4:
	.long spawn_win
.L060115B8:
	.long D_060FD7FF
.L060115BC:
	.long spawn_win_p2
	endlabel func_0601158C

	glabel func_060115C0
	mov.l	.L06011600,r3
	mov	r2,r0
	shll8	r0
	shll2	r0
	shll2	r0
	add	r0,r3
	mov.l	.L06011604,r0
	add	r2,r0
	add	r2,r0
	mov.w	@r0,r0
	add	#-16,r0
	mov.w	.L060115FE,r11
	and	r11,r0
	add	r0,r3
	mov.l	.L06011608,r4
	mov	r2,r0
	shll2	r0
	add	r0,r4
	mov.l	@r4,r4
	mov.w	@(0,r3),r0
	mov.l	@(48,r4),r4
	swap.w	r4,r4
	exts.w	r4,r4
	cmp/eq	r0,r4
	bt	.L060115FA
	sts.l	pr,@-r15
	bsr	func_0601160C
	nop
	lds.l	@r15+,pr
.L060115FA:
	bra	func_060116E6
	nop
.L060115FE:
	.short 0x0FF0
.L06011600:
	.long player_trail
.L06011604:
	.long player_trail_head
.L06011608:
	.long player_obj
	endlabel func_060115C0

	glabel func_0601160C
	mov.l	.L06011644,r10
	cmp/gt	r0,r4
	bt	.L0601168C
	mov.l	@(736,gbr),r0
	neg	r0,r9
	add	r4,r9
	mov.l	@(0,r7),r0
	mov	r0,r5
	mov.w	@r5,r8
	cmp/pz	r8
	bf	.L06011626
	cmp/gt	r8,r9
	bt	.L0601164A
.L06011626:
	add	#-4,r5
	cmp/eq	r10,r5
	bt	.L06011648
	mov.w	@r5,r8
	cmp/gt	r8,r9
	bt	.L06011648
	add	#2,r5
	mov.w	@r5,r14
	shll2	r14
	add	r6,r14
	mov.b	@r14,r0
	and	#15,r0
	mov.b	r0,@r14
	bra	.L06011626
	add	#-2,r5
.L06011644:
	.long D_060FBFFC
.L06011648:
	add	#4,r5
.L0601164A:
	mov	r5,r0
	mov.l	r0,@(0,r7)
	mov.l	@(736,gbr),r0
	mov	r0,r9
	add	r4,r9
	mov.l	@(8,r7),r0
	mov	r0,r5
	mov.w	@r5,r8
	cmp/pz	r8
	bf	.L06011662
	cmp/gt	r8,r9
	bt	.L06011684
.L06011662:
	add	#-4,r5
	cmp/eq	r10,r5
	bt	.L06011682
	mov.w	@r5,r8
	cmp/gt	r8,r9
	bt	.L06011682
	add	#2,r5
	mov.w	@r5,r14
	shll2	r14
	add	r6,r14
	mov.b	@r14,r0
	mov	r0,r13
	or	#240,r0
	mov.b	r0,@r14
	bra	.L06011662
	add	#-2,r5
.L06011682:
	add	#4,r5
.L06011684:
	mov	r5,r0
	mov.l	r0,@(8,r7)
	rts
	nop
.L0601168C:
	mov.l	@(736,gbr),r0
	mov	r0,r9
	add	r4,r9
	mov.l	@(8,r7),r0
	mov	r0,r5
.L06011696:
	mov.w	@r5,r8
	cmp/pz	r8
	bf	.L060116B2
	cmp/gt	r9,r8
	bt	.L060116B2
	add	#2,r5
	mov.w	@r5,r14
	shll2	r14
	add	r6,r14
	mov.b	@r14,r0
	and	#15,r0
	mov.b	r0,@r14
	bra	.L06011696
	add	#2,r5
.L060116B2:
	mov	r5,r0
	mov.l	r0,@(8,r7)
	mov.l	@(736,gbr),r0
	neg	r0,r9
	add	r4,r9
	mov.l	@(0,r7),r0
	mov	r0,r5
.L060116C0:
	mov.w	@r5,r8
	cmp/pz	r8
	bf	.L060116DE
	cmp/gt	r9,r8
	bt	.L060116DE
	add	#2,r5
	mov.w	@r5,r14
	shll2	r14
	add	r6,r14
	mov.b	@r14,r0
	mov	r0,r13
	or	#240,r0
	mov.b	r0,@r14
	bra	.L060116C0
	add	#2,r5
.L060116DE:
	mov	r5,r0
	mov.l	r0,@(0,r7)
	rts
	nop
	endlabel func_0601160C

	glabel func_060116E6
	mov.l	.L06011720,r3
	mov	r2,r0
	shll8	r0
	shll2	r0
	shll2	r0
	add	r0,r3
	mov.l	.L06011724,r0
	add	r2,r0
	add	r2,r0
	mov.w	@r0,r0
	add	#-16,r0
	mov.w	.L0601171C,r11
	and	r11,r0
	add	r0,r3
	mov.l	.L06011728,r4
	mov	r2,r0
	shll2	r0
	add	r0,r4
	mov.l	@r4,r4
	mov.w	@(8,r3),r0
	mov.l	@(56,r4),r4
	swap.w	r4,r4
	exts.w	r4,r4
	cmp/eq	r0,r4
	bf	.L0601172C
	rts
	nop
.L0601171C:
	.short 0x0FF0
	.byte 0x00, 0x00
.L06011720:
	.long player_trail
.L06011724:
	.long player_trail_head
.L06011728:
	.long player_obj
.L0601172C:
	mov.l	.L06011764,r10
	cmp/gt	r0,r4
	bt	.L060117AC
	mov.l	@(736,gbr),r0
	neg	r0,r9
	add	r4,r9
	mov.l	@(16,r7),r0
	mov	r0,r5
	mov.w	@r5,r8
	cmp/pz	r8
	bf	.L06011746
	cmp/gt	r8,r9
	bt	.L0601176A
.L06011746:
	add	#-4,r5
	cmp/eq	r10,r5
	bt	.L06011768
	mov.w	@r5,r8
	cmp/gt	r8,r9
	bt	.L06011768
	add	#2,r5
	mov.w	@r5,r14
	shll2	r14
	add	r6,r14
	mov.b	@r14,r0
	and	#240,r0
	mov.b	r0,@r14
	bra	.L06011746
	add	#-2,r5
.L06011764:
	.long D_060FCBFC
.L06011768:
	add	#4,r5
.L0601176A:
	mov	r5,r0
	mov.l	r0,@(16,r7)
	mov.l	@(736,gbr),r0
	mov	r0,r9
	add	r4,r9
	mov.l	@(24,r7),r0
	mov	r0,r5
	mov.w	@r5,r8
	cmp/pz	r8
	bf	.L06011782
	cmp/gt	r8,r9
	bt	.L060117A4
.L06011782:
	add	#-4,r5
	cmp/eq	r10,r5
	bt	.L060117A2
	mov.w	@r5,r8
	cmp/gt	r8,r9
	bt	.L060117A2
	add	#2,r5
	mov.w	@r5,r14
	shll2	r14
	add	r6,r14
	mov.b	@r14,r0
	mov	r0,r13
	or	#15,r0
	mov.b	r0,@r14
	bra	.L06011782
	add	#-2,r5
.L060117A2:
	add	#4,r5
.L060117A4:
	mov	r5,r0
	mov.l	r0,@(24,r7)
	rts
	nop
.L060117AC:
	mov.l	@(736,gbr),r0
	mov	r0,r9
	add	r4,r9
	mov.l	@(24,r7),r0
	mov	r0,r5
.L060117B6:
	mov.w	@r5,r8
	cmp/pz	r8
	bf	.L060117D2
	cmp/gt	r9,r8
	bt	.L060117D2
	add	#2,r5
	mov.w	@r5,r14
	shll2	r14
	add	r6,r14
	mov.b	@r14,r0
	and	#240,r0
	mov.b	r0,@r14
	bra	.L060117B6
	add	#2,r5
.L060117D2:
	mov	r5,r0
	mov.l	r0,@(24,r7)
	mov.l	@(736,gbr),r0
	neg	r0,r9
	add	r4,r9
	mov.l	@(16,r7),r0
	mov	r0,r5
.L060117E0:
	mov.w	@r5,r8
	cmp/pz	r8
	bf	.L060117FE
	cmp/gt	r9,r8
	bt	.L060117FE
	add	#2,r5
	mov.w	@r5,r14
	shll2	r14
	add	r6,r14
	mov.b	@r14,r0
	mov	r0,r13
	or	#15,r0
	mov.b	r0,@r14
	bra	.L060117E0
	add	#2,r5
.L060117FE:
	mov	r5,r0
	mov.l	r0,@(16,r7)
	rts
	nop
	endlabel func_060116E6

	glabel func_06011806
	mov.l	r2,@-r15
	add	#4,r2
.L0601180A:
	mov.w	@(r0,r2),r14
	cmp/pz	r14
	bf	.L06011818
	cmp/gt	r6,r14
	bt	.L06011818
	bra	.L0601180A
	add	r5,r2
.L06011818:
	mov.l	@r15+,r14
	mov.l	@r14,r12
	add	r5,r12
	mov.l	r12,@r14
	mov	r12,r13
	add	r5,r13
	mov	r12,r5
	sub	r2,r5
	shlr2	r5
.L0601182A:
	add	#-4,r12
	mov.l	@r12,r14
	mov.l	r14,@-r13
	dt	r5
	bf	.L0601182A
	mov.w	r6,@(r0,r2)
	rts
	nop
	.byte 0x60, 0x22
	endlabel func_06011806

	.section .data.0601183C,"aw",@progbits
	.p2align 2
	.byte 0x30, 0x58, 0x22, 0x02, 0x6D, 0x63, 0x6C, 0x63, 0x3C, 0x5C, 0x60, 0x22, 0x30, 0x5C, 0x30, 0xD8
	.byte 0x65, 0x03, 0x45, 0x09, 0x6E, 0xC6, 0x2D, 0xE2, 0x7D, 0x04, 0x45, 0x10, 0x8B, 0xFA, 0x00, 0x0B
	.byte 0x00, 0x09, 0x07, 0x08, 0x11, 0x04, 0x10, 0x01, 0x30, 0x03, 0x05, 0x01
