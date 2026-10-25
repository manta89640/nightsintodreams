	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06021120,"ax",@progbits
	.p2align 2

	glabel func_06021120
	sts.l	pr,@-r15
	mov.l	r1,@-r15
	mov.l	.L060211CC,r1
	mov.l	@(92,gbr),r0
	mov	r0,r3
	mov.w	.L060211C6,r7
.L0602112C:
	mov.b	@r2,r0
	cmp/pl	r0
	bf	.L060211B2
	add	#-2,r0
	mov.b	r0,@r2
	shar	r0
	and	#3,r0
	mov.l	.L060211D0,r13
	mov.b	@(r0,r13),r13
	mov.w	.L060211C8,r14
	add	r14,r13
	mov.l	@(120,gbr),r0
	mov	r0,r8
	clrmac
	mac.l	@r8+,@r1+
	mac.l	@r8+,@r1+
	mac.l	@r8+,@r1+
	mov.l	@r8+,r4
	sts	mach,r10
	sts	macl,r11
	xtrct	r10,r11
	add	r11,r4
	add	#-12,r1
	clrmac
	mac.l	@r8+,@r1+
	mac.l	@r8+,@r1+
	mac.l	@r8+,@r1+
	mov.l	@r8+,r5
	sts	mach,r10
	sts	macl,r11
	xtrct	r10,r11
	add	r11,r5
	add	#-12,r1
	clrmac
	mac.l	@r8+,@r1+
	mac.l	@r8+,@r1+
	mac.l	@r8+,@r1+
	mov.l	@r8+,r6
	sts	mach,r10
	sts	macl,r11
	xtrct	r10,r11
	add	r11,r6
	add	#-12,r1
	mov.l	@(784,gbr),r0
	cmp/ge	r0,r6
	bt	.L060211B2
	mov	#32,r0
	shll16	r0
	cmp/ge	r0,r6
	bf	.L060211B2
	mov.l	.L060211D4,r0
	dmuls.l	r0,r6
	sts	mach,r0
	add	r0,r0
	cmp/gt	r0,r4
	bt	.L060211B2
	neg	r0,r0
	cmp/ge	r0,r4
	bf	.L060211B2
	mov.l	.L060211D8,r0
	dmuls.l	r0,r6
	sts	mach,r0
	cmp/gt	r0,r5
	bt	.L060211B2
	neg	r0,r0
	cmp/ge	r0,r5
	bt	.L060211DC
.L060211B2:
	add	#12,r1
	add	#1,r2
	dt	r7
	bf	.L0602112C
	mov	r3,r0
	mov.l	r0,@(92,gbr)
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
.L060211C6:
	.short 0x00A2
.L060211C8:
	.short 0x00B6
	.byte 0x00, 0x00
.L060211CC:
	.long D_06062124
.L060211D0:
	.long D_0602110C
.L060211D4:
	.long 0x58000000
.L060211D8:
	.long 0x7FFFFFFF
.L060211DC:
	mov.w	@(190,gbr),r0
	mov	#-128,r14
	shll	r14
	mov.l	r6,@(0,r14)
	mov.l	r0,@(16,r14)
	mov	#0,r0
	mov.l	r0,@(20,r14)
	mov.w	.L06021262,r0
	mov.w	r0,@r3
	mov.l	.L06021268,r9
	mov	r13,r0
	shll2	r0
	shll	r0
	add	r0,r9
	mov.l	@r9,r13
	mov.l	r13,@(8,r3)
	mov.l	.L0602126C,r11
	and	r11,r13
	shlr8	r11
	and	r13,r11
	shlr8	r13
	shll2	r13
	shll	r13
	mov.w	.L06021264,r0
	mov.w	r0,@(4,r3)
	mov.w	.L06021266,r0
	mov.w	r0,@(6,r3)
	mov.l	@(28,r14),r0
	dmuls.l	r0,r4
	mov	r0,r12
	mov	r0,r14
	shar	r14
	shar	r14
	shar	r14
	dlabel lbl_06021220
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
	mov.b	@r2,r0
	shll2	r0
	shll	r0
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
	mov.l	.L06021270,r0
	jsr	@r0
	nop
	bra	.L060211B2
	add	#32,r3
