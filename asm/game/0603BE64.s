	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603BE64,"ax",@progbits
	.p2align 2
	.byte 0xD0, 0x05

	glabel func_0603BE66
	sts.l	pr,@-r15
	bsr	func_0603BE84
	mov.w	r0,@(28,r1)
	mov.l	.L0603BE80,r0
	lds.l	@r15+,pr
	mov.l	r0,@-r1
	rts
	add	#4,r1
	.byte 0x00, 0x00
	.long D_06080004
	.byte 0x04, 0xB8, 0xCF, 0x9F
.L0603BE80:
	.long func_0603BF98
	endlabel func_0603BE66

	glabel func_0603BE84
	sts.l	pr,@-r15
	mov.l	.L0603BE9C,r4
	mov.l	.L0603BEA0,r5
	mov.w	.L0603BE98,r6
	mov.l	.L0603BEA4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0603BE98:
	.short 0x0108
	.byte 0x00, 0x00
.L0603BE9C:
	.long D_06092E68
.L0603BEA0:
	.long VDP1_VRAM + 0x67CF8
.L0603BEA4:
	.long dma_queue_xfer
	endlabel func_0603BE84

	glabel func_0603BEA8
	sts.l	pr,@-r15
	mov.l	.L0603BEC0,r4
	mov.l	.L0603BEC4,r5
	mov.w	.L0603BEBC,r6
	mov.l	.L0603BEC8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0603BEBC:
	.short 0x0108
	.byte 0x00, 0x00
.L0603BEC0:
	.long D_06092D60
.L0603BEC4:
	.long VDP1_VRAM + 0x67CF8
.L0603BEC8:
	.long dma_queue_xfer
	endlabel func_0603BEA8

	glabel func_0603BECC
	mov.l	.L0603BEE0,r7
	mov.b	@(7,r1),r0
	mov	r0,r3
	mov.b	@(9,r7),r0
	mov.b	r0,@(7,r1)
	cmp/eq	r0,r3
	bf	.L0603BEE4
	rts
	nop
	.byte 0x00, 0x00
.L0603BEE0:
	.long play_state
.L0603BEE4:
	sts.l	pr,@-r15
	cmp/pz	r0
	bt	.L0603BEF8
	bsr	func_0603BEA8
	nop
	mov.l	.L0603BEF4,r2
	bra	.L0603BF00
	lds.l	@r15+,pr
.L0603BEF4:
	.long D_060918EC
.L0603BEF8:
	bsr	func_0603BE84
	nop
	mov.l	.L0603BF08,r2
	lds.l	@r15+,pr
.L0603BF00:
	mov.l	@(44,r1),r3
	mov.l	@r3,r3
	rts
	mov.l	r2,@(16,r3)
.L0603BF08:
	.long D_06091AFC
	dlabel D_0603BF0C
	.byte 0x0F, 0xFF, 0x08, 0xCB, 0x0B, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0xAB, 0x0A, 0x71, 0x06, 0x9D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1C, 0x05, 0x06, 0x6B, 0x04, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0D, 0xB5, 0x02, 0xCE, 0x0D, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0x54, 0x04, 0x09, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x18, 0x74, 0x07, 0xD5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x33, 0x24, 0x0F, 0x70, 0x26, 0x2A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x33, 0x24, 0x0F, 0x70, 0x26, 0x2A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_0603BF8C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	endlabel func_0603BECC

	glabel func_0603BF98
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	func_0603BFA2
	bra	.L0603BFBC
	nop
	endlabel func_0603BF98

	glabel func_0603BFA2
	sts.l	pr,@-r15
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0603BFB0
	lds.l	@r15+,pr
	rts
	nop
.L0603BFB0:
	mov.l	.L0603BFC0,r0
	mov.l	@r0,r6
	mov.b	@(6,r6),r0
	cmp/pl	r0
	bt	.L0603BFC4
	lds.l	@r15+,pr
.L0603BFBC:
	rts
	nop
.L0603BFC0:
	.long player_obj
