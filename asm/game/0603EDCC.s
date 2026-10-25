	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603EDCC,"ax",@progbits
	.p2align 2

	glabel func_0603EDCC
	sts.l	pr,@-r15
	mov.l	.L0603EDDC,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L0603EDE0
	bra	.L0603EF18
	nop
.L0603EDDC:
	.long D_060F3064
.L0603EDE0:
	mov.b	@(20,gbr),r0
	cmp/eq	#6,r0
	bt	.L0603EE6C
	cmp/eq	#12,r0
	bt	.L0603EE6C
	cmp/eq	#14,r0
	bt	.L0603EE6C
	mov.l	@(12,gbr),r0
	tst	#3,r0
	bf	.L0603EE6C
	mov.l	.L0603EE78,r2
	mov	#1,r7
.L0603EDF8:
	mov.l	.L0603EE7C,r0
	jsr	@r0
	nop
	mov.l	.L0603EE80,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L0603EE84,r0
	jsr	@r0
	nop
	mov.w	.L0603EE76,r9
	and	r9,r0
	add	#-127,r0
	shll16	r0
	mov	r0,r4
	mov.l	.L0603EE84,r0
	jsr	@r0
	nop
	mov.w	.L0603EE76,r9
	and	r9,r0
	add	#-127,r0
	shll16	r0
	mov	r0,r6
	mov	#0,r5
	mov.l	.L0603EE88,r10
	jsr	@r10
	mov.w	@(26,r1),r0
	mov.l	.L0603EE8C,r0
	jsr	@r0
	nop
	mov.l	.L0603EE88,r10
	jsr	@r10
	mov.w	@(24,r1),r0
	mov.l	.L0603EE90,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r0
	add	r4,r0
	mov.l	r0,@(48,r3)
	mov.l	@(52,r1),r0
	add	r5,r0
	mov.l	r0,@(52,r3)
	mov.l	@(56,r1),r0
	add	r6,r0
	mov.l	r0,@(56,r3)
	mov.l	.L0603EE84,r0
	jsr	@r0
	nop
	mov.l	.L0603EE94,r8
	and	r8,r0
	mov.l	.L0603EE98,r5
	add	r0,r5
	mov.l	r5,@(32,r3)
	mov.w	@(26,r1),r0
	mov.w	r0,@(26,r3)
	mov.w	@(24,r1),r0
	mov.w	r0,@(24,r3)
	dt	r7
	bf	.L0603EDF8
.L0603EE6C:
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L0603EE9C
	bra	.L0603EF18
	nop
.L0603EE76:
	.short 0x00FF
.L0603EE78:
	.long D_060FFFB8
.L0603EE7C:
	.long func_0600D0D0
.L0603EE80:
	.long func_060418F8
.L0603EE84:
	.long func_06007B96
.L0603EE88:
	.long func_06007BD8
.L0603EE8C:
	.long func_06017BA6
.L0603EE90:
	.long func_06017B7C
.L0603EE94:
	.long 0x00007FFF
.L0603EE98:
	.long 0x00080000
.L0603EE9C:
	mov.l	.L0603EED4,r2
	mov.l	.L0603EED8,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	mov.w	@(26,r1),r0
	mov	r0,r13
	mov.l	.L0603EEDC,r8
	mov.l	@r8,r8
	add	#48,r8
	mov.l	.L0603EEE0,r0
	jsr	@r0
	nop
	tst	r0,r0
	bf	.L0603EEEC
	mov.l	@(0,r1),r0
	mov.l	.L0603EEE4,r8
	add	r8,r0
	mov.l	.L0603EEE8,r8
	cmp/ge	r8,r0
	bf	.L0603EECC
	mov	r8,r0
.L0603EECC:
	mov.l	r0,@(0,r1)
	bra	.L0603EEFA
	nop
	.byte 0x00, 0x00
.L0603EED4:
	.long D_0603D9AA
.L0603EED8:
	.long 0x00010000
.L0603EEDC:
	.long D_060F3064
.L0603EEE0:
	.long func_0601762C
.L0603EEE4:
	.long 0x00008000
.L0603EEE8:
	.long 0x00060000
.L0603EEEC:
	mov.l	@(0,r1),r0
	mov.l	.L0603EF48,r8
	sub	r8,r0
	cmp/pz	r0
	bt	.L0603EEF8
	mov	#0,r0
.L0603EEF8:
	mov.l	r0,@(0,r1)
.L0603EEFA:
	mov	#0,r4
	mov.l	@(0,r1),r5
	mov	#0,r6
	mov.l	.L0603EF4C,r10
	jsr	@r10
	mov.w	@(26,r1),r0
	mov.l	.L0603EF50,r0
	jsr	@r0
	nop
	mov.l	@(576,gbr),r0
	sub	r4,r0
	mov.l	r0,@(576,gbr)
	mov.l	@(580,gbr),r0
	add	r5,r0
	mov.l	r0,@(580,gbr)
.L0603EF18:
	mov.b	@(20,gbr),r0
	cmp/eq	#0,r0
	bt	.L0603EF5C
	cmp/eq	#14,r0
	bt	.L0603EF26
	cmp/eq	#12,r0
	bf	.L0603EF76
.L0603EF26:
	mov.w	.L0603EF44,r11
	mov	#127,r12
	mov.l	.L0603EF54,r0
	jsr	@r0
	nop
	bt	.L0603EF76
	mov	#4,r8
	mov.w	.L0603EF46,r9
	mov	#3,r5
	mov	#13,r6
	mov.l	.L0603EF58,r0
	jsr	@r0
	mov	#6,r4
	bra	.L0603EF76
	nop
.L0603EF44:
	.short 0x0100
.L0603EF46:
	.short 0x0078
.L0603EF48:
	.long 0x00002000
.L0603EF4C:
	.long func_06007BD8
.L0603EF50:
	.long func_06017BA6
.L0603EF54:
	.long func_0600EA22
.L0603EF58:
	.long func_0600E968
.L0603EF5C:
	mov.w	.L0603EF7C,r11
	mov	#127,r12
	mov.l	.L0603EF80,r0
	jsr	@r0
	nop
	bt	.L0603EF76
	mov	#2,r8
	mov.w	.L0603EF7E,r9
	mov	#3,r5
	mov	#11,r6
	mov.l	.L0603EF84,r0
	jsr	@r0
	mov	#6,r4
.L0603EF76:
	lds.l	@r15+,pr
	rts
	nop
.L0603EF7C:
	.short 0x0100
.L0603EF7E:
	.short 0x0078
.L0603EF80:
	.long func_0600EA22
.L0603EF84:
	.long func_0600E968
	endlabel func_0603EDCC

	glabel func_0603EF88
	sts.l	pr,@-r15
	mov.l	.L0603EFC8,r6
	mov.l	r1,@r6
	mov.w	.L0603EFC6,r0
	mov.w	r0,@(28,r1)
	mov	#0,r0
	mov.l	r0,@(16,r1)
	mov.b	r0,@(11,r1)
	mov.b	r0,@(14,r1)
	mov	#64,r2
	add	r1,r2
	mov.l	@(52,r1),r0
	mov.l	r0,@(0,r2)
	cmp/pz	r0
	bt	.L0603EFAA
	neg	r0,r0
	mov.l	r0,@(52,r1)
