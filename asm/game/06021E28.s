	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06021E28,"ax",@progbits
	.p2align 2
	.byte 0x00, 0x00

	glabel func_06021E2A
	sts.l	pr,@-r15
	mov.l	.L06021E80,r2
	mov.l	.L06021E84,r0
	jsr	@r0
	mov	#1,r8
	mov.l	.L06021E88,r12
	mov.l	.L06021E8C,r13
	mov.l	.L06021E90,r14
	bsr	func_060220A4
	nop
	mov.l	.L06021E94,r4
	mov.l	r1,@r4
	mov.l	.L06021E98,r4
	mov.l	r1,@r4
	mov.l	.L06021E9C,r4
	mov.l	r1,@r4
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L06021E56
	mov.b	@(1,r12),r0
	or	#48,r0
	mov.b	r0,@(1,r12)
.L06021E56:
	mov.w	.L06021E7E,r0
	mov.w	r0,@(28,r1)
	mov.b	@(20,gbr),r0
	and	#1,r0
	tst	r0,r0
	bf	.L06021ED4
	mov.b	@(0,gbr),r0
	cmp/eq	#0,r0
	bt	.L06021E76
	cmp/eq	#13,r0
	bt	.L06021E76
	cmp/eq	#1,r0
	bt	.L06021E76
	mov.b	@(107,gbr),r0
	tst	r0,r0
	bt	.L06021EA0
.L06021E76:
	bsr	func_06021F04
	nop
	bra	.L06021EA4
	mov.w	r0,@(6,r1)
.L06021E7E:
	.short 0x1801
.L06021E80:
	.long D_06055BCC
.L06021E84:
	.long func_0602B0A8
.L06021E88:
	.long D_06021A3C
.L06021E8C:
	.long D_06021A7C
.L06021E90:
	.long D_06021ABC
.L06021E94:
	.long D_060F3064
.L06021E98:
	.long D_060F3068
.L06021E9C:
	.long D_060F3098
.L06021EA0:
	mov.w	.L06021EC2,r0
	mov.w	r0,@(6,r1)
.L06021EA4:
	mov	#4,r0
	mov.b	r0,@(0,r12)
	mov.w	.L06021EC4,r0
	mov.w	r0,@(22,r12)
	mov.l	.L06021EC8,r0
	jsr	@r0
	nop
	mov.l	.L06021ECC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L06021ED0,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06021EC2:
	.short 0x0220
.L06021EC4:
	.short 0x009E
	.byte 0x00, 0x00
.L06021EC8:
	.long func_060294B0
.L06021ECC:
	.long func_0602B21E
.L06021ED0:
	.long func_060225E0
.L06021ED4:
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06021EFC,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.w	.L06021EF8,r0
	mov.w	r0,@(6,r1)
	mov	#0,r0
	mov.b	r0,@(0,r12)
	mov	#54,r0
	mov.w	r0,@(22,r12)
	lds.l	@r15+,pr
	mov.l	.L06021F00,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06021EF8:
	.short 0x0000
	.byte 0x00, 0x00
.L06021EFC:
	.long func_06018E8C
.L06021F00:
	.long func_060225E0
	endlabel func_06021E2A

	glabel func_06021F04
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bt	.L06021F0C
	nop
.L06021F0C:
	shlr	r0
	mov.l	.L06021F24,r2
	mov.b	@(r0,r2),r0
	mov	r0,r2
	mov	r0,r3
	shll8	r0
	shll2	r3
	shll2	r3
	or	r3,r0
	rts
	nop
	.byte 0x00, 0x00
.L06021F24:
	.long D_06021F28
	dlabel D_06021F28
	.byte 0x02, 0x01, 0x02, 0x01, 0x02, 0x01, 0x02, 0x01, 0x02, 0x01, 0x02, 0x01
	endlabel func_06021F04

	glabel func_06021F34
	sts.l	pr,@-r15
	mov.l	.L06021F6C,r12
	mov.l	.L06021F70,r13
	mov.l	.L06021F74,r14
	bsr	func_060220A4
	nop
	mov.l	.L06021F78,r4
	mov.l	r1,@r4
	mov.w	.L06021F64,r0
	mov.w	r0,@(28,r1)
	mov.w	.L06021F66,r0
	mov.w	r0,@(6,r1)
	mov.b	@(1,r12),r0
	or	#48,r0
	mov.b	r0,@(1,r12)
	mov	#4,r0
	mov.b	r0,@(0,r12)
	mov.w	.L06021F68,r0
	mov.w	r0,@(22,r12)
	lds.l	@r15+,pr
	mov.l	.L06021F7C,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06021F64:
	.short 0x190E
.L06021F66:
	.short 0x0110
.L06021F68:
	.short 0x00B1
	.byte 0x00, 0x00
.L06021F6C:
	.long D_06021CDC
.L06021F70:
	.long D_06021D1C
.L06021F74:
	.long D_06021D5C
.L06021F78:
	.long D_060F3068
.L06021F7C:
	.long func_060225E0
	endlabel func_06021F34

	glabel func_06021F80
	sts.l	pr,@-r15
	mov.b	@(20,gbr),r0
	cmp/eq	#7,r0
	bt	.L06021F9C
	mov.l	.L06021F94,r2
	mov.l	.L06021F98,r0
	jsr	@r0
	mov	#1,r8
	bra	.L06021FA4
	nop
.L06021F94:
	.long D_06055BCC
.L06021F98:
	.long D_060C5B3C
.L06021F9C:
	mov.l	.L06022008,r2
	mov.l	.L0602200C,r0
	jsr	@r0
	mov	#1,r8
.L06021FA4:
	mov.l	.L06022010,r12
	mov.l	.L06022014,r13
	mov.l	.L06022018,r14
	bsr	func_060220A4
	nop
	mov.l	.L0602201C,r4
	mov.l	r1,@r4
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06022020,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.b	@(20,gbr),r0
	cmp/eq	#7,r0
	mov	#36,r4
	mov.w	.L06021FF8,r2
	mov.w	.L06021FFA,r0
	bt	.L06021FD2
	mov	#32,r4
	mov.w	.L06021FFC,r2
	mov.w	.L06021FFE,r0
.L06021FD2:
	mov.w	r0,@(6,r1)
	mov	r2,r0
	mov.w	r0,@(22,r12)
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L06021FE0
	mov	#0,r4
.L06021FE0:
	mov	r4,r0
	mov.b	r0,@(0,r12)
	mov.w	.L06022000,r0
	mov.w	.L06022002,r0
	mov.w	r0,@(28,r1)
	mov.w	.L06022004,r0
	mov.w	r0,@(22,r1)
	lds.l	@r15+,pr
	mov.l	.L06022024,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06021FF8:
	.short 0x00F8
.L06021FFA:
	.short 0x0031
.L06021FFC:
	.short 0x0036
.L06021FFE:
	.short 0x0001
.L06022000:
	.short 0x1980
.L06022002:
	.short 0x1C00
.L06022004:
	.short 0x8000
	.byte 0x00, 0x00
.L06022008:
	.long D_06089348
.L0602200C:
	.long D_060C1F08
.L06022010:
	.long D_06021B8C
.L06022014:
	.long D_06021BCC
.L06022018:
	.long D_06021C0C
.L0602201C:
	.long D_060F3068
.L06022020:
	.long func_06018E8C
.L06022024:
	.long func_060225E0
	endlabel func_06021F80

	glabel func_06022028
	sts.l	pr,@-r15
	mov.l	.L06022060,r3
	mov.l	@r3,r3
	mov.l	.L06022064,r12
	mov.l	.L06022068,r13
	mov.l	.L0602206C,r14
	mov.w	@(6,r3),r0
	and	#112,r0
	cmp/eq	#16,r0
	bt	.L06022042
	mov.l	.L06022070,r12
	mov.l	.L06022074,r13
	mov.l	.L06022078,r14
.L06022042:
	bsr	func_060220A4
	nop
	mov.l	.L0602207C,r4
	mov.l	r1,@r4
	mov.w	.L0602205A,r0
	mov.w	r0,@(28,r1)
	mov.b	@(20,gbr),r0
	cmp/eq	#12,r0
	bt	.L06022080
	mov.w	.L0602205C,r0
	bra	.L06022082
	nop
.L0602205A:
	.short 0x1E40
.L0602205C:
	.short 0x0021
	.byte 0x00, 0x00
.L06022060:
	.long D_060F3064
.L06022064:
	.long D_06021A3C
.L06022068:
	.long D_06021A7C
.L0602206C:
	.long D_06021ABC
.L06022070:
	.long D_06021CDC
.L06022074:
	.long D_06021D1C
.L06022078:
	.long D_06021D5C
.L0602207C:
	.long D_060F306C
.L06022080:
	mov.w	.L0602209C,r0
.L06022082:
	mov.w	r0,@(6,r1)
	mov.b	@(1,r12),r0
	or	#48,r0
	mov.b	r0,@(1,r12)
	mov	#0,r0
	mov.b	r0,@(0,r12)
	mov.w	.L0602209E,r0
	mov.w	r0,@(22,r12)
	lds.l	@r15+,pr
	mov.l	.L060220A0,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L0602209C:
	.short 0x0011
.L0602209E:
	.short 0x0036
.L060220A0:
	.long func_060225E0
	endlabel func_06022028

	glabel func_060220A4
	sts.l	pr,@-r15
	mov.l	r12,@(8,r1)
	mov.l	r13,@(12,r1)
	mov.l	r14,@(16,r1)
	mov	r12,r2
	mov	#-128,r0
	extu.b	r0,r0
	add	r0,r2
	mov	#0,r0
	mov	#32,r7
.L060220B8:
	dt	r7
	bf/s	.L060220B8
	mov.l	r0,@-r2
	mov	#0,r0
	mov.l	r0,@(32,r1)
	mov.l	r0,@(36,r1)
	mov.l	r0,@(0,r1)
	mov	#0,r0
	mov.w	r0,@(4,r1)
	mov	#0,r0
	mov.b	r0,@(2,r12)
	mov	#64,r0
	mov.b	r0,@(6,r12)
	mov.l	.L06022104,r0
	mov.l	r0,@(44,r1)
	mov	#0,r0
	mov.b	r0,@(9,r12)
	mov	#0,r0
	mov.b	r0,@(10,r12)
	mov.b	r0,@(11,r12)
	mov	#0,r0
	mov.l	r0,@(32,r12)
	mov.w	r0,@(18,r12)
	mov	#0,r0
	mov.l	r0,@(36,r13)
	mov.l	r0,@(40,r13)
	mov.l	r0,@(32,r13)
	mov.l	r0,@(44,r13)
	mov.l	.L06022108,r0
	mov.l	r0,@(56,r12)
	mov	#34,r0
	mov.b	r0,@(2,r13)
	mov	#-1,r0
	mov.w	r0,@(28,r12)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06022104:
	.long 0x00010000
.L06022108:
	.long 0xFFE00000
	endlabel func_060220A4

	glabel func_0602210C
	mov.l	@(8,r1),r12
	mov.l	@(12,r1),r13
	mov.l	.L06022140,r3
	mov.l	@r3,r3
	mov.l	@(48,r3),r0
	mov.l	r0,@(48,r1)
	mov.l	@(52,r3),r0
	mov.l	r0,@(52,r1)
	mov.l	@(56,r3),r7
	mov.l	r7,@(56,r1)
	mov.w	@(22,r3),r0
	mov.w	r0,@(22,r1)
	mov.w	@(24,r3),r0
	mov.w	r0,@(24,r1)
	mov.w	@(26,r3),r0
	mov.w	r0,@(26,r1)
	mov.l	@(8,r3),r2
	mov.b	@(9,r2),r0
	mov	#-128,r4
	cmp/eq	r4,r0
	bt	.L06022190
	mov.b	@(10,r2),r0
	tst	r0,r0
	bt	.L06022144
	rts
	nop
.L06022140:
	.long D_060F3064
.L06022144:
	mov.b	@(8,r2),r0
	tst	r0,r0
	bt	.L0602214C
	mov.w	.L06022150,r0
.L0602214C:
	bra	func_06022EE8
	nop
.L06022150:
	.short 0x0099
	endlabel func_0602210C

	glabel func_06022152
	mov.l	@(8,r1),r12
	mov.l	@(12,r1),r13
	mov.w	@(22,r12),r0
	mov.w	.L06022184,r2
	cmp/eq	r2,r0
	bt	.L06022190
	mov.l	.L06022188,r3
	mov.l	@r3,r3
	mov.l	@(8,r3),r2
	mov.w	@(22,r2),r0
	mov.w	.L06022186,r4
	cmp/eq	r4,r0
	bf	.L0602218C
	mov.b	@(11,r2),r0
	add	#-1,r0
	cmp/pl	r0
	bf	.L0602218C
	mov.l	@(48,r3),r0
	mov.l	r0,@(48,r1)
	mov.l	@(52,r3),r0
	mov.l	r0,@(52,r1)
	mov.l	@(56,r3),r0
	mov.l	r0,@(56,r1)
	rts
	nop
.L06022184:
	.short 0x0036
.L06022186:
	.short 0x005F
.L06022188:
	.long D_060F3064
.L0602218C:
	bra	func_06022EE8
	nop
.L06022190:
	mov.w	.L060221AA,r0
	mov.w	r0,@(6,r1)
	mov	#1,r0
	mov.b	r0,@(0,r1)
	mov	#30,r2
	add	r1,r2
	mov.b	@r2,r0
	or	#32,r0
	mov.b	r0,@r2
	mov.l	.L060221AC,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L060221AA:
	.short 0x0001
.L060221AC:
	.long .L060222A0
	endlabel func_06022152

	glabel func_060221B0
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L060221BA
	rts
	nop
.L060221BA:
	sts.l	pr,@-r15
	mov.l	.L060221F4,r12
	mov.l	.L060221F8,r13
	mov.l	.L060221FC,r14
	bsr	func_060220A4
	nop
	mov.l	.L06022200,r4
	mov.l	r1,@r4
	mov.w	.L060221EE,r0
	mov.w	r0,@(6,r1)
	mov.w	.L060221F0,r0
	mov.w	r0,@(28,r1)
	mov	#7,r0
	mov.b	r0,@(9,r12)
	mov	#54,r0
	mov.w	r0,@(22,r12)
	mov.w	r0,@(24,r12)
	mov	#0,r0
	mov.b	r0,@(11,r12)
	mov.w	r0,@(26,r12)
	lds.l	@r15+,pr
	mov.l	.L06022204,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	func_06022EE8
	nop
.L060221EE:
	.short 0x0001
.L060221F0:
	.short 0x190E
	.byte 0x00, 0x00
.L060221F4:
	.long D_06021B8C
.L060221F8:
	.long D_06021BCC
.L060221FC:
	.long D_06021C0C
.L06022200:
	.long D_060F3068
.L06022204:
	.long func_06022208
	endlabel func_060221B0

	glabel func_06022208
	mov.l	@(8,r1),r12
	mov.l	@(12,r1),r13
	mov.l	.L0602223C,r3
	mov.l	@r3,r3
	mov.l	@(48,r3),r5
	mov.l	@(56,r3),r7
	mov.l	r5,@(48,r1)
	mov.l	r7,@(56,r1)
	mov.w	@(22,r12),r0
	mov.w	.L0602223A,r2
	cmp/eq	r2,r0
	bt	.L06022244
	mov.w	@(26,r12),r0
	mov	#74,r2
	cmp/ge	r2,r0
	bf	.L0602222C
	mov	#7,r0
	mov.b	r0,@(9,r12)
.L0602222C:
	sts.l	pr,@-r15
	mov.l	.L06022240,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	bra	func_06022EE8
	nop
.L0602223A:
	.short 0x0036
.L0602223C:
	.long D_060F3064
.L06022240:
	.long func_06024BE0
.L06022244:
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bt	.L06022254
	mov.l	.L06022250,r0
	jmp	@r0
	nop
.L06022250:
	.long func_0600D1A0
.L06022254:
	shll2	r0
	mov.l	.L060222B0,r2
	shll	r0
	add	r0,r2
	mov.w	@r2+,r5
	mov.w	@r2+,r6
	mov.w	@r2+,r7
	shll16	r5
	shll16	r6
	shll16	r7
	mov.l	r5,@(48,r1)
	mov.l	r6,@(52,r1)
	mov.l	r7,@(56,r1)
	mov	#0,r0
	mov.w	r0,@(22,r1)
	mov.w	r0,@(24,r1)
	mov.w	r0,@(26,r1)
	mov.l	.L060222B4,r0
	mov.l	r0,@(36,r12)
	mov.l	.L060222B8,r0
	mov.l	r0,@(40,r12)
	mov.b	@(20,gbr),r0
	cmp/eq	#12,r0
	bt	.L06022288
	cmp/eq	#14,r0
	bf	.L0602228C
.L06022288:
	mov.l	.L060222BC,r0
	mov.l	r0,@(40,r12)
.L0602228C:
	mov	#1,r0
	mov.b	r0,@(0,r1)
	mov	#30,r2
	add	r1,r2
	mov.b	@r2,r0
	or	#32,r0
	mov.b	r0,@r2
	mov.l	.L060222C0,r0
	mov.l	r0,@-r1
	add	#4,r1
.L060222A0:
	mov.l	.L060222C4,r3
	mov.l	@r3,r3
	mov.w	@(6,r3),r0
	tst	#112,r0
	bf	.L060222C8
	rts
	nop
	.byte 0x00, 0x00
.L060222B0:
	.long D_0603BF0C
.L060222B4:
	.long 0x00010000
.L060222B8:
	.long func_06022390
.L060222BC:
	.long func_06022592
.L060222C0:
	.long .L060222A0
.L060222C4:
	.long D_060F3064
.L060222C8:
	mov.l	@(8,r1),r12
	mov.l	@(12,r1),r13
	mov.b	@(0,r1),r0
	dt	r0
	mov.b	r0,@(0,r1)
	bf	.L060222EC
	mov	#16,r0
	mov.b	r0,@(0,r1)
	mov	#30,r2
	add	r1,r2
	mov.b	@r2,r0
	xor	#32,r0
	mov.b	r0,@r2
	and	#32,r0
	tst	r0,r0
	bf	.L060222EC
	mov	#1,r0
	mov.b	r0,@(0,r1)
.L060222EC:
	mov.l	@(48,r3),r4
	mov.l	@(56,r3),r5
	mov.l	@(48,r1),r6
	mov.l	@(56,r1),r7
	sub	r6,r4
	sub	r7,r5
	dmuls.l	r4,r4
	sts	mach,r0
	dmuls.l	r5,r5
	sts	mach,r8
	add	r0,r8
	mov.l	.L0602236C,r0
	cmp/ge	r0,r8
	bt	.L0602237C
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r8,@-r15
	mov.l	r3,@-r15
	sts.l	pr,@-r15
	mov	r4,r2
	mov	r5,r3
	mov.l	.L06022370,r0
	jsr	@r0
	nop
	mov.w	r0,@(22,r1)
	lds.l	@r15+,pr
	mov.l	@r15+,r3
	mov.l	@r15+,r8
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	sts.l	pr,@-r15
	mov.l	@(40,r12),r9
	jsr	@r9
	nop
	lds.l	@r15+,pr
	sts.l	pr,@-r15
	mov.l	.L06022374,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	sts.l	pr,@-r15
	mov.l	@(552,gbr),r0
	mov.l	r0,@-r15
	mov.l	@(556,gbr),r0
	mov.l	r0,@-r15
	mov.l	@(560,gbr),r0
	mov.l	r0,@-r15
	mov.l	.L06022378,r0
	mov.l	r0,@(556,gbr)
	mov	#0,r0
	mov.l	r0,@(552,gbr)
	mov.l	r0,@(560,gbr)
	bsr	func_06022EE8
	nop
	mov.l	@r15+,r0
	mov.l	r0,@(560,gbr)
	mov.l	@r15+,r0
	mov.l	r0,@(556,gbr)
	mov.l	@r15+,r0
	mov.l	r0,@(552,gbr)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0602236C:
	.long 0x00027100
.L06022370:
	.long func_06007C1C
.L06022374:
	.long func_06024BE0
.L06022378:
	.long 0x00010000
.L0602237C:
	sts.l	pr,@-r15
	mov.l	.L0602238C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0602238C:
	.long func_06024BE0
	endlabel func_06022208

	glabel func_06022390
	mov.l	.L060223CC,r0
	cmp/ge	r0,r8
	bt	.L060223BE
	mov.l	@(12,gbr),r0
	mov	r0,r2
	rotr	r2
	mov.w	.L060223C2,r0
	cmp/pz	r2
	bf	.L060223A4
	mov.w	.L060223C4,r0
.L060223A4:
	mov.w	r0,@(22,r12)
	mov	#0,r0
	mov.b	r0,@(9,r12)
	mov.l	.L060223D0,r0
	mov.l	r0,@(40,r12)
	mov.l	@(12,gbr),r0
	mov	r0,r2
	rotr	r2
	mov.w	.L060223C6,r0
	cmp/pz	r2
	bf	.L060223BC
	mov.w	.L060223C8,r0
.L060223BC:
	mov.w	r0,@(30,r12)
.L060223BE:
	rts
	nop
.L060223C2:
	.short 0x003A
.L060223C4:
	.short 0x003B
.L060223C6:
	.short 0x0052
.L060223C8:
	.short 0x0053
	.byte 0x00, 0x00
.L060223CC:
	.long 0x00010000
.L060223D0:
	.long func_06022444
	endlabel func_06022390

	glabel func_060223D4
	mov.l	.L060223EC,r0
	cmp/ge	r0,r8
	bf	.L060223F4
	mov.w	.L060223EA,r0
	mov.w	r0,@(22,r12)
	mov	#7,r0
	mov.b	r0,@(9,r12)
	mov.l	.L060223F0,r0
	mov.l	r0,@(40,r12)
	rts
	nop
.L060223EA:
	.short 0x003C
.L060223EC:
	.long 0x00024000
.L060223F0:
	.long func_06022390
.L060223F4:
	mov.l	.L06022410,r0
	cmp/ge	r0,r8
	bt	.L06022434
	mov.l	.L06022414,r4
	mov.b	@(9,r4),r0
	cmp/pz	r0
	bt	.L0602241C
	mov.w	.L0602240E,r0
	mov.w	r0,@(22,r12)
	mov.l	.L06022418,r0
	mov.l	r0,@(40,r12)
	rts
	nop
.L0602240E:
	.short 0x0040
.L06022410:
	.long 0x00010000
.L06022414:
	.long D_060FFE50
.L06022418:
	.long func_06022564
.L0602241C:
	mov.w	.L06022438,r0
	mov.w	r0,@(22,r12)
	mov.l	.L06022440,r0
	mov.l	r0,@(40,r12)
	mov.l	@(12,gbr),r0
	mov	r0,r2
	rotr	r2
	mov.w	.L0602243A,r0
	cmp/pz	r2
	bf	.L06022432
	mov.w	.L0602243C,r0
.L06022432:
	mov.w	r0,@(30,r12)
.L06022434:
	rts
	nop
.L06022438:
	.short 0x0055
.L0602243A:
	.short 0x0052
.L0602243C:
	.short 0x0053
	.byte 0x00, 0x00
.L06022440:
	.long func_06022444
	endlabel func_060223D4

	glabel func_06022444
	mov.l	.L06022460,r0
	cmp/ge	r0,r8
	bf	.L06022468
	mov.w	.L0602245A,r0
	mov.w	r0,@(22,r12)
	mov.w	.L0602245C,r0
	mov.w	r0,@(30,r12)
	mov.l	.L06022464,r0
	mov.l	r0,@(40,r12)
	rts
	nop
.L0602245A:
	.short 0x005D
.L0602245C:
	.short 0x0045
	.byte 0x00, 0x00
.L06022460:
	.long 0x00010000
.L06022464:
	.long func_060223D4
.L06022468:
	mov.l	.L06022484,r0
	cmp/ge	r0,r8
	bt	.L060224A8
	mov.l	.L06022488,r4
	mov.b	@(9,r4),r0
	cmp/pz	r0
	bt	.L06022490
	mov.w	.L06022482,r0
	mov.w	r0,@(30,r12)
	mov.l	.L0602248C,r0
	mov.l	r0,@(40,r12)
	rts
	nop
.L06022482:
	.short 0x0040
.L06022484:
	.long 0x00009000
.L06022488:
	.long D_060FFE50
.L0602248C:
	.long func_06022564
.L06022490:
	mov.w	.L060224AC,r0
	mov.w	r0,@(22,r12)
	mov.l	.L060224B4,r0
	mov.l	r0,@(40,r12)
	mov.l	@(12,gbr),r0
	mov	r0,r2
	rotr	r2
	mov.w	.L060224AE,r0
	cmp/pz	r2
	bf	.L060224A6
	mov.w	.L060224B0,r0
.L060224A6:
	mov.w	r0,@(30,r12)
.L060224A8:
	rts
	nop
.L060224AC:
	.short 0x0043
.L060224AE:
	.short 0x0052
.L060224B0:
	.short 0x0053
	.byte 0x00, 0x00
.L060224B4:
	.long func_060224B8
	endlabel func_06022444

	glabel func_060224B8
	mov.l	.L060224D4,r0
	cmp/ge	r0,r8
	bf	.L060224DC
	mov.w	.L060224CE,r0
	mov.w	r0,@(22,r12)
	mov.w	.L060224D0,r0
	mov.w	r0,@(30,r12)
	mov.l	.L060224D8,r0
	mov.l	r0,@(40,r12)
	rts
	nop
.L060224CE:
	.short 0x005D
.L060224D0:
	.short 0x005B
	.byte 0x00, 0x00
.L060224D4:
	.long 0x00009000
.L060224D8:
	.long func_06022444
.L060224DC:
	mov.l	.L06022500,r0
	cmp/ge	r0,r8
	bt	.L060224F6
	mov.l	@(12,gbr),r0
	mov	r0,r2
	rotr	r2
	mov.w	.L060224FA,r0
	cmp/pz	r2
	bf	.L060224F0
	mov.w	.L060224FC,r0
.L060224F0:
	mov.w	r0,@(22,r12)
	mov.l	.L06022504,r0
	mov.l	r0,@(40,r12)
.L060224F6:
	rts
	nop
.L060224FA:
	.short 0x0052
.L060224FC:
	.short 0x0053
	.byte 0x00, 0x00
.L06022500:
	.long 0x00004000
.L06022504:
	.long func_06022508
	endlabel func_060224B8

	glabel func_06022508
	mov.l	.L06022524,r0
	cmp/ge	r0,r8
	bf	.L0602252C
	mov.w	.L0602251E,r0
	mov.w	r0,@(22,r12)
	mov.w	.L06022520,r0
	mov.w	r0,@(30,r12)
	mov.l	.L06022528,r0
	mov.l	r0,@(40,r12)
	rts
	nop
.L0602251E:
	.short 0x003F
.L06022520:
	.short 0x0059
	.byte 0x00, 0x00
.L06022524:
	.long 0x00004000
.L06022528:
	.long func_060224B8
.L0602252C:
	mov.l	.L06022540,r0
	cmp/ge	r0,r8
	bt	.L0602253A
	mov.w	.L0602253E,r0
	mov.w	r0,@(22,r12)
	mov.l	.L06022544,r0
	mov.l	r0,@(40,r12)
.L0602253A:
	rts
	nop
.L0602253E:
	.short 0x0057
.L06022540:
	.long 0x00001000
.L06022544:
	.long func_06022548
	endlabel func_06022508

	glabel func_06022548
	mov.l	.L0602255C,r0
	cmp/ge	r0,r8
	bf	.L06022556
	mov.w	.L0602255A,r0
	mov.w	r0,@(22,r12)
	mov.l	.L06022560,r0
	mov.l	r0,@(40,r12)
.L06022556:
	rts
	nop
.L0602255A:
	.short 0x0042
.L0602255C:
	.long 0x00001000
.L06022560:
	.long func_06022508
	endlabel func_06022548

	glabel func_06022564
	mov.l	.L06022574,r0
	cmp/ge	r0,r8
	bt	.L0602257C
	mov.l	.L06022578,r0
	mov.l	r0,@(40,r12)
	rts
	nop
	.byte 0x00, 0x00
.L06022574:
	.long 0x00010000
.L06022578:
	.long func_060223D4
.L0602257C:
	mov.l	@(8,r3),r2
	mov.w	@(22,r2),r0
	mov.w	.L0602258E,r2
	cmp/eq	r0,r2
	bf	.L0602258A
	mov.w	.L06022590,r0
	mov.w	r0,@(22,r12)
.L0602258A:
	rts
	nop
.L0602258E:
	.short 0x00AE
.L06022590:
	.short 0x0044
	endlabel func_06022564

	glabel func_06022592
	mov	#0,r0
	mov.b	r0,@(9,r12)
	mov.w	.L060225A2,r0
	mov.w	r0,@(22,r12)
	mov.l	.L060225A4,r0
	mov.l	r0,@(40,r12)
	rts
	nop
.L060225A2:
	.short 0x0045
.L060225A4:
	.long func_060225A8
	endlabel func_06022592

	glabel func_060225A8
	mov.l	.L060225BC,r0
	cmp/ge	r0,r8
	bt	.L060225B6
	mov.w	.L060225BA,r0
	mov.w	r0,@(22,r12)
	mov.l	.L060225C0,r0
	mov.l	r0,@(40,r12)
.L060225B6:
	rts
	nop
.L060225BA:
	.short 0x0057
.L060225BC:
	.long 0x00004000
.L060225C0:
	.long func_060225C4
	endlabel func_060225A8

	glabel func_060225C4
	mov.l	.L060225D8,r0
	cmp/ge	r0,r8
	bf	.L060225D2
	mov.w	.L060225D6,r0
	mov.w	r0,@(22,r12)
	mov.l	.L060225DC,r0
	mov.l	r0,@(40,r12)
.L060225D2:
	rts
	nop
.L060225D6:
	.short 0x0045
.L060225D8:
	.long 0x00009000
.L060225DC:
	.long func_060225A8
	endlabel func_060225C4

	glabel func_060225E0
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L060225EE
	mov.l	@(8,r1),r12
	mov.l	@(12,r1),r13
	bra	func_06022E5C
	nop
.L060225EE:
	mov.b	@(20,gbr),r0
	cmp/eq	#7,r0
	bt	.L060225F8
	bra	.L0602265E
	nop
.L060225F8:
	mov.b	@(30,gbr),r0
	tst	r0,r0
	bt	.L0602265E
	mov.b	@(7,r1),r0
	and	#1,r0
	xor	#1,r0
	sts.l	pr,@-r15
	mov.l	.L0602268C,r14
	jsr	@r14
	mov	#32,r8
	lds.l	@r15+,pr
	cmp/pz	r0
	bf	.L0602265E
	mov.b	@(7,r1),r0
	and	#1,r0
	shll2	r0
	mov.l	.L06022690,r4
	add	r0,r4
	mov.l	@r4,r4
	add	#-4,r4
	mov.l	@r4+,r0
	mov.l	.L06022694,r10
	cmp/eq	r0,r10
	bt	.L0602265E
	mov.l	.L06022698,r10
	cmp/eq	r0,r10
	bt	.L0602265E
	mov.l	.L06022694,r10
	mov.l	r10,@-r4
	mov.b	@(7,r1),r0
	xor	#1,r0
	and	#1,r0
	shll2	r0
	mov.l	.L06022690,r3
	add	r0,r3
	mov.l	@r3,r3
	mov.l	@(8,r3),r12
	mov.l	@(12,r3),r13
	mov.w	.L06022686,r0
	mov.w	r0,@(22,r12)
	mov.w	.L06022688,r0
	mov.w	r0,@(28,r12)
	mov.b	@(1,r12),r0
	or	#48,r0
	mov.b	r0,@(1,r12)
	mov	#0,r0
	mov.w	r0,@(14,r12)
	mov.w	r0,@(16,r12)
	mov.l	r0,@(0,r3)
	mov.l	r0,@(40,r13)
	mov.l	r0,@(44,r13)
