	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601F068,"ax",@progbits
	.p2align 2

	glabel func_0601F068
	sts.l	pr,@-r15
	mov.w	.L0601F0BE,r0
	mov.l	.L0601F0C4,r2
	mov.w	r0,@r2
	mov	#0,r0
	mov.l	.L0601F0C8,r12
	mov.w	r0,@r12
	mov.l	.L0601F0CC,r3
	mov.l	.L0601F0D0,r0
	jsr	@r0
	nop
	mov.l	r1,@r3
	mov.b	r0,@r8
	mov.l	.L0601F0D4,r2
	mov.b	@r2,r0
	mov	#0,r0
	mov.b	r0,@r2
	mov.l	.L0601F0D8,r2
	mov	#-1,r0
	mov.w	r0,@r2
	mov.l	.L0601F0DC,r3
	mov	#0,r0
	mov.w	.L0601F0C0,r7
.L0601F096:
	mov.l	r0,@r3
	mov.l	r0,@(4,r3)
	dt	r7
	bf/s	.L0601F096
	add	#8,r3
	mov.l	@(808,gbr),r0
	mov	r0,r3
	mov	#9,r1
	shll16	r1
	mov.l	r1,@r3
	mov.l	.L0601F0E0,r1
	mov.l	r1,@(20,r3)
	add	#32,r3
	mov.l	.L0601F0E4,r4
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L0601F0E8
	add	#32,r4
	bra	.L0601F0EA
	mov.b	@(110,gbr),r0
.L0601F0BE:
	.short 0x1DDC
.L0601F0C0:
	.short 0x0400
	.byte 0x00, 0x00
.L0601F0C4:
	.long D_060213D6
.L0601F0C8:
	.long D_060FFC34 + 0x20000000
.L0601F0CC:
	.long func_0601F124
.L0601F0D0:
	.long func_06006070
.L0601F0D4:
	.long SH2_FTCSR
.L0601F0D8:
	.long 0x21000000
.L0601F0DC:
	.long D_060E8000
.L0601F0E0:
	.long 0x015F00DF
.L0601F0E4:
	.long D_0601F028
.L0601F0E8:
	mov	#0,r0
.L0601F0EA:
	shll2	r0
	shll2	r0
	add	r0,r4
	mov	#8,r1
	shll16	r1
	mov.l	r1,@r3
	mov.l	@r4+,r1
	mov.l	r1,@(12,r3)
	mov.l	@r4+,r1
	mov.l	r1,@(20,r3)
	add	#32,r3
	mov.w	.L0601F122,r1
	mov.w	r1,@r3
	mov.l	@r4+,r1
	mov.l	r1,@(12,r3)
	add	#32,r3
	mov	r3,r0
	mov.l	r0,@(92,gbr)
	mov	#0,r0
	mov.b	r0,@(48,gbr)
	mov.l	r0,@(792,gbr)
	mov.l	r0,@(796,gbr)
	mov.w	@(64,gbr),r0
	add	#-10,r0
	mov.w	r0,@(72,gbr)
	lds.l	@r15+,pr
	rts
	nop
.L0601F122:
	.short 0x100A
	endlabel func_0601F068

	glabel func_0601F124
	mov.l	.L0601F158,r0
	ldc	r0,gbr
	mov.l	.L0601F15C,r0
	mov.l	@r0,r0
	mov.l	r0,@(96,gbr)
	mov.l	.L0601F160,r0
	mov.l	@r0,r0
	mov.l	r0,@(808,gbr)
	mov.w	@(64,gbr),r0
	add	#-10,r0
	mov.w	r0,@(74,gbr)
	mov.w	.L0601F154,r0
	mov.l	.L0601F164,r2
	mov.w	r0,@r2
	mov.l	.L0601F168,r3
	mov	#0,r0
	mov.w	.L0601F156,r7
.L0601F146:
	mov.l	r0,@r3
	mov.l	r0,@(4,r3)
	dt	r7
	bf/s	.L0601F146
	add	#8,r3
	rts
	nop
.L0601F154:
	.short 0x1FDB
.L0601F156:
	.short 0x0200
.L0601F158:
	.long D_060FFC00
.L0601F15C:
	.long D_060FFF2C + 0x20000000
.L0601F160:
	.long D_060FFF28 + 0x20000000
.L0601F164:
	.long D_060213D8
.L0601F168:
	.long D_060E9000
	endlabel func_0601F124

	glabel func_0601F16C
	mov.l	.L0601F1D8,r3
	mov.l	.L0601F1DC,r2
	mov.w	.L0601F1D2,r1
.L0601F172:
	dt	r3
	bt	.L0601F17C
	mov.b	@r2,r0
	tst	r1,r0
	bt	.L0601F172
.L0601F17C:
	mov.l	@(808,gbr),r0
	mov	r0,r8
	mov	r8,r9
	add	#64,r8
	mov.l	.L0601F1E0,r3
	mov.l	.L0601F1E4,r4
	mov.w	.L0601F1D4,r7
.L0601F18A:
	mov.l	@r4,r0
	tst	r0,r0
	bt	.L0601F19C
	mov.l	@(4,r4),r10
	sub	r9,r0
	shlr2	r0
	shlr	r0
	mov.w	r0,@(2,r8)
	mov	r10,r8
.L0601F19C:
	mov.l	@r3,r0
	tst	r0,r0
	bt	.L0601F1AE
	mov.l	@(4,r3),r10
	sub	r9,r0
	shlr2	r0
	shlr	r0
	mov.w	r0,@(2,r8)
	mov	r10,r8
.L0601F1AE:
	add	#-8,r4
	dt	r7
	bf/s	.L0601F18A
	add	#-8,r3
	mov.l	.L0601F1E8,r0
	mov.l	@r0,r0
	mov	#-1,r1
	mov.w	r1,@r0
	sub	r9,r0
	shlr2	r0
	shlr	r0
	mov.w	r0,@(2,r8)
	mov.l	.L0601F1E8,r8
	mov.l	@r8,r0
	add	#32,r0
	mov.l	r0,@r8
	rts
	nop
.L0601F1D2:
	.short 0x0080
.L0601F1D4:
	.short 0x0200
	.byte 0x00, 0x00
.L0601F1D8:
	.long 0x000186A0
.L0601F1DC:
	.long 0xFFFFFE11
.L0601F1E0:
	.long D_060E8FF8
.L0601F1E4:
	.long D_060E9FF8
.L0601F1E8:
	.long D_060FFC60 + 0x20000000
	endlabel func_0601F16C

	glabel func_0601F1EC
	nop
	nop
	shar	r6
	shar	r6
	shar	r6
	mov.w	@(72,gbr),r0
	add	#-1,r0
	cmp/pl	r0
	bt	.L0601F204
	add	#-32,r3
	rts
	nop
.L0601F204:
	mov.w	r0,@(72,gbr)
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L0601F216
	mov.w	@(4,r3),r0
	mov	#4,r12
	shll8	r12
	or	r12,r0
	mov.w	r0,@(4,r3)
.L0601F216:
	swap.w	r6,r14
	extu.w	r14,r14
	extu.w	r6,r6
	mov	r6,r0
	mov.w	r0,@(30,r3)
	mov.l	.L0601F260,r0
	shll2	r14
	add	r14,r14
	add	r0,r14
	mov.l	@r14,r12
	tst	r12,r12
	bt	.L0601F276
	mov.w	@(30,r12),r0
	extu.w	r0,r0
	cmp/gt	r0,r6
	bt	.L0601F282
	mov.l	@(4,r14),r12
	mov.w	@(30,r12),r0
	extu.w	r0,r0
	cmp/gt	r0,r6
	bf	.L0601F292
	mov.l	@r14,r12
.L0601F242:
	mov.w	@(2,r12),r0
	tst	r0,r0
	bt	.L0601F242
	mov	r0,r14
	shll2	r14
	shll	r14
	mov.l	@(808,gbr),r0
	add	r0,r14
	mov.w	@(30,r14),r0
	extu.w	r0,r0
	cmp/gt	r0,r6
	bt	.L0601F264
	bra	.L0601F242
	mov	r14,r12
	.byte 0x00, 0x00
.L0601F260:
	.long D_060E8000
.L0601F264:
	mov.w	@(2,r12),r0
	mov.w	r0,@(2,r3)
	mov.l	@(808,gbr),r0
	neg	r0,r0
	add	r3,r0
	shlr2	r0
	shlr	r0
	rts
	mov.w	r0,@(2,r12)
.L0601F276:
	mov.l	r3,@r14
	add	#4,r14
	mov.l	r3,@r14
	mov	#0,r0
	rts
	mov.w	r0,@(2,r3)
.L0601F282:
	mov.l	@(808,gbr),r0
	neg	r0,r0
	add	r12,r0
	shlr2	r0
	shlr	r0
	mov.w	r0,@(2,r3)
	rts
	mov.l	r3,@r14