.L06021262:
	.short 0x1A01
.L06021264:
	.short 0x1000
.L06021266:
	.short 0x0270
.L06021268:
	.long model_texture_table
.L0602126C:
	.long 0x0000FFFF
.L06021270:
	.long vdp1_zsort_insert
	endlabel func_06021120

	glabel func_06021274
	mov.l	@(120,gbr),r0
	mov	r0,r8
	clrmac
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mov.l	@r8+,r4
	sts	mach,r12
	sts	macl,r0
	xtrct	r12,r0
	add	r0,r4
	add	#-12,r3
	clrmac
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mov.l	@r8+,r5
	sts	mach,r12
	sts	macl,r0
	xtrct	r12,r0
	add	r0,r5
	add	#-12,r3
	clrmac
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mov.l	@r8+,r6
	sts	mach,r12
	sts	macl,r0
	xtrct	r12,r0
	rts
	add	r0,r6
	endlabel func_06021274

	glabel func_060212B4
	mov.l	.L060212F4,r0
	mov	r0,r8
	clrmac
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mov.l	@r8+,r4
	sts	mach,r12
	sts	macl,r0
	xtrct	r12,r0
	add	r0,r4
	add	#-12,r3
	clrmac
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mov.l	@r8+,r5
	sts	mach,r12
	sts	macl,r0
	xtrct	r12,r0
	add	r0,r5
	add	#-12,r3
	clrmac
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mac.l	@r8+,@r3+
	mov.l	@r8+,r6
	sts	mach,r12
	sts	macl,r0
	xtrct	r12,r0
	rts
	add	r0,r6
.L060212F4:
	.long D_060FE940
	endlabel func_060212B4

	glabel func_060212F8
	dmuls.l	r0,r10
	mov	r0,r1
	shar	r1
	shar	r1
	shar	r1
	dlabel lbl_06021302
	sub	r1,r0
	sts	mach,r10
	dmuls.l	r0,r11
	sts	mach,r11
	mov.l	@r2+,r1
	mov.l	@(784,gbr),r0
	cmp/ge	r0,r1
	mov	#0,r0
	bf	.L06021316
	mov	#15,r0
.L06021316:
	mov	#88,r12
	shll	r12
	cmp/ge	r12,r10
	bf	.L06021320
	mov	#8,r0
.L06021320:
	add	r12,r10
	cmp/pz	r10
	bt	.L06021328
	mov	#4,r0
.L06021328:
	mov	#112,r12
	cmp/ge	r12,r11
	bf	.L06021330
	or	#2,r0
.L06021330:
	add	r12,r11
	cmp/pz	r11
	bt	.L06021338
	or	#1,r0
.L06021338:
	mov.w	r10,@r2
	add	#2,r2
	mov.w	r11,@r2
	add	#2,r2
	tst	r0,r0
	bt	.L06021352
	add	#-8,r2
	mov.l	@r2,r11
	or	r0,r11
	neg	r11,r11
	mov.l	r11,@r2
	add	#8,r2
	add	#1,r9
.L06021352:
	rts
	nop
	endlabel func_060212F8

	glabel func_06021356
	sts.l	pr,@-r15
	mov	#0,r6
	shll	r6
	shlr	r6
	bsr	func_060213BE
	mov	#0,r0
	add	#4,r0
	mov.w	@(r0,r2),r8
	add	#2,r0
	mov.w	@(r0,r2),r9
	bsr	func_060213BE
	mov	#8,r0
	add	#4,r0
	mov.w	@(r0,r2),r10
	add	#2,r0
	mov.w	@(r0,r2),r14
	mov	r5,r0
	shll2	r0
	bsr	func_060213BE
	shll	r0
	mov	r5,r0
	add	#1,r0
	shll2	r0
	bsr	func_060213BE
	shll	r0
	mov	#15,r13
	and	r13,r4
	tst	r4,r4
	bf	.L060213B8
	add	#4,r0
	mov.w	@(r0,r2),r13
	add	#2,r0
	mov.w	@(r0,r2),r0
	sub	r10,r13
	sub	r14,r0
	sub	r8,r10
	sub	r9,r14
	muls.w	r13,r14
	sts	macl,r14
	muls.w	r0,r10
	sts	macl,r10
	sub	r14,r10
	cmp/pz	r10
	mov.l	r6,@r3
	add	#4,r3
	mov.w	r11,@r3
	add	#2,r3
	mov.w	r12,@r3
	add	#2,r3
