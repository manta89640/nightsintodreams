	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0600EE48,"ax",@progbits
	.p2align 2

	glabel func_0600EE48
	sts.l	pr,@-r15
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L0600EE62
	mov.b	@(20,gbr),r0
	cmp/eq	#7,r0
	bt	.L0600EE66
	cmp/eq	#12,r0
	bt	.L0600EE62
	cmp/eq	#14,r0
	bt	.L0600EE62
	shlr	r0
	bf	.L0600EE66
.L0600EE62:
	bra	.L0600EF60
	nop
.L0600EE66:
	mov.l	.L0600EE9C,r2
	mov.l	@r2+,r3
	mov.l	@r2+,r4
	mov.l	@r2+,r5
	mov.l	@r2,r6
	mov.l	.L0600EEA0,r2
	mov.l	r5,@(4,r2)
	mov.l	r6,@r2
	mov.l	@r3+,r7
	mov.l	r3,@(8,r2)
	mov.l	r7,@(12,r2)
	add	#16,r2
	extu.w	r7,r8
	shlr16	r7
	shll2	r7
.L0600EE84:
	mov.l	r3,@r2
	add	r7,r3
	dt	r8
	bf/s	.L0600EE84
	add	#4,r2
	mov.l	.L0600EEA4,r2
	cmp/pl	r4
	bt	.L0600EEA8
	mov.l	r4,@r2
	bra	.L0600EEC0
	mov.l	r4,@(8,r2)
	.byte 0x00, 0x00
.L0600EE9C:
	.long lwram_buf
.L0600EEA0:
	.long D_060D9300
.L0600EEA4:
	.long D_060D9410
.L0600EEA8:
	mov.l	@r4+,r7
	mov.l	r4,@r2
	mov.l	r7,@(4,r2)
	add	#8,r2
	extu.w	r7,r8
	shlr16	r7
	shll2	r7
.L0600EEB6:
	mov.l	r4,@r2
	add	r7,r4
	dt	r8
	bf/s	.L0600EEB6
	add	#4,r2
.L0600EEC0:
	mov.b	@(20,gbr),r0
	mov.l	.L0600EF84,r2
	mov.w	.L0600EF78,r3
	mov	#0,r4
	mov.l	.L0600EF88,r5
	mov.l	.L0600EF8C,r6
	cmp/eq	#7,r0
	bf	.L0600EED8
	mov.w	.L0600EF7A,r3
	mov	#-1,r4
	mov.l	.L0600EF90,r5
	mov.l	.L0600EF94,r6
.L0600EED8:
	mov.l	r3,@r2
	mov.l	r4,@(4,r2)
	mov.l	r5,@(8,r2)
	mov.l	r6,@(16,r2)
	mov.w	.L0600EF7C,r3
	cmp/eq	#10,r0
	bf	.L0600EEE8
	mov.w	.L0600EF7E,r3
.L0600EEE8:
	mov.w	r3,@r2
	mov	r0,r2
	mova	.L0600EFBC,r0
	shll2	r2
	mov.l	@(r0,r2),r0
	mov.l	.L0600EF98,r2
	mov.l	r0,@r2
	mov.l	.L0600EF9C,r2
	mov	#0,r0
	mov.w	r0,@r2
	mov.b	@(20,gbr),r0
	cmp/eq	#7,r0
	bf	.L0600EF18
	mov.l	.L0600EFA0,r2
	mov.l	.L0600EFA4,r3
	mov.l	@r2,r2
	mov.w	.L0600EF80,r4
.L0600EF0A:
	mov.l	@r2+,r5
	mov.l	@r2+,r6
	mov.l	r5,@r3
	mov.l	r6,@(4,r3)
	dt	r4
	bf/s	.L0600EF0A
	add	#8,r3
.L0600EF18:
	mov.l	.L0600EFA8,r2
	mov.l	.L0600EFAC,r3
	mov.l	@r2,r2
	mov.w	.L0600EF82,r4
.L0600EF20:
	mov.l	@r2+,r5
	mov.l	@r2+,r6
	mov.l	r5,@r3
	mov.l	r6,@(4,r3)
	dt	r4
	bf/s	.L0600EF20
	add	#8,r3
	mov.l	.L0600EFB0,r2
	mov	#127,r0
	mov.l	r0,@r2
	mov.l	.L0600EFB4,r2
	mov	#-1,r0
	mov.w	r0,@r2
	mov	#0,r0
	mov.w	r0,@(2,r2)
	mov.b	@(20,gbr),r0
	cmp/eq	#7,r0
	bt	.L0600EF48
	shlr	r0
	bt	.L0600EF60
.L0600EF48:
	mov	r0,r2
	mova	.L0600EFFC,r0
	mov.b	@(r0,r2),r0
	mov.l	.L0600EFA8,r3
	mov.l	.L0600EFAC,r4
	mov.l	.L0600EFB8,r2
	mov.l	@r3,r3
	shll8	r0
	add	r0,r3
	mov.l	r3,@r2
	add	r0,r4
	mov.l	r4,@(4,r2)
.L0600EF60:
	mova	.L0600F004,r0
	mov	r0,r2
	mov.b	@(20,gbr),r0
	shll2	r0
	add	r0,r2
	mov.l	@r2+,r0
	mov.l	r0,@(544,gbr)
	mov.l	@(60,r2),r0
	mov.l	r0,@(548,gbr)
	lds.l	@r15+,pr
	rts
	nop
.L0600EF78:
	.short 0x0318
.L0600EF7A:
	.short 0x0630
.L0600EF7C:
	.short 0x10CC
.L0600EF7E:
	.short 0x108C
.L0600EF80:
	.short 0x0E10
.L0600EF82:
	.short 0x0800
.L0600EF84:
	.long D_060DB2C8
.L0600EF88:
	.long 0x023C0000
.L0600EF8C:
	.long 0x01500000
.L0600EF90:
	.long 0x08000000
.L0600EF94:
	.long 0x00800000
.L0600EF98:
	.long D_060DB2DC
.L0600EF9C:
	.long D_060DB55C
.L0600EFA0:
	.long D_060D9300
.L0600EFA4:
	.long VDP1_VRAM_CACHED + 0x68800
.L0600EFA8:
	.long D_060D9304
.L0600EFAC:
	.long VDP1_VRAM_CACHED + 0x7A800
.L0600EFB0:
	.long D_060DB2E8
.L0600EFB4:
	.long D_060DB55E
.L0600EFB8:
	.long D_060DB2E0
.L0600EFBC:
	.long func_0600F9F4
	.long .L060102F8
	.long func_0600FB98
	.long .L060102F8
	.long func_0600FBD4
	.long .L060102F8
	.long .L060102F8
	.long .L060102F8
	.long func_0600FE10
	.long .L060102F8
	.long .L060102F8
	.long .L060102F8
	.long .L060102F8
	.long .L060102F8
	.long .L060102F8
	.long .L060102F8
.L0600EFFC:
	.byte 0x2A, 0x2F, 0x26, 0x30, 0x32, 0x35, 0x3F, 0x3F
.L0600F004:
	.long func_0601030C
	.long func_0601040C
	.long func_06010348
	.long func_06010418
	.long func_0601030C
	.long func_06010450
	.long func_0601030C
	.long func_06010460
	.long func_0601030C
	.long func_06010470
	.long func_0601030C
	.long func_0601049C
	.long func_060104AC
	.long func_060104DC
	.long func_060104AC
	.long func_060104DC
	.long func_06010BA0
	.long lbl_06010BE8
	.long func_06010BA4
	.long lbl_06010BE8
	.long func_06010BA0
	.long lbl_06010BE8
	.long func_06010BA0
	.long lbl_06010BE8
	.long func_06010BA0
	.long lbl_06010BE8
	.long func_06010BA0
	.long lbl_06010BE8
	.long lbl_06010BE8
	.long lbl_06010BE8
	.long lbl_06010BE8
	.long lbl_06010BE8
	dlabel D_0600F084
	.long func_06010C6C
	.long .L060102F8
	.long .L060102F8
	.long .L060102F8
	.long func_06010DE4
	.long .L060102F8
	.long func_06010E9A
	.long .L060102F8
	.long .L060102F8
	.long .L060102F8
	.long .L060102F8
	.long .L060102F8
	.long .L060102F8
	.long .L060102F8
	.long .L060102F8
	.long .L060102F8
	dlabel D_0600F0C4
	.byte 0xE0, 0x01, 0x21, 0x00, 0xC4, 0x14, 0xD2, 0x0E, 0x40, 0x08, 0x00, 0x2E, 0x11, 0x01, 0xC7, 0x01
	.byte 0x21, 0x06, 0x71, 0x04
	endlabel func_0600EE48

	glabel func_0600F0D8
	sts.l	pr,@-r15
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L0600F0E6
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L0600F114
.L0600F0E6:
	mov.l	.L0600F108,r2
	mova	.L0600F208,r0
	jsr	@r2
	mov	r0,r3
	mov.l	.L0600F10C,r2
	mov.b	r0,@r8
	mov.b	@r2,r0
	mov	#0,r0
	mov.b	r0,@r2
	mov.l	.L0600F110,r2
	mov	#-1,r0
	mov.w	r0,@r2
	lds.l	@r15+,pr
	rts
	nop
	.long D_0600F084
.L0600F108:
	.long func_06006070
.L0600F10C:
	.long SH2_FTCSR
.L0600F110:
	.long 0x21000000
.L0600F114:
	mov.b	@(20,gbr),r0
	shlr	r0
	bt	.L0600F1D6
	mov.l	.L0600F1E0,r2
	mov.b	@r1,r3
	dt	r3
	bf	.L0600F15A
	mov	#-2,r8
	mov	#32,r9
	cmp/eq	#5,r0
	bf	.L0600F12E
	mov	#0,r8
	mov	#30,r9
.L0600F12E:
	mov.l	.L0600F1E4,r3
	mov.l	@r3,r3
	mov	#8,r14
	mov	r3,r4
.L0600F136:
	add	#20,r4
	mov	r4,r5
	add	#-4,r5
	mov.l	@r5,r6
	mov	#9,r13
