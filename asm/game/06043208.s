	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06043208,"ax",@progbits
	.p2align 2

	glabel func_06043208
	sts.l	pr,@-r15
	mov.l	.L06043238,r2
	mov.l	.L0604323C,r0
	jsr	@r0
	nop
	mov.l	.L06043240,r0
	mov.l	r0,@(12,r3)
	mov	#4,r4
	add	r1,r4
	mov.l	r4,@(16,r3)
	lds.l	@r15+,pr
	mov.l	.L06043244,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
	.byte 0x01, 0x2C
	.long D_06039594
	.long D_06039574
	.long D_060431D4
	.long D_060F3064
.L06043238:
	.long D_060FFFB8
.L0604323C:
	.long func_0600D0D0
.L06043240:
	.long func_06043304
.L06043244:
	.long func_06043248
	endlabel func_06043208

	glabel func_06043248
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06043258
	mov.l	.L06043254,r0
	jmp	@r0
	nop
.L06043254:
	.long func_0603B694
.L06043258:
	mov.l	.L060432BC,r2
	mov.l	@r2,r0
	dt	r0
	mov.l	r0,@r2
	bf	.L06043268
	mov.l	.L060432C0,r0
	mov.l	r0,@-r1
	add	#4,r1
.L06043268:
	sts.l	pr,@-r15
	mov.w	@(0,r1),r0
	mov.w	.L060432B8,r3
	add	r3,r0
	mov.l	.L060432C4,r2
	jsr	@r2
	mov.w	r0,@(0,r1)
	mov.l	@(4,r1),r2
	mov	r2,r3
	dmuls.l	r2,r10
	sts	mach,r2
	sts	macl,r10
	xtrct	r2,r10
	dmuls.l	r3,r11
	sts	mach,r3
	sts	macl,r11
	xtrct	r3,r11
	mov.l	.L060432C8,r7
	mov.l	@r7,r7
	mov.l	@(60,r7),r2
	mov.l	@(52,r7),r3
	mov	#31,r0
	mov.b	@(r0,r7),r4
	add	r2,r10
	add	r3,r11
	mov.b	r4,@(r0,r1)
	mov.l	r10,@(60,r1)
	mov.l	r11,@(52,r1)
	mov	#30,r2
	add	r1,r2
	mov.b	@r2,r0
	mov.l	@(32,r7),r3
	cmp/pz	r3
	or	#64,r0
	bt	.L060432B0
	and	#191,r0
.L060432B0:
	mov.b	r0,@r2
	mov.l	.L060432CC,r0
	jmp	@r0
	lds.l	@r15+,pr
.L060432B8:
	.short 0x0400
	.byte 0x00, 0x00
.L060432BC:
	.long D_060431D4
.L060432C0:
	.long func_060432D0
.L060432C4:
	.long func_06007BD8
.L060432C8:
	.long D_060F3064
.L060432CC:
	.long func_06018E8C
	endlabel func_06043248

	glabel func_060432D0
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L060432E0
	mov.l	.L060432DC,r0
	jmp	@r0
	nop
.L060432DC:
	.long func_0603B694
.L060432E0:
	mov.l	.L060432F0,r2
	mov.l	.L060432F4,r3
	mov.l	@(4,r1),r0
	add	r2,r0
	cmp/ge	r3,r0
	bt	.L060432F8
	bra	.L06043268
	mov.l	r0,@(4,r1)
.L060432F0:
	.long 0x00100000
.L060432F4:
	.long 0x03000000
.L060432F8:
	mov.l	.L06043300,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06043300:
	.long func_0600D1A0
	endlabel func_060432D0

	glabel func_06043304
	mov.l	.L06043318,r2
	mov.l	.L0604331C,r3
	mov.l	@(0,r1),r0
	mov.l	@r0,r4
	add	r2,r4
	mov.l	r4,@r0
	cmp/ge	r3,r4
	bt	.L06043320
	rts
	nop
.L06043318:
	.long 0x00080000
.L0604331C:
	.long 0x00A00000
