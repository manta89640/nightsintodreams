	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060389B4,"ax",@progbits
	.p2align 2
	.byte 0x0A, 0xF7

	glabel func_060389B6
	mov	#0,r0
	mov.l	r0,@(36,r2)
	mov.l	r0,@(40,r2)
	mov.b	@(14,r2),r0
	and	#47,r0
	rts
	mov.b	r0,@(14,r2)
	endlabel func_060389B6

	glabel func_060389C4
	rts
	nop
	endlabel func_060389C4

	glabel func_060389C8
	mov.w	@(26,r1),r0
	mov.w	.L060389D2,r3
	add	r3,r0
	rts
	mov.w	r0,@(26,r1)
.L060389D2:
	.short 0x0100
	endlabel func_060389C8

	glabel func_060389D4
	mov.w	.L060389DA,r0
	rts
	mov.w	r0,@(26,r1)
.L060389DA:
	.short 0x8000
	endlabel func_060389D4

	glabel func_060389DC
	mov.l	.L060389FC,r10
	sts.l	pr,@-r15
	jsr	@r10
	mov.w	@(24,r1),r0
	shll2	r10
	lds.l	@r15+,pr
	dmuls.l	r10,r2
	shll2	r11
	sts	mach,r10
	sts	macl,r3
	dmuls.l	r11,r2
	xtrct	r10,r3
	sts	macl,r2
	sts	mach,r11
	rts
	xtrct	r11,r2
.L060389FC:
	.long func_06007BD8
	endlabel func_060389DC

	glabel func_06038A00
	mov.l	.L06038A20,r10
	sts.l	pr,@-r15
	jsr	@r10
	mov.w	@(24,r1),r0
	shll2	r11
	lds.l	@r15+,pr
	dmuls.l	r11,r2
	shll2	r10
	sts	mach,r11
	sts	macl,r3
	dmuls.l	r10,r2
	xtrct	r11,r3
	sts	macl,r2
	sts	mach,r10
	rts
	xtrct	r10,r2
.L06038A20:
	.long func_06007BD8
	endlabel func_06038A00

	glabel func_06038A24
	mov.w	.L06038A60,r2
	mov.l	.L06038A64,r3
	mov.w	r2,@r1
	mov	#3,r0
	mov.l	r3,@(44,r1)
	mov	#7,r2
	mov.b	r0,@(4,r1)
	shll16	r2
	mov.l	@(52,r1),r3
	mov	#0,r0
	sub	r2,r3
	mov.w	r0,@(26,r1)
	sts.l	pr,@-r15
	mov	#12,r2
	mov.l	r3,@(52,r1)
	shll16	r2
	mov.l	r0,@(36,r1)
	bsr	func_060389DC
	mov.l	r0,@(40,r1)
	mov.l	@(56,r1),r0
	mov.l	@(48,r1),r4
	add	r3,r0
	add	r2,r4
	mov.l	r0,@(56,r1)
	mov.l	.L06038A68,r5
	mov.l	r4,@(48,r1)
	lds.l	@r15+,pr
	mov.l	r5,@-r1
	rts
	add	#4,r1
.L06038A60:
	.short 0x0064
	.byte 0x00, 0x00
.L06038A64:
	.long D_0603A914
.L06038A68:
	.long func_06038CCC
	endlabel func_06038A24

	glabel func_06038A6C
	mov.w	.L06038AB2,r2
	mov.l	.L06038AB4,r3
	mov.w	r2,@r1
	mov	#5,r0
	mov.l	r3,@(44,r1)
	mov	#7,r2
	mov.b	r0,@(4,r1)
	shll16	r2
	mov.l	@(52,r1),r3
	mov	#0,r0
	sub	r2,r3
	mov.w	r0,@(26,r1)
	sts.l	pr,@-r15
	mov.l	@(32,r1),r0
	mov	#12,r2
	mov.l	r3,@(52,r1)
	cmp/pl	r0
	bt	.L06038A92
	neg	r2,r2
.L06038A92:
	bsr	func_060389DC
	shll16	r2
	mov.l	@(56,r1),r0
	mov	#-3,r5
	add	r3,r0
	mov.l	@(48,r1),r4
	shll16	r5
	mov.l	r0,@(56,r1)
	add	r2,r4
	mov.l	r4,@(48,r1)
	lds.l	@r15+,pr
	mov.l	r5,@(36,r1)
	mov.l	.L06038AB8,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06038AB2:
	.short 0x0064
.L06038AB4:
	.long D_0603A914
.L06038AB8:
	.long func_06038CCC
	endlabel func_06038A6C

	glabel func_06038ABC
	sts.l	pr,@-r15
	mov	#8,r0
	mov.l	.L06038B20,r4
	mov.w	r0,@(2,r1)
	mov	#7,r2
	mov.l	r4,@(44,r1)
	mov	#2,r0
	mov.l	@(52,r1),r5
	shll16	r2
	mov.b	r0,@(4,r1)
	sub	r2,r5
	mov.l	r5,@(52,r1)
	mov.l	.L06038B24,r2
	mov.l	@r2,r0
	rotl	r0
	xor	r2,r0
	mov.l	r0,@r2
	mov.w	.L06038B1E,r2
	and	#63,r0
	shll2	r0
	add	r0,r2
	mov.l	.L06038B28,r4
	mov.w	r2,@r1
	and	#31,r0
	mov	#17,r2
	mov.b	@(r0,r4),r4
	shll16	r2
	shll8	r4
	mov.w	@(30,r1),r0
	shll2	r4
	shlr8	r0
	shll2	r4
	tst	#64,r0
	bf	.L06038B04
	neg	r2,r2
	neg	r4,r4
.L06038B04:
	bsr	func_060389DC
	mov.l	r4,@(32,r1)
	mov.l	@(56,r1),r10
	mov.l	@(48,r1),r11
	add	r3,r10
	add	r2,r11
	mov.l	r10,@(56,r1)
	mov.l	.L06038B2C,r0
	mov.l	r11,@(48,r1)
	lds.l	@r15+,pr
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06038B1E:
	.short 0x003C
.L06038B20:
	.long D_0603A914
.L06038B24:
	.long D_06035A6C
.L06038B28:
	.long D_060394BE
.L06038B2C:
	.long func_06038CCC
	endlabel func_06038ABC

	glabel func_06038B30
	sts.l	pr,@-r15
	mov	#14,r0
	mov.l	.L06038B7C,r4
	mov.w	r0,@(2,r1)
	mov	#7,r2
	mov.l	r4,@(44,r1)
	mov	#8,r0
	mov.l	@(52,r1),r5
	shll16	r2
	mov.b	r0,@(4,r1)
	sub	r2,r5
	mov.w	@(30,r1),r0
	mov	#17,r2
	mov.l	r5,@(52,r1)
	mov	#4,r4
	mov	#-2,r5
	shlr8	r0
	shll16	r2
	shll16	r5
	tst	#64,r0
	shll16	r4
	bf/s	.L06038B62
	mov.l	r5,@(36,r1)
	neg	r2,r2
	neg	r4,r4
