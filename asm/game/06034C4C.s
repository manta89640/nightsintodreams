	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06034C4C,"ax",@progbits
	.p2align 2

	glabel func_06034C4C
	sts.l	pr,@-r15
	mov.w	.L06034C9E,r0
	mov.w	r0,@(28,r1)
	mov.l	.L06034CA4,r3
	mov.l	@r3,r3
	mov.l	@(48,r3),r4
	mov.l	@(52,r3),r5
	mov.l	@(56,r3),r6
	mov	#96,r7
	add	#32,r7
	shll16	r7
	sub	r7,r5
	mov.l	r4,@(48,r1)
	mov.l	r5,@(52,r1)
	mov.l	r6,@(56,r1)
	mov.l	r5,@(60,r1)
	bsr	func_06035584
	nop
	bsr	func_06034E72
	nop
	mov.w	.L06034CA0,r3
	mov	#64,r0
	mov.w	r3,@(r0,r1)
	mov.w	.L06034CA2,r0
	mov.w	r0,@(4,r1)
	mov	#-32,r0
	mov.b	r0,@(9,r1)
	mov.l	.L06034CA8,r2
	mov.l	.L06034CAC,r0
	jsr	@r0
	nop
	mov.l	.L06034CB0,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r1,@(0,r3)
	mov.l	r3,@(0,r1)
	mov.l	.L06034CB4,r0
	lds.l	@r15+,pr
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06034C9E:
	.short 0xCFC0
.L06034CA0:
	.short 0x01A4
.L06034CA2:
	.short 0x04B0
.L06034CA4:
	.long D_060F3064
.L06034CA8:
	.long D_060FFFB0
.L06034CAC:
	.long func_0600D0D0
.L06034CB0:
	.long func_06035280
.L06034CB4:
	.long func_06034CB8
	endlabel func_06034C4C

	glabel func_06034CB8
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L06034CC2
	bra	.L06034D30
	nop
.L06034CC2:
	mov.b	@(149,gbr),r0
	tst	#1,r0
	bf	.L06034CCE
	mov.w	@(28,gbr),r0
	tst	#1,r0
	bt	.L06034CD2
.L06034CCE:
	bra	.L06034D30
	nop
.L06034CD2:
	mov.w	@(4,r1),r0
	cmp/pl	r0
	bf	.L06034CE8
	add	#-1,r0
	mov.w	r0,@(4,r1)
	mov	#72,r0
	mov.l	@(r0,r1),r3
	cmp/pl	r3
	bf	.L06034D20
	bra	.L06035198
	sts.l	pr,@-r15
.L06034CE8:
	mov.b	@(12,r1),r0
	mov.l	.L06034D18,r3
	shll	r0
	mov.w	@(r0,r3),r0
	sts.l	pr,@-r15
	add	r0,r3
	jsr	@r3
	nop
	mov.l	@(544,gbr),r0
	mov.l	@(56,r1),r3
	jsr	@r0
	mov.l	@(48,r1),r2
	mov.l	@(52,r1),r6
	mov.l	.L06034D1C,r7
	add	r7,r4
	sub	r7,r5
	cmp/ge	r6,r5
	bt	.L06034D0E
	mov	r5,r6
.L06034D0E:
	cmp/ge	r4,r6
	bt	.L06034D14
	mov	r4,r6
.L06034D14:
	bra	.L06035198
	mov.l	r6,@(52,r1)
.L06034D18:
	.long D_06034D38
.L06034D1C:
	.long 0x00280000
.L06034D20:
	mov.l	.L06034D34,r0
	mov.l	@r0,r5
	mov.l	@(48,r5),r2
	mov.l	@(52,r5),r3
	mov.l	@(56,r5),r4
	mov.l	r2,@(48,r1)
	mov.l	r3,@(52,r1)
	mov.l	r4,@(56,r1)
.L06034D30:
	rts
	nop
.L06034D34:
	.long D_060F3064
	dlabel D_06034D38
	.byte 0x00, 0x0C, 0x00, 0x42, 0x00, 0x78, 0x00, 0xAE, 0x00, 0xEC, 0x01, 0x2E, 0xD0, 0x0A, 0x65, 0x02
	.byte 0x84, 0x56
	endlabel func_06034CB8

	glabel func_06034D4A
	mov.l	r0,@-r15
	mov.l	@(48,r5),r2
	mov.l	@(56,r5),r3
	mov.l	@(544,gbr),r0
	mov.l	r3,@(56,r1)
	jsr	@r0
	mov.l	r2,@(48,r1)
	mov	#96,r7
	add	#32,r7
	shll16	r7
	sub	r7,r5
	mov.l	r5,@(52,r1)
	mov.l	@r15+,r0
	lds.l	@r15+,pr
	cmp/eq	#0,r0
	bf	.L06034D74
	rts
	nop
	.byte 0x00, 0x00
	.long D_060F3064