.L0603EFAA:
	mov.b	@(20,gbr),r0
	cmp/eq	#4,r0
	bf	.L0603EFDC
	mov.l	.L0603EFCC,r7
	mov.b	@(3,r7),r0
	cmp/eq	#3,r0
	bf	.L0603EFDC
	mov.l	.L0603EFD0,r8
	mov.l	.L0603EFD4,r9
	mov.l	.L0603EFD8,r10
	mov.l	r8,@(48,r1)
	mov.l	r9,@(52,r1)
	bra	.L0603EFE2
	mov.l	r10,@(56,r1)
.L0603EFC6:
	.short 0x1A98
.L0603EFC8:
	.long D_060F30F0
.L0603EFCC:
	.long D_060FFE50
.L0603EFD0:
	.long 0x1F300000
.L0603EFD4:
	.long 0x08600000
.L0603EFD8:
	.long 0x10F00000
.L0603EFDC:
	mov.l	.L0603F010,r0
	jsr	@r0
	nop
.L0603EFE2:
	mov.l	.L0603F014,r7
	mov.b	@(3,r7),r0
	tst	r0,r0
	bf	.L0603F078
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	.L0603F018,r0
	sub	r0,r5
	mov.l	r5,@(52,r1)
	mov.l	.L0603F01C,r0
	mov.l	@r0,r4
	mov.l	.L0603F014,r7
	mov.b	@(3,r7),r0
	mov	r0,r14
	mov	#2,r13
.L0603F006:
	cmp/pl	r0
	bf	.L0603F020
	add	#-1,r0
	bra	.L0603F006
	shll	r13
.L0603F010:
	.long func_06018E8C
.L0603F014:
	.long D_060FFE50
.L0603F018:
	.long 0x00300000
.L0603F01C:
	.long D_060F30A8
.L0603F020:
	mov.b	r13,@r4
	mov	#7,r0
	mov.b	r0,@(1,r4)
	add	#16,r4
	mov	#12,r0
	mulu.w	r0,r14
	sts	macl,r0
	add	r0,r4
	mov.l	@(48,r1),r0
	mov.l	r0,@r4
	mov.l	@(52,r1),r0
	mov.l	.L0603F068,r8
	sub	r8,r0
	mov.l	r0,@(4,r4)
	mov.l	@(56,r1),r0
	mov.l	r0,@(8,r4)
	mov.l	.L0603F06C,r0
	mov.l	r0,@(4,r1)
	mov.w	.L0603F062,r0
	mov.w	.L0603F064,r0
	mov.w	r0,@(8,r1)
	mov	#20,r0
	mov.l	.L0603F070,r2
	mov.l	r0,@r2
	mov.l	r0,@(4,r2)
	mov	#7,r0
	mov.b	r0,@(10,r1)
	mov.l	.L0603F074,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L0603F062:
	.short 0x003C
.L0603F064:
	.short 0x000A
	.byte 0x00, 0x00
.L0603F068:
	.long 0x00500000
.L0603F06C:
	.long 0x00000000
.L0603F070:
	.long D_060FFEC0
.L0603F074:
	.long D_0603F124
.L0603F078:
	mov.l	.L0603F0A8,r0
	mov.l	r0,@(4,r1)
	mov	#0,r0
	mov.l	r0,@(44,r1)
	mov.l	.L0603F0AC,r6
	mov.l	.L0603F0B0,r13
	mov	#7,r14
	mov.l	.L0603F0B4,r4
	bsr	func_0603F1EC
	nop
	mov	#0,r0
	mov.l	r0,@(712,gbr)
	mov.b	@(20,gbr),r0
	cmp/eq	#14,r0
	bt	.L0603F09A
	cmp/eq	#12,r0
	bf	.L0603F0BC
.L0603F09A:
	mov.w	.L0603F0A6,r0
	mov.w	r0,@(8,r1)
	mov.l	.L0603F0B8,r0
	mov.l	r0,@-r1
	bra	.L0603F0CE
	add	#4,r1
.L0603F0A6:
	.short 0x00B4
.L0603F0A8:
	.long 0x00010000
.L0603F0AC:
	.long D_06040094
.L0603F0B0:
	.long D_060886CC
.L0603F0B4:
	.long D_060F48F8
.L0603F0B8:
	.long func_0603F0DC
.L0603F0BC:
	mov.l	.L0603F0D4,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov	#20,r0
	mov.l	.L0603F0D8,r2
	mov.l	r0,@r2
	mov.l	r0,@(4,r2)
	mov	#7,r0
	mov.b	r0,@(10,r1)
.L0603F0CE:
	lds.l	@r15+,pr
	rts
	nop
.L0603F0D4:
	.long func_0603F238
.L0603F0D8:
	.long D_060FFEC0
	endlabel func_0603EF88

	glabel func_0603F0DC
	mov.w	@(8,r1),r0
	dt	r0
	bf	.L0603F0F4
	mov.l	.L0603F0FC,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov	#20,r0
	mov.l	.L0603F100,r2
	mov.l	r0,@r2
	mov.l	r0,@(4,r2)
	mov	#7,r0
	mov.b	r0,@(10,r1)
.L0603F0F4:
	mov.w	r0,@(8,r1)
	rts
	nop
	.byte 0x00, 0x00
.L0603F0FC:
	.long func_0603F238
.L0603F100:
	.long D_060FFEC0
	dlabel D_0603F104
	.long D_06093E38
	.long D_06093E78
	.long D_06093E58
	.long D_06093E98
	dlabel D_0603F114
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.long D_06093838
	.long D_06093A38
	.long D_06093C38
	dlabel D_0603F124
	.byte 0x85, 0x14, 0x70, 0xFF, 0x40, 0x11, 0x89, 0x11
	endlabel func_0603F0DC

	glabel func_0603F12C
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#3,r6
	mov.l	.L0603F158,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L0603F15C,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.w	r0,@(8,r1)
	rts
	nop
	.byte 0x00, 0x00
.L0603F158:
	.long func_0600E4C4
.L0603F15C:
	.long func_0603F160
	endlabel func_0603F12C

	glabel func_0603F160
	sts.l	pr,@-r15
	mov.l	.L0603F1C8,r6
	add	#4,r6
	mov.l	@(44,r1),r8
	swap.w	r8,r0
	extu.w	r0,r0
	shll2	r0
	shll	r0
	add	r0,r6
	mov.l	@(4,r6),r0
	mov.l	.L0603F1CC,r10
	dmuls.l	r0,r10
	sts	mach,r0
	sts	macl,r10
	xtrct	r0,r10
	add	r10,r8
	mov.l	r8,@(44,r1)
	shar	r8
	mov.l	.L0603F1D0,r10
	jsr	@r10
	mov	r8,r0
	neg	r10,r10
	shll2	r10
	shll2	r10
	shll	r10
	mov.l	r10,@(0,r1)
	mov.l	.L0603F1C8,r6
	mov.l	.L0603F1D4,r13
	mov	#7,r14
	mov.l	.L0603F1D8,r4
	bsr	func_0603F1EC
	nop
	mov.l	@(44,r1),r0
	shlr16	r0
	cmp/eq	#4,r0
	bf	.L0603F1C2
	mov.l	.L0603F1DC,r2
	mov.l	.L0603F1E0,r0
	jsr	@r0
	nop
	mov.l	.L0603F1E4,r0
	mov.l	r0,@(12,r3)
	mov	#0,r0
	mov.l	r0,@(44,r1)
	mov	#0,r0
	mov.l	r0,@(712,gbr)
	mov.l	.L0603F1E8,r0
	mov.l	r0,@-r1
	add	#4,r1