.L06038B62:
	bsr	func_060389DC
	mov.l	r4,@(32,r1)
	mov.l	@(56,r1),r10
	mov.l	@(48,r1),r11
	add	r3,r10
	add	r2,r11
	mov.l	r10,@(56,r1)
	mov.l	.L06038B80,r0
	mov.l	r11,@(48,r1)
	lds.l	@r15+,pr
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06038B7C:
	.long D_0603A914
.L06038B80:
	.long func_06038CCC
	endlabel func_06038B30

	glabel func_06038B84
	sts.l	pr,@-r15
	mov	#14,r0
	mov.l	.L06038BCC,r4
	mov.w	r0,@(2,r1)
	mov	#7,r2
	mov.l	r4,@(44,r1)
	mov	#13,r0
	mov.l	@(52,r1),r5
	shll16	r2
	mov.b	r0,@(4,r1)
	sub	r2,r5
	mov.w	@(30,r1),r0
	mov	#17,r2
	shlr8	r0
	tst	#64,r0
	bf/s	.L06038BA8
	shll16	r2
	neg	r2,r2
.L06038BA8:
	bsr	func_060389DC
	mov.l	r5,@(52,r1)
	mov.l	@(56,r1),r10
	mov.l	@(48,r1),r11
	add	r3,r10
	add	r2,r11
	mov.l	r10,@(56,r1)
	mov.l	r11,@(48,r1)
	mov.l	@(40,r1),r10
	mov.l	.L06038BD0,r0
	mov.w	.L06038BCA,r11
	mov.l	r10,@(60,r1)
	mov.l	r11,@(40,r1)
	lds.l	@r15+,pr
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06038BCA:
	.short 0x0100
.L06038BCC:
	.long D_0603A914
.L06038BD0:
	.long func_06038CCC
	endlabel func_06038B84

	glabel func_06038BD4
	mov	#22,r0
	mov.w	r0,@(2,r1)
	mov.l	.L06038C00,r3
	mov.l	r3,@(44,r1)
	mov	#7,r0
	mov.b	r0,@(4,r1)
	mov.l	.L06038C04,r3
	sts.l	pr,@-r15
	mov.l	.L06038C08,r2
	jsr	@r3
	nop
	mov.l	.L06038C0C,r4
	mov.l	r4,@(12,r3)
	add	#16,r3
	lds.l	@r15+,pr
	mov	#64,r0
	mov.l	r1,@(r0,r3)
	mov.l	.L06038C10,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
	.byte 0x00, 0x00
.L06038C00:
	.long D_0603A914
.L06038C04:
	.long func_0600D0D0
.L06038C08:
	.long D_060FFFB0
.L06038C0C:
	.long func_06039170
.L06038C10:
	.long func_06038CCC
	endlabel func_06038BD4

	glabel func_06038C14
	mov	#36,r0
	mov.w	r0,@(2,r1)
	mov.l	.L06038C30,r3
	mov.l	r3,@(44,r1)
	mov	#10,r0
	mov.b	r0,@(4,r1)
	mov.w	.L06038C2C,r2
	mov.w	r2,@r1
	mov.l	.L06038C34,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06038C2C:
	.short 0x01E0
	.byte 0x00, 0x00
.L06038C30:
	.long D_0603A914
.L06038C34:
	.long func_06038D5C
	endlabel func_06038C14

	glabel func_06038C38
	mov	#10,r0
	mov.w	r0,@(2,r1)
	mov.l	.L06038C54,r3
	mov.l	r3,@(44,r1)
	mov	#9,r0
	mov.b	r0,@(4,r1)
	mov.w	.L06038C50,r2
	mov.w	r2,@r1
	mov.l	.L06038C58,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06038C50:
	.short 0xFFFF
	.byte 0x00, 0x00
.L06038C54:
	.long D_0603A914
.L06038C58:
	.long func_06038D5C
	endlabel func_06038C38

	glabel func_06038C5C
	mov	#40,r0
	mov.w	r0,@(2,r1)
	mov.l	.L06038C78,r3
	mov.l	r3,@(44,r1)
	mov	#12,r0
	mov.b	r0,@(4,r1)
	mov.w	.L06038C74,r2
	mov.w	r2,@r1
	mov.l	.L06038C7C,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06038C74:
	.short 0x01E0
	.byte 0x00, 0x00
.L06038C78:
	.long D_0603A914
.L06038C7C:
	.long func_06038D5C
	endlabel func_06038C5C

	glabel func_06038C80
	mov	#27,r0
	mov.w	r0,@(2,r1)
	mov.l	.L06038CBC,r3
	mov.l	r3,@(44,r1)
	mov	#11,r0
	mov.b	r0,@(4,r1)
	mov.w	.L06038CBA,r2
	mov.w	r2,@r1
	mov.l	.L06038CC0,r0
	mov.l	r0,@(32,r1)
	mov.l	r0,@(36,r1)
	sts.l	pr,@-r15
	mov.l	@(544,gbr),r0
	mov.l	@(56,r1),r3
	jsr	@r0
	mov.l	@(48,r1),r2
	lds.l	@r15+,pr
	add	r5,r4
	shar	r4
	mov.l	.L06038CC4,r2
	sub	r2,r5
	cmp/ge	r5,r4
	bt	.L06038CB0
	mov	r5,r4
.L06038CB0:
	mov.l	r4,@(52,r1)
	mov.l	.L06038CC8,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06038CBA:
	.short 0xFFFF
.L06038CBC:
	.long D_0603A914
.L06038CC0:
	.long 0x00020000
.L06038CC4:
	.long 0x00E00000
.L06038CC8:
	.long func_06038D5C
	endlabel func_06038C80

	glabel func_06038CCC
	sts.l	pr,@-r15
	mov.w	@(30,r1),r0
	cmp/pz	r0
	bt	.L06038CF8
	mov.w	@(2,r1),r0
	cmp/eq	#22,r0
	bf	.L06038CEE
	mov.b	@(4,r1),r0
	cmp/eq	#7,r0
	bf	.L06038CEE
	mov	#64,r0
	mov.l	@(r0,r1),r2
	mov	#116,r0
	mov.l	@(r0,r2),r4
	mov	#-5,r5
	and	r5,r4
	mov.l	r4,@(r0,r2)
.L06038CEE:
	mov.l	.L06038CF4,r9
	jmp	@r9
	lds.l	@r15+,pr
.L06038CF4:
	.long func_0600D1A0
.L06038CF8:
	mov.w	@(2,r1),r0
	mov.l	.L06038D20,r3
	add	r0,r0
	mov.l	.L06038D24,r7
	mov.w	@(r0,r3),r2
	jsr	@r7
	add	r3,r2
	mov.b	@(4,r1),r0
	mov.l	.L06038D28,r3
	shll2	r0
	mov.l	@(r0,r3),r3
	jsr	@r3
	nop
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06038D2C
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06038D20:
	.long D_0603A790