.L0603BFC4:
	mov	#0,r0
	mov.b	r0,@(5,r1)
	mov.l	@(8,r6),r12
	mov.w	.L0603BFF4,r3
	mov.w	@(22,r12),r0
	cmp/eq	r3,r0
	bt	.L0603C0C2
	mov.w	.L0603BFF6,r3
	cmp/eq	r3,r0
	bt	.L0603C0C2
	mov.b	@(20,gbr),r0
	cmp/eq	#4,r0
	bf	.L0603C00C
	mov.l	.L0603BFF8,r4
	mov.l	@r4,r4
	mov.l	.L0603BFFC,r3
	mov.l	@(48,r4),r8
	cmp/ge	r3,r8
	bt	.L0603C00C
	mov.l	.L0603C000,r3
	mov.l	.L0603C004,r4
	mov.l	.L0603C008,r5
	bra	.L0603C074
	nop
.L0603BFF4:
	.short 0x004B
.L0603BFF6:
	.short 0x0049
.L0603BFF8:
	.long player_obj
.L0603BFFC:
	.long 0x0D000000
.L0603C000:
	.long 0x06C00000
.L0603C004:
	.long 0x03000000
.L0603C008:
	.long 0x0F000000
.L0603C00C:
	cmp/eq	#10,r0
	bf	.L0603C020
	mov.l	.L0603C01C,r3
	mov.l	@r3,r3
	tst	r3,r3
	bt	.L0603C020
	bra	.L0603BFBC
	lds.l	@r15+,pr
.L0603C01C:
	.long D_060BB7C8
.L0603C020:
	mov.l	.L0603C048,r7
	mov.b	@(9,r7),r0
	cmp/pz	r0
	bt	.L0603C05E
	mov.l	.L0603C048,r7
	mov.b	@(8,r7),r0
	mov	r0,r5
	mov.l	@(704,gbr),r0
	cmp/ge	r0,r5
	bt	.L0603C03C
	mov.l	.L0603C04C,r7
	mov.l	@r7+,r3
	cmp/pz	r3
	bt	.L0603C054
.L0603C03C:
	mov.l	.L0603C050,r5
	mov.l	@r5,r5
	mov.l	@(48,r5),r3
	mov.l	@(52,r5),r4
	bra	.L0603C074
	mov.l	@(56,r5),r5
.L0603C048:
	.long play_state
.L0603C04C:
	.long D_0603BF8C
.L0603C050:
	.long D_060F30F0
.L0603C054:
	mov.l	@r7+,r4
	mov.l	@r7,r5
	mov	#1,r0
	bra	.L0603C074
	mov.b	r0,@(5,r1)
.L0603C05E:
	mov.b	@(20,gbr),r0
	mov.l	.L0603C0AC,r2
	shll2	r0
	shll	r0
	add	r0,r2
	mov.w	@r2+,r3
	mov.w	@r2+,r4
	mov.w	@r2+,r5
	shll16	r3
	shll16	r4
	shll16	r5
.L0603C074:
	mov.l	@(48,r6),r7
	mov.l	@(52,r6),r8
	mov.l	@(56,r6),r9
	sub	r3,r7
	sub	r4,r8
	sub	r5,r9
	dmuls.l	r7,r7
	sts	mach,r7
	dmuls.l	r8,r8
	sts	mach,r8
	dmuls.l	r9,r9
	sts	mach,r9
	add	r7,r8
	add	r9,r8
	mov.l	.L0603C0B0,r7
	mov.b	@(9,r7),r0
	cmp/pz	r0
	bt	.L0603C0BC
	mov.l	.L0603C0B4,r0
	cmp/gt	r8,r0
	bt	.L0603C0C2
	mov.l	.L0603C0B8,r0
	cmp/gt	r0,r8
	bt	.L0603C0BC
	mov	#1,r0
	bra	.L0603C0D0
	mov.b	r0,@(5,r1)
	.byte 0x00, 0x00
.L0603C0AC:
	.long D_0603BF0C
.L0603C0B0:
	.long play_state
.L0603C0B4:
	.long 0x00001000
.L0603C0B8:
	.long 0x00010000
