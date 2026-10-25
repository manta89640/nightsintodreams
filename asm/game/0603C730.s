	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603C730,"ax",@progbits
	.p2align 2
	.byte 0xE9, 0x01

	glabel func_0603C732
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#48,r6
	mov.l	.L0603C7B0,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#0,r0
	mov.w	r0,@(14,r1)
	mov	r1,r2
	add	#30,r2
	mov.b	@r2,r0
	and	#185,r0
	mov.b	r0,@r2
	mov.l	@(32,r1),r2
	mov.l	@(36,r1),r3
	shar	r2
	shar	r3
	mov	r2,r4
	mov	r3,r5
	shar	r4
	shar	r5
	add	r4,r2
	add	r5,r3
	mov.l	r2,@(32,r1)
	mov.l	r3,@(36,r1)
	shlr16	r2
	swap.b	r2,r0
	mov.b	r0,@(12,r1)
	mov	#60,r0
	mov.b	r0,@(11,r1)
	mov.l	@r1,r2
	mov	r2,r3
	mov.w	.L0603C7AA,r4
	shlr16	r3
	cmp/eq	r4,r3
	bf	.L0603C792
	mov	#64,r0
	mov	#-1,r3
	mov.b	r3,@(r0,r2)
.L0603C792:
	mova	.L0603C79C,r0
	lds.l	@r15+,pr
	mov.l	r0,@-r1
	add	#4,r1
	nop
.L0603C79C:
	sts.l	pr,@-r15
	mov.b	@(11,r1),r0
	tst	r0,r0
	bt	.L0603C7B4
	add	#-1,r0
	bra	.L0603C7DA
	mov.b	r0,@(11,r1)
.L0603C7AA:
	.short 0x060C
	.long func_0601A27C
.L0603C7B0:
	.long func_0600E4C4
.L0603C7B4:
	mov.l	@(32,r1),r2
	mov.l	@(36,r1),r3
	mov	#32,r0
	shll8	r0
	add	r0,r3
	mov	#64,r0
	shll2	r0
	dmuls.l	r0,r2
	sts	mach,r6
	sts	macl,r4
	dmuls.l	r0,r3
	xtrct	r6,r4
	sts	mach,r7
	sts	macl,r5
	sub	r4,r2
	xtrct	r7,r5
	sub	r5,r3
	mov.l	r2,@(32,r1)
	mov.l	r3,@(36,r1)
.L0603C7DA:
	mov.l	@(60,r1),r2
	mov.l	@(52,r1),r3
	mov.l	@(32,r1),r4
	mov.l	@(36,r1),r5
	add	r4,r2
	add	r5,r3
	mov.l	.L0603C7F8,r0
	mov.l	r2,@(60,r1)
	jsr	@r0
	mov.l	r3,@(52,r1)
	bsr	func_0603C9F4
	nop
	bf	.L0603C7FC
	bra	.L0603C98E
	nop
.L0603C7F8:
	.long func_06018E8C
.L0603C7FC:
	swap.w	r2,r0
	mov.b	r0,@(13,r1)
	mov.l	.L0603C820,r6
	jsr	@r6
	nop
	mov	r0,r4
	mov.l	@(32,r1),r2
	jsr	@r6
	mov.l	@(36,r1),r3
	mov	r0,r5
	mov	r0,r14
	sub	r4,r14
	exts.w	r14,r14
	cmp/pl	r14
	bt	.L0603C824
	bra	.L0603C98E
	nop
	.byte 0x00, 0x00
.L0603C820:
	.long func_06007C1C
.L0603C824:
	mov.l	@(60,r1),r2
	mov.l	@(52,r1),r3
	mov.l	@(32,r1),r6
	mov.l	@(36,r1),r7
	shar	r6
	shar	r7
	sub	r6,r2
	sub	r7,r3
	mov.l	r2,@(60,r1)
	mov.l	r3,@(52,r1)
	mov	r4,r0
	mov.l	.L0603C8F4,r2
	add	r4,r0
	jsr	@r2
	sub	r5,r0
	mov	r10,r6
	mov	r11,r7
	mov.l	@(32,r1),r2
	mov.l	@(36,r1),r3
	shll8	r2
	shll8	r3
	shlr16	r2
	shlr16	r3
	exts.w	r2,r2
	exts.w	r3,r3
	mov.l	.L0603C8F8,r0
	mov	#0,r4
	jsr	@r0
	mov	#0,r5
	mov	#64,r2
	shll8	r2
	cmp/hs	r2,r14
	bf	.L0603C86C
	shll	r2
	sub	r14,r2
	mov	r2,r14
