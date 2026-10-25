	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06030098,"ax",@progbits
	.p2align 2

	glabel func_06030098
	sts.l	pr,@-r15
	mov	#64,r2
	add	r1,r2
	mov.l	.L060300EC,r3
	mov.b	@(0,r2),r0
	shll2	r0
	mov.l	@(r0,r3),r0
	jsr	@r0
	nop
	mov	r0,r8
	mov.w	@(210,gbr),r0
	tst	#1,r0
	bf	.L060300DE
	cmp/pz	r8
	bt	.L060300DE
	mov.l	.L060300F0,r0
	jsr	@r0
	nop
	mov.l	.L060300F4,r3
	and	#7,r0
	shll2	r0
	mov.l	@(r0,r3),r0
	jsr	@r0
	nop
	mov	#64,r2
	add	r1,r2
	mov.l	.L060300F0,r0
	jsr	@r0
	nop
	and	#3,r0
	cmp/eq	#0,r0
	mov.w	.L060300E8,r0
	bf	.L060300DC
	mov.w	.L060300EA,r0
.L060300DC:
	mov.w	r0,@(2,r2)
.L060300DE:
	bsr	func_06030198
	nop
	lds.l	@r15+,pr
	rts
	nop
.L060300E8:
	.short 0x0258
.L060300EA:
	.short 0x0168
.L060300EC:
	.long D_060300F8
.L060300F0:
	.long func_06007B96
.L060300F4:
	.long D_0603010C
	dlabel D_060300F8
	.long func_0603012C
	.long D_0603013A
	.long D_06030144
	.long D_06030150
	.long D_0603015C
	dlabel D_0603010C
	.long func_060301DC
	.long func_060301DC
	.long func_060301E8
	.long func_060301E8
	.long func_060301E8
	.long func_060301FC
	.long func_06030210
	.long func_06030224
	endlabel func_06030098

	glabel func_0603012C
	mov.w	@(2,r2),r0
	add	#-1,r0
	cmp/pz	r0
	bf	.L06030136
	mov.w	r0,@(2,r2)
.L06030136:
	bra	func_0603018A
	nop
	dlabel D_0603013A
	.byte 0xD8, 0x01, 0xA0, 0x14, 0x00, 0x09, 0x02, 0x60, 0x00, 0x00
	dlabel D_06030144
	.byte 0xD8, 0x01, 0xA0, 0x0F, 0x00, 0x09, 0x00, 0x00, 0x01, 0xE0, 0x00, 0x00
	dlabel D_06030150
	.byte 0xD8, 0x01, 0xA0, 0x09, 0x00, 0x09, 0x00, 0x00, 0x01, 0x60, 0x00, 0x00
	dlabel D_0603015C
	.byte 0xD8, 0x01, 0xA0, 0x03, 0x00, 0x09, 0x00, 0x00, 0x02, 0x60, 0x00, 0x00
	endlabel func_0603012C

	glabel func_06030168
	sts.l	pr,@-r15
	mov.l	.L06030178,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bt	.L0603017C
	bra	.L06030180
	mov	#-1,r0
.L06030178:
	.long func_060172DE
.L0603017C:
	bsr	func_0603018A
	nop
.L06030180:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0xA0, 0x00, 0x00, 0x09
	endlabel func_06030168

	glabel func_0603018A
	mov.w	@(2,r2),r0
	add	#-1,r0
	cmp/pz	r0
	bf	.L06030194
	mov.w	r0,@(2,r2)
.L06030194:
	rts
	nop
	endlabel func_0603018A

	glabel func_06030198
	sts.l	pr,@-r15
	mov.l	.L060301B8,r0
	mov.w	@r0,r0
	mov.w	.L060301B6,r8
	sub	r0,r8
	mov	r8,r0
	mov.l	.L060301BC,r2
.L060301A6:
	mov.l	@r2+,r8
	cmp/pz	r8
	bf	.L060301CA
	cmp/eq	r8,r0
	bt	.L060301C0
	add	#4,r2
	bra	.L060301A6
	add	#4,r8
.L060301B6:
	.short 0x1482
.L060301B8:
	.long D_060D9076
.L060301BC:
	.long D_060301D0
.L060301C0:
	mov.l	@r2+,r0
	mov	#64,r2
	add	r1,r2
	jsr	@r0
	nop
.L060301CA:
	lds.l	@r15+,pr
	rts
	nop
	dlabel D_060301D0
	.byte 0x00, 0x00, 0x00, 0x08
	.long func_060301FC
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	endlabel func_06030198

	glabel func_060301DC
	mov	#0,r0
	mov.b	r0,@(4,r1)
	mov	#0,r0
	mov.b	r0,@(0,r2)
	rts
	nop
	endlabel func_060301DC

	glabel func_060301E8
	mov	#1,r0
	mov.b	r0,@(4,r1)
	mov	#1,r0
	mov.b	r0,@(0,r2)
	mov.l	.L060301F8,r6
	bra	func_06030B7E
	nop
	.byte 0x00, 0x00
.L060301F8:
	.long 0x02000000
	endlabel func_060301E8

	glabel func_060301FC
	mov	#1,r0
	mov.b	r0,@(4,r1)
	mov	#2,r0
	mov.b	r0,@(0,r2)
	mov.l	.L0603020C,r6
	bra	func_06030B7E
	nop
	.byte 0x00, 0x00
.L0603020C:
	.long 0x01800000
	endlabel func_060301FC

	glabel func_06030210
	mov	#1,r0
	mov.b	r0,@(4,r1)
	mov	#3,r0
	mov.b	r0,@(0,r2)
	mov.l	.L06030220,r6
	bra	func_06030B7E
	nop
	.byte 0x00, 0x00
.L06030220:
	.long 0x01000000
	endlabel func_06030210

	glabel func_06030224
	mov	#1,r0
	mov.b	r0,@(4,r1)
	mov	#4,r0
	mov.b	r0,@(0,r2)
	bra	func_06030C70
	nop
	endlabel func_06030224

	glabel func_06030230
	sts.l	pr,@-r15
	mov.l	.L06030248,r7
	mov.l	@r7,r7
	mov.w	@(22,r7),r0
	mov	r0,r9
	mov.w	@(22,r1),r0
	mov	r0,r8
	mov.w	@(0,r7),r0
	cmp/pz	r0
	bt	.L0603024C
	bra	.L06030254
	mov	r9,r8
.L06030248:
	.long D_060F30A4
.L0603024C:
	mov	r0,r10
	mov.l	.L0603029C,r0
	jsr	@r0
	nop
.L06030254:
	mov	r8,r0
	mov.l	.L060302A0,r14
	jsr	@r14
	mov.w	r0,@(22,r1)
	mov	r10,r0
	mov.w	r0,@(180,gbr)
	mov	r11,r0
	mov.w	r0,@(184,gbr)
	mov.w	@(2,r7),r0
	shll16	r0
	mov.l	lbl_06030340,r8
	dmuls.l	r8,r0
	sts	mach,r8
	sts	macl,r0
	xtrct	r8,r0
	mov	#0,r4
	mov	#0,r5
	mov	r0,r6
	mov.l	.L060302A4,r0
	jsr	@r0
	nop
	mov.l	@(52,r7),r0
	sub	r5,r0
	mov.l	r0,@(52,r1)
	mov.l	@(56,r7),r0
	sub	r6,r0
	mov.l	r0,@(56,r1)
	mov.w	@(24,r7),r0
	mov	r0,r9
	mov.w	@(24,r1),r0
	mov	r0,r8
	mov.w	@(0,r7),r0
	cmp/pz	r0
	bt	.L060302A8
	bra	.L060302B0
	mov	r9,r8
.L0603029C:
	.long func_06031E00
.L060302A0:
	.long func_06007BD8
.L060302A4:
	.long func_06017B52
.L060302A8:
	mov	r0,r10
	mov.l	.L06030320,r0
	jsr	@r0
	nop
