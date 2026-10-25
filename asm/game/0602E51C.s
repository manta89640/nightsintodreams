	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0602E51C,"ax",@progbits
	.p2align 2
	.byte 0xFF, 0x09

	glabel func_0602E51E
	sts.l	pr,@-r15
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#240,r0
	ldc	r0,sr
	mov	#0,r0
	mov.w	r0,@(116,gbr)
	mov.w	r0,@(118,gbr)
	mov	#1,r0
	mov.b	r0,@(110,gbr)
	mov.l	.L0602E65C,r0
	jsr	@r0
	nop
	mov.l	.L0602E660,r0
	jsr	@r0
	nop
	mov.l	.L0602E664,r0
	jsr	@r0
	nop
	mov.l	.L0602E668,r0
	jsr	@r0
	nop
	mov.l	.L0602E66C,r0
	jsr	@r0
	nop
	mov.l	.L0602E670,r0
	jsr	@r0
	nop
	mov.l	.L0602E674,r2
	mov.w	@r2,r0
	cmp/pz	r0
	bt	.L0602E568
	mov.b	@(8,r2),r0
	mov.b	r0,@(21,gbr)
.L0602E568:
	mov.b	@(21,gbr),r0
	mov.b	r0,@(20,gbr)
	mov	#0,r0
	mov.b	r0,@(30,gbr)
	mov.b	r0,@(31,gbr)
	mov.l	.L0602E678,r0
	jsr	@r0
	nop
	mov.l	.L0602E67C,r0
	jsr	@r0
	nop
	mov.l	.L0602E680,r0
	mov.l	r0,@(544,gbr)
	mov.l	.L0602E684,r0
	mov.l	r0,@(548,gbr)
	mov.l	.L0602E688,r0
	mov.l	r0,@(784,gbr)
	mov.l	.L0602E688,r0
	mov.l	r0,@(788,gbr)
	mov.w	.L0602E656,r0
	mov.w	r0,@(136,gbr)
	mov.w	.L0602E658,r0
	mov.w	r0,@(138,gbr)
	mov.w	.L0602E65A,r0
	mov.w	r0,@(140,gbr)
	mov.w	.L0602E65A,r0
	mov.w	r0,@(146,gbr)
	mov.w	.L0602E65A,r0
	mov.w	r0,@(144,gbr)
	mov.w	.L0602E65A,r0
	mov.w	r0,@(142,gbr)
	mov.l	.L0602E68C,r2
	mov.l	.L0602E690,r0
	jsr	@r0
	nop
	mov.l	.L0602E694,r0
	mov.l	r0,@(12,r3)
	mov.l	.L0602E698,r2
	mov.l	.L0602E690,r0
	jsr	@r0
	nop
	mov.l	.L0602E69C,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L0602E6A0,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0602E6A4,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0602E6A0,r0
	mov.l	r0,@(56,r3)
	mov.l	.L0602E698,r2
	mov.l	.L0602E690,r0
	jsr	@r0
	nop
	mov.l	.L0602E6A8,r0
	mov.l	r0,@(12,r3)
	mov.l	.L0602E698,r2
	mov.l	.L0602E690,r0
	jsr	@r0
	nop
	mov.l	.L0602E6AC,r0
	mov.l	r0,@(12,r3)
	mov.l	.L0602E6B0,r4
	mov	#0,r0
	mov.l	r0,@r4
	mov.l	r0,@(4,r4)
	mov.l	r0,@(8,r4)
	mov.l	r0,@(12,r4)
	mov.l	r0,@(16,r4)
	mov.l	r0,@(20,r4)
	mov	#-1,r0
	mov.l	r0,@(728,gbr)
	mov	#9,r0
	mov.l	.L0602E6B4,r4
	mov.w	r0,@r4
	mov.l	.L0602E6B8,r4
	mov.w	r0,@r4
	mov.l	.L0602E6BC,r4
	mov.w	r0,@r4
	mov.l	.L0602E6C0,r4
	mov.w	r0,@r4
	mov.l	.L0602E6C4,r4
	mov.w	r0,@r4
	mov.l	.L0602E6C8,r4
	mov.w	r0,@r4
	mov.l	.L0602E6CC,r4
	mov.w	r0,@r4
	mov.l	.L0602E6D0,r4
	mov.w	r0,@r4
	mov.l	.L0602E660,r0
	jsr	@r0
	nop
	mov.l	.L0602E68C,r2
	mov.l	.L0602E6D4,r0
	jsr	@r0
	nop
	mov.l	.L0602E698,r2
	mov.l	.L0602E6D4,r0
	jsr	@r0
	nop
	mov.l	.L0602E6D8,r2
	mov.l	.L0602E6D4,r0
	jsr	@r0
	nop
	mov.l	.L0602E6DC,r2
	mov.l	.L0602E6D4,r0
	jsr	@r0
	nop
	mov.l	.L0602E6E0,r2
	mov.l	.L0602E6D4,r0
	jsr	@r0
	nop
	mov.l	.L0602E664,r0
	jsr	@r0
	nop
	mov	#-1,r0
	mov.b	r0,@(62,gbr)
	bra	lbl_0602E6E4
	lds.l	@r15+,pr
