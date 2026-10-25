	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0602C71C,"ax",@progbits
	.p2align 2

	glabel func_0602C71C
	mov.l	r1,@-r15
	mov.l	.L0602C77C,r1
	mov.l	@r1,r1
.L0602C722:
	mov	r7,r6
	sub	r8,r6
	mov.l	lbl_0602C838,r0
	shll16	r6
	dmuls.l	r0,r6
	sts	mach,r6
	dmuls.l	r6,r10
	sts	macl,r6
	neg	r6,r6
	mov	r11,r0
	shll8	r0
	neg	r0,r0
	add	r0,r6
	swap.w	r6,r6
	exts.w	r6,r6
	add	r12,r6
	sub	r12,r6
	cmp/pz	r6
	bt	.L0602C784
	mov.l	.L0602C780,r0
	mov.l	r6,@(0,r0)
	mov.l	r5,@(4,r0)
	mov.l	@(28,r0),r0
	neg	r0,r0
	cmp/pz	r0
	bf	.L0602C78A
	cmp/ge	r13,r0
	bt	.L0602C784
	cmp/ge	r14,r0
	bf	.L0602C764
	cmp/pz	r2
	bt	.L0602C764
	mov	r7,r2
.L0602C764:
	dmuls.l	r0,r1
	sts	macl,r0
	swap.w	r0,r0
	exts.w	r0,r0
	mov.w	r0,@-r3
	dt	r7
	bf	.L0602C722
	bra	.L0602C792
	nop
	.byte 0x00, 0x70, 0x00, 0xE0, 0x01, 0x00
.L0602C77C:
	.long D_0602C5F4
.L0602C780:
	.long SH2_DVSR
.L0602C784:
	mov	r7,r4
	bra	.L0602C792
	nop
.L0602C78A:
	mov.w	.L0602C798,r0
	mov.w	r0,@-r3
	dt	r7
	bf	.L0602C722
.L0602C792:
	mov.l	@r15+,r1
	rts
	nop
.L0602C798:
	.short 0x8000
	.byte 0x98, 0x3F, 0x99, 0x3F, 0x90, 0x3E, 0x35, 0x08, 0xC5, 0x52, 0x35, 0x08, 0x60, 0x53, 0xE4, 0xFF
	.byte 0xE2, 0xFF, 0x30, 0x9C, 0x6C, 0x03, 0x65, 0xC3, 0x45, 0x18, 0x45, 0x08, 0x53, 0x11, 0x33, 0x7C
	.byte 0x33, 0x7C
	endlabel func_0602C71C

	glabel func_0602C7BC
	mov.l	r1,@-r15
	mov.l	.L0602C820,r1
	mov.l	@r1,r1
.L0602C7C2:
	mov	r7,r6
	sub	r8,r6
	mov.l	lbl_0602C838,r0
	shll16	r6
	dmuls.l	r0,r6
	sts	mach,r6
	dmuls.l	r6,r10
	sts	macl,r6
	neg	r6,r6
	mov	r11,r0
	shll8	r0
	neg	r0,r0
	add	r0,r6
	swap.w	r6,r6
	exts.w	r6,r6
	add	r12,r6
	sub	r12,r6
	cmp/pl	r6
	bf	.L0602C828
	mov.l	.L0602C824,r0
	mov.l	r6,@(0,r0)
	mov.l	r5,@(4,r0)
	mov.l	@(28,r0),r0
	neg	r0,r0
	cmp/pz	r0
	bf	.L0602C828
	cmp/ge	r13,r0
	bt	.L0602C828
	cmp/pz	r4
	bt	.L0602C800
	mov	r7,r4
.L0602C800:
	cmp/ge	r14,r0
	bt	.L0602C80A
	cmp/pz	r2
	bt	.L0602C80A
	mov	r7,r2
.L0602C80A:
	dmuls.l	r0,r1
	sts	macl,r0
	swap.w	r0,r0
	exts.w	r0,r0
	mov.w	r0,@-r3
	dt	r7
	bf	.L0602C7C2
	bra	.L0602C830
	nop
	.byte 0x00, 0x70, 0x01, 0x00
.L0602C820:
	.long D_0602C5F4
.L0602C824:
	.long SH2_DVSR
.L0602C828:
	mov.w	.L0602C836,r0
	mov.w	r0,@-r3
	dt	r7
	bf	.L0602C7C2
.L0602C830:
	mov.l	@r15+,r1
	rts
	nop
