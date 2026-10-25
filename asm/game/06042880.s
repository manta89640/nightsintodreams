	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06042880,"ax",@progbits
	.p2align 2

	glabel func_06042880
	sts.l	pr,@-r15
	mov.l	.L060428CC,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	lbl_06042898
	mov.w	@(26,r1),r0
	tst	r0,r0
	bt	lbl_06042898
	mov.l	.L060428D0,r0
	jsr	@r0
	nop
	dlabel lbl_06042898
	mov.l	.L060428D4,r2
	mov.l	@r2,r0
	tst	r0,r0
	bf	.L060428AA
	mov.l	.L060428CC,r0
	mov.l	@r0,r0
	mov.b	@(7,r0),r0
	tst	r0,r0
	bt	.L060428EC
.L060428AA:
	mov.l	.L060428D8,r8
	mov.l	.L060428DC,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bf	lbl_06042902
.L060428B6:
	mov.l	.L060428E0,r2
	mov.l	.L060428E4,r3
	mov.l	.L060428E8,r0
	jsr	@r0
	nop
	mov.w	@(20,r1),r0
	mov.w	r0,@(20,r3)
	mov.w	@(14,r1),r0
	bra	.L06042986
	mov.w	r0,@(14,r3)
	.byte 0x00, 0x00
.L060428CC:
	.long D_060F3064
.L060428D0:
	.long func_0603D6F8
.L060428D4:
	.long D_060431D4
.L060428D8:
	.long 0x00400000
.L060428DC:
	.long func_060172DE
.L060428E0:
	.long func_06042A90
.L060428E4:
	.long 0x000001FF
.L060428E8:
	.long func_060429E0
.L060428EC:
	mov.l	.L0604291C,r0
	jsr	@r0
	mov	#16,r8
	cmp/pz	r0
	bt	.L060428B6
	mov.l	.L06042920,r8
	mov.l	.L06042924,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bt	.L06042964
	dlabel lbl_06042902
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06042916
	mov.b	@(1,r1),r0
	cmp/eq	#2,r0
	bf	.L06042928
	mov.w	@(6,r1),r0
	and	#2,r0
	tst	r0,r0
	bt	.L06042928
.L06042916:
	lds.l	@r15+,pr
	rts
	nop
.L0604291C:
	.long func_06017C90
.L06042920:
	.long 0x00200000
.L06042924:
	.long func_060172DE
.L06042928:
	mov.l	.L0604294C,r0
	jsr	@r0
	nop
	mov.l	.L06042950,r2
	mov.l	.L06042954,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06042958,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L0604295C,r0
	jsr	@r0
	nop
	mov.l	.L06042960,r0
	jmp	@r0
	lds.l	@r15+,pr
.L0604294C:
	.long func_0600CA24
.L06042950:
	.long D_06014076
.L06042954:
	.long func_0601EF98
.L06042958:
	.long func_0600CBDA
.L0604295C:
	.long func_060208FA
.L06042960:
	.long func_0600CA4E
.L06042964:
	bsr	func_060429B4
	nop
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#15,r6
	mov.l	.L06042998,r0
	jsr	@r0
	mov	#5,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L06042986:
	mov.b	@(1,r1),r0
	tst	r0,r0
	bt	.L060429A0
	mov.l	.L0604299C,r0
	jsr	@r0
	nop
	bra	lbl_06042902
	nop
	.byte 0x00, 0x00
.L06042998:
	.long func_0600E4C4
.L0604299C:
	.long func_0600D1A0
.L060429A0:
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov	#-2,r0
	mov.l	.L060429B0,r3
	jsr	@r3
	mov.b	r0,@(1,r2)
	bra	lbl_06042902
	nop
.L060429B0:
	.long func_0600D1A0
	endlabel func_06042880

	glabel func_060429B4
	mov.l	.L060429D8,r7
	mov.b	@(108,gbr),r0
	tst	#1,r0
	bf	.L060429CA
	mov.b	@(8,r7),r0
	add	#1,r0
	mov	#99,r8
	cmp/ge	r8,r0
	bf	.L060429C8
	mov	r8,r0
.L060429C8:
	mov.b	r0,@(8,r7)
.L060429CA:
	mov.w	.L060429D4,r0
	mov	#1,r9
	mov.l	.L060429DC,r14
	jmp	@r14
	mov	#0,r6
