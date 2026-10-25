	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060464CC,"ax",@progbits
	.p2align 2

	glabel func_060464CC
	sts.l	pr,@-r15
	mov.l	.L06046528,r2
	mov.l	.L0604652C,r3
	mov.w	.L06046522,r6
	mov	#32,r8
	mov	#32,r9
	mov	#32,r14
	mov.l	.L06046530,r0
	jsr	@r0
	nop
	mov.l	.L06046534,r2
	mov.l	.L06046538,r3
	mov.w	.L06046522,r6
	mov	#32,r8
	mov	#32,r9
	mov	#32,r14
	mov.l	.L06046530,r0
	jsr	@r0
	nop
	mov.l	.L0604653C,r2
	mov.l	.L06046540,r3
	mov.w	.L06046524,r6
	mov	#32,r8
	mov	#32,r9
	mov	#32,r14
	mov.l	.L06046530,r0
	jsr	@r0
	nop
	mov.l	.L06046544,r2
	mov.l	.L06046548,r3
	mov.w	.L06046524,r6
	mov	#32,r8
	mov	#32,r9
	mov	#32,r14
	mov.l	.L06046530,r0
	jsr	@r0
	nop
	mov	#0,r0
	mov.w	r0,@(352,gbr)
	mov.w	r0,@(368,gbr)
	lds.l	@r15+,pr
	rts
	nop
.L06046522:
	.short 0x1040
.L06046524:
	.short 0x1140
	.byte 0x00, 0x00
.L06046528:
	.long 0x00200004
.L0604652C:
	.long VDP2_VRAM + 0x5A000
.L06046530:
	.long func_0602C204
.L06046534:
	.long 0x00200804
.L06046538:
	.long VDP2_VRAM + 0x5A800
.L0604653C:
	.long 0x00208718
.L06046540:
	.long VDP2_VRAM + 0x58000
.L06046544:
	.long 0x00208F18
.L06046548:
	.long VDP2_VRAM + 0x58800
	endlabel func_060464CC

	glabel func_0604654C
	mov.b	@(79,gbr),r0
	tst	#128,r0
	bt	.L06046572
	mov.w	@(2,r1),r0
	mov	r0,r2
	mov	#-1,r0
	mov.w	r0,@(2,r1)
	tst	r2,r2
	bf	.L06046572
	mov.w	@(8,r1),r0
	tst	r0,r0
	bf	.L06046572
	mov	#0,r0
	mov.w	r0,@(500,gbr)
	mov.w	r0,@(502,gbr)
	mov.w	r0,@(504,gbr)
	mov	#31,r0
	bra	.L060465B0
	mov.w	r0,@(488,gbr)
.L06046572:
	mov.l	@(4,r1),r0
	jmp	@r0
	nop
	endlabel func_0604654C

	glabel func_06046578
	mov.w	@(500,gbr),r0
	mov	#4,r2
	add	r2,r0
	mov.w	r0,@(500,gbr)
	mov.w	r0,@(502,gbr)
	mov.w	@r1,r2
	mov.w	r0,@(504,gbr)
	dt	r2
	bt	.L0604658E
	rts
	mov.w	r2,@r1
.L0604658E:
	mova	.L06046594,r0
	rts
	mov.l	r0,@(4,r1)
.L06046594:
	.byte 0xC5, 0xF4, 0x40, 0x10, 0xC1, 0xF4, 0x8B, 0x01, 0xC7, 0x01, 0x11, 0x01, 0x00, 0x0B, 0x00, 0x09
	.byte 0xC5, 0xF4, 0x70, 0x01, 0xC1, 0xF4, 0x88, 0x1F, 0x8B, 0x04, 0x81, 0x14
.L060465B0:
	mov	#120,r2
	mova	.L060465BC,r0
	mov.w	r2,@r1
	mov.l	r0,@(4,r1)
	rts
	nop
.L060465BC:
	.byte 0x60, 0x11, 0x40, 0x10, 0x21, 0x01, 0x8B, 0x10
	endlabel func_06046578

	glabel func_060465C4
	sts.l	pr,@-r15
	mov.l	.L060465EC,r0
	mov.l	.L060465F0,r2
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.w	@(2,r1),r0
	mov.l	.L060465F4,r2
	mov.w	.L060465EA,r4
	tst	r0,r0
	bt	.L060465DE
	mov.l	.L060465F8,r2
	mov	#33,r4
.L060465DE:
	mov.l	r2,@(12,r3)
	mova	.L060465FC,r0
	mov.w	r4,@r1
	mov.l	r0,@(4,r1)
	rts
	nop
.L060465EA:
	.short 0x0081
.L060465EC:
	.long func_0600D0D0
.L060465F0:
	.long D_060FFFB0
.L060465F4:
	.long func_06032FB4
.L060465F8:
	.long func_06032FF4
.L060465FC:
	.byte 0x60, 0x11, 0x40, 0x10, 0x21, 0x01, 0x8B, 0x08, 0x85, 0x11, 0x20, 0x08, 0xE0, 0x02, 0x8B, 0x03
	.byte 0xD2, 0x03, 0xE0, 0x00, 0x22, 0x00, 0xE0, 0x10, 0xC0, 0x00, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x00
	.long D_060FFF96
	endlabel func_060465C4

	glabel func_06046620
	sts.l	pr,@-r15
	mov.w	.L0604669A,r0
	mov.w	r0,@(276,gbr)
	mov.l	.L060466A0,r2
	mov.l	.L060466A4,r3
	mov.w	.L0604669C,r4
.L0604662C:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604662C
	add	#4,r2
	mov.l	.L060466A8,r2
	mov.l	.L060466AC,r3
	mov.w	.L0604669E,r4
.L0604663C:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604663C
	add	#4,r2
	mov.l	.L060466B0,r2
	mov.l	.L060466AC,r3
	mov.w	.L0604669E,r4
.L0604664C:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604664C
	add	#4,r2
	mov.l	.L060466B4,r2
	mov.l	.L060466AC,r3
	mov.w	.L0604669E,r4
.L0604665C:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604665C
	add	#4,r2
	bsr	func_06047478
	nop
	bsr	func_06046F30
	nop
	bsr	func_06046FC4
	nop
	bsr	func_06047024
	nop
	bsr	func_06047098
	nop
	mov.l	.L060466B8,r0
	jsr	@r0
	nop
	mov.l	.L060466BC,r0
	jsr	@r0
	nop
	bsr	func_06046E80
	nop
	mov	#0,r0
	mov.b	r0,@(0,r1)
	mov.l	r1,@-r15
	mov.b	@(0,gbr),r0
	cmp/eq	#5,r0
	bf	.L060466C0
	bra	.L060466CC
	mov	#20,r4
.L0604669A:
	.short 0x800A
.L0604669C:
	.short 0x0028
.L0604669E:
	.short 0x0008
.L060466A0:
	.long D_060CA100
.L060466A4:
	.long D_06047350
.L060466A8:
	.long D_060CA180
.L060466AC:
	.long D_060473F0
.L060466B0:
	.long D_060CA1A0
.L060466B4:
	.long D_060CA1C0
.L060466B8:
	.long func_0601E8AC
.L060466BC:
	.long func_060470E0
.L060466C0:
	mov.l	.L060466E8,r2
	mov.b	@r2,r0
	cmp/eq	#0,r0
	bf/s	.L060466CC
	mov	#19,r4
	mov	#18,r4
.L060466CC:
	mov.l	.L060466EC,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	mov.b	@(149,gbr),r0
	tst	#4,r0
	bf	.L060466F4
	mov.l	.L060466F0,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L060466E8:
	.long D_0604711C
.L060466EC:
	.long func_06006A20
.L060466F0:
	.long func_06046784
.L060466F4:
	lds.l	@r15+,pr
	mov.l	.L060466FC,r0
	jmp	@r0
	nop
