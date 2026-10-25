	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060330F4,"ax",@progbits
	.p2align 2

	glabel func_060330F4
	mov.w	.L0603310A,r0
	mov.w	r0,@(2,r1)
	mov.w	.L0603310C,r0
	mov.w	r0,@(4,r1)
	mov.w	.L0603310E,r0
	mov.w	r0,@(6,r1)
	mov.l	.L06033110,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0603310A:
	.short 0x0100
.L0603310C:
	.short 0xFFE0
.L0603310E:
	.short 0x0008
.L06033110:
	.long func_06033114
	endlabel func_060330F4

	glabel func_06033114
	mov.w	@(4,r1),r0
	mov	r0,r14
	mov.w	@(2,r1),r0
	add	r14,r0
	mov.w	r0,@(2,r1)
	mov	r0,r14
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603312C
	mov	r14,r0
	mov.w	r0,@(500,gbr)
	mov.w	r0,@(502,gbr)
.L0603312C:
	mov.w	@(6,r1),r0
	dt	r0
	bf	.L0603313C
	mov.l	.L06033138,r0
	jmp	@r0
	nop
.L06033138:
	.long func_0600D1A0
.L0603313C:
	mov.w	r0,@(6,r1)
	rts
	nop
	endlabel func_06033114

	glabel func_06033142
	mov.w	@(4,r1),r0
	mov	r0,r14
	mov.w	@(2,r1),r0
	add	r14,r0
	mov.w	r0,@(2,r1)
	mov	r0,r14
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603315C
	mov	r14,r0
	mov.w	r0,@(500,gbr)
	mov.w	r0,@(502,gbr)
	mov.w	r0,@(504,gbr)
.L0603315C:
	mov.w	@(6,r1),r0
	dt	r0
	bf	.L0603316C
	mov.l	.L06033168,r0
	jmp	@r0
	nop
.L06033168:
	.long func_0600D1A0
.L0603316C:
	mov.w	r0,@(6,r1)
	rts
	nop
	endlabel func_06033142

	glabel func_06033172
	mov.w	@(4,r1),r0
	mov	r0,r14
	mov.w	@(2,r1),r0
	add	r14,r0
	mov.w	.L060331A6,r8
	cmp/ge	r8,r0
	bt	.L06033184
	neg	r14,r14
	add	r14,r0
.L06033184:
	mov.w	r0,@(2,r1)
	mov	r0,r13
	mov	r14,r0
	mov.w	r0,@(4,r1)
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603319A
	mov	r13,r0
	mov.w	r0,@(500,gbr)
	mov.w	r0,@(502,gbr)
	mov.w	r0,@(504,gbr)
.L0603319A:
	mov.w	@(6,r1),r0
	dt	r0
	bf	.L060331AC
	mov.l	.L060331A8,r0
	jmp	@r0
	nop
.L060331A6:
	.short 0xFF01
.L060331A8:
	.long func_0600D1A0
.L060331AC:
	mov.w	r0,@(6,r1)
	rts
	nop
	endlabel func_06033172

	glabel func_060331B2
	sts.l	pr,@-r15
	mov.w	@(4,r1),r0
	mov	r0,r14
	mov.w	@(2,r1),r0
	add	r14,r0
	mov.w	r0,@(2,r1)
	mov.l	@(44,r1),r2
	mov.l	@(60,r1),r3
	mov.w	@(8,r1),r0
	mov	r0,r7
.L060331C6:
	mov.w	@r2+,r4
	mov.w	.L060331E6,r5
	mov.l	.L060331E8,r14
	jsr	@r14
	mov.w	@(2,r1),r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L060331C6
	add	#2,r3
	lds.l	@r15+,pr
	mov.w	@(6,r1),r0
	dt	r0
	bf	.L060331F0
	mov.l	.L060331EC,r0
	jmp	@r0
	nop
.L060331E6:
	.short 0xFFFF
.L060331E8:
	.long func_0600D4D0
.L060331EC:
	.long func_0600D1A0
.L060331F0:
	mov.w	r0,@(6,r1)
	rts
	nop
	endlabel func_060331B2

	glabel func_060331F6
	mov.w	.L0603320C,r0
	mov.w	r0,@(2,r1)
	mov.w	.L0603320E,r0
	mov.w	r0,@(4,r1)
	mov.w	.L06033210,r0
	mov.w	r0,@(6,r1)
	mov.l	.L06033214,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0603320C:
	.short 0x0000
