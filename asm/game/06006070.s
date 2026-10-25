	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06006070,"ax",@progbits
	.p2align 2

	glabel func_06006070
	mov.l	.L0600608C,r8
	mov.b	@r8,r0
	mov	r0,r10
	add	#1,r0
	and	#7,r0
	mov.l	.L06006090,r9
	shll2	r10
	shll	r10
	add	r10,r9
	mov.l	r3,@r9
	add	#4,r9
	mov	r9,r3
	rts
	nop
.L0600608C:
	.long D_060FFC2C + 0x20000000
.L06006090:
	.long D_060FE48C + 0x20000000
	endlabel func_06006070

	glabel func_06006094
	mov.l	.L060060A8,r8
	mov.w	@r8,r0
	cmp/eq	#-1,r0
	bt	.L060060C8
	cmp/pz	r0
	bf	.L060060B0
	mov.l	.L060060AC,r9
	bra	.L060060B4
	nop
	.byte 0x00, 0x00
.L060060A8:
	.long D_060FFC36 + 0x20000000
.L060060AC:
	.long D_060FE3FC + 0x20000000
.L060060B0:
	mov.l	.L060060C4,r9
	add	#1,r8
.L060060B4:
	mov	#1,r0
	mov.b	r0,@(46,gbr)
	mov.l	r3,@r9
	add	#4,r9
	mov	r9,r3
	rts
	mov	#0,r0
	.byte 0x00, 0x00
.L060060C4:
	.long D_060FE444 + 0x20000000
.L060060C8:
	rts
	mov	#-1,r0
	endlabel func_06006094

	glabel func_060060CC
	mov.l	r14,@-r15
	mov	#0,r4
	mov.l	.L06006258,r6
	mov	r4,r5
	mov.l	.L0600625C,r14
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov.l	.L06006260,r7
	add	#-4,r15
	mov.l	.L06006264,r8
	mov.l	.L06006268,r9
	mov.l	.L0600626C,r10
	mov.l	.L06006270,r11
	mov.l	.L06006274,r12
.L060060EE:
	extu.b	r5,r1
	shll	r1
	mov	r8,r0
	mov.w	r4,@(r0,r1)
	extu.b	r5,r3
	mov.l	.L06006278,r0
	mov.w	r4,@(r0,r1)
	mov.l	.L0600627C,r0
	mov.w	r4,@(r0,r1)
	mov.l	r3,@r15
	mov.l	.L06006280,r0
	mov.b	r4,@(r0,r3)
	mov.l	.L06006284,r0
	mov.l	.L06006288,r3
	mov.w	r4,@(r0,r1)
	mov.l	@r15,r2
	add	r3,r2
	mov.b	r4,@r2
	mov.l	.L0600628C,r0
	mov.w	r4,@(r0,r1)
	mov	r12,r0
	mov.w	r4,@(r0,r1)
	mov.l	.L06006290,r0
	mov.w	r4,@(r0,r1)
	add	r10,r1
	mov.w	r4,@r1
	mov.l	@r15,r2
	add	r11,r2
	mov.b	r4,@r2
	mov.l	@r15,r2
	add	r9,r2
	mov.b	r4,@r2
	add	#1,r5
	mov.b	r4,@r7
	mov	r8,r0
	mov.b	r4,@r14
	add	#1,r7
	mov.b	r4,@r6
	add	#1,r14
	add	#1,r6
	extu.b	r5,r1
	shll	r1
	extu.b	r5,r2
	mov.w	r4,@(r0,r1)
	mov.l	.L06006278,r0
	mov.w	r4,@(r0,r1)
	mov.l	.L0600627C,r0
	mov.w	r4,@(r0,r1)
	mov.l	r2,@r15
	mov.l	.L06006280,r0
	mov.b	r4,@(r0,r2)
	mov.l	.L06006284,r0
	mov.w	r4,@(r0,r1)
	mov.l	@r15,r2
	add	r3,r2
	mov.b	r4,@r2
	mov.l	.L0600628C,r0
	mov.w	r4,@(r0,r1)
	mov	r12,r0
	mov.w	r4,@(r0,r1)
	mov.l	.L06006290,r0
	mov.w	r4,@(r0,r1)
	add	r10,r1
	mov.w	r4,@r1
	add	#1,r5
	mov.l	@r15,r2
	mov	r8,r0
	add	r11,r2
	extu.b	r5,r1
	mov.b	r4,@r2
	shll	r1
	mov.l	@r15,r2
	add	r9,r2
	mov.b	r4,@r2
	extu.b	r5,r2
	mov.b	r4,@r7
	add	#1,r7
	mov.b	r4,@r14
	add	#1,r14
	mov.b	r4,@r6
	add	#1,r6
	mov.w	r4,@(r0,r1)
	mov.l	.L06006278,r0
	mov.w	r4,@(r0,r1)
	mov.l	.L0600627C,r0
	mov.w	r4,@(r0,r1)
	mov.l	r2,@r15
	mov.l	.L06006280,r0
	mov.b	r4,@(r0,r2)
	mov.l	.L06006284,r0
	mov.w	r4,@(r0,r1)
	mov.l	@r15,r2
	add	r3,r2
	mov.b	r4,@r2
	mov.l	.L0600628C,r0
	mov.w	r4,@(r0,r1)
	add	#1,r5
	mov	r12,r0
	mov.w	r4,@(r0,r1)
	mov.l	.L06006290,r0
	mov.w	r4,@(r0,r1)
	add	r10,r1
	mov	r8,r0
	mov.w	r4,@r1
	extu.b	r5,r1
	mov.l	@r15,r2
	shll	r1
	add	r11,r2
	mov.b	r4,@r2
	mov.l	@r15,r2
	add	r9,r2
	mov.b	r4,@r2
	extu.b	r5,r2
	mov.b	r4,@r7
	add	#1,r7
	mov.b	r4,@r14
	add	#1,r14
	mov.b	r4,@r6
	add	#1,r6
	mov.w	r4,@(r0,r1)
	mov.l	.L06006278,r0
	mov.w	r4,@(r0,r1)
	mov.l	.L0600627C,r0
	mov.w	r4,@(r0,r1)
	mov.l	r2,@r15
	mov.l	.L06006280,r0
	mov.b	r4,@(r0,r2)
	mov.l	.L06006284,r0
	add	#1,r5
	mov.w	r4,@(r0,r1)
	mov.l	@r15,r2
	mov.l	.L0600628C,r0
	add	r3,r2
	mov.b	r4,@r2
	mov.w	r4,@(r0,r1)
	mov	r12,r0
	mov.w	r4,@(r0,r1)
	mov.l	.L06006290,r0
	mov.w	r4,@(r0,r1)
	add	r10,r1
	mov.w	r4,@r1
	mov.l	@r15,r2
	mov	#12,r1
	add	r11,r2
	mov.b	r4,@r2
	mov.l	@r15,r2
	add	r9,r2
	mov.b	r4,@r2
	extu.b	r5,r2
	mov.b	r4,@r7
	cmp/ge	r1,r2
	mov.b	r4,@r14
	add	#1,r14
	mov.b	r4,@r6
	add	#1,r6
	bt/s	.L0600622C
	add	#1,r7
	bra	.L060060EE
	nop
.L0600622C:
	mov.l	.L06006294,r5
	mov	r4,r0
	mov.l	.L06006298,r3
	mov.b	r4,@r5
	mov.b	r0,@(1,r5)
	mov.b	r0,@r3
	add	#4,r15
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	rts
	mov.l	@r15+,r14
	.byte 0xD5, 0x12, 0xE4, 0x00, 0xD3, 0x12, 0x60, 0x43, 0x25, 0x40, 0x80, 0x51, 0x00, 0x0B, 0x23, 0x00
.L06006258:
	.long D_060FF04E
.L0600625C:
	.long D_060FF042
.L06006260:
	.long D_060FF036
.L06006264:
	.long D_060FEF2E
.L06006268:
	.long D_060FF02A
.L0600626C:
	.long D_060FF006
.L06006270:
	.long D_060FF01E
.L06006274:
	.long D_060FEFD6
.L06006278:
	.long D_060FEF5E
.L0600627C:
	.long D_060FEF76
.L06006280:
	.long D_060FEF8E
.L06006284:
	.long D_060FEF9A
.L06006288:
	.long D_060FEFB2
.L0600628C:
	.long D_060FEFBE
.L06006290:
	.long D_060FEFEE
.L06006294:
	.long D_060FF05A
.L06006298:
	.long D_060FF068
	endlabel func_060060CC

	glabel func_0600629C
	mov.l	.L0600638C,r5
	mov.b	@r5,r0
	extu.b	r0,r0
	cmp/eq	#1,r0
	bt	.L06006300
	mov	#1,r4
	mov.l	.L06006390,r2
	mov.b	r4,@r5
	mov.w	.L06006384,r6
	mov	#0,r5
	mov.b	r5,@r2
.L060062B2:
	add	#-1,r6
	extu.w	r6,r0
	tst	r0,r0
	bf	.L060062B2
	mov.l	.L06006394,r6
