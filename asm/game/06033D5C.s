	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06033D5C,"ax",@progbits
	.p2align 2

	glabel func_06033D5C
	sts.l	pr,@-r15
	mov.w	@(4,r1),r0
	add	#1,r0
	mov.w	r0,@(4,r1)
	and	#6,r0
	mov	r0,r5
	cmp/eq	#4,r0
	bt	.L06033E36
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06033E36
	mov.w	@(4,r1),r0
	and	#24,r0
	cmp/eq	#0,r0
	bt	.L06033DB4
	cmp/eq	#8,r0
	bt	.L06033DA4
	cmp/eq	#16,r0
	bt	.L06033D94
	mov.l	.L06033D8C,r2
	mov.l	.L06033D90,r3
	bra	.L06033DB8
	nop
	.byte 0x00, 0x00
.L06033D8C:
	.long D_06084CC8
.L06033D90:
	.long D_06084A34
.L06033D94:
	mov.l	.L06033D9C,r2
	mov.l	.L06033DA0,r3
	bra	.L06033DB8
	nop
.L06033D9C:
	.long D_06084F5C
.L06033DA0:
	.long D_06084CC8
.L06033DA4:
	mov.l	.L06033DAC,r2
	mov.l	.L06033DB0,r3
	bra	.L06033DB8
	nop
.L06033DAC:
	.long D_06084CC8
.L06033DB0:
	.long D_06084F5C
.L06033DB4:
	mov.l	.L06033EA8,r2
	mov.l	.L06033EAC,r3
.L06033DB8:
	mov.l	.L06033EB0,r0
	mov.l	.L06033EB4,r10
	jsr	@r0
	mov	#2,r4
	mov.l	.L06033EB8,r0
	mov.l	r0,@(112,gbr)
	mov.l	@(564,gbr),r0
	mov	#2,r4
	mov	r0,r5
	mov.l	@(568,gbr),r0
	shll16	r4
	mov	r0,r6
	mov.l	@(572,gbr),r0
	mov.l	.L06033EBC,r14
	mov	r0,r7
	mov.l	@(112,gbr),r0
	jsr	@r14
	mov	r0,r8
	mov.l	.L06033EC0,r0
	mov.l	r0,@(112,gbr)
	mov.l	.L06033EC4,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	.L06033EC8,r0
	mov.l	@(52,r1),r5
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov.w	.L06033EA0,r2
	mov.l	.L06033ECC,r14
	add	r2,r0
	jsr	@r14
	mov.w	r0,@(24,r1)
	mov.w	@(26,r1),r0
	mov.w	.L06033EA2,r2
	mov.l	.L06033ED0,r14
	add	r2,r0
	jsr	@r14
	mov.w	r0,@(26,r1)
	mov.w	@(22,r1),r0
	mov.w	.L06033EA4,r2
	mov.l	.L06033ED4,r14
	add	r2,r0
	jsr	@r14
	mov.w	r0,@(22,r1)
	mov	#2,r4
	shll16	r4
	mov.l	.L06033ED8,r2
	mov	r4,r5
	jsr	@r2
	mov	r5,r6
	mov.l	.L06033EDC,r0
	mov.l	.L06033EB4,r2
	jsr	@r0
	nop
	mov.l	.L06033EE0,r0
	mov.l	.L06033EB4,r2
	jsr	@r0
	nop
	mov.l	.L06033EE4,r0
	jsr	@r0
	nop
.L06033E36:
	mov.l	@(544,gbr),r0
	mov.l	@(48,r1),r2
	jsr	@r0
	mov.l	@(56,r1),r3
	mov.w	.L06033EA6,r2
	mov.l	@(52,r1),r3
	shll16	r2
	sub	r2,r5
	cmp/ge	r3,r5
	bt	.L06033E52
	mov	#4,r4
	shll16	r4
	sub	r4,r3
	mov.l	r3,@(52,r1)