.L0602E656:
	.short 0x0140
.L0602E658:
	.short 0x0555
.L0602E65A:
	.short 0x0000
.L0602E65C:
	.long func_0600454C
.L0602E660:
	.long func_0601F068
.L0602E664:
	.long func_0601F16C
.L0602E668:
	.long func_0600D088
.L0602E66C:
	.long func_0602C390
.L0602E670:
	.long func_0602C4D0
.L0602E674:
	.long D_060D9074
.L0602E678:
	.long func_0600C9C8
.L0602E67C:
	.long func_0600C9F2
.L0602E680:
	.long func_060450F0
.L0602E684:
	.long func_060450FC
.L0602E688:
	.long 0x03000000
.L0602E68C:
	.long D_060FFFA0
.L0602E690:
	.long func_0600D0D0
.L0602E694:
	.long func_0602FF50
.L0602E698:
	.long D_060FFFA8
.L0602E69C:
	.long func_06021E2A
.L0602E6A0:
	.long 0x10000000
.L0602E6A4:
	.long 0x04000000
.L0602E6A8:
	.long func_0604E2B8
.L0602E6AC:
	.long D_060342CC + 0x180
.L0602E6B0:
	.long D_060F30A8
.L0602E6B4:
	.long func_0601F434
.L0602E6B8:
	.long func_0601F4A0
.L0602E6BC:
	.long D_0601F4AE
.L0602E6C0:
	.long func_060213DA
.L0602E6C4:
	.long func_06020578
.L0602E6C8:
	.long func_060204EE
.L0602E6CC:
	.long func_060208FA
.L0602E6D0:
	.long func_06020906
.L0602E6D4:
	.long func_0600D1F8
.L0602E6D8:
	.long D_060FFFB0
.L0602E6DC:
	.long D_060FFFB8
.L0602E6E0:
	.long D_060FFFC8
	dlabel lbl_0602E6E4
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#240,r0
	ldc	r0,sr
	sts.l	pr,@-r15
	mov.l	.L0602E830,r0
	jsr	@r0
	nop
	mov.l	.L0602E834,r1
	mov.l	@r1,r1
	mov.l	.L0602E838,r4
	mov.l	.L0602E83C,r0
	jsr	@r0
	nop
	mov.l	.L0602E840,r1
	mov.l	@r1,r1
	mov.l	.L0602E838,r4
	mov.l	.L0602E83C,r0
	jsr	@r0
	nop
	mov.l	.L0602E844,r1
	mov.l	@r1,r1
	mov.l	.L0602E838,r4
	mov.l	.L0602E83C,r0
	jsr	@r0
	nop
	mov.l	.L0602E848,r2
	mov	#1,r8
	mov.w	r8,@r2
	mov.b	@(148,gbr),r0
	tst	r0,r0
	bf	.L0602E746
	mov.b	@(21,gbr),r0
	cmp/eq	#13,r0
	bt	.L0602E734
	cmp/eq	#15,r0
	bf	.L0602E746
.L0602E734:
	mov.l	.L0602E84C,r1
	mov.l	@r1,r1
	mov.l	.L0602E838,r4
	mov.l	.L0602E83C,r0
	jsr	@r0
	nop
	mov.l	.L0602E848,r2
	mov	#-1,r8
	mov.w	r8,@r2