.L060062BC:
	mov.b	@r6,r2
	extu.b	r2,r2
	and	r4,r2
	cmp/eq	r4,r2
	bt	.L060062BC
	mov.b	r4,@r6
	mov.l	.L06006398,r2
	mov.b	r5,@r2
	mov.l	.L0600639C,r3
	mov.b	r5,@r3
	mov.l	.L060063A0,r7
	mov.l	.L060063A4,r6
	mov.l	@r6,r0
	tst	r0,r0
	bt/s	.L060062EE
	mov	#8,r3
	mov.l	@r6,r1
	add	#-1,r1
	mov.l	r1,@r6
	mov.b	r4,@r7
	mov.l	.L060063A8,r4
	mov.l	@r4,r0
	add	#1,r0
	bra	.L060062F0
	mov.l	r0,@r4
.L060062EE:
	mov.b	r5,@r7
.L060062F0:
	mov.l	.L060063AC,r2
	mov.b	r3,@r2
	mov.w	.L06006386,r1
	mov	#16,r3
	mov.l	.L060063B0,r0
	mov.b	r1,@r0
	mov.l	.L060063B4,r1
	mov.b	r3,@r1
.L06006300:
	rts
	nop
	endlabel func_0600629C

	glabel func_06006304
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	add	#-68,r15
	mov.l	.L060063B8,r4
	mov.b	@r4,r0
	mov.w	.L06006388,r3
	extu.b	r0,r0
	and	#128,r0
	cmp/eq	r3,r0
	bt	.L06006326
	bra	.L06006996
	nop
.L06006326:
	mov.b	@r4,r0
	mov.l	.L0600639C,r7
	and	#127,r0
	mov.b	r0,@r4
	mov.l	.L060063A8,r4
	mov.l	@r4,r0
	tst	r0,r0
	bt	.L060063CC
	mov.l	@r4,r3
	mov.l	.L060063C0,r6
	add	#-1,r3
	mov.l	r3,@r4
	mov.l	.L060063BC,r4
	bra	.L0600634E
	mov	#7,r5
.L06006344:
	mov.b	@r4,r2
	add	#-1,r5
	mov.b	r2,@r6
	add	#2,r4
	add	#1,r6
.L0600634E:
	tst	r5,r5
	bf	.L06006344
	add	#2,r4
	mov.l	.L060063C4,r2
	mov	#4,r5
	mov.l	.L060063C8,r6
	mov.b	@r4,r3
	mov.b	r3,@r2
	add	#6,r4
.L06006360:
	mov.b	@r4,r2
	add	#-2,r5
	mov.b	r2,@r6
	add	#2,r4
	mov.b	@r4,r2
	tst	r5,r5
	add	#1,r6
	mov.b	r2,@r6
	add	#1,r6
	bf/s	.L06006360
	add	#2,r4
	mov.b	@r7,r0
	mov.l	.L060063A0,r2
	xor	#128,r0
	mov.b	r0,@r7
	mov.b	@r7,r3
	bra	.L06006996
	mov.b	r3,@r2
.L06006384:
	.short 0x03E8
.L06006386:
	.short 0x00F0
.L06006388:
	.short 0x0080
	.byte 0x00, 0x00
.L0600638C:
	.long D_060FF068
.L06006390:
	.long D_060FF12A
.L06006394:
	.long SMPC_REGS + 0x63
.L06006398:
	.long SMPC_REGS + 0x7D
.L0600639C:
	.long D_060FF12B
.L060063A0:
	.long SMPC_REGS + 0x1
.L060063A4:
	.long D_06051298
.L060063A8:
	.long D_0605129C
.L060063AC:
	.long SMPC_REGS + 0x3
.L060063B0:
	.long SMPC_REGS + 0x5
.L060063B4:
	.long SMPC_REGS + 0x1F
.L060063B8:
	.long SCU_REGS + 0xA7
.L060063BC:
	.long SMPC_REGS + 0x23
.L060063C0:
	.long D_06064F98
.L060063C4:
	.long D_06064F9F
.L060063C8:
	.long D_06064FA0
.L060063CC:
	mov.l	.L060064F0,r4
	mov.l	.L060064F4,r6
	mov.l	.L060064F8,r5
	mov	r4,r3
	mov.b	@r5,r13
	add	#64,r3
	mov.b	@r3,r0
	mov	r13,r14
	shll2	r14
	shll2	r14
	extu.b	r0,r0
	and	#32,r0
	cmp/eq	#32,r0
	bf/s	.L0600641E
	shll2	r14
	bra	.L060063F8
	mov	r14,r13
.L060063EE:
	extu.b	r13,r0
	mov.b	@r4,r3
	add	#2,r13
	mov.b	r3,@(r0,r6)
	add	#2,r4
.L060063F8:
	mov.b	@r5,r3
	extu.b	r13,r2
	extu.b	r3,r3
	shll2	r3
	shll2	r3
	shll2	r3
	add	#64,r3
	cmp/ge	r3,r2
	bf	.L060063EE
	mov.b	@r5,r3
	add	#1,r3
	mov.b	r3,@r5
	mov.b	@r7,r0
	xor	#128,r0
	mov.b	r0,@r7
	mov.b	@r7,r2
	mov.l	.L060064FC,r3
	bra	.L06006996
	mov.b	r2,@r3
.L0600641E:
	extu.b	r13,r13
	tst	r13,r13
	bt	.L06006446
	bra	.L06006432
	mov	r14,r7
.L06006428:
	mov.b	@r4,r3
	extu.b	r7,r0
	mov.b	r3,@(r0,r6)
	add	#2,r4
	add	#2,r7
.L06006432:
	extu.b	r7,r2
	mov.b	@r5,r3
	extu.b	r3,r3
	shll2	r3
	shll2	r3
	shll2	r3
	add	#64,r3
	cmp/ge	r3,r2
	bf	.L06006428
	mov	r6,r4
.L06006446:
	mov	#0,r5
	mov	#20,r0
	mov	r15,r6
	mov.b	r5,@(r0,r15)
	add	#52,r6
	mov	r6,r11
	mov	r6,r10
	add	#1,r10
	mov	r6,r3
	add	#2,r3
	mov	r3,r7
	mov.l	r7,@(8,r15)
	mov	r11,r2
	add	#3,r2
	mov	r11,r1
	mov.l	r2,@(12,r15)
	add	#5,r6
	add	#4,r1
	mov.l	r1,@(16,r15)
	mov.l	r7,@(8,r15)
	mov.l	@(12,r15),r13
	mov.l	r13,@(12,r15)
	mov.l	@(16,r15),r14
	mov.l	r14,@(16,r15)
	mov.l	r7,@(8,r15)
	mov.l	r13,@(12,r15)
	mov.l	r14,@(16,r15)
	mov.l	r6,@(24,r15)
	mov.l	r7,@(8,r15)
	mov.l	r13,@(12,r15)
	mov.l	r14,@(16,r15)
	mov.l	.L06006500,r12
	mov.w	.L060064EE,r7
	bra	.L06006986
	mov	#15,r9
.L0600648C:
	mov	#20,r0
	mov.b	@(r0,r15),r14
	mov.b	@r4,r0
	extu.b	r14,r14
	mov	r14,r3
	shll	r14
	shll2	r3
	add	r3,r14
	extu.b	r0,r0
	cmp/eq	#22,r0
	bf	.L060064B6
	mov	#6,r2
	mov.l	.L06006504,r3
	mov	#20,r0
	mov.b	r2,@r3
	mov.b	@(r0,r15),r1
	mov.l	.L06006508,r0
	extu.b	r1,r1
	mov.b	r2,@(r0,r1)
	bra	.L060064D8
	nop
.L060064B6:
	mov	#1,r3
	mov.l	.L06006504,r1
	mov	r5,r13
	mov.b	r3,@r1
	mov	r14,r6
	add	r12,r6
.L060064C2:
	add	#3,r13
	mov.b	r5,@r6
	mov	#6,r2
	add	#1,r6
	extu.b	r13,r3
	mov.b	r5,@r6
	cmp/ge	r2,r3
	add	#1,r6
	mov.b	r5,@r6
	bf/s	.L060064C2
	add	#1,r6
.L060064D8:
	mov.b	@r4,r1
	extu.b	r1,r1
	cmp/eq	r7,r1
	bf/s	.L0600650C
	mov	r5,r6
	mov	#20,r0
	mov.b	@(r0,r15),r2
	extu.b	r2,r2
	mov.l	.L06006508,r0
	bra	.L0600650E
	mov.b	r5,@(r0,r2)
.L060064EE:
	.short 0x00F0
.L060064F0:
	.long SMPC_REGS + 0x21
.L060064F4:
	.long D_060FF06A
.L060064F8:
	.long D_060FF12A
.L060064FC:
	.long SMPC_REGS + 0x1
.L06006500:
	.long D_060FF05C
.L06006504:
	.long D_060FF069
.L06006508:
	.long D_060FF05A
.L0600650C:
	add	#2,r4
.L0600650E:
	mov	r14,r13
	mov.l	.L06006604,r3
	mov	#20,r0
	mov.l	.L0600660C,r1
	shll	r13
	mov.l	.L06006608,r2
	add	r3,r13
	mov.l	r13,@(36,r15)
	add	r14,r2
	mov.l	r2,@(32,r15)
	mov.l	r13,@(28,r15)
	mov.b	@(r0,r15),r13
	extu.b	r13,r13
	bra	.L0600696C
	add	r1,r13
