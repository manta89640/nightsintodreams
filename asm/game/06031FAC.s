	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06031FAC,"ax",@progbits
	.p2align 2

	glabel func_06031FAC
	sts.l	pr,@-r15
	mov.l	.L06031FC8,r2
	mov.l	.L06031FCC,r0
	jsr	@r0
	nop
	mov.l	.L06031FD0,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.w	.L06031FC6,r0
	mov.w	r0,@(0,r3)
	lds.l	@r15+,pr
	rts
	nop
.L06031FC6:
	.short 0x00FF
.L06031FC8:
	.long D_060FFFD0
.L06031FCC:
	.long func_0600D0D0
.L06031FD0:
	.long func_06032154
	endlabel func_06031FAC

	glabel func_06031FD4
	mov.b	@(107,gbr),r0
	tst	r0,r0
	bf	.L06031FEC
	sts.l	pr,@-r15
	mov.l	.L06031FF0,r2
	mov.l	.L06031FF4,r0
	jsr	@r0
	nop
	mov.l	.L06031FF8,r0
	mov.l	r0,@(12,r3)
	nop
	lds.l	@r15+,pr
.L06031FEC:
	rts
	nop
.L06031FF0:
	.long D_060FFFD8
.L06031FF4:
	.long func_0600D0D0
.L06031FF8:
	.long func_06032024
	endlabel func_06031FD4

	glabel func_06031FFC
	mov.b	@(107,gbr),r0
	tst	r0,r0
	bf	.L06032014
	sts.l	pr,@-r15
	mov.l	.L06032018,r2
	mov.l	.L0603201C,r0
	jsr	@r0
	nop
	mov.l	.L06032020,r0
	mov.l	r0,@(12,r3)
	nop
	lds.l	@r15+,pr
.L06032014:
	rts
	nop
.L06032018:
	.long D_060FFFD8
.L0603201C:
	.long func_0600D0D0
.L06032020:
	.long func_060320B8
	endlabel func_06031FFC

	glabel func_06032024
	mov.l	.L06032044,r2
	mov.l	r2,@(44,r1)
	mov.b	@(20,gbr),r0
	shlr	r0
	mov.w	r0,@(20,r1)
	mov.w	.L06032040,r0
	mov.w	r0,@(26,r1)
	mov.w	.L06032042,r0
	mov.w	r0,@(22,r1)
	mov.l	.L06032048,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L06032040:
	.short 0x8000
.L06032042:
	.short 0x0100
.L06032044:
	.long D_060137A4
.L06032048:
	.long func_0603204C
	endlabel func_06032024

	glabel func_0603204C
	sts.l	pr,@-r15
	mov.w	@(26,r1),r0
	mov	r0,r8
	mov	#0,r9
	mov.w	.L06032096,r10
	mov.l	.L06032098,r0
	jsr	@r0
	nop
	mov	r8,r0
	mov.l	.L0603209C,r10
	jsr	@r10
	mov.w	r0,@(26,r1)
	shll	r10
	shll	r11
	shll8	r10
	shll8	r11
	mov.l	.L060320A0,r4
	mov.l	@r4,r4
	mov.l	.L060320A4,r12
	mov.b	@(6,r4),r0
	cmp/eq	#1,r0
	bt	.L0603207A
	neg	r12,r12
.L0603207A:
	mov.l	.L060320A8,r8
	add	r12,r8
	mov.l	.L060320AC,r9
	mov.l	.L060320B0,r9
	sub	r10,r8
	sub	r11,r9
	mov.l	r8,@(48,r1)
	mov.l	r9,@(52,r1)
	mov.l	.L060320B4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06032096:
	.short 0x0400
.L06032098:
	.long func_06031E00
.L0603209C:
	.long func_06007BD8
.L060320A0:
	.long D_060F3064
.L060320A4:
	.long 0x00300000
.L060320A8:
	.long 0x00B00000
.L060320AC:
	.long 0x00AD0000
.L060320B0:
	.long 0x00DD0000
.L060320B4:
	.long func_060204EE
	endlabel func_0603204C

	glabel func_060320B8
	mov.l	.L060320DC,r2
	mov.l	r2,@(44,r1)
	mov.b	@(20,gbr),r0
	shlr	r0
	add	#8,r0
	mov.w	r0,@(20,r1)
	mov.w	.L060320D6,r0
	mov.w	r0,@(26,r1)
	mov.w	.L060320D8,r0
	mov.w	r0,@(22,r1)
	mov.l	.L060320E0,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L060320D6:
	.short 0x0000