.L06034D74:
	mov	#2,r0
	rts
	mov.b	r0,@(12,r1)
	.byte 0xD0, 0x04, 0x65, 0x02, 0x84, 0x56, 0x88, 0x00, 0x89, 0x05, 0xE0, 0x02, 0x00, 0x0B, 0x80, 0x1C
	.byte 0x00, 0x00
	.long D_060F3064
	.byte 0xE0, 0x48, 0xD4, 0x03, 0x03, 0x1E, 0x33, 0x4C, 0x43, 0x15, 0x8B, 0x03, 0x00, 0x0B, 0x01, 0x36
	.byte 0xFF, 0xFF, 0xFE, 0x00, 0xE3, 0x00, 0x01, 0x36, 0x4F, 0x26, 0xE0, 0x00, 0x00, 0x0B, 0x80, 0x1C
	.byte 0xD0, 0x03, 0x65, 0x02, 0x84, 0x56, 0x88, 0x00, 0x8B, 0x04, 0xE0, 0x01, 0x00, 0x0B, 0x80, 0x1C
	.long D_060F3064
	.byte 0xE4, 0x01, 0x44, 0x28, 0xE0, 0x48, 0x03, 0x1E, 0x33, 0x43, 0x89, 0x05, 0xD4, 0x01, 0x33, 0x4C
	.byte 0x00, 0x0B, 0x01, 0x36, 0x00, 0x00, 0x10, 0x00, 0x63, 0x43, 0x01, 0x36, 0xE0, 0x03, 0x00, 0x0B
	.byte 0x80, 0x1C
	endlabel func_06034D4A

	glabel func_06034DE6
	sts.l	pr,@-r15
	bsr	func_06034E8C
	nop
	mov.l	.L06034E14,r7
	mov	#9,r0
	mov.b	@(r0,r7),r3
	mov	#76,r0
	mov.b	@(r0,r1),r4
	mov.b	r3,@(r0,r1)
	cmp/eq	r4,r3
	bt	.L06034E00
	bsr	func_06034E72
	nop
.L06034E00:
	mov.l	.L06034E18,r0
	mov.l	@r0,r5
	mov.b	@(6,r5),r0
	cmp/eq	#0,r0
	bf	.L06034E1C
	lds.l	@r15+,pr
	mov	#1,r0
	bra	func_06034E72
	mov.b	r0,@(12,r1)
	.byte 0x00, 0x00
.L06034E14:
	.long D_060FFE50
.L06034E18:
	.long D_060F3064
.L06034E1C:
	bsr	func_06034EC6
	nop
	bra	func_06035584
	lds.l	@r15+,pr
	endlabel func_06034DE6

	glabel func_06034E24
	sts.l	pr,@-r15
	bsr	func_06034E8C
	nop
	bsr	func_06035108
	nop
	mov.l	@(32,r1),r3
	mov.l	@(40,r1),r4
	dmuls.l	r3,r3
	sts	mach,r3
	sts	macl,r8
	dmuls.l	r4,r4
	xtrct	r3,r8
	sts	mach,r4
	sts	macl,r9
	xtrct	r4,r9
	add	r8,r9
	shlr8	r9
	shlr2	r9
	cmp/pl	r9
	bt	.L06034E5E
	mov	#0,r3
	mov.l	r3,@(32,r1)
	mov.l	r3,@(36,r1)
	mov.l	r3,@(40,r1)
	mov	#3,r0
	mov.b	r0,@(12,r1)
	mov.w	.L06034E64,r3
	mov	#64,r0
	mov.w	r3,@(r0,r1)
.L06034E5E:
	lds.l	@r15+,pr
	rts
	nop
.L06034E64:
	.short 0x01A4
	.byte 0x85, 0x1C, 0x93, 0x02, 0x30, 0x3C, 0xA3, 0x8A, 0x81, 0x1C, 0x08, 0x00
	endlabel func_06034E24

	glabel func_06034E72
	mov	#0,r3
	mov	#68,r0
	mov.l	r3,@(r0,r1)
	mov.w	.L06034E8A,r3
	mov	#64,r0
	mov.w	r3,@(r0,r1)
	mov	#1,r3
	mov	#78,r0
	mov.b	r3,@(r0,r1)
	mov	#77,r0
	rts
	mov.b	r3,@(r0,r1)
.L06034E8A:
	.short 0x01A4
	endlabel func_06034E72

	glabel func_06034E8C
	mov.l	.L06034EBC,r7
	mov.b	@(8,r7),r0
	mov	r0,r5
	mov.l	.L06034EC0,r7
	mov.b	@r7,r0
	mov.b	r5,@r7
	cmp/eq	r0,r5
	bt	.L06034EB8
	mov	#78,r0
	mov.b	@(r0,r1),r3
	add	#-1,r3
	cmp/pz	r3
	bt	.L06034EA8
	mov	#0,r3
.L06034EA8:
	mov.b	r3,@(r0,r1)
	mov	#77,r0
	mov.b	@(r0,r1),r3
	add	#-1,r3
	cmp/pz	r3
	bt	.L06034EB6
	mov	#0,r3
