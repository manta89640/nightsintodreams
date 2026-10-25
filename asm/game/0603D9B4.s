	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603D9B4,"ax",@progbits
	.p2align 2
	.byte 0x00, 0x80

	glabel func_0603D9B6
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov.b	@(1,r2),r0
	cmp/eq	#-128,r0
	bf	.L0603D9D0
	mov	#1,r0
	mov.b	r0,@(1,r2)
	mov.l	.L0603D9CC,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0603D9CC:
	.long func_0600D1A0
.L0603D9D0:
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov.b	@(1,r2),r0
	cmp/pz	r0
	tst	r0,r0
	bt	.L0603D9E0
	bra	.L0603E120
	nop
.L0603D9E0:
	mov.l	.L0603DA0C,r6
	mov.l	r1,@r6
	mov	#0,r0
	mov.b	r0,@(11,r1)
	endlabel func_0603D9B6

	glabel func_0603D9E8
	sts.l	pr,@-r15
	mov.b	@(20,gbr),r0
	mov	#12,r8
	cmp/ge	r8,r0
	bf	.L0603DA18
	mov.l	.L0603DA10,r8
	mov.l	.L0603DA14,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bf	.L0603DA48
	mov.b	@(14,r1),r0
	tst	r0,r0
	bf	.L0603DA48
	mov	#-1,r0
	mov.b	r0,@(14,r1)
	bra	.L0603DA3C
	nop
.L0603DA0C:
	.long D_060F30F4
.L0603DA10:
	.long 0x012C0000
.L0603DA14:
	.long func_060172DE
.L0603DA18:
	mov.l	.L0603DA94,r8
	mov.l	.L0603DA98,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bf	.L0603DA48
	mov.b	@(14,r1),r0
	tst	r0,r0
	bf	.L0603DA48
	mov	#-1,r0
	mov.b	r0,@(14,r1)
	mov.l	.L0603DA9C,r7
	mov.l	.L0603DAA0,r0
	mov.l	@r0,r4
	mov	#1,r13
	mov.b	r13,@r4
	mov	#2,r0
	mov.b	r0,@(1,r4)
.L0603DA3C:
	mov.l	.L0603DAA4,r2
	mov.l	.L0603DAA8,r0
	jsr	@r0
	nop
	mov.l	.L0603DAAC,r0
	mov.l	r0,@(12,r3)