.L06038D24:
	.long func_0601EF98
.L06038D28:
	.long D_060396FC
.L06038D2C:
	mov.l	.L06038D4C,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06038D50,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	@(40,r1),r0
	mov.l	.L06038D54,r2
	jsr	@r2
	mov.w	r0,@(100,gbr)
	mov.l	.L06038D58,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L06038D4C:
	.long func_0600CA24
.L06038D50:
	.long func_0600CBDA
.L06038D54:
	.long func_06036F10
.L06038D58:
	.long func_0600CA4E
	endlabel func_06038CCC

	glabel func_06038D5C
	sts.l	pr,@-r15
	mov.w	@(2,r1),r0
	mov.l	.L06038D84,r3
	add	r0,r0
	mov.l	.L06038D88,r7
	mov.w	@(r0,r3),r2
	jsr	@r7
	add	r3,r2
	mov.b	@(4,r1),r0
	mov.l	.L06038D8C,r3
	shll2	r0
	mov.l	@(r0,r3),r3
	jsr	@r3
	nop
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06038D90
	lds.l	@r15+,pr
	rts
	nop
.L06038D84:
	.long D_0603A790
.L06038D88:
	.long func_0601EF98
.L06038D8C:
	.long D_060396FC
.L06038D90:
	mov.l	.L06038DB0,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06038DB4,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	@(40,r1),r0
	mov.l	.L06038DB8,r2
	jsr	@r2
	mov.w	r0,@(100,gbr)
	mov.l	.L06038DBC,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L06038DB0:
	.long func_0600CA24
.L06038DB4:
	.long func_0600CBDA
.L06038DB8:
	.long func_06036F10
.L06038DBC:
	.long func_0600CA4E
	endlabel func_06038D5C

	glabel func_06038DC0
	mov.w	.L06038DF0,r0
	mov.l	r0,@(40,r1)
	mov.l	@(36,r1),r2
	mov.w	.L06038DF2,r3
	mov.l	@(52,r1),r0
	add	r3,r2
	mov	#4,r4
	shll16	r4
	cmp/gt	r4,r2
	bf	.L06038DD6
	mov	r4,r2
.L06038DD6:
	mov.l	r2,@(36,r1)
	add	r2,r0
	mov.l	r0,@(52,r1)
	mov.l	@(32,r1),r2
	mov.l	@(48,r1),r3
	add	r2,r3
	mov.l	r3,@(48,r1)
	mov.w	@(26,r1),r0
	cmp/pl	r2
	mov.w	.L06038DF4,r3
	bt	.L06038DF6
	bra	.L06038DF8
	add	r3,r0
.L06038DF0:
	.short 0x0100
.L06038DF2:
	.short 0x2000
.L06038DF4:
	.short 0x0400
.L06038DF6:
	sub	r3,r0
.L06038DF8:
	rts
	mov.w	r0,@(26,r1)
	endlabel func_06038DC0

	glabel func_06038DFC
	mov.w	.L06038E38,r0
	mov.l	r0,@(40,r1)
	mov.l	@(36,r1),r2
	mov.w	.L06038E3A,r3
	mov.l	@(52,r1),r0
	add	r3,r2
	mov	#4,r4
	shll16	r4
	cmp/gt	r4,r2
	bf	.L06038E12
	mov	r4,r2
.L06038E12:
	mov.l	r2,@(36,r1)
	add	r2,r0
	mov.l	r0,@(52,r1)
	sts.l	pr,@-r15
	bsr	func_060389DC
	mov.l	@(32,r1),r2
	mov.l	@(48,r1),r0
	lds.l	@r15+,pr
	mov.l	@(56,r1),r4
	add	r2,r0
	add	r3,r4
	mov.l	r0,@(48,r1)
	mov.w	.L06038E3C,r3
	mov.w	@(26,r1),r0
	cmp/pl	r2
	mov.l	r4,@(56,r1)
	bt	.L06038E3E
	bra	.L06038E40
	add	r3,r0
.L06038E38:
	.short 0x0100
.L06038E3A:
	.short 0x2000
.L06038E3C:
	.short 0x0400
.L06038E3E:
	sub	r3,r0
.L06038E40:
	rts
	mov.w	r0,@(26,r1)
	endlabel func_06038DFC

	glabel func_06038E44
	mov.w	.L06038E62,r0
	mov.l	r0,@(40,r1)
	mov.l	@(32,r1),r2
	mov.l	@(36,r1),r3
	mov.l	@(60,r1),r4
	mov.l	@(48,r1),r5
	mov.l	@(52,r1),r6
	mov.l	@(56,r1),r7
	add	r2,r5
	add	r3,r6
	add	r4,r7
	mov.l	r5,@(48,r1)
	mov.l	r6,@(52,r1)
	rts
	mov.l	r7,@(56,r1)
.L06038E62:
	.short 0x0100
	endlabel func_06038E44

	glabel func_06038E64
	mov.l	@(40,r1),r0
	mov	#80,r3
	add	#8,r0
	cmp/gt	r0,r3
	bt	.L06038E70
	mov	r3,r0
.L06038E70:
	mov.l	r0,@(40,r1)
	mov	#32,r3
	mov.l	@(36,r1),r2
	shll8	r3
	mov	#3,r4
	mov.l	@(52,r1),r0
	shll16	r4
	add	r3,r2
	cmp/gt	r4,r2
	bf	.L06038E86
	mov	r4,r2
.L06038E86:
	mov.l	r2,@(36,r1)
	add	r2,r0
	mov.l	r0,@(52,r1)
	sts.l	pr,@-r15
	bsr	func_060389DC
	mov.l	@(32,r1),r2
	mov.l	@(48,r1),r0
	lds.l	@r15+,pr
	mov.l	@(56,r1),r4
	add	r2,r0
	add	r3,r4
	mov.l	r0,@(48,r1)
	cmp/pl	r2
	mov.l	r4,@(56,r1)
	bt	.L06038EAA
	mov	#-64,r0
	bra	.L06038EAE
	shll8	r0
.L06038EAA:
	mov	#-96,r0
	shll8	r0
.L06038EAE:
	rts
	mov.w	r0,@(26,r1)
	endlabel func_06038E64

	glabel func_06038EB2
	mov.w	.L06038EE2,r0
	mov.l	r0,@(40,r1)
	mov.l	@(36,r1),r2
	mov.w	.L06038EE4,r3
	mov.l	@(52,r1),r0
	sub	r3,r2
	mov	#-1,r4
	shll16	r4
	cmp/gt	r4,r2
	bt	.L06038EC8
	mov	r4,r2