.L060429D4:
	.short 0x000A
	.byte 0x00, 0x00
.L060429D8:
	.long D_060FFE50
.L060429DC:
	.long func_0601A2BC
	endlabel func_060429B4

	glabel func_060429E0
	sts.l	pr,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	.L06042A74,r2
	mov.l	.L06042A78,r0
	jsr	@r0
	nop
	mov.l	@r15+,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L06042A7C,r0
	mov.l	@r0,r14
	mov.b	@(6,r14),r0
	tst	r0,r0
	mov	#2,r0
	bf	.L06042A12
	mov.l	@(752,gbr),r0
	mov.l	.L06042A80,r2
	mul.l	r0,r2
	sts	macl,r2
	mov.l	.L06042A84,r0
	add	r2,r0
	mov.l	r0,@(752,gbr)
	mov	#7,r0
	and	r2,r0
.L06042A12:
	mov.b	r0,@(0,r3)
	mov	#1,r0
	mov.b	r0,@(1,r3)
	mov.l	@(48,r14),r5
	mov.l	@(48,r1),r2
	mov.l	r2,@(48,r3)
	sub	r5,r2
	mov.l	@(52,r14),r6
	mov.l	@(52,r1),r5
	mov.l	r5,@(52,r3)
	sub	r6,r5
	mov.l	@(56,r14),r7
	mov.l	@(56,r1),r4
	mov.l	r4,@(56,r3)
	sub	r7,r4
	mov	r3,r14
	add	#64,r14
	mov.l	r2,@(4,r14)
	mov.l	r5,@(8,r14)
	mov.l	r4,@(12,r14)
	xor	r0,r0
	mov.l	r0,@(24,r3)
	mov.w	r0,@(4,r3)
	mov.w	r0,@(0,r14)
	mov.l	@(752,gbr),r0
	mov.l	.L06042A80,r2
	mul.l	r0,r2
	sts	macl,r2
	mov.l	.L06042A84,r0
	add	r2,r0
	mov.l	r0,@(752,gbr)
	mov.l	.L06042A88,r0
	and	r2,r0
	mov.l	.L06042A8C,r2
	add	r2,r0
	mov.w	r0,@(2,r3)
	mov.l	@(752,gbr),r0
	mov.l	.L06042A80,r2
	mul.l	r0,r2
	sts	macl,r2
	mov.l	.L06042A84,r0
	add	r2,r0
	mov.l	r0,@(752,gbr)
	mov.l	@r15+,r0
	and	r0,r2
	add	r2,r0
	lds.l	@r15+,pr
	rts
	mov.w	r0,@(2,r14)
.L06042A74:
	.long D_060FFFB8
.L06042A78:
	.long func_0600D0D0
.L06042A7C:
	.long D_060F3064
.L06042A80:
	.long 0x41C64E6D
.L06042A84:
	.long 0x00003039
.L06042A88:
	.long 0x000001FF
.L06042A8C:
	.long 0xFFFFFF01
	endlabel func_060429E0

	glabel func_06042A90
	mov.l	.L06042AAC,r2
	mov.l	r2,@(44,r1)
	mov.w	.L06042AA8,r0
	mov.w	r0,@(22,r1)
	mov.l	.L06042AB0,r2
	mov.l	r2,@(60,r1)
	mov.l	.L06042AB4,r3
	mov.l	r3,@(16,r1)
	mov.l	.L06042AB8,r0
	mov.l	r0,@-r1
	bra	func_06042D30
	add	#4,r1
.L06042AA8:
	.short 0x0100
	.byte 0x00, 0x00
.L06042AAC:
	.long D_06013FCE
.L06042AB0:
	.long func_06042ABC
.L06042AB4:
	.long D_06014076
.L06042AB8:
	.long func_06042D30
	endlabel func_06042A90

	glabel func_06042ABC
	bsr	func_060429B4
	nop
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#15,r6
	mov.l	.L06042AE4,r0
	jsr	@r0
	mov	#5,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L06042AE8,r0
	jmp	@r0
	lds.l	@r15+,pr
.L06042AE4:
	.long func_0600E4C4