.L0600652C:
	extu.b	r6,r0
	add	r14,r0
	mov.b	r5,@(r0,r12)
	mov.b	@r4,r0
	extu.b	r0,r0
	cmp/eq	#2,r0
	bf	.L0600653E
	bra	.L06006654
	nop
.L0600653E:
	cmp/eq	#21,r0
	bf	.L06006546
	bra	.L060066AC
	nop
.L06006546:
	cmp/eq	#22,r0
	bf	.L0600654E
	bra	.L06006744
	nop
.L0600654E:
	mov.w	.L060065F8,r1
	cmp/eq	r1,r0
	bt	.L06006576
	mov.w	.L060065FA,r1
	cmp/eq	r1,r0
	bt	.L060065AE
	mov.w	.L060065FC,r1
	cmp/eq	r1,r0
	bt	.L0600661C
	mov.w	.L060065FE,r1
	cmp/eq	r1,r0
	bt	.L06006570
	mov.w	.L06006600,r1
	cmp/eq	r1,r0
	bt	.L06006570
	bra	.L06006818
	nop
.L06006570:
	mov.l	.L06006610,r8
	bra	.L0600681A
	add	#2,r4
.L06006576:
	add	#2,r4
	mov.b	@r4,r2
	mov.b	r2,@r11
	mov.b	@r11,r8
	extu.b	r8,r8
	mov.b	@r13,r0
	mov	r8,r3
	and	r9,r3
	shll2	r3
	shll2	r3
	mov	r8,r2
	mov.l	.L06006614,r8
	and	r7,r2
	shar	r2
	shar	r2
	shar	r2
	shar	r2
	add	r2,r3
	or	r3,r8
	cmp/eq	#6,r0
	bt/s	.L060065A6
	add	#2,r4
	mov	#1,r2
	mov.b	r2,@r13
.L060065A6:
	extu.b	r6,r0
	add	r14,r0
	bra	.L060066A8
	mov	#1,r3
.L060065AE:
	add	#2,r4
	mov.b	@r4,r3
	add	#2,r4
	mov.b	r3,@r11
	mov.b	@r4,r2
	mov.b	r2,@r10
	mov.b	@r11,r8
	mov.b	@r10,r1
	extu.b	r8,r8
	mov.b	@r13,r0
	extu.b	r1,r1
	mov	r8,r3
	and	r9,r3
	shll2	r3
	shll2	r3
	mov	r8,r2
	and	r7,r2
	mov.l	.L06006618,r8
	and	r7,r1
	shar	r2
	shar	r2
	shar	r2
	shar	r2
	add	r2,r3
	shll2	r1
	shll2	r1
	add	r1,r3
	or	r3,r8
	cmp/eq	#6,r0
	bt/s	.L060065F0
	add	#2,r4
	mov	#2,r2
	mov.b	r2,@r13
.L060065F0:
	extu.b	r6,r0
	add	r14,r0
	bra	.L060066A8
	mov	#2,r3
.L060065F8:
	.short 0x00E1
.L060065FA:
	.short 0x00E2
.L060065FC:
	.short 0x00E3
.L060065FE:
	.short 0x00F0
.L06006600:
	.short 0x00FF
	.byte 0x00, 0x00
.L06006604:
	.long D_060FEF9A
.L06006608:
	.long D_060FEF8E
.L0600660C:
	.long D_060FF05A
.L06006610:
	.long 0x0000FFFF
.L06006614:
	.long 0x0000FF00
.L06006618:
	.long 0x0000F000
.L0600661C:
	mov.l	@(8,r15),r1
	extu.b	r6,r3
	mov.l	.L060067F0,r0
	mov.l	r3,@r15
	mov.l	@r15,r8
	add	r14,r3
	mov.l	.L060067F4,r2
	add	r14,r8
	add	r0,r3
	shll	r8
	mov.l	.L060067F8,r0
	add	r8,r2
	mov.w	r5,@(r0,r8)
	mov.w	r5,@r2
	mov.b	r5,@r3
	mov.b	r5,@r1
	mov.b	r5,@r10
	mov.b	r5,@r11
	mov.l	.L060067FC,r8
	mov.b	@r13,r0
	cmp/eq	#6,r0
	bt/s	.L0600664E
	extu.b	r6,r0
	mov	#4,r2
	mov.b	r2,@r13
.L0600664E:
	add	r14,r0
	bra	.L060066A8
	mov	#4,r3
.L06006654:
	add	#2,r4
	mov.b	@r4,r3
	mov.b	r3,@r11
	add	#2,r4
	mov.b	@r4,r2
	mov.b	r2,@r10
	mov.b	@r11,r8
	extu.b	r8,r8
	mov.b	@r10,r1
	mov	r8,r3
	and	r9,r3
	shll2	r3
	shll2	r3
	mov	r8,r2
	and	r7,r2
	shar	r2
	shar	r2
	shar	r2
	shar	r2
	add	r2,r3
	extu.b	r1,r1
	mov.l	r1,@r15
	mov.l	@r15,r0
	and	r7,r1
	shll2	r1
	shll2	r1
	add	r1,r3
	and	#8,r0
	shll8	r0
	shll	r0
	add	r0,r3
	mov.l	.L06006800,r8
	mov.b	@r13,r0
	or	r3,r8
	cmp/eq	#6,r0
	bt/s	.L060066A2
	add	#2,r4
	mov	#3,r2
	mov.b	r2,@r13
.L060066A2:
	extu.b	r6,r0
	add	r14,r0
	mov	#3,r3
.L060066A8:
	bra	.L06006820
	mov.b	r3,@(r0,r12)
.L060066AC:
	add	#2,r4
	mov.b	@r4,r3
	mov.b	r3,@r11
	add	#2,r4
	mov.b	@r4,r2
	add	#2,r4
	mov.b	r2,@r10
	mov.l	@(8,r15),r3
	mov.b	@r4,r2
	add	#2,r4
	mov.b	r2,@r3
	mov.l	@(12,r15),r3
	mov.b	@r4,r2
	add	#2,r4
	mov.b	r2,@r3
	mov.l	@(16,r15),r3
	mov.b	@r4,r2
	mov.b	r2,@r3
	mov.b	@r11,r3
	extu.b	r3,r3
	mov.l	r3,@r15
	and	r9,r3
	mov.l	@r15,r2
	shll2	r3
	shll2	r3
	and	r7,r2
	shar	r2
	shar	r2
	shar	r2
	shar	r2
	add	r2,r3
	mov	#8,r1
	mov.b	@r13,r0
	mov.b	@r10,r8
	extu.b	r8,r8
	mov	r8,r2
	and	r7,r2
	shll2	r2
	shll2	r2
	add	r2,r3
	and	r8,r1
	shll8	r1
	mov.l	.L06006800,r8
	shll	r1
	add	r1,r3
	or	r3,r8
	cmp/eq	#6,r0
	bt/s	.L06006712
	add	#2,r4
	mov	#5,r2
	mov.b	r2,@r13
.L06006712:
	extu.b	r6,r0
	mov.l	r0,@r15
	mov	#5,r3
	add	r14,r0
	mov.b	r3,@(r0,r12)
	mov.l	@r15,r2
	add	r14,r2
	mov.l	.L06006804,r0
	mov.l	@(8,r15),r3
	mov.b	@r3,r3
	mov.b	r3,@(r0,r2)
	mov.l	@r15,r2
	add	r14,r2
	mov.l	.L06006808,r0
	mov.l	@(12,r15),r3
	mov.b	@r3,r3
	mov.b	r3,@(r0,r2)
	mov.l	@r15,r2
	add	r14,r2
	mov.l	.L0600680C,r0
	mov.l	@(16,r15),r3
	mov.b	@r3,r3
	mov.b	r3,@(r0,r2)
	bra	.L06006820
	nop
.L06006744:
	add	#2,r4
	mov.b	@r4,r3
	mov.b	r3,@r11
	add	#2,r4
	mov.b	@r4,r2
	add	#2,r4
	mov.b	r2,@r10
	mov.l	@(8,r15),r3
	mov.b	@r4,r2
	add	#2,r4
	mov.b	r2,@r3
	mov.l	@(12,r15),r3
	mov.b	@r4,r2
	add	#2,r4
	mov.b	r2,@r3
	mov.l	@(16,r15),r3
	mov.b	@r4,r2
	add	#2,r4
	mov.b	r2,@r3
	mov.l	@(24,r15),r3
	mov.b	@r4,r2
	mov.b	r2,@r3
	mov.b	@r11,r8
	extu.b	r8,r8
	mov	r8,r3
	and	r9,r3
	shll2	r3
	shll2	r3
	mov	r8,r2
	and	r7,r2
	shar	r2
	shar	r2
	mov.b	@r10,r1
	shar	r2
	mov.l	.L06006800,r8
	extu.b	r1,r1
	mov.l	r1,@r15
	shar	r2
	mov.l	@r15,r0
	and	r7,r1
	add	r2,r3
	shll2	r1
	shll2	r1
	add	r1,r3
	and	#8,r0
	shll8	r0
	shll	r0
	add	r0,r3
	mov.b	@r13,r0
	or	r3,r8
	cmp/eq	#6,r0
	bt/s	.L060067B2
	add	#2,r4
	mov	#7,r2
	mov.b	r2,@r13
