	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06042038,"ax",@progbits
	.p2align 2

	glabel func_06042038
	mov.l	.L06042088,r0
	mov.w	@r0,r5
	shll2	r5
	shll	r5
	mov.l	.L0604208C,r2
	add	r2,r5
	mov.l	r5,@(40,r1)
	mov.l	.L06042090,r0
	mov.w	@r0,r5
	shll2	r5
	shll	r5
	add	r2,r5
	mov.l	r5,@(32,r1)
	mov.l	.L06042094,r0
	mov.w	@r0,r5
	shll2	r5
	shll	r5
	add	r2,r5
	mov.l	r5,@(36,r1)
	mov.l	.L06042098,r0
	mov.l	r0,@(48,r1)
	mov.l	.L0604209C,r0
	mov.l	r0,@(52,r1)
	xor	r0,r0
	mov.l	r0,@(56,r1)
	mov.l	r0,@(0,r1)
	mov.l	r0,@(4,r1)
	mov.l	r0,@(8,r1)
	mov.w	r0,@(22,r1)
	mov	#1,r0
	mov.l	.L060420A0,r2
	mov.l	r0,@r2
	mov.w	.L06042084,r0
	mov.w	r0,@(24,r1)
	mov.l	.L060420A4,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06042084:
	.short 0x0100
	.byte 0x00, 0x00
.L06042088:
	.long D_060EEA54
.L0604208C:
	.long VDP1_VRAM
.L06042090:
	.long D_060EE9FC
.L06042094:
	.long D_060EE9E4
.L06042098:
	.long 0x00480000
.L0604209C:
	.long 0x00200000
.L060420A0:
	.long D_06041FE0
.L060420A4:
	.long func_060420A8
	endlabel func_06042038

	glabel func_060420A8
	sts.l	pr,@-r15
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L0604215C
	mov.b	@(35,gbr),r0
	tst	r0,r0
	bt	.L060420BA
	bra	.L0604215C
	nop
.L060420BA:
	mov.w	.L06042132,r0
	mov.w	r0,@(22,r1)
	mov.l	.L06042134,r2
	mov.l	@r2,r0
	mov.w	r0,@(20,r1)
	mov.l	r0,@-r15
	mov.l	.L06042138,r2
	mov.l	.L0604213C,r0
	jsr	@r0
	mov.l	r2,@(44,r1)
	mov.b	@(3,r1),r0
	mov.l	.L06042140,r2
	add	r0,r2
	mov.b	@r2,r0
	mov.w	r0,@(20,r1)
	mov.l	@r15+,r0
	cmp/eq	#8,r0
	bt	.L060420E6
	mov.l	.L06042144,r2
	mov.l	.L0604213C,r0
	jsr	@r0
	mov.l	r2,@(44,r1)
.L060420E6:
	mov.l	@(48,r1),r0
	mov.l	r0,@-r15
	mov.l	.L06042148,r2
	add	r2,r0
	mov.l	r0,@(48,r1)
	mov.l	.L0604214C,r2
	mov.w	@(24,r1),r0
	mov.w	r0,@(22,r1)
	mov.l	.L0604213C,r0
	jsr	@r0
	mov.l	r2,@(44,r1)
	mov.l	@(48,r1),r0
	mov.l	.L06042150,r2
	add	r2,r0
	mov.l	r0,@(48,r1)
	mov.b	@(1,r1),r0
	mov.w	r0,@(20,r1)
	mov.l	.L06042154,r2
	mov.l	.L0604213C,r0
	jsr	@r0
	mov.l	r2,@(44,r1)
	mov.b	@(2,r1),r0
	tst	r0,r0
	bt	.L06042128
	mov.w	r0,@(20,r1)
	mov.l	@(48,r1),r0
	mov.l	.L06042158,r2
	add	r2,r0
	mov.l	r0,@(48,r1)
	mov.l	.L06042154,r2
	mov.l	.L0604213C,r0
	jsr	@r0
	mov.l	r2,@(44,r1)
.L06042128:
	mov.l	@r15+,r0
	mov.l	r0,@(48,r1)
	lds.l	@r15+,pr
	rts
	nop
.L06042132:
	.short 0x0100
.L06042134:
	.long D_06041FE0