.L0602265E:
	mov.l	@(8,r1),r12
	mov.l	@(12,r1),r13
	sts.l	pr,@-r15
	mov.l	.L0602269C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.b	@(1,r12),r0
	and	#32,r0
	tst	r0,r0
	bf	.L060226A0
	sts.l	pr,@-r15
	bsr	func_060226B0
	nop
	lds.l	@r15+,pr
	mov.b	@r12,r2
	mova	.L0602274C,r0
	mov.l	@(r0,r2),r0
	jmp	@r0
	nop
.L06022686:
	.short 0x00EA
.L06022688:
	.short 0x0036
	.byte 0x00, 0x00
.L0602268C:
	.long func_06017D34
.L06022690:
	.long D_060F3064
.L06022694:
	.long func_0602543A
.L06022698:
	.long lbl_0602552A
.L0602269C:
	.long func_06029B78
.L060226A0:
	mov.b	@r12,r2
	mova	.L0602274C,r0
	mov.l	@(r0,r2),r0
	jmp	@r0
	nop
	dlabel D_060226AA
	.byte 0x00
	dlabel D_060226AB
	.byte 0x00, 0x00
	dlabel D_060226AD
	.byte 0x00, 0x00, 0x00
	endlabel func_060225E0

	glabel func_060226B0
	mov.b	@(1,r12),r0
	and	#32,r0
	tst	r0,r0
	bf	.L06022748
	mov.b	@(7,r1),r0
	tst	#1,r0
	bf	.L060226D0
	mov.w	@(76,gbr),r0
	mov.w	r0,@(14,r12)
	mov.w	@(78,gbr),r0
	mov.w	r0,@(16,r12)
	mov.l	.L060226CC,r3
	bra	.L060226DA
	nop
.L060226CC:
	.long D_060D9052
.L060226D0:
	mov.w	@(80,gbr),r0
	mov.w	r0,@(14,r12)
	mov.w	@(82,gbr),r0
	mov.w	r0,@(16,r12)
	mov.l	.L0602270C,r3
.L060226DA:
	mov.l	.L06022710,r4
	mov.b	@(0,r3),r0
	mov.b	r0,@r4
	add	#1,r4
	add	#10,r3
	mov	#4,r2
.L060226E6:
	mov.b	@r3+,r0
	mov.b	r0,@r4
	dt	r2
	bf/s	.L060226E6
	add	#1,r4
	mov.l	.L06022710,r4
	mov.b	@r4+,r0
	cmp/eq	#7,r0
	bt	.L060226FC
	cmp/eq	#5,r0
	bf	.L06022748
.L060226FC:
	mov	#0,r0
	mov.b	@r4+,r2
	extu.b	r2,r2
	mov	#96,r3
	cmp/ge	r3,r2
	bt	.L06022714
	bra	.L0602271C
	mov	#4,r0
.L0602270C:
	.long D_060D9032
.L06022710:
	.long D_060226AA
.L06022714:
	add	#64,r3
	cmp/ge	r3,r2
	bf	.L0602271C
	mov	#8,r0
.L0602271C:
	mov.b	@r4+,r2
	extu.b	r2,r2
	mov	#96,r3
	cmp/ge	r3,r2
	bt	.L0602272A
	bra	.L06022732
	or	#1,r0
.L0602272A:
	add	#64,r3
	cmp/ge	r3,r2
	bf	.L06022732
	or	#2,r0
.L06022732:
	mov	r0,r2
	mov	#-1,r3
	shll2	r3
	shll2	r3
	mov.w	@(14,r12),r0
	and	r3,r0
	or	r2,r0
	mov.w	r0,@(14,r12)
	mov.w	@(16,r12),r0
	and	r3,r0
	mov.w	r0,@(16,r12)
.L06022748:
	rts
	nop
.L0602274C:
	.long func_06022774
	.long func_060227D8
	.long func_060227F0
	.long func_06022774
	.long func_06022988
	.long func_06022D38
	.long func_06022D38
	.long func_06022774
	.long func_06022854
	.long func_06022958
	endlabel func_060226B0

	glabel func_06022774
	sts.l	pr,@-r15
	mov.l	.L06022794,r0
	jsr	@r0
	nop
	mov.l	.L06022798,r0
	jsr	@r0
	nop
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.b	@(5,r12),r0
	tst	r0,r0
	bt	.L0602279C
	dt	r0
	bra	.L060227A6
	mov.b	r0,@(5,r12)
	.byte 0x00, 0x00
.L06022794:
	.long func_060238E4
.L06022798:
	.long func_06024BE0
.L0602279C:
	mov.l	r12,@-r15
	mov.l	.L060227CC,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
.L060227A6:
	mov.b	@(1,r12),r0
	and	#8,r0
	tst	r0,r0
	bf	.L060227B4
	mov.l	.L060227D0,r0
	jsr	@r0
	nop
.L060227B4:
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.b	@(1,r12),r0
	tst	#1,r0
	bt	.L060227C4
	mov.l	.L060227D4,r0
	jsr	@r0
	nop
.L060227C4:
	lds.l	@r15+,pr
	bra	func_06022E5C
	nop
	.byte 0x00, 0x00
.L060227CC:
	.long func_060268F8
.L060227D0:
	.long func_06018E8C
.L060227D4:
	.long func_06024F28
	endlabel func_06022774

	glabel func_060227D8
	sts.l	pr,@-r15
	bsr	func_06022F48
	nop
	mov.l	.L060227EC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	bra	func_06022EE8
	nop
	.byte 0x00, 0x00
.L060227EC:
	.long func_06024BE0
	endlabel func_060227D8

	glabel func_060227F0
	sts.l	pr,@-r15
	mov.l	.L06022810,r0
	jsr	@r0
	nop
	mov.l	.L06022814,r0
	jsr	@r0
	nop
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.b	@(5,r12),r0
	tst	r0,r0
	bt	.L06022818
	dt	r0
	bra	.L06022822
	mov.b	r0,@(5,r12)
	.byte 0x00, 0x00
.L06022810:
	.long func_060239DC
.L06022814:
	.long func_06024BE0
.L06022818:
	mov.l	r12,@-r15
	mov.l	.L06022848,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
.L06022822:
	mov.b	@(1,r12),r0
	and	#8,r0
	tst	r0,r0
	bf	.L06022830
	mov.l	.L0602284C,r0
	jsr	@r0
	nop
.L06022830:
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.b	@(1,r12),r0
	tst	#1,r0
	bt	.L06022840
	mov.l	.L06022850,r0
	jsr	@r0
	nop
.L06022840:
	lds.l	@r15+,pr
	bra	func_06022E5C
	nop
	.byte 0x00, 0x00
.L06022848:
	.long func_060268F8
.L0602284C:
	.long func_06018E8C
.L06022850:
	.long func_06024F28
	endlabel func_060227F0

	glabel func_06022854
	sts.l	pr,@-r15
	bsr	func_06022890
	nop
	mov.l	.L06022884,r0
	jsr	@r0
	nop
	mov.b	@(1,r12),r0
	and	#8,r0
	tst	r0,r0
	bf	.L0602287C
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06022888,r0
	jsr	@r0
	nop
	mov.l	.L0602288C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
.L0602287C:
	lds.l	@r15+,pr
	bra	func_06022E5C
	nop
	.byte 0x00, 0x00
.L06022884:
	.long func_060238E4
.L06022888:
	.long func_060268F8
.L0602288C:
	.long func_06018E8C
	endlabel func_06022854

	glabel func_06022890
	mov.b	@(7,r1),r0
	xor	#1,r0
	and	#1,r0
	shll2	r0
	mov.l	.L060228B4,r3
	add	r0,r3
	mov.l	@r3,r3
	mov	#0,r6
	mov.l	@(52,r1),r4
	mov.l	@(52,r3),r5
	sub	r4,r5
	swap.w	r5,r5
	exts.w	r5,r5
	mov	#-64,r0
	cmp/ge	r0,r5
	bt	.L060228B8
	bra	.L060228C0
	mov	#1,r6
.L060228B4:
	.long D_060F3064
.L060228B8:
	mov	#64,r0
	cmp/ge	r0,r5
	bf	.L060228C0
	mov	#2,r6
.L060228C0:
	sts.l	pr,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r6,@-r15
	mov.l	.L060228E8,r0
	jsr	@r0
	nop
	mov.l	@r15+,r6
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	lds.l	@r15+,pr
	mov	r0,r5
	swap.w	r5,r5
	exts.w	r5,r5
	mov	#-64,r0
	cmp/ge	r0,r5
	bt	.L060228EC
	mov	#4,r0
	bra	.L060228F6
	or	r0,r6
.L060228E8:
	.long func_06018D60
.L060228EC:
	mov	#64,r0
	cmp/ge	r0,r5
	bf	.L060228F6
	mov	#8,r0
	or	r0,r6
.L060228F6:
	mov.w	.L06022914,r0
	cmp/gt	r0,r5
	bt	.L0602291A
	mov.w	@(26,r1),r0
	mov.w	.L06022916,r8
	add	r8,r0
	exts.w	r0,r0
	cmp/pz	r0
	bt	.L0602290A
	neg	r0,r0
.L0602290A:
	mov.w	.L06022918,r8
	cmp/gt	r8,r0
	bt	.L06022938
	bra	.L06022934
	nop
.L06022914:
	.short 0xFF40
.L06022916:
	.short 0xC000
.L06022918:
	.short 0x2000
.L0602291A:
	mov.w	.L06022952,r0
	cmp/ge	r0,r5
	bf	.L06022938
	mov.w	@(26,r1),r0
	mov.w	.L06022954,r8
	add	r8,r0
	exts.w	r0,r0
	cmp/pz	r0
	bt	.L0602292E
	neg	r0,r0
.L0602292E:
	mov.w	.L06022956,r8
	cmp/gt	r8,r0
	bt	.L06022938
.L06022934:
	mov	#32,r0
	or	r0,r6
.L06022938:
	mov	#0,r0
	mov	r0,r8
	mov	r6,r0
	mov.w	r0,@(14,r12)
	xor	r0,r8
	mov	r8,r0
	and	#112,r0
	mov.w	r0,@(16,r12)
	mov.b	@(1,r12),r0
	or	#32,r0
	mov.b	r0,@(1,r12)
	rts
	nop
.L06022952:
	.short 0x00C0
.L06022954:
	.short 0x4000
.L06022956:
	.short 0x2000
	endlabel func_06022890

	glabel func_06022958
	sts.l	pr,@-r15
	mov.l	.L06022980,r0
	jsr	@r0
	nop
	bsr	func_060238E4
	nop
	mov.b	@(1,r12),r0
	and	#8,r0
	tst	r0,r0
	bf	.L0602297A
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06022984,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
.L0602297A:
	lds.l	@r15+,pr
	bra	func_06022E5C
	nop
.L06022980:
	.long D_060C2864
.L06022984:
	.long func_06018E8C
	endlabel func_06022958

	glabel func_06022988
	sts.l	pr,@-r15
	mov.l	.L060229A0,r0
	jsr	@r0
	nop
	mov.b	@(2,r12),r0
	tst	r0,r0
	bf	.L060229AC
	mov.w	@(16,r12),r0
	tst	#112,r0
	bf	.L060229A4
	bra	.L06022AF4
	nop
.L060229A0:
	.long func_06024BE0
.L060229A4:
	and	#112,r0
	mov.b	r0,@(2,r12)
.L060229A8:
	bra	.L06022AFC
	nop
.L060229AC:
	mov	r0,r3
	mov.w	@(14,r12),r0
	and	r3,r0
	tst	r0,r0
	bf	.L060229A8
	mov.b	@(7,r1),r0
	tst	#1,r0
	bt	.L060229CA
	mov.b	@(20,gbr),r0
	cmp/eq	#15,r0
	bt	.L060229C6
	cmp/eq	#13,r0
	bf	.L060229CA
.L060229C6:
	bra	.L060229CC
	mov	#32,r0
.L060229CA:
	mov	#0,r0
.L060229CC:
	mov.b	r0,@(0,r12)
	mov	#10,r0
	mov.b	r0,@(5,r12)
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	bsr	func_06022C16
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@(48,r12),r2
	mov	#8,r5
	tst	r5,r2
	bt	.L06022A30
	mov.w	.L06022A22,r0
	mov.w	r0,@(22,r12)
	mov.w	.L06022A24,r0
	mov.w	r0,@(28,r12)
	mov.b	@(1,r12),r0
	or	#32,r0
	mov.b	r0,@(1,r12)
	mov	#0,r0
	mov.w	r0,@(14,r12)
	mov.w	r0,@(16,r12)
	mov.l	r0,@(0,r1)
	mov.l	r0,@(40,r13)
	mov	#2,r0
	shll16	r0
	mov.l	r0,@(44,r13)
	mov	#64,r0
	add	r1,r0
	mov	#120,r5
	mov.b	r5,@r0
	mov.w	@(18,r12),r0
	mov.w	r0,@(26,r1)
	mov.l	.L06022A28,r4
	and	r4,r0
	mov.w	r0,@(4,r1)
	mov.w	r0,@(8,r13)
	mov.l	.L06022A2C,r4
	add	r4,r0
	mov.w	r0,@(10,r13)
	bra	.L06022A76
	nop
.L06022A22:
	.short 0x0054
.L06022A24:
	.short 0x0036
	.byte 0x00, 0x00
.L06022A28:
	.long 0xFFFFFC00
.L06022A2C:
	.long 0x00008000
.L06022A30:
	mov	#1,r0
	mov.b	r0,@(9,r12)
	mov	#51,r0
	mov.w	r0,@(22,r12)
	mov.w	r0,@(30,r12)
	mov.l	.L06022A9C,r2
	mov.l	.L06022AA0,r0
	jsr	@r0
	nop
	mov	#30,r0
	mov.b	r0,@(7,r12)
	mov	#-15,r0
	mov.b	r0,@(2,r12)
	mov.l	r8,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov	#24,r10
	mov.l	.L06022AA4,r0
	jsr	@r0
	mov	r1,r9
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r8
	mov.l	@(48,r12),r2
	mov.w	@(18,r12),r0
	cmp/pz	r2
	bt	.L06022A6A
	mov.l	.L06022AA8,r4
	add	r4,r0
.L06022A6A:
	mov.w	r0,@(26,r1)
	mov.l	.L06022AAC,r4
	and	r4,r0
	mov.w	r0,@(4,r1)
	mov.w	r0,@(10,r13)
	mov.w	r0,@(8,r13)
.L06022A76:
	mov	#0,r0
	mov.l	r0,@(32,r1)
	mov.l	r0,@(36,r1)
	mov.l	.L06022AB0,r0
	jsr	@r0
	nop
	mov.l	@(32,r12),r3
	mov	#30,r2
	add	r3,r2
	mov.b	@r2,r0
	and	#6,r0
	tst	r0,r0
	bt	.L06022ACC
	mov.l	@(48,r12),r2
	cmp/pz	r2
	bt	.L06022AB4
	bra	.L06022AC0
	nop
	.byte 0x00, 0x00
.L06022A9C:
	.long 0x00060000
.L06022AA0:
	.long func_0602448C
.L06022AA4:
	.long func_06041A70
.L06022AA8:
	.long 0x00008000
.L06022AAC:
	.long 0xFFFFFC00
.L06022AB0:
	.long func_06024606
.L06022AB4:
	mov.l	@(32,r1),r0
	shal	r0
	mov.l	r0,@(32,r3)
	mov.l	@(36,r1),r0
	shal	r0
	mov.l	r0,@(36,r3)
.L06022AC0:
	mov	#30,r2
	add	r3,r2
	mov.b	@r2,r0
	or	#4,r0
	and	#253,r0
	mov.b	r0,@r2
.L06022ACC:
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#8,r6
	mov	#1,r4
	mov.w	@(6,r1),r0
	and	#112,r0
	cmp/eq	#48,r0
	bf	.L06022AE2
	mov	#2,r5
	mov	#1,r6
	mov	#3,r4
.L06022AE2:
	mov.l	.L06022AF0,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	lds.l	@r15+,pr
	bra	func_06022E1C
	nop
.L06022AF0:
	.long func_0600E4C4
.L06022AF4:
	mov	#2,r4
	mov	#4,r5
	bra	.L06022B02
	shll8	r5
.L06022AFC:
	mov	#1,r4
	mov	#2,r5
	shll8	r5
.L06022B02:
	mov.l	@(48,r12),r2
	mov.l	.L06022B7C,r0
	tst	r0,r2
	bf	.L06022B84
	mov	r2,r0
	tst	#1,r0
	bt	.L06022B16
	mov	#3,r4
	mov	#6,r5
	shll8	r5
.L06022B16:
	mov.l	@(32,r12),r3
	mov.w	@(22,r1),r0
	cmp/pz	r0
	bt	.L06022B20
	neg	r5,r5
.L06022B20:
	mov.w	@(22,r12),r0
	cmp/eq	#0,r0
	bt	.L06022B28
	neg	r5,r5
.L06022B28:
	mov.w	@(18,r12),r0
	sub	r5,r0
	mov.w	r0,@(18,r12)
	mov	#30,r2
	add	r3,r2
	mov.b	@r2,r0
	and	#6,r0
	tst	r0,r0
	bt	.L06022B40
	mov.w	@(26,r3),r0
	add	r5,r0
	mov.w	r0,@(26,r3)
.L06022B40:
	mov.w	@(22,r12),r0
	cmp/eq	#0,r0
	bt	.L06022B4A
	cmp/eq	#1,r0
	bf	.L06022BB8
.L06022B4A:
	mov.b	@(1,r13),r0
	add	r4,r0
	mov.b	r0,@(1,r13)
	mov	r0,r4
	shlr	r0
	and	#63,r0
	mov.w	r0,@(26,r12)
	mov	#127,r2
	cmp/ge	r2,r4
	bt	.L06022BB8
	mov	#30,r2
	add	r3,r2
	mov.b	@r2,r0
	and	#6,r0
	tst	r0,r0
	bt	.L06022BB8
	mov.l	.L06022B80,r0
	jsr	@r0
	nop
	mov	#64,r4
	add	r1,r4
	mov	#60,r0
	mov.b	r0,@r4
	bra	.L06022BA8
	nop
.L06022B7C:
	.long 0x80000000
.L06022B80:
	.long func_06024826
.L06022B84:
	mov.l	@(32,r12),r3
	mov	#30,r2
	add	r3,r2
	mov.b	@r2,r0
	and	#6,r0
	tst	r0,r0
	bt	.L06022BB8
	mov.l	@(60,r3),r0
	shlr16	r0
	mov.w	r0,@(24,r13)
	mov.l	@(52,r3),r0
	shlr16	r0
	mov.w	r0,@(28,r13)
	mov	#31,r0
	mov.b	@(r0,r3),r0
	mov.b	r0,@(3,r13)
	mov.w	@(24,r3),r0
	mov.w	r0,@(24,r1)
.L06022BA8:
	mov.l	.L06022BB4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	bra	func_06022E1C
	nop
.L06022BB4:
	.long func_06022C9C
.L06022BB8:
	mov.w	@(18,r12),r0
	mov.w	r0,@(26,r1)
	mov.l	.L06022BF4,r4
	and	r4,r0
	mov.w	r0,@(4,r1)
	mov.w	r0,@(10,r13)
	mov.w	r0,@(8,r13)
	mov	#54,r0
	mov.w	r0,@(22,r12)
	mov.l	.L06022BF8,r2
	mov.l	.L06022BFC,r0
	jsr	@r0
	nop
	mov.l	@(32,r12),r3
	mov	#30,r2
	add	r3,r2
	mov.b	@r2,r0
	and	#253,r0
	mov.b	r0,@r2
	mov.b	@(7,r1),r0
	tst	#1,r0
	bt	.L06022C00
	mov.b	@(20,gbr),r0
	cmp/eq	#15,r0
	bt	.L06022BEE
	cmp/eq	#13,r0
	bf	.L06022C00
.L06022BEE:
	bra	.L06022C02
	mov	#32,r0
	.byte 0x00, 0x00
.L06022BF4:
	.long 0xFFFFFC00
.L06022BF8:
	.long 0x00020000
.L06022BFC:
	.long func_0602448C
.L06022C00:
	mov	#0,r0
.L06022C02:
	mov.b	r0,@(0,r12)
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	bsr	func_06022C16
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	lds.l	@r15+,pr
	bra	func_06022E1C
	nop
	endlabel func_06022988

	glabel func_06022C16
	sts.l	pr,@-r15
	mov.l	@(48,r1),r4
	mov.l	@(56,r1),r5
	mov.w	@(26,r13),r0
	shll16	r0
	mov	r0,r2
	mov.w	@(30,r13),r0
	shll16	r0
	mov	r0,r3
	sub	r4,r2
	sub	r5,r3
	dmuls.l	r2,r2
	sts	mach,r4
	sts	macl,r0
	xtrct	r4,r0
	dmuls.l	r3,r3
	sts	mach,r4
	sts	macl,r5
	xtrct	r4,r5
	add	r5,r0
	mov.l	r0,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06022C8C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov	r0,r2
	mov.w	@(24,r1),r0
	add	r0,r2
	mov.l	.L06022C90,r3
	add	r3,r2
	extu.w	r2,r2
	add	r3,r3
	mov.l	@r15+,r0
	mov.l	.L06022C94,r8
	jsr	@r8
	nop
	shll8	r0
	cmp/ge	r3,r2
	bt	.L06022C6C
	neg	r0,r0
.L06022C6C:
	mov	r0,r3
	mov.w	@(24,r13),r0
	shll16	r0
	add	r0,r3
	mov.l	r3,@(60,r1)
	mov.b	@(3,r13),r0
	mov	r0,r2
	mov	#31,r0
	mov.b	r2,@(r0,r1)
	mov.l	.L06022C98,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06022C8C:
	.long func_06007C1C
.L06022C90:
	.long 0x00004000
.L06022C94:
	.long func_06007CF0
.L06022C98:
	.long func_06018E8C
	endlabel func_06022C16

	glabel func_06022C9C
	sts.l	pr,@-r15
	mov.w	@(18,r12),r0
	mov.w	r0,@(26,r1)
	mov.l	.L06022D30,r14
	jsr	@r14
	nop
	shll2	r10
	shll2	r11
	mov.w	@(20,r12),r0
	add	#-32,r0
	mov	r0,r4
	shll16	r4
	dmuls.l	r10,r4
	sts	mach,r0
	sts	macl,r7
	xtrct	r0,r7
	dmuls.l	r11,r4
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	mov	#0,r9
	mov.w	@(24,r1),r0
	neg	r0,r0
	mov	#0,r0
	mov.l	.L06022D30,r14
	jsr	@r14
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r9
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	sub	r4,r3
	dmuls.l	r11,r9
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	add	r4,r9
	mov	r3,r7
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r8,@-r15
	mov.l	r3,@-r15
	mov.w	@(24,r13),r0
	shll16	r0
	mov	r0,r3
	add	r7,r3
	mov.b	@(3,r13),r0
	mov.l	.L06022D34,r10
	jsr	@r10
	nop
	mov.l	@r15+,r3
	mov.l	@r15+,r8
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.w	@(28,r13),r0
	shll16	r0
	mov	r0,r5
	add	r8,r5
	mov.l	r6,@(36,r12)
	mov.l	r5,@(40,r12)
	mov.l	r7,@(44,r12)
	lds.l	@r15+,pr
	rts
	nop
.L06022D30:
	.long func_06007BD8
.L06022D34:
	.long func_06018EB4
	endlabel func_06022C9C

	glabel func_06022D38
	sts.l	pr,@-r15
	mov.l	.L06022D68,r4
	mov.b	@(1,r12),r0
	and	#32,r0
	tst	r0,r0
	bf	.L06022D6C
	mov.b	@r4,r0
	cmp/eq	#7,r0
	bf	.L06022D6C
	add	#3,r4
	mov.b	@r4+,r2
	extu.b	r2,r2
	mov	#-1,r3
	extu.b	r3,r3
	cmp/ge	r3,r2
	bf	.L06022D82
	mov.b	@r4,r2
	extu.b	r2,r2
	mov	#-1,r3
	extu.b	r3,r3
	cmp/ge	r3,r2
	bf	.L06022D82
	bra	.L06022D74
	nop
.L06022D68:
	.long D_060226AA
.L06022D6C:
	mov.b	@(14,r12),r0
	and	#24,r0
	cmp/eq	#24,r0
	bf	.L06022D82
.L06022D74:
	mov.l	@(44,r13),r5
	mov.l	.L06022D9C,r4
	clrt
	subc	r4,r5
	bf	.L06022DA4
	mov.l	.L06022DA0,r5
	mov.l	r5,@(44,r13)
.L06022D82:
	mov.w	@(26,r1),r0
	mov.w	r0,@(4,r1)
	mov.w	r0,@(8,r13)
	mov	#0,r0
	mov.b	r0,@(3,r12)
	mov	#0,r0
	mov.b	r0,@(2,r12)
	mov	#0,r0
	mov.b	r0,@(0,r12)
	mov	#54,r0
	mov.w	r0,@(22,r12)
	bra	.L06022DD0
	nop
.L06022D9C:
	.long 0x00002000
.L06022DA0:
	.long 0x00000000
.L06022DA4:
	mov.l	r5,@(44,r13)
	mov.l	.L06022E08,r3
	cmp/ge	r3,r5
	bt	.L06022DBE
	mov.w	@(22,r12),r0
	cmp/eq	#44,r0
	bf	.L06022DB6
	mov	#41,r0
	mov.w	r0,@(22,r12)
.L06022DB6:
	cmp/eq	#45,r0
	bf	.L06022DBE
	mov	#42,r0
	mov.w	r0,@(22,r12)
.L06022DBE:
	mov.w	@(22,r1),r0
	mov.w	.L06022E06,r2
	tst	r2,r0
	bt	.L06022DD0
	mov	r0,r2
	mov.b	@(13,r12),r0
	shll8	r0
	add	r2,r0
	mov.w	r0,@(22,r1)
.L06022DD0:
	mov.l	.L06022E0C,r0
	jsr	@r0
	nop
	bsr	func_06023954
	nop
	mov.l	.L06022E10,r0
	jsr	@r0
	nop
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r12,@-r15
	mov.l	.L06022E14,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.b	@(1,r12),r0
	and	#8,r0
	tst	r0,r0
	bf	.L06022DFC
	mov.l	.L06022E18,r0
	jsr	@r0
	nop
.L06022DFC:
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	lds.l	@r15+,pr
	bra	func_06022E5C
	nop
.L06022E06:
	.short 0x7FFF
.L06022E08:
	.long 0x00050000
.L06022E0C:
	.long func_06024606
.L06022E10:
	.long func_06024BE0
.L06022E14:
	.long func_060268F8
.L06022E18:
	.long func_06018E8C
	endlabel func_06022D38

	glabel func_06022E1C
	sts.l	pr,@-r15
	mov.l	.L06022E48,r0
	jsr	@r0
	nop
	mov.l	.L06022E4C,r0
	jsr	@r0
	nop
	mov.l	.L06022E50,r0
	jsr	@r0
	nop
	mov.l	.L06022E54,r0
	jsr	@r0
	nop
	mov.b	@(7,r1),r0
	tst	#1,r0
	bf	.L06022E42
	mov.l	.L06022E58,r14
	jsr	@r14
	nop
.L06022E42:
	lds.l	@r15+,pr
	rts
	nop
.L06022E48:
	.long func_06028904
.L06022E4C:
	.long func_060289B0
.L06022E50:
	.long func_06028C94
.L06022E54:
	.long func_06028CC8
.L06022E58:
	.long func_06016818
	endlabel func_06022E1C

	glabel func_06022E5C
	mov.b	@(7,r1),r0
	tst	#1,r0
	bf	.L06022EAC
	sts.l	pr,@-r15
	mov.l	.L06022E94,r0
	jsr	@r0
	nop
	mov.l	.L06022E98,r0
	jsr	@r0
	nop
	mov.l	.L06022E9C,r0
	jsr	@r0
	nop
	mov.l	.L06022EA0,r0
	jsr	@r0
	nop
	mov.l	.L06022EA4,r0
	jsr	@r0
	nop
	mov.b	@(7,r1),r0
	tst	#1,r0
	bf	.L06022E8E
	mov.l	.L06022EA8,r14
	jsr	@r14
	nop
.L06022E8E:
	lds.l	@r15+,pr
	rts
	nop
.L06022E94:
	.long func_06028904
.L06022E98:
	.long func_060289B0
.L06022E9C:
	.long func_06028C94
.L06022EA0:
	.long func_06025E7E
.L06022EA4:
	.long func_06028CC8
.L06022EA8:
	.long func_06016818
.L06022EAC:
	sts.l	pr,@-r15
	mov.l	.L06022ED4,r0
	jsr	@r0
	nop
	mov.l	.L06022ED8,r0
	jsr	@r0
	nop
	mov.l	.L06022EDC,r0
	jsr	@r0
	nop
	mov.l	.L06022EE0,r0
	jsr	@r0
	nop
	mov.l	.L06022EE4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06022ED4:
	.long func_06028904
.L06022ED8:
	.long func_060289B0
.L06022EDC:
	.long func_06028C94
.L06022EE0:
	.long func_06025E7E
.L06022EE4:
	.long func_06028CC8
	endlabel func_06022E5C

	glabel func_06022EE8
	sts.l	pr,@-r15
	mov.l	.L06022EFC,r0
	jsr	@r0
	nop
	mov.l	.L06022F00,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06022EFC:
	.long func_06028904
.L06022F00:
	.long func_06028CC8
	endlabel func_06022EE8

	glabel func_06022F04
	sts.l	pr,@-r15
	mov.l	.L06022F30,r0
	jsr	@r0
	nop
	mov.l	.L06022F34,r0
	jsr	@r0
	nop
	mov.l	.L06022F38,r0
	jsr	@r0
	nop
	mov.l	.L06022F3C,r0
	jsr	@r0
	nop
	mov.l	.L06022F40,r0
	jsr	@r0
	nop
	mov.l	.L06022F44,r14
	jsr	@r14
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06022F30:
	.long func_06028904
.L06022F34:
	.long func_060289B0
.L06022F38:
	.long func_06028C94
.L06022F3C:
	.long func_06026364
.L06022F40:
	.long func_06028CC8
.L06022F44:
	.long func_06016818
	endlabel func_06022F04

	glabel func_06022F48
	sts.l	pr,@-r15
	bsr	func_0602321C
	nop
	mov.b	@(8,r12),r0
	tst	r0,r0
	bt	.L06022F58
	bra	.L0602305C
	nop
.L06022F58:
	bsr	func_060235A6
	nop
	mov.b	@(8,r12),r0
	tst	r0,r0
	bf	.L06023060
	bsr	func_06023372
	nop
	mov.w	@(14,r12),r0
	tst	#15,r0
	bt	.L06022F74
	bsr	func_06023100
	nop
	mov.w	@(4,r1),r0
	mov.w	r0,@(24,r1)
.L06022F74:
	mov.b	@(1,r12),r0
	and	#16,r0
	tst	r0,r0
	bt	.L06022F88
	mov.l	.L06022F84,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06022F84:
	.long .L060230EA