.L060302B0:
	mov	r8,r0
	mov.l	.L06030324,r14
	jsr	@r14
	mov.w	r0,@(24,r1)
	mov	r10,r0
	mov.w	r0,@(172,gbr)
	mov	r11,r0
	mov.w	r0,@(176,gbr)
	mov.l	@(56,r7),r6
	mov.l	@(56,r1),r0
	sub	r0,r6
	mov	#0,r4
	mov	#0,r5
	mov.l	.L06030328,r0
	jsr	@r0
	nop
	mov.l	@(56,r7),r0
	sub	r6,r0
	mov.l	r0,@(56,r1)
	mov.l	@(48,r7),r0
	add	r4,r0
	mov.l	r0,@(48,r1)
	mov.l	@(48,r1),r0
	mov.l	r0,@(160,gbr)
	mov.l	@(52,r1),r0
	mov.l	r0,@(164,gbr)
	mov.l	@(56,r1),r0
	mov.l	r0,@(168,gbr)
	mov.w	@(22,r1),r0
	mov.w	r0,@(192,gbr)
	mov.w	@(24,r1),r0
	mov.w	r0,@(194,gbr)
	mov.l	.L0603032C,r0
	jsr	@r0
	nop
	mov.l	.L06030330,r0
	jsr	@r0
	nop
	mov.l	.L06030334,r14
	jsr	@r14
	mov.w	@(22,r1),r0
	mov.w	@(24,r1),r0
	mov.l	.L06030338,r14
	jsr	@r14
	neg	r0,r0
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	neg	r4,r4
	neg	r5,r5
	mov.l	.L0603033C,r14
	jsr	@r14
	neg	r6,r6
	lds.l	@r15+,pr
	rts
	nop
.L06030320:
	.long func_06031E00
.L06030324:
	.long func_06007BD8
.L06030328:
	.long func_06017B7C
.L0603032C:
	.long func_0600CA4E
.L06030330:
	.long func_0600C9F2
.L06030334:
	.long func_0600CA7A
.L06030338:
	.long func_0600CAF8
.L0603033C:
	.long func_0600CBDA
	dlabel lbl_06030340
	.long 0x00010000
	endlabel func_06030230

	glabel func_06030344
	mov.b	@(4,r1),r0
	cmp/eq	#2,r0
	bf	.L06030354
	mov.l	.L06030350,r0
	jmp	@r0
	nop
.L06030350:
	.long func_06030230
.L06030354:
	sts.l	pr,@-r15
	mov.b	@(107,gbr),r0
	tst	r0,r0
	bf	.L06030360
	bra	.L06030378
	nop
.L06030360:
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bt	.L0603036A
	bra	.L0603036E
	nop
.L0603036A:
	bra	.L06030378
	nop
.L0603036E:
	mov.l	.L0603040C,r4
	mov.l	@r4,r4
	mov.l	r4,@(16,r1)
	bsr	func_06030098
	nop
.L06030378:
	mov.l	.L06030410,r2
	mov.b	@(20,gbr),r0
	mov.b	@(r0,r2),r0
	mov.b	r0,@(5,r1)
	mov.l	.L06030414,r4
	mov.l	.L0603040C,r2
	mov.b	@(31,gbr),r0
	shll2	r0
	add	r0,r2
	mov.l	@r2,r0
	mov.l	r0,@r4
	mov.b	@(20,gbr),r0
	cmp/eq	#1,r0
	bt	.L060303C2
	cmp/eq	#3,r0
	bt	.L060303C2
	cmp/eq	#5,r0
	bt	.L060303C2
	cmp/eq	#9,r0
	bt	.L060303C2
	cmp/eq	#11,r0
	bt	.L060303C2
	cmp/eq	#13,r0
	bt	.L060303C2
	cmp/eq	#15,r0
	bt	.L060303C2
	mov.l	.L06030418,r4
	mov.l	.L0603040C,r2
	mov.b	@(31,gbr),r0
	add	#-1,r0
	cmp/pz	r0
	bt	.L060303BA
	mov.b	@(30,gbr),r0
.L060303BA:
	shll2	r0
	add	r0,r2
	mov.l	@r2,r0
	mov.l	r0,@r4
.L060303C2:
	mov.l	.L0603041C,r0
	jsr	@r0
	nop
	mov.l	.L06030420,r0
	jsr	@r0
	nop
	mov.l	.L06030414,r4
	mov.l	@r4,r4
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L060303DC
	mov.l	.L0603040C,r4
	mov.l	@r4,r4
.L060303DC:
	mov.l	r4,@(16,r1)
	mov.w	@(210,gbr),r0
	tst	#1,r0
	bf	.L060303F2
	mov.l	.L0603040C,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L060303F2
	mov	#0,r0
	mov.w	r0,@(12,r1)
.L060303F2:
	mov.l	@(16,r1),r4
	mov	#0,r5
	mov	#0,r6
	mov	#0,r7
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bf	.L06030430
	mov.b	@(4,r1),r0
	cmp/eq	#1,r0
	bf	.L06030428
	mov.l	.L06030424,r0
	jmp	@r0
	nop
.L0603040C:
	.long D_060F3064
.L06030410:
	.long D_06030054
.L06030414:
	.long D_060F30A0
.L06030418:
	.long D_060F3098
.L0603041C:
	.long func_0600CA4E
.L06030420:
	.long func_0600C9F2
.L06030424:
	.long func_060310C4
.L06030428:
	bsr	func_06030CA4
	nop
	bra	.L06030430
	nop
.L06030430:
	mov.w	@(210,gbr),r0
	tst	#2,r0
	bt	.L06030444
	mov.l	@(196,gbr),r0
	add	r0,r5
	mov.l	@(200,gbr),r0
	add	r0,r6
	mov.l	@(204,gbr),r0
	bra	.L060304D0
	add	r0,r7
.L06030444:
	mov.w	@(210,gbr),r0
	tst	#4,r0
	bt	.L06030474
	mov.l	.L06030470,r8
	mov.l	@r8,r8
	mov.l	@(48,r4),r0
	mov.l	@(48,r8),r0
	shar	r0
	mov.l	r0,@(196,gbr)
	add	r0,r5
	mov.l	@(52,r4),r0
	mov.l	@(52,r8),r0
	shar	r0
	mov.l	r0,@(200,gbr)
	add	r0,r6
	mov.l	@(56,r4),r0
	mov.l	@(56,r8),r0
	shar	r0
	mov.l	r0,@(204,gbr)
	bra	.L060304C0
	add	r0,r7
	.byte 0x00, 0x00
.L06030470:
	.long D_060F3068
.L06030474:
	mov.b	@(4,r1),r0
	cmp/eq	#3,r0
	bf	.L06030482
	bsr	func_06030DB8
	nop
	bra	.L060304C0
	nop
.L06030482:
	mov.l	@(48,r4),r0
	mov.l	r0,@(196,gbr)
	add	r0,r5
	mov.l	@(52,r4),r0
	mov.l	r0,@(200,gbr)
	add	r0,r6
	mov.l	@(56,r4),r0
	mov.l	r0,@(204,gbr)
	add	r0,r7
	bra	.L060304C0
	nop
	.byte 0xD8, 0x1F, 0x68, 0x82, 0x50, 0x4C, 0x59, 0x8C, 0x30, 0x9C, 0x40, 0x21, 0xC2, 0x31, 0x35, 0x0C
	.byte 0x50, 0x4D, 0x59, 0x8D, 0x30, 0x9C, 0x40, 0x21, 0xC2, 0x32, 0x36, 0x0C, 0x50, 0x4E, 0x59, 0x8E
	.byte 0x30, 0x9C, 0x40, 0x21, 0xC2, 0x33, 0x37, 0x0C
.L060304C0:
	mov.l	.L0603051C,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	mov	#0,r0
	bf	.L060304CE
	mov.w	@(24,r4),r0
.L060304CE:
	mov.w	r0,@(208,gbr)
.L060304D0:
	mov.l	r5,@(32,r1)
	mov.l	r6,@(36,r1)
	mov.l	r7,@(40,r1)
	bsr	func_0603098C
	nop
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bf	.L06030520
	mov.l	.L0603051C,r4
	mov.l	@r4,r4
	mov.b	@(6,r4),r0
	cmp/eq	#1,r0
	bt	.L060304EE
	cmp/eq	#2,r0
	bf	.L06030520
.L060304EE:
	mov	#0,r0
	mov.b	r0,@(6,r1)
	mov	#0,r0
	mov.w	r0,@(28,r1)
	bsr	func_06030894
	nop
	mov.l	.L0603051C,r4
	mov.l	@r4,r4
	mov.l	@(52,r4),r6
	mov	#-32,r0
	shll16	r0
	add	r0,r6
	mov	#-96,r0
	shll16	r0
	add	r0,r5
	mov	#4,r8
	cmp/ge	r6,r5
	bt	.L06030534
	mov	r5,r6
	bra	.L06030532
	nop
	.long D_060F3068
.L0603051C:
	.long D_060F3064