.L0600F140:
	mov.w	@r5,r0
	add	#-2,r5
	dt	r13
	bf/s	.L0600F140
	mov.w	r0,@-r4
	add	r8,r4
	mov.w	r6,@r4
	dt	r14
	bf/s	.L0600F136
	add	r9,r4
	bsr	func_0600F1EC
	nop
	mov	#2,r3
.L0600F15A:
	mov.b	r3,@r1
	mov.b	@r2,r8
	tst	r8,r8
	bt	.L0600F1D6
	mov	r8,r0
	add	#-2,r0
	cmp/pz	r0
	bt	.L0600F16C
	mov	#0,r0
.L0600F16C:
	mov.b	r0,@r2
	mov.b	@(2,r2),r0
	tst	r0,r0
	bf	.L0600F17A
	mov.l	.L0600F1E4,r3
	bsr	func_0600F1EC
	mov.l	@r3,r3
.L0600F17A:
	mov.l	.L0600F1E8,r2
	mov	#31,r3
	mov.w	.L0600F1DC,r4
	mov	#124,r5
	shll8	r5
	mov	r8,r6
	shll2	r8
	shll2	r8
	shll	r8
	mov	r8,r7
	shll2	r8
	shll2	r8
	shll	r8
	mov	#8,r14
.L0600F196:
	mov	#10,r13
.L0600F198:
	mov.w	@r2,r9
	mov	#64,r0
	shll	r0
	shll8	r0
	mov	r9,r10
	and	r3,r10
	add	r6,r10
	cmp/hi	r3,r10
	bf	.L0600F1AC
	mov	r3,r10
.L0600F1AC:
	or	r10,r0
	mov	r9,r10
	and	r4,r10
	add	r7,r10
	cmp/hi	r4,r10
	bf	.L0600F1BA
	mov	r4,r10
.L0600F1BA:
	or	r10,r0
	and	r5,r9
	add	r8,r9
	cmp/hi	r5,r9
	bf	.L0600F1C6
	mov	r5,r9
.L0600F1C6:
	or	r9,r0
	mov.w	r0,@r2
	dt	r13
	bf/s	.L0600F198
	add	#2,r2
	dt	r14
	bf/s	.L0600F196
	add	#12,r2
.L0600F1D6:
	mov.l	@(4,r1),r0
	jmp	@r0
	lds.l	@r15+,pr
.L0600F1DC:
	.short 0x03E0
	.byte 0x00, 0x00
.L0600F1E0:
	.long D_060DB2E8
.L0600F1E4:
	.long D_060DB2E0
.L0600F1E8:
	.long D_060D9200
	endlabel func_0600F0D8

	glabel func_0600F1EC
	mov.l	.L0600F204,r4
	mov	#32,r5
.L0600F1F0:
	mov.l	@r3+,r6
	mov.l	@r3+,r7
	mov.l	r6,@r4
	mov.l	r7,@(4,r4)
	dt	r5
	bf/s	.L0600F1F0
	add	#8,r4
	mov	#1,r0
	rts
	mov.b	r0,@(2,r2)
.L0600F204:
	.long D_060D9200
.L0600F208:
	.byte 0xD2, 0x2C, 0xE0, 0x19, 0x22, 0x00, 0x60, 0xF3, 0xDF, 0x2B
	endlabel func_0600F1EC

	glabel func_0600F212
	mov.l	r0,@-r15
	stc.l	gbr,@-r15
	sts.l	pr,@-r15
	mov.l	.L0600F2C4,r2
	mov.l	.L0600F2C8,r3
	mov	#9,r14
	ldc	r3,gbr
.L0600F220:
	mov.l	@r2+,r0
	dt	r14
	mov.l	r0,@r3
	bf/s	.L0600F220
	add	#4,r3
	mov.l	.L0600F2CC,r2
	mov.w	@(30,gbr),r0
	mov.l	@r2,r2
	shll16	r0
	mov.l	.L0600F2D0,r4
	sub	r0,r2
	mov.l	r2,@r4
	shlr16	r2
	shlr2	r2
	shlr	r2
	mov	#4,r0
	shll16	r0
	mov	#-1,r14
	shll8	r14
	mov.l	r2,@(0,r14)
	mov.l	r0,@(4,r14)
	mov.l	.L0600F2D4,r2
	mov.l	@r2,r0
	mov.l	r0,@r3
	mov	#0,r0
	mov.l	r0,@(4,r3)
	mov.l	.L0600F2D8,r2
	mov.l	@r2+,r0
	mov.l	r0,@(68,gbr)
	mov.w	@r2,r0
	mov.w	r0,@(72,gbr)
	mov.l	@(28,r14),r0
	mov.w	r0,@(76,gbr)
	mov.l	.L0600F2DC,r2
	mov	#-1,r0
	mov.w	r0,@r2
	add	#2,r2
	mov.l	@r2+,r0
	mov.l	.L0600F2E0,r1
	mov.l	r0,@(52,gbr)
	mov.l	@r2,r0
	mov.l	@r1+,r11
	mov.l	r0,@(56,gbr)
	mov	#0,r0
	bsr	func_0600F2F0
	mov.w	r0,@(74,gbr)
	mov.l	.L0600F2E4,r1
	mov.l	@r1,r2
	cmp/pl	r2
	mov.l	.L0600F2DC,r2
	bf	.L0600F296
	mov.w	@r2+,r0
	mov.w	r0,@(74,gbr)
	mov.l	@r2+,r0
	mov.l	@r1+,r11
	mov.l	r0,@(52,gbr)
	mov.l	@r2,r0
	bsr	func_0600F2F0
	mov.l	r0,@(56,gbr)
.L0600F296:
	mov.l	.L0600F2D4,r2
	mov.l	@(36,gbr),r0
	mov.l	r0,@r2
	mov.l	.L0600F2E8,r2
	mov.l	@(40,gbr),r0
	mov.l	r0,@r2
	mov.l	.L0600F2EC,r2
	tst	r0,r0
	bt	.L0600F2AA
	mov	#1,r0
.L0600F2AA:
	mov.b	r0,@(1,r2)
	lds.l	@r15+,pr
	ldc.l	@r15+,gbr
	mov.l	@r15,r15
	mov.l	.L0600F2BC,r2
	mov	#17,r0
	rts
	mov.b	r0,@r2
	.byte 0x00, 0x00
.L0600F2BC:
	.long 0xFFFFFE92
	.byte 0xC0, 0x00, 0x08, 0x00
.L0600F2C4:
	.long camera
.L0600F2C8:
	.long SH2_CACHE_DATA
.L0600F2CC:
	.long D_060FFF10
.L0600F2D0:
	.long D_060DB2D4
.L0600F2D4:
	.long vdp1_wp1 + 0x20000000
.L0600F2D8:
	.long D_060DB2C8
.L0600F2DC:
	.long D_060DB2CE
.L0600F2E0:
	.long D_060D9308
.L0600F2E4:
	.long D_060D9410
.L0600F2E8:
	.long D_060DAD18
.L0600F2EC:
	.long D_060DB2E8
	endlabel func_0600F212

	glabel func_0600F2F0
	mov.l	.L0600F41C,r14
	mov	#32,r13
	mov.l	@(0,r14),r2
	mov.l	@(8,r14),r3
	mov.l	@(12,r14),r4
	mov.l	@(16,r14),r5
	shlr16	r4
	shlr16	r5
	exts.w	r4,r4
	exts.w	r5,r5
	shll2	r4
	shll2	r5
	mov.w	@(72,gbr),r0
	shll2	r13
	tst	r0,r0
	bt/s	.L0600F314
	shll16	r13
	shll	r13
.L0600F314:
	neg	r2,r2
	neg	r3,r3
	add	r13,r2
	dmuls.l	r4,r2
	add	r13,r3
	sts	mach,r0
	sts	macl,r12
	dmuls.l	r4,r3
	xtrct	r0,r12
	sts	mach,r0
	sts	macl,r13
	dmuls.l	r5,r2
	xtrct	r0,r13
	sts	mach,r0
	sts	macl,r2
	dmuls.l	r5,r3
	xtrct	r0,r2
	sts	mach,r0
	sts	macl,r3
	sub	r13,r2
	xtrct	r0,r3
	add	r12,r3
	mov.w	@(72,gbr),r0
	shll8	r4
	tst	r0,r0
	bt/s	.L0600F34E
	shll8	r5
	shll	r4
	shll	r5
.L0600F34E:
	mov	r4,r6
	mov	r5,r7
	shar	r6
	shar	r7
	mov	r7,r0
	sub	r6,r7
	add	r0,r6
	cmp/pz	r4
	bt/s	.L0600F364
	mov	r4,r13
	neg	r13,r13
.L0600F364:
	cmp/pz	r5
	bt/s	.L0600F36C
	mov	r5,r0
	neg	r0,r0
.L0600F36C:
	add	r0,r13
	mov.l	@(52,r14),r8
	shlr	r13
	add	r13,r8
	mov.w	@(30,gbr),r0
	mov.l	@(24,r14),r9
	shll16	r0
	shll2	r0
	dmuls.l	r0,r9
	mov.l	@(56,r14),r10
	sts	mach,r9
	add	r9,r10
	mov.l	r10,@(56,r14)
	add	r13,r10
	mov.l	.L0600F420,r0
	mov.l	@r0,r0
	sub	r0,r9
	mov.l	r9,@(60,r14)
	sub	r13,r9
	mov	r13,r0
	mov.l	r0,@(64,gbr)
	mov.w	@r1+,r13
	mov.w	@r1,r14
	mov.l	.L0600F424,r1
.L0600F39C:
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	r13,@-r15
.L0600F3A2:
	mov.l	@r11+,r12
	neg	r8,r0
	cmp/pl	r12
	bf	.L0600F3CA
	cmp/ge	r3,r9
	bt	.L0600F3CA
	cmp/ge	r10,r3
	bt	.L0600F3CA
	cmp/ge	r8,r2
	bt	.L0600F3CA
	cmp/gt	r2,r0
	bt	.L0600F3CA
	mov.l	r12,@r1
	mov	r2,r0
	sub	r7,r0
	mov.l	r0,@(4,r1)
	mov	r3,r0
	sub	r6,r0
	mov.l	r0,@(8,r1)
	add	#12,r1