.L06022F88:
	mov.l	.L0602304C,r0
	jsr	@r0
	nop
	mov.w	@(24,r1),r0
	mov.w	.L06023046,r2
	sub	r2,r0
	mov.l	.L06023050,r14
	jsr	@r14
	nop
	neg	r10,r10
	neg	r11,r11
	shll2	r10
	shll2	r11
	mov.w	@(22,r12),r0
	mov	r0,r5
	exts.w	r9,r9
	mov	r9,r0
	mov	#0,r4
	mov	#24,r2
	shll8	r2
	add	r2,r9
	add	r2,r2
	cmp/hi	r9,r2
	bt	.L06022FCA
	mov.w	.L06023048,r3
	cmp/eq	r3,r5
	bt	.L06022FC4
	mov.w	.L0602304A,r3
	cmp/eq	r3,r5
	bf	.L06022FC6
.L06022FC4:
	shar	r0
.L06022FC6:
	shll2	r0
	sub	r0,r4
.L06022FCA:
	dmuls.l	r4,r11
	sts	mach,r0
	sts	macl,r6
	xtrct	r0,r6
	dmuls.l	r4,r10
	sts	mach,r0
	sts	macl,r7
	xtrct	r0,r7
	mov.l	@(40,r13),r4
	mov.w	@(4,r13),r0
	mov	r0,r3
	mov	#16,r2
	shll8	r2
	add	r2,r3
	add	r2,r2
	cmp/hi	r3,r2
	bt	.L06023000
	mov.w	.L06023048,r3
	cmp/eq	r3,r5
	bt	.L06022FF8
	mov.w	.L0602304A,r3
	cmp/eq	r3,r5
	bf	.L06022FFA
.L06022FF8:
	shar	r0
.L06022FFA:
	shll2	r0
	shll	r0
	sub	r0,r4
.L06023000:
	dmuls.l	r4,r10
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	dmuls.l	r4,r11
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	sub	r6,r2
	add	r7,r3
	mov.l	@(44,r1),r5
	dmuls.l	r5,r2
	sts	mach,r8
	sts	macl,r2
	xtrct	r8,r2
	dmuls.l	r5,r3
	sts	mach,r8
	sts	macl,r3
	xtrct	r8,r3
	mov.l	@(48,r1),r6
	mov.l	@(56,r1),r7
	add	r2,r6
	add	r3,r7
	mov.l	r6,@(48,r1)
	mov.l	r7,@(56,r1)
	mov.l	r2,@(32,r1)
	mov.l	r3,@(40,r1)
	mov.l	.L06023054,r0
	jsr	@r0
	nop
	mov.l	.L06023058,r0
	jsr	@r0
	nop
	bra	.L060230EA
	nop
.L06023046:
	.short 0x4000
.L06023048:
	.short 0x00A6
.L0602304A:
	.short 0x00AC
.L0602304C:
	.long func_060265E8
.L06023050:
	.long func_06007BD8
.L06023054:
	.long func_060259F4
.L06023058:
	.long func_060261E8
.L0602305C:
	bsr	func_060236AC
	nop
.L06023060:
	mov.b	@(8,r12),r0
	cmp/pz	r0
	bf	.L06023078
	tst	#8,r0
	bf	.L06023078
	mov.w	@(14,r12),r0
	tst	#15,r0
	bt	.L06023078
	bsr	func_06023100
	nop
	mov.w	@(4,r1),r0
	mov.w	r0,@(24,r1)
.L06023078:
	mov.b	@(1,r12),r0
	and	#16,r0
	tst	r0,r0
	bf	.L060230EA
	mov.w	@(24,r1),r0
	mov.w	.L060230F0,r2
	sub	r2,r0
	mov.l	.L060230F4,r14
	jsr	@r14
	nop
	mov.l	@(40,r13),r4
	neg	r10,r10
	neg	r11,r11
	shll2	r10
	shll2	r11
	dmuls.l	r4,r10
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	dmuls.l	r4,r11
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	mov.l	@(44,r1),r5
	dmuls.l	r5,r2
	sts	mach,r8
	sts	macl,r2
	xtrct	r8,r2
	dmuls.l	r5,r3
	sts	mach,r8
	sts	macl,r3
	xtrct	r8,r3
	mov.l	@(48,r1),r6
	mov.l	@(56,r1),r7
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	add	r2,r6
	add	r3,r7
	mov.l	r6,@(48,r1)
	mov.l	r7,@(56,r1)
	mov.l	r2,@(32,r1)
	mov.l	r3,@(40,r1)
	mov.l	@(52,r1),r4
	mov.l	@(36,r1),r0
	add	r0,r4
	mov.w	.L060230F2,r2
	add	r2,r0
	mov.l	r0,@(36,r1)
	mov.l	r4,@(52,r1)
	mov.l	.L060230F8,r0
	jsr	@r0
	nop
	mov.l	.L060230FC,r0
	jsr	@r0
	nop
	mov.l	@r15+,r6
	mov.l	@r15+,r7
.L060230EA:
	lds.l	@r15+,pr
	rts
	nop
.L060230F0:
	.short 0x4000
.L060230F2:
	.short 0x3800
.L060230F4:
	.long func_06007BD8
.L060230F8:
	.long func_060259F4
.L060230FC:
	.long func_060261E8
	endlabel func_06022F48

	glabel func_06023100
	mov.b	@(1,r12),r0
	and	#32,r0
	tst	r0,r0
	bf	.L06023158
	mov.l	.L0602314C,r4
	mov.b	@r4+,r0
	cmp/eq	#7,r0
	bt	.L06023114
	cmp/eq	#5,r0
	bf	.L06023158
.L06023114:
	sts.l	pr,@-r15
	mov	#-128,r5
	mov.b	@r4+,r2
	extu.b	r2,r2
	add	r5,r2
	shll8	r2
	mov.b	@r4,r3
	extu.b	r3,r3
	add	r5,r3
	shll8	r3
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06023150,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov	r0,r2
	mov.l	.L06023154,r0
	mov.l	@r0,r0
	mov.w	@(24,r0),r0
	add	r0,r2
	mov	r2,r0
	mov.w	r0,@(4,r1)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0602314C:
	.long D_060226AA
.L06023150:
	.long func_06007C1C
.L06023154:
	.long D_060F309C
.L06023158:
	mov.w	@(14,r12),r0
	and	#15,r0
	tst	r0,r0
	bt	.L060231E6
	mov.l	.L060231EC,r5
	add	r0,r5
	mov.b	@r5,r2
	mov	r2,r5
	shll8	r2
	shll2	r2
	shll2	r2
	shll	r2
	mov.l	.L060231F0,r0
	mov.l	@r0,r0
	mov.w	@(24,r0),r0
	add	r0,r2
	extu.w	r2,r2
	mov.w	@(4,r1),r0
	mov	#16,r3
	shll8	r3
	add	r3,r0
	shlr8	r0
	shlr2	r0
	shlr2	r0
	shlr	r0
	mov	r0,r3
	mov	r5,r0
	sub	r3,r0
	and	#7,r0
	mov.l	.L060231F4,r4
	add	r0,r0
	add	r0,r4
	mov.w	@r4,r4
	mov.l	@(40,r13),r0
	mov.l	.L060231F8,r5
	sub	r5,r0
	neg	r0,r0
	shlr2	r0
	shlr2	r0
	shlr2	r0
	add	r0,r4
	mov.w	@(4,r1),r0
	extu.w	r0,r0
	cmp/eq	r2,r0
	bt	.L060231E2
	mov	r2,r3
	sub	r0,r3
	extu.w	r3,r3
	mov	#64,r5
	shll8	r5
	shll	r5
	cmp/ge	r5,r3
	bf	.L060231C8
	cmp/eq	r5,r3
	bf	.L060231C6
.L060231C6:
	neg	r4,r4
.L060231C8:
	mov	r0,r3
	add	r4,r0
	mov	r0,r4
	sub	r2,r3
	cmp/pz	r3
	movt	r3
	sub	r2,r4
	cmp/pz	r4
	movt	r4
	add	r4,r3
	dt	r3
	bf	.L060231E2
	mov	r2,r0
.L060231E2:
	extu.w	r0,r0
	mov.w	r0,@(4,r1)
.L060231E6:
	rts
	nop
	.byte 0x00, 0x00
.L060231EC:
	.long D_060231FC
.L060231F0:
	.long D_060F309C
.L060231F4:
	.long D_0602320C
.L060231F8:
	.long 0x00030000
	dlabel D_060231FC
	.byte 0x00, 0x06, 0x02, 0x00, 0x04, 0x05, 0x03, 0x00, 0x00, 0x07, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_0602320C
	.byte 0x01, 0x00, 0x02, 0x00, 0x04, 0x00, 0x06, 0x00, 0x08, 0x00, 0x06, 0x00, 0x04, 0x00, 0x02, 0x00
	endlabel func_06023100

	glabel func_0602321C
	mov.w	@(28,r12),r0
	cmp/pz	r0
	bt	.L060232D0
	mov.b	@(8,r12),r0
	cmp/pz	r0
	bf	.L060232D0
	mov.b	@(1,r12),r0
	and	#32,r0
	tst	r0,r0
	bf	.L0602323C
	mov.l	.L06023284,r4
	mov.b	@r4+,r0
	cmp/eq	#7,r0
	bt	.L060232D8
	cmp/eq	#5,r0
	bt	.L060232D8
.L0602323C:
	mov.l	@(40,r13),r5
	mov.b	@(8,r12),r0
	tst	r0,r0
	bf	.L06023264
	mov.w	@(4,r13),r0
	mov	r0,r3
	mov	#16,r2
	shll8	r2
	add	r2,r3
	add	r2,r2
	cmp/hi	r3,r2
	bt	.L06023264
	shlr2	r0
	shlr2	r0
	exts.w	r0,r0
	sub	r0,r5
	mov.l	.L06023288,r6
	cmp/ge	r6,r5
	bt	.L06023264
	mov.l	r5,@(40,r13)
.L06023264:
	mov.w	@(14,r12),r0
	tst	#15,r0
	bt	.L060232BC
	mov.w	@(6,r13),r0
	cmp/eq	#2,r0
	bt	.L060232A4
	mov.l	.L0602328C,r6
	cmp/ge	r6,r5
	bf	.L06023290
	mov.l	.L06023288,r6
	cmp/ge	r6,r5
	bt	.L0602329C
	mov.w	.L06023282,r6
	bra	.L0602329C
	add	r6,r5
.L06023282:
	.short 0x0100
.L06023284:
	.long D_060226AA
.L06023288:
	.long 0x00030000
.L0602328C:
	.long 0x00020000
.L06023290:
	mov.w	.L060232A2,r6
	add	r6,r5
	mov.b	@(8,r12),r0
	tst	r0,r0
	bt	.L0602329C
	add	r6,r5
.L0602329C:
	mov.l	r5,@(40,r13)
	rts
	nop
.L060232A2:
	.short 0x0800
.L060232A4:
	mov.w	.L060232B6,r6
	add	r6,r5
	mov.l	.L060232B8,r6
	cmp/ge	r6,r5
	bf	.L060232B0
	mov	r6,r5
.L060232B0:
	mov.l	r5,@(40,r13)
	rts
	nop
.L060232B6:
	.short 0x0400
.L060232B8:
	.long 0x00010000
.L060232BC:
	tst	r5,r5
	bt	.L060232D0
	mov.w	.L060232D4,r6
	sub	r6,r5
	cmp/pl	r5
	bt	.L060232CE
	mov.w	.L060232D6,r0
	mov.w	r0,@(22,r12)
	mov	#0,r5
.L060232CE:
	mov.l	r5,@(40,r13)
.L060232D0:
	rts
	nop
.L060232D4:
	.short 0x1000
.L060232D6:
	.short 0x009E
.L060232D8:
	mov.w	@(14,r12),r0
	tst	#15,r0
	bt	.L06023358
	mov	#-128,r5
	mov.b	@r4+,r2
	extu.b	r2,r2
	add	r5,r2
	shll8	r2
	mov.b	@r4,r3
	extu.b	r3,r3
	add	r5,r3
	shll8	r3
	muls.w	r2,r2
	sts	macl,r0
	muls.w	r3,r3
	sts	macl,r3
	add	r3,r0
	cmp/pl	r0
	bt	.L06023302
	mov	#-1,r0
	shlr	r0
.L06023302:
	sts.l	pr,@-r15
	mov.l	.L06023338,r8
	jsr	@r8
	nop
	lds.l	@r15+,pr
	shll2	r0
	mov	r0,r5
	mov.w	@(6,r13),r0
	cmp/eq	#2,r0
	bt	.L06023344
	mov.l	.L0602333C,r6
	cmp/ge	r6,r5
	bf	.L06023330
	mov.l	@(40,r13),r6
	mov.l	.L0602333C,r5
	cmp/ge	r5,r6
	bf	.L06023330
	mov	r6,r5
	mov.l	.L06023340,r6
	cmp/ge	r6,r5
	bt	.L06023330
	mov.w	.L06023336,r6
	add	r6,r5
.L06023330:
	mov.l	r5,@(40,r13)
.L06023332:
	rts
	nop
.L06023336:
	.short 0x0100
.L06023338:
	.long func_06007CF0
.L0602333C:
	.long 0x00020000
.L06023340:
	.long 0x00030000
.L06023344:
	mov.l	.L06023354,r6
	cmp/ge	r6,r5
	bf	.L0602334C
	mov	r6,r5
.L0602334C:
	mov.l	r5,@(40,r13)
	rts
	nop
	.byte 0x00, 0x00
.L06023354:
	.long 0x00010000
.L06023358:
	mov.l	@(40,r13),r5
	tst	r5,r5
	bt	.L06023332
	mov.b	@(8,r12),r0
	tst	r0,r0
	bf	.L06023368
	mov.w	.L06023370,r0
	mov.w	r0,@(22,r12)
.L06023368:
	mov	#0,r5
	mov.l	r5,@(40,r13)
	rts
	nop
.L06023370:
	.short 0x009E
	endlabel func_0602321C

	glabel func_06023372
	mov.w	@(28,r12),r0
	cmp/pz	r0
	bt	.L0602337E
	mov.l	@(40,r13),r5
	tst	r5,r5
	bf	.L06023382
.L0602337E:
	rts
	nop
.L06023382:
	mov.w	@(4,r13),r0
	mov	r0,r3
	mov	#16,r2
	shll8	r2
	add	r2,r3
	add	r2,r2
	cmp/hi	r3,r2
	bt	.L06023396
	shll	r0
	sub	r0,r5
.L06023396:
	mov.w	@(22,r12),r0
	mov.w	.L0602347C,r2
	cmp/eq	r2,r0
	bt	.L06023404
	mov.w	.L0602347E,r2
	cmp/eq	r2,r0
	bt	.L06023404
	mov.w	.L06023480,r2
	cmp/eq	r2,r0
	bt	.L06023404
	mov.w	.L06023482,r2
	cmp/eq	r2,r0
	bt	.L06023404
	cmp/eq	#115,r0
	bt	.L06023404
	cmp/eq	#116,r0
	bt	.L06023404
	cmp/eq	#117,r0
	bt	.L06023404
	cmp/eq	#118,r0
	bt	.L06023404
	cmp/eq	#119,r0
	bt	.L06023404
	cmp/eq	#120,r0
	bt	.L06023404
	cmp/eq	#122,r0
	bt	.L06023404
	cmp/eq	#123,r0
	bt	.L06023404
	cmp/eq	#124,r0
	bt	.L06023404
	cmp/eq	#125,r0
	bt	.L06023404
	cmp/eq	#126,r0
	bt	.L06023404
	mov.w	.L06023484,r3
	cmp/eq	r3,r0
	bt	.L06023404
	mov.w	.L06023486,r2
	cmp/eq	r2,r0
	bt	.L060234A2
	mov.w	@(6,r1),r0
	shlr8	r0
	mov.w	.L0602347E,r2
	cmp/eq	#1,r0
	bf	.L060233F4
	mov	#115,r2
.L060233F4:
	mov.w	@(6,r13),r0
	cmp/eq	#2,r0
	bf	.L060233FC
	mov.w	.L0602347C,r2
.L060233FC:
	mov	r2,r0
	mov.w	r0,@(22,r12)
	mov	#0,r0
	mov.l	r0,@(52,r12)
.L06023404:
	mov.w	.L06023488,r2
	mov.l	.L06023490,r3
	cmp/ge	r3,r5
	bf	.L0602340E
	mov.w	.L0602348A,r2
.L0602340E:
	dmuls.l	r2,r5
	sts	macl,r2
	shlr16	r2
	mov.w	@(26,r12),r0
	mov	r0,r3
	mov.l	@(52,r12),r0
	add	r2,r0
	extu.w	r0,r0
	mov.l	r0,@(52,r12)
	mov	#60,r2
	dmuls.l	r2,r0
	sts	macl,r0
	shlr16	r0
	mov.w	r0,@(26,r12)
	sub	r3,r0
	cmp/pl	r0
	bt	.L06023432
	add	#60,r0
.L06023432:
	mov	r0,r3
	mov.l	.L06023494,r7
	mov.l	.L06023490,r2
	cmp/ge	r2,r5
	bf	.L0602343E
	mov.l	.L06023498,r7
.L0602343E:
	mov.b	@(6,r1),r0
	cmp/eq	#1,r0
	bt	.L06023448
	mov.l	.L0602349C,r0
	add	r0,r7
.L06023448:
	mov.w	@(4,r13),r0
	mov.w	.L0602348C,r2
	add	r2,r0
	shlr8	r0
	shlr2	r0
	and	#62,r0
	mov.w	@(r0,r7),r7
	mov.w	@(6,r13),r0
	cmp/eq	#2,r0
	bf	.L0602345E
	mov.w	.L0602347C,r7
.L0602345E:
	mov.w	@(22,r12),r0
	cmp/eq	r0,r7
	bt	.L060234A2
	mov	r7,r0
	mov.w	r0,@(22,r12)
	mov	#-1,r0
	mov.w	r0,@(24,r12)
	mov.w	@(26,r12),r0
	shll2	r3
	add	r3,r0
	mov	#60,r2
.L06023474:
	cmp/ge	r2,r0
	bf	.L060234A0
	bra	.L06023474
	sub	r2,r0
.L0602347C:
	.short 0x008C
.L0602347E:
	.short 0x00BB
.L06023480:
	.short 0x00BC
.L06023482:
	.short 0x00BD
.L06023484:
	.short 0x007F
.L06023486:
	.short 0x0103
.L06023488:
	.short 0x03C3
.L0602348A:
	.short 0x01E1
.L0602348C:
	.short 0x03FF
	.byte 0x00, 0x00
.L06023490:
	.long 0x00024000
.L06023494:
	.long D_060234A6
.L06023498:
	.long D_060234E6
.L0602349C:
	.long 0x00000080
.L060234A0:
	mov.w	r0,@(26,r12)
.L060234A2:
	rts
	nop
	dlabel D_060234A6
	.byte 0x00, 0x73, 0x00, 0x74, 0x00, 0x74, 0x00, 0x75, 0x00, 0x75, 0x00, 0x78, 0x00, 0x78, 0x00, 0x78
	.byte 0x00, 0x75, 0x00, 0x75, 0x00, 0x75, 0x00, 0x75, 0x00, 0x75, 0x00, 0x75, 0x00, 0x75, 0x00, 0x75
	.byte 0x00, 0x77, 0x00, 0x77, 0x00, 0x77, 0x00, 0x77, 0x00, 0x77, 0x00, 0x77, 0x00, 0x77, 0x00, 0x77
	.byte 0x00, 0x77, 0x00, 0x79, 0x00, 0x79, 0x00, 0x79, 0x00, 0x77, 0x00, 0x77, 0x00, 0x76, 0x00, 0x76
	dlabel D_060234E6
	.byte 0x00, 0x7A, 0x00, 0x7C, 0x00, 0x7C, 0x00, 0x7D, 0x00, 0x7D, 0x00, 0x78, 0x00, 0x78, 0x00, 0x78
	.byte 0x00, 0x7D, 0x00, 0x7D, 0x00, 0x7D, 0x00, 0x7D, 0x00, 0x7D, 0x00, 0x7D, 0x00, 0x7D, 0x00, 0x7D
	.byte 0x00, 0x7F, 0x00, 0x7F, 0x00, 0x7F, 0x00, 0x7F, 0x00, 0x7F, 0x00, 0x7F, 0x00, 0x7F, 0x00, 0x7F
	.byte 0x00, 0x7F, 0x00, 0x79, 0x00, 0x79, 0x00, 0x79, 0x00, 0x7F, 0x00, 0x7F, 0x00, 0x7E, 0x00, 0x7E
	.byte 0x00, 0xBB, 0x00, 0x74, 0x00, 0x74, 0x00, 0x75, 0x00, 0x75, 0x00, 0xBC, 0x00, 0xBC, 0x00, 0xBC
	.byte 0x00, 0x75, 0x00, 0x75, 0x00, 0x75, 0x00, 0x75, 0x00, 0x75, 0x00, 0x75, 0x00, 0x75, 0x00, 0x75
	.byte 0x00, 0x77, 0x00, 0x77, 0x00, 0x77, 0x00, 0x77, 0x00, 0x77, 0x00, 0x77, 0x00, 0x77, 0x00, 0x77
	.byte 0x00, 0x77, 0x00, 0x79, 0x00, 0x79, 0x00, 0x79, 0x00, 0x77, 0x00, 0x77, 0x00, 0x76, 0x00, 0x76
	.byte 0x00, 0xBD, 0x00, 0x7C, 0x00, 0x7C, 0x00, 0x7D, 0x00, 0x7D, 0x00, 0x78, 0x00, 0x78, 0x00, 0x78
	.byte 0x00, 0x7D, 0x00, 0x7D, 0x00, 0x7D, 0x00, 0x7D, 0x00, 0x7D, 0x00, 0x7D, 0x00, 0x7D, 0x00, 0x7D
	.byte 0x00, 0x7F, 0x00, 0x7F, 0x00, 0x7F, 0x00, 0x7F, 0x00, 0x7F, 0x00, 0x7F, 0x00, 0x7F, 0x00, 0x7F
	.byte 0x00, 0x7F, 0x00, 0x79, 0x00, 0x79, 0x00, 0x79, 0x00, 0x7F, 0x00, 0x7F, 0x00, 0x7E, 0x00, 0x7E
	endlabel func_06023372

	glabel func_060235A6
	mov.w	@(16,r12),r0
	tst	#112,r0
	bt	.L060235EE
	mov	#1,r0
	mov.b	r0,@(8,r12)
	mov	#30,r2
	add	r1,r2
	mov.b	@r2,r0
	and	#247,r0
	mov.b	r0,@r2
	mov.b	@(20,gbr),r0
	cmp/eq	#8,r0
	bt	.L060235FC
	mov.l	.L060235F4,r0
	mov.l	r0,@(36,r1)
	mov.w	.L060235F2,r0
	mov.w	r0,@(22,r12)
	mov	#0,r0
	mov.b	r0,@(2,r12)
	mov	#4,r0
	mov.b	r0,@(6,r12)
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#4,r6
	mov.l	.L060235F8,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L060235EE:
	rts
	nop
.L060235F2:
	.short 0x0081
.L060235F4:
	.long 0xFFF90000
.L060235F8:
	.long func_0600E4C4
.L060235FC:
	mov	#5,r0
	mov.b	r0,@(8,r12)
	mov.l	.L06023650,r0
	mov.l	r0,@(36,r1)
	mov.l	@(52,r1),r4
	add	r0,r4
	mov.l	r4,@(52,r1)
	mov.l	@(40,r13),r0
	mov	r0,r2
	shlr2	r2
	add	r2,r0
	mov.l	r0,@(40,r13)
	mov.w	.L0602364C,r0
	mov.w	r0,@(22,r12)
	mov	#0,r0
	mov.b	r0,@(2,r12)
	mov	#4,r0
	mov.b	r0,@(6,r12)
	mov.b	@(6,r1),r0
	cmp/eq	#1,r0
	bt	.L06023658
	cmp/eq	#2,r0
	bt	.L06023680
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#4,r6
	mov.l	.L06023654,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	rts
	nop
.L0602364C:
	.short 0x0092
	.byte 0x00, 0x00
.L06023650:
	.long 0xFFF70000
.L06023654:
	.long func_0600E4C4
.L06023658:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#2,r5
	mov	#0,r6
	mov.l	.L0602367C,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	rts
	nop
	.byte 0x00, 0x00
.L0602367C:
	.long func_0600E4C4
.L06023680:
	mov.w	.L060236A6,r0
	mov.w	r0,@(22,r12)
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#2,r5
	mov	#0,r6
	mov.l	.L060236A8,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	rts
	nop
.L060236A6:
	.short 0x00BF
.L060236A8:
	.long func_0600E4C4
	endlabel func_060235A6

	glabel func_060236AC
	mov.b	@(8,r12),r0
	cmp/pl	r0
	bf	.L060236D0
	mov.l	.L060236CC,r2
	mov.l	@(36,r1),r0
	cmp/pz	r0
	bt	.L060236D8
	cmp/ge	r2,r0
	bt	.L060236C6
	mov.w	@(14,r12),r0
	tst	#112,r0
	bf	.L060236C6
	mov.l	r2,@(36,r1)
.L060236C6:
	rts
	nop
	.byte 0x00, 0x00
.L060236CC:
	.long 0xFFFC8000
.L060236D0:
	mov	#0,r0
	mov.b	r0,@(2,r12)
	rts
	nop
.L060236D8:
	mov.b	@(2,r12),r0
	tst	r0,r0
	bf	.L060236FE
	mov.w	@(16,r12),r0
	tst	#112,r0
	bt	.L060236C6
	and	#112,r0
	mov	r0,r2
	mov.b	@(8,r12),r0
	and	#143,r0
	or	r2,r0
	mov.b	r0,@(8,r12)
	mov	#18,r2
	mov.b	@(8,r12),r0
	tst	#4,r0
	bt	.L060236FA
	mov	#18,r2
.L060236FA:
	mov	r2,r0
	mov.b	r0,@(2,r12)
.L060236FE:
	add	#-1,r0
	mov.b	r0,@(2,r12)
	mov.b	@(8,r12),r0
	and	#112,r0
	mov	r0,r2
	mov.w	@(14,r12),r0
	tst	r2,r0
	bf	.L060236C6
	mov	#0,r0
	mov.b	r0,@(2,r12)
	rts
	nop
	endlabel func_060236AC

	glabel func_06023716
	mov	#30,r2
	add	r1,r2
	mov.b	@r2,r0
	and	#247,r0
	mov.b	r0,@r2
	mov.b	@(8,r12),r0
	tst	#4,r0
	bf	.L06023804
.L06023726:
	mov	#5,r0
	mov.b	r0,@(8,r12)
	mov.l	.L06023778,r0
	mov.l	r0,@(36,r1)
	mov.l	@(52,r1),r4
	add	r0,r4
	mov.l	r4,@(52,r1)
	mov.l	@(40,r13),r0
	mov	r0,r2
	shlr2	r2
	add	r2,r0
	mov.l	r0,@(40,r13)
	mov.w	.L06023776,r0
	mov.w	r0,@(22,r12)
	mov	#0,r0
	mov.b	r0,@(2,r12)
	mov	#4,r0
	mov.b	r0,@(6,r12)
	mov.b	@(6,r1),r0
	cmp/eq	#1,r0
	bt	.L06023780
	cmp/eq	#2,r0
	bt	.L060237A8
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#4,r6
	mov.l	.L0602377C,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	rts
	nop
.L06023776:
	.short 0x0092
.L06023778:
	.long 0xFFF70000
.L0602377C:
	.long func_0600E4C4
.L06023780:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#2,r5
	mov	#0,r6
	mov.l	.L060237A4,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	rts
	nop
	.byte 0x00, 0x00
.L060237A4:
	.long func_0600E4C4
.L060237A8:
	mov.w	.L060237D4,r0
	mov.w	r0,@(22,r12)
	mov.b	@(20,gbr),r0
	cmp/eq	#12,r0
	bt	.L060237DC
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#2,r5
	mov	#0,r6
	mov.l	.L060237D8,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	rts
	nop
.L060237D4:
	.short 0x00BF
	.byte 0x00, 0x00
.L060237D8:
	.long func_0600E4C4
.L060237DC:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#3,r5
	mov	#25,r6
	mov.l	.L06023800,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	rts
	nop
	.byte 0x00, 0x00
.L06023800:
	.long func_0600E4C4
.L06023804:
	mov	#9,r2
	mov.b	@(2,r12),r0
	cmp/ge	r2,r0
	bf	.L06023726
	mov	#13,r0
	mov.b	r0,@(8,r12)
	mov.l	.L06023860,r0
	mov.l	r0,@(36,r1)
	mov.l	@(52,r1),r4
	add	r0,r4
	mov.l	r4,@(52,r1)
	mov.l	@(40,r13),r0
	mov	r0,r2
	shlr	r2
	add	r2,r0
	mov.l	r0,@(40,r13)
	mov.w	.L0602385C,r0
	mov.w	r0,@(22,r12)
	mov	#0,r0
	mov.b	r0,@(2,r12)
	mov	#4,r0
	mov.b	r0,@(6,r12)
	mov.b	@(6,r1),r0
	cmp/eq	#1,r0
	bt	.L06023868
	cmp/eq	#2,r0
	bt	.L06023890
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#4,r6
	mov.l	.L06023864,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	rts
	nop
.L0602385C:
	.short 0x0093
	.byte 0x00, 0x00
.L06023860:
	.long 0xFFF40000
.L06023864:
	.long func_0600E4C4
.L06023868:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#2,r5
	mov	#1,r6
	mov.l	.L0602388C,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	rts
	nop
	.byte 0x00, 0x00
.L0602388C:
	.long func_0600E4C4
.L06023890:
	mov.b	@(20,gbr),r0
	cmp/eq	#12,r0
	bt	.L060238BC
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#2,r5
	mov	#1,r6
	mov.l	.L060238B8,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	rts
	nop
.L060238B8:
	.long func_0600E4C4
.L060238BC:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#3,r5
	mov	#8,r6
	mov.l	.L060238E0,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	rts
	nop
	.byte 0x00, 0x00
.L060238E0:
	.long func_0600E4C4
	endlabel func_06023716

	glabel func_060238E4
	sts.l	pr,@-r15
	bsr	func_06024172
	nop
	lds.l	@r15+,pr
	sts.l	pr,@-r15
	mov.b	@(1,r12),r0
	tst	#1,r0
	bf	.L0602393A
	tst	#8,r0
	bf	.L06023912
	bsr	func_06024606
	nop
	bsr	func_06023A8A
	nop
	bsr	func_060248A2
	nop
	bsr	func_06024826
	nop
	bsr	func_06024530
	nop
	lds.l	@r15+,pr
	bra	func_06023954
	nop
.L06023912:
	mov.b	@(1,r12),r0
	tst	#64,r0
	bt	.L06023920
	bsr	func_06023CA4
	nop
	bsr	func_06023DD8
	nop
.L06023920:
	bsr	func_06024606
	nop
	bsr	func_06023A8A
	nop
	bsr	func_060248A2
	nop
	bsr	func_06024826
	nop
	bsr	func_06024530
	nop
	lds.l	@r15+,pr
	bra	func_06023954
	nop