.L0602C836:
	.short 0x8000
	dlabel lbl_0602C838
	.long 0x00012492
	endlabel func_0602C7BC

	glabel func_0602C83C
	sts.l	pr,@-r15
	cmp/pz	r2
	bf	.L0602C87E
	mov.w	.L0602C884,r7
	cmp/ge	r7,r4
	bt	.L0602C87E
	cmp/pl	r4
	bt	.L0602C84E
	mov	#0,r4
.L0602C84E:
	add	#0,r4
	shll16	r2
	shll16	r4
	mov	r2,r13
	sub	r4,r13
	shar	r13
	shar	r13
	shar	r13
	mov	r4,r9
	mov.w	.L0602C886,r5
	mov.w	.L0602C888,r2
	mov	#8,r7
.L0602C866:
	mov	r9,r11
	add	r13,r11
	bsr	func_0602CA86
	nop
	add	r2,r5
	add	r13,r9
	dt	r7
	bf	.L0602C866
	swap.w	r2,r2
	swap.w	r4,r4
	exts.w	r2,r2
	exts.w	r4,r4
.L0602C87E:
	lds.l	@r15+,pr
	rts
	nop
.L0602C884:
	.short 0x00E0
.L0602C886:
	.short 0x200F
.L0602C888:
	.short 0x0400
	.byte 0x4F, 0x22, 0x44, 0x11, 0x8B, 0x1D, 0x97, 0x1F, 0x32, 0x73, 0x89, 0x1A, 0x42, 0x11, 0x89, 0x00
	.byte 0xE2, 0x00, 0x74, 0x00, 0x42, 0x28, 0x44, 0x28, 0x6D, 0x23, 0x3D, 0x48, 0x4D, 0x21, 0x4D, 0x21
	.byte 0x4D, 0x21, 0x69, 0x43, 0x95, 0x11, 0x92, 0x11, 0xE7, 0x08, 0x6B, 0x93, 0x3B, 0xDC, 0xB0, 0xE5
	.byte 0x00, 0x09, 0x35, 0x2C, 0x39, 0xDC, 0x47, 0x10, 0x8B, 0xF7
	.asciz "b)dIb/dOO&"
	.byte 0x0B, 0x00, 0x09, 0x00, 0xE0, 0x20, 0x0F, 0x04, 0x00
	endlabel func_0602C83C

	glabel func_0602C8D8
	sts.l	pr,@-r15
	mov.l	@(48,r1),r4
	mov.l	@(160,gbr),r0
	sub	r4,r0
	mov	r0,r4
	mov.l	@(56,r1),r5
	mov.l	@(168,gbr),r0
	sub	r5,r0
	mov	r0,r5
	neg	r5,r5
	mov.l	.L0602C96C,r0
	jsr	@r0
	nop
	mov	r0,r13
	mov.w	@(172,gbr),r0
	shll2	r0
	mov	r0,r9
	mov.w	@(176,gbr),r0
	shll2	r0
	mov	r0,r8
	dmuls.l	r4,r8
	sts	mach,r14
	sts	macl,r8
	xtrct	r14,r8
	dmuls.l	r5,r9
	sts	mach,r14
	sts	macl,r9
	xtrct	r14,r9
	add	r9,r8
	dmuls.l	r13,r8
	sts	mach,r14
	sts	macl,r13
	xtrct	r14,r13
	mov.l	@(512,gbr),r0
	add	r13,r0
	mov.l	r0,@(512,gbr)
	mov.l	@(52,r1),r4
	mov.l	@(164,gbr),r0
	sub	r4,r0
	mov	r0,r4
	mov.l	@(516,gbr),r0
	add	r4,r0
	mov.l	r0,@(516,gbr)
	mov.w	@(194,gbr),r0
	mov.l	.L0602C970,r4
	mov.l	.L0602C974,r14
	mov.l	r4,@(0,r14)
	mov.l	r0,@(16,r14)
	mov	#0,r0
	mov.l	r0,@(20,r14)
	mov.l	@(28,r14),r0
	mov.l	r0,@(524,gbr)
	mov.w	@(192,gbr),r0
	mov.l	.L0602C978,r4
	mov.l	.L0602C974,r14
	mov.l	r4,@(0,r14)
	mov.l	r0,@(16,r14)
	mov	#0,r0
	mov.l	r0,@(20,r14)
	mov.l	@(28,r14),r0
	mov.l	r0,@(520,gbr)
	mov.l	@(160,gbr),r0
	mov.l	r0,@(48,r1)
	mov.l	@(164,gbr),r0
	mov.l	r0,@(52,r1)
	mov.l	@(168,gbr),r0
	mov.l	r0,@(56,r1)
	mov.w	@(192,gbr),r0
	mov.w	r0,@(22,r1)
	mov.w	@(194,gbr),r0
	mov.w	r0,@(24,r1)
	lds.l	@r15+,pr
	rts
	nop
