	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060289B0,"ax",@progbits
	.p2align 2

	glabel func_060289B0
	sts.l	pr,@-r15
	mov.l	.L06028C5C,r0
	jsr	@r0
	nop
	mov.l	@(16,r1),r2
	mov.l	@r2+,r7
	mov.l	@r2+,r8
	mov.l	@r2+,r9
	neg	r9,r9
	mov.w	@(22,r1),r0
	mov.l	.L06028C60,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r9
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	sub	r2,r3
	dmuls.l	r11,r9
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	add	r2,r9
	mov	r3,r7
	mov.w	@(26,r1),r0
	mov.l	.L06028C60,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r8
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	add	r4,r3
	dmuls.l	r11,r8
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	sub	r4,r8
	mov	r3,r7
	mov.w	@(24,r1),r0
	neg	r0,r0
	mov.l	.L06028C60,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r9
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	sub	r2,r3
	dmuls.l	r11,r9
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	add	r2,r9
	mov	r3,r7
	neg	r7,r4
	neg	r8,r5
	neg	r9,r6
	mov.l	.L06028C64,r0
	jsr	@r0
	nop
	mov.l	@(44,r1),r4
	mov.l	@(44,r1),r5
	mov.l	@(44,r1),r6
	mov.l	.L06028C68,r0
	jsr	@r0
	nop
	mov.w	@(24,r1),r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	nop
	mov.l	@(12,r1),r4
	mov.w	@(20,r4),r0
	mov.w	.L06028C58,r2
	add	r0,r2
	mov.w	@(26,r1),r0
	add	r2,r0
	neg	r0,r0
	sub	r2,r0
	mov.l	.L06028C70,r2
	jsr	@r2
	nop
	mov.l	@(12,r1),r4
	mov.w	@(14,r4),r0
	mov	r0,r2
	mov.w	@(22,r1),r0
	sub	r2,r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	nop
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C70,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	cmp/pl	r0
	bt	.L06028AC8
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028AC8:
	mov.l	.L06028C78,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	add	r2,r0
	mov.l	.L06028C70,r2
	jsr	@r2
	nop
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028AFA
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028AFA:
	mov.l	.L06028C78,r0
	jsr	@r0
	nop
	mov.l	.L06028C78,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	add	r2,r0
	mov.l	.L06028C70,r2
	jsr	@r2
	nop
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028B32
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028B32:
	mov.l	.L06028C7C,r11
	mov.l	.L06028C80,r10
	mov.l	.L06028C84,r0
	jsr	@r0
	mov	#1,r9
	mov.l	.L06028C88,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C70,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028B64
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028B64:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C70,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028B86
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028B86:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C70,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028BA8
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028BA8:
	add	#-12,r14
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C8C,r11
	mov.l	.L06028C80,r10
	mov.l	.L06028C84,r0
	jsr	@r0
	mov	#1,r9
	mov.l	.L06028C88,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C70,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028BE6
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028BE6:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C70,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028C08
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028C08:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C70,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028C6C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028C2A
	mov.l	.L06028C74,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028C2A:
	add	#-12,r14
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028C64,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028C90,r11
	mov.l	.L06028C80,r10
	mov.l	.L06028C84,r0
	jsr	@r0
	mov	#1,r9
	mov.l	.L06028C88,r0
	jsr	@r0
	nop
	mov.l	.L06028C88,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	lds.l	@r15+,pr
	rts
	nop
.L06028C58:
	.short 0x4000
	.byte 0x00, 0x00
.L06028C5C:
	.long func_0600C9F2
.L06028C60:
	.long func_06007BD8
.L06028C64:
	.long func_0600CBDA
.L06028C68:
	.long func_0600D018
.L06028C6C:
	.long func_0600CAF8
.L06028C70:
	.long func_0600CB68
.L06028C74:
	.long func_0600CA7A
.L06028C78:
	.long func_0600CA24
.L06028C7C:
	.long D_060289A4
.L06028C80:
	.long D_0602AF54
.L06028C84:
	.long func_0600CC34
.L06028C88:
	.long func_0600CA4E
.L06028C8C:
	.long D_060F30CC
