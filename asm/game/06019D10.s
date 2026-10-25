	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06019D10,"ax",@progbits
	.p2align 2

	glabel txt_bcd_to_ascii
	add	r14,r5
	add	#-1,r5
	mov	#10,r2
.L06019D16:
	mov	r4,r0
	and	#15,r0
	add	#48,r0
	mov.b	r0,@r5
	add	#-1,r5
	shlr2	r4
	shlr2	r4
	tst	r4,r4
	bt/s	.L06019D30
	dt	r14
	bf	.L06019D16
	rts
	nop
.L06019D30:
	tst	r14,r14
	bt	.L06019D3E
.L06019D34:
	mov	#32,r0
	mov.b	r0,@r5
	add	#-1,r5
	dt	r14
	bf	.L06019D34
.L06019D3E:
	rts
	nop
	endlabel txt_bcd_to_ascii

	glabel spr_build_number
	mov	r0,r4
	mov	#0,r5
	mov.l	@(44,r1),r2
	mov.w	@r2,r0
	add	r0,r2
	mov.l	.L06019D88,r3
.L06019D4E:
	mov	r4,r0
	and	#15,r0
	add	r0,r0
	mov.w	@(r0,r3),r8
	add	r3,r8
	mov.w	@r8+,r0
	mov.w	r0,@r2
	mov.w	@r8+,r0
	add	r5,r0
	add	#-15,r5
	mov.w	r0,@(2,r2)
	mov.w	@r8+,r0
	mov.w	r0,@(4,r2)
	mov.w	@r8+,r0
	mov.w	r0,@(6,r2)
	mov.w	@r8+,r0
	mov.w	r0,@(8,r2)
	add	#20,r2
	shlr2	r4
	shlr2	r4
	tst	r4,r4
	bt	.L06019D7E
	dt	r14
	bf	.L06019D4E
.L06019D7E:
	mov	#-1,r0
	mov.w	r0,@r2
	rts
	nop
	.byte 0x00, 0x00
.L06019D88:
	.long D_06014486
	endlabel spr_build_number

	glabel func_06019D8C
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bt	.L06019DA6
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L06019DA2
	mov.b	@(9,r1),r0
	mov	r0,r8
	mov.b	@(31,gbr),r0
	cmp/eq	r0,r8
	bt	.L06019DA6
.L06019DA2:
	rts
	nop
.L06019DA6:
	mov.l	.L06019E50,r4
	mov.l	r1,@r4
	mov	#0,r0
	mov.w	r0,@(26,r1)
	mov.l	.L06019E54,r6
	mov.w	.L06019E44,r0
	mov.w	r0,@(0,r6)
	mov.w	r0,@(2,r6)
	mov.w	.L06019E46,r0
	mov.w	r0,@(4,r6)
	mov.w	r0,@(6,r6)
	mov.l	.L06019E58,r7
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L06019DD2
	mov.b	@(9,r1),r0
	shll2	r0
	shll2	r0
	add	r0,r7
	mov	#0,r0
	mov.b	r0,@(0,r7)
	mov.b	r0,@(1,r7)
.L06019DD2:
	mov	#0,r0
	mov.b	r0,@(2,r7)
	mov.w	r0,@(14,r7)
	mov.b	r0,@(5,r7)
	mov.w	.L06019E48,r0
	mov.w	r0,@(28,r1)
	mov.l	.L06019E5C,r2
	mov.b	@(9,r1),r0
	cmp/eq	#0,r0
	bt	.L06019DE8
	mov.l	.L06019E60,r2
.L06019DE8:
	mov.l	r2,@(44,r1)
	mov	#0,r0
	mov.w	r0,@(20,r1)
	mov.l	.L06019E64,r0
	mov.l	r0,@(32,r1)
	neg	r0,r0
	mov.l	.L06019E68,r8
	add	r8,r0
	mov.l	r0,@(48,r1)
	mov	#28,r2
	mov.b	@(9,r1),r0
	shll2	r0
	shll	r0
	mov	r0,r8
	shll	r0
	add	r8,r0
	add	r0,r2
	shll16	r2
	mov.l	r2,@(52,r1)
	mov.l	.L06019E6C,r0
	mov.l	r0,@(56,r1)
	mov.w	.L06019E4A,r0
	mov.w	r0,@(22,r1)
	mov.l	.L06019E70,r2
	mov.b	@(9,r1),r0
	shll2	r0
	add	r0,r2
	mov.l	@r2,r0
	mov.l	r0,@(0,r1)
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L06019E30
	mov.l	@(52,r1),r0
	mov.l	.L06019E74,r8
	add	r8,r0
	mov.l	r0,@(52,r1)