.L060320D8:
	.short 0x0100
	.byte 0x00, 0x00
.L060320DC:
	.long D_060137A4
.L060320E0:
	.long func_060320E4
	endlabel func_060320B8

	glabel func_060320E4
	sts.l	pr,@-r15
	mov.w	@(26,r1),r0
	mov	r0,r8
	mov.w	.L0603212E,r9
	mov.w	.L06032130,r10
	mov.l	.L06032134,r0
	jsr	@r0
	nop
	mov	r8,r0
	mov.l	.L06032138,r10
	jsr	@r10
	mov.w	r0,@(26,r1)
	shll	r10
	shll	r11
	shll8	r10
	shll8	r11
	mov.l	.L0603213C,r4
	mov.l	@r4,r4
	mov.l	.L06032140,r12
	mov.b	@(6,r4),r0
	cmp/eq	#1,r0
	bt	.L06032112
	neg	r12,r12
.L06032112:
	mov.l	.L06032144,r8
	add	r12,r8
	mov.l	.L06032148,r9
	mov.l	.L0603214C,r9
	sub	r10,r8
	sub	r11,r9
	mov.l	r8,@(48,r1)
	mov.l	r9,@(52,r1)
	mov.l	.L06032150,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0603212E:
	.short 0x8000
.L06032130:
	.short 0x0400
	.byte 0x00, 0x00
.L06032134:
	.long func_06031E00
.L06032138:
	.long func_06007BD8
.L0603213C:
	.long D_060F3064
.L06032140:
	.long 0x00300000
.L06032144:
	.long 0x00B00000
.L06032148:
	.long 0x00460000
.L0603214C:
	.long 0x00360000
.L06032150:
	.long func_060204EE
	endlabel func_060320E4

	glabel func_06032154
	mov.w	@(0,r1),r0
	add	#-4,r0
	cmp/pz	r0
	bt	.L0603215E
	mov	#0,r0
.L0603215E:
	mov.w	r0,@(0,r1)
	mov.l	.L060321B4,r13
	mov.w	.L060321A4,r11
	mov.w	.L060321A6,r5
	mov.w	.L060321A8,r6
	mov.w	.L060321AA,r7
	mov.w	.L060321AC,r8
	mov.w	.L060321AE,r9
	mov.w	.L060321B0,r10
.L06032170:
	mov.w	@r13,r2
	mov	r2,r3
	mov	r2,r4
	and	r5,r2
	and	r6,r3
	and	r7,r4
	cmp/pl	r2
	bf	.L06032182
	sub	r8,r2
.L06032182:
	cmp/pl	r3
	bf	.L06032188
	sub	r9,r3
.L06032188:
	cmp/pl	r4
	bf	.L0603218E
	sub	r10,r4
.L0603218E:
	and	r5,r2
	and	r6,r3
	and	r7,r4
	or	r2,r3
	or	r3,r4
	mov.w	r4,@r13
	dt	r11
	bf/s	.L06032170
	add	#2,r13
	rts
	nop
.L060321A4:
	.short 0x0100
.L060321A6:
	.short 0x7C00
.L060321A8:
	.short 0x03E0
.L060321AA:
	.short 0x001F
.L060321AC:
	.short 0x0400
.L060321AE:
	.short 0x0020
.L060321B0:
	.short 0x0001
	.byte 0x00, 0x00
.L060321B4:
	.long VDP2_CRAM + 0xE00
	endlabel func_06032154

	glabel func_060321B8
	mov.l	.L060321C8,r4
	mov.l	@r4,r4
	mov.l	@(8,r4),r12
	mov.w	.L060321C6,r0
	mov.w	r0,@(22,r12)
	rts
	nop
.L060321C6:
	.short 0x00B7
.L060321C8:
	.long D_060F3064
	endlabel func_060321B8

	glabel func_060321CC
	mov.l	.L060321E0,r4
	mov.l	@r4,r4
	mov.l	@(8,r4),r12
	mov.w	.L060321DE,r0
	mov.w	r0,@(22,r12)
	mov	#1,r0
	mov.b	r0,@(8,r12)
	rts
	nop