.L06028C90:
	.long D_060F30D8
	endlabel func_060289B0

	glabel func_06028C94
	sts.l	pr,@-r15
	mov.l	r12,@-r15
	mov.l	@(8,r1),r12
	mov.b	@(0,r12),r0
	mov	#16,r2
	cmp/eq	r2,r0
	bf	.L06028CBC
	mov.l	@(36,r12),r8
	mov.l	@(40,r12),r9
	mov.l	@(44,r12),r10
	mov.l	.L06028CC4,r7
	mov.l	@r7+,r4
	mov.l	@r7+,r5
	mov.l	@r7+,r6
	sub	r4,r8
	sub	r5,r9
	sub	r6,r10
	mov.l	r8,@(48,r1)
	mov.l	r9,@(52,r1)
	mov.l	r10,@(56,r1)
.L06028CBC:
	mov.l	@r15+,r12
	lds.l	@r15+,pr
	rts
	nop
.L06028CC4:
	.long D_060F30D8
	endlabel func_06028C94

	glabel func_06028CC8
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L06028CD8
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06028CD8
	rts
	nop
.L06028CD8:
	sts.l	pr,@-r15
	mov.l	@(8,r1),r2
	mov.b	@(1,r2),r0
	and	#2,r0
	tst	r0,r0
	bt	.L06028CF6
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06028E38,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
.L06028CF6:
	mov.l	.L06028E3C,r0
	jsr	@r0
	nop
	mov.l	@(16,r1),r2
	mov.l	@r2+,r7
	mov.l	@r2+,r8
	mov.l	@r2+,r9
	neg	r9,r9
	mov.w	@(22,r1),r0
	mov.l	.L06028E40,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r9
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	sub	r2,r3
	dmuls.l	r11,r9
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	add	r2,r9
	mov	r3,r7
	mov.w	@(26,r1),r0
	mov.l	.L06028E40,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r8
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	add	r4,r3
	dmuls.l	r11,r8
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	sub	r4,r8
	mov	r3,r7
	mov.w	@(24,r1),r0
	neg	r0,r0
	mov.l	.L06028E40,r10
	jsr	@r10
	nop
	shll2	r10
	shll2	r11
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r9
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	sub	r2,r3
	dmuls.l	r11,r9
	sts	mach,r0
	sts	macl,r9
	xtrct	r0,r9
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	add	r2,r9
	mov	r3,r7
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	sub	r7,r4
	sub	r8,r5
	sub	r9,r6
	mov.l	.L06028E44,r0
	jsr	@r0
	nop
	mov.l	@(44,r1),r4
	mov.l	@(44,r1),r5
	mov.l	@(44,r1),r6
	mov.l	.L06028E48,r0
	jsr	@r0
	nop
	mov.w	@(24,r1),r0
	mov.l	.L06028E4C,r2
	jsr	@r2
	nop
	mov.l	@(12,r1),r4
	mov.w	@(20,r4),r0
	mov	#64,r2
	shll8	r2
	add	r0,r2
	mov.w	@(26,r1),r0
	add	r2,r0
	neg	r0,r0
	sub	r2,r0
	mov.l	.L06028E50,r2
	jsr	@r2
	nop
	mov.l	@(12,r1),r4
	mov.w	@(14,r4),r0
	mov	r0,r2
	mov.w	@(22,r1),r0
	sub	r2,r0
	mov.l	.L06028E4C,r2
	jsr	@r2
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028E44,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028E50,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028E4C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	cmp/pl	r0
	bt	.L06028E0E
	mov.l	.L06028E54,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028E0E:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06028E20
	mov.l	.L06028E58,r0
	jsr	@r0
	nop
.L06028E20:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06028E5C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L06028E60
	nop
	.byte 0x00, 0x00
.L06028E38:
	.long func_06029518
.L06028E3C:
	.long func_0600CA24
.L06028E40:
	.long func_06007BD8
.L06028E44:
	.long func_0600CBDA
.L06028E48:
	.long func_0600D018
.L06028E4C:
	.long func_0600CAF8
.L06028E50:
	.long func_0600CB68
.L06028E54:
	.long func_0600CA7A