.L06042AE8:
	.long func_0600D1A0
	.byte 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01
	.byte 0x40, 0x2B, 0x00, 0x09
	.long func_0600D1A0
	.byte 0x0E, 0x2A, 0xD0, 0x06, 0x40, 0x0B, 0xE8, 0x10, 0x40, 0x11, 0x89, 0x09, 0xD0, 0x03, 0x40, 0x0B
	.byte 0xE8, 0x20, 0x40, 0x11, 0x89, 0x0C, 0x4E, 0x2A, 0x00, 0x0B, 0x00, 0x09
	.long func_06017C90
	.byte 0xD0, 0x02, 0x21, 0x06, 0x4E, 0x2A, 0x00, 0x0B, 0x71, 0x04, 0x00, 0x00
	.long D_06042850
	.byte 0xD2, 0x03, 0xD0, 0x04, 0x40, 0x0B, 0x00, 0x09, 0xD0, 0x03, 0x4E, 0x2A, 0x00, 0x0B, 0x13, 0x03
	.long D_060FFFB8
	.long func_0600D0D0
	.long func_060330F4
	.byte 0xD2, 0x05, 0x11, 0x2B, 0x90, 0x06, 0x81, 0x1B, 0x20, 0x0A, 0x81, 0x10, 0xD0, 0x03, 0x21, 0x06
	.byte 0x00, 0x0B, 0x71, 0x04, 0x01, 0x80, 0x00, 0x00
	.long D_06013DD4
	.long D_06042B70
	dlabel D_06042B70
	.byte 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01
	.byte 0x40, 0x2B, 0x00, 0x09
	.long func_0600D1A0
	endlabel func_06042ABC

	glabel func_06042B88
	sts.l	pr,@-r15
	dlabel lbl_06042B8A
	mov.l	.L06042BBC,r2
	mov.l	@r2,r0
	tst	r0,r0
	bf	.L06042C34
	mov.l	.L06042BC0,r0
	mov.l	@r0,r0
	mov.b	@(7,r0),r0
	tst	r0,r0
	bf	.L06042C34
	mov.l	.L06042BC4,r0
	jsr	@r0
	mov	#48,r8
	cmp/pz	r0
	bf	.L06042BD4
.L06042BA6:
	mov.l	.L06042BC8,r2
	mov.l	.L06042BCC,r3
	mov.l	.L06042BD0,r0
	jsr	@r0
	nop
	mov.w	@(20,r1),r0
	mov.w	r0,@(20,r3)
	mov.w	@(14,r1),r0
	bra	.L06042C02
	mov.w	r0,@(14,r3)
	.byte 0x00, 0x00
.L06042BBC:
	.long D_060431D4
.L06042BC0:
	.long D_060F3064
.L06042BC4:
	.long func_06017C90
.L06042BC8:
	.long func_06042CC8
.L06042BCC:
	.long 0x000001FF
.L06042BD0:
	.long func_060429E0
.L06042BD4:
	mov	#32,r8
	mov.l	.L06042C14,r0
	jsr	@r0
	shll16	r8
	cmp/pz	r0
	bf	.L06042C40
	bsr	func_06042CA0
	nop
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#22,r6
	mov.l	.L06042C18,r0
	jsr	@r0
	mov	#4,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L06042C02:
	mov.b	@(1,r1),r0
	tst	r0,r0
	bt	.L06042C20
	mov.l	.L06042C1C,r0
	jsr	@r0
	nop
	bra	.L06042C40
	nop
	.byte 0x00, 0x00
.L06042C14:
	.long func_060172DE
.L06042C18:
	.long func_0600E4C4
.L06042C1C:
	.long func_0600D1A0
.L06042C20:
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov	#-2,r0
	mov.l	.L06042C30,r3
	jsr	@r3
	mov.b	r0,@(1,r2)
	bra	.L06042C40
	nop
.L06042C30:
	.long func_0600D1A0
.L06042C34:
	mov.l	.L06042C5C,r8
	mov.l	.L06042C60,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bt	.L06042BA6
.L06042C40:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06042C54
	mov.b	@(1,r1),r0
	cmp/eq	#2,r0
	bf	.L06042C64
	mov.w	@(6,r1),r0
	and	#2,r0
	tst	r0,r0
	bt	.L06042C64
.L06042C54:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06042C5C:
	.long 0x00400000
.L06042C60:
	.long func_060172DE