.L06030520:
	mov.l	.L06030550,r2
	mov.b	@(20,gbr),r0
	shll2	r0
	mov.l	@(r0,r2),r2
	jsr	@r2
	nop
	mov.b	@(5,r1),r0
	tst	r0,r0
	bt	.L0603057A
.L06030532:
	mov	#8,r8
.L06030534:
	mov	r6,r0
	mov.l	.L06030554,r6
	mov.l	@r6,r6
	shll16	r8
	cmp/eq	r0,r6
	bt	.L06030560
	cmp/gt	r0,r6
	bf	.L06030558
	sub	r8,r6
	cmp/ge	r0,r6
	bt	.L06030560
	bra	.L06030560
	mov	r0,r6
	.byte 0x00, 0x00
.L06030550:
	.long func_06031298
.L06030554:
	.long D_0602FF34
.L06030558:
	add	r8,r6
	cmp/gt	r0,r6
	bf	.L06030560
	mov	r0,r6
.L06030560:
	mov	r0,r9
	sub	r6,r9
	cmp/pz	r9
	bt	.L0603056A
	neg	r9,r9
.L0603056A:
	mov.l	.L0603059C,r10
	cmp/ge	r10,r9
	bf	.L0603057A
	cmp/ge	r6,r0
	bt	.L06030576
	neg	r10,r10
.L06030576:
	sub	r10,r0
	mov	r0,r6
.L0603057A:
	mov.l	.L060305A0,r0
	mov.l	r6,@r0
	mov.l	@(36,r1),r3
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L060305AE
	mov.l	@(44,r1),r0
	sub	r0,r3
	mov	#16,r7
	shll16	r7
	cmp/ge	r7,r3
	bf	.L060305A4
	mov.l	@(36,r1),r3
	sub	r7,r3
	bra	.L060305B0
	mov.l	r3,@(44,r1)
	.byte 0x00, 0x00
.L0603059C:
	.long 0x01000000
.L060305A0:
	.long D_0602FF34
.L060305A4:
	neg	r7,r7
	cmp/gt	r7,r3
	bt	.L060305B0
	mov.l	@(36,r1),r3
	sub	r7,r3
.L060305AE:
	mov.l	r3,@(44,r1)
.L060305B0:
	mov.l	@(44,r1),r3
	mov.l	@(40,r1),r7
	mov	r3,r6
	mov.l	.L0603060C,r2
	mov.l	@r2,r2
	sub	r2,r3
	mov.l	.L06030610,r2
	mov.l	@r2,r2
	mov.l	.L06030614,r12
	mov.l	@r12,r12
	add	#6,r12
	mov.b	@r12,r0
	tst	r0,r0
	bt	.L060305DC
	mov.w	@(2,r1),r0
	shll16	r0
	mov.l	lbl_06030890,r8
	dmuls.l	r8,r0
	sts	mach,r8
	sts	macl,r0
	xtrct	r8,r0
	mov	r0,r2
.L060305DC:
	mov.l	.L06030618,r10
	jsr	@r10
	nop
	exts.w	r0,r0
	mov.b	@r12,r12
	tst	r12,r12
	bf	.L060305FA
	mov.w	.L06030608,r3
	cmp/ge	r3,r0
	bf	.L060305F2
	mov	r3,r0
.L060305F2:
	neg	r3,r3
	cmp/ge	r3,r0
	bt	.L060305FA
	mov	r3,r0
.L060305FA:
	mov	r0,r3
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L0603061C
	mov.w	@(28,r1),r0
	dlabel lbl_06030604
	bra	.L06030630
	add	r3,r0
.L06030608:
	.short 0x2000
	.byte 0x00, 0x00
.L0603060C:
	.long D_0602FF34
.L06030610:
	.long D_0602FF38
.L06030614:
	.long D_060F3064
.L06030618:
	.long func_06007C1C
.L0603061C:
	mov.w	@(28,r1),r0
	add	r3,r0
	mov	r0,r9
	mov.w	@(22,r1),r0
	mov	r0,r8
	mov.w	.L0603067C,r10
	mov.l	.L06030680,r0
	jsr	@r0
	nop
	mov	r8,r0
.L06030630:
	mov.l	.L06030684,r14
	jsr	@r14
	mov.w	r0,@(22,r1)
	mov	r10,r0
	mov.w	r0,@(180,gbr)
	mov	r11,r0
	mov.w	r0,@(184,gbr)
	shll2	r10
	shll8	r10
	shll2	r11
	shll8	r11
	mov.w	@(2,r1),r0
	shll8	r0
	mov.l	lbl_06030890,r8
	dmuls.l	r8,r0
	sts	mach,r8
	sts	macl,r0
	xtrct	r8,r0
	dmuls.l	r0,r10
	sts	mach,r9
	sts	macl,r10
	xtrct	r9,r10
	sub	r10,r6
	sub	r11,r7
	mov.l	@(8,r1),r0
	add	r6,r0
	mov.l	r0,@(52,r1)
	mov	r7,r0
	mov.l	r0,@(56,r1)
	mov.b	@(20,gbr),r0
	cmp/eq	#5,r0
	bf	.L06030690
	mov.l	.L06030688,r11
	mov.l	@r11,r11
	tst	r11,r11
	bf	.L0603068C
	bra	.L06030780
	nop
.L0603067C:
	.short 0x0200
	.byte 0x00, 0x00
.L06030680:
	.long func_06031E00
.L06030684:
	.long func_06007BD8
.L06030688:
	.long D_0602FF4C
.L0603068C:
	bra	.L060306BE
	nop
.L06030690:
	cmp/eq	#11,r0
	bf	.L06030698
	bra	.L06030780
	nop
.L06030698:
	cmp/eq	#9,r0
	bf	.L060306B0
	mov.l	.L060306AC,r4
	mov.l	@r4,r4
	mov	#31,r0
	mov.b	@(r0,r4),r0
	cmp/eq	#0,r0
	bt	.L060306B4
	bra	.L06030780
	nop
.L060306AC:
	.long D_060F3064
.L060306B0:
	tst	#1,r0
	bt	.L06030780
.L060306B4:
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bf	.L06030780
	mov.l	.L06030774,r11
	mov.l	@r11,r11
.L060306BE:
	mov.l	@(48,r11),r3
	mov.l	@(56,r11),r2
	mov	#0,r5
	mov.w	.L06030764,r7
	shll16	r7
	mov.w	@(24,r11),r0
	mov.l	.L06030778,r14
	jsr	@r14
	neg	r0,r0
	shll2	r10
	shll2	r11
	dmuls.l	r10,r5
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	dmuls.l	r11,r5
	sts	mach,r0
	sts	macl,r5
	xtrct	r0,r5
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r7
	xtrct	r0,r7
	sub	r9,r5
	add	r8,r7
	add	r5,r3
	add	r7,r2
	mov.l	@(196,gbr),r0
	sub	r0,r3
	mov.l	@(204,gbr),r0
	sub	r0,r2
	mov.w	@(208,gbr),r0
	mov	r0,r12
	mov.l	.L0603077C,r0
	jsr	@r0
	nop
	extu.w	r0,r0
	extu.w	r12,r12
	sub	r12,r0
	tst	r0,r0
	bt	.L06030758
	cmp/pz	r0
	bt	.L0603071E
	extu.w	r0,r0
.L0603071E:
	exts.w	r0,r9
	mov.w	.L06030766,r5
	mov.b	@(20,gbr),r0
	cmp/eq	#3,r0
	bf	.L0603072A
	mov.w	.L06030768,r5
.L0603072A:
	cmp/eq	#5,r0
	bf	.L06030730
	mov.w	.L0603076A,r5
.L06030730:
	cmp/eq	#13,r0
	bt	.L06030738
	cmp/eq	#15,r0
	bf	.L0603073A
.L06030738:
	mov.w	.L0603076C,r5
.L0603073A:
	cmp/eq	#7,r0
	bf	.L06030748
	mov.w	.L0603076E,r5
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L06030748
	mov.w	.L06030770,r5
.L06030748:
	mov	r9,r0
	cmp/ge	r5,r0
	bf	.L06030750
	mov	r5,r0
.L06030750:
	neg	r5,r5
	cmp/gt	r5,r0
	bt	.L06030758
	mov	r5,r0
.L06030758:
	add	r12,r0
	mov	r0,r5
	mov.w	@(12,r1),r0
	add	r5,r0
	bra	.L0603078C
	nop