.L06043320:
	mov.l	.L06043328,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06043328:
	.long func_0600D1A0
	endlabel func_06043304

	glabel func_0604332C
	sts.l	pr,@-r15
	mov.l	.L06043360,r2
	mov.l	.L06043364,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L06043368,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r3,@(0,r1)
	mov.l	@(60,r1),r0
	mov.l	.L0604336C,r4
	add	r4,r0
	mov.l	r0,@(32,r3)
	mov.l	@(52,r1),r0
	mov.l	.L06043370,r4
	add	r4,r0
	mov.l	r0,@(36,r3)
	mov	#31,r0
	mov.b	@(r0,r1),r2
	mov.b	r2,@(r0,r3)
	mov.l	.L06043374,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
	.byte 0x00, 0x00
.L06043360:
	.long D_060FFFB8
.L06043364:
	.long func_0600D0D0
.L06043368:
	.long func_060438B4
.L0604336C:
	.long 0xFFE40000
.L06043370:
	.long 0x00400000
.L06043374:
	.long func_06043378
	endlabel func_0604332C

	glabel func_06043378
	sts.l	pr,@-r15
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov.b	@(1,r2),r0
	cmp/pz	r0
	bt	.L0604339C
	mov	#1,r0
	mov.b	r0,@(1,r2)
	mov	r1,r5
	mov.l	.L06043398,r0
	jsr	@r0
	mov.l	@(0,r1),r1
	mov	r5,r1
	mov.l	.L06043398,r0
	jmp	@r0
	lds.l	@r15+,pr
.L06043398:
	.long func_0600D1A0
.L0604339C:
	mov.l	.L060433C0,r0
	mov.l	@r0,r2
	mov.b	@(6,r2),r0
	tst	r0,r0
	bf	.L060433D8
	mov.b	@(20,gbr),r0
	cmp/eq	#6,r0
	bf	.L060433B2
	mov.b	@(7,r2),r0
	tst	r0,r0
	bf	.L060433EE
.L060433B2:
	mov	#30,r0
	mov.b	@(r0,r1),r0
	tst	#4,r0
	bt	.L060433C4
	bra	.L06043488
	nop
	.byte 0x00, 0x00
.L060433C0:
	.long D_060F3064
.L060433C4:
	mov.l	.L060433D0,r9
	mov.l	.L060433D4,r0
	jsr	@r0
	mov	#90,r8
	bra	.L060433EE
	nop
.L060433D0:
	.long 0x80000004
.L060433D4:
	.long func_06016824
.L060433D8:
	mov.l	.L060433FC,r2
	mov.l	.L06043400,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	xor	r13,r13
	mov.l	.L06043404,r0
	jsr	@r0
	mov	#4,r7
.L060433EE:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06043408
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L060433FC:
	.long D_06043618
.L06043400:
	.long 0x00010000
.L06043404:
	.long func_06017A98
.L06043408:
	mov.l	.L06043468,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0604346C,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06043470,r13
	jsr	@r13
	mov.w	@(24,r1),r0
	mov.l	.L06043474,r0
	mov.l	@r0+,r4
	mov.l	@r0+,r5
	mov.l	@r0+,r6
	mov.l	.L0604346C,r12
	jsr	@r12
	mov.l	r0,@(8,r1)
	mov.l	.L06043478,r0
	mov.l	@r0+,r2
	mov.l	.L0604347C,r12
	jsr	@r12
	mov.l	r0,@(12,r1)
	mov	#18,r0
.L06043438:
	mov.l	.L06043468,r2
	jsr	@r2
	mov.w	r0,@(4,r1)
	mov.l	@(8,r1),r0
	mov.l	@r0+,r4
	mov.l	@r0+,r5
	mov.l	@r0+,r6
	mov.l	.L0604346C,r12
	jsr	@r12
	mov.l	r0,@(8,r1)
	mov.l	@(12,r1),r0
	mov.l	@r0+,r2
	mov.l	.L06043480,r12
	jsr	@r12
	mov.l	r0,@(12,r1)
	mov.l	.L06043484,r2
	jsr	@r2
	nop
	mov.w	@(4,r1),r0
	dt	r0
	bf	.L06043438
	mov.l	.L06043484,r0
	jmp	@r0
	lds.l	@r15+,pr
.L06043468:
	.long func_0600CA24
.L0604346C:
	.long func_0600CBDA
.L06043470:
	.long func_0600CAF8
.L06043474:
	.long D_0608C018
.L06043478:
	.long D_0608BFCC
.L0604347C:
	.long func_0601F4A0
.L06043480:
	.long func_0601F434
.L06043484:
	.long func_0600CA4E