.L0603C0BC:
	mov.l	.L0603C0CC,r0
	cmp/gt	r0,r8
	bt	.L0603C0D0
.L0603C0C2:
	mov	#0,r0
	mov.b	r0,@(5,r1)
	lds.l	@r15+,pr
	rts
	nop
.L0603C0CC:
	.long 0x00000000
.L0603C0D0:
	mov.l	.L0603C124,r2
	mov.l	@(48,r6),r7
	mov.l	@(52,r6),r8
	jsr	@r2
	mov.l	@(56,r6),r9
	sub	r0,r7
	mov.l	r7,@(60,r1)
	mov.l	r6,@-r15
	dmuls.l	r3,r3
	sts	mach,r0
	sts	macl,r6
	dmuls.l	r5,r5
	xtrct	r0,r6
	sts	mach,r0
	sts	macl,r7
	xtrct	r0,r7
	mov.l	.L0603C128,r9
	add	r6,r7
	jsr	@r9
	mov	r7,r0
	shll8	r0
	mov	r0,r6
	mov.l	.L0603C12C,r0
	mov	r3,r2
	neg	r2,r2
	jsr	@r0
	mov	r5,r3
	mov	r0,r9
	mov.l	.L0603C130,r12
	mov	#24,r0
	mov.w	.L0603C120,r10
	jsr	@r12
	mov.w	@(r0,r1),r8
	mov	r8,r0
	mov.w	r0,@(24,r1)
	mov.b	@(5,r1),r0
	cmp/pl	r0
	bt	.L0603C134
	bra	.L0603C14C
	mov	#0,r0
.L0603C120:
	.short 0x0400
	.byte 0x00, 0x00
.L0603C124:
	.long func_060349D0
.L0603C128:
	.long math_sqrt
.L0603C12C:
	.long math_atan2
.L0603C130:
	.long math_angle_step_toward
.L0603C134:
	mov.l	.L0603C1DC,r0
	mov	r6,r2
	mov	r4,r3
	jsr	@r0
	neg	r3,r3
	mov	r0,r9
	mov.w	.L0603C1D6,r10
	mov	#26,r0
	jsr	@r12
	mov.w	@(r0,r1),r8
	mov.w	.L0603C1D6,r11
	mov	r8,r0
.L0603C14C:
	mov.w	r0,@(26,r1)
	mov.l	@r15+,r6
	mov.l	@(60,r1),r2
	shlr2	r2
	mov	#64,r3
	shlr2	r2
	cmp/gt	r3,r2
	bf	.L0603C15E
	mov	r3,r2
.L0603C15E:
	mov.l	.L0603C1E0,r10
	jsr	@r10
	nop
	shll2	r10
	dmuls.l	r10,r2
	mov.l	@(52,r6),r8
	sts	macl,r10
	neg	r10,r10
	add	r10,r8
	mov.l	r8,@(52,r1)
	mov.l	.L0603C1E4,r10
	jsr	@r10
	mov.w	@(24,r1),r0
	shll2	r10
	shll2	r11
	dmuls.l	r10,r2
	mov.l	@(56,r6),r7
	sts	macl,r10
	dmuls.l	r11,r2
	add	r10,r7
	mov.l	r7,@(56,r1)
	mov.l	@(48,r6),r9
	sts	macl,r11
	neg	r11,r11
	add	r11,r9
	mov.l	r9,@(48,r1)
	mov.w	.L0603C1D8,r0
	mov.w	r0,@(22,r1)
	mov.l	.L0603C1E8,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0603C1EC,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L0603C1F0,r14
	jsr	@r14
	mov.w	@(24,r1),r0
	mov.l	.L0603C1F4,r14
	jsr	@r14
	mov.w	@(26,r1),r0
	mov.l	.L0603C1F8,r14
	jsr	@r14
	mov.w	@(22,r1),r0
	bsr	func_0603C24C
	nop
	bsr	func_0603C2B0
	nop
	bsr	func_0603C2F4
	nop
	bsr	func_0603BECC
	nop
	mov.l	.L0603C1FC,r0
	mov.l	@(44,r1),r2
	jsr	@r0
	mov.l	@r2,r2
	mov.l	.L0603C200,r0
	jmp	@r0
	lds.l	@r15+,pr
