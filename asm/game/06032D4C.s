	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06032D4C,"ax",@progbits
	.p2align 2

	glabel func_06032D4C
	sts.l	pr,@-r15
	mov.l	.L06032D60,r2
	mov.l	.L06032D64,r0
	jsr	@r0
	nop
	mov.l	.L06032D68,r0
	mov.l	r0,@(12,r3)
	lds.l	@r15+,pr
	rts
	nop
.L06032D60:
	.long D_060FFFD0
.L06032D64:
	.long func_0600D0D0
.L06032D68:
	.long func_06033074
	endlabel func_06032D4C

	glabel func_06032D6C
	sts.l	pr,@-r15
	mov.l	.L06032D80,r2
	mov.l	.L06032D84,r0
	jsr	@r0
	nop
	mov.l	.L06032D88,r0
	mov.l	r0,@(12,r3)
	lds.l	@r15+,pr
	rts
	nop
.L06032D80:
	.long D_060FFFD8
.L06032D84:
	.long func_0600D0D0
.L06032D88:
	.long func_06032DBC
	endlabel func_06032D6C

	glabel func_06032D8C
	sts.l	pr,@-r15
	mov.l	.L06032DA0,r2
	mov.l	.L06032DA4,r0
	jsr	@r0
	nop
	mov.l	.L06032DA8,r0
	mov.l	r0,@(12,r3)
	lds.l	@r15+,pr
	rts
	nop
.L06032DA0:
	.long D_060FFFD8
.L06032DA4:
	.long func_0600D0D0
.L06032DA8:
	.long func_06032E98
	endlabel func_06032D8C

	glabel func_06032DAC
	mov.l	.L06032DB8,r2
	mov	#1,r0
	mov.w	r0,@r2
	rts
	nop
	.byte 0x00, 0x00
.L06032DB8:
	.long D_0602E516
	endlabel func_06032DAC

	glabel func_06032DBC
	mov.l	.L06032DD8,r0
	mov.l	r0,@(48,r1)
	mov.l	.L06032DDC,r0
	mov.l	r0,@(52,r1)
	mov	#0,r0
	mov.w	r0,@(24,r1)
	mov.l	.L06032DE0,r0
	mov.l	r0,@(36,r1)
	mov.l	.L06032DE4,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
	.byte 0x00, 0x00
.L06032DD8:
	.long 0x00400000
.L06032DDC:
	.long 0xFF000000
.L06032DE0:
	.long 0x00002000
.L06032DE4:
	.long func_06032DE8
	endlabel func_06032DBC

	glabel func_06032DE8
	sts.l	pr,@-r15
	mov.l	.L06032E00,r10
	mov.l	.L06032E04,r11
	mov.l	@(52,r1),r8
	mov.l	@(36,r1),r9
	cmp/pz	r8
	bt	.L06032E08
	cmp/pz	r9
	bt	.L06032DFC
	shll	r10
.L06032DFC:
	bra	.L06032E14
	nop
.L06032E00:
	.long 0x00001000
.L06032E04:
	.long 0x00010000
.L06032E08:
	cmp/pz	r9
	bf	.L06032E0E
	shll	r10
.L06032E0E:
	neg	r10,r10
	bra	.L06032E14
	nop
.L06032E14:
	mov	r9,r0
	cmp/pz	r0
	bt	.L06032E1C
	neg	r0,r0
.L06032E1C:
	cmp/gt	r11,r0
	bt	.L06032E30
	mov	r8,r0
	cmp/pz	r0
	bt	.L06032E28
	neg	r0,r0
.L06032E28:
	cmp/gt	r11,r0
	bt	.L06032E30
	bra	.L06032E32
	mov	#0,r9
.L06032E30:
	add	r10,r9
.L06032E32:
	mov.l	r9,@(36,r1)
	add	r9,r8
	mov.l	r8,@(52,r1)
	mov.l	.L06032E84,r2
	mov.l	@r2,r2
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov	#0,r6
	mov.l	.L06032E88,r10
	jsr	@r10
	mov.w	@(24,r1),r0
	mov.l	.L06032E8C,r0
	jsr	@r0
	nop
	mov.l	.L06032E90,r3
	mov.l	@r3,r3
	mov.l	@(48,r3),r0
	add	r0,r4
	mov.l	r4,@(48,r2)
	mov.l	@(52,r3),r0
	add	r0,r5
	mov.w	@(22,r1),r0
	mov.w	.L06032E80,r8
	add	r8,r0
	mov.l	.L06032E94,r10
	jsr	@r10
	mov.w	r0,@(22,r1)
	shll2	r10
	shll2	r10
	shll2	r10
	shll	r10
	add	r10,r5
	mov.l	r5,@(52,r2)
	mov.l	@(56,r3),r0
	add	r0,r6
	mov.l	r6,@(56,r2)
	lds.l	@r15+,pr
	rts
	nop