.L060067B2:
	extu.b	r6,r0
	mov.l	r0,@r15
	mov	#7,r3
	add	r14,r0
	mov.b	r3,@(r0,r12)
	mov.l	@r15,r2
	add	r14,r2
	mov.l	.L06006804,r0
	mov.l	@(8,r15),r3
	mov.b	@r3,r3
	mov.b	r3,@(r0,r2)
	mov.l	@r15,r2
	add	r14,r2
	mov.l	.L06006808,r0
	mov.l	@(12,r15),r3
	mov.b	@r3,r3
	mov.b	r3,@(r0,r2)
	mov.l	@r15,r2
	add	r14,r2
	mov.l	.L06006810,r0
	mov.l	@(16,r15),r3
	mov.b	@r3,r3
	mov.b	r3,@(r0,r2)
	mov.l	@r15,r2
	add	r14,r2
	mov.l	.L06006814,r0
	mov.l	@(24,r15),r3
	mov.b	@r3,r3
	mov.b	r3,@(r0,r2)
	bra	.L06006820
	nop
.L060067F0:
	.long D_060FEFB2
.L060067F4:
	.long D_060FEFBE
.L060067F8:
	.long D_060FEFD6
.L060067FC:
	.long 0x0000FFFF
.L06006800:
	.long 0x0000E000
.L06006804:
	.long D_060FF01E
.L06006808:
	.long D_060FF02A
.L0600680C:
	.long D_060FF036
.L06006810:
	.long D_060FF042
.L06006814:
	.long D_060FF04E
.L06006818:
	mov	r5,r8
.L0600681A:
	extu.b	r6,r0
	add	r14,r0
	mov.b	r5,@(r0,r12)
.L06006820:
	mov.l	.L06006914,r3
	not	r8,r8
	extu.b	r6,r2
	mov.l	r2,@(4,r15)
	add	r14,r2
	shll	r2
	mov.l	r2,@r15
	add	r3,r2
	mov.l	r2,@(48,r15)
	mov.l	@(4,r15),r0
	add	r14,r0
	mov.b	@(r0,r12),r1
	extu.b	r1,r1
	mov	#40,r0
	mov.w	r1,@r2
	mov.l	.L06006918,r2
	mov.l	@r15,r1
	add	r2,r1
	mov.l	r1,@(4,r15)
	mov.w	@r1,r3
	mov.w	r3,@(r0,r15)
	mov	r15,r1
	mov.l	.L0600691C,r3
	add	#40,r1
	mov.l	@r15,r0
	add	r3,r0
	mov.w	@r1,r2
	extu.w	r2,r2
	mov.l	r2,@(44,r15)
	not	r2,r2
	and	r8,r2
	mov.w	r2,@r0
	mov.l	@(4,r15),r0
	mov.w	r8,@r0
	mov.l	@(4,r15),r2
	mov.w	@r2,r1
	mov.w	r1,@r15
	mov.l	@(48,r15),r0
	mov.w	@r0,r0
	mov.w	r0,@(4,r15)
	mov.w	@(4,r15),r0
	mov	r0,r8
	mov	r8,r0
	cmp/eq	#4,r0
	bt	.L0600689E
	extu.b	r6,r1
	mov.l	.L06006920,r0
	add	r14,r1
	mov.l	.L06006924,r3
	shll	r1
	mov.l	r1,@(4,r15)
	mov.w	r5,@(r0,r1)
	mov.l	@(4,r15),r2
	add	r3,r2
	mov.w	r5,@r2
	mov.l	.L06006928,r2
	mov.l	@(4,r15),r1
	add	r2,r1
	mov.w	r5,@r1
	mov.l	.L0600692C,r3
	mov.l	@(4,r15),r1
	add	r3,r1
	mov.w	r5,@r1
.L0600689E:
	mov	r8,r0
	cmp/eq	#5,r0
	bt	.L060068C6
	mov	r8,r0
	cmp/eq	#7,r0
	bt	.L060068C6
	extu.b	r6,r3
	mov.l	.L06006930,r0
	mov.l	r3,@(4,r15)
	mov.w	.L06006912,r2
	add	r14,r3
	mov.b	r2,@(r0,r3)
	mov.l	@(4,r15),r3
	mov.l	.L06006934,r0
	add	r14,r3
	mov.b	r2,@(r0,r3)
	mov.l	@(4,r15),r3
	mov.l	.L06006938,r0
	add	r14,r3
	mov.b	r2,@(r0,r3)
.L060068C6:
	mov	r8,r0
	cmp/eq	#7,r0
	bt	.L060068DC
	mov.l	.L0600693C,r0
	extu.b	r6,r8
	mov	r14,r2
	add	r8,r2
	mov.b	r5,@(r0,r2)
	add	r14,r8
	mov.l	.L06006940,r0
	mov.b	r5,@(r0,r8)
.L060068DC:
	mov.w	@r15,r3
	extu.w	r3,r3
	mov.l	@(44,r15),r2
	cmp/eq	r2,r3
	bf	.L0600694C
	extu.b	r6,r1
	mov.l	.L06006944,r0
	add	r14,r1
	mov.b	@(r0,r1),r3
	tst	r3,r3
	bt	.L06006908
	extu.b	r6,r8
	mov	r14,r3
	add	r8,r3
	mov.b	@(r0,r3),r2
	add	r14,r8
	add	#-1,r2
	shll	r8
	mov.b	r2,@(r0,r3)
	mov.l	.L06006948,r0
	bra	.L06006958
	mov.w	r5,@(r0,r8)
.L06006908:
	mov.l	@(28,r15),r2
	mov.w	@r15,r3
	mov.w	r3,@r2
	bra	.L06006958
	nop
.L06006912:
	.short 0x0080
.L06006914:
	.long D_060FEF2E
.L06006918:
	.long D_060FEF5E
.L0600691C:
	.long D_060FEF76
.L06006920:
	.long D_060FEFBE
.L06006924:
	.long D_060FEFD6
.L06006928:
	.long D_060FEFEE
.L0600692C:
	.long D_060FF006
.L06006930:
	.long D_060FF01E
.L06006934:
	.long D_060FF02A
.L06006938:
	.long D_060FF036
.L0600693C:
	.long D_060FF042
.L06006940:
	.long D_060FF04E
.L06006944:
	.long D_060FEF8E
.L06006948:
	.long D_060FEF9A
.L0600694C:
	mov.l	@(32,r15),r1
	mov	#32,r3
	mov.b	r3,@r1
	mov.l	@(36,r15),r2
	mov.w	@r15,r3
	mov.w	r3,@r2
.L06006958:
	mov.l	@(36,r15),r3
	add	#1,r6
	add	#2,r3
	mov.l	r3,@(36,r15)
	mov.l	@(32,r15),r2
	add	#1,r2
	mov.l	r2,@(32,r15)
	mov.l	@(28,r15),r1
	add	#2,r1
	mov.l	r1,@(28,r15)
.L0600696C:
	mov.l	.L060069A8,r1
	extu.b	r6,r3
	mov.b	@r1,r2
	extu.b	r2,r2
	cmp/ge	r2,r3
	bt	.L0600697C
	bra	.L0600652C
	nop
.L0600697C:
	mov	#20,r0
	mov.b	@(r0,r15),r2
	add	#1,r2
	mov	#20,r0
	mov.b	r2,@(r0,r15)
.L06006986:
	mov	#20,r0
	mov.b	@(r0,r15),r3
	mov	#2,r2
	extu.b	r3,r3
	cmp/ge	r2,r3
	bt	.L06006996
	bra	.L0600648C
	nop
.L06006996:
	add	#68,r15
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L060069A8:
	.long D_060FF069
	endlabel func_06006304

	glabel func_060069AC
	mov.l	.L06006AE0,r2
	mov.l	@r2,r3
	jmp	@r3
	nop
	endlabel func_060069AC

	glabel func_060069B4
	sts.l	pr,@-r15
	mov.l	.L06006AE4,r1
	bsrf	r1
	nop
	tst	#32,r0
	bt	.L060069C8
	mov.l	.L06006AE0,r2
	mov.l	@r2,r3
	jsr	@r3
	nop
.L060069C8:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_060069B4

	glabel file_init
	sts.l	pr,@-r15
	mov.l	.L06006AE8,r1
	bsrf	r1
	nop
	tst	#32,r0
	bt	.L060069DE
	bsr	func_060069AC
	nop
.L060069DE:
	mov	#1,r3
	mov.l	.L06006AEC,r6
	mov.l	.L06006AEC,r2
	mov.l	.L06006AF4,r5
	mov	r2,r1
	mov.l	r3,@r2
	mov.l	.L06006AF0,r3
	mov.l	r3,@(8,r1)
	mov.w	.L06006ADE,r3
	mov.l	r3,@(4,r2)
	mov.l	.L06006AF8,r3
	bsrf	r3
	mov	#4,r4
	cmp/pz	r0
	bt	.L06006A04
	mov.l	.L06006AE0,r2
	mov.l	@r2,r3
	jsr	@r3
	nop