.L06043488:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#61,r6
	mov.l	.L060435DC,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L060435E0,r7
	mov.l	@r7,r7
	tst	#16,r0
	bf	.L060434D8
	mov.l	@(8,r7),r12
	mov.l	@(12,r7),r13
	mov.l	.L060435E4,r8
	mov.w	@(26,r7),r0
	add	r8,r0
	mov.w	r0,@(26,r7)
	mov.w	@(4,r7),r0
	add	r8,r0
	mov.w	r0,@(4,r7)
	mov.w	@(10,r13),r0
	add	r8,r0
	mov.w	r0,@(10,r13)
	mov.w	@(8,r12),r0
	add	r8,r0
	mov.w	r0,@(8,r12)
	mov.l	@(32,r7),r2
	neg	r2,r2
	mov.l	r2,@(32,r7)
	mov.l	@(36,r7),r3
	neg	r3,r3
	mov.l	r3,@(36,r7)
.L060434D8:
	mov.l	@(60,r7),r8
	mov.l	@(32,r7),r11
	shal	r11
	shal	r11
	shal	r11
	sub	r11,r8
	mov.l	r8,@(60,r7)
	mov.l	@(52,r7),r8
	mov.l	@(36,r7),r12
	mov.l	r12,@(36,r1)
	shal	r12
	shal	r12
	sub	r12,r8
	mov.l	.L060435E8,r0
	jsr	@r0
	mov.l	r8,@(52,r7)
	mov.l	r6,@(32,r1)
	mov.l	r7,@(40,r1)
	mov.l	.L060435EC,r13
	mov.l	.L060435F0,r14
	mov.l	@r13+,r4
	mov.l	@r13+,r5
	mov.l	@r13+,r6
	mov.l	@r14+,r7
	mov.l	@(752,gbr),r0
	mov.l	.L060435F4,r10
	mul.l	r0,r10
	sts	macl,r10
	mov.l	.L060435F8,r0
	add	r10,r0
	mov.l	r0,@(752,gbr)
	mov.l	.L060435FC,r0
	and	r0,r10
	bsr	func_06043630
	xor	r9,r9
	mov	r5,r12
	mov	#-128,r9
	mov	#18,r0
.L06043524:
	mov.l	r0,@-r15
	mov.l	@r13+,r4
	mov.l	@r13+,r5
	mov.l	@r13+,r6
	mov.l	@r14+,r7
	add	r12,r5
	mov.l	@(752,gbr),r0
	mov.l	.L060435F4,r10
	mul.l	r0,r10
	sts	macl,r10
	mov.l	.L060435F8,r0
	add	r10,r0
	mov.l	r0,@(752,gbr)
	mov.l	.L06043600,r0
	bsr	func_06043630
	and	r0,r10
	mov.l	@r15+,r0
	dt	r0
	bf	.L06043524
	mov	#8,r0
.L0604354C:
	mov.l	r0,@-r15
	mov.l	@(48,r1),r5
	mov.l	@(52,r1),r6
	mov.l	@(56,r1),r7
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	@(752,gbr),r0
	mov.l	.L060435F4,r2
	mul.l	r0,r2
	sts	macl,r2
	mov.l	.L060435F8,r0
	add	r2,r0
	mov.l	r0,@(752,gbr)
	mov.l	.L06043604,r13
	and	r13,r2
	mov.l	@(752,gbr),r0
	mov.l	.L060435F4,r3
	mul.l	r0,r3
	sts	macl,r3
	mov.l	.L060435F8,r0
	add	r3,r0
	mov.l	r0,@(752,gbr)
	and	r13,r3
	mov.l	@(752,gbr),r0
	mov.l	.L060435F4,r4
	mul.l	r0,r4
	sts	macl,r4
	mov.l	.L060435F8,r0
	add	r4,r0
	mov.l	r0,@(752,gbr)
	and	r13,r4
	shlr	r13
	sub	r13,r2
	sub	r13,r3
	sub	r13,r4
	add	r2,r5
	add	r3,r6
	add	r4,r7
	mov.l	r5,@(48,r1)
	mov.l	r6,@(52,r1)
	mov.l	r7,@(56,r1)
	mov.l	.L06043608,r2
	mov.l	.L0604360C,r3
	mov.l	.L06043610,r0
	jsr	@r0
	nop
	xor	r0,r0
	mov.w	r0,@(20,r3)
	mov.w	r0,@(14,r3)
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	mov.l	r5,@(48,r1)
	mov.l	r6,@(52,r1)
	mov.l	r7,@(56,r1)
	mov.l	@r15+,r0
	dt	r0
	bf	.L0604354C
	mov	r1,r5
	mov.l	.L06043614,r0
	jsr	@r0
	mov.l	@(0,r1),r1
	mov	r5,r1
	lds.l	@r15+,pr
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov	#2,r0
	mov.b	r0,@(1,r2)
	mov.l	.L06043614,r0
	jmp	@r0
	nop
