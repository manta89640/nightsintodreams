	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06020BF8,"ax",@progbits
	.p2align 2

	glabel func_06020BF8
	sts.l	pr,@-r15
	mov.l	r1,@-r15
	mov	r7,r0
	mov.w	r0,@(134,gbr)
	mov.l	@(92,gbr),r0
	mov	r0,r3
	mov.w	@(134,gbr),r0
	mov	r0,r7
	mov.w	.L06020C3E,r14
	mov.b	@(9,r1),r0
	tst	r0,r0
	bf	.L06020C12
	add	#9,r14
.L06020C12:
	mov	r14,r0
	mov.w	r0,@(100,gbr)
.L06020C16:
	mov.l	@(12,r2),r0
	cmp/pl	r0
	bf	.L06020CE8
	mov.w	.L06020C40,r11
	mov.l	.L06020C44,r13
	mov	#0,r14
	add	#2,r0
	mov.l	r0,@(12,r2)
	shar	r0
	tst	#128,r0
	bt	.L06020C32
	mov.w	.L06020C42,r11
	mov.l	.L06020C48,r13
	mov	#-9,r14
.L06020C32:
	and	#127,r0
	mov.b	@(r0,r13),r13
	tst	r13,r13
	bf	.L06020C4C
	bra	.L06020CE8
	mov.l	r13,@(12,r2)
.L06020C3E:
	.short 0x00B9
.L06020C40:
	.short 0x0100
.L06020C42:
	.short 0x0180
.L06020C44:
	.long D_06020AF2
.L06020C48:
	.long D_06020B77
.L06020C4C:
	mov	#7,r8
	cmp/ge	r8,r13
	bf	.L06020C66
	mov.l	@(4,r2),r8
	add	#-58,r0
	cmp/pz	r0
	bf	.L06020C66
	shll8	r0
	shll2	r0
	shll2	r0
	shll2	r0
	add	r0,r8
	mov.l	r8,@(4,r2)
.L06020C66:
	mov	r11,r0
	mov.l	r0,@(760,gbr)
	mov.w	@(100,gbr),r0
	add	r0,r13
	add	r14,r13
	mov.w	.L06020CFA,r0
	cmp/ge	r0,r13
	bt	.L06020C78
	add	#9,r13
.L06020C78:
	mov.l	@(120,gbr),r0
	mov	r0,r8
	clrmac
	mac.l	@r8+,@r2+
	mac.l	@r8+,@r2+
	mac.l	@r8+,@r2+
	mov.l	@r8+,r4
	sts	mach,r10
	sts	macl,r11
	xtrct	r10,r11
	add	r11,r4
	add	#-12,r2
	clrmac
	mac.l	@r8+,@r2+
	mac.l	@r8+,@r2+
	mac.l	@r8+,@r2+
	mov.l	@r8+,r5
	sts	mach,r10
	sts	macl,r11
	xtrct	r10,r11
	add	r11,r5
	add	#-12,r2
	clrmac
	mac.l	@r8+,@r2+
	mac.l	@r8+,@r2+
	mac.l	@r8+,@r2+
	mov.l	@r8+,r6
	sts	mach,r10
	sts	macl,r11
	xtrct	r10,r11
	add	r11,r6
	add	#-12,r2
	mov.l	@(784,gbr),r0
	cmp/ge	r0,r6
	bt	.L06020CE8
	mov	#32,r0
	shll16	r0
	cmp/ge	r0,r6
	bf	.L06020CE8
	mov.l	.L06020CFC,r0
	dmuls.l	r0,r6
	sts	mach,r0
	add	r0,r0
	cmp/gt	r0,r4
	bt	.L06020CE8
	neg	r0,r0
	cmp/ge	r0,r4
	bf	.L06020CE8
	mov.l	.L06020D00,r0
	dmuls.l	r0,r6
	sts	mach,r0
	cmp/gt	r0,r5
	bt	.L06020CE8
	neg	r0,r0
	cmp/ge	r0,r5
	bt	.L06020D04
.L06020CE8:
	add	#16,r2
	dt	r7
	bf	.L06020C16
	mov	r3,r0
	mov.l	r0,@(92,gbr)
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
.L06020CFA:
	.short 0x00BA
.L06020CFC:
	.long 0x58000000
.L06020D00:
	.long 0x7FFFFFFF