.L06028E58:
	.long func_0600CF6C
.L06028E5C:
	.long func_0601F434
.L06028E60:
	mov.l	.L06028EBC,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028EC0,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	add	r2,r0
	mov.l	.L06028EC4,r2
	jsr	@r2
	nop
	mov.l	.L06028EC8,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028E92
	mov.l	.L06028ECC,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028E92:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06028EA4
	mov.l	.L06028ED0,r0
	jsr	@r0
	nop
.L06028EA4:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06028ED4,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L06028ED8
	nop
	.byte 0x00, 0x00
.L06028EBC:
	.long func_0600CA24
.L06028EC0:
	.long func_0600CBDA
.L06028EC4:
	.long func_0600CB68
.L06028EC8:
	.long func_0600CAF8
.L06028ECC:
	.long func_0600CA7A
.L06028ED0:
	.long func_0600CF6C
.L06028ED4:
	.long func_0601F434
.L06028ED8:
	mov.l	.L06028F34,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028F38,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	add	r2,r0
	mov.l	.L06028F3C,r2
	jsr	@r2
	nop
	mov.l	.L06028F40,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028F0A
	mov.l	.L06028F44,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028F0A:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06028F1C
	mov.l	.L06028F48,r0
	jsr	@r0
	nop
.L06028F1C:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06028F4C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L06028F50
	nop
	.byte 0x00, 0x00
.L06028F34:
	.long func_0600CA24
.L06028F38:
	.long func_0600CBDA
.L06028F3C:
	.long func_0600CB68
.L06028F40:
	.long func_0600CAF8
.L06028F44:
	.long func_0600CA7A
.L06028F48:
	.long func_0600CF6C
.L06028F4C:
	.long func_0601F434
.L06028F50:
	mov.l	.L06028FA8,r0
	jsr	@r0
	nop
	mov.l	.L06028FAC,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06028FB0,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06028FB4,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06028FB8,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028F7E
	mov.l	.L06028FBC,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028F7E:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06028F90
	mov.l	.L06028FC0,r0
	jsr	@r0
	nop
.L06028F90:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06028FC4,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L06028FC8
	nop
	.byte 0x00, 0x00
.L06028FA8:
	.long func_0600CA4E
.L06028FAC:
	.long func_0600CA24
.L06028FB0:
	.long func_0600CBDA
.L06028FB4:
	.long func_0600CB68
.L06028FB8:
	.long func_0600CAF8
.L06028FBC:
	.long func_0600CA7A
.L06028FC0:
	.long func_0600CF6C
.L06028FC4:
	.long func_0601F434
.L06028FC8:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029014,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06029018,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L0602901C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06028FEA
	mov.l	.L06029020,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06028FEA:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06028FFC
	mov.l	.L06029024,r0
	jsr	@r0
	nop
.L06028FFC:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029028,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L0602902C
	nop
	.byte 0x00, 0x00
.L06029014:
	.long func_0600CBDA
.L06029018:
	.long func_0600CB68
.L0602901C:
	.long func_0600CAF8
.L06029020:
	.long func_0600CA7A
.L06029024:
	.long func_0600CF6C
.L06029028:
	.long func_0601F434
.L0602902C:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029078,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L0602907C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06029080,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L0602904E
	mov.l	.L06029084,r2
	jsr	@r2
	mov.w	@r12+,r0
.L0602904E:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06029060
	mov.l	.L06029088,r0
	jsr	@r0
	nop
.L06029060:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L0602908C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L06029090
	nop
	.byte 0x00, 0x00
.L06029078:
	.long func_0600CBDA
.L0602907C:
	.long func_0600CB68
.L06029080:
	.long func_0600CAF8
.L06029084:
	.long func_0600CA7A
.L06029088:
	.long func_0600CF6C
.L0602908C:
	.long func_0601F434
.L06029090:
	mov.l	.L060290E0,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L060290E4,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L060290E8,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L060290EC,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L060290B8
	mov.l	.L060290F0,r2
	jsr	@r2
	mov.w	@r12+,r0
.L060290B8:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L060290CA
	mov.l	.L060290F4,r0
	jsr	@r0
	nop