.L06042C64:
	mov.l	.L06042C88,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06042C8C,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06042C90,r2
	mov.l	.L06042C94,r14
	jsr	@r14
	nop
	mov.l	.L06042C98,r0
	jsr	@r0
	nop
	mov.l	.L06042C9C,r0
	jmp	@r0
	lds.l	@r15+,pr
.L06042C88:
	.long func_0600CA24
.L06042C8C:
	.long func_0600CBDA
.L06042C90:
	.long D_06013F84
.L06042C94:
	.long func_0601EF98
.L06042C98:
	.long func_06020906
.L06042C9C:
	.long func_0600CA4E
	endlabel func_06042B88

	glabel func_06042CA0
	mov.l	.L06042CC0,r7
	mov.b	@(6,r7),r0
	extu.b	r0,r0
	add	#1,r0
	mov.w	.L06042CBC,r8
	cmp/ge	r8,r0
	bf	.L06042CB0
	mov	r8,r0
.L06042CB0:
	mov.b	r0,@(6,r7)
	mov	#0,r6
	mov	#10,r0
	mov.l	.L06042CC4,r14
	jmp	@r14
	mov	#1,r9
.L06042CBC:
	.short 0x00FF
	.byte 0x00, 0x00
.L06042CC0:
	.long D_060FFE50
.L06042CC4:
	.long func_0601A2BC
	endlabel func_06042CA0

	glabel func_06042CC8
	mov.w	.L06042CE4,r0
	mov.w	r0,@(28,r1)
	mov.l	.L06042CE8,r2
	mov.l	r2,@(44,r1)
	mov.w	.L06042CE6,r0
	mov.w	r0,@(22,r1)
	mov.l	.L06042CEC,r2
	mov.l	r2,@(60,r1)
	mov.l	.L06042CF0,r3
	mov.l	r3,@(16,r1)
	mov.l	.L06042CF4,r0
	mov.l	r0,@-r1
	bra	func_06042D30
	add	#4,r1
.L06042CE4:
	.short 0x1B04
.L06042CE6:
	.short 0x0180
.L06042CE8:
	.long D_06013DD4
.L06042CEC:
	.long func_06042CF8
.L06042CF0:
	.long D_06013F84
.L06042CF4:
	.long func_06042D30
	endlabel func_06042CC8

	glabel func_06042CF8
	mov.l	.L06042D24,r2
	jsr	@r2
	nop
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#22,r6
	mov.l	.L06042D28,r0
	jsr	@r0
	mov	#4,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L06042D2C,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L06042D24:
	.long func_06042CA0
.L06042D28:
	.long func_0600E4C4
.L06042D2C:
	.long func_0600D1A0
	endlabel func_06042CF8

	glabel func_06042D30
	sts.l	pr,@-r15
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06042DB0
	mov.l	.L06042D8C,r0
	jsr	@r0
	nop
	mov.l	.L06042D90,r14
	jsr	@r14
	mov.l	@(16,r1),r2
	mov.l	.L06042D94,r14
	mov.l	@r14,r14
	mov.l	@(48,r14),r4
	mov.l	@(52,r14),r5
	mov.l	.L06042D98,r0
	jsr	@r0
	mov.l	@(56,r14),r6
	mov.b	@(0,r1),r0
	tst	#1,r0
	bt	.L06042D60
	mov.l	.L06042D9C,r13
	jsr	@r13
	mov.w	@(24,r1),r0
	mov.b	@(0,r1),r0
.L06042D60:
	tst	#2,r0
	bt	.L06042D6C
	mov.l	.L06042DA0,r13
	jsr	@r13
	mov.w	@(24,r1),r0
	mov.b	@(0,r1),r0
.L06042D6C:
	tst	#4,r0
	bt	.L06042D76
	mov.l	.L06042DA4,r13
	jsr	@r13
	mov.w	@(24,r1),r0
.L06042D76:
	mov.l	@(32,r1),r4
	mov.l	@(36,r1),r5
	mov.l	.L06042D98,r0
	jsr	@r0
	mov.l	@(40,r1),r6
	mov.l	.L06042DA8,r0
	jsr	@r0
	nop
	mov.l	.L06042DAC,r0
	jmp	@r0
	lds.l	@r15+,pr
.L06042D8C:
	.long func_0600CA24
.L06042D90:
	.long func_0601EF98
.L06042D94:
	.long D_060F3064
.L06042D98:
	.long func_0600CBDA
.L06042D9C:
	.long func_0600CA7A