.L06020D04:
	mov.w	@(190,gbr),r0
	mov	#-128,r1
	shll	r1
	mov.l	r6,@(0,r1)
	mov.l	r0,@(16,r1)
	mov	#0,r0
	mov.l	r0,@(20,r1)
	mov.w	.L06020D98,r0
	mov.w	.L06020D9A,r8
	or	r8,r0
	mov.w	r0,@r3
	mov.l	@(792,gbr),r0
	cmp/gt	r0,r6
	bf	.L06020D28
	mov	r6,r0
	mov.l	r0,@(792,gbr)
	mov	r3,r0
	mov.l	r0,@(796,gbr)
.L06020D28:
	mov.l	.L06020DA0,r9
	mov	r13,r0
	shll2	r0
	shll	r0
	add	r0,r9
	mov.l	@r9,r13
	mov.l	r13,@(8,r3)
	mov.l	.L06020DA4,r11
	and	r11,r13
	shlr8	r11
	and	r13,r11
	shlr8	r13
	shll2	r13
	shll	r13
	mov.w	.L06020D9C,r0
	mov.w	r0,@(4,r3)
	mov.w	@(4,r9),r0
	mov.w	r0,@(6,r3)
	mov.l	@(28,r1),r0
	dmuls.l	r0,r4
	mov	r0,r12
	mov	r0,r14
	shar	r14
	shar	r14
	shar	r14
	dlabel lbl_06020D5A
	sub	r14,r0
	sts	mach,r4
	dmuls.l	r0,r5
	sts	mach,r5
	mov	#88,r0
	shll	r0
	add	r4,r0
	mov.w	r0,@(12,r3)
	add	#112,r5
	mov	r5,r0
	mov.w	r0,@(14,r3)
	mov.l	@(760,gbr),r0
	shll8	r0
	dmuls.l	r0,r12
	sts	mach,r0
	sts	macl,r14
	xtrct	r0,r14
	shll16	r13
	shll16	r11
	dmuls.l	r14,r13
	sts	mach,r13
	dmuls.l	r14,r11
	sts	mach,r11
	shll16	r13
	or	r11,r13
	mov.l	r13,@(16,r3)
	mov.l	.L06020DA8,r0
	jsr	@r0
	nop
	bra	.L06020CE8
	add	#32,r3
.L06020D98:
	.short 0x1A01
.L06020D9A:
	.short 0x0080
.L06020D9C:
	.short 0x1008
	.byte 0x00, 0x00
.L06020DA0:
	.long model_texture_table
.L06020DA4:
	.long 0x0000FFFF
.L06020DA8:
	.long vdp1_zsort_insert
	endlabel func_06020BF8

	glabel func_06020DAC
	sts.l	pr,@-r15
	mov.l	r1,@-r15
	mov.l	r3,@-r15
	mov	r7,r0
	mov.w	r0,@(134,gbr)
	mov.w	@(134,gbr),r0
	mov	r0,r7
	mov.l	.L06020E24,r2
.L06020DBC:
	mov.l	@(12,r3),r0
	tst	r0,r0
	bt	.L06020E14
	add	#2,r0
	mov.l	r0,@(12,r3)
	mov.l	@(120,gbr),r0
	mov	r0,r8
	clrmac
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mov.l	@r8+,r4
	sts	mach,r10
	sts	macl,r11
	xtrct	r10,r11
	add	r11,r4
	add	#-12,r3
	clrmac
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mov.l	@r8+,r5
	sts	mach,r10
	sts	macl,r11
	xtrct	r10,r11
	add	r11,r5
	add	#-12,r3
	clrmac
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mov.l	@r8+,r6
	sts	mach,r10
	sts	macl,r11
	xtrct	r10,r11
	add	r11,r6
	add	#-12,r3
.L06020E06:
	mov.l	@(784,gbr),r0
	cmp/ge	r0,r6
	bt	.L06020E14
	mov	#32,r0
	shll16	r0
	cmp/ge	r0,r6
	bt	.L06020E28
.L06020E14:
	add	#16,r3
	mov	#0,r0
	mov.l	r0,@r2
	dt	r7
	bf/s	.L06020DBC
	add	#8,r2
	bra	.L06020EF8
	nop
.L06020E24:
	.long poly_vertices
.L06020E28:
	add	#16,r3
	mov.l	r6,@r2
	add	#4,r2
	mov.w	@(190,gbr),r0
	mov	#-128,r1
	shll	r1
	mov.l	r6,@(0,r1)
	mov.l	r0,@(16,r1)
	mov	#0,r0
	mov.l	r0,@(20,r1)
	mov	r4,r10
	mov	r5,r11
	mov.l	@(12,r3),r0
	tst	r0,r0
	bf	.L06020E4A
	bra	.L06020E8E
	mov	#-1,r6