.L06019E30:
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L06019E3A
	mov.w	.L06019E4C,r0
	mov.w	r0,@(16,r1)
.L06019E3A:
	mov.l	.L06019E78,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L06019E44:
	.short 0x6210
.L06019E46:
	.short 0x4005
.L06019E48:
	.short 0x1FFF
.L06019E4A:
	.short 0x00E0
.L06019E4C:
	.short 0x01A4
	.byte 0x00, 0x00
.L06019E50:
	.long D_0601A210
.L06019E54:
	.long VDP1_VRAM + 0xFFF8
.L06019E58:
	.long play_state
.L06019E5C:
	.long D_0601A118
.L06019E60:
	.long D_0601A194
.L06019E64:
	.long 0x01400000
.L06019E68:
	.long 0x02000000
.L06019E6C:
	.long 0x00000000
.L06019E70:
	.long score
.L06019E74:
	.long 0x00380000
.L06019E78:
	.long func_06019EAE
	.byte 0x00, 0x02, 0x00, 0x16, 0x40, 0x32, 0x49, 0x40, 0x30, 0x54, 0x45, 0x4D, 0xFE, 0x09, 0x00, 0x26
	.byte 0x00, 0x19, 0x40, 0x30, 0x44, 0x40, 0x32, 0x41, 0x40, 0x30, 0x53, 0x48, 0xFE, 0x09, 0x00, 0x02
	.byte 0x00, 0x19, 0x40, 0x32, 0x42, 0x41, 0x53, 0x45, 0x20, 0x20, 0x20, 0x40, 0x31, 0x2F, 0x31, 0x36
	.byte 0xFE, 0x09
	endlabel func_06019D8C

	glabel func_06019EAE
	mov.w	@(16,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bf	.L06019EBC
	mov.w	r0,@(16,r1)
	rts
	nop
.L06019EBC:
	mov.l	@(48,r1),r8
	mov.l	@(32,r1),r0
	mov.l	.L06019F28,r9
	add	r9,r8
	cmp/ge	r0,r8
	bt	.L06019ED4
	mov	r0,r8
	mov.w	.L06019F1E,r0
	mov.w	r0,@(26,r1)
	mov.l	.L06019F2C,r0
	mov.l	r0,@-r1
	add	#4,r1
.L06019ED4:
	mov.l	r8,@(48,r1)
	endlabel func_06019EAE

	glabel func_06019ED6
	sts.l	pr,@-r15
	mov.w	@(26,r1),r0
	add	#-16,r0
	cmp/pz	r0
	bt	.L06019EE2
	mov	#0,r0
.L06019EE2:
	mov.w	r0,@(26,r1)
	mov	r0,r6
	mov.l	.L06019F30,r3
	mov.w	.L06019F20,r4
	mov.w	.L06019F22,r5
	mov	r6,r0
	mov.l	.L06019F34,r8
	jsr	@r8
	nop
	mov.w	r0,@(0,r3)
	mov.w	r0,@(2,r3)
	mov.w	.L06019F24,r4
	mov.w	.L06019F22,r5
	mov	r6,r0
	mov.l	.L06019F34,r8
	jsr	@r8
	nop
	mov.w	r0,@(4,r3)
	mov.w	r0,@(6,r3)
	mov.l	.L06019F38,r7
	mov.b	@(9,r1),r0
	shll2	r0
	shll2	r0
	add	r0,r7
	mov.b	@(2,r7),r0
	cmp/pl	r0
	bt	.L06019F3C
	mov	#0,r0
	bra	.L06019F40
	mov.w	r0,@(14,r7)
.L06019F1E:
	.short 0x00FF
.L06019F20:
	.short 0x6210
.L06019F22:
	.short 0x7FFF
.L06019F24:
	.short 0x4005
	.byte 0x00, 0x00
.L06019F28:
	.long 0xFFF40000
.L06019F2C:
	.long func_06019ED6
.L06019F30:
	.long VDP1_VRAM + 0xFFF8
.L06019F34:
	.long vdp_rgb555_lerp
.L06019F38:
	.long play_state
.L06019F3C:
	add	#-1,r0
	mov.b	r0,@(2,r7)
.L06019F40:
	mov.b	@(1,r7),r0
	cmp/pl	r0
	bf	.L06019F4A
	add	#-1,r0
	mov.b	r0,@(1,r7)
.L06019F4A:
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L06019F60
	mov.b	@(25,gbr),r0
	cmp/pz	r0
	bt	.L06019F5C
	mov.l	@(16,gbr),r0
	tst	r0,r0
	bf	.L06019F60
.L06019F5C:
	bra	.L0601A01A
	nop
.L06019F60:
	mov.l	.L06019FA8,r7
	mov.b	@(5,r7),r0
	tst	#1,r0
	bt	.L06019F80
	mov.l	.L06019FAC,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.l	.L06019FB0,r6
	mov.w	.L06019FA0,r0
	mov.w	r0,@(0,r6)
	mov.w	r0,@(2,r6)
	mov.w	.L06019FA2,r0
	mov.w	r0,@(4,r6)
	mov.w	r0,@(6,r6)
	mov.l	.L06019FB4,r0
	mov.l	r0,@(12,r1)
.L06019F80:
	mov.l	.L06019FB8,r2
	mov.b	@(9,r1),r0
	shll2	r0
	add	r0,r2
	mov.l	@r2,r0
	mov	r0,r8
	mov.l	@(0,r1),r0
	cmp/eq	r8,r0
	bt	.L06019FDC
	cmp/gt	r8,r0
	bf	.L06019FBC
	mov.w	.L06019FA4,r10
	add	r10,r0
	cmp/gt	r8,r0
	bra	.L06019FC6
	mov	r8,r0
.L06019FA0:
	.short 0x6F7B
.L06019FA2:
	.short 0x1CE7
.L06019FA4:
	.short 0xFFD8
	.byte 0x00, 0x00
.L06019FA8:
	.long play_state
.L06019FAC:
	.long func_0601C350
.L06019FB0:
	.long VDP1_VRAM + 0xFFF0
.L06019FB4:
	.long 0xFFFF8000
.L06019FB8:
	.long score
.L06019FBC:
	mov.w	.L06019FD8,r10
	add	r10,r0
	cmp/ge	r8,r0
	bf	.L06019FC6
	mov	r8,r0
.L06019FC6:
	mov.l	r0,@(0,r1)
	mov.w	@(22,r1),r0
	add	#8,r0
	mov.w	.L06019FDA,r8
	cmp/gt	r8,r0
	bf	.L06019FD4
	mov	r8,r0
.L06019FD4:
	bra	.L06019FEA
	mov.w	r0,@(22,r1)
.L06019FD8:
	.short 0x0028
.L06019FDA:
	.short 0x0140
.L06019FDC:
	mov.w	@(22,r1),r0
	add	#-2,r0
	mov.w	.L0601A002,r8
	cmp/ge	r8,r0
	bt	.L06019FE8
	mov	r8,r0
.L06019FE8:
	mov.w	r0,@(22,r1)
.L06019FEA:
	mov.l	@(0,r1),r0
	mov.l	.L0601A004,r14
	jsr	@r14
	mov	r0,r4
	mov	#6,r14
	bsr	spr_build_number
	nop
	mov.b	@(35,gbr),r0
	tst	r0,r0
	bt	.L0601A008
	bra	.L0601A01A
	nop
.L0601A002:
	.short 0x00E8
.L0601A004:
	.long math_bin_to_bcd
.L0601A008:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0601A014
	lds.l	@r15+,pr
	rts
	nop
.L0601A014:
	mov.l	.L0601A020,r0
	jsr	@r0
	nop
.L0601A01A:
	lds.l	@r15+,pr
	rts
	nop
.L0601A020:
	.long spr_draw_obj
	.byte 0xD7, 0x0F, 0xE0, 0x00, 0x80, 0x70, 0x80, 0x71, 0x80, 0x72, 0x81, 0x77, 0x80, 0x75, 0x90, 0x15
	.byte 0x81, 0x1E, 0xD2, 0x0C, 0x11, 0x2B, 0xE0, 0x00, 0x81, 0x1A, 0xD0, 0x0B, 0x11, 0x0C, 0xE2, 0x30
	.byte 0x42, 0x28, 0x11, 0x2D, 0xD0, 0x09, 0x11, 0x0E, 0x90, 0x09, 0x81, 0x1B, 0xD2, 0x08, 0x60, 0x22
	.byte 0x11, 0x00, 0xD0, 0x08, 0x21, 0x06, 0x71, 0x04, 0x00, 0x0B, 0x00, 0x09, 0x1F, 0xFF, 0x01, 0x00
	.long D_060FFE60
	.long D_0601A194
	.byte 0x01, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.long score_p2
	.long func_0601A07C
	endlabel func_06019ED6

	glabel func_0601A07C
	sts.l	pr,@-r15
	mov.l	.L0601A094,r7
	mov.l	.L0601A098,r14
	mov.w	@(0,r14),r0
	cmp/pl	r0
	bt	.L0601A09C
	mov.l	@(0,r1),r0
	tst	r0,r0
	bf	.L0601A09C
	lds.l	@r15+,pr
	rts
	nop
.L0601A094:
	.long D_060FFE60
.L0601A098:
	.long D_060FFE70
.L0601A09C:
	mov.l	.L0601A0B8,r2
	mov.l	@r2,r8
	mov.l	@(0,r1),r0
	cmp/eq	r8,r0
	bt	.L0601A0DC
	cmp/gt	r8,r0
	bf	.L0601A0BC
	mov.w	.L0601A0B6,r10
	add	r10,r0
	cmp/gt	r8,r0
	bt	.L0601A0C6
	bra	.L0601A0C6
	mov	r8,r0
.L0601A0B6:
	.short 0xFF38
.L0601A0B8:
	.long score_p2
.L0601A0BC:
	mov.w	.L0601A0D8,r10
	add	r10,r0
	cmp/ge	r8,r0
	bf	.L0601A0C6
	mov	r8,r0
.L0601A0C6:
	mov.l	r0,@(0,r1)
	mov.w	@(22,r1),r0
	add	#8,r0
	mov.w	.L0601A0DA,r8
	cmp/gt	r8,r0
	bf	.L0601A0D4
	mov	r8,r0
.L0601A0D4:
	bra	.L0601A0EA
	mov.w	r0,@(22,r1)
.L0601A0D8:
	.short 0x00C8
.L0601A0DA:
	.short 0x0180
.L0601A0DC:
	mov.w	@(22,r1),r0
	add	#-2,r0
	mov.w	.L0601A104,r8
	cmp/ge	r8,r0
	bt	.L0601A0E8
	mov	r8,r0
.L0601A0E8:
	mov.w	r0,@(22,r1)
.L0601A0EA:
	mov.l	@(0,r1),r0
	mov.l	.L0601A108,r14
	jsr	@r14
	mov	r0,r4
	mov	#6,r14
	bsr	spr_build_number
	nop
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0601A10C
	lds.l	@r15+,pr
	rts
	nop
.L0601A104:
	.short 0x0100
	.byte 0x00, 0x00
.L0601A108:
	.long math_bin_to_bcd
.L0601A10C:
	lds.l	@r15+,pr
	mov.l	.L0601A114,r0
	jmp	@r0
	nop
.L0601A114:
	.long spr_draw_obj
	endlabel func_0601A07C

	.section .data.0601A118,"aw",@progbits
	.p2align 2
	dlabel D_0601A118
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_0601A194
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_0601A210
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_0601A214
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC3, 0x50, 0x00, 0x00, 0xAF, 0xC8, 0x00, 0x00, 0x9C, 0x40
	.byte 0x00, 0x00, 0x88, 0xB8, 0x00, 0x00, 0x75, 0x30, 0x00, 0x00, 0x61, 0xA8, 0x00, 0x00, 0x4E, 0x20
	.byte 0x00, 0x00, 0x44, 0x5C, 0x00, 0x00, 0x3A, 0x98, 0x00, 0x00, 0x30, 0xD4, 0x00, 0x00, 0x27, 0x10
	.byte 0x00, 0x00, 0x1D, 0x4C, 0x00, 0x00, 0x13, 0x88, 0x00, 0x00, 0x09, 0xC4, 0x00, 0x00, 0x00, 0x00
	.byte 0x53, 0x54, 0x00, 0x4E, 0x44, 0x00, 0x52, 0x44, 0x00, 0x54, 0x48, 0x00
	dlabel D_0601A260
	.byte 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A
	dlabel D_0601A270
	.byte 0x00, 0x04, 0x02, 0x07, 0x04, 0x0B, 0x07, 0x0E, 0x0B, 0x13
	dlabel D_0601A27A
	.byte 0x20, 0x60