.L060466FC:
	.long func_0600D1A0
	endlabel func_06046620

	glabel func_06046700
	sts.l	pr,@-r15
	mov.l	.L06046730,r2
	mov.b	@(22,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov	#5,r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	.L06046734,r10
	mov.l	@r10,r8
	mov.l	.L06046738,r9
	mov	#0,r7
.L0604671A:
	mov.l	@r9+,r0
	dmuls.l	r0,r2
	sts	mach,r0
	sts	macl,r10
	xtrct	r0,r10
	cmp/ge	r10,r8
	bt	.L0604673C
	add	#1,r7
	bra	.L0604671A
	nop
	.byte 0x00, 0x00
.L06046730:
	.long D_0601D210
.L06046734:
	.long D_060FFE90
.L06046738:
	.long D_0601D1F8
.L0604673C:
	mov.l	.L06046774,r2
	mov	#5,r0
	mov.b	r7,@(r0,r2)
	bsr	func_06047478
	nop
	bsr	func_06046F30
	nop
	bsr	func_06046FC4
	nop
	bsr	func_06047024
	nop
	bsr	func_06047098
	nop
	mov.l	.L06046778,r0
	jsr	@r0
	nop
	mov.l	.L0604677C,r0
	jsr	@r0
	nop
	bsr	func_06046E80
	nop
	mov.l	.L06046780,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06046774:
	.long D_060FFEB8
.L06046778:
	.long func_0601E8AC
.L0604677C:
	.long func_060470E0
.L06046780:
	.long func_0600D1A0
	endlabel func_06046700

	glabel func_06046784
	sts.l	pr,@-r15
	mov.l	.L060468BC,r0
	jsr	@r0
	nop
	mov	#4,r4
	mov.l	.L060468C0,r6
	bsr	func_06046E48
	mov	#6,r5
	mov	#4,r4
	mov.l	.L060468C4,r6
	bsr	func_06046E48
	mov	#9,r5
	mov	#4,r4
	mov.l	.L060468C8,r6
	bsr	func_06046E48
	mov	#12,r5
	mov	#4,r4
	mov.l	.L060468CC,r6
	bsr	func_06046E48
	mov	#15,r5
	mov	#4,r4
	mov.l	.L060468D0,r6
	bsr	func_06046E48
	mov	#18,r5
	mov.b	@(0,gbr),r0
	cmp/eq	#5,r0
	bt	.L060467CA
	mov	#7,r4
	mov.l	.L060468D4,r6
	bsr	func_06046E48
	mov	#26,r5
	mov	#22,r4
	mov.l	.L060468D8,r6
	bsr	func_06046E48
	mov	#26,r5
.L060467CA:
	mov.l	.L060468DC,r0
	mov.l	@r0,r0
	mov.l	.L060468E0,r11
	add	r0,r11
	mov.b	@(22,gbr),r0
	shlr	r0
	mov.w	.L060468BA,r2
	mulu.w	r0,r2
	sts	macl,r0
	add	r0,r11
	mov.l	.L060468E4,r12
	mov	#5,r13
.L060467E2:
	mov.l	@(4,r11),r4
	mov.l	.L060468E8,r0
	jsr	@r0
	nop
	mov	r0,r2
	mov	#7,r3
	mov.b	@r12+,r4
	mov.l	.L060468EC,r0
	jsr	@r0
	mov.b	@r12,r5
	mov.b	@(22,gbr),r0
	mov	r0,r4
	mov.l	@(4,r11),r5
	mov	#5,r3
	mov.l	.L060468F0,r2
	jsr	@r2
	mov.l	r10,@-r15
	mov.l	@r15+,r10
	shll2	r0
	mov.l	.L060468F4,r2
	mov.l	@(r0,r2),r6
	mov	#17,r4
	bsr	func_06046E48
	mov.b	@r12+,r5
	mov.b	@(0,r11),r0
	mov.b	@r12+,r4
	bsr	func_06046A00
	mov.b	@r12+,r5
	mov.b	@(1,r11),r0
	mov.b	@r12+,r4
	mov.b	@r12+,r5
	cmp/pz	r0
	bf	.L0604683E
	mov	#11,r2
	cmp/hi	r2,r0
	bt	.L0604683E
	shll2	r0
	mov.l	.L060468F8,r6
	bsr	func_06046E48
	mov.l	@(r0,r6),r6
	mov.b	@r12+,r4
	mov.b	@r12+,r5
	mov.b	@(2,r11),r0
	bsr	func_06046DD8
	mov	r0,r2
	add	#-2,r12
.L0604683E:
	add	#2,r12
	dt	r13
	bf/s	.L060467E2
	add	#24,r11
	mov.l	.L060468FC,r2
	mov.b	@r2,r3
	cmp/pz	r3
	bf	.L06046904
	mov.l	.L060468DC,r0
	mov.l	@r0,r0
	mov.l	.L060468E0,r11
	add	r0,r11
	mov.b	@(22,gbr),r0
	shlr	r0
	mov.w	.L060468BA,r2
	mulu.w	r0,r2
	sts	macl,r0
	add	r0,r11
	mov.l	.L060468E4,r12
	mov	#24,r2
	mulu.w	r3,r2
	sts	macl,r2
	add	r2,r11
	shll2	r3
	shll	r3
	add	r3,r12
	mov.l	@(4,r11),r4
	mov.l	.L060468E8,r0
	jsr	@r0
	nop
	mov	r0,r2
	mov	#7,r3
	mov.b	@r12+,r4
	mov.l	.L06046900,r0
	jsr	@r0
	mov.b	@r12,r5
	mov.b	@(22,gbr),r0
	mov	r0,r4
	mov.l	@(4,r11),r5
	mov	#5,r3
	mov.l	.L060468F0,r2
	jsr	@r2
	mov.l	r10,@-r15
	mov.l	@r15+,r10
	shll2	r0
	mov.l	.L060468F4,r2
	mov.l	@(r0,r2),r6
	mov	#17,r4
	bsr	func_06046E48
	mov.b	@r12+,r5
	mov.b	@(0,r11),r0
	mov.b	@r12+,r4
	bsr	func_06046A44
	mov.b	@r12+,r5
	add	#2,r12
	mov.b	@(2,r11),r0
	mov	r0,r2
	mov.b	@r12+,r4
	bsr	func_06046DF8
	mov.b	@r12+,r5
	bra	.L0604696A
	nop
.L060468BA:
	.short 0x0078
.L060468BC:
	.long func_06047A7C
.L060468C0:
	.long D_0604721C
.L060468C4:
	.long D_06047228
.L060468C8:
	.long D_06047234
.L060468CC:
	.long D_06047240
.L060468D0:
	.long D_0604724C
.L060468D4:
	.long D_06047258
.L060468D8:
	.long D_06047272
.L060468DC:
	.long D_060CB014
.L060468E0:
	.long 0x00000100
.L060468E4:
	.long D_0604699C
.L060468E8:
	.long func_0601CB9A
.L060468EC:
	.long func_06047A14
.L060468F0:
	.long func_0601D1C0
.L060468F4:
	.long D_060469E8
.L060468F8:
	.long D_060469C4
.L060468FC:
	.long D_0604711C
.L06046900:
	.long func_06047A04
.L06046904:
	mov.l	.L06046978,r0
	mov.l	@r0,r0
	mov	r0,r4
	mov.l	.L0604697C,r0
	jsr	@r0
	nop
	mov	r0,r2
	mov	#7,r3
	mov	#9,r4
	mov.l	.L06046980,r0
	jsr	@r0
	mov	#22,r5
	mov.b	@(22,gbr),r0
	mov	r0,r4
	mov.l	.L06046978,r0
	mov.l	@r0,r5
	mov	#5,r3
	mov.l	.L06046984,r2
	jsr	@r2
	mov.l	r10,@-r15
	mov.l	@r15+,r10
	shll2	r0
	mov.l	.L06046988,r2
	mov.l	@(r0,r2),r6
	mov	#17,r4
	bsr	func_06046E48
	mov	#22,r5
	mov.l	.L0604698C,r2
	mov.b	@r2,r0
	mov	#21,r4
	bsr	func_06046A44
	mov	#22,r5
	mov.b	@(25,gbr),r0
	add	#-1,r0
	shar	r0
	cmp/pz	r0
	bf	.L0604696A
	mov	#5,r2
	cmp/hi	r2,r0
	bt	.L0604696A
	shll2	r0
	mov.l	.L06046990,r6
	mov.l	@(r0,r6),r6
	mov	#31,r4
	bsr	func_06046E48
	mov	#22,r5
	mov.l	.L06046994,r2
	mov.b	@r2,r2
	mov	#36,r4
	bsr	func_06046DF8
	mov	#22,r5
.L0604696A:
	mov.l	.L06046998,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06046978:
	.long D_06047498
.L0604697C:
	.long func_0601CB9A
.L06046980:
	.long func_06047A04
.L06046984:
	.long func_0601D1C0
.L06046988:
	.long D_060469E8
.L0604698C:
	.long D_060CB003
.L06046990:
	.long D_060469C4
.L06046994:
	.long D_060FFC1B
.L06046998:
	.long func_06046B04
	dlabel D_0604699C
	.byte 0x09, 0x06, 0x15, 0x06, 0x1F, 0x06, 0x24, 0x06, 0x09, 0x09, 0x15, 0x09, 0x1F, 0x09, 0x24, 0x09
	.byte 0x09, 0x0C, 0x15, 0x0C, 0x1F, 0x0C, 0x24, 0x0C, 0x09, 0x0F, 0x15, 0x0F, 0x1F, 0x0F, 0x24, 0x0F
	.byte 0x09, 0x12, 0x15, 0x12, 0x1F, 0x12, 0x24, 0x12
	dlabel D_060469C4
	.long D_06047120
	.long D_0604713C
	.long D_06047190
	.long D_060471C8
	.long D_06047158
	.long D_06047174
	.long D_06047200
	.long D_06047200
	.long D_060471AC
	dlabel D_060469E8
	.long D_06047306
	.long D_06047312
	.long D_0604731E
	.long D_0604732A
	.long D_06047336
	.long D_06047342
	endlabel func_06046784

	glabel func_06046A00
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov.l	r7,@-r15
	sts.l	pr,@-r15
	mov.l	.L06046A38,r2
	mov	#5,r7
	cmp/ge	r7,r0
	shll2	r0
	bt/s	.L06046A20
	mov.l	@(r0,r2),r2
	mov.l	.L06046A3C,r0
	mov.l	@r0,r0
	add	r0,r2
.L06046A20:
	mov.l	.L06046A40,r0
	jsr	@r0
	mov	#8,r3
	lds.l	@r15+,pr
	mov.l	@r15+,r7
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	rts
	nop
.L06046A38:
	.long D_06046A88
.L06046A3C:
	.long D_060CB014
.L06046A40:
	.long func_0604792C
	endlabel func_06046A00

	glabel func_06046A44
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov.l	r7,@-r15
	sts.l	pr,@-r15
	mov.l	.L06046A7C,r2
	mov	#5,r7
	cmp/ge	r7,r0
	shll2	r0
	bt/s	.L06046A64
	mov.l	@(r0,r2),r2
	mov.l	.L06046A80,r0
	mov.l	@r0,r0
	add	r0,r2
.L06046A64:
	mov.l	.L06046A84,r0
	jsr	@r0
	mov	#8,r3
	lds.l	@r15+,pr
	mov.l	@r15+,r7
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	rts
	nop
.L06046A7C:
	.long D_06046A88
.L06046A80:
	.long D_060CB014
.L06046A84:
	.long func_0604791C
	dlabel D_06046A88
	.byte 0x00, 0x00, 0x05, 0x28, 0x00, 0x00, 0x05, 0x78, 0x00, 0x00, 0x05, 0xC8, 0x00, 0x00, 0x06, 0x18
	.byte 0x00, 0x00, 0x06, 0x68
	.long D_06046AB4
	.long D_06046ABC
	.long D_06046AC4
	.long D_06046ACC
	.long D_06046AD4
	.long D_06046ADC
	dlabel D_06046AB4
	.byte 0x53, 0x4F, 0x4E, 0x49, 0x43, 0x20, 0x20, 0x20
	dlabel D_06046ABC
	.byte 0x4B, 0x4E, 0x55, 0x43, 0x4B, 0x4C, 0x45, 0x53
	dlabel D_06046AC4
	.byte 0x4D, 0x49, 0x4C, 0x45, 0x53, 0x20, 0x20, 0x20
	dlabel D_06046ACC
	.byte 0x41, 0x4D, 0x59, 0x20, 0x20, 0x20, 0x20, 0x20
	dlabel D_06046AD4
	.byte 0x45, 0x47, 0x47, 0x4D, 0x41, 0x4E, 0x20, 0x20
	dlabel D_06046ADC
	.byte 0x4D, 0x45, 0x54, 0x41, 0x4C, 0x20, 0x20, 0x20, 0x46, 0x41, 0x4E, 0x47, 0x20, 0x20, 0x20, 0x20
	.byte 0x45, 0x53, 0x50, 0x49, 0x4F, 0x20, 0x20, 0x20, 0x42, 0x45, 0x41, 0x4E, 0x20, 0x20, 0x20, 0x20
	.byte 0x46, 0x4C, 0x49, 0x43, 0x4B, 0x59, 0x20, 0x20
	endlabel func_06046A44

	glabel func_06046B04
	sts.l	pr,@-r15
	mov.l	.L06046B28,r2
	mov.w	@r2,r0
	tst	#96,r0
	bf	.L06046B34
	mov.w	.L06046B26,r2
	tst	r2,r0
	bt	.L06046B20
	mov.l	.L06046B2C,r2
	mov	#0,r0
	mov.w	r0,@r2
	mov.l	.L06046B30,r0
	mov.l	r0,@-r1
	add	#4,r1
.L06046B20:
	lds.l	@r15+,pr
	rts
	nop
.L06046B26:
	.short 0x0210
.L06046B28:
	.long D_060D9072
.L06046B2C:
	.long D_06033CA0 + 0x34
.L06046B30:
	.long func_06046DA4
.L06046B34:
	mov.b	@(0,r1),r0
	tst	r0,r0
	not	r0,r0
	bt/s	.L06046B58
	mov.b	r0,@(0,r1)
	mov.l	.L06046B50,r2
	mov	#1,r0
	mov.w	r0,@r2
	mov.l	.L06046B54,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L06046B50:
	.long D_06033CA0 + 0x34
.L06046B54:
	.long func_06046784
.L06046B58:
	mov.l	.L06046B6C,r2
	mov	#0,r0
	mov.w	r0,@r2
	mov.l	.L06046B70,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06046B6C:
	.long D_06033CA0 + 0x34
.L06046B70:
	.long func_06046B74
	endlabel func_06046B04

	glabel func_06046B74
	sts.l	pr,@-r15
	bsr	func_06047A7C
	nop
	mov	#7,r4
	mov.l	.L06046C08,r6
	bsr	func_06046E48
	mov	#2,r5
	mov	#16,r4
	mov.l	.L06046C0C,r6
	bsr	func_06046E48
	mov	#2,r5
	mov	#25,r4
	mov.l	.L06046C10,r6
	bsr	func_06046E48
	mov	#2,r5
	mov	#34,r4
	mov.l	.L06046C14,r6
	bsr	func_06046E48
	mov	#2,r5
	mov	#2,r4
	mov.l	.L06046C18,r6
	bsr	func_06046E48
	mov	#6,r5
	mov	#2,r4
	mov.l	.L06046C1C,r6
	bsr	func_06046E48
	mov	#9,r5
	mov	#2,r4
	mov.l	.L06046C20,r6
	bsr	func_06046E48
	mov	#12,r5
	mov	#2,r4
	mov.l	.L06046C24,r6
	bsr	func_06046E48
	mov	#15,r5
	mov	#2,r4
	mov.l	.L06046C28,r6
	bsr	func_06046E48
	mov	#18,r5
	mov.b	@(0,gbr),r0
	cmp/eq	#5,r0
	bt	.L06046BD8
	mov	#7,r4
	mov.l	.L06046C2C,r6
	bsr	func_06046E48
	mov	#26,r5
	mov	#22,r4
	mov.l	.L06046C30,r6
	bsr	func_06046E48
	mov	#26,r5
.L06046BD8:
	mov.l	.L06046C34,r0
	mov.l	@r0,r0
	mov.l	.L06046C38,r10
	add	r0,r10
	mov.b	@(22,gbr),r0
	shlr	r0
	mov.w	.L06046C04,r2
	mulu.w	r0,r2
	sts	macl,r0
	add	r0,r10
	mov.l	.L06046C3C,r2
	mov.b	@r2,r0
	mov	#5,r14
	sub	r0,r14
	mov.l	.L06046C40,r12
	mov	#5,r13
.L06046BF8:
	cmp/eq	r13,r14
	bf	.L06046C44
	bsr	func_06046CC8
	nop
	bra	.L06046C48
	nop
.L06046C04:
	.short 0x0078
	.byte 0x00, 0x00
.L06046C08:
	.long D_06047296
.L06046C0C:
	.long D_060472B2
.L06046C10:
	.long D_060472CE
.L06046C14:
	.long D_060472EA
.L06046C18:
	.long D_0604721C
.L06046C1C:
	.long D_06047228
.L06046C20:
	.long D_06047234
.L06046C24:
	.long D_06047240
.L06046C28:
	.long D_0604724C
.L06046C2C:
	.long D_06047258
.L06046C30:
	.long D_06047272
.L06046C34:
	.long D_060CB014
.L06046C38:
	.long 0x00000100
.L06046C3C:
	.long D_0604711C
.L06046C40:
	.long D_06046D78
.L06046C44:
	bsr	func_06046C74
	nop
.L06046C48:
	mov.w	.L06046C68,r0
	dt	r13
	bf/s	.L06046BF8
	add	r0,r10
	mov.l	.L06046C6C,r2
	mov.b	@r2,r0
	cmp/pz	r0
	bt	.L06046C5C
	bsr	func_06046D1C
	nop
.L06046C5C:
	mov.l	.L06046C70,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L06046C68:
	.short 0x0008
	.byte 0x00, 0x00
.L06046C6C:
	.long D_0604711C
.L06046C70:
	.long func_06046B04
	endlabel func_06046B74

	glabel func_06046C74
	sts.l	pr,@-r15
	mov	#4,r11
.L06046C78:
	mov.l	@(8,r10),r4
	mov.l	.L06046CB8,r0
	jsr	@r0
	mov	#6,r3
	mov	r0,r2
	mov.b	@r12+,r4
	mov.l	.L06046CBC,r0
	jsr	@r0
	mov.b	@r12+,r5
	mov.b	@(22,gbr),r0
	mov	r0,r4
	mov.l	@(8,r10),r5
	mov	#4,r3
	sub	r11,r3
	mov.l	.L06046CC0,r2
	jsr	@r2
	mov.l	r10,@-r15
	mov.l	@r15+,r10
	shll2	r0
	mov.l	.L06046CC4,r2
	mov.l	@(r0,r2),r6
	add	#-2,r12
	mov.b	@r12+,r4
	mov.b	@r12+,r5
	bsr	func_06046E48
	add	#6,r4
	dt	r11
	bf/s	.L06046C78
	add	#4,r10
	lds.l	@r15+,pr
	rts
	nop
.L06046CB8:
	.long func_0601CB9A
.L06046CBC:
	.long func_06047A14
.L06046CC0:
	.long func_0601D1C0
.L06046CC4:
	.long D_060469E8
	endlabel func_06046C74

	glabel func_06046CC8
	sts.l	pr,@-r15
	mov	#4,r11
.L06046CCC:
	mov.l	@(8,r10),r4
	mov.l	.L06046D0C,r0
	jsr	@r0
	mov	#6,r3
	mov	r0,r2
	mov.b	@r12+,r4
	mov.l	.L06046D10,r0
	jsr	@r0
	mov.b	@r12+,r5
	mov.b	@(22,gbr),r0
	mov	r0,r4
	mov.l	@(8,r10),r5
	mov	#4,r3
	sub	r11,r3
	mov.l	.L06046D14,r2
	jsr	@r2
	mov.l	r10,@-r15
	mov.l	@r15+,r10
	shll2	r0
	mov.l	.L06046D18,r2
	mov.l	@(r0,r2),r6
	add	#-2,r12
	mov.b	@r12+,r4
	mov.b	@r12+,r5
	bsr	func_06046E48
	add	#6,r4
	dt	r11
	bf/s	.L06046CCC
	add	#4,r10
	lds.l	@r15+,pr
	rts
	nop
.L06046D0C:
	.long func_0601CB9A
.L06046D10:
	.long func_06047A04
.L06046D14:
	.long func_0601D1C0
.L06046D18:
	.long D_060469E8
	endlabel func_06046CC8

	glabel func_06046D1C
	sts.l	pr,@-r15
	mov.l	.L06046D60,r10
	mov.l	.L06046D64,r12
	mov	#4,r11
.L06046D24:
	mov.l	@r10,r4
	mov.l	.L06046D68,r0
	jsr	@r0
	mov	#6,r3
	mov	r0,r2
	mov.b	@r12,r4
	mov.l	.L06046D6C,r0
	jsr	@r0
	mov	#22,r5
	mov.b	@(22,gbr),r0
	mov	r0,r4
	mov.l	@r10+,r5
	mov	#4,r3
	sub	r11,r3
	mov.l	.L06046D70,r2
	jsr	@r2
	mov.l	r10,@-r15
	mov.l	@r15+,r10
	shll2	r0
	mov.l	.L06046D74,r2
	mov.l	@(r0,r2),r6
	mov.b	@r12+,r4
	add	#6,r4
	bsr	func_06046E48
	mov	#22,r5
	dt	r11
	bf	.L06046D24
	lds.l	@r15+,pr
	rts
	nop
.L06046D60:
	.long D_0604749C
.L06046D64:
	.long D_06046DA0
.L06046D68:
	.long func_0601CB9A
.L06046D6C:
	.long func_06047A04
.L06046D70:
	.long func_0601D1C0
.L06046D74:
	.long D_060469E8
	dlabel D_06046D78
	.long D_06060F06
	.byte 0x18, 0x06, 0x21, 0x06
	.long D_06090F09
	.byte 0x18, 0x09, 0x21, 0x09
	.long D_060C0F0C
	.byte 0x18, 0x0C, 0x21, 0x0C
	.long D_060F0F0F
	.byte 0x18, 0x0F, 0x21, 0x0F, 0x06, 0x12, 0x0F, 0x12, 0x18, 0x12, 0x21, 0x12
	dlabel D_06046DA0
	.long D_060F1821
	endlabel func_06046D1C

	glabel func_06046DA4
	sts.l	pr,@-r15
	bsr	func_06047A7C
	nop
	mov.b	@(0,gbr),r0
	cmp/eq	#5,r0
	bt	.L06046DC0
	mov	#7,r4
	mov.l	.L06046DCC,r6
	bsr	func_06046E48
	mov	#26,r5
	mov	#22,r4
	mov.l	.L06046DD0,r6
	bsr	func_06046E48
	mov	#26,r5
.L06046DC0:
	mov.l	.L06046DD4,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L06046DCC:
	.long D_06047258
.L06046DD0:
	.long D_06047272
.L06046DD4:
	.long func_06046B04
	endlabel func_06046DA4

	glabel func_06046DD8
	sts.l	pr,@-r15
	mov	r2,r0
	add	#-10,r2
	cmp/pz	r2
	bf	.L06046DEE
	shll2	r2
	mova	.L06046E18,r0
	add	r0,r2
	mov.l	.L06046DF4,r0
	jsr	@r0
	mov	#4,r3
.L06046DEE:
	lds.l	@r15+,pr
	rts
	nop
.L06046DF4:
	.long func_0604792C
	endlabel func_06046DD8

	glabel func_06046DF8
	sts.l	pr,@-r15
	mov	r2,r0
	add	#-10,r2
	cmp/pz	r2
	bf	.L06046E0E
	shll2	r2
	mova	.L06046E18,r0
	add	r0,r2
	mov.l	.L06046E14,r0
	jsr	@r0
	mov	#4,r3
.L06046E0E:
	lds.l	@r15+,pr
	rts
	nop
.L06046E14:
	.long func_0604791C
.L06046E18:
	.byte 0x2A, 0x31, 0x2E, 0x30, 0x2A, 0x31, 0x2E, 0x31, 0x2A, 0x31, 0x2E, 0x32, 0x2A, 0x31, 0x2E, 0x33
	.byte 0x2A, 0x31, 0x2E, 0x34, 0x2A, 0x31, 0x2E, 0x35, 0x2A, 0x31, 0x2E, 0x36, 0x2A, 0x31, 0x2E, 0x37
	.byte 0x2A, 0x31, 0x2E, 0x38, 0x2A, 0x31, 0x2E, 0x39, 0x2A, 0x32, 0x2E, 0x30, 0x2A, 0x32, 0x2E, 0x31
	endlabel func_06046DF8

	glabel func_06046E48
	mov.l	.L06046E7C,r7
	shll8	r5
	shlr	r5
	add	r5,r7
	add	r4,r7
	add	r4,r7
	mov.w	@r6+,r2
	mov.w	@r6+,r3
	mov.w	.L06046E78,r5
.L06046E5A:
	mov	r2,r4
.L06046E5C:
	mov.w	@r6+,r0
	dt	r4
	add	r5,r0
	mov.w	r0,@r7
	bf/s	.L06046E5C
	add	#2,r7
	sub	r2,r7
	sub	r2,r7
	add	#64,r7
	dt	r3
	bf/s	.L06046E5A
	add	#64,r7
	rts
	nop
.L06046E78:
	.short 0x80E8
	.byte 0x00, 0x00
.L06046E7C:
	.long VDP2_VRAM + 0x5C000
	endlabel func_06046E48

	glabel func_06046E80
	sts.l	pr,@-r15
	mov.l	r1,@-r15
	mov.l	.L06046EFC,r9
	mov.b	@r9,r10
	cmp/pz	r10
	bf	.L06046EF4
	mov.l	.L06046F00,r0
	mov.b	@(r0,r10),r11
	mov	#1,r0
	tst	r0,r11
	bf	.L06046EA2
	mov.l	.L06046F04,r0
	add	r10,r0
	mov.w	@(r0,r10),r9
	mov	#1,r0
	cmp/ge	r0,r9
	bf	.L06046EC0
.L06046EA2:
	mov	r10,r4
	mov	#1,r5
	mov.l	.L06046F08,r2
	mov.b	r5,@r2
	mov.l	.L06046F0C,r0
	jsr	@r0
	nop
	tst	r0,r0
	bf	.L06046F18
	mov.l	.L06046F10,r0
	jsr	@r0
	nop
	mov.l	.L06046F14,r0
	jsr	@r0
	nop
.L06046EC0:
	mov.l	.L06046F00,r0
	mov.b	@(r0,r10),r11
	mov	#2,r0
	tst	r0,r11
	bf	.L06046ED6
	mov.l	.L06046F04,r0
	add	r10,r0
	mov.w	@(r0,r10),r9
	mov	#2,r0
	cmp/ge	r0,r9
	bf	.L06046EF4
.L06046ED6:
	mov	r10,r4
	mov	#2,r5
	mov.l	.L06046F08,r2
	mov.b	r5,@r2
	mov.l	.L06046F0C,r0
	jsr	@r0
	nop
	tst	r0,r0
	bf	.L06046F18
	mov.l	.L06046F10,r0
	jsr	@r0
	nop
	mov.l	.L06046F14,r0
	jsr	@r0
	nop
.L06046EF4:
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
.L06046EFC:
	.long D_060CB050
.L06046F00:
	.long D_060CB044
.L06046F04:
	.long D_060CB048
.L06046F08:
	.long D_060CB052
.L06046F0C:
	.long func_060055CC
.L06046F10:
	.long func_0600598C
.L06046F14:
	.long func_06005C96
.L06046F18:
	mov.l	.L06046F2C,r2
	mov	#1,r0
	mov.b	r0,@r2
	mov	#14,r0
	mov.b	r0,@(0,gbr)
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06046F2C:
	.long D_060CB061
	endlabel func_06046E80

	glabel func_06046F30
	mov.l	.L06046F68,r0
	mov.l	@r0,r0
	mov.l	.L06046F6C,r4
	add	r0,r4
	mov.b	@(22,gbr),r0
	shlr	r0
	mov.w	.L06046F62,r2
	mulu.w	r0,r2
	sts	macl,r0
	add	r0,r4
	mov	r4,r6
	mov.w	.L06046F64,r0
	add	r0,r6
	mov.l	.L06046F70,r5
	mov.l	@(656,gbr),r0
	mov	#5,r3
.L06046F50:
	mov.l	@(4,r4),r2
	cmp/hi	r2,r0
	bt	.L06046F74
	dt	r3
	bf/s	.L06046F50
	add	#24,r4
	mov	#-1,r2
	rts
	mov.b	r2,@r5
.L06046F62:
	.short 0x0078
.L06046F64:
	.short 0x0060
	.byte 0x00, 0x00
.L06046F68:
	.long D_060CB014
.L06046F6C:
	.long 0x00000100
.L06046F70:
	.long D_0604711C
.L06046F74:
	mov	#5,r2
	sub	r3,r2
	mov.b	r2,@r5
.L06046F7A:
	cmp/eq	r4,r6
	bt/s	.L06046F86
	add	#-4,r6
	mov.l	@r6,r3
	bra	.L06046F7A
	mov.l	r3,@(24,r6)
.L06046F86:
	mov.l	r0,@(4,r4)
	mov.l	@(664,gbr),r0
	mov.l	r0,@(8,r4)
	mov.l	@(668,gbr),r0
	mov.l	r0,@(12,r4)
	mov.l	@(672,gbr),r0
	mov.l	r0,@(16,r4)
	mov.l	@(676,gbr),r0
	mov.l	r0,@(20,r4)
	mov.l	.L06046FB8,r2
	mov.b	@r2,r0
	mov.b	r0,@(2,r4)
	mov.b	@(25,gbr),r0
	add	#-1,r0
	shar	r0
	mov.b	r0,@(1,r4)
	mov.l	.L06046FBC,r3
	mov.b	@r3,r0
	mov.b	r0,@(0,r4)
	mov.l	.L06046FC0,r2
	mov.b	@r2,r0
	mov.b	r0,@(3,r4)
	rts
	nop
	.byte 0x00, 0x00
.L06046FB8:
	.long D_060FFC1B
.L06046FBC:
	.long D_060CB003
.L06046FC0:
	.long D_060FFC1A
	endlabel func_06046F30

	glabel func_06046FC4
	mov.l	.L06047010,r3
	mov.b	@r3,r0
	mov	r0,r7
	mov.l	.L06047014,r0
	mov.l	@r0,r0
	mov.l	.L06047018,r4
	add	r0,r4
	mov.b	@(22,gbr),r0
	shlr	r0
	mov.w	.L0604700C,r2
	mulu.w	r0,r2
	sts	macl,r0
	add	r0,r4
	mov	#4,r6
	mov.l	.L0604701C,r3
	mov.l	.L06047020,r5
.L06046FE4:
	mov.l	@r3+,r0
	mov.l	@(4,r4),r2
	cmp/hi	r2,r0
	bf	.L06046FF2
	mov.l	r0,@(4,r4)
	mov	r7,r0
	mov.b	r0,@(0,r4)
.L06046FF2:
	mov.w	@r5+,r2
	mov.w	@(2,r4),r0
	cmp/hi	r0,r2
	bf	.L06047002
	mov	r2,r0
	mov.w	r0,@(2,r4)
	mov	r7,r0
	mov.b	r0,@(1,r4)
.L06047002:
	dt	r6
	bf/s	.L06046FE4
	add	#8,r4
	rts
	nop
.L0604700C:
	.short 0x0020
	.byte 0x00, 0x00
.L06047010:
	.long D_060CB003
.L06047014:
	.long D_060CB014
.L06047018:
	.long 0x00000000
.L0604701C:
	.long D_060FFE98
.L06047020:
	.long D_060FFF64
	endlabel func_06046FC4

	glabel func_06047024
	mov.l	.L06047064,r0
	mov.l	@r0,r0
	mov.l	.L06047068,r4
	add	r0,r4
	mov.b	@(25,gbr),r0
	add	#-1,r0
	shar	r0
	cmp/pz	r0
	bf	.L06047090
	mov.w	.L0604705E,r2
	mulu.w	r0,r2
	sts	macl,r0
	add	r0,r4
	mov	r4,r6
	mov.w	.L06047060,r0
	add	r0,r6
	mov.l	.L0604706C,r5
	mov.l	.L06047070,r2
	mov.b	@r2,r2
	mov	#5,r3
.L0604704C:
	mov.b	@(1,r4),r0
	cmp/hi	r0,r2
	bt	.L06047074
	dt	r3
	bf/s	.L0604704C
	add	#2,r4
	mov	#-1,r2
	rts
	mov.b	r2,@r5
.L0604705E:
	.short 0x000A
.L06047060:
	.short 0x0008
	.byte 0x00, 0x00
.L06047064:
	.long D_060CB014
.L06047068:
	.long 0x000004C0
.L0604706C:
	.long D_0604711D
.L06047070:
	.long D_060FFC1A
.L06047074:
	mov	#5,r7
	sub	r3,r7
	mov.b	r7,@r5
.L0604707A:
	cmp/eq	r4,r6
	bt/s	.L06047086
	add	#-1,r6
	mov.b	@r6,r0
	bra	.L0604707A
	mov.b	r0,@(2,r6)
.L06047086:
	mov	r2,r0
	mov.b	r0,@(1,r4)
	mov.l	.L06047094,r3
	mov.b	@r3,r0
	mov.b	r0,@(0,r4)
.L06047090:
	rts
	nop
.L06047094:
	.long D_060CB003
	endlabel func_06047024

	glabel func_06047098
	mov.l	.L060470D4,r0
	mov.l	@r0,r0
	mov.l	.L060470D8,r4
	add	r0,r4
	mov.l	.L060470DC,r2
	mov.b	@r2,r0
	mov.w	.L060470D2,r3
	mulu.w	r0,r3
	sts	macl,r0
	add	r0,r4
	mov	r4,r5
	add	#16,r4
	mov.b	@(22,gbr),r0
	mov.w	@(r0,r4),r2
	add	#1,r2
	mov.w	r2,@(r0,r4)
	mov.b	@(22,gbr),r0
	shlr	r0
	mov	#1,r2
	cmp/eq	#0,r0
	bt	.L060470C8
.L060470C2:
	dt	r0
	bf/s	.L060470C2
	shll	r2
.L060470C8:
	mov.b	@(13,r5),r0
	or	r2,r0
	mov.b	r0,@(13,r5)
	rts
	nop
.L060470D2:
	.short 0x0050
.L060470D4:
	.long D_060CB014
.L060470D8:
	.long 0x00000528
.L060470DC:
	.long D_060CB003
	endlabel func_06047098

	glabel func_060470E0
	mov.l	.L0604710C,r0
	mov.l	@r0,r0
	mov.l	.L06047110,r4
	add	r0,r4
	mov.l	.L06047114,r2
	mov.b	@r2,r0
	mov.w	.L06047106,r3
	mulu.w	r0,r3
	sts	macl,r0
	add	r0,r4
	mov.l	.L06047118,r3
	mov.w	.L06047108,r0
	add	r0,r4
	mov.b	@r4+,r0
	mov.b	r0,@(0,r3)
	mov.b	@r4+,r0
	mov.b	r0,@(1,r3)
	rts
	nop
.L06047106:
	.short 0x0050
.L06047108:
	.short 0x004E
	.byte 0x00, 0x00
.L0604710C:
	.long D_060CB014
.L06047110:
	.long 0x00000528
.L06047114:
	.long D_060CB003
.L06047118:
	.long D_060CB064
	dlabel D_0604711C
	.byte 0x00
	dlabel D_0604711D
	.byte 0x00, 0x00, 0x09
	dlabel D_06047120
	.byte 0x00, 0x04, 0x00, 0x03, 0x00, 0x15, 0x00, 0x16, 0x00, 0x17, 0x00, 0x18, 0x00, 0x36, 0x00, 0x37
	.byte 0x00, 0x38, 0x00, 0x39, 0x00, 0x57, 0x00, 0x58, 0x00, 0x59, 0x00, 0x5A
	dlabel D_0604713C
	.byte 0x00, 0x04, 0x00, 0x03, 0x00, 0x19, 0x00, 0x1A, 0x00, 0x1B, 0x00, 0x1C, 0x00, 0x36, 0x00, 0x3A
	.byte 0x00, 0x3B, 0x00, 0x3C, 0x00, 0x57, 0x00, 0x5B, 0x00, 0x5C, 0x00, 0x5A
	dlabel D_06047158
	.byte 0x00, 0x04, 0x00, 0x03, 0x00, 0x1D, 0x00, 0x1E, 0x00, 0x1F, 0x00, 0x20, 0x00, 0x3D, 0x00, 0x3E
	.byte 0x00, 0x3F, 0x00, 0x40, 0x00, 0x57, 0x00, 0x58, 0x00, 0x59, 0x00, 0x5A
	dlabel D_06047174
	.byte 0x00, 0x04, 0x00, 0x03, 0x00, 0x21, 0x00, 0x22, 0x00, 0x23, 0x00, 0x24, 0x00, 0x41, 0x00, 0x42
	.byte 0x00, 0x43, 0x00, 0x44, 0x00, 0x57, 0x00, 0x58, 0x00, 0x59, 0x00, 0x5A
	dlabel D_06047190
	.byte 0x00, 0x04, 0x00, 0x03, 0x00, 0x25, 0x00, 0x26, 0x00, 0x27, 0x00, 0x28, 0x00, 0x45, 0x00, 0x46
	.byte 0x00, 0x47, 0x00, 0x48, 0x00, 0x57, 0x00, 0x58, 0x00, 0x59, 0x00, 0x5A
	dlabel D_060471AC
	.byte 0x00, 0x04, 0x00, 0x03, 0x00, 0x19, 0x00, 0x29, 0x00, 0x2A, 0x00, 0x1C, 0x00, 0x36, 0x00, 0x49
	.byte 0x00, 0x4A, 0x00, 0x4B, 0x00, 0x57, 0x00, 0x58, 0x00, 0x59, 0x00, 0x5A
	dlabel D_060471C8
	.byte 0x00, 0x04, 0x00, 0x03, 0x00, 0x2B, 0x00, 0x2C, 0x00, 0x2D, 0x00, 0x2E, 0x00, 0x4C, 0x00, 0x4D
	.byte 0x00, 0x4E, 0x00, 0x4F, 0x00, 0x57, 0x00, 0x58, 0x00, 0x59, 0x00, 0x5A, 0x00, 0x04, 0x00, 0x03
	.byte 0x00, 0x2F, 0x00, 0x30, 0x00, 0x31, 0x00, 0x32, 0x00, 0x50, 0x00, 0x51, 0x00, 0x52, 0x00, 0x4B
	.byte 0x00, 0x57, 0x00, 0x5D, 0x00, 0x5E, 0x00, 0x5A
	dlabel D_06047200
	.byte 0x00, 0x04, 0x00, 0x03, 0x00, 0x19, 0x00, 0x33, 0x00, 0x34, 0x00, 0x35, 0x00, 0x53, 0x00, 0x54
	.byte 0x00, 0x55, 0x00, 0x56, 0x00, 0x57, 0x00, 0x5F, 0x00, 0x60, 0x00, 0x5A
	dlabel D_0604721C
	.byte 0x00, 0x02, 0x00, 0x02, 0x10, 0x01, 0x10, 0x02, 0x10, 0x0B, 0x10, 0x0C
	dlabel D_06047228
	.byte 0x00, 0x02, 0x00, 0x02, 0x10, 0x03, 0x10, 0x04, 0x10, 0x0D, 0x10, 0x0E
	dlabel D_06047234
	.byte 0x00, 0x02, 0x00, 0x02, 0x10, 0x05, 0x10, 0x06, 0x10, 0x0F, 0x10, 0x10
	dlabel D_06047240
	.byte 0x00, 0x02, 0x00, 0x02, 0x10, 0x07, 0x10, 0x08, 0x10, 0x11, 0x10, 0x12
	dlabel D_0604724C
	.byte 0x00, 0x02, 0x00, 0x02, 0x10, 0x09, 0x10, 0x0A, 0x10, 0x13, 0x10, 0x14
	dlabel D_06047258
	.byte 0x00, 0x0B, 0x00, 0x01, 0x40, 0x9D, 0x40, 0x9E, 0x40, 0x9F, 0x40, 0xA0, 0x40, 0xA1, 0x40, 0xA2
	.byte 0x40, 0xA3, 0x40, 0xA4, 0x40, 0xA5, 0x40, 0xA6, 0x40, 0xA7
	dlabel D_06047272
	.byte 0x00, 0x10, 0x00, 0x01, 0x40, 0xA8, 0x40, 0xA9, 0x40, 0xAA, 0x40, 0x9E, 0x40, 0x9F, 0x40, 0xA0
	.byte 0x40, 0xA1, 0x40, 0xAB, 0x40, 0xAC, 0x40, 0xAD, 0x40, 0xAE, 0x40, 0xAF, 0x40, 0x9F, 0x40, 0xA0
	.byte 0x40, 0xA1, 0x40, 0xA2
	dlabel D_06047296
	.byte 0x00, 0x06, 0x00, 0x02, 0x30, 0x61, 0x30, 0x62, 0x30, 0x63, 0x30, 0x64, 0x30, 0x65, 0x30, 0x00
	.byte 0x30, 0x6E, 0x30, 0x6F, 0x30, 0x70, 0x30, 0x71, 0x30, 0x72, 0x30, 0x73
	dlabel D_060472B2
	.byte 0x00, 0x06, 0x00, 0x02, 0x30, 0x66, 0x30, 0x67, 0x30, 0x68, 0x30, 0x69, 0x30, 0x6A, 0x30, 0x00
	.byte 0x30, 0x74, 0x30, 0x75, 0x30, 0x76, 0x30, 0x77, 0x30, 0x78, 0x30, 0x79
	dlabel D_060472CE
	.byte 0x00, 0x06, 0x00, 0x02, 0x30, 0x6B, 0x30, 0x6C, 0x30, 0x6D, 0x30, 0x69, 0x30, 0x6A, 0x30, 0x00
	.byte 0x30, 0x7A, 0x30, 0x7B, 0x30, 0x7C, 0x30, 0x77, 0x30, 0x78, 0x30, 0x79
	dlabel D_060472EA
	.byte 0x00, 0x06, 0x00, 0x02, 0x30, 0x7D, 0x30, 0x7E, 0x30, 0x7F, 0x30, 0x80, 0x30, 0x6A, 0x30, 0x00
	.byte 0x30, 0x81, 0x30, 0x82, 0x30, 0x83, 0x30, 0x84, 0x30, 0x78, 0x30, 0x79
	dlabel D_06047306
	.byte 0x00, 0x02, 0x00, 0x02, 0x20, 0x91, 0x20, 0x92, 0x20, 0x97, 0x20, 0x98
	dlabel D_06047312
	.byte 0x00, 0x02, 0x00, 0x02, 0x20, 0x93, 0x20, 0x94, 0x20, 0x99, 0x20, 0x9A
	dlabel D_0604731E
	.byte 0x00, 0x02, 0x00, 0x02, 0x20, 0x95, 0x20, 0x96, 0x20, 0x9B, 0x20, 0x9C
	dlabel D_0604732A
	.byte 0x00, 0x02, 0x00, 0x02, 0x20, 0x85, 0x20, 0x86, 0x20, 0x87, 0x20, 0x88
	dlabel D_06047336
	.byte 0x00, 0x02, 0x00, 0x02, 0x20, 0x89, 0x20, 0x8A, 0x20, 0x8B, 0x20, 0x8C
	dlabel D_06047342
	.byte 0x00, 0x02, 0x00, 0x02, 0x20, 0x8D, 0x20, 0x8E, 0x20, 0x8F, 0x20, 0x90, 0x00, 0x09
	dlabel D_06047350
	.byte 0xFC, 0xD3, 0xFF, 0xFF, 0xF7, 0xBD, 0xEF, 0x7B, 0xE7, 0x39, 0xDE, 0xF7, 0xD6, 0xB5, 0xCE, 0x73
	.byte 0xC6, 0x31, 0xBD, 0xEF, 0xB5, 0xAD, 0xAD, 0x6B, 0xA5, 0x29, 0x9C, 0xE7, 0x94, 0xA5, 0x8C, 0x63
	.byte 0xD1, 0xA4, 0x83, 0xBD, 0x83, 0x17, 0xA2, 0x92, 0x82, 0x94, 0x86, 0x93, 0xB9, 0x89, 0x81, 0xEF
	.byte 0x8D, 0x8B, 0xBC, 0x82, 0x81, 0x49, 0x80, 0xA5, 0x90, 0x42, 0x80, 0x84, 0x80, 0x84, 0x80, 0x84
	.byte 0xFD, 0xCF, 0xFF, 0xFF, 0xF7, 0xBD, 0xEF, 0x7B, 0xFE, 0x31, 0xD6, 0xB5, 0x83, 0xBD, 0x82, 0xF7
	.byte 0xBD, 0xEF, 0xFC, 0x63, 0x82, 0x10, 0xA9, 0x4A, 0x9C, 0xE7, 0x81, 0x4A, 0x88, 0x42, 0x84, 0x21
	.byte 0xFB, 0x80, 0x80, 0x00, 0xA5, 0x29, 0xDE, 0xF7, 0xFD, 0xCE, 0x80, 0x3F, 0x82, 0x9B, 0xFE, 0xB8
	.byte 0x81, 0xF1, 0xC6, 0x31, 0x99, 0x09, 0x81, 0x7F, 0x83, 0x00, 0xDC, 0x00, 0x83, 0xDF, 0xFF, 0xFF
	.byte 0xFE, 0xB5, 0xFF, 0xE0, 0xF3, 0x80, 0xEB, 0x40, 0xE3, 0x00, 0xDA, 0xC0, 0xCE, 0x60, 0xC6, 0x20
	.byte 0xBD, 0xE0, 0xB5, 0xA0, 0xAD, 0x60, 0xA1, 0x00, 0x98, 0xC0, 0x90, 0x80, 0x88, 0x40, 0x80, 0x00
	dlabel D_060473F0
	.byte 0x04, 0x21, 0x03, 0x3F, 0x03, 0x1D, 0x03, 0x1C, 0x02, 0xD9, 0x02, 0x97, 0x02, 0x55, 0x02, 0x12
	.byte 0x01, 0xD0, 0x01, 0x8E, 0x01, 0x4B, 0x01, 0x09, 0x00, 0xC7, 0x00, 0x84, 0x00, 0x42, 0x00, 0x00
	endlabel func_060470E0

	glabel func_06047410
	sts.l	pr,@-r15
	mov.l	.L0604743C,r0
	mov.l	@r0,r0
	mov.l	.L06047440,r7
	add	r0,r7
	mov	#32,r0
	mulu.w	r0,r4
	sts	macl,r0
	add	r0,r7
	mov	#8,r0
	mulu.w	r0,r5
	sts	macl,r0
	add	r0,r7
	mov.l	@(4,r7),r0
	cmp/gt	r0,r6
	bt/s	.L06047434
	mov	#1,r0
	mov	#0,r0
.L06047434:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604743C:
	.long D_060CB014
.L06047440:
	.long 0x00000000
	endlabel func_06047410

	glabel func_06047444
	sts.l	pr,@-r15
	mov.l	.L06047470,r0
	mov.l	@r0,r0
	mov.l	.L06047474,r4
	add	r0,r4
	mov.b	@(22,gbr),r0
	shlr	r0
	mov.w	.L0604746C,r2
	mulu.w	r0,r2
	sts	macl,r0
	add	r0,r4
	mov.l	@(656,gbr),r0
	mov.l	@(4,r4),r2
	cmp/hi	r2,r0
	bt/s	.L06047466
	mov	#1,r0
	mov	#0,r0
.L06047466:
	lds.l	@r15+,pr
	rts
	nop
.L0604746C:
	.short 0x0078
	.byte 0x00, 0x00
.L06047470:
	.long D_060CB014
.L06047474:
	.long 0x00000100
	endlabel func_06047444

	glabel func_06047478
	mov.l	.L06047494,r2
	mov.l	@(656,gbr),r0
	mov.l	r0,@(0,r2)
	mov.l	@(664,gbr),r0
	mov.l	r0,@(4,r2)
	mov.l	@(668,gbr),r0
	mov.l	r0,@(8,r2)
	mov.l	@(672,gbr),r0
	mov.l	r0,@(12,r2)
	mov.l	@(676,gbr),r0
	mov.l	r0,@(16,r2)
	rts
	nop
	.byte 0x00, 0x00
.L06047494:
	.long D_06047498
	dlabel D_06047498
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_0604749C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	endlabel func_06047478

	glabel func_060474AC
	sts.l	pr,@-r15
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#240,r0
	ldc	r0,sr
	mov	#19,r0
	mov.b	r0,@(238,gbr)
	mov.l	.L0604751C,r3
	mov.l	.L06047520,r0
	mov.l	r0,@r3
	mov.l	.L0604751C,r3
	add	#4,r3
	mov.l	.L06047520,r0
	mov.l	r0,@r3
	mov.l	.L0604751C,r3
	add	#8,r3
	mov.l	.L06047524,r0
	mov.l	r0,@r3
	mov.l	.L0604751C,r3
	add	#12,r3
	mov.l	.L06047524,r0
	mov.l	r0,@r3
	mov.w	.L06047518,r0
	mov.w	r0,@(256,gbr)
	mov.l	.L06047528,r3
	mov	#0,r0
	xor	#1,r0
	add	r0,r3
	mov	#1,r0
	mov.b	r0,@r3
	mov.l	.L06047528,r3
	mov	#1,r0
	xor	#1,r0
	add	r0,r3
	mov	#2,r0
	mov.b	r0,@r3
	mov.w	.L0604751A,r0
	mov.w	r0,@(264,gbr)
	mov.w	@(284,gbr),r0
	mov	#32,r0
	mov.w	r0,@(284,gbr)
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#0,r0
	ldc	r0,sr
	lds.l	@r15+,pr
	rts
	nop
.L06047518:
	.short 0x0103
.L0604751A:
	.short 0x3232
.L0604751C:
	.long D_060FFCF0
.L06047520:
	.long 0x4444FFFF
.L06047524:
	.long 0x5555FFFF
.L06047528:
	.long D_060FFDD8
	.byte 0xE0, 0xFF, 0xC9, 0x0F, 0x6E, 0x03, 0x00, 0x02, 0x20, 0xE9, 0xCB, 0xF0, 0x40, 0x0E, 0x90, 0x09
	.byte 0xC1, 0x80, 0xE0, 0xFF, 0xC9, 0x0F, 0x6E, 0x03, 0x00, 0x02, 0x20, 0xE9, 0xCB, 0x00, 0x40, 0x0E
	.byte 0x00, 0x0B, 0x00, 0x09, 0x01, 0x00, 0xE0, 0xFF, 0xC9, 0x0F, 0x6E, 0x03, 0x00, 0x02, 0x20, 0xE9
	.byte 0xCB, 0xF0, 0x40, 0x0E, 0x90, 0x09, 0xC1, 0x80, 0xE0, 0xFF, 0xC9, 0x0F, 0x6E, 0x03, 0x00, 0x02
	.byte 0x20, 0xE9, 0xCB, 0x00, 0x40, 0x0E, 0x00, 0x0B, 0x00, 0x09, 0x01, 0x03
	endlabel func_060474AC

	glabel func_06047578
	sts.l	pr,@-r15
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#240,r0
	ldc	r0,sr
	mov	#19,r0
	mov.b	r0,@(238,gbr)
	mov.l	.L060477A8,r3
	mov.l	.L060477AC,r0
	mov.l	r0,@r3
	mov.l	.L060477A8,r3
	add	#4,r3
	mov.l	.L060477AC,r0
	mov.l	r0,@r3
	mov.l	.L060477A8,r3
	add	#8,r3
	mov.l	.L060477B0,r0
	mov.l	r0,@r3
	mov.l	.L060477A8,r3
	add	#12,r3
	mov.l	.L060477B4,r0
	mov.l	r0,@r3
	mov.w	.L060477A2,r0
	mov.w	r0,@(256,gbr)
	mov.l	.L060477B8,r3
	mov	#0,r0
	mov.b	r0,@r3
	add	#1,r3
	mov	#17,r0
	mov.b	r0,@r3
	add	#1,r3
	mov	#1,r0
	mov.b	r0,@r3
	mov.l	.L060477BC,r3
	mov	#16,r0
	mov.b	r0,@r3
	mov.l	.L060477C0,r3
	add	#0,r3
	mov.l	.L060477C4,r0
	shll	r0
	shlr16	r0
	and	#28,r0
	mov	#7,r4
	shll2	r4
	shll2	r4
	shll	r4
	or	r4,r0
	mov.w	.L060477A4,r4
	or	r4,r0
	mov.w	r0,@r3
	mov.l	.L060477C0,r3
	add	#2,r3
	mov.l	.L060477C8,r0
	shll	r0
	shlr16	r0
	and	#31,r0
	mov	#1,r4
	shll2	r4
	shll2	r4
	shll	r4
	or	r4,r0
	mov.w	.L060477A4,r4
	or	r4,r0
	mov.w	r0,@r3
	mov.l	.L060477C0,r3
	add	#4,r3
	mov.l	.L060477CC,r0
	shll	r0
	shlr16	r0
	and	#31,r0
	mov	#3,r4
	shll2	r4
	shll2	r4
	shll	r4
	or	r4,r0
	mov.w	.L060477A4,r4
	or	r4,r0
	mov.w	r0,@r3
	mov.l	.L060477C0,r3
	add	#6,r3
	mov.l	.L060477CC,r0
	shll	r0
	shlr16	r0
	and	#28,r0
	mov	#2,r4
	shll2	r4
	shll2	r4
	shll	r4
	or	r4,r0
	mov.w	.L060477A4,r4
	or	r4,r0
	mov.w	r0,@r3
	mov.l	.L060477D0,r3
	mov	#0,r0
	mov.b	r0,@r3
	mov	#0,r14
	mov.l	.L060477D4,r3
	add	#12,r3
	add	#1,r3
	mov.l	.L060477D8,r0
	mov	#63,r5
	and	r0,r5
	mov.b	r5,@r3
	shll2	r0
	shlr8	r0
	and	#7,r0
	mov.l	.L060477D4,r3
	add	#12,r3
	mov.l	.L060477D8,r0
	mov	#63,r5
	and	r0,r5
	mov.b	r5,@r3
	shll2	r0
	shlr8	r0
	and	#7,r0
	mov.l	.L060477D4,r3
	add	#12,r3
	add	#3,r3
	mov.l	.L060477D8,r0
	mov	#63,r5
	and	r0,r5
	mov.b	r5,@r3
	shll2	r0
	shlr8	r0
	and	#7,r0
	mov.l	.L060477D4,r3
	add	#12,r3
	add	#2,r3
	mov.l	.L060477D8,r0
	mov	#63,r5
	and	r0,r5
	mov.b	r5,@r3
	shll2	r0
	shlr8	r0
	and	#7,r0
	or	r0,r14
	mov.l	.L060477D4,r3
	add	#8,r3
	add	#1,r3
	mov.l	.L060477DC,r0
	shlr2	r0
	mov	#63,r5
	and	r0,r5
	mov.b	r5,@r3
	shll2	r0
	shlr8	r0
	and	#7,r0
	mov.l	.L060477D4,r3
	add	#8,r3
	mov.l	.L060477DC,r0
	shlr2	r0
	mov	#63,r5
	and	r0,r5
	mov.b	r5,@r3
	shll2	r0
	shlr8	r0
	and	#7,r0
	mov.l	.L060477D4,r3
	add	#8,r3
	add	#3,r3
	mov.l	.L060477DC,r0
	shlr2	r0
	mov	#63,r5
	and	r0,r5
	mov.b	r5,@r3
	shll2	r0
	shlr8	r0
	and	#7,r0
	mov.l	.L060477D4,r3
	add	#8,r3
	add	#2,r3
	mov.l	.L060477DC,r0
	shlr2	r0
	mov	#63,r5
	and	r0,r5
	mov.b	r5,@r3
	shll2	r0
	shlr8	r0
	and	#7,r0
	shll2	r14
	shll2	r14
	or	r0,r14
	mov.l	.L060477D4,r3
	add	#4,r3
	add	#1,r3
	mov.l	.L060477E0,r0
	shlr2	r0
	mov	#63,r5
	and	r0,r5
	mov.b	r5,@r3
	shll2	r0
	shlr8	r0
	and	#7,r0
	mov.l	.L060477D4,r3
	add	#4,r3
	mov.l	.L060477E0,r0
	shlr2	r0
	mov	#63,r5
	and	r0,r5
	mov.b	r5,@r3
	shll2	r0
	shlr8	r0
	and	#7,r0
	mov.l	.L060477D4,r3
	add	#4,r3
	add	#3,r3
	mov.l	.L060477E0,r0
	shlr2	r0
	mov	#63,r5
	and	r0,r5
	mov.b	r5,@r3
	shll2	r0
	shlr8	r0
	and	#7,r0
	mov.l	.L060477D4,r3
	add	#4,r3
	add	#2,r3
	mov.l	.L060477E0,r0
	shlr2	r0
	mov	#63,r5
	and	r0,r5
	mov.b	r5,@r3
	shll2	r0
	shlr8	r0
	and	#7,r0
	shll2	r14
	shll2	r14
	or	r0,r14
	mov.l	.L060477D4,r3
	add	#0,r3
	add	#1,r3
	mov.l	.L060477E4,r0
	mov	#63,r5
	and	r0,r5
	mov.b	r5,@r3
	shll2	r0
	shlr8	r0
	and	#7,r0
	mov.l	.L060477D4,r3
	add	#0,r3
	mov.l	.L060477E4,r0
	mov	#63,r5
	and	r0,r5
	mov.b	r5,@r3
	shll2	r0
	shlr8	r0
	and	#7,r0
	mov.l	.L060477D4,r3
	add	#0,r3
	add	#3,r3
	mov.l	.L060477E4,r0
	mov	#63,r5
	and	r0,r5
	mov.b	r5,@r3
	shll2	r0
	shlr8	r0
	and	#7,r0
	mov.l	.L060477D4,r3
	add	#0,r3
	add	#2,r3
	mov.l	.L060477E4,r0
	mov	#63,r5
	and	r0,r5
	mov.b	r5,@r3
	shll2	r0
	shlr8	r0
	and	#7,r0
	shll2	r14
	shll2	r14
	or	r0,r14
	mov	r14,r0
	mov.w	r0,@(284,gbr)
	bra	.L060477E8
	nop
.L060477A2:
	.short 0x0107
.L060477A4:
	.short 0x8000
	.byte 0x00, 0x00
.L060477A8:
	.long D_060FFCF0
.L060477AC:
	.long 0xFFFFFFFF
.L060477B0:
	.long 0x0123F567
.L060477B4:
	.long 0x44FFFFFF
.L060477B8:
	.long D_060FFD08
.L060477BC:
	.long D_060FFD0B
.L060477C0:
	.long D_060FFD10
.L060477C4:
	.long VDP2_VRAM + 0x60000
.L060477C8:
	.long VDP2_VRAM + 0x40000
.L060477CC:
	.long VDP2_VRAM + 0x50000
.L060477D0:
	.long D_060FFD1B
.L060477D4:
	.long D_060FFD20
.L060477D8:
	.long 0x0004BCBB
.L060477DC:
	.long 0x0004BCB8
.L060477E0:
	.long 0x0004BCB4
.L060477E4:
	.long 0x0004BCB0
.L060477E8:
	mov.l	.L060478E0,r3
	mov.l	.L060478E4,r0
	mov.l	r0,@r3
	mov.l	.L060478E0,r3
	add	#4,r3
	mov.l	.L060478E4,r0
	mov.l	r0,@r3
	mov.l	.L060478E0,r3
	add	#16,r3
	mov.l	.L060478E4,r0
	mov.l	r0,@r3
	mov.l	.L060478E0,r3
	add	#16,r3
	add	#4,r3
	mov.l	.L060478E4,r0
	mov.l	r0,@r3
	mov.l	.L060478E0,r3
	add	#32,r3
	add	#36,r3
	mov.l	.L060478E4,r0
	mov.l	r0,@r3
	mov.l	.L060478E0,r3
	add	#32,r3
	add	#2,r3
	add	#36,r3
	add	#2,r3
	mov.l	.L060478E4,r0
	mov.l	r0,@r3
	mov.l	.L060478E0,r3
	mov.l	.L060478E4,r0
	mov.l	r0,@r3
	mov.l	.L060478E0,r3
	mov.l	.L060478E4,r0
	mov.l	r0,@r3
	mov.l	.L060478E8,r3
	mov.l	.L060478EC,r0
	mov.l	r0,@r3
	mov.l	.L060478E8,r3
	add	#4,r3
	mov.l	.L060478EC,r0
	mov.l	r0,@r3
	mov.l	.L060478E8,r3
	add	#16,r3
	mov.l	.L060478EC,r0
	mov.l	r0,@r3
	mov.l	.L060478E8,r3
	add	#16,r3
	add	#4,r3
	mov.l	.L060478EC,r0
	mov.l	r0,@r3
	mov.l	.L060478F0,r3
	mov	#0,r0
	mov.b	r0,@r3
	mov.l	.L060478F4,r3
	mov	#0,r0
	mov.b	r0,@r3
	mov.l	.L060478F8,r3
	add	#1,r3
	mov	#0,r0
	mov.b	r0,@r3
	mov.l	.L060478FC,r3
	mov.w	.L060478DC,r0
	mov.w	r0,@r3
	mov.l	.L060478FC,r3
	mov.w	@r3,r0
	or	#72,r0
	mov.w	r0,@r3
	mov.l	.L06047900,r3
	mov	#0,r0
	xor	#1,r0
	add	r0,r3
	mov	#1,r0
	mov.b	r0,@r3
	mov.l	.L06047900,r3
	mov	#1,r0
	xor	#1,r0
	add	r0,r3
	mov	#3,r0
	mov.b	r0,@r3
	mov.l	.L06047900,r3
	mov	#2,r0
	xor	#1,r0
	add	r0,r3
	mov	#4,r0
	mov.b	r0,@r3
	mov.l	.L06047900,r3
	mov	#3,r0
	xor	#1,r0
	add	r0,r3
	mov	#5,r0
	mov.b	r0,@r3
	mov.l	.L06047904,r3
	mov	#1,r0
	xor	#1,r0
	add	r0,r3
	mov	#4,r0
	mov.b	r0,@r3
	mov.l	.L06047904,r3
	mov	#2,r0
	xor	#1,r0
	add	r0,r3
	mov	#2,r0
	mov.b	r0,@r3
	mov.l	.L06047904,r3
	mov	#3,r0
	xor	#1,r0
	add	r0,r3
	mov	#3,r0
	mov.b	r0,@r3
	mov.l	.L06047908,r3
	mov.w	.L060478DE,r0
	mov.w	r0,@r3
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#0,r0
	ldc	r0,sr
	lds.l	@r15+,pr
	rts
	nop
.L060478DC:
	.short 0x0100
.L060478DE:
	.short 0x1223
.L060478E0:
	.long D_060FFD50
.L060478E4:
	.long 0x00000000
.L060478E8:
	.long D_060FFD58
.L060478EC:
	.long 0x00010000
.L060478F0:
	.long D_060FFD79
.L060478F4:
	.long D_060FFD78
.L060478F8:
	.long D_060FFD7A
.L060478FC:
	.long D_060FFDCC
.L06047900:
	.long D_060FFDD8
.L06047904:
	.long D_060FFDD0
.L06047908:
	.long D_060FFDC0
	.byte 0x90, 0x01, 0xA0, 0x0E, 0x00, 0x09, 0xD0, 0x80, 0x62, 0x43, 0x63, 0x53, 0x64, 0x63, 0x65, 0x73
	endlabel func_06047578

	glabel func_0604791C
	mov.w	.L06047922,r0
	bra	.L0604792E
	nop
.L06047922:
	.short 0xC080
	.byte 0x62, 0x43, 0x63, 0x53, 0x64, 0x63, 0x65, 0x73
	endlabel func_0604791C

	glabel func_0604792C
	mov.w	.L06047954,r0
.L0604792E:
	mov.l	r8,@-r15
	mov.l	r7,@-r15
	mov.l	.L06047958,r6
	shll8	r5
	shlr	r5
	add	r5,r6
	add	r4,r6
	add	r4,r6
	mov	r6,r7
	mov	r0,r5
	mova	.L060479C4,r0
.L06047944:
	mov	#92,r8
	mov.b	@r2+,r4
	cmp/eq	r8,r4
	bf	.L0604795C
	mov.w	.L06047956,r8
	add	r8,r7
	bra	.L06047944
	mov	r7,r6
.L06047954:
	.short 0x8080
.L06047956:
	.short 0x0100
.L06047958:
	.long VDP2_VRAM + 0x5C000
.L0604795C:
	cmp/pl	r4
	bf	.L06047978
	add	#-32,r4
	mov.b	@(r0,r4),r4
	shll	r4
	add	r5,r4
	mov.w	r4,@r6
	add	#64,r6
	add	#64,r6
	add	#1,r4
	mov.w	r4,@r6
	dt	r3
	bf/s	.L06047944
	add	#-126,r6
.L06047978:
	mov.l	@r15+,r7
	mov.l	@r15+,r8
	rts
	nop
	endlabel func_0604792C

	glabel func_06047980
	sts	pr,r2
	mov	r0,r7
	shll8	r3
	shll2	r3
	shll2	r3
	mov.w	.L060479B8,r0
	add	r0,r3
	mov.l	.L060479BC,r6
	shll8	r5
	shlr	r5
	add	r5,r6
	add	r4,r6
	add	r4,r6
	mova	.L060479C4,r0
.L0604799C:
	mov.b	@r2+,r4
	cmp/pl	r4
	bf	.L060479C0
	add	#-32,r4
	mov.b	@(r0,r4),r4
	shll	r4
	add	r3,r4
	mov.w	r4,@r6
	add	#64,r6
	add	#64,r6
	add	#1,r4
	mov.w	r4,@r6
	bra	.L0604799C
	add	#-126,r6
.L060479B8:
	.short 0x0080
	.byte 0x00, 0x00
.L060479BC:
	.long VDP2_VRAM + 0x5C000
.L060479C0:
	jmp	@r7
	nop
.L060479C4:
	.byte 0x00
	.asciz "-&&'2%'"
	.byte 0x00
	.asciz ".+),("
	.byte 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
	.asciz "\t\n**0/13"
	.byte 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A
	.byte 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20, 0x21, 0x22, 0x23, 0x24, 0x00, 0x00, 0x00, 0x00, 0x00
	endlabel func_06047980

	glabel func_06047A04
	mov.w	.L06047A0A,r0
	bra	.L06047A16
	nop
.L06047A0A:
	.short 0xC082
	.byte 0x62, 0x43, 0x63, 0x53, 0x64, 0x63, 0x65, 0x73
	endlabel func_06047A04

	glabel func_06047A14
	mov.w	.L06047A4A,r0
.L06047A16:
	mov.l	.L06047A4C,r6
	shll8	r5
	shlr	r5
	add	r5,r6
	add	r3,r4
	add	#-1,r4
	add	r4,r6
	add	r4,r6
	mov	r0,r4
.L06047A28:
	mov	r2,r0
	and	#15,r0
	shll	r0
	add	r4,r0
	mov.w	r0,@r6
	add	#126,r6
	add	#1,r0
	mov.w	r0,@(2,r6)
	add	#-128,r6
	shlr2	r2
	shlr2	r2
	tst	r2,r2
	bt	.L06047A46
	dt	r3
	bf	.L06047A28
.L06047A46:
	rts
	nop
.L06047A4A:
	.short 0x8082
.L06047A4C:
	.long VDP2_VRAM + 0x5C000
	.byte 0xD3, 0x07, 0xE0, 0x00, 0xD2, 0x07, 0x23, 0x02, 0x42, 0x10, 0x8F, 0xFC, 0x73, 0x04, 0xD3, 0x06
	.byte 0xE0, 0x00, 0xD2, 0x04, 0x23, 0x02, 0x42, 0x10, 0x8F, 0xFC, 0x73, 0x04, 0x00, 0x0B, 0x00, 0x09
	.long VDP2_VRAM + 0x5A000
	.byte 0x00, 0x00, 0x03, 0x80
	.long VDP2_VRAM + 0x5C000
	endlabel func_06047A14

	glabel func_06047A7C
	mov.l	.L06047A90,r3
	mov	#0,r0
	mov.l	.L06047A94,r2
.L06047A82:
	mov.l	r0,@r3
	dt	r2
	bf/s	.L06047A82
	add	#4,r3
	rts
	nop
	.byte 0x00, 0x00
.L06047A90:
	.long VDP2_VRAM + 0x5C000
.L06047A94:
	.long 0x00000380
	endlabel func_06047A7C

	glabel func_06047A98
	mov.l	.L06047AAC,r3
	mov	#0,r0
	mov.l	.L06047AB0,r2
.L06047A9E:
	mov.l	r0,@r3
	dt	r2
	bf/s	.L06047A9E
	add	#4,r3
	rts
	nop
	.byte 0x00, 0x00
.L06047AAC:
	.long VDP2_VRAM + 0x5A680
.L06047AB0:
	.long 0x00000180
	endlabel func_06047A98

	glabel func_06047AB4
	mova	.L06047AEC,r0
	shll2	r3
	shll	r3
	mov.l	@(r0,r3),r7
	shll8	r5
	shlr	r5
	add	r5,r7
	add	r4,r7
	add	r4,r7
	add	#4,r0
	mov.l	@(r0,r3),r5
	mov.w	@r6+,r2
	mov.w	@r6+,r3
.L06047ACE:
	mov	r2,r4
.L06047AD0:
	mov.w	@r6+,r0
	dt	r4
	add	r5,r0
	mov.w	r0,@r7
	bf/s	.L06047AD0
	add	#2,r7
	sub	r2,r7
	sub	r2,r7
	add	#64,r7
	dt	r3
	bf/s	.L06047ACE
	add	#64,r7
	rts
	nop
.L06047AEC:
	.long VDP2_VRAM + 0x58000
	dlabel D_06047AF0
	.byte 0x00, 0x00, 0x00, 0x00
	.long VDP2_VRAM + 0x5A000
	dlabel D_06047AF8
	.byte 0x00, 0x00, 0x00, 0xD4
	.long VDP2_VRAM + 0x5C000
	dlabel D_06047B00
	.byte 0x00, 0x00, 0x00, 0xE8
	.long VDP2_VRAM + 0x5D800
	.byte 0x00, 0x00, 0x00, 0x00, 0x42, 0x08, 0xC7, 0x04, 0x00, 0x2E, 0xD2, 0x02, 0x22, 0x02, 0x00, 0x0B
	.byte 0x00, 0x09, 0x00, 0x00
	.long D_06047B40
	.byte 0x01, 0x80, 0x00, 0x00, 0x01, 0x82, 0x00, 0x00, 0x01, 0x84, 0x00, 0x00, 0x01, 0x86, 0x00, 0x00
	.byte 0x01, 0x88, 0x00, 0x00, 0x01, 0x8A, 0x00, 0x00, 0x01, 0x8C, 0x00, 0x00, 0x01, 0x8E, 0x00, 0x00
	dlabel D_06047B40
	.byte 0x01, 0x80, 0x00, 0x00
	endlabel func_06047AB4

	glabel func_06047B44
	sts.l	pr,@-r15
.L06047B46:
	mov.w	@r5,r0
	cmp/pz	r0
	bf	.L06047B54
	bsr	func_06047BCC
	nop
	bra	.L06047B46
	add	#8,r5
.L06047B54:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06047B44

	glabel func_06047B5A
	sts.l	pr,@-r15
	mov.l	r3,@-r15
	mov.l	r4,@-r15
.L06047B60:
	mov.w	@r5,r0
	cmp/pz	r0
	bf	.L06047B8E
	mov.l	@(0,r15),r4
	mov.l	@(4,r15),r3
	mov.w	@(4,r5),r0
	add	r3,r0
	mov.w	r0,@(4,r5)
	mov.w	@(6,r5),r0
	add	r4,r0
	mov.w	r0,@(6,r5)
	bsr	func_06047BCC
	nop
	mov.l	@(0,r15),r4
	mov.l	@(4,r15),r3
	mov.w	@(4,r5),r0
	sub	r3,r0
	mov.w	r0,@(4,r5)
	mov.w	@(6,r5),r0
	sub	r4,r0
	mov.w	r0,@(6,r5)
	bra	.L06047B60
	add	#8,r5
.L06047B8E:
	mov.l	@r15+,r4
	mov.l	@r15+,r3
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06047B5A

	glabel func_06047B98
	sts.l	pr,@-r15
	mov.l	r3,@-r15
	mov.l	r4,@-r15
	mov.l	@(0,r15),r4
	mov.l	@(4,r15),r3
	mov.w	@(4,r5),r0
	add	r3,r0
	mov.w	r0,@(4,r5)
	mov.w	@(6,r5),r0
	add	r4,r0
	mov.w	r0,@(6,r5)
	bsr	func_06047BCC
	nop
	mov.l	@(0,r15),r4
	mov.l	@(4,r15),r3
	mov.w	@(4,r5),r0
	sub	r3,r0
	mov.w	r0,@(4,r5)
	mov.w	@(6,r5),r0
	sub	r4,r0
	mov.w	r0,@(6,r5)
	mov.l	@r15+,r4
	mov.l	@r15+,r3
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06047B98

	glabel func_06047BCC
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r12,@-r15
	mov.l	@(92,gbr),r0
	mov	r0,r3
	mov	r13,r14
	mov.w	@(0,r5),r0
	shll2	r0
	shll2	r0
	add	r0,r14
	mov.b	@(2,r5),r0
	swap.b	r0,r6
	mov.b	@(3,r5),r0
	mov.w	.L06047C24,r2
	or	r2,r0
	mov.w	r0,@r3
	mov.w	@(2,r14),r0
	mov.w	.L06047C26,r4
	or	r4,r0
	mov.w	r0,@(4,r3)
	mov.w	@(0,r14),r0
	add	r6,r0
	mov.w	r0,@(6,r3)
	mov.l	.L06047C28,r4
	mov.l	@r4,r4
	mov.w	@(4,r14),r0
	add	r4,r0
	mov.w	r0,@(8,r3)
	mov.w	@(6,r14),r0
	mov.w	r0,@(10,r3)
	mov.l	@(4,r5),r0
	mov.l	r0,@(12,r3)
	mov.l	.L06047C2C,r0
	mov.l	.L06047C30,r6
	jsr	@r0
	mov.l	@r6,r6
	mov	#32,r0
	add	r3,r0
	mov.l	r0,@(92,gbr)
	mov.l	@r15+,r12
	mov.l	@r15+,r14
	lds.l	@r15+,pr
	rts
	nop
.L06047C24:
	.short 0x1000
.L06047C26:
	.short 0x0C80
.L06047C28:
	.long D_06047DDC
.L06047C2C:
	.long func_0601F1EC
.L06047C30:
	.long D_06047B40
	endlabel func_06047BCC

	glabel func_06047C34
	sts.l	pr,@-r15
	mov.l	r12,@-r15
	mov.l	@(92,gbr),r0
	mov	r0,r3
	mov.w	.L06047C66,r0
	mov.w	r0,@(0,r3)
	mov	r4,r0
	mov.w	r0,@(12,r3)
	mov	r5,r0
	mov.w	r0,@(14,r3)
	mov	r6,r0
	mov.w	r0,@(20,r3)
	mov	r7,r0
	mov.w	r0,@(22,r3)
	mov.l	.L06047C68,r0
	mov.l	.L06047C6C,r6
	jsr	@r0
	mov.l	@r6,r6
	mov	#32,r0
	add	r3,r0
	mov.l	r0,@(92,gbr)
	mov.l	@r15+,r12
	lds.l	@r15+,pr
	rts
	nop
.L06047C66:
	.short 0x1008
.L06047C68:
	.long func_0601F1EC
.L06047C6C:
	.long D_06047B40
	endlabel func_06047C34

	glabel func_06047C70
	sts.l	pr,@-r15
	mov.l	r3,@-r15
	mov.l	r4,@-r15
	mov.l	@(0,r15),r4
	mov.l	@(4,r15),r3
	mov.w	@(4,r5),r0
	add	r3,r0
	mov.w	r0,@(4,r5)
	mov.w	@(6,r5),r0
	add	r4,r0
	mov.w	r0,@(6,r5)
	bsr	func_06047CA4
	nop
	mov.l	@(0,r15),r4
	mov.l	@(4,r15),r3
	mov.w	@(4,r5),r0
	sub	r3,r0
	mov.w	r0,@(4,r5)
	mov.w	@(6,r5),r0
	sub	r4,r0
	mov.w	r0,@(6,r5)
	mov.l	@r15+,r4
	mov.l	@r15+,r3
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06047C70

	glabel func_06047CA4
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r12,@-r15
	mov.l	@(92,gbr),r0
	mov	r0,r3
	mov	r13,r14
	mov.w	@(0,r5),r0
	shll2	r0
	shll2	r0
	add	r0,r14
	mov.b	@(2,r5),r0
	swap.b	r0,r6
	mov.b	@(3,r5),r0
	mov.w	.L06047CFE,r2
	or	r2,r0
	mov.w	r0,@r3
	mov.w	@(2,r14),r0
	mov.w	.L06047D00,r4
	or	r4,r0
	mov.w	r0,@(4,r3)
	mov.w	@(0,r14),r0
	add	#16,r0
	add	r6,r0
	mov.w	r0,@(6,r3)
	mov.l	.L06047D04,r4
	mov.l	@r4,r4
	mov.w	@(4,r14),r0
	add	r4,r0
	mov.w	r0,@(8,r3)
	mov.w	@(6,r14),r0
	mov.w	r0,@(10,r3)
	mov.l	@(4,r5),r0
	mov.l	r0,@(12,r3)
	mov.l	.L06047D08,r0
	mov.l	.L06047D0C,r6
	jsr	@r0
	mov.l	@r6,r6
	mov	#32,r0
	add	r3,r0
	mov.l	r0,@(92,gbr)
	mov.l	@r15+,r12
	mov.l	@r15+,r14
	lds.l	@r15+,pr
	rts
	nop
.L06047CFE:
	.short 0x1000
.L06047D00:
	.short 0x0880
	.byte 0x00, 0x00
.L06047D04:
	.long D_06047DDC
.L06047D08:
	.long func_0601F1EC
.L06047D0C:
	.long D_06047B40
	endlabel func_06047CA4

	glabel func_06047D10
	sts.l	pr,@-r15
	mov.l	r3,@-r15
	mov.l	r4,@-r15
.L06047D16:
	mov.w	@r5,r0
	cmp/pz	r0
	bf	.L06047D44
	mov.l	@(0,r15),r4
	mov.l	@(4,r15),r3
	mov.w	@(4,r5),r0
	add	r3,r0
	mov.w	r0,@(4,r5)
	mov.w	@(6,r5),r0
	add	r4,r0
	mov.w	r0,@(6,r5)
	bsr	func_06047D4E
	nop
	mov.l	@(0,r15),r4
	mov.l	@(4,r15),r3
	mov.w	@(4,r5),r0
	sub	r3,r0
	mov.w	r0,@(4,r5)
	mov.w	@(6,r5),r0
	sub	r4,r0
	mov.w	r0,@(6,r5)
	bra	.L06047D16
	add	#8,r5
.L06047D44:
	mov.l	@r15+,r4
	mov.l	@r15+,r3
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06047D10

	glabel func_06047D4E
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r12,@-r15
	mov.l	@(92,gbr),r0
	mov	r0,r3
	mov.w	@(0,r5),r0
	mov.l	.L06047D98,r4
	add	r4,r0
	mov.w	r0,@(8,r3)
	mov.w	@(2,r5),r0
	mov.w	r0,@(10,r3)
	mov.w	@(4,r5),r0
	mov.w	r0,@(12,r3)
	mov.w	@(6,r5),r0
	mov.w	r0,@(14,r3)
	mov.w	.L06047D90,r0
	mov.w	r0,@(0,r3)
	mov.w	.L06047D92,r0
	mov.w	r0,@(4,r3)
	mov.w	.L06047D94,r0
	mov.w	r0,@(6,r3)
	mov.l	.L06047D9C,r0
	mov.l	.L06047DA0,r6
	jsr	@r0
	mov.l	@r6,r6
	mov	#32,r0
	add	r3,r0
	mov.l	r0,@(92,gbr)
	mov.l	@r15+,r12
	mov.l	@r15+,r14
	lds.l	@r15+,pr
	rts
	nop
.L06047D90:
	.short 0x1000
.L06047D92:
	.short 0x0C80
.L06047D94:
	.short 0x0200
	.byte 0x00, 0x00
.L06047D98:
	.long 0x04B83200
.L06047D9C:
	.long func_0601F1EC
.L06047DA0:
	.long D_06047B40
	.byte 0xC6, 0x17, 0x70, 0xE0, 0x62, 0x02, 0xE3, 0x10, 0x22, 0x3A, 0x00, 0x0B, 0x20, 0x22
	endlabel func_06047D4E

	glabel func_06047DB2
	sts.l	pr,@-r15
	mov.l	.L06047DD0,r2
	shlr2	r7
	shlr	r7
	mov.l	r7,@r2
.L06047DBC:
	mov.w	@(0,r6),r0
	cmp/pz	r0
	bf	.L06047DD4
	bsr	func_06047DE0
	nop
	bsr	func_06047E32
	nop
	bra	.L06047DBC
	add	#16,r6
	.byte 0x00, 0x00
.L06047DD0:
	.long D_06047DDC
.L06047DD4:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x09
	dlabel D_06047DDC
	.long VDP1_VRAM + 0x65000
	endlabel func_06047DB2

	glabel func_06047DE0
	mov.l	.L06047E10,r2
	mov.l	@r2,r2
	shll2	r2
	shll	r2
	mov.l	@(8,r6),r4
	mov.w	@(2,r6),r0
	cmp/eq	#0,r0
	bt	.L06047E14
	mov.b	@(7,r6),r0
	extu.b	r0,r3
	mov.b	@(6,r6),r0
	shll	r0
	mulu.w	r0,r3
	sts	macl,r3
	mov.w	@(4,r6),r0
	shll2	r0
	shll	r0
.L06047E02:
	mov.l	@r4+,r5
	dt	r3
	mov.l	r5,@(r0,r2)
	bf/s	.L06047E02
	add	#4,r0
	rts
	nop
.L06047E10:
	.long D_06047DDC
.L06047E14:
	mov.b	@(7,r6),r0
	extu.b	r0,r3
	mov.b	@(6,r6),r0
	mulu.w	r0,r3
	sts	macl,r3
	mov.w	@(4,r6),r0
	shll2	r0
	shll	r0
.L06047E24:
	mov.l	@r4+,r5
	dt	r3
	mov.l	r5,@(r0,r2)
	bf/s	.L06047E24
	add	#4,r0
	rts
	nop
	endlabel func_06047DE0

	glabel func_06047E32
	mov.l	.L06047E58,r2
	mov.l	@(12,r6),r4
	mov.w	@(0,r6),r0
	shll	r0
	add	r0,r2
	mov.w	@(2,r6),r0
	mov	#16,r3
	cmp/eq	#0,r0
	bt	.L06047E46
	mov.w	.L06047E54,r3
.L06047E46:
	mov.w	@r4+,r0
	dt	r3
	mov.w	r0,@r2
	bf/s	.L06047E46
	add	#2,r2
	rts
	nop
.L06047E54:
	.short 0x0100
	.byte 0x00, 0x00
.L06047E58:
	.long D_060CA000
	endlabel func_06047E32

	glabel func_06047E5C
	mov.l	.L06047E7C,r0
	mov.b	@r0,r0
	cmp/eq	#7,r0
	bt	.L06047E68
	cmp/eq	#5,r0
	bf	.L06047F04
.L06047E68:
	mov	#0,r0
	mov.l	.L06047E80,r4
	mov.b	@r4,r2
	extu.b	r2,r2
	mov	#96,r3
	cmp/ge	r3,r2
	bt	.L06047E84
	bra	.L06047E8C
	mov	#4,r0
	.byte 0x00, 0x00
.L06047E7C:
	.long D_060D9052
.L06047E80:
	.long D_060D905C
.L06047E84:
	add	#64,r3
	cmp/ge	r3,r2
	bf	.L06047E8C
	mov	#8,r0
.L06047E8C:
	mov.l	.L06047E9C,r4
	mov.b	@r4,r2
	extu.b	r2,r2
	mov	#96,r3
	cmp/ge	r3,r2
	bt	.L06047EA0
	bra	.L06047EA8
	or	#1,r0
.L06047E9C:
	.long D_060D905D
.L06047EA0:
	add	#64,r3
	cmp/ge	r3,r2
	bf	.L06047EA8
	or	#2,r0
.L06047EA8:
	mov	r0,r2
	mov	#-16,r3
	mov.l	.L06047EF4,r12
	mov.w	@(76,gbr),r0
	mov.w	@r12,r11
	and	r3,r0
	or	r2,r0
	mov.w	r0,@r12
	mov	r11,r14
	mov	r0,r13
	xor	r11,r2
	not	r11,r11
	and	r11,r2
	add	#2,r12
	mov.w	@(78,gbr),r0
	and	r3,r0
	not	r3,r3
	and	r3,r2
	or	r2,r0
	mov.w	r0,@r12
.L06047ED0:
	mov	#15,r4
	and	r4,r13
	and	r4,r14
	mov.l	.L06047EF8,r5
	cmp/eq	r13,r14
	bf	.L06047EFC
	mov.w	@r5,r6
	add	#-1,r6
	cmp/pl	r6
	bt	.L06047EEC
	mov.w	@r12,r0
	or	r13,r0
	mov.w	r0,@r12
	mov	#10,r6
.L06047EEC:
	mov.w	r6,@r5
	rts
	nop
	.byte 0x00, 0x00
.L06047EF4:
	.long D_06047F1C
.L06047EF8:
	.long D_06047F20
.L06047EFC:
	mov	#30,r0
	mov.w	r0,@r5
	rts
	nop
.L06047F04:
	mov.l	.L06047F18,r12
	mov.w	@r12,r14
	mov.w	@(76,gbr),r0
	mov.w	r0,@r12
	mov	r0,r13
	add	#2,r12
	mov.w	@(78,gbr),r0
	bra	.L06047ED0
	mov.w	r0,@r12
	.byte 0x00, 0x00
.L06047F18:
	.long D_06047F1C
	dlabel D_06047F1C
	.byte 0x00, 0x00
	dlabel D_06047F1E
	.byte 0x00, 0x00
	dlabel D_06047F20
	.byte 0x00, 0x00
	endlabel func_06047E5C

	glabel func_06047F22
	sts.l	pr,@-r15
	mov.l	.L06047F54,r12
	mov	#0,r0
	mov.b	r0,@(15,r12)
	mov.l	@(20,r12),r3
	mov.l	.L06047F58,r2
	add	r3,r2
	mov.b	@r2,r0
	mov.b	r0,@(3,r12)
	mov	#1,r0
	mov.b	r0,@(3,r1)
	bsr	func_06047FC4
	nop
	mov.l	.L06047F5C,r2
	mov.l	.L06047F60,r0
	jsr	@r0
	nop
	mov.l	.L06047F64,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r3,@(32,r1)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06047F54:
	.long D_060CB000
.L06047F58:
	.long 0x00000524
.L06047F5C:
	.long D_060FFFB0
.L06047F60:
	.long func_0600D0D0
.L06047F64:
	.long func_0604829C
	endlabel func_06047F22

	glabel func_06047F68
	sts.l	pr,@-r15
	mov.l	.L06047FA8,r12
	mov	#1,r0
	mov.b	r0,@(15,r12)
	mov.l	@(20,r12),r3
	mov.l	.L06047FAC,r2
	add	r3,r2
	mov.b	@r2,r0
	mov.b	r0,@(3,r12)
	mov	#0,r0
	mov.b	r0,@(3,r1)
	bsr	func_06047FC4
	nop
	mov.l	.L06047FB0,r2
	mov.l	.L06047FB4,r3
	mov	#0,r0
.L06047F88:
	mov.w	r0,@r2
	dt	r3
	bf/s	.L06047F88
	add	#2,r2
	mov.l	.L06047FB8,r2
	mov.l	.L06047FBC,r0
	jsr	@r0
	nop
	mov.l	.L06047FC0,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r3,@(32,r1)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06047FA8:
	.long D_060CB000
.L06047FAC:
	.long 0x00000524
.L06047FB0:
	.long VDP2_VRAM + 0x5A300
.L06047FB4:
	.long 0x00000100
.L06047FB8:
	.long D_060FFFB0
.L06047FBC:
	.long func_0600D0D0
.L06047FC0:
	.long D_060485B4
	endlabel func_06047F68

	glabel func_06047FC4
	sts.l	pr,@-r15
	mov.l	.L06048050,r2
	mov.l	@r2,r2
	add	#-4,r2
	mov.l	@r2,r3
	mova	.L06048094,r0
	mov.l	r3,@r0
	mova	func_06048090,r0
	mov.l	r0,@r2
	mov.l	.L06048054,r2
	mov.l	@r2,r2
	add	#-4,r2
	mov.l	@r2,r3
	mova	.L06048098,r0
	mov.l	r3,@r0
	mova	func_06048090,r0
	mov.l	r0,@r2
	mov.l	.L06048058,r0
	mov	#0,r2
	mov.w	r2,@r0
	add	#2,r0
	mov.w	r2,@r0
	add	#2,r0
	mov	#30,r2
	mov.w	r2,@r0
	mov.l	.L0604805C,r2
	mov.l	.L06048060,r0
	jsr	@r0
	nop
	mov.l	.L06048064,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r3,@(40,r1)
	mov.l	.L0604805C,r2
	mov.l	.L06048060,r0
	jsr	@r0
	nop
	mov.l	.L06048068,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r3,@(36,r1)
	mov.l	.L0604806C,r12
	mov.l	.L06048070,r0
	jsr	@r0
	nop
	mov.l	.L06048074,r0
	jsr	@r0
	nop
	bsr	func_06047578
	nop
	mov.l	.L06048078,r0
	jsr	@r0
	nop
	mov.l	.L0604807C,r2
	mov	#0,r0
	mov.b	r0,@r2
	mov.l	.L06048080,r2
	mov.l	.L06048084,r0
	mov.b	@r0,r0
	mov.b	r0,@(14,r12)
	cmp/pl	r0
	bf	.L06048042
	mov.l	.L06048088,r2
.L06048042:
	mov.l	r2,@(20,r12)
	mov.l	.L0604808C,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L06048050:
	.long D_060F3064
.L06048054:
	.long D_060F3068
.L06048058:
	.long D_06047F1C
.L0604805C:
	.long D_060FFFB0
.L06048060:
	.long func_0600D0D0
.L06048064:
	.long func_06047E5C
.L06048068:
	.long D_0604BAAC
.L0604806C:
	.long D_060CB000
.L06048070:
	.long func_0604AA38
.L06048074:
	.long func_0604A834
.L06048078:
	.long func_0604AA66
.L0604807C:
	.long D_0604A24F
.L06048080:
	.long 0x002FF100
.L06048084:
	.long D_060CB050
.L06048088:
	.long 0x002FF880
.L0604808C:
	.long func_0604809C
	endlabel func_06047FC4

	glabel func_06048090
	rts
	nop
.L06048094:
	.byte 0x00, 0x00, 0x00, 0x00
.L06048098:
	.byte 0x00, 0x00, 0x00, 0x00
	endlabel func_06048090

	glabel func_0604809C
	sts.l	pr,@-r15
	mov.l	r1,@-r15
	mov.l	.L060480AC,r12
	mov.b	@(6,r12),r0
	tst	r0,r0
	bf	.L060480B0
	bra	.L0604811A
	nop
.L060480AC:
	.long D_060CB000
.L060480B0:
	mov	#0,r0
	mov.l	.L060480FC,r2
	mov.b	r0,@r2
	mov.b	r0,@(15,r12)
	mov.l	r1,@-r15
	mov.l	@(32,r1),r1
	mov.l	.L06048100,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	mov.l	r1,@-r15
	mov.l	@(36,r1),r1
	mov.l	.L06048100,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	mov.l	r1,@-r15
	mov.l	@(40,r1),r1
	mov.l	.L06048100,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	mov.l	.L06048104,r2
	mov.l	.L06048108,r0
	jsr	@r0
	nop
	mov.l	.L0604810C,r0
	mov.l	r0,@(12,r3)
	mov	#60,r0
	mov.w	r0,@(16,r1)
	mov.b	@(6,r12),r0
	cmp/eq	#2,r0
	bf	.L06048114
	mov.l	.L06048110,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L0604811A
	nop
.L060480FC:
	.long D_060CB062
.L06048100:
	.long func_0600D1A0
.L06048104:
	.long D_060FFFB0
.L06048108:
	.long func_0600D0D0
.L0604810C:
	.long func_06032FD4
.L06048110:
	.long func_060481EC
.L06048114:
	mov.l	.L06048130,r0
	mov.l	r0,@-r1
	add	#4,r1
.L0604811A:
	bsr	func_060484B0
	nop
	bsr	func_06047A98
	nop
	bsr	func_06047A7C
	nop
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06048130:
	.long func_06048134
	endlabel func_0604809C

	glabel func_06048134
	sts.l	pr,@-r15
	mov.l	r1,@-r15
	mov.l	.L0604814C,r12
	mov.w	@(16,r1),r0
	dt	r0
	bt	.L06048150
	mov.w	r0,@(16,r1)
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604814C:
	.long D_060CB000
.L06048150:
	mov.l	.L060481B4,r2
	mov.l	@r2,r2
	mov.l	.L060481B8,r0
	mov.l	@r0,r0
	mov.l	r0,@-r2
	mov.l	@(0,r1),r2
	mov.l	.L060481BC,r2
	mov.l	@r2,r2
	mov.l	.L060481C0,r0
	mov.l	@r0,r0
	mov.l	r0,@-r2
	mov.l	@(0,r1),r2
	bsr	func_06047A98
	nop
	bsr	func_06047A7C
	nop
	mov.l	.L060481C4,r0
	jsr	@r0
	nop
	mov.l	.L060481C8,r0
	jsr	@r0
	nop
	mov.l	.L060481CC,r2
	mov.b	@r2,r0
	tst	r0,r0
	bt	.L060481A4
	mov.l	.L060481D0,r4
	mov.l	.L060481D4,r5
	mov.l	.L060481D8,r6
	mov	#2,r7
	mov.l	.L060481DC,r0
	jsr	@r0
	nop
	mov.l	.L060481E0,r0
	jsr	@r0
	nop
	mov	#17,r4
	mov.l	r1,@-r15
	mov.l	.L060481E4,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
.L060481A4:
	mov.l	@r15+,r1
	mov.l	.L060481E8,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L060481B4:
	.long D_060F3064
.L060481B8:
	.long .L06048094
.L060481BC:
	.long D_060F3068
.L060481C0:
	.long .L06048098
.L060481C4:
	.long func_0604AD84
.L060481C8:
	.long func_0604ADD0
.L060481CC:
	.long D_0604A24F
.L060481D0:
	.long D_060512BF
.L060481D4:
	.long D_00200000
.L060481D8:
	.long D_060D900A
.L060481DC:
	.long func_06006C94
.L060481E0:
	.long func_06006EA0
.L060481E4:
	.long func_06006A7E
.L060481E8:
	.long D_060C20A4
	endlabel func_06048134

	glabel func_060481EC
	sts.l	pr,@-r15
	mov.l	r1,@-r15
	mov.l	.L06048204,r12
	mov.w	@(16,r1),r0
	dt	r0
	bt	.L06048208
	mov.w	r0,@(16,r1)
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06048204:
	.long D_060CB000
.L06048208:
	mov.l	.L06048240,r12
	mov.l	.L06048244,r0
	jsr	@r0
	nop
	mov.l	.L06048248,r0
	jsr	@r0
	nop
	mov	#1,r0
	mov.b	r0,@(6,r12)
	mov.l	.L0604824C,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov	#7,r0
	mov.b	r0,@(21,gbr)
	mov	#-1,r0
	mov.b	r0,@(60,gbr)
	mov.l	.L06048250,r2
	mov	#0,r0
	mov.w	r0,@r2
	mov	#13,r0
	mov.b	r0,@(0,gbr)
	mov.l	.L06048254,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
.L06048240:
	.long D_060CB000
.L06048244:
	.long func_0604AD84
.L06048248:
	.long func_0604ADD0
.L0604824C:
	.long func_06048090
.L06048250:
	.long D_060D9074
.L06048254:
	.long func_0601ECE8
	endlabel func_060481EC

	glabel func_06048258
	sts.l	pr,@-r15
	mov.l	.L06048284,r12
	mov.l	.L06048288,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.l	.L0604828C,r0
	mov.b	@r0,r0
	mov.b	r0,@(14,r12)
	mov.b	@(3,r12),r0
	mov.b	r0,@(10,r12)
	mov.l	.L06048290,r2
	mov.l	.L0604828C,r0
	mov.b	@r0,r0
	cmp/pl	r0
	bf	.L06048278
	mov.l	.L06048294,r2
.L06048278:
	mov.l	.L06048298,r0
	mov.l	r2,@r0
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06048284:
	.long D_060CB000
.L06048288:
	.long func_0604829C
.L0604828C:
	.long D_060CB050
.L06048290:
	.long 0x002FF100
.L06048294:
	.long 0x002FF880
.L06048298:
	.long D_060CB014
	endlabel func_06048258

	glabel func_0604829C
	sts.l	pr,@-r15
	mov.l	.L060482FC,r12
	mov.l	.L06048300,r13
	mov.l	.L06048304,r5
	bsr	func_06047BCC
	nop
	mov	#0,r0
	mov.w	r0,@(16,r12)
	mov.l	.L06048308,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L06048358
	mov.b	@(5,r12),r0
	cmp/eq	#4,r0
	bf	.L06048338
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#3,r6
	mov.l	.L0604830C,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.b	@(4,r12),r0
	not	r0,r0
	mov.b	r0,@(4,r12)
	tst	r0,r0
	bt	.L06048318
	mov.l	.L06048310,r2
	mov.l	.L06048314,r3
	mov.w	.L060482F8,r4
.L060482E8:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L060482E8
	add	#4,r2
	lds.l	@r15+,pr
	rts
	nop
.L060482F8:
	.short 0x0008
	.byte 0x00, 0x00
.L060482FC:
	.long D_060CB000
.L06048300:
	.long D_0604AE50
.L06048304:
	.long D_0604B478
.L06048308:
	.long D_06047F1E
.L0604830C:
	.long func_0600E4C4
.L06048310:
	.long D_060CA220
.L06048314:
	.long D_00281BD4
.L06048318:
	mov.l	.L06048330,r2
	mov.l	.L06048334,r3
	mov.w	.L0604832E,r4
.L0604831E:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604831E
	add	#4,r2
	lds.l	@r15+,pr
	rts
	nop
.L0604832E:
	.short 0x0008
.L06048330:
	.long D_060CA220
.L06048334:
	.long D_00281BF4
.L06048338:
	mov.l	.L06048354,r2
	mov.b	@(4,r12),r0
	tst	r0,r0
	bt	.L06048342
	add	#24,r2
.L06048342:
	mov.b	@(5,r12),r0
	shll2	r0
	mov.l	@(r0,r2),r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06048354:
	.long D_06048480
.L06048358:
	mov.l	.L0604839C,r0
	mov.w	@r0,r0
	mov.w	.L06048398,r3
	tst	r3,r0
	bf	.L060483DC
	tst	#8,r0
	bt	.L060483A4
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#5,r6
	mov.l	.L060483A0,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.b	@(5,r12),r0
	add	#1,r0
	mov	#5,r3
	cmp/gt	r3,r0
	bf	.L06048390
	mov	#0,r0
.L06048390:
	mov.b	r0,@(5,r12)
	lds.l	@r15+,pr
	rts
	nop
.L06048398:
	.short 0x0110
	.byte 0x00, 0x00
.L0604839C:
	.long D_06047F1E
.L060483A0:
	.long func_0600E4C4
.L060483A4:
	tst	#4,r0
	bt	.L060483D2
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#5,r6
	mov.l	.L060483D8,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.b	@(5,r12),r0
	add	#-1,r0
	cmp/pz	r0
	bt	.L060483D0
	mov	#5,r0
.L060483D0:
	mov.b	r0,@(5,r12)
.L060483D2:
	lds.l	@r15+,pr
	rts
	nop
.L060483D8:
	.long func_0600E4C4
.L060483DC:
	mov.b	@(3,r12),r0
	mov	#80,r2
	mulu.w	r0,r2
	sts	macl,r0
	mov.l	.L06048420,r11
	add	r0,r11
	mov.l	@(20,r12),r0
	add	r0,r11
	mov.b	@(14,r11),r0
	tst	r0,r0
	bf	.L0604842C
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#5,r6
	mov.l	.L06048424,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#1,r0
	mov.b	r0,@(6,r12)
	mov.l	.L06048428,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L06048420:
	.long 0x00000528
.L06048424:
	.long func_0600E4C4
.L06048428:
	.long func_06048090
.L0604842C:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#10,r6
	mov.l	.L06048470,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#3,r0
	mov.b	r0,@(5,r12)
	mov	#0,r0
	mov.b	r0,@(4,r12)
	mov.l	.L06048474,r2
	mov.l	.L06048478,r3
	mov.w	.L0604846E,r4
.L06048458:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L06048458
	add	#4,r2
	mov.l	.L0604847C,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L0604846E:
	.short 0x0008
.L06048470:
	.long func_0600E4C4
.L06048474:
	.long D_060CA220
.L06048478:
	.long D_00281BF4
.L0604847C:
	.long D_060485B4
	dlabel D_06048480
	.long D_060485B4
	.long func_06048D48
	.long D_060485B4
	.long D_060485B4
	.long func_06049B38
	.long func_06049B6C
	.long func_06049CC8
	.long D_0604A2D8
	.long D_0604A250
	.long func_06049538
	.long func_06049B38
	.long func_06049B6C
	endlabel func_0604829C

	glabel func_060484B0
	sts.l	pr,@-r15
	mov.l	.L060484D4,r12
	mov.l	.L060484D8,r13
	mov.b	@(4,r12),r0
	tst	r0,r0
	bf	.L06048534
	mov.l	.L060484DC,r5
	bsr	func_06047B44
	nop
	mov.b	@(3,r1),r0
	tst	r0,r0
	bf	.L060484E4
	mov.l	.L060484E0,r5
	bsr	func_06047BCC
	nop
	lds.l	@r15+,pr
	rts
	nop
.L060484D4:
	.long D_060CB000
.L060484D8:
	.long D_0604AE50
.L060484DC:
	.long D_0604B304
.L060484E0:
	.long D_0604B3AC
.L060484E4:
	mov.l	.L06048524,r5
	mov.b	@(5,r12),r0
	cmp/eq	#4,r0
	bt	.L060484F4
	shll2	r0
	shll	r0
	bsr	func_06047BCC
	add	r0,r5
.L060484F4:
	mov.l	.L06048528,r5
	bsr	func_06047B44
	nop
	mov.l	.L06048528,r5
	mov.b	@(5,r12),r0
	shll2	r0
	shll	r0
	bsr	func_06047CA4
	add	r0,r5
	mov.l	@(32,r1),r2
	add	#-4,r2
	mov.l	@r2,r2
	mov.l	.L0604852C,r0
	cmp/eq	r0,r2
	bf	.L0604851E
	mov.l	.L06048530,r5
	mov.b	@(5,r12),r0
	shll2	r0
	shll	r0
	bsr	func_06047BCC
	add	r0,r5
.L0604851E:
	lds.l	@r15+,pr
	rts
	nop
.L06048524:
	.long D_0604B394
.L06048528:
	.long D_0604B330
.L0604852C:
	.long func_0604829C
.L06048530:
	.long D_0604B490
.L06048534:
	mov.l	.L0604857C,r5
	bsr	func_06047B44
	nop
	mov.l	.L06048580,r5
	mov.b	@(5,r12),r0
	cmp/eq	#4,r0
	bt	.L0604854A
	shll2	r0
	shll	r0
	bsr	func_06047BCC
	add	r0,r5
.L0604854A:
	mov.l	.L06048584,r5
	bsr	func_06047B44
	nop
	mov.l	.L06048584,r5
	mov.b	@(5,r12),r0
	shll2	r0
	shll	r0
	bsr	func_06047CA4
	add	r0,r5
	mov.l	@(32,r1),r2
	add	#-4,r2
	mov.l	@r2,r2
	mov.l	.L06048588,r0
	cmp/eq	r0,r2
	bf	.L06048574
	mov.l	.L0604858C,r5
	mov.b	@(5,r12),r0
	shll2	r0
	shll	r0
	bsr	func_06047BCC
	add	r0,r5
.L06048574:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604857C:
	.long D_0604B2A4
.L06048580:
	.long D_0604B364
.L06048584:
	.long D_0604B2D0
.L06048588:
	.long func_0604829C
.L0604858C:
	.long D_0604B4C0
	endlabel func_060484B0

	glabel func_06048590
	sts.l	pr,@-r15
	mov.l	.L060485AC,r0
	mov.w	@r0,r0
	shlr8	r0
	tst	#2,r0
	bt	.L060485A6
	mov.l	r1,@-r15
	mov.l	.L060485B0,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
.L060485A6:
	lds.l	@r15+,pr
	rts
	nop
.L060485AC:
	.long D_06047F1E
.L060485B0:
	.long func_06007A44
	dlabel D_060485B4
	.byte 0xDC, 0x14
	endlabel func_06048590

	glabel func_060485B6
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#5,r6
	mov.l	.L0604860C,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#2,r0
	mov.w	r0,@(16,r12)
	mov.l	.L06048610,r0
	mov.b	@r0,r0
	mov.b	r0,@(14,r12)
	mov.b	@(3,r12),r0
	mov.b	r0,@(10,r12)
	mov.l	.L06048614,r2
	mov.l	.L06048610,r0
	mov.b	@r0,r0
	cmp/pl	r0
	bf	.L060485EE
	mov.l	.L06048618,r2
.L060485EE:
	mov.l	.L0604861C,r0
	mov.l	r2,@r0
	mov.l	.L06048620,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.b	@(5,r12),r0
	cmp/eq	#0,r0
	bf	.L06048602
	mov	#6,r0
	mov.w	r0,@(16,r12)
.L06048602:
	rts
	nop
	.byte 0x00, 0x00
	.long D_060CB000
.L0604860C:
	.long func_0600E4C4
.L06048610:
	.long D_060CB050
.L06048614:
	.long 0x002FF100
.L06048618:
	.long 0x002FF880
.L0604861C:
	.long D_060CB014
.L06048620:
	.long func_06048624
	endlabel func_060485B6

	glabel func_06048624
	sts.l	pr,@-r15
	mov.l	.L06048640,r12
	mov.w	@(16,r12),r0
	cmp/eq	#7,r0
	bf	.L0604864C
	mov.l	.L06048644,r0
	jsr	@r0
	nop
	cmp/pl	r2
	bt	.L06048648
	cmp/pz	r2
	bf	.L06048718
	bra	.L0604865A
	nop
.L06048640:
	.long D_060CB000
.L06048644:
	.long func_0604ACEC
.L06048648:
	bra	.L0604876C
	nop
.L0604864C:
	mov.l	.L06048668,r0
	jsr	@r0
	nop
	cmp/pl	r2
	bt	.L060486E8
	cmp/pz	r2
	bf	.L060486B4
.L0604865A:
	mov.l	.L0604866C,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L06048670
	bra	.L060487C0
	nop
	.byte 0x00, 0x00
.L06048668:
	.long func_0604ACEC
.L0604866C:
	.long D_06047F1E
.L06048670:
	mov.b	@(15,r12),r0
	tst	r0,r0
	bf	.L060486A2
	mov.l	.L060486A8,r0
	mov.w	@r0,r0
	tst	#16,r0
	bt	.L060486A2
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#5,r6
	mov.l	.L060486AC,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L060486B0,r0
	mov.l	r0,@-r1
	add	#4,r1
.L060486A2:
	bra	.L060487CC
	nop
	.byte 0x00, 0x00
.L060486A8:
	.long D_06047F1E
.L060486AC:
	.long func_0600E4C4
.L060486B0:
	.long func_06048258
.L060486B4:
	mov.b	@(10,r12),r0
	cmp/eq	#0,r0
	bt	.L06048718
	cmp/pl	r0
	bf	.L060486A2
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#6,r6
	mov.l	.L060486E4,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	add	#-1,r0
	bra	.L060487CC
	mov.b	r0,@(10,r12)
	.byte 0x00, 0x00
.L060486E4:
	.long func_0600E4C4
.L060486E8:
	mov.b	@(10,r12),r0
	mov.l	@(28,r12),r2
	cmp/ge	r2,r0
	bt	.L0604876C
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#6,r6
	mov.l	.L06048714,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	add	#1,r0
	bra	.L060487CC
	mov.b	r0,@(10,r12)
.L06048714:
	.long func_0600E4C4
.L06048718:
	mov.b	@(14,r12),r0
	cmp/pl	r0
	bf	.L060487CC
	mov.l	.L0604875C,r2
	mov.b	@r2,r0
	tst	#1,r0
	bf	.L06048730
	mov.l	.L06048760,r2
	mov.w	@r2,r4
	mov	#1,r5
	cmp/ge	r5,r4
	bf	.L060487CC
.L06048730:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#6,r6
	mov.l	.L06048764,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#0,r0
	mov.b	r0,@(14,r12)
	mov	#4,r0
	mov.b	r0,@(10,r12)
	mov.l	.L06048768,r0
	bra	.L060487CC
	mov.l	r0,@(20,r12)
.L0604875C:
	.long D_060CB044
.L06048760:
	.long D_060CB048
.L06048764:
	.long func_0600E4C4
.L06048768:
	.long 0x002FF100
.L0604876C:
	mov.b	@(14,r12),r0
	cmp/eq	#0,r0
	bf	.L060487CC
	mov.l	.L060487B0,r2
	mov.b	@r2,r0
	tst	#1,r0
	bf	.L06048784
	mov.l	.L060487B4,r2
	mov.w	@r2,r4
	mov	#1,r5
	cmp/ge	r5,r4
	bf	.L060487CC
.L06048784:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
.L0604878E:
	mov	#1,r5
	mov	#6,r6
	mov.l	.L060487B8,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#1,r0
	mov.b	r0,@(14,r12)
	mov	#0,r0
	mov.b	r0,@(10,r12)
	mov.l	.L060487BC,r0
	bra	.L060487CC
	mov.l	r0,@(20,r12)
.L060487B0:
	.long D_060CB045
.L060487B4:
	.long D_060CB04A
.L060487B8:
	.long func_0600E4C4
.L060487BC:
	.long 0x002FF880
.L060487C0:
	mov.l	.L060487F8,r2
	mov.b	@(5,r12),r0
	shll2	r0
	mov.l	@(r0,r2),r0
	mov.l	r0,@-r1
	add	#4,r1
.L060487CC:
	bsr	func_06048914
	nop
	mov.l	.L060487FC,r13
	mov.l	.L06048800,r11
	mov.l	@(20,r12),r0
	add	r0,r11
	mov.l	@(28,r12),r7
	add	#1,r7
	mov	#14,r8
	mov	#80,r9
.L060487E0:
	mov	#8,r3
	mov	#31,r4
	mov	r8,r5
	mov	r11,r2
	mov.b	@(14,r11),r0
	tst	r0,r0
	bt	.L06048808
	mov.l	.L06048804,r2
	bsr	func_0604791C
	nop
	bra	.L0604880C
	nop
.L060487F8:
	.long func_06048860
.L060487FC:
	.long D_0604AE50
.L06048800:
	.long 0x00000528
.L06048804:
	.long D_06048890
.L06048808:
	bsr	func_0604792C
	nop
.L0604880C:
	add	r9,r11
	dt	r7
	bf/s	.L060487E0
	add	#2,r8
	mov.w	@(16,r12),r0
	cmp/eq	#7,r0
	bt	.L0604882C
	mov.b	@(10,r12),r0
	shll2	r0
	shll2	r0
	mov.w	.L06048850,r3
	add	r0,r3
	mov.l	@(32,r12),r2
	mov.l	.L06048854,r0
	jsr	@r0
	mov.l	r3,@(36,r12)
.L0604882C:
	mov.b	@(14,r12),r0
	mov.l	.L06048858,r2
	mov.b	@r2,r2
	cmp/eq	r0,r2
	bf	.L06048846
	mov.b	@(3,r12),r0
	shll2	r0
	shll2	r0
	mov.w	.L06048850,r3
	add	r0,r3
	mov.l	.L0604885C,r0
	jsr	@r0
	mov.l	@(32,r12),r2
.L06048846:
	bsr	func_0604889C
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06048850:
	.short 0x0070
	.byte 0x00, 0x00
.L06048854:
	.long func_0604A598
.L06048858:
	.long D_060CB050
.L0604885C:
	.long func_0604A574
	endlabel func_06048624

	glabel func_06048860
	mov.b	r0,@(r0,r6)
	bt	.L0604878E
	mov.b	r0,@(r0,r6)
	bt/s	.L060488FA
	mov.b	r0,@(r0,r6)
	mov.w	.L060488EE,r1
	mov.b	r0,@(r0,r6)
	bra	.L06049166
	mov.b	r0,@(r0,r6)
	.byte 0x9B, 0x38
	.long func_06049B6C
	.long func_06049CC8
	.long D_0604A2D8
	.long D_0604A250
	.long func_06049538
	.long func_06049B38
	.long func_06049B6C
	dlabel D_06048890
	.byte 0x4E, 0x45, 0x57, 0x20, 0x47, 0x41, 0x4D, 0x45, 0x00, 0x09, 0x00, 0x09
	endlabel func_06048860

	glabel func_0604889C
	sts.l	pr,@-r15
	mov.l	.L060488CC,r12
	mov.l	.L060488D0,r13
	mov.b	@(14,r12),r0
	cmp/eq	#-1,r0
	bt	.L060488FE
	cmp/eq	#1,r0
	bt	.L060488E4
	mov.l	.L060488D4,r2
	mov.b	@r2,r0
	tst	#1,r0
	bf	.L060488BE
	mov.l	.L060488D8,r2
	mov.w	@r2,r4
	mov	#1,r5
	cmp/ge	r5,r4
	bf	.L060488FE
.L060488BE:
	mov.l	.L060488DC,r5
	mov.l	.L060488E0,r0
	jsr	@r0
	nop
	bra	.L060488FE
	nop
	.byte 0x00, 0x00
.L060488CC:
	.long D_060CB000
.L060488D0:
	.long D_0604AE50
.L060488D4:
	.long D_060CB045
.L060488D8:
	.long D_060CB04A
.L060488DC:
	.long D_0604B428
.L060488E0:
	.long func_06047BCC
.L060488E4:
	mov.l	.L06048904,r2
	mov.b	@r2,r0
	tst	#1,r0
	bf	.L060488F6
	mov.l	.L06048908,r2
.L060488EE:
	mov.w	@r2,r4
	mov	#1,r5
	cmp/ge	r5,r4
	bf	.L060488FE
.L060488F6:
	mov.l	.L0604890C,r5
	mov.l	.L06048910,r0
.L060488FA:
	jsr	@r0
	nop
.L060488FE:
	lds.l	@r15+,pr
	rts
	nop
.L06048904:
	.long D_060CB044
.L06048908:
	.long D_060CB048
.L0604890C:
	.long D_0604B430
.L06048910:
	.long func_06047BCC
	endlabel func_0604889C

	glabel func_06048914
	sts.l	pr,@-r15
	mov.b	@(5,r12),r0
	cmp/eq	#0,r0
	bt	.L06048922
	lds.l	@r15+,pr
	rts
	nop
.L06048922:
	mov.l	.L06048938,r0
	jsr	@r0
	nop
	cmp/pl	r2
	bt	.L0604893C
	cmp/pz	r2
	bf	.L06048968
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06048938:
	.long func_0604AD38
.L0604893C:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#6,r6
	mov.l	.L06048964,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#6,r0
	mov.w	r0,@(16,r12)
	lds.l	@r15+,pr
	rts
	nop
.L06048964:
	.long func_0600E4C4
.L06048968:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#6,r6
	mov.l	.L06048990,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#7,r0
	mov.w	r0,@(16,r12)
	lds.l	@r15+,pr
	rts
	nop
.L06048990:
	.long func_0600E4C4
	endlabel func_06048914

	glabel func_06048994
	mov.l	.L060489C4,r12
	mov.w	@(16,r12),r0
	cmp/eq	#7,r0
	bt	.L060489E0
	mov.b	@(10,r12),r0
	mov	#80,r2
	mulu.w	r0,r2
	sts	macl,r0
	mov.l	.L060489C8,r11
	add	r0,r11
	mov.l	@(20,r12),r0
	add	r0,r11
	mov.b	@(14,r11),r0
	tst	r0,r0
	bf	.L060489D0
	mov	#0,r0
	mov.b	r0,@(8,r12)
	mov.w	r0,@(16,r12)
	mov.l	.L060489CC,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
	.byte 0x00, 0x00
.L060489C4:
	.long D_060CB000
.L060489C8:
	.long 0x00000528
.L060489CC:
	.long D_06048A1C
.L060489D0:
	mov.l	.L060489DC,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
	.byte 0x00, 0x00
.L060489DC:
	.long func_06048624
.L060489E0:
	mov.b	@(14,r12),r0
	cmp/pz	r0
	bf	.L06048A0C
	mov.l	.L06048A00,r2
	mov.b	@(r0,r2),r0
	tst	#2,r0
	bt	.L06048A0C
	mov	#0,r0
	mov.w	r0,@(16,r12)
	mov.b	r0,@(8,r12)
	mov.l	.L06048A04,r12
	mov.l	.L06048A08,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L06048A00:
	.long D_060CB044
.L06048A04:
	.long D_060CB000
.L06048A08:
	.long D_06048BE0
.L06048A0C:
	mov.l	.L06048A18,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
	.byte 0x00, 0x00
.L06048A18:
	.long func_06048624
	dlabel D_06048A1C
	.byte 0x4F, 0x22, 0xDC, 0x19, 0xDD, 0x19, 0xD5, 0x1A, 0xB8, 0xD2, 0x00, 0x09, 0x84, 0xCA, 0xE2, 0x50
	.byte 0x22, 0x0E, 0x00, 0x1A, 0xDB, 0x17, 0x3B, 0x0C, 0x50, 0xC5, 0x3B, 0x0C, 0xE3, 0x08, 0xE4, 0x12
	.byte 0x62, 0xB3, 0xD0, 0x15, 0x40, 0x0B, 0xE5, 0x0D, 0xE3, 0x08, 0xE4, 0x12, 0xC7, 0x04, 0xD2, 0x13
	.byte 0x42, 0x0B, 0xE5, 0x12, 0x44, 0x45, 0x4C, 0x45, 0x54, 0x45, 0x20, 0x4F, 0x4B, 0xFF, 0x00, 0x09
	.byte 0xE3, 0x08, 0xE4, 0x14, 0xC7, 0x03, 0xD2, 0x0D, 0x42, 0x0B, 0xE5, 0x14, 0x45, 0x58, 0x49, 0x54
	.byte 0xFF, 0x09, 0x00, 0x09, 0xD0, 0x0A, 0x60, 0x01, 0xC8, 0x10, 0x89, 0x15, 0xD0, 0x09, 0x21, 0x06
	.byte 0x71, 0x04, 0x4F, 0x26, 0x00, 0x0B, 0x00, 0x09
	.long D_060CB000
	.long D_0604AE50
	.long D_0604B3CC
	.byte 0x00, 0x00, 0x05, 0x28
	.long func_0604792C
	.long func_06047980
	.long D_06047F1E
	.long func_06048258
	.byte 0xD0, 0x0C, 0x60, 0x01, 0xC8, 0x01, 0x89, 0x19, 0x84, 0xC8, 0x88, 0x01, 0x8B, 0x2C
	endlabel func_06048994

	glabel func_06048AB2
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#6,r6
	mov.l	.L06048ADC,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#0,r0
	bra	.L06048B0C
	mov.b	r0,@(8,r12)
	.byte 0x00, 0x00
	.long D_06047F1E
.L06048ADC:
	.long func_0600E4C4
	.byte 0xC8, 0x02, 0x89, 0x13, 0x84, 0xC8, 0x88, 0x00, 0x8B, 0x10, 0x2F, 0x66, 0x2F, 0x56, 0x2F, 0x46
	.byte 0x2F, 0x06, 0x4F, 0x22, 0xE5, 0x01, 0xE6, 0x06, 0xD0, 0x1D, 0x40, 0x0B, 0xE4, 0x07, 0x4F, 0x26
	.byte 0x60, 0xF6, 0x64, 0xF6, 0x65, 0xF6, 0x66, 0xF6, 0xE0, 0x01, 0x80, 0xC8
.L06048B0C:
	mov.b	@(8,r12),r0
	cmp/eq	#0,r0
	bf	.L06048B90
	mov.w	.L06048B6C,r2
	mov.w	.L06048B6E,r3
	mov.l	.L06048B74,r0
	jsr	@r0
	nop
	mov.l	.L06048B78,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L06048BC6
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#7,r6
	mov.l	.L06048B70,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#0,r0
	mov.l	r0,@(0,r11)
	mov.l	r0,@(4,r11)
	mov.l	.L06048B7C,r0
	jsr	@r0
	nop
	mov.l	.L06048B80,r0
	jsr	@r0
	nop
	mov.l	.L06048B84,r0
	jsr	@r0
	nop
	mov.l	.L06048B88,r0
	jsr	@r0
	nop
	mov.l	.L06048B8C,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L06048B6C:
	.short 0x0088
.L06048B6E:
	.short 0x0090
.L06048B70:
	.long func_0600E4C4
.L06048B74:
	.long func_0604A548
.L06048B78:
	.long D_06047F1E
.L06048B7C:
	.long func_0604A5F8
.L06048B80:
	.long func_0604A77C
.L06048B84:
	.long func_0604A6C4
.L06048B88:
	.long func_0604A5B8
.L06048B8C:
	.long func_06048258
.L06048B90:
	mov.w	.L06048BCC,r2
	mov.w	.L06048BCE,r3
	mov.l	.L06048BD0,r0
	jsr	@r0
	nop
	mov.l	.L06048BD4,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L06048BC6
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#7,r6
	mov.l	.L06048BD8,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L06048BDC,r0
	mov.l	r0,@-r1
	add	#4,r1
.L06048BC6:
	lds.l	@r15+,pr
	rts
	nop
.L06048BCC:
	.short 0x0088
.L06048BCE:
	.short 0x00A0
.L06048BD0:
	.long func_0604A548
.L06048BD4:
	.long D_06047F1E
.L06048BD8:
	.long func_0600E4C4
.L06048BDC:
	.long D_060485B4
	dlabel D_06048BE0
	.byte 0x4F, 0x22, 0xDC, 0x21, 0xDD, 0x21, 0xD5, 0x22, 0xD0, 0x22, 0x40, 0x0B, 0x00, 0x09, 0xE3, 0x08
	.byte 0xE4, 0x11, 0xC7, 0x05, 0xD2, 0x20, 0x42, 0x0B, 0xE5, 0x0D, 0x41, 0x4C, 0x49, 0x46, 0x45, 0x2D
	.byte 0x44, 0x41, 0x54, 0x41, 0xFF, 0x09, 0x00, 0x09, 0xE3, 0x08, 0xE4, 0x12, 0xC7, 0x04, 0xD2, 0x1A
	.byte 0x42, 0x0B, 0xE5, 0x12, 0x44, 0x45, 0x4C, 0x45, 0x54, 0x45, 0x20, 0x4F, 0x4B, 0xFF, 0x00, 0x09
	.byte 0xE3, 0x08, 0xE4, 0x14, 0xC7, 0x03, 0xD2, 0x14, 0x42, 0x0B, 0xE5, 0x14, 0x45, 0x58, 0x49, 0x54
	.byte 0xFF, 0x09, 0x00, 0x09, 0xD0, 0x11, 0x60, 0x01, 0xC8, 0xE0, 0x8B, 0x25, 0xC8, 0x10, 0x89, 0x47
	endlabel func_06048AB2

	glabel func_06048C40
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#5,r6
	mov.l	.L06048C80,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L06048C84,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L06048CEC
	nop
	.long D_060CB000
	.long D_0604AE50
	.long D_0604B3CC
	.long func_06047BCC
	.long func_06047980
	.long D_06047F1E
.L06048C80:
	.long func_0600E4C4
.L06048C84:
	.long func_06048258
	endlabel func_06048C40

	glabel func_06048C88
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#7,r6
	mov.l	.L06048CB8,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.b	@(8,r12),r0
	cmp/eq	#0,r0
	bt	.L06048CC0
	mov.l	.L06048CBC,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L06048CEC
	nop
	.byte 0x00, 0x00
.L06048CB8:
	.long func_0600E4C4
.L06048CBC:
	.long D_060485B4
.L06048CC0:
	mov.l	.L06048CCC,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L06048CEC
	nop
	.byte 0x00, 0x00
.L06048CCC:
	.long func_06048D10
	.byte 0xD0, 0x03, 0x60, 0x01, 0xC8, 0x01, 0x89, 0x05, 0xE0, 0x00, 0xA0, 0x07, 0x80, 0xC8, 0x00, 0x00
	.long D_06047F1E
	.byte 0xC8, 0x02, 0x89, 0x01, 0xE0, 0x01, 0x80, 0xC8
.L06048CEC:
	mov.w	.L06048D04,r3
	mov.w	.L06048D06,r2
	mov.b	@(8,r12),r0
	cmp/eq	#0,r0
	bt	.L06048CF8
	mov.w	.L06048D08,r3
.L06048CF8:
	mov.l	.L06048D0C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06048D04:
	.short 0x0090
.L06048D06:
	.short 0x0088
.L06048D08:
	.short 0x00A0
	.byte 0x00, 0x00
.L06048D0C:
	.long func_0604A548
	endlabel func_06048C88

	glabel func_06048D10
	sts.l	pr,@-r15
	mov.l	.L06048D38,r12
	mov.b	@(14,r12),r0
	cmp/pz	r0
	bf	.L06048D2C
	mov	r0,r4
	mov.l	r1,@-r15
	mov.l	.L06048D3C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	mov.l	.L06048D40,r0
	mov.l	r0,@-r1
	add	#4,r1
.L06048D2C:
	mov.l	.L06048D44,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06048D38:
	.long D_060CB000
.L06048D3C:
	.long func_06005DB4
.L06048D40:
	.long func_06048258
.L06048D44:
	.long func_0604AA08
	endlabel func_06048D10

	glabel func_06048D48
	sts.l	pr,@-r15
	mov.l	.L06048D8C,r2
	mov.b	@r2+,r4
	mov.b	@r2+,r5
	tst	r4,r5
	bt	.L06048DA0
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#5,r6
	mov.l	.L06048D90,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L06048D94,r12
	mov.l	.L06048D98,r0
	mov.b	@r0,r0
	mov.b	r0,@(14,r12)
	mov.b	r0,@(10,r12)
	mov.l	.L06048D9C,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov	#4,r0
	mov.w	r0,@(16,r12)
	lds.l	@r15+,pr
	rts
	nop
.L06048D8C:
	.long D_060CB042
.L06048D90:
	.long func_0600E4C4
.L06048D94:
	.long D_060CB000
.L06048D98:
	.long D_060CB050
.L06048D9C:
	.long func_06048DDC
.L06048DA0:
	mov.l	.L06048DD0,r0
	mov.l	r0,@(48,r1)
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#4,r6
	mov.l	.L06048DD4,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L06048DD8,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06048DD0:
	.long D_0604C091
.L06048DD4:
	.long func_0600E4C4
.L06048DD8:
	.long func_06049C98
	endlabel func_06048D48

	glabel func_06048DDC
	sts.l	pr,@-r15
	mov.l	.L06048E14,r12
	mov.l	.L06048E18,r0
	jsr	@r0
	nop
	cmp/pl	r2
	bt	.L06048E54
	cmp/pz	r2
	bf	.L06048E28
	mov.l	.L06048E1C,r0
	jsr	@r0
	nop
	cmp/pl	r2
	bt	.L06048E80
	cmp/pz	r2
	bf	.L06048EA8
	mov.l	.L06048E20,r0
	mov.w	@r0,r0
	tst	#224,r0
	bf	.L06048ED0
	tst	#16,r0
	bt	.L06048E0E
	mov.l	.L06048E24,r0
	mov.l	r0,@-r1
	add	#4,r1
.L06048E0E:
	bra	.L06048F52
	nop
	.byte 0x00, 0x00
.L06048E14:
	.long D_060CB000
.L06048E18:
	.long func_0604ACEC
.L06048E1C:
	.long func_0604AD38
.L06048E20:
	.long D_06047F1E
.L06048E24:
	.long func_06048258
.L06048E28:
	mov.b	@(10,r12),r0
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#6,r6
	mov.l	.L06048E50,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#0,r0
	bra	.L06048F52
	mov.b	r0,@(10,r12)
	.byte 0x00, 0x00
.L06048E50:
	.long func_0600E4C4
.L06048E54:
	mov.b	@(10,r12),r0
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#6,r6
	mov.l	.L06048E7C,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#1,r0
	bra	.L06048F52
	mov.b	r0,@(10,r12)
	.byte 0x00, 0x00
.L06048E7C:
	.long func_0600E4C4
.L06048E80:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#6,r6
	mov.l	.L06048EA4,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#4,r0
	bra	.L06048F52
	mov.w	r0,@(16,r12)
.L06048EA4:
	.long func_0600E4C4
.L06048EA8:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#6,r6
	mov.l	.L06048ECC,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#5,r0
	bra	.L06048F52
	mov.w	r0,@(16,r12)
.L06048ECC:
	.long func_0600E4C4
.L06048ED0:
	mov.b	@(10,r12),r0
	tst	r0,r0
	bf	.L06048EEC
	mov.l	.L06048EE4,r6
	mov.b	@r6+,r8
	mov.b	@r6+,r9
	mov.l	.L06048EE8,r7
	bra	.L06048EF6
	mov.w	@r7,r4
	.byte 0x00, 0x00
.L06048EE4:
	.long D_060CB044
.L06048EE8:
	.long D_060CB04A
.L06048EEC:
	mov.l	.L06048F28,r6
	mov.b	@r6+,r9
	mov.b	@r6+,r8
	mov.l	.L06048F2C,r7
	mov.w	@r7,r4
.L06048EF6:
	mov.w	@(16,r12),r0
	cmp/eq	#4,r0
	bt/s	.L06048F00
	mov	#1,r5
	mov	#2,r5
.L06048F00:
	tst	r5,r8
	bt	.L06048F34
	tst	r5,r9
	bf	.L06048F0C
	cmp/ge	r5,r4
	bf	.L06048F34
.L06048F0C:
	mov.b	@(10,r12),r0
	mov.b	r0,@(14,r12)
	mov.w	@(16,r12),r0
	mov.b	r0,@(0,r1)
	mov	#0,r0
	mov.w	r0,@(16,r12)
	mov.b	r0,@(8,r12)
	mov.l	.L06048F30,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06048F28:
	.long D_060CB044
.L06048F2C:
	.long D_060CB048
.L06048F30:
	.long D_06048F98
.L06048F34:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#4,r6
	mov.l	.L06048F64,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L06048F52:
	mov.b	@(10,r12),r0
	cmp/eq	#0,r0
	bt	.L06048F68
	cmp/eq	#1,r0
	bt	.L06048F80
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06048F64:
	.long func_0600E4C4
.L06048F68:
	mov.l	.L06048F7C,r2
	mov.b	@r2,r0
	tst	r0,r0
	bt	.L06048F74
	mov	#0,r0
	mov.b	r0,@(14,r12)
.L06048F74:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06048F7C:
	.long D_060CB042
.L06048F80:
	mov.l	.L06048F94,r2
	mov.b	@r2,r0
	tst	r0,r0
	bt	.L06048F8C
	mov	#1,r0
	mov.b	r0,@(14,r12)
.L06048F8C:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06048F94:
	.long D_060CB043
	dlabel D_06048F98
	.byte 0x4F, 0x22, 0xDC, 0x0C, 0xDD, 0x0C, 0xD5, 0x0D, 0x84, 0xCE, 0x20, 0x08, 0x89, 0x00, 0xD5, 0x0C
	.byte 0xD0, 0x0C, 0x40, 0x0B, 0x00, 0x09, 0x84, 0x10, 0xC8, 0x01, 0x89, 0x17, 0xE3, 0x08, 0xE4, 0x13
	.byte 0xC7, 0x03, 0xD2, 0x09, 0x42, 0x0B, 0xE5, 0x0D, 0x41, 0x4C, 0x49, 0x46, 0x45, 0xFF, 0x00, 0x09
	.byte 0xA0, 0x16, 0x00, 0x09
	.long D_060CB000
	.long D_0604AE50
	.long D_0604B3CC
	.long D_0604B3F0
	.long func_06047B44
	.long func_06047980
	.byte 0xE3, 0x08, 0xE4, 0x13, 0xC7, 0x03, 0xD2, 0x1E, 0x42, 0x0B, 0xE5, 0x0D, 0x44, 0x49, 0x41, 0x52
	.byte 0x59, 0xFF, 0x00, 0x09, 0xE3, 0x08, 0xE4, 0x14, 0xC7, 0x03, 0xD2, 0x19, 0x42, 0x0B, 0xE5, 0x14
	.byte 0x43, 0x4F, 0x50, 0x59, 0xFF, 0x09, 0x00, 0x09, 0xE3, 0x08, 0xE4, 0x14, 0xC7, 0x03, 0xD2, 0x14
	.byte 0x42, 0x0B, 0xE5, 0x16, 0x45, 0x58, 0x49, 0x54, 0xFF, 0x09, 0x00, 0x09, 0xD0, 0x11, 0x60, 0x01
	.byte 0xC8, 0xE0, 0x89, 0x31, 0x84, 0xC8, 0x20, 0x08, 0x8B, 0x26
	endlabel func_06048DDC

	glabel func_0604902E
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#7,r6
	mov.l	.L0604906C,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L06049070,r0
	jsr	@r0
	nop
	mov.l	.L06049074,r0
	jsr	@r0
	nop
	mov.l	.L06049078,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
	.long func_06047980
	.long D_06047F1E
.L0604906C:
	.long func_0600E4C4
.L06049070:
	.long func_06047A98
.L06049074:
	.long func_06047A7C
.L06049078:
	.long func_060490FC
	.byte 0xD0, 0x02, 0x21, 0x06, 0x71, 0x04, 0x4F, 0x26, 0x00, 0x0B, 0x00, 0x09
	.long func_06048258
	.byte 0xC8, 0x10, 0x89, 0x09, 0x84, 0x10, 0x81, 0xC8, 0xD0, 0x02, 0x21, 0x06, 0x71, 0x04, 0x4F, 0x26
	.byte 0x00, 0x0B, 0x00, 0x09
	.long func_06048DDC
	.byte 0xD0, 0x04, 0x60, 0x01, 0xC8, 0x01, 0x89, 0x07, 0x84, 0xC8, 0x88, 0x01, 0x8B, 0x0B, 0xE0, 0x00
	.byte 0xA0, 0x09, 0x80, 0xC8
	.long D_06047F1E
	.byte 0xC8, 0x02, 0x89, 0x04, 0x84, 0xC8, 0x88, 0x00, 0x8B, 0x01, 0xE0, 0x01, 0x80, 0xC8, 0x84, 0xC8
	.byte 0x88, 0x00, 0x8B, 0x05, 0x92, 0x02, 0x93, 0x02, 0xA0, 0x04, 0x00, 0x09, 0x00, 0x88, 0x00, 0xA0
	.byte 0x92, 0x08, 0x93, 0x08, 0xD0, 0x04, 0x40, 0x0B, 0x00, 0x09, 0xD0, 0x04, 0x60, 0x01, 0x4F, 0x26
	.byte 0x00, 0x0B, 0x00, 0x09, 0x00, 0x88, 0x00, 0xB0
	.long func_0604A598
	.long D_06047F1E
	endlabel func_0604902E

	glabel func_060490FC
	sts.l	pr,@-r15
	mov.l	.L06049130,r12
	mov.l	r12,@-r15
	mov.l	r1,@-r15
	mov.b	@(0,r1),r0
	mov.w	r0,@(16,r12)
	tst	#1,r0
	movt	r0
	xor	#1,r0
	mov	r0,r5
	mov.b	@(14,r12),r0
	mov	r0,r4
	mov.l	.L06049134,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	mov.l	@r15+,r12
	mov.l	.L06049138,r0
	mov.b	@r0,r0
	mov.b	r0,@(14,r12)
	mov.l	.L0604913C,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L06049130:
	.long D_060CB000
.L06049134:
	.long func_06005D3E
.L06049138:
	.long D_060CB050
.L0604913C:
	.long func_06048258
	dlabel D_06049140
	.byte 0xDC, 0x1D, 0xDD, 0x1E, 0xE0, 0x00, 0x1C, 0x0B, 0x1C, 0x0C, 0x81, 0xC8, 0xE0, 0x20, 0x80, 0xCC
	.byte 0x84, 0xCA, 0xE2, 0x50, 0x22, 0x0E, 0x00, 0x1A, 0xDB, 0x19, 0x3B, 0x0C, 0x50, 0xC5, 0x3B, 0x0C
	.byte 0x1C, 0xB6, 0x84, 0xBE, 0x20, 0x08
.L06049166:
	bf	.L060491D4
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#7,r6
	mov.l	.L060491C4,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	r11,r2
	mov.l	.L060491C8,r3
	mov.l	@r2+,r0
	mov.l	r0,@(0,r3)
	mov.l	@r2+,r0
	mov.l	r0,@(4,r3)
	mov.l	.L060491CC,r2
	mov	#1,r0
	mov.b	r0,@r2
	mov	#8,r2
	add	#7,r11
	mov	#32,r3
.L0604919E:
	mov.b	@r11,r0
	cmp/gt	r3,r0
	bt	.L060491AA
	dt	r2
	bf/s	.L0604919E
	add	#-1,r11
.L060491AA:
	add	#1,r11
	mov.l	r11,@(52,r12)
	mov.l	.L060491D0,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
	.long D_060CB000
	.long D_0604AE50
	.byte 0x00, 0x00, 0x05, 0x28
.L060491C4:
	.long func_0600E4C4
.L060491C8:
	.long D_06049530
.L060491CC:
	.long D_0604952C
.L060491D0:
	.long func_06049204
.L060491D4:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#4,r6
	mov.l	.L060491FC,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L06049200,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L060491FC:
	.long func_0600E4C4
.L06049200:
	.long D_060485B4
	endlabel func_060490FC

	glabel func_06049204
	sts.l	pr,@-r15
	mov.l	.L06049288,r12
	mov.l	.L0604928C,r13
	mov.l	.L06049290,r5
	mov.l	.L06049294,r0
	jsr	@r0
	nop
	mov.l	.L06049298,r5
	mov.l	.L0604929C,r0
	jsr	@r0
	nop
	mov.b	@(10,r12),r0
	mov	#80,r2
	mulu.w	r0,r2
	sts	macl,r0
	mov.l	.L060492A0,r11
	add	r0,r11
	mov.l	@(20,r12),r0
	add	r0,r11
	mov	#8,r3
	mov	#18,r4
	mov	r11,r2
	mov.l	.L060492A4,r0
	jsr	@r0
	mov	#13,r5
	mov	#25,r3
	mov	#9,r4
	mov.l	.L060492A8,r2
	mov.l	.L060492A4,r0
	jsr	@r0
	mov	#16,r5
	mov	#25,r3
	mov	#9,r4
	mov.l	.L060492AC,r2
	mov.l	.L060492A4,r0
	jsr	@r0
	mov	#18,r5
	mov	#25,r3
	mov	#9,r4
	mov.l	.L060492B0,r2
	mov.l	.L060492A4,r0
	jsr	@r0
	mov	#20,r5
	mov	#25,r3
	mov	#9,r4
	mov.l	.L060492B4,r2
	mov.l	.L060492A4,r0
	jsr	@r0
	mov	#22,r5
	mov.l	.L060492B8,r0
	jsr	@r0
	nop
	cmp/pl	r2
	bt	.L06049276
	cmp/pz	r2
	bf	.L060492C4
	bt	.L060492E4
.L06049276:
	mov.l	@(44,r12),r3
	mov	#12,r4
	cmp/ge	r4,r3
	bt	.L060492BC
	add	#1,r3
	mov.l	r3,@(44,r12)
	bra	.L060492E4
	nop
	.byte 0x00, 0x00
.L06049288:
	.long D_060CB000
.L0604928C:
	.long D_0604AE50
.L06049290:
	.long D_0604B3CC
.L06049294:
	.long func_06047BCC
.L06049298:
	.long D_0604B454
.L0604929C:
	.long func_06047B44
.L060492A0:
	.long 0x00000528
.L060492A4:
	.long func_0604792C
.L060492A8:
	.long D_0604B654
.L060492AC:
	.long D_0604B674
.L060492B0:
	.long D_0604B694
.L060492B4:
	.long D_0604B6B4
.L060492B8:
	.long func_0604AD38
.L060492BC:
	mov	#0,r3
	mov.l	r3,@(44,r12)
	bra	.L060492E4
	nop
.L060492C4:
	mov.l	@(44,r12),r3
	cmp/pl	r3
	bf	.L060492E0
	add	#-1,r3
	mov.l	r3,@(44,r12)
	mov	r3,r0
	cmp/eq	#9,r0
	bf	.L060492E4
	mov.l	@(48,r12),r0
	cmp/eq	#3,r0
	bf	.L060492E4
	mov	#8,r3
	bra	.L060492E4
	mov.l	r3,@(44,r12)
.L060492E0:
	mov	#12,r3
	mov.l	r3,@(44,r12)
.L060492E4:
	mov.l	.L06049304,r0
	jsr	@r0
	nop
	cmp/pl	r2
	bt	.L060492F4
	cmp/pz	r2
	bf	.L0604930E
	bt	.L0604931E
.L060492F4:
	mov.l	@(48,r12),r3
	mov	#3,r4
	cmp/ge	r4,r3
	bt	.L06049308
	add	#1,r3
	bra	.L0604931E
	mov.l	r3,@(48,r12)
	.byte 0x00, 0x00
.L06049304:
	.long func_0604ACEC
.L06049308:
	mov	#0,r3
	bra	.L0604931E
	mov.l	r3,@(48,r12)
.L0604930E:
	mov.l	@(48,r12),r3
	cmp/pl	r3
	bf	.L0604931A
	add	#-1,r3
	bra	.L0604931E
	mov.l	r3,@(48,r12)
.L0604931A:
	mov	#3,r3
	mov.l	r3,@(48,r12)
.L0604931E:
	mov.l	@(44,r12),r6
	shll	r6
	mov	r6,r4
	mov.l	@(48,r12),r7
	shll	r7
	mov	r7,r5
	shll2	r7
	shll2	r7
	add	r6,r7
	mov.l	.L06049344,r0
	mov	r0,r2
	add	r7,r2
	mov.b	@(r0,r7),r0
	cmp/eq	#91,r0
	bt	.L0604941C
	cmp/eq	#93,r0
	bf	.L06049348
	bra	.L0604947C
	nop
.L06049344:
	.long D_0604B654
.L06049348:
	mov.b	r0,@(12,r12)
	add	#9,r4
	add	#16,r5
	mov	#1,r3
	mov.l	.L060493C4,r0
	jsr	@r0
	nop
	mov.l	@(44,r12),r3
	shll2	r3
	shll2	r3
	mov.l	@(48,r12),r4
	shll2	r4
	shll2	r4
	mov.l	.L060493C8,r5
	mov.l	.L060493CC,r0
	jsr	@r0
	nop
	mov.l	.L060493D0,r0
	mov.w	@r0,r0
	tst	#144,r0
	bf	.L060493DC
	tst	#96,r0
	bt	.L0604940A
	mov.l	@(24,r12),r2
	mov	#0,r0
	mov.b	r0,@(14,r2)
	mov.l	.L060493D4,r2
	mov.b	@r2,r3
	tst	r3,r3
	bt	.L0604938E
	mov.b	r0,@r2
	mov.l	@(24,r12),r3
	mov.l	r3,@(52,r12)
	mov.l	r0,@(0,r3)
	mov.l	r0,@(4,r3)
.L0604938E:
	mov.l	@(24,r12),r2
	add	#8,r2
	mov.l	@(52,r12),r3
	cmp/ge	r2,r3
	bt	.L060493DC
	mov.b	@(12,r12),r0
	mov.b	r0,@r3
	add	#1,r3
	mov.l	r3,@(52,r12)
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#8,r6
	mov.l	.L060493D8,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	lds.l	@r15+,pr
	rts
	nop
.L060493C4:
	.long func_0604791C
.L060493C8:
	.long D_0604B488
.L060493CC:
	.long func_06047B98
.L060493D0:
	.long D_06047F1E
.L060493D4:
	.long D_0604952C
.L060493D8:
	.long func_0600E4C4
.L060493DC:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#8,r6
	mov.l	.L06049410,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#11,r0
	mov.l	r0,@(44,r12)
	mov	#3,r0
	mov.l	r0,@(48,r12)
	mov.l	.L06049414,r5
	mov.l	.L06049418,r0
	jsr	@r0
	nop
.L0604940A:
	lds.l	@r15+,pr
	rts
	nop
.L06049410:
	.long func_0600E4C4
.L06049414:
	.long D_0604B45C
.L06049418:
	.long func_06047CA4
.L0604941C:
	mov	#10,r0
	mov.l	r0,@(44,r12)
	mov.l	.L06049468,r5
	mov.l	.L0604946C,r0
	jsr	@r0
	nop
	mov.l	.L06049470,r0
	mov.w	@r0,r0
	tst	#96,r0
	bt	.L0604940A
	mov.l	.L06049474,r2
	mov	#0,r0
	mov.b	r0,@r2
	mov.l	@(24,r12),r2
	mov.l	@(52,r12),r3
	cmp/gt	r2,r3
	bf	.L0604940A
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#8,r6
	mov.l	.L06049478,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#0,r0
	mov.b	r0,@-r3
	mov.l	r3,@(52,r12)
	lds.l	@r15+,pr
	rts
	nop
.L06049468:
	.long D_0604B454
.L0604946C:
	.long func_06047CA4
.L06049470:
	.long D_06047F1E
.L06049474:
	.long D_0604952C
.L06049478:
	.long func_0600E4C4
.L0604947C:
	mov	#11,r0
	mov.l	r0,@(44,r12)
	mov.l	.L060494CC,r5
	mov.l	.L060494D0,r0
	jsr	@r0
	nop
	mov.l	.L060494D4,r0
	mov.w	@r0,r0
	tst	#16,r0
	bf	.L060494E0
	tst	#224,r0
	bt	.L0604940A
.L06049494:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#8,r6
	mov.l	.L060494D8,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L060494DC,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.b	@(13,r12),r0
	tst	r0,r0
	bt	.L060494C6
	mov	#0,r0
	mov.b	r0,@(13,r12)
	mov	#1,r0
	mov.b	r0,@(6,r12)
.L060494C6:
	lds.l	@r15+,pr
	rts
	nop
.L060494CC:
	.long D_0604B45C
.L060494D0:
	.long func_06047CA4
.L060494D4:
	.long D_06047F1E
.L060494D8:
	.long func_0600E4C4
.L060494DC:
	.long func_06048258
.L060494E0:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#7,r6
	mov.l	.L06049520,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L06049524,r2
	mov.l	@(24,r12),r3
	mov.l	@r2+,r0
	mov.l	r0,@(0,r3)
	mov.l	@r2+,r0
	mov.l	r0,@(4,r3)
	mov.b	@(13,r12),r0
	tst	r0,r0
	bt	.L06049494
	mov	#0,r0
	mov.b	r0,@(13,r12)
	mov.l	.L06049528,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L06049520:
	.long func_0600E4C4
.L06049524:
	.long D_06049530
.L06049528:
	.long D_060485B4
	endlabel func_06049204

	.section .data.0604952C,"aw",@progbits
	.p2align 2
	dlabel D_0604952C
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_06049530
	.byte 0x41, 0x41, 0x41, 0x41, 0x42, 0x42, 0x42, 0x42