.L0602393A:
	bsr	func_060240F8
	nop
	bsr	func_06024606
	nop
	bsr	func_06023A8A
	nop
	bsr	func_060248A2
	nop
	bsr	func_06024826
	nop
	bsr	func_06024530
	nop
	lds.l	@r15+,pr
	endlabel func_060238E4

	glabel func_06023954
	sts.l	pr,@-r15
	mov.b	@(1,r12),r0
	tst	#16,r0
	bf	.L06023982
	tst	#8,r0
	bf	.L06023988
	mov.l	@(44,r1),r5
	mov.l	@(32,r1),r0
	dmuls.l	r5,r0
	sts	mach,r2
	sts	macl,r0
	xtrct	r2,r0
	mov.l	@(60,r1),r3
	add	r0,r3
	mov.l	r3,@(60,r1)
	mov.l	@(36,r1),r0
	dmuls.l	r5,r0
	sts	mach,r2
	sts	macl,r0
	xtrct	r2,r0
	mov.l	@(52,r1),r4
	add	r0,r4
	mov.l	r4,@(52,r1)
.L06023982:
	lds.l	@r15+,pr
	rts
	nop
.L06023988:
	mov.w	@(24,r1),r0
	mov	#64,r2
	shll8	r2
	add	r2,r0
	mov.l	.L060239D8,r3
	jsr	@r3
	nop
	mov.l	@(44,r1),r5
	mov.l	@(32,r1),r4
	dmuls.l	r5,r4
	sts	mach,r2
	sts	macl,r4
	xtrct	r2,r4
	shll2	r10
	shll2	r11
	dmuls.l	r4,r10
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	dmuls.l	r4,r11
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	mov.l	@(48,r1),r4
	add	r2,r4
	mov.l	r4,@(48,r1)
	mov.l	@(56,r1),r4
	add	r3,r4
	mov.l	r4,@(56,r1)
	mov.l	@(36,r1),r0
	dmuls.l	r5,r0
	sts	mach,r2
	sts	macl,r0
	xtrct	r2,r0
	mov.l	@(52,r1),r4
	add	r0,r4
	mov.l	r4,@(52,r1)
	lds.l	@r15+,pr
	rts
	nop
.L060239D8:
	.long func_06007BD8
	endlabel func_06023954

	glabel func_060239DC
	sts.l	pr,@-r15
	bsr	func_06024172
	nop
	lds.l	@r15+,pr
	sts.l	pr,@-r15
	mov	#58,r8
	add	r13,r8
	mov.b	@r8,r0
	tst	r0,r0
	bt	.L060239F6
	dt	r0
	bf/s	.L06023A84
	mov.b	r0,@r8
.L060239F6:
	add	#1,r8
	mov.w	.L06023A12,r2
	mov.b	@r8,r0
	tst	r0,r0
	bt	.L06023A18
	mov.l	@(36,r1),r0
	sub	r2,r0
	mov.l	r0,@(36,r1)
	mov.l	.L06023A14,r2
	mov.l	@(36,r1),r0
	cmp/gt	r2,r0
	bt	.L06023A40
	bra	.L06023A26
	nop
.L06023A12:
	.short 0x1800
.L06023A14:
	.long 0x00038000
.L06023A18:
	mov.l	@(36,r1),r0
	add	r2,r0
	mov.l	r0,@(36,r1)
	mov.l	.L06023A7C,r2
	mov.l	@(36,r1),r0
	cmp/ge	r2,r0
	bf	.L06023A40
.L06023A26:
	mov.b	@(9,r12),r0
	and	#127,r0
	cmp/eq	#0,r0
	bt	.L06023A3C
	sts.l	pr,@-r15
	mov	#0,r0
	mov	#8,r8
	mov.l	.L06023A80,r3
	jsr	@r3
	nop
	lds.l	@r15+,pr
.L06023A3C:
	bsr	func_06023A8A
	nop
.L06023A40:
	mov.w	.L06023A78,r2
	mov.l	@(32,r1),r3
	mov.w	@(14,r12),r0
	tst	#12,r0
	bt	.L06023A58
	tst	#4,r0
	bt	.L06023A50
	sub	r2,r3
.L06023A50:
	tst	#8,r0
	bt	.L06023A56
	add	r2,r3
.L06023A56:
	mov.l	r3,@(32,r1)
.L06023A58:
	bsr	func_060248A2
	nop
	bsr	func_06024826
	nop
	bsr	func_06024530
	nop
	mov.b	@(2,r12),r0
	tst	r0,r0
	bt	.L06023A72
	mov	#0,r0
	mov.l	r0,@(56,r13)
	mov	#0,r0
	mov.b	r0,@(0,r12)
.L06023A72:
	lds.l	@r15+,pr
	bra	func_06023954
	nop
.L06023A78:
	.short 0x1000
	.byte 0x00, 0x00
.L06023A7C:
	.long 0xFFFC8000
.L06023A80:
	.long func_0602B090
.L06023A84:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_060239DC

	glabel func_06023A8A
	mov.w	@(22,r12),r0
	mov.w	.L06023AB4,r2
	cmp/eq	r2,r0
	bt	.L06023AB0
	mov.w	.L06023AB6,r2
	cmp/eq	r2,r0
	bt	.L06023AB0
	mov.w	.L06023AB8,r2
	cmp/eq	r2,r0
	bt	.L06023AB0
	mov.w	.L06023ABA,r2
	cmp/ge	r2,r0
	bf	.L06023AAA
	mov.w	.L06023ABC,r2
	cmp/gt	r2,r0
	bf	.L06023AB0
.L06023AAA:
	mov.b	@(3,r12),r0
	tst	r0,r0
	bt	.L06023ABE
.L06023AB0:
	rts
	nop
.L06023AB4:
	.short 0x006D
.L06023AB6:
	.short 0x00F5
.L06023AB8:
	.short 0x00FA
.L06023ABA:
	.short 0x00D4
.L06023ABC:
	.short 0x00DF
.L06023ABE:
	mov.l	@(40,r13),r0
	tst	r0,r0
	bf	.L06023B10
	mov.w	@(26,r1),r0
	mov.w	.L06023AFA,r2
	add	r2,r0
	add	r2,r2
	cmp/hi	r2,r0
	bt	.L06023B10
	mov.w	@(22,r12),r0
	cmp/eq	#78,r0
	bt	.L06023B0C
	cmp/eq	#79,r0
	bt	.L06023B0C
	cmp/eq	#54,r0
	bf	.L06023B10
	mov.w	.L06023AFC,r3
	cmp/eq	r3,r0
	bt	.L06023B10
	mov.w	@(14,r12),r0
	extu.b	r0,r0
	cmp/eq	#4,r0
	bf	.L06023AFE
	mov.w	@(22,r1),r0
	cmp/pz	r0
	bf	.L06023B10
	mov	#78,r0
	mov.w	r0,@(22,r12)
	rts
	nop
.L06023AFA:
	.short 0x0800
.L06023AFC:
	.short 0x00F8
.L06023AFE:
	cmp/eq	#8,r0
	bf	.L06023B10
	mov.w	@(22,r1),r0
	cmp/pz	r0
	bt	.L06023B10
	mov	#79,r0
	mov.w	r0,@(22,r12)
.L06023B0C:
	rts
	nop
.L06023B10:
	mov.w	@(14,r12),r0
	and	#15,r0
	tst	r0,r0
	bf	.L06023B24
	mov.l	.L06023B20,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06023B20:
	.long func_06023C40
.L06023B24:
	mov	r0,r5
	mov.l	.L06023C28,r3
	add	r0,r0
	add	r0,r3
	mov.w	@r3,r2
	extu.w	r2,r2
	mov.w	@(26,r1),r0
	mov	#16,r3
	shll8	r3
	add	r3,r0
	shlr8	r0
	shlr2	r0
	shlr2	r0
	shlr	r0
	mov	r0,r3
	mov.l	.L06023C2C,r0
	add	r5,r0
	mov.b	@r0,r0
	sub	r3,r0
	and	#7,r0
	mov.l	.L06023C30,r4
	add	r0,r0
	add	r0,r4
	mov.w	@r4,r4
	mov.b	@(1,r12),r0
	and	#97,r0
	tst	r0,r0
	bf	.L06023BC8
	mov.l	.L06023C34,r0
	mov.b	@r0,r0
	cmp/eq	#7,r0
	bt	.L06023B68
	cmp/eq	#5,r0
	bf	.L06023BC8
.L06023B68:
	sts.l	pr,@-r15
	mov.l	r8,@-r15
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov	#-128,r5
	mov.l	.L06023C38,r4
	mov.b	@r4+,r2
	extu.b	r2,r2
	add	r5,r2
	shll8	r2
	mov.b	@r4,r3
	extu.b	r3,r3
	add	r5,r3
	shll8	r3
	mov.l	.L06023C3C,r0
	jsr	@r0
	nop
	exts.w	r0,r0
	neg	r0,r0
	mov.w	.L06023C24,r2
	sub	r2,r0
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	mov.l	@r15+,r8
	lds.l	@r15+,pr
	mov.w	.L06023C26,r4
	mov	r0,r2
	extu.w	r2,r2
.L06023BC8:
	mov.b	@(2,r12),r0
	tst	r0,r0
	bt	.L06023BD2
	shlr2	r4
	shlr	r4
.L06023BD2:
	mov.b	@(0,r12),r0
	cmp/eq	#8,r0
	bf	.L06023BDA
	shll	r4
.L06023BDA:
	mov.w	@(22,r1),r0
	mov	r0,r6
	mov.w	@(4,r1),r0
	extu.w	r0,r0
	cmp/eq	r2,r0
	bt	.L06023C1A
	mov	r2,r3
	sub	r0,r3
	extu.w	r3,r3
	mov	#64,r5
	shll8	r5
	shll	r5
	cmp/ge	r5,r3
	bf	.L06023C00
	cmp/eq	r5,r3
	bf	.L06023BFE
	cmp/pz	r6
	bt	.L06023C00
.L06023BFE:
	neg	r4,r4
.L06023C00:
	mov	r0,r3
	add	r4,r0
	mov	r0,r4
	sub	r2,r3
	cmp/pz	r3
	movt	r3
	sub	r2,r4
	cmp/pz	r4
	movt	r4
	add	r4,r3
	dt	r3
	bf	.L06023C1A
	mov	r2,r0
.L06023C1A:
	extu.w	r0,r0
	mov.w	r0,@(4,r1)
	mov.w	r0,@(26,r1)
	rts
	nop
.L06023C24:
	.short 0x4000
.L06023C26:
	.short 0x0400
.L06023C28:
	.long D_06023C64
.L06023C2C:
	.long D_06023C84
.L06023C30:
	.long D_06023C94
.L06023C34:
	.long D_060226AA
.L06023C38:
	.long D_060226AB
.L06023C3C:
	.long func_06007C1C
	endlabel func_06023A8A

	glabel func_06023C40
	mov.b	@(2,r12),r0
	tst	r0,r0
	bf	.L06023C5E
	mov	#0,r2
	mov.l	@(56,r13),r0
	tst	#1,r0
	bt	.L06023C50
	mov.w	.L06023C62,r2
.L06023C50:
	mov	#2,r4
	shll8	r4
	mov.l	@(40,r13),r0
	tst	r0,r0
	bt	.L06023BD2
	mov.w	@(4,r1),r0
	mov.w	r0,@(26,r1)
.L06023C5E:
	rts
	nop
.L06023C62:
	.short 0x8000
	dlabel D_06023C64
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x40, 0x00, 0x20, 0x00, 0x60, 0x00, 0x40, 0x00
	.byte 0xC0, 0x00, 0xE0, 0x00, 0xA0, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_06023C84
	.byte 0x00, 0x00, 0x04, 0x00, 0x02, 0x01, 0x03, 0x00, 0x06, 0x07, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_06023C94
	.byte 0x01, 0x00, 0x02, 0x00, 0x04, 0x00, 0x06, 0x00, 0x08, 0x00, 0x06, 0x00, 0x04, 0x00, 0x02, 0x00
	endlabel func_06023C40

	glabel func_06023CA4
	mov.w	@(14,r12),r0
	and	#15,r0
	tst	r0,r0
	bt	.L06023DA6
	and	#15,r0
	mov	r0,r5
	mov.l	.L06023DB0,r3
	add	r0,r0
	add	r0,r3
	mov.w	@r3,r2
	neg	r2,r2
	mov	#64,r0
	shll8	r0
	sub	r0,r2
	extu.w	r2,r2
	mov.w	@(24,r1),r0
	mov	r0,r3
	mov.b	@(20,gbr),r0
	cmp/eq	#6,r0
	bf	.L06023CD2
	mov	#64,r0
	shll8	r0
	sub	r0,r3
.L06023CD2:
	mov	#16,r0
	shll8	r0
	add	r0,r3
	shlr8	r3
	shlr2	r3
	shlr2	r3
	shlr	r3
	mov.l	.L06023DB4,r0
	add	r5,r0
	mov.b	@r0,r0
	neg	r0,r0
	add	#-2,r0
	sub	r3,r0
	and	#7,r0
	mov.l	.L06023DB8,r4
	add	r0,r0
	add	r0,r4
	mov.w	@r4,r4
	mov.b	@(1,r12),r0
	and	#32,r0
	tst	r0,r0
	bf	.L06023D56
	mov.l	.L06023DBC,r0
	mov.b	@r0,r0
	cmp/eq	#7,r0
	bt	.L06023D0A
	cmp/eq	#5,r0
	bf	.L06023D56
.L06023D0A:
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov	#-128,r5
	mov.l	.L06023DC0,r4
	mov.b	@r4+,r2
	extu.b	r2,r2
	add	r5,r2
	shll8	r2
	mov.b	@r4,r3
	extu.b	r3,r3
	add	r5,r3
	shll8	r3
	mov.l	.L06023DC4,r0
	jsr	@r0
	nop
	exts.w	r0,r0
	neg	r0,r0
	mov.w	.L06023DAA,r2
	sub	r2,r0
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	lds.l	@r15+,pr
	mov.w	.L06023DAC,r4
	mov	r0,r2
	neg	r2,r2
	mov	#64,r0
	shll8	r0
	sub	r0,r2
	extu.w	r2,r2
.L06023D56:
	mov.b	@(20,gbr),r0
	cmp/eq	#6,r0
	bf	.L06023D64
	mov	#64,r0
	shll8	r0
	add	r0,r2
	extu.w	r2,r2
.L06023D64:
	mov.b	@(2,r12),r0
	tst	r0,r0
	bt	.L06023D6E
	shlr2	r4
	shlr	r4
.L06023D6E:
	mov.w	@(24,r1),r0
	extu.w	r0,r0
	cmp/eq	r2,r0
	bt	.L06023DA2
	mov	r2,r3
	sub	r0,r3
	extu.w	r3,r3
	mov	#-128,r5
	shll8	r5
	extu.w	r5,r5
	cmp/ge	r5,r3
	bf	.L06023D88
	neg	r4,r4
.L06023D88:
	mov	r0,r3
	add	r4,r0
	mov	r0,r4
	sub	r2,r3
	cmp/pz	r3
	movt	r3
	sub	r2,r4
	cmp/pz	r4
	movt	r4
	add	r4,r3
	dt	r3
	bf	.L06023DA2
	mov	r2,r0
.L06023DA2:
	extu.w	r0,r0
	mov.w	r0,@(24,r1)
.L06023DA6:
	rts
	nop
.L06023DAA:
	.short 0x4000
.L06023DAC:
	.short 0x0400
	.byte 0x00, 0x00
.L06023DB0:
	.long D_06023C64
.L06023DB4:
	.long D_06023C84
.L06023DB8:
	.long D_06023DC8
.L06023DBC:
	.long D_060226AA
.L06023DC0:
	.long D_060226AB
.L06023DC4:
	.long func_06007C1C
	dlabel D_06023DC8
	.byte 0x01, 0x00, 0x01, 0x80, 0x03, 0x00, 0x04, 0x80
	.long BIOS_WORK_HI + 0x80
	.byte 0x03, 0x00, 0x01, 0x80
	endlabel func_06023CA4

	glabel func_06023DD8
	mov.w	.L06023E14,r5
	mov.b	@(20,gbr),r0
	cmp/eq	#6,r0
	bf	.L06023DE2
	mov.w	.L06023E16,r5
.L06023DE2:
	shll16	r5
	mov	#0,r6
	mov.l	@(52,r1),r4
	sub	r4,r5
	swap.w	r5,r5
	exts.w	r5,r5
	cmp/pz	r5
	bf	.L06023E02
	mov.b	@(2,r12),r0
	tst	r0,r0
	bt	.L06023E02
	mov.w	.L06023E18,r0
	mov.w	r0,@(26,r1)
	mov.w	r0,@(4,r1)
	mov.w	r0,@(10,r13)
	mov.w	r0,@(8,r13)
.L06023E02:
	mov.w	@(14,r12),r0
	mov	r0,r2
	tst	#15,r0
	bt	.L06023E2C
	mov	#-16,r0
	cmp/ge	r0,r5
	bt	.L06023E1A
	bra	.L06023E22
	mov	#1,r6
.L06023E14:
	.short 0x07A0
.L06023E16:
	.short 0x0420
.L06023E18:
	.short 0xC000
.L06023E1A:
	mov	#16,r0
	cmp/ge	r0,r5
	bf	.L06023E22
	mov	#2,r6
.L06023E22:
	mov	#8,r0
	or	r0,r6
	mov	#-16,r0
	and	r2,r0
	or	r6,r0
.L06023E2C:
	mov.w	r0,@(14,r12)
	rts
	nop
	.byte 0x84, 0xC3, 0x20, 0x08, 0x89, 0x01, 0x00, 0x0B, 0x00, 0x09, 0x50, 0xDA, 0x20, 0x08, 0x8B, 0x25
	.byte 0x85, 0x1D, 0x92, 0x18, 0x30, 0x2C, 0x32, 0x2C, 0x30, 0x26, 0x89, 0x1F, 0x85, 0xCB, 0x88, 0x4E
	.byte 0x89, 0x1A, 0x88, 0x4F, 0x89, 0x18, 0x88, 0x36, 0x8B, 0x18, 0x93, 0x0D, 0x30, 0x30, 0x89, 0x15
	.byte 0x85, 0xC7, 0x60, 0x0C, 0x88, 0x04, 0x8B, 0x08, 0x85, 0x1B, 0x40, 0x11, 0x8B, 0x0E, 0xE0, 0x4E
	.byte 0x81, 0xCB, 0x00, 0x0B, 0x00, 0x09, 0x08, 0x00, 0x00, 0xF8, 0x88, 0x08, 0x8B, 0x06, 0x85, 0x1B
	.byte 0x40, 0x11, 0x89, 0x03, 0xE0, 0x4F, 0x81, 0xCB, 0x00, 0x0B, 0x00, 0x09, 0x85, 0xC7, 0xC9, 0x0F
	.byte 0x20, 0x08, 0x8B, 0x04, 0xD0, 0x01, 0x40, 0x2B, 0x00, 0x09
	.long func_06023FB8
	.byte 0xC9, 0x03, 0xCB, 0x08, 0x65, 0x03, 0xD3, 0x3E, 0x30, 0x0C, 0x33, 0x0C, 0x62, 0x31, 0x62, 0x2D
	.byte 0x85, 0x1D, 0xE3, 0x10, 0x43, 0x18, 0x30, 0x3C, 0x40, 0x19, 0x40, 0x09, 0x40, 0x09, 0x40, 0x01
	.byte 0x63, 0x03, 0xD0, 0x38, 0x30, 0x5C, 0x60, 0x00, 0x30, 0x38, 0xC9, 0x07, 0xD4, 0x36, 0x30, 0x0C
	.byte 0x34, 0x0C, 0x64, 0x41, 0x84, 0xC1, 0xC9, 0x60, 0x20, 0x08, 0x8B, 0x35, 0xD0, 0x33, 0x60, 0x00
	.byte 0x88, 0x07, 0x89, 0x01, 0x88, 0x05, 0x8B, 0x2F
	endlabel func_06023DD8

	glabel func_06023EE8
	sts.l	pr,@-r15
	mov.l	r8,@-r15
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov	#-128,r5
	mov.l	.L06023FB0,r4
	mov.b	@r4+,r2
	extu.b	r2,r2
	add	r5,r2
	shll8	r2
	mov.b	@r4,r3
	extu.b	r3,r3
	add	r5,r3
	shll8	r3
	mov.l	.L06023FB4,r0
	jsr	@r0
	nop
	exts.w	r0,r0
	neg	r0,r0
	mov.w	.L06023F9C,r2
	sub	r2,r0
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	mov.l	@r15+,r8
	lds.l	@r15+,pr
	mov.w	.L06023F9E,r4
	mov	r0,r2
	extu.w	r2,r2
	mov.b	@(2,r12),r0
	tst	r0,r0
	bt	.L06023F52
	shlr2	r4
	shlr	r4
.L06023F52:
	mov.w	@(22,r1),r0
	mov	r0,r6
	mov.w	@(4,r1),r0
	extu.w	r0,r0
	cmp/eq	r2,r0
	bt	.L06023F92
	mov	r2,r3
	sub	r0,r3
	extu.w	r3,r3
	mov	#64,r5
	shll8	r5
	shll	r5
	cmp/ge	r5,r3
	bf	.L06023F78
	cmp/eq	r5,r3
	bf	.L06023F76
	cmp/pz	r6
	bt	.L06023F78
.L06023F76:
	neg	r4,r4
.L06023F78:
	mov	r0,r3
	add	r4,r0
	mov	r0,r4
	sub	r2,r3
	cmp/pz	r3
	movt	r3
	sub	r2,r4
	cmp/pz	r4
	movt	r4
	add	r4,r3
	dt	r3
	bf	.L06023F92
	mov	r2,r0
.L06023F92:
	extu.w	r0,r0
	mov.w	r0,@(4,r1)
	mov.w	r0,@(26,r1)
	rts
	nop
.L06023F9C:
	.short 0x4000
.L06023F9E:
	.short 0x0400
	.long D_06023C64
	.long D_06023C84
	.long D_06023C94
	.long D_060226AA
.L06023FB0:
	.long D_060226AB
.L06023FB4:
	.long func_06007C1C
	endlabel func_06023EE8

	glabel func_06023FB8
	mov.b	@(2,r12),r0
	tst	r0,r0
	bf	.L06023FCE
	mov	#0,r2
	mov	#2,r4
	shll8	r4
	mov.l	@(40,r13),r0
	tst	r0,r0
	bt	.L06023F52
	mov.w	@(4,r1),r0
	mov.w	r0,@(26,r1)
.L06023FCE:
	rts
	nop
	.byte 0x85, 0xC7, 0xC9, 0x0F, 0x20, 0x08, 0x89, 0x7E, 0xC9, 0x0C, 0xCB, 0x01, 0x65, 0x03, 0xD3, 0x3F
	.byte 0x30, 0x0C, 0x33, 0x0C, 0x62, 0x31, 0x62, 0x2B, 0xE0, 0x40, 0x40, 0x18, 0x32, 0x08, 0x62, 0x2D
	.byte 0x85, 0x1C, 0x63, 0x03, 0xC4, 0x14, 0x88, 0x06, 0x8B, 0x02, 0xE0, 0x40, 0x40, 0x18, 0x33, 0x08
	.byte 0xE0, 0x10, 0x40, 0x18, 0x33, 0x0C, 0x43, 0x19, 0x43, 0x09, 0x43, 0x09, 0x43, 0x01, 0xD0, 0x34
	.byte 0x30, 0x5C, 0x60, 0x00, 0x60, 0x0B, 0x70, 0xFE, 0x30, 0x38, 0xC9, 0x07, 0xD4, 0x32, 0x30, 0x0C
	.byte 0x34, 0x0C, 0x64, 0x41, 0x84, 0xC1, 0xC9, 0x20, 0x20, 0x08, 0x8B, 0x2C, 0xD0, 0x2F, 0x60, 0x00
	.byte 0x88, 0x07, 0x89, 0x01, 0x88, 0x05, 0x8B, 0x26
	endlabel func_06023FB8

	glabel func_0602403A
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov	#-128,r5
	mov.l	.L060240F0,r4
	mov.b	@r4+,r2
	extu.b	r2,r2
	add	r5,r2
	shll8	r2
	mov.b	@r4,r3
	extu.b	r3,r3
	add	r5,r3
	shll8	r3
	mov	#0,r3
	mov.l	.L060240F4,r0
	jsr	@r0
	nop
	exts.w	r0,r0
	neg	r0,r0
	mov.w	.L060240DC,r2
	sub	r2,r0
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	lds.l	@r15+,pr
	mov.w	.L060240DE,r4
	mov	r0,r2
	neg	r2,r2
	mov	#64,r0
	shll8	r0
	sub	r0,r2
	extu.w	r2,r2
	mov.b	@(20,gbr),r0
	cmp/eq	#6,r0
	bf	.L06024096
	mov	#64,r0
	shll8	r0
	add	r0,r2
	extu.w	r2,r2
.L06024096:
	mov.b	@(2,r12),r0
	tst	r0,r0
	bt	.L060240A0
	shlr2	r4
	shlr	r4
.L060240A0:
	mov.w	@(24,r1),r0
	extu.w	r0,r0
	cmp/eq	r2,r0
	bt	.L060240D4
	mov	r2,r3
	sub	r0,r3
	extu.w	r3,r3
	mov	#-128,r5
	shll8	r5
	extu.w	r5,r5
	cmp/ge	r5,r3
	bf	.L060240BA
	neg	r4,r4
.L060240BA:
	mov	r0,r3
	add	r4,r0
	mov	r0,r4
	sub	r2,r3
	cmp/pz	r3
	movt	r3
	sub	r2,r4
	cmp/pz	r4
	movt	r4
	add	r4,r3
	dt	r3
	bf	.L060240D4
	mov	r2,r0
.L060240D4:
	extu.w	r0,r0
	mov.w	r0,@(24,r1)
	rts
	nop
.L060240DC:
	.short 0x4000
.L060240DE:
	.short 0x0400
	.long D_06023C64
	.long D_06023C84
	.long D_06023DC8
	.long D_060226AA
.L060240F0:
	.long D_060226AB
.L060240F4:
	.long func_06007C1C
	endlabel func_0602403A

	glabel func_060240F8
	mov.b	@(20,gbr),r0
	cmp/eq	#8,r0
	bf	.L0602415C
	mov.l	.L06024144,r2
	mov.l	@(40,r13),r3
	add	r2,r3
	mov.l	.L06024148,r4
	cmp/ge	r4,r3
	bf	.L06024112
	sub	r2,r3
	shlr2	r2
	shlr2	r2
	sub	r2,r3
.L06024112:
	mov.l	r3,@(40,r13)
	mov.w	.L06024140,r5
	shll16	r5
	mov	#0,r6
	mov.l	@(52,r1),r4
	sub	r4,r5
	swap.w	r5,r5
	exts.w	r5,r5
	mov.w	@(14,r12),r0
	mov	r0,r2
	mov	#-8,r0
	cmp/ge	r0,r5
	bt	.L0602414C
	mov.b	@(2,r12),r0
	tst	r0,r0
	bt	.L0602413C
	mov.w	.L06024142,r0
	mov.w	r0,@(26,r1)
	mov.w	r0,@(4,r1)
	mov.w	r0,@(10,r13)
	mov.w	r0,@(8,r13)
.L0602413C:
	bra	.L06024154
	mov	#1,r6
.L06024140:
	.short 0x0348
.L06024142:
	.short 0xC000
.L06024144:
	.long 0x00002000
.L06024148:
	.long 0x00038000
.L0602414C:
	mov	#8,r0
	cmp/ge	r0,r5
	bf	.L06024154
	mov	#2,r6
.L06024154:
	mov	#8,r0
	or	r0,r6
	bra	.L06024166
	nop
.L0602415C:
	mov.w	@(14,r12),r0
	mov	r0,r2
	and	#3,r0
	or	#8,r0
	mov	r0,r6
.L06024166:
	mov	#-16,r0
	and	r2,r0
	or	r6,r0
	mov.w	r0,@(14,r12)
	rts
	nop
	endlabel func_060240F8

	glabel func_06024172
	mov.l	.L0602418C,r2
	mov.b	@(7,r1),r0
	and	#1,r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.b	@(2,r12),r0
	cmp/pz	r0
	bt	.L06024194
	mov.l	.L06024190,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0602418C:
	.long D_060FFE50
.L06024190:
	.long func_060242B0
.L06024194:
	tst	r0,r0
	bf	.L06024238
	mov.b	@(9,r12),r0
	cmp/eq	#-119,r0
	bt	.L0602420E
	mov.b	@(1,r12),r0
	and	#128,r0
	tst	r0,r0
	bf	.L0602420E
	mov.w	@(16,r12),r0
	tst	#112,r0
	bt	.L0602420E
	and	#112,r0
	mov	r0,r3
	mov.w	@(22,r12),r0
	cmp/eq	#51,r0
	bt	.L0602420E
	mov	#30,r0
	mov.b	r0,@(7,r12)
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#5,r6
	mov	#1,r4
	mov.w	@(6,r1),r0
	and	#112,r0
	cmp/eq	#48,r0
	bf	.L060241D0
	mov	#2,r5
	mov	#2,r6
	mov	#3,r4
.L060241D0:
	mov.l	.L060241F8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.b	@(7,r2),r0
	cmp/pl	r0
	bf	.L060241FC
	add	#-1,r0
	mov.b	r0,@(7,r2)
	mov	r3,r0
	or	#1,r0
	mov.b	r0,@(2,r12)
	mov	#1,r0
	mov.b	r0,@(9,r12)
	mov	#51,r0
	mov.w	r0,@(22,r12)
	mov.w	r0,@(30,r12)
	rts
	nop
	.byte 0x00, 0x00
.L060241F8:
	.long func_0600E4C4
.L060241FC:
	mov	r3,r0
	or	#130,r0
	mov.b	r0,@(2,r12)
	mov	#51,r0
	mov.w	r0,@(22,r12)
	mov	#23,r0
	mov.w	r0,@(30,r12)
	rts
	nop
.L0602420E:
	mov.w	@(14,r12),r0
	tst	#15,r0
	bt	.L0602422A
	mov.l	.L06024230,r2
	mov.l	@(40,r13),r3
	add	r2,r3
	mov.l	.L06024234,r4
	cmp/ge	r4,r3
	bf	.L06024228
	sub	r2,r3
	shlr2	r2
	shlr2	r2
	sub	r2,r3
.L06024228:
	mov.l	r3,@(40,r13)
.L0602422A:
	rts
	nop
	.byte 0x00, 0x00
.L06024230:
	.long 0x00002000
.L06024234:
	.long 0x00028000
.L06024238:
	and	#112,r0
	mov	r0,r3
	mov.w	@(14,r12),r0
	and	r3,r0
	tst	r0,r0
	bf	.L060242F0
.L06024244:
	mov	#0,r0
	mov.b	r0,@(2,r12)
	mov.b	r0,@(7,r12)
	mov.l	@(60,r12),r0
	extu.b	r0,r0
	cmp/eq	#3,r0
	bt	.L0602425C
	mov	#0,r0
	mov.b	r0,@(9,r12)
	mov	#23,r0
	bra	.L06024262
	nop
.L0602425C:
	mov	#11,r0
	mov.b	r0,@(9,r12)
	mov	#100,r0
.L06024262:
	mov.w	r0,@(30,r12)
	sts.l	pr,@-r15
	mov.l	.L0602428C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.w	@(6,r1),r0
	and	#112,r0
	cmp/eq	#48,r0
	bf	.L06024294
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	.L06024290,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	rts
	nop
.L0602428C:
	.long func_0602B1C6