.L0603DA48:
	mov.b	@(15,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bt	.L0603DA52
	mov	#0,r0
.L0603DA52:
	mov.b	r0,@(15,r1)
	mov.l	@(12,gbr),r0
	and	#7,r0
	mov.l	.L0603DAB0,r2
	mov.l	.L0603DAB4,r3
	mov.l	.L0603DAB8,r14
	mov	r0,r6
	shll2	r6
	shll2	r6
	shll	r6
	mov	#16,r7
.L0603DA68:
	mov.w	@r2+,r4
	mov.w	@r3+,r5
	mov	r6,r0
	mov.l	.L0603DABC,r8
	jsr	@r8
	nop
	mov.w	r0,@r14
	dt	r7
	bf/s	.L0603DA68
	add	#2,r14
	mov.l	.L0603DAB8,r2
	mov.l	.L0603DAC0,r0
	mov.l	.L0603DAC4,r6
	mov	#1,r7
	mov.l	.L0603DAC8,r10
	jsr	@r10
	nop
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L0603DACC
	bra	.L0603DC00
	nop
.L0603DA94:
	.long 0x01000000
.L0603DA98:
	.long func_060172DE
.L0603DA9C:
	.long D_060FFE50
.L0603DAA0:
	.long D_060F30A8
.L0603DAA4:
	.long D_060FFFA8
.L0603DAA8:
	.long func_0600D0D0
.L0603DAAC:
	.long func_060221B0
.L0603DAB0:
	.long D_0603E3D8
.L0603DAB4:
	.long D_0603E3F8
.L0603DAB8:
	.long D_0603E418
.L0603DABC:
	.long func_0600D4D0
.L0603DAC0:
	.long D_060ED768
.L0603DAC4:
	.long 0x0000C000
.L0603DAC8:
	.long func_0600D530
.L0603DACC:
	mov.l	.L0603DADC,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bf	.L0603DAE0
	bra	.L0603DC00
	nop
	.byte 0x00, 0x00
.L0603DADC:
	.long D_060F3064
.L0603DAE0:
	mov.l	.L0603DB0C,r7
	mov.b	@(9,r7),r0
	cmp/pz	r0
	bt	.L0603DBD4
	mov.l	.L0603DB10,r2
	mov.l	.L0603DB14,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	mov.w	@(12,r1),r0
	add	r0,r12
	mov.w	@(26,r1),r0
	mov	r0,r13
	mov.l	.L0603DB18,r0
	jsr	@r0
	mov	#4,r7
	tst	r0,r0
	bt	.L0603DB1C
	bra	.L0603DC1C
	nop
.L0603DB0C:
	.long D_060FFE50
.L0603DB10:
	.long D_0603D920
.L0603DB14:
	.long 0x00010000
.L0603DB18:
	.long func_06017A98
.L0603DB1C:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#12,r6
	mov.l	.L0603DBBC,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L0603DBC0,r4
	mov	#1,r14
	mov.b	r14,@r4
	mov.l	.L0603DBC4,r10
	mov.l	@r10,r10
	mov.l	@(8,r10),r11
	mov.l	@(12,r10),r12
	mov.w	.L0603DBB8,r0
	mov.w	r0,@(22,r11)
	mov	#0,r0
	mov.w	r0,@(24,r11)
	mov.w	.L0603DBBA,r0
	mov.w	r0,@(28,r11)
	mov	#32,r0
	mov.b	r0,@(1,r11)
	mov	#0,r0
	mov.w	r0,@(14,r11)
	mov.w	r0,@(16,r11)
	mov	#-127,r0
	mov.b	r0,@(8,r11)
	mov	#-2,r0
	shll16	r0
	mov.l	r0,@(40,r12)
	mov	#-2,r0
	shll16	r0
	mov.l	r0,@(36,r10)
	mov.l	@(48,r1),r2
	mov.l	@(48,r10),r0
	sub	r0,r2
	mov.l	@(56,r1),r3
	mov.l	@(56,r10),r0
	sub	r0,r3
	mov.l	.L0603DBC8,r0
	jsr	@r0
	nop
	mov	r0,r6
	neg	r0,r0
	mov.w	r0,@(24,r10)
	mov.l	.L0603DBCC,r10
	jsr	@r10
	mov	r6,r0
	shll2	r10
	shll2	r11
	mov.l	.L0603DBD0,r0
	dmuls.l	r0,r10
	sts	mach,r8
	sts	macl,r10
	xtrct	r8,r10
	dmuls.l	r0,r11
	sts	mach,r8
	sts	macl,r11
	xtrct	r8,r11
	mov.l	@(48,r1),r2
	sub	r11,r2
	mov.l	@(56,r1),r3
	sub	r10,r3
	mov.l	.L0603DBC4,r10
	mov.l	@r10,r10
	mov.l	r2,@(48,r10)
	mov.l	r3,@(56,r10)
	mov	#8,r0
	bra	.L0603DC1C
	mov.b	r0,@(15,r1)
.L0603DBB8:
	.short 0x00AE
.L0603DBBA:
	.short 0x009E
.L0603DBBC:
	.long func_0600E4C4
.L0603DBC0:
	.long D_0604DBB6
.L0603DBC4:
	.long D_060F3064
.L0603DBC8:
	.long func_06007C1C
.L0603DBCC:
	.long func_06007BD8
.L0603DBD0:
	.long 0x00900000
.L0603DBD4:
	mov.l	.L0603DBF4,r2
	mov.l	.L0603DBF8,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	mov.w	@(12,r1),r0
	add	r0,r12
	mov.w	@(26,r1),r0
	mov	r0,r13
	mov.l	.L0603DBFC,r0
	jsr	@r0
	mov	#4,r7
	bra	.L0603DC1C
	nop
.L0603DBF4:
	.long D_0603D930
.L0603DBF8:
	.long 0x00010000
.L0603DBFC:
	.long func_06017A98
.L0603DC00:
	mov.l	.L0603DC8C,r2
	mov.l	.L0603DC90,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	mov.w	@(12,r1),r0
	add	r0,r12
	mov.w	@(26,r1),r0
	mov	r0,r13
	mov.l	.L0603DC94,r0
	jsr	@r0
	mov	#4,r7
.L0603DC1C:
	mov.l	.L0603DC98,r2
	mov.l	.L0603DC9C,r0
	jsr	@r0
	nop
	mov.l	.L0603DCA0,r4
	mov.l	@r4,r4
	mov.l	.L0603DCA4,r9
	mov.l	@(48,r4),r8
	mov.l	@(48,r1),r0
	sub	r0,r8
	cmp/pz	r8
	bt	.L0603DC36
	neg	r8,r8
.L0603DC36:
	cmp/ge	r9,r8
	bt	.L0603DC58
	mov.l	@(56,r4),r8
	mov.l	@(56,r1),r0
	sub	r0,r8
	cmp/pz	r8
	bt	.L0603DC46
	neg	r8,r8
.L0603DC46:
	cmp/ge	r9,r8
	bt	.L0603DC58
	mov.l	@(52,r4),r8
	mov.l	@(52,r1),r9
	mov.l	.L0603DCA8,r0
	add	r0,r9
	cmp/ge	r9,r8
	bf	.L0603DC58
	mov.l	r9,@(52,r4)
.L0603DC58:
	mov.l	.L0603DCAC,r7
	mov.b	@(1,r1),r0
	mov	r0,r8
	mov.b	@(4,r7),r0
	cmp/eq	r0,r8
	bt	.L0603DC7A
	mov.b	r0,@(1,r1)
	mov.b	@(1,r1),r0
	mov.l	.L0603DCB0,r2
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	.L0603DCB4,r0
	mov.l	.L0603DCB8,r6
	mov	#1,r7
	mov.l	.L0603DCBC,r10
	jsr	@r10
	nop
.L0603DC7A:
	mov.l	.L0603DCA0,r4
	mov.l	@r4,r4
	mov.l	@(52,r4),r0
	mov.l	@(52,r1),r8
	cmp/ge	r8,r0
	bf	.L0603DCC0
	bra	.L0603DFEC
	nop
	.byte 0x00, 0x00
.L0603DC8C:
	.long D_0603D94C
.L0603DC90:
	.long 0x00010000
.L0603DC94:
	.long func_06017A98
.L0603DC98:
	.long D_0603D910
.L0603DC9C:
	.long func_060167E8
.L0603DCA0:
	.long D_060F3064
.L0603DCA4:
	.long 0x00520000
.L0603DCA8:
	.long 0xFFEA0000
.L0603DCAC:
	.long D_060FFE50
.L0603DCB0:
	.long D_0603D900
.L0603DCB4:
	.long D_060ED948
.L0603DCB8:
	.long 0x0000C000
.L0603DCBC:
	.long func_0600D530
.L0603DCC0:
	mov.l	@(48,r4),r8
	mov.l	@(56,r4),r9
	mov.l	@(48,r1),r4
	mov.l	@(56,r1),r5
	sub	r8,r4
	sub	r9,r5
	mov.l	.L0603DCDC,r8
	mov.l	.L0603DCE0,r0
	jsr	@r0
	nop
	tst	r0,r0
	bt	.L0603DCE4
	bra	.L0603DFEC
	nop
.L0603DCDC:
	.long 0x00000400
.L0603DCE0:
	.long func_06017440
.L0603DCE4:
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L0603DCEE
	bra	.L0603DD4C
	nop
.L0603DCEE:
	mov.l	.L0603DD14,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bf	.L0603DD4C
	mov.l	.L0603DD18,r0
	jsr	@r0
	nop
	mov	#1,r8
	cmp/pz	r0
	bt	.L0603DD06
	neg	r8,r8
.L0603DD06:
	mov.b	@(2,r1),r0
	tst	r0,r0
	bf	.L0603DD1C
	mov	r8,r0
	bra	.L0603DD4C
	mov.b	r0,@(2,r1)
	.byte 0x00, 0x00
.L0603DD14:
	.long D_060F3064
.L0603DD18:
	.long func_06018D60
.L0603DD1C:
	xor	r8,r0
	cmp/pz	r0
	mov	r8,r0
	mov.b	r0,@(2,r1)
	bt	.L0603DD4C
	mov.b	@(3,r1),r0
	tst	r0,r0
	bt	.L0603DD38
	xor	r8,r0
	cmp/pz	r0
	bt	.L0603DD38
	mov	r8,r0
	bra	.L0603DD4C
	mov.b	r0,@(3,r1)
.L0603DD38:
	mov	r8,r0
	mov.b	r0,@(3,r1)
	mov.l	.L0603DD70,r7
	mov	#0,r0
	mov.b	r0,@(11,r7)
	mov.l	.L0603DD74,r2
	mov	#0,r0
	mov.w	r0,@r2
	bsr	func_0603E6C4
	nop
.L0603DD4C:
	mov.l	.L0603DD78,r0
	mov.l	@r0,r2
	mov	#64,r0
	add	r0,r2
	mov.b	@r2,r0
	tst	r0,r0
	bf	.L0603DD6A
	mov.l	.L0603DD78,r4
	mov.l	@r4,r4
	mov.l	@(52,r1),r5
	mov.l	@(52,r4),r6
	mov.l	.L0603DD7C,r0
	sub	r0,r5
	cmp/ge	r5,r6
	bt	.L0603DD80
.L0603DD6A:
	bra	.L0603DFF0
	nop
	.byte 0x00, 0x00
.L0603DD70:
	.long D_060FFE50
.L0603DD74:
	.long D_060DB55E
.L0603DD78:
	.long D_060F3064
.L0603DD7C:
	.long 0x00A00000
.L0603DD80:
	add	r0,r5
	add	r0,r5
	cmp/ge	r5,r6
	bf	.L0603DD8C
	bra	.L0603DFF0
	nop
.L0603DD8C:
	add	#-4,r4
	mov.l	@r4+,r0
	mov.l	.L0603DDA4,r8
	cmp/eq	r8,r0
	bf	.L0603DD9E
	mov.l	.L0603DDA8,r7
	mov.b	@(9,r7),r0
	cmp/pz	r0
	bt	.L0603DDAC
.L0603DD9E:
	bra	.L0603DFF0
	nop
	.byte 0x00, 0x00
.L0603DDA4:
	.long func_060225E0
.L0603DDA8:
	.long D_060FFE50
.L0603DDAC:
	mov	r0,r8
	mov.b	@(20,gbr),r0
	cmp/eq	#14,r0
	bt	.L0603DDB8
	cmp/eq	#12,r0
	bf	.L0603DDCC
.L0603DDB8:
	mov.l	.L0603DDC8,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bf	.L0603DD9E
	bra	.L0603DE36
	nop
	.byte 0x00, 0x00
.L0603DDC8:
	.long D_060F3064
.L0603DDCC:
	mov	r8,r0
	tst	r0,r0
	bf	.L0603DE18
	mov	#-1,r0
	mov.b	r0,@(9,r7)
	bsr	func_0603E438
	nop
	mov	#0,r0
	mov.b	r0,@(3,r1)
	mov.b	r0,@(2,r1)
	mov.w	.L0603DE06,r0
	mov.l	r0,@(16,gbr)
	mov.l	.L0603DE08,r2
	mov.l	.L0603DE0C,r0
	jsr	@r0
	nop
	mov.l	.L0603DE10,r0
	mov.l	r0,@(12,r3)
	bsr	func_0603E9D0
	mov	#0,r0
	mov	#-1,r0
	mov.b	r0,@(10,r1)
	mov.l	.L0603DE14,r2
	mov	#0,r0
	mov.w	r0,@r2
	bsr	func_0603E6C4
	nop
	bra	.L0603DFF0
	nop
.L0603DE06:
	.short 0x1C20
.L0603DE08:
	.long D_060FFFA8
.L0603DE0C:
	.long func_0600D0D0
.L0603DE10:
	.long func_0603D82C
.L0603DE14:
	.long D_060DB55E
.L0603DE18:
	mov.b	@(23,gbr),r0
	add	#1,r0
	mov.b	r0,@(23,gbr)
	mov.b	@(10,r7),r0
	or	#4,r0
	mov.b	r0,@(10,r7)
	mov.l	.L0603DE74,r8
	mov.l	.L0603DE78,r7
	mov.b	@(3,r7),r0
	shll2	r0
	add	r0,r8
	mov.l	@(712,gbr),r0
	mov.l	r0,@r8
	mov.w	.L0603DE72,r0
	mov.l	r0,@(16,gbr)
.L0603DE36:
	mov	#-1,r0
	mov.b	r0,@(9,r7)
	mov.l	.L0603DE7C,r4
	mov.l	@r4,r4
	mov.l	@(60,r1),r8
	mov.l	r8,@(60,r4)
	mov.l	@(52,r1),r8
	mov.l	.L0603DE80,r0
	add	r0,r8
	mov.l	r8,@(52,r4)
	mov.l	.L0603DE78,r7
	mov.b	@(3,r7),r0
	cmp/eq	#3,r0
	bt	.L0603DE94
	mov.l	.L0603DE7C,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bf	.L0603DE94
	mov.l	.L0603DE84,r0
	jsr	@r0
	nop
	mov.l	.L0603DE88,r2
	mov.l	.L0603DE8C,r0
	jsr	@r0
	nop
	mov.l	.L0603DE90,r0
	mov.l	r0,@(12,r3)
	bra	.L0603DEAE
	nop
.L0603DE72:
	.short 0x1C20
.L0603DE74:
	.long D_060FFEA8
.L0603DE78:
	.long D_060FFE50
.L0603DE7C:
	.long D_060F3064
.L0603DE80:
	.long 0xFFB00000
.L0603DE84:
	.long func_06026728
.L0603DE88:
	.long D_060FFFB8
.L0603DE8C:
	.long func_0600D0D0
.L0603DE90:
	.long func_0603E638
.L0603DE94:
	mov	#0,r0
	mov.b	r0,@(3,r1)
	mov.b	r0,@(2,r1)
	bsr	func_0603E438
	nop
	mov	#0,r0
	mov.b	r0,@(3,r1)
	mov.b	r0,@(2,r1)
	mov.l	.L0603DFB4,r2
	mov	#0,r0
	mov.w	r0,@r2
	bsr	func_0603E6C4
	nop
.L0603DEAE:
	mov.l	.L0603DFB8,r2
	mov.l	.L0603DFBC,r0
	jsr	@r0
	nop
	mov.l	.L0603DFC0,r0
	mov.l	r0,@(12,r3)
	mov.b	@(10,r1),r0
	tst	r0,r0
	bf	.L0603DEC8
	bsr	func_0603E9D0
	mov	#0,r0
	mov	#-1,r0
	mov.b	r0,@(10,r1)
.L0603DEC8:
	mov.l	.L0603DFC4,r7
	mov.b	@(3,r7),r0
	bsr	func_0603E9D0
	add	#1,r0
	bsr	func_0603E74E
	nop
	bsr	func_0603E964
	nop
	tst	r0,r0
	bt	.L0603DFA4
	mov	#1,r0
	mov.b	r0,@(127,gbr)
	mov	#0,r0
	mov.l	r0,@(4,r1)
	mov.w	.L0603DFA8,r0
	mov.w	r0,@(8,r1)
	mov.l	.L0603DFC8,r4
	mov.l	@r4,r4
	mov.l	@(8,r4),r12
	mov.b	@(2,r12),r0
	tst	r0,r0
	bt	.L0603DF02
	mov.l	r4,@-r15
	mov.l	r1,@-r15
	mov.l	.L0603DFCC,r0
	jsr	@r0
	mov	r4,r1
	mov.l	@r15+,r1
	mov.l	@r15+,r4
.L0603DF02:
	mov.b	@(1,r12),r0
	or	#48,r0
	mov.b	r0,@(1,r12)
	mov	#0,r0
	mov.w	r0,@(26,r4)
	mov.w	r0,@(4,r4)
	mov.w	.L0603DFAA,r8
	mov.b	@(20,gbr),r0
	cmp/eq	#12,r0
	bt	.L0603DF1A
	cmp/eq	#14,r0
	bf	.L0603DF1C
.L0603DF1A:
	mov.w	.L0603DFAC,r8
.L0603DF1C:
	mov	r8,r0
	mov.w	r0,@(22,r12)
	mov	#-1,r0
	mov.w	r0,@(28,r12)
	mov	#0,r0
	mov.b	r0,@(3,r12)
	mov.w	r0,@(14,r12)
	mov.w	r0,@(16,r12)
	mov	#0,r0
	mov.b	r0,@(0,r12)
	mov.l	.L0603DFD0,r2
	mov.l	@(48,r4),r0
	mov.l	r0,@r2
	mov.l	@(52,r4),r0
	mov.l	r0,@(4,r2)
	mov.l	@(56,r4),r0
	mov.l	r0,@(8,r2)
	mov.l	.L0603DFD4,r4
	mov.l	@r4,r0
	mov.l	r0,@(12,r2)
	mov.b	@(20,gbr),r0
	mov	#12,r8
	cmp/ge	r8,r0
	bf	.L0603DF76
	mov.l	.L0603DFD8,r2
	mov.l	.L0603DFBC,r0
	jsr	@r0
	nop
	mov.l	.L0603DFDC,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov	#0,r0
	mov.b	r0,@(0,r3)
	mov.w	.L0603DFAE,r0
	mov.w	r0,@(8,r3)
	mov.l	.L0603DFBC,r0
	jsr	@r0
	nop
	mov.l	.L0603DFDC,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov	#1,r0
	mov.b	r0,@(0,r3)
	mov.w	.L0603DFB0,r0
	mov.w	r0,@(8,r3)
.L0603DF76:
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	.L0603DFE0,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov	#0,r0
	mov.l	.L0603DFE4,r8
	mov.l	@r8+,r9
	add	r9,r0
	mov.l	@r8+,r9
	add	r9,r0
	mov.l	@r8+,r9
	add	r9,r0
	mov.l	@r8+,r9
	add	r9,r0
	mov.l	r0,@(656,gbr)
	mov.l	.L0603DFE8,r0
	mov.l	r0,@-r1
	add	#4,r1
.L0603DFA4:
	bra	.L0603DFF0
	nop
.L0603DFA8:
	.short 0x0078
.L0603DFAA:
	.short 0x0010
.L0603DFAC:
	.short 0x004A
.L0603DFAE:
	.short 0x0096
.L0603DFB0:
	.short 0x00A5
	.byte 0x00, 0x00
.L0603DFB4:
	.long D_060DB55E
.L0603DFB8:
	.long D_060FFFA8
.L0603DFBC:
	.long func_0600D0D0
.L0603DFC0:
	.long func_0603D82C
.L0603DFC4:
	.long D_060FFE50
.L0603DFC8:
	.long D_060F3064
.L0603DFCC:
	.long func_06024348
.L0603DFD0:
	.long D_0603E130
.L0603DFD4:
	.long D_0602FF34
.L0603DFD8:
	.long D_060FFFB8
.L0603DFDC:
	.long D_06041DA8
.L0603DFE0:
	.long func_0600E4F6
.L0603DFE4:
	.long D_060FFE98
.L0603DFE8:
	.long func_0603E140
.L0603DFEC:
	mov	#0,r0
	mov.b	r0,@(2,r1)
.L0603DFF0:
	mov.l	.L0603E080,r4
	mov.l	@r4,r4
	mov.l	@(48,r4),r8
	mov.l	@(56,r4),r9
	mov.l	@(48,r1),r4
	mov.l	@(56,r1),r5
	sub	r8,r4
	sub	r9,r5
	mov.l	.L0603E084,r8
	mov.l	.L0603E088,r0
	jsr	@r0
	nop
	tst	r0,r0
	bf	.L0603E032
	mov.l	r8,@-r15
	mov.l	r2,@-r15
	mov.l	r0,@-r15
	mov.l	.L0603E08C,r2
	mov	#0,r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.b	@(2,r2),r0
	mov	#95,r8
	cmp/gt	r0,r8
	bf	.L0603E02C
	mov	r8,r0
	mov.b	r0,@(2,r2)
	mov	#6,r0
	mov.b	r0,@(0,r2)
.L0603E02C:
	mov.l	@r15+,r0
	mov.l	@r15+,r2
	mov.l	@r15+,r8
.L0603E032:
	mov.l	.L0603E090,r4
	mov.l	@r4,r4
	mov.l	@(48,r4),r8
	mov.l	@(56,r4),r9
	mov.l	@(48,r1),r4
	mov.l	@(56,r1),r5
	sub	r8,r4
	sub	r9,r5
	mov.l	.L0603E084,r8
	mov.l	.L0603E088,r0
	jsr	@r0
	nop
	tst	r0,r0
	bf	.L0603E074
	mov.l	r8,@-r15
	mov.l	r2,@-r15
	mov.l	r0,@-r15
	mov.l	.L0603E08C,r2
	mov	#1,r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.b	@(2,r2),r0
	mov	#95,r8
	cmp/gt	r0,r8
	bf	.L0603E06E
	mov	r8,r0
	mov.b	r0,@(2,r2)
	mov	#6,r0
	mov.b	r0,@(0,r2)
.L0603E06E:
	mov.l	@r15+,r0
	mov.l	@r15+,r2
	mov.l	@r15+,r8
.L0603E074:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603E094
	lds.l	@r15+,pr
	rts
	nop
.L0603E080:
	.long D_060F3064
.L0603E084:
	.long 0x00001000
.L0603E088:
	.long func_06017440
.L0603E08C:
	.long D_060FEA2C
.L0603E090:
	.long D_060F3068
.L0603E094:
	bsr	func_0603E270
	nop
	mov.l	.L0603E0F0,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0603E0F4,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L0603E0F8,r4
	mov.l	.L0603E0F8,r5
	mov.l	.L0603E0F8,r6
	mov.l	.L0603E0FC,r0
	jsr	@r0
	nop
	mov.w	@(24,r1),r0
	mov	r0,r8
	mov.w	@(12,r1),r0
	mov.l	.L0603E100,r10
	jsr	@r10
	add	r8,r0
	mov.l	.L0603E104,r2
	mov.l	.L0603E108,r0
	jsr	@r0
	nop
	mov.b	@(15,r1),r0
	tst	r0,r0
	bt	.L0603E0D6
	mov.l	.L0603E10C,r2
	mov.l	.L0603E110,r0
	jsr	@r0
	nop
.L0603E0D6:
	mov.l	.L0603E114,r2
	mov.l	.L0603E110,r0
	jsr	@r0
	nop
	mov.l	.L0603E118,r2
	mov.l	.L0603E110,r0
	jsr	@r0
	nop
	nop
	lds.l	@r15+,pr
	mov.l	.L0603E11C,r0
	jmp	@r0
	nop
.L0603E0F0:
	.long func_0600CA24
.L0603E0F4:
	.long func_0600CBDA
.L0603E0F8:
	.long 0x00010000
.L0603E0FC:
	.long func_0600D018
.L0603E100:
	.long func_0600CAF8
.L0603E104:
	.long D_06083DA0
.L0603E108:
	.long func_0601F4A0
.L0603E10C:
	.long D_06083EA4
.L0603E110:
	.long func_0601F434
.L0603E114:
	.long D_06084AAC
.L0603E118:
	.long D_06084DCC
.L0603E11C:
	.long func_0600CA4E
.L0603E120:
	mov.l	.L0603E12C,r6
	mov	#0,r0
	mov.l	r0,@r6
	rts
	nop
	.byte 0x00, 0x00
.L0603E12C:
	.long D_060F30F4
	dlabel D_0603E130
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	endlabel func_0603D9E8

	glabel func_0603E140
	sts.l	pr,@-r15
	mov.w	@(8,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bt	.L0603E182
	mov.l	.L0603E18C,r0
	mov.l	@r0,r4
	mov	#31,r13
	mov.b	r13,@r4
	mov	#2,r0
	mov.b	r0,@(1,r4)
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#36,r6
	mov.l	.L0603E190,r0
	jsr	@r0
	mov	#4,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L0603E194,r0
	jsr	@r0
	nop
	mov.l	.L0603E198,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.w	.L0603E188,r0
.L0603E182:
	mov.w	r0,@(8,r1)
	bra	.L0603E2BC
	nop
.L0603E188:
	.short 0x0040
	.byte 0x00, 0x00
.L0603E18C:
	.long D_060F30A8
.L0603E190:
	.long func_0600E4C4
.L0603E194:
	.long func_0600E660
.L0603E198:
	.long func_0603E19C
	endlabel func_0603E140

	glabel func_0603E19C
	sts.l	pr,@-r15
	mov.l	@(4,r1),r8
	mov.l	.L0603E1E8,r0
	add	r0,r8
	mov.l	.L0603E1EC,r0
	cmp/ge	r0,r8
	bf	.L0603E1AC
	mov	r0,r8
.L0603E1AC:
	mov.b	@(20,gbr),r0
	cmp/eq	#12,r0
	bt	.L0603E1B6
	cmp/eq	#14,r0
	bf	.L0603E1B8
.L0603E1B6:
	shll	r8
.L0603E1B8:
	mov.l	r8,@(4,r1)
	mov.w	@(8,r1),r0
	add	#-1,r0
	cmp/eq	#1,r0
	bf	.L0603E1D2
	mov.l	r0,@-r15
	mov.l	.L0603E1F0,r2
	mov.l	.L0603E1F4,r0
	jsr	@r0
	nop
	mov.l	.L0603E1F8,r2
	mov.l	r2,@(12,r3)
	mov.l	@r15+,r0
.L0603E1D2:
	cmp/pz	r0
	bt	.L0603E20C
	mov.w	.L0603E1E6,r8
	cmp/ge	r8,r0
	bt	.L0603E1FC
	mov	#0,r0
	mov.b	r0,@(0,gbr)
	lds.l	@r15+,pr
	rts
	nop
.L0603E1E6:
	.short 0xFFC0
.L0603E1E8:
	.long 0x00000800
.L0603E1EC:
	.long 0x00010000
.L0603E1F0:
	.long D_060FFFB0
.L0603E1F4:
	.long func_0600D0D0
.L0603E1F8:
	.long func_060331F6
.L0603E1FC:
	mov.l	.L0603E220,r4
	mov.l	@r4,r4
	mov.l	.L0603E224,r2
	mov.l	@(4,r2),r9
	mov.l	.L0603E228,r8
	sub	r8,r9
	mov.l	r9,@(4,r2)
	mov.l	r9,@(52,r4)
.L0603E20C:
	mov.w	r0,@(8,r1)
	mov.b	@(20,gbr),r0
	shlr	r0
	shll	r0
	mov.l	.L0603E22C,r2
	mov.w	@(r0,r2),r0
	mov.w	r0,@(256,gbr)
	bra	.L0603E2BC
	nop
	.byte 0x00, 0x00
.L0603E220:
	.long D_060F3064
.L0603E224:
	.long D_0603E130
.L0603E228:
	.long 0x00100000
.L0603E22C:
	.long D_0603E230
	dlabel D_0603E230
	.byte 0x03, 0x1F, 0x01, 0x0D, 0x01, 0x0D, 0x01, 0x0D, 0x03, 0x0F, 0x11, 0x1D, 0x01, 0x15, 0x01, 0x15
	dlabel D_0603E240
	.long D_06084F20
	.long D_06084F20
	.long D_060856B0
	.long D_06085A78
	.long D_06085E40
	.long D_06086208
	.long D_060865D0
	.long D_06086998
	.long D_06086D60
	.long D_06087128
	.long D_060874F0
	.long D_060878B8
	endlabel func_0603E19C

	glabel func_0603E270
	sts.l	pr,@-r15
	mov.l	.L0603E280,r7
	mov.l	.L0603E284,r2
	mov.b	@(9,r7),r0
	tst	r0,r0
	bf	.L0603E288
	bra	.L0603E28E
	mov	#0,r8
.L0603E280:
	.long D_060FFE50
.L0603E284:
	.long D_0603E240
.L0603E288:
	mov.b	@(3,r7),r0
	mov	r0,r8
	add	#1,r8
.L0603E28E:
	shll2	r8
	shll	r8
	add	r8,r2
	mov.l	@(12,gbr),r0
	tst	#8,r0
	bf	.L0603E29C
	add	#4,r2
.L0603E29C:
	mov.l	@r2,r4
	mov.l	.L0603E2B0,r5
	mov.l	.L0603E2B4,r6
	mov.l	.L0603E2B8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0603E2B0:
	.long VDP1_VRAM + 0xD0F8
.L0603E2B4:
	.long 0x000003C8
.L0603E2B8:
	.long func_060045BC
.L0603E2BC:
	mov.b	@(20,gbr),r0
	mov	#12,r8
	cmp/ge	r8,r0
	bt	.L0603E2CA
	mov.l	@(16,gbr),r0
	add	#1,r0
	mov.l	r0,@(16,gbr)
.L0603E2CA:
	mov.l	.L0603E308,r4
	mov.l	@r4,r4
	mov.l	.L0603E30C,r2
	mov.l	@(60,r1),r0
	mov.l	r0,@(60,r4)
	mov.l	@(48,r1),r0
	mov.l	r0,@(48,r4)
	mov.l	@(56,r1),r0
	mov.l	r0,@(56,r4)
	mov.l	@(4,r2),r0
	mov.l	r0,@(52,r4)
	mov.l	.L0603E310,r2
	mov.l	.L0603E314,r0
	jsr	@r0
	nop
	mov.l	.L0603E308,r4
	mov.l	@r4,r4
	mov.l	@(52,r4),r8
	mov.l	@(52,r1),r9
	mov.l	.L0603E318,r0
	add	r0,r9
	cmp/ge	r9,r8
	bf	.L0603E2FA
	mov.l	r9,@(52,r4)
.L0603E2FA:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603E31C
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0603E308:
	.long D_060F3064
.L0603E30C:
	.long D_0603E130
.L0603E310:
	.long D_0603D910
.L0603E314:
	.long func_060167E8
.L0603E318:
	.long 0xFFEA0000
.L0603E31C:
	bsr	func_0603E270
	nop
	mov.l	.L0603E3A0,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0603E3A4,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L0603E3A8,r4
	mov.l	.L0603E3A8,r5
	mov.l	.L0603E3A8,r6
	mov.l	.L0603E3AC,r0
	jsr	@r0
	nop
	mov.w	@(24,r1),r0
	mov	r0,r8
	mov.w	@(12,r1),r0
	mov.l	.L0603E3B0,r10
	jsr	@r10
	add	r8,r0
	mov.l	.L0603E3B4,r2
	mov.l	.L0603E3B8,r0
	jsr	@r0
	nop
	mov.l	.L0603E3BC,r2
	mov.l	.L0603E3C0,r0
	jsr	@r0
	nop
	mov.l	.L0603E3C4,r2
	mov.l	.L0603E3C0,r0
	jsr	@r0
	nop
	mov	#0,r4
	mov.l	.L0603E3C8,r5
	mov.l	.L0603E3A4,r0
	jsr	@r0
	mov	#0,r6
	mov.l	@(4,r1),r4
	mov.l	@(4,r1),r5
	mov.l	@(4,r1),r6
	mov.l	.L0603E3AC,r0
	jsr	@r0
	nop
	mov	#16,r7
.L0603E378:
	mov.l	r7,@-r15
	mov.l	.L0603E3CC,r2
	mov.l	.L0603E3C0,r0
	jsr	@r0
	nop
	mov	#0,r4
	mov.l	.L0603E3D0,r5
	mov.l	.L0603E3A4,r0
	jsr	@r0
	mov	#0,r6
	mov.l	@r15+,r7
	dt	r7
	bf	.L0603E378
	mov.l	.L0603E3D4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0603E3A0:
	.long func_0600CA24
.L0603E3A4:
	.long func_0600CBDA
.L0603E3A8:
	.long 0x00010000
.L0603E3AC:
	.long func_0600D018
.L0603E3B0:
	.long func_0600CAF8
.L0603E3B4:
	.long D_06083DA0
.L0603E3B8:
	.long func_0601F4A0
.L0603E3BC:
	.long D_06084AAC
.L0603E3C0:
	.long func_0601F434
.L0603E3C4:
	.long D_06084DCC
.L0603E3C8:
	.long 0xFFEC0000
.L0603E3CC:
	.long D_06084ED0
.L0603E3D0:
	.long 0xFF800000
.L0603E3D4:
	.long func_0600CA4E
	dlabel D_0603E3D8
	.byte 0x00, 0x00, 0x7F, 0xFF, 0x7F, 0x9A, 0x7F, 0x55, 0x7E, 0xF0, 0x7E, 0xAB, 0x7E, 0x46, 0x7E, 0x02
	.byte 0x7F, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_0603E3F8
	.byte 0x00, 0x00, 0x7F, 0xFF, 0x7F, 0x9A, 0x7F, 0x55, 0x7E, 0xF0, 0x7E, 0xAB, 0x7E, 0x46, 0x7E, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_0603E418
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	endlabel func_0603E270

	glabel func_0603E438
	sts.l	pr,@-r15
	mov.l	.L0603E454,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L0603E4A8
	mov.l	.L0603E458,r4
	mov	#1,r14
	mov.b	r14,@r4
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L0603E45C
	bra	.L0603E4A8
	nop
.L0603E454:
	.long D_060F3064
.L0603E458:
	.long D_0604DBB5
.L0603E45C:
	mov.l	.L0603E4B0,r4
	mov.l	@r4,r4
	mov.l	@(60,r1),r8
	mov.l	r8,@(60,r4)
	mov.l	@(52,r1),r8
	mov.l	.L0603E4B4,r0
	add	r0,r8
	mov.l	r8,@(52,r4)
	mov.l	.L0603E4B8,r0
	jsr	@r0
	nop
	mov	#1,r0
	mov.b	r0,@(11,r1)
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#58,r6
	mov.l	.L0603E4BC,r0
	jsr	@r0
	mov	#4,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L0603E4C0,r3
	mov.l	@r3,r3
	mov	#0,r0
	mov.w	r0,@(20,r3)
	mov.l	.L0603E4C4,r2
	mov.l	.L0603E4C8,r0
	jsr	@r0
	nop
	mov.l	.L0603E4CC,r0
	mov.l	r0,@(12,r3)
.L0603E4A8:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0603E4B0:
	.long D_060F3064
.L0603E4B4:
	.long 0xFFB00000
.L0603E4B8:
	.long func_06026880
.L0603E4BC:
	.long func_0600E4C4
.L0603E4C0:
	.long D_060F309C
.L0603E4C4:
	.long D_060FFFB0
.L0603E4C8:
	.long func_0600D0D0
.L0603E4CC:
	.long func_0603E4D0
	endlabel func_0603E438

	glabel func_0603E4D0
	mov.l	.L0603E4F4,r4
	mov.l	@r4,r4
	mov.w	.L0603E4F0,r8
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L0603E4DE
	mov.w	.L0603E4F2,r8
.L0603E4DE:
	mov.w	@(2,r4),r0
	add	#2,r0
	cmp/ge	r8,r0
	bf	.L0603E4FC
	mov	r8,r0
	mov.w	r0,@(2,r4)
	mov.l	.L0603E4F8,r0
	jmp	@r0
	nop
.L0603E4F0:
	.short 0x0100
.L0603E4F2:
	.short 0x0180
.L0603E4F4:
	.long D_060F309C
.L0603E4F8:
	.long func_0600D1A0
.L0603E4FC:
	rts
	mov.w	r0,@(2,r4)
	endlabel func_0603E4D0

	glabel func_0603E500
	mov.l	.L0603E51C,r4
	mov.l	@r4,r4
	mov.w	@(2,r4),r0
	mov.w	.L0603E518,r8
	add	#-2,r0
	cmp/ge	r8,r0
	bt	.L0603E524
	mov	r8,r0
	mov.w	r0,@(2,r4)
	mov.l	.L0603E520,r0
	jmp	@r0
	nop
.L0603E518:
	.short 0x00C0
	.byte 0x00, 0x00
.L0603E51C:
	.long D_060F309C
.L0603E520:
	.long func_0600D1A0
.L0603E524:
	rts
	mov.w	r0,@(2,r4)
	endlabel func_0603E500

	glabel func_0603E528
	sts.l	pr,@-r15
	mov.l	.L0603E580,r4
	mov.l	@r4,r4
	mov.w	@(24,r1),r0
	mov.w	.L0603E57A,r8
	add	r8,r0
	mov.w	.L0603E57C,r8
	cmp/ge	r8,r0
	bf	.L0603E53C
	mov	r8,r0
.L0603E53C:
	mov.w	r0,@(24,r1)
	mov.w	r0,@(0,r4)
	mov.w	@(22,r1),r0
	mov.w	.L0603E57C,r8
	add	r8,r0
	mov.l	.L0603E584,r10
	jsr	@r10
	mov.w	r0,@(22,r1)
	mov.w	.L0603E57E,r0
	shll2	r10
	shll2	r10
	shll2	r10
	shll2	r10
	shll	r10
	swap.w	r10,r10
	exts.w	r10,r10
	sub	r10,r0
	mov.w	r0,@(2,r4)
	mov.w	@(22,r1),r0
	cmp/pz	r0
	bt	.L0603E574
	mov.w	.L0603E57E,r0
	mov.w	r0,@(2,r4)
	mov.w	.L0603E57C,r0
	mov.w	r0,@(0,r4)
	mov.l	.L0603E588,r0
	jsr	@r0
	nop
.L0603E574:
	lds.l	@r15+,pr
	rts
	nop
.L0603E57A:
	.short 0x0008
.L0603E57C:
	.short 0x0200
.L0603E57E:
	.short 0x0100
.L0603E580:
	.long D_060F309C
.L0603E584:
	.long func_06007C08
.L0603E588:
	.long func_0600D1A0
	.byte 0xD4, 0x06, 0x64, 0x42, 0x85, 0x41, 0x98, 0x07, 0x70, 0x02, 0x30, 0x83, 0x8B, 0x0A, 0x60, 0x83
	.byte 0x81, 0x41, 0xD0, 0x03, 0x40, 0x2B, 0x00, 0x09, 0x01, 0x80, 0x00, 0x00
	.long D_060F309C
	.long func_0600D1A0
	.byte 0x00, 0x0B, 0x81, 0x41, 0xD4, 0x06, 0x64, 0x42, 0x85, 0x41, 0x98, 0x07, 0x70, 0xFE, 0x30, 0x83
	.byte 0x89, 0x0A, 0x60, 0x83, 0x81, 0x41, 0xD0, 0x03, 0x40, 0x2B, 0x00, 0x09, 0x01, 0x00, 0x00, 0x00
	.long D_060F309C
	.long func_0600D1A0
	.byte 0x00, 0x0B, 0x81, 0x41
.L0603E5DC:
	mov.l	@(12,gbr),r0
	shlr	r0
	and	#1,r0
	mov	r0,r6
	mov	#0,r7
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bt	.L0603E5F8
	mov.l	.L0603E5F4,r2
	bra	.L0603E5FA
	nop
	.byte 0x00, 0x00
.L0603E5F4:
	.long D_0603E630
.L0603E5F8:
	mov.l	.L0603E610,r2
.L0603E5FA:
	mov.l	@r2+,r4
	mov.l	@r4,r4
	tst	r4,r4
	bt	.L0603E61A
	add	#30,r4
	mov.b	@r4,r11
	cmp/eq	r6,r7
	bf	.L0603E614
	mov	#-33,r10
	bra	.L0603E618
	and	r10,r11
.L0603E610:
	.long D_0603E628
.L0603E614:
	mov	#32,r10
	or	r10,r11
.L0603E618:
	mov.b	r11,@r4
.L0603E61A:
	add	#1,r7
	mov	#2,r8
	cmp/ge	r8,r7
	bf	.L0603E5FA
	rts
	nop
	.byte 0x00, 0x09
	dlabel D_0603E628
	.long D_060F3064
	.long D_060F3068
	dlabel D_0603E630
	.long D_060F3064
	.long D_060F3064
	endlabel func_0603E528

	glabel func_0603E638
	mov.l	.L0603E660,r4
	mov.l	@r4,r4
	mov.w	@(2,r4),r0
	mov	r0,r8
	mov.w	.L0603E65A,r8
	add	#-6,r0
	cmp/ge	r8,r0
	bt	.L0603E668
	mov	r8,r0
	mov.w	r0,@(2,r4)
	mov.w	.L0603E65C,r0
	mov.w	r0,@(0,r1)
	mov.l	.L0603E664,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L0603E5DC
	nop
.L0603E65A:
	.short 0x00A0
.L0603E65C:
	.short 0x0064
	.byte 0x00, 0x00
.L0603E660:
	.long D_060F309C
.L0603E664:
	.long func_0603E66C
.L0603E668:
	bra	.L0603E5DC
	mov.w	r0,@(2,r4)
	endlabel func_0603E638

	glabel func_0603E66C
	mov.w	@(0,r1),r0
	dt	r0
	bt	.L0603E678
	mov.w	r0,@(0,r1)
	bra	.L0603E5DC
	nop
.L0603E678:
	mov.l	.L0603E684,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L0603E5DC
	nop
	.byte 0x00, 0x00
.L0603E684:
	.long func_0603E688
	endlabel func_0603E66C

	glabel func_0603E688
	mov.l	.L0603E6B4,r4
	mov.l	@r4,r4
	mov.w	@(2,r4),r0
	mov	r0,r8
	mov.w	.L0603E6B0,r8
	add	#2,r0
	cmp/ge	r8,r0
	bf	.L0603E6C0
	mov	r8,r0
	mov.w	r0,@(2,r4)
	mov.l	.L0603E6B8,r4
	mov.l	@r4,r4
	add	#30,r4
	mov.b	@r4,r11
	mov	#-33,r10
	and	r10,r11
	mov.b	r11,@r4
	mov.l	.L0603E6BC,r0
	jmp	@r0
	nop
.L0603E6B0:
	.short 0x0100
	.byte 0x00, 0x00
.L0603E6B4:
	.long D_060F309C
.L0603E6B8:
	.long D_060F3064
.L0603E6BC:
	.long func_0600D1A0
.L0603E6C0:
	bra	.L0603E5DC
	mov.w	r0,@(2,r4)
	endlabel func_0603E688

	glabel func_0603E6C4
	sts.l	pr,@-r15
	mov.l	.L0603E724,r2
	mov	#0,r0
	mov.l	r0,@(0,r2)
	mov.l	r0,@(4,r2)
	mov.l	.L0603E728,r3
	mov.l	@r3,r3
	mov.l	@(48,r3),r4
	mov.l	@(56,r3),r5
	swap.w	r4,r4
	swap.w	r5,r5
	exts.w	r4,r4
	exts.w	r5,r5
	mov.l	.L0603E72C,r6
	mov.l	.L0603E730,r7
	mov.l	.L0603E734,r0
	jsr	@r0
	nop
	mov.b	@(30,gbr),r0
	tst	r0,r0
	bt	.L0603E708
	mov.l	.L0603E738,r3
	mov.l	@r3,r3
	mov.l	@(48,r3),r4
	mov.l	@(56,r3),r5
	swap.w	r4,r4
	swap.w	r5,r5
	exts.w	r4,r4
	exts.w	r5,r5
	mov.l	.L0603E73C,r6
	mov.l	.L0603E740,r7
	mov.l	.L0603E734,r0
	jsr	@r0
	nop
.L0603E708:
	mov.l	@(732,gbr),r0
	mov	r0,r4
	mov.l	.L0603E744,r14
.L0603E70E:
	mov.w	@r4,r0
	add	#16,r4
	cmp/pz	r0
	bf	.L0603E748
	mov.b	@(1,r14),r0
	cmp/eq	#-2,r0
	bf	.L0603E720
	mov	#1,r0
	mov.b	r0,@(1,r14)
.L0603E720:
	bra	.L0603E70E
	add	#4,r14
.L0603E724:
	.long D_06043AB8
.L0603E728:
	.long D_060F3064
.L0603E72C:
	.long D_060FD7FE
.L0603E730:
	.long D_060FFF70
.L0603E734:
	.long func_060113FA
.L0603E738:
	.long D_060F3068
.L0603E73C:
	.long D_060FD7FF
.L0603E740:
	.long D_060FFF74
.L0603E744:
	.long D_060FD7FC
.L0603E748:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_0603E6C4

	glabel func_0603E74E
	sts.l	pr,@-r15
	mov	#0,r0
	mov.b	r0,@(108,gbr)
	mov.l	.L0603E7B0,r7
	mov.b	@(3,r7),r0
	mov	#3,r8
	cmp/ge	r8,r0
	bf	.L0603E768
	mov.b	@(20,gbr),r0
	cmp/eq	#14,r0
	bt	.L0603E77A
	cmp/eq	#12,r0
	bt	.L0603E77A
.L0603E768:
	mov.l	.L0603E7B0,r7
	mov.b	@(3,r7),r0
	mov.l	.L0603E7B4,r8
	shll2	r0
	add	r0,r8
	mov.l	@(656,gbr),r0
	mov.l	r0,@r8
	mov	#0,r0
	mov.l	r0,@(656,gbr)
.L0603E77A:
	mov.l	.L0603E7B0,r7
	mov.b	@(4,r7),r0
	add	#1,r0
	mov.b	r0,@(3,r7)
	mov	#3,r8
	cmp/ge	r8,r0
	bf	.L0603E78A
	mov	r8,r0
.L0603E78A:
	mov.b	r0,@(4,r7)
	mov.l	.L0603E7B8,r2
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.b	@(4,r7),r0
	shll2	r0
	add	r0,r2
	mov.l	.L0603E7BC,r3
	mov.w	@r3,r8
	mov.w	@r2+,r0
	and	r0,r8
	mov.w	@r2+,r0
	or	r0,r8
	mov.w	r8,@r3
	lds.l	@r15+,pr
	rts
	nop
.L0603E7B0:
	.long D_060FFE50
.L0603E7B4:
	.long D_060FFE98
.L0603E7B8:
	.long D_0603ECE0
.L0603E7BC:
	.long D_06018CBC
	endlabel func_0603E74E

	glabel func_0603E7C0
	mov.b	@(22,gbr),r0
	cmp/eq	#12,r0
	bt	.L0603E7CA
	cmp/eq	#14,r0
	bf	.L0603E7CE
.L0603E7CA:
	bra	.L0603E908
	nop
.L0603E7CE:
	mov.l	.L0603E7DC,r2
	mov.b	@r2,r0
	cmp/pz	r0
	bf	.L0603E7E0
	shll	r0
	bra	.L0603E912
	add	#1,r0
.L0603E7DC:
	.long D_060CB002
.L0603E7E0:
	mov.l	.L0603E854,r2
	mov.b	@(22,gbr),r0
	shlr	r0
	mov.b	@(r0,r2),r8
	mov.l	.L0603E858,r0
	mov.l	@r0,r0
	mov.l	.L0603E85C,r3
	add	r0,r3
	mov	#80,r6
	mov.l	.L0603E860,r0
	mov.b	@r0,r0
	mulu.w	r0,r6
	sts	macl,r6
	add	#72,r6
	add	r3,r6
	mov	r8,r0
	shlr	r0
	mov.b	@(r0,r6),r9
	cmp/pz	r9
	bf	.L0603E8F6
	mov.b	@(22,gbr),r0
	shlr	r0
	mov.l	.L0603E864,r2
	mov.b	@(r0,r2),r0
	cmp/eq	#3,r0
	mov.l	.L0603E868,r3
	mov.b	@r3,r8
	mov.l	.L0603E86C,r3
	mov.b	@r3,r9
	or	r9,r8
	cmp/pz	r8
	bf	.L0603E822
	mov	#3,r0
.L0603E822:
	mov	r0,r9
	mov.l	.L0603E854,r3
	mov.l	.L0603E870,r4
	mov	#6,r7
	mov	#0,r11
	mov	#0,r12
.L0603E82E:
	mov.b	@r2,r0
	tst	r0,r9
	bt	.L0603E878
	mov.b	@r3,r0
	shlr	r0
	mov.b	@(r0,r6),r8
	cmp/pz	r8
	bf	.L0603E878
	mov	#5,r0
	cmp/ge	r0,r8
	bf	.L0603E846
	mov	r0,r8
.L0603E846:
	mov.l	.L0603E874,r10
	add	r8,r10
	mov.b	@r10,r0
	mov.l	r0,@r4
	add	r0,r11
	bra	.L0603E87C
	add	#1,r12
.L0603E854:
	.long D_0603E92C
.L0603E858:
	.long D_060CB014
.L0603E85C:
	.long 0x00000528
.L0603E860:
	.long D_060CB003
.L0603E864:
	.long D_0603E934
.L0603E868:
	.long D_060CB064
.L0603E86C:
	.long D_060CB065
.L0603E870:
	.long D_0603E944
.L0603E874:
	.long D_0603E93C
.L0603E878:
	mov	#0,r0
	mov.l	r0,@r4
.L0603E87C:
	add	#1,r2
	add	#1,r3
	add	#4,r4
	dt	r7
	bf	.L0603E82E
	mov.l	.L0603E8FC,r4
	mov	#6,r7
.L0603E88A:
	mov.l	@r4,r0
	tst	r0,r0
	bt	.L0603E8A0
	mov.w	.L0603E8FA,r8
	dmuls.l	r0,r8
	sts	macl,r0
	mov	#-128,r13
	shll	r13
	mov.l	r11,@(0,r13)
	mov.l	r0,@(4,r13)
	mov.l	@(28,r13),r0
.L0603E8A0:
	mov.l	r0,@r4
	add	#4,r4
	dt	r7
	bf	.L0603E88A
	mov	#0,r0
	mov.l	.L0603E900,r8
	mov.l	@r8+,r9
	add	r9,r0
	mov.l	@r8+,r9
	add	r9,r0
	mov.l	@r8+,r9
	add	r9,r0
	mov.l	@r8+,r9
	add	r9,r0
	mov	#10,r11
	mov	#-128,r13
	shll	r13
	mov.l	r11,@(0,r13)
	mov.l	r0,@(4,r13)
	mov.l	@(28,r13),r0
	mov	#100,r11
	mov	#-128,r13
	shll	r13
	mov.l	r11,@(0,r13)
	mov.l	r0,@(4,r13)
	mov.l	@(24,r13),r0
	mov.l	.L0603E8FC,r4
	mov	#0,r7
.L0603E8D8:
	mov.l	@r4,r8
	tst	r8,r8
	bt	.L0603E8E4
	mov	r7,r9
	cmp/ge	r0,r8
	bt	.L0603E8F0
.L0603E8E4:
	sub	r8,r0
	add	#4,r4
	add	#1,r7
	mov	#6,r8
	cmp/ge	r8,r7
	bf	.L0603E8D8
.L0603E8F0:
	mov.l	.L0603E904,r3
	add	r9,r3
	mov.b	@r3,r8
.L0603E8F6:
	bra	.L0603E912
	mov	r8,r0
.L0603E8FA:
	.short 0x0064
.L0603E8FC:
	.long D_0603E944
.L0603E900:
	.long D_060FFE98
.L0603E904:
	.long D_0603E92C
.L0603E908:
	mov.b	@(22,gbr),r0
	add	#1,r0
	mov.b	r0,@(25,gbr)
	rts
	nop
.L0603E912:
	shar	r0
	cmp/pz	r0
	bt	.L0603E91A
	mov	#0,r0
.L0603E91A:
	mov	#5,r9
	cmp/gt	r9,r0
	bf	.L0603E922
	mov	r9,r0
.L0603E922:
	shll	r0
	add	#1,r0
	mov.b	r0,@(25,gbr)
	rts
	nop
	dlabel D_0603E92C
	.byte 0x01, 0x05, 0x0B, 0x03, 0x09, 0x07, 0x01, 0x00
	dlabel D_0603E934
	.byte 0x01, 0x02, 0x01, 0x02, 0x01, 0x02, 0x01, 0x00
	dlabel D_0603E93C
	.byte 0x0A, 0x08, 0x06, 0x04, 0x02, 0x01, 0x00, 0x09
	dlabel D_0603E944
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	endlabel func_0603E7C0

	glabel func_0603E964
	sts.l	pr,@-r15
	mov.l	.L0603E994,r4
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r4),r4
	mov.l	.L0603E998,r7
	mov.b	@(3,r7),r0
	shll2	r0
	mov.l	@(r0,r4),r4
	cmp/pz	r4
	bt	.L0603E9A0
	mov.l	.L0603E99C,r0
	jsr	@r0
	nop
	mov.l	.L0603E998,r7
	mov.b	@(25,gbr),r0
	mov.b	r0,@(21,gbr)
	mov	#3,r0
	mov.b	r0,@(3,r7)
	lds.l	@r15+,pr
	rts
	mov	#-1,r0
	.byte 0x00, 0x00
.L0603E994:
	.long D_0603EB54
.L0603E998:
	.long D_060FFE50
.L0603E99C:
	.long func_0603E7C0
.L0603E9A0:
	mov.l	.L0603E9C4,r2
	mov.l	.L0603E9C8,r0
	jsr	@r0
	nop
	mov.l	.L0603E9CC,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	@r4+,r0
	mov.l	r0,@(60,r3)
	mov	#31,r8
	add	r3,r8
	mov.b	r0,@r8
	mov.l	@r4+,r0
	mov.l	r0,@(52,r3)
	lds.l	@r15+,pr
	rts
	mov	#0,r0
	.byte 0x00, 0x00
.L0603E9C4:
	.long D_060FFFB8
.L0603E9C8:
	.long func_0600D0D0
.L0603E9CC:
	.long func_0603EF88
	endlabel func_0603E964

	glabel func_0603E9D0
	sts.l	pr,@-r15
	mov.l	.L0603E9E4,r3
	mov.l	@r3,r3
	mov	r0,r14
	mov	#1,r13
.L0603E9DA:
	cmp/pl	r0
	bf	.L0603E9E8
	add	#-1,r0
	bra	.L0603E9DA
	shll	r13
.L0603E9E4:
	.long D_060F30A8
.L0603E9E8:
	mov.b	@r3,r0
	or	r0,r13
	mov.b	r13,@r3
	mov	#1,r0
	mov.b	r0,@(1,r3)
	add	#4,r3
	mov	#12,r0
	mulu.w	r0,r14
	sts	macl,r0
	add	r0,r3
	mov	#12,r0
	mulu.w	r0,r14
	sts	macl,r0
	mov.l	.L0603EA64,r2
	add	r0,r2
	add	#6,r2
	mov.w	@r2+,r4
	shll16	r4
	mov.w	@r2+,r6
	shll16	r6
	mov.w	@(24,r1),r0
	mov	r0,r8
	mov.w	@(12,r1),r0
	add	r8,r0
	mov.l	.L0603EA68,r10
	jsr	@r10
	neg	r0,r0
	mov.l	.L0603EA6C,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r0
	add	r0,r4
	mov.l	r4,@r3
	mov.l	@(52,r1),r0
	mov.l	.L0603EA70,r8
	sub	r8,r0
	mov.l	r0,@(4,r3)
	mov.l	@(56,r1),r0
	add	r0,r6
	mov.l	r6,@(8,r3)
	mov.b	@(11,r1),r0
	tst	r0,r0
	bf	.L0603EA5C
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#30,r6
	mov.l	.L0603EA74,r0
	jsr	@r0
	mov	#4,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L0603EA5C:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0603EA64:
	.long D_0603D96E
.L0603EA68:
	.long func_06007BD8
.L0603EA6C:
	.long func_06017B7C
.L0603EA70:
	.long 0x00600000
.L0603EA74:
	.long func_0600E4C4
	endlabel func_0603E9D0

	.section .data.0603EA78,"aw",@progbits
	.p2align 2
	.byte 0x40, 0x31, 0x43, 0x4F, 0x4E, 0x47, 0x52, 0x41, 0x54, 0x55, 0x4C, 0x41, 0x54, 0x49, 0x4F, 0x4E
	.byte 0x53, 0x21, 0xFE, 0x09, 0x40, 0x30, 0x52, 0x45, 0x54, 0x55, 0x52, 0x4E, 0x20, 0x40, 0x31, 0x49
	.byte 0x44, 0x45, 0x41, 0x40, 0x30, 0x20, 0x26, 0x20, 0x20, 0x20, 0xFE, 0x09, 0x40, 0x30, 0x20, 0x47
	.byte 0x4F, 0x54, 0x4F, 0x20, 0x40, 0x32, 0x4E, 0x40, 0x30, 0x49, 0x47, 0x48, 0x54, 0x2D, 0x40, 0x32
	.byte 0x4D, 0x40, 0x30, 0x41, 0x52, 0x45, 0xFE, 0x09, 0x40, 0x30, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFE, 0x09, 0x40, 0x30, 0x42, 0x52
	.byte 0x45, 0x41, 0x4B, 0x20, 0x40, 0x32, 0x4D, 0x40, 0x30, 0x41, 0x52, 0x45, 0x27, 0x53, 0x20, 0x42
	.byte 0x41, 0x53, 0x45, 0xFE, 0x40, 0x30, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFE, 0x40, 0x30, 0x52, 0x45, 0x54, 0x55, 0x52, 0x4E
	.byte 0x20, 0x54, 0x48, 0x49, 0x53, 0x20, 0x40, 0x31, 0x49, 0x44, 0x45, 0x41, 0xFE, 0x09, 0x40, 0x30
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0xFE, 0x40, 0x30, 0x4D, 0x4F, 0x52, 0x45, 0x20, 0x40, 0x31, 0x50, 0x4F, 0x57, 0x2D, 0x43
	.byte 0x41, 0x50, 0x53, 0x55, 0x4C, 0x45, 0x21, 0xFE, 0x40, 0x30, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFE
	dlabel D_0603EB54
	.long D_0603EB74
	.long D_0603EBA8
	.long D_0603EBDC
	.long D_0603EC10
	.long D_0603EC44
	.long D_0603EC78
	.long D_0603ECAC
	.long D_0603ECAC
	dlabel D_0603EB74
	.long D_0603EB88
	.long D_0603EB90
	.long D_0603EB98
	.long D_0603EBA0
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_0603EB88
	.byte 0x00, 0x20, 0x00, 0x05, 0x0A, 0x95, 0x00, 0x00
	dlabel D_0603EB90
	.byte 0x11, 0xF6, 0x00, 0x06, 0xF7, 0x40, 0x00, 0x00
	dlabel D_0603EB98
	.byte 0x1C, 0x50, 0x00, 0x08, 0x0B, 0xA0, 0x00, 0x00
	dlabel D_0603EBA0
	.byte 0x1A, 0xEA, 0x00, 0x09, 0xFA, 0xC0, 0x00, 0x00
	dlabel D_0603EBA8
	.long D_0603EBBC
	.long D_0603EBC4
	.long D_0603EBCC
	.long D_0603EBD4
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_0603EBBC
	.byte 0x01, 0x9E, 0x00, 0x02, 0x08, 0x60, 0x00, 0x00
	dlabel D_0603EBC4
	.byte 0x0C, 0xE5, 0x00, 0x0C, 0xF8, 0xC0, 0x00, 0x00
	dlabel D_0603EBCC
	.byte 0x04, 0x68, 0x00, 0x07, 0x07, 0x50, 0x00, 0x00
	dlabel D_0603EBD4
	.byte 0x03, 0xE8, 0x00, 0x0E, 0x08, 0xE0, 0x00, 0x00
	dlabel D_0603EBDC
	.long D_0603EBF0
	.long D_0603EBF8
	.long D_0603EC00
	.long D_0603EC08
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_0603EBF0
	.byte 0x01, 0x5C, 0x00, 0x05, 0x08, 0x60, 0x00, 0x00
	dlabel D_0603EBF8
	.byte 0x03, 0x00, 0x00, 0x09, 0x08, 0x00, 0x00, 0x00
	dlabel D_0603EC00
	.byte 0x0E, 0x98, 0x00, 0x0A, 0x07, 0x60, 0x00, 0x00
	dlabel D_0603EC08
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x08, 0x60, 0x00, 0x00
	dlabel D_0603EC10
	.long D_0603EC24
	.long D_0603EC2C
	.long D_0603EC34
	.long D_0603EC3C
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_0603EC24
	.byte 0x02, 0x36, 0x00, 0x06, 0x03, 0xD0, 0x00, 0x00
	dlabel D_0603EC2C
	.byte 0x03, 0x60, 0x00, 0x0D, 0x03, 0xB0, 0x00, 0x00
	dlabel D_0603EC34
	.byte 0x10, 0x1C, 0x00, 0x12, 0x03, 0x60, 0x00, 0x00
	dlabel D_0603EC3C
	.byte 0x08, 0x39, 0x00, 0x16, 0x03, 0xD0, 0x00, 0x00
	dlabel D_0603EC44
	.long D_0603EC58
	.long D_0603EC60
	.long D_0603EC68
	.long D_0603EC70
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_0603EC58
	.byte 0x03, 0x3E, 0x00, 0x02, 0x03, 0x33, 0x00, 0x00
	dlabel D_0603EC60
	.byte 0x13, 0x20, 0x00, 0x06, 0xF8, 0x60, 0x00, 0x00
	dlabel D_0603EC68
	.byte 0x02, 0xEA, 0x00, 0x07, 0x03, 0x37, 0x00, 0x00
	dlabel D_0603EC70
	.byte 0x1E, 0xFB, 0x00, 0x0A, 0x03, 0x00, 0x00, 0x00
	dlabel D_0603EC78
	.long D_0603EC8C
	.long D_0603EC94
	.long D_0603EC9C
	.long D_0603ECA4
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_0603EC8C
	.byte 0x08, 0x20, 0x00, 0x03, 0xE8, 0x30, 0x00, 0x00
	dlabel D_0603EC94
	.byte 0x09, 0xC0, 0x00, 0x05, 0xEB, 0x70, 0x00, 0x00
	dlabel D_0603EC9C
	.byte 0x16, 0xB6, 0x00, 0x0A, 0xE6, 0xF0, 0x00, 0x00
	dlabel D_0603ECA4
	.byte 0x02, 0xBE, 0x00, 0x0D, 0xFC, 0x20, 0x00, 0x00
	dlabel D_0603ECAC
	.long D_0603ECC0
	.long D_0603ECC8
	.long D_0603ECD0
	.long D_0603ECD8
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_0603ECC0
	.byte 0x04, 0xF1, 0x00, 0x01, 0x12, 0x00, 0x00, 0x00
	dlabel D_0603ECC8
	.byte 0x01, 0xC7, 0x00, 0x04, 0x12, 0x00, 0x00, 0x00
	dlabel D_0603ECD0
	.byte 0x16, 0x39, 0x00, 0x07, 0x12, 0x00, 0x00, 0x00
	dlabel D_0603ECD8
	.byte 0x08, 0x5C, 0x00, 0x0A, 0xEF, 0x40, 0x00, 0x00
	dlabel D_0603ECE0
	.long D_0603ED00
	.long D_0603ED10
	.long D_0603ED20
	.long D_0603ED30
	.long D_0603ED40
	.long D_0603ED50
	.long D_0603ED20
	.long D_0603ED20
	dlabel D_0603ED00
	.byte 0xFF, 0xF0, 0x00, 0x00, 0xFF, 0xF0, 0x00, 0x09, 0xFF, 0xF0, 0x00, 0x02, 0xFF, 0xF0, 0x00, 0x05
	dlabel D_0603ED10
	.byte 0xFF, 0xF8, 0x00, 0x00, 0xFF, 0xF8, 0x00, 0x02, 0xFF, 0xF8, 0x00, 0x01, 0xFF, 0xF8, 0x00, 0x07
	dlabel D_0603ED20
	.byte 0xFF, 0xF8, 0x00, 0x00, 0xFF, 0xF8, 0x00, 0x01, 0xFF, 0xF8, 0x00, 0x02, 0xFF, 0xF8, 0x00, 0x04
	dlabel D_0603ED30
	.byte 0xFF, 0xF0, 0x00, 0x00, 0xFF, 0xF0, 0x00, 0x03, 0xFF, 0xF0, 0x00, 0x06, 0xFF, 0xF0, 0x00, 0x08
	dlabel D_0603ED40
	.byte 0xFF, 0xF0, 0x00, 0x00, 0xFF, 0xF0, 0x00, 0x01, 0xFF, 0xF0, 0x00, 0x04, 0xFF, 0xF0, 0x00, 0x08
	dlabel D_0603ED50
	.byte 0xFF, 0xF8, 0x00, 0x00, 0xFF, 0xF8, 0x00, 0x01, 0xFF, 0xF8, 0x00, 0x02, 0xFF, 0xF8, 0x00, 0x05
	.long D_0603ED80
	.long D_0603ED80
	.long D_0603ED80
	.long D_0603ED80
	.long D_0603ED80
	.long D_0603ED80
	.long D_0603ED80
	.long D_0603ED80
	dlabel D_0603ED80
	.byte 0x00, 0x0F, 0x42, 0x3F, 0x00, 0x0F, 0x42, 0x3F, 0x00, 0x0F, 0x42, 0x3F, 0x00, 0x0F, 0x42, 0x3F
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x3A, 0x98, 0x00, 0x00, 0x3A, 0x98
	.byte 0xE0, 0x00, 0x11, 0x00, 0xD0, 0x02, 0x21, 0x06, 0x71, 0x04, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x00
	.long D_0603EDB4
	dlabel D_0603EDB4
	.byte 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01
	.byte 0x40, 0x2B, 0x00, 0x09
	.long func_0600D1A0