.L06034EB6:
	mov.b	r3,@(r0,r1)
.L06034EB8:
	rts
	nop
.L06034EBC:
	.long D_060FFE50
.L06034EC0:
	.long func_06034EC4
	endlabel func_06034E8C

	glabel func_06034EC4
	nop
	endlabel func_06034EC4

	glabel func_06034EC6
	mov	#64,r0
	mov.w	@(r0,r1),r3
	cmp/pl	r3
	bf	func_06034ED4
	add	#-1,r3
	rts
	mov.w	r3,@(r0,r1)
	endlabel func_06034EC6

	glabel func_06034ED4
	sts.l	pr,@-r15
	mov.l	@(8,r5),r12
	mov.w	@(22,r12),r0
	mov.w	.L06034EEE,r3
	cmp/eq	r3,r0
	bt	.L06034EE6
	mov.w	.L06034EF0,r3
	cmp/eq	r3,r0
	bf	.L06034EF4
.L06034EE6:
	mov.w	.L06034EF2,r3
	mov	#64,r0
	bra	.L06034FD2
	mov.w	r3,@(r0,r1)
.L06034EEE:
	.short 0x004B
.L06034EF0:
	.short 0x0049
.L06034EF2:
	.short 0x01A4
.L06034EF4:
	mov.w	@(22,r1),r0
	mov.w	.L06034F04,r3
	cmp/ge	r3,r0
	bf	.L06034F06
	mov.b	@(9,r1),r0
	mov	#-32,r0
	bra	.L06034F14
	mov.b	r0,@(9,r1)
.L06034F04:
	.short 0x1000
.L06034F06:
	mov.w	@(22,r1),r0
	neg	r3,r3
	cmp/ge	r0,r3
	bf	.L06034F14
	mov.b	@(9,r1),r0
	mov	#32,r0
	mov.b	r0,@(9,r1)
.L06034F14:
	mov	#9,r0
	mov.b	@(r0,r1),r3
	mov.w	@(6,r1),r0
	add	r3,r0
	mov.w	.L06034F68,r3
	cmp/gt	r3,r0
	bf	.L06034F24
	mov	r3,r0
.L06034F24:
	neg	r3,r3
	cmp/gt	r0,r3
	bf	.L06034F2C
	mov	r3,r0
.L06034F2C:
	mov.w	r0,@(6,r1)
	mov	r0,r3
	mov.w	@(22,r1),r0
	add	r3,r0
	mov.w	r0,@(22,r1)
	mov	#68,r0
	mov.l	@(r0,r1),r3
	add	#1,r3
	mov.w	.L06034F6A,r4
	tst	r4,r3
	bf/s	.L06034F52
	mov.l	r3,@(r0,r1)
	mov	#78,r0
	mov.b	@(r0,r1),r3
	add	#1,r3
	mov.b	r3,@(r0,r1)
	mov	#77,r0
	add	#1,r3
	mov.b	r3,@(r0,r1)
.L06034F52:
	mov.l	r5,@-r15
	mov.l	.L06034F70,r4
	mov.w	.L06034F6C,r8
	jsr	@r4
	shll16	r8
	mov.l	@r15+,r5
	cmp/pz	r0
	bf	.L06034F74
	mov	#4,r0
	bra	.L0603508C
	mov.b	r0,@(12,r1)
.L06034F68:
	.short 0x0200
.L06034F6A:
	.short 0x03FF
.L06034F6C:
	.short 0x0020
	.byte 0x00, 0x00
.L06034F70:
	.long func_060172DE
.L06034F74:
	mov.l	@(48,r5),r2
	mov.l	@(48,r1),r4
	mov.l	@(56,r5),r3
	sub	r4,r2
	mov.l	.L06035070,r0
	mov.l	@(56,r1),r4
	jsr	@r0
	sub	r4,r3
	mov.w	.L06035066,r5
	add	r0,r5
	mov	#24,r0
	mov.w	@(r0,r1),r6
	sub	r6,r5
	mov	r5,r9
	cmp/pz	r5
	bt	.L06034F96
	neg	r5,r5
.L06034F96:
	exts.w	r5,r5
	mov.w	.L06035068,r8
	cmp/pz	r5
	bt	.L06034FA0
	neg	r8,r8
.L06034FA0:
	cmp/pz	r9
	bt	.L06034FA6
	neg	r8,r8
.L06034FA6:
	add	r8,r6
	mov.w	r6,@(r0,r1)
	mov	r6,r0
	mov.l	.L06035074,r10
	mov.w	.L0603506A,r4
	jsr	@r10
	add	r4,r0
	mov.l	@(32,r1),r3
	shll2	r11
	shlr16	r3
	exts.w	r3,r3
	dmuls.l	r3,r11
	shll2	r10
	mov.l	@(48,r1),r2
	sts	macl,r11
	dmuls.l	r3,r10
	add	r2,r11
	mov.l	r11,@(48,r1)
	mov.l	@(56,r1),r2
	sts	macl,r10
	add	r2,r10
	mov.l	r10,@(56,r1)