.L0602E746:
	mov.b	@(148,gbr),r0
	tst	r0,r0
	bt	.L0602E75C
	mov.l	.L0602E850,r1
	mov.l	@r1,r1
	mov.l	.L0602E838,r4
	mov.l	.L0602E83C,r0
	jsr	@r0
	nop
	mov	#0,r0
	mov.b	r0,@(148,gbr)
.L0602E75C:
	mov.l	.L0602E854,r5
	mov	#6,r7
.L0602E760:
	mov.l	@r5+,r1
	tst	r1,r1
	bt	.L0602E76E
	mov.l	.L0602E838,r4
	mov.l	.L0602E83C,r0
	jsr	@r0
	nop
.L0602E76E:
	dt	r7
	bf	.L0602E760
	mov	#0,r0
	mov.b	r0,@(37,gbr)
	mov.l	.L0602E858,r2
	mov.l	.L0602E85C,r0
	jsr	@r0
	nop
	mov.l	.L0602E860,r0
	mov.l	r0,@(12,r3)
	mov	#1,r0
	mov.w	r0,@(116,gbr)
	mov.w	r0,@(118,gbr)
	mov.l	.L0602E864,r0
	jsr	@r0
	nop
	mov	#1,r0
	mov.b	r0,@(34,gbr)
	mov.l	.L0602E868,r0
	jsr	@r0
	nop
	mov.l	.L0602E86C,r0
	jsr	@r0
	nop
	mov.l	.L0602E870,r0
	jsr	@r0
	nop
	mov	#0,r0
	mov.l	r0,@(8,gbr)
	mov.l	.L0602E874,r0
	mov.l	r0,@(544,gbr)
	mov.l	.L0602E878,r0
	mov.l	r0,@(548,gbr)
	mov.l	.L0602E840,r4
	mov.l	@r4,r4
	mov	#0,r8
	mov	#31,r0
	mov.b	r8,@(r0,r4)
	mov.l	r8,@(60,r4)
	mov.b	@(21,gbr),r0
	mov.b	r0,@(20,gbr)
	tst	#1,r0
	bf	.L0602E7C6
	mov.b	r0,@(22,gbr)
.L0602E7C6:
	mov.b	@(107,gbr),r0
	cmp/pl	r0
	bt	.L0602E7F6
	mov.b	@(22,gbr),r0
	cmp/pz	r0
	bf	.L0602E7F6
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L0602E890
	mov.l	.L0602E87C,r7
	mov	#40,r0
	mov.b	r0,@(7,r7)
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bf	.L0602E8AE
	mov.l	.L0602E880,r0
	jsr	@r0
	nop
	mov.l	.L0602E884,r9
	mov	#0,r0
	mov.w	r0,@(0,r9)
	mov.w	r0,@(2,r9)
	mov.w	r0,@(4,r9)
	mov.w	r0,@(6,r9)
.L0602E7F6:
	mov	#0,r0
	mov.l	r0,@(656,gbr)
	mov.l	r0,@(660,gbr)
	mov.l	r0,@(664,gbr)
	mov.l	r0,@(668,gbr)
	mov.l	r0,@(672,gbr)
	mov.l	r0,@(676,gbr)
	mov.l	r0,@(680,gbr)
	mov.l	r0,@(684,gbr)
	mov.l	r0,@(688,gbr)
	mov.l	r0,@(692,gbr)
	mov.l	r0,@(752,gbr)
	mov.l	r0,@(756,gbr)
	mov.b	r0,@(23,gbr)
	mov.b	r0,@(24,gbr)
	mov	#-1,r0
	mov.b	r0,@(25,gbr)
	mov.b	r0,@(27,gbr)
	mov	#0,r0
	mov.l	.L0602E888,r2
	mov.l	r0,@r2
	mov.l	.L0602E88C,r2
	mov.l	r0,@r2
	mov.l	.L0602E87C,r7
	mov	#40,r0
	mov.b	r0,@(7,r7)
	mov	#-1,r0
	bra	.L0602E8AE
	mov.b	r0,@(21,gbr)
.L0602E830:
	.long func_0600D290
.L0602E834:
	.long D_060F309C
.L0602E838:
	.long D_060FFFD8
.L0602E83C:
	.long func_0600D2A8
.L0602E840:
	.long D_060F3064
.L0602E844:
	.long D_060F30C0
.L0602E848:
	.long D_0602E516
.L0602E84C:
	.long D_060F306C