.L06042138:
	.long D_06014884
.L0604213C:
	.long func_060204EE
.L06042140:
	.long D_06042028
.L06042144:
	.long D_06014812
.L06042148:
	.long 0xFFE10000
.L0604214C:
	.long D_060147B2
.L06042150:
	.long 0x00230000
.L06042154:
	.long D_060146C2
.L06042158:
	.long 0xFFF60000
.L0604215C:
	mov.l	@(12,gbr),r0
	tst	#2,r0
	bf	.L060421B0
	mov.b	@(5,r1),r0
	add	#8,r0
	cmp/eq	#72,r0
	bf	.L0604216C
	xor	r0,r0
.L0604216C:
	mov.b	r0,@(5,r1)
	mov	#32,r2
	cmp/gt	r2,r0
	bf	.L0604217A
	sub	r2,r0
	sub	r0,r2
	mov	r2,r0
.L0604217A:
	mov.l	.L06042218,r4
	shll2	r0
	add	r0,r4
	mov.l	@(32,r1),r5
	mov.l	.L0604221C,r0
	jsr	@r0
	mov	#32,r6
	mov.l	.L06042220,r2
	mov.l	@r2,r0
	cmp/eq	#8,r0
	bt	.L060421B0
	mov.l	.L06042224,r4
	cmp/eq	#1,r0
	bt	.L06042198
	mov.l	.L06042228,r4
.L06042198:
	mov.b	@(6,r1),r0
	add	#8,r0
	cmp/eq	#64,r0
	bf	.L060421A2
	xor	r0,r0
.L060421A2:
	mov.b	r0,@(6,r1)
	shll2	r0
	add	r0,r4
	mov.l	@(36,r1),r5
	mov.l	.L0604221C,r0
	jsr	@r0
	mov	#32,r6
.L060421B0:
	mov.w	@(24,r1),r0
	mov.w	.L06042214,r2
	cmp/gt	r2,r0
	bf	.L060421BC
	add	#-24,r0
	mov.w	r0,@(24,r1)
.L060421BC:
	mov.b	@(7,r1),r0
	tst	r0,r0
	bt	.L060421D4
	add	#-4,r0
	mov.b	r0,@(7,r1)
	mov.l	.L0604222C,r2
	add	r2,r0
	mov.l	@r0,r4
	mov.l	@(40,r1),r5
	mov.l	.L0604221C,r0
	jsr	@r0
	mov	#32,r6
.L060421D4:
	mov.b	@(3,r1),r0
	add	#1,r0
	cmp/eq	#16,r0
	bf	.L060421DE
	xor	r0,r0
.L060421DE:
	mov.b	r0,@(3,r1)
	mov.b	@(0,r1),r0
	mov	r0,r2
	mov.l	.L06042230,r14
	mov.b	@(8,r14),r0
	cmp/eq	r2,r0
	bt	.L06042242
	cmp/gt	r2,r0
	mov	#-1,r3
	bf	.L060421FC
	mov.w	.L06042216,r0
	mov.w	r0,@(24,r1)
	mov	#68,r0
	mov.b	r0,@(7,r1)
	mov	#1,r3
.L060421FC:
	add	r3,r2
	mov	r2,r0
	mov.b	r0,@(0,r1)
	mov.b	@(1,r1),r0
	add	r3,r0
	cmp/eq	#10,r0
	bf	.L06042234
	mov.b	@(2,r1),r0
	add	#1,r0
	mov.b	r0,@(2,r1)
	bra	.L06042240
	xor	r0,r0
.L06042214:
	.short 0x0100
.L06042216:
	.short 0x01C0
.L06042218:
	.long D_06093170
.L0604221C:
	.long func_060045BC
.L06042220:
	.long D_06041FE0
.L06042224:
	.long D_06093230
.L06042228:
	.long D_06093330
.L0604222C:
	.long D_06041FE4
.L06042230:
	.long D_060FFE50
.L06042234:
	cmp/eq	#-1,r0
	bf	.L06042240
	mov.b	@(2,r1),r0
	add	#-1,r0
	mov.b	r0,@(2,r1)
	mov	#9,r0
.L06042240:
	mov.b	r0,@(1,r1)