.L06020E4A:
	add	#2,r0
	mov.l	r0,@(12,r3)
	mov.l	@(120,gbr),r0
	mov	r0,r8
	clrmac
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mov.l	@r8+,r4
	sts	mach,r12
	sts	macl,r13
	xtrct	r12,r13
	add	r13,r4
	add	#-12,r3
	clrmac
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mov.l	@r8+,r5
	sts	mach,r12
	sts	macl,r13
	xtrct	r12,r13
	add	r13,r5
	add	#-12,r3
	clrmac
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mov.l	@r8+,r6
	sts	mach,r12
	sts	macl,r13
	xtrct	r12,r13
	add	r13,r6
	add	#-12,r3
.L06020E8E:
	mov.l	@(28,r1),r0
	dmuls.l	r0,r10
	mov	r0,r14
	shar	r14
	shar	r14
	shar	r14
	dlabel lbl_06020E9A
	sub	r14,r0
	sts	mach,r10
	dmuls.l	r0,r11
	sts	mach,r11
	mov	#88,r0
	shll	r0
	cmp/ge	r0,r10
	bt	.L06020ECC
	add	r0,r10
	cmp/pz	r10
	bf	.L06020ECE
	mov	#112,r0
	cmp/ge	r0,r11
	bt	.L06020EE4
	add	r0,r11
	cmp/pz	r11
	bf	.L06020EE6
	mov.w	r10,@r2
	add	#2,r2
	mov.w	r11,@r2
	add	#2,r2
.L06020EC4:
	dt	r7
	bf	.L06020E06
	bra	.L06020EF8
	nop
.L06020ECC:
	add	r0,r10
.L06020ECE:
	mov.w	r10,@r2
	add	#2,r2
	mov	#112,r0
	add	r0,r11
	mov.w	r11,@r2
	add	#-6,r2
	mov.l	@r2,r11
	neg	r11,r11
	mov.l	r11,@r2
	bra	.L06020EC4
	add	#8,r2
.L06020EE4:
	add	r0,r11
.L06020EE6:
	mov.w	r10,@r2
	add	#2,r2
	mov.w	r11,@r2
	add	#-6,r2
	mov.l	@r2,r11
	neg	r11,r11
	mov.l	r11,@r2
	bra	.L06020EC4
	add	#8,r2
.L06020EF8:
	mov.l	.L06020FE0,r2
	mov.l	.L06020FE0,r3
	mov.w	@(134,gbr),r0
	shll2	r0
	shll	r0
	add	r0,r3
	mov.l	@r2,r0
	mov.l	r0,@r3
	mov.l	@(4,r2),r0
	mov.l	r0,@(4,r3)
	mov.l	@(8,r2),r0
	mov.l	r0,@(8,r3)
	mov.l	@(12,r2),r0
	mov.l	r0,@(12,r3)
	mov.l	@r15+,r5
	add	#12,r5
	mov.l	@r15+,r1
	mov.w	@(134,gbr),r0
	mov	r0,r7
	mov.l	.L06020FE0,r2
	mov.l	@(92,gbr),r0
	mov	r0,r3
	mov.w	@(2,r1),r0
	add	#2,r0
	cmp/ge	r7,r0
	bf	.L06020F2E
	mov	#0,r0
.L06020F2E:
	mov	r0,r4
.L06020F30:
	mov	r4,r0
	shll2	r0
	shll2	r0
	mov.l	@(r0,r5),r8
	tst	r8,r8
	bt	.L0602102C
	shar	r0
	add	r2,r0
	mov	r0,r8
	mov	r0,r10
	mov	#0,r6
	mov	#0,r9
	mov	#4,r14
.L06020F4A:
	mov.l	@r8,r0
	tst	r0,r0
	bt	.L06021010
	cmp/pl	r0
	bt	.L06020F58
	add	#1,r9
	neg	r0,r0
.L06020F58:
	add	r0,r6
	dt	r14
	bf/s	.L06020F4A
	add	#8,r8
	mov	r9,r0
	cmp/eq	#4,r0
	bt	.L06021010
	shar	r6
	shar	r6
	mov	r10,r8
	add	#4,r8
	mov.w	.L06020FD8,r0
	mov.w	.L06020FDA,r10
	or	r10,r0
	mov.w	r0,@r3
	mov.l	@(792,gbr),r0
	cmp/gt	r0,r6
	bf	.L06020F84
	mov	r6,r0
	mov.l	r0,@(792,gbr)
	mov	r3,r0
	mov.l	r0,@(796,gbr)