.L0602E850:
	.long D_060F30A4
.L0602E854:
	.long D_060F30A8
.L0602E858:
	.long D_060FFFD0
.L0602E85C:
	.long func_0600D0D0
.L0602E860:
	.long D_06031E74
.L0602E864:
	.long func_0600454C
.L0602E868:
	.long func_06004598
.L0602E86C:
	.long func_0602B93E
.L0602E870:
	.long func_0600D24A
.L0602E874:
	.long func_060450F0
.L0602E878:
	.long func_060450FC
.L0602E87C:
	.long D_060FFE50
.L0602E880:
	.long func_0604DE7C
.L0602E884:
	.long D_060FFF64
.L0602E888:
	.long D_060F30F0
.L0602E88C:
	.long D_060F30F4
.L0602E890:
	mov	#0,r0
	mov.l	.L0602EA9C,r8
	mov.l	@r8+,r9
	add	r9,r0
	mov.l	@r8+,r9
	add	r9,r0
	mov.l	@r8+,r9
	add	r9,r0
	mov.l	@r8+,r9
	add	r9,r0
	mov.l	r0,@(656,gbr)
	mov	#-1,r0
	mov.b	r0,@(27,gbr)
	mov.b	@(21,gbr),r0
	mov.b	r0,@(25,gbr)
.L0602E8AE:
	mov.l	.L0602EAA0,r2
	mov	#0,r0
	mov.l	r0,@(0,r2)
	mov.l	r0,@(4,r2)
	mov.l	.L0602EAA4,r2
	mov	#0,r0
	mov.l	r0,@(0,r2)
	mov.l	.L0602EAA8,r7
	mov	#0,r0
	mov.b	r0,@(63,gbr)
	mov.w	r0,@(70,gbr)
	mov.b	r0,@(108,gbr)
	mov.l	r0,@(576,gbr)
	mov.l	r0,@(580,gbr)
	mov.l	r0,@(588,gbr)
	mov.b	r0,@(51,gbr)
	mov.b	r0,@(106,gbr)
	mov.b	r0,@(3,r7)
	mov.b	r0,@(4,r7)
	mov.b	r0,@(6,r7)
	mov.b	r0,@(8,r7)
	mov.l	r0,@(76,gbr)
	mov.l	r0,@(80,gbr)
	mov.b	r0,@(3,r7)
	mov.b	r0,@(11,r7)
	mov.b	r0,@(10,r7)
	mov.b	r0,@(9,r7)
	mov.w	r0,@(12,r7)
	mov.b	r0,@(5,r7)
	mov	#-1,r0
	mov.b	r0,@(127,gbr)
	mov.b	@(20,gbr),r0
	shll2	r0
	mov.l	.L0602EAAC,r2
	mov.l	@(r0,r2),r0
	mov.l	r0,@(16,gbr)
	mov	#0,r0
	mov.b	r0,@(38,gbr)
	mov	#0,r8
	mov.w	@(28,gbr),r0
	mov.w	.L0602EA98,r9
	tst	r9,r0
	bf	.L0602E90A
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bt	.L0602E90C
.L0602E90A:
	mov	#1,r8
.L0602E90C:
	mov	r8,r0
	mov.b	r0,@(35,gbr)
	mov.l	.L0602EAB0,r2
	mov	#0,r0
	mov.b	r0,@r2
	mov.l	.L0602EAB4,r7
	mov	#0,r0
	mov.w	r0,@(0,r7)
	mov.l	.L0602EAB8,r7
	mov	#0,r0
	mov.w	r0,@(0,r7)
	mov	#0,r0
	mov.b	r0,@(30,gbr)
	mov	#0,r0
	mov.b	r0,@(31,gbr)
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#0,r0
	ldc	r0,sr
	mov	#0,r0
	mov.l	r0,@(716,gbr)
	mov.l	r0,@(720,gbr)
	mov.l	.L0602EABC,r3
	mov	#0,r0
	mov.w	.L0602EA9A,r7