.L060213B8:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06021356

	glabel func_060213BE
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L060213B8
	cmp/pl	r13
	bt	.L060213CA
	neg	r13,r13
.L060213CA:
	and	r13,r4
	cmp/ge	r6,r13
	bf	.L060213D2
	mov	r13,r6
.L060213D2:
	rts
	nop
	dlabel D_060213D6
	.byte 0x00, 0x00
	dlabel D_060213D8
	.byte 0x00, 0x00
	endlabel func_060213BE

	glabel func_060213DA
	nop
	nop
	mov.l	.L060213F0,r12
	mov.w	@r12,r0
	mov.w	.L060213EC,r8
	cmp/ge	r8,r0
	bf	func_060213F4
	rts
	nop
.L060213EC:
	.short 0x0200
	.byte 0x00, 0x00
.L060213F0:
	.long D_060FFC34 + 0x20000000
	endlabel func_060213DA

	glabel func_060213F4
	sts.l	pr,@-r15
	mov.l	.L0602142C,r3
	mov.l	.L06021430,r0
	jsr	@r0
	nop
	tst	r0,r0
	bf	.L0602143C
	mov.l	r1,@r3
	mov.l	r2,@(4,r3)
	mov.l	@(120,gbr),r0
	mov	#12,r14
	add	#20,r3
.L0602140C:
	mov.l	@r0+,r2
	mov.l	r2,@r3
	dt	r14
	bf/s	.L0602140C
	add	#4,r3
	mov.l	.L06021434,r2
	mov.b	@r2,r0
	mov	#0,r0
	mov.b	r0,@r2
	mov.l	.L06021438,r2
	mov	#-1,r0
	mov.b	r0,@r8
	mov.w	r0,@r2
	lds.l	@r15+,pr
	rts
	nop
.L0602142C:
	.long func_06021784
.L06021430:
	.long func_06006094
.L06021434:
	.long SH2_FTCSR
.L06021438:
	.long 0x21000000
.L0602143C:
	mov.l	@(120,gbr),r0
	mov	r0,r3
	mov.l	@(12,r3),r0
	mov	r0,r4
	add	#16,r3
	mov.l	@(12,r3),r0
	mov	r0,r5
	add	#16,r3
	mov.l	@(12,r3),r0
	mov	r0,r6
	add	#16,r3
	mov.l	@r2+,r3
	mov.l	@r3,r12
	add	#12,r3
	mov.l	@(788,gbr),r0
	add	r12,r0
	cmp/ge	r0,r6
	bt	.L060214AA
	mov	#32,r0
	shll16	r0
	sub	r12,r0
	cmp/ge	r0,r6
	bf	.L060214AA
	mov.l	.L060214B0,r0
	dmuls.l	r0,r6
	sts	mach,r0
	sts	macl,r13
	xtrct	r0,r13
	mov.l	.L060214B4,r0
	dmuls.l	r0,r12
	sts	mach,r0
	sts	macl,r12
	xtrct	r0,r12
	mov.l	.L060214B8,r0
	dmuls.l	r0,r13
	sts	mach,r0
	sts	macl,r14
	xtrct	r0,r14
	add	r12,r14
	cmp/gt	r14,r4
	bt	.L060214AA
	neg	r14,r14
	cmp/ge	r14,r4
	bf	.L060214AA
	mov.l	lbl_060216D8,r0
	dmuls.l	r0,r13
	sts	mach,r0
	sts	macl,r14
	xtrct	r0,r14
	add	r12,r14
	cmp/gt	r14,r5
	bt	.L060214AA
	neg	r14,r14
	cmp/ge	r14,r5
	bt	.L060214BC
