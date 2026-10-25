	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601EBA8,"ax",@progbits
	.p2align 2

	glabel func_0601EBA8
	sts.l	pr,@-r15
	mov.l	.L0601EBEC,r2
	mov.b	@(20,gbr),r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	@(836,gbr),r0
	mov	r0,r3
	mov.l	@(840,gbr),r0
	mov	r0,r7
	mov.l	.L0601EBF0,r8
	mov.l	@(844,gbr),r0
	mov	r0,r9
	bsr	func_0601ED20
	nop
	mov	r9,r0
	mov.l	r0,@(852,gbr)
	mov.l	.L0601EBF4,r2
	mov.b	@(20,gbr),r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	@(848,gbr),r0
	mov	r0,r9
	bsr	func_0601ED20
	nop
	mov	r9,r0
	mov.l	r0,@(856,gbr)
	mov	r3,r0
	mov.l	r0,@(860,gbr)
	mov	r7,r0
	mov.l	r0,@(864,gbr)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601EBEC:
	.long D_06011AEC
.L0601EBF0:
	.long VDP1_VRAM
.L0601EBF4:
	.long D_06011B2C
	endlabel func_0601EBA8

	glabel func_0601EBF8
	sts.l	pr,@-r15
	mov.l	.L0601EC1C,r2
	shll2	r0
	shll	r0
	add	r0,r2
	mov.l	@(860,gbr),r0
	mov	r0,r3
	mov.l	@(864,gbr),r0
	mov	r0,r7
	mov.l	.L0601EC20,r8
	mov.l	@(852,gbr),r0
	mov	r0,r9
	bsr	func_0601ED20
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601EC1C:
	.long D_060C8DA4
.L0601EC20:
	.long VDP1_VRAM
	endlabel func_0601EBF8

	glabel func_0601EC24
	sts.l	pr,@-r15
	mov.l	.L0601EC40,r2
	mov.l	@(848,gbr),r0
	mov	r0,r9
	mov.l	@(836,gbr),r0
	mov	r0,r3
	mov.l	.L0601EC44,r8
	mov.l	@(840,gbr),r0
	mov	r0,r7
	bsr	func_0601ED20
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0601EC40:
	.long D_06011B8C
.L0601EC44:
	.long VDP1_VRAM
	endlabel func_0601EC24

	glabel func_0601EC48
	sts.l	pr,@-r15
	mov.l	.L0601EC88,r2
	mov.b	@(20,gbr),r0
	mov	#14,r8
	cmp/ge	r8,r0
	bf	.L0601EC56
	add	#-2,r0
.L0601EC56:
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	@(836,gbr),r0
	mov	r0,r3
	mov.l	@(840,gbr),r0
	mov	r0,r7
	mov.l	.L0601EC8C,r8
	mov.l	@(844,gbr),r0
	mov	r0,r9
	bsr	func_0601ED20
	nop
	mov.l	.L0601EC90,r2
	mov.b	@(20,gbr),r0
	mov	#14,r8
	cmp/ge	r8,r0
	bf	.L0601EC78
	add	#-2,r0
.L0601EC78:
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	@(848,gbr),r0
	mov	r0,r9
	lds.l	@r15+,pr
	bra	func_0601ED20
	nop
	.byte 0x00, 0x00
.L0601EC88:
	.long D_060C2EC0
.L0601EC8C:
	.long VDP1_VRAM
.L0601EC90:
	.long D_060C2EF4
	endlabel func_0601EC48

	glabel func_0601EC94
	sts.l	pr,@-r15
	mov.l	.L0601ECC8,r0
	mov.l	r0,@(832,gbr)
	mov.l	.L0601ECCC,r2
	mov.l	.L0601ECD0,r3
	mov.l	.L0601ECD4,r7
	mov.l	.L0601ECD8,r8
	mov.l	.L0601ECDC,r9
	bsr	func_0601ED20
	nop
	mov	r9,r0
	mov.l	r0,@(844,gbr)
	mov.l	.L0601ECE0,r2
	mov.l	.L0601ECE4,r9
	bsr	func_0601ED20
	nop
	mov	r9,r0
	mov.l	r0,@(848,gbr)
	mov	r3,r0
	mov.l	r0,@(836,gbr)
	mov	r7,r0
	mov.l	r0,@(840,gbr)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601ECC8:
	.long D_060F0400
.L0601ECCC:
	.long D_06011B94
.L0601ECD0:
	.long 0x00019800
.L0601ECD4:
	.long VDP1_VRAM + 0x10000
.L0601ECD8:
	.long VDP1_VRAM
.L0601ECDC:
	.long model_texture_table
.L0601ECE0:
	.long D_06012E00