.L0601F292:
	mov.l	@(808,gbr),r0
	neg	r0,r0
	add	r3,r0
	shlr2	r0
	shlr	r0
	mov.w	r0,@(2,r12)
	mov.l	r3,@(4,r14)
	mov	#0,r0
	rts
	mov.w	r0,@(2,r3)
	endlabel func_0601F1EC

	glabel func_0601F2A6
	nop
	nop
	shar	r6
	shar	r6
	shar	r6
	mov.w	@(74,gbr),r0
	add	#-1,r0
	cmp/pl	r0
	bt	.L0601F2BE
	add	#-32,r3
	rts
	nop
.L0601F2BE:
	mov.w	r0,@(74,gbr)
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L0601F2D0
	mov.w	@(4,r3),r0
	mov	#4,r12
	shll8	r12
	or	r12,r0
	mov.w	r0,@(4,r3)
.L0601F2D0:
	swap.w	r6,r14
	extu.w	r14,r14
	extu.w	r6,r6
	mov	r6,r0
	mov.w	r0,@(30,r3)
	mov.l	.L0601F318,r0
	shll2	r14
	add	r14,r14
	add	r0,r14
	mov.l	@r14,r12
	tst	r12,r12
	bt	.L0601F32E
	mov.w	@(30,r12),r0
	extu.w	r0,r0
	cmp/gt	r0,r6
	bt	.L0601F33A
	mov.l	@(4,r14),r12
	mov.w	@(30,r12),r0
	extu.w	r0,r0
	cmp/gt	r0,r6
	bf	.L0601F34A
	mov.l	@r14,r12
.L0601F2FC:
	mov.w	@(2,r12),r0
	tst	r0,r0
	bt	.L0601F2FC
	mov	r0,r14
	shll2	r14
	shll	r14
	mov.l	@(808,gbr),r0
	add	r0,r14
	mov.w	@(30,r14),r0
	extu.w	r0,r0
	cmp/gt	r0,r6
	bt	.L0601F31C
	bra	.L0601F2FC
	mov	r14,r12
.L0601F318:
	.long D_060E9000
.L0601F31C:
	mov.w	@(2,r12),r0
	mov.w	r0,@(2,r3)
	mov.l	@(808,gbr),r0
	neg	r0,r0
	add	r3,r0
	shlr2	r0
	shlr	r0
	rts
	mov.w	r0,@(2,r12)
.L0601F32E:
	mov.l	r3,@r14
	add	#4,r14
	mov.l	r3,@r14
	mov	#0,r0
	rts
	mov.w	r0,@(2,r3)
.L0601F33A:
	mov.l	@(808,gbr),r0
	neg	r0,r0
	add	r12,r0
	shlr2	r0
	shlr	r0
	mov.w	r0,@(2,r3)
	rts
	mov.l	r3,@r14
.L0601F34A:
	mov.l	@(808,gbr),r0
	neg	r0,r0
	add	r3,r0
	shlr2	r0
	shlr	r0
	mov.w	r0,@(2,r12)
	mov.l	r3,@(4,r14)
	mov	#0,r0
	rts
	mov.w	r0,@(2,r3)
	.byte 0x62, 0x03, 0x64, 0x06, 0x65, 0x06, 0x66, 0x06, 0x25, 0x4B, 0x25, 0x6B, 0x25, 0x58, 0x89, 0x20
	.byte 0xC6, 0x1E, 0x68, 0x03, 0x00, 0x28, 0x08, 0x2F, 0x08, 0x2F, 0x08, 0x2F, 0x64, 0x86, 0x09, 0x0A
	.byte 0x0A, 0x1A, 0x2A, 0x9D, 0x34, 0xAC, 0x72, 0xF4, 0x00, 0x28, 0x08, 0x2F, 0x08, 0x2F, 0x08, 0x2F
	.byte 0x65, 0x86, 0x09, 0x0A, 0x0A, 0x1A, 0x2A, 0x9D, 0x35, 0xAC, 0x72, 0xF4, 0x00, 0x28, 0x08, 0x2F
	.byte 0x08, 0x2F, 0x08, 0x2F, 0x66, 0x86, 0x09, 0x0A, 0x0A, 0x1A, 0x2A, 0x9D, 0x36, 0xAC, 0xA0, 0x08
	.byte 0x00, 0x09, 0xC6, 0x1E, 0x68, 0x03, 0x54, 0x83, 0x78, 0x10, 0x55, 0x83, 0x78, 0x10, 0x56, 0x83
	.byte 0x72, 0x0C, 0x68, 0x22, 0xC6, 0xC5, 0x30, 0x8C, 0x36, 0x03, 0x89, 0x24, 0xE0, 0x20, 0x40, 0x28
	.byte 0x30, 0x88, 0x36, 0x03, 0x8B, 0x1F, 0xD0, 0x10, 0x36, 0x0D, 0x00, 0x0A, 0x09, 0x1A, 0x29, 0x0D
	.byte 0xD0, 0x0F, 0x38, 0x0D, 0x00, 0x0A, 0x08, 0x1A, 0x28, 0x0D, 0xD0, 0x0D, 0x39, 0x0D, 0x00, 0x0A
	.byte 0x0A, 0x1A, 0x2A, 0x0D, 0x3A, 0x8C, 0x34, 0xA7, 0x89, 0x0D, 0x6A, 0xAB, 0x34, 0xA3, 0x8B, 0x0A
	.byte 0xD0, 0x9B, 0x39, 0x0D, 0x00, 0x0A, 0x0A, 0x1A, 0x2A, 0x0D, 0x3A, 0x8C, 0x35, 0xA7, 0x89, 0x02
	.byte 0x6A, 0xAB, 0x35, 0xA3, 0x89, 0x07, 0x00, 0x0B, 0x00, 0x08, 0x00, 0x00, 0x80, 0x00, 0x00, 0x01
	.byte 0x1E, 0x39, 0x00, 0x01, 0x60, 0x00, 0x00, 0x0B, 0x00, 0x18
	endlabel func_0601F2A6

	glabel func_0601F428
	bra	.L0601F43C
	mov	#-117,r5
	endlabel func_0601F428

	glabel func_0601F42C
	nop
	nop
	bra	.L0601F43A
	mov	#-119,r5
	endlabel func_0601F42C

	glabel func_0601F434
	nop
	nop
	mov	#-117,r5
.L0601F43A:
	mov	#0,r6
.L0601F43C:
	sts.l	pr,@-r15
	mov.l	.L0601F478,r3
	mov.l	.L0601F47C,r0
	jsr	@r0
	nop
	tst	r0,r0
	bf	.L0601F488
	mov.l	r1,@r3
	mov.l	r2,@(4,r3)
	mov.l	r6,@(12,r3)
	mov.l	r5,@(16,r3)
	mov.l	@(120,gbr),r0
	mov	#12,r14
	add	#20,r3
.L0601F458:
	mov.l	@r0+,r2
	mov.l	r2,@r3
	dt	r14
	bf/s	.L0601F458
	add	#4,r3
	mov.l	.L0601F480,r2
	mov.b	@r2,r0
	mov	#0,r0
	mov.b	r0,@r2
	mov.l	.L0601F484,r2
	mov	#-1,r0
	mov.b	r0,@r8
	mov.w	r0,@r2
	lds.l	@r15+,pr
	rts
	nop
.L0601F478:
	.long D_0601FE7C
.L0601F47C:
	.long func_06006094
.L0601F480:
	.long SH2_FTCSR
.L0601F484:
	.long 0x21000000
.L0601F488:
	mov.l	.L0601F494,r0
	mov.b	r5,@r0
	mov	r6,r0
	mov.l	r0,@(824,gbr)
	bra	.L0601F670
	mov.l	@r2+,r3
.L0601F494:
	.long func_0601F83E
	.byte 0x00, 0x09, 0x00, 0x09, 0xA0, 0x03, 0xE5, 0x89
	endlabel func_0601F434

	glabel func_0601F4A0
	nop
	nop
	mov	#-117,r5
	mov.w	@(4,r1),r0
	shll8	r0
	bra	func_0601F4B6
	mov	r0,r14
	dlabel D_0601F4AE
	.byte 0x00, 0x09, 0x00, 0x09, 0xE5, 0x8B, 0xDE, 0x0F
	endlabel func_0601F4A0

	glabel func_0601F4B6
	sts.l	pr,@-r15
	mov.l	.L0601F4F8,r3
	mov.l	.L0601F4FC,r0
	jsr	@r0
	nop
	tst	r0,r0
	bf	.L0601F59C
	mov.l	r1,@r3
	mov.l	r2,@(4,r3)
	mov.l	r14,@(8,r3)
	mov.l	r5,@(16,r3)
	mov.l	@(120,gbr),r0
	mov	#12,r7
	add	#20,r3