.L06006A04:
	mov.l	.L06006AFC,r6
	mov	#2,r5
	mov.l	.L06006B00,r3
	bsrf	r3
	mov	#1,r4
	mov	#0,r2
	mov.l	.L06006B04,r3
	mov.l	r2,@r3
	mov.l	.L06006B08,r1
	mov.l	r2,@r1
	mov.l	.L06006B0C,r3
	lds.l	@r15+,pr
	rts
	mov.l	r2,@r3
	endlabel file_init

	glabel func_06006A20
	sts.l	pr,@-r15
	add	#-24,r15
	mov.l	.L06006B10,r3
	mov.b	r4,@r15
	bsrf	r3
	nop
	tst	#32,r0
	bt	.L06006A34
	bsr	func_060069AC
	nop
.L06006A34:
	mov	#2,r5
	mov	r15,r2
	add	#4,r2
	mov	r15,r3
	mov.l	r5,@r2
	mov	#0,r4
	mov.b	@r15,r0
	mov	r15,r2
	add	#4,r3
	add	#4,r2
	mov.b	r0,@(4,r3)
	mov	r15,r3
	add	#4,r3
	mov	r4,r0
	mov.b	r0,@(5,r3)
	mov	r15,r3
	add	#4,r3
	mov.l	r5,@(8,r3)
	mov.b	@r15,r0
	mov	r15,r3
	mov.b	r0,@(12,r2)
	add	#4,r3
	mov	r4,r0
	mov.b	r0,@(13,r3)
	mov	r15,r3
	add	#4,r3
	mov	#16,r0
	mov.b	r4,@(r0,r3)
	mov.l	.L06006B14,r3
	mov	r15,r4
	add	#4,r4
	bsrf	r3
	nop
	add	#24,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06006A20

	glabel func_06006A7E
	sts.l	pr,@-r15
	mov.l	.L06006B18,r3
	add	#-24,r15
	mov.b	r4,@r15
	bsrf	r3
	nop
	tst	#32,r0
	bt	.L06006A92
	bsr	func_060069AC
	nop
.L06006A92:
	mov	#2,r5
	mov	r15,r2
	add	#4,r2
	mov.l	r5,@r2
	mov	r15,r3
	mov.b	@r15,r0
	mov	#0,r4
	add	#4,r3
	mov	r15,r2
	mov.b	r0,@(4,r3)
	add	#4,r2
	mov	r15,r3
	add	#4,r3
	mov	r4,r0
	mov.b	r0,@(5,r3)
	mov	r15,r3
	add	#4,r3
	mov.l	r5,@(8,r3)
	mov	r15,r3
	mov.b	@r15,r0
	add	#4,r3
	mov.b	r0,@(12,r2)
	mov	r4,r0
	mov.b	r0,@(13,r3)
	mov	#15,r2
	mov	r15,r3
	add	#4,r3
	mov	#16,r0
	mov	r15,r4
	mov.b	r2,@(r0,r3)
	add	#4,r4
	mov.l	.L06006B1C,r3
	bsrf	r3
	nop
	add	#24,r15
	lds.l	@r15+,pr
	rts
	nop
.L06006ADE:
	.short 0x00C0
.L06006AE0:
	.long BIOS_WORK + 0x26C
.L06006AE4:
	.long 0x00061812
.L06006AE8:
	.long 0x000617F8
.L06006AEC:
	.long D_06064FA8
.L06006AF0:
	.long D_06064FB4
.L06006AF4:
	.long D_060661B8
.L06006AF8:
	.long 0x0006414C
.L06006AFC:
	.long D_060670B8
.L06006B00:
	.long 0x000621D4
.L06006B04:
	.long file_queue_head
.L06006B08:
	.long file_queue_tail
.L06006B0C:
	.long file_busy_count
.L06006B10:
	.long 0x000617A2
.L06006B14:
	.long 0x00061656
.L06006B18:
	.long 0x00061744
.L06006B1C:
	.long 0x000615F6
	endlabel func_06006A7E

	glabel func_06006B20
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	.L06006C28,r3
	bsrf	r3
	nop
	tst	#32,r0
	bt	.L06006B32
	bsr	func_060069AC
	nop
.L06006B32:
	mov	r15,r2
	mov	#3,r3
	mov	r15,r4
	mov.l	r3,@r2
	mov.l	.L06006C2C,r2
	bsrf	r2
	nop
	add	#8,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06006B20

	glabel func_06006B48
	sts.l	pr,@-r15
	add	#-20,r15
	mov.l	.L06006C30,r3
	bsrf	r3
	nop
	tst	#32,r0
	bt	.L06006B5A
	bsr	func_060069AC
	nop
.L06006B5A:
	mov	#3,r4
	mov	r15,r2
	mov	r15,r3
	mov.l	r4,@r2
	mov	#16,r0
	mov.l	r4,@(8,r3)
	mov	r15,r2
	mov.w	.L06006C22,r3
	mov	r15,r4
	mov.b	r3,@(r0,r2)
	mov.l	.L06006C34,r3
	bsrf	r3
	nop
	add	#20,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06006B48

	glabel load_sound_driver
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	mov.l	.L06006C38,r12
	mov.l	.L06006C3C,r3
	bsrf	r3
	nop
	tst	#32,r0
	bt	.L06006B94
	bsr	func_060069AC
	nop
.L06006B94:
	mov.l	.L06006C40,r13
	mov	#1,r14
.L06006B98:
	mov.b	@r13,r3
	extu.b	r3,r3
	and	r14,r3
	cmp/eq	r14,r3
	bt	.L06006B98
	mov	#7,r3
	mov.l	.L06006C44,r2
	mov.b	r14,@r13
	mov.b	r3,@r2
.L06006BAA:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L06006BAA
	mov	#2,r3
	mov.l	.L06006C48,r2
	mov	#0,r4
	mov.w	.L06006C24,r5
	mov.b	r3,@r2
.L06006BBC:
	mov.l	r4,@r12
	add	#-2,r5
	add	#4,r12
	tst	r5,r5
	mov.l	r4,@r12
	bf/s	.L06006BBC
	add	#4,r12
	mov.l	.L06006C4C,r4
	mov.l	.L06006C50,r3
	bsrf	r3
	nop
	mov	#-1,r7
	mov.l	.L06006C38,r6
	mov	#0,r5
	mov.l	.L06006C58,r3
	mov.l	.L06006C54,r2
	mov.l	r0,@r2
	bsrf	r3
	mov	r0,r4
	cmp/pz	r0
	bt	.L06006BEE
	mov.l	.L06006C5C,r2
	mov.l	@r2,r3
	jsr	@r3
	nop
.L06006BEE:
	mov.b	@r13,r0
	extu.b	r0,r0
	and	r14,r0
	cmp/eq	r14,r0
	bt	.L06006BEE
	mov.b	r14,@r13
	mov	#6,r2
	mov.l	.L06006C44,r3
	mov.b	r2,@r3
.L06006C00:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L06006C00
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel load_sound_driver

	glabel file_load
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov.l	.L06006C60,r6
	bsr	file_queue
	mov	#2,r7
	mov.l	.L06006C64,r14
	bra	.L06006C6C
	nop
.L06006C22:
	.short 0x00FF
.L06006C24:
	.short 0x2C00
	.byte 0x00, 0x00
.L06006C28:
	.long 0x000616A4
.L06006C2C:
	.long 0x0006162A
.L06006C30:
	.long 0x0006167C
.L06006C34:
	.long 0x00061558
.L06006C38:
	.long SCSP_RAM
.L06006C3C:
	.long 0x00061642
.L06006C40:
	.long SMPC_REGS + 0x63
.L06006C44:
	.long SMPC_REGS + 0x1F
.L06006C48:
	.long SCSP_REGS + 0x400
.L06006C4C:
	.long D_06051248
.L06006C50:
	.long 0x0006412A
.L06006C54:
	.long D_06067184
.L06006C58:
	.long 0x000645E8
.L06006C5C:
	.long BIOS_WORK + 0x26C
.L06006C60:
	.long D_060671CC
.L06006C64:
	.long file_busy_count
.L06006C68:
	bsr	file_server
	nop
.L06006C6C:
	mov.l	@r14,r0
	tst	r0,r0
	bf	.L06006C68
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel file_load

	glabel file_queue_list
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	bra	.L06006C88
	mov	r4,r14
.L06006C80:
	mov.l	@r14+,r5
	mov.l	@r14+,r6
	bsr	file_queue
	mov.l	@r14+,r7