.L06038EC8:
	mov.l	r2,@(36,r1)
	add	r2,r0
	mov.l	r0,@(52,r1)
	mov.l	@(32,r1),r2
	mov.l	@(48,r1),r3
	add	r2,r3
	mov.l	r3,@(48,r1)
	mov.w	@(26,r1),r0
	cmp/pl	r2
	mov.w	.L06038EE6,r3
	bt	.L06038EE8
	bra	.L06038EEA
	add	r3,r0
.L06038EE2:
	.short 0x0100
.L06038EE4:
	.short 0x0800
.L06038EE6:
	.short 0x0400
.L06038EE8:
	sub	r3,r0
.L06038EEA:
	rts
	mov.w	r0,@(26,r1)
	endlabel func_06038EB2

	glabel func_06038EEE
	mov.l	@(40,r1),r4
	mov.w	.L06038F0A,r3
	add	#8,r4
	cmp/gt	r4,r3
	bf	.L06038F0C
	mov	#64,r0
	mov.l	r4,@(40,r1)
	mov.l	@(r0,r1),r2
	mov	#64,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#31,r0
	bf	.L06038F74
	bra	.L06038F4A
	mov.l	@(32,r1),r2
.L06038F0A:
	.short 0x0100
.L06038F0C:
	mov	#16,r3
	mov.l	@(36,r1),r2
	shll8	r3
	mov	#-128,r4
	sub	r3,r2
	shll8	r4
	mov.l	@(52,r1),r0
	cmp/gt	r4,r2
	bt	.L06038F20
	mov	r4,r2
.L06038F20:
	mov	#-8,r3
	add	r2,r0
	shll8	r3
	mov.l	@(32,r1),r4
	extu.w	r3,r3
	mov.l	r0,@(52,r1)
	dmuls.l	r3,r4
	mov.l	r2,@(36,r1)
	sts	mach,r3
	sts	macl,r2
	sts.l	pr,@-r15
	xtrct	r3,r2
	bsr	func_060389DC
	mov.l	r2,@(32,r1)
	mov.l	@(56,r1),r0
	lds.l	@r15+,pr
	mov.l	@(48,r1),r4
	add	r3,r0
	add	r2,r4
	mov.l	r0,@(56,r1)
	mov.l	r4,@(48,r1)
.L06038F4A:
	cmp/pl	r2
	mov.w	.L06038F56,r3
	bt/s	.L06038F58
	mov.w	@(22,r1),r0
	bra	.L06038F5A
	add	r3,r0
.L06038F56:
	.short 0x0100
.L06038F58:
	sub	r3,r0
.L06038F5A:
	mov.l	@(48,r1),r3
	mov.w	r0,@(22,r1)
	add	r0,r3
	mov.l	r3,@(48,r1)
	mov.w	@r1,r0
	add	#-1,r0
	cmp/pl	r0
	bt/s	.L06038F70
	mov.w	r0,@r1
	bra	.L06038F74
	nop
.L06038F70:
	rts
	nop
.L06038F74:
	mov	#8,r0
	mov.w	r0,@r1
	mov	#9,r0
	mov.w	r0,@(2,r1)
	mov.w	r0,@(20,r1)
	mov	#1,r0
	mov.b	r0,@(4,r1)
	mov	#0,r0
	bra	.L06038F70
	mov.b	r0,@(15,r1)
	endlabel func_06038EEE

	glabel func_06038F88
	mov	#1,r3
	mov.l	@(40,r1),r0
	shll8	r3
	cmp/ge	r3,r0
	add	#8,r0
	bt	.L06038F96
	mov.l	r0,@(40,r1)
.L06038F96:
	mov	#8,r3
	mov.l	@(36,r1),r2
	shll8	r3
	mov	#-64,r4
	sub	r3,r2
	shll8	r4
	mov.l	@(52,r1),r0
	cmp/gt	r4,r2
	bt	.L06038FAA
	mov	r4,r2
.L06038FAA:
	mov.l	r2,@(36,r1)
	add	r2,r0
	sts.l	pr,@-r15
	mov.l	r0,@(52,r1)
	bsr	func_060389DC
	mov.l	@(32,r1),r2
	mov.l	@(48,r1),r4
	lds.l	@r15+,pr
	mov.l	@(56,r1),r0
	add	r2,r4
	add	r3,r0
	mov.l	r4,@(48,r1)
	mov.l	r0,@(56,r1)
	mov.w	@r1,r0
	add	#-1,r0
	cmp/pl	r0
	bt/s	.L06038FD8
	mov.w	r0,@r1
	mov.l	.L06038FD4,r9
	jmp	@r9
	lds.l	@r15+,pr
.L06038FD4:
	.long func_0600D1A0
.L06038FD8:
	rts
	nop
	endlabel func_06038F88

	glabel func_06038FDC
	mov.w	@r1,r0
	cmp/eq	#-1,r0
	bt	.L06038FF4
	add	#-1,r0
	cmp/pl	r0
	bt/s	.L06038FF4
	mov.w	r0,@r1
	mov.l	.L06038FF0,r9
	jmp	@r9
	lds.l	@r15+,pr
.L06038FF0:
	.long func_0600D1A0
.L06038FF4:
	mov.w	.L06038FFA,r0
	rts
	mov.l	r0,@(40,r1)
.L06038FFA:
	.short 0x0100
	endlabel func_06038FDC

	glabel func_06038FFC
	mov.w	@r1,r0
	cmp/eq	#-1,r0
	bt	.L06039014
	add	#-1,r0
	cmp/pl	r0
	bt/s	.L06039014
	mov.w	r0,@r1
	mov.l	.L06039010,r9
	jmp	@r9
	lds.l	@r15+,pr
.L06039010:
	.long func_0600D1A0
.L06039014:
	mov.w	.L0603901A,r0
	rts
	mov.l	r0,@(40,r1)
.L0603901A:
	.short 0x0200
	endlabel func_06038FFC

	glabel func_0603901C
	mov.w	@r1,r0
	cmp/eq	#-1,r0
	bt	.L06039034
	add	#-1,r0
	cmp/pl	r0
	bt/s	.L06039034
	mov.w	r0,@r1
	mov.l	.L06039030,r9
	jmp	@r9
	lds.l	@r15+,pr
.L06039030:
	.long func_0600D1A0
.L06039034:
	mov.w	.L0603903A,r0
	rts
	mov.l	r0,@(40,r1)
.L0603903A:
	.short 0x0100
	endlabel func_0603901C

	glabel func_0603903C
	mov	#64,r0
	mov.l	@(r0,r1),r2
	mov.w	@r1,r0
	add	#-1,r0
	cmp/pl	r0
	bt	.L06039054
	mov.w	@(2,r1),r0
	add	#1,r0
	cmp/eq	#39,r0
	bt/s	.L06039068
	mov.w	r0,@(2,r1)
	mov.w	.L06039064,r0
.L06039054:
	mov.w	r0,@r1
	mov	#64,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#55,r0
	bf	.L06039068
	mov.w	.L06039066,r0
	rts
	mov.l	r0,@(40,r1)
.L06039064:
	.short 0x01E0