.L0603F1C2:
	bra	func_0603FB00
	nop
	.byte 0x00, 0x00
.L0603F1C8:
	.long D_06040068
.L0603F1CC:
	.long 0x00008000
.L0603F1D0:
	.long func_06007C08
.L0603F1D4:
	.long D_060886CC
.L0603F1D8:
	.long D_060F48F8
.L0603F1DC:
	.long D_060FFFA8
.L0603F1E0:
	.long func_0600D0D0
.L0603F1E4:
	.long D_0603BE60
.L0603F1E8:
	.long func_0603F238
	endlabel func_0603F160

	glabel func_0603F1EC
	sts.l	pr,@-r15
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603F1FA
	lds.l	@r15+,pr
	rts
	nop
.L0603F1FA:
	mov.l	@r6+,r9
	add	#-1,r9
	mov.l	@(44,r1),r8
	extu.w	r8,r5
	swap.w	r8,r0
	extu.w	r0,r0
	cmp/ge	r9,r0
	bt	.L0603F20E
	mov	r0,r9
	add	#1,r9
.L0603F20E:
	shll2	r0
	shll	r0
	shll2	r9
	shll	r9
	mov.l	@(r0,r6),r10
	mov	r9,r0
	mov.l	@(r0,r6),r11
.L0603F21C:
	mov.l	@r13+,r7
	mov.l	@r10+,r2
	mov.l	@r11+,r3
	mov.l	r4,@r7
	mov.l	.L0603F234,r0
	jsr	@r0
	nop
	dt	r14
	bf	.L0603F21C
	lds.l	@r15+,pr
	rts
	nop
.L0603F234:
	.long func_06041C82
	endlabel func_0603F1EC

	glabel func_0603F238
	mov.l	.L0603F248,r7
	mov.b	@(9,r7),r0
	cmp/eq	#1,r0
	bf	.L0603F250
	mov.l	.L0603F24C,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0603F248:
	.long D_060FFE50
.L0603F24C:
	.long func_0600D1A0
.L0603F250:
	sts.l	pr,@-r15
	mov.l	.L0603F2A0,r0
	mov.l	@r0,r4
	mov.l	.L0603F2A4,r7
	mov.b	@(3,r7),r0
	mov	r0,r14
	add	#16,r4
	mov	#12,r0
	mulu.w	r0,r14
	sts	macl,r0
	add	r0,r4
	mov.l	@(48,r1),r0
	mov.l	r0,@r4
	mov.l	@(52,r1),r0
	mov.l	.L0603F2A8,r8
	sub	r8,r0
	mov.l	r0,@(4,r4)
	mov.l	@(56,r1),r0
	mov.l	r0,@(8,r4)
	mov.l	.L0603F2AC,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L0603F2B4
	mov.b	@(20,gbr),r0
	cmp/eq	#10,r0
	bf	.L0603F28E
	mov.l	.L0603F2A4,r7
	mov.b	@(3,r7),r0
	cmp/eq	#3,r0
	bt	.L0603F2B4
.L0603F28E:
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	.L0603F2B0,r9
	bra	.L0603F2F6
	add	r5,r9
	.byte 0x00, 0x00
.L0603F2A0:
	.long D_060F30A8
.L0603F2A4:
	.long D_060FFE50
.L0603F2A8:
	.long 0x00500000
.L0603F2AC:
	.long D_060F3064
.L0603F2B0:
	.long 0xFFD00000
.L0603F2B4:
	mov	#64,r2
	add	r1,r2
	mov.l	@(0,r2),r0
	cmp/pz	r0
	bt	.L0603F2C2
	bra	.L0603F2F6
	neg	r0,r9
.L0603F2C2:
	mov.l	.L0603F33C,r8
	mov.l	.L0603F340,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bt	.L0603F302
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	.L0603F344,r0
	add	r0,r4
	mov.l	.L0603F348,r0
	sub	r0,r5
	mov.l	.L0603F34C,r3
	mov.l	@r3,r3
	mov.l	@(52,r3),r9
	mov.l	.L0603F350,r0
	add	r0,r9
	cmp/ge	r4,r9
	bt	.L0603F2F0
	mov	r4,r9
.L0603F2F0:
	cmp/ge	r5,r9
	bf	.L0603F2F6
	mov	r5,r9
.L0603F2F6:
	mov.l	@(52,r1),r8
	mov.l	.L0603F354,r10
	mov.l	.L0603F358,r0
	jsr	@r0
	nop
	mov.l	r8,@(52,r1)
.L0603F302:
	mov.l	.L0603F35C,r8
	mov.b	@(20,gbr),r0
	cmp/eq	#12,r0
	bt	.L0603F30E
	cmp/eq	#14,r0
	bf	.L0603F310
.L0603F30E:
	mov.l	.L0603F360,r8
.L0603F310:
	mov.l	.L0603F340,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bt	.L0603F370
	mov.l	.L0603F364,r8
	mov.l	.L0603F368,r3
	mov.l	@r3,r3
	mov.l	@(48,r3),r4
	mov.l	@(48,r1),r0
	sub	r0,r4
	mov.l	@(56,r3),r5
	mov.l	@(56,r1),r0
	sub	r0,r5
	mov.l	.L0603F36C,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bt	.L0603F370
	lds.l	@r15+,pr
	rts
	nop
.L0603F33C:
	.long 0x01000000
.L0603F340:
	.long func_06017400
.L0603F344:
	.long 0x01100000
.L0603F348:
	.long 0x00300000
.L0603F34C:
	.long D_060F3064
.L0603F350:
	.long 0x00C40000
.L0603F354:
	.long 0x00038000
.L0603F358:
	.long func_06031DE0
.L0603F35C:
	.long 0x03000000
.L0603F360:
	.long 0x06A40000
.L0603F364:
	.long 0x00090000
.L0603F368:
	.long D_060F309C
.L0603F36C:
	.long func_06017440
.L0603F370:
	mov.l	.L0603F3C8,r6
	mov.l	@r6+,r9
	add	#-1,r9
	shll16	r9
	mov.l	@(44,r1),r8
	swap.w	r8,r0
	extu.w	r0,r0
	shll2	r0
	shll	r0
	add	r0,r6
	mov.l	@(4,r6),r0
	mov.l	.L0603F3CC,r10
	dmuls.l	r0,r10
	sts	mach,r0
	sts	macl,r10
	xtrct	r0,r10
	add	r10,r8
	cmp/ge	r9,r8
	bf	.L0603F398
	sub	r9,r8
.L0603F398:
	mov.l	r8,@(44,r1)
	shar	r8
	mov.l	.L0603F3D0,r10
	jsr	@r10
	mov	r8,r0
	neg	r10,r10
	shll2	r10
	shll2	r10
	shll	r10
	mov.l	r10,@(0,r1)
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L0603F3BE
	mov.l	.L0603F3C8,r6
	mov.l	.L0603F3D4,r13
	mov	#5,r14
	mov.l	.L0603F3D8,r4
	bsr	func_0603F1EC
	nop
.L0603F3BE:
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L0603F3DC
	bra	.L0603F5C8
	nop
.L0603F3C8:
	.long D_06040094
.L0603F3CC:
	.long 0x00018000
.L0603F3D0:
	.long func_06007C08
.L0603F3D4:
	.long D_060886CC
.L0603F3D8:
	.long D_060F48F8
