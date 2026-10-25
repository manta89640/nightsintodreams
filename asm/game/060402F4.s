	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060402F4,"ax",@progbits
	.p2align 2

	glabel func_060402F4
	sts.l	pr,@-r15
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L06040300
	bra	.L06040388
	nop
.L06040300:
	mov.l	.L06040398,r8
	mov.w	@(4,r1),r0
	shll8	r0
	dmuls.l	r0,r8
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	mov.l	.L0604039C,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bf	.L06040388
	mov.l	.L060403A0,r2
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	mov.w	@(26,r1),r0
	mov	r0,r13
	mov.l	.L060403A4,r10
	jsr	@r10
	nop
	cmp/pz	r0
	bf	.L06040388
	mov	r0,r6
	mov.w	.L06040394,r0
	mov	#1,r9
	mov.l	.L060403A8,r14
	jsr	@r14
	nop
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#17,r6
	mov.l	.L060403AC,r0
	jsr	@r0
	mov	#5,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L060403B0,r7
	mov.b	@(7,r7),r0
	add	#1,r0
	mov	#100,r8
	cmp/ge	r8,r0
	bf	.L06040370
	mov	r8,r0
.L06040370:
	mov.b	r0,@(7,r7)
	mov	#60,r0
	mov.w	r0,@(8,r1)
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	tst	r2,r2
	bt	.L06040382
	mov	#-2,r0
	mov.b	r0,@(1,r2)
.L06040382:
	mov.l	.L060403B4,r0
	mov.l	r0,@-r1
	add	#4,r1
.L06040388:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L060403B8
	lds.l	@r15+,pr
	rts
	nop
.L06040394:
	.short 0x000A
	.byte 0x00, 0x00
.L06040398:
	.long 0x00500000
.L0604039C:
	.long func_060172DE
.L060403A0:
	.long D_060402AA
.L060403A4:
	.long func_060175BE
.L060403A8:
	.long func_0601A2BC
.L060403AC:
	.long func_0600E4C4
.L060403B0:
	.long D_060FFE50
.L060403B4:
	.long func_060404B0
.L060403B8:
	mov.l	.L06040418,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0604041C,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r4
	mov	r0,r5
	mov.l	.L06040420,r14
	jsr	@r14
	mov	r0,r6
	mov.l	.L06040424,r14
	jsr	@r14
	mov.w	@(24,r1),r0
	mov.l	.L06040428,r14
	jsr	@r14
	mov.w	@(26,r1),r0
	mov.b	@(108,gbr),r0
	tst	#128,r0
	mov.w	@(22,r1),r0
	bt	.L060403EE
	mov.w	.L06040414,r8
	add	r8,r0
.L060403EE:
	mov.w	r0,@(22,r1)
	mov.l	.L0604042C,r2
	mov.b	@(20,gbr),r0
	cmp/eq	#8,r0
	bt	.L0604043C
	mov.l	r2,@-r15
	mov.l	.L06040430,r14
	jsr	@r14
	mov.w	@(22,r1),r0
	mov.l	@r15+,r2
	mov.l	.L06040434,r0
	jsr	@r0
	nop
	mov.l	.L06040438,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06040414:
	.short 0x0100
	.byte 0x00, 0x00
.L06040418:
	.long func_0600CA24
.L0604041C:
	.long func_0600CBDA
.L06040420:
	.long func_0600D018
.L06040424:
	.long func_0600CAF8
.L06040428:
	.long func_0600CB68
.L0604042C:
	.long D_060806D0
.L06040430:
	.long func_0600CA7A
.L06040434:
	.long func_0601F4A0
.L06040438:
	.long func_0600CA4E
.L0604043C:
	mov.w	@(2,r1),r0
	shlr2	r0
	shlr2	r0
	cmp/eq	#1,r0
	bt	.L06040466
	mov.l	r2,@-r15
	mov.l	.L06040498,r0
	jsr	@r0
	nop
	mov.l	.L0604049C,r14
	jsr	@r14
	mov.w	@(22,r1),r0
	mov.l	@r15+,r2
	mov.l	r2,@-r15
	mov.l	.L060404A0,r0
	jsr	@r0
	nop
	mov.l	.L060404A4,r0
	jsr	@r0
	nop
	mov.l	@r15+,r2
.L06040466:
	mov.w	@(2,r1),r0
	shlr2	r0
	shlr2	r0
	cmp/eq	#0,r0
	bt	.L0604048C
	mov.l	r2,@-r15
	mov	#0,r4
	mov	#0,r5
	mov.l	.L060404A8,r6
	mov.l	.L060404AC,r0
	jsr	@r0
	nop
	mov.l	.L0604049C,r14
	jsr	@r14
	mov.w	@(22,r1),r0
	mov.l	@r15+,r2
	mov.l	.L060404A0,r0
	jsr	@r0
	nop
.L0604048C:
	mov.l	.L060404A4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06040498:
	.long func_0600CA24
.L0604049C:
	.long func_0600CA7A
.L060404A0:
	.long func_0601F4A0
.L060404A4:
	.long func_0600CA4E
.L060404A8:
	.long 0x00800000
.L060404AC:
	.long func_0600CBDA
	endlabel func_060402F4

	glabel func_060404B0
	mov.w	@(8,r1),r0
	dt	r0
	bf	.L060404C0
	mov.l	.L060404BC,r0
	jmp	@r0
	nop
.L060404BC:
	.long func_0600D1A0
.L060404C0:
	mov.w	r0,@(8,r1)
	sts.l	pr,@-r15
	mov.w	@(4,r1),r0
	add	#-16,r0
	mov.w	r0,@(4,r1)
	bra	.L06040388
	nop
	endlabel func_060404B0

	glabel func_060404CE
	sts.l	pr,@-r15
	mov.l	.L06040514,r4
	mov.l	r1,@r4
	mov.l	.L06040518,r6
	add	#4,r6
	mov.l	@(44,r1),r8
	swap.w	r8,r0
	extu.w	r0,r0
	shll2	r0
	shll	r0
	add	r0,r6
	mov.l	@(4,r6),r0
	mov.l	.L0604051C,r10
	dmuls.l	r0,r10
	sts	mach,r0
	sts	macl,r10
	xtrct	r0,r10
	add	r10,r8
	mov.l	r8,@(44,r1)
	mov.l	.L06040518,r6
	mov.l	.L06040520,r13
	mov	#1,r14
	mov.l	.L06040524,r4
	mov.l	@(12,gbr),r0
	shlr	r0
	and	#1,r0
	cmp/eq	#0,r0
	bf	.L0604052E
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06040528
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06040514:
	.long D_06040538
.L06040518:
	.long D_06040788
.L0604051C:
	.long 0x00010000
.L06040520:
	.long D_06082A78
.L06040524:
	.long D_060F4EA4
.L06040528:
	mov.l	.L06040534,r0
	jsr	@r0
	nop
.L0604052E:
	lds.l	@r15+,pr
	rts
	nop
.L06040534:
	.long func_06041D08
	endlabel func_060404CE

	.section .data.06040538,"aw",@progbits
	.p2align 2
	dlabel D_06040538
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01
	.byte 0x80, 0x21, 0xD0, 0x01, 0x40, 0x2B, 0x00, 0x09
	.long func_0600D1A0