.L06032E80:
	.short 0x0111
	.byte 0x00, 0x00
.L06032E84:
	.long D_060F306C
.L06032E88:
	.long func_06007BD8
.L06032E8C:
	.long func_06017B7C
.L06032E90:
	.long D_060F3064
.L06032E94:
	.long func_06007C08
	endlabel func_06032DE8

	glabel func_06032E98
	mov.l	.L06032EB4,r0
	mov.l	r0,@(48,r1)
	mov.l	.L06032EB8,r0
	mov.l	r0,@(52,r1)
	mov.w	.L06032EB2,r0
	mov.w	r0,@(24,r1)
	mov.l	.L06032EBC,r0
	mov.l	r0,@(36,r1)
	mov.l	.L06032EC0,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L06032EB2:
	.short 0x8000
.L06032EB4:
	.long 0x00400000
.L06032EB8:
	.long 0xFF000000
.L06032EBC:
	.long 0x00004000
.L06032EC0:
	.long func_06032EC4
	endlabel func_06032E98

	glabel func_06032EC4
	sts.l	pr,@-r15
	mov.l	.L06032EDC,r10
	mov.l	.L06032EE0,r11
	mov.l	@(52,r1),r8
	mov.l	@(36,r1),r9
	cmp/pz	r8
	bt	.L06032EE4
	cmp/pz	r9
	bt	.L06032ED8
	shll	r10
.L06032ED8:
	bra	.L06032EF0
	nop
.L06032EDC:
	.long 0x00002000
.L06032EE0:
	.long 0x00010000
.L06032EE4:
	cmp/pz	r9
	bf	.L06032EEA
	shll	r10
.L06032EEA:
	neg	r10,r10
	bra	.L06032EF0
	nop
.L06032EF0:
	mov	r9,r0
	cmp/pz	r0
	bt	.L06032EF8
	neg	r0,r0
.L06032EF8:
	cmp/gt	r11,r0
	bt	.L06032F0C
	mov	r8,r0
	cmp/pz	r0
	bt	.L06032F04
	neg	r0,r0
.L06032F04:
	cmp/gt	r11,r0
	bt	.L06032F0C
	bra	.L06032F0E
	mov	#0,r9
.L06032F0C:
	add	r10,r9
.L06032F0E:
	mov.l	r9,@(36,r1)
	add	r9,r8
	mov.l	r8,@(52,r1)
	mov.l	.L06032F60,r2
	mov.l	@r2,r2
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov	#0,r6
	mov.l	.L06032F64,r10
	jsr	@r10
	mov.w	@(24,r1),r0
	mov.l	.L06032F68,r0
	jsr	@r0
	nop
	mov.l	.L06032F6C,r3
	mov.l	@r3,r3
	mov.l	@(48,r3),r0
	add	r0,r4
	mov.l	r4,@(48,r2)
	mov.l	@(52,r3),r0
	add	r0,r5
	mov.w	@(22,r1),r0
	mov.w	.L06032F5C,r8
	add	r8,r0
	mov.l	.L06032F70,r10
	jsr	@r10
	mov.w	r0,@(22,r1)
	shll2	r10
	shll2	r10
	shll2	r10
	shll	r10
	add	r10,r5
	mov.l	r5,@(52,r2)
	mov.l	@(56,r3),r0
	add	r0,r6
	mov.l	r6,@(56,r2)
	lds.l	@r15+,pr
	rts
	nop
.L06032F5C:
	.short 0x0111
	.byte 0x00, 0x00
.L06032F60:
	.long D_060F3068
.L06032F64:
	.long func_06007BD8
.L06032F68:
	.long func_06017B7C
.L06032F6C:
	.long D_060F3064
.L06032F70:
	.long func_06007C08
	endlabel func_06032EC4

	glabel func_06032F74
	mov.w	.L06032F8A,r0
	mov.w	r0,@(2,r1)
	mov.w	.L06032F8C,r0
	mov.w	r0,@(4,r1)
	mov.w	.L06032F8E,r0
	mov.w	r0,@(6,r1)
	mov.l	.L06032F90,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L06032F8A:
	.short 0xFF00
.L06032F8C:
	.short 0x0004
.L06032F8E:
	.short 0x0040
.L06032F90:
	.long func_06033142
	endlabel func_06032F74

	glabel func_06032F94
	mov.w	.L06032FAA,r0
	mov.w	r0,@(2,r1)
	mov.w	.L06032FAC,r0
	mov.w	r0,@(4,r1)
	mov.w	.L06032FAE,r0
	mov.w	r0,@(6,r1)
	mov.l	.L06032FB0,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L06032FAA:
	.short 0xFF00
.L06032FAC:
	.short 0x0008
.L06032FAE:
	.short 0x0020