.L06006C88:
	mov.l	@r14+,r4
	cmp/pz	r4
	bt	.L06006C80
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel file_queue_list

	glabel file_queue
	mov.l	.L06006DDC,r0
	mov.l	.L06006DE0,r1
	mov.l	@r1,r3
	mov	r3,r2
	shll	r3
	add	r2,r3
	shll2	r3
	extu.b	r3,r3
	add	r0,r3
	mov.l	r4,@r3
	mov.l	@r1,r3
	mov	r3,r2
	shll	r3
	add	r2,r3
	shll2	r3
	extu.b	r3,r3
	add	r0,r3
	mov.l	r5,@(4,r3)
	mov.l	@r1,r3
	mov	r3,r2
	shll	r3
	add	r2,r3
	shll2	r3
	extu.b	r3,r3
	add	r0,r3
	mov	r7,r0
	mov.l	r6,@(8,r3)
	mov	#0,r3
	mov.b	r3,@r6
	mov.b	r0,@(1,r6)
	mov.l	@r1,r0
	add	#1,r0
	and	#15,r0
	bra	file_open_next
	mov.l	r0,@r1
	endlabel file_queue

	glabel file_open_next
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	sts.l	pr,@-r15
	mov.l	.L06006DE4,r13
	add	#-8,r15
	mov.l	.L06006DE0,r1
	mov.l	@r13,r3
	mov.l	@r1,r2
	cmp/eq	r3,r2
	bf	.L06006CF6
	bra	.L06006E90
	nop
.L06006CF6:
	mov	#4,r3
	mov.l	.L06006DE8,r14
	mov.l	@r14,r2
	cmp/ge	r3,r2
	bf	.L06006D04
	bra	.L06006E90
	nop
.L06006D04:
	mov.l	.L06006DEC,r2
	bsrf	r2
	nop
	tst	#32,r0
	bt	.L06006D12
	bsr	func_060069AC
	nop
.L06006D12:
	mov.l	.L06006DDC,r11
	mov.l	@r13,r4
	mov	r4,r3
	mov.l	.L06006DF0,r2
	shll	r4
	add	r3,r4
	shll2	r4
	extu.b	r4,r4
	add	r11,r4
	bsrf	r2
	mov.l	@r4,r4
	mov.l	.L06006DF4,r3
	mov.l	r0,@r3
	mov.l	.L06006DF8,r12
	mov.l	.L06006DFC,r2
	bsrf	r2
	mov	r0,r4
	mov.l	r0,@r12
	mov	r15,r7
	mov.l	.L06006E00,r3
	mov	r15,r6
	add	#4,r7
	mov	#0,r5
	bsrf	r3
	mov	r0,r4
	mov.l	@r15,r5
	mov.l	.L06006E04,r3
	bsrf	r3
	mov.l	@r12,r4
	mov.l	.L06006E08,r2
	mov	#4,r5
	bsrf	r2
	mov.l	@r12,r4
	mov.l	.L06006E0C,r4
	mov.l	@r14,r3
	mov.l	@r12,r1
	mov	r3,r2
	shll2	r3
	add	r2,r3
	shll2	r3
	exts.b	r3,r3
	add	r4,r3
	mov.l	r1,@r3
	mov.l	@r14,r3
	mov	r3,r2
	mov.l	@r15,r0
	shll2	r3
	add	r2,r3
	shll2	r3
	exts.b	r3,r3
	cmp/pz	r0
	bt/s	.L06006D7E
	add	r4,r3
	add	#3,r0
.L06006D7E:
	shar	r0
	shar	r0
	mov.w	r0,@(4,r3)
	mov.l	@r15,r1
	mov.l	.L06006E10,r3
	bsrf	r3
	mov	#4,r0
	mov.l	@r14,r6
	mov	r0,r5
	mov	r6,r3
	shll2	r6
	add	r3,r6
	shll2	r6
	exts.b	r6,r6
	tst	r5,r5
	bt/s	.L06006E14
	add	r4,r6
	mov.w	@(4,r6),r0
	add	#1,r0
	mov.w	r0,@(4,r6)
	mov	r5,r0
	mov.l	@r14,r3
	mov	r3,r2
	shll2	r3
	add	r2,r3
	shll2	r3
	exts.b	r3,r3
	add	r4,r3
	mov.w	r0,@(6,r3)
	mov.l	@r14,r3
	add	#-1,r0
	mov	r3,r2
	shll2	r3
	add	r2,r3
	shll2	r3
	exts.b	r3,r3
	add	r4,r3
	shll8	r0
	shll2	r0
	shll	r0
	mov	r0,r2
	mov.w	@(6,r15),r0
	add	r2,r0
	mov.w	r0,@(8,r3)
	bra	.L06006E2E
	nop
	.byte 0x00, 0x00
.L06006DDC:
	.long file_queue_entries
.L06006DE0:
	.long file_queue_tail
.L06006DE4:
	.long file_queue_head
.L06006DE8:
	.long file_busy_count
.L06006DEC:
	.long 0x000614C4
.L06006DF0:
	.long 0x00063FD4
.L06006DF4:
	.long D_06067184
.L06006DF8:
	.long D_060661B4
.L06006DFC:
	.long 0x00064166
.L06006E00:
	.long 0x000643A2
.L06006E04:
	.long 0x000646FC
.L06006E08:
	.long 0x00064B1A
.L06006E0C:
	.long file_open_table
.L06006E10:
	.long 0x000499FC
.L06006E14:
	mov	#4,r0
	mov.w	r0,@(6,r6)
	mov.l	@r14,r3
	mov	r3,r2
	mov.w	@(6,r15),r0
	shll2	r3
	add	r2,r3
	shll2	r3
	mov.w	.L06006E9E,r2
	exts.b	r3,r3
	add	r4,r3
	add	r2,r0
	mov.w	r0,@(8,r3)
.L06006E2E:
	mov.l	@r14,r3
	mov.l	@r13,r1
	mov	r3,r2
	shll2	r3
	add	r2,r3
	shll2	r3
	exts.b	r3,r3
	add	r4,r3
	mov	r1,r2
	shll	r1
	add	r2,r1
	shll2	r1
	extu.b	r1,r1
	add	r11,r1
	mov.l	@(4,r1),r0
	mov.l	r0,@(12,r3)
	mov.l	@r14,r3
	mov.l	@r13,r1
	mov	r3,r2
	shll2	r3
	add	r2,r3
	shll2	r3
	exts.b	r3,r3
	add	r4,r3
	mov	r1,r2
	shll	r1
	add	r2,r1
	shll2	r1
	extu.b	r1,r1
	add	r11,r1
	mov.l	@(8,r1),r0
	mov.l	r0,@(16,r3)
	mov.l	@r14,r3
	mov	r3,r2
	shll2	r3
	add	r2,r3
	shll2	r3
	exts.b	r3,r3
	add	r4,r3
	mov.l	@(16,r3),r1
	mov	#1,r2
	mov.b	r2,@r1
	mov.l	@r13,r0
	add	#1,r0
	and	#15,r0
	mov.l	r0,@r13
	mov.l	@r14,r3
	add	#1,r3
	mov.l	r3,@r14
.L06006E90:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L06006E9E:
	.short 0x1800
	endlabel file_open_next

	glabel file_server
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	.L06006F9C,r2
	add	#-12,r15
	mov.l	@r2,r0
	tst	r0,r0
	bf	.L06006EBE
	bra	.L0600736C
	nop
.L06006EBE:
	mov.l	.L06006FA0,r10
	mov.l	@(16,r10),r0
	mov.b	@(1,r0),r0
	mov.b	r0,@(4,r15)
	mov.b	@(4,r15),r0
	tst	r0,r0
	bf/s	.L06006ED2
	mov	r10,r4
	bra	.L0600736C
	nop
.L06006ED2:
	mov.l	.L06006FA4,r9
	mov.l	@(16,r4),r0
	mov.b	@r0,r0
	cmp/eq	#1,r0
	bf/s	.L06006EF0
	mov	#0,r8
	mov	#2,r3
	mov.l	.L06006FAC,r0
	mov.l	@(16,r4),r1
	mov.b	r3,@r1
	mov.l	r8,@r9
	mov.l	.L06006FA8,r1
	mov.l	r8,@r1
	mov.l	@(12,r10),r3
	mov.l	r3,@r0
.L06006EF0:
	mov.l	@r10,r2
	mov.l	.L06006FB0,r1
	mov.l	r2,@r1
.L06006EF6:
	mov.l	.L06006FB4,r3
	bsrf	r3
	nop
	tst	#32,r0
	bt	.L06006F04
	bsr	func_060069AC
	nop
.L06006F04:
	mov.l	.L06006FB8,r12
	mov.l	.L06006FA8,r3
	mov.l	@r3,r0
	tst	r0,r0
	bf/s	.L06006F44
	mov	#1,r13
	mov.l	.L06006FBC,r14
	mov	#4,r2
	mov.w	.L06006F98,r1
	mov.l	r2,@r14
	mov.l	r1,@r12
	mov.w	@(4,r10),r0
	cmp/eq	#1,r0
	bf	.L06006F32
	mov.w	@(6,r10),r0
	mov.l	r0,@r14
	mov.w	@(8,r10),r0
	mov.l	r0,@r12
	mov.l	@r14,r5
	mov.l	.L06006FB0,r2
	mov.l	.L06006FC0,r1
	bsrf	r1
	mov.l	@r2,r4
.L06006F32:
	mov.l	@r12,r7
	mov.l	.L06006FC4,r6
	mov.l	@r14,r5
	mov.l	.L06006FB0,r3
	mov.l	.L06006FC8,r2
	bsrf	r2
	mov.l	@r3,r4
	mov.l	.L06006FA8,r1
	mov.l	r13,@r1