.L06030764:
	.short 0x0080
.L06030766:
	.short 0x2000
.L06030768:
	.short 0x1D00
.L0603076A:
	.short 0x1000
.L0603076C:
	.short 0x2800
.L0603076E:
	.short 0x1200
.L06030770:
	.short 0x0C00
	.byte 0x00, 0x00
.L06030774:
	.long D_060F3098
.L06030778:
	.long func_06007BD8
.L0603077C:
	.long func_06007C1C
.L06030780:
	mov.w	@(12,r1),r0
	mov	r0,r5
	mov.w	@(20,r1),r0
	add	r0,r5
	mov.w	@(208,gbr),r0
	add	r5,r0
.L0603078C:
	mov	r0,r9
	mov.b	@(20,gbr),r0
	cmp/eq	#5,r0
	bt	.L0603079C
	tst	#1,r0
	bt	.L0603079C
	bra	.L060307CC
	mov	r9,r8
.L0603079C:
	mov.w	@(24,r1),r0
	mov	r0,r8
	extu.w	r8,r8
	extu.w	r9,r9
	sub	r8,r9
	tst	r9,r9
	bt	.L060307CC
	cmp/pz	r9
	bt	.L060307B0
	extu.w	r9,r9
.L060307B0:
	exts.w	r9,r9
	cmp/pl	r9
	bf	.L060307C0
	mov.w	@(0,r1),r0
	cmp/ge	r9,r0
	bf	.L060307CA
	bra	.L060307CA
	mov	r9,r0
.L060307C0:
	mov.w	@(0,r1),r0
	neg	r0,r0
	cmp/ge	r9,r0
	bt	.L060307CA
	mov	r9,r0
.L060307CA:
	add	r0,r8
.L060307CC:
	mov	r8,r0
	mov	r0,r5
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L060307D6
.L060307D6:
	mov	r5,r0
	mov.w	r0,@(24,r1)
	mov.l	.L0603087C,r14
	jsr	@r14
	nop
	mov	r10,r0
	mov.w	r0,@(172,gbr)
	mov	r11,r0
	mov.w	r0,@(176,gbr)
	mov	#0,r12
	mov.l	@(56,r1),r14
	mov.l	@(40,r1),r0
	sub	r0,r14
	swap.w	r14,r14
	exts.w	r14,r14
	muls.w	r10,r12
	sts	macl,r8
	muls.w	r10,r14
	sts	macl,r9
	muls.w	r11,r14
	sts	macl,r14
	muls.w	r11,r12
	sts	macl,r12
	sub	r9,r12
	add	r8,r14
	shll2	r12
	shll2	r14
	mov.w	@(2,r1),r0
	shll8	r0
	mov.l	lbl_06030890,r8
	dmuls.l	r8,r0
	sts	mach,r8
	sts	macl,r0
	xtrct	r8,r0
	dmuls.l	r0,r12
	sts	mach,r5
	sts	macl,r12
	xtrct	r5,r12
	dmuls.l	r0,r14
	sts	mach,r6
	sts	macl,r14
	xtrct	r6,r14
	mov.l	@(32,r1),r5
	mov.l	@(40,r1),r6
	sub	r12,r5
	add	r14,r6
	mov.l	r5,@(48,r1)
	mov.l	r6,@(56,r1)
	mov.l	@(48,r1),r0
	mov.l	r0,@(160,gbr)
	mov.l	@(52,r1),r0
	mov.l	r0,@(164,gbr)
	mov.l	@(56,r1),r0
	mov.l	r0,@(168,gbr)
	mov.w	@(22,r1),r0
	mov.w	r0,@(192,gbr)
	mov.w	@(24,r1),r0
	mov.w	r0,@(194,gbr)
	mov.l	@(16,r1),r6
	bsr	func_06030ED4
	nop
	mov	#0,r0
	mov.l	.L06030880,r11
	mov.l	r0,@r11
	mov.l	.L06030884,r14
	jsr	@r14
	mov.w	@(22,r1),r0
	mov.w	@(24,r1),r0
	mov.l	.L06030888,r14
	jsr	@r14
	neg	r0,r0
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	neg	r4,r4
	neg	r5,r5
	mov.l	.L0603088C,r14
	jsr	@r14
	neg	r6,r6
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0603087C:
	.long func_06007BD8
.L06030880:
	.long D_0602FF4C
.L06030884:
	.long func_0600CA7A
.L06030888:
	.long func_0600CAF8
.L0603088C:
	.long func_0600CBDA
	dlabel lbl_06030890
	.long 0x00010000
	endlabel func_06030344

	glabel func_06030894
	sts.l	pr,@-r15
	mov.w	@(12,r1),r0
	mov	r0,r5
	mov.w	@(20,r1),r0
	add	r0,r5
	mov.w	@(208,gbr),r0
	add	r5,r0
	mov	r0,r9
	mov.w	@(24,r1),r0
	mov	r0,r8
	extu.w	r8,r8
	extu.w	r9,r9
	sub	r8,r9
	tst	r9,r9
	bt	.L060308D4
	cmp/pz	r9
	bt	.L060308B8
	extu.w	r9,r9
.L060308B8:
	exts.w	r9,r9
	cmp/pl	r9
	bf	.L060308C8
	mov.w	@(0,r1),r0
	cmp/ge	r9,r0
	bf	.L060308D2
	bra	.L060308D2
	mov	r9,r0
.L060308C8:
	mov.w	@(0,r1),r0
	neg	r0,r0
	cmp/ge	r9,r0
	bt	.L060308D2
	mov	r9,r0
.L060308D2:
	add	r0,r8
.L060308D4:
	mov	r8,r0
	mov.l	.L0603091C,r14
	jsr	@r14
	nop
	mov.l	.L06030920,r12
	mov.l	.L06030924,r13
.L060308E0:
	mov.w	@r13+,r5
	cmp/pz	r5
	bf	.L06030928
	mov.w	@r13+,r6
	bsr	func_06030950
	nop
	mov.l	@(32,r1),r2
	mov.l	@(40,r1),r3
	sub	r5,r2
	add	r6,r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	@(36,r1),r4
	sub	r4,r5
	mov.w	@r13+,r0
	cmp/pz	r5
	bt	.L0603090E
	shll8	r0
	dmuls.l	r0,r5
	sts	mach,r0
	sts	macl,r5
	xtrct	r0,r5
.L0603090E:
	add	r4,r5
	cmp/ge	r12,r5
	bt	.L06030916
	mov	r5,r12
.L06030916:
	bra	.L060308E0
	nop
	.byte 0x00, 0x00
.L0603091C:
	.long func_06007BD8
.L06030920:
	.long 0x70000000
.L06030924:
	.long D_06030930
.L06030928:
	mov	r12,r5
	lds.l	@r15+,pr
	rts
	nop
	dlabel D_06030930
	.byte 0x00, 0x00, 0xFF, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF, 0x80, 0x04, 0x00, 0x00, 0x58, 0xFF, 0x80
	.byte 0x04, 0x00, 0xFF, 0xA8, 0xFF, 0x80, 0x04, 0x00, 0x00, 0x00, 0xFF, 0xC0, 0x08, 0x00, 0xFF, 0xFF
	endlabel func_06030894

	glabel func_06030950
	muls.w	r10,r5
	sts	macl,r8
	muls.w	r10,r6
	sts	macl,r9
	muls.w	r11,r6
	sts	macl,r6
	muls.w	r11,r5
	sts	macl,r5
	sub	r9,r5
	add	r8,r6
	shll2	r5
	shll2	r6
	mov.w	@(2,r1),r0
	shll8	r0
	mov.l	lbl_06030988,r3
	dmuls.l	r3,r0
	sts	mach,r3
	sts	macl,r0
	xtrct	r3,r0
	dmuls.l	r0,r5
	sts	mach,r8
	sts	macl,r5
	xtrct	r8,r5
	dmuls.l	r0,r6
	sts	mach,r8
	sts	macl,r6
	rts
	xtrct	r8,r6
	dlabel lbl_06030988
	.long 0x00010000
	endlabel func_06030950

	glabel func_0603098C
	sts.l	pr,@-r15
	mov.b	@(7,r1),r0
	cmp/eq	#1,r0
	bf	.L06030A5C
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bf	.L06030A5C
	mov.w	.L06030A3A,r9
	mov	#-100,r11
	shll16	r11
	mov.w	.L06030A3C,r12
	shll16	r12
	mov.w	.L06030A3E,r13
	mov.w	@(12,r1),r0
	sub	r0,r9
	mov.b	@(6,r1),r0
	cmp/eq	#1,r0
	bt	.L060309BA
	mov	#0,r9
	mov	#0,r11
	mov.w	.L06030A40,r12
	shll16	r12
	mov.w	.L06030A42,r13