.L0603C1D6:
	.short 0x0400
.L0603C1D8:
	.short 0x8000
	.byte 0x00, 0x00
.L0603C1DC:
	.long math_atan2
.L0603C1E0:
	.long math_sin
.L0603C1E4:
	.long math_sincos
.L0603C1E8:
	.long mtx_push
.L0603C1EC:
	.long mtx_translate
.L0603C1F0:
	.long mtx_rot_y
.L0603C1F4:
	.long mtx_rot_z
.L0603C1F8:
	.long mtx_rot_x
.L0603C1FC:
	.long poly_draw_model
.L0603C200:
	.long mtx_pop
	dlabel D_0603C204
	.byte 0x00, 0x06, 0x00, 0x18, 0x00, 0x2A, 0x00, 0x01, 0x00, 0x14, 0x00, 0x02, 0x00, 0x14, 0x00, 0x03
	.byte 0x00, 0x14, 0x00, 0x04, 0x00, 0x14, 0xFF, 0xFF, 0x00, 0x01, 0x00, 0x14, 0x00, 0x05, 0x00, 0x14
	.byte 0x00, 0x01, 0x00, 0x0A, 0x00, 0x06, 0x00, 0x0A, 0xFF, 0xFF, 0x00, 0x01, 0x00, 0x14, 0x00, 0x07
	.byte 0x00, 0x0A, 0x00, 0x08, 0x00, 0x0A, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x08, 0x00, 0x0A, 0x00, 0x09
	.byte 0x00, 0x14, 0x00, 0x0A, 0x00, 0x14, 0xFF, 0xFF
	endlabel func_0603BFA2

	glabel func_0603C24C
	mov	#64,r0
	mov.w	@(r0,r1),r4
	mov.w	.L0603C28A,r7
	cmp/ge	r7,r4
	bt	.L0603C258
	add	#1,r4
.L0603C258:
	mov.w	r4,@(r0,r1)
	mov.b	@(14,r1),r0
	cmp/eq	#0,r0
	bf	.L0603C2AC
	mov.b	@(15,r1),r0
	tst	#254,r0
	bf	.L0603C2AC
	mov.l	.L0603C290,r0
	mov.l	@r0,r5
	mov.l	@(12,r5),r13
	mov.l	@(40,r13),r7
	tst	r7,r7
	bf	.L0603C2A0
	mov.b	@(6,r1),r0
	mov	#1,r4
	cmp/ge	r4,r0
	bf	.L0603C294
	mov	#64,r0
	mov.w	@(r0,r1),r4
	mov.w	.L0603C28C,r7
	cmp/ge	r7,r4
	bf	.L0603C29A
	mov	#2,r0
	rts
	mov.b	r0,@(6,r1)
.L0603C28A:
	.short 0x0168
.L0603C28C:
	.short 0x012C
	.byte 0x00, 0x00
.L0603C290:
	.long player_obj
.L0603C294:
	mov	#64,r0
	mov	#0,r4
	mov.w	r4,@(r0,r1)
.L0603C29A:
	mov	#1,r0
	rts
	mov.b	r0,@(6,r1)
.L0603C2A0:
	mov	#0,r0
	mov.b	r0,@(6,r1)
	mov	#64,r0
	mov	#0,r4
	rts
	mov.w	r4,@(r0,r1)
.L0603C2AC:
	rts
	nop
	endlabel func_0603C24C

	glabel func_0603C2B0
	mov.b	@(6,r1),r0
	mov.l	.L0603C2D0,r9
	shll	r0
	mov.w	@(r0,r9),r8
	mov.b	@(14,r1),r0
	add	r8,r9
	shll2	r0
	add	#2,r0
	mov.w	@(r0,r9),r5
	mov.b	@(15,r1),r0
	cmp/gt	r5,r0
	bf	.L0603C2D4
	mov	#0,r0
	bra	.L0603C2DA
	mov.b	r0,@(15,r1)
	.byte 0x00, 0x00