.L0603C86C:
	shlr	r14
	mulu.w	r0,r14
	sts	macl,r14
	shlr16	r14
	sub	r14,r0
	mov.l	r0,@-r15
	shll2	r0
	shll8	r0
	dmuls.l	r0,r7
	sts	mach,r2
	sts	macl,r7
	dmuls.l	r0,r6
	xtrct	r2,r7
	sts	mach,r2
	sts	macl,r6
	mov.l	.L0603C8FC,r0
	xtrct	r2,r6
	mov.l	r7,@(32,r1)
	jsr	@r0
	mov.l	r6,@(36,r1)
	mov.l	@r15+,r14
	mov.b	@(13,r1),r0
	cmp/pz	r0
	bf	.L0603C908
	mov	#64,r2
	shll	r2
	cmp/hi	r2,r14
	bt	.L0603C908
	mov	r1,r2
	add	#64,r2
	mov.l	@(4,r2),r0
	mov.l	r0,@(0,r2)
	mov	#0,r0
	mov.w	r0,@(14,r1)
	mov.w	r0,@(26,r1)
	mov.w	.L0603C8EE,r0
	mov.w	r0,@(28,r1)
	mov.b	@(12,r1),r0
	cmp/pz	r0
	bt	.L0603C8C6
	mov	r1,r2
	add	#30,r2
	mov.b	@r2,r0
	or	#64,r0
	mov.b	r0,@r2
.L0603C8C6:
	mov.l	@r1,r2
	mov	r2,r3
	mov.w	.L0603C8F0,r4
	shlr16	r3
	cmp/eq	r4,r3
	bf	.L0603C8E4
	mov.l	.L0603C900,r0
	mov.b	@r0,r3
	add	#-1,r3
	mov.b	r3,@r0
	mov	#6,r4
	mov	#64,r0
	mov.l	.L0603C904,r3
	jsr	@r3
	mov.b	r4,@(r0,r2)
.L0603C8E4:
	mova	.L0603CA88,r0
	lds.l	@r15+,pr
	mov.l	r0,@-r1
	jmp	@r0
	add	#4,r1
.L0603C8EE:
	.short 0x1B04
.L0603C8F0:
	.long D_060C0000
.L0603C8F4:
	.long func_06007BD8
.L0603C8F8:
	.long func_06007D4A
.L0603C8FC:
	.long func_06018E8C
.L0603C900:
	.long D_060CFFCE
.L0603C904:
	.long func_06035FE4
.L0603C908:
	mov	#80,r2
	shll2	r2
	shll	r2
	cmp/hs	r2,r14
	bf	.L0603C98E
	mov.l	.L0603C964,r2
	mov.l	@(48,r1),r4
	mov.l	@r2,r2
	mov.l	@(56,r1),r5
	mov.l	@(56,r2),r3
	mov.l	@(48,r2),r2
	sub	r5,r3
	dmuls.l	r3,r3
	sub	r4,r2
	sts	mach,r3
	dmuls.l	r2,r2
	mov	#4,r0
	sts	mach,r2
	shll16	r0
	add	r3,r2
	cmp/gt	r0,r2
	bt	.L0603C98E
	mov.l	.L0603C968,r2
	mov.b	@r2,r0
	add	#1,r0
	mov.b	r0,@r2
	tst	#1,r0
	bf	.L0603C970
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#24,r6
	mov.l	.L0603C96C,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	bra	.L0603C98E
	nop
	.byte 0x00, 0x00
.L0603C964:
	.long D_060F3064
.L0603C968:
	.long D_060D9080
.L0603C96C:
	.long func_0600E4C4
.L0603C970:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#24,r6
	mov.l	.L0603C9BC,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L0603C98E:
	mov.l	.L0603C9C0,r0
	jsr	@r0
	mov.l	@r1,r2
	mov.b	@(12,r1),r0
	mov	#5,r2
	cmp/pz	r0
	bt	.L0603C99E
	neg	r2,r2
.L0603C99E:
	mov.w	@(26,r1),r0
	shll8	r2
	add	r2,r0
	mov.w	r0,@(26,r1)
	mov	r1,r2
	mov.l	.L0603C9C4,r0
	add	#64,r2
	jsr	@r0
	mov.l	@(0,r2),r2
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603C9C8
	lds.l	@r15+,pr
	rts
	nop
.L0603C9BC:
	.long func_0600E4C4
.L0603C9C0:
	.long func_06035FBA
.L0603C9C4:
	.long func_0601EF98
.L0603C9C8:
	mov.l	.L0603C9E4,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	.L0603C9E8,r0
	mov.l	@(52,r1),r5
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L0603C9EC,r0
	jsr	@r0
	nop
	mov.l	.L0603C9F0,r0
	jmp	@r0
	lds.l	@r15+,pr