.L06020F84:
	mov.w	.L06020FDC,r0
	mov.w	r0,@(4,r3)
	mov.w	.L06020FDE,r0
	mov.w	r0,@(28,r3)
	mov.w	@(16,r8),r0
	mov	r0,r10
	neg	r10,r10
	mov.w	r0,@(12,r3)
	mov.w	@(18,r8),r0
	mov	r0,r11
	neg	r11,r11
	mov.w	r0,@(14,r3)
	mov.w	@(24,r8),r0
	mov	r0,r12
	add	r12,r10
	neg	r12,r12
	mov.w	r0,@(16,r3)
	mov.w	@(26,r8),r0
	mov	r0,r13
	add	r13,r11
	neg	r13,r13
	mov.w	r0,@(18,r3)
	mov.w	@(8,r8),r0
	add	r0,r12
	mov.w	r0,@(20,r3)
	mov.w	@(10,r8),r0
	add	r0,r13
	mov.w	r0,@(22,r3)
	mov.w	@(0,r8),r0
	mov.w	r0,@(24,r3)
	mov.w	@(2,r8),r0
	mov.w	r0,@(26,r3)
	muls.w	r12,r11
	sts	macl,r11
	muls.w	r13,r10
	sts	macl,r10
	sub	r11,r10
	cmp/pz	r10
	bf	.L06020FE8
	mov.l	.L06020FE4,r14
	bra	.L06020FF4
	nop
.L06020FD8:
	.short 0x1004
.L06020FDA:
	.short 0x0080
.L06020FDC:
	.short 0x00C4
.L06020FDE:
	.short 0x1B06
.L06020FE0:
	.long poly_vertices
.L06020FE4:
	.long D_06021072
.L06020FE8:
	mov.l	.L06020FF0,r14
	bra	.L06020FF4
	nop
	.byte 0x00, 0x00
.L06020FF0:
	.long D_06021070
.L06020FF4:
	mov	r4,r0
	shll2	r0
	shll2	r0
	mov.l	@(r0,r5),r0
	shlr	r0
	shll	r0
	mov.l	.L06021024,r13
	mov.w	@(r0,r13),r0
	mov.w	@r14,r0
	mov.w	r0,@(6,r3)
	mov.l	.L06021028,r14
	jsr	@r14
	nop
	add	#32,r3
.L06021010:
	mov.w	@(134,gbr),r0
	mov	r0,r14
	add	#2,r4
	cmp/ge	r14,r4
	bf	.L0602101C
	mov	#0,r4
.L0602101C:
	dt	r7
	bt	.L0602102C
	bra	.L06020F30
	nop
.L06021024:
	.long D_06021074
.L06021028:
	.long vdp1_zsort_insert
.L0602102C:
	mov	r3,r0
	mov.l	r0,@(92,gbr)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0xD9, 0x0C
	endlabel func_06020DAC

	.section .data.06021038,"aw",@progbits
	.p2align 2
	.byte 0x7D, 0xFF, 0x60, 0xD3, 0x40, 0x08, 0x40, 0x00, 0x39, 0x0C, 0x6D, 0x92, 0x13, 0xD2, 0xDB, 0x09
	.byte 0x2D, 0xB9, 0x4B, 0x19, 0x2B, 0xD9, 0x4D, 0x19, 0x4D, 0x08, 0x4D, 0x00, 0x90, 0x06, 0x81, 0x32
	.byte 0x85, 0x92, 0x81, 0x33, 0x90, 0x03, 0x23, 0x01, 0xAF, 0xD2, 0x00, 0x09, 0x10, 0x0C, 0x10, 0x02
	.long sprite_texture_table
	.byte 0x00, 0x00, 0xFF, 0xFF
	dlabel D_06021070
	.byte 0xDE, 0xFF
	dlabel D_06021072
	.byte 0xAD, 0x77
	dlabel D_06021074
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x1F, 0x00, 0x20, 0x00, 0x00
	dlabel D_0602110C
	.byte 0x00, 0x01, 0x02, 0x03, 0x06, 0x03, 0x04, 0x05, 0x06, 0x03, 0x04, 0x05, 0x06, 0x03, 0x04, 0x05
	.byte 0x06, 0x03, 0x04, 0x05