.L06034FD2:
	mov.l	@(544,gbr),r0
	mov.l	@(56,r1),r3
	jsr	@r0
	mov.l	@(48,r1),r2
	mov.l	@(52,r1),r4
	mov.l	@(60,r1),r13
	mov.l	r5,@(60,r1)
	mov	r5,r14
	mov.l	.L06035078,r0
	sub	r0,r5
	mov.l	@(36,r1),r6
	mov.l	.L0603507C,r7
	cmp/gt	r5,r4
	bf	.L06034FF0
	sub	r7,r6
.L06034FF0:
	cmp/gt	r4,r5
	bf	.L06034FF6
	add	r7,r6
.L06034FF6:
	mov.l	.L06035080,r7
	cmp/gt	r7,r6
	bf	.L06034FFE
	mov	r7,r6
.L06034FFE:
	neg	r7,r7
	cmp/ge	r7,r6
	bt	.L06035006
	mov	r7,r6
.L06035006:
	mov.l	r6,@(36,r1)
	add	r4,r6
	mov.l	r6,@(52,r1)
	sub	r13,r14
	swap.w	r14,r6
	exts.w	r6,r6
	shll8	r6
	shll2	r6
	cmp/pz	r6
	bt	.L0603503C
	mov.l	.L06035084,r14
	mov.l	@r14,r14
	mov.l	@(48,r14),r5
	mov.l	@(48,r1),r10
	sub	r5,r10
	dmuls.l	r10,r10
	mov.l	@(56,r14),r5
	mov.l	@(56,r1),r10
	sub	r5,r10
	sts	mach,r0
	dmuls.l	r10,r10
	mov.l	.L06035088,r11
	sts	mach,r10
	add	r10,r0
	cmp/ge	r11,r10
	bf	.L0603503C
	mov	#0,r6
.L0603503C:
	mov	#1,r3
	shll16	r3
	add	r6,r3
	mov	#78,r0
	mov.b	@(r0,r1),r0
	shll2	r0
	shll	r0
	add	#16,r0
	dmuls.l	r0,r3
	sts	macl,r3
	shlr2	r3
	lds.l	@r15+,pr
	shlr2	r3
	mov	#68,r0
	mov.l	@(r0,r1),r4
	mov.w	.L0603506C,r5
	tst	r4,r5
	bf	.L06035062
	mov	#0,r3
.L06035062:
	rts
	mov.l	r3,@(32,r1)
.L06035066:
	.short 0xC000
.L06035068:
	.short 0x0100
.L0603506A:
	.short 0x4000
.L0603506C:
	.short 0x0780
	.byte 0x00, 0x00
.L06035070:
	.long func_06007C1C
.L06035074:
	.long func_06007BD8
.L06035078:
	.long 0x00900000
.L0603507C:
	.long 0x00002000
.L06035080:
	.long 0x00020000
.L06035084:
	.long D_060F3064
.L06035088:
	.long 0x00090000
.L0603508C:
	mov.l	@(48,r5),r7
	mov.l	@(52,r5),r8
	mov.l	@(56,r5),r9
	mov.l	@(48,r1),r3
	mov.l	.L060350F8,r0
	mov.l	@(48,r1),r4
	jsr	@r0
	mov.l	@(48,r1),r5
	mov.l	r3,@-r15
	mov.l	r4,@-r15
	mov.l	r5,@-r15
	mov.l	.L060350FC,r2
	mov.l	.L06035100,r0
	jsr	@r0
	nop
	mov.l	.L06035104,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	@r15+,r8
	mov.l	@r15+,r7
	mov.l	@r15+,r6
	mov.l	@(48,r1),r12
	mov.l	@(52,r1),r13
	mov.l	@(56,r1),r14
	mov	r6,r9
	mov	r7,r10
	mov	r8,r11
	shll2	r9
	shll2	r9
	shll	r9
	shll2	r10
	shll2	r10
	shll	r10
	shll2	r11
	shll2	r11
	shll	r11
	add	r9,r12
	add	r10,r13
	add	r11,r14
	mov.l	r12,@(48,r3)
	mov.l	r13,@(52,r3)
	mov.l	r14,@(56,r3)
	mov	#12,r0
	dmuls.l	r0,r6
	sts	macl,r6
	dmuls.l	r0,r7
	sts	macl,r7
	dmuls.l	r0,r8
	sts	macl,r8
	mov.l	r6,@(32,r1)
	lds.l	@r15+,pr
	mov.l	r7,@(36,r1)
	bra	func_06035108
	mov.l	r8,@(40,r1)
.L060350F8:
	.long func_060349D0
.L060350FC:
	.long D_060FFFB0
.L06035100:
	.long func_0600D0D0