.L0603F3DC:
	mov.l	.L0603F424,r0
	mov.l	@r0,r2
	mov	#64,r0
	add	r0,r2
	mov.b	@r2,r0
	tst	r0,r0
	bf	.L0603F41E
	mov.b	@(20,gbr),r0
	cmp/eq	#4,r0
	bf	.L0603F3F8
	mov.l	.L0603F428,r7
	mov.b	@(3,r7),r0
	cmp/eq	#3,r0
	bt	.L0603F402
.L0603F3F8:
	mov.l	.L0603F424,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L0603F4F8
.L0603F402:
	mov.l	@(52,r1),r5
	mov.l	.L0603F42C,r8
	sub	r8,r5
	mov.l	r5,@(52,r1)
	mov.l	.L0603F430,r8
	mov.l	.L0603F434,r0
	jsr	@r0
	nop
	mov.l	@(52,r1),r5
	mov.l	.L0603F42C,r8
	add	r8,r5
	mov.l	r5,@(52,r1)
	tst	r0,r0
	bt	.L0603F438
.L0603F41E:
	bra	.L0603F5C8
	nop
	.byte 0x00, 0x00
.L0603F424:
	.long D_060F3064
.L0603F428:
	.long D_060FFE50
.L0603F42C:
	.long 0x00C00000
.L0603F430:
	.long 0x00600000
.L0603F434:
	.long func_060172DE
.L0603F438:
	mov.l	.L0603F448,r7
	mov.l	.L0603F44C,r2
	mov.l	@r2,r8
	mov.b	@(8,r7),r0
	tst	r0,r0
	bf	.L0603F450
	bra	.L0603F5C8
	nop
.L0603F448:
	.long D_060FFE50
.L0603F44C:
	.long D_060FFEC0
.L0603F450:
	mov.l	.L0603F4D0,r4
	mov.l	@r4,r4
	add	#-4,r4
	mov.l	@r4,r0
	mov.l	.L0603F4D4,r8
	cmp/eq	r8,r0
	bt	.L0603F4C8
	mov.l	.L0603F4D8,r8
	cmp/eq	r8,r0
	bt	.L0603F4C8
	mov.l	.L0603F4DC,r2
	mov.l	.L0603F4E0,r0
	jsr	@r0
	nop
	mov.l	.L0603F4E4,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r1,@(16,r3)
	mov.l	.L0603F4E8,r0
	jsr	@r0
	nop
	bsr	func_0603FDE0
	nop
	mov.l	.L0603F4D0,r4
	mov.l	@r4,r4
	mov.l	@(48,r1),r8
	mov.l	@(48,r4),r0
	sub	r0,r8
	shar	r8
	shar	r8
	shar	r8
	shar	r8
	mov.l	r8,@(32,r1)
	mov.l	@(52,r1),r8
	mov.l	.L0603F4EC,r0
	sub	r0,r8
	mov.l	@(52,r4),r0
	sub	r0,r8
	shar	r8
	shar	r8
	shar	r8
	shar	r8
	mov.l	r8,@(36,r1)
	mov.l	@(56,r1),r8
	mov.l	@(56,r4),r0
	sub	r0,r8
	shar	r8
	shar	r8
	shar	r8
	shar	r8
	mov.l	r8,@(40,r1)
	mov.w	.L0603F4CC,r0
	mov.w	r0,@(8,r1)
	mov.l	.L0603F4F0,r7
	mov.b	@(10,r7),r0
	or	#1,r0
	mov.b	r0,@(10,r7)
	mov.l	.L0603F4F4,r0
	mov.l	r0,@-r1
	add	#4,r1
.L0603F4C8:
	bra	.L0603F5C8
	nop
.L0603F4CC:
	.short 0x0080
	.byte 0x00, 0x00
.L0603F4D0:
	.long D_060F3064
.L0603F4D4:
	.long func_060255C8
.L0603F4D8:
	.long func_060258A0
.L0603F4DC:
	.long D_060FFFB8
.L0603F4E0:
	.long func_0600D0D0
.L0603F4E4:
	.long func_0603F898
.L0603F4E8:
	.long func_060267F8
.L0603F4EC:
	.long 0x00C00000
.L0603F4F0:
	.long D_060FFE50
.L0603F4F4:
	.long func_0603F5CC
.L0603F4F8:
	mov.l	@(52,r1),r5
	mov.l	.L0603F524,r8
	sub	r8,r5
	mov.l	r5,@(52,r1)
	mov.l	.L0603F528,r8
	mov.l	.L0603F52C,r0
	jsr	@r0
	nop
	mov.l	@(52,r1),r5
	mov.l	.L0603F524,r8
	add	r8,r5
	mov.l	r5,@(52,r1)
	tst	r0,r0
	bf	.L0603F5C8
	mov.l	.L0603F530,r7
	mov.l	.L0603F534,r2
	mov.l	@r2,r8
	mov.b	@(8,r7),r0
	tst	r0,r0
	bf	.L0603F538
	bra	.L0603F5C8
	nop
.L0603F524:
	.long 0x00C00000
.L0603F528:
	.long 0x00400000
.L0603F52C:
	.long func_060172DE
.L0603F530:
	.long D_060FFE50
.L0603F534:
	.long D_060FFEC0
.L0603F538:
	mov.l	.L0603F5A0,r2
	mov.l	.L0603F5A4,r0
	jsr	@r0
	nop
	mov.l	.L0603F5A8,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r1,@(16,r3)
	mov.l	.L0603F5AC,r0
	jsr	@r0
	nop
	bsr	func_0603FDE0
	nop
	mov.l	.L0603F5B0,r0
	jsr	@r0
	nop
	shar	r0
	shar	r0
	shar	r0
	shar	r0
	neg	r0,r0
	mov.l	r0,@(32,r1)
	mov.l	.L0603F5B4,r4
	mov.l	@r4,r4
	mov.l	@(52,r1),r8
	mov.l	.L0603F5B8,r0
	sub	r0,r8
	mov.l	@(52,r4),r0
	sub	r0,r8
	shar	r8
	shar	r8
	shar	r8
	shar	r8
	mov.l	r8,@(36,r1)
	mov	#0,r0
	mov.l	r0,@(40,r1)
	mov.l	.L0603F5BC,r7
	mov.b	@(10,r7),r0
	or	#1,r0
	mov.b	r0,@(10,r7)
	mov.w	.L0603F59E,r0
	mov.w	r0,@(8,r1)
	mov.l	.L0603F5C0,r6
	mov.l	@r6,r0
	or	#1,r0
	mov.l	r0,@r6
	mov.l	.L0603F5C4,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L0603F5C8
	nop
.L0603F59E:
	.short 0x0080
.L0603F5A0:
	.long D_060FFFB8
.L0603F5A4:
	.long func_0600D0D0
.L0603F5A8:
	.long func_0603F898
.L0603F5AC:
	.long func_060267F8
.L0603F5B0:
	.long func_06018D60
.L0603F5B4:
	.long D_060F3064
.L0603F5B8:
	.long 0x00C00000
.L0603F5BC:
	.long D_060FFE50
.L0603F5C0:
	.long D_0602FF48
.L0603F5C4:
	.long func_0603F5CC
.L0603F5C8:
	bra	func_0603FB00
	nop
	endlabel func_0603F238

	glabel func_0603F5CC
	sts.l	pr,@-r15
	mov.l	.L0603F638,r6
	mov.l	@r6+,r9
	add	#-1,r9
	shll16	r9
	mov.l	@(44,r1),r8
	swap.w	r8,r0
	extu.w	r0,r0
	shll2	r0
	shll	r0
	add	r0,r6
	mov.l	@(4,r6),r0
	mov.l	.L0603F63C,r10
	dmuls.l	r0,r10
	sts	mach,r0
	sts	macl,r10
	xtrct	r0,r10
	add	r10,r8
	cmp/ge	r9,r8
	bf	.L0603F5FA
	sub	r9,r8
	mov.l	.L0603F640,r0
	add	r0,r8