.L0602E944:
	mov.l	r0,@r3
	mov.l	r0,@(4,r3)
	mov.l	r0,@(8,r3)
	dt	r7
	bf/s	.L0602E944
	add	#12,r3
	mov.l	.L0602EAC0,r0
	jsr	@r0
	nop
	mov.l	.L0602EAC4,r14
	jsr	@r14
	nop
	mov.l	.L0602EAC8,r2
	mov	#0,r0
	mov.l	r0,@r2
	mov	#1,r8
	shll8	r8
	shll	r8
	add	r8,r2
	mov.l	r0,@r2
	mov	#0,r0
	mov.b	r0,@(32,gbr)
	mov.l	.L0602EACC,r2
	mov.l	.L0602EAD0,r0
	jsr	@r0
	nop
	mov.l	.L0602EAD4,r0
	mov.l	r0,@(12,r3)
	mov.l	.L0602EAD8,r2
	mov.l	.L0602EAD0,r0
	jsr	@r0
	nop
	mov.l	.L0602EADC,r0
	mov.l	r0,@(12,r3)
	mov.l	.L0602EAD8,r2
	mov.l	.L0602EAD0,r0
	jsr	@r0
	nop
	mov.l	.L0602EAE0,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov	#0,r0
	mov.b	r0,@(9,r3)
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L0602E9BE
	mov.l	.L0602EAD8,r2
	mov.l	.L0602EAD0,r0
	jsr	@r0
	nop
	mov.l	.L0602EAE4,r0
	mov.l	r0,@(12,r3)
	mov.l	.L0602EAD8,r2
	mov.l	.L0602EAD0,r0
	jsr	@r0
	nop
	mov.l	.L0602EAE8,r0
	mov.l	r0,@(12,r3)
	mov.l	.L0602EAEC,r2
	mov	#0,r0
	mov.w	r0,@r2
.L0602E9BE:
	mov.l	.L0602EAD8,r2
	mov.l	.L0602EAD0,r0
	jsr	@r0
	nop
	mov.l	.L0602EAF0,r0
	mov.l	r0,@(12,r3)
	mov.l	.L0602EAD8,r2
	mov.l	.L0602EAD0,r0
	jsr	@r0
	nop
	mov.l	.L0602EAF4,r0
	mov.l	r0,@(12,r3)
	mov.l	.L0602EAD8,r2
	mov.l	.L0602EAD0,r0
	jsr	@r0
	nop
	mov.l	.L0602EAF8,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov	#0,r0
	mov.b	r0,@(9,r3)
	mov.l	.L0602EAFC,r4
	mov.l	r3,@r4
	mov.l	.L0602EB00,r4
	mov.l	r3,@r4
	mov.l	.L0602EAD8,r2
	mov.l	.L0602EAD0,r0
	jsr	@r0
	nop
	mov.l	.L0602EB04,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov	#0,r0
	mov.b	r0,@(9,r3)
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bf	.L0602EA14
	mov.l	.L0602EAD8,r2
	mov.l	.L0602EAD0,r0
	jsr	@r0
	nop
	mov.l	.L0602EB08,r0
	mov.l	r0,@(12,r3)
.L0602EA14:
	mov.l	.L0602EB0C,r2
	mov.l	.L0602EAD0,r0
	jsr	@r0
	nop
	mov.l	.L0602EB10,r0
	mov.l	r0,@(12,r3)
	mov.l	.L0602EAD8,r2
	mov.l	.L0602EAD0,r0
	jsr	@r0
	nop
	mov.l	.L0602EB14,r0
	mov.l	r0,@(12,r3)
	mov.l	.L0602EAD8,r2
	mov.l	.L0602EAD0,r0
	jsr	@r0
	nop
	mov.l	.L0602EB18,r0
	mov.l	r0,@(12,r3)
	mov	#0,r0
	mov.b	r0,@(61,gbr)
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L0602EA4E
	mov.l	.L0602EB1C,r0
	jsr	@r0
	mov	#3,r4
	mov.l	.L0602EB20,r0
	jsr	@r0
	nop
.L0602EA4E:
	mov.l	.L0602EB24,r0
	jsr	@r0
	nop
	mov.l	.L0602EB28,r0
	jsr	@r0
	nop
	mov.b	@(107,gbr),r0
	cmp/eq	#1,r0
	bf	.L0602EA8E
	mov.l	.L0602EB0C,r2
	mov.l	.L0602EAD0,r0
	jsr	@r0
	nop
	mov.l	.L0602EB2C,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L0602EB30,r2
	mov.l	r2,@(44,r3)
	mov.l	.L0602EB34,r2
	mov.l	r2,@(60,r3)
	mov.l	.L0602EB38,r0
	mov.l	r0,@(48,r3)
	mov.l	.L0602EB3C,r0
	mov.l	r0,@(52,r3)
	mov.l	.L0602EB40,r0
	mov.l	r0,@(56,r3)
	mov.l	.L0602EB44,r0
	mov.l	r0,@(32,r3)
	mov.l	.L0602EB48,r0
	mov.l	r0,@(36,r3)
	mov	#30,r0
	mov.w	r0,@(26,r3)