.L0601ECE4:
	.long sprite_texture_table
	endlabel func_0601EC94

	glabel func_0601ECE8
	sts.l	pr,@-r15
	mov.l	.L0601ED18,r2
	mov.b	@(21,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	@(836,gbr),r0
	mov	r0,r3
	mov.l	@(840,gbr),r0
	mov	r0,r7
	mov.l	.L0601ED1C,r8
	mov.l	@(848,gbr),r0
	mov	r0,r9
	bsr	func_0601ED20
	nop
	mov	r9,r0
	mov.l	r0,@(848,gbr)
	mov	r3,r0
	mov.l	r0,@(836,gbr)
	mov	r7,r0
	mov.l	r0,@(840,gbr)
	lds.l	@r15+,pr
	rts
	nop
.L0601ED18:
	.long D_06011B6C
.L0601ED1C:
	.long VDP1_VRAM
	endlabel func_0601ECE8

	glabel func_0601ED20
	sts.l	pr,@-r15
.L0601ED22:
	mov.l	@r2+,r0
	cmp/pz	r0
	bf	.L0601ED42
	mov.l	r2,@-r15
	mov	r0,r2
.L0601ED2C:
	mov.l	@r2+,r4
	tst	r4,r4
	bt	.L0601ED3E
	mov	#-1,r0
	cmp/eq	r0,r4
	bf	.L0601ED48
	mov.l	@r15+,r2
	bra	.L0601ED22
	nop
.L0601ED3E:
	bra	.L0601ED2C
	add	#8,r9
.L0601ED42:
	lds.l	@r15+,pr
	rts
	nop
.L0601ED48:
	cmp/pz	r4
	bt	.L0601ED6C
	mov.l	.L0601ED68,r4
	mov.l	@r2+,r0
	shll2	r0
	add	r0,r4
	mov.w	@r4+,r0
	mov.w	r0,@(4,r9)
	mov.w	@r4+,r0
	mov.w	r0,@(0,r9)
	mov.w	r0,@(6,r9)
	mov.w	.L0601ED66,r0
	mov.w	r0,@(2,r9)
	bra	.L0601ED2C
	add	#8,r9
.L0601ED66:
	.short 0x0318
.L0601ED68:
	.long 0x0020000C
.L0601ED6C:
	mov.l	@r2+,r6
	cmp/pz	r6
	bt	.L0601ED7C
	mov	#-1,r0
	shlr	r0
	and	r6,r0
	bra	.L0601EEF8
	mov.w	r0,@(4,r9)
.L0601ED7C:
	mov	#16,r0
	shll16	r0
	shll8	r0
	tst	r0,r6
	bt	.L0601EDD2
	mov.l	@(832,gbr),r0
	mov	r0,r14
	add	#2,r0
	mov.l	r0,@(832,gbr)
	mov	r3,r10
	shlr2	r10
	shlr	r10
	mov	r10,r0
	mov.w	r0,@r14
	mov.w	@r2+,r0
	mov.w	@r2+,r5
	mov	#-1,r10
	extu.b	r10,r10
	and	r10,r5
	extu.w	r0,r0
	mov	r0,r10
	shlr8	r10
	and	#255,r0
	mov	r0,r11
	tst	r5,r5
	bt	.L0601EDCC
	mulu.w	r5,r10
	sts	macl,r10
	mulu.w	r11,r10
	sts	macl,r10
	mov	r3,r0
.L0601EDBA:
	mov.l	@r4+,r11
	mov.l	r11,@(r0,r8)
	add	#4,r0
	add	#4,r3
	dt	r10
	bf	.L0601EDBA
	add	#31,r3
	mov.w	.L0601EDD0,r0
	and	r0,r3
.L0601EDCC:
	bra	.L0601ED2C
	nop
.L0601EDD0:
	.short 0xFFE0
.L0601EDD2:
	mov.l	.L0601EDDC,r0
	cmp/ge	r0,r6
	bt	.L0601EDE0
	bra	.L0601EEEC
	nop
.L0601EDDC:
	.long 0x00010000
.L0601EDE0:
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov	r7,r0
	sub	r8,r0
	shlr2	r0
	shlr	r0
	mov.w	r0,@(4,r9)
	mov	#64,r0
	shll8	r0
	shll16	r0
	tst	r0,r6
	bf	.L0601EE3A
	shlr	r0
	tst	r0,r6
	bt	.L0601EE88
	not	r0,r0
	and	r0,r6
	mov.l	r2,@-r15
	mov.b	@(2,r2),r0
	add	#1,r0
	mov	r0,r12
.L0601EE0E:
	mov.l	r12,@-r15
	mov	#8,r2
.L0601EE12:
	mov.w	.L0601EE38,r14
.L0601EE14:
	mov.w	@r6+,r4
	mov	#-128,r0
	shll8	r0
	or	r0,r4
	mov.w	r4,@r7
	add	#2,r7
	dt	r14
	bf	.L0601EE14
	add	#-32,r6
	dt	r2
	bf	.L0601EE12
	add	#32,r6
	mov.l	@r15+,r12
	dt	r12
	bf	.L0601EE0E
	mov.l	@r15+,r2
	bra	.L0601EED4
	nop
.L0601EE38:
	.short 0x0010
.L0601EE3A:
	not	r0,r0
	and	r0,r6
	mov.l	r1,@-r15
	mov.l	r2,@-r15
	mov.b	@(2,r2),r0
	add	#1,r0
	mov	r0,r12
.L0601EE48:
	mov.l	r12,@-r15
	mov	r6,r1
	add	#32,r1
	mov	#8,r2
	mov	#0,r3
.L0601EE52:
	mov.w	.L0601EE80,r14
.L0601EE54:
	mov.w	@r6+,r4
	mov.w	@r1+,r5
	mov.l	.L0601EE84,r13
	jsr	@r13
	mov	r3,r0
	mov.w	r0,@r7
	add	#2,r7
	dt	r14
	bf	.L0601EE54
	add	#32,r3
	add	#-32,r6
	add	#-32,r1
	dt	r2
	bf	.L0601EE52
	add	#32,r6
	mov.l	@r15+,r12
	dt	r12
	bf	.L0601EE48
	mov.l	@r15+,r2
	mov.l	@r15+,r1
	bra	.L0601EED4
	nop
.L0601EE80:
	.short 0x0010
	.byte 0x00, 0x00
.L0601EE84:
	.long vdp_rgb555_lerp
.L0601EE88:
	shlr2	r0
	tst	r0,r6
	mov.w	@(140,gbr),r0
	mov.l	r0,@-r15
	bt	.L0601EE9A
	mov.l	.L0601EEE4,r0
	and	r0,r6
	mov.w	.L0601EEE0,r0
	mov.w	r0,@(140,gbr)
.L0601EE9A:
	mov.l	r2,@-r15
	mov.b	@(2,r2),r0
	add	#1,r0
	mov	r0,r12
.L0601EEA2:
	mov.l	r12,@-r15
	mov	#8,r2
	mov	#0,r3
.L0601EEA8:
	mov.w	.L0601EEE2,r14
.L0601EEAA:
	mov.w	@r6+,r4
	mov.w	@(140,gbr),r0
	mov	r0,r5
	mov.l	.L0601EEE8,r13
	jsr	@r13
	mov	r3,r0
	mov.w	r0,@r7
	add	#2,r7
	dt	r14
	bf	.L0601EEAA
	add	#24,r3
	add	#-32,r6
	dt	r2
	bf	.L0601EEA8
	add	#32,r6
	mov.l	@r15+,r12
	dt	r12
	bf	.L0601EEA2
	mov.l	@r15+,r2
	mov.l	@r15+,r0
	mov.w	r0,@(140,gbr)
.L0601EED4:
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	bra	.L0601EEF8
	nop
.L0601EEE0:
	.short 0x0000
.L0601EEE2:
	.short 0x0010
.L0601EEE4:
	.long 0x07FFFFFF
.L0601EEE8:
	.long vdp_rgb555_lerp
.L0601EEEC:
	mov	r9,r0
	shll2	r6
	shll	r6
	sub	r6,r0
	mov.w	@(4,r0),r0
	mov.w	r0,@(4,r9)
.L0601EEF8:
	mov	#64,r0
	shll8	r0
	shll16	r0
	tst	r0,r4
	bt	.L0601EF14
	mov	r9,r6
	add	#-8,r6
	mov.w	@(0,r6),r0
	mov.w	r0,@(0,r9)
	mov.w	r0,@(6,r9)
	mov.w	@(2,r6),r0
	mov.w	r0,@(2,r9)
	bra	.L0601ED3E
	add	#4,r2
.L0601EF14:
	mov	r3,r10
	shlr2	r10
	shlr	r10
	mov	r10,r0
	mov.w	r0,@r9
	mov.w	r0,@(6,r9)
	mov.w	@r2+,r0
	mov.w	@r2+,r5
	mov	#-1,r10
	extu.b	r10,r10
	and	r10,r5
	mov.w	r0,@(2,r9)
	extu.w	r0,r0
	mov	r0,r10
	shlr8	r10
	and	#255,r0
	mov	r0,r11
	tst	r5,r5
	bt	.L0601EF56
	mulu.w	r5,r10
	sts	macl,r10
	mulu.w	r11,r10
	sts	macl,r10
	mov	r3,r0
.L0601EF44:
	mov.l	@r4+,r11
	mov.l	r11,@(r0,r8)
	add	#4,r0
	add	#4,r3
	dt	r10
	bf	.L0601EF44
	add	#31,r3
	mov.w	.L0601EF5A,r0
	and	r0,r3
.L0601EF56:
	bra	.L0601ED2C
	add	#8,r9
.L0601EF5A:
	.short 0xFFE0
	endlabel func_0601ED20

	.section .data.0601EF5C,"aw",@progbits
	.p2align 2
	.byte 0x4F, 0x22, 0xD6, 0x0C, 0xD5, 0x0C, 0x40, 0x08, 0x40, 0x00, 0x36, 0x0C, 0x60, 0x65, 0x40, 0x08
	.byte 0x40, 0x00, 0x35, 0x0C, 0x60, 0x65, 0x60, 0x0D, 0x6A, 0x03, 0x4A, 0x19, 0xC9, 0xFF, 0x6B, 0x03
	.byte 0x2A, 0xBE, 0x06, 0x1A, 0x60, 0x46, 0x25, 0x02, 0x46, 0x10, 0x8F, 0xFB, 0x75, 0x04, 0x4F, 0x26
	.byte 0x00, 0x0B, 0x00, 0x09
	.long model_texture_table
	.long VDP1_VRAM