.L0600F3CA:
	add	r5,r2
	dt	r13
	bf/s	.L0600F3A2
	add	r4,r3
	mov.l	@r15+,r13
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	sub	r4,r2
	dt	r14
	bf/s	.L0600F39C
	add	r5,r3
	mov	#0,r0
	mov.l	r0,@r1
	sts.l	pr,@-r15
	mov.l	.L0600F428,r2
	mov	r4,r0
	mov.l	r0,@(48,gbr)
	mov.l	@r2,r3
	mov	r5,r0
	jsr	@r3
	mov.l	r0,@(44,gbr)
	lds.l	@r15+,pr
	mov.l	.L0600F41C,r14
	mov.l	.L0600F424,r1
	mov.l	@(20,r14),r2
	mov.l	@(24,r14),r3
	mov	#-1,r4
	shll8	r4
	mov	#16,r13
	shll16	r13
.L0600F406:
	mov.l	@r1,r7
	mov.l	@(4,gbr),r0
	cmp/pl	r7
	bt/s	.L0600F42C
	shll2	r0
	tst	r7,r7
	bf/s	.L0600F406
	add	#12,r1
	bra	.L0600F578
	nop
	.byte 0x00, 0x00
.L0600F41C:
	.long SH2_CACHE_DATA
.L0600F420:
	.long D_060DB2D8
.L0600F424:
	.long D_060DAD1C
.L0600F428:
	.long D_060DB2DC
.L0600F42C:
	mov.l	@(4,r7),r9
	mov.l	.L0600F570,r5
	swap.w	r9,r10
	shll16	r9
	shll16	r10
	sub	r0,r9
	sub	r0,r10
	mov.l	@(4,r1),r11
	mov.l	@(8,r1),r12
	mov.l	@(44,gbr),r0
	mov.l	r11,@(0,r5)
	mov	r0,r14
	mov.l	@(48,gbr),r0
	mov.l	r10,@(4,r5)
	mov.l	r12,@(8,r5)
	add	r14,r11
	add	r0,r12
	mov.l	r11,@(12,r5)
	mov.l	r10,@(16,r5)
	mov.l	r12,@(20,r5)
	sub	r0,r11
	add	r14,r12
	mov.l	r11,@(24,r5)
	mov.l	r10,@(28,r5)
	mov.l	r12,@(32,r5)
	sub	r14,r11
	sub	r0,r12
	mov.l	r11,@(36,r5)
	mov.l	r10,@(40,r5)
	mov.l	r12,@(44,r5)
	mov.l	r9,@(48,r5)
	mov.l	r1,@-r15
	mov	r5,r6
	mov.l	@r5+,r7
	mov.l	@r5+,r8
	mov.l	@r5+,r9
	dmuls.l	r2,r8
	shll2	r9
	sts	mach,r0
	dmuls.l	r2,r9
	add	#64,r6
	sts	mach,r1
	dmuls.l	r3,r9
	mov	#8,r14
	sts	mach,r9
	dmuls.l	r3,r8
	add	r0,r9
	sts	mach,r8
	cmp/ge	r9,r13
	bf/s	.L0600F498
	sub	r1,r8
	mov	#1,r9
	shll8	r9
	shll16	r9
.L0600F498:
	mov	r7,r10
	mov	r8,r11
	mov	r9,r12
	mov.w	@(30,gbr),r0
	mov	#0,r1
	mov.l	r12,@(0,r4)
	mov.l	r0,@(16,r4)
	mov.l	r1,@(20,r4)
	mov	r14,r0
	cmp/eq	#5,r0
	bf	.L0600F4BA
	mov.l	@r5,r0
	add	#-48,r5
	mov.l	r0,@(4,r5)
	mov.l	r0,@(16,r5)
	mov.l	r0,@(28,r5)
	mov.l	r0,@(40,r5)
.L0600F4BA:
	mov	r14,r0
	cmp/eq	#1,r0
	bt	.L0600F4E6
	mov.l	@r5+,r7
	mov.l	@r5+,r8
	mov.l	@r5+,r9
	dmuls.l	r2,r8
	shll2	r9
	sts	mach,r0
	dmuls.l	r2,r9
	sts	mach,r1
	dmuls.l	r3,r9
	sts	mach,r9
	dmuls.l	r3,r8
	add	r0,r9
	sts	mach,r8
	cmp/ge	r9,r13
	bf/s	.L0600F4E6
	sub	r1,r8
	mov	#1,r9
	shll8	r9
	shll16	r9
.L0600F4E6:
	mov.l	@(28,r4),r0
	dmuls.l	r0,r10
	mov	r0,r1
	sts	mach,r10
	shar	r1
	shar	r1
	shar	r1
	dlabel lbl_0600F4F4
	sub	r1,r0
	dmuls.l	r0,r11
	mov.l	r10,@r6
	sts	mach,r11
	mov.l	r12,@(8,r6)
	mov.l	r11,@(4,r6)
	dt	r14
	bf/s	.L0600F498
	add	#12,r6
	mov.l	@r15+,r1
	mov	#8,r13
	mov.l	.L0600F574,r5
	mov	#-1,r6
	shlr	r6
	mov	#1,r7
	rotr	r7
	mov	r6,r8
	mov	r7,r9
	mov	r7,r10
	mov.l	@r5+,r11
.L0600F51C:
	mov.l	@r5+,r12
	mov.l	@r5+,r14
	cmp/ge	r11,r6
	bf	.L0600F526
	mov	r11,r6
.L0600F526:
	cmp/ge	r7,r11
	bf	.L0600F52C
	mov	r11,r7
.L0600F52C:
	cmp/ge	r12,r8
	bf	.L0600F532
	mov	r12,r8
.L0600F532:
	cmp/ge	r9,r12
	bf	.L0600F538
	mov	r12,r9
.L0600F538:
	cmp/ge	r10,r14
	bf	.L0600F53E
	mov	r14,r10
.L0600F53E:
	dt	r13
	bf/s	.L0600F51C
	mov.l	@r5+,r11
	mov	#32,r11
	shll16	r11
	cmp/ge	r10,r11
	bt	.L0600F566
	mov	#88,r11
	shll	r11
	cmp/ge	r11,r6
	bt	.L0600F566
	neg	r11,r11
	cmp/gt	r7,r11
	bt	.L0600F566
	mov	#112,r11
	cmp/ge	r11,r8
	bt	.L0600F566
	neg	r11,r11
	cmp/gt	r9,r11
	bf	.L0600F56A
.L0600F566:
	mov	#-1,r0
	mov.l	r0,@r1
.L0600F56A:
	bra	.L0600F406
	add	#12,r1
	.byte 0x00, 0x00
.L0600F570:
	.long 0xC0000074
.L0600F574:
	.long 0xC00000B4
.L0600F578:
	mov.l	.L0600F5BC,r14
	mov.l	@(64,gbr),r0
	mov.l	.L0600F5C0,r1
	mov.l	@(44,r14),r2
	mov.l	@(48,r14),r3
	mov.l	@(52,r14),r4
	mov.l	@(56,r14),r5
	mov.l	@(60,r14),r6
	shlr2	r0
	shar	r2
	shar	r2
	shar	r2
	shar	r3
	shar	r3
	shar	r3
	add	r0,r4
	add	r0,r5
	sub	r0,r6
	mov.l	r2,@(44,r14)
	mov.l	r3,@(48,r14)
	mov.l	r4,@(52,r14)
	mov.l	r5,@(56,r14)
	mov.l	r6,@(60,r14)
.L0600F5A6:
	mov.l	@r1,r2
	mov.l	.L0600F5BC,r14
	cmp/pl	r2
	bt/s	.L0600F5C4
	mov.l	@(4,r1),r3
	tst	r2,r2
	bf/s	.L0600F5A6
	add	#12,r1
	rts
	nop
	.byte 0x00, 0x00
.L0600F5BC:
	.long SH2_CACHE_DATA
.L0600F5C0:
	.long D_060DAD1C
.L0600F5C4:
	mov.l	r1,@-r15
	add	#8,r2
	mov.l	@(8,r1),r4
	mov.l	@(4,r14),r1
	mov.l	@(44,r14),r5
	mov.l	@(48,r14),r6
	mov.l	@(52,r14),r7
	mov.l	@(56,r14),r9
	mov.l	@(60,r14),r10
	shll2	r1
	neg	r7,r8
	mov.l	.L0600F60C,r11
	mov	#9,r14
.L0600F5DE:
	mov.l	r14,@-r15
	mov	r3,r12
	mov	r4,r13
	mov	#9,r14
.L0600F5E6:
	mov.l	@r2+,r0
	cmp/ge	r9,r13
	bt	.L0600F610
	cmp/eq	#-1,r0
	bt	.L0600F610
	cmp/ge	r13,r10
	bt	.L0600F610
	cmp/gt	r12,r8
	bt	.L0600F610
	cmp/ge	r7,r12
	bt	.L0600F610
	mov.l	r0,@(12,r11)
	mov.l	r12,@r11
	shll16	r0
	sub	r1,r0
	mov.l	r0,@(4,r11)
	bra	.L0600F614
	mov.l	r13,@(8,r11)
	.byte 0x00, 0x00
.L0600F60C:
	.long 0xC0000074
.L0600F610:
	mov	#-1,r0
	mov.l	r0,@(12,r11)
.L0600F614:
	add	r5,r12
	add	r6,r13
	dt	r14
	bf/s	.L0600F5E6
	add	#16,r11
	mov.l	@r15+,r14
	sub	r6,r3
	dt	r14
	bf/s	.L0600F5DE
	add	r5,r4
	mov.l	.L0600F654,r14
	mov.l	.L0600F658,r4
	mov.l	@(20,r14),r2
	mov.l	@(24,r14),r3
	mov.l	.L0600F65C,r5
	mov	#-1,r7
	shll8	r7
	mov	#16,r10
	shll16	r10
	mov	#0,r13
	mov	#81,r14
.L0600F63E:
	mov.l	@(12,r5),r0
	mov.l	@(8,r5),r9
	cmp/eq	#-1,r0
	bf/s	.L0600F660
	shll2	r9
.L0600F648:
	dt	r14
	bf/s	.L0600F63E
	add	#16,r5
	bra	.L0600F6F0
	nop
	.byte 0x00, 0x00