.L060321DE:
	.short 0x00B2
.L060321E0:
	.long D_060F3064
	endlabel func_060321CC

	glabel func_060321E4
	mov.b	@(37,gbr),r0
	tst	r0,r0
	bf	.L060321F4
	mov.w	@(8,r1),r0
	add	#-1,r0
	mov.w	r0,@(8,r1)
	rts
	nop
.L060321F4:
	mov.l	.L06032254,r0
	mov.l	@r0,r4
	mov	#2,r13
	mov.b	r13,@r4
	mov	#10,r0
	mov.b	r0,@(1,r4)
	mov.l	r8,@-r15
	mov.l	r2,@-r15
	mov.l	r0,@-r15
	mov.l	.L06032258,r2
	mov	#0,r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.b	@(2,r2),r0
	mov	#90,r8
	cmp/gt	r0,r8
	bf	.L06032220
	mov	r8,r0
	mov.b	r0,@(2,r2)
	mov	#9,r0
	mov.b	r0,@(0,r2)
.L06032220:
	mov.l	@r15+,r0
	mov.l	@r15+,r2
	mov.l	@r15+,r8
	mov.b	@(0,gbr),r0
	cmp/eq	#13,r0
	bt	.L06032250
	mov.b	@(107,gbr),r0
	tst	r0,r0
	bf	.L06032250
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#10,r6
	mov.l	.L0603225C,r0
	jsr	@r0
	mov	#2,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L06032250:
	rts
	nop
.L06032254:
	.long D_060F30A8
.L06032258:
	.long D_060FEA2C
.L0603225C:
	.long func_0600E4C4
	endlabel func_060321E4

	glabel func_06032260
	mov.l	.L06032298,r0
	mov.l	@r0,r4
	mov	#4,r13
	mov.b	r13,@r4
	mov	#10,r0
	mov.b	r0,@(1,r4)
	mov.l	r8,@-r15
	mov.l	r2,@-r15
	mov.l	r0,@-r15
	mov.l	.L0603229C,r2
	mov	#0,r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.b	@(2,r2),r0
	mov	#90,r8
	cmp/gt	r0,r8
	bf	.L0603228C
	mov	r8,r0
	mov.b	r0,@(2,r2)
	mov	#10,r0
	mov.b	r0,@(0,r2)
.L0603228C:
	mov.l	@r15+,r0
	mov.l	@r15+,r2
	mov.l	@r15+,r8
	rts
	nop
	.byte 0x00, 0x00
.L06032298:
	.long D_060F30A8
.L0603229C:
	.long D_060FEA2C
	endlabel func_06032260

	glabel func_060322A0
	mov.l	.L060322D8,r0
	mov.l	@r0,r4
	mov	#8,r13
	mov.b	r13,@r4
	mov	#10,r0
	mov.b	r0,@(1,r4)
	mov.l	r8,@-r15
	mov.l	r2,@-r15
	mov.l	r0,@-r15
	mov.l	.L060322DC,r2
	mov	#0,r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.b	@(2,r2),r0
	mov	#90,r8
	cmp/gt	r0,r8
	bf	.L060322CC
	mov	r8,r0
	mov.b	r0,@(2,r2)
	mov	#11,r0
	mov.b	r0,@(0,r2)
.L060322CC:
	mov.l	@r15+,r0
	mov.l	@r15+,r2
	mov.l	@r15+,r8
	rts
	nop
	.byte 0x00, 0x00
.L060322D8:
	.long D_060F30A8
.L060322DC:
	.long D_060FEA2C
	endlabel func_060322A0

	glabel func_060322E0
	mov.l	.L06032318,r0
	mov.l	@r0,r4
	mov	#16,r13
	mov.b	r13,@r4
	mov	#10,r0
	mov.b	r0,@(1,r4)
	mov.l	r8,@-r15
	mov.l	r2,@-r15
	mov.l	r0,@-r15
	mov.l	.L0603231C,r2
	mov	#0,r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.b	@(2,r2),r0
	mov	#90,r8
	cmp/gt	r0,r8
	bf	.L0603230C
	mov	r8,r0
	mov.b	r0,@(2,r2)
	mov	#12,r0
	mov.b	r0,@(0,r2)