.L06006F44:
	mov.l	.L06006FB0,r3
	mov.l	.L06006FCC,r2
	bsrf	r2
	mov.l	@r3,r4
	cmp/eq	#3,r0
	bf	.L06006F58
	mov.l	.L06006FD0,r3
	mov.l	@r3,r2
	jsr	@r2
	nop
.L06006F58:
	mov.l	.L06006FB0,r2
	mov	r15,r6
	mov.l	.L06006FD4,r3
	mov	r15,r5
	add	#8,r5
	bsrf	r3
	mov.l	@r2,r4
	mov.l	@r12,r1
	mov.l	@r15,r3
	cmp/ge	r1,r3
	bt	.L06006F72
	bra	.L06007362
	nop
.L06006F72:
	mov.l	.L06006FD8,r6
	mov.l	.L06006FC4,r3
	mov.l	r3,@r6
	mov.w	.L06006F98,r7
	mov.l	.L06006FDC,r11
	mov.l	.L06006FE0,r12
	mov.l	.L06006FE4,r14
	mov.l	.L06006FE8,r5
	mov.l	.L06006FEC,r4
	mov.l	@r9,r0
	mov	#10,r1
	cmp/hs	r1,r0
	bt	.L0600702C
	shll	r0
	mov	r0,r1
	mova	.L06006FF0,r0
	mov.w	@(r0,r1),r0
	braf	r0
	nop
.L06006F98:
	.short 0x2000
	.byte 0x00, 0x00
.L06006F9C:
	.long file_busy_count
.L06006FA0:
	.long file_open_table
.L06006FA4:
	.long prs_state
.L06006FA8:
	.long D_06067198
.L06006FAC:
	.long D_060671C8
.L06006FB0:
	.long D_060661B4
.L06006FB4:
	.long 0x000612D2
.L06006FB8:
	.long D_0606718C
.L06006FBC:
	.long D_06067188
.L06006FC0:
	.long 0x0006493C
.L06006FC4:
	.long BIOS_WORK_HI + 0x1C00
.L06006FC8:
	.long 0x0006442A
.L06006FCC:
	.long 0x000646B4
.L06006FD0:
	.long BIOS_WORK + 0x26C
.L06006FD4:
	.long 0x0006460E
.L06006FD8:
	.long D_060671C4
.L06006FDC:
	.long D_060671A4
.L06006FE0:
	.long D_060671B0
.L06006FE4:
	.long D_060671BD
.L06006FE8:
	.long D_060671A0
.L06006FEC:
	.long D_060671B8
.L06006FF0:
	.short .L06007004 - .L06006F98
	.short .L06007008 - .L06006F98
	.short .L0600700C - .L06006F98
	.short .L06007010 - .L06006F98
	.short .L06007014 - .L06006F98
	.short .L06007018 - .L06006F98
	.short .L0600701C - .L06006F98
	.short .L06007020 - .L06006F98
	.short .L06007024 - .L06006F98
	.short .L06007028 - .L06006F98
.L06007004:
	bra	.L0600702C
	nop
.L06007008:
	bra	.L06007054
	nop
.L0600700C:
	bra	.L06007090
	nop
.L06007010:
	bra	.L060070E8
	nop
.L06007014:
	bra	.L06007130
	nop
.L06007018:
	bra	.L0600718C
	nop
.L0600701C:
	bra	.L060071B2
	nop
.L06007020:
	bra	.L06007240
	nop
.L06007024:
	bra	.L06007254
	nop
.L06007028:
	bra	.L060072A6
	nop
.L0600702C:
	mov.w	.L060070D2,r2
	add	#-1,r7
	mov.l	.L060070D8,r3
	mov.l	r2,@r3
	mov.w	.L060070D4,r1
	mov.l	.L060070DC,r0
	mov.l	r1,@r0
	mov.l	@r6,r2
	add	#1,r2
	mov.l	r2,@r6
	add	#-1,r2
	mov.b	@r2,r1
	mov.b	r1,@r14
	mov	#9,r2
	bra	.L06007072
	mov.l	r2,@r11
.L0600704C:
	tst	r7,r7
	bf	.L06007054
	bra	.L06007358
	mov.l	r13,@r9
.L06007054:
	mov.l	@r6,r2
	add	#-1,r7
	mov.l	.L060070E0,r1
	add	#1,r2
	mov.l	r2,@r6
	add	#-1,r2
	mov.b	@r2,r3
	mov.b	r3,@r1
	mov.l	.L060070E4,r3
	mov.l	@r3,r2
	add	#1,r2
	mov.l	r2,@r3
	mov.b	@r1,r3
	add	#-1,r2
	mov.b	r3,@r2
.L06007072:
	mov.l	@r11,r2
	add	#-1,r2
	tst	r2,r2
	bt/s	.L06007080
	mov.l	r2,@r11
	bra	.L06007082
	mov.l	r8,@r4
.L06007080:
	mov.l	r13,@r4
.L06007082:
	mov.l	@r4,r0
	tst	r0,r0
	bt	.L060070A2
	tst	r7,r7
	bf	.L06007090
	bra	.L060072A2
	mov	#2,r3
.L06007090:
	mov.l	@r6,r1
	add	#-1,r7
	add	#1,r1
	mov	#8,r2
	mov.l	r1,@r6
	add	#-1,r1
	mov.b	@r1,r3
	mov.b	r3,@r14
	mov.l	r2,@r11
.L060070A2:
	mov.b	@r14,r3
	and	r13,r3
	mov.l	r3,@r4
	mov.b	@r14,r2
	shar	r2
	mov.b	r2,@r14
	mov.l	@r4,r0
	tst	r0,r0
	bf	.L0600704C
	mov.l	@r11,r1
	add	#-1,r1
	tst	r1,r1
	bt/s	.L060070C2
	mov.l	r1,@r11
	bra	.L060070C4
	mov.l	r8,@r4
.L060070C2:
	mov.l	r13,@r4
.L060070C4:
	mov.l	@r4,r0
	tst	r0,r0
	bt	.L060070FA
	tst	r7,r7
	bf	.L060070E8
	bra	.L060072A2
	mov	#3,r3
.L060070D2:
	.short 0xFF00
.L060070D4:
	.short 0xE000
	.byte 0x00, 0x00
.L060070D8:
	.long D_060671AC
.L060070DC:
	.long D_060671A8
.L060070E0:
	.long D_060671BC
.L060070E4:
	.long D_060671C8
.L060070E8:
	mov.l	@r6,r1
	add	#-1,r7
	add	#1,r1
	mov	#8,r2
	mov.l	r1,@r6
	add	#-1,r1
	mov.b	@r1,r3
	mov.b	r3,@r14
	mov.l	r2,@r11
.L060070FA:
	mov.b	@r14,r3
	and	r13,r3
	mov.l	r3,@r4
	mov.b	@r14,r2
	shar	r2
	mov.b	r2,@r14
	mov.l	@r4,r0
	tst	r0,r0
	bt	.L06007110
	bra	.L06007236
	nop
.L06007110:
	mov.l	r8,@r5
	mov.l	@r11,r2
	add	#-1,r2
	tst	r2,r2
	bt/s	.L06007120
	mov.l	r2,@r11
	bra	.L06007122
	mov.l	r8,@r4
.L06007120:
	mov.l	r13,@r4
.L06007122:
	mov.l	@r4,r0
	tst	r0,r0
	bt	.L06007142
	tst	r7,r7
	bf	.L06007130
	bra	.L060072A2
	mov	#4,r3
.L06007130:
	mov.l	@r6,r1
	add	#-1,r7
	add	#1,r1
	mov	#8,r2
	mov.l	r1,@r6
	add	#-1,r1
	mov.b	@r1,r3
	mov.b	r3,@r14
	mov.l	r2,@r11
.L06007142:
	mov.b	@r14,r3
	mov.l	.L06007334,r1
	and	r13,r3
	mov.l	r3,@r4
	mov.b	@r14,r2
	shar	r2
	mov.b	r2,@r14
	mov.l	@r5,r3
	mov.l	r3,@r1
	mov.l	@r5,r2
	shll	r2
	mov.l	r2,@r5
	mov	r2,r0
	mov.l	@r4,r3
	add	r3,r0
	mov.l	r0,@r5
	mov.l	@r1,r2
	cmp/pz	r2
	bt	.L0600716C
	bra	.L0600716E
	mov.l	r13,@r4
.L0600716C:
	mov.l	r8,@r4
.L0600716E:
	mov.l	@r11,r3
	add	#-1,r3
	tst	r3,r3
	bt/s	.L0600717C
	mov.l	r3,@r11
	bra	.L0600717E
	mov.l	r8,@r4
.L0600717C:
	mov.l	r13,@r4
.L0600717E:
	mov.l	@r4,r0
	tst	r0,r0
	bt	.L0600719E
	tst	r7,r7
	bf	.L0600718C
	bra	.L060072A2
	mov	#5,r3
.L0600718C:
	mov.l	@r6,r1
	add	#-1,r7
	add	#1,r1
	mov	#8,r2
	mov.l	r1,@r6
	add	#-1,r1
	mov.b	@r1,r3
	mov.b	r3,@r14
	mov.l	r2,@r11