.L0600F654:
	.long SH2_CACHE_DATA
.L0600F658:
	.long 0x0FEF0000
.L0600F65C:
	.long SH2_CACHE_DATA + 0x74
.L0600F660:
	dmuls.l	r2,r9
	mov.l	@(4,r5),r8
	sts	mach,r1
	dmuls.l	r2,r8
	sts	mach,r0
	dmuls.l	r3,r9
	sts	mach,r9
	dmuls.l	r3,r8
	add	r0,r9
	sts	mach,r8
	cmp/hi	r4,r9
	bt	.L0600F67E
	cmp/gt	r10,r9
	bt/s	.L0600F684
	sub	r1,r8
.L0600F67E:
	mov	#-1,r0
	bra	.L0600F648
	mov.l	r0,@(12,r5)
.L0600F684:
	mov	r5,r6
	add	#16,r5
	mov	r8,r11
	mov	r9,r12
	mov.w	@(30,gbr),r0
	mov	#0,r1
	mov.l	r12,@(0,r7)
	mov.l	r0,@(16,r7)
	mov.l	r1,@(20,r7)
.L0600F696:
	mov.l	@(12,r5),r0
	mov.l	@(8,r5),r9
	cmp/eq	#-1,r0
	bf/s	.L0600F6AA
	shll2	r9
.L0600F6A0:
	dt	r14
	bf/s	.L0600F696
	add	#16,r5
	bra	.L0600F6CE
	mov	#1,r14
.L0600F6AA:
	dmuls.l	r2,r9
	mov.l	@(4,r5),r8
	sts	mach,r1
	dmuls.l	r2,r8
	sts	mach,r0
	dmuls.l	r3,r9
	sts	mach,r9
	dmuls.l	r3,r8
	add	r0,r9
	sts	mach,r8
	cmp/hi	r4,r9
	bt	.L0600F6C8
	cmp/gt	r10,r9
	bt/s	.L0600F6CE
	sub	r1,r8
.L0600F6C8:
	mov	#-1,r0
	bra	.L0600F6A0
	mov.l	r0,@(12,r5)
.L0600F6CE:
	mov.l	@(28,r7),r0
	mov.l	r12,@(8,r6)
	mov.l	@r6,r12
	mov	r0,r1
	dmuls.l	r0,r12
	shar	r1
	sts	mach,r12
	shar	r1
	mov.l	r12,@r6
	shar	r1
	dlabel lbl_0600F6E2
	sub	r1,r0
	dmuls.l	r0,r11
	add	#1,r13
	sts	mach,r11
	dt	r14
	bf/s	.L0600F684
	mov.l	r11,@(4,r6)
.L0600F6F0:
	shlr2	r13
	tst	r13,r13
	bf/s	.L0600F6FC
	mov.l	@r15+,r1
	bra	.L0600F9AE
	nop
.L0600F6FC:
	mov.l	r1,@-r15
	mov.l	@r1,r1
	mov	#83,r0
	shll2	r0
	add	r0,r1
	mov.l	@(36,gbr),r0
	mov.l	.L0600F7A0,r2
	mov	r0,r3
	mov	#88,r4
	shll	r4
	mov	#112,r5
	mov.l	@(40,gbr),r0
	mov.l	.L0600F7A4,r8
	mov	r0,r9
	mov	#36,r0
	shll2	r0
	mov	r8,r7
	add	r0,r7
	mov	#8,r14
.L0600F722:
	mov.l	r14,@-r15
	mov	#8,r14
.L0600F726:
	mov.l	@(12,r7),r0
	mov.l	@(28,r7),r10
	mov.l	@(12,r8),r11
	mov.l	@(28,r8),r12
	or	r10,r0
	or	r11,r0
	or	r12,r0
	cmp/eq	#-1,r0
	bt	.L0600F79A
	mov.w	@r1,r0
	mov.l	@r7,r10
	cmp/eq	#-1,r0
	bt	.L0600F79A
	mov.l	@(16,r7),r11
	mov.l	@(16,r8),r12
	mov.l	@r8,r13
	cmp/gt	r10,r4
	bt	.L0600F758
	cmp/gt	r11,r4
	bt	.L0600F76A
	cmp/gt	r12,r4
	bt	.L0600F76A
	cmp/gt	r13,r4
	bt	.L0600F76A
	bf	.L0600F79A
.L0600F758:
	neg	r4,r6
	cmp/gt	r10,r6
	bf	.L0600F76A
	cmp/gt	r11,r6
	bf	.L0600F76A
	cmp/gt	r12,r6
	bf	.L0600F76A
	cmp/gt	r13,r6
	bt	.L0600F79A
.L0600F76A:
	add	r4,r10
	mov	r10,r0
	mov.w	r0,@(100,gbr)
	add	r4,r11
	mov	r11,r0
	mov.w	r0,@(104,gbr)
	add	r4,r12
	mov	r12,r0
	mov.w	r0,@(108,gbr)
	add	r4,r13
	mov	r13,r0
	mov.w	r0,@(112,gbr)
	mov.l	@(4,r7),r10
	mov.l	@(20,r7),r11
	mov.l	@(20,r8),r12
	mov.l	@(4,r8),r13
	cmp/gt	r10,r5
	bt	.L0600F7A8
	cmp/gt	r11,r5
	bt	.L0600F7BA
	cmp/gt	r12,r5
	bt	.L0600F7BA
	cmp/gt	r13,r5
	bt	.L0600F7BA
.L0600F79A:
	bra	.L0600F98C
	nop
	.byte 0x00, 0x00
.L0600F7A0:
	.long 0x0020000C
.L0600F7A4:
	.long 0xC0000074
.L0600F7A8:
	neg	r5,r6
	cmp/gt	r10,r6
	bf	.L0600F7BA
	cmp/gt	r11,r6
	bf	.L0600F7BA
	cmp/gt	r12,r6
	bf	.L0600F7BA
	cmp/gt	r13,r6
	bt	.L0600F79A
.L0600F7BA:
	add	r5,r10
	mov	r10,r0
	mov.w	r0,@(102,gbr)
	add	r5,r11
	mov	r11,r0
	mov.w	r0,@(106,gbr)
	add	r5,r12
	mov	r12,r0
	mov.w	r0,@(110,gbr)
	add	r5,r13
	mov	r13,r0
	mov.w	r0,@(114,gbr)
	mov.w	@(74,gbr),r0
	mov	r10,r6
	tst	r0,r0
	bt	.L0600F824
	mov	r12,r6
	mov.w	@(100,gbr),r0
	sub	r11,r10
	mov	r0,r13
	mov.w	@(104,gbr),r0
	sub	r12,r11
	mov	r0,r12
	mov.w	@(108,gbr),r0
	sub	r12,r13
	muls.w	r11,r13
	sub	r0,r12
	sts	macl,r11
	muls.w	r10,r12
	sts	macl,r10
	sub	r11,r10
	cmp/pz	r10
	bt	.L0600F86A
	mov.w	@(114,gbr),r0
	mov	r0,r12
	mov.w	@(102,gbr),r0
	sub	r12,r6
	sub	r0,r12
	mov.w	@(108,gbr),r0
	mov	r0,r11
	mov.w	@(112,gbr),r0
	mov	r0,r10
	mov.w	@(100,gbr),r0
	sub	r10,r11
	muls.w	r11,r12
	sub	r0,r10
	sts	macl,r11
	muls.w	r10,r6
	sts	macl,r10
	sub	r11,r10
	cmp/pz	r10
	bt	.L0600F86A
	bf	.L0600F79A
.L0600F824:
	mov.w	@(108,gbr),r0
	sub	r11,r12
	mov	r0,r13
	mov.w	@(104,gbr),r0
	sub	r10,r11
	mov	r0,r10
	mov.w	@(100,gbr),r0
	sub	r10,r13
	muls.w	r11,r13
	sub	r0,r10
	sts	macl,r11
	muls.w	r10,r12
	sts	macl,r10
	sub	r11,r10
	cmp/pz	r10
	bt	.L0600F86A
	mov.w	@(114,gbr),r0
	mov	r0,r12
	mov.w	@(110,gbr),r0
	sub	r12,r6
	sub	r0,r12
	mov.w	@(100,gbr),r0
	mov	r0,r11
	mov.w	@(112,gbr),r0
	mov	r0,r10
	mov.w	@(108,gbr),r0
	sub	r10,r11
	muls.w	r11,r12
	sub	r0,r10
	sts	macl,r11
	muls.w	r10,r6
	sts	macl,r10
	sub	r11,r10
	cmp/pz	r10
	bf	.L0600F79A
.L0600F86A:
	mov.l	.L0600F880,r12
	mov.l	@(8,r7),r6
	mov.w	@r12,r0
	mov.l	@(24,r7),r10
	add	#-1,r0
	cmp/pl	r0
	bt/s	.L0600F884
	mov.l	@(24,r8),r11
	bra	.L0600F98C
	nop
	.byte 0x00, 0x00
.L0600F880:
	.long D_060FFC4A
.L0600F884:
	mov.w	r0,@r12
	mov.l	@(8,r8),r12
	cmp/gt	r10,r6
	bt	.L0600F88E
	mov	r10,r6
.L0600F88E:
	cmp/gt	r11,r6
	bt	.L0600F894
	mov	r11,r6
.L0600F894:
	cmp/gt	r12,r6
	bt	.L0600F89A
	mov	r12,r6
.L0600F89A:
	mov.w	@r1,r10
	mov.w	.L0600F90C,r13
	swap.w	r10,r11
	swap.b	r10,r0
	mov.w	.L0600F90E,r12
	and	#48,r0
	or	r0,r12
	mov.w	r12,@r3
	and	r13,r10
	shll2	r10
	add	r2,r10
	mov.l	@r10,r12
	mov.w	@(30,gbr),r0
	mov	r6,r13
	shll16	r0
	sub	r0,r13
	cmp/pl	r13
	mov.w	@(76,gbr),r0
	bf	.L0600F8D2
	dmulu.l	r0,r13
	sts	mach,r13
	mov	#28,r0
	cmp/hs	r13,r0
	bt	.L0600F8CC
	mov	r0,r13