.L060309BA:
	mov.w	@(20,r1),r0
	mov	r0,r8
	mov.w	.L06030A44,r10
	mov.l	.L06030A48,r0
	jsr	@r0
	nop
	mov	r0,r14
	mov	r8,r0
	mov.w	r0,@(20,r1)
	mov.b	@(20,gbr),r0
	cmp/eq	#2,r0
	bf	.L06030A2E
	mov.l	@(8,r1),r8
	mov	r11,r9
	mov	#1,r10
	shll16	r10
	mov.l	.L06030A4C,r0
	jsr	@r0
	nop
	and	r0,r14
	mov.l	r8,@(8,r1)
	mov.b	@(6,r1),r0
	cmp/eq	#1,r0
	bf	.L06030A02
	mov.l	.L06030A50,r4
	mov.l	@r4,r4
	mov.l	.L06030A54,r0
	mov.l	@(60,r4),r4
	cmp/ge	r0,r4
	bf	.L06030A2E
	mov.l	.L06030A58,r0
	cmp/ge	r0,r4
	bf	.L06030A02
	mov.w	.L06030A40,r12
	shll16	r12
	mov.w	.L06030A42,r13
.L06030A02:
	mov.l	@(784,gbr),r0
	mov	r0,r8
	mov	r12,r9
	mov	#32,r10
	shll16	r10
	mov.l	.L06030A4C,r0
	jsr	@r0
	nop
	and	r0,r14
	mov	r8,r0
	mov.l	r0,@(784,gbr)
	mov.l	r0,@(788,gbr)
	mov.w	@(136,gbr),r0
	mov	r0,r8
	mov	r13,r9
	mov	#32,r10
	mov.l	.L06030A4C,r0
	jsr	@r0
	nop
	and	r0,r14
	mov	r8,r0
	mov.w	r0,@(136,gbr)
.L06030A2E:
	tst	r14,r14
	bt	.L06030A36
	mov.b	@(6,r1),r0
	mov.b	r0,@(7,r1)
.L06030A36:
	bra	.L06030B76
	nop
.L06030A3A:
	.short 0x4000
.L06030A3C:
	.short 0x03C0
.L06030A3E:
	.short 0x01C0
.L06030A40:
	.short 0x02A0
.L06030A42:
	.short 0x0140
.L06030A44:
	.short 0x0200
	.byte 0x00, 0x00
.L06030A48:
	.long func_06031E00
.L06030A4C:
	.long func_06031DE0
.L06030A50:
	.long D_060F3064
.L06030A54:
	.long 0x04000000
.L06030A58:
	.long 0x30000000
.L06030A5C:
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bf	.L06030A6C
	mov.l	.L06030AA4,r4
	mov.l	@r4,r4
	mov.b	@(6,r4),r0
	tst	r0,r0
	bt	.L06030A96
.L06030A6C:
	mov.l	.L06030AA8,r0
	mov.l	@r0,r0
	tst	#8,r0
	bf	.L06030A96
	mov.w	@(20,r1),r0
	mov	r0,r5
	mov.b	@(78,gbr),r0
	mov.w	.L06030AA0,r6
	mov	#0,r8
	tst	#24,r0
	bt	.L06030A96
	tst	#16,r0
	bt	.L06030A88
	neg	r6,r8
.L06030A88:
	tst	#8,r0
	bt	.L06030A8E
	mov	r6,r8
.L06030A8E:
	add	r8,r5
	mov.w	.L06030AA2,r0
	and	r5,r0
	mov.w	r0,@(20,r1)
.L06030A96:
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bt	.L06030AAC
	bra	.L06030AB0
	nop
.L06030AA0:
	.short 0xC000
.L06030AA2:
	.short 0xC000
.L06030AA4:
	.long D_060F3064
.L06030AA8:
	.long D_0602FF48
.L06030AAC:
	bra	.L06030ABE
	nop
.L06030AB0:
	mov.b	@(107,gbr),r0
	tst	r0,r0
	bf	.L06030ABA
	bra	.L06030ABE
	nop
.L06030ABA:
	bra	.L06030B76
	nop
.L06030ABE:
	mov.w	@(28,gbr),r0
	tst	#2,r0
	bf	.L06030ACE
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bf	.L06030ACE
	bra	.L06030B76
	nop
.L06030ACE:
	mov.w	@(82,gbr),r0
	tst	#64,r0
	bt	.L06030AE0
	mov.l	.L06030B20,r2
	mov.l	@r2,r0
	tst	r0,r0
	bt	.L06030AE0
	mov	#1,r0
	mov.b	r0,@(4,r1)
.L06030AE0:
	mov.w	@(82,gbr),r0
	tst	#16,r0
	bt	.L06030AEC
	mov.l	.L06030B24,r6
	bsr	func_06030B7E
	nop
.L06030AEC:
	mov.w	@(82,gbr),r0
	tst	#32,r0
	bt	.L06030AF6
	bsr	func_06030C70
	nop
.L06030AF6:
	mov	#0,r6
	mov.b	@(80,gbr),r0
	tst	#2,r0
	bt	.L06030B00
	mov	#4,r6
.L06030B00:
	tst	#1,r0
	bt	.L06030B06
	mov	#-4,r6
.L06030B06:
	tst	#4,r0
	bt	.L06030B0E
	shll	r6
	shll	r6
.L06030B0E:
	mov.w	@(2,r1),r0
	add	r6,r0
	mov.w	r0,@(2,r1)
	mov.b	@(20,gbr),r0
	cmp/eq	#7,r0
	bf	.L06030B28
	bra	.L06030B76
	nop
	.byte 0x00, 0x00
.L06030B20:
	.long D_0602FF3C
.L06030B24:
	.long 0x01800000
.L06030B28:
	mov.b	@(80,gbr),r0
	tst	#16,r0
	bf	.L06030B76
	mov.w	@(28,r1),r0
	mov	r0,r5
	mov.w	@(80,gbr),r0
	mov.w	.L06030B7C,r6
	mov	#0,r8
	tst	#1,r0
	bt	.L06030B3E
	neg	r6,r8
.L06030B3E:
	tst	#2,r0
	bt	.L06030B44
	mov	r6,r8
.L06030B44:
	mov.b	@(80,gbr),r0
	tst	#4,r0
	bt	.L06030B4C
	shll	r8
.L06030B4C:
	add	r8,r5
	mov	r5,r0
	mov.w	r0,@(28,r1)
	mov.w	@(20,r1),r0
	mov	r0,r5
	mov.w	@(80,gbr),r0
	mov.w	.L06030B7C,r6
	mov	#0,r8
	tst	#4,r0
	bt	.L06030B62
	neg	r6,r8
.L06030B62:
	tst	#8,r0
	bt	.L06030B68
	mov	r6,r8
.L06030B68:
	mov.b	@(80,gbr),r0
	tst	#4,r0
	bt	.L06030B70
	shll	r8
.L06030B70:
	add	r8,r5
	mov	r5,r0
	mov.w	r0,@(20,r1)
.L06030B76:
	lds.l	@r15+,pr
	rts
	nop
.L06030B7C:
	.short 0xFF00
	endlabel func_0603098C

	glabel func_06030B7E
	sts.l	pr,@-r15
	mov.l	.L06030BBC,r4
	mov.l	@r4,r4
	mov.b	@(6,r4),r0
	tst	r0,r0
	bt	.L06030BC8
	mov.w	@(24,r4),r0
	mov.l	.L06030BC0,r10
	jsr	@r10
	neg	r0,r0
	shll2	r10
	shll2	r11
	mov.l	.L06030BC4,r8
	cmp/ge	r8,r6
	bf	.L06030B9E
	mov	r8,r6
.L06030B9E:
	mov	r6,r8
	dmuls.l	r8,r10
	sts	mach,r0
	sts	macl,r10
	xtrct	r0,r10
	dmuls.l	r8,r11
	sts	mach,r0
	sts	macl,r11
	xtrct	r0,r11
	mov.l	@(48,r4),r2
	add	r11,r2
	mov.l	@(56,r4),r3
	add	r10,r3
	bra	.L06030C14
	nop
.L06030BBC:
	.long D_060F3064