.L06024290:
	.long func_0600E4F6
.L06024294:
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	.L060242AC,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	rts
	nop
	.byte 0x00, 0x00
.L060242AC:
	.long func_0600E4F6
	endlabel func_06024172

	glabel func_060242B0
	mov.b	@(2,r12),r0
	tst	#2,r0
	bf	.L060242C0
	sts.l	pr,@-r15
	mov.l	.L060242EC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
.L060242C0:
	mov.b	@(7,r12),r0
	dt	r0
	mov.b	r0,@(7,r12)
	bf	.L06024310
	mov	#30,r0
	mov.b	r0,@(7,r12)
	mov.b	@(2,r12),r0
	tst	#2,r0
	bf	.L06024244
	and	#127,r0
	mov.b	r0,@(2,r12)
	mov.b	@(7,r2),r0
	cmp/pl	r0
	bf	.L06024244
	mov.w	@(22,r12),r0
	mov.w	.L060242E8,r2
	cmp/eq	r2,r0
	bt	.L06024244
	bra	.L06024310
	nop
.L060242E8:
	.short 0x0064
	.byte 0x00, 0x00
.L060242EC:
	.long func_0602B168
.L060242F0:
	sts.l	pr,@-r15
	mov.l	.L06024338,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.b	@(7,r12),r0
	dt	r0
	mov.b	r0,@(7,r12)
	bf	.L06024310
	mov	#30,r0
	mov.b	r0,@(7,r12)
	mov.b	@(7,r2),r0
	cmp/pl	r0
	bf	.L06024244
	add	#-1,r0
	mov.b	r0,@(7,r2)
.L06024310:
	mov.l	.L0602433C,r2
	mov.l	.L06024340,r4
	mov.b	@(2,r12),r0
	tst	#2,r0
	bt	.L0602431E
	mov.l	.L0602433C,r2
	mov.l	.L06024344,r4
.L0602431E:
	mov.l	@(40,r13),r3
	add	r2,r3
	cmp/ge	r4,r3
	bf	.L06024330
	sub	r2,r3
	shlr2	r2
	shlr2	r2
	shlr2	r2
	sub	r2,r3
.L06024330:
	mov.l	r3,@(40,r13)
	rts
	nop
	.byte 0x00, 0x00
.L06024338:
	.long func_0602B168
.L0602433C:
	.long 0x00004000
.L06024340:
	.long 0x00050000
.L06024344:
	.long 0x00038000
	endlabel func_060242B0

	glabel func_06024348
	mov	#-128,r0
	mov.b	r0,@(9,r12)
	mov	#0,r0
	mov.b	r0,@(10,r12)
	mov	#23,r0
	mov.w	r0,@(30,r12)
	endlabel func_06024348

	glabel func_06024354
	mov	#0,r0
	mov.b	r0,@(2,r12)
	mov.b	r0,@(7,r12)
	sts.l	pr,@-r15
	mov.l	.L06024384,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.w	@(6,r1),r0
	and	#112,r0
	cmp/eq	#48,r0
	bf	.L0602438C
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	.L06024388,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	rts
	nop
	.byte 0x00, 0x00
.L06024384:
	.long func_0602B1C6
.L06024388:
	.long func_0600E4F6
.L0602438C:
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	.L060243A4,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	rts
	nop
	.byte 0x00, 0x00
.L060243A4:
	.long func_0600E4F6
	.byte 0x5C, 0x42, 0x5D, 0x43, 0x74, 0xFC, 0x60, 0x46, 0xD3, 0x19, 0x30, 0x30, 0x89, 0x79, 0x84, 0xC0
	.byte 0x88, 0x04, 0x89, 0x76, 0xE0, 0x0B, 0x80, 0xC9, 0xE0, 0x64, 0x81, 0xCB, 0x81, 0xCF, 0x85, 0xCE
	.byte 0x40, 0x11, 0x8B, 0x04, 0xE0, 0xFF, 0x81, 0xCE, 0x84, 0xC1, 0xC9, 0xCF, 0x80, 0xC1, 0xE0, 0x1E
	.byte 0x80, 0xC7, 0xE0, 0xF1, 0x80, 0xC2, 0xE0, 0x00, 0x80, 0xC3
	endlabel func_06024354

	glabel func_060243E2
	sts.l	pr,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	bsr	func_06024F04
	nop
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	lds.l	@r15+,pr
	mov	#0,r0
	mov.b	r0,@(0,r12)
	mov.w	@(26,r1),r0
	mov.w	r0,@(26,r4)
	mov.w	r0,@(4,r4)
	mov.w	r0,@(10,r13)
	mov.w	r0,@(8,r13)
	mov.b	@(0,r12),r0
	cmp/eq	#16,r0
	bf	.L06024412
	mov.l	@(32,r12),r3
	mov	#30,r4
	add	r3,r4
	mov.b	@r4,r0
	and	#253,r0
	mov.b	r0,@r4
.L06024412:
	bra	func_0602448C
	nop
	.byte 0x00, 0x00
	.long func_060258A0
	endlabel func_060243E2

	glabel func_0602441C
	mov.l	@(8,r4),r12
	mov.l	@(12,r4),r13
	add	#-4,r4
	mov.l	@r4+,r0
	mov.l	.L060244B0,r3
	cmp/eq	r3,r0
	bt	.L060244AA
	mov.l	.L060244B4,r3
	cmp/eq	r3,r0
	bt	.L060244BC
	mov.b	@(0,r12),r0
	cmp/eq	#4,r0
	bt	.L060244C8
	mov	#1,r0
	mov.b	r0,@(9,r12)
	mov	#51,r0
	mov.w	r0,@(22,r12)
	mov.w	r0,@(30,r12)
	mov.w	@(28,r12),r0
	cmp/pz	r0
	bf	.L06024450
	mov	#-1,r0
	mov.w	r0,@(28,r12)
	mov.b	@(1,r12),r0
	and	#207,r0
	mov.b	r0,@(1,r12)
.L06024450:
	mov	#30,r0
	mov.b	r0,@(7,r12)
	mov	#-15,r0
	mov.b	r0,@(2,r12)
	mov	#0,r0
	mov.b	r0,@(3,r12)
	sts.l	pr,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	bsr	func_06024F04
	nop
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	lds.l	@r15+,pr
	mov	#0,r0
	mov.b	r0,@(0,r12)
	mov.w	@(26,r1),r0
	mov.w	r0,@(26,r4)
	mov.w	r0,@(4,r4)
	mov.w	r0,@(10,r13)
	mov.w	r0,@(8,r13)
	mov.b	@(0,r12),r0
	cmp/eq	#16,r0
	bf	func_0602448C
	mov.l	@(32,r12),r3
	mov	#30,r4
	add	r3,r4
	mov.b	@r4,r0
	and	#253,r0
	mov.b	r0,@r4
	endlabel func_0602441C

	glabel func_0602448C
	mov.l	@(40,r13),r3
	add	r2,r3
	mov.l	.L060244B8,r4
	cmp/ge	r4,r3
	bf	.L06024498
	mov	r4,r3
.L06024498:
	mov.l	r3,@(40,r13)
	shlr	r2
	mov.l	@(44,r13),r3
	add	r2,r3
	mov.l	r3,@(44,r13)
	mov	#15,r0
	mov.b	r0,@(0,r13)
	mov	#0,r0
	mov.b	r0,@(3,r12)
.L060244AA:
	rts
	nop
	.byte 0x00, 0x00
.L060244B0:
	.long func_060258A0
.L060244B4:
	.long func_060250B6
.L060244B8:
	.long 0x00050000
.L060244BC:
	mov.l	.L060244C4,r0
	mov.l	r0,@(32,r4)
	rts
	nop
.L060244C4:
	.long 0x00180000
.L060244C8:
	mov.w	@(24,r1),r0
	mov.w	r0,@(24,r4)
	mov	r0,r3
	mov.w	@(26,r1),r0
	mov	r0,r3
	cmp/pl	r0
	bf	.L060244D8
	neg	r0,r0
.L060244D8:
	mov.w	r0,@(26,r4)
	mov	r3,r0
	endlabel func_0602448C

	glabel func_060244DC
	sts.l	pr,@-r15
	mov.l	.L0602452C,r10
	jsr	@r10
	nop
	lds.l	@r15+,pr
	neg	r2,r2
	shll2	r2
	shll2	r2
	dmuls.l	r2,r10
	sts	mach,r3
	sts	macl,r0
	xtrct	r3,r0
	mov.l	r0,@(40,r13)
	dmuls.l	r2,r11
	sts	mach,r3
	sts	macl,r0
	xtrct	r3,r0
	mov.l	r0,@(36,r4)
	mov	#-127,r0
	mov.b	r0,@(8,r12)
	mov.w	.L06024528,r0
	mov.w	r0,@(22,r12)
	mov	#0,r0
	mov.w	r0,@(24,r12)
	mov.w	@(28,r12),r0
	cmp/pz	r0
	bf	.L0602451C
	mov	#-1,r0
	mov.w	r0,@(28,r12)
	mov.b	@(1,r12),r0
	and	#207,r0
	mov.b	r0,@(1,r12)
.L0602451C:
	mov	#48,r2
	add	r13,r2
	mov	#3,r0
	mov.b	r0,@r2
	rts
	nop
.L06024528:
	.short 0x008D
	.byte 0x00, 0x00
.L0602452C:
	.long func_06007BD8
	endlabel func_060244DC

	glabel func_06024530
	mov.w	@(28,r12),r0
	cmp/pz	r0
	bt	.L060245B0
	mov.w	@(22,r12),r0
	mov.w	.L060245B4,r3
	cmp/eq	#60,r0
	bt	.L060245C6
	mov.w	.L060245B6,r3
	cmp/eq	#61,r0
	bt	.L060245C6
	mov.w	.L060245B8,r3
	cmp/eq	#54,r0
	bt	.L060245C6
	cmp/eq	#64,r0
	bt	.L060245C6
	cmp/eq	#23,r0
	bt	.L060245DE
	cmp/eq	#24,r0
	bt	.L060245DE
	cmp/eq	#25,r0
	bt	.L060245DE
	cmp/eq	#26,r0
	bt	.L060245DE
	cmp/eq	#27,r0
	bt	.L060245DE
	cmp/eq	#28,r0
	bt	.L060245DE
	cmp/eq	#29,r0
	bt	.L060245DE
	cmp/eq	#30,r0
	bt	.L060245DE
	cmp/eq	#55,r0
	bt	.L060245DE
	cmp/eq	#56,r0
	bt	.L060245DE
	mov.w	.L060245B4,r3
	cmp/eq	r3,r0
	bt	.L060245D2
	mov.w	.L060245B6,r3
	cmp/eq	r3,r0
	bt	.L060245D2
	mov.w	.L060245B8,r3
	cmp/eq	r3,r0
	bt	.L060245D2
	mov.w	.L060245BA,r3
	cmp/eq	r3,r0
	bt	.L060245DE
	mov.w	.L060245BC,r3
	cmp/eq	r3,r0
	bt	.L060245DE
	mov.w	.L060245BE,r3
	cmp/eq	r3,r0
	bt	.L060245DE
	mov.w	.L060245C0,r3
	cmp/eq	r3,r0
	bt	.L06024602
	mov.w	.L060245C2,r3
	cmp/ge	r3,r0
	bf	.L060245B0
	mov.w	.L060245C4,r3
	cmp/gt	r3,r0
	bf	.L06024602
	mov	#0,r0
	mov.b	r0,@(4,r12)
.L060245B0:
	rts
	nop
.L060245B4:
	.short 0x00FB
.L060245B6:
	.short 0x00FC
.L060245B8:
	.short 0x00F8
.L060245BA:
	.short 0x00E7
.L060245BC:
	.short 0x00E8
.L060245BE:
	.short 0x00E9
.L060245C0:
	.short 0x0033
.L060245C2:
	.short 0x00C5
.L060245C4:
	.short 0x00E2
.L060245C6:
	mov.w	@(6,r1),r0
	and	#112,r0
	cmp/eq	#48,r0
	bf	.L060245D2
	mov	r3,r0
	mov.w	r0,@(22,r12)
.L060245D2:
	mov.l	@(40,r13),r0
	tst	r0,r0
	bt	.L060245B0
	mov	#23,r3
	bra	.L060245F4
	nop
.L060245DE:
	mov.l	@(40,r13),r0
	mov	#-128,r2
	and	r2,r0
	tst	r0,r0
	bf	.L06024602
	mov	#54,r3
	mov.w	@(6,r1),r0
	and	#112,r0
	cmp/eq	#48,r0
	bf	.L060245F4
	mov.w	.L06024600,r3
.L060245F4:
	mov	r3,r0
	mov.w	r0,@(22,r12)
	mov	#0,r0
	mov.b	r0,@(4,r12)
	rts
	nop
.L06024600:
	.short 0x00F8
.L06024602:
	bra	func_06024952
	nop
	endlabel func_06024530

	glabel func_06024606
	sts.l	pr,@-r15
	bsr	func_06024612
	nop
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06024606

	glabel func_06024612
	sts.l	pr,@-r15
	mov.w	@(4,r1),r0
	mov.w	r0,@(8,r13)
	mov.b	@(0,r13),r0
	tst	r0,r0
	bt	.L0602463C
	dt	r0
	mov.b	r0,@(0,r13)
	mov.w	.L06024634,r4
	mov.l	@(40,r13),r5
	mov.l	.L06024638,r0
	cmp/ge	r0,r5
	bt	.L06024630
	add	r4,r5
	mov.l	r5,@(40,r13)
.L06024630:
	bra	.L06024650
	nop
.L06024634:
	.short 0x02D8
	.byte 0x00, 0x00
.L06024638:
	.long 0x00060000
.L0602463C:
	mov.w	@(14,r12),r0
	tst	#15,r0
	bf	.L06024650
	mov.l	@(40,r13),r5
	mov.w	.L0602470C,r4
	sub	r4,r5
	cmp/pz	r5
	bt	.L0602464E
	mov	#0,r5
.L0602464E:
	mov.l	r5,@(40,r13)
.L06024650:
	mov.w	@(8,r13),r0
	mov.l	.L06024710,r14
	jsr	@r14
	nop
	neg	r10,r10
	mov.w	.L0602470E,r2
	muls.w	r10,r2
	sts	macl,r2
	shlr16	r2
	exts.w	r2,r2
	mov.l	@(40,r13),r5
	tst	r5,r5
	bt	.L06024674
	add	r2,r5
	cmp/pz	r5
	bt	.L06024672
	mov	#0,r5
.L06024672:
	mov.l	r5,@(40,r13)
.L06024674:
	mov.w	@(8,r13),r0
	mov.l	.L06024714,r14
	jsr	@r14
	nop
	neg	r10,r10
	neg	r11,r11
	shll2	r10
	shll2	r11
	dmuls.l	r5,r10
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	dmuls.l	r5,r11
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	mov.w	@(8,r13),r0
	cmp/pz	r0
	bt	.L0602469C
	neg	r0,r0
.L0602469C:
	shll	r0
	mov.l	.L06024714,r14
	jsr	@r14
	nop
	mov.l	.L06024718,r0
	dmuls.l	r0,r10
	sts	mach,r2
	sts	macl,r0
	xtrct	r2,r0
	mov.l	@(44,r13),r2
	add	r0,r2
	cmp/pz	r2
	bt	.L060246B8
	mov	#0,r2
.L060246B8:
	mov.l	r2,@(44,r13)
	mov.l	@(44,r13),r7
	mov.w	@(10,r13),r0
	mov.l	.L06024714,r14
	jsr	@r14
	nop
	neg	r10,r10
	neg	r11,r11
	shll2	r10
	shll2	r11
	dmuls.l	r7,r10
	sts	mach,r0
	sts	macl,r6
	xtrct	r0,r6
	dmuls.l	r7,r11
	sts	mach,r0
	sts	macl,r7
	xtrct	r0,r7
	mov.l	@(36,r13),r4
	add	r6,r8
	add	r7,r9
	add	r4,r9
	mov.l	@(576,gbr),r0
	add	r0,r8
	mov.l	@(580,gbr),r0
	add	r0,r9
	mov	#0,r0
	mov.l	r0,@(576,gbr)
	mov.l	r0,@(580,gbr)
	mov.l	r8,@(32,r1)
	mov.l	r9,@(36,r1)
	mov.l	@(44,r13),r8
	mov	r5,r0
	shlr8	r0
	exts.w	r0,r0
	add	r0,r0
	cmp/pz	r5
	bt	.L0602471C
	cmp/ge	r5,r8
	bf	.L06024722
	bra	.L06024722
	sub	r0,r8
.L0602470C:
	.short 0x2000
.L0602470E:
	.short 0x1000
.L06024710:
	.long func_06007BF4
.L06024714:
	.long func_06007BD8
.L06024718:
	.long 0xFFFFF800
.L0602471C:
	cmp/ge	r5,r8
	bt	.L06024722
	add	r0,r8
.L06024722:
	mov.l	.L06024750,r0
	dmuls.l	r8,r8
	sts	mach,r2
	sts	macl,r3
	xtrct	r2,r3
	shar	r3
	shar	r3
	shar	r3
	shar	r3
	shar	r3
	shar	r3
	shar	r3
	shar	r3
	shar	r3
	cmp/pz	r8
	bf	.L06024754
	sub	r3,r8
	sub	r0,r8
	cmp/pz	r8
	bt	.L0602474C
	mov	#0,r8
.L0602474C:
	bra	.L0602475E
	nop
.L06024750:
	.long 0x00000100
.L06024754:
	add	r3,r8
	add	r0,r8
	cmp/pz	r8
	bf	.L0602475E
	mov	#0,r8
.L0602475E:
	mov.l	r8,@(44,r13)
	mov.l	@(40,r13),r0
	mov.l	.L0602480C,r2
	sub	r0,r2
	cmp/pz	r2
	bt	.L0602476C
	mov	#0,r2
.L0602476C:
	shlr8	r2
	nop
	mov.w	.L06024806,r4
	add	r2,r4
	mov.w	@(8,r13),r0
	extu.w	r0,r2
	mov.b	@(0,r12),r0
	cmp/eq	#24,r0
	bt	.L060247C8
	mov.l	@(40,r13),r0
	tst	r0,r0
	bt	.L060247C8
	mov.w	@(10,r13),r0
	extu.w	r0,r0
	cmp/eq	r2,r0
	bt	.L060247C4
	mov	r2,r3
	sub	r0,r3
	extu.w	r3,r3
	mov	r3,r7
	mov.l	.L06024810,r5
	add	r5,r7
	extu.w	r7,r7
	add	r5,r5
	cmp/ge	r5,r7
	bf	.L060247A2
	mov.w	.L06024808,r4
.L060247A2:
	mov.l	.L06024814,r5
	cmp/ge	r5,r3
	bf	.L060247AA
	neg	r4,r4
.L060247AA:
	mov	r0,r3
	add	r4,r0
	mov	r0,r4
	sub	r2,r3
	cmp/pz	r3
	movt	r3
	sub	r2,r4
	cmp/pz	r4
	movt	r4
	add	r4,r3
	dt	r3
	bf	.L060247C4
	mov	r2,r0
.L060247C4:
	extu.w	r0,r0
	mov.w	r0,@(10,r13)
.L060247C8:
	mov.l	@(40,r13),r5
	mov.l	@(44,r13),r0
	add	r5,r0
	mov.l	r0,@(0,r1)
	mov.l	@(40,r13),r5
	mov.l	.L06024818,r0
	cmp/ge	r0,r5
	bt	.L0602481C
	mov	r5,r4
	shar	r4
	shar	r4
	shar	r4
	shar	r4
	shar	r4
	shar	r4
	shar	r4
	shar	r4
	shar	r4
	shar	r4
	shar	r4
	shar	r4
	mov.w	.L0602480A,r0
	mov.l	@(36,r13),r4
	add	r0,r4
	mov.l	.L0602480C,r0
	cmp/ge	r0,r4
	bf	.L06024800
	mov	r0,r4
.L06024800:
	mov.l	r4,@(36,r13)
	bra	.L06024820
	nop
.L06024806:
	.short 0x0280
.L06024808:
	.short 0x0800
.L0602480A:
	.short 0x0200
.L0602480C:
	.long 0x00050000
.L06024810:
	.long 0x00005000
.L06024814:
	.long 0x00008000
.L06024818:
	.long 0x00027000
.L0602481C:
	mov	#0,r4
	mov.l	r4,@(36,r13)
.L06024820:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06024612

	glabel func_06024826
	mov.w	@(12,r13),r0
	mov	r0,r2
	mov.w	@(24,r1),r0
	mov.w	r0,@(12,r13)
	sub	r0,r2
	exts.w	r2,r2
	shll2	r2
	shll2	r2
	shll	r2
	mov	#64,r3
	shll2	r3
	mov.w	@(14,r13),r0
	cmp/pz	r2
	bf	.L06024852
	cmp/eq	r2,r0
	bt	.L0602485A
	cmp/ge	r2,r0
	bf	.L0602484C
	neg	r3,r3
.L0602484C:
	add	r3,r0
	bra	.L0602485A
	nop
.L06024852:
	cmp/ge	r2,r0
	bt	.L06024858
	neg	r3,r3
.L06024858:
	sub	r3,r0
.L0602485A:
	mov.w	r0,@(14,r13)
	mov.w	@(16,r13),r0
	mov	r0,r2
	mov.w	@(26,r1),r0
	mov.w	r0,@(16,r13)
	sub	r0,r2
	mov.w	@(22,r1),r0
	cmp/pz	r0
	bt	.L0602486E
	neg	r2,r2
.L0602486E:
	mov	r2,r3
	shll	r2
	cmp/pz	r2
	bf	.L0602487A
	shll	r2
	add	r3,r2
.L0602487A:
	mov	#64,r3
	shll2	r3
	mov.w	@(18,r13),r0
	cmp/pz	r2
	bf	.L06024894
	cmp/eq	r2,r0
	bt	.L0602489C
	cmp/ge	r2,r0
	bf	.L0602488E
	neg	r3,r3
.L0602488E:
	add	r3,r0
	bra	.L0602489C
	nop
.L06024894:
	cmp/ge	r2,r0
	bt	.L0602489A
	neg	r3,r3
.L0602489A:
	sub	r3,r0
.L0602489C:
	mov.w	r0,@(18,r13)
	rts
	nop
	endlabel func_06024826

	glabel func_060248A2
	mov.w	@(26,r1),r0
	mov	r0,r6
	mov.w	@(22,r1),r0
	mov	r0,r4
	mov.w	@(22,r12),r0
	mov	r0,r2
	mov.b	@(14,r12),r0
	tst	#24,r0
	bt	.L060248FC
	mov	#80,r5
	cmp/eq	r5,r2
	bt	.L060248E4
	mov	#81,r5
	cmp/eq	r5,r2
	bt	.L060248E4
	tst	r6,r6
	bf	.L060248D0
	mov	#54,r5
	cmp/eq	r5,r2
	bt	.L060248D6
	mov.w	.L060248D4,r3
	cmp/eq	r3,r2
	bt	.L060248D6
.L060248D0:
	bra	.L060248FC
	nop
.L060248D4:
	.short 0x00F8
.L060248D6:
	mov	r0,r2
	mov.w	@(16,r12),r0
	shlr8	r0
	tst	#24,r0
	bf	.L060248EC
	bra	.L060248D0
	mov	r2,r0
.L060248E4:
	mov.w	@(16,r12),r0
	shlr8	r0
	tst	#24,r0
	bt	.L060248F8
.L060248EC:
	mov	#81,r5
	tst	#8,r0
	bt	.L060248F4
	mov	#80,r5
.L060248F4:
	mov	r5,r0
	mov.w	r0,@(22,r12)
.L060248F8:
	rts
	nop
.L060248FC:
	mov.w	.L06024914,r2
	tst	r2,r4
	bt	.L06024916
	mov.b	@(39,gbr),r0
	tst	r0,r0
	bf	.L06024910
	mov.b	@(13,r12),r0
	shll8	r0
	add	r4,r0
	mov.w	r0,@(22,r1)
.L06024910:
	rts
	nop
.L06024914:
	.short 0x7FFF
.L06024916:
	mov.w	@(26,r1),r0
	tst	r2,r0
	bt	.L0602494A
	cmp/pz	r0
	bt	.L06024928
	cmp/pz	r4
	bt	.L0602494A
	bra	.L0602492C
	nop
.L06024928:
	cmp/pz	r4
	bf	.L0602494A
.L0602492C:
	mov.b	@(12,r12),r0
	dt	r0
	mov.b	r0,@(12,r12)
	bf	.L0602494E
	mov	#4,r3
	mov.w	@(6,r1),r0
	and	#112,r0
	cmp/eq	#48,r0
	bf	.L06024940
	neg	r3,r3
.L06024940:
	mov	r3,r0
	mov.b	r0,@(13,r12)
	shll8	r0
	add	r4,r0
	mov.w	r0,@(22,r1)
.L0602494A:
	mov	#60,r0
	mov.b	r0,@(12,r12)
.L0602494E:
	rts
	nop
	endlabel func_060248A2

	glabel func_06024952
	mov.l	@(52,r13),r0
	mov	#52,r8
	add	r13,r8
	mov	#0,r5
	mov	#0,r7
	mov.l	.L06024A0C,r4
	mov.b	@r4+,r2
	mov.b	@(1,r12),r0
	tst	#32,r0
	bf	.L0602496E
	mov.l	.L06024A10,r0
	mov.b	@r0,r0
	cmp/eq	#7,r0
	bt	.L06024978
.L0602496E:
	mov	#0,r2
	mov.b	@(14,r12),r0
	tst	#8,r0
	bt	.L06024978
	mov	#-1,r2
.L06024978:
	extu.b	r2,r2
	mov	#1,r3
	cmp/ge	r3,r2
	bf	.L06024994
	mov	#1,r5
	mov.b	@r8,r7
	mov	#32,r0
	cmp/ge	r0,r7
	bt	.L06024994
	mov	#-1,r3
	extu.b	r3,r3
	cmp/ge	r3,r2
	bf	.L06024994
	add	#1,r7
.L06024994:
	mov.b	r7,@r8
	add	#1,r8
	mov	r2,r6
	mov	#0,r7
	mov.b	@r4,r2
	mov.b	@(1,r12),r0
	tst	#32,r0
	bf	.L060249AC
	mov.l	.L06024A10,r0
	mov.b	@r0,r0
	cmp/eq	#7,r0
	bt	.L060249B6
.L060249AC:
	mov	#0,r2
	mov.b	@(14,r12),r0
	tst	#16,r0
	bt	.L060249B6
	mov	#-1,r2
.L060249B6:
	extu.b	r2,r2
	mov	#1,r3
	cmp/ge	r3,r2
	bf	.L06024A18
	add	#2,r5
	mov.b	@r8,r7
	mov	#32,r0
	cmp/ge	r0,r7
	bt	.L06024A18
	mov	#-1,r3
	extu.b	r3,r3
	cmp/ge	r3,r2
	bf	.L06024A18
	add	#1,r7
	mov	#-1,r3
	extu.b	r3,r3
	cmp/ge	r3,r6
	bf	.L06024A18
	mov.b	r7,@r8
	add	#-1,r8
	mov.b	@r8,r7
	mov	#32,r0
	cmp/ge	r0,r7
	bt	.L06024A1A
	mov.b	@(1,r12),r0
	tst	#1,r0
	bf	.L06024A1A
	mov.l	@(40,r13),r0
	tst	r0,r0
	bt	.L06024A1A
	mov.l	@(44,r13),r0
	mov.l	.L06024A14,r2
	cmp/ge	r2,r0
	bf	.L06024A1A
	mov.w	@r8,r0
	mov.w	.L06024A0A,r2
	and	r2,r0
	tst	r0,r0
	bf	.L06024A1A
	mov.w	r2,@r8
	bra	.L06024B32
	nop
.L06024A0A:
	.short 0x2020
.L06024A0C:
	.long D_060226AD
.L06024A10:
	.long D_060226AA
.L06024A14:
	.long 0x00018000
.L06024A18:
	mov.b	r7,@r8
.L06024A1A:
	mov.b	@(2,r12),r0
	tst	r0,r0
	bf	.L06024A8C
	mov.b	@(4,r12),r0
	cmp/eq	r0,r5
	bt	.L06024A90
	mov	r5,r0
	mov.b	r0,@(4,r12)
.L06024A2A:
	mov.l	.L06024A84,r6
	shll2	r5
	shll2	r5
	shll	r5
	add	r5,r6
	mov.w	@(26,r1),r0
	mov	r0,r7
	mov.w	@(22,r1),r0
	cmp/pz	r0
	bt	.L06024A40
	neg	r7,r7
.L06024A40:
	mov	r7,r0
	shlr8	r0
	shlr2	r0
	shlr	r0
	and	#30,r0
	mov.w	@(r0,r6),r7
	mov	r0,r4
	mov.w	@(22,r12),r0
	cmp/eq	r0,r7
	bt	.L06024A8C
	mov.w	.L06024A7C,r3
	cmp/ge	r3,r0
	bf	.L06024A60
	mov.w	.L06024A7E,r3
	cmp/gt	r3,r0
	bf	.L06024A88
.L06024A60:
	mov	r7,r0
	mov.w	r0,@(22,r12)
	mov.w	.L06024A80,r3
	cmp/ge	r3,r0
	bf	.L06024A70
	mov.w	.L06024A82,r3
	cmp/gt	r3,r0
	bf	.L06024A88
.L06024A70:
	mov.l	.L06024A84,r6
	mov	r4,r0
	mov.w	@(r0,r6),r0
	mov.w	r0,@(30,r12)
	bra	.L06024A8C
	nop
.L06024A7C:
	.short 0x00C5
.L06024A7E:
	.short 0x00E2
.L06024A80:
	.short 0x00D4
.L06024A82:
	.short 0x00DF
.L06024A84:
	.long D_06024AB2
.L06024A88:
	mov	r7,r0
	mov.w	r0,@(30,r12)
.L06024A8C:
	rts
	nop
.L06024A90:
	tst	r5,r5
	bt	.L06024A8C
	mov.w	@(22,r12),r0
	mov	r0,r7
	mov.w	@(30,r12),r0
	cmp/eq	r0,r7
	bf	.L06024A8C
	mov.w	.L06024AAE,r3
	cmp/ge	r3,r0
	bf	.L06024AAA
	mov.w	.L06024AB0,r3
	cmp/gt	r3,r0
	bf	.L06024A8C
.L06024AAA:
	bra	.L06024A2A
	mov	#0,r5
.L06024AAE:
	.short 0x00D4
.L06024AB0:
	.short 0x00DF
	dlabel D_06024AB2
	.byte 0x00, 0x1B, 0x00, 0x1A, 0x00, 0x18, 0x00, 0x19, 0x00, 0x19, 0x00, 0x1E, 0x00, 0x1C, 0x00, 0x1B
	.byte 0x00, 0x1B, 0x00, 0x1A, 0x00, 0x1D, 0x00, 0x18, 0x00, 0x19, 0x00, 0x19, 0x00, 0x17, 0x00, 0x1B
	.byte 0x00, 0xD4, 0x00, 0xDA, 0x00, 0xDA, 0x00, 0xE0, 0x00, 0xE0, 0x00, 0xDD, 0x00, 0xDD, 0x00, 0xD7
	.byte 0x00, 0xD7, 0x00, 0xD1, 0x00, 0xCB, 0x00, 0xC5, 0x00, 0xC5, 0x00, 0xC8, 0x00, 0xCE, 0x00, 0xD4
	.byte 0x00, 0xD5, 0x00, 0xDB, 0x00, 0xDB, 0x00, 0xE2, 0x00, 0xE2, 0x00, 0xDE, 0x00, 0xDE, 0x00, 0xD8
	.byte 0x00, 0xD8, 0x00, 0xD2, 0x00, 0xCC, 0x00, 0xC6, 0x00, 0xC6, 0x00, 0xC9, 0x00, 0xCF, 0x00, 0xD5
	.byte 0x00, 0xD6, 0x00, 0xDC, 0x00, 0xDC, 0x00, 0xE1, 0x00, 0xE1, 0x00, 0xDF, 0x00, 0xDF, 0x00, 0xD9
	.byte 0x00, 0xD9, 0x00, 0xD3, 0x00, 0xCD, 0x00, 0xC7, 0x00, 0xC7, 0x00, 0xCA, 0x00, 0xD0, 0x00, 0xD6