.L06039066:
	.short 0x0100
.L06039068:
	mov.w	.L0603907C,r0
	mov.w	r0,@r1
	mov	#9,r0
	mov.b	r0,@(4,r1)
	mov	#116,r0
	mov.l	@(r0,r2),r3
	mov	#2,r4
	or	r4,r3
	bra	func_0603901C
	mov.l	r3,@(r0,r2)
.L0603907C:
	.short 0xFFFF
	endlabel func_0603903C

	glabel func_0603907E
	mov	#64,r0
	mov.l	@(r0,r1),r2
	mov.w	@r1,r0
	add	#-1,r0
	cmp/pl	r0
	bt	.L06039096
	mov.w	@(2,r1),r0
	add	#1,r0
	cmp/eq	#43,r0
	bt/s	.L060390AA
	mov.w	r0,@(2,r1)
	mov.w	.L060390A6,r0
.L06039096:
	mov.w	r0,@r1
	mov	#64,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#61,r0
	bf	.L060390AA
	mov.w	.L060390A8,r0
	rts
	mov.l	r0,@(40,r1)
.L060390A6:
	.short 0x01E0
.L060390A8:
	.short 0x0100
.L060390AA:
	mov.w	.L060390BE,r0
	mov.w	r0,@r1
	mov	#9,r0
	mov.b	r0,@(4,r1)
	mov	#116,r0
	mov.l	@(r0,r2),r3
	mov	#2,r4
	or	r4,r3
	bra	func_0603901C
	mov.l	r3,@(r0,r2)
.L060390BE:
	.short 0xFFFF
	endlabel func_0603907E

	glabel func_060390C0
	mov	#64,r0
	mov.l	@(r0,r1),r2
	mov	#64,r0
	mov.b	@(r0,r2),r0
	cmp/eq	#63,r0
	bf	.L06039110
	sts.l	pr,@-r15
	bsr	func_06038A00
	mov.l	@(32,r1),r2
	lds.l	@r15+,pr
	mov.l	@(48,r1),r0
	mov.l	@(56,r1),r4
	add	r2,r0
	add	r3,r4
	mov.l	r0,@(48,r1)
	mov.l	r4,@(56,r1)
	mov.w	@(24,r1),r0
	mov.w	.L06039108,r2
	add	r0,r2
	mov.w	.L0603910A,r3
	add	r3,r0
	mov.w	r0,@(24,r1)
	mov.w	@(194,gbr),r0
	sub	r0,r2
	mov.w	.L0603910C,r4
	add	r4,r2
	extu.w	r2,r2
	shll	r2
	shll2	r2
	shlr16	r2
	mov	#27,r0
	add	r2,r0
	mov.w	r0,@(2,r1)
.L06039102:
	mov.w	.L0603910E,r0
	rts
	mov.l	r0,@(40,r1)
.L06039108:
	.short 0x1000
.L0603910A:
	.short 0x0200
.L0603910C:
	.short 0x8000
.L0603910E:
	.short 0x0100
.L06039110:
	mov	#3,r0
	shll16	r0
	mov.l	r0,@(36,r1)
	mov	#0,r0
	bra	.L06039102
	mov.b	r0,@(4,r1)
	endlabel func_060390C0

	glabel func_0603911C
	mov.w	.L0603915E,r0
	mov.l	r0,@(40,r1)
	add	#64,r1
	mov.l	@r1,r4
	add	#-64,r1
	mov	#64,r0
	mov.b	@(r0,r4),r0
	cmp/eq	#10,r0
	bf	.L06039160
	mov.w	@(194,gbr),r0
	mov	#16,r3
	neg	r0,r0
	shll16	r3
	mov.w	r0,@(24,r1)
	mov.l	@(52,r4),r5
	add	r3,r5
	mov.b	@(14,r4),r0
	mov.l	r5,@(52,r1)
	tst	#2,r0
	mov	#42,r2
	bf/s	.L0603914A
	sts.l	pr,@-r15
	neg	r2,r2
.L0603914A:
	bsr	func_060389DC
	shll16	r2
	mov.l	@(48,r4),r5
	lds.l	@r15+,pr
	add	r2,r5
	mov.l	@(56,r4),r0
	mov.l	r5,@(48,r1)
	add	r3,r0
	rts
	mov.l	r0,@(56,r1)
.L0603915E:
	.short 0x0100
.L06039160:
	mov	#116,r0
	mov.l	@(r0,r4),r3
	mov	#-5,r5
	and	r5,r3
	mov.l	r3,@(r0,r4)
	mov	#0,r0
	rts
	mov.b	r0,@(4,r1)
	endlabel func_0603911C

	glabel func_06039170
	mov.l	.L06039178,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06039178:
	.long func_0603917C
	endlabel func_06039170

	glabel func_0603917C
	sts.l	pr,@-r15
	mov	#64,r0
	mov.l	@(r0,r1),r4
	mov.b	@(4,r4),r0
	cmp/eq	#7,r0
	bf	.L06039194
	mov	#64,r0
	mov.l	@(r0,r4),r2
	mov	#116,r0
	mov.l	@(r0,r2),r0
	tst	#4,r0
	bf	.L060391A0
.L06039194:
	mov.l	.L0603919C,r9
	jmp	@r9
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L0603919C:
	.long func_0600D1A0
.L060391A0:
	mov.l	@(52,r4),r5
	mov.l	r5,@(52,r1)
	mov.w	@(194,gbr),r0
	mov.w	r0,@(24,r1)
	mov	#1,r2
	bsr	func_06038A00
	shll16	r2
	mov.l	@(48,r4),r5
	mov.l	@(56,r4),r0
	add	r2,r5
	add	r3,r0
	mov.l	r5,@(48,r1)
	mov.l	r0,@(56,r1)
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L060391C6
	lds.l	@r15+,pr
	rts
	nop
.L060391C6:
	mov.l	.L060391E8,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L060391EC,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.w	.L060391E4,r0
	mov.l	.L060391F0,r2
	jsr	@r2
	mov.w	r0,@(100,gbr)
	mov.l	.L060391F4,r0
	jmp	@r0
	lds.l	@r15+,pr
.L060391E4:
	.short 0x0100
	.byte 0x00, 0x00
.L060391E8:
	.long func_0600CA24
.L060391EC:
	.long func_0600CBDA
.L060391F0:
	.long func_06037024
.L060391F4:
	.long func_0600CA4E
	endlabel func_0603917C

	glabel func_060391F8
	mov.l	.L06039208,r2
	mov.b	@(0,r2),r0
	cmp/eq	#-1,r0
	bf	.L06039210
	mov.l	.L0603920C,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06039208:
	.long D_060CFFA0
.L0603920C:
	.long func_0600D1A0
.L06039210:
	mov.l	.L06039288,r3
	mov.b	@r3,r4
	cmp/pl	r4
	bf	.L06039222
	add	#1,r0
	mov	#7,r3
	cmp/gt	r3,r0
	bf	.L06039222
	mov	r3,r0