.L060435DC:
	.long func_0600E4C4
.L060435E0:
	.long D_060F3064
.L060435E4:
	.long 0x00008000
.L060435E8:
	.long func_060437D4
.L060435EC:
	.long D_0608C018
.L060435F0:
	.long D_0608BFCC
.L060435F4:
	.long 0x41C64E6D
.L060435F8:
	.long 0x00003039
.L060435FC:
	.long 0x00004FFF
.L06043600:
	.long 0x00001FFF
.L06043604:
	.long 0x007FFFFF
.L06043608:
	.long func_06042A90
.L0604360C:
	.long 0x000001FF
.L06043610:
	.long func_060429E0
.L06043614:
	.long func_0600D1A0
	dlabel D_06043618
	.byte 0x00, 0x00, 0x00, 0xB4
	.long D_06043624
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_06043624
	.byte 0x00, 0x00, 0xFF, 0xA6, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32
	endlabel func_06043378

	glabel func_06043630
	sts.l	pr,@-r15
	mov.l	.L060436A4,r2
	mov.l	.L060436A8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L060436AC,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	@(48,r1),r0
	mov.l	r0,@(48,r3)
	mov.l	@(52,r1),r2
	mov.l	r2,@(52,r3)
	mov.l	@(56,r1),r0
	mov.l	r0,@(56,r3)
	mov.l	r4,@(32,r3)
	mov.l	r5,@(36,r3)
	mov.l	r6,@(40,r3)
	mov.l	r7,@(16,r3)
	mov.l	r10,@(60,r3)
	mov.l	@(32,r1),r0
	mov.l	@(40,r1),r2
	shlr16	r0
	shll16	r0
	shlr16	r2
	or	r2,r0
	mov.l	r0,@(4,r3)
	mov.w	@(24,r1),r0
	mov.w	r0,@(10,r3)
	mov.w	@(22,r1),r0
	mov.w	r0,@(22,r3)
	xor	r0,r0
	mov.w	r0,@(24,r3)
	mov.w	@(26,r1),r0
	mov.w	r0,@(26,r3)
	mov.w	@(28,r1),r0
	mov.w	r0,@(28,r3)
	mov.l	@(752,gbr),r0
	mov.l	.L060436B0,r2
	mul.l	r0,r2
	sts	macl,r2
	mov.l	.L060436B4,r0
	add	r2,r0
	mov.l	r0,@(752,gbr)
	mov	#7,r0
	and	r2,r0
	or	r9,r0
	mov.b	r0,@(2,r3)
	mov.l	.L060436B8,r2
	mov.l	r2,@(12,r3)
	mov.l	@(36,r1),r2
	mov.l	.L060436BC,r0
	add	r2,r0
	mov.l	r0,@(44,r3)
	xor	r0,r0
	mov.w	r0,@(0,r3)
.L060436A0:
	rts
	nop
.L060436A4:
	.long D_060FFFB8
.L060436A8:
	.long func_0600D0D0
.L060436AC:
	.long func_060436C0
.L060436B0:
	.long 0x41C64E6D
.L060436B4:
	.long 0x00003039
.L060436B8:
	.long 0x00010000
.L060436BC:
	.long 0xFFF80000
	endlabel func_06043630

	glabel func_060436C0
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06043768
	mov.w	@(0,r1),r0
	mov	#40,r2
	cmp/gt	r2,r0
	bf	.L060436D2
	tst	#1,r0
	bt	.L060436A0