.L06030BC0:
	.long func_06007BD8
.L06030BC4:
	.long 0x01000000
.L06030BC8:
	mov.l	@(60,r4),r3
	neg	r6,r8
	mov.w	@(26,r4),r0
	cmp/pz	r0
	bt	.L06030BD4
	neg	r8,r8
.L06030BD4:
	add	r8,r3
	mov	#31,r0
	mov.b	@(r0,r4),r0
	mov.l	.L06030C54,r10
	jsr	@r10
	nop
	mov	r6,r2
	mov	r7,r3
	mov.w	.L06030C50,r8
	mov.l	.L06030C58,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bt	.L06030BF2
	neg	r8,r8
.L06030BF2:
	mov	r12,r0
	mov.l	.L06030C5C,r10
	jsr	@r10
	add	r8,r0
	shll2	r10
	shll2	r11
	mov.l	.L06030C60,r8
	dmuls.l	r8,r10
	sts	mach,r0
	sts	macl,r10
	xtrct	r0,r10
	dmuls.l	r8,r11
	sts	mach,r0
	sts	macl,r11
	xtrct	r0,r11
	add	r11,r2
	add	r10,r3
.L06030C14:
	mov.l	.L06030C64,r8
	mov.l	r2,@(0,r8)
	mov.l	r3,@(8,r8)
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	.L06030C68,r0
	sub	r0,r5
	add	r0,r4
	mov.l	@(16,r1),r2
	mov	#0,r8
	mov.l	.L06030C58,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bt	.L06030C36
	mov.l	.L06030C6C,r8
.L06030C36:
	mov.l	@(52,r2),r0
	add	r8,r0
	cmp/ge	r4,r0
	bt	.L06030C40
	mov	r4,r0
.L06030C40:
	cmp/ge	r5,r0
	bf	.L06030C46
	mov	r5,r0
.L06030C46:
	mov.l	.L06030C64,r8
	mov.l	r0,@(4,r8)
	lds.l	@r15+,pr
	rts
	nop
.L06030C50:
	.short 0x4000
	.byte 0x00, 0x00
.L06030C54:
	.long func_06018EB4
.L06030C58:
	.long func_06007B96
.L06030C5C:
	.long func_06007BD8
.L06030C60:
	.long 0x00600000
.L06030C64:
	.long D_0602FF3C
.L06030C68:
	.long 0x00400000
.L06030C6C:
	.long 0x00800000
	endlabel func_06030B7E

	glabel func_06030C70
	sts.l	pr,@-r15
	mov.l	.L06030C90,r8
	mov.l	@(16,r1),r4
	mov.l	@(48,r4),r2
	mov.l	.L06030C94,r0
	add	r0,r2
	mov.l	r2,@(0,r8)
	mov.l	@(56,r4),r3
	mov.l	.L06030C98,r0
	add	r0,r3
	mov.l	r3,@(8,r8)
	mov.l	@(52,r4),r0
	mov.l	r0,@(4,r8)
	lds.l	@r15+,pr
	rts
	nop
.L06030C90:
	.long D_0602FF3C
.L06030C94:
	.long 0x00400000
.L06030C98:
	.long 0x00600000
	endlabel func_06030C70

	glabel func_06030C9C
	sts.l	pr,@-r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06030C9C

	glabel func_06030CA4
	sts.l	pr,@-r15
	mov.b	@(20,gbr),r0
	cmp/eq	#5,r0
	bt	.L06030D40
	cmp/eq	#11,r0
	bt	.L06030D40
	tst	#1,r0
	bf	.L06030D36
	mov.w	@(210,gbr),r0
	tst	#1,r0
	bf	.L06030D36
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bf	.L06030CE8
	mov.b	@(6,r4),r0
	cmp/eq	#1,r0
	bt	.L06030CCA
	cmp/eq	#2,r0
	bf	.L06030CE8
.L06030CCA:
	mov.w	@(12,r1),r0
	mov	r0,r8
	mov	#0,r9
	mov.w	.L06030CE2,r10
	mov.l	.L06030CE4,r0
	jsr	@r0
	nop
	mov	r8,r0
	mov	#0,r0
	mov.w	r0,@(12,r1)
	bra	.L06030D36
	nop
.L06030CE2:
	.short 0x0200
.L06030CE4:
	.long func_06031E00
.L06030CE8:
	mov.l	@(32,r4),r5
	mov.l	.L06030D04,r3
	mov.l	@r3,r6
	cmp/eq	r5,r6
	bt	.L06030D14
	cmp/gt	r5,r6
	bf	.L06030D08
	mov.w	.L06030D02,r0
	sub	r0,r6
	cmp/ge	r5,r6
	bt	.L06030D12
	bra	.L06030D12
	mov	r5,r6
.L06030D02:
	.short 0x1000
.L06030D04:
	.long D_0602FF30
.L06030D08:
	mov.w	.L06030D3C,r0
	add	r0,r6
	cmp/gt	r5,r6
	bf	.L06030D12
	mov	r5,r6
.L06030D12:
	mov.l	r6,@r3
.L06030D14:
	mov.l	@r3,r0
	shar	r0
	shar	r0
	shar	r0
	shar	r0
	shar	r0
	shar	r0
	shar	r0
	mov.w	.L06030D3E,r5
	cmp/ge	r5,r0
	bf	.L06030D2C
	mov	r5,r0
.L06030D2C:
	neg	r5,r5
	cmp/gt	r5,r0
	bt	.L06030D34
	mov	r5,r0
.L06030D34:
	mov.w	r0,@(12,r1)
.L06030D36:
	lds.l	@r15+,pr
	rts
	nop
.L06030D3C:
	.short 0x1000
.L06030D3E:
	.short 0x1800
.L06030D40:
	mov.l	.L06030D70,r0
	mov.l	@r0,r0
	tst	r0,r0
	bf	.L06030DAE
	mov.l	.L06030D74,r5
	mov.l	@(52,r4),r6
	mov.l	.L06030D78,r3
	cmp/ge	r3,r6
	bt	.L06030D54
	neg	r5,r5
.L06030D54:
	mov.l	@(32,r4),r5
	mov.l	.L06030D7C,r3
	mov.l	@r3,r6
	cmp/eq	r5,r6
	bt	.L06030D8C
	cmp/gt	r5,r6
	bf	.L06030D80
	mov.w	.L06030D6E,r0
	sub	r0,r6
	cmp/ge	r5,r6
	bt	.L06030D8A
	bra	.L06030D8A
	mov	r5,r6
.L06030D6E:
	.short 0x4000
.L06030D70:
	.long D_0602FF4C
.L06030D74:
	.long 0x00080000
.L06030D78:
	.long 0x02E00000
.L06030D7C:
	.long D_0602FF30
.L06030D80:
	mov.w	.L06030DB4,r0
	add	r0,r6
	cmp/gt	r5,r6
	bf	.L06030D8A
	mov	r5,r6
.L06030D8A:
	mov.l	r6,@r3
.L06030D8C:
	mov.l	@r3,r0
	shar	r0
	shar	r0
	shar	r0
	shar	r0
	shar	r0
	shar	r0
	shar	r0
	mov.w	.L06030DB6,r5
	cmp/ge	r5,r0
	bf	.L06030DA4
	mov	r5,r0
.L06030DA4:
	neg	r5,r5
	cmp/gt	r5,r0
	bt	.L06030DAC
	mov	r5,r0
.L06030DAC:
	mov.w	r0,@(12,r1)
.L06030DAE:
	lds.l	@r15+,pr
	rts
	nop
.L06030DB4:
	.short 0x4000
.L06030DB6:
	.short 0x2800
	endlabel func_06030CA4

	glabel func_06030DB8
	mov.l	.L06030DE4,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L06030DCC
	mov.b	@(20,gbr),r0
	cmp/eq	#4,r0
	bt	.L06030DE8
	cmp/eq	#8,r0
	bt	.L06030E08
.L06030DCC:
	mov.l	@(48,r4),r0
	mov.l	r0,@(196,gbr)
	add	r0,r5
	mov.l	@(52,r4),r0
	mov.l	r0,@(200,gbr)
	add	r0,r6
	mov.l	@(56,r4),r0
	mov.l	r0,@(204,gbr)
	add	r0,r7
	rts
	nop
	.byte 0x00, 0x00
.L06030DE4:
	.long D_060F3064