.L0602EA8E:
	mov.b	@(35,gbr),r0
	tst	r0,r0
	bt	.L0602EB4C
	bra	.L0602EBA4
	nop
.L0602EA98:
	.short 0x4000
.L0602EA9A:
	.short 0x0400
.L0602EA9C:
	.long D_060FFE98
.L0602EAA0:
	.long D_06043AB8
.L0602EAA4:
	.long D_060431D4
.L0602EAA8:
	.long D_060FFE50
.L0602EAAC:
	.long D_0602F06C
.L0602EAB0:
	.long D_060FF12C
.L0602EAB4:
	.long D_060FFE70
.L0602EAB8:
	.long D_060FFE80
.L0602EABC:
	.long D_060F30F8
.L0602EAC0:
	.long func_0601EB14
.L0602EAC4:
	.long func_06016818
.L0602EAC8:
	.long D_060FBBFC
.L0602EACC:
	.long D_060FFFA0
.L0602EAD0:
	.long func_0600D0D0
.L0602EAD4:
	.long lbl_060167D0
.L0602EAD8:
	.long D_060FFFA8
.L0602EADC:
	.long func_0600E890
.L0602EAE0:
	.long func_06019D8C
.L0602EAE4:
	.long func_06042268
.L0602EAE8:
	.long func_06042038
.L0602EAEC:
	.long D_0602F264
.L0602EAF0:
	.long func_0601B360
.L0602EAF4:
	.long func_0601B550
.L0602EAF8:
	.long func_06017ED8
.L0602EAFC:
	.long D_060F3088
.L0602EB00:
	.long D_060F3090
.L0602EB04:
	.long func_060168DA
.L0602EB08:
	.long func_0601B736
.L0602EB0C:
	.long D_060FFFB8
.L0602EB10:
	.long func_06011538
.L0602EB14:
	.long func_0600D7F8
.L0602EB18:
	.long lbl_060426B0
.L0602EB1C:
	.long func_06006A20
.L0602EB20:
	.long func_06006B20
.L0602EB24:
	.long func_0602B5CC
.L0602EB28:
	.long func_060111D0
.L0602EB2C:
	.long func_06019A88
.L0602EB30:
	.long D_0602ED9C
.L0602EB34:
	.long D_0602EDC4
.L0602EB38:
	.long 0x0000002D
.L0602EB3C:
	.long 0x00000018
.L0602EB40:
	.long 0x7FFFFFFF
.L0602EB44:
	.long 0xFFFFFFE7
.L0602EB48:
	.long 0x00000000
.L0602EB4C:
	mov.b	@(20,gbr),r0
	mov.l	.L0602EB68,r2
	mov.w	@r2,r7
	cmp/eq	r0,r7
	bf	.L0602EB5E
	mov.l	.L0602EB6C,r2
	mov.l	.L0602EB70,r0
	jsr	@r0
	nop
.L0602EB5E:
	mov.w	@(28,gbr),r0
	tst	#8,r0
	bf	.L0602EB74
	bra	.L0602EBA4
	nop
.L0602EB68:
	.long D_002FBFFE
.L0602EB6C:
	.long D_0602F0AC
.L0602EB70:
	.long func_0601C97C
.L0602EB74:
	mov.l	.L0602EB98,r2
.L0602EB76:
	mov.w	@r2+,r4
	cmp/pz	r4
	bf	.L0602EBA4
	mov.w	@r2+,r5
	mov.l	.L0602EB9C,r14
	jsr	@r14
	nop
	mov	r0,r5
	mov	r2,r4
	mov.l	.L0602EBA0,r14
	jsr	@r14
	nop
	add	#1,r4
	mov	#-2,r0
	and	r0,r4
	bra	.L0602EB76
	mov	r4,r2
.L0602EB98:
	.long D_0602F0B8