.L06033E52:
	mov.b	@(33,gbr),r0
	tst	r0,r0
	bt	.L06033E98
	cmp/eq	#1,r0
	bf	.L06033EF8
	add	#1,r0
	mov.b	r0,@(33,gbr)
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#51,r6
	mov.l	.L06033EE8,r0
	jsr	@r0
	mov	#4,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L06033EEC,r0
	mov.l	.L06033EF0,r2
	jsr	@r0
	nop
	mov.l	.L06033EF4,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r2
	mov.l	@(56,r1),r0
	mov.l	r4,@(48,r3)
	mov.l	r2,@(52,r3)
	mov.l	r0,@(56,r3)
.L06033E98:
	lds.l	@r15+,pr
	add	#1,r0
	rts
	mov.w	r0,@(0,r1)
.L06033EA0:
	.short 0x0040
.L06033EA2:
	.short 0x0050
.L06033EA4:
	.short 0x0010
.L06033EA6:
	.short 0x0080
.L06033EA8:
	.long D_06084A34
.L06033EAC:
	.long D_06084CC8
.L06033EB0:
	.long func_06034210
.L06033EB4:
	.long D_06085298
.L06033EB8:
	.long D_060342CA
.L06033EBC:
	.long func_0600CC8E
.L06033EC0:
	.long VDP1_VRAM + 0xC870
.L06033EC4:
	.long func_0600CA24
.L06033EC8:
	.long func_0600CBDA
.L06033ECC:
	.long func_0600CAF8
.L06033ED0:
	.long func_0600CB68
.L06033ED4:
	.long func_0600CA7A
.L06033ED8:
	.long func_0600D018
.L06033EDC:
	.long func_0600CF6C
.L06033EE0:
	.long func_0601F434
.L06033EE4:
	.long func_0600CA4E
.L06033EE8:
	.long func_0600E4C4
.L06033EEC:
	.long func_0600D0D0
.L06033EF0:
	.long D_060FFFA8
.L06033EF4:
	.long func_06033EFE
.L06033EF8:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06033D5C

	glabel func_06033EFE
	sts.l	pr,@-r15
	mov.l	.L06033F30,r0
	mov.l	.L06033F34,r2
	jsr	@r0
	nop
	mov.l	.L06033F38,r2
	mov.l	r2,@(12,r3)
	add	#16,r3
	mov.l	r3,@(40,r1)
	mov.l	@(48,r1),r0
	mov.l	@(52,r1),r2
	mov.l	@(56,r1),r4
	mov.l	r0,@(48,r3)
	mov.l	r2,@(52,r3)
	mov.l	r4,@(56,r3)
	mov.w	.L06033F2E,r0
	mov.w	r0,@(28,r1)
	mov	#0,r0
	mov.w	r0,@(4,r1)
	mov.l	.L06033F3C,r0
	lds.l	@r15+,pr
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06033F2E:
	.short 0x1A3E
.L06033F30:
	.long func_0600D0D0
.L06033F34:
	.long D_060FFFA8
.L06033F38:
	.long func_06033F40
.L06033F3C:
	.long func_060340C4
	endlabel func_06033EFE

	glabel func_06033F40
	mov	#0,r0
	mov.l	r0,@(32,r1)
	mov.w	r0,@(4,r1)
	mov.w	.L06033F52,r0
	mov.w	r0,@(28,r1)
	mov.l	.L06033F54,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06033F52:
	.short 0x193E
.L06033F54:
	.long func_06033F58
	endlabel func_06033F40

	glabel func_06033F58
	sts.l	pr,@-r15
	mov	#30,r2
	mov.l	@(32,r1),r0
	shll16	r2
	cmp/gt	r2,r0
	bf	.L06033F66
	mov	r2,r0