.L060214AA:
	lds.l	@r15+,pr
	rts
	nop
.L060214B0:
	.long 0x00008000
.L060214B4:
	.long 0x00011E39
.L060214B8:
	.long 0x00016000
.L060214BC:
	mov.l	r1,@-r15
	mov.l	r2,@-r15
	mov.w	@r2+,r14
	mov.w	@r2+,r7
	mov	#0,r9
	mov.l	.L060214E0,r2
.L060214C8:
	bsr	func_06021274
	nop
	mov.l	@(788,gbr),r0
	cmp/ge	r0,r6
	bt	.L060214E4
	mov	#-40,r0
	shll16	r0
	cmp/ge	r0,r6
	bf	.L060214E4
	bra	.L06021522
	mov	r14,r13
	.byte 0x00, 0x00
.L060214E0:
	.long poly_vertices
.L060214E4:
	add	#-12,r3
	mov	r14,r13
.L060214E8:
	mov	#0,r0
	mov.l	r0,@r2
	add	#8,r2
	add	#12,r3
	dt	r13
	bf/s	.L060214E8
	add	#1,r9
	dt	r7
	bf	.L060214C8
	bra	.L06021558
	mov	r9,r6
.L060214FE:
	mov.l	@(788,gbr),r0
	cmp/ge	r0,r6
	bt	.L0602150C
	mov	#32,r0
	shll16	r0
	cmp/ge	r0,r6
	bt	.L06021522
.L0602150C:
	mov	#0,r0
	mov.l	r0,@r2
	add	#8,r2
	add	#1,r9
	mov	r13,r0
	cmp/eq	#1,r0
	bt	.L0602151E
	bsr	func_06021274
	nop
.L0602151E:
	bra	.L0602154E
	nop
.L06021522:
	mov	#-16,r0
	and	r0,r6
	mov.l	r6,@r2
	mov.w	@(190,gbr),r0
	mov	#-128,r1
	shll	r1
	mov.l	r6,@(0,r1)
	mov.l	r0,@(16,r1)
	mov	#0,r0
	mov.l	r0,@(20,r1)
	mov	r4,r10
	mov	r5,r11
	mov	r13,r0
	cmp/eq	#1,r0
	bt	.L06021544
	bsr	func_06021274
	nop
.L06021544:
	mov	#-128,r1
	shll	r1
	mov.l	@(28,r1),r0
	bsr	func_060212F8
	nop
.L0602154E:
	dt	r13
	bf	.L060214FE
	dt	r7
	bf	.L060214C8
	mov	r9,r6
.L06021558:
	mov.l	@r15+,r2
	mov.l	r2,@-r15
	mov.w	@r2+,r5
	mov.w	@r2+,r7
	muls.w	r5,r7
	sts	macl,r0
	cmp/eq	r6,r0
	bf	.L06021572
	mov.l	@r15+,r2
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
.L06021572:
	add	#-1,r7
	mov.l	.L060215D4,r2
	mov.l	.L060215D8,r3
	mov	#0,r11
	mov	#0,r12
.L0602157C:
	mov	r5,r1
	add	#-1,r1
.L06021580:
	mov	#-1,r4
	bsr	func_06021356
	nop
	add	#8,r2
	add	#8,r11
	add	#8,r12
	dt	r1
	bf	.L06021580
	add	#8,r2
	add	#8,r12
	dt	r7
	bf	.L0602157C
	mov	#-1,r6
	mov.l	r6,@r3
	mov.l	@(92,gbr),r0
	mov	r0,r3
	mov.l	@r15+,r2
	mov.w	@r2+,r5
	shll2	r5
	shll	r5
	add	#2,r2
	mov.l	@r2+,r4
	mov.l	@r2+,r1
	mov.l	.L060215D8,r7
	mov.l	.L060215D4,r2
	mov.l	.L060215DC,r8
	mov.l	.L060215E0,r12
	mov.w	@r12,r0
	shll2	r0
	shll	r0
	sub	r8,r0
	mov.l	.L060215E4,r8
	add	r0,r8
	add	#4,r2
