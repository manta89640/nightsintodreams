	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0602AFD4,"ax",@progbits
	.p2align 2

	glabel func_0602AFD4
	mov.l	.L0602AFFC,r3
	mov.b	@(9,r12),r0
	mov	r0,r2
	cmp/pz	r0
	bf	.L0602B000
	or	#128,r0
	mov.b	r0,@(9,r12)
	mov	#0,r0
	mov.b	r0,@(10,r12)
	mov	r2,r0
	shll2	r0
	shll	r0
	add	r3,r0
	mov.l	@r0+,r2
	mov.b	@r0+,r8
	tst	r8,r8
	bt	.L0602B03E
	bra	.L0602B0A2
	nop
	.byte 0x00, 0x00
.L0602AFFC:
	.long D_0602AF64
.L0602B000:
	mov.b	@(10,r12),r0
	tst	r0,r0
	bf	.L0602B054
	mov	r2,r0
	and	#127,r0
	shll2	r0
	shll	r0
	add	r3,r0
	mov.l	@r0+,r2
	mov.b	@r0+,r8
	mov.b	@r0+,r9
	mov.b	@r0+,r10
	mov.b	@r0+,r11
	mov	#4,r0
	cmp/eq	r0,r9
	bf	.L0602B03E
	mov	r10,r0
	or	#128,r0
	mov.b	r0,@(9,r12)
	mov	#0,r0
	mov.b	r0,@(10,r12)
	tst	r11,r11
	bt	.L0602B03E
	mov	r10,r0
	shll2	r0
	shll	r0
	add	r3,r0
	mov.l	@r0+,r2
	mov	r11,r8
	bra	.L0602B0A2
	nop
.L0602B03E:
	mov.l	.L0602B050,r3
	mov	#15,r7
.L0602B042:
	mov.l	@r2+,r0
	mov.l	r0,@r3
	dt	r7
	bf/s	.L0602B042
	add	#4,r3
	rts
	nop
.L0602B050:
	.long D_06026B00
.L0602B054:
	mov.b	@(10,r12),r0
	dt	r0
	mov.b	r0,@(10,r12)
	mov.l	.L0602B084,r5
	mov.l	.L0602B088,r6
	mov.l	.L0602B08C,r9
	mov	#15,r8
.L0602B062:
	mov.l	@r9,r7
	mov	r7,r0
	add	r7,r7
	add	r0,r7
.L0602B06A:
	mov.l	@r5,r0
	mov.l	@r6+,r2
	add	r2,r0
	mov.l	r0,@r5
	dt	r7
	bf/s	.L0602B06A
	add	#4,r5
	dt	r8
	bf/s	.L0602B062
	add	#24,r9
	rts
	nop
	.byte 0x00, 0x00
.L0602B084:
	.long D_06026CA4
.L0602B088:
	.long D_06027AB4
.L0602B08C:
	.long D_06026B40
	endlabel func_0602AFD4

	glabel func_0602B090
	mov.l	.L0602B128,r3
	mov	r0,r2
	or	#128,r0
	mov.b	r0,@(9,r12)
	mov	r2,r0
	shll2	r0
	shll	r0
	add	r3,r0
	mov.l	@r0+,r2
.L0602B0A2:
	mov	r8,r0
	add	#-2,r0
	mov.b	r0,@(10,r12)
	endlabel func_0602B090

	glabel func_0602B0A8
	mov.w	@(6,r1),r0
	shlr2	r0
	shlr2	r0
	and	#7,r0
	cmp/eq	#0,r0
	bf	.L0602B0DA
	mov.l	r2,@-r15
	mov.l	.L0602B12C,r14
	mov	#15,r10
.L0602B0BA:
	mov.l	@r14+,r11
	mov.l	@r2+,r4
	add	#8,r11
	add	#8,r4
	mov.l	@r4,r0
	tst	r0,r0
	bf	.L0602B0D8
	mov.l	@r11,r0
	mov.l	r0,@r4
	add	#8,r11
	add	#8,r4
	mov.l	@r11,r0
	mov.l	r0,@r4
	dt	r10
	bf	.L0602B0BA
.L0602B0D8:
	mov.l	@r15+,r2
.L0602B0DA:
	mov.l	.L0602B130,r11
	mov.l	.L0602B134,r3
	mov.l	.L0602B138,r5
	mov.l	.L0602B13C,r6
	mov	r8,r0
	mov.l	.L0602B140,r8
.L0602B0E6:
	shlr	r0
	bf/s	.L0602B0E6
	add	#-2,r8
	mov	#15,r10