.L0601F4D2:
	mov.l	@r0+,r2
	mov.l	r2,@r3
	dt	r7
	bf/s	.L0601F4D2
	add	#4,r3
	mov.l	.L0601F500,r2
	mov.b	@r2,r0
	mov	#0,r0
	mov.b	r0,@r2
	mov.l	.L0601F504,r2
	mov	#-1,r0
	mov.b	r0,@r8
	mov.w	r0,@r2
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
.L0601F4F8:
	.long func_0601FD92
.L0601F4FC:
	.long func_06006094
.L0601F500:
	.long SH2_FTCSR
.L0601F504:
	.long 0x21000000
	.byte 0x00, 0x09, 0x00, 0x09, 0xE5, 0x8B, 0xD0, 0x1D, 0x20, 0x50
	endlabel func_0601F4B6

	glabel func_0601F512
	sts.l	pr,@-r15
	mov.l	@(120,gbr),r0
	mov	r0,r3
	mov.l	@(12,r3),r4
	add	#16,r3
	mov.l	@(12,r3),r5
	add	#16,r3
	mov.l	@(12,r3),r6
	add	#16,r3
	mov.l	@r2+,r3
	mov.l	@r3,r12
	add	#12,r3
	mov.l	@(788,gbr),r0
	add	r12,r0
	cmp/ge	r0,r6
	bt	.L0601F57C
	mov	#32,r0
	shll16	r0
	sub	r12,r0
	cmp/ge	r0,r6
	bf	.L0601F57C
	mov.l	.L0601F588,r0
	dmuls.l	r0,r6
	sts	mach,r0
	sts	macl,r13
	xtrct	r0,r13
	mov.l	.L0601F58C,r0
	dmuls.l	r0,r12
	sts	mach,r0
	sts	macl,r12
	xtrct	r0,r12
	mov.l	.L0601F590,r0
	dmuls.l	r0,r13
	sts	mach,r0
	sts	macl,r14
	xtrct	r0,r14
	add	r12,r14
	cmp/gt	r14,r4
	bt	.L0601F57C
	neg	r14,r14
	cmp/ge	r14,r4
	bf	.L0601F57C
	mov.l	lbl_0601F66C,r0
	dmuls.l	r0,r13
	sts	mach,r0
	sts	macl,r14
	xtrct	r0,r14
	add	r12,r14
	cmp/gt	r14,r5
	bt	.L0601F57C
	neg	r14,r14
	cmp/ge	r14,r5
	bt	.L0601F594
.L0601F57C:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
	.long func_0601F83E
.L0601F588:
	.long 0x00008000
.L0601F58C:
	.long 0x00011E39
.L0601F590:
	.long 0x00016000
.L0601F594:
	mov	#0,r0
	mov.l	r0,@(824,gbr)
	bra	.L0601F670
	nop
.L0601F59C:
	mov.l	.L0601F5BC,r0
	mov.b	r5,@r0
	mov	#30,r0
	mov.b	@(r0,r1),r0
	cmp/pz	r0
	bt	.L0601F660
	and	#1,r0
	mov	r0,r3
	mov.l	@(12,gbr),r0
	shar	r0
	and	#1,r0
	cmp/eq	r3,r0
	bt	.L0601F5C0
	lds.l	@r15+,pr
	rts
	nop
.L0601F5BC:
	.long func_0601F83E
.L0601F5C0:
	mov.l	@(120,gbr),r0
	mov	r0,r3
	mov.l	@(12,r3),r4
	add	#16,r3
	mov.l	@(12,r3),r5
	add	#16,r3
	mov.l	@(12,r3),r6
	add	#16,r3
	mov.l	@r2+,r3
	mov.l	@r3,r12
	add	#12,r3
	dmuls.l	r12,r14
	sts	mach,r0
	sts	macl,r12
	xtrct	r0,r12
	mov.l	@(788,gbr),r0
	add	r12,r0
	cmp/ge	r0,r6
	bt	.L0601F630
	mov	#32,r0
	shll16	r0
	sub	r12,r0
	cmp/ge	r0,r6
	bf	.L0601F630
	mov.l	.L0601F64C,r0
	dmuls.l	r0,r6
	sts	mach,r0
	sts	macl,r13
	xtrct	r0,r13
	mov.l	.L0601F650,r0
	dmuls.l	r0,r12
	sts	mach,r0
	sts	macl,r12
	xtrct	r0,r12
	mov.l	.L0601F654,r0
	dmuls.l	r0,r13
	sts	mach,r0
	sts	macl,r14
	xtrct	r0,r14
	add	r12,r14
	cmp/gt	r14,r4
	bt	.L0601F630
	neg	r14,r14
	cmp/ge	r14,r4
	bf	.L0601F630
	mov.l	lbl_0601F66C,r0
	dmuls.l	r0,r13
	sts	mach,r0
	sts	macl,r14
	xtrct	r0,r14
	add	r12,r14
	cmp/gt	r14,r5
	bt	.L0601F630
	neg	r14,r14
	cmp/ge	r14,r5
	bt	.L0601F664
.L0601F630:
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
	.byte 0x00, 0x00
.L0601F64C:
	.long 0x00008000
.L0601F650:
	.long 0x00011E39
.L0601F654:
	.long 0x00016000
	.byte 0x85, 0x1F, 0x93, 0x06, 0x20, 0x39, 0x81, 0x1F
.L0601F660:
	mov.l	@r2+,r3
	add	#12,r3
.L0601F664:
	mov	#0,r0
	bra	.L0601F670
	mov.l	r0,@(824,gbr)
	.byte 0x7F, 0xFF
	dlabel lbl_0601F66C
	.long 0x00000000
.L0601F670:
	mov.l	@r2,r7
	mov	#0,r9
	mov.l	r1,@-r15
	mov.l	r2,@-r15
	mov.l	.L0601F6D8,r2
.L0601F67A:
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
.L0601F6B8:
	mov.l	@(788,gbr),r0
	cmp/ge	r0,r6
	bt	.L0601F6C6
	mov	#32,r0
	shll16	r0
	cmp/ge	r0,r6
	bt	.L0601F6DC
.L0601F6C6:
	mov	#0,r0
	mov.l	r0,@r2
	add	#8,r2
	add	#1,r9
	dt	r7
	bf	.L0601F67A
	bra	.L0601F7C8
	mov	r9,r6
	.byte 0x00, 0x00
.L0601F6D8:
	.long D_060EA000
.L0601F6DC:
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
	mov.l	@(28,r1),r0
	dmuls.l	r0,r10
	mov	r0,r1
	shar	r1
	shar	r1
	shar	r1
	dlabel lbl_0601F73E
	sub	r1,r0
	sts	mach,r10
	dmuls.l	r0,r11
	sts	mach,r11
	mov.l	@r2+,r1
	mov.l	@(784,gbr),r0
	cmp/ge	r0,r1
	mov	#0,r0
	bf	.L0601F752
	mov	#15,r0
.L0601F752:
	mov	#88,r12
	shll	r12
	cmp/ge	r12,r10
	add	r12,r10
	bf	.L0601F76A
	mov	#8,r0
	mov	#4,r12
	shll8	r12
	cmp/ge	r12,r10
	bf	.L0601F76A
	mov	r12,r10
	add	#-1,r10
.L0601F76A:
	cmp/pz	r10
	bt	.L0601F77C
	mov	#4,r0
	mov	#-4,r12
	shll8	r12
	cmp/gt	r12,r10
	bt	.L0601F77C
	mov	r12,r10
	add	#1,r10
.L0601F77C:
	mov	#112,r12
	cmp/ge	r12,r11
	add	r12,r11
	bf	.L0601F792
	or	#2,r0
	mov	#4,r12
	shll8	r12
	cmp/ge	r12,r11
	bf	.L0601F792
	mov	r12,r11
	add	#-1,r11
.L0601F792:
	cmp/pz	r11
	bt	.L0601F7A4
	or	#1,r0
	mov	#-4,r12
	shll8	r12
	cmp/gt	r12,r11
	bt	.L0601F7A4
	mov	r12,r11
	add	#1,r11
.L0601F7A4:
	mov.w	r10,@r2
	add	#2,r2
	mov.w	r11,@r2
	add	#2,r2
	tst	r0,r0
	bt	.L0601F7BE
	add	#-8,r2
	mov.l	@r2,r11
	or	r0,r11
	neg	r11,r11
	mov.l	r11,@r2
	add	#8,r2
	add	#1,r9
.L0601F7BE:
	dt	r7
	bt	.L0601F7C6
	bra	.L0601F6B8
	nop
.L0601F7C6:
	mov	r9,r6