.L06024B32:
	mov.b	@(2,r12),r0
	tst	r0,r0
	bt	.L06024B40
	sts.l	pr,@-r15
	bsr	func_06024348
	nop
	lds.l	@r15+,pr
.L06024B40:
	mov	#24,r0
	mov.b	r0,@(0,r12)
	mov.l	@(40,r13),r2
	mov.l	@(44,r13),r0
	add	r2,r0
	mov.l	r0,@(44,r13)
	mov	#0,r2
	mov.l	r2,@(40,r13)
	mov	#37,r2
	mov.l	.L06024B70,r3
	cmp/ge	r3,r0
	bf	.L06024B5A
	add	#1,r2
.L06024B5A:
	mov.w	.L06024B6E,r3
	mov.w	@(26,r1),r0
	cmp/pz	r0
	bf	.L06024B74
	neg	r3,r3
	mov.w	@(22,r1),r0
	cmp/pz	r0
	bf	.L06024B7C
	bra	.L06024B7C
	add	#2,r2
.L06024B6E:
	.short 0x4000
.L06024B70:
	.long 0x00080000
.L06024B74:
	mov.w	@(22,r1),r0
	cmp/pz	r0
	bt	.L06024B7C
	add	#2,r2
.L06024B7C:
	mov	r2,r0
	mov.w	r0,@(22,r12)
	mov.w	@(26,r1),r0
	add	r3,r0
	mov.w	r0,@(26,r1)
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#9,r6
	mov.l	.L06024BA8,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	rts
	nop
.L06024BA8:
	.long func_0600E4C4
	endlabel func_06024952

	glabel func_06024BAC
	mov.l	r12,@-r15
	mov.l	r3,@-r15
	mov.l	r0,@-r15
	mov.l	.L06024BDC,r3
	mov.l	@r3,r3
	mov.l	@(8,r3),r12
	mov	#23,r0
	mov.w	r0,@(22,r12)
	mov	#9,r0
	mov.b	r0,@(9,r12)
	mov.w	.L06024BDA,r0
	mov.w	r0,@(4,r3)
	mov	#2,r3
	mov.b	@(20,gbr),r0
	cmp/eq	#4,r0
	bf	.L06024BCE
	mov	#1,r3
.L06024BCE:
	mov.l	r3,@(60,r12)
	mov.l	@r15+,r0
	mov.l	@r15+,r3
	mov.l	@r15+,r12
	rts
	nop
.L06024BDA:
	.short 0xC000
.L06024BDC:
	.long D_060F3064
	endlabel func_06024BAC

	glabel func_06024BE0
	sts.l	pr,@-r15
	mov	#64,r3
	add	r1,r3
	mov.b	@(0,r3),r0
	tst	r0,r0
	bt	.L06024BF0
	dt	r0
	mov.b	r0,@(0,r3)
.L06024BF0:
	mov.w	@(6,r1),r0
	and	#112,r0
	cmp/eq	#0,r0
	bt	.L06024C20
	cmp/eq	#48,r0
	bt	.L06024C00
	bra	.L06024C36
	nop
.L06024C00:
	mov.l	.L06024C0C,r0
	jsr	@r0
	nop
	bra	.L06024C36
	nop
	.byte 0x00, 0x00
.L06024C0C:
	.long D_060C1E34
.L06024C10:
	mov.l	.L06024C1C,r0
	jsr	@r0
	nop
	bra	.L06024C36
	nop
	.byte 0x00, 0x00
.L06024C1C:
	.long D_060C5A68
.L06024C20:
	mov.b	@(7,r1),r0
	tst	#1,r0
	bt	.L06024C30
	mov.b	@(20,gbr),r0
	cmp/eq	#13,r0
	bt	.L06024C10
	cmp/eq	#15,r0
	bt	.L06024C10
.L06024C30:
	mov.l	.L06024C54,r0
	jsr	@r0
	nop
.L06024C36:
	mov.l	.L06024C58,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	@(60,r12),r0
	tst	r0,r0
	bt	.L06024C80
	mov	r0,r2
	and	#15,r0
	mov.l	.L06024C5C,r3
	shll2	r0
	mov.l	@(r0,r3),r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06024C54:
	.long func_0602AFD4
.L06024C58:
	.long func_0602B226
.L06024C5C:
	.long D_06024C60
	dlabel D_06024C60
	.long .L06024C80
	.long func_06024CB2
	.long func_06024CD8
	.long func_06024CFC
	.long func_06024D8C
	.long func_06024E04
	.long func_06024E44
	.long func_06024EA0
.L06024C80:
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L06024C8E
	mov.w	@(22,r12),r0
	mov.w	.L06024C96,r2
	cmp/eq	r2,r0
	bt	.L06024C98
.L06024C8E:
	mov	#0,r0
	mov.l	r0,@(60,r12)
.L06024C92:
	rts
	nop
.L06024C96:
	.short 0x003D
.L06024C98:
	mov	#60,r0
	mov.w	@(r0,r12),r3
	add	#1,r3
	mov.w	r3,@(r0,r12)
	mov.w	.L06024CAE,r0
	cmp/ge	r0,r3
	bf	.L06024C92
	mov.w	.L06024CB0,r0
	mov.w	r0,@(22,r12)
	rts
	nop
.L06024CAE:
	.short 0x0708
.L06024CB0:
	.short 0x0040
	endlabel func_06024BE0

	glabel func_06024CB2
	mov	#31,r0
	mov.b	@(r0,r1),r0
	cmp/eq	#17,r0
	bf	.L06024CEC
	mov.l	@(60,r1),r0
	shlr16	r0
	mov.w	.L06024CD2,r2
	cmp/ge	r2,r0
	bf	.L06024CCE
	mov.w	.L06024CD4,r2
	cmp/ge	r2,r0
	bt	.L06024CCE
	mov.w	.L06024CD6,r0
	mov.w	r0,@(4,r1)
.L06024CCE:
	rts
	nop
.L06024CD2:
	.short 0x0400
.L06024CD4:
	.short 0x0640
.L06024CD6:
	.short 0xC000
	endlabel func_06024CB2

	glabel func_06024CD8
	mov	#60,r0
	mov.w	@(r0,r12),r3
	add	#1,r3
	mov.w	r3,@(r0,r12)
	mov.w	.L06024CEA,r0
	cmp/ge	r0,r3
	bt	.L06024CEC
	rts
	nop
.L06024CEA:
	.short 0x00B4
.L06024CEC:
	mov	#23,r0
	mov.w	r0,@(22,r12)
	mov	#12,r0
	mov.b	r0,@(9,r12)
	mov	#0,r0
	mov.l	r0,@(60,r12)
	rts
	nop
	endlabel func_06024CD8

	glabel func_06024CFC
	mov	#31,r0
	mov.b	@(r0,r1),r0
	cmp/eq	#23,r0
	bt	.L06024D20
	cmp/eq	#24,r0
	bt	.L06024D36
	mov.w	@(6,r1),r0
	and	#112,r0
	tst	r0,r0
	bt	.L06024CEC
	mov.l	.L06024D1C,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L06024CEC
	nop
	.byte 0x00, 0x00
.L06024D1C:
	.long func_060255C8
.L06024D20:
	mov.w	@(6,r1),r0
	and	#112,r0
	tst	r0,r0
	bt	.L06024D64
	mov.w	.L06024D34,r0
	mov.w	r0,@(22,r12)
	mov	#8,r0
	mov.w	r0,@(14,r12)
	bra	.L06024D46
	nop
.L06024D34:
	.short 0x0107
.L06024D36:
	mov.w	@(6,r1),r0
	and	#112,r0
	tst	r0,r0
	bt	.L06024D46
	mov.w	.L06024D80,r0
	mov.w	r0,@(22,r12)
	mov	#0,r0
	mov.w	r0,@(14,r12)
.L06024D46:
	mov.l	.L06024D84,r2
	mov.l	@(40,r13),r3
	add	r2,r3
	mov.l	.L06024D88,r4
	cmp/ge	r4,r3
	bf	.L06024D5A
	sub	r2,r3
	shlr2	r2
	shlr2	r2
	sub	r2,r3
.L06024D5A:
	mov.l	r3,@(40,r13)
	mov.w	@(6,r1),r0
	and	#112,r0
	tst	r0,r0
	bf	.L06024D7C
.L06024D64:
	mov.b	@(9,r12),r0
	and	#127,r0
	cmp/eq	#11,r0
	bt	.L06024D7C
	mov.b	@(2,r12),r0
	tst	r0,r0
	bf	.L06024D7C
	mov	#11,r0
	mov.b	r0,@(9,r12)
	mov	#100,r0
	mov.w	r0,@(22,r12)
	mov.w	r0,@(30,r12)
.L06024D7C:
	rts
	nop
.L06024D80:
	.short 0x0107
	.byte 0x00, 0x00
.L06024D84:
	.long 0x00002000
.L06024D88:
	.long 0x00038000
	endlabel func_06024CFC

	glabel func_06024D8C
	mov.w	@(22,r12),r0
	cmp/eq	#2,r0
	bt	.L06024DE6
	cmp/eq	#3,r0
	bt	.L06024DE6
	cmp/eq	#7,r0
	bt	.L06024DE6
	mov.w	.L06024DD4,r2
	cmp/eq	r2,r0
	bt	.L06024DBA
	cmp/eq	#8,r0
	bf	.L06024DF0
	mov.w	@(26,r12),r0
	mov	#5,r2
	cmp/ge	r2,r0
	bf	.L06024DBA
	mov	#0,r4
	mov	#21,r2
	cmp/ge	r2,r0
	bt	.L06024DB6
	mov	#10,r4
.L06024DB6:
	mov	r4,r0
	mov.b	r0,@(9,r12)
.L06024DBA:
	mov.w	@(26,r12),r0
	mov	#9,r2
	cmp/ge	r2,r0
	bf	.L06024DE6
	mov	#17,r2
	cmp/ge	r2,r0
	bt	.L06024DD8
	mov.l	@(44,r1),r0
	mov.w	.L06024DD6,r2
	add	r2,r0
	mov.l	r0,@(44,r1)
	rts
	nop
.L06024DD4:
	.short 0x00E6
.L06024DD6:
	.short 0x0800
.L06024DD8:
	mov.l	.L06024DEC,r4
	mov.l	@(44,r1),r0
	cmp/eq	r4,r0
	bt	.L06024DE6
	mov.w	.L06024DEA,r2
	sub	r2,r0
	mov.l	r0,@(44,r1)
.L06024DE6:
	rts
	nop
.L06024DEA:
	.short 0x0400
.L06024DEC:
	.long 0x00010000
.L06024DF0:
	mov	#0,r0
	mov.b	r0,@(9,r12)
	mov.l	.L06024E00,r0
	mov.l	r0,@(44,r1)
	mov	#0,r0
	mov.l	r0,@(60,r12)
	rts
	nop
.L06024E00:
	.long 0x00010000
	endlabel func_06024D8C

	glabel func_06024E04
	mov	#60,r0
	mov.w	@(r0,r12),r3
	tst	r3,r3
	bt/s	.L06024E1C
	add	#1,r3
	mov.w	r3,@(r0,r12)
	mov.w	.L06024E1A,r0
	cmp/ge	r0,r3
	bt	.L06024E28
	rts
	nop
.L06024E1A:
	.short 0x00B4
.L06024E1C:
	mov.w	r3,@(r0,r12)
	mov.b	@(6,r1),r0
	mov	r0,r2
	mov	#62,r0
	bra	.L06024E30
	mov.b	r2,@(r0,r12)
.L06024E28:
	mov	#62,r0
	mov.b	@(r0,r12),r2
	mov	#0,r0
	mov.l	r0,@(60,r12)
.L06024E30:
	sts.l	pr,@-r15
	mov.l	.L06024E40,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06024E40:
	.long func_060294D4
	endlabel func_06024E04

	glabel func_06024E44
	mov	#62,r0
	mov.b	@(r0,r12),r2
	tst	r2,r2
	bf	.L06024E80
	mov.l	.L06024E60,r2
	mov.l	@(44,r1),r0
	cmp/eq	r2,r0
	bt	.L06024E64
	mov.w	.L06024E5E,r2
	sub	r2,r0
	mov.l	r0,@(44,r1)
	rts
	nop
.L06024E5E:
	.short 0x0400
.L06024E60:
	.long 0x00008000
.L06024E64:
	mov	#60,r0
	mov.w	@(r0,r12),r3
	add	#1,r3
	mov.w	r3,@(r0,r12)
	mov.w	.L06024E76,r0
	cmp/ge	r0,r3
	bt	.L06024E78
	rts
	nop
.L06024E76:
	.short 0x0258
.L06024E78:
	mov	#62,r0
	mov.b	r0,@(r0,r12)
	rts
	nop
.L06024E80:
	mov.l	.L06024E94,r2
	mov.l	@(44,r1),r0
	cmp/eq	r2,r0
	bt	.L06024E98
	mov.w	.L06024E92,r2
	add	r2,r0
	mov.l	r0,@(44,r1)
	rts
	nop
.L06024E92:
	.short 0x0400
.L06024E94:
	.long 0x00010000
.L06024E98:
	mov	#0,r0
	mov.l	r0,@(60,r12)
	rts
	nop
	endlabel func_06024E44

	glabel func_06024EA0
	mov.w	@(22,r12),r0
	cmp/eq	#54,r0
	bt	.L06024EB2
	cmp/eq	#60,r0
	bt	.L06024EB2
	cmp/eq	#61,r0
	bt	.L06024EB2
	rts
	nop
.L06024EB2:
	mov.w	.L06024EF0,r0
	mov.w	r0,@(22,r12)
	mov.b	@(22,gbr),r0
	tst	#2,r0
	mov.w	.L06024EF2,r0
	bt	.L06024EC0
	mov.w	.L06024EF4,r0
.L06024EC0:
	mov.w	r0,@(30,r12)
	mov.w	.L06024EF6,r0
	mov.w	r0,@(28,r12)
	mov.b	@(1,r12),r0
	or	#48,r0
	mov.b	r0,@(1,r12)
	mov	#0,r0
	mov.w	r0,@(14,r12)
	mov.w	r0,@(16,r12)
	mov.l	r0,@(0,r1)
	mov.l	r0,@(40,r13)
	mov.l	r0,@(44,r13)
	mov.l	r0,@(36,r13)
	mov.l	r0,@(60,r12)
	sts.l	pr,@-r15
	mov.l	.L06024EF8,r2
	mov.l	.L06024EFC,r0
	jsr	@r0
	nop
	mov.l	.L06024F00,r0
	mov.l	r0,@(12,r3)
	lds.l	@r15+,pr
	rts
	nop
.L06024EF0:
	.short 0x000C
.L06024EF2:
	.short 0x000E
.L06024EF4:
	.short 0x000F
.L06024EF6:
	.short 0x0036
.L06024EF8:
	.long D_060FFFB8
.L06024EFC:
	.long func_0600D0D0
.L06024F00:
	.long func_0603E638
	endlabel func_06024EA0

	glabel func_06024F04
	mov.b	@(0,r12),r0
	cmp/eq	#16,r0
	bf	.L06024F1A
	mov	#0,r0
	mov.b	r0,@(0,r12)
	mov.l	@(32,r12),r3
	mov	#30,r4
	add	r3,r4
	mov.b	@r4,r0
	and	#253,r0
	mov.b	r0,@r4
.L06024F1A:
	rts
	nop
	.byte 0x00, 0x09
	dlabel D_06024F20
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	endlabel func_06024F04

	glabel func_06024F28
	sts.l	pr,@-r15
	mov.l	.L06024FFC,r0
	jsr	@r0
	nop
	mov.l	.L06025000,r9
	mov	#14,r2
	shll2	r2
	shll2	r2
	mov.l	@r9,r3
	mov.w	@(24,r1),r0
	extu.w	r0,r4
	mov.w	.L06024FF4,r5
	mov.w	@(14,r13),r0
	mov	r0,r6
	mov.w	@(14,r12),r0
	tst	#12,r0
	bt	.L06024F6C
	tst	#4,r0
	bt	.L06024F58
	add	r2,r3
	mov.w	.L06024FF6,r7
	cmp/ge	r7,r6
	bt	.L06024F58
	add	r5,r4
.L06024F58:
	tst	#8,r0
	bt	.L06024F66
	sub	r2,r3
	mov.w	.L06024FF8,r7
	cmp/gt	r7,r6
	bf	.L06024F66
	sub	r5,r4
.L06024F66:
	mov.l	r3,@r9
	extu.w	r4,r0
	mov.w	r0,@(12,r13)
.L06024F6C:
	mov	#0,r2
	mov.l	@r9,r0
	tst	r0,r0
	bt	.L06024FA8
	mov	r0,r3
	neg	r3,r3
	mov	r3,r4
	cmp/pz	r4
	bt	.L06024F80
	neg	r4,r4
.L06024F80:
	shlr2	r4
	shlr2	r4
	shlr2	r4
	extu.w	r4,r4
	cmp/pz	r3
	bt	.L06024F8E
	neg	r4,r4
.L06024F8E:
	mov	r0,r3
	add	r4,r0
	mov	r0,r4
	sub	r2,r3
	cmp/pz	r3
	movt	r3
	sub	r2,r4
	cmp/pz	r4
	movt	r4
	add	r4,r3
	dt	r3
	bf	.L06024FA8
	mov	r2,r0
.L06024FA8:
	mov.l	r0,@r9
	mov.l	@r9,r0
	neg	r0,r0
	mov.l	.L06025004,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	mov.l	.L06025008,r7
	dmuls.l	r7,r10
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	mov.w	@(24,r1),r0
	mov.l	.L06025004,r10
	jsr	@r10
	nop
	neg	r10,r10
	neg	r11,r11
	shll2	r10
	shll2	r11
	dmuls.l	r2,r10
	sts	mach,r0
	sts	macl,r7
	xtrct	r0,r7
	dmuls.l	r2,r11
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	mov.l	@(48,r1),r4
	mov.l	@(56,r1),r6
	add	r7,r4
	add	r9,r6
	mov.l	r4,@(48,r1)
	mov.l	r6,@(56,r1)
	lds.l	@r15+,pr
	rts
	nop
.L06024FF4:
	.short 0x0200
.L06024FF6:
	.short 0x2000
.L06024FF8:
	.short 0xE000
	.byte 0x00, 0x00
.L06024FFC:
	.long func_060226B0
.L06025000:
	.long D_06024F20
.L06025004:
	.long func_06007BD8
.L06025008:
	.long 0x00A00000
	dlabel D_0602500C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x5C, 0x12, 0x5D, 0x13, 0xE0, 0x05, 0x80, 0xC9, 0xE0, 0x6F, 0x81, 0xCB, 0xD3, 0x27, 0x1D, 0x3B
	.byte 0xE0, 0xC0, 0x40, 0x18, 0x81, 0x12, 0x81, 0xD5, 0x81, 0xD4, 0x81, 0x1D, 0xE0, 0x00, 0x81, 0x1B
	.byte 0x81, 0xD7, 0x81, 0xD9, 0xE0, 0x01, 0x80, 0xC8, 0x84, 0xC1, 0xCB, 0x01, 0x80, 0xC1, 0xD0, 0x1F
	.byte 0x11, 0x08, 0xE0, 0x00, 0x11, 0x09, 0x4F, 0x22, 0xBF, 0x56, 0x00, 0x09, 0x4F, 0x26, 0xDE, 0x1C
	.byte 0x54, 0x1D, 0x2E, 0x42, 0x7E, 0x04, 0xE0, 0x00, 0x2E, 0x02, 0x7E, 0x04, 0x2E, 0x02, 0xC5, 0x69
	.byte 0xCB, 0x02, 0xC1, 0x69, 0x50, 0x1C, 0xC2, 0x31, 0x50, 0x1D, 0xC2, 0x32, 0x50, 0x1E, 0xC2, 0x33
	.byte 0x85, 0x1C, 0xC1, 0x68, 0xD4, 0x13, 0x64, 0x42, 0x24, 0x48, 0x89, 0x13, 0xD0, 0x12, 0x24, 0x06
	.byte 0x74, 0x04, 0x5C, 0x42, 0x90, 0x18, 0x81, 0xCB, 0xE0, 0x00, 0x81, 0xCD, 0xE2, 0x1E, 0x32, 0x4C
	.byte 0x60, 0x20, 0xC9, 0xDF, 0x22, 0x00, 0x4F, 0x22, 0xD0, 0x0C, 0x40, 0x0B, 0x00, 0x09, 0xCB, 0x01
	.byte 0x81, 0x43, 0x4F, 0x26, 0xD0, 0x0A, 0x21, 0x06, 0x71, 0x04
	endlabel func_06024F28

	glabel func_060250B6
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L060250E0
	mov.l	@(8,r1),r12
	mov.l	@(12,r1),r13
	bra	.L0602534E
	nop
	.byte 0x00, 0x9A, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00
	.long D_0602500C
	.long D_060F3068
	.long func_0602210C
	.long func_06021F04
	.long func_060250B6
.L060250E0:
	sts.l	pr,@-r15
	mov.l	.L06025138,r11
	mov.l	@(8,r1),r12
	mov.l	@(12,r1),r13
	sts.l	pr,@-r15
	mov.l	.L0602513C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	bsr	func_06025394
	nop
	mov	#24,r2
	shll2	r2
	shll2	r2
	mov.w	@(22,r1),r0
	mov	r0,r3
	mov	#111,r8
	mov.w	@(14,r12),r0
	tst	#12,r0
	bt	.L0602511C
	tst	#4,r0
	bt	.L06025110
	mov	#113,r8
	add	r2,r3
.L06025110:
	tst	#8,r0
	bt	.L06025118
	mov	#112,r8
	sub	r2,r3
.L06025118:
	mov	r3,r0
	mov.w	r0,@(22,r1)
.L0602511C:
	mov	#0,r2
	mov.l	.L06025140,r14
	mov.w	@(4,r14),r0
	neg	r0,r0
	extu.w	r0,r0
	mov	r0,r2
	mov.w	@(22,r1),r0
	extu.w	r0,r0
	cmp/eq	r2,r0
	bf	.L06025148
	mov.l	.L06025144,r3
	jmp	@r3
	nop
	.byte 0x00, 0x00
.L06025138:
	.long D_060253D2
.L0602513C:
	.long func_060226B0
.L06025140:
	.long D_0602500C
.L06025144:
	.long .L06025186
.L06025148:
	mov	r2,r3
	sub	r0,r3
	extu.w	r3,r3
	mov	r3,r4
	exts.w	r4,r4
	cmp/pz	r4
	bt	.L06025158
	neg	r4,r4
.L06025158:
	shlr	r4
	shlr2	r4
	shlr2	r4
	extu.w	r4,r4
	mov	#64,r5
	shll8	r5
	shll	r5
	cmp/ge	r5,r3
	bf	.L0602516C
	neg	r4,r4
.L0602516C:
	mov	r0,r3
	add	r4,r0
	mov	r0,r4
	sub	r2,r3
	cmp/pz	r3
	movt	r3
	sub	r2,r4
	cmp/pz	r4
	movt	r4
	add	r4,r3
	dt	r3
	bf	.L06025186
	mov	r2,r0
.L06025186:
	extu.w	r0,r0
	mov.w	r0,@(22,r1)
	mov.w	@(16,r12),r0
	mov.l	@(32,r1),r5
	tst	#32,r0
	bt	.L06025196
	mov	#114,r8
	mov	#111,r8
.L06025196:
	mov.w	@(6,r1),r0
	and	#112,r0
	tst	r0,r0
	bf	.L060251A2
	mov	r8,r0
	mov.w	r0,@(22,r12)
.L060251A2:
	mov.l	.L0602526C,r14
	mov.l	@r14,r4
	mov.l	@(60,r1),r3
	add	r5,r3
	mov.l	@(36,r1),r6
	mov.l	r3,@(60,r1)
	add	r6,r4
	mov.l	r4,@r14
	mov	#112,r0
	shll8	r0
	shll	r0
	add	r0,r6
	mov.l	r6,@(36,r1)
	mov	r6,r0
	mov.l	@(32,r1),r5
	mov.l	.L06025270,r0
	cmp/eq	r5,r0
	bt	.L060251CC
	mov.w	.L06025268,r2
	sub	r2,r5
	mov.l	r5,@(32,r1)
.L060251CC:
	mov.l	.L06025274,r0
	jsr	@r0
	nop
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06025278,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@(48,r1),r0
	mov.l	r0,@(196,gbr)
	mov.l	@(56,r1),r0
	mov.l	r0,@(204,gbr)
	mov.w	@(24,r1),r0
	mov.w	r0,@(208,gbr)
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L0602527C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov	r5,r0
	mov	r7,r0
	mov	r9,r0
	mov.l	@(8,r1),r12
	mov.l	@(12,r1),r13
	mov.l	.L0602526C,r14
	mov.l	@r14,r11
	mov	#16,r2
	shll16	r2
	add	r2,r11
	sub	r11,r5
	sub	r11,r7
	cmp/ge	r5,r7
	bf	.L0602521C
	mov	r5,r7
.L0602521C:
	mov.b	@(8,r12),r0
	tst	r0,r0
	bf	.L060252C4
	mov.l	@r14,r11
	add	r7,r11
	mov.l	r11,@r14
	mov.w	@(26,r1),r0
	mov	r0,r3
	mov	#-64,r2
	shll8	r2
	mov	r9,r0
	add	r2,r0
	mov.w	r0,@(4,r1)
	mov.w	r0,@(26,r1)
	mov.w	r0,@(10,r13)
	mov.w	r0,@(8,r13)
	sub	r3,r0
	exts.w	r0,r0
	mov.w	.L0602526A,r2
	exts.w	r9,r0
	cmp/ge	r2,r0
	bf	.L06025288
	nop
	mov	#1,r0
	mov.b	r0,@(8,r12)
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	.L06025280,r0
	jsr	@r0
	mov	#4,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	.L06025284,r3
	mov.l	r3,@(36,r1)
	bra	.L060252EA
	nop
.L06025268:
	.short 0x1000
.L0602526A:
	.short 0x0E00
.L0602526C:
	.long D_0602500C
.L06025270:
	.long 0x000C0000
.L06025274:
	.long func_06024BE0
.L06025278:
	.long func_06018E8C
.L0602527C:
	.long func_06026678
.L06025280:
	.long func_0600E4F6
.L06025284:
	.long 0xFFF00000
.L06025288:
	mov	#0,r3
	mov.l	r3,@(36,r1)
	mov.l	.L060252BC,r14
	mov.w	@(8,r14),r0
	add	#1,r0
	mov.w	r0,@(8,r14)
	tst	#63,r0
	bf	.L060252EA
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#3,r5
	mov	#22,r6
	mov.l	.L060252C0,r0
	jsr	@r0
	mov	#4,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	bra	.L060252EA
	nop
	.byte 0x00, 0x00
.L060252BC:
	.long D_0602500C
.L060252C0:
	.long func_0600E4C4
.L060252C4:
	cmp/pz	r7
	bt	.L060252EA
	mov	#-64,r2
	shll8	r2
	mov	r9,r0
	add	r2,r0
	mov.w	r0,@(4,r1)
	mov.w	r0,@(26,r1)
	mov.w	r0,@(10,r13)
	mov.w	r0,@(8,r13)
	mov	#0,r4
	mov.l	r4,@(36,r13)
	mov.l	r4,@(32,r13)
	mov	#0,r0
	mov.l	r0,@(36,r1)
	mov.b	r0,@(8,r12)
	mov.l	.L06025374,r14
	mov	#63,r0
	mov.w	r0,@(8,r14)
.L060252EA:
	mov.l	@r14,r0
	mov.l	r0,@(200,gbr)
	mov	#64,r2
	shll2	r2
	shll2	r2
	mov.w	@(22,r1),r0
	add	r2,r0
	mov.w	@(22,r1),r0
	neg	r0,r0
	mov.l	.L06025378,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	mov.l	.L0602537C,r7
	dmuls.l	r7,r10
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	dmuls.l	r7,r11
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	mov.l	@r14,r5
	sub	r7,r3
	add	r3,r5
	mov.l	r5,@(52,r1)
	mov.w	@(24,r1),r0
	mov.l	.L06025378,r10
	jsr	@r10
	nop
	neg	r10,r10
	neg	r11,r11
	shll2	r10
	shll2	r11
	dmuls.l	r2,r10
	sts	mach,r0
	sts	macl,r7
	xtrct	r0,r7
	dmuls.l	r2,r11
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	mov.l	@(48,r1),r4
	mov.l	@(56,r1),r6
	add	r7,r4
	add	r9,r6
	mov.l	r4,@(48,r1)
	mov.l	r6,@(56,r1)
	lds.l	@r15+,pr
.L0602534E:
	sts.l	pr,@-r15
	mov.l	.L06025380,r0
	jsr	@r0
	nop
	mov.l	.L06025384,r0
	jsr	@r0
	nop
	mov.l	.L06025388,r0
	jsr	@r0
	nop
	mov.l	.L0602538C,r0
	jsr	@r0
	nop
	mov.l	.L06025390,r14
	jsr	@r14
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06025374:
	.long D_0602500C
.L06025378:
	.long func_06007BD8
.L0602537C:
	.long 0x00780000
.L06025380:
	.long func_06028904
.L06025384:
	.long func_060289B0
.L06025388:
	.long func_06028C94
.L0602538C:
	.long func_06028CC8
.L06025390:
	.long func_06016818
	endlabel func_060250B6

	glabel func_06025394
	mov.w	@(12,r13),r0
	mov	r0,r2
	mov.w	@(24,r1),r0
	mov.w	r0,@(12,r13)
	sub	r0,r2
	shll2	r2
	shll2	r2
	shll	r2
	mov	#64,r3
	shll2	r3
	mov.l	.L060253C0,r14
	mov.w	@(4,r14),r0
	cmp/pz	r2
	bf	.L060253C4
	cmp/eq	r2,r0
	bt	.L060253CC
	cmp/ge	r2,r0
	bf	.L060253BA
	neg	r3,r3
.L060253BA:
	add	r3,r0
	bra	.L060253CC
	nop
.L060253C0:
	.long D_0602500C
.L060253C4:
	cmp/ge	r2,r0
	bt	.L060253CA
	neg	r3,r3
.L060253CA:
	sub	r3,r0