.L0602B0EE:
	mov.l	@r2+,r4
	mov.l	r3,@r11
	add	#4,r11
	mov.l	@r4+,r9
	mov.l	r5,@r3
	add	#4,r3
	mov.l	@r4+,r7
	mov.l	r7,@r3
	mov	r7,r0
	add	r7,r7
	add	r0,r7
	add	#4,r3
	mov.l	@r4+,r0
	mov.l	r0,@r3
	add	#4,r3
	mov.l	@r4+,r0
	mov.l	r0,@r3
	add	#4,r3
	mov.l	@r4+,r0
	mov.l	r0,@r3
	add	#4,r3
	mov.l	@r4+,r0
	mov.l	r0,@r3
	add	#4,r3
.L0602B11E:
	mov.l	@r9+,r0
	mov.l	@r5,r4
	jmp	@r8
	sub	r4,r0
	.byte 0x00, 0x00
.L0602B128:
	.long D_0602AF64
.L0602B12C:
	.long D_06055BCC
.L0602B130:
	.long D_06026B00
.L0602B134:
	.long D_06026B3C
.L0602B138:
	.long D_06026CA4
.L0602B13C:
	.long D_06027AB4
.L0602B140:
	.long func_0602B154
	.byte 0x40, 0x21, 0x40, 0x21, 0x40, 0x21, 0x40, 0x21, 0x40, 0x21, 0x40, 0x21, 0x40, 0x21, 0x34, 0x0C
	endlabel func_0602B0A8

	glabel func_0602B154
	mov.l	r4,@r5
	add	#4,r5
	mov.l	r0,@r6
	dt	r7
	bf/s	.L0602B11E
	add	#4,r6
	dt	r10
	bf	.L0602B0EE
	rts
	nop
	endlabel func_0602B154

	glabel func_0602B168
	mov.b	@(7,r1),r0
	tst	#1,r0
	bf	.L0602B1C2
	mov.b	@(20,gbr),r0
	cmp/eq	#13,r0
	bt	.L0602B1C2
	cmp/eq	#15,r0
	bt	.L0602B1C2
	mov.b	@(10,r12),r0
	tst	r0,r0
	bf	.L0602B1C2
	mov.l	.L0602B1A0,r4
	mov.l	.L0602B1A4,r5
	mov.l	.L0602B1A8,r6
	mov.b	@(7,r12),r0
	and	#2,r0
	tst	r0,r0
	bf	.L0602B1AC
.L0602B18C:
	mov.w	@r6+,r7
	cmp/pz	r7
	bf	.L0602B1C2
	add	r4,r7
	mov.w	@r6+,r3
	add	r5,r3
	mov.w	@r3,r0
	mov.w	r0,@r7
	bra	.L0602B18C
	add	#2,r6
.L0602B1A0:
	.long D_060ECFF8
.L0602B1A4:
	.long D_060F0400
.L0602B1A8:
	.long D_0602B1EC
.L0602B1AC:
	mov.w	@r6+,r7
	cmp/pz	r7
	bf	.L0602B1C2
	add	r4,r7
	add	#2,r6
	mov.w	@r6+,r3
	add	r5,r3
	mov.w	@r3,r0
	mov.w	r0,@r7
	bra	.L0602B18C
	nop
.L0602B1C2:
	rts
	nop
	endlabel func_0602B168

	glabel func_0602B1C6
	mov.b	@(7,r1),r0
	tst	#1,r0
	bf	.L0602B1E8
	endlabel func_0602B1C6

	glabel func_0602B1CC
	mov.l	.L0602B1E0,r4
	mov.l	.L0602B1E4,r6
.L0602B1D0:
	mov.w	@r6,r7
	cmp/pz	r7
	bf	.L0602B1E8
	add	r4,r7
	mov.w	@(6,r7),r0
	mov.w	r0,@r7
	bra	.L0602B1D0
	add	#6,r6
.L0602B1E0:
	.long D_060ECFF8
.L0602B1E4:
	.long D_0602B1EC
.L0602B1E8:
	rts
	nop
	endlabel func_0602B1CC

	.section .data.0602B1EC,"aw",@progbits
	.p2align 2
	dlabel D_0602B1EC
	.byte 0x01, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x01, 0x90, 0x00, 0x02, 0x00, 0x04, 0x02, 0x00, 0x00, 0x16
	.byte 0x00, 0x18, 0x02, 0x10, 0x00, 0x1A, 0x00, 0x1C, 0x02, 0x08, 0x00, 0x1E, 0x00, 0x1E, 0x02, 0x20
	.byte 0x00, 0x20, 0x00, 0x20, 0x02, 0x28, 0x00, 0x22, 0x00, 0x24, 0x02, 0x30, 0x00, 0x26, 0x00, 0x28