.L0602C96C:
	.long math_normalize2d
.L0602C970:
	.long 0x00200000
.L0602C974:
	.long SH2_DVSR
.L0602C978:
	.long 0x0023B1EA
	endlabel func_0602C8D8

	glabel func_0602C97C
	sts.l	pr,@-r15
	bsr	func_0602CA14
	nop
	mov	r0,r9
	shll2	r0
	add	r0,r9
	mov.l	.L0602C9F4,r0
	cmp/ge	r0,r9
	bt	.L0602C990
	mov	r0,r9
.L0602C990:
	cmp/pl	r6
	bf	.L0602CA00
	mov.l	@(788,gbr),r0
	cmp/ge	r0,r6
	bt	.L0602CA00
	mov.w	.L0602C9EE,r8
	cmp/gt	r8,r4
	bt	.L0602CA00
	cmp/gt	r8,r5
	bt	.L0602CA00
	neg	r8,r8
	cmp/gt	r8,r4
	bf	.L0602CA00
	cmp/gt	r8,r5
	bf	.L0602CA00
	mov.w	.L0602C9F0,r14
	add	r14,r4
	mov.w	.L0602C9F2,r14
	add	r14,r5
	shll16	r4
	shll16	r5
	mov.l	.L0602C9F8,r6
	mov	#-128,r14
	shll	r14
	mov.l	r9,@(0,r14)
	mov.l	r6,@(16,r14)
	mov	#0,r0
	mov.l	r0,@(20,r14)
	mov.l	@(28,r14),r0
	mov	r0,r8
	mov.l	.L0602C9FC,r0
	dmuls.l	r9,r0
	sts	mach,r10
	sts	macl,r0
	xtrct	r10,r0
	sub	r0,r4
	sub	r0,r5
	dmuls.l	r8,r4
	sts	mach,r4
	neg	r4,r4
	dmuls.l	r8,r5
	sts	mach,r5
	neg	r5,r5
	swap.w	r0,r0
	exts.w	r0,r0
	bra	.L0602CA06
	nop
.L0602C9EE:
	.short 0x0100
.L0602C9F0:
	.short 0x00B0
.L0602C9F2:
	.short 0x0070
.L0602C9F4:
	.long 0x00010000
.L0602C9F8:
	.long 0x00000001
.L0602C9FC:
	.long 0x00200000
.L0602CA00:
	mov.w	.L0602CA0C,r4
	mov.w	.L0602CA0E,r5
	mov.l	.L0602CA10,r8
.L0602CA06:
	lds.l	@r15+,pr
	rts
	nop
.L0602CA0C:
	.short 0x0000
.L0602CA0E:
	.short 0xFF00
.L0602CA10:
	.long 0x00010000
	endlabel func_0602C97C

	glabel func_0602CA14
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov	r15,r8
	mov.l	@(120,gbr),r0
	mov	r0,r3
	clrmac
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mov.l	@r3+,r4
	sts	mach,r10
	sts	macl,r11
	xtrct	r10,r11
	add	r11,r4
	add	#-12,r8
	clrmac
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mov.l	@r3+,r5
	sts	mach,r10
	sts	macl,r11
	xtrct	r10,r11
	add	r11,r5
	add	#-12,r8
	clrmac
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mov.l	@r3+,r6
	sts	mach,r10
	sts	macl,r11
	xtrct	r10,r11
	add	r11,r6
	mov	r8,r15
	add	r7,r6
	mov.w	@(190,gbr),r0
	mov	#-128,r14
	shll	r14
	mov.l	r6,@(0,r14)
	mov.l	r0,@(16,r14)
	mov	#0,r0
	mov.l	r0,@(20,r14)
	mov.l	@(28,r14),r0
	dmuls.l	r0,r4
	mov	r0,r14
	shar	r14
	shar	r14
	shar	r14
	neg	r14,r14
	add	r0,r14
	sts	mach,r4
	dmuls.l	r14,r5
	sts	mach,r5
	rts
	nop
	endlabel func_0602CA14

	glabel func_0602CA86
	sts.l	pr,@-r15
	mov.l	@(92,gbr),r0
	mov	r0,r3
	add	#32,r0
	mov.l	.L0602CAD8,r12
	mov.l	r0,@r12
	mov.w	.L0602CAD2,r12
	mov.w	.L0602CAD4,r0
	mov.w	r12,@r3
	mov.w	r0,@(4,r3)
	mov	r5,r0
	mov.w	r0,@(6,r3)
	mov	#0,r8
	mov.w	.L0602CAD6,r10
	mov	r8,r0
	mov.w	r0,@(12,r3)
	mov.w	r0,@(24,r3)
	mov	r9,r0
	swap.w	r0,r0
	exts.w	r0,r0
	mov.w	r0,@(14,r3)
	mov.w	r0,@(18,r3)
	mov	r10,r0
	mov.w	r0,@(16,r3)
	mov.w	r0,@(20,r3)
	mov	r11,r0
	swap.w	r0,r0
	exts.w	r0,r0
	mov.w	r0,@(22,r3)
	mov.w	r0,@(26,r3)
	mov.l	@(788,gbr),r0
	mov	r0,r6
	mov.l	.L0602CADC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0602CAD2:
	.short 0x1004