.L0603320E:
	.short 0xFFFC
.L06033210:
	.short 0x0040
	.byte 0x00, 0x00
.L06033214:
	.long func_06033218
	endlabel func_060331F6

	glabel func_06033218
	mov.w	.L06033238,r0
	mov.w	r0,@(498,gbr)
	mov.w	@(4,r1),r0
	mov	r0,r14
	mov.w	@(2,r1),r0
	add	r14,r0
	mov.w	r0,@(2,r1)
	mov.w	r0,@(506,gbr)
	mov.w	r0,@(508,gbr)
	mov.w	r0,@(510,gbr)
	mov.w	@(6,r1),r0
	dt	r0
	bf	.L06033240
	mov.l	.L0603323C,r0
	jmp	@r0
	nop
.L06033238:
	.short 0x003B
	.byte 0x00, 0x00
.L0603323C:
	.long func_0600D1A0
.L06033240:
	mov.w	r0,@(6,r1)
	rts
	nop
	endlabel func_06033218

	glabel func_06033246
	mov.l	.L060332AC,r2
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.b	@(0,r1),r0
	and	#1,r0
	shll2	r0
	shll	r0
	add	r0,r2
	mov.l	@r2+,r0
	mov.l	r0,@(44,r1)
	mov.l	r2,@(16,r1)
	mov.l	.L060332B0,r2
	mov.b	@(0,r1),r0
	mov	r0,r8
	shll	r0
	mov.w	@(r0,r2),r0
	mov.w	r0,@(2,r1)
	mov.l	.L060332B4,r2
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	add	r0,r2
	mov.w	@(2,r2),r0
	mov	r0,r9
	mov.l	.L060332B8,r2
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	shll	r0
	add	r0,r2
	mov	r8,r0
	shll	r0
	mov.w	@(r0,r2),r0
	add	r9,r0
	mov.w	r0,@(12,r1)
	tst	#1,r0
	bt	.L0603329A
	mov	#64,r8
	mov	#30,r0
	mov.b	r8,@(r0,r1)
.L0603329A:
	mov.l	.L060332BC,r0
	mov.l	r0,@(60,r1)
	mov.l	.L060332C0,r0
	mov.l	r0,@(32,r1)
	mov.l	.L060332C4,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L060332AC:
	.long D_06033958
.L060332B0:
	.long D_060338F0
.L060332B4:
	.long D_0603258C
.L060332B8:
	.long D_060338F8
.L060332BC:
	.long 0x01000000
.L060332C0:
	.long 0x00040000