.L060253CC:
	mov.w	r0,@(4,r14)
	rts
	nop
	dlabel D_060253D2
	.byte 0x04, 0xB9, 0x00, 0x78, 0x10, 0x00, 0xF0, 0x00, 0x06, 0x19, 0x00, 0x78, 0x40, 0x00, 0xC0, 0x00
	.byte 0x06, 0x99, 0x00, 0x78, 0x40, 0x00, 0xC0, 0x00, 0x08, 0x75, 0x00, 0x78, 0x40, 0x00, 0xA8, 0x00
	.byte 0x14, 0xED, 0x00, 0x78, 0x40, 0x00, 0xC0, 0x00, 0x16, 0xAD, 0x00, 0x78, 0x40, 0x00, 0xC0, 0x00
	.byte 0x17, 0x31, 0x00, 0x78, 0x40, 0x00, 0xC0, 0x00, 0x18, 0xCD, 0x00, 0x78, 0x40, 0x00, 0xC0, 0x00
	.byte 0x19, 0x51, 0x00, 0x78, 0x40, 0x00, 0xC0, 0x00, 0x1E, 0x8D, 0x00, 0x78, 0x58, 0x00, 0xC0, 0x00
	.byte 0x27, 0xF9, 0x00, 0x78, 0x38, 0x00, 0xC8, 0x00, 0x30, 0x00, 0x00, 0x78, 0x38, 0x00, 0xC8, 0x00
	.byte 0x7F, 0xFF, 0x00, 0x78, 0x40, 0x00, 0xC0, 0x00
	endlabel func_06025394

	glabel func_0602543A
	sts.l	pr,@-r15
	mov.l	@(8,r1),r12
	mov.l	@(12,r1),r13
	mov.b	@(2,r12),r0
	tst	r0,r0
	bt	.L0602544C
	mov.l	.L06025514,r0
	jsr	@r0
	nop
.L0602544C:
	mov.l	@(32,r1),r5
	mov	#2,r2
	cmp/pz	r5
	bt	.L06025456
	mov	#3,r2
.L06025456:
	mov.w	@(6,r1),r0
	and	#112,r0
	cmp/eq	#48,r0
	bf	.L06025466
	mov.w	.L0602550E,r2
	cmp/pz	r5
	bt	.L06025466
	mov.w	.L06025510,r2
.L06025466:
	mov	r2,r0
	mov.w	r0,@(22,r12)
	mov	#-1,r0
	mov.w	r0,@(28,r12)
	mov.b	@(1,r12),r0
	and	#207,r0
	mov.b	r0,@(1,r12)
	sts.l	pr,@-r15
	mov.w	@(6,r1),r0
	and	#112,r0
	mov	#2,r5
	mov	#1,r6
	mov	#1,r4
	cmp/eq	#16,r0
	bt	.L0602549E
	mov	#3,r5
	mov	#8,r6
	mov	#1,r4
	cmp/eq	#32,r0
	bt	.L0602549E
	mov	#1,r5
	mov	#38,r6
	mov	#1,r4
	cmp/eq	#48,r0
	bf	.L0602549E
	mov	#2,r5
	mov	#9,r6
	mov	#5,r4
.L0602549E:
	mov.l	.L06025518,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L060254CC
	mov.b	@(7,r1),r0
	tst	#1,r0
	bf	.L060254CC
	mov.l	.L0602551C,r0
	jsr	@r0
	nop
	sts.l	pr,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	bsr	func_06024F04
	nop
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	lds.l	@r15+,pr
	mov	#0,r0
	mov.b	r0,@(0,r12)
.L060254CC:
	mov	#0,r0
	mov.l	r0,@(0,r1)
	mov.l	r0,@(40,r13)
	mov.l	r0,@(44,r13)
	mov.l	r0,@(36,r13)
	mov.b	r0,@(3,r12)
	mov.b	r0,@(2,r12)
	mov	#0,r0
	mov.b	r0,@(9,r12)
	mov	#48,r4
	add	r13,r4
	mov	#1,r0
	mov.b	r0,@r4
	mov	#120,r0
	mov.b	r0,@(6,r12)
	mov	#64,r3
	add	r1,r3
	mov	#-76,r0
	mov.b	r0,@r3
	bsr	func_06024F04
	nop
	lds.l	@r15+,pr
	mov.l	@(60,r12),r0
	tst	#127,r0
	bf	.L06025502
	mov	#4,r0
	mov.l	r0,@(60,r12)
.L06025502:
	mov.b	@(20,gbr),r0
	cmp/eq	#7,r0
	bf	.L06025524
	mov.l	.L06025520,r0
	jmp	@r0
	nop
.L0602550E:
	.short 0x00E3
.L06025510:
	.short 0x00E4
	.byte 0x00, 0x00
.L06025514:
	.long func_06024354
.L06025518:
	.long func_0600E4C4
.L0602551C:
	.long func_0601B1A4
.L06025520:
	.long D_060C2500
.L06025524:
	mov.l	.L060255B4,r0
	mov.l	r0,@-r1
	add	#4,r1
	dlabel lbl_0602552A
	sts.l	pr,@-r15
	mov.l	@(8,r1),r12
	mov.l	@(12,r1),r13
	mov.l	@(60,r1),r3
	mov.l	@(32,r1),r5
	mov.l	@(52,r1),r4
	add	r5,r3
	mov.l	@(36,r1),r6
	mov.l	r3,@(60,r1)
	add	r6,r4
	mov.l	r4,@(52,r1)
	mov	r5,r0
	shar	r0
	shar	r0
	shar	r0
	shar	r0
	sub	r0,r5
	mov.l	r5,@(32,r1)
	mov	r6,r0
	shar	r0
	shar	r0
	shar	r0
	shar	r0
	sub	r0,r6
	mov.l	r6,@(36,r1)
	mov.w	.L060255B0,r3
	mov	r3,r4
	mov.w	@(26,r1),r0
	tst	r0,r0
	bt	.L06025572
	cmp/pz	r0
	bf	.L0602556C
	neg	r3,r3
.L0602556C:
	add	r3,r0
	neg	r4,r4
	and	r4,r0
.L06025572:
	mov.w	r0,@(26,r1)
	mov.w	r0,@(4,r1)
	mov.w	r0,@(10,r13)
	mov.w	r0,@(8,r13)
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.b	@(1,r12),r0
	and	#8,r0
	tst	r0,r0
	bf	.L0602558C
	mov.l	.L060255B8,r0
	jsr	@r0
	nop
.L0602558C:
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.b	@(6,r12),r0
	dt	r0
	mov.b	r0,@(6,r12)
	bf	.L060255A2
	mov	#64,r0
	mov.b	r0,@(6,r12)
	mov.l	.L060255BC,r0
	mov.l	r0,@-r1
	add	#4,r1
.L060255A2:
	mov.l	.L060255C0,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L060255C4,r0
	jmp	@r0
	nop
.L060255B0:
	.short 0x0400
	.byte 0x00, 0x00
.L060255B4:
	.long lbl_0602552A
.L060255B8:
	.long func_06018E8C
.L060255BC:
	.long func_060225E0
.L060255C0:
	.long func_06024BE0
.L060255C4:
	.long func_06022E5C
	endlabel func_0602543A

	glabel func_060255C8
	mov.l	@(8,r1),r12
	mov.l	@(12,r1),r13
	mov.b	@(2,r12),r0
	tst	r0,r0
	bt	.L060255DC
	sts.l	pr,@-r15
	mov.l	.L060255F4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
.L060255DC:
	sts.l	pr,@-r15
	mov.l	.L060255F8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.w	@(6,r1),r0
	and	#112,r0
	tst	r0,r0
	bt	.L060255FC
	bra	.L060257AC
	nop
	.byte 0x00, 0x00
.L060255F4:
	.long func_06024354
.L060255F8:
	.long func_0602B21E
.L060255FC:
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bt	.L06025658
	sts.l	pr,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r1,@-r15
	mov.l	.L0602563C,r2
	mov.l	.L06025640,r0
	jsr	@r0
	nop
	add	#16,r3
	mov	r3,r1
	mov.l	.L06025644,r12
	mov.l	.L06025648,r13
	mov.l	.L0602564C,r14
	mov.l	.L06025650,r0
	jsr	@r0
	nop
	mov	r1,r3
	mov.l	.L06025654,r4
	mov.l	r1,@r4
	mov.w	.L06025638,r0
	mov.w	r0,@(28,r1)
	mov.l	@r15+,r1
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	lds.l	@r15+,pr
	bra	.L06025660
	nop
.L06025638:
	.short 0xFE00
	.byte 0x00, 0x00
.L0602563C:
	.long D_060FFFA8
.L06025640:
	.long func_0600D0D0
.L06025644:
	.long D_06021B8C
.L06025648:
	.long D_06021BCC
.L0602564C:
	.long D_06021C0C
.L06025650:
	.long func_060220A4
.L06025654:
	.long D_060F3068
.L06025658:
	mov.l	.L060256E8,r3
	mov.l	@r3,r3
	tst	r3,r3
	bt	.L06025690
.L06025660:
	mov.l	.L060256EC,r0
	mov.l	r0,@-r3
	add	#4,r3
	mov.l	@(48,r1),r5
	mov.l	@(52,r1),r6
	mov.l	@(56,r1),r7
	mov.l	r5,@(48,r3)
	mov.l	r6,@(52,r3)
	mov.l	r7,@(56,r3)
	mov.w	@(22,r1),r0
	mov.w	r0,@(22,r3)
	mov.w	@(24,r1),r0
	mov.w	r0,@(24,r3)
	mov.w	@(26,r1),r0
	mov.w	r0,@(26,r3)
	mov.l	@(8,r3),r2
	mov.w	.L060256E0,r0
	mov.w	r0,@(22,r2)
	mov	#0,r0
	mov.w	r0,@(26,r2)
	mov	#0,r0
	mov.b	r0,@(9,r2)
	mov.w	.L060256E2,r0
	mov.w	r0,@(6,r3)
.L06025690:
	mov	#64,r3
	add	r1,r3
	mov	#-76,r0
	mov.b	r0,@r3
	mov.b	@(9,r12),r0
	and	#127,r0
	cmp/eq	#5,r0
	bf	.L060256F8
	mov	#0,r0
	mov.w	r0,@(4,r1)
	mov.w	r0,@(10,r13)
	mov.w	r0,@(8,r13)
	mov.w	r0,@(26,r1)
	mov.w	.L060256E4,r0
	mov.w	r0,@(22,r12)
	mov.w	.L060256E6,r0
	mov.w	r0,@(6,r1)
	mov	#48,r4
	add	r13,r4
	mov	#3,r0
	mov.b	r0,@r4
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#40,r6
	mov.l	.L060256F0,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L060256F4,r0
	mov.l	r0,@-r1
	bra	func_060250B6
	add	#4,r1
.L060256E0:
	.short 0x0005
.L060256E2:
	.short 0x0001
.L060256E4:
	.short 0x00A9
.L060256E6:
	.short 0x0010
.L060256E8:
	.long D_060F3068
.L060256EC:
	.long func_06022208
.L060256F0:
	.long func_0600E4C4
.L060256F4:
	.long func_060250B6
.L060256F8:
	mov.l	@(60,r12),r0
	extu.b	r0,r0
	cmp/eq	#3,r0
	bf	.L06025760
	mov.w	.L06025752,r0
	mov.w	r0,@(22,r12)
	mov.w	.L06025754,r0
	mov.w	r0,@(6,r1)
	mov	#8,r0
	mov.w	r0,@(14,r12)
	mov	#32,r0
	mov.b	r0,@(1,r12)
	sts.l	pr,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	bsr	func_06024F04
	nop
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	lds.l	@r15+,pr
	mov	#0,r0
	mov.b	r0,@(0,r12)
	mov	#48,r4
	add	r13,r4
	mov	#3,r0
	mov.b	r0,@r4
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#40,r6
	mov.l	.L06025758,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L0602575C,r0
	mov.l	r0,@-r1
	jmp	@r0
	add	#4,r1
.L06025752:
	.short 0x008F
.L06025754:
	.short 0x0010
	.byte 0x00, 0x00
.L06025758:
	.long func_0600E4C4
.L0602575C:
	.long func_060225E0
.L06025760:
	mov.b	@(39,gbr),r0
	tst	r0,r0
	bt	.L060257AC
	mov.w	.L060257A0,r0
	mov.w	r0,@(22,r12)
	mov.w	.L060257A2,r0
	mov.w	r0,@(6,r1)
	mov	#0,r0
	mov.b	r0,@(0,r12)
	mov	#48,r4
	add	r13,r4
	mov	#3,r0
	mov.b	r0,@r4
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#40,r6
	mov.l	.L060257A4,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L060257A8,r0
	mov.l	r0,@-r1
	jmp	@r0
	add	#4,r1
.L060257A0:
	.short 0x009D
.L060257A2:
	.short 0x0010
.L060257A4:
	.long func_0600E4C4
.L060257A8:
	.long func_060225E0
.L060257AC:
	mov.l	@(8,r1),r12
	mov.l	@(12,r1),r13
	mov.w	@(26,r1),r0
	mov	r0,r2
	mov.w	@(22,r1),r0
	mov	#-128,r3
	shll8	r3
	and	r3,r0
	mov.w	r0,@(22,r1)
	cmp/pz	r0
	bt	.L060257C4
	neg	r2,r2
.L060257C4:
	mov.w	.L06025992,r0
	cmp/pl	r2
	bt	.L060257CC
	mov.w	.L06025994,r0
.L060257CC:
	mov.w	r0,@(22,r12)
	mov.w	.L06025996,r0
	mov.w	r0,@(28,r12)
	mov.w	@(24,r1),r0
	mov	r0,r2
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L06025824
	mov	#32,r0
	shll8	r0
	add	r0,r2
	mov	#96,r0
	shll8	r0
	shll	r0
	and	r0,r2
	mov	r2,r0
	mov.l	.L060259A4,r3
	mov.l	@r3,r3
	mov.w	r0,@(20,r3)
	mov.w	@(210,gbr),r0
	and	#253,r0
	mov.w	r0,@(210,gbr)
	mov	#0,r0
	mov.w	r0,@(12,r3)
	mov	#0,r2
	mov	#31,r0
	mov.b	r2,@(r0,r1)
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#40,r6
	mov	#1,r4
	mov.w	@(6,r1),r0
	and	#112,r0
	cmp/eq	#16,r0
	bt	.L06025822
	cmp/eq	#48,r0
	bf	.L0602581C
	mov	#2,r5
	mov	#10,r6
	mov	#5,r4
.L0602581C:
	mov.l	.L060259A8,r0
	jsr	@r0
	nop
.L06025822:
	lds.l	@r15+,pr
.L06025824:
	mov	#32,r0
	mov.b	r0,@(1,r12)
	mov	#0,r0
	mov.w	r0,@(14,r12)
	mov.w	r0,@(16,r12)
	mov	#-128,r0
	mov.b	r0,@(9,r12)
	mov.l	.L060259AC,r0
	mov.l	r0,@(44,r1)
	mov.l	@(32,r1),r0
	mov.l	r0,@(0,r1)
	mov	#0,r0
	mov.l	r0,@(32,r1)
	mov.l	r0,@(40,r1)
	mov.l	r0,@(40,r13)
	mov.l	r0,@(44,r13)
	mov.l	r0,@(36,r13)
	mov.l	r0,@(56,r13)
	mov.b	r0,@(3,r12)
	mov.b	r0,@(2,r12)
	mov.l	r0,@(60,r12)
	sts.l	pr,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	bsr	func_06024F04
	nop
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	lds.l	@r15+,pr
	mov	#0,r0
	mov.b	r0,@(0,r12)
	mov	#3,r0
	mov.b	r0,@(8,r12)
	mov	#30,r4
	add	r1,r4
	mov.b	@r4,r0
	and	#247,r0
	mov.b	r0,@r4
	sts.l	pr,@-r15
	mov.l	.L060259B0,r0
	jsr	@r0
	nop
	mov	r0,r2
	mov.b	@(20,gbr),r0
	tst	#1,r0
	mov	r2,r0
	bt	.L06025884
	and	#127,r0
.L06025884:
	mov.w	r0,@(6,r1)
	bsr	func_06024F04
	nop
	mov.l	.L060259B4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov	#48,r4
	add	r13,r4
	mov	#3,r0
	mov.b	r0,@r4
	mov.l	.L060259B8,r0
	mov.l	r0,@-r1
	add	#4,r1
	endlabel func_060255C8

	glabel func_060258A0
	sts.l	pr,@-r15
	mov.l	@(8,r1),r12
	mov.l	@(12,r1),r13
	mov.w	@(24,r1),r0
	mov.w	.L06025998,r2
	add	r2,r0
	mov.l	.L060259BC,r10
	jsr	@r10
	nop
	mov.l	@(0,r1),r4
	shll2	r10
	shll2	r11
	dmuls.l	r4,r10
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	dmuls.l	r4,r11
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	mov.l	@(48,r1),r6
	mov.l	@(56,r1),r7
	add	r2,r6
	add	r3,r7
	mov.l	r6,@(48,r1)
	mov.l	r7,@(56,r1)
	mov.l	r2,@(32,r1)
	mov.l	r3,@(40,r1)
	mov.l	@(52,r1),r4
	mov.l	@(36,r1),r6
	add	r6,r4
	mov.l	r4,@(52,r1)
	mov.w	.L0602599A,r0
	add	r0,r6
	mov.l	r6,@(36,r1)
	mov.l	@(0,r1),r5
	mov	r5,r0
	shar	r0
	shar	r0
	shar	r0
	shar	r0
	shar	r0
	shar	r0
	sub	r0,r5
	mov.l	r5,@(0,r1)
	mov.l	.L060259C0,r0
	jsr	@r0
	nop
	bsr	func_060259F4
	nop
	bsr	func_06025E14
	nop
	mov.b	@(8,r12),r0
	tst	r0,r0
	bf	.L06025980
	mov.w	@(26,r1),r0
	mov	r0,r2
	mov.w	@(22,r1),r0
	cmp/pz	r0
	bt	.L0602591A
	neg	r2,r2
.L0602591A:
	mov.w	.L0602599C,r0
	cmp/pz	r2
	bt	.L0602592C
	mov.w	@(6,r1),r0
	and	#112,r0
	cmp/eq	#32,r0
	mov.w	.L0602599E,r0
	bf	.L0602592C
	mov.w	.L060259A0,r0
.L0602592C:
	mov.w	r0,@(22,r12)
	mov.w	@(26,r1),r0
	mov	r0,r2
	mov.w	@(22,r1),r0
	cmp/pz	r0
	bt	.L0602593A
	neg	r2,r2
.L0602593A:
	mov	r2,r0
	mov	#64,r2
	shll8	r2
	add	r2,r0
	neg	r0,r0
	sub	r2,r0
	mov.l	@(16,r1),r2
	add	#16,r2
	mov.w	r0,@r2
	mov.w	@(22,r1),r0
	mov	r0,r2
	mov.w	@(24,r1),r0
	sub	r2,r0
	mov.w	r0,@(4,r1)
	mov.w	r0,@(24,r1)
	mov	#4,r0
	mov.b	r0,@(0,r12)
	mov	#0,r0
	mov.w	r0,@(22,r1)
	mov.w	r0,@(26,r1)
	mov.w	r0,@(14,r13)
	mov.w	r0,@(18,r13)
	mov.w	r0,@(4,r13)
	mov.l	r0,@(0,r1)
	mov.l	r0,@(32,r1)
	mov.l	r0,@(40,r1)
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L0602597A
	mov.l	.L060259C4,r0
	jsr	@r0
	nop
.L0602597A:
	mov.l	.L060259C8,r0
	mov.l	r0,@-r1
	add	#4,r1
.L06025980:
	mov.l	.L060259CC,r0
	jsr	@r0
	nop
	mov.l	.L060259D0,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06025992:
	.short 0x008F
.L06025994:
	.short 0x008E
.L06025996:
	.short 0x009E
.L06025998:
	.short 0x4000
.L0602599A:
	.short 0x1800
.L0602599C:
	.short 0x00AC
.L0602599E:
	.short 0x00AB
.L060259A0:
	.short 0x00C2
	.byte 0x00, 0x00
.L060259A4:
	.long D_060F309C
.L060259A8:
	.long func_0600E4C4
.L060259AC:
	.long 0x00010000
.L060259B0:
	.long func_06021F04
.L060259B4:
	.long func_0602B21E
.L060259B8:
	.long func_060258A0
.L060259BC:
	.long func_06007BD8
.L060259C0:
	.long func_06024826
.L060259C4:
	.long func_06041384
.L060259C8:
	.long func_060225E0
.L060259CC:
	.long func_06024BE0
.L060259D0:
	.long func_06022EE8
	dlabel D_060259D4
	.long D_060BB1C8
	.long D_060BDF88
	.long D_060BDE28
	.long D_060BE358
	.long D_060BF650
	.long D_060BF5DC
	.long D_060BB1C8
	.long D_060BB1C8
	endlabel func_060258A0

	glabel func_060259F4
	sts.l	pr,@-r15
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	@(548,gbr),r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	.L06025A20,r2
	mov.b	@(20,gbr),r0
	cmp/eq	#12,r0
	bt	.L06025A1C
	cmp/eq	#14,r0
	bt	.L06025A1C
	tst	#1,r0
	bt	.L06025A24
.L06025A1C:
	bra	func_06025E0A
	nop
.L06025A20:
	.long D_060259D4
.L06025A24:
	and	#14,r0
	shll	r0
	mov.l	@(r0,r2),r0
	extu.b	r4,r4
	mov.b	@(r0,r4),r3
	extu.b	r3,r3
	extu.b	r3,r4
	mov.b	@(8,r12),r0
	tst	r0,r0
	bf	.L06025A3C
	mov	r3,r0
	mov.w	r0,@(6,r13)
.L06025A3C:
	shll2	r3
	mov.l	.L06025A48,r0
	mov.l	@(r0,r3),r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06025A48:
	.long func_06025A4C
	endlabel func_060259F4

	glabel func_06025A4C
	stc	sr,r6
	mov.l	@(32,r14),r13
	stc	sr,r6
	mov.l	@(56,r4),r12
	stc	sr,r6
	mov.l	@(24,r4),r12
	stc	sr,r6
	mov.l	@(0,r7),r10
	stc	sr,r6
	mov.l	@(0,r3),r11
	stc	sr,r6
	mov.l	@(0,r6),r11
	stc	sr,r6
	mov.l	@(0,r9),r11
	stc	sr,r6
	mov.l	@(0,r12),r11
	stc	sr,r6
	mov.l	@(0,r0),r11
	bsr	func_06025BF0
	nop
	tst	r0,r0
	bt	.L06025A86
	mov.b	@(20,gbr),r0
	cmp/eq	#0,r0
	bt	.L06025A8A
	cmp/eq	#2,r0
	bt	.L06025AB0
	cmp/eq	#6,r0
	bt	.L06025AD8
.L06025A86:
	bra	func_06025E0A
	nop
.L06025A8A:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#3,r5
	mov	#13,r6
	mov.l	.L06025AAC,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	bra	func_06025E0A
	nop
.L06025AAC:
	.long func_0600E4C4
.L06025AB0:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#3,r5
	mov	#19,r6
	mov.l	.L06025AD4,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	bra	func_06025E0A
	nop
	.byte 0x00, 0x00
.L06025AD4:
	.long func_0600E4C4
.L06025AD8:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#3,r5
	mov	#14,r6
	mov.l	.L06025AFC,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	bra	func_06025E0A
	nop
	.byte 0x00, 0x00
.L06025AFC:
	.long func_0600E4C4
	endlabel func_06025A4C

	glabel func_06025B00
	bsr	func_06025BF0
	nop
	tst	r0,r0
	bt	.L06025B26
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#3,r5
	mov	#6,r6
	mov.l	.L06025B2C,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L06025B26:
	bra	func_06025E0A
	nop
	.byte 0x00, 0x00
.L06025B2C:
	.long func_0600E4C4
	endlabel func_06025B00

	glabel func_06025B30
	bsr	func_06025BF0
	nop
	tst	r0,r0
	bt	.L06025B56
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#3,r5
	mov	#11,r6
	mov.l	.L06025B5C,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L06025B56:
	bra	func_06025E0A
	nop
	.byte 0x00, 0x00
.L06025B5C:
	.long func_0600E4C4
	endlabel func_06025B30

	glabel func_06025B60
	bsr	func_06025BF0
	nop
	tst	r0,r0
	bt	.L06025B86
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#3,r5
	mov	#20,r6
	mov.l	.L06025B8C,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L06025B86:
	bra	func_06025E0A
	nop
	.byte 0x00, 0x00
.L06025B8C:
	.long func_0600E4C4
	endlabel func_06025B60

	glabel func_06025B90
	bsr	func_06025BF0
	nop
	tst	r0,r0
	bt	.L06025BB6
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#3,r5
	mov	#13,r6
	mov.l	.L06025BBC,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L06025BB6:
	bra	func_06025E0A
	nop
	.byte 0x00, 0x00
.L06025BBC:
	.long func_0600E4C4
	endlabel func_06025B90

	glabel func_06025BC0
	bsr	func_06025BF0
	nop
	tst	r0,r0
	bt	.L06025BE6
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#3,r5
	mov	#17,r6
	mov.l	.L06025BEC,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L06025BE6:
	bra	func_06025E0A
	nop
	.byte 0x00, 0x00
.L06025BEC:
	.long func_0600E4C4
	endlabel func_06025BC0

	glabel func_06025BF0
	mov.b	@(8,r12),r0
	tst	r0,r0
	bf	.L06025C36
	mov.l	@(40,r13),r0
	tst	r0,r0
	bt	.L06025C30
	mov.w	@(26,r12),r0
	mov	r0,r2
	mov	#45,r0
	cmp/ge	r0,r2
	bt	.L06025C14
	mov	#30,r0
	cmp/ge	r0,r2
	bt	.L06025C14
	mov	#15,r0
	cmp/ge	r0,r2
	bt	.L06025C14
	mov	#0,r0
.L06025C14:
	mov.l	.L06025C2C,r2
	mov.w	@r2,r3
	cmp/eq	r3,r0
	bt	.L06025C30
	mov.w	r0,@r2
	cmp/eq	#0,r0
	bt	.L06025C26
	cmp/eq	#30,r0
	bf	.L06025C30
.L06025C26:
	mov	#1,r0
	rts
	nop
.L06025C2C:
	.long D_06025C44
.L06025C30:
	mov	#0,r0
	rts
	nop
.L06025C36:
	mov.l	.L06025C40,r2
	mov	#1,r0
	bra	.L06025C30
	mov.w	r0,@r2
	.byte 0x00, 0x00
.L06025C40:
	.long D_06025C44
	dlabel D_06025C44
	.byte 0x00, 0x00, 0xE0, 0x00, 0x80, 0xD2, 0xA0, 0xDE, 0x00, 0x09, 0x52, 0x18, 0x53, 0x1A, 0x56, 0x1C
	.byte 0x57, 0x1E, 0x36, 0x28, 0x37, 0x38, 0x11, 0x6C, 0x11, 0x7E
	endlabel func_06025BF0

	glabel func_06025C5E
	mov.l	r4,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	mov.l	@(32,r1),r0
	add	r0,r2
	mov.l	@(548,gbr),r0
	jsr	@r0
	nop
	mov.l	.L06025CEC,r2
	mov.b	@(20,gbr),r0
	and	#14,r0
	shll	r0
	mov.l	@(r0,r2),r0
	extu.b	r4,r4
	mov.b	@(r0,r4),r4
	extu.b	r4,r4
	mov.l	r4,@-r15
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	mov.l	@(40,r1),r0
	add	r0,r3
	mov.l	@(548,gbr),r0
	jsr	@r0
	nop
	mov.l	.L06025CEC,r2
	mov.b	@(20,gbr),r0
	and	#14,r0
	shll	r0
	mov.l	@(r0,r2),r0
	extu.b	r4,r4
	mov.b	@(r0,r4),r4
	extu.b	r4,r4
	mov	r4,r6
	mov.l	@r15+,r5
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r15+,r4
	mov	#0,r3
	cmp/eq	r4,r5
	bf	.L06025CBE
	mov.l	@(32,r1),r0
	cmp/pz	r0
	bt	.L06025CBE
	mov.w	.L06025CE4,r3
.L06025CBE:
	cmp/eq	r4,r6
	bf	.L06025CD4
	mov.w	.L06025CE6,r2
	mov.l	@(40,r1),r0
	cmp/pz	r0
	bt	.L06025CCC
	mov.w	.L06025CE8,r2
.L06025CCC:
	add	r2,r3
	cmp/eq	r4,r5
	bf	.L06025CD4
	shlr	r3
.L06025CD4:
	mov	r3,r5
	mov.b	@(8,r12),r0
	tst	#2,r0
	bf	.L06025CF0
	mov	r5,r0
	mov.w	r0,@(24,r1)
	bra	.L06025D26
	nop
.L06025CE4:
	.short 0x8000
.L06025CE6:
	.short 0xC000
.L06025CE8:
	.short 0x4000
	.byte 0x00, 0x00
.L06025CEC:
	.long D_060259D4
.L06025CF0:
	mov	r5,r0
	mov.w	r0,@(24,r1)
	mov	#-125,r0
	mov.b	r0,@(8,r12)
	mov.w	@(22,r12),r0
	mov.w	.L06025D06,r2
	cmp/eq	r0,r2
	bt	.L06025D0A
	mov.w	.L06025D08,r0
	bra	.L06025D12
	nop
.L06025D06:
	.short 0x008F
.L06025D08:
	.short 0x008E
.L06025D0A:
	mov.w	.L06025D22,r2
	cmp/eq	r0,r2
	bt	.L06025D1E
	mov.w	.L06025D24,r0
.L06025D12:
	mov.w	r0,@(22,r12)
	mov	#-128,r2
	shll8	r2
	mov.w	@(26,r1),r0
	add	r2,r0
	mov.w	r0,@(26,r1)
.L06025D1E:
	bra	.L06025D74
	nop
.L06025D22:
	.short 0x008E
.L06025D24:
	.short 0x008F
.L06025D26:
	mov.l	.L06025DBC,r0
	mov.l	@(40,r13),r2
	cmp/pz	r2
	bt	.L06025D30
	neg	r0,r0
.L06025D30:
	mov.l	r0,@(40,r13)
	mov.l	.L06025DC0,r0
	mov.l	r0,@(36,r1)
	mov.w	@(28,r12),r0
	cmp/pz	r0
	bf	.L06025D52
	mov.l	.L06025DC4,r0
	mov.l	r0,@(40,r13)
	mov.l	.L06025DC8,r0
	mov.l	r0,@(36,r1)
	mov.b	@(8,r12),r0
	tst	r0,r0
	bt	.L06025D52
	mov.l	.L06025DCC,r0
	mov.l	r0,@(40,r13)
	mov.l	.L06025DD0,r0
	mov.l	r0,@(36,r1)
.L06025D52:
	mov.w	.L06025DB6,r0
	mov.w	r0,@(22,r12)
	mov	#0,r0
	mov.w	r0,@(24,r12)
	mov.w	.L06025DB8,r0
	mov.w	r0,@(28,r12)
	mov	#32,r0
	mov.b	r0,@(1,r12)
	mov	#0,r0
	mov.w	r0,@(14,r12)
	mov.w	r0,@(16,r12)
	mov	#-127,r0
	mov.b	r0,@(8,r12)
	mov	#48,r4
	add	r13,r4
	mov	#2,r0
	mov.b	r0,@r4
.L06025D74:
	mov.l	.L06025DD4,r2
	mov.l	.L06025DD8,r0
	jsr	@r0
	nop
	mov.l	.L06025DDC,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	@(48,r1),r0
	mov.l	r0,@(48,r3)
	mov.l	@(52,r1),r0
	mov.l	r0,@(52,r3)
	mov.l	@(56,r1),r0
	mov.l	r0,@(56,r3)
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#12,r6
	mov.l	.L06025DE0,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L06025DE4,r2
	mov	#31,r0
	mov.b	r0,@r2
	bra	func_06025E0A
	nop