.L0603C9E4:
	.long func_0600CA24
.L0603C9E8:
	.long func_0600CBDA
.L0603C9EC:
	.long func_06020906
.L0603C9F0:
	.long func_0600CA4E
	endlabel func_0603C732

	glabel func_0603C9F4
	mov.l	.L0603CA64,r2
	sts.l	pr,@-r15
	jsr	@r2
	nop
	mov	#48,r0
	muls.w	r0,r11
	mov	r6,r2
	sts	macl,r11
	muls.w	r0,r10
	mov	r7,r3
	sts	macl,r10
	add	r11,r2
	sub	r10,r3
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	shll	r11
	shll	r10
	mov.l	@(544,gbr),r0
	sub	r11,r2
	jsr	@r0
	add	r10,r3
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@(544,gbr),r0
	mov.l	r4,@-r15
	jsr	@r0
	mov.l	r5,@-r15
	mov.l	@r15+,r7
	mov.l	@r15+,r6
	mov.l	@(52,r1),r0
	mov.l	@(36,r1),r2
	mov	#16,r3
	shll16	r3
	cmp/pz	r2
	bt	.L0603CA52
	sub	r3,r0
	cmp/ge	r0,r6
	bt	.L0603CA74
	cmp/ge	r0,r4
	bt	.L0603CA74
	shll	r3
	add	r3,r0
	cmp/gt	r0,r7
	bf	.L0603CA5C
	cmp/gt	r0,r5
	bf	.L0603CA5C
	bra	.L0603CA82
.L0603CA52:
	add	r3,r0
	cmp/gt	r0,r7
	bf	.L0603CA5C
	cmp/gt	r0,r5
	bt	.L0603CA68
.L0603CA5C:
	mov	r5,r3
	sub	r7,r3
	bra	.L0603CA7A
	mov	#24,r2
.L0603CA64:
	.long func_06007BD8
.L0603CA68:
	shll	r3
	sub	r3,r0
	cmp/ge	r0,r6
	bt	.L0603CA74
	cmp/ge	r0,r4
	bf	.L0603CA82
.L0603CA74:
	mov	r6,r3
	sub	r4,r3
	mov	#-24,r2
.L0603CA7A:
	lds.l	@r15+,pr
	shll16	r2
	rts
	clrt
.L0603CA82:
	lds.l	@r15+,pr
	rts
	sett
.L0603CA88:
	.byte 0xC4, 0x1E, 0x67, 0x03, 0xD2, 0x0E, 0xD9, 0x0F, 0x63, 0x22, 0x58, 0x3C, 0x50, 0x1C, 0x30, 0x88
	.byte 0x30, 0x0D, 0x0A, 0x0A, 0x3A, 0x93, 0x89, 0x07, 0x58, 0x3E, 0x50, 0x1E, 0x30, 0x88, 0x30, 0x0D
	.byte 0x00, 0x0A, 0x3A, 0x0C, 0x3A, 0x93, 0x8B, 0x11, 0x72, 0x04, 0x77, 0xFF, 0x47, 0x11, 0x89, 0xEB
	.byte 0xE0, 0xF8, 0x02, 0x1E, 0xE0, 0x02, 0x80, 0x21, 0xD0, 0x03, 0x40, 0x2B, 0x00, 0x09, 0x00, 0x00
	.long D_060F3064
	.byte 0x00, 0x01, 0x00, 0x00
	.long func_0600D1A0
	endlabel func_0603C9F4

	glabel func_0603CAD4
	sts.l	pr,@-r15
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603CAE2
	lds.l	@r15+,pr
	rts
	nop
.L0603CAE2:
	mov.l	.L0603CB0C,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	.L0603CB10,r0
	mov.l	@(52,r1),r5
	jsr	@r0
	mov.l	@(56,r1),r6
	mov	r1,r2
	add	#64,r2
	mov.l	@(0,r2),r2
	mov.l	.L0603CB14,r0
	jsr	@r0
	nop
	mov.l	.L0603CB18,r0
	jsr	@r0
	nop
	mov.l	.L0603CB1C,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L0603CB0C:
	.long func_0600CA24
.L0603CB10:
	.long func_0600CBDA
.L0603CB14:
	.long func_0601EF98
.L0603CB18:
	.long func_06020906
.L0603CB1C:
	.long func_0600CA4E
	endlabel func_0603CAD4

	.section .data.0603CB20,"aw",@progbits
	.p2align 2
	.byte 0x62, 0x13, 0x72, 0x40, 0x12, 0x30, 0xDE, 0x0E, 0xE9, 0x01, 0x4E, 0x0B