.L0601F7C8:
	mov.l	@r15+,r2
	mov.l	@r2+,r7
	cmp/eq	r6,r7
	bf	.L0601F7D8
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
.L0601F7D8:
	mov.l	r2,@-r15
	mov.l	@r2+,r5
	mov.l	@r2+,r7
	mov.l	@r2+,r1
	mov.l	.L0601F808,r2
	mov.l	.L0601F80C,r3
	mov	#0,r12
.L0601F7E6:
	mov	#15,r4
	mov	#-2,r11
	mov.b	@r1,r0
	cmp/pz	r0
	bt	.L0601F7F6
	mov.w	@r5,r0
	cmp/pz	r0
	bf	.L0601F876
.L0601F7F6:
	mov.b	@(1,r1),r0
	and	#3,r0
	add	r0,r0
	mov.l	.L0601F810,r13
	mov.w	@(r0,r13),r0
	add	r13,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0601F808:
	.long D_060EA000
.L0601F80C:
	.long D_060EC000
.L0601F810:
	.long .L0601F8BA
.L0601F814:
	mov	#15,r13
	and	r13,r4
	tst	r4,r4
	bf	.L0601F866
	mov.b	@r1,r13
	cmp/pz	r13
	bf	.L0601F858
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
	endlabel func_0601F512

	glabel func_0601F83E
	bf	.L0601F858
	mov.b	@r1,r13
	tst	r13,r13
	bt	.L0601F866
	mov.l	r6,@r3
	add	#4,r3
	mov.b	r6,@r3
	add	#1,r3
	mov.b	r11,@r3
	add	#1,r3
	mov.w	r12,@r3
	bra	.L0601F866
	add	#2,r3
.L0601F858:
	mov.l	r6,@r3
	add	#4,r3
	extu.b	r11,r11
	mov.w	r11,@r3
	add	#2,r3
	mov.w	r12,@r3
	add	#2,r3
.L0601F866:
	add	#8,r12
	add	#8,r5
	add	#16,r1
	dt	r7
	bf	.L0601F7E6
	mov	#-1,r6
	bra	.L0601FAD4
	mov.l	r6,@r3
.L0601F876:
	mov.b	@(1,r1),r0
	and	#3,r0
	add	r0,r0
	mov.l	.L0601F888,r13
	mov.w	@(r0,r13),r0
	add	r13,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0601F888:
	.long func_0601F88C
	endlabel func_0601F83E

	glabel func_0601F88C
	clrt
	clrt
	clrt
	mov.b	@(r0,r1),r0