.L0600719E:
	mov.b	@r14,r3
	and	r13,r3
	mov.l	r3,@r4
	mov.b	@r14,r2
	shar	r2
	tst	r7,r7
	bf/s	.L060071B2
	mov.b	r2,@r14
	bra	.L060072A2
	mov	#6,r3
.L060071B2:
	mov.l	@r6,r1
	add	#1,r1
	mov.l	r1,@r6
	add	#-1,r1
	mov.b	@r1,r3
	mov.l	r3,@r12
	mov.l	@r5,r2
	mov.l	.L06007334,r3
	mov.l	r2,@r3
	mov.l	@r5,r1
	shll	r1
	mov.l	r1,@r5
	mov	r1,r0
	mov.l	@r4,r2
	add	r2,r0
	mov.l	r0,@r5
	mov.l	@r3,r1
	cmp/pz	r1
	bt/s	.L060071DE
	add	#-1,r7
	bra	.L060071E0
	mov.l	r13,@r4
.L060071DE:
	mov.l	r8,@r4
.L060071E0:
	mov.l	.L06007338,r1
	mov.l	@r1,r3
	mov.l	@r12,r2
	or	r3,r2
	mov.l	r2,@r12
.L060071EA:
	mov.l	@r5,r0
	mov.l	.L0600733C,r1
	add	#2,r0
	mov.l	r0,@r5
	mov.l	@r1,r3
	mov.l	@r12,r2
	add	r3,r2
	mov.l	.L06007340,r0
	mov.l	r2,@r0
.L060071FC:
	mov.l	.L06007340,r3
	mov.l	@r3,r1
	mov.l	.L06007344,r2
	add	#1,r1
	mov.l	r1,@r3
	add	#-1,r1
	mov.b	@r1,r3
	mov.b	r3,@r2
	mov.l	@r5,r1
	add	#-1,r1
	tst	r1,r1
	bt/s	.L0600721A
	mov.l	r1,@r5
	bra	.L0600721C
	mov.l	r8,@r4
.L0600721A:
	mov.l	r13,@r4
.L0600721C:
	mov.l	.L0600733C,r2
	mov.l	@r2,r3
	mov.l	.L06007344,r1
	add	#1,r3
	mov.l	r3,@r2
	add	#-1,r3
	mov.b	@r1,r2
	mov.b	r2,@r3
	mov.l	@r4,r0
	tst	r0,r0
	bt	.L060071FC
	bra	.L06007072
	nop
.L06007236:
	tst	r7,r7
	bf	.L06007240
	mov	#7,r0
	bra	.L06007358
	mov.l	r0,@r9
.L06007240:
	mov.l	@r6,r2
	dt	r7
	add	#1,r2
	mov.l	r2,@r6
	add	#-1,r2
	mov.b	@r2,r3
	bf/s	.L06007254
	mov.l	r3,@r5
	bra	.L060072A2
	mov	#8,r3
.L06007254:
	mov.l	@r6,r1
	add	#-1,r7
	mov.l	.L06007334,r2
	add	#1,r1
	mov.l	r1,@r6
	add	#-1,r1
	mov.b	@r1,r3
	mov.l	r3,@r2
	mov.l	@r5,r0
	and	#255,r0
	mov.l	r0,@r12
	mov.l	@r2,r3
	shll8	r3
	mov.l	r3,@r2
	mov.l	@r12,r1
	or	r3,r1
	mov	r1,r0
	tst	r0,r0
	bt/s	.L060072CC
	mov.l	r1,@r12
	mov.l	@r12,r2
	shar	r2
	mov.l	.L06007348,r1
	shar	r2
	shar	r2
	mov.l	r2,@r12
	mov.l	@r5,r0
	and	#7,r0
	mov.l	r0,@r5
	mov.l	@r1,r3
	mov.l	@r12,r2
	or	r3,r2
	mov.l	r2,@r12
	mov.l	@r5,r0
	tst	r0,r0
	bf	.L060071EA
	tst	r7,r7
	bf	.L060072A6
	mov	#9,r3
.L060072A2:
	bra	.L06007358
	mov.l	r3,@r9
.L060072A6:
	add	#-1,r7
	mov.l	.L06007340,r0
	mov.l	@r6,r1
	add	#1,r1
	mov.l	r1,@r6
	add	#-1,r1
	mov.b	@r1,r3
	mov.l	.L0600733C,r1
	mov.l	r3,@r5
	mov.l	@r1,r3
	mov.l	@r12,r2
	add	r3,r2
	mov.l	r2,@r0
	mov.l	@r5,r0
	and	#255,r0
	mov	r0,r3
	add	#1,r3
	bra	.L060071FC
	mov.l	r3,@r5
.L060072CC:
	mov.l	.L0600734C,r1
	mov.l	.L06007350,r3
	bsrf	r3
	mov.l	@r1,r4
	mov.l	@(16,r10),r2
	mov	#-1,r3
	mov.b	r3,@r2
	mov	r10,r4
	add	#20,r4
	mov	r10,r5
	mov.l	@r4,r2
	add	#40,r5
	mov.l	r2,@r10
	mov.l	@(4,r4),r2
	mov.l	r2,@(4,r10)
	mov.l	@(8,r4),r2
	mov.l	r2,@(8,r10)
	mov.l	@(12,r4),r2
	mov.l	r2,@(12,r10)
	mov.l	@(16,r4),r2
	mov.l	r2,@(16,r10)
	mov	r10,r2
	mov.l	@r5,r3
	add	#60,r2
	mov.l	r3,@r4
	mov.l	@(4,r5),r3
	mov.l	r3,@(4,r4)
	mov.l	@(8,r5),r3
	mov.l	r3,@(8,r4)
	mov.l	@(12,r5),r3
	mov.l	r3,@(12,r4)
	mov.l	@(16,r5),r3
	mov.l	r3,@(16,r4)
	mov.l	@r2,r1
	mov.l	r1,@r5
	mov.l	@(4,r2),r1
	mov.l	r1,@(4,r5)
	mov.l	@(8,r2),r1
	mov.l	.L06007354,r3
	mov.l	r1,@(8,r5)
	mov.l	@(12,r2),r1
	mov.l	r1,@(12,r5)
	mov.l	@(16,r2),r1
	mov.l	r1,@(16,r5)
	mov.l	@r3,r0
	add	#-1,r0
	mov.l	r0,@r3
	bsr	file_open_next
	nop
	bra	.L0600736C
	nop
	.byte 0x00, 0x00
.L06007334:
	.long D_060671B4
.L06007338:
	.long D_060671AC
.L0600733C:
	.long D_060671C8
.L06007340:
	.long D_060671C0
.L06007344:
	.long D_060671BC
.L06007348:
	.long D_060671A8
.L0600734C:
	.long D_060661B4
.L06007350:
	.long 0x00063C70
.L06007354:
	.long file_busy_count
.L06007358:
	mov.w	@(4,r10),r0
	add	#-1,r0
	mov.w	r0,@(4,r10)
	mov.l	.L060073B0,r3
	mov.l	r8,@r3
.L06007362:
	mov.b	@(4,r15),r0
	cmp/eq	#2,r0
	bf	.L0600736C
	bra	.L06006EF6
	nop
.L0600736C:
	add	#12,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel file_server

	glabel func_06007380
	sts.l	pr,@-r15
	mov.l	.L060073B4,r3
	bsrf	r3
	nop
	tst	#32,r0
	bt	.L06007390
	bsr	func_060069AC
	nop
.L06007390:
	mov.l	.L060073B8,r2
	bsrf	r2
	nop
	mov.l	.L060073BC,r3
	bsrf	r3
	nop
	mov.l	.L060073C0,r3
	mov	#0,r2
	mov.l	.L060073C4,r1
	mov.l	r2,@r3
	mov.l	r2,@r1
	mov.l	.L060073C8,r3
	lds.l	@r15+,pr
	rts
	mov.l	r2,@r3
	.byte 0x00, 0x00
.L060073B0:
	.long D_06067198
.L060073B4:
	.long 0x00060E46
.L060073B8:
	.long 0x00061AF8
.L060073BC:
	.long 0x00063AB0
.L060073C0:
	.long file_queue_head
.L060073C4:
	.long file_queue_tail
.L060073C8:
	.long file_busy_count
	endlabel func_06007380

	glabel load_sequence
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L060073F6
	shlr	r0
	shll2	r0
	mov.l	.L0600740C,r2
	mov.l	@(r0,r2),r4
	cmp/pz	r4
	bf	.L060073F6
	mov.l	.L06007410,r0
	mov.l	.L06007414,r5
	jsr	@r0
	nop
.L060073F6:
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	rts
	nop
	.byte 0x00, 0x00
.L0600740C:
	.long sequence_names
.L06007410:
	.long file_load
.L06007414:
	.long D_00200000
	endlabel load_sequence

	.section .data.06007418,"aw",@progbits
	.p2align 2
	dlabel sequence_names
	.long D_060514F2
	.long D_060514FE
	.long D_0605150A
	.long D_06051516
	.long D_06051521
	.long D_0605152D
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