.L0603C2D0:
	.long D_0603C204
.L0603C2D4:
	add	#1,r0
	bra	.L0603C2E0
	mov.b	r0,@(15,r1)
.L0603C2DA:
	mov.b	@(14,r1),r0
	add	#1,r0
	mov.b	r0,@(14,r1)
.L0603C2E0:
	mov.b	@(14,r1),r0
	shll2	r0
	mov.w	@(r0,r9),r0
	cmp/pz	r0
	bt	.L0603C2F0
	mov	#0,r0
	mov.b	r0,@(14,r1)
	mov.w	@r9,r0
.L0603C2F0:
	rts
	mov.w	r0,@(20,r1)
	endlabel func_0603C2B0

	glabel func_0603C2F4
	sts.l	pr,@-r15
	mov	#15,r0
	mov.b	@(r0,r1),r6
	mov.b	@(6,r1),r0
	mov.l	.L0603C354,r9
	shll	r0
	mov.w	@(r0,r9),r8
	add	r8,r9
	mov.b	@(14,r1),r0
	shll2	r0
	add	#2,r0
	mov.w	@(r0,r9),r7
	mov	#0,r5
	shll16	r7
	mov	#-1,r14
	shll8	r14
	mov.l	r7,@(0,r14)
	mov.l	r6,@(16,r14)
	mov.l	r5,@(20,r14)
	mov.l	@(28,r14),r5
	mov.w	@(20,r1),r0
	mov.l	@(44,r1),r2
	shll2	r0
	add	r0,r2
	mov.l	@r2,r14
	mov.l	@r14,r2
	mov	#14,r0
	mov.b	@(r0,r1),r0
	add	#1,r0
	shll2	r0
	mov.w	@(r0,r9),r0
	cmp/pz	r0
	bt	.L0603C338
	mov.w	@r9,r0
.L0603C338:
	mov.l	@(44,r1),r3
	shll2	r0
	add	r0,r3
	mov.l	@r3,r3
	mov.l	@r3,r3
	mov.l	@(44,r1),r7
	mov.l	@r7,r7
	mov.l	.L0603C358,r0
	jsr	@r0
	mov.l	@r7,r4
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0603C354:
	.long D_0603C204
.L0603C358:
	.long func_06041C82
	endlabel func_0603C2F4

	glabel func_0603C35C
	sts.l	pr,@-r15
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#240,r0
	ldc	r0,sr
	mov.l	.L0603C414,r0
	jsr	@r0
	nop
	mov.l	.L0603C418,r0
	jsr	@r0
	nop
	mov.l	.L0603C41C,r0
	jsr	@r0
	nop
	mov.l	.L0603C420,r0
	jsr	@r0
	nop
	mov.l	.L0603C424,r0
	jsr	@r0
	nop
	mov.l	.L0603C428,r2
	mov.l	.L0603C42C,r3
	mov.w	.L0603C410,r7
.L0603C390:
	mov.w	@r3+,r0
	mov.w	r0,@r2
	dt	r7
	bf/s	.L0603C390
	add	#2,r2
	mov	#2,r4
	mov.l	.L0603C430,r0
	mov.b	@(r0,r4),r4
	mov.w	@(224,gbr),r0
	or	r4,r0
	mov.w	r0,@(224,gbr)
	mov	#4,r0
	mov.w	r0,@(256,gbr)
	mov.w	.L0603C412,r0
	mov.w	r0,@(500,gbr)
	mov.w	r0,@(502,gbr)
	mov.w	r0,@(504,gbr)
	mov.w	r0,@(506,gbr)
	mov.w	r0,@(508,gbr)
	mov.w	r0,@(510,gbr)
	mov	#0,r0
	mov.w	r0,@(498,gbr)
	mov.l	.L0603C434,r0
	jsr	@r0
	nop
	mov.l	.L0603C438,r2
	mov.l	.L0603C43C,r0
	jsr	@r0
	nop
	mov.l	.L0603C440,r0
	mov.l	r0,@(12,r3)
	mov.l	.L0603C438,r2
	mov.l	.L0603C43C,r0
	jsr	@r0
	nop
	mov.l	.L0603C444,r0
	mov.l	r0,@(12,r3)
	mov.l	.L0603C438,r2
	mov.l	.L0603C43C,r0
	jsr	@r0
	nop
	mov.l	.L0603C448,r0
	mov.l	r0,@(12,r3)
	mov.l	.L0603C438,r2
	mov.l	.L0603C43C,r0
	jsr	@r0
	nop
	mov.l	.L0603C44C,r0
	mov.l	r0,@(12,r3)
	mov	#5,r0
	mov.b	r0,@(0,gbr)
	mov.l	.L0603C450,r0
	jsr	@r0
	mov	#20,r4
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
.L0603C410:
	.short 0x0090