.L0600F8CC:
	and	r0,r13
	shll16	r13
	add	r13,r12
.L0600F8D2:
	mov.w	@(68,gbr),r0
	mov	r12,r13
	xtrct	r0,r12
	mov.l	r12,@(4,r3)
	mov.w	@(70,gbr),r0
	shll16	r13
	or	r0,r13
	mov.l	r13,@(8,r3)
	mov.l	.L0600F910,r10
	shll	r11
	bf/s	.L0600F914
	mov.l	@(0,r10),r12
	mov.l	@(4,r10),r13
	mov.l	r12,@(24,r3)
	mov.l	r13,@(12,r3)
	mov.l	@(8,r10),r12
	mov.l	@(12,r10),r13
	mov.l	r12,@(16,r3)
	mov.l	r13,@(20,r3)
	shll	r11
	bt	.L0600F936
	mov.w	@(28,r7),r0
	mov.l	@(28,r8),r12
	mov.l	@(12,r8),r10
	xtrct	r0,r12
	mov.l	@(12,r7),r13
	shlr16	r10
	bra	.L0600F93E
	xtrct	r10,r13
.L0600F90C:
	.short 0x07FF
.L0600F90E:
	.short 0x1002
.L0600F910:
	.long 0xC0000064
.L0600F914:
	mov.l	@(4,r10),r13
	mov.l	r12,@(12,r3)
	mov.l	r13,@(16,r3)
	mov.l	@(8,r10),r12
	mov.l	@(12,r10),r13
	mov.l	r12,@(20,r3)
	mov.l	r13,@(24,r3)
	shll	r11
	bt	.L0600F936
	mov.w	@(12,r7),r0
	mov.l	@(28,r7),r12
	mov.l	@(28,r8),r10
	xtrct	r0,r12
	mov.l	@(12,r8),r13
	shlr16	r10
	bra	.L0600F93E
	xtrct	r10,r13
.L0600F936:
	mov.w	@(2,r1),r0
	swap.w	r0,r12
	or	r0,r12
	mov	r12,r13
.L0600F93E:
	mov.l	.L0600F978,r11
	mov.l	.L0600F97C,r0
	add	r9,r11
	mov.l	r12,@r11
	mov.l	r13,@(4,r11)
	add	r9,r0
	shlr2	r0
	shlr	r0
	mov.w	r0,@(28,r3)
	add	#8,r9
	shlr16	r6
	mov.l	.L0600F980,r12
	add	#16,r6
	mov	#7,r0
	not	r0,r0
	and	r0,r6
	add	r6,r12
	mov.l	@r12,r0
	mov.l	r3,@r12
	mov.l	.L0600F984,r6
	tst	r0,r0
	mov.l	@r6,r6
	bt	.L0600F988
	sub	r6,r0
	shlr2	r0
	shlr	r0
	bra	.L0600F98A
	mov.w	r0,@(2,r3)
	.byte 0x00, 0x00
.L0600F978:
	.long D_060D9518
.L0600F97C:
	.long VDP1_VRAM_CACHED + 0x7E800
.L0600F980:
	.long D_060E9000 + 0x20000000
.L0600F984:
	.long D_060FFF28 + 0x20000000
.L0600F988:
	mov.l	r3,@(4,r12)
.L0600F98A:
	add	#32,r3
.L0600F98C:
	add	#16,r7
	dt	r14
	bt/s	.L0600F996
	add	#16,r8
	bra	.L0600F726
.L0600F996:
	add	#4,r1
	mov.l	@r15+,r14
	add	#16,r7
	dt	r14
	bt	.L0600F9A4
	bra	.L0600F722
	add	#16,r8
.L0600F9A4:
	mov	r3,r0
	mov.l	r0,@(36,gbr)
	mov	r9,r0
	mov.l	r0,@(40,gbr)
	mov.l	@r15+,r1
.L0600F9AE:
	bra	.L0600F5A6
	add	#12,r1
	endlabel func_0600F2F0

	glabel func_0600F9B2
	mov.l	.L0600F9D0,r2
	mov.l	.L0600F9D4,r3
	mov.l	@r2,r2
	mov.l	@r2+,r4
	mov.l	@r2+,r5
	mov.l	@r2+,r6
	mov.l	@r2+,r7
	mov.l	@r2+,r8
	mov.l	r4,@r3
	mov.l	r5,@(4,r3)
	mov.l	r6,@(8,r3)
	mov.l	r7,@(12,r3)
	mov.l	r8,@(16,r3)
	rts
	add	#20,r3
.L0600F9D0:
	.long D_060D9300
.L0600F9D4:
	.long D_060DB2EC
	endlabel func_0600F9B2

	glabel func_0600F9D8
	mov.l	.L0600F9F0,r14
	mov.l	@r14+,r0
	mov.l	r0,@(80,gbr)
	mov.l	@r14+,r0
	mov.l	r0,@(84,gbr)
	mov.l	@r14+,r0
	mov.l	r0,@(88,gbr)
	mov.l	@r14+,r0
	mov.l	r0,@(92,gbr)
	mov.l	@r14,r0
	rts
	mov.l	r0,@(96,gbr)
.L0600F9F0:
	.long D_060DB2EC
	endlabel func_0600F9D8

	glabel func_0600F9F4
	sts.l	pr,@-r15
	bsr	func_0600F9B2
	nop
	mov.l	@r2+,r4
	mov.l	@r2+,r5
	mov.l	@r2,r1
	mov.l	r4,@r3
	mov.l	r5,@(4,r3)
	mov.l	r1,@(8,r3)
	mov.l	.L0600FAA0,r2
	mov	#-1,r0
	mov.l	r0,@r2
	mov.l	r0,@(4,r2)
	mov	#8,r12
.L0600FA10:
	mov.l	@r1+,r4
	mov	r4,r3
	add	#-4,r3
	mov.w	@r3+,r2
	mov.w	@r3,r3
	mov	#64,r0
	shll	r0
	sub	r0,r2
	sub	r0,r3
	mov	#9,r14
.L0600FA24:
	mov	#9,r13
	mov.l	r2,@-r15
.L0600FA28:
	mov.l	.L0600FAA4,r6
	mov	r3,r7
	shlr8	r7
	shll2	r7
	add	r7,r6
	mov.l	@r6,r6
	mov	r2,r7
	shlr8	r7
	shll2	r7
	add	r7,r6
	mov.l	@r6,r6
	mov	r3,r0
	and	#224,r0
	add	r0,r6
	shlr2	r0
	shlr	r0
	add	r0,r6
	mov	r2,r0
	and	#224,r0
	add	#1,r0
	rotr	r0
	shlr2	r0
	add	r0,r6
	mov.w	@(10,r6),r0
	mov.w	r0,@(4,r4)
	add	#32,r2
	dt	r13
	bf/s	.L0600FA28
	add	#8,r4
	mov.l	@r15+,r2
	dt	r14
	bf/s	.L0600FA24
	add	#32,r3
	mov.w	.L0600FA9E,r0
	mov	r4,r5
	sub	r0,r5
	mov	#5,r14
.L0600FA72:
	mov	#5,r13
.L0600FA74:
	mov.l	@r5,r6
	add	#8,r5
	mov.l	r6,@r4
	dt	r13
	bf/s	.L0600FA74
	add	#4,r4
	dt	r14
	bf/s	.L0600FA72
	add	#32,r5
	dt	r12
	bf	.L0600FA10
	mov.l	.L0600FAA8,r2
	mova	.L0600FA94,r0
	lds.l	@r15+,pr
	mov.l	r0,@r2
	nop
.L0600FA94:
	mov.w	@(74,gbr),r0
	tst	r0,r0
	bt	.L0600FAAC
	rts
	nop
.L0600FA9E:
	.short 0x01E4
.L0600FAA0:
	.long D_060DB318
.L0600FAA4:
	.long D_060D9310 + 0x20000000
.L0600FAA8:
	.long D_060DB2DC
.L0600FAAC:
	sts.l	pr,@-r15
	bsr	func_0600F9D8
	nop
	mov.l	.L0600FAF4,r1
	mov.l	.L0600FAF8,r2
	mov.l	@r1,r1
	mov	#8,r14
.L0600FABA:
	mov.b	@r2,r0
	mov.l	@r1,r3
	cmp/pz	r0
	bt	.L0600FAFC
	mov.w	.L0600FAEE,r12
	mov.w	.L0600FAF0,r13
	mov	r3,r4
	add	r12,r3
	add	r13,r4
	mov	#5,r13
.L0600FACE:
	mov.l	@r4+,r5
	mov.l	@r4+,r6
	mov.l	@r4+,r7
	mov.l	@r4+,r8
	mov.l	@r4+,r9
	mov.l	r5,@r3
	mov.l	r6,@(8,r3)
	mov.l	r7,@(16,r3)
	mov.l	r8,@(24,r3)
	mov.l	r9,@(32,r3)
	dt	r13
	bf/s	.L0600FACE
	add	#72,r3
	mov	#0,r0
	bra	.L0600FB28
	mov.b	r0,@r2
.L0600FAEE:
	.short 0x00A4
.L0600FAF0:
	.short 0x0288
	.byte 0x00, 0x00
.L0600FAF4:
	.long D_060DB308
.L0600FAF8:
	.long D_060DB318
.L0600FAFC:
	tst	r0,r0
	bt	.L0600FB8A
	dt	r0
	bt	.L0600FB8A
	mov.b	r0,@r2
	mov.w	.L0600FB82,r12
	mov.w	.L0600FB84,r13
	mov	r3,r4
	add	r12,r3
	add	r13,r4
	mov	#5,r13
.L0600FB12:
	mov	#5,r12
.L0600FB14:
	mov.l	@r4+,r5
	mov.l	@r3,r6
	dt	r12
	add	r5,r6
	mov.l	r6,@r3
	bf/s	.L0600FB14
	add	#8,r3
	dt	r13
	bf/s	.L0600FB12
	add	#32,r3
.L0600FB28:
	mov.l	@r1,r3
	mov	#72,r0
	mov	r3,r4
	add	r0,r4
	mov	r4,r5
	add	r0,r5
	mov	#7,r6
	bsr	func_06010204
	mov	#7,r7
	mov.l	@r1,r3
	mov.w	.L0600FB86,r5
	mov	r3,r4
	mov.w	.L0600FB88,r0
	add	r5,r4
	mov.w	@(r0,r3),r13