.L060436D2:
	sts.l	pr,@-r15
	mov.l	.L06043738,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0604373C,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06043740,r13
	jsr	@r13
	mov.w	@(10,r1),r0
	mov.l	@(32,r1),r4
	mov.l	@(36,r1),r5
	mov.l	@(40,r1),r6
	mov.l	@(12,r1),r0
	dmuls.l	r0,r4
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	mov.l	@(12,r1),r0
	dmuls.l	r0,r5
	sts	mach,r0
	sts	macl,r5
	xtrct	r0,r5
	mov.l	@(12,r1),r0
	dmuls.l	r0,r6
	sts	mach,r0
	sts	macl,r6
	xtrct	r0,r6
	mov.l	.L0604373C,r0
	jsr	@r0
	nop
	mov.l	.L06043744,r13
	jsr	@r13
	mov.w	@(22,r1),r0
	mov.l	.L06043740,r13
	jsr	@r13
	mov.w	@(24,r1),r0
	mov.l	.L06043748,r13
	jsr	@r13
	mov.w	@(26,r1),r0
	mov.b	@(2,r1),r0
	tst	#128,r0
	bt	.L06043754
	mov.l	.L0604374C,r0
	jsr	@r0
	mov.l	@(16,r1),r2
	mov.l	.L06043750,r0
	jmp	@r0
	lds.l	@r15+,pr
.L06043738:
	.long func_0600CA24
.L0604373C:
	.long func_0600CBDA
.L06043740:
	.long func_0600CAF8
.L06043744:
	.long func_0600CA7A
.L06043748:
	.long func_0600CB68
.L0604374C:
	.long func_0601F434
.L06043750:
	.long func_0600CA4E
.L06043754:
	mov.l	.L06043760,r0
	jsr	@r0
	mov.l	@(16,r1),r2
	mov.l	.L06043764,r0
	jmp	@r0
	lds.l	@r15+,pr
.L06043760:
	.long func_0601F4A0
.L06043764:
	.long func_0600CA4E
.L06043768:
	mov.w	@(0,r1),r0
	cmp/eq	#60,r0
	bt	.L060437C8
	add	#1,r0
	mov.w	r0,@(0,r1)
	mov.l	@(12,r1),r0
	mov.l	@(60,r1),r2
	add	r2,r0
	mov.l	r0,@(12,r1)
	mov.b	@(2,r1),r0
	mov.w	.L060437C0,r2
	tst	#1,r0
	bt	.L0604378A
	mov.w	@(22,r1),r0
	add	r2,r0
	mov.w	r0,@(22,r1)
	mov.b	@(2,r1),r0
.L0604378A:
	tst	#2,r0
	bt	.L06043796
	mov.w	@(24,r1),r0
	add	r2,r0
	mov.w	r0,@(24,r1)
	mov.b	@(2,r1),r0
.L06043796:
	mov.w	@(26,r1),r0
	add	r2,r0
	mov.w	r0,@(26,r1)
	mov.w	@(4,r1),r0
	shll16	r0
	mov.l	@(48,r1),r2
	add	r0,r2
	mov.l	r2,@(48,r1)
	mov.w	@(6,r1),r0
	shll16	r0
	mov.l	@(56,r1),r2
	add	r0,r2
	mov.l	r2,@(56,r1)
	mov.l	@(44,r1),r0
	mov.l	@(52,r1),r2
	mov.l	.L060437C4,r3
	add	r3,r0
	mov.l	r0,@(44,r1)
	add	r0,r2
	rts
	mov.l	r2,@(52,r1)
.L060437C0:
	.short 0x0800
	.byte 0x00, 0x00
.L060437C4:
	.long 0x00008000
.L060437C8:
	mov.l	.L060437D0,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L060437D0:
	.long func_0600D1A0
	endlabel func_060436C0

	glabel func_060437D4
	sts.l	pr,@-r15
	mov.l	@(60,r7),r3
	mov.l	@(32,r7),r4
	add	r3,r4
	mov	#31,r0
	mov.b	@(r0,r7),r0
	mov.l	r0,@-r15
	mov.l	.L06043800,r2
	jsr	@r2
	mov.l	r4,@-r15
	mov.l	@r15+,r3
	mov.l	@r15+,r0
	mov.l	r7,@-r15
	mov.l	.L06043800,r2
	jsr	@r2
	mov.l	r6,@-r15
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	lds.l	@r15+,pr
	sub	r4,r6
	rts
	sub	r5,r7
.L06043800:
	.long func_06018EB4
	endlabel func_060437D4

	.section .data.06043804,"aw",@progbits
	.p2align 2
	.byte 0xC4, 0x6E, 0x20, 0x08