.L060215C4:
	mov.l	.L060215E8,r12
	mov.w	@r12,r0
	mov	#2,r6
	shll8	r6
	cmp/ge	r8,r0
	bf	.L060215EC
	bra	.L060216CC
	nop
.L060215D4:
	.long poly_vertices
.L060215D8:
	.long poly_scratch
.L060215DC:
	.long 0x0000EEE0
.L060215E0:
	.long D_060213D6
.L060215E4:
	.long D_060C9000
.L060215E8:
	.long D_060FFC34 + 0x20000000
.L060215EC:
	mov.l	@r7+,r6
	cmp/pl	r6
	bt	.L060215F6
	bra	.L060216CC
	nop
.L060215F6:
	add	#1,r0
	mov.w	r0,@r12
	mov.w	@(2,r7),r0
	mov	r0,r10
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(12,r3)
	mov	r0,r10
	shlr2	r10
	add	r4,r10
	mov.w	@r10,r12
	mov.w	r12,@r8
	add	#2,r8
	mov	r0,r10
	add	#8,r10
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(16,r3)
	mov	r0,r10
	add	#8,r10
	shlr2	r10
	add	r4,r10
	mov.w	@r10,r12
	mov.w	r12,@r8
	add	#2,r8
	add	r5,r0
	mov	r0,r10
	add	#8,r10
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(20,r3)
	mov	r0,r10
	add	#8,r10
	shlr2	r10
	add	r4,r10
	mov.w	@r10,r12
	mov.w	r12,@r8
	add	#2,r8
	mov	r0,r10
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(24,r3)
	mov	r0,r10
	shlr2	r10
	add	r4,r10
	mov.w	@r10,r12
	mov.w	r12,@r8
	add	#2,r8
	mov.w	@r7+,r0
	add	#2,r7
	tst	r1,r1
	bt	.L06021694
	shll	r0
	add	r1,r0
	mov	r0,r10
	mov.w	@(2,r10),r0
	tst	r0,r0
	bt	.L06021694
	mov.l	.L06021690,r9
	add	#-1,r0
	shll2	r0
	shll	r0
	add	r0,r9
	mov.l	@r9,r0
	mov.l	r0,@(8,r3)
	mov.w	@(4,r10),r0
	mov.w	r0,@(4,r3)
	mov.w	@(4,r9),r0
	mov.w	r0,@(6,r3)
	mov.w	@(10,r10),r0
	mov.w	.L0602168C,r12
	or	r12,r0
	mov.w	r0,@r3
	bra	.L060216A6
	nop
.L0602168C:
	.short 0x1000
	.byte 0x00, 0x00
.L06021690:
	.long model_texture_table
.L06021694:
	bsr	func_060216DC
	nop
	mov.l	.L060216C0,r12
	or	r12,r0
	mov.l	r0,@(4,r3)
	mov.w	.L060216BA,r0
	mov.w	.L060216BC,r12
	or	r12,r0
	mov.w	r0,@r3
.L060216A6:
	mov.l	.L060216C4,r12
	mov.w	@r12,r0
	mov.w	r0,@(28,r3)
	add	#1,r0
	mov.w	r0,@r12
	mov.l	.L060216C8,r0
	jsr	@r0
	nop
	bra	.L060215C4
	add	#32,r3
.L060216BA:
	.short 0x0004
.L060216BC:
	.short 0x1000
	.byte 0x00, 0x00
.L060216C0:
	.long 0x08000000
.L060216C4:
	.long D_060213D6
.L060216C8:
	.long vdp1_zsort_insert
.L060216CC:
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	mov	r3,r0
	rts
	mov.l	r0,@(92,gbr)
	.byte 0x00, 0x09
	dlabel lbl_060216D8
	.long 0x00000000
	endlabel func_060213F4

	glabel func_060216DC
	mov	r6,r14
	shlr16	r14
	mov.w	@(136,gbr),r0
	sub	r0,r14
	mov.w	@(138,gbr),r0
	mov	r0,r12
	cmp/pz	r14
	bf	.L06021770
	muls.w	r14,r12
	sts	macl,r14
	swap.w	r14,r14
	exts.w	r14,r14
	mov	#8,r0
	cmp/ge	r0,r14
	bf	.L060216FC
	mov	#7,r14