.L0600FB46:
	mov.l	@r4+,r5
	mov.w	@r4+,r6
	cmp/pz	r5
	bf	.L0600FB8A
	mov.w	@r5,r0
	cmp/gt	r13,r0
	bf	.L0600FB56
	mov.w	r13,@r5
.L0600FB56:
	add	r6,r5
	mov.w	@r4+,r6
	mov.w	@r4+,r7
	mov.w	@r4+,r8
	add	r3,r6
.L0600FB60:
	mov	r5,r9
	mov	r6,r10
	mov	r7,r11
.L0600FB66:
	mov.w	@r10,r12
	mov.w	@(4,r10),r0
	mov.w	r12,@r9
	mov.w	r0,@(2,r9)
	add	#8,r10
	dt	r11
	bf/s	.L0600FB66
	add	#4,r9
	add	#36,r5
	dt	r8
	bf/s	.L0600FB60
	add	#72,r6
	bra	.L0600FB46
	nop
.L0600FB82:
	.short 0x00A4
.L0600FB84:
	.short 0x02EC
.L0600FB86:
	.short 0x0350
.L0600FB88:
	.short 0x0144
.L0600FB8A:
	add	#4,r1
	dt	r14
	bf/s	.L0600FABA
	add	#1,r2
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_0600F9F4

	glabel func_0600FB98
	mov.l	.L0600FBBC,r2
	mov.l	.L0600FBC0,r3
	mov.l	@r2,r2
	mov.l	.L0600FBC4,r1
	mov.l	@(52,r2),r4
	mov	#-1,r0
	cmp/hs	r4,r3
	bf	.L0600FBCC
.L0600FBA8:
	mov.l	@r1,r2
	tst	r2,r2
	bt	.L0600FBC8
	mov.l	@r2,r2
	tst	r2,r2
	bt	.L0600FBB8
	mov.l	r2,@r1
	mov	#0,r0
.L0600FBB8:
	bra	.L0600FBA8
	add	#12,r1
.L0600FBBC:
	.long player_obj + 0x20000000
.L0600FBC0:
	.long 0x0B800000
.L0600FBC4:
	.long D_060DAD1C
.L0600FBC8:
	mov.l	.L0600FBD0,r2
	mov.w	r0,@r2
.L0600FBCC:
	rts
	nop
.L0600FBD0:
	.long D_060DB2CE
	endlabel func_0600FB98

	glabel func_0600FBD4
	sts.l	pr,@-r15
	bsr	func_0600F9B2
	nop
	lds.l	@r15+,pr
	mov.l	@r2+,r4
	mov.l	@r2+,r5
	mov.l	@r2+,r6
	mov.l	@r2+,r7
	mov.l	@r2+,r8
	mov.l	@r2,r9
	mov.l	r4,@r3
	mov.l	r5,@(4,r3)
	mov.l	r6,@(8,r3)
	mov.l	r7,@(12,r3)
	mov.l	r8,@(16,r3)
	mov.l	r9,@(20,r3)
	mov.l	.L0600FC1C,r2
	mov	#-1,r0
	mov.w	r0,@r2
	mov.l	.L0600FC20,r2
	mov	#-128,r0
	shll8	r0
	mov.w	r0,@r2
	mov.l	.L0600FC24,r2
	mov	#0,r0
	mov.w	r0,@r2
	mov.l	.L0600FC28,r2
	mova	.L0600FC10,r0
	mov.l	r0,@r2
	nop
.L0600FC10:
	mov.w	@(74,gbr),r0
	tst	r0,r0
	bt	.L0600FC2C
	rts
	nop
	.byte 0x00, 0x00
.L0600FC1C:
	.long D_060DB318
.L0600FC20:
	.long D_060DB328
.L0600FC24:
	.long D_060DB55E
.L0600FC28:
	.long D_060DB2DC
.L0600FC2C:
	mov.l	.L0600FC8C,r2
	mov.w	@r2,r0
	tst	r0,r0
	bf	.L0600FCA0
	mov	#-1,r0
	mov.w	r0,@r2
	mov.l	.L0600FC90,r2
	mov.w	@r2,r0
	tst	r0,r0
	bt	.L0600FCA0
	mov	#0,r0
	mov.w	r0,@r2
	mov.l	.L0600FC94,r2
	mov.l	@r2+,r3
	mov.l	@r2,r2
	mov.l	@r2,r2
.L0600FC4C:
	mov	#117,r0
.L0600FC4E:
	mov.l	@r2+,r4
	mov.l	@r2+,r5
	mov.l	@r2+,r6
	mov.l	@r2+,r7
	mov.l	@r2+,r8
	mov.l	@r2+,r9
	mov.l	@r2+,r10
	mov.l	@r2+,r11
	mov.l	@r2+,r12
	mov.l	@r2+,r13
	mov.l	r4,@r3
	mov.l	r5,@(4,r3)
	mov.l	r6,@(8,r3)
	mov.l	r7,@(12,r3)
	mov.l	r8,@(16,r3)
	mov.l	r9,@(20,r3)
	mov.l	r10,@(24,r3)
	mov.l	r11,@(28,r3)
	mov.l	r12,@(32,r3)
	mov.l	r13,@(36,r3)
	dt	r0
	bf/s	.L0600FC4E
	add	#40,r3
	mov.l	@r2,r4
	mov.l	r4,@r3
	mov.l	.L0600FC98,r2
	mov	#0,r0
	mov.b	r0,@r2
	mov.l	.L0600FC9C,r2
	bra	.L0600FDC0
	mov.w	r0,@r2
.L0600FC8C:
	.long D_060DB55E
.L0600FC90:
	.long D_060DB318
.L0600FC94:
	.long D_060DB30C
.L0600FC98:
	.long cam_flags
.L0600FC9C:
	.long D_060DB560
.L0600FCA0:
	mov.l	.L0600FCC8,r2
	mov.l	@r2,r3
	mov	#13,r2
	shll8	r2
	mov.l	@(48,r3),r0
	shll16	r2
	cmp/gt	r0,r2
	bt	.L0600FCD4
	mov.l	.L0600FCCC,r2
	mov.w	@r2,r0
	cmp/eq	#1,r0
	bt	.L0600FCBA
	bra	.L0600FE0C
.L0600FCBA:
	mov	#2,r0
	mov.w	r0,@r2
	mov.l	.L0600FCD0,r2
	mov.l	@r2+,r3
	mov.l	@r2,r2
	bra	.L0600FC4C
	mov.l	@(8,r2),r2
.L0600FCC8:
	.long player_obj
.L0600FCCC:
	.long D_060DB318
.L0600FCD0:
	.long D_060DB30C
.L0600FCD4:
	mov.l	.L0600FCE0,r2
	mov.b	@r2,r0
	tst	r0,r0
	bt	.L0600FCE4
	bra	.L0600FDF6
	nop
.L0600FCE0:
	.long D_060FFC3F
.L0600FCE4:
	mov.l	.L0600FCF0,r2
	mov.w	@r2,r0
	cmp/eq	#2,r0
	bf	.L0600FCF4
	bra	.L0600FDF6
	nop
.L0600FCF0:
	.long D_060DB318
.L0600FCF4:
	cmp/eq	#1,r0
	bt	.L0600FD14
	mov.w	.L0600FD20,r4
	mov.l	@(56,r3),r0
	shll16	r4
	cmp/gt	r0,r4
	bt	.L0600FDF6
	mov.l	.L0600FD24,r3
	mov.l	.L0600FD28,r4
	mov	#-1,r0
	mov.b	r0,@r3
	mov.w	r0,@r4
	mov.l	.L0600FD2C,r3
	mov.l	.L0600FD30,r4
	mov.l	r3,@r2
	mov.l	r4,@(4,r2)
.L0600FD14:
	mov.w	@(2,r2),r0
	tst	r0,r0
	bt	.L0600FD34
	add	#-1,r0
	bra	.L0600FDF6
	mov.w	r0,@(2,r2)
.L0600FD20:
	.short 0x0580
	.byte 0x00, 0x00
.L0600FD24:
	.long cam_flags
.L0600FD28:
	.long D_060DB560
.L0600FD2C:
	.long 0x0001003C
.L0600FD30:
	.long 0x01860008
.L0600FD34:
	mov.w	@(4,r2),r0
	mov	#0,r14
	tst	r0,r0
	bt	.L0600FD48
	dt	r0
	bf/s	.L0600FD60
	mov.w	r0,@(4,r2)
	mov	#30,r0
	bra	.L0600FD60
	mov.w	r0,@(2,r2)
.L0600FD48:
	mov.w	@(6,r2),r0
	mov	#-1,r14
	dt	r0
	bf/s	.L0600FD60
	mov.w	r0,@(6,r2)
	mov	#2,r0
	mov.w	r0,@r2
	mov.l	.L0600FDFC,r2
	mov.l	.L0600FE00,r1
	mov	#127,r0
	mov.b	r0,@r2
	mov.w	r0,@r1
.L0600FD60:
	mov.l	.L0600FE04,r1
	mov.l	@r1+,r2
	mov.l	@r1,r1
	mov.l	@(4,r1),r1
	mov	#117,r0
	shll	r0
.L0600FD6C:
	mov.l	@r1+,r3
	mov.l	@r1+,r4
	mov.l	@r1+,r5
	mov.l	@r1+,r6
	mov.l	@r1+,r7
	mov.l	@r2,r8
	mov.l	@(4,r2),r9
	mov.l	@(8,r2),r10
	mov.l	@(12,r2),r11
	mov.l	@(16,r2),r12
	tst	r14,r14
	bt	.L0600FD98
	shll2	r3
	shll	r3
	shll2	r4
	shll	r4
	shll2	r5
	shll	r5
	shll2	r6
	shll	r6
	shll2	r7
	shll	r7