.L0602CAD4:
	.short 0x00C0
.L0602CAD6:
	.short 0x015F
.L0602CAD8:
	.long vdp1_wp0
.L0602CADC:
	.long vdp1_zsort_insert
	endlabel func_0602CA86

	glabel func_0602CAE0
	stc	gbr,r9
.L0602CAE2:
	mov.w	@r2+,r10
	mov.w	@r2+,r0
	cmp/pz	r0
	bf	.L0602CAEE
	bra	.L0602CAE2
	mov.w	r10,@(r0,r9)
.L0602CAEE:
	rts
	nop
	.byte 0xD9, 0x03
	endlabel func_0602CAE0

	.section .data.0602CAF4,"aw",@progbits
	.p2align 2
	.byte 0x6A, 0x25, 0x60, 0x25, 0x40, 0x11, 0x8B, 0x03, 0xAF, 0xFA, 0x09, 0xA5, 0x25, 0xF7, 0xFF, 0x20
	.byte 0x00, 0x0B, 0x00, 0x09, 0xD3, 0x1E, 0xD2, 0x1F, 0xC6, 0x03, 0xC8, 0x01, 0x89, 0x32, 0x84, 0x1A
	.byte 0x70, 0x01, 0xE8, 0x0F, 0x30, 0x83, 0x8B, 0x00, 0xE0, 0x00, 0x80, 0x1A, 0x40, 0x08, 0x40, 0x08
	.byte 0x40, 0x00, 0x32, 0x0C, 0xE7, 0x10, 0x60, 0x25, 0x23, 0x01, 0x47, 0x10, 0x8F, 0xFB, 0x73, 0x02
	.byte 0x84, 0x1B, 0x70, 0x01, 0xE8, 0x06, 0x30, 0x83, 0x8B, 0x00, 0xE0, 0x00, 0x80, 0x1B, 0x40, 0x08
	.byte 0x40, 0x08, 0x40, 0x00, 0xD2, 0x10, 0xD3, 0x11, 0x32, 0x0C, 0xE7, 0x05, 0x60, 0x25, 0x23, 0x01
	.byte 0x47, 0x10, 0x8F, 0xFB, 0x73, 0x02, 0xC6, 0x03, 0x40, 0x21, 0xC9, 0x0F, 0x40, 0x08, 0x40, 0x08
	.byte 0x40, 0x00, 0xD2, 0x0B, 0xD3, 0x0B, 0x32, 0x0C, 0xE7, 0x10, 0x60, 0x25, 0x23, 0x01, 0x47, 0x10
	.byte 0x8F, 0xFB, 0x73, 0x02, 0xD7, 0x08, 0x84, 0x79, 0x40, 0x11, 0x89, 0x0F, 0xA0, 0x98, 0x00, 0x09
	.long D_060CA440
	.long D_0602CCB8
	.long D_0602CEAC
	.long D_060CA034
	.long D_0602CF58
	.long D_060CA4E0
	.long play_state
	.byte 0x20, 0x08, 0x8B, 0x21, 0xD6, 0x02, 0x66, 0x62, 0x26, 0x68, 0x8B, 0x03, 0xA0, 0x82, 0x00, 0x09
	.long D_060F30F4
	.byte 0x84, 0x6E, 0x20, 0x08