.L06030DE8:
	mov.l	.L06030E04,r0
	mov.l	r0,@(196,gbr)
	add	r0,r5
	mov.l	@(52,r4),r0
	mov.l	r0,@(200,gbr)
	add	r0,r6
	mov.l	@(56,r4),r0
	mov.l	r0,@(204,gbr)
	add	r0,r7
	mov.w	.L06030E02,r0
	mov.w	r0,@(20,r1)
	rts
	nop
.L06030E02:
	.short 0xC000
.L06030E04:
	.long 0x06BF0000
.L06030E08:
	mov.l	.L06030E5C,r2
	mov.l	@(48,r4),r12
	mov.l	@(56,r4),r13
.L06030E0E:
	mov.w	@(0,r2),r0
	mov	r0,r8
	cmp/pz	r8
	bf	.L06030E66
	mov.w	@(2,r2),r0
	mov	r0,r9
	shll16	r8
	shll16	r9
	cmp/ge	r8,r12
	bf	.L06030E60
	cmp/ge	r9,r13
	bf	.L06030E60
	mov.w	@(4,r2),r0
	mov	r0,r8
	mov.w	@(6,r2),r0
	mov	r0,r9
	shll16	r8
	shll16	r9
	cmp/ge	r8,r12
	bt	.L06030E60
	cmp/ge	r9,r13
	bt	.L06030E60
	mov.w	@(8,r2),r0
	shll16	r0
	cmp/pz	r0
	bt	.L06030E44
	mov.l	@(48,r4),r0
.L06030E44:
	mov.l	r0,@(196,gbr)
	add	r0,r5
	mov.w	@(10,r2),r0
	shll16	r0
	cmp/pz	r0
	bt	.L06030E52
	mov.l	@(56,r4),r0
.L06030E52:
	mov.l	r0,@(204,gbr)
	add	r0,r7
	mov.w	@(12,r2),r0
	bra	.L06030E72
	mov.w	r0,@(20,r1)
.L06030E5C:
	.long D_06030E7C
.L06030E60:
	add	#14,r2
	bra	.L06030E0E
	nop
.L06030E66:
	mov.l	@(48,r4),r0
	mov.l	r0,@(196,gbr)
	add	r0,r5
	mov.l	@(56,r4),r0
	mov.l	r0,@(204,gbr)
	add	r0,r7
.L06030E72:
	mov.l	@(52,r4),r0
	mov.l	r0,@(200,gbr)
	add	r0,r6
	rts
	nop
	dlabel D_06030E7C
	.byte 0x10, 0x5C, 0x10, 0x00, 0x13, 0x68, 0x1C, 0x7C, 0x11, 0xFF, 0xFF, 0xFF, 0x40, 0x00, 0x14, 0x9C
	.byte 0x10, 0x00, 0x16, 0x98, 0x1C, 0x7C, 0x15, 0xFF, 0xFF, 0xFF, 0xC0, 0x00, 0x10, 0x5C, 0x1A, 0x94
	.byte 0x16, 0x98, 0x1C, 0x7C, 0xFF, 0xFF, 0x1B, 0xFF, 0x80, 0x00, 0x10, 0x5C, 0x01, 0x00, 0x13, 0x60
	.byte 0x05, 0x80, 0x11, 0xFF, 0xFF, 0xFF, 0x40, 0x00, 0x1A, 0xA0, 0x01, 0x00, 0x1C, 0x5C, 0x05, 0x80
	.byte 0x1B, 0xFF, 0xFF, 0xFF, 0xC0, 0x00, 0x10, 0x5C, 0x01, 0x00, 0x1C, 0x5C, 0x03, 0x58, 0xFF, 0xFF
	.byte 0x02, 0x3F, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	endlabel func_06030DB8

	glabel func_06030ED4
	sts.l	pr,@-r15
	mov.b	@(149,gbr),r0
	tst	#8,r0
	bt	.L06030F4C
	mov.b	@(76,gbr),r0
	tst	#1,r0
	bt	.L06030F44
	mov	#2,r4
	mov.l	.L06030F3C,r0
	jsr	@r0
	mov	#10,r5
	mov	r0,r5
	mov.w	@(24,r1),r0
	extu.w	r0,r0
	mov.l	.L06030F40,r10
	jsr	@r10
	mov	r0,r4
	mov	#2,r4
	mov.l	.L06030F3C,r0
	jsr	@r0
	mov	#7,r5
	mov	r0,r5
	mov.l	@(48,r6),r0
	swap.w	r0,r0
	extu.w	r0,r0
	mov.l	.L06030F40,r10
	jsr	@r10
	mov	r0,r4
	mov	#2,r4
	mov.l	.L06030F3C,r0
	jsr	@r0
	mov	#8,r5
	mov	r0,r5
	mov.l	@(52,r6),r0
	swap.w	r0,r0
	extu.w	r0,r0
	mov.l	.L06030F40,r10
	jsr	@r10
	mov	r0,r4
	mov	#2,r4
	mov.l	.L06030F3C,r0
	jsr	@r0
	mov	#9,r5
	mov	r0,r5
	mov.l	@(56,r6),r0
	swap.w	r0,r0
	extu.w	r0,r0
	mov.l	.L06030F40,r10
	jsr	@r10
	mov	r0,r4
	bra	.L06030F4C
	nop
.L06030F3C:
	.long func_0601CBE0
.L06030F40:
	.long func_0601CC50
.L06030F44:
	mov.l	.L06030F58,r2
	mov.l	.L06030F5C,r0
	jsr	@r0
	nop
.L06030F4C:
	lds.l	@r15+,pr
	mov.w	@(28,gbr),r0
	tst	#8,r0
	bf	.L06030F60
	bra	.L0603105C
	nop
.L06030F58:
	.long D_06031098
.L06030F5C:
	.long func_0601C9BE
.L06030F60:
	mov.b	@(35,gbr),r0
	tst	r0,r0
	bt	.L06030F6A
	bra	.L0603105C
	nop
.L06030F6A:
	sts.l	pr,@-r15
	mov	#2,r4
	mov.l	.L06031060,r0
	jsr	@r0
	mov	#7,r5
	mov	r0,r5
	mov.l	@(48,r6),r0
	mov.l	.L06031064,r10
	jsr	@r10
	mov	r0,r4
	mov	#2,r4
	mov.l	.L06031060,r0
	jsr	@r0
	mov	#8,r5
	mov	r0,r5
	mov.l	@(52,r6),r0
	mov.l	.L06031064,r10
	jsr	@r10
	mov	r0,r4
	mov	#2,r4
	mov.l	.L06031060,r0
	jsr	@r0
	mov	#9,r5
	mov	r0,r5
	mov.l	@(56,r6),r0
	mov.l	.L06031064,r10
	jsr	@r10
	mov	r0,r4
	mov	#2,r4
	mov.l	.L06031060,r0
	jsr	@r0
	mov	#10,r5
	mov	r0,r5
	mov.l	@(60,r6),r0
	mov.l	.L06031064,r10
	jsr	@r10
	mov	r0,r4
	mov	#2,r4
	mov.l	.L06031060,r0
	jsr	@r0
	mov	#11,r5
	mov	r0,r5
	mov	#31,r0
	mov.b	@(r0,r6),r0
	mov.l	.L06031064,r10
	jsr	@r10
	mov	r0,r4
	mov	r0,r4
	mov	#2,r4
	mov.l	.L06031060,r0
	jsr	@r0
	mov	#14,r5
	mov	r0,r5
	mov.w	@(26,r6),r0
	mov.l	.L06031064,r10
	jsr	@r10
	mov	r0,r4
	mov	#2,r4
	mov.l	.L06031060,r0
	jsr	@r0
	mov	#12,r5
	mov	r0,r5
	mov.l	.L06031068,r0
	mov.w	@r0,r0
	mov.l	.L06031064,r10
	jsr	@r10
	mov	r0,r4
	mov	#2,r4
	mov.l	.L06031060,r0
	jsr	@r0
	mov	#14,r5
	mov	r0,r5
	mov.w	@(24,r6),r0
	mov.l	.L06031064,r10
	jsr	@r10
	mov	r0,r4
	mov	#2,r4
	mov.l	.L06031060,r0
	jsr	@r0
	mov	#13,r5
	mov	r0,r5
	mov.w	@(20,r1),r0
	mov.l	.L06031064,r10
	jsr	@r10
	mov	r0,r4
	mov	#2,r4
	mov.l	.L06031060,r0
	jsr	@r0
	mov	#15,r5
	mov	r0,r5
	mov.l	@(860,gbr),r0
	mov.l	.L06031064,r10
	jsr	@r10
	mov	r0,r4
	mov	#2,r4
	mov.l	.L06031060,r0
	jsr	@r0
	mov	#16,r5
	mov	r0,r5
	mov.l	@(864,gbr),r0
	mov.l	.L06031064,r10
	jsr	@r10
	mov	r0,r4
	mov.l	@(48,r6),r2
	mov.l	@(56,r6),r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	add	r4,r5
	shar	r5
	mov.l	r5,@-r15
	mov	#22,r4
	mov.l	.L06031060,r0
	jsr	@r0
	mov	#24,r5
	mov	r0,r5
	mov.l	@r15+,r4
	mov.l	.L06031064,r10
	jsr	@r10
	nop
	lds.l	@r15+,pr