.L0601F894:
	mov.w	@(2,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L0601F866
	cmp/pl	r13
	bt	.L0601F8A2
	neg	r13,r13
.L0601F8A2:
	mov	r13,r6
	bra	.L0601F858
	nop
.L0601F8A8:
	mov.w	@(2,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L0601F866
	cmp/pl	r13
	bt	.L0601F8B6
	neg	r13,r13
.L0601F8B6:
	bra	.L0601F858
	nop
.L0601F8BA:
	.short .L0601F8C2 - .L0601F8BA
	.short .L0601F942 - .L0601F8BA
	.short .L0601F9D6 - .L0601F8BA
	.short .L0601FA62 - .L0601F8BA
.L0601F8C2:
	mov	#0,r6
	mov.w	@r5,r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L0601F866
	cmp/pl	r13
	bt	.L0601F8D4
	neg	r13,r13
	add	#1,r11
.L0601F8D4:
	and	r13,r4
	add	r13,r6
	add	#4,r0
	mov.w	@(r0,r2),r8
	add	#2,r0
	mov.w	@(r0,r2),r9
	mov.w	@(2,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L0601F866
	cmp/pl	r13
	bt	.L0601F8F0
	neg	r13,r13
	add	#1,r11
.L0601F8F0:
	and	r13,r4
	add	r13,r6
	add	#4,r0
	mov.w	@(r0,r2),r10
	add	#2,r0
	mov.w	@(r0,r2),r14
	mov.w	@(6,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L0601F866
	cmp/pl	r13
	bt	.L0601F90C
	neg	r13,r13
	add	#1,r11
.L0601F90C:
	and	r13,r4
	add	r13,r6
	mov.w	@(4,r5),r0
	cmp/pz	r0
	bt	.L0601F928
	neg	r0,r0
	add	#-8,r0
	mov.l	@(r0,r2),r13
	add	#4,r0
	mov.w	@(r0,r2),r10
	add	#2,r0
	mov.w	@(r0,r2),r14
	bra	.L0601F92A
	mov.w	@(6,r5),r0
.L0601F928:
	mov.l	@(r0,r2),r13
.L0601F92A:
	tst	r13,r13
	bt	.L0601F866
	cmp/pl	r13
	bt	.L0601F936
	neg	r13,r13
	add	#1,r11
.L0601F936:
	and	r13,r4
	add	r13,r6
	shar	r6
	shar	r6
	bra	.L0601F814
	nop
.L0601F942:
	mov.l	.L0601F9B4,r6
	mov.w	@r5,r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L0601F9D2
	cmp/pl	r13
	bt	.L0601F954
	neg	r13,r13
	add	#1,r11
.L0601F954:
	and	r13,r4
	cmp/ge	r6,r13
	bt	.L0601F95C
	mov	r13,r6
.L0601F95C:
	add	#4,r0
	mov.w	@(r0,r2),r8
	add	#2,r0
	mov.w	@(r0,r2),r9
	mov.w	@(2,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L0601F9D2
	cmp/pl	r13
	bt	.L0601F974
	neg	r13,r13
	add	#1,r11
.L0601F974:
	and	r13,r4
	cmp/ge	r6,r13
	bt	.L0601F97C
	mov	r13,r6
.L0601F97C:
	add	#4,r0
	mov.w	@(r0,r2),r10
	add	#2,r0
	mov.w	@(r0,r2),r14
	mov.w	@(6,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L0601F9D2
	cmp/pl	r13
	bt	.L0601F994
	neg	r13,r13
	add	#1,r11
.L0601F994:
	and	r13,r4
	cmp/ge	r6,r13
	bt	.L0601F99C
	mov	r13,r6
.L0601F99C:
	mov.w	@(4,r5),r0
	cmp/pz	r0
	bt	.L0601F9B8
	neg	r0,r0
	add	#-8,r0
	mov.l	@(r0,r2),r13
	add	#4,r0
	mov.w	@(r0,r2),r10
	add	#2,r0
	mov.w	@(r0,r2),r14
	bra	.L0601F9BA
	mov.w	@(6,r5),r0
.L0601F9B4:
	.long 0x7FFFFFFF
.L0601F9B8:
	mov.l	@(r0,r2),r13
.L0601F9BA:
	tst	r13,r13
	bt	.L0601F9D2
	cmp/pl	r13
	bt	.L0601F9C6
	neg	r13,r13
	add	#1,r11
.L0601F9C6:
	and	r13,r4
	cmp/ge	r6,r13
	bt	.L0601F9CE
	mov	r13,r6
.L0601F9CE:
	bra	.L0601F814
	nop
.L0601F9D2:
	bra	.L0601F866
	nop
.L0601F9D6:
	mov	#0,r6
	mov.w	@r5,r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L0601F9D2
	cmp/pl	r13
	bt	.L0601F9E8
	neg	r13,r13
	add	#1,r11
.L0601F9E8:
	and	r13,r4
	cmp/ge	r6,r13
	bf	.L0601F9F0
	mov	r13,r6
.L0601F9F0:
	add	#4,r0
	mov.w	@(r0,r2),r8
	add	#2,r0
	mov.w	@(r0,r2),r9
	mov.w	@(2,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L0601F9D2
	cmp/pl	r13
	bt	.L0601FA08
	neg	r13,r13
	add	#1,r11
.L0601FA08:
	and	r13,r4
	cmp/ge	r6,r13
	bf	.L0601FA10
	mov	r13,r6
.L0601FA10:
	add	#4,r0
	mov.w	@(r0,r2),r10
	add	#2,r0
	mov.w	@(r0,r2),r14
	mov.w	@(6,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L0601F9D2
	cmp/pl	r13
	bt	.L0601FA28
	neg	r13,r13
	add	#1,r11
.L0601FA28:
	and	r13,r4
	cmp/ge	r6,r13
	bf	.L0601FA30
	mov	r13,r6
.L0601FA30:
	mov.w	@(4,r5),r0
	cmp/pz	r0
	bt	.L0601FA48
	neg	r0,r0
	add	#-8,r0
	mov.l	@(r0,r2),r13
	add	#4,r0
	mov.w	@(r0,r2),r10
	add	#2,r0
	mov.w	@(r0,r2),r14
	bra	.L0601FA4A
	mov.w	@(6,r5),r0
.L0601FA48:
	mov.l	@(r0,r2),r13
.L0601FA4A:
	tst	r13,r13
	bt	.L0601F9D2
	cmp/pl	r13
	bt	.L0601FA56
	neg	r13,r13
	add	#1,r11
.L0601FA56:
	and	r13,r4
	cmp/ge	r6,r13
	bf	.L0601FA5E
	mov	r13,r6
.L0601FA5E:
	bra	.L0601F814
	nop
.L0601FA62:
	mov.w	@r5,r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L0601F9D2
	cmp/pl	r13
	bt	.L0601FA72
	neg	r13,r13
	add	#1,r11
.L0601FA72:
	and	r13,r4
	add	#4,r0
	mov.w	@(r0,r2),r8
	add	#2,r0
	mov.w	@(r0,r2),r9
	mov.w	@(2,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L0601F9D2
	cmp/pl	r13
	bt	.L0601FA8C
	neg	r13,r13
	add	#1,r11
.L0601FA8C:
	and	r13,r4
	add	#4,r0
	mov.w	@(r0,r2),r10
	add	#2,r0
	mov.w	@(r0,r2),r14
	mov.w	@(6,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L0601F9D2
	cmp/pl	r13
	bt	.L0601FAA6
	neg	r13,r13
	add	#1,r11
.L0601FAA6:
	and	r13,r4
	mov.w	@(4,r5),r0
	cmp/pz	r0
	bt	.L0601FAC0
	neg	r0,r0
	add	#-8,r0
	mov.l	@(r0,r2),r13
	add	#4,r0
	mov.w	@(r0,r2),r10
	add	#2,r0
	mov.w	@(r0,r2),r14
	bra	.L0601FAC2
	mov.w	@(6,r5),r0
.L0601FAC0:
	mov.l	@(r0,r2),r13
.L0601FAC2:
	tst	r13,r13
	bt	.L0601F9D2
	cmp/pl	r13
	bt	.L0601FACE
	neg	r13,r13
	add	#1,r11
.L0601FACE:
	and	r13,r4
	bra	.L0601F814
	nop
.L0601FAD4:
	mov.l	@(92,gbr),r0
	mov	r0,r3
	mov.l	@r15+,r2
	mov.l	@r15+,r1
	mov.l	@r2+,r5
	add	#4,r2
	mov.l	@r2+,r4
	mov.l	.L0601FAF4,r7
	mov.l	.L0601FAF8,r2
	add	#4,r2
.L0601FAE8:
	mov.l	@r7+,r6
	cmp/pl	r6
	bt	.L0601FAFC
	bra	.L0601FC08
	nop
	.byte 0x00, 0x00
.L0601FAF4:
	.long D_060EC000
.L0601FAF8:
	.long D_060EA000
.L0601FAFC:
	mov.w	@(2,r7),r0
	mov.w	@(r0,r5),r10
	cmp/pz	r10
	bt	.L0601FB08
	bra	.L0601FC10
	nop
.L0601FB08:
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(12,r3)
	add	#2,r0
	mov.w	@(r0,r5),r10
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(16,r3)
	add	#2,r0
	mov.w	@(r0,r5),r10
	cmp/pz	r10
	bt	.L0601FB24
	neg	r10,r10
	add	#-8,r10
.L0601FB24:
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(20,r3)
	add	#2,r0
	mov.w	@(r0,r5),r10
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(24,r3)
	add	#-6,r0
	shll	r0
	add	r4,r0
	mov	r0,r10
	mov.w	@(2,r10),r0
	tst	r0,r0
	bt	.L0601FBB4
	cmp/pl	r0
	bt	.L0601FB88
	neg	r0,r0
	add	#-1,r0
	mov.l	.L0601FB80,r9
	shll2	r0
	add	r0,r9
	mov.w	@(2,r9),r0
	mov.w	.L0601FB7E,r12
	or	r0,r12
	mov.w	@(10,r10),r0
	or	r12,r0
	mov.w	r0,@r3
	mov.w	@r9,r0
	tst	r0,r0
	bt	.L0601FBB4
	mov.l	.L0601FB84,r9
	add	#-1,r0
	shll2	r0
	shll	r0
	add	r0,r9
	mov.l	@r9,r0
	mov.l	r0,@(8,r3)
	mov.w	@(4,r10),r0
	mov.w	r0,@(4,r3)
	add	#2,r7
	bsr	func_0601FCB0
	nop
	bra	.L0601FBE8
	nop
.L0601FB7E:
	.short 0x1000
.L0601FB80:
	.long D_060F0000
.L0601FB84:
	.long D_060ED000
.L0601FB88:
	mov.l	.L0601FBB0,r9
	add	#-1,r0
	shll2	r0
	shll	r0
	add	r0,r9
	mov.l	@r9,r0
	mov.l	r0,@(8,r3)
	mov.w	@(4,r10),r0
	add	#1,r7
	mov.b	@r7+,r12
	cmp/pz	r12
	bt	.L0601FBA4
	mov.w	.L0601FBAE,r12
	or	r12,r0
.L0601FBA4:
	mov.w	r0,@(4,r3)
	bsr	func_0601FCB0
	nop
	bra	.L0601FBE0
	nop
.L0601FBAE:
	.short 0x0800
.L0601FBB0:
	.long D_060ED000
.L0601FBB4:
	mov.b	@r7+,r0
	tst	r0,r0
	bt	.L0601FBD0
	mov.l	@(12,r10),r0
	mov.b	@r7+,r12
	cmp/pz	r12
	bt	.L0601FBC6
	mov.l	.L0601FBCC,r12
	or	r12,r0
.L0601FBC6:
	bra	.L0601FBE0
	mov.l	r0,@(4,r3)
	.byte 0x00, 0x00
.L0601FBCC:
	.long 0x08000000
.L0601FBD0:
	bsr	func_0601FCEE
	nop
	mov.b	@r7+,r12
	cmp/pz	r12
	bt	.L0601FBDE
	mov.l	.L0601FC04,r12
	or	r12,r0
.L0601FBDE:
	mov.l	r0,@(4,r3)
.L0601FBE0:
	mov.w	@(10,r10),r0
	mov.w	.L0601FC00,r12
	or	r12,r0
	mov.w	r0,@r3
.L0601FBE8:
	add	#8,r10
	mov.w	@r10,r12
	mov.w	@(28,r1),r0
	add	r12,r0
	mov.w	r0,@(28,r3)
	mov.l	@(824,gbr),r0
	add	r0,r6
	bsr	func_0601F1EC
	nop
	add	#2,r7
	bra	.L0601FAE8
	add	#32,r3
.L0601FC00:
	.short 0x1000
	.byte 0x00, 0x00
.L0601FC04:
	.long 0x08000000
.L0601FC08:
	lds.l	@r15+,pr
	mov	r3,r0
	rts
	mov.l	r0,@(92,gbr)
.L0601FC10:
	mov	r0,r8
	mov.w	@(190,gbr),r0
	mov	r0,r14
	mov.w	@(16,r1),r0
	shll16	r14
	shll8	r0
	dmuls.l	r0,r14
	sts	mach,r0
	mov	#-128,r14
	shll	r14
	mov.l	r6,@(0,r14)
	mov.l	r0,@(16,r14)
	mov	#0,r0
	mov.l	r0,@(20,r14)
	mov	r8,r0
	add	#2,r0
	mov.w	@(r0,r5),r10
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(12,r3)
	add	#-2,r0
	shll	r0
	add	r4,r0
	mov	r0,r10
	mov.w	@(10,r10),r0
	mov	r0,r12
	mov.w	@(2,r10),r0
	cmp/pz	r0
	bt	.L0601FC5A
	neg	r0,r0
	add	#-1,r0
	mov.l	.L0601FCA4,r9
	shll2	r0
	add	r0,r9
	mov.w	@(2,r9),r0
	or	r0,r12
	mov.w	@r9,r0
.L0601FC5A:
	mov.l	.L0601FCA8,r9
	add	#-1,r0
	shll2	r0
	shll	r0
	add	r0,r9
	mov.l	@r9,r13
	mov.l	r13,@(8,r3)
	mov.l	.L0601FCAC,r11
	and	r11,r13
	shlr8	r11
	and	r13,r11
	shlr2	r13
	shlr2	r13
	shlr	r13
	mov.w	.L0601FCA0,r0
	or	r12,r0
	mov.w	r0,@r3
	mov.w	@(4,r10),r0
	mov.w	r0,@(4,r3)
	bsr	func_0601FCB0
	nop
	mov	#-128,r14
	shll	r14
	mov.l	@(28,r14),r14
	shll16	r13
	shll16	r11
	dmuls.l	r14,r13
	sts	mach,r13
	dmuls.l	r14,r11
	sts	mach,r11
	shll16	r13
	or	r11,r13
	mov.l	r13,@(16,r3)
	bra	.L0601FBE8
	add	#2,r7
.L0601FCA0:
	.short 0x1000
	.byte 0x00, 0x00
.L0601FCA4:
	.long D_060F0000
.L0601FCA8:
	.long D_060ED000
.L0601FCAC:
	.long 0x0000FFFF
	endlabel func_0601F88C

	glabel func_0601FCB0
	tst	#8,r0
	bt	.L0601FCD8
	mov	r6,r14
	shlr16	r14
	mov.w	@(136,gbr),r0
	sub	r0,r14
	mov.w	@(138,gbr),r0
	mov	r0,r12
	cmp/pz	r14
	bf	.L0601FCE4
	muls.w	r14,r12
	sts	macl,r14
	swap.w	r14,r14
	exts.w	r14,r14
	mov	#8,r0
	cmp/ge	r0,r14
	bf	.L0601FCD4
	mov	#7,r14
.L0601FCD4:
	bra	.L0601FCE6
	shll2	r14
.L0601FCD8:
	mov.w	@(4,r9),r0
	mov.w	.L0601FCE2,r14
	and	r14,r0
	rts
	mov.w	r0,@(6,r3)
.L0601FCE2:
	.short 0x7FFF
.L0601FCE4:
	mov	#0,r14
.L0601FCE6:
	mov.w	@(4,r9),r0
	add	r14,r0
	rts
	mov.w	r0,@(6,r3)
	endlabel func_0601FCB0

	glabel func_0601FCEE
	mov.b	@(20,gbr),r0
	cmp/eq	#13,r0
	bt	.L0601FD84
	cmp/eq	#15,r0
	bt	.L0601FD84
	mov	r6,r14
	shlr16	r14
	mov.w	@(136,gbr),r0
	sub	r0,r14
	mov.w	@(138,gbr),r0
	mov	r0,r12
	cmp/pz	r14
	bf	.L0601FD84
	muls.w	r14,r12
	sts	macl,r14
	swap.w	r14,r14
	exts.w	r14,r14
	mov	#8,r0
	cmp/ge	r0,r14
	bf	.L0601FD18
	mov	#7,r14
.L0601FD18:
	mov.w	@(6,r10),r0
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
	mov.l	@(4,r10),r14
	shlr16	r14
	shll16	r14
	rts
	or	r14,r0
.L0601FD84:
	mov.w	@(6,r10),r0
	extu.w	r0,r0
	mov.l	@(4,r10),r14
	shlr16	r14
	shll16	r14
	rts
	or	r14,r0
	endlabel func_0601FCEE

	glabel func_0601FD92
	mov.l	.L0601FDC4,r0
	ldc	r0,gbr
	mov.l	@r3,r1
	mov.l	@(4,r3),r2
	mov.l	@(8,r3),r14
	mov.l	@(12,r3),r0
	mov.l	r0,@(828,gbr)
	mov.l	@(16,r3),r5
	mov.l	.L0601FDC8,r0
	mov.b	r5,@r0
	mov	#0,r0
	mov.l	r0,@(828,gbr)
	mov	#30,r0
	mov.b	@(r0,r1),r0
	cmp/pz	r0
	bt	.L0601FE68
	and	#1,r0
	mov	r0,r3
	mov.l	@(12,gbr),r0
	shar	r0
	and	#1,r0
	cmp/eq	r3,r0
	bt	.L0601FDCC
	rts
	nop
.L0601FDC4:
	.long D_060FFC00
.L0601FDC8:
	.long func_0602006E
.L0601FDCC:
	mov.l	.L0601FE58,r0
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
	dmuls.l	r12,r14
	sts	mach,r0
	sts	macl,r12
	xtrct	r0,r12
	mov.l	@(788,gbr),r0
	add	r12,r0
	cmp/ge	r0,r6
	bt	.L0601FE42
	mov	#32,r0
	shll16	r0
	sub	r12,r0
	cmp/ge	r0,r6
	bf	.L0601FE42
	mov.l	.L0601FE5C,r0
	dmuls.l	r0,r6
	sts	mach,r0
	sts	macl,r13
	xtrct	r0,r13
	mov.l	.L0601FE60,r0
	dmuls.l	r0,r12
	sts	mach,r0
	sts	macl,r12
	xtrct	r0,r12
	mov.l	.L0601FE64,r0
	dmuls.l	r0,r13
	sts	mach,r0
	sts	macl,r14
	xtrct	r0,r14
	add	r12,r14
	cmp/gt	r14,r4
	bt	.L0601FE42
	neg	r14,r14
	cmp/ge	r14,r4
	bf	.L0601FE42
	mov.l	lbl_0601FE78,r0
	dmuls.l	r0,r13
	sts	mach,r0
	sts	macl,r14
	xtrct	r0,r14
	add	r12,r14
	cmp/gt	r14,r5
	bt	.L0601FE42
	neg	r14,r14
	cmp/ge	r14,r5
	bt	.L0601FE90
.L0601FE42:
	mov	#30,r3
	add	r1,r3
	mov.b	@r3,r8
	mov.w	@(68,gbr),r0
	xor	#1,r0
	or	#128,r0
	shlr	r8
	shll	r8
	or	r8,r0
	rts
	mov.b	r0,@r3
.L0601FE58:
	.long D_060FE940
.L0601FE5C:
	.long 0x00008000
.L0601FE60:
	.long 0x00011E39
.L0601FE64:
	.long 0x00016000
.L0601FE68:
	mov.w	@(30,r1),r0
	mov.w	.L0601FE76,r3
	and	r3,r0
	mov.w	r0,@(30,r1)
	mov.l	@r2+,r3
	bra	.L0601FE90
	add	#12,r3
.L0601FE76:
	.short 0x7FFF
	dlabel lbl_0601FE78
	.long 0x00000000
	dlabel D_0601FE7C
	.byte 0xD0, 0x1E, 0x40, 0x1E, 0x61, 0x32, 0x52, 0x31, 0x50, 0x33, 0xC2, 0xCF, 0x55, 0x34, 0xD0, 0x1C
	.byte 0x20, 0x50, 0x63, 0x26
.L0601FE90:
	sts.l	pr,@-r15
	mov.l	@r2,r7
	mov	#0,r9
	mov.l	r1,@-r15
	mov.l	r2,@-r15
	mov.l	.L0601FF00,r2
.L0601FE9C:
	mov.l	.L0601FF04,r0
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
.L0601FEDA:
	mov.l	@(788,gbr),r0
	cmp/ge	r0,r6
	bt	.L0601FEE8
	mov	#32,r0
	shll16	r0
	cmp/ge	r0,r6
	bt	.L0601FF08
.L0601FEE8:
	mov	#0,r0
	mov.l	r0,@r2
	add	#8,r2
	add	#1,r9
	dt	r7
	bf	.L0601FE9C
	bra	.L0601FFFA
	mov	r9,r6
	.long D_060FFC00
	.long func_0602006E
.L0601FF00:
	.long D_060EB000
.L0601FF04:
	.long D_060FE940
.L0601FF08:
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
	mov.l	.L0601FFF4,r0
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
	mov.l	@(28,r1),r0
	dmuls.l	r0,r10
	mov	r0,r1
	shar	r1
	shar	r1
	shar	r1
	dlabel lbl_0601FF6A
	sub	r1,r0
	sts	mach,r10
	dmuls.l	r0,r11
	sts	mach,r11
	mov.l	@r2+,r1
	mov.l	@(784,gbr),r0
	cmp/ge	r0,r1
	mov	#0,r0
	bf	.L0601FF7E
	mov	#15,r0
.L0601FF7E:
	mov	#88,r12
	shll	r12
	cmp/ge	r12,r10
	add	r12,r10
	bf	.L0601FF96
	mov	#8,r0
	mov	#4,r12
	shll8	r12
	cmp/ge	r12,r10
	bf	.L0601FF96
	mov	r12,r10
	add	#-1,r10
.L0601FF96:
	cmp/pz	r10
	bt	.L0601FFA8
	mov	#4,r0
	mov	#-4,r12
	shll8	r12
	cmp/gt	r12,r10
	bt	.L0601FFA8
	mov	r12,r10
	add	#1,r10
.L0601FFA8:
	mov	#112,r12
	cmp/ge	r12,r11
	add	r12,r11
	bf	.L0601FFBE
	or	#2,r0
	mov	#4,r12
	shll8	r12
	cmp/ge	r12,r11
	bf	.L0601FFBE
	mov	r12,r11
	add	#-1,r11
.L0601FFBE:
	cmp/pz	r11
	bt	.L0601FFD0
	or	#1,r0
	mov	#-4,r12
	shll8	r12
	cmp/gt	r12,r11
	bt	.L0601FFD0
	mov	r12,r11
	add	#1,r11
.L0601FFD0:
	mov.w	r10,@r2
	add	#2,r2
	mov.w	r11,@r2
	add	#2,r2
	tst	r0,r0
	bt	.L0601FFEA
	add	#-8,r2
	mov.l	@r2,r11
	or	r0,r11
	neg	r11,r11
	mov.l	r11,@r2
	add	#8,r2
	add	#1,r9
.L0601FFEA:
	dt	r7
	bt	.L0601FFF8
	bra	.L0601FEDA
	nop
	.byte 0x00, 0x00
.L0601FFF4:
	.long D_060FE940
.L0601FFF8:
	mov	r9,r6
.L0601FFFA:
	mov.l	@r15+,r2
	mov.l	@r2+,r7
	cmp/eq	r6,r7
	bf	.L0602000A
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
.L0602000A:
	mov.l	r2,@-r15
	mov.l	@r2+,r5
	mov.l	@r2+,r7
	mov.l	@r2+,r1
	mov.l	.L06020038,r2
	mov.l	.L0602003C,r3
	mov	#0,r12
.L06020018:
	mov	#15,r4
	mov	#-2,r11
	mov.b	@r1,r0
	cmp/pz	r0
	bt	.L06020028
	mov.w	@r5,r0
	cmp/pz	r0
	bf	.L060200A6
.L06020028:
	mov.b	@(1,r1),r0
	and	#3,r0
	add	r0,r0
	mov.l	.L06020040,r13
	mov.w	@(r0,r13),r0
	add	r13,r0
	jmp	@r0
	nop
.L06020038:
	.long D_060EB000
.L0602003C:
	.long D_060EC800
.L06020040:
	.long .L060200EA
.L06020044:
	mov	#15,r13
	and	r13,r4
	tst	r4,r4
	bf	.L06020096
	mov.b	@r1,r13
	cmp/pz	r13
	bf	.L06020088
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
	endlabel func_0601FD92

	glabel func_0602006E
	bf	.L06020088
	mov.b	@r1,r13
	tst	r13,r13
	bt	.L06020096
	mov.l	r6,@r3
	add	#4,r3
	mov.b	r6,@r3
	add	#1,r3
	mov.b	r11,@r3
	add	#1,r3
	mov.w	r12,@r3
	bra	.L06020096
	add	#2,r3
.L06020088:
	mov.l	r6,@r3
	add	#4,r3
	extu.b	r11,r11
	mov.w	r11,@r3
	add	#2,r3
	mov.w	r12,@r3
	add	#2,r3
.L06020096:
	add	#8,r12
	add	#8,r5
	add	#16,r1
	dt	r7
	bf	.L06020018
	mov	#-1,r6
	bra	.L06020304
	mov.l	r6,@r3
.L060200A6:
	mov.b	@(1,r1),r0
	and	#3,r0
	add	r0,r0
	mov.l	.L060200B8,r13
	mov.w	@(r0,r13),r0
	add	r13,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L060200B8:
	.long func_060200BC
	endlabel func_0602006E

	glabel func_060200BC
	clrt
	clrt
	clrt
	mov.b	@(r0,r1),r0
.L060200C4:
	mov.w	@(2,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L06020096
	cmp/pl	r13
	bt	.L060200D2
	neg	r13,r13
.L060200D2:
	mov	r13,r6
	bra	.L06020088
	nop
.L060200D8:
	mov.w	@(2,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L06020096
	cmp/pl	r13
	bt	.L060200E6
	neg	r13,r13
.L060200E6:
	bra	.L06020088
	nop
.L060200EA:
	.short .L060200F2 - .L060200EA
	.short .L06020172 - .L060200EA
	.short .L06020206 - .L060200EA
	.short .L06020292 - .L060200EA
.L060200F2:
	mov	#0,r6
	mov.w	@r5,r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L06020096
	cmp/pl	r13
	bt	.L06020104
	neg	r13,r13
	add	#1,r11
.L06020104:
	and	r13,r4
	add	r13,r6
	add	#4,r0
	mov.w	@(r0,r2),r8
	add	#2,r0
	mov.w	@(r0,r2),r9
	mov.w	@(2,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L06020096
	cmp/pl	r13
	bt	.L06020120
	neg	r13,r13
	add	#1,r11
.L06020120:
	and	r13,r4
	add	r13,r6
	add	#4,r0
	mov.w	@(r0,r2),r10
	add	#2,r0
	mov.w	@(r0,r2),r14
	mov.w	@(6,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L06020096
	cmp/pl	r13
	bt	.L0602013C
	neg	r13,r13
	add	#1,r11
.L0602013C:
	and	r13,r4
	add	r13,r6
	mov.w	@(4,r5),r0
	cmp/pz	r0
	bt	.L06020158
	neg	r0,r0
	add	#-8,r0
	mov.l	@(r0,r2),r13
	add	#4,r0
	mov.w	@(r0,r2),r10
	add	#2,r0
	mov.w	@(r0,r2),r14
	bra	.L0602015A
	mov.w	@(6,r5),r0
.L06020158:
	mov.l	@(r0,r2),r13
.L0602015A:
	tst	r13,r13
	bt	.L06020096
	cmp/pl	r13
	bt	.L06020166
	neg	r13,r13
	add	#1,r11
.L06020166:
	and	r13,r4
	add	r13,r6
	shar	r6
	shar	r6
	bra	.L06020044
	nop
.L06020172:
	mov.l	.L060201E4,r6
	mov.w	@r5,r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L06020202
	cmp/pl	r13
	bt	.L06020184
	neg	r13,r13
	add	#1,r11
.L06020184:
	and	r13,r4
	cmp/ge	r6,r13
	bt	.L0602018C
	mov	r13,r6
.L0602018C:
	add	#4,r0
	mov.w	@(r0,r2),r8
	add	#2,r0
	mov.w	@(r0,r2),r9
	mov.w	@(2,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L06020202
	cmp/pl	r13
	bt	.L060201A4
	neg	r13,r13
	add	#1,r11
.L060201A4:
	and	r13,r4
	cmp/ge	r6,r13
	bt	.L060201AC
	mov	r13,r6
.L060201AC:
	add	#4,r0
	mov.w	@(r0,r2),r10
	add	#2,r0
	mov.w	@(r0,r2),r14
	mov.w	@(6,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L06020202
	cmp/pl	r13
	bt	.L060201C4
	neg	r13,r13
	add	#1,r11
.L060201C4:
	and	r13,r4
	cmp/ge	r6,r13
	bt	.L060201CC
	mov	r13,r6
.L060201CC:
	mov.w	@(4,r5),r0
	cmp/pz	r0
	bt	.L060201E8
	neg	r0,r0
	add	#-8,r0
	mov.l	@(r0,r2),r13
	add	#4,r0
	mov.w	@(r0,r2),r10
	add	#2,r0
	mov.w	@(r0,r2),r14
	bra	.L060201EA
	mov.w	@(6,r5),r0
.L060201E4:
	.long 0x7FFFFFFF
.L060201E8:
	mov.l	@(r0,r2),r13
.L060201EA:
	tst	r13,r13
	bt	.L06020202
	cmp/pl	r13
	bt	.L060201F6
	neg	r13,r13
	add	#1,r11
.L060201F6:
	and	r13,r4
	cmp/ge	r6,r13
	bt	.L060201FE
	mov	r13,r6
.L060201FE:
	bra	.L06020044
	nop
.L06020202:
	bra	.L06020096
	nop
.L06020206:
	mov	#0,r6
	mov.w	@r5,r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L06020202
	cmp/pl	r13
	bt	.L06020218
	neg	r13,r13
	add	#1,r11
.L06020218:
	and	r13,r4
	cmp/ge	r6,r13
	bf	.L06020220
	mov	r13,r6
.L06020220:
	add	#4,r0
	mov.w	@(r0,r2),r8
	add	#2,r0
	mov.w	@(r0,r2),r9
	mov.w	@(2,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L06020202
	cmp/pl	r13
	bt	.L06020238
	neg	r13,r13
	add	#1,r11
.L06020238:
	and	r13,r4
	cmp/ge	r6,r13
	bf	.L06020240
	mov	r13,r6
.L06020240:
	add	#4,r0
	mov.w	@(r0,r2),r10
	add	#2,r0
	mov.w	@(r0,r2),r14
	mov.w	@(6,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L06020202
	cmp/pl	r13
	bt	.L06020258
	neg	r13,r13
	add	#1,r11
.L06020258:
	and	r13,r4
	cmp/ge	r6,r13
	bf	.L06020260
	mov	r13,r6
.L06020260:
	mov.w	@(4,r5),r0
	cmp/pz	r0
	bt	.L06020278
	neg	r0,r0
	add	#-8,r0
	mov.l	@(r0,r2),r13
	add	#4,r0
	mov.w	@(r0,r2),r10
	add	#2,r0
	mov.w	@(r0,r2),r14
	bra	.L0602027A
	mov.w	@(6,r5),r0
.L06020278:
	mov.l	@(r0,r2),r13
.L0602027A:
	tst	r13,r13
	bt	.L06020202
	cmp/pl	r13
	bt	.L06020286
	neg	r13,r13
	add	#1,r11
.L06020286:
	and	r13,r4
	cmp/ge	r6,r13
	bf	.L0602028E
	mov	r13,r6
.L0602028E:
	bra	.L06020044
	nop
.L06020292:
	mov.w	@r5,r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L06020202
	cmp/pl	r13
	bt	.L060202A2
	neg	r13,r13
	add	#1,r11
.L060202A2:
	and	r13,r4
	add	#4,r0
	mov.w	@(r0,r2),r8
	add	#2,r0
	mov.w	@(r0,r2),r9
	mov.w	@(2,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L06020202
	cmp/pl	r13
	bt	.L060202BC
	neg	r13,r13
	add	#1,r11
.L060202BC:
	and	r13,r4
	add	#4,r0
	mov.w	@(r0,r2),r10
	add	#2,r0
	mov.w	@(r0,r2),r14
	mov.w	@(6,r5),r0
	mov.l	@(r0,r2),r13
	tst	r13,r13
	bt	.L06020202
	cmp/pl	r13
	bt	.L060202D6
	neg	r13,r13
	add	#1,r11
.L060202D6:
	and	r13,r4
	mov.w	@(4,r5),r0
	cmp/pz	r0
	bt	.L060202F0
	neg	r0,r0
	add	#-8,r0
	mov.l	@(r0,r2),r13
	add	#4,r0
	mov.w	@(r0,r2),r10
	add	#2,r0
	mov.w	@(r0,r2),r14
	bra	.L060202F2
	mov.w	@(6,r5),r0
.L060202F0:
	mov.l	@(r0,r2),r13
.L060202F2:
	tst	r13,r13
	bt	.L06020202
	cmp/pl	r13
	bt	.L060202FE
	neg	r13,r13
	add	#1,r11
.L060202FE:
	and	r13,r4
	bra	.L06020044
	nop
.L06020304:
	mov.l	@r15+,r2
	mov.l	@r15+,r1
	mov.l	@(96,gbr),r0
	mov	r0,r3
	mov.l	@r2+,r5
	add	#4,r2
	mov.l	@r2+,r4
	mov.l	.L06020324,r7
	mov.l	.L06020328,r2
	add	#4,r2
.L06020318:
	mov.l	@r7+,r6
	cmp/pl	r6
	bt	.L0602032C
	bra	.L0602043C
	nop
	.byte 0x00, 0x00
.L06020324:
	.long D_060EC800
.L06020328:
	.long D_060EB000
.L0602032C:
	mov.w	@(2,r7),r0
	mov.w	@(r0,r5),r10
	cmp/pz	r10
	bt	.L06020338
	bra	.L06020444
	nop
.L06020338:
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(12,r3)
	add	#2,r0
	mov.w	@(r0,r5),r10
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(16,r3)
	add	#2,r0
	mov.w	@(r0,r5),r10
	cmp/pz	r10
	bt	.L06020354
	neg	r10,r10
	add	#-8,r10
.L06020354:
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(20,r3)
	add	#2,r0
	mov.w	@(r0,r5),r10
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(24,r3)
	add	#-6,r0
	shll	r0
	add	r4,r0
	mov	r0,r10
	mov.w	@(2,r10),r0
	tst	r0,r0
	bt	.L060203E4
	cmp/pl	r0
	bt	.L060203B8
	neg	r0,r0
	add	#-1,r0
	mov.l	.L060203B0,r9
	shll2	r0
	add	r0,r9
	mov.w	@(2,r9),r0
	mov.w	.L060203AE,r12
	or	r0,r12
	mov.w	@(10,r10),r0
	or	r12,r0
	mov.w	r0,@r3
	mov.w	@r9,r0
	tst	r0,r0
	bt	.L060203E4
	mov.l	.L060203B4,r9
	add	#-1,r0
	shll2	r0
	shll	r0
	add	r0,r9
	mov.l	@r9,r0
	mov.l	r0,@(8,r3)
	mov.w	@(4,r10),r0
	mov.w	r0,@(4,r3)
	add	#2,r7
	bsr	func_0601FCB0
	nop
	bra	.L06020418
	nop
.L060203AE:
	.short 0x1000
.L060203B0:
	.long D_060F0000
.L060203B4:
	.long D_060ED000
.L060203B8:
	mov.l	.L060203E0,r9
	add	#-1,r0
	shll2	r0
	shll	r0
	add	r0,r9
	mov.l	@r9,r0
	mov.l	r0,@(8,r3)
	mov.w	@(4,r10),r0
	add	#1,r7
	mov.b	@r7+,r12
	cmp/pz	r12
	bt	.L060203D4
	mov.w	.L060203DE,r12
	or	r12,r0
.L060203D4:
	mov.w	r0,@(4,r3)
	bsr	func_0601FCB0
	nop
	bra	.L06020410
	nop
.L060203DE:
	.short 0x0800
.L060203E0:
	.long D_060ED000
.L060203E4:
	mov.b	@r7+,r0
	tst	r0,r0
	bt	.L06020400
	mov.l	@(12,r10),r0
	mov.b	@r7+,r12
	cmp/pz	r12
	bt	.L060203F6
	mov.l	.L060203FC,r12
	or	r12,r0
.L060203F6:
	bra	.L06020410
	mov.l	r0,@(4,r3)
	.byte 0x00, 0x00
.L060203FC:
	.long 0x08000000
.L06020400:
	bsr	func_0601FCEE
	nop
	mov.b	@r7+,r12
	cmp/pz	r12
	bt	.L0602040E
	mov.l	.L06020434,r12
	or	r12,r0
.L0602040E:
	mov.l	r0,@(4,r3)
.L06020410:
	mov.w	@(10,r10),r0
	mov.w	.L06020432,r12
	or	r12,r0
	mov.w	r0,@r3
.L06020418:
	add	#8,r10
	mov.w	@r10,r12
	mov.w	@(28,r1),r0
	add	r12,r0
	mov.w	r0,@(28,r3)
	mov.l	@(828,gbr),r0
	add	r0,r6
	mov.l	.L06020438,r0
	jsr	@r0
	nop
	add	#2,r7
	bra	.L06020318
	add	#32,r3
.L06020432:
	.short 0x1000
.L06020434:
	.long 0x08000000
.L06020438:
	.long func_0601F2A6
.L0602043C:
	lds.l	@r15+,pr
	mov	r3,r0
	rts
	mov.l	r0,@(96,gbr)
.L06020444:
	mov	r0,r8
	mov.w	@(190,gbr),r0
	mov	r0,r14
	mov.w	@(16,r1),r0
	shll16	r14
	shll8	r0
	dmuls.l	r0,r14
	sts	mach,r0
	mov	#-128,r14
	shll	r14
	mov.l	r6,@(0,r14)
	mov.l	r0,@(16,r14)
	mov	#0,r0
	mov.l	r0,@(20,r14)
	mov	r8,r0
	add	#2,r0
	mov.w	@(r0,r5),r10
	add	r2,r10
	mov.l	@r10,r12
	mov.l	r12,@(12,r3)
	add	#-2,r0
	shll	r0
	add	r4,r0
	mov	r0,r10
	mov.w	@(10,r10),r0
	mov	r0,r12
	mov.w	@(2,r10),r0
	cmp/pz	r0
	bt	.L0602048E
	neg	r0,r0
	add	#-1,r0
	mov.l	.L060204D8,r9
	shll2	r0
	add	r0,r9
	mov.w	@(2,r9),r0
	or	r0,r12
	mov.w	@r9,r0
.L0602048E:
	mov.l	.L060204DC,r9
	add	#-1,r0
	shll2	r0
	shll	r0
	add	r0,r9
	mov.l	@r9,r13
	mov.l	r13,@(8,r3)
	mov.l	.L060204E0,r11
	and	r11,r13
	shlr8	r11
	and	r13,r11
	shlr2	r13
	shlr2	r13
	shlr	r13
	mov.w	.L060204D4,r0
	or	r12,r0
	mov.w	r0,@r3
	mov.w	@(4,r10),r0
	mov.w	r0,@(4,r3)
	bsr	func_0601FCB0
	nop
	mov	#-128,r14
	shll	r14
	mov.l	@(28,r14),r14
	shll16	r13
	shll16	r11
	dmuls.l	r14,r13
	sts	mach,r13
	dmuls.l	r14,r11
	sts	mach,r11
	shll16	r13
	or	r11,r13
	mov.l	r13,@(16,r3)
	bra	.L06020418
	add	#2,r7
.L060204D4:
	.short 0x1000
	.byte 0x00, 0x00
.L060204D8:
	.long D_060F0000
.L060204DC:
	.long D_060ED000
.L060204E0:
	.long 0x0000FFFF
	endlabel func_060200BC