.L06042242:
	lds.l	@r15+,pr
	mov.b	@(8,r14),r0
	mov.l	.L0604225C,r2
	mov.l	@r2,r2
	tst	r2,r2
	bt	.L06042264
	cmp/ge	r2,r0
	mov	#2,r0
	bt	.L06042256
	mov	#1,r0
.L06042256:
	mov.l	.L06042260,r2
	rts
	mov.l	r0,@r2
.L0604225C:
	.long D_060FFEC0
.L06042260:
	.long D_06041FE0
.L06042264:
	rts
	nop
	endlabel func_060420A8

	glabel func_06042268
	mov.l	.L06042280,r2
	xor	r0,r0
	mov.l	r0,@r2
	mov.l	.L06042284,r2
	mov.l	r2,@(44,r1)
	mov.l	.L06042288,r0
	mov.l	r0,@(60,r1)
	mov.l	.L0604228C,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
	.byte 0x00, 0x00
.L06042280:
	.long D_060FFEC0
.L06042284:
	.long D_06014884
.L06042288:
	.long D_06042688
.L0604228C:
	.long func_06042290
	endlabel func_06042268

	glabel func_06042290
	mov.l	.L060422C0,r2
	mov.l	@r2,r2
	tst	r2,r2
	bt	.L060422B8
	mov.l	.L060422C4,r0
	mov.l	r0,@(48,r1)
	mov.l	.L060422C8,r0
	mov.l	r0,@(52,r1)
	mov.w	.L060422BC,r0
	mov.w	r0,@(22,r1)
	xor	r0,r0
	mov.l	r0,@(56,r1)
	mov.l	r0,@(0,r1)
	mov.l	.L060422CC,r2
	mov.w	r0,@r2
	add	#6,r2
	mov.w	r0,@r2
	mov.l	.L060422D0,r0
	mov.l	r0,@-r1
	add	#4,r1
.L060422B8:
	rts
	nop
.L060422BC:
	.short 0x0010
	.byte 0x00, 0x00
.L060422C0:
	.long D_060FFEC0
.L060422C4:
	.long 0x00180000
.L060422C8:
	.long 0x00340000
.L060422CC:
	.long D_0604268E
.L060422D0:
	.long func_060422D4
	endlabel func_06042290

	glabel func_060422D4
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L060422F0
	mov.b	@(35,gbr),r0
	tst	r0,r0
	bt	.L060422E4
	bra	.L060422F0
	nop
.L060422E4:
	mov.l	.L060422EC,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L060422EC:
	.long func_060425F0
.L060422F0:
	mov.w	@(22,r1),r0
	mov.w	.L06042300,r2
	add	#16,r0
	mov.w	r0,@(22,r1)
	cmp/eq	r2,r0
	bt	.L06042302
	rts
	nop
.L06042300:
	.short 0x0080
.L06042302:
	xor	r0,r0
	mov.w	r0,@(2,r1)
	mov.l	.L06042324,r2
	mov.l	@r2,r2
	mov.l	r2,@(16,r1)
	mov.l	.L06042328,r2
	mov.l	r2,@-r1
	add	#4,r1
.L06042312:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06042340
	mov.b	@(35,gbr),r0
	tst	r0,r0
	bt	.L0604232C
	bra	.L06042340
	nop
	.byte 0x00, 0x00
.L06042324:
	.long D_060FFEC0
.L06042328:
	.long .L06042312
.L0604232C:
	sts.l	pr,@-r15
	mov	#0,r0
	mov.l	.L0604233C,r14
	jsr	@r14
	mov.w	r0,@(20,r1)
	lds.l	@r15+,pr
	rts
	nop
.L0604233C:
	.long func_060204EE
.L06042340:
	mov.l	.L06042358,r2
	mov.l	@r2,r2
	mov.l	@(16,r1),r0
	cmp/gt	r0,r2
	bt	.L06042360
	cmp/eq	r2,r0
	bt	.L06042354
	mov.l	.L0604235C,r0
	mov.l	r0,@-r1
	add	#4,r1
.L06042354:
	rts
	nop
.L06042358:
	.long D_060FFEC0
.L0604235C:
	.long func_06042364
