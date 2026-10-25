	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0602FF50,"ax",@progbits
	.p2align 2

	glabel func_0602FF50
	sts.l	pr,@-r15
	mov.l	.L06030008,r4
	mov.l	r1,@r4
	mov.l	.L0603000C,r4
	mov.l	r1,@r4
	mov.l	.L06030010,r4
	mov.l	r1,@r4
	mov.l	.L06030014,r2
	mov	#0,r0
	mov.l	r0,@r2
	mov.l	.L06030018,r6
	mov	#0,r0
	mov.l	r0,@r6
	mov	#0,r2
	mov	#0,r3
	mov	#0,r4
	mov.l	r2,@(48,r1)
	mov.l	r3,@(52,r1)
	mov.l	r4,@(56,r1)
	mov	r2,r0
	mov.l	r0,@(160,gbr)
	mov	r3,r0
	mov.l	r0,@(164,gbr)
	mov	r4,r0
	mov.l	r0,@(168,gbr)
	mov.l	.L0603001C,r2
	mov.w	.L06030000,r3
	shll16	r3
	mov.l	r3,@r2
	mov.w	.L06030002,r8
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L0602FF94
	mov.w	.L06030000,r8
.L0602FF94:
	mov	r8,r0
	mov.w	r0,@(2,r1)
	mov.w	.L06030004,r0
	mov.w	r0,@(0,r1)
	mov.l	.L06030020,r2
	mov.b	@(20,gbr),r0
	shll	r0
	mov.w	@(r0,r2),r0
	mov.w	r0,@(20,r1)
	mov.w	.L06030006,r0
	mov.w	r0,@(12,r1)
	mov.w	r0,@(28,r1)
	mov	#0,r0
	mov.w	r0,@(210,gbr)
	mov.w	r0,@(22,r1)
	mov.w	r0,@(24,r1)
	mov.w	r0,@(192,gbr)
	mov.w	r0,@(194,gbr)
	mov.b	r0,@(6,r1)
	mov.b	r0,@(7,r1)
	mov.l	r0,@(44,r1)
	mov.l	r0,@(60,r1)
	mov.l	r0,@(8,r1)
	mov.l	.L06030024,r6
	mov.l	r0,@r6
	mov.l	.L06030028,r14
	jsr	@r14
	nop
	mov.l	.L0603002C,r2
	mov.b	@(20,gbr),r0
	mov.b	@(r0,r2),r0
	mov.b	r0,@(5,r1)
	mov	r10,r0
	shll16	r0
	mov.l	r0,@(180,gbr)
	mov	r11,r0
	shll16	r0
	mov.l	r0,@(184,gbr)
	mov	r10,r0
	shll16	r0
	mov.l	r0,@(172,gbr)
	mov	r11,r0
	shll16	r0
	mov.l	r0,@(176,gbr)
	mov.w	.L06030002,r0
	mov.w	r0,@(188,gbr)
	mov.w	.L06030002,r0
	mov.w	r0,@(190,gbr)
	mov.l	.L06030030,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L06030000:
	.short 0x0180
.L06030002:
	.short 0x0100
.L06030004:
	.short 0x0200
.L06030006:
	.short 0x0000
.L06030008:
	.long D_060F309C
.L0603000C:
	.long D_060F30A0
.L06030010:
	.long D_060F30A4
.L06030014:
	.long D_0602FF4C
.L06030018:
	.long D_0602FF48
.L0603001C:
	.long D_0602FF38
.L06030020:
	.long D_06030034
.L06030024:
	.long D_0602FF30
.L06030028:
	.long func_06007BD8
.L0603002C:
	.long D_06030054
.L06030030:
	.long func_06030344
	endlabel func_0602FF50

	.section .data.06030034,"aw",@progbits
	.p2align 2
	dlabel D_06030034
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_06030054
	.byte 0x01, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x01, 0x00
	dlabel D_06030064
	.long lbl_06030340
	.long D_0603008C
	.byte 0x00, 0x00, 0x00, 0x01
	.long lbl_06030890
	.long D_0603008C
	.byte 0x00, 0x00, 0x00, 0x01
	.long lbl_06030988
	.long D_0603008C
	.byte 0x00, 0x00, 0x00, 0x01, 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_0603008C
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x30, 0x00, 0x00, 0x01, 0x18, 0x00