.L06042DA0:
	.long func_0600CAF8
.L06042DA4:
	.long func_0600CB68
.L06042DA8:
	.long func_06020906
.L06042DAC:
	.long func_0600CA4E
.L06042DB0:
	mov.l	.L06042DCC,r14
	mov.l	@r14,r9
	mov	r1,r0
	add	#64,r0
	mov	r0,r14
	mov.w	@(0,r14),r0
	mov	r0,r2
	mov.w	.L06042DCA,r0
	cmp/gt	r0,r2
	bf	.L06042DD0
	mov.l	@(60,r1),r0
	jmp	@r0
	nop
.L06042DCA:
	.short 0x4000
.L06042DCC:
	.long D_060F3064
.L06042DD0:
	mov.w	@(2,r14),r0
	add	r2,r0
	mov.l	.L06042E40,r13
	jsr	@r13
	mov.w	r0,@(0,r14)
	shal	r10
	shal	r10
	mov.l	@(4,r14),r2
	mov.l	@(8,r14),r3
	mov.l	@(12,r14),r4
	mov	r10,r0
	dmuls.l	r2,r0
	sts	mach,r2
	sts	macl,r0
	xtrct	r2,r0
	mov.l	r0,@(32,r1)
	mov.l	@(48,r9),r2
	add	r2,r0
	mov.l	r0,@(48,r1)
	mov	r10,r0
	dmuls.l	r3,r0
	sts	mach,r3
	sts	macl,r0
	xtrct	r3,r0
	mov.l	r0,@(36,r1)
	mov.l	@(52,r9),r3
	add	r3,r0
	mov.l	r0,@(52,r1)
	dmuls.l	r4,r10
	sts	mach,r4
	sts	macl,r10
	xtrct	r4,r10
	mov.l	r10,@(40,r1)
	mov.l	@(56,r9),r4
	add	r4,r10
	mov.l	r10,@(56,r1)
	mov.w	@(2,r1),r0
	mov	r0,r2
	mov.w	@(4,r1),r0
	mov	r0,r8
	cmp/pl	r0
	bt	.L06042E26
	neg	r8,r8
.L06042E26:
	mov.l	.L06042E44,r12
	cmp/ge	r12,r8
	bt	.L06042E30
	add	r2,r0
	mov.w	r0,@(4,r1)
.L06042E30:
	mov	r0,r2
	mov.w	@(24,r1),r0
	add	r2,r0
	mov.w	r0,@(24,r1)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06042E40:
	.long func_06007BF4
.L06042E44:
	.long 0x000005FF
	endlabel func_06042D30

	.section .data.06042E48,"aw",@progbits
	.p2align 2
	.byte 0xD0, 0x02, 0x11, 0x00, 0xD2, 0x02, 0xA0, 0x19, 0x11, 0x21, 0x00, 0x00
	.long func_06043114
	.long func_06043198
	.byte 0xD0, 0x02, 0x11, 0x00, 0xD2, 0x02, 0xA0, 0x0F, 0x11, 0x21, 0x00, 0x00
	.long func_06043138
	.long func_060431A8
	.byte 0xD0, 0x02, 0x11, 0x00, 0xD2, 0x02, 0xA0, 0x05, 0x11, 0x21, 0x00, 0x00
	.long func_06043174
	.long func_060431C8
	.byte 0x53, 0x1D, 0x11, 0x33, 0x90, 0x0A, 0x81, 0x15, 0xD2, 0x05, 0x11, 0x28, 0x11, 0x29, 0x20, 0x0A
	.byte 0x81, 0x14, 0x81, 0x17, 0xD2, 0x03, 0x21, 0x26, 0x00, 0x0B, 0x71, 0x04, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x20, 0x00
	.long D_06042EAC
	dlabel D_06042EAC
	.byte 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01
	.byte 0x40, 0x2B, 0x00, 0x09
	.long func_0600D1A0
	.byte 0x0E, 0x2A, 0xD0, 0x06, 0x40, 0x0B, 0xE8, 0x10, 0x40, 0x11, 0x89, 0x09, 0xD0, 0x03, 0x40, 0x0B
	.byte 0xE8, 0x20, 0x40, 0x11, 0x89, 0x1C, 0x4E, 0x2A, 0x00, 0x0B, 0x00, 0x09
	.long func_06017C90