.L06042360:
	rts
	mov.l	r2,@(16,r1)
	endlabel func_060422D4

	glabel func_06042364
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06042374
	mov.l	.L06042370,r0
	jmp	@r0
	nop
.L06042370:
	.long func_060425F0
.L06042374:
	sts.l	pr,@-r15
	mov.w	@(0,r1),r0
	mov.w	.L06042390,r2
	add	r2,r0
	mov.w	r0,@(0,r1)
	mov.w	.L06042392,r2
	cmp/gt	r2,r0
	bf	.L060423D0
	mov	r2,r0
	mov.w	r0,@(0,r1)
	mov.l	.L06042394,r2
	mov.l	r2,@-r1
	bra	.L060423D0
	add	#4,r1
.L06042390:
	.short 0x0300
.L06042392:
	.short 0x4000
.L06042394:
	.long func_06042398
	endlabel func_06042364

	glabel func_06042398
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L060423A8
	mov.l	.L060423A4,r0
	jmp	@r0
	nop
.L060423A4:
	.long func_060425F0
.L060423A8:
	mov.w	@(2,r1),r0
	add	#1,r0
	mov.w	r0,@(2,r1)
	mov.l	.L060423C0,r2
	mov.l	@r2,r2
	mov.l	@(16,r1),r0
	add	#-1,r0
	mov.l	r0,@(16,r1)
	cmp/eq	r2,r0
	bt	.L060423C4
	rts
	nop
.L060423C0:
	.long D_060FFEC0
.L060423C4:
	mov.l	.L060423CC,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L060423CC:
	.long func_06042484
.L060423D0:
	mov.l	.L06042410,r13
	jsr	@r13
	nop
	mov.l	.L06042414,r2
	mov.l	.L06042418,r3
	mov.l	.L0604241C,r4
	mov.l	.L06042420,r5
	mov.l	.L06042424,r0
	mov.l	.L06042428,r6
	mov	r10,r9
	mov	r10,r8
	dmuls.l	r10,r4
	sts	mach,r10
	sts	macl,r4
	xtrct	r10,r4
	dmuls.l	r9,r5
	sts	mach,r9
	sts	macl,r5
	xtrct	r9,r5
	dmuls.l	r8,r6
	sts	mach,r8
	sts	macl,r6
	xtrct	r8,r6
	add	r4,r2
	add	r5,r3
	add	r6,r0
	mov.l	r2,@(48,r1)
	mov.l	r3,@(52,r1)
	lds.l	@r15+,pr
	rts
	mov.w	r0,@(22,r1)
	.byte 0x00, 0x00
.L06042410:
	.long func_06007C08
.L06042414:
	.long 0x00180000
.L06042418:
	.long 0x00340000
.L0604241C:
	.long 0x00E00000
.L06042420:
	.long 0x02000000
.L06042424:
	.long 0x00000080
.L06042428:
	.long 0x00000200
	endlabel func_06042398

	glabel func_0604242C
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L0604243C
	mov.l	.L06042438,r0
	jmp	@r0
	nop
.L06042438:
	.long func_060425F0
.L0604243C:
	sts.l	pr,@-r15
	mov.w	@(0,r1),r0
	mov.w	.L06042474,r2
	sub	r2,r0
	mov.w	r0,@(0,r1)
	xor	r2,r2
	cmp/gt	r2,r0
	bt	.L060423D0
	mov	r2,r0
	mov.w	r0,@(0,r1)
	mov.l	.L06042478,r2
	mov.l	r2,@-r1
	add	#4,r1
	mov.l	@(16,r1),r0
	mov	#20,r2
	sub	r0,r2
	shll16	r2
	mov.l	.L0604247C,r0
	dmuls.l	r0,r2
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	shlr16	r2
	mov.l	.L06042480,r2
	mov.w	r0,@r2
	add	#6,r2
	bra	.L060423D0
	mov.w	r0,@r2
.L06042474:
	.short 0x0300
	.byte 0x00, 0x00
.L06042478:
	.long .L06042312
.L0604247C:
	.long 0x0004C000
.L06042480:
	.long D_0604268E
	endlabel func_0604242C

	glabel func_06042484
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06042494
	mov.l	.L06042490,r0
	jmp	@r0
	nop