.L06035104:
	.long func_06043A34
	endlabel func_06034ED4

	glabel func_06035108
	sts.l	pr,@-r15
	mov.l	@(36,r1),r4
	shlr16	r4
	exts.w	r4,r4
	cmp/pz	r4
	bt	.L0603511C
	mov.w	.L06035192,r3
	mov.w	@(22,r1),r0
	add	r3,r0
	mov.w	r0,@(22,r1)
.L0603511C:
	mov.l	@(32,r1),r3
	mov.l	@(36,r1),r4
	mov.l	@(40,r1),r5
	mov.l	@(48,r1),r6
	mov.l	@(52,r1),r7
	mov.l	@(56,r1),r8
	add	r3,r6
	add	r4,r7
	add	r5,r8
	mov.l	r6,@(48,r1)
	mov.l	r7,@(52,r1)
	mov.l	r8,@(56,r1)
	mov	#64,r0
	shll8	r0
	add	r0,r4
	mov.l	r3,@(32,r1)
	mov.l	r4,@(36,r1)
	mov.l	r5,@(40,r1)
	mov.l	@(544,gbr),r0
	mov.l	@(56,r1),r3
	jsr	@r0
	mov.l	@(48,r1),r2
	mov.l	.L06035194,r7
	mov.l	@(52,r1),r6
	add	r7,r4
	sub	r7,r5
	cmp/ge	r6,r5
	bt	.L0603516E
	mov	r5,r6
	mov.l	@(32,r1),r3
	mov.l	@(36,r1),r4
	mov.l	@(40,r1),r5
	shar	r3
	shar	r4
	shar	r5
	mov.l	r3,@(32,r1)
	mov.l	r5,@(40,r1)
	cmp/pl	r4
	bf	.L0603516E
	neg	r4,r4
	mov.l	r4,@(36,r1)
.L0603516E:
	cmp/ge	r4,r6
	bt	.L0603518C
	mov	r4,r6
	mov.l	@(32,r1),r3
	mov.l	@(36,r1),r4
	mov.l	@(40,r1),r5
	shar	r3
	shar	r4
	shar	r5
	mov.l	r3,@(32,r1)
	mov.l	r5,@(40,r1)
	cmp/pl	r4
	bt	.L0603516E
	neg	r4,r4
	mov.l	r4,@(36,r1)
.L0603518C:
	lds.l	@r15+,pr
	rts
	nop
.L06035192:
	.short 0x0600
.L06035194:
	.long 0x00280000
.L06035198:
	mov.l	.L06035244,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	.L06035248,r0
	mov.l	@(52,r1),r5
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.w	@(10,r1),r0
	add	#-128,r0
	mov.w	r0,@(10,r1)
	mov.l	.L0603524C,r14
	mov.w	@(26,r1),r0
	jsr	@r14
	nop
	mov.l	.L06035250,r14
	mov.w	.L0603523C,r7
	mov.w	@(24,r1),r0
	add	r7,r0
	neg	r0,r0
	jsr	@r14
	nop
	mov.l	.L06035254,r14
	mov.w	@(22,r1),r0
	jsr	@r14
	nop
	mov	#72,r0
	mov.l	.L06035258,r5
	mov.l	@(r0,r1),r4
	dmuls.l	r4,r5
	mov.l	.L0603525C,r2
	sts	macl,r4
	sts	mach,r0
	xtrct	r0,r4
	jsr	@r2
	mov	r4,r6
	mov.l	.L06035260,r0
	mov.l	.L06035264,r2
	jsr	@r0
	nop
	mov.l	.L06035244,r0
	jsr	@r0
	nop
	mov.w	@(10,r1),r0
	mov.l	.L0603524C,r14
	shll2	r0
	jsr	@r14
	shll2	r0
	mov.l	.L06035268,r0
	mov.l	.L0603526C,r2
	jsr	@r0
	nop
	mov.l	.L06035270,r0
	jsr	@r0
	nop
	mov.w	@(10,r1),r0
	mov.l	.L0603524C,r14
	jsr	@r14
	nop
	mov.l	.L06035268,r0
	mov.l	.L06035274,r2
	jsr	@r0
	nop
	mov.l	.L06035270,r0
	jsr	@r0
	nop
	mov.w	.L0603523E,r11
	mov	#114,r12
	mov.l	.L06035278,r0
	jsr	@r0
	nop
	bt	.L06035236
	mov	#1,r8
	mov.w	.L06035240,r9
	mov	#1,r5
	mov	#56,r6
	mov.l	.L0603527C,r0
	jsr	@r0
	mov	#7,r4
.L06035236:
	lds.l	@r15+,pr
	rts
	nop
.L0603523C:
	.short 0x8000
.L0603523E:
	.short 0x0080
.L06035240:
	.short 0x001E
	.byte 0x00, 0x00
.L06035244:
	.long func_0600CA24
.L06035248:
	.long func_0600CBDA
.L0603524C:
	.long func_0600CB68
.L06035250:
	.long func_0600CAF8
.L06035254:
	.long func_0600CA7A