.L0600FD98:
	add	r3,r8
	add	r4,r9
	add	r5,r10
	add	r6,r11
	add	r7,r12
	mov.l	r8,@r2
	mov.l	r9,@(4,r2)
	mov.l	r10,@(8,r2)
	mov.l	r11,@(12,r2)
	mov.l	r12,@(16,r2)
	dt	r0
	bf/s	.L0600FD6C
	add	#20,r2
	mov.l	@r1,r3
	mov.l	@r2,r8
	tst	r14,r14
	bt	.L0600FDBC
	shll2	r3
.L0600FDBC:
	add	r3,r8
	mov.l	r8,@r2
.L0600FDC0:
	mov.l	.L0600FE08,r2
	mov.l	@r2+,r3
	mov.l	@r2,r2
	mov	#20,r14
.L0600FDC8:
	mov.l	@r3+,r4
	mov.w	@r3+,r5
	mov.w	@r3+,r6
	mov.w	@r3+,r7
	mov.w	@r3+,r8
	mov.w	@r2,r9
	mov.w	@(4,r2),r0
	mov.w	r9,@r4
	mov.w	r0,@(2,r4)
	add	#8,r2
	add	r5,r4
.L0600FDDE:
	mov	r7,r9
.L0600FDE0:
	mov.w	@r2,r0
	add	#4,r2
	mov.w	r0,@r4
	dt	r9
	bf/s	.L0600FDE0
	add	#4,r4
	dt	r8
	bf/s	.L0600FDDE
	add	r6,r4
	dt	r14
	bf	.L0600FDC8
.L0600FDF6:
	rts
	nop
	.byte 0x00, 0x00
.L0600FDFC:
	.long cam_flags
.L0600FE00:
	.long D_060DB560
.L0600FE04:
	.long D_060DB30C
.L0600FE08:
	.long D_060DB308
.L0600FE0C:
	rts
	nop
	endlabel func_0600FBD4

	glabel func_0600FE10
	sts.l	pr,@-r15
	bsr	func_0600F9B2
	nop
	mov.l	@r2+,r4
	mov.l	@r2,r5
	mov.l	r4,@r3
	mov.l	r5,@(4,r3)
	mov.l	.L0600FE3C,r2
	mov	#0,r0
	mov.l	r0,@r2
	mov.l	r0,@(4,r2)
	mov.l	r0,@(8,r2)
	mov.l	.L0600FE40,r2
	mov.w	r0,@r2
	mov.l	.L0600FE44,r2
	mova	.L0600FE48,r0
	mov.l	r0,@r2
	bsr	func_0600F9D8
	nop
	mov	#0,r2
	bra	.L0600FF2C
	mov	#0,r3
.L0600FE3C:
	.long D_060DB320
.L0600FE40:
	.long D_060DB55C
.L0600FE44:
	.long D_060DB2DC
.L0600FE48:
	.byte 0xC5, 0x25, 0x20, 0x08, 0x89, 0x01, 0x00, 0x0B, 0x00, 0x09, 0xD1, 0x08, 0x65, 0x15, 0x67, 0x15
	.byte 0x66, 0x15, 0x68, 0x13, 0x62, 0x15, 0x64, 0x15, 0x63, 0x15, 0x32, 0x50, 0x8B, 0x08, 0x34, 0x70
	.byte 0x8B, 0x06, 0x33, 0x60, 0x8B, 0x04, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x00
	.long D_060DB320
	endlabel func_0600FE10

	glabel func_0600FE78
	sts.l	pr,@-r15
	bsr	func_0600F9D8
	nop
	mov.w	r3,@-r8
	mov.w	r4,@-r8
	mov.w	r2,@-r8
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	add	#-112,r5
	add	#-112,r6
	mov.l	.L0600FECC,r1
	mov.l	.L0600FED0,r4
	mov	#10,r7
	mov	r5,r0
	add	#-32,r0
	and	#224,r0
	shlr2	r0
	shlr2	r0
	shlr	r0
	mulu.w	r7,r0
	mov.l	@(92,gbr),r0
	sts	macl,r2
	add	r0,r2
	mov	r6,r0
	add	#-32,r0
	and	#224,r0
	shlr2	r0
	shlr2	r0
	mulu.w	r7,r0
	mov.l	@(96,gbr),r0
	sts	macl,r3
	add	r0,r3
.L0600FEB8:
	mov	r2,r7
.L0600FEBA:
	mov.b	@r7+,r0
	cmp/pz	r0
	bf	.L0600FF06
	mov.l	@r1,r8
	add	#8,r1
	cmp/pz	r8
	bt	.L0600FED4
	bra	.L0600FEBA
	add	#2,r7
.L0600FECC:
	.long D_060DB32C
.L0600FED0:
	.long D_060DB378
.L0600FED4:
	mov.b	@r7+,r9
	add	r0,r8
	shlr	r9
	add	r4,r9
	mov.w	@r3+,r0
	mov.w	@r3+,r10
	add	r0,r8
	shlr	r10
	add	r10,r9
	mov.b	@r7+,r12
	mov.w	@r3+,r13
.L0600FEEA:
	mov	r8,r10
	mov	r9,r11
	mov	r12,r14
.L0600FEF0:
	mov.l	@r11+,r5
	dt	r14
	mov.l	r5,@r10
	bf/s	.L0600FEF0
	add	#4,r10
	add	#36,r8
	dt	r13
	bf/s	.L0600FEEA
	add	#44,r9
	bra	.L0600FEBA
	add	#-6,r3
.L0600FF06:
	mov.w	@(6,r3),r0
	add	#6,r3
	cmp/pz	r0
	bt	.L0600FEB8
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	.L0600FF28,r1
.L0600FF14:
	mov.l	@r1,r4
	cmp/pz	r4
	bf	.L0600FF22
	tst	r4,r4
	bt	.L0600FF2C
	mov.l	@(4,r1),r0
	mov.l	r0,@(4,r4)
.L0600FF22:
	bra	.L0600FF14
	add	#8,r1
	.byte 0x00, 0x00
.L0600FF28:
	.long D_060DB32C
.L0600FF2C:
	mov.l	.L0600FF54,r1
	mov.w	@r1,r0
	mov.l	.L0600FF58,r14
	tst	r0,r0
	bt	.L0600FF38
	mov.l	.L0600FF5C,r14
.L0600FF38:
	mov.l	.L0600FF60,r1
	bsr	func_0600FF90
	nop
	mov.l	.L0600FF60,r1
.L0600FF40:
	mov.l	@r1,r4
	cmp/pz	r4
	bf	.L0600FF4E
	tst	r4,r4
	bt	.L0600FF64
	mov.l	@(4,r4),r0
	mov.l	r0,@(4,r1)
.L0600FF4E:
	bra	.L0600FF40
	add	#8,r1
	.byte 0x00, 0x00
.L0600FF54:
	.long D_060DB55C
.L0600FF58:
	.long D_060D930C + 0x20000000
.L0600FF5C:
	.long D_060D9414 + 0x20000000
.L0600FF60:
	.long D_060DB32C
.L0600FF64:
	bsr	func_0600FFFA
	nop
	mov.l	.L0600FF88,r1
	mov.l	.L0600FF8C,r4
	mov	#121,r5
.L0600FF6E:
	mov.w	@r1,r6
	mov.w	@(4,r1),r0
	add	#8,r1
	mov.w	r6,@r4
	mov.w	r0,@(2,r4)
	dt	r5
	bf/s	.L0600FF6E
	add	#4,r4
	bsr	func_06010096
	nop
	bra	func_0601017C
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L0600FF88:
	.long SH2_CACHE_DATA + 0x74
.L0600FF8C:
	.long D_060DB378
	endlabel func_0600FE78

	glabel func_0600FF90
	add	#-112,r2
	add	#-112,r3
	mov	r2,r4
	mov	r3,r5
	add	#-32,r4
	add	#-32,r5
	mov	#112,r8
	shll	r8
	mov	r4,r0
	and	r8,r0
	cmp/eq	r8,r0
	bf/s	.L0600FFAC
	mov	#2,r6
	mov	#3,r6
.L0600FFAC:
	mov	r5,r0
	and	r8,r0
	cmp/eq	r8,r0
	bf/s	.L0600FFB8
	mov	#2,r7
	mov	#3,r7
.L0600FFB8:
	shlr8	r4
	shlr8	r5
	exts.w	r4,r4
	exts.w	r5,r5
	mov.w	@r14+,r10
	mov.w	@r14+,r11
.L0600FFC4:
	mov	r4,r8
	mov	r6,r9
.L0600FFC8:
	mov	#-1,r0
	cmp/hs	r10,r8
	bt	.L0600FFE4
	cmp/hs	r11,r5
	bt	.L0600FFE4
	mov	r14,r13
	mov	r5,r12
	shll2	r12
	add	r12,r13
	mov.l	@r13,r13
	mov	r8,r12
	shll2	r12
	add	r12,r13
	mov.l	@r13,r0
.L0600FFE4:
	mov.l	r0,@r1
	add	#8,r1
	dt	r9
	bf/s	.L0600FFC8
	add	#1,r8
	dt	r7
	bf/s	.L0600FFC4
	add	#1,r5
	mov	#0,r0
	rts
	mov.l	r0,@r1
	endlabel func_0600FF90

	glabel func_0600FFFA
	mov.l	r3,@-r15
	mov.l	.L06010050,r4
	mov	#121,r6
	dlabel lbl_06010000
	mov	r4,r5
	mov	#-1,r0
	shll16	r0
.L06010006:
	mov.l	r0,@r5
	mov.l	r0,@(4,r5)
	dt	r6
	bf/s	.L06010006
	add	#8,r5
	mov.l	.L06010054,r1
	mov	#10,r7
	mov	r2,r0
	add	#-32,r0
	and	#224,r0
	shlr2	r0
	shlr2	r0
	shlr	r0
	mulu.w	r7,r0
	mov.l	@(84,gbr),r0
	sts	macl,r5
	add	r0,r5
	mov	r3,r0
	add	#-32,r0
	and	#224,r0
	shlr2	r0
	shlr2	r0
	mulu.w	r7,r0
	mov.l	@(88,gbr),r0
	sts	macl,r6
	add	r0,r6
.L0601003A:
	mov	r5,r7
.L0601003C:
	mov.b	@r7+,r0
	cmp/pz	r0
	bf	.L0601008A
	mov.l	@r1,r8
	add	#8,r1
	cmp/pz	r8
	bt	.L06010058
	bra	.L0601003C
	add	#2,r7
	.byte 0x00, 0x00