.L0603F5FA:
	mov.l	r8,@(44,r1)
	shar	r8
	mov.l	.L0603F644,r10
	jsr	@r10
	mov	r8,r0
	neg	r10,r10
	shll2	r10
	shll2	r10
	shll	r10
	mov.l	r10,@(0,r1)
	mov.l	.L0603F638,r6
	mov.l	.L0603F648,r13
	mov	#5,r14
	mov.l	.L0603F64C,r4
	bsr	func_0603F1EC
	nop
	mov.w	@(8,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bt	.L0603F662
	mov.l	.L0603F650,r6
	mov.l	@r6,r0
	and	#254,r0
	mov.l	r0,@r6
	mov.l	.L0603F654,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L0603F658
	bra	.L0603F658
	nop
.L0603F638:
	.long D_060400B0
.L0603F63C:
	.long 0x00014000
.L0603F640:
	.long 0x00030000
.L0603F644:
	.long func_06007C08
.L0603F648:
	.long D_060886CC
.L0603F64C:
	.long D_060F48F8
.L0603F650:
	.long D_0602FF48
.L0603F654:
	.long D_060F3064
.L0603F658:
	mov	#0,r0
	mov.l	r0,@(44,r1)
	mov.l	.L0603F6E4,r0
	mov.l	r0,@-r1
	add	#4,r1
.L0603F662:
	mov.w	r0,@(8,r1)
	mov.w	.L0603F6E0,r8
	cmp/ge	r8,r0
	bf	.L0603F68C
	mov.l	.L0603F6E8,r4
	mov.l	@r4,r4
	mov.l	@(60,r4),r8
	mov.l	@(32,r1),r0
	add	r0,r8
	mov.l	r8,@(60,r4)
	mov.l	@(48,r4),r8
	add	r0,r8
	mov.l	r8,@(48,r4)
	mov.l	@(52,r4),r8
	mov.l	@(36,r1),r0
	add	r0,r8
	mov.l	r8,@(52,r4)
	mov.l	@(56,r4),r8
	mov.l	@(40,r1),r0
	add	r0,r8
	mov.l	r8,@(56,r4)
.L0603F68C:
	cmp/eq	#108,r0
	bf	.L0603F706
	mov.l	.L0603F6EC,r7
	mov.l	.L0603F6F0,r2
	mov.l	@r2,r8
	mov.b	@(8,r7),r0
	sub	r0,r8
	cmp/pl	r8
	bt	.L0603F700
	neg	r8,r0
	mov.b	r0,@(8,r7)
	mov	#0,r8
	mov.l	r8,@r2
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#32,r6
	mov.l	.L0603F6F4,r0
	jsr	@r0
	mov	#4,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#1,r0
	mov.b	r0,@(9,r7)
	mov.l	.L0603F6F8,r0
	mov.l	r0,@(36,r1)
	mov.w	.L0603F6E2,r0
	mov.w	r0,@(8,r1)
	mov.b	@(10,r7),r0
	or	#2,r0
	mov.b	r0,@(10,r7)
	mov.l	.L0603F6FC,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	func_0603FB00
	nop
.L0603F6E0:
	.short 0x0070
.L0603F6E2:
	.short 0x006C
.L0603F6E4:
	.long func_0603F238
.L0603F6E8:
	.long D_060F3064
.L0603F6EC:
	.long D_060FFE50
.L0603F6F0:
	.long D_060FFEC0
.L0603F6F4:
	.long func_0600E4C4
.L0603F6F8:
	.long 0xFFFC0000
.L0603F6FC:
	.long func_0603F714
.L0603F700:
	mov	#0,r0
	mov.b	r0,@(8,r7)
	mov.l	r8,@r2
.L0603F706:
	mov.l	.L0603F710,r4
	mov.l	@r4,r4
	bra	func_0603FB00
	nop
	.byte 0x00, 0x00
.L0603F710:
	.long D_060F309C
	endlabel func_0603F5CC

	glabel func_0603F714
	sts.l	pr,@-r15
	mov.w	@(26,r1),r0
	mov.w	.L0603F7C4,r8
	add	r8,r0
	mov.w	r0,@(26,r1)
	mov.l	@(48,r1),r2
	mov.l	@(56,r1),r3
	mov.l	@(544,gbr),r0
	jsr	@r0
	nop
	mov.l	@(52,r1),r6
	mov.l	@(36,r1),r8
	mov.l	.L0603F7C8,r0
	add	r0,r8
	add	r8,r6
	cmp/ge	r5,r6
	bf	.L0603F73C
	mov	r5,r6
	neg	r8,r8
	shar	r8
.L0603F73C:
	mov.l	r8,@(36,r1)
	mov.l	r6,@(52,r1)
	mov.w	@(12,r1),r0
	mov.w	.L0603F7C6,r8
	add	r8,r0
	mov.w	r0,@(12,r1)
	mov.l	@(4,r1),r0
	mov.l	.L0603F7CC,r8
	add	r8,r0
	cmp/pz	r0
	bt	.L0603F754
	mov	#0,r0
.L0603F754:
	mov.l	r0,@(4,r1)
	mov	#0,r0
	mov.l	r0,@(16,r1)
	mov.l	.L0603F7D0,r6
	mov.l	@r6+,r9
	add	#-1,r9
	shll16	r9
	mov.l	@(44,r1),r8
	swap.w	r8,r0
	extu.w	r0,r0
	shll2	r0
	shll	r0
	add	r0,r6
	mov.l	@(4,r6),r0
	mov.l	.L0603F7D4,r10
	dmuls.l	r0,r10
	sts	mach,r0
	sts	macl,r10
	xtrct	r0,r10
	add	r10,r8
	cmp/ge	r9,r8
	bf	.L0603F786
	sub	r9,r8
	mov.l	.L0603F7D8,r0
	add	r0,r8
.L0603F786:
	mov.l	r8,@(44,r1)
	shar	r8
	mov.l	.L0603F7DC,r10
	jsr	@r10
	mov	r8,r0
	neg	r10,r10
	shll2	r10
	shll2	r10
	shll	r10
	mov.l	r10,@(0,r1)
	mov.l	.L0603F7D0,r6
	mov.l	.L0603F7E0,r13
	mov	#5,r14
	mov.l	.L0603F7E4,r4
	bsr	func_0603F1EC
	nop
	mov.w	@(8,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bt	.L0603F888
	mov.l	.L0603F7E8,r6
	mov.l	@r6,r0
	and	#254,r0
	mov.l	r0,@r6
	mov.l	.L0603F7EC,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L0603F7F0
	bra	.L0603F7FC
	nop
.L0603F7C4:
	.short 0x016C
.L0603F7C6:
	.short 0xFC00
.L0603F7C8:
	.long 0x00003000
.L0603F7CC:
	.long 0xFFFFFC72
.L0603F7D0:
	.long D_060400B0
.L0603F7D4:
	.long 0x00018000
.L0603F7D8:
	.long 0x00030000
.L0603F7DC:
	.long func_06007C08
.L0603F7E0:
	.long D_060886CC
.L0603F7E4:
	.long D_060F48F8
.L0603F7E8:
	.long D_0602FF48
.L0603F7EC:
	.long D_060F3064
.L0603F7F0:
	mov.l	.L0603F838,r2
	mov.l	.L0603F83C,r0
	jsr	@r0
	nop
	mov.l	.L0603F840,r0
	mov.l	r0,@(12,r3)
.L0603F7FC:
	mov.l	.L0603F844,r2
	mov.l	.L0603F83C,r0
	jsr	@r0
	nop
	mov.l	.L0603F848,r0
	mov.l	r0,@(12,r3)
	mov.l	.L0603F84C,r2
	mov.l	.L0603F83C,r0
	jsr	@r0
	nop
	mov.l	.L0603F850,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r1,@(16,r3)
	mov.l	.L0603F854,r0
	mov.l	@r0,r4
	mov.l	.L0603F858,r7
	mov.b	@(20,gbr),r0
	mov	#12,r8
	cmp/ge	r8,r0
	bf	.L0603F864
	mov.l	.L0603F85C,r0
	mov.l	@r0,r0
	add	#31,r0
	mov.b	@r0,r0
	cmp/eq	#11,r0
	bt	.L0603F860
	mov.b	@(3,r7),r0
	bra	.L0603F866
	add	#-1,r0
.L0603F838:
	.long D_060FFFB0
.L0603F83C:
	.long func_0600D0D0
.L0603F840:
	.long func_0603E4D0
.L0603F844:
	.long D_060FFFA8
.L0603F848:
	.long func_0603D82C
.L0603F84C:
	.long D_060FFFB8
.L0603F850:
	.long D_0603F926
.L0603F854:
	.long D_060F30A8
.L0603F858:
	.long D_060FFE50
.L0603F85C:
	.long D_060F3064
.L0603F860:
	bra	.L0603F866
	mov	#3,r0
.L0603F864:
	mov.b	@(3,r7),r0
.L0603F866:
	mov	r0,r14
	mov	#2,r13
.L0603F86A:
	cmp/pl	r0
	bf	.L0603F874
	add	#-1,r0
	bra	.L0603F86A
	shll	r13
.L0603F874:
	mov.b	r13,@r4
	mov	#6,r0
	mov.b	r0,@(1,r4)
	lds.l	@r15+,pr
	mov.l	.L0603F884,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0603F884:
	.long func_0600D1A0
.L0603F888:
	mov.w	r0,@(8,r1)
	mov.l	.L0603F894,r4
	mov.l	@r4,r4
	bra	func_0603FB00
	nop
	.byte 0x00, 0x00
.L0603F894:
	.long D_060F309C
	endlabel func_0603F714

	glabel func_0603F898
	mov.w	@(8,r1),r0
	add	#1,r0
	cmp/eq	#5,r0
	bt	.L0603F8B8
	cmp/eq	#30,r0
	bt	.L0603F8E8
	cmp/eq	#46,r0
	bt	.L0603F8B8
	cmp/eq	#70,r0
	bt	.L0603F8E8
	cmp/eq	#79,r0
	bt	.L0603F8B8
	cmp/eq	#99,r0
	bf	.L0603F90E
	bra	.L0603F8E8
	nop
.L0603F8B8:
	mov	#-1,r8
	mov.l	@(16,r1),r3
	add	#11,r3
	mov.b	r8,@r3
	endlabel func_0603F898

	glabel func_0603F8C0
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#34,r6
	mov.l	.L0603F8E4,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	bra	.L0603F90E
	nop
	.byte 0x00, 0x00
.L0603F8E4:
	.long func_0600E4C4
.L0603F8E8:
	mov	#-1,r8
	mov.l	@(16,r1),r3
	add	#11,r3
	mov.b	r8,@r3
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#33,r6
	mov.l	.L0603F918,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L0603F90E:
	cmp/eq	#48,r0
	bf	.L0603F920
	mov.l	.L0603F91C,r0
	jmp	@r0
	nop
.L0603F918:
	.long func_0600E4C4
.L0603F91C:
	.long func_0600D1A0
.L0603F920:
	mov.w	r0,@(8,r1)
	rts
	nop
	dlabel D_0603F926
	.byte 0x85, 0x14, 0x70, 0x01, 0x88, 0x01, 0x8B, 0x0E
	endlabel func_0603F8C0

	glabel func_0603F92E
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#55,r6
	mov.l	.L0603F974,r0
	jsr	@r0
	mov	#4,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	cmp/eq	#10,r0
	bf	.L0603F97C
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#55,r6
	mov.l	.L0603F974,r0
	jsr	@r0
	mov	#4,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L0603F978,r0
	jmp	@r0
	nop
.L0603F974:
	.long func_0600E4C4
.L0603F978:
	.long func_0600D1A0
.L0603F97C:
	mov.w	r0,@(8,r1)
	rts
	nop
	endlabel func_0603F92E

	glabel func_0603F982
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	.L0603F9D0,r2
	mov.l	.L0603F9D4,r0
	jsr	@r0
	nop
	mov.l	.L0603F9D8,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	@(48,r1),r0
	mov.l	r0,@(48,r3)
	mov.l	@(52,r1),r5
	mov.l	.L0603F9DC,r0
	add	r0,r5
	mov.l	@(0,r1),r0
	shar	r0
	shar	r0
	add	r0,r5
	mov.l	r5,@(52,r3)
	mov.l	@(56,r1),r0
	mov.l	r0,@(56,r3)
	mov.w	@(24,r1),r0
	mov	r0,r8
	mov.w	@(12,r1),r0
	add	r8,r0
	add	r6,r0
	mov.w	r0,@(24,r3)
	mov	#60,r0
	mov.w	r0,@(8,r3)
	mov	#0,r0
	mov.l	r0,@(0,r3)
	mov.l	.L0603F9E0,r0
	mov.l	r0,@(36,r3)
	mov.w	@(28,r1),r0
	mov.w	r0,@(28,r3)
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	rts
	nop
.L0603F9D0:
	.long D_060FFFB8
.L0603F9D4:
	.long func_0600D0D0
.L0603F9D8:
	.long func_0603F9E4
.L0603F9DC:
	.long 0xFF680000
.L0603F9E0:
	.long 0xFFFC0000
	endlabel func_0603F982

	glabel func_0603F9E4
	mov.w	@(8,r1),r0
	dt	r0
	bf	.L0603F9F4
	mov.l	.L0603F9F0,r0
	jmp	@r0
	nop
.L0603F9F0:
	.long func_0600D1A0
.L0603F9F4:
	mov.w	r0,@(8,r1)
	mov.w	@(24,r1),r0
	mov.w	.L0603FA2A,r8
	add	r8,r0
	mov.w	r0,@(24,r1)
	mov.w	@(26,r1),r0
	mov.w	.L0603FA2C,r8
	add	r8,r0
	mov.w	r0,@(26,r1)
	mov.l	@(52,r1),r5
	mov.l	@(36,r1),r8
	mov.l	.L0603FA30,r0
	add	r0,r8
	mov.l	r8,@(36,r1)
	add	r8,r5
	mov.l	r5,@(52,r1)
	mov.l	@(0,r1),r5
	mov.l	.L0603FA34,r0
	add	r0,r5
	mov.l	r5,@(0,r1)
	sts.l	pr,@-r15
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603FA38
	lds.l	@r15+,pr
	rts
	nop
.L0603FA2A:
	.short 0xFF56
.L0603FA2C:
	.short 0xFC00
	.byte 0x00, 0x00
.L0603FA30:
	.long 0x00003000
.L0603FA34:
	.long 0x00028000
.L0603FA38:
	mov.l	.L0603FA8C,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0603FA90,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov.l	.L0603FA94,r2
	jsr	@r2
	nop
	mov.l	@(0,r1),r4
	mov	#0,r5
	mov.l	.L0603FA90,r0
	jsr	@r0
	mov	#0,r6
	mov.l	.L0603FA98,r4
	mov	#0,r5
	mov.l	.L0603FA90,r0
	jsr	@r0
	mov	#0,r6
	mov.w	@(26,r1),r0
	mov.l	.L0603FA9C,r2
	jsr	@r2
	nop
	mov.l	.L0603FAA0,r4
	mov	#0,r5
	mov.l	.L0603FA90,r0
	jsr	@r0
	mov	#0,r6
	mov.l	.L0603FAA4,r13
	mov.l	@r13,r2
	mov.l	.L0603FAA8,r0
	jsr	@r0
	nop
	mov.l	.L0603FAAC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0603FA8C:
	.long func_0600CA24
.L0603FA90:
	.long func_0600CBDA
.L0603FA94:
	.long func_0600CAF8
.L0603FA98:
	.long 0x00400000
.L0603FA9C:
	.long func_0600CB68
.L0603FAA0:
	.long 0xFFC00000
.L0603FAA4:
	.long D_060886CC
.L0603FAA8:
	.long func_0601F434
.L0603FAAC:
	.long func_0600CA4E
	dlabel D_0603FAB0
	.byte 0x10, 0x07, 0x0B, 0x03
	.long lbl_06010000
	dlabel D_0603FAB8
	.byte 0x10, 0x00, 0x0B, 0x01, 0x06, 0x02, 0x00, 0x03
	dlabel D_0603FAC0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_0603FAE0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	endlabel func_0603F9E4

	glabel func_0603FB00
	mov.b	@(11,r1),r0
	extu.b	r0,r0
	add	#-16,r0
	cmp/pz	r0
	bt	.L0603FB0C
	mov	#0,r0
.L0603FB0C:
	mov.b	r0,@(11,r1)
	mov	r0,r6
	mov.l	.L0603FB6C,r2
	mov.l	.L0603FB70,r7
	mov.b	@(3,r7),r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	.L0603FB74,r3
	mov	#16,r7
.L0603FB1E:
	mov.w	@r2+,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L0603FB1E
	add	#2,r3
	mov.l	.L0603FB78,r2
	mov.l	.L0603FB74,r3
	mov.b	@(14,r1),r0
	mov	r0,r9
	shll2	r0
	mov.l	@(r0,r2),r2
	cmp/pz	r2
	bf	.L0603FB90
	mov.l	@(12,gbr),r0
	shlr	r0
	and	#15,r0
	mov	r0,r8
	shll2	r8
	shll2	r8
	shll	r8
	add	r8,r2
	mov	#3,r10
	cmp/eq	r10,r9
	bf	.L0603FB7C
	cmp/eq	#5,r0
	bt	.L0603FB5A
	cmp/eq	#10,r0
	bt	.L0603FB5A
	cmp/eq	#12,r0
	bf	.L0603FB7C
.L0603FB5A:
	mov	#16,r7
.L0603FB5C:
	mov.w	@r2+,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L0603FB5C
	add	#2,r3
	bra	.L0603FB90
	nop
	.byte 0x00, 0x00
.L0603FB6C:
	.long D_0603F104
.L0603FB70:
	.long D_060FFE50
.L0603FB74:
	.long D_0603FAC0
.L0603FB78:
	.long D_0603F114
.L0603FB7C:
	add	#6,r2
	add	#6,r3
	mov	#4,r7
.L0603FB82:
	mov.w	@r2+,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L0603FB82
	add	#2,r3
	mov.w	@(8,r2),r0
	mov.w	r0,@(8,r3)
.L0603FB90:
	mov.l	.L0603FBD0,r2
	mov.l	.L0603FBD4,r3
	mov	#16,r7
	mov.w	.L0603FBCC,r5
.L0603FB98:
	mov.w	@r2+,r4
	mov	r6,r0
	mov.l	.L0603FBD8,r8
	jsr	@r8
	nop
	mov.w	r0,@r3
	dt	r7
	bf/s	.L0603FB98
	add	#2,r3
	mov.l	.L0603FBD4,r2
	mov.l	.L0603FBDC,r0
	mov.l	.L0603FBE0,r6
	mov	#1,r7
	mov.l	.L0603FBE4,r10
	jsr	@r10
	nop
	mov.l	.L0603FBE8,r2
	mov.l	@r2,r0
	mov.l	.L0603FBEC,r2
	mov	#3,r7
.L0603FBC0:
	mov.b	@r2+,r8
	cmp/ge	r8,r0
	bt	.L0603FBF0
	add	#1,r2
	bra	.L0603FBC0
	add	#-1,r7
.L0603FBCC:
	.short 0xFFFF
	.byte 0x00, 0x00
.L0603FBD0:
	.long D_0603FAC0
.L0603FBD4:
	.long D_0603FAE0
.L0603FBD8:
	.long func_0600D4D0
.L0603FBDC:
	.long D_060ED7D0
.L0603FBE0:
	.long 0x0000C000
.L0603FBE4:
	.long func_0600D530
.L0603FBE8:
	.long D_060FFEC0
.L0603FBEC:
	.long D_0603FAB0
.L0603FBF0:
	mov.b	@(10,r1),r0
	mov	r0,r8
	mov.b	@r2,r0
	cmp/eq	r8,r0
	bt	.L0603FC1C
	mov.b	r0,@(10,r1)
	xor	r8,r0
	tst	#4,r0
	bt	.L0603FC08
	mov.w	.L0603FC2C,r6
	bsr	func_0603F982
	nop
.L0603FC08:
	tst	#2,r0
	bt	.L0603FC12
	mov.w	.L0603FC2E,r6
	bsr	func_0603F982
	nop
.L0603FC12:
	tst	#1,r0
	bt	.L0603FC1C
	mov.w	.L0603FC30,r6
	bsr	func_0603F982
	nop
.L0603FC1C:
	mov.l	.L0603FC34,r2
	mov.l	@r2,r0
	mov.l	.L0603FC38,r2
.L0603FC22:
	mov.b	@r2+,r8
	cmp/ge	r8,r0
	bt	.L0603FC3C
	bra	.L0603FC22
	add	#1,r2
.L0603FC2C:
	.short 0x0000
.L0603FC2E:
	.short 0x5555
.L0603FC30:
	.short 0xAAAA
	.byte 0x00, 0x00
.L0603FC34:
	.long D_060FFEC0
.L0603FC38:
	.long D_0603FAB8
.L0603FC3C:
	mov.b	@(14,r1),r0
	mov.b	@r2,r8
	cmp/eq	r8,r0
	bt	.L0603FC52
	mov.l	@(12,gbr),r0
	shlr	r0
	and	#15,r0
	tst	r0,r0
	bf	.L0603FC52
	mov	r8,r0
	mov.b	r0,@(14,r1)
.L0603FC52:
	mov.w	@(12,r1),r0
	mov.w	.L0603FC86,r8
	add	r8,r0
	mov.w	r0,@(12,r1)
	mov.l	.L0603FC88,r11
	mov.l	.L0603FC8C,r10
	mov.l	@(16,r1),r8
	mov.l	@(4,r1),r9
	cmp/eq	r11,r9
	bf	.L0603FC6A
	tst	r8,r8
	bt	.L0603FCB0
.L0603FC6A:
	cmp/ge	r11,r9
	bf	.L0603FC96
	neg	r10,r10
	cmp/pl	r8
	bf	.L0603FC90
	shll	r10
	add	r10,r8
	add	r8,r9
	cmp/ge	r11,r9
	bt	.L0603FCB0
	mov	#0,r8
	mov	r11,r9
	bra	.L0603FCB0
	nop
.L0603FC86:
	.short 0xFF56
.L0603FC88:
	.long 0x00010000
.L0603FC8C:
	.long 0x000001A0
.L0603FC90:
	add	r10,r8
	bra	.L0603FCB0
	add	r8,r9
.L0603FC96:
	cmp/pz	r8
	bt	.L0603FCAC
	shll	r10
	add	r10,r8
	add	r8,r9
	cmp/ge	r11,r9
	bf	.L0603FCB0
	mov	#0,r8
	mov	r11,r9
	bra	.L0603FCB0
	nop
.L0603FCAC:
	add	r10,r8
	add	r8,r9
.L0603FCB0:
	mov.l	.L0603FCD0,r0
	cmp/ge	r0,r8
	bf	.L0603FCB8
	mov	r0,r8
.L0603FCB8:
	neg	r0,r0
	cmp/ge	r0,r8
	bt	.L0603FCC0
	mov	r0,r8
.L0603FCC0:
	mov.l	r9,@(4,r1)
	mov.l	r8,@(16,r1)
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603FCD4
	lds.l	@r15+,pr
	rts
	nop
.L0603FCD0:
	.long 0x00000A00
.L0603FCD4:
	mov.l	.L0603FDBC,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0603FDC0,r0
	add	r0,r5
	mov.l	@(0,r1),r0
	shar	r0
	shar	r0
	add	r0,r5
	mov.l	.L0603FDC4,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov.l	.L0603FDC8,r2
	jsr	@r2
	nop
	mov.w	@(26,r1),r0
	mov.l	.L0603FDCC,r2
	jsr	@r2
	nop
	mov.l	@(4,r1),r4
	mov.l	@(4,r1),r5
	mov.l	@(4,r1),r6
	mov.l	.L0603FDD0,r0
	jsr	@r0
	nop
	mov.l	.L0603FDBC,r0
	jsr	@r0
	nop
	mov.w	@(12,r1),r0
	mov.l	.L0603FDC8,r2
	jsr	@r2
	nop
	mov.l	.L0603FDD4,r13
	mov.l	@r13+,r2
	mov.b	@(10,r1),r0
	tst	#4,r0
	bt	.L0603FD2E
	mov.l	r13,@-r15
	mov.l	.L0603FDD8,r0
	jsr	@r0
	nop
	mov.l	@r15+,r13
.L0603FD2E:
	mov.w	.L0603FDB8,r0
	mov.l	.L0603FDC8,r2
	jsr	@r2
	nop
	mov.l	@r13+,r2
	mov.b	@(10,r1),r0
	tst	#2,r0
	bt	.L0603FD48
	mov.l	r13,@-r15
	mov.l	.L0603FDD8,r0
	jsr	@r0
	nop
	mov.l	@r15+,r13
.L0603FD48:
	mov.w	.L0603FDB8,r0
	mov.l	.L0603FDC8,r2
	jsr	@r2
	nop
	mov.l	@r13+,r2
	mov.b	@(10,r1),r0
	tst	#1,r0
	bt	.L0603FD62
	mov.l	r13,@-r15
	mov.l	.L0603FDD8,r0
	jsr	@r0
	nop
	mov.l	@r15+,r13
.L0603FD62:
	mov.l	.L0603FDDC,r0
	jsr	@r0
	nop
	mov.l	@r13+,r2
	mov.l	r13,@-r15
	mov.l	.L0603FDD8,r0
	jsr	@r0
	nop
	mov.l	@r15+,r13
	mov.l	@r13+,r2
	mov.l	r13,@-r15
	mov.l	.L0603FDD8,r0
	jsr	@r0
	nop
	mov.l	@r15+,r13
	mov.l	.L0603FDBC,r0
	jsr	@r0
	nop
	mov.w	@(12,r1),r0
	mov.l	.L0603FDC8,r2
	jsr	@r2
	nop
	mov.l	@r13+,r2
	mov.l	r13,@-r15
	mov.l	.L0603FDD8,r0
	jsr	@r0
	nop
	mov.l	@r15+,r13
	mov.l	.L0603FDDC,r0
	jsr	@r0
	nop
	mov.l	@r13+,r2
	mov.l	r13,@-r15
	mov.l	.L0603FDD8,r0
	jsr	@r0
	nop
	mov.l	@r15+,r13
	mov.l	.L0603FDDC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0603FDB8:
	.short 0x5555
	.byte 0x00, 0x00
.L0603FDBC:
	.long func_0600CA24
.L0603FDC0:
	.long 0xFF680000
.L0603FDC4:
	.long func_0600CBDA
.L0603FDC8:
	.long func_0600CAF8
.L0603FDCC:
	.long func_0600CB68
.L0603FDD0:
	.long func_0600D018
.L0603FDD4:
	.long D_060886CC
.L0603FDD8:
	.long func_0601F434
.L0603FDDC:
	.long func_0600CA4E
	endlabel func_0603FB00

	glabel func_0603FDE0
	sts.l	pr,@-r15
	mov.l	.L0603FE34,r7
	mov.l	.L0603FE38,r2
	mov.l	@r2,r8
	mov.b	@(8,r7),r0
	cmp/ge	r0,r8
	bt	.L0603FDF0
	mov	r8,r0
.L0603FDF0:
	mov	r0,r6
	mov.l	.L0603FE3C,r2
	mov	#96,r7
.L0603FDF6:
	mov.l	.L0603FE40,r0
	jsr	@r0
	nop
	mov.l	.L0603FE44,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L0603FE48,r0
	jsr	@r0
	nop
	mov.w	r0,@(24,r3)
	mov.l	.L0603FE48,r0
	jsr	@r0
	nop
	mov.w	r0,@(26,r3)
	mov	r7,r0
	and	#7,r0
	mov.l	.L0603FE4C,r4
	shll2	r0
	mov.l	@(r0,r4),r0
	mov.l	r0,@(0,r3)
	mov.l	r1,@(16,r3)
	mov	#0,r0
	cmp/ge	r6,r7
	bt	.L0603FE28
	mov	#-1,r0
.L0603FE28:
	mov.b	r0,@(13,r3)
	dt	r7
	bf	.L0603FDF6
	lds.l	@r15+,pr
	rts
	nop
.L0603FE34:
	.long D_060FFE50
.L0603FE38:
	.long D_060FFEC0
.L0603FE3C:
	.long D_060FFFB8
.L0603FE40:
	.long func_0600D0D0
.L0603FE44:
	.long func_0603FE70
.L0603FE48:
	.long func_06007B96
.L0603FE4C:
	.long D_0603FE50
	endlabel func_0603FDE0

	.section .data.0603FE50,"aw",@progbits
	.p2align 2
	dlabel D_0603FE50
	.long D_06013D1E
	.long D_06013D38
	.long D_06013D52
	.long D_06013D6C
	.long D_06013D86
	.long D_06013D1E
	.long D_06013D38
	.long D_06013D52