.L060216FC:
	mov.w	.L06021768,r0
	mov	r0,r13
	mov	r13,r9
	mov	r13,r11
	mov	#31,r12
	and	r12,r13
	mov.w	@(142,gbr),r0
	sub	r13,r0
	muls.w	r14,r0
	sts	macl,r0
	shar	r0
	shar	r0
	shar	r0
	add	r0,r13
	and	r12,r13
	shll2	r12
	shll2	r12
	shll	r12
	and	r12,r11
	mov.w	@(144,gbr),r0
	sub	r11,r0
	muls.w	r14,r0
	sts	macl,r0
	shar	r0
	shar	r0
	shar	r0
	add	r0,r11
	and	r12,r11
	shll2	r12
	shll2	r12
	shll	r12
	and	r12,r9
	mov.w	@(146,gbr),r0
	sub	r9,r0
	muls.w	r14,r0
	sts	macl,r0
	shar	r0
	shar	r0
	shar	r0
	add	r0,r9
	and	r12,r9
	shll2	r12
	shll2	r12
	shll	r12
	mov	r12,r0
	or	r9,r0
	or	r11,r0
	or	r13,r0
	extu.w	r0,r0
	mov.l	.L0602176C,r14
	shlr16	r14
	shll16	r14
	rts
	or	r14,r0
.L06021768:
	.short 0xFEEF
	.byte 0x00, 0x00
.L0602176C:
	.long 0x00EC0000
.L06021770:
	mov.w	.L0602177E,r0
	extu.w	r0,r0
	mov.l	.L06021780,r14
	shlr16	r14
	shll16	r14
	rts
	or	r14,r0
.L0602177E:
	.short 0xFEEF
.L06021780:
	.long 0x00EC0000
	endlabel func_060216DC

	glabel func_06021784
	sts.l	pr,@-r15
	mov.l	.L06021804,r0
	ldc	r0,gbr
	mov.l	@r3+,r1
	mov.l	@r3+,r2
	mov.l	.L06021808,r0
	mov	r0,r3
	mov.l	@(12,r3),r0
	mov	r0,r4
	add	#16,r3
	mov.l	@(12,r3),r0
	mov	r0,r5
	add	#16,r3
	mov.l	@(12,r3),r0
	mov	r0,r6
	add	#16,r3
	mov.l	@r2+,r3
	mov.l	@r3,r12
	add	#12,r3
	mov.l	@(788,gbr),r0
	add	r12,r0
	cmp/ge	r0,r6
	bt	.L060217FC
	mov	#32,r0
	shll16	r0
	sub	r12,r0
	cmp/ge	r0,r6
	bf	.L060217FC
	mov.l	.L0602180C,r0
	dmuls.l	r0,r6
	sts	mach,r0
	sts	macl,r13
	xtrct	r0,r13
	mov.l	.L06021810,r0
	dmuls.l	r0,r12
	sts	mach,r0
	sts	macl,r12
	xtrct	r0,r12
	mov.l	.L06021814,r0
	dmuls.l	r0,r13
	sts	mach,r0
	sts	macl,r14
	xtrct	r0,r14
	add	r12,r14
	cmp/gt	r14,r4
	bt	.L060217FC
	neg	r14,r14
	cmp/ge	r14,r4
	bf	.L060217FC
	mov.l	lbl_060218B8,r0
	dmuls.l	r0,r13
	sts	mach,r0
	sts	macl,r14
	xtrct	r0,r14
	add	r12,r14
	cmp/gt	r14,r5
	bt	.L060217FC
	neg	r14,r14
	cmp/ge	r14,r5
	bt	.L06021818
.L060217FC:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06021804:
	.long gbr_block
.L06021808:
	.long D_060FE940