.L0603105C:
	rts
	nop
.L06031060:
	.long func_0601CBE0
.L06031064:
	.long func_0601CC50
.L06031068:
	.long D_06018CBC
	.byte 0x00, 0x02, 0x00, 0x07, 0x20, 0x58, 0x3A, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFF, 0x09, 0x20, 0x59
	.byte 0x3A, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFF, 0x09, 0x20, 0x5A, 0x3A, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0xFF, 0x09, 0x52, 0x59, 0x3A, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFE, 0x09
	dlabel D_06031098
	.byte 0x00, 0x02, 0x00, 0x07, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFF, 0x09, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFF, 0x09, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0xFF, 0x09, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFE, 0x09
	endlabel func_06030ED4

	glabel func_060310C4
	mov.w	@(28,gbr),r0
	tst	#2,r0
	bt	.L060310F0
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bf	.L060310D6
	mov.w	@(82,gbr),r0
	tst	#64,r0
	bt	.L060310DA
.L060310D6:
	mov	#0,r0
	mov.b	r0,@(4,r1)
.L060310DA:
	mov.w	@(82,gbr),r0
	tst	#16,r0
	bt	.L060310E6
	mov.l	.L06031104,r6
	bsr	func_06030B7E
	nop
.L060310E6:
	mov.w	@(82,gbr),r0
	tst	#32,r0
	bt	.L060310F0
	bsr	func_06030C70
	nop
.L060310F0:
	mov.l	.L06031108,r4
	mov.l	@r4,r0
	tst	#4,r0
	bt	.L06031110
	mov.l	.L0603110C,r4
	mov.l	@r4,r0
	mov.l	r0,@(16,r1)
	bra	.L060311BA
	nop
	.byte 0x00, 0x00
.L06031104:
	.long 0x01800000
.L06031108:
	.long D_0602FF48
.L0603110C:
	.long D_060F30A4
.L06031110:
	mov.l	.L06031174,r4
	mov.l	@r4,r4
	mov.b	@(6,r4),r0
	tst	r0,r0
	bt	.L06031144
	mov.l	.L06031178,r0
	mov.l	@r0,r0
	tst	#8,r0
	bf	.L06031144
	mov.w	@(20,r1),r0
	mov	r0,r5
	mov.b	@(78,gbr),r0
	mov.w	.L0603116E,r6
	mov	#0,r8
	tst	#24,r0
	bt	.L06031144
	tst	#16,r0
	bt	.L06031136
	neg	r6,r8
.L06031136:
	tst	#8,r0
	bt	.L0603113C
	mov	r6,r8
.L0603113C:
	add	r8,r5
	mov.w	.L06031170,r0
	and	r5,r0
	mov.w	r0,@(20,r1)
.L06031144:
	mov.l	.L06031174,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	mov	#0,r0
	bf	.L06031154
	mov.l	@(16,r1),r0
	mov.w	@(24,r0),r0
.L06031154:
	mov.w	r0,@(208,gbr)
	mov.w	@(12,r1),r0
	mov	r0,r5
	mov.w	@(20,r1),r0
	add	r0,r5
	mov.w	@(208,gbr),r0
	add	r5,r0
	mov	r0,r9
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bt	.L0603117C
	bra	.L060311AC
	mov	r9,r8
.L0603116E:
	.short 0xC000
.L06031170:
	.short 0xC000
	.byte 0x00, 0x00
.L06031174:
	.long D_060F3064
.L06031178:
	.long D_0602FF48
.L0603117C:
	mov.w	@(24,r1),r0
	mov	r0,r8
	extu.w	r8,r8
	extu.w	r9,r9
	sub	r8,r9
	tst	r9,r9
	bt	.L060311AC
	cmp/pz	r9
	bt	.L06031190
	extu.w	r9,r9
.L06031190:
	exts.w	r9,r9
	cmp/pl	r9
	bf	.L060311A0
	mov.w	@(0,r1),r0
	cmp/ge	r9,r0
	bf	.L060311AA
	bra	.L060311AA
	mov	r9,r0
.L060311A0:
	mov.w	@(0,r1),r0
	neg	r0,r0
	cmp/ge	r9,r0
	bt	.L060311AA
	mov	r9,r0
.L060311AA:
	add	r0,r8
.L060311AC:
	mov	r8,r0
	mov	r0,r5
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L060311B6
.L060311B6:
	mov	r5,r0
	mov.w	r0,@(24,r1)
.L060311BA:
	mov.l	.L06031278,r2
	mov.l	@r2+,r0
	mov.l	r0,@(48,r1)
	mov.l	@r2+,r0
	mov.l	r0,@(52,r1)
	mov.l	@r2+,r0
	mov.l	r0,@(56,r1)
	mov.l	@(16,r1),r6
	mov.l	@(48,r6),r3
	mov.l	@(56,r6),r2
	mov.l	@(48,r1),r0
	sub	r0,r3
	mov.l	@(56,r1),r0
	sub	r0,r2
	mov.l	.L0603127C,r0
	jsr	@r0
	nop
	mov.l	.L06031280,r14
	jsr	@r14
	mov.w	r0,@(14,r1)
	mov	r10,r0
	mov.w	r0,@(172,gbr)
	mov	r11,r0
	mov.w	r0,@(176,gbr)
	mov.l	@(16,r1),r6
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	mov.l	@(48,r6),r4
	mov.l	@(56,r6),r5
	swap.w	r2,r2
	swap.w	r3,r3
	swap.w	r4,r4
	swap.w	r5,r5
	exts.w	r2,r2
	exts.w	r3,r3
	exts.w	r4,r4
	exts.w	r5,r5
	mov.l	.L06031284,r0
	jsr	@r0
	nop
	shll16	r0
	mov	r0,r2
	mov.l	@(16,r1),r6
	mov.l	@(52,r6),r3
	mov.l	@(52,r1),r0
	sub	r0,r3
	mov.l	.L0603127C,r0
	jsr	@r0
	nop
	mov.l	.L06031280,r14
	jsr	@r14
	mov.w	r0,@(22,r1)
	mov	r10,r0
	mov.w	r0,@(180,gbr)
	mov	r11,r0
	mov.w	r0,@(184,gbr)
	mov.l	@(16,r1),r6
	mov.l	@(52,r6),r0
	mov.l	.L06031288,r2
	mov.l	r0,@r2
	mov.l	@(48,r1),r0
	mov.l	r0,@(160,gbr)
	mov.l	@(52,r1),r0
	mov.l	r0,@(164,gbr)
	mov.l	@(56,r1),r0
	mov.l	r0,@(168,gbr)
	mov.w	@(22,r1),r0
	mov.w	r0,@(192,gbr)
	mov.w	@(14,r1),r0
	mov.w	r0,@(194,gbr)
	mov.l	@(16,r1),r6
	bsr	func_06030ED4
	nop
	mov.b	@(107,gbr),r0
	tst	r0,r0
	bf	.L06031252
.L06031252:
	mov.l	.L0603128C,r14
	jsr	@r14
	mov.w	@(22,r1),r0
	mov.w	@(14,r1),r0
	mov.l	.L06031290,r14
	jsr	@r14
	neg	r0,r0
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	neg	r4,r4
	neg	r5,r5
	mov.l	.L06031294,r14
	jsr	@r14
	neg	r6,r6
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06031278:
	.long D_0602FF3C
.L0603127C:
	.long func_06007C1C
.L06031280:
	.long func_06007BD8
.L06031284:
	.long func_06007D4A
.L06031288:
	.long D_0602FF34
.L0603128C:
	.long func_0600CA7A
.L06031290:
	.long func_0600CAF8
.L06031294:
	.long func_0600CBDA
	endlabel func_060310C4