.L0603230C:
	mov.l	@r15+,r0
	mov.l	@r15+,r2
	mov.l	@r15+,r8
	rts
	nop
	.byte 0x00, 0x00
.L06032318:
	.long D_060F30A8
.L0603231C:
	.long D_060FEA2C
	endlabel func_060322E0

	glabel func_06032320
	mov.l	r8,@-r15
	mov.l	r2,@-r15
	mov.l	r0,@-r15
	mov.l	.L0603234C,r2
	mov	#0,r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.b	@(2,r2),r0
	mov	#90,r8
	cmp/gt	r0,r8
	bf	.L06032340
	mov	r8,r0
	mov.b	r0,@(2,r2)
	mov	#13,r0
	mov.b	r0,@(0,r2)
.L06032340:
	mov.l	@r15+,r0
	mov.l	@r15+,r2
	mov.l	@r15+,r8
	rts
	nop
	.byte 0x00, 0x00
.L0603234C:
	.long D_060FEA2C
	endlabel func_06032320

	glabel func_06032350
	sts.l	pr,@-r15
	bsr	func_06032380
	nop
	mov.l	.L0603237C,r4
	mov.l	@r4,r4
	mov.w	@(2,r4),r0
	mov.w	.L06032376,r8
	add	#-2,r0
	cmp/ge	r8,r0
	bt	.L06032366
	mov	r8,r0
.L06032366:
	mov.w	r0,@(2,r4)
	mov.w	@(20,r4),r0
	mov.w	.L06032378,r8
	sub	r8,r0
	mov.w	r0,@(20,r4)
	lds.l	@r15+,pr
	rts
	nop
.L06032376:
	.short 0x0080
.L06032378:
	.short 0x0100
	.byte 0x00, 0x00
.L0603237C:
	.long D_060F309C
	endlabel func_06032350

	glabel func_06032380
	sts.l	pr,@-r15
	mov.w	@(8,r1),r0
	add	#1,r0
	mov.w	r0,@(8,r1)
	mov.l	.L0603239C,r2
.L0603238A:
	mov.l	@r2+,r8
	cmp/pz	r8
	bf	.L060323A6
	cmp/eq	r8,r0
	bt	.L060323A0
	add	#4,r2
	bra	.L0603238A
	add	#4,r8
	.byte 0x00, 0x00
.L0603239C:
	.long D_060323AC
.L060323A0:
	mov.l	@r2+,r2
	jsr	@r2
	nop
.L060323A6:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06032380

	.section .data.060323AC,"aw",@progbits
	.p2align 2
	dlabel D_060323AC
	.byte 0x00, 0x00, 0x00, 0x01
	.long func_0601E1FC
	.byte 0x00, 0x00, 0x00, 0x0B
	.long func_0601DF0C
	.byte 0x00, 0x00, 0x00, 0x15
	.long func_0601DF58
	.byte 0x00, 0x00, 0x00, 0x1F
	.long func_0601DFA4
	.byte 0x00, 0x00, 0x00, 0x1E
	.long func_06032478
	.byte 0x00, 0x00, 0x00, 0x29
	.long func_0601DFEC
	.byte 0x00, 0x00, 0x00, 0x2A
	.long func_0601E144
	.byte 0x00, 0x00, 0x00, 0x3C
	.long func_0603248C
	.byte 0x00, 0x00, 0x00, 0x5A
	.long func_060324A0
	.byte 0x00, 0x00, 0x00, 0x78
	.long func_060324B4
	.byte 0x00, 0x00, 0x00, 0x96
	.long func_060324C8
	.byte 0x00, 0x00, 0x00, 0xA0
	.long func_060324DC
	.byte 0x00, 0x00, 0x00, 0xFA
	.long D_0601D130
	.byte 0x00, 0x00, 0x00, 0xFF
	.long D_06032428
	.byte 0x00, 0x00, 0x01, 0x04
	.long D_0601D124
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_06032428
	.byte 0xD2, 0x05, 0x60, 0x21, 0x40, 0x15, 0x89, 0x18, 0x20, 0x08, 0x89, 0x07, 0x85, 0x14, 0x70, 0xFF
	.byte 0x81, 0x14, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x00
	.long D_0602E516