.L060332C4:
	.long func_060332C8
	endlabel func_06033246

	glabel func_060332C8
	mov.w	@(2,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bf	.L060332D6
	mov.w	r0,@(2,r1)
	rts
	nop
.L060332D6:
	mov.l	.L060332E0,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L060332E0:
	.long func_060332E4
	endlabel func_060332C8

	glabel func_060332E4
	sts.l	pr,@-r15
	mov.l	@(60,r1),r8
	mov.l	@(32,r1),r9
	mov.l	.L06033304,r0
	add	r0,r9
	mov.l	.L06033308,r0
	cmp/ge	r0,r9
	bf	.L060332F6
	mov	r0,r9
.L060332F6:
	mov.l	r9,@(32,r1)
	sub	r9,r8
	cmp/pz	r8
	bf	.L0603330C
	mov.l	r8,@(60,r1)
	bra	.L06033384
	nop
.L06033304:
	.long 0x00002000
.L06033308:
	.long 0x00040000
.L0603330C:
	mov.l	@(32,r1),r0
	neg	r0,r0
	mov.l	r0,@(32,r1)
	mov.l	.L06033390,r4
	mov.l	@r4,r4
	mov.l	@(8,r4),r12
	mov.l	@(12,r4),r13
	mov.w	.L0603338C,r0
	mov.w	r0,@(22,r12)
	mov	#0,r0
	mov.w	r0,@(24,r12)
	mov.w	.L0603338E,r0
	mov.w	r0,@(28,r12)
	mov	#32,r0
	mov.b	r0,@(1,r12)
	mov	#0,r0
	mov.w	r0,@(14,r12)
	mov.w	r0,@(16,r12)
	mov	#-127,r0
	mov.b	r0,@(8,r12)
	mov	#0,r0
	shll16	r0
	mov.l	r0,@(40,r13)
	mov	#-4,r0
	shll16	r0
	mov.l	r0,@(36,r4)
	mov.l	.L06033394,r2
	mov.l	.L06033398,r0
	jsr	@r0
	nop
	mov.l	.L0603339C,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	@(48,r1),r0
	mov.l	r0,@(48,r3)
	mov.l	@(52,r1),r0
	mov.l	r0,@(52,r3)
	mov.l	@(56,r1),r0
	mov.l	r0,@(56,r3)
	mov.b	@(0,r1),r0
	tst	r0,r0
	bf	.L0603337E
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#2,r5
	mov	#1,r6
	mov.l	.L060333A0,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L0603337E:
	mov.l	.L060333A4,r0
	mov.l	r0,@-r1
	add	#4,r1
.L06033384:
	bsr	func_060333A8
	nop
	bra	func_0603388C
	nop
.L0603338C:
	.short 0x00AE
.L0603338E:
	.short 0x009E
.L06033390:
	.long D_060F3064
.L06033394:
	.long D_060FFFB8
.L06033398:
	.long func_0600D0D0
.L0603339C:
	.long func_06043A34
.L060333A0:
	.long func_0600E4C4
.L060333A4:
	.long func_0603347C
	endlabel func_060332E4

	glabel func_060333A8
	sts.l	pr,@-r15
	mov.l	.L06033400,r10
	jsr	@r10
	mov.w	@(12,r1),r0
	shll2	r10
	shll2	r11
	mov.l	@(60,r1),r8
	dmuls.l	r8,r10
	sts	mach,r0
	sts	macl,r10
	xtrct	r0,r10
	dmuls.l	r8,r11
	sts	mach,r0
	sts	macl,r11
	xtrct	r0,r11
	mov.l	.L06033404,r4
	mov.l	@r4,r4
	mov.l	@(48,r4),r0
	add	r11,r0
	mov.l	r0,@(48,r1)
	mov.l	@(56,r4),r0
	add	r10,r0
	mov.l	r0,@(56,r1)
	mov.l	r4,@-r15
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	@r15+,r6
	mov.l	.L06033408,r0
	add	r0,r4
	sub	r0,r5
	mov.l	@(52,r6),r0
	cmp/ge	r5,r0
	bf	.L060333F2
	mov	r5,r0
.L060333F2:
	cmp/ge	r4,r0
	bt	.L060333F8
	mov	r4,r0
.L060333F8:
	mov.l	r0,@(52,r1)
	lds.l	@r15+,pr
	rts
	nop
.L06033400:
	.long func_06007BD8
.L06033404:
	.long D_060F3064
.L06033408:
	.long 0x00400000
	endlabel func_060333A8

	glabel func_0603340C
	sts.l	pr,@-r15
	mov.l	.L0603346C,r10
	jsr	@r10
	mov.w	@(24,r1),r0
	shll2	r10
	shll2	r11
	mov.l	@(32,r1),r8
	dmuls.l	r8,r10
	sts	mach,r0
	sts	macl,r10
	xtrct	r0,r10
	dmuls.l	r8,r11
	sts	mach,r0
	sts	macl,r11
	xtrct	r0,r11
	mov.l	@(48,r1),r2
	add	r11,r2
	mov.l	r2,@(48,r1)
	mov.l	@(56,r1),r3
	add	r10,r3
	mov.l	r3,@(56,r1)
	mov.l	@(52,r1),r8
	mov.l	@(60,r1),r9
	mov.l	.L06033470,r10
	mov.l	.L06033474,r0
	jsr	@r0
	nop
	mov.l	r8,@(52,r1)
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	.L06033478,r0
	add	r0,r4
	sub	r0,r5
	mov.l	@(52,r1),r0
	cmp/ge	r5,r0
	bf	.L0603345C
	mov	r5,r0
.L0603345C:
	cmp/ge	r4,r0
	bt	.L06033462
	mov	r4,r0
.L06033462:
	mov.l	r0,@(52,r1)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0603346C:
	.long func_06007BD8
.L06033470:
	.long 0x00040000
.L06033474:
	.long func_06031DE0
.L06033478:
	.long 0x00400000
	endlabel func_0603340C

	glabel func_0603347C
	sts.l	pr,@-r15
	mov.l	@(60,r1),r8
	mov.l	@(32,r1),r9
	mov.l	.L060334A0,r0
	add	r0,r9
	mov.l	.L060334A4,r0
	cmp/ge	r0,r9
	bf	.L0603348E
	mov	r0,r9
.L0603348E:
	mov.l	r9,@(32,r1)
	sub	r9,r8
	mov.l	.L060334A8,r0
	cmp/ge	r0,r8
	bf	.L060334AC
	mov.l	r8,@(60,r1)
	bra	.L0603358C
	nop
	.byte 0x00, 0x00
.L060334A0:
	.long 0x00002000
.L060334A4:
	.long 0x00080000
.L060334A8:
	.long 0xFF000000
.L060334AC:
	mov.b	@(0,r1),r0
	cmp/eq	#3,r0
	bf	.L0603357C
	mov.l	.L060334FC,r2
	mov	#-1,r0
	mov.w	r0,@r2
	mov.l	.L06033500,r4
	mov.l	.L06033504,r0
	mov.l	@r0,r0
	mov.l	r0,@r4
	mov.w	@(12,r1),r0
	tst	#2,r0
	bt	.L060334CC
	mov	#64,r8
	mov	#30,r0
	mov.b	r8,@(r0,r1)
.L060334CC:
	mov.l	.L06033508,r2
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	@r2+,r3
	mov.l	@r3+,r0
	cmp/pz	r0
	bf	.L06033510
	mov.l	r14,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov	r0,r3
	extu.b	r3,r0
	mov.l	.L0603350C,r10
	jsr	@r10
	nop
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	mov.l	@r15+,r14
	bra	.L06033514
	nop
.L060334FC:
	.long D_060329D2
.L06033500:
	.long D_060F30A4
.L06033504:
	.long D_060F30B0
.L06033508:
	.long D_0603EB54
.L0603350C:
	.long func_06018EB4
.L06033510:
	mov.l	.L0603355C,r6
	mov.l	.L06033560,r7
.L06033514:
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	sub	r6,r2
	sub	r7,r3
	mov.l	.L06033564,r0
	jsr	@r0
	nop
	mov.l	.L06033568,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	shll8	r10
	shll8	r11
	shll2	r10
	shll2	r11
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	add	r11,r6
	add	r10,r7
	mov.l	r6,@(48,r1)
	mov.l	r7,@(56,r1)
	mov.l	.L0603356C,r2
	mov.l	.L06033570,r0
	jsr	@r0
	nop
	mov.l	.L06033574,r0
	mov.l	r0,@(12,r3)
	mov.l	.L06033578,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L0603355C:
	.long 0x1F300000
.L06033560:
	.long 0x10F00000
.L06033564:
	.long func_06007C1C
.L06033568:
	.long func_06007BD8
.L0603356C:
	.long D_060FFFB8
.L06033570:
	.long func_0600D0D0
.L06033574:
	.long func_06032F94
.L06033578:
	.long func_06033598
.L0603357C:
	bsr	func_0603384C
	nop
	lds.l	@r15+,pr
	mov.l	.L06033588,r0
	jmp	@r0
	nop
.L06033588:
	.long func_0600D1A0
.L0603358C:
	bsr	func_0603384C
	nop
	bsr	func_060333A8
	nop
	bra	func_0603388C
	nop
	endlabel func_0603347C

	glabel func_06033598
	sts.l	pr,@-r15
	mov.l	.L060335C8,r2
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	@r2+,r3
	mov.l	@r3+,r0
	cmp/pz	r0
	bf	.L060335D0
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov	r0,r3
	extu.b	r3,r0
	mov.l	.L060335CC,r10
	jsr	@r10
	nop
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	bra	.L060335D4
	nop
	.byte 0x00, 0x00
.L060335C8:
	.long D_0603EB54
.L060335CC:
	.long func_06018EB4
.L060335D0:
	mov.l	.L06033654,r6
	mov.l	.L06033658,r7
.L060335D4:
	mov.l	@r3+,r0
	cmp/pz	r0
	bt	.L060335DC
	neg	r0,r0
.L060335DC:
	mov.l	r0,@(60,r1)
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	sub	r2,r6
	sub	r3,r7
	mov	r6,r2
	mov	r7,r3
	mov.l	.L0603365C,r0
	jsr	@r0
	nop
	mov.w	r0,@(24,r1)
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	mov.l	@(48,r1),r4
	mov.l	@(56,r1),r5
	sub	r6,r4
	sub	r7,r5
	mov.w	.L06033652,r8
	mov.l	.L06033660,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bf	.L060336BC
	mov	#127,r0
	mov.w	r0,@(2,r1)
	mov.l	.L06033664,r0
	mov.l	@r0,r4
	mov.l	.L06033668,r2
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov	#30,r13
	mov.b	r13,@r4
	mov	#7,r0
	mov.b	r0,@(1,r4)
	add	#16,r4
	mov	#4,r14
.L0603362C:
	mov.l	@r2+,r3
	mov.l	@r3+,r0
	cmp/pz	r0
	bf	.L06033670
	mov.l	r14,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov	r0,r3
	extu.b	r3,r0
	mov.l	.L0603366C,r10
	jsr	@r10
	nop
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	mov.l	@r15+,r14
	bra	.L06033674
	nop
.L06033652:
	.short 0x4000
.L06033654:
	.long 0x1F300000
.L06033658:
	.long 0x10F00000
.L0603365C:
	.long func_06007C1C
.L06033660:
	.long func_06017440
.L06033664:
	.long D_060F30A8
.L06033668:
	.long D_0603EB54
.L0603366C:
	.long func_06018EB4
.L06033670:
	mov.l	.L060336A4,r6
	mov.l	.L060336A8,r7
.L06033674:
	mov.l	r6,@r4
	mov.l	@r3+,r0
	cmp/pz	r0
	bt	.L0603367E
	neg	r0,r0
.L0603367E:
	mov.l	.L060336AC,r8
	sub	r8,r0
	mov.l	r0,@(4,r4)
	mov.l	r7,@(8,r4)
	add	#12,r4
	dt	r14
	bf	.L0603362C
	mov.l	.L060336B0,r0
	jsr	@r0
	nop
	mov.l	@(60,r1),r0
	mov.l	.L060336B4,r8
	sub	r8,r0
	mov.l	r0,@(60,r1)
	mov.l	.L060336B8,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L060336C6
	nop
.L060336A4:
	.long 0x1F300000
.L060336A8:
	.long 0x10F00000
.L060336AC:
	.long 0x00500000
.L060336B0:
	.long func_0603E964
.L060336B4:
	.long 0x00800000
.L060336B8:
	.long func_060337B8
.L060336BC:
	mov.w	@(78,gbr),r0
	tst	#112,r0
	bt	.L060336C6
	bra	.L060336D2
	nop
.L060336C6:
	bsr	func_0603384C
	nop
	bsr	func_0603340C
	nop
	bra	func_0603388C
	nop
.L060336D2:
	mov.l	.L06033714,r0
	mov.l	@r0,r4
	mov.l	.L06033718,r2
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov	#30,r13
	mov.b	r13,@r4
	mov	#7,r0
	mov.b	r0,@(1,r4)
	add	#16,r4
	mov	#4,r14
.L060336EC:
	mov.l	@r2+,r3
	mov.l	@r3+,r0
	cmp/pz	r0
	bf	.L06033720
	mov.l	r14,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov	r0,r3
	extu.b	r3,r0
	mov.l	.L0603371C,r10
	jsr	@r10
	nop
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	mov.l	@r15+,r14
	bra	.L06033724
	nop
	.byte 0x00, 0x00
.L06033714:
	.long D_060F30A8
.L06033718:
	.long D_0603EB54
.L0603371C:
	.long func_06018EB4
.L06033720:
	mov.l	.L0603378C,r6
	mov.l	.L06033790,r7
.L06033724:
	mov.l	r6,@r4
	mov.l	@r3+,r0
	cmp/pz	r0
	bt	.L0603372E
	neg	r0,r0
.L0603372E:
	mov.l	.L06033794,r8
	sub	r8,r0
	mov.l	r0,@(4,r4)
	mov.l	r7,@(8,r4)
	add	#12,r4
	dt	r14
	bf	.L060336EC
	mov.l	.L06033798,r0
	jsr	@r0
	nop
.L06033742:
	mov.l	.L0603379C,r4
	mov.l	@r4,r4
	mov.l	@(8,r4),r12
	mov.l	@(12,r4),r13
	mov.w	.L06033788,r0
	mov.w	r0,@(22,r12)
	mov	#0,r0
	mov.w	r0,@(24,r12)
	mov.w	.L0603378A,r0
	mov.w	r0,@(28,r12)
	mov	#0,r0
	mov.w	r0,@(14,r12)
	mov.w	r0,@(16,r12)
	mov	#-127,r0
	mov.b	r0,@(8,r12)
	mov	#0,r0
	shll16	r0
	mov.l	r0,@(40,r13)
	mov	#0,r0
	shll16	r0
	mov.l	r0,@(36,r4)
.L0603376C:
	mov.l	.L060337A0,r2
	mov.l	.L060337A4,r0
	jsr	@r0
	nop
	mov.l	.L060337A8,r0
	mov.l	.L060337AC,r0
	mov.l	r0,@(12,r3)
	lds.l	@r15+,pr
	mov.l	.L060337B0,r2
	mov	#-2,r0
	mov.w	r0,@r2
	mov.l	.L060337B4,r0
	jmp	@r0
	nop
.L06033788:
	.short 0x00AE
.L0603378A:
	.short 0x009E
.L0603378C:
	.long 0x1F300000
.L06033790:
	.long 0x10F00000
.L06033794:
	.long 0x00500000
.L06033798:
	.long func_0603E964
.L0603379C:
	.long D_060F3064
.L060337A0:
	.long D_060FFFB8
.L060337A4:
	.long func_0600D0D0
.L060337A8:
	.long func_06033014
.L060337AC:
	.long func_06032F94
.L060337B0:
	.long D_060329D2
.L060337B4:
	.long func_0600D1A0
	endlabel func_06033598

	glabel func_060337B8
	mov.w	@(2,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bf	.L06033814
	mov.w	r0,@(2,r1)
	sts.l	pr,@-r15
	cmp/eq	#40,r0
	bf	.L060337F2
	mov.l	.L06033808,r4
	mov.l	@r4,r4
	mov.l	@(8,r4),r12
	mov.l	@(12,r4),r13
	mov.w	.L06033804,r0
	mov.w	r0,@(22,r12)
	mov	#0,r0
	mov.w	r0,@(24,r12)
	mov.w	.L06033806,r0
	mov.w	r0,@(28,r12)
	mov	#0,r0
	mov.w	r0,@(14,r12)
	mov.w	r0,@(16,r12)
	mov	#-127,r0
	mov.b	r0,@(8,r12)
	mov	#0,r0
	shll16	r0
	mov.l	r0,@(40,r13)
	mov	#-4,r0
	shll16	r0
	mov.l	r0,@(36,r4)
.L060337F2:
	mov.w	@(78,gbr),r0
	tst	#112,r0
	bt	.L0603380C
	mov.w	@(2,r1),r0
	mov	#30,r8
	cmp/ge	r8,r0
	bt	.L06033742
	bra	.L0603376C
	nop
.L06033804:
	.short 0x00AE
.L06033806:
	.short 0x009E
.L06033808:
	.long D_060F3064
.L0603380C:
	bsr	func_0603340C
	nop
	bra	func_0603388C
	nop
.L06033814:
	sts.l	pr,@-r15
	mov.l	.L06033834,r2
	mov.l	.L06033838,r0
	jsr	@r0
	nop
	mov.l	.L0603383C,r0
	mov.l	.L06033840,r0
	mov.l	r0,@(12,r3)
	lds.l	@r15+,pr
	mov.l	.L06033844,r2
	mov	#-2,r0
	mov.w	r0,@r2
	mov.l	.L06033848,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06033834:
	.long D_060FFFB8
.L06033838:
	.long func_0600D0D0
.L0603383C:
	.long func_06033014
.L06033840:
	.long func_06032F94
.L06033844:
	.long D_060329D2
.L06033848:
	.long func_0600D1A0
	endlabel func_060337B8

	glabel func_0603384C
	mov.l	.L06033864,r0
	mov.l	@r0,r4
	mov.b	@(0,r1),r0
	mov	#3,r14
	sub	r0,r14
	mov	r14,r0
	mov	#2,r13
.L0603385A:
	cmp/pl	r0
	bf	.L06033868
	add	#-1,r0
	bra	.L0603385A
	shll	r13
.L06033864:
	.long D_060F30A8
.L06033868:
	mov.b	@r4,r0
	or	r13,r0
	mov.b	r0,@r4
	mov	#9,r0
	mov.b	r0,@(1,r4)
	add	#16,r4
	mov	#12,r0
	mulu.w	r0,r14
	sts	macl,r0
	add	r0,r4
	mov.l	@(48,r1),r0
	mov.l	r0,@r4
	mov.l	@(52,r1),r0
	mov.l	r0,@(4,r4)
	mov.l	@(56,r1),r0
	mov.l	r0,@(8,r4)
	rts
	nop
	endlabel func_0603384C

	glabel func_0603388C
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06033898
	lds.l	@r15+,pr
	rts
	nop
.L06033898:
	mov.l	@(16,r1),r2
	mov.l	@r2,r2
	mov.l	.L060338D8,r0
	jsr	@r0
	nop
	mov.l	.L060338DC,r0
	jsr	@r0
	nop
	mov.w	@(4,r1),r0
	mov.w	.L060338D4,r8
	add	r8,r0
	mov.l	.L060338E0,r10
	jsr	@r10
	mov.w	r0,@(4,r1)
	shll2	r10
	shll2	r10
	shll	r10
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	add	r10,r5
	mov.l	.L060338E4,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L060338E8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L060338EC,r0
	jmp	@r0
	nop
.L060338D4:
	.short 0x0400
	.byte 0x00, 0x00
.L060338D8:
	.long func_0601EF98
.L060338DC:
	.long func_0600CA24
.L060338E0:
	.long func_06007C08
.L060338E4:
	.long func_0600CBDA
.L060338E8:
	.long func_060208FA
.L060338EC:
	.long func_0600CA4E
	endlabel func_0603388C

	.section .data.060338F0,"aw",@progbits
	.p2align 2
	dlabel D_060338F0
	.byte 0x00, 0x00, 0x00, 0x0A, 0x00, 0x14, 0x00, 0x1E
	dlabel D_060338F8
	.byte 0xA0, 0x00, 0x20, 0x01, 0xE0, 0x01, 0x60, 0x02, 0xA0, 0x00, 0x20, 0x01, 0xE0, 0x01, 0x60, 0x00
	.byte 0xA0, 0x00, 0x20, 0x00, 0xE0, 0x00, 0x60, 0x00, 0xA0, 0x00, 0x20, 0x00, 0xE0, 0x00, 0x60, 0x00
	.byte 0xA0, 0x00, 0x20, 0x00, 0xE0, 0x00, 0x60, 0x00, 0xA0, 0x00, 0x20, 0x00, 0xE0, 0x00, 0x60, 0x00
	dlabel D_06033928
	.byte 0x0F, 0x80, 0x0A, 0x1B, 0x06, 0x2D, 0x00, 0x00, 0x15, 0x5F, 0x08, 0xA8, 0x09, 0xAD, 0x00, 0x00
	.byte 0x1B, 0x48, 0x07, 0x28, 0x08, 0xB0, 0x00, 0x00, 0x14, 0x31, 0x04, 0x22, 0x0E, 0xA1, 0x00, 0x00
	.byte 0x19, 0x10, 0x02, 0xE9, 0x0A, 0x05, 0x00, 0x00, 0x13, 0x7D, 0x18, 0xE9, 0x04, 0xEF, 0x00, 0x00
	dlabel D_06033958
	.long D_060B8A1C
	.long D_060BBDE4
	.long D_060BB6C4
	.long D_060BBBEC
	.long D_060BB4E8
	.long D_060B8B38