.L06042490:
	.long func_060425F0
.L06042494:
	mov.w	@(2,r1),r0
	add	#1,r0
	mov.w	r0,@(2,r1)
	cmp/eq	#30,r0
	bt	.L060424A2
	rts
	nop
.L060424A2:
	mov	#0,r0
	mov.w	r0,@(2,r1)
	mov.l	@(16,r1),r0
	tst	r0,r0
	bt	.L060424B8
	mov.l	.L060424B4,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L060424B4:
	.long func_0604242C
.L060424B8:
	mov	#8,r0
	mov.l	.L06042504,r2
	mov.l	r0,@r2
	mov.l	.L06042508,r0
	mov.l	r0,@-r1
	add	#4,r1
	endlabel func_06042484

	glabel func_060424C4
	sts.l	pr,@-r15
	mov.l	.L0604250C,r2
	mov.l	.L06042510,r0
	mov.w	@r0,r5
	shll2	r5
	shll	r5
	add	r2,r5
	mov.l	.L06042514,r4
	mov.l	.L06042518,r0
	jsr	@r0
	mov	#32,r6
	lds.l	@r15+,pr
	mov.l	.L0604250C,r2
	mov.l	.L0604251C,r0
	mov.w	@r0,r5
	shll2	r5
	shll	r5
	add	r2,r5
	mov.l	.L06042520,r7
	mov	#4,r0
	mov.b	@(r0,r7),r0
	cmp/eq	#3,r0
	bt	.L06042528
	shll2	r0
	shll2	r0
	shll	r0
	mov.l	.L06042524,r4
	add	r0,r4
	mov.l	.L06042518,r0
	jmp	@r0
	mov	#32,r6
	.byte 0x00, 0x00
.L06042504:
	.long D_06041FE0
.L06042508:
	.long func_0604252C
.L0604250C:
	.long VDP1_VRAM
.L06042510:
	.long D_060EE9E4
.L06042514:
	.long D_06093210
.L06042518:
	.long func_060045BC
.L0604251C:
	.long D_060EEA74
.L06042520:
	.long D_060FFE50
.L06042524:
	.long D_06093450
.L06042528:
	rts
	nop
	endlabel func_060424C4

	glabel func_0604252C
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06042574
	mov.b	@(35,gbr),r0
	tst	r0,r0
	bt	func_0604253C
	bra	.L06042574
	nop
	endlabel func_0604252C

	glabel func_0604253C
	sts.l	pr,@-r15
	mov.l	.L0604256C,r2
	mov.l	r2,@(36,r1)
	mov.l	@(48,r1),r0
	mov.l	r0,@(40,r1)
	mov	#7,r0
	mov.w	r0,@(20,r1)
	mov	#20,r0
.L0604254C:
	mov.l	r0,@-r15
	mov.l	@(36,r1),r0
	mov.l	@r0+,r2
	mov.l	r0,@(36,r1)
	mov.l	@(40,r1),r3
	add	r2,r3
	mov.l	.L06042570,r14
	jsr	@r14
	mov.l	r3,@(48,r1)
	mov.l	@r15+,r0
	dt	r0
	bf	.L0604254C
	mov.l	@(40,r1),r0
	lds.l	@r15+,pr
	rts
	mov.l	r0,@(48,r1)
.L0604256C:
	.long D_0604258C
.L06042570:
	.long func_060204EE
.L06042574:
	mov.w	@(22,r1),r0
	add	#-16,r0
	cmp/pl	r0
	bf	.L06042580
	rts
	mov.w	r0,@(22,r1)
.L06042580:
	mov.l	.L06042588,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06042588:
	.long func_06042290
	endlabel func_0604253C

	.section .data.0604258C,"aw",@progbits
	.p2align 2
	dlabel D_0604258C
	.byte 0x00, 0xB8, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00
	.byte 0x00, 0x98, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00
	.byte 0x00, 0x70, 0x00, 0x00, 0x00, 0x68, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00
	.byte 0x00, 0x48, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	dlabel D_060425DC
	.long D_06060606
	.long D_06050505
	.byte 0x05, 0x05, 0x04, 0x04, 0x04, 0x04, 0x04, 0x03, 0x03, 0x03, 0x03, 0x03