.L06033F66:
	mov.l	.L06033FB0,r2
	add	r2,r0
	mov.l	r0,@(32,r1)
	mov.w	@(4,r1),r0
	cmp/eq	#0,r0
	bt	.L06033FC0
	add	#1,r0
	mov.w	.L06033FAE,r2
	mov.w	r0,@(4,r1)
	cmp/hi	r2,r0
	bf	.L06033FDA
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	.L06033FB4,r0
	jsr	@r0
	mov	#4,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.b	@(20,gbr),r0
	cmp/eq	#13,r0
	bt	.L06033FA0
	cmp/eq	#15,r0
	bt	.L06033FA0
	mov	#0,r0
	mov.b	r0,@(21,gbr)
	mov	#13,r0
	mov.b	r0,@(0,gbr)
.L06033FA0:
	mov.l	.L06033FB8,r2
	mov	#-1,r0
	mov.w	r0,@r2
	mov.b	r0,@(107,gbr)
	mov.l	.L06033FBC,r0
	jmp	@r0
	lds.l	@r15+,pr
.L06033FAE:
	.short 0x0081
.L06033FB0:
	.long 0x00002000
.L06033FB4:
	.long func_0600E4F6
.L06033FB8:
	.long D_060D9074
.L06033FBC:
	.long func_0600D1A0
.L06033FC0:
	mov	#14,r2
	mov.l	@(32,r1),r0
	shll16	r2
	cmp/eq	r2,r0
	bf	.L06033FDA
	mov.l	.L06033FE8,r2
	mov.l	.L06033FEC,r0
	jsr	@r0
	nop
	mov.l	.L06033FF0,r0
	mov.l	r0,@(12,r3)
	mov	#1,r0
	mov.w	r0,@(4,r1)
.L06033FDA:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06033FF4
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06033FE8:
	.long D_060FFFA8
.L06033FEC:
	.long func_0600D0D0
.L06033FF0:
	.long func_06033054
.L06033FF4:
	mov.l	@(544,gbr),r0
	mov.l	@(56,r1),r3
	jsr	@r0
	mov.l	@(48,r1),r2
	mov.l	@(52,r1),r0
	sub	r0,r5
	mov.l	@(32,r1),r2
	mov	#-128,r13
	swap.w	r5,r3
	shll	r13
	exts.w	r3,r3
	mov.l	r2,@(0,r13)
	shll16	r5
	mov.l	r3,@(16,r13)
	mov.l	r5,@(20,r13)
	mov.l	@(52,r1),r0
	sub	r0,r4
	mov.l	@(32,r1),r0
	swap.w	r4,r3
	exts.w	r3,r3
	shll16	r4
	mov.l	@(28,r13),r2
	mov.l	r0,@(0,r13)
	mov.l	r3,@(16,r13)
	mov.l	r4,@(20,r13)
	mov.l	.L06034090,r3
	mov.l	.L06034094,r10
	mov.l	.L06034098,r0
	mov.l	@(28,r13),r4
	jsr	@r0
	nop
	mov.w	@(24,r1),r0
	mov.w	.L0603408E,r2
	sub	r2,r0
	mov.w	r0,@(24,r1)
	mov.l	.L0603409C,r0
	mov.l	r0,@(112,gbr)
	mov.l	@(564,gbr),r0
	mov.l	@(32,r1),r4
	mov	r0,r5
	mov.l	@(568,gbr),r0
	mov	r0,r6
	mov.l	@(572,gbr),r0
	mov.l	.L060340A0,r14
	mov	r0,r7
	mov.l	@(112,gbr),r0
	jsr	@r14
	mov	r0,r8
	mov.l	.L060340A4,r0
	mov.l	r0,@(112,gbr)
	mov.l	.L060340A8,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	.L060340AC,r0
	mov.l	@(52,r1),r5
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L060340B0,r14
	jsr	@r14
	mov.w	@(24,r1),r0
	mov.l	@(32,r1),r4
	mov.l	.L060340B4,r2
	mov	r4,r5
	jsr	@r2
	mov	r4,r6
	mov.l	.L060340B8,r0
	mov.l	.L06034094,r2
	jsr	@r0
	nop
	mov.l	.L060340BC,r0
	mov.l	.L06034094,r2
	jsr	@r0
	nop
	mov.l	.L060340C0,r0
	jmp	@r0
	lds.l	@r15+,pr