.L060290CA:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L060290F8,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L060290FC
	nop
.L060290E0:
	.long func_0600CA4E
.L060290E4:
	.long func_0600CBDA
.L060290E8:
	.long func_0600CB68
.L060290EC:
	.long func_0600CAF8
.L060290F0:
	.long func_0600CA7A
.L060290F4:
	.long func_0600CF6C
.L060290F8:
	.long func_0601F434
.L060290FC:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029148,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L0602914C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L06029150,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L0602911E
	mov.l	.L06029154,r2
	jsr	@r2
	mov.w	@r12+,r0
.L0602911E:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06029130
	mov.l	.L06029158,r0
	jsr	@r0
	nop
.L06029130:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L0602915C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L06029160
	nop
	.byte 0x00, 0x00
.L06029148:
	.long func_0600CBDA
.L0602914C:
	.long func_0600CB68
.L06029150:
	.long func_0600CAF8
.L06029154:
	.long func_0600CA7A
.L06029158:
	.long func_0600CF6C
.L0602915C:
	.long func_0601F434
.L06029160:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L060291AC,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L060291B0,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L060291B4,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06029182
	mov.l	.L060291B8,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06029182:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06029194
	mov.l	.L060291BC,r0
	jsr	@r0
	nop
.L06029194:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L060291C0,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L060291C4
	nop
	.byte 0x00, 0x00
.L060291AC:
	.long func_0600CBDA
.L060291B0:
	.long func_0600CB68
.L060291B4:
	.long func_0600CAF8
.L060291B8:
	.long func_0600CA7A
.L060291BC:
	.long func_0600CF6C
.L060291C0:
	.long func_0601F434
.L060291C4:
	mov.l	.L06029224,r0
	jsr	@r0
	nop
	mov.l	.L06029228,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L0602922C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	sub	r2,r0
	mov.l	.L06029230,r2
	jsr	@r2
	nop
	mov.l	.L06029234,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L060291FC
	mov.l	.L06029238,r2
	jsr	@r2
	mov.w	@r12+,r0
.L060291FC:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L0602920E
	mov.l	.L0602923C,r0
	jsr	@r0
	nop
.L0602920E:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029240,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L06029244
	nop
.L06029224:
	.long func_0600CA4E
.L06029228:
	.long func_0600CA24
.L0602922C:
	.long func_0600CBDA
.L06029230:
	.long func_0600CB68
.L06029234:
	.long func_0600CAF8
.L06029238:
	.long func_0600CA7A
.L0602923C:
	.long func_0600CF6C
.L06029240:
	.long func_0601F434
.L06029244:
	mov.l	@(12,r1),r3
	mov.b	@(2,r3),r0
	cmp/eq	#0,r0
	bf	.L0602926A
	mov.l	@(8,r1),r2
	mov.w	@(28,r2),r0
	cmp/pz	r0
	bt	.L0602926A
	mov.b	@(8,r2),r0
	tst	r0,r0
	bf	.L0602926A
	add	#8,r13
	add	#24,r14
	add	#8,r12
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L0602933C
	bra	.L0602933C
	add	#4,r12
.L0602926A:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L060292C0,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	sub	r2,r0
	mov.l	.L060292C4,r2
	jsr	@r2
	nop
	mov.l	.L060292C8,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L06029296
	mov.l	.L060292CC,r2
	jsr	@r2
	mov.w	@r12+,r0
.L06029296:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L060292A8
	mov.l	.L060292D0,r0
	jsr	@r0
	nop
.L060292A8:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L060292D4,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L060292D8
	nop
	.byte 0x00, 0x00
.L060292C0:
	.long func_0600CBDA
.L060292C4:
	.long func_0600CB68
.L060292C8:
	.long func_0600CAF8
.L060292CC:
	.long func_0600CA7A
.L060292D0:
	.long func_0600CF6C
.L060292D4:
	.long func_0601F434
.L060292D8:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029324,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06029328,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L0602932C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L060292FA
	mov.l	.L06029330,r2
	jsr	@r2
	mov.w	@r12+,r0