.L06039222:
	mov.b	r0,@(0,r2)
	mov.l	.L0603928C,r4
	mov.l	r4,@(44,r1)
	mov.b	@(20,gbr),r0
	mov.l	.L06039290,r3
	mov.w	@(r0,r3),r0
	add	r0,r3
	add	#2,r3
	mov.b	@(1,r2),r0
	shll2	r0
	add	r0,r3
	mov.w	@r3+,r4
	mov	#31,r0
	mov.b	r4,@(r0,r1)
	mov.w	@r3,r4
	sts.l	pr,@-r15
	shll16	r4
	mov.l	.L06039294,r0
	jsr	@r0
	mov.l	r4,@(60,r1)
	mov	#64,r4
	mov.w	@(24,r1),r0
	shll8	r4
	add	r4,r0
	mov.l	.L06039298,r10
	jsr	@r10
	neg	r0,r0
	shll2	r10
	shll2	r11
	mov.w	.L06039286,r0
	dmuls.l	r0,r10
	sts	macl,r10
	dmuls.l	r0,r11
	sts	macl,r11
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	sub	r11,r2
	sub	r10,r3
	mov.l	@(544,gbr),r0
	mov.l	r3,@(56,r1)
	jsr	@r0
	mov.l	r2,@(48,r1)
	lds.l	@r15+,pr
	add	r4,r5
	shar	r5
	mov.l	r5,@(52,r1)
	mov.l	.L0603929C,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06039286:
	.short 0x00C0
.L06039288:
	.long D_060CFFCC
.L0603928C:
	.long D_0603AF64
.L06039290:
	.long D_06039734
.L06039294:
	.long func_06018E8C
.L06039298:
	.long func_06007BD8
.L0603929C:
	.long func_060392A0
	endlabel func_060391F8

	glabel func_060392A0
	sts.l	pr,@-r15
	mov	#4,r8
	mov.l	.L060392B8,r0
	shll8	r8
	jsr	@r0
	shll16	r8
	cmp/pz	r0
	bt	.L060392BC
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L060392B8:
	.long func_060172DE
.L060392BC:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L060392C8
	lds.l	@r15+,pr
	rts
	nop
.L060392C8:
	mov.l	.L06039328,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0603932C,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06039330,r14
	mov.l	.L06039334,r13
	mov.b	@(0,r14),r0
	mov.l	.L06039338,r12
	shll	r0
	mov.w	@(r0,r13),r0
	add	r0,r13
.L060392E6:
	mov.b	@r13+,r0
	cmp/eq	#-1,r0
	bt	.L06039354
	cmp/eq	#-2,r0
	bt	.L06039340
	mov.w	r0,@(20,r1)
	mov.l	r12,@-r15
	mov.l	r13,@-r15
	mov.l	.L06039328,r0
	jsr	@r0
	nop
	mov.l	@r15+,r13
	mov.l	@r15+,r12
	mov.b	@r13+,r0
	mov	#12,r5
	mulu.w	r5,r0
	mov.l	r12,@-r15
	mov.l	r13,@-r15
	sts	macl,r0
	add	r0,r12
	mov.l	@r12+,r4
	mov.l	@r12+,r5
	mov.l	.L0603932C,r0
	jsr	@r0
	mov.l	@r12+,r6
	mov.w	.L06039326,r0
	mov.l	.L0603933C,r2
	jsr	@r2
	mov.w	r0,@(100,gbr)
	mov.l	@r15+,r13
	bra	.L060392E6
	mov.l	@r15+,r12
.L06039326:
	.short 0x0200
.L06039328:
	.long func_0600CA24
.L0603932C:
	.long func_0600CBDA
.L06039330:
	.long D_060CFFA0
.L06039334:
	.long D_0603B228
.L06039338:
	.long D_060628BC
.L0603933C:
	.long func_06037170
.L06039340:
	mov.l	r12,@-r15
	mov.l	r13,@-r15
	mov.l	.L06039350,r0
	jsr	@r0
	nop
	mov.l	@r15+,r13
	bra	.L060392E6
	mov.l	@r15+,r12
.L06039350:
	.long func_0600CA4E