.L0603408E:
	.short 0x0080
.L06034090:
	.long D_06083A20
.L06034094:
	.long D_06083A38
.L06034098:
	.long func_060342A2
.L0603409C:
	.long D_060343CA
.L060340A0:
	.long func_0600CC8E
.L060340A4:
	.long VDP1_VRAM + 0xC9F0
.L060340A8:
	.long func_0600CA24
.L060340AC:
	.long func_0600CBDA
.L060340B0:
	.long func_0600CAF8
.L060340B4:
	.long func_0600D018
.L060340B8:
	.long func_0600CF6C
.L060340BC:
	.long func_0601F434
.L060340C0:
	.long func_0600CA4E
	endlabel func_06033F58

	glabel func_060340C4
	sts.l	pr,@-r15
	mov.l	@(40,r1),r3
	mov.l	@(48,r3),r0
	mov.l	@(52,r3),r2
	mov.l	@(56,r3),r4
	mov.l	r0,@(48,r1)
	mov.l	r2,@(52,r1)
	mov.l	@(32,r3),r0
	mov.l	r4,@(56,r1)
	mov.l	r0,@(32,r1)
	mov.w	@(24,r1),r0
	mov.w	.L060340F8,r2
	add	r2,r0
	mov.w	r0,@(24,r1)
	mov	#-1,r0
	extu.w	r0,r0
	shlr	r0
	mov.w	r0,@(26,r1)
	mov	#0,r0
	mov.w	r0,@(22,r1)
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L060340FA
	lds.l	@r15+,pr
	rts
	nop
.L060340F8:
	.short 0x0200
.L060340FA:
	mov.l	@(544,gbr),r0
	mov.l	@(56,r1),r3
	jsr	@r0
	mov.l	@(48,r1),r2
	mov.l	@(52,r1),r0
	mov.l	r5,@(52,r1)
	sub	r0,r5
	dmuls.l	r5,r5
	sts	mach,r5
	mov	#52,r0
	shll16	r0
	mov.l	@(32,r1),r2
	dmuls.l	r0,r2
	sts	mach,r0
	dmuls.l	r0,r0
	mov.l	.L0603419C,r9
	sts	macl,r0
	jsr	@r9
	sub	r5,r0
	mov.l	.L060341A0,r11
	mov	#-128,r13
	shll	r13
	mov.l	r11,@(0,r13)
	mov	#0,r3
	mov.l	r0,@(16,r13)
	mov.l	r3,@(20,r13)
	mov.l	.L060341A4,r0
	mov.l	r0,@(112,gbr)
	mov.l	@(564,gbr),r0
	mov.l	@(32,r1),r4
	mov	r0,r5
	mov.l	@(568,gbr),r0
	mov.l	.L060341A8,r14
	mov	r0,r6
	mov.l	@(572,gbr),r0
	mov.l	@(28,r13),r13
	mov	r0,r7
	mov.l	r13,@(32,r1)
	mov.l	@(112,gbr),r0
	jsr	@r14
	mov	r0,r8
	mov.l	.L060341AC,r0
	mov.l	r0,@(112,gbr)
	mov.l	.L060341B0,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	.L060341B4,r0
	mov.l	@(52,r1),r5
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L060341B8,r14
	jsr	@r14
	mov.w	@(24,r1),r0
	mov.l	.L060341BC,r14
	jsr	@r14
	mov.w	@(26,r1),r0
	mov.l	.L060341C0,r14
	jsr	@r14
	mov.w	@(22,r1),r0
	mov.l	@(32,r1),r4
	mov.l	.L060341C4,r2
	mov	r4,r5
	jsr	@r2
	mov	r4,r6
	mov.w	@(4,r1),r0
	add	#1,r0
	mov.w	r0,@(4,r1)
	shlr	r0
	and	#7,r0
	mov	r0,r5
	mov.w	@(4,r1),r0
	shlr	r0
	and	#8,r0
	cmp/eq	#0,r0
	bt	.L060341D0
	mov.l	.L060341C8,r2
	mov.l	.L060341CC,r3
	bra	.L060341D4
	nop
	.byte 0x00, 0x00