.L0602180C:
	.long 0x00008000
.L06021810:
	.long 0x00011E39
.L06021814:
	.long 0x00016000
.L06021818:
	mov.l	r1,@-r15
	mov.l	r2,@-r15
	mov.w	@r2+,r14
	mov.w	@r2+,r7
	mov	#0,r9
	mov.l	.L0602183C,r2
.L06021824:
	bsr	func_060212B4
	nop
	mov.l	@(788,gbr),r0
	cmp/ge	r0,r6
	bt	.L06021840
	mov	#-40,r0
	shll16	r0
	cmp/ge	r0,r6
	bf	.L06021840
	bra	.L0602187E
	mov	r14,r13
	.byte 0x00, 0x00
.L0602183C:
	.long D_060EB000
.L06021840:
	add	#-12,r3
	mov	r14,r13
.L06021844:
	mov	#0,r0
	mov.l	r0,@r2
	add	#8,r2
	add	#12,r3
	dt	r13
	bf/s	.L06021844
	add	#1,r9
	dt	r7
	bf	.L06021824
	bra	.L060218BC
	mov	r9,r6
.L0602185A:
	mov.l	@(788,gbr),r0
	cmp/ge	r0,r6
	bt	.L06021868
	mov	#32,r0
	shll16	r0
	cmp/ge	r0,r6
	bt	.L0602187E
.L06021868:
	mov	#0,r0
	mov.l	r0,@r2
	add	#8,r2
	add	#1,r9
	mov	r13,r0
	cmp/eq	#1,r0
	bt	.L0602187A
	bsr	func_060212B4
	nop
.L0602187A:
	bra	.L060218AA
	nop
.L0602187E:
	mov	#-16,r0
	and	r0,r6
	mov.l	r6,@r2
	mov.w	@(190,gbr),r0
	mov	#-128,r1
	shll	r1
	mov.l	r6,@(0,r1)
	mov.l	r0,@(16,r1)
	mov	#0,r0
	mov.l	r0,@(20,r1)
	mov	r4,r10
	mov	r5,r11
	mov	r13,r0
	cmp/eq	#1,r0
	bt	.L060218A0
	bsr	func_060212B4
	nop
.L060218A0:
	mov	#-128,r1
	shll	r1
	mov.l	@(28,r1),r0
	bsr	func_060212F8
	nop
.L060218AA:
	dt	r13
	bf	.L0602185A
	dt	r7
	bf	.L06021824
	bra	.L060218BC
	mov	r9,r6
	.byte 0x00, 0x09
	dlabel lbl_060218B8
	.long 0x00000000
.L060218BC:
	mov.l	@r15+,r2
	mov.l	r2,@-r15
	mov.w	@r2+,r5
	mov.w	@r2+,r7
	muls.w	r5,r7
	sts	macl,r0
	cmp/eq	r6,r0
	bf	.L060218D6
	mov.l	@r15+,r2
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
.L060218D6:
	add	#-1,r7
	mov.l	.L06021938,r2
	mov.l	.L0602193C,r3
	mov	#0,r11
	mov	#0,r12
.L060218E0:
	mov	r5,r1
	add	#-1,r1
.L060218E4:
	mov	#-1,r4
	bsr	func_06021356
	nop
	add	#8,r2
	add	#8,r11
	add	#8,r12
	dt	r1
	bf	.L060218E4
	add	#8,r2
	add	#8,r12
	dt	r7
	bf	.L060218E0
	mov	#-1,r6
	mov.l	r6,@r3
	mov.l	@(96,gbr),r0
	mov	r0,r3
	mov.l	@r15+,r2
	mov.w	@r2+,r5
	shll2	r5
	shll	r5
	add	#2,r2
	mov.l	@r2+,r4
	mov.l	@r2+,r1
	mov.l	.L0602193C,r7
	mov.l	.L06021938,r2
	mov.l	.L06021940,r8
	mov.l	.L06021944,r12
	mov.w	@r12,r0
	shll2	r0
	shll	r0
	sub	r8,r0
	mov.l	.L06021948,r8
	add	r0,r8
	add	#4,r2