.L06039354:
	mov.l	.L0603935C,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L0603935C:
	.long func_0600CA4E
	endlabel func_060392A0

	.section .data.06039360,"aw",@progbits
	.p2align 2
	dlabel D_06039360
	.byte 0x08, 0x00, 0x08, 0x01, 0x08, 0x02, 0x08, 0x03, 0x08, 0x04, 0x08, 0x01, 0x08, 0x00, 0x08, 0x00
	.byte 0x08, 0x00, 0x08, 0x00, 0x08, 0x00, 0x08, 0x00, 0x08, 0x00, 0x08, 0x00, 0x08, 0x01, 0x08, 0x01
	.byte 0x08, 0x00, 0x0B, 0x00, 0x0A, 0x01, 0x0A, 0x01, 0x0A, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02
	.byte 0x00, 0x03, 0x00, 0x04, 0x04, 0x00, 0x04, 0x01, 0x04, 0x02, 0x04, 0x03, 0x04, 0x04, 0x04, 0x01
	.byte 0x04, 0x00, 0x04, 0x01, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x01, 0x0B, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x06, 0x00
	.long lbl_06010602
	.long lbl_06030604
	.long lbl_06010600
	.byte 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x02, 0x00, 0x02, 0x01, 0x02, 0x02, 0x02, 0x03, 0x02, 0x04
	.byte 0x0B, 0x00, 0x0B, 0x00, 0x01, 0x00, 0x01, 0x01, 0x01, 0x02, 0x01, 0x03, 0x01, 0x04, 0x01, 0x00
	.byte 0x01, 0x01, 0x0B, 0x00, 0x09, 0x00, 0x09, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x01
	.byte 0x0A, 0x01, 0x0A, 0x01, 0x0A, 0x01, 0x0A, 0x01, 0x0A, 0x01, 0x0A, 0x01, 0x0A, 0x01, 0x0A, 0x01
	.byte 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x01, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x02
	.byte 0x0A, 0x01, 0x0A, 0x00, 0x0A, 0x01, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x01
	.byte 0x0A, 0x00, 0x0A, 0x01, 0x0A, 0x01, 0x0A, 0x01, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x0A, 0x01, 0x0A, 0x01, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x01, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x01, 0x0A, 0x01, 0x0A, 0x01
	dlabel D_0603946E
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x04, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0xFF, 0xFF
	.byte 0x12, 0x0D, 0xFF, 0x2D, 0x14, 0x15, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x2C
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x1A, 0x1A, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_060394BE
	.byte 0x0E, 0x14, 0xFA, 0x20, 0x24, 0x08, 0x0F, 0x10, 0x2E, 0xF9, 0x0E, 0xFB, 0x21, 0x04, 0x05, 0xFE
	.byte 0x16, 0x1A, 0xF8, 0x22, 0x24, 0x19, 0xFD, 0x10, 0x12, 0x03, 0x1D, 0x0B, 0x15, 0x2C, 0x21, 0x28
	.byte 0x00, 0x09
	dlabel D_060394E0
	.long D_06080000
	.byte 0x00, 0x00, 0x00, 0x00
	.long D_06080000
	.byte 0x00, 0x00, 0x00, 0x00
	.long D_06080000
	.byte 0x00, 0x00, 0x00, 0x00
	.long D_06080000
	.byte 0x00, 0x00, 0x00, 0x00
	.long D_06080000
	.byte 0x00, 0x00, 0x00, 0x00
	.long D_06080000
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_06039520
	.long D_060802E4
	.long D_060802E4
	.long D_060802C4
	.long D_06080144
	.long D_06080144
	.long D_060801C4
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_0603953C
	.long D_060BB2D0
	.long D_060BE090
	.long D_060BDF30
	.long D_060BE460
	.long D_060BF750
	.long D_060BF6E0
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_06039558
	.long D_060BB2E0
	.long D_060BE0A0
	.long D_060BDF40
	.long D_060BE470
	.long D_060BF760
	.long D_060BF6F0
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_06039574
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_06039584
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_06039594
	.long D_060BCBB6
	.long D_060BF976
	.long D_060BF7E6
	.long D_060BFD56
	.long D_060C1006
	.long D_060C0F96
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_060395B0
	.long func_06037832
	.long func_060389C4
	.long func_060389B6
	.long func_0603889C
	.long func_060379E4
	.long func_06037C10
	.long func_06037278
	.long func_06037C92
	.long func_06037544
	.long func_06037D94
	.long func_06037436
	.long func_06037D94
	.long func_06037716
	.long func_06037D5A
	.long func_06037716
	.long func_060377D6
	.long func_0603860C
	.long func_0603742E
	.long func_06037484
	.long func_060374D8
	.long func_06037D5A
	.long func_06037300
	.long func_060375E8
	.long lbl_0603749C
	.long func_06037360
	.long func_060373E4
	.long func_060378D0
	.long func_060387FC
	.long func_060379AC
	.long func_06037574
	.long func_06037C60
	.long func_06037E70
	.long func_06037666
	.long func_060379AC
	.long func_0603790A
	.long func_06037980
	.long lbl_06037CF4
	.long D_0603870C
	.long func_060388E8
	.long func_06038710
	.long func_06037716
	.long func_060376BE
	.long func_060386CC
	.long func_060381BE
	.long func_060386CC
	.long func_060386A6
	.long func_06038028
	.long func_0603805C
	.long func_06038652
	.long func_060386CC
	.long func_06037716
	.long func_0603803E
	.long func_0603803E
	.long func_06038746
	.long func_060374A4
	.long lbl_06038070
	.long func_06037FCC
	.long func_06037716
	.long func_060380C0
	.long lbl_060380D4
	.long func_06038148
	.long lbl_06038162
	.long lbl_06038688
	.long func_06037774
	.long func_06037716
	.long func_06037F9E
	.long func_06037F9E
	.long func_06037EE4
	.long func_06037666
	.long func_06037D94
	.long func_06038756
	.long func_06037754
	.long func_0603772E
	.long func_060387BC
	.long func_0603876C
	.long func_060381BE
	.long func_060389C8
	.long func_060389D4
	.long func_06037716
	.long func_06038438
	.long func_06037F84
	.long func_06037716
	.long func_06037544
	dlabel D_060396FC
	.long func_06038DC0
	.long func_06038FDC
	.long func_06038EEE
	.long func_06038F88
	.long func_06038EB2
	.long func_06038E64
	.long func_06038FFC
	.long func_0603911C
	.long func_06038DFC
	.long func_0603901C
	.long func_0603903C
	.long func_060390C0
	.long func_0603907E
	.long func_06038E44
	dlabel D_06039734
	.byte 0x00, 0x0E, 0x00, 0x26, 0x00, 0x32, 0x00, 0x4A, 0x00, 0x56, 0x00, 0x62, 0x00, 0x7A, 0x00, 0x05
	.byte 0x00, 0x06, 0x13, 0x70, 0x00, 0x08, 0x21, 0xF0, 0x00, 0x08, 0x0E, 0xE0, 0x00, 0x09, 0x07, 0xE0
	.byte 0x00, 0x06, 0x15, 0xE0, 0xFF, 0xFF, 0x00, 0x02, 0x00, 0x02, 0x04, 0x23, 0x00, 0x07, 0x06, 0x16
	.byte 0xFF, 0xFF, 0x00, 0x05, 0x00, 0x07, 0x03, 0xF0, 0x00, 0x0A, 0x04, 0xC0, 0x00, 0x0A, 0x07, 0xD0
	.byte 0x00, 0x0B, 0x03, 0xD0, 0x00, 0x10, 0x02, 0x40, 0xFF, 0xFF, 0x00, 0x02, 0x00, 0x0D, 0x06, 0x3B
	.byte 0x00, 0x12, 0x11, 0x32, 0xFF, 0xFF, 0x00, 0x02, 0x00, 0x03, 0x06, 0xDA, 0x00, 0x0A, 0x21, 0x39
	.byte 0xFF, 0xFF, 0x00, 0x05, 0x00, 0x05, 0x08, 0x70, 0x00, 0x06, 0x05, 0x78, 0x00, 0x07, 0x04, 0x60
	.byte 0x00, 0x0A, 0x01, 0xA0, 0x00, 0x0B, 0x0C, 0x00, 0xFF, 0xFF, 0x00, 0x01, 0x00, 0x00, 0x00, 0x80
	.byte 0xFF, 0xFF
	dlabel D_060397B6
	.byte 0x00, 0x0E, 0x00, 0x18, 0x00, 0x22, 0x00, 0x5C, 0x00, 0x96, 0x00, 0xC0, 0x00, 0xFA, 0x00, 0x00
	.byte 0x0F, 0xF7, 0x0B, 0x40, 0x00, 0x88, 0xFF, 0xFF, 0x00, 0x00, 0x14, 0xA5, 0x06, 0x9D, 0x00, 0x50
	.byte 0xFF, 0xFF, 0x00, 0x01, 0x1C, 0x12, 0x04, 0xC0, 0x00, 0xB4, 0x00, 0x14, 0x18, 0x60, 0x06, 0xD2
	.byte 0x00, 0xFC, 0x00, 0x12, 0x17, 0x5D, 0x05, 0xB3, 0x00, 0x0C, 0x00, 0x07, 0x1B, 0x5D, 0x0A, 0x90
	.byte 0x0B, 0x83, 0x00, 0x0E, 0x18, 0xF0, 0x0C, 0x40, 0x04, 0x7D, 0x00, 0x09, 0x19, 0x28, 0x0E, 0xC0
	.byte 0x00, 0x35, 0x00, 0x10, 0x21, 0x40, 0x0B, 0xB5, 0x01, 0x17, 0xFF, 0xFF, 0x00, 0x02, 0x0D, 0xB5
	.byte 0x0D, 0xE0, 0x00, 0xD5, 0x00, 0x0A, 0x0C, 0x0A, 0x15, 0xE0, 0x09, 0xF6, 0x00, 0x12, 0x0A, 0x68
	.byte 0x16, 0x3C, 0x14, 0x78, 0x00, 0x0D, 0x06, 0x60, 0x11, 0x8B, 0x02, 0xD4, 0x00, 0x14, 0x04, 0x8B
	.byte 0x11, 0x8D, 0x01, 0x5A, 0x00, 0x16, 0x05, 0x60, 0x0D, 0xA9, 0x09, 0x8F, 0x00, 0x19, 0x0C, 0x6A
	.byte 0x0D, 0x92, 0x00, 0x33, 0xFF, 0xFF, 0x00, 0x00, 0x14, 0x55, 0x0B, 0x00, 0x01, 0x40, 0x00, 0x06
	.byte 0x16, 0x00, 0x10, 0x57, 0x05, 0xE8, 0x00, 0x06, 0x12, 0x00, 0x10, 0x28, 0x20, 0x8A, 0x00, 0x0A
	.byte 0x12, 0x00, 0x05, 0x3B, 0x09, 0x8C, 0x00, 0x0A, 0x1C, 0x00, 0x05, 0x4A, 0x19, 0x4C, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x12, 0x00, 0x07, 0xCC, 0x00, 0xD0, 0x00, 0x05, 0x13, 0x0C, 0x05, 0x9D, 0x01, 0x9D
	.byte 0x00, 0x05, 0x12, 0x00, 0x0B, 0xC1, 0x06, 0xFD, 0x00, 0x0B, 0x12, 0xF4, 0x07, 0xE8, 0x01, 0xDD
	.byte 0x00, 0x0A, 0x0A, 0x50, 0x0C, 0x9D, 0x05, 0x4C, 0x00, 0x0A, 0x07, 0xB0, 0x09, 0x9D, 0x14, 0x00
	.byte 0x00, 0x0B, 0x1A, 0x00, 0x06, 0x9D, 0x0E, 0x44, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x80, 0xFF, 0xFF
	dlabel D_060398BA
	.byte 0x00, 0x00
	.long D_060B0914
	.byte 0x06, 0x07, 0x05, 0x1B, 0x26, 0x15, 0x11, 0x18, 0x0C, 0x00, 0x0A, 0x04, 0x27, 0x2E, 0x2B, 0x06
	.byte 0x02, 0x25, 0x12, 0x13, 0x0B, 0x0B, 0x09, 0x17, 0x22, 0x28, 0x01, 0x09, 0x00, 0x00, 0x1A, 0x0C
	.byte 0x20, 0x06, 0x21, 0x18, 0x1C, 0x00, 0x1D, 0x2C, 0x00, 0x00
	.asciz ":45H;=/79B"
	.byte 0x32, 0x00, 0x41, 0x06, 0x47, 0x33, 0x10, 0x16, 0x0E, 0x01, 0x15, 0x44, 0x45, 0x46, 0x00, 0x09
	.byte 0x00, 0x00, 0x1E, 0x08, 0x16, 0x16, 0x24, 0x03
	dlabel D_0603990D
	.byte 0x05, 0x0B, 0x1D, 0x4C, 0x29, 0xFF, 0x07, 0x09, 0x2A, 0x2C, 0x4D, 0xFE, 0x26, 0x28, 0x1E, 0x0B
	.byte 0x51, 0xFD, 0x0A, 0x12, 0x0C, 0x14, 0x0C, 0xFC
	dlabel D_06039925
	.byte 0x05, 0x0B, 0x1D, 0x4C, 0x29, 0xFF, 0x07, 0x09, 0x2A, 0x2C, 0x4D, 0xFE, 0x26, 0x28, 0x1E, 0x1D
	.byte 0x51, 0xFD, 0x14, 0x2D, 0x1F, 0x13, 0x0C, 0xFC
	dlabel D_0603993D
	.byte 0x01, 0x01, 0xFF, 0x01, 0xFF, 0x08, 0xFF, 0x01, 0x02, 0x02, 0x01, 0x09, 0xFF, 0x01, 0xFF, 0xFF
	.byte 0x03, 0x0A, 0x01, 0x01, 0x01, 0xFF, 0x06, 0x0B, 0x01, 0x01, 0xFF, 0x01, 0xFF, 0x08, 0xFF, 0x01
	.byte 0x02, 0x02, 0x01, 0x09, 0xFF, 0x01, 0xFF, 0xFF, 0x03, 0x0A, 0x01, 0x04, 0x01, 0x05, 0x06, 0x0B
	dlabel D_0603996D
	.byte 0x01, 0x01, 0x02, 0x01, 0x01, 0x0A, 0x01, 0x01, 0x03, 0x03, 0xFF, 0x0C, 0xFF, 0x01, 0xFF, 0x01
	.byte 0x05, 0x0E, 0xFF, 0x01, 0xFF, 0xFF, 0x08, 0x10, 0x01, 0x01, 0x02, 0x01, 0x01, 0x0A, 0x01, 0x01
	.byte 0x03, 0x03, 0xFF, 0x0C, 0xFF, 0x01, 0xFF, 0x01, 0x05, 0x0E, 0xFF, 0xFF, 0xFF, 0x07, 0x08, 0x10
	dlabel D_0603999D
	.byte 0x01, 0x01, 0x02, 0x01, 0xFF, 0x0B, 0x01, 0x01, 0x03, 0x03, 0xFF, 0x0D, 0x01, 0x01, 0x04, 0x01
	.byte 0x05, 0x0F, 0xFF, 0x01, 0xFF, 0xFF, 0x08, 0x11, 0x01, 0x01, 0x02, 0x01, 0xFF, 0x0B, 0x01, 0x01
	.byte 0x03, 0x03, 0xFF, 0x0D, 0x01, 0x01, 0x04, 0x01, 0x05, 0x0F, 0xFF, 0xFF, 0xFF, 0x07, 0x08, 0x11
	dlabel D_060399CD
	.byte 0x36, 0x0B, 0x4B, 0x3A, 0x2E, 0x2F, 0x30, 0x09, 0x32, 0x31, 0x40, 0x09, 0x34, 0x28, 0x35, 0x0B
	.byte 0x45, 0x3C, 0x39, 0x12, 0x48, 0x33, 0x1F, 0x3F
	dlabel D_060399E5
	.byte 0xFF, 0x01, 0xFF, 0x01, 0xFF, 0x01, 0x01, 0x01, 0xFF, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0xFF
	.byte 0xFF, 0x01, 0x01, 0x01, 0xFF, 0x01, 0xFF, 0x01
	dlabel D_060399FD
	.byte 0xFF, 0x01, 0xFF