.L06025DB6:
	.short 0x00AE
.L06025DB8:
	.short 0x009E
	.byte 0x00, 0x00
.L06025DBC:
	.long 0xFFFE0000
.L06025DC0:
	.long 0xFFFB0000
.L06025DC4:
	.long 0xFFFC0000
.L06025DC8:
	.long 0xFFF50000
.L06025DCC:
	.long 0xFFFF0000
.L06025DD0:
	.long 0xFFFA0000
.L06025DD4:
	.long D_060FFFB8
.L06025DD8:
	.long func_0600D0D0
.L06025DDC:
	.long func_06043A34
.L06025DE0:
	.long func_0600E4C4
.L06025DE4:
	.long D_060DB2E8
	.byte 0xE0, 0x00, 0x81, 0xD3, 0x84, 0xD2, 0x88, 0x22, 0x89, 0x0B, 0xE0, 0x22, 0x80, 0xD2, 0x85, 0xCB
	.byte 0x92, 0x0A, 0x30, 0x20, 0x8B, 0x05, 0x92, 0x08, 0x88, 0x01, 0x8B, 0x00, 0xE2, 0x73, 0x60, 0x23
	.byte 0x81, 0xCB
	endlabel func_06025C5E

	glabel func_06025E0A
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x8C, 0x00, 0xBB
	endlabel func_06025E0A

	glabel func_06025E14
	sts.l	pr,@-r15
	mov	#30,r2
	add	r1,r2
	mov.b	@r2,r0
	and	#8,r0
	tst	r0,r0
	bf	.L06025E6C
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	@(52,r1),r0
	mov	#32,r2
	shll16	r2
	sub	r2,r0
	sub	r0,r4
	cmp/pl	r4
	bf	.L06025E44
	mov.l	@(52,r1),r0
	add	r4,r0
	mov.l	r0,@(52,r1)
	mov	#0,r0
	mov.l	r0,@(36,r1)
.L06025E44:
	mov.l	@(52,r1),r2
	mov.b	@(2,r13),r0
	shll16	r0
	add	r2,r0
	sub	r0,r5
	cmp/pz	r5
	bt	.L06025E66
	mov.l	@(36,r1),r0
	cmp/pz	r0
	bf	.L06025E66
	mov	#0,r0
	mov.b	r0,@(8,r12)
	mov.l	r0,@(36,r1)
	mov.l	r0,@(32,r1)
	mov.l	@(52,r1),r0
	add	r5,r0
	mov.l	r0,@(52,r1)
.L06025E66:
	lds.l	@r15+,pr
	rts
	nop
.L06025E6C:
	mov.b	@(8,r12),r0
	tst	r0,r0
	bt	.L06025E66
	mov	#0,r0
	mov.b	r0,@(8,r12)
	mov.l	r0,@(36,r1)
	mov.l	r0,@(32,r1)
	bra	.L06025E66
	nop
	endlabel func_06025E14

	glabel func_06025E7E
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	bsr	func_0602641C
	nop
	mov.l	@(8,r1),r12
	mov.l	@(12,r1),r13
	mov.b	@(1,r12),r0
	and	#16,r0
	tst	r0,r0
	bt	.L06025EA2
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	lds.l	@r15+,pr
	rts
	nop
.L06025EA2:
	cmp/ge	r4,r6
	bt	.L06025EA8
	mov	r4,r6
.L06025EA8:
	mov.l	@(52,r1),r0
	mov	#32,r2
	shll16	r2
	mov.l	@(44,r1),r4
	dmuls.l	r4,r2
	sts	mach,r4
	sts	macl,r2
	xtrct	r4,r2
	sub	r2,r0
	sub	r0,r6
	cmp/pl	r6
	bt	.L06025EC4
	bra	.L06025F32
	nop
.L06025EC4:
	mov.l	@(52,r1),r0
	add	r6,r0
	mov.l	r0,@(52,r1)
	mov	#56,r0
	add	r13,r0
	mov.b	@r0,r0
	tst	r0,r0
	bt	.L06025EE0
	sts.l	pr,@-r15
	bsr	func_060260A8
	mov	#1,r2
	lds.l	@r15+,pr
	bra	.L06025F32
	nop
.L06025EE0:
	mov.b	@(2,r12),r0
	tst	r0,r0
	bf	.L06025F0C
	mov	#64,r2
	shll8	r2
	mov.w	@(26,r1),r0
	add	r2,r0
	add	r2,r0
	sub	r8,r0
	exts.w	r0,r0
	cmp/pz	r0
	bt	.L06025EFA
	neg	r2,r2
.L06025EFA:
	mov	r8,r0
	sub	r2,r0
	mov.w	r0,@(4,r1)
	mov.w	r0,@(10,r13)
	mov.w	r0,@(8,r13)
	bsr	func_0602604C
	nop
	bra	.L06025F32
	nop
.L06025F0C:
	mov	#-128,r2
	shll8	r2
	mov.w	@(4,r1),r0
	add	r0,r2
	mov	r8,r0
	add	r0,r0
	sub	r2,r0
	mov.w	r0,@(4,r1)
	mov.w	r0,@(26,r1)
	mov.w	r0,@(10,r13)
	mov.w	r0,@(8,r13)
	mov	#0,r0
	mov.b	r0,@(5,r12)
	mov.w	@(6,r1),r0
	and	#112,r0
	tst	r0,r0
	bf	.L06025F32
	mov	#52,r0
	mov.w	r0,@(22,r12)
.L06025F32:
	cmp/ge	r5,r7
	bf	.L06025F38
	mov	r5,r7
.L06025F38:
	mov.l	@(36,r1),r3
	cmp/pz	r3
	bf	.L06025F72
	mov.l	@(36,r1),r3
	mov.l	@(52,r1),r2
	mov.b	@(2,r13),r0
	shll16	r0
	mov.l	@(44,r1),r5
	dmuls.l	r5,r0
	sts	mach,r5
	sts	macl,r0
	xtrct	r5,r0
	add	r0,r2
	sub	r3,r2
	sub	r7,r2
	mov	#-128,r0
	shll16	r0
	cmp/ge	r0,r2
	bf	.L06025F72
	neg	r2,r2
	shll	r2
	shlr8	r2
	dmuls.l	r3,r2
	sts	mach,r2
	sts	macl,r0
	xtrct	r2,r0
	sub	r3,r0
	mov.l	@(52,r1),r2
	add	r0,r2
.L06025F72:
	mov.l	@(52,r1),r2
	mov.b	@(2,r13),r0
	shll16	r0
	mov.l	@(44,r1),r5
	dmuls.l	r5,r0
	sts	mach,r5
	sts	macl,r0
	xtrct	r5,r0
	add	r2,r0
	sub	r0,r7
	tst	r7,r7
	bt	.L06026008
	cmp/pz	r7
	bt	.L0602603C
	mov.l	@(52,r1),r0
	add	r7,r0
	mov.l	r0,@(52,r1)
	mov	#56,r0
	add	r13,r0
	mov.b	@r0,r0
	tst	r0,r0
	bt	.L06025FAA
	sts.l	pr,@-r15
	bsr	func_060260A8
	mov	#0,r2
	lds.l	@r15+,pr
	bra	.L0602603C
	nop
.L06025FAA:
	mov.w	@(28,r12),r0
	cmp/pz	r0
	bt	.L0602603C
	mov.b	@(2,r12),r0
	tst	r0,r0
	bf	.L06025FE2
	mov	#64,r2
	shll8	r2
	mov.w	@(26,r1),r0
	add	r2,r0
	add	r2,r0
	sub	r9,r0
	exts.w	r0,r0
	cmp/pz	r0
	bt	.L06025FCA
	neg	r2,r2
.L06025FCA:
	mov.l	@(40,r13),r0
	tst	r0,r0
	bt	.L06026008
	mov	r9,r0
	sub	r2,r0
	mov.w	r0,@(4,r1)
	mov.w	r0,@(10,r13)
	mov.w	r0,@(8,r13)
	bsr	func_0602604E
	mov	#0,r4
	bra	.L06026008
	nop
.L06025FE2:
	mov	#-128,r2
	shll8	r2
	mov.w	@(4,r1),r0
	add	r0,r2
	mov	r9,r0
	add	r0,r0
	sub	r2,r0
	mov.w	r0,@(4,r1)
	mov.w	r0,@(26,r1)
	mov.w	r0,@(10,r13)
	mov.w	r0,@(8,r13)
	mov	#0,r0
	mov.b	r0,@(5,r12)
	mov.w	@(6,r1),r0
	and	#112,r0
	tst	r0,r0
	bf	.L06026008
	mov	#52,r0
	mov.w	r0,@(22,r12)
.L06026008:
	mov	#0,r4
	mov.l	r4,@(36,r13)
	mov.l	r4,@(32,r13)
	mov.l	@(40,r13),r4
	mov.l	@(44,r13),r0
	add	r4,r0
	tst	r0,r0
	bf	.L0602603C
	mov.w	@(26,r1),r0
	tst	r0,r0
	bf	.L0602603C
	mov.b	@(20,gbr),r0
	cmp/eq	#12,r0
	bt	.L0602603C
	cmp/eq	#14,r0
	bt	.L0602603C
	mov.w	@(22,r12),r0
	mov.w	.L06026048,r3
	cmp/eq	r3,r0
	bf	.L06026034
	mov.w	.L0602604A,r0
	mov.w	r0,@(22,r12)
.L06026034:
	cmp/eq	#54,r0
	bf	.L0602603C
	mov	#60,r0
	mov.w	r0,@(22,r12)
.L0602603C:
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	lds.l	@r15+,pr
	rts
	nop
.L06026048:
	.short 0x00F8
.L0602604A:
	.short 0x00FB
	endlabel func_06025E7E

	glabel func_0602604C
	mov.w	.L0602608C,r4
	endlabel func_0602604C

	glabel func_0602604E
	mov.b	@(0,r12),r0
	tst	r0,r0
	bf	.L06026088
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L0602608E
	cmp/eq	#2,r0
	bt	.L0602608E
	cmp/eq	#8,r0
	bt	.L0602608E
	cmp/eq	#12,r0
	bt	.L0602608E
	cmp/eq	#14,r0
	bt	.L0602608E
	mov	#55,r3
	mov.w	@(26,r1),r0
	mov	r0,r2
	mov.w	@(22,r1),r0
	cmp/pz	r2
	bf	.L0602607A
	mov.w	.L0602608C,r2
	add	r2,r0
.L0602607A:
	add	r4,r0
	exts.w	r0,r0
	cmp/pz	r0
	bf	.L06026084
	mov	#56,r3
.L06026084:
	mov	r3,r0
	mov.w	r0,@(22,r12)
.L06026088:
	rts
	nop
.L0602608C:
	.short 0x8000
.L0602608E:
	mov.w	@(22,r12),r0
	mov.w	.L060260A4,r3
	cmp/ge	r3,r0
	bf	.L060260A0
	mov.w	.L060260A6,r3
	cmp/gt	r3,r0
	bt	.L060260A0
	mov	#23,r0
	mov.w	r0,@(22,r12)
.L060260A0:
	rts
	nop
.L060260A4:
	.short 0x00C5
.L060260A6:
	.short 0x00E2
	endlabel func_0602604E

	glabel func_060260A8
	mov	#57,r4
	add	r13,r4
	mov.b	@r4,r0
	tst	r0,r0
	bf	.L060260C0
	add	#-1,r4
	mov	#0,r0
	mov.l	r0,@r4
	mov	#0,r0
	mov.b	r0,@(0,r12)
	rts
	nop
.L060260C0:
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	.L060261BC,r3
	mov.l	@r3,r3
	mov.l	@(8,r3),r12
	mov.l	@(12,r3),r13
	mov.b	@(2,r12),r0
	tst	r0,r0
	bt	.L0602610E
	sts.l	pr,@-r15
	mov.l	r7,@-r15
	mov	#-128,r0
	mov.b	r0,@(9,r12)
	mov	#0,r0
	mov.b	r0,@(10,r12)
	mov	#23,r0
	mov.w	r0,@(30,r12)
	mov	#0,r0
	mov.b	r0,@(2,r12)
	mov.b	r0,@(7,r12)
	mov.l	.L060261C0,r0
	jsr	@r0
	nop
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	.L060261C4,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	nop
	mov.l	@r15+,r7
	lds.l	@r15+,pr
.L0602610E:
	mov	#58,r4
	add	r13,r4
	mov.b	@(0,r12),r0
	cmp/eq	#8,r0
	bf/s	.L0602611E
	mov.b	@r4+,r0
	tst	r0,r0
	bf	.L060261AA
.L0602611E:
	mov.b	r2,@r4
	mov	#2,r0
	mov.b	r0,@-r4
	add	#-1,r4
	mov	#-1,r0
	mov.b	r0,@-r4
	mov.b	@(0,r12),r0
	cmp/eq	#8,r0
	bf/s	.L0602614C
	mov	#0,r0
	mov.l	.L060261C8,r5
	mov.w	@(26,r3),r0
	tst	r2,r2
	bt	.L06026140
	mov	#-128,r4
	shll8	r4
	add	r4,r0
.L06026140:
	mov.w	.L060261BA,r4
	add	r4,r0
	extu.w	r0,r0
	add	r4,r4
	cmp/ge	r4,r0
	bt	.L0602614E
.L0602614C:
	mov.l	.L060261CC,r5
.L0602614E:
	mov.l	@(36,r3),r4
	tst	r2,r2
	bt	.L06026158
	neg	r4,r4
	neg	r5,r5
.L06026158:
	cmp/pz	r4
	bf	.L060261AA
	mov.l	r5,@(36,r3)
	shlr8	r0
	shlr2	r0
	shlr2	r0
	shlr	r0
	and	#6,r0
	mov.l	.L060261D0,r2
	add	r0,r2
	mov.l	.L060261D4,r4
	mov	#1,r5
	tst	r0,r0
	bt	.L0602617A
	mov	#13,r0
	mov.b	r0,@(9,r12)
	add	#1,r5
.L0602617A:
	mov.l	r5,@r4
	mov.w	@r2,r0
	mov.w	r0,@(22,r12)
	mov.l	@(32,r3),r0
	shar	r0
	shar	r0
	shar	r0
	mov.l	r0,@(32,r3)
	mov	#8,r0
	mov.b	r0,@(0,r12)
	mov	#1,r4
	shll16	r4
	mov.l	r4,@(0,r3)
	mov	#0,r4
	mov.l	r4,@(36,r13)
	mov.l	r4,@(32,r13)
	mov.l	r4,@(40,r13)
	mov.l	r4,@(44,r13)
	mov.l	.L060261D8,r0
	mov.l	.L060261DC,r2
	mov.l	@r0,r3
	cmp/ge	r2,r3
	bt	.L060261AA
	mov.l	r2,@r0
.L060261AA:
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	nop
.L060261BA:
	.short 0x2000
.L060261BC:
	.long D_060F3064
.L060261C0:
	.long func_0602B1CC
.L060261C4:
	.long func_0600E4F6
.L060261C8:
	.long 0xFFFA0000
.L060261CC:
	.long 0xFFF80000
.L060261D0:
	.long D_060261E0
.L060261D4:
	.long D_060BED40
.L060261D8:
	.long D_060BF224
.L060261DC:
	.long D_060BF524
	dlabel D_060261E0
	.byte 0x00, 0x21, 0x00, 0x24, 0x00, 0x23, 0x00, 0x22
	endlabel func_060260A8

	glabel func_060261E8
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	bsr	func_06026520
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.b	@(1,r12),r0
	and	#16,r0
	tst	r0,r0
	bf	.L060262AE
	mov.l	@(52,r1),r0
	mov	#32,r2
	shll16	r2
	mov.l	@(44,r1),r6
	dmuls.l	r6,r2
	sts	mach,r6
	sts	macl,r2
	xtrct	r6,r2
	sub	r2,r0
	sub	r0,r4
	sub	r0,r6
	cmp/pl	r4
	bf	.L06026236
	mov.l	@(52,r1),r0
	add	r4,r0
	mov.l	r0,@(52,r1)
	mov	#0,r0
	mov.l	r0,@(36,r1)
.L06026236:
	mov	#30,r2
	add	r1,r2
	mov.b	@r2,r0
	and	#8,r0
	tst	r0,r0
	bf	.L06026304
	mov.l	@(52,r1),r2
	mov.b	@(2,r13),r0
	shll16	r0
	mov.l	@(44,r1),r6
	dmuls.l	r6,r0
	sts	mach,r6
	sts	macl,r0
	xtrct	r6,r0
	add	r2,r0
	sub	r0,r5
	sub	r0,r7
	sub	r0,r11
	mov.b	@(8,r12),r0
	tst	r0,r0
	bf	.L060262EC
	bra	.L06026280
	nop
	.byte 0x3B, 0x70, 0x8B, 0x0B, 0x60, 0x73, 0x30, 0x58, 0xE4, 0xF0, 0x44, 0x28, 0x30, 0x43, 0x8B, 0x05
	.byte 0xE4, 0x10, 0x44, 0x28, 0x44, 0x08, 0x44, 0x08, 0x30, 0x43, 0x89, 0x2A
.L06026280:
	mov	#16,r4
	shll16	r4
	cmp/ge	r4,r5
	bf	.L060262A4
	mov	#1,r0
	mov.b	r0,@(8,r12)
	mov	#0,r0
	mov.l	r0,@(36,r1)
	mov.w	@(28,r12),r0
	cmp/pz	r0
	bt	.L060262AA
	mov.w	.L060262A2,r0
	mov.w	r0,@(22,r12)
	mov	#0,r0
	mov.w	r0,@(24,r12)
	bra	.L060262AA
	nop
.L060262A2:
	.short 0x0083
.L060262A4:
	mov.l	@(52,r1),r0
	add	r5,r0
	mov.l	r0,@(52,r1)
.L060262AA:
	mov	r9,r0
	mov.w	r0,@(4,r13)
.L060262AE:
	mov	#0,r0
.L060262B0:
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_060261E8

	glabel func_060262C6
	mov.l	r0,@-r15
	mov.l	@(52,r1),r0
	add	r5,r0
	mov.l	r0,@(52,r1)
	mov.l	@r15+,r0
	mov	#-1,r0
	bra	.L060262B0
	nop
	endlabel func_060262C6

	glabel func_060262D6
	mov.l	r0,@-r15
	mov.l	@(52,r1),r0
	add	r5,r0
	mov.l	r0,@(52,r1)
	mov.w	.L060262EA,r0
	mov.w	r0,@(22,r12)
	mov.l	@r15+,r0
	mov	#-1,r0
	bra	.L060262B0
	nop
.L060262EA:
	.short 0x00AD
.L060262EC:
	cmp/pz	r5
	bt	.L060262AA
	mov.l	@(52,r1),r0
	add	r5,r0
	mov.l	r0,@(52,r1)
	mov.l	@(36,r1),r0
	cmp/pz	r0
	bf	.L060262AA
	bsr	func_06026314
	nop
	bra	.L060262AA
	nop
.L06026304:
	mov	#0,r9
	mov.b	@(8,r12),r0
	tst	r0,r0
	bt	.L060262AE
	bsr	func_06026314
	nop
	bra	.L060262AE
	nop
	endlabel func_060262D6

	glabel func_06026314
	mov.b	@(2,r12),r0
	tst	r0,r0
	bt	.L06026324
	mov.l	.L06026320,r0
	jmp	@r0
	nop
.L06026320:
	.long func_06023716
.L06026324:
	mov	#0,r0
	mov.b	r0,@(8,r12)
	mov.l	r0,@(36,r1)
	mov.l	r0,@(32,r1)
	mov	#0,r0
	mov.w	r0,@(26,r1)
	mov	#0,r6
	mov.l	@(40,r13),r5
	cmp/pz	r5
	bf	.L0602633E
	mov.l	.L06026360,r6
	cmp/ge	r6,r5
	bf	.L06026340
.L0602633E:
	mov.l	r6,@(40,r13)
.L06026340:
	mov.w	.L06026358,r3
	mov.w	@(22,r12),r0
	mov.w	.L0602635A,r2
	cmp/eq	r2,r0
	bf	.L06026350
	mov.w	.L0602635C,r3
	mov	#0,r6
	mov.l	r6,@(40,r13)
.L06026350:
	mov	r3,r0
	mov.w	r0,@(22,r12)
	rts
	nop
.L06026358:
	.short 0x0085
.L0602635A:
	.short 0x00AE
.L0602635C:
	.short 0x00AC
	.byte 0x00, 0x00
.L06026360:
	.long 0x00020000
	endlabel func_06026314

	glabel func_06026364
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	bsr	func_06026678
	nop
	mov.l	@(8,r1),r12
	mov.l	@(12,r1),r13
	mov.b	@(1,r12),r0
	and	#16,r0
	tst	r0,r0
	bf	.L06026400
	mov.l	@(52,r1),r0
	mov	#16,r2
	shll16	r2
	sub	r2,r0
	sub	r0,r4
	sub	r0,r6
	cmp/ge	r4,r6
	bt	.L0602639E
	mov	r4,r6
.L0602639E:
	cmp/pl	r6
	bf	.L060263BE
	mov.l	@(52,r1),r0
	add	r6,r0
	mov.l	r0,@(52,r1)
	mov	#64,r2
	shll8	r2
	mov.w	@(26,r1),r0
	cmp/pz	r0
	bt	.L060263B4
	neg	r2,r2
.L060263B4:
	mov	r8,r0
	sub	r2,r0
	mov.w	r0,@(4,r1)
	mov.w	r0,@(10,r13)
	mov.w	r0,@(8,r13)
.L060263BE:
	mov.l	@(52,r1),r0
	mov	#16,r2
	shll16	r2
	add	r2,r0
	sub	r0,r5
	sub	r0,r7
	cmp/ge	r5,r7
	bf	.L060263D0
	mov	r5,r7
.L060263D0:
	tst	r7,r7
	bt	.L060263F6
	cmp/pz	r7
	bt	.L06026400
	mov.l	@(52,r1),r0
	add	r7,r0
	mov.l	r0,@(52,r1)
	mov	#64,r2
	shll8	r2
	mov.w	@(26,r1),r0
	cmp/pz	r0
	bt	.L060263EA
	neg	r2,r2
.L060263EA:
	mov	r9,r0
	add	r2,r0
	mov.w	r0,@(4,r1)
	mov.w	r0,@(26,r1)
	mov.w	r0,@(10,r13)
	mov.w	r0,@(8,r13)
.L060263F6:
	mov	#0,r4
	mov.l	r4,@(36,r13)
	mov.l	r4,@(32,r13)
	mov	#0,r0
	mov.l	r0,@(36,r1)
.L06026400:
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06026364

	glabel func_0602641C
	sts.l	pr,@-r15
	mov.l	@(8,r1),r12
	mov.b	@(1,r12),r0
	and	#9,r0
	tst	r0,r0
	bf	.L060264BC
	mov.l	@(60,r1),r3
	mov.l	r3,@-r15
	mov	#16,r0
	shll16	r0
	add	r0,r3
	mov	#31,r0
	mov.b	@(r0,r1),r0
	mov.l	.L060264B0,r10
	jsr	@r10
	nop
	mov	r6,r2
	mov	r7,r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	@r15+,r3
	mov.l	r4,@-r15
	mov.l	r5,@-r15
	mov	#16,r0
	shll16	r0
	sub	r0,r3
	mov	#31,r0
	mov.b	@(r0,r1),r0
	mov.l	.L060264B0,r10
	jsr	@r10
	nop
	mov	r6,r2
	mov	r7,r3
.L06026460:
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	@r15+,r7
	mov.l	@r15+,r6
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r7,@-r15
	mov.l	r5,@-r15
	mov	#32,r2
	shll16	r2
	mov	r4,r3
	sub	r6,r3
	mov.l	.L060264B4,r0
	jsr	@r0
	nop
	mov.l	.L060264B8,r2
	add	r2,r0
	mov	r0,r8
	mov.l	@r15+,r5
	mov.l	@r15+,r7
	mov.l	r8,@-r15
	mov	#32,r2
	shll16	r2
	mov	r5,r3
	sub	r7,r3
	mov.l	.L060264B4,r0
	jsr	@r0
	nop
	mov	r0,r9
	mov.l	@r15+,r8
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	lds.l	@r15+,pr
	rts
	nop
.L060264B0:
	.long func_06018EB4
.L060264B4:
	.long func_06007C1C
.L060264B8:
	.long 0x00008000
.L060264BC:
	mov.w	@(24,r1),r0
	mov	#64,r2
	shll8	r2
	add	r2,r0
	neg	r0,r0
	mov.l	.L0602651C,r14
	jsr	@r14
	nop
	mov	#16,r4
	shll16	r4
	neg	r10,r10
	neg	r11,r11
	shll2	r10
	shll2	r11
	dmuls.l	r4,r10
	sts	mach,r2
	sts	macl,r0
	xtrct	r2,r0
	mov.l	@(48,r1),r2
	add	r0,r2
	dmuls.l	r4,r11
	sts	mach,r3
	sts	macl,r0
	xtrct	r3,r0
	mov.l	@(56,r1),r3
	sub	r0,r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	r4,@-r15
	mov.l	r5,@-r15
	mov	#-16,r4
	shll16	r4
	dmuls.l	r4,r10
	sts	mach,r2
	sts	macl,r0
	xtrct	r2,r0
	mov.l	@(48,r1),r2
	add	r0,r2
	dmuls.l	r4,r11
	sts	mach,r3
	sts	macl,r0
	xtrct	r3,r0
	mov.l	@(56,r1),r3
	sub	r0,r3
	bra	.L06026460
	nop
	.byte 0x00, 0x00
.L0602651C:
	.long func_06007BD8
	endlabel func_0602641C

	glabel func_06026520
	sts.l	pr,@-r15
	mov.w	@(24,r1),r0
	mov	#64,r2
	shll8	r2
	sub	r2,r0
	mov.l	.L060265DC,r14
	jsr	@r14
	nop
	mov	#32,r4
	shll16	r4
	neg	r10,r10
	neg	r11,r11
	shll2	r10
	shll2	r11
	dmuls.l	r4,r10
	sts	mach,r2
	sts	macl,r0
	xtrct	r2,r0
	mov.l	@(48,r1),r2
	add	r0,r2
	dmuls.l	r4,r11
	sts	mach,r3
	sts	macl,r0
	xtrct	r3,r0
	mov.l	@(56,r1),r3
	add	r0,r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	r4,@-r15
	mov.l	r5,@-r15
	mov	#16,r4
	shll16	r4
	dmuls.l	r4,r10
	sts	mach,r2
	sts	macl,r0
	xtrct	r2,r0
	mov.l	@(48,r1),r2
	add	r0,r2
	dmuls.l	r4,r11
	sts	mach,r3
	sts	macl,r0
	xtrct	r3,r0
	mov.l	@(56,r1),r3
	add	r0,r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	r4,@-r15
	mov.l	r5,@-r15
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	@r15+,r7
	mov.l	@r15+,r6
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r7,@-r15
	mov.l	r5,@-r15
	mov	#16,r2
	shll16	r2
	mov	r4,r3
	sub	r6,r3
	mov.l	.L060265E0,r0
	jsr	@r0
	nop
	mov.l	.L060265E4,r2
	add	r2,r0
	mov	r0,r8
	mov.l	@r15+,r5
	mov.l	@r15+,r7
	mov.l	r8,@-r15
	mov	#16,r2
	shll16	r2
	mov	r5,r3
	sub	r7,r3
	mov.l	.L060265E0,r0
	jsr	@r0
	nop
	mov	r0,r9
	mov.l	@r15+,r8
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	mov.l	@r15+,r11
	mov.l	@r15+,r10
	lds.l	@r15+,pr
	rts
	nop
.L060265DC:
	.long func_06007BD8
.L060265E0:
	.long func_06007C1C
.L060265E4:
	.long 0x00008000
	endlabel func_06026520

	glabel func_060265E8
	sts.l	pr,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.w	@(24,r1),r0
	mov.l	.L06026670,r14
	jsr	@r14
	nop
	neg	r10,r10
	neg	r11,r11
	shll2	r10
	shll2	r11
	mov	#-16,r4
	shll16	r4
	dmuls.l	r4,r10
	sts	mach,r2
	sts	macl,r0
	xtrct	r2,r0
	mov.l	@(48,r1),r2
	add	r0,r2
	dmuls.l	r4,r11
	sts	mach,r3
	sts	macl,r0
	xtrct	r3,r0
	mov.l	@(56,r1),r3
	add	r0,r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	r4,@-r15
	mov.l	r5,@-r15
	mov	#16,r4
	shll16	r4
	dmuls.l	r4,r10
	sts	mach,r2
	sts	macl,r0
	xtrct	r2,r0
	mov.l	@(48,r1),r2
	add	r0,r2
	dmuls.l	r4,r11
	sts	mach,r3
	sts	macl,r0
	xtrct	r3,r0
	mov.l	@(56,r1),r3
	add	r0,r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	@r15+,r7
	mov.l	@r15+,r6
	mov	#32,r2
	shll16	r2
	mov	r5,r3
	sub	r7,r3
	mov.l	.L06026674,r0
	jsr	@r0
	nop
	mov	r0,r9
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov	#30,r0
	mov.b	@(r0,r1),r0
	tst	#8,r0
	bt	.L0602666A
	mov.l	@(588,gbr),r0
	mov	r0,r9
.L0602666A:
	lds.l	@r15+,pr
	rts
	nop
.L06026670:
	.long func_06007BD8
.L06026674:
	.long func_06007C1C
	endlabel func_060265E8

	glabel func_06026678
	sts.l	pr,@-r15
	mov.l	@(60,r1),r3
	mov.l	r3,@-r15
	mov	#48,r0
	shll16	r0
	add	r0,r3
	mov	#31,r0
	mov.b	@(r0,r1),r0
	mov.l	.L06026718,r10
	jsr	@r10
	nop
	mov	r6,r2
	mov	r7,r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	@r15+,r3
	mov.l	r4,@-r15
	mov.l	r5,@-r15
	mov	#48,r0
	shll16	r0
	sub	r0,r3
	mov	#31,r0
	mov.b	@(r0,r1),r0
	mov.l	.L06026718,r10
	jsr	@r10
	nop
	mov	r6,r2
	mov	r7,r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	@r15+,r7
	mov.l	@r15+,r6
	mov.l	.L0602671C,r0
	cmp/eq	r0,r5
	bf	.L060266C4
	mov	r7,r5
.L060266C4:
	cmp/eq	r0,r7
	bf	.L060266CA
	mov	r5,r7
.L060266CA:
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov	#96,r2
	shll16	r2
	mov	r4,r3
	sub	r6,r3
	mov.l	.L06026720,r0
	jsr	@r0
	nop
	mov.l	.L06026724,r2
	add	r2,r0
	mov	r0,r8
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	mov.l	r8,@-r15
	mov	#96,r2
	shll16	r2
	mov	r5,r3
	sub	r7,r3
	mov.l	.L06026720,r0
	jsr	@r0
	nop
	mov	r0,r9
	mov.l	@r15+,r8
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	lds.l	@r15+,pr
	rts
	nop
.L06026718:
	.long func_06018EB4
.L0602671C:
	.long 0x3FFFFFFF
.L06026720:
	.long func_06007C1C
.L06026724:
	.long 0x00008000
	endlabel func_06026678