.L06010050:
	.long 0xC0000074
.L06010054:
	.long D_060DB32C
.L06010058:
	mov.b	@r7+,r9
	add	r0,r8
	add	r4,r9
	mov.w	@r6+,r0
	mov.w	@r6+,r10
	add	r0,r8
	add	r10,r9
	mov.b	@r7+,r12
	mov.w	@r6+,r13
.L0601006A:
	mov	r8,r10
	mov	r9,r11
	mov	r12,r14
.L06010070:
	mov.w	@r10+,r3
	mov.w	@r10+,r0
	mov.w	r3,@r11
	mov.w	r0,@(4,r11)
	dt	r14
	bf/s	.L06010070
	add	#8,r11
	add	#36,r8
	dt	r13
	bf/s	.L0601006A
	add	#88,r9
	bra	.L0601003C
	add	#-6,r6
.L0601008A:
	mov.w	@(6,r6),r0
	add	#6,r6
	cmp/pz	r0
	bt	.L0601003A
	rts
	mov.l	@r15+,r3
	endlabel func_0600FFFA

	glabel func_06010096
	sts.l	pr,@-r15
	mov.l	.L0601013C,r4
	mov.l	.L06010140,r1
	mov.w	@r4,r4
	mov.w	.L06010138,r13
	mov.w	.L0601013A,r14
	shar	r4
	mov	r3,r0
	and	#31,r0
	tst	r0,r0
	bt	.L060100B6
	add	#-32,r0
	neg	r0,r0
	mulu.w	r13,r0
	add	#88,r1
	sts	macl,r0
.L060100B6:
	mov	r0,r5
	mov	r2,r0
	and	#31,r0
	tst	r0,r0
	bt	.L060100CA
	add	#-32,r0
	neg	r0,r0
	mulu.w	r13,r0
	add	#8,r1
	sts	macl,r0
.L060100CA:
	mov	r0,r6
	mov.l	.L06010144,r13
	mov	#7,r12
.L060100D0:
	jsr	@r13
	mov	r5,r0
	shll2	r10
	dmuls.l	r4,r10
	add	r14,r5
	sts	macl,r9
	shlr16	r9
	exts.w	r9,r9
	sub	r4,r9
	neg	r9,r9
	shar	r9
	mov	r1,r7
	mov	r6,r8
	mov	#7,r11
.L060100EC:
	jsr	@r13
	mov	r8,r0
	mov.w	@r7,r0
	add	r14,r8
	cmp/pz	r0
	bf	.L0601010A
	shll2	r10
	dmuls.l	r9,r10
	sts	macl,r10
	shlr16	r10
	exts.w	r10,r10
	sub	r9,r10
	neg	r10,r10
	add	r10,r0
	mov.w	r0,@r7
.L0601010A:
	dt	r11
	bf/s	.L060100EC
	add	#8,r7
	dt	r12
	bf/s	.L060100D0
	add	#88,r1
	mov.l	.L06010148,r4
	mov.l	.L0601014C,r1
	mov.w	@r4,r14
	cmp/pz	r14
	bf	.L0601015C
.L06010120:
	mov.l	@r1,r4
	add	#8,r1
	cmp/pz	r4
	bf	.L06010120
	tst	r4,r4
	bt	.L0601015C
	add	#4,r4
	mov.w	@r4,r0
	cmp/gt	r0,r14
	bt	.L06010150
	bra	.L06010120
	mov.w	r14,@r4
.L06010138:
	.short 0x0125
.L0601013A:
	.short 0x2492
.L0601013C:
	.long D_060DB328
.L06010140:
	.long 0xC00000D8
.L06010144:
	.long math_cos
.L06010148:
	.long SH2_CACHE_DATA + 0x258
.L0601014C:
	.long D_060DB32C
.L06010150:
	add	#2,r4
	mov.w	@r4,r0
	cmp/gt	r14,r0
	bt	.L06010120
	bra	.L06010120
	mov.w	r14,@r4
.L0601015C:
	mov.l	r3,@-r15
	mov.l	.L06010178,r3
	mov	#88,r0
	mov	r3,r4
	add	r0,r4
	mov	r4,r5
	add	r0,r5
	mov	#9,r6
	bsr	func_06010204
	mov	#9,r7
	mov.l	@r15+,r3
	lds.l	@r15+,pr
	rts
	nop
.L06010178:
	.long 0xC0000074
	endlabel func_06010096

	glabel func_0601017C
	mov.l	.L060101BC,r1
	mov.l	.L060101C0,r4
	mov	#10,r7
	mov	r2,r0
	add	#-32,r0
	and	#224,r0
	shlr2	r0
	shlr2	r0
	shlr	r0
	mulu.w	r7,r0
	mov.l	@(92,gbr),r0
	sts	macl,r5
	add	r0,r5
	mov	r3,r0
	add	#-32,r0
	and	#224,r0
	shlr2	r0
	shlr2	r0
	mulu.w	r7,r0
	mov.l	@(96,gbr),r0
	sts	macl,r6
	add	r0,r6
.L060101A8:
	mov	r5,r7
.L060101AA:
	mov.b	@r7+,r0
	cmp/pz	r0
	bf	.L060101F8
	mov.l	@r1,r8
	add	#8,r1
	cmp/pz	r8
	bt	.L060101C4
	bra	.L060101AA
	add	#2,r7
.L060101BC:
	.long D_060DB32C
.L060101C0:
	.long 0xC0000074
.L060101C4:
	mov.b	@r7+,r9
	add	r0,r8
	add	r4,r9
	mov.w	@r6+,r0
	mov.w	@r6+,r10
	add	r0,r8
	add	r10,r9
	mov.b	@r7+,r12
	mov.w	@r6+,r13
.L060101D6:
	mov	r8,r10
	mov	r9,r11
	mov	r12,r14
.L060101DC:
	mov.w	@r11,r2
	mov.w	@(4,r11),r0
	mov.w	r2,@r10
	mov.w	r0,@(2,r10)
	add	#8,r11
	dt	r14
	bf/s	.L060101DC
	add	#4,r10
	add	#36,r8
	dt	r13
	bf/s	.L060101D6
	add	#88,r9
	bra	.L060101AA
	add	#-6,r6
.L060101F8:
	mov.w	@(6,r6),r0
	add	#6,r6
	cmp/pz	r0
	bt	.L060101A8
	rts
	nop
	endlabel func_0601017C

	glabel func_06010204
	sts.l	pr,@-r15
.L06010206:
	mov.l	r7,@-r15
	mov.l	r6,@-r15
.L0601020A:
	mov.l	@(12,r4),r0
	mov.l	@(4,r4),r11
	cmp/pz	r0
	bf	.L060102DE
	mov	r0,r13
	mov.l	@(12,r3),r10
	sub	r13,r11
	neg	r11,r11
	sub	r10,r13
	mov.l	@(12,r3),r9
	mov	r0,r10
	mov.l	@(20,r4),r12
	sub	r10,r9
	sub	r12,r10
	sub	r10,r11
	sub	r9,r13
	mov.l	@(12,r5),r9
	mov	r0,r10
	mov.l	@(4,r4),r12
	sub	r10,r9
	sub	r12,r10
	add	r10,r11
	add	r9,r13
	mov.l	@(20,r4),r9
	mov	r0,r10
	mov.l	@(12,r5),r12
	sub	r10,r9
	sub	r12,r10
	add	r9,r11
	sub	r10,r13
	shlr16	r11
	exts.w	r11,r11
	shll2	r11
	shll	r11
	mov	#-16,r12
	shll8	r12
	shlr16	r13
	muls.w	r11,r11
	exts.w	r13,r13
	sts	macl,r0
	muls.w	r12,r12
	shll2	r13
	sts	macl,r10
	shll	r13
	add	r10,r0
	muls.w	r13,r13
	mov.l	.L060102FC,r9
	sts	macl,r10
	jsr	@r9
	add	r10,r0
	shll16	r11
	mov	#-1,r10
	shll8	r10
	mov.l	r0,@(0,r10)
	mov.l	r11,@(4,r10)
	mov.l	.L06010300,r9
	shll16	r12
	mov.l	@r9,r9
	shll16	r13
	mov.l	@r9+,r7
	mov.l	@r9+,r8
	mov.l	@r9,r9
	mov.l	@(28,r10),r11
	mov.l	r0,@(0,r10)
	mov.l	r12,@(4,r10)
	dmuls.l	r7,r11
	sts	mach,r7
	sts	macl,r11
	mov.l	@(28,r10),r12
	mov.l	r0,@(0,r10)
	mov.l	r13,@(4,r10)
	dmuls.l	r8,r12
	sts	mach,r8
	sts	macl,r12
	clrt
	addc	r12,r11
	addc	r8,r7
	mov.l	.L06010304,r12
	mov.l	@(80,gbr),r0
	mov.l	@r12,r12
	mov	r0,r8
	mov.l	@(28,r10),r13
	dmuls.l	r9,r13
	sts	mach,r9
	sts	macl,r13
	clrt
	addc	r13,r11
	mov.w	@(8,r4),r0
	addc	r9,r7
	cmp/pz	r0
	bf	.L060102DE
	xtrct	r7,r11
	mov.l	.L06010308,r7
	mov	#1,r0
	shll16	r0
	add	r11,r0
	mov.w	@r7,r11
	shlr8	r0
	tst	r11,r11
	bt	.L060102D4
	mov	#64,r11
.L060102D4:
	shlr	r0
	mov.b	@(r0,r8),r0
	add	r11,r0
	mov.w	@(r0,r12),r0
	mov.w	r0,@(8,r4)
.L060102DE:
	add	#8,r3
	add	#8,r4
	dt	r6
	bf/s	.L0601020A
	add	#8,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	add	#16,r3
	add	#16,r4
	dt	r7
	bf/s	.L06010206
	add	#16,r5
	lds.l	@r15+,pr
.L060102F8:
	rts
	nop
.L060102FC:
	.long math_sqrt
.L06010300:
	.long D_060DB300
.L06010304:
	.long D_060DB304
.L06010308:
	.long D_060DB55C
	endlabel func_06010204