.L0603419C:
	.long func_06007CF0
.L060341A0:
	.long 0x00221000
.L060341A4:
	.long D_0603434A
.L060341A8:
	.long func_0600CC8E
.L060341AC:
	.long VDP1_VRAM + 0xD1F0
.L060341B0:
	.long func_0600CA24
.L060341B4:
	.long func_0600CBDA
.L060341B8:
	.long func_0600CAF8
.L060341BC:
	.long func_0600CB68
.L060341C0:
	.long func_0600CA7A
.L060341C4:
	.long func_0600D018
.L060341C8:
	.long D_0608411C
.L060341CC:
	.long D_06084320
.L060341D0:
	mov.l	.L060341F4,r2
	mov.l	.L060341F8,r3
.L060341D4:
	mov.l	.L060341FC,r0
	mov.l	.L06034200,r10
	jsr	@r0
	mov	#3,r4
	mov.l	.L06034204,r0
	mov.l	.L06034200,r2
	jsr	@r0
	nop
	mov.l	.L06034208,r0
	mov.l	.L06034200,r2
	jsr	@r0
	nop
	mov.l	.L0603420C,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L060341F4:
	.long D_06084320
.L060341F8:
	.long D_0608411C
.L060341FC:
	.long func_06034210
.L06034200:
	.long D_060852B0
.L06034204:
	.long func_0600CF6C
.L06034208:
	.long func_0601F434
.L0603420C:
	.long func_0600CA4E
	endlabel func_060340C4

	glabel func_06034210
	mov.l	@r2+,r6
	mov.l	@r3,r7
	mov.l	@r10,r3
	mov.l	@r2+,r8
	mov	#3,r0
	mulu.w	r0,r8
	mov.l	.L0603422C,r0
	shll	r4
	sts	macl,r8
	mov.w	@(r0,r4),r4
	add	r4,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0603422C:
	.long func_06034230
	endlabel func_06034210

	glabel func_06034230
	mov.b	@(r0,r0),r0
	mov.b	@(r0,r0),r0
	stc	vbr,r0
	mov.l	@(r0,r3),r0
	mov.l	r4,@(r0,r0)
	mov.l	@(r0,r4),r0
.L0603423C:
	mov.l	@r6+,r2
	mov.l	@r7+,r0
	sub	r2,r0
	shar	r0
	add	r0,r2
	mov.l	r2,@r3
	dt	r8
	bf/s	.L0603423C
	add	#4,r3
	rts
	nop
	.byte 0x62, 0x66
	endlabel func_06034230

	.section .data.06034254,"aw",@progbits
	.p2align 2
	.byte 0x60, 0x76, 0x30, 0x28, 0x00, 0x57, 0x00, 0x1A, 0x40, 0x21, 0x40, 0x21, 0x32, 0x0C, 0x23, 0x22
	.byte 0x48, 0x10, 0x8F, 0xF4, 0x73, 0x04, 0x00, 0x0B, 0x00, 0x09, 0x45, 0x28, 0x45, 0x01, 0xA0, 0x08
	.byte 0x45, 0x09, 0x45, 0x28, 0x45, 0x09, 0xA0, 0x04, 0x45, 0x09, 0x45, 0x18, 0x45, 0x08, 0xA0, 0x00
	.byte 0x45, 0x01, 0x62, 0x66, 0x60, 0x76, 0x30, 0x28, 0x30, 0x5D, 0x00, 0x1A, 0x04, 0x0A, 0x20, 0x4D
	.byte 0x32, 0x0C, 0x23, 0x22, 0x48, 0x10, 0x8F, 0xF4, 0x73, 0x04, 0x00, 0x0B