.L06032FB0:
	.long func_06033142
	endlabel func_06032F94

	glabel func_06032FB4
	mov.w	.L06032FCA,r0
	mov.w	r0,@(2,r1)
	mov.w	.L06032FCC,r0
	mov.w	r0,@(4,r1)
	mov.w	.L06032FCE,r0
	mov.w	r0,@(6,r1)
	mov.l	.L06032FD0,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L06032FCA:
	.short 0x0000
.L06032FCC:
	.short 0xFFFE
.L06032FCE:
	.short 0x0080
.L06032FD0:
	.long func_06033142
	endlabel func_06032FB4

	glabel func_06032FD4
	mov.w	.L06032FEA,r0
	mov.w	r0,@(2,r1)
	mov.w	.L06032FEC,r0
	mov.w	r0,@(4,r1)
	mov.w	.L06032FEE,r0
	mov.w	r0,@(6,r1)
	mov.l	.L06032FF0,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L06032FEA:
	.short 0x0000
.L06032FEC:
	.short 0xFFF8
.L06032FEE:
	.short 0x0020
.L06032FF0:
	.long func_06033142
	endlabel func_06032FD4

	glabel func_06032FF4
	mov.w	.L0603300A,r0
	mov.w	r0,@(2,r1)
	mov.w	.L0603300C,r0
	mov.w	r0,@(4,r1)
	mov.w	.L0603300E,r0
	mov.w	r0,@(6,r1)
	mov.l	.L06033010,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0603300A:
	.short 0x0000
.L0603300C:
	.short 0xFFF8
.L0603300E:
	.short 0x0020
.L06033010:
	.long func_06033142
	endlabel func_06032FF4

	glabel func_06033014
	mov.w	.L0603302A,r0
	mov.w	r0,@(2,r1)
	mov.w	.L0603302C,r0
	mov.w	r0,@(4,r1)
	mov.w	.L0603302E,r0
	mov.w	r0,@(6,r1)
	mov.l	.L06033030,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0603302A:
	.short 0x0000
.L0603302C:
	.short 0xFFF0
.L0603302E:
	.short 0x0020
.L06033030:
	.long func_06033172
	endlabel func_06033014

	glabel func_06033034
	mov.w	.L0603304A,r0
	mov.w	r0,@(2,r1)
	mov.w	.L0603304C,r0
	mov.w	r0,@(4,r1)
	mov.w	.L0603304E,r0
	mov.w	r0,@(6,r1)
	mov.l	.L06033050,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0603304A:
	.short 0x0100
.L0603304C:
	.short 0xFFFC
.L0603304E:
	.short 0x0040
.L06033050:
	.long func_06033142
	endlabel func_06033034

	glabel func_06033054
	mov.w	.L0603306A,r0
	mov.w	r0,@(2,r1)
	mov.w	.L0603306C,r0
	mov.w	r0,@(4,r1)
	mov.w	.L0603306E,r0
	mov.w	r0,@(6,r1)
	mov.l	.L06033070,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0603306A:
	.short 0xFFFF
.L0603306C:
	.short 0x0002
.L0603306E:
	.short 0x0080
.L06033070:
	.long func_06033142
	endlabel func_06033054

	glabel func_06033074
	mov.w	.L0603308A,r0
	mov.w	r0,@(2,r1)
	mov.w	.L0603308C,r0
	mov.w	r0,@(4,r1)
	mov.w	.L0603308E,r0
	mov.w	r0,@(6,r1)
	mov.l	.L06033090,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0603308A:
	.short 0xFFFF
.L0603308C:
	.short 0x0004
.L0603308E:
	.short 0x0040
.L06033090:
	.long func_06033142
	endlabel func_06033074

	glabel func_06033094
	mov.w	.L060330AA,r0
	mov.w	r0,@(2,r1)
	mov.w	.L060330AC,r0
	mov.w	r0,@(4,r1)
	mov.w	.L060330AE,r0
	mov.w	r0,@(6,r1)
	mov.l	.L060330B0,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L060330AA:
	.short 0xFFFF
.L060330AC:
	.short 0x0008
.L060330AE:
	.short 0x0020
.L060330B0:
	.long func_06033142
	endlabel func_06033094

	.section .data.060330B4,"aw",@progbits
	.p2align 2
	.byte 0x90, 0x09, 0x81, 0x11, 0x90, 0x08, 0x81, 0x12, 0x90, 0x07, 0x81, 0x13, 0xD0, 0x03, 0x21, 0x06
	.byte 0x71, 0x04, 0x00, 0x0B, 0x00, 0x09, 0x01, 0x00, 0xFF, 0xF0, 0x00, 0x10
	.long func_06033142
	.byte 0x90, 0x09, 0x81, 0x11, 0x90, 0x08, 0x81, 0x12, 0x90, 0x07, 0x81, 0x13, 0xD0, 0x03, 0x21, 0x06
	.byte 0x71, 0x04, 0x00, 0x0B, 0x00, 0x09, 0xFF, 0x00, 0x00, 0x0A, 0x00, 0x18
	.long func_06033142