.L0602EB9C:
	.long func_0601CBE0
.L0602EBA0:
	.long func_0601CC88
.L0602EBA4:
	mov.w	.L0602EBC8,r0
	mov.l	.L0602EBCC,r2
	mov.w	r0,@r2
	mov.l	.L0602EBD0,r2
	mov.w	@r2,r0
	cmp/pl	r0
	bt	.L0602EBBC
	mov	#0,r0
	mov.w	r0,@r2
.L0602EBB6:
	mov.w	@r2,r0
	cmp/pl	r0
	bf	.L0602EBB6
.L0602EBBC:
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L0602EBD8
	mov.l	.L0602EBD4,r4
	bra	.L0602EBDA
	nop
.L0602EBC8:
	.short 0x0000
	.byte 0x00, 0x00
.L0602EBCC:
	.long VDP2_REGS + 0x112
.L0602EBD0:
	.long D_0602E516
.L0602EBD4:
	.long func_0602EDDE
.L0602EBD8:
	mov.l	.L0602EBF4,r4
.L0602EBDA:
	mov.b	@(0,gbr),r0
	cmp/eq	#13,r0
	bt	.L0602EC00
	mov.b	@(107,gbr),r0
	tst	r0,r0
	bf	.L0602EC0E
	mov.l	.L0602EBF8,r2
	mov.l	.L0602EBFC,r0
	jsr	@r0
	nop
	bra	.L0602EC0E
	mov.l	r4,@(12,r3)
	.byte 0x00, 0x00
.L0602EBF4:
	.long func_0602EDDE
.L0602EBF8:
	.long D_060FFFD0
.L0602EBFC:
	.long func_0600D0D0
.L0602EC00:
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bt	.L0602EC0E
	mov.w	.L0602ED4C,r0
	mov.w	r0,@(500,gbr)
	mov.w	r0,@(502,gbr)
	mov.w	r0,@(504,gbr)
.L0602EC0E:
	mov.b	@(2,gbr),r0
	mov.b	r0,@(3,gbr)
	mov	#2,r4
	mov	#0,r5
	mov.l	.L0602ED50,r0
	jsr	@r0
	mov	#16,r6
	mov	#20,r7
.L0602EC1E:
	mov.l	.L0602ED54,r0
	jsr	@r0
	nop
	dt	r7
	bf	.L0602EC1E
	mov.l	.L0602ED58,r0
	jsr	@r0
	mov	#2,r4
	mov	#2,r4
	mov	#127,r5
	mov.l	.L0602ED50,r0
	jsr	@r0
	mov	#0,r6
	mov.l	.L0602ED5C,r6
	mov.l	@r6,r0
	or	#8,r0
	mov.l	r0,@r6
	mov.l	.L0602ED60,r4
	mov.l	@r4,r4
	mov	#0,r0
	mov.b	r0,@(4,r4)
	mov	#0,r0
	mov.b	r0,@(110,gbr)
	mov.l	.L0602ED64,r4
	mov.l	@r4,r4
	mov	#0,r0
	mov.l	r0,@(36,r4)
	mov.l	@(8,r4),r12
	mov.l	@(12,r4),r13
	mov.b	@(1,r12),r0
	and	#239,r0
	mov.b	r0,@(1,r12)
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bt	.L0602EC94
	mov.b	@(1,r12),r0
	and	#223,r0
	mov.b	r0,@(1,r12)
	mov	#0,r0
	mov.l	r0,@(36,r13)
	mov.l	r0,@(40,r13)
	mov.l	r0,@(32,r13)
	mov.l	r0,@(44,r13)
	mov.w	.L0602ED4E,r0
	mov.w	r0,@(6,r4)
	mov	#0,r0
	mov.b	r0,@(0,r12)
	mov	#54,r0
	mov.w	r0,@(22,r12)
	mov.l	.L0602ED60,r3
	mov.l	@r3,r3
	mov	#0,r0
	mov.w	r0,@(20,r3)
	mov.l	.L0602ED68,r2
	mov.l	.L0602ED6C,r0
	jsr	@r0
	nop
	mov.l	.L0602ED70,r0
	mov.l	r0,@(12,r3)
.L0602EC94:
	mov.w	@(28,gbr),r0
	tst	#4,r0
	bf	.L0602EC9A