.L06035258:
	.long 0x00018000
.L0603525C:
	.long func_0600D018
.L06035260:
	.long func_0601F4A0
.L06035264:
	.long D_0608B194
.L06035268:
	.long func_0601F434
.L0603526C:
	.long D_0608B1F0
.L06035270:
	.long func_0600CA4E
.L06035274:
	.long D_0608B24C
.L06035278:
	.long func_0600EA22
.L0603527C:
	.long func_0600E968
	endlabel func_06035108

	glabel func_06035280
	mov.w	.L0603528C,r0
	mov.w	r0,@(28,r1)
	mov.l	.L06035290,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L0603528C:
	.short 0xCFF4
	.byte 0x00, 0x00
.L06035290:
	.long func_06035294
	endlabel func_06035280

	glabel func_06035294
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L0603529E
	bra	.L06035398
	nop
.L0603529E:
	mov.b	@(149,gbr),r0
	tst	#1,r0
	bf	.L060352AA
	mov.w	@(28,gbr),r0
	tst	#1,r0
	bt	.L060352AE
.L060352AA:
	bra	.L06035398
	nop
.L060352AE:
	mov.l	.L060352CC,r0
	mov.l	@r0,r5
	mov.b	@(6,r5),r0
	cmp/eq	#0,r0
	bf	.L060352D4
	mov	#72,r0
	mov.l	@(r0,r1),r3
	mov.l	.L060352D0,r4
	add	r4,r3
	cmp/pz	r3
	bf	.L06035398
	mov.l	r3,@(r0,r1)
	bra	.L060352F6
	sts.l	pr,@-r15
	.byte 0x00, 0x00
.L060352CC:
	.long D_060F3064
.L060352D0:
	.long 0xFFFFFE00
.L060352D4:
	mov.l	@(0,r1),r2
	mov.b	@(12,r2),r0
	cmp/eq	#0,r0
	bt	.L06035398
	cmp/eq	#4,r0
	bt	.L06035398
	sts.l	pr,@-r15
	mov	#72,r0
	mov.l	@(r0,r1),r3
	mov.l	.L06035304,r4
	mov	#1,r6
	add	r4,r3
	shll16	r6
	cmp/gt	r3,r6
	bt	.L060352F4
	mov	r6,r3
.L060352F4:
	mov.l	r3,@(r0,r1)
.L060352F6:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06035308
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06035304:
	.long 0x00000040