.L060292FA:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L0602930C
	mov.l	.L06029334,r0
	jsr	@r0
	nop
.L0602930C:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029338,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L0602933C
	nop
	.byte 0x00, 0x00
.L06029324:
	.long func_0600CBDA
.L06029328:
	.long func_0600CB68
.L0602932C:
	.long func_0600CAF8
.L06029330:
	.long func_0600CA7A
.L06029334:
	.long func_0600CF6C
.L06029338:
	.long func_0601F434
.L0602933C:
	mov.l	.L06029398,r0
	jsr	@r0
	nop
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L0602939C,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	sub	r2,r0
	mov.l	.L060293A0,r2
	jsr	@r2
	nop
	mov.l	.L060293A4,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L0602936E
	mov.l	.L060293A8,r2
	jsr	@r2
	mov.w	@r12+,r0
.L0602936E:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06029380
	mov.l	.L060293AC,r0
	jsr	@r0
	nop
.L06029380:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L060293B0,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L060293B4
	nop
	.byte 0x00, 0x00
.L06029398:
	.long func_0600CA4E
.L0602939C:
	.long func_0600CBDA
.L060293A0:
	.long func_0600CB68
.L060293A4:
	.long func_0600CAF8
.L060293A8:
	.long func_0600CA7A
.L060293AC:
	.long func_0600CF6C
.L060293B0:
	.long func_0601F434
.L060293B4:
	mov.l	@(12,r1),r3
	mov.b	@(2,r3),r0
	cmp/eq	#0,r0
	bf	.L060293CA
	mov.l	@(8,r1),r2
	mov.w	@(28,r2),r0
	cmp/pz	r0
	bt	.L060293CA
	mov.b	@(8,r2),r0
	tst	r0,r0
	bt	.L0602949C
.L060293CA:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029420,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	@(12,r1),r2
	mov.w	@(18,r2),r0
	mov	r0,r2
	mov.w	@r12+,r0
	sub	r2,r0
	mov.l	.L06029424,r2
	jsr	@r2
	nop
	mov.l	.L06029428,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L060293F6
	mov.l	.L0602942C,r2
	jsr	@r2
	mov.w	@r12+,r0
.L060293F6:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L06029408
	mov.l	.L06029430,r0
	jsr	@r0
	nop
.L06029408:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029434,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L06029438
	nop
	.byte 0x00, 0x00
.L06029420:
	.long func_0600CBDA
.L06029424:
	.long func_0600CB68
.L06029428:
	.long func_0600CAF8
.L0602942C:
	.long func_0600CA7A
.L06029430:
	.long func_0600CF6C
.L06029434:
	.long func_0601F434
.L06029438:
	mov.l	@r14+,r4
	mov.l	@r14+,r5
	mov.l	.L06029484,r0
	jsr	@r0
	mov.l	@r14+,r6
	mov.l	.L06029488,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.l	.L0602948C,r2
	jsr	@r2
	mov.w	@r12+,r0
	mov.b	@(59,gbr),r0
	tst	r0,r0
	bf	.L0602945A
	mov.l	.L06029490,r2
	jsr	@r2
	mov.w	@r12+,r0
.L0602945A:
	mov.l	@r13+,r2
	mov	#30,r0
	add	r1,r0
	mov.b	@r0,r0
	tst	#32,r0
	bf	.L0602946C
	mov.l	.L06029494,r0
	jsr	@r0
	nop
.L0602946C:
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	.L06029498,r0
	jsr	@r0
	nop
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	bra	.L0602949C
	nop
	.byte 0x00, 0x00
.L06029484:
	.long func_0600CBDA
.L06029488:
	.long func_0600CB68
.L0602948C:
	.long func_0600CAF8
.L06029490:
	.long func_0600CA7A
.L06029494:
	.long func_0600CF6C
.L06029498:
	.long func_0601F434
.L0602949C:
	mov.l	.L060294A8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L060294A8:
	.long func_0600CA4E
	endlabel func_06028CC8

	.section .data.060294AC,"aw",@progbits
	.p2align 2
	dlabel D_060294AC
	.byte 0x00, 0x00, 0x00
	dlabel D_060294AF
	.byte 0x00