.L0602EC9A:
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#240,r0
	ldc	r0,sr
	mov	#1,r0
	mov.b	r0,@(0,gbr)
	mov.l	.L0602ED74,r1
	mov	#-1,r0
	mov.b	r0,@r1
	mov	#1,r0
	mov.w	r0,@(116,gbr)
	mov	#0,r0
	mov.b	r0,@(34,gbr)
	mov.l	.L0602ED78,r0
	jsr	@r0
	nop
	mov.l	.L0602ED60,r1
	mov.l	@r1,r1
	mov.l	.L0602ED7C,r4
	mov.l	.L0602ED80,r0
	jsr	@r0
	nop
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L0602ECF0
	mov.b	@(20,gbr),r0
	cmp/eq	#7,r0
	bt	.L0602ECE4
	cmp/eq	#12,r0
	bt	.L0602ECF0
	cmp/eq	#14,r0
	bt	.L0602ECF0
	tst	#1,r0
	bf	.L0602ECF0
.L0602ECE4:
	mov.l	.L0602ED6C,r0
	mov.l	.L0602ED7C,r2
	jsr	@r0
	nop
	mov.l	.L0602ED84,r0
	mov.l	r0,@(12,r3)
.L0602ECF0:
	mov.l	.L0602ED64,r1
	mov.l	@r1,r1
	mov.l	.L0602ED7C,r4
	mov.l	.L0602ED80,r0
	jsr	@r0
	nop
	mov.l	.L0602ED88,r1
	mov.l	@r1,r1
	mov.l	.L0602ED7C,r4
	mov.l	.L0602ED80,r0
	jsr	@r0
	nop
	mov.l	.L0602ED8C,r5
	mov.l	@r5+,r1
	mov.l	.L0602ED7C,r4
	mov.l	.L0602ED80,r0
	jsr	@r0
	nop
	mov	#5,r7
.L0602ED16:
	mov.l	@r5+,r1
	tst	r1,r1
	bt	.L0602ED24
	mov.l	.L0602ED90,r4
	mov.l	.L0602ED80,r0
	jsr	@r0
	nop
.L0602ED24:
	dt	r7
	bf	.L0602ED16
	mov.l	.L0602ED94,r0
	jsr	@r0
	nop
	mov.l	.L0602ED98,r0
	jsr	@r0
	nop
	mov.b	@(2,gbr),r0
	mov.b	r0,@(3,gbr)
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#0,r0
	ldc	r0,sr
	lds.l	@r15+,pr
	rts
	nop
.L0602ED4C:
	.short 0x00FF
.L0602ED4E:
	.short 0x0000
.L0602ED50:
	.long func_0600E606
.L0602ED54:
	.long func_06004BAE
.L0602ED58:
	.long func_0600E4F6
.L0602ED5C:
	.long D_0602FF48
.L0602ED60:
	.long D_060F309C
.L0602ED64:
	.long D_060F3064
.L0602ED68:
	.long D_060FFFB8
.L0602ED6C:
	.long func_0600D0D0
.L0602ED70:
	.long func_0603E4D0
.L0602ED74:
	.long D_060FFF98
.L0602ED78:
	.long func_06004574
.L0602ED7C:
	.long D_060FFFA0
.L0602ED80:
	.long func_0600D2A8
.L0602ED84:
	.long D_0600F0C4
.L0602ED88:
	.long D_060F30C0
.L0602ED8C:
	.long D_060F30A8
.L0602ED90:
	.long D_060FFFA8
.L0602ED94:
	.long func_0600C9C8
.L0602ED98:
	.long func_0600C9F2
	endlabel func_0602E51E

	.section .data.0602ED9C,"aw",@progbits
	.p2align 2
	dlabel D_0602ED9C
	.byte 0x40, 0x33, 0x2B, 0x20, 0x40, 0x31, 0x50, 0x40, 0x31, 0x52, 0x45, 0x53, 0x53, 0x20, 0x40, 0x31
	.byte 0x53, 0x40, 0x31, 0x54, 0x41, 0x52, 0x54, 0x20, 0x40, 0x31, 0x42, 0x40, 0x31, 0x55, 0x54, 0x54
	.byte 0x4F, 0x4E, 0x20, 0x40, 0x33, 0x2B, 0xFE, 0x09
	dlabel D_0602EDC4
	.byte 0x40, 0x31, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