.L06035308:
	mov.l	@(0,r1),r5
	mov.l	@(544,gbr),r0
	mov.l	@(48,r5),r2
	mov.l	@(56,r5),r3
	mov.l	r2,@(48,r1)
	jsr	@r0
	mov.l	r3,@(56,r1)
	mov.l	r5,@(52,r1)
	bsr	func_06035474
	nop
	bsr	func_0603543C
	nop
	mov.l	@(0,r1),r2
	mov.b	@(12,r2),r0
	cmp/eq	#3,r0
	bf	.L0603534A
	mov	#64,r0
	mov.w	@(r0,r2),r0
	cmp/pl	r0
	bt	.L0603534A
	mov	#72,r0
	mov	#1,r4
	shll16	r4
	mov.l	@(r0,r1),r0
	cmp/eq	r4,r0
	bf	.L0603534A
	mov.w	@(12,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bt	.L06035346
	mov	#0,r0
.L06035346:
	bsr	func_0603547A
	mov.w	r0,@(12,r1)
.L0603534A:
	mov.l	.L0603537C,r0
	mov.l	r0,@(112,gbr)
	mov.l	.L06035380,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	.L06035384,r0
	mov.l	@(52,r1),r5
	jsr	@r0
	mov.l	@(56,r1),r6
	mov	#72,r0
	mov	#1,r5
	mov.l	@(r0,r1),r4
	shll16	r5
	mov.l	.L06035388,r2
	jsr	@r2
	mov	r4,r6
	mov.l	.L0603538C,r0
	mov.l	.L06035390,r3
	jsr	@r0
	mov.l	@r3,r2
	mov.l	.L06035394,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L0603537C:
	.long VDP1_VRAM + 0x67FA0
.L06035380:
	.long func_0600CA24
.L06035384:
	.long func_0600CBDA
.L06035388:
	.long func_0600D018
.L0603538C:
	.long func_0601F434
.L06035390:
	.long D_06080000
.L06035394:
	.long func_0600CA4E
.L06035398:
	rts
	nop
	endlabel func_06035294

	glabel func_0603539C
	mov.l	.L06035430,r12
	sts.l	pr,@-r15
	jsr	@r12
	mov.w	@(24,r1),r0
	shll2	r10
	mov	#1,r8
	shll2	r11
	dmuls.l	r8,r10
	mov.l	.L06035434,r14
	sts	macl,r10
	dmuls.l	r8,r11
	mov.l	.L06035438,r13
	sts	macl,r11
	mov	#8,r12
.L060353B8:
	mov.l	@r14+,r3
	mov.l	@r14+,r4
	dmuls.l	r3,r11
	mov.l	@r14+,r5
	sts	mach,r0
	sts	macl,r6
	dmuls.l	r5,r10
	xtrct	r0,r6
	sts	mach,r0
	sts	macl,r8
	dmuls.l	r3,r10
	xtrct	r0,r8
	sub	r8,r6
	sts	mach,r0
	sts	macl,r7
	dmuls.l	r5,r11
	xtrct	r0,r7
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	mov	#72,r0
	mov.l	@(r0,r1),r9
	dmuls.l	r9,r6
	add	r8,r7
	sts	macl,r6
	sts	mach,r0
	dmuls.l	r9,r7
	xtrct	r0,r6
	mov.l	@(48,r1),r2
	mov.l	@(52,r1),r4
	sts	macl,r7
	mov.l	@(56,r1),r3
	sts	mach,r0
	add	r6,r2
	xtrct	r0,r7
	mov.l	@(544,gbr),r0
	add	r7,r3
	jsr	@r0
	mov.l	r4,@-r15
	mov.l	@r15+,r4
	mov	#1,r6
	mov	#-1,r8
	shll8	r8
	sub	r4,r5
	mov.l	r6,@(0,r8)
	mov	#0,r0
	cmp/pz	r5
	bt	.L0603541A
	mov	#-1,r0
.L0603541A:
	mov.l	r0,@(16,r8)
	mov.l	r5,@(20,r8)
	mov.l	@(28,r8),r5
	mov.l	r5,@r13
	dt	r12
	bf/s	.L060353B8
	add	#12,r13
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06035430:
	.long func_06007BD8
.L06035434:
	.long D_060902BC
.L06035438:
	.long D_0609038C
	endlabel func_0603539C

	glabel func_0603543C
	sts.l	pr,@-r15
	mov.l	@(0,r1),r3
	mov.l	@(52,r3),r3
	mov.l	.L0603546C,r5
	mov.l	@(52,r1),r4
	add	r5,r3
	sub	r4,r3
	mov	#1,r9
	mov	#-1,r0
	mov	#-1,r14
	shll8	r14
	mov.l	r9,@(0,r14)
	mov.l	r0,@(16,r14)
	mov.l	r3,@(20,r14)
	mov.l	@(28,r14),r3
	mov.l	.L06035470,r13
	mov	#8,r12
.L0603545E:
	mov.l	r3,@r13
	dt	r12
	bf/s	.L0603545E
	add	#12,r13
	lds.l	@r15+,pr
	rts
	nop
.L0603546C:
	.long 0x00300000
.L06035470:
	.long D_060903EC
	endlabel func_0603543C

	glabel func_06035474
	sts.l	pr,@-r15
	bra	func_0603539C
	lds.l	@r15+,pr
	endlabel func_06035474

	glabel func_0603547A
	mov.w	@(12,r1),r0
	sts.l	pr,@-r15
	cmp/eq	#0,r0
	bt	.L060354E0
	mov.l	.L060354CC,r4
	mov	#40,r8
	jsr	@r4
	shll16	r8
	lds.l	@r15+,pr
	cmp/pz	r0
	bf	.L060354EE
	mov.l	.L060354D0,r4
	mov.l	@r4,r4
	mov.l	@(8,r4),r12
	mov.b	@(1,r12),r0
	or	#32,r0
	mov.b	r0,@(1,r12)
	mov	#0,r0
	mov.w	r0,@(14,r12)
	sts.l	pr,@-r15
	mov.l	.L060354D4,r2
	mov.l	.L060354D8,r0
	jsr	@r0
	nop
	mov.l	.L060354DC,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	@(48,r4),r0
	mov.l	r0,@(48,r3)
	mov.l	@(52,r4),r0
	mov.l	r0,@(52,r3)
	mov.l	@(56,r4),r0
	mov.l	r0,@(56,r3)
	mov.l	r4,@r3
	lds.l	@r15+,pr
	mov.l	@(0,r1),r2
	mov	#5,r0
	mov.b	r0,@(12,r2)
	mov	#0,r0
	rts
	mov.l	r0,@(16,gbr)
.L060354CC:
	.long func_060172DE
.L060354D0:
	.long D_060F3064
.L060354D4:
	.long D_060FFFB0
.L060354D8:
	.long func_0600D0D0
.L060354DC:
	.long func_06035574
.L060354E0:
	mov.l	.L060354F4,r4
	mov	#80,r8
	jsr	@r4
	shll16	r8
	lds.l	@r15+,pr
	cmp/pz	r0
	bt	.L060354F8
.L060354EE:
	rts
	nop
	.byte 0x00, 0x00
.L060354F4:
	.long func_060172DE
.L060354F8:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#12,r6
	mov.l	.L0603556C,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.w	.L06035564,r0
	mov.w	r0,@(12,r1)
	mov.l	.L06035570,r0
	mov.l	@r0,r10
	mov.b	@(6,r10),r0
	mov.l	@(8,r10),r11
	mov.l	@(12,r10),r12
	mov.w	.L06035566,r0
	mov.w	r0,@(22,r11)
	mov	#0,r0
	mov.w	r0,@(24,r11)
	mov.w	.L06035568,r0
	mov.w	r0,@(28,r11)
	mov	#32,r0
	mov.b	r0,@(1,r11)
	mov	#0,r0
	mov.w	r0,@(14,r11)
	mov.w	r0,@(16,r11)
	mov	#-127,r0
	mov.b	r0,@(8,r11)
	mov	#48,r4
	add	r12,r4
	mov	#2,r0
	mov.b	r0,@r4
	mov	#-6,r0
	shll16	r0
	mov.l	r0,@(40,r12)
	mov	#-4,r0
	shll16	r0
	mov.l	r0,@(36,r10)
	mov	#5,r0
	mov.l	r0,@(60,r11)
	mov.l	@(0,r1),r2
	mov.w	.L0603556A,r4
	mov.w	@(24,r2),r0
	sub	r4,r0
	neg	r0,r0
	rts
	mov.w	r0,@(24,r10)
.L06035564:
	.short 0x0078
.L06035566:
	.short 0x00AE
.L06035568:
	.short 0x009E
.L0603556A:
	.short 0x4000
.L0603556C:
	.long func_0600E4C4
.L06035570:
	.long D_060F3064
	endlabel func_0603547A

	glabel func_06035574
	mov.l	@r1,r4
	mov.l	@(48,r1),r0
	mov.l	r0,@(48,r4)
	mov.l	@(52,r1),r0
	mov.l	r0,@(52,r4)
	mov.l	@(56,r1),r0
	rts
	mov.l	r0,@(56,r4)
	endlabel func_06035574

	glabel func_06035584
	sts.l	pr,@-r15
	mov.w	.L060355DC,r8
	mov	#68,r0
	mov.l	@(r0,r1),r9
	mov	#7,r7
	shlr	r9
	and	r7,r9
	mov.l	r9,@-r15
	mulu.w	r8,r9
	sts	macl,r8
	mov.l	.L060355E4,r5
	mov.l	.L060355E8,r4
	mov.w	.L060355DC,r6
	mov.l	.L060355EC,r0
	jsr	@r0
	add	r8,r4
	mov.l	@r15+,r9
	mov.w	.L060355DE,r8
	mulu.w	r8,r9
	sts	macl,r8
	mov.l	.L060355F0,r5
	mov.w	.L060355DE,r6
	mov.l	.L060355F4,r4
	mov.l	.L060355EC,r0
	jsr	@r0
	add	r8,r4
	mov	#68,r0
	mov.l	@(r0,r1),r9
	mov	#30,r7
	and	r7,r9
	mov.l	.L060355F8,r2
	add	r9,r2
	mov.l	.L060355FC,r6
	mov	#1,r7
	mov.l	.L06035600,r4
	mov.w	.L060355E0,r0
	shll2	r0
	shll	r0
	mov.l	.L06035604,r5
	jsr	@r5
	add	r4,r0
	lds.l	@r15+,pr
	rts
	nop
.L060355DC:
	.short 0x01A0
.L060355DE:
	.short 0x0060
.L060355E0:
	.short 0x00D6
	.byte 0x00, 0x00
.L060355E4:
	.long VDP1_VRAM + 0x67E00
.L060355E8:
	.long D_06090658
.L060355EC:
	.long func_060045BC
.L060355F0:
	.long VDP1_VRAM + 0x67FA0
.L060355F4:
	.long D_06091358
.L060355F8:
	.long D_06035608
.L060355FC:
	.long 0x0000C000
.L06035600:
	.long D_060ED000
.L06035604:
	.long func_0600D530
	endlabel func_06035584

	.section .data.06035608,"aw",@progbits
	.p2align 2
	dlabel D_06035608
	.byte 0xFF, 0xFF, 0xFF, 0xF4, 0xFF, 0xEA, 0xFF, 0xE0, 0xFF, 0x00, 0xFE, 0x40, 0xFD, 0x80, 0xFC, 0xC0
	.byte 0xFC, 0x00, 0xFC, 0xC0, 0xFD, 0x80, 0xFE, 0x40, 0xFF, 0x00, 0xFF, 0xE0, 0xFF, 0xEA, 0xFF, 0xF4
	.byte 0xFF, 0xFF, 0xFF, 0xF4, 0xFF, 0xEA, 0xFF, 0xE0, 0xFF, 0x00, 0xFE, 0x40, 0xFD, 0x80, 0xFC, 0xC0
	.byte 0xFC, 0x00, 0xFC, 0xC0, 0xFD, 0x80, 0xFE, 0x40, 0xFF, 0x00, 0xFF, 0xE0, 0xFF, 0xEA, 0xFF, 0xF4
	dlabel D_06035648
	.byte 0xD0, 0x08, 0xD2, 0x09