.L0603C412:
	.short 0x00FF
.L0603C414:
	.long func_0600454C
.L0603C418:
	.long snd_seq_stop_all
.L0603C41C:
	.long vdp1_cmdlist_begin
.L0603C420:
	.long vdp1_cmdlist_end
.L0603C424:
	.long obj_init
.L0603C428:
	.long vdp2_shadow
.L0603C42C:
	.long vdp2_shadow_defaults
.L0603C430:
	.long lbl_0602B7E4
.L0603C434:
	.long func_0602B960
.L0603C438:
	.long obj_list_stage
.L0603C43C:
	.long obj_alloc
.L0603C440:
	.long func_06046620
.L0603C444:
	.long func_06033CD6
.L0603C448:
	.long func_0603C454
.L0603C44C:
	.long func_06033034
.L0603C450:
	.long cd_play_track
	endlabel func_0603C35C

	glabel func_0603C454
	sts.l	pr,@-r15
	mov.w	.L0603C464,r0
	mov.w	r0,@(12,r1)
	mov.l	.L0603C468,r0
	lds.l	@r15+,pr
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L0603C464:
	.short 0x04B0
	.byte 0x00, 0x00
.L0603C468:
	.long func_0603C46C
	endlabel func_0603C454

	glabel func_0603C46C
	mov.w	@(78,gbr),r0
	tst	#240,r0
	bf	.L0603C47E
	mov.w	@(12,r1),r0
	add	#-1,r0
	cmp/pl	r0
	bf	.L0603C47E
	rts
	mov.w	r0,@(12,r1)
.L0603C47E:
	sts.l	pr,@-r15
	mov.l	.L0603C49C,r2
	mov.l	.L0603C4A0,r0
	jsr	@r0
	nop
	mov.l	.L0603C4A4,r0
	lds.l	@r15+,pr
	mov.l	r0,@(12,r3)
	mov.w	.L0603C49A,r0
	mov.w	r0,@(12,r1)
	mov.l	.L0603C4A8,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L0603C49A:
	.short 0x0080
.L0603C49C:
	.long obj_list_stage
.L0603C4A0:
	.long obj_alloc
.L0603C4A4:
	.long func_06032FB4
.L0603C4A8:
	.long func_0603C4AC
	endlabel func_0603C46C

	glabel func_0603C4AC
	mov.w	@(12,r1),r0
	add	#-1,r0
	cmp/pl	r0
	bt	.L0603C4BC
	mov	#11,r0
	mov.b	r0,@(0,gbr)
	rts
	nop
.L0603C4BC:
	mov.w	r0,@(12,r1)
	rts
	nop
	.byte 0x00, 0x00
	endlabel func_0603C4AC

	.section .data.0603C4C4,"aw",@progbits
	.p2align 2
	.byte 0x2F, 0x66, 0x2F, 0x56, 0x2F, 0x46, 0x2F, 0x06, 0x4F, 0x22, 0xE5, 0x01, 0xE6, 0x2F, 0xD0, 0x2B
	.byte 0x40, 0x0B, 0xE4, 0x03, 0x4F, 0x26, 0x60, 0xF6, 0x64, 0xF6, 0x65, 0xF6