.L06021928:
	mov.l	.L0602194C,r12
	mov.w	@r12,r0
	mov	#2,r6
	shll8	r6
	cmp/ge	r8,r0
	bf	.L06021950
	bra	.L06021A30
	nop
.L06021938:
	.long D_060EB000
.L0602193C:
	.long D_060EC800
.L06021940:
	.long 0x0000EEE0
.L06021944:
	.long D_060213D8
.L06021948:
	.long D_060C9000
.L0602194C:
	.long D_060FFC34 + 0x20000000
.L06021950:
	mov.l	@r7+,r6
	cmp/pl	r6
	bt	.L0602195A
	bra	.L06021A30
	nop
.L0602195A:
	add	#1,r0
	mov.w	r0,@r12
	mov.w	@(2,r7),r0
	mov	r0,r10
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(12,r3)
	mov	r0,r10
	shlr2	r10
	add	r4,r10
	mov.w	@r10,r12
	mov.w	r12,@r8
	add	#2,r8
	mov	r0,r10
	add	#8,r10
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(16,r3)
	mov	r0,r10
	add	#8,r10
	shlr2	r10
	add	r4,r10
	mov.w	@r10,r12
	mov.w	r12,@r8
	add	#2,r8
	add	r5,r0
	mov	r0,r10
	add	#8,r10
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(20,r3)
	mov	r0,r10
	add	#8,r10
	shlr2	r10
	add	r4,r10
	mov.w	@r10,r12
	mov.w	r12,@r8
	add	#2,r8
	mov	r0,r10
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(24,r3)
	mov	r0,r10
	shlr2	r10
	add	r4,r10
	mov.w	@r10,r12
	mov.w	r12,@r8
	add	#-14,r8
	mov.w	@r7+,r0
	add	#2,r7
	tst	r1,r1
	bt	.L060219F8
	shll	r0
	add	r1,r0
	mov	r0,r10
	mov.w	@(2,r10),r0
	tst	r0,r0
	bt	.L060219F8
	mov.l	.L060219F4,r9
	add	#-1,r0
	shll2	r0
	shll	r0
	add	r0,r9
	mov.l	@r9,r0
	mov.l	r0,@(8,r3)
	mov.w	@(4,r10),r0
	mov.w	r0,@(4,r3)
	mov.w	@(4,r9),r0
	mov.w	r0,@(6,r3)
	mov.w	@(10,r10),r0
	mov.w	.L060219F0,r12
	or	r12,r0
	mov.w	r0,@r3
	bra	.L06021A0A
	nop
.L060219F0:
	.short 0x1000
	.byte 0x00, 0x00
.L060219F4:
	.long model_texture_table
.L060219F8:
	bsr	func_060216DC
	nop
	mov.l	.L06021A24,r12
	or	r12,r0
	mov.l	r0,@(4,r3)
	mov.w	.L06021A1E,r0
	mov.w	.L06021A20,r12
	or	r12,r0
	mov.w	r0,@r3
.L06021A0A:
	mov.l	.L06021A28,r12
	mov.w	@r12,r0
	mov.w	r0,@(28,r3)
	add	#-1,r0
	mov.w	r0,@r12
	mov.l	.L06021A2C,r0
	jsr	@r0
	nop
	bra	.L06021928
	add	#32,r3
.L06021A1E:
	.short 0x0004
.L06021A20:
	.short 0x1000
	.byte 0x00, 0x00
.L06021A24:
	.long 0x08000000
.L06021A28:
	.long D_060213D8
.L06021A2C:
	.long func_0601F2A6
.L06021A30:
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	mov	r3,r0
	rts
	mov.l	r0,@(96,gbr)
	.byte 0x00, 0x00
	endlabel func_06021784

	.section .data.06021A3C,"aw",@progbits
	.p2align 2
	dlabel D_06021A3C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_06021A7C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_06021ABC
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09
	dlabel D_06021B8C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_06021BCC
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_06021C0C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09
	dlabel D_06021CDC
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_06021D1C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_06021D5C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
