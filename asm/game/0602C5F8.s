	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0602C5F8,"ax",@progbits
	.p2align 2

	glabel func_0602C5F8
	sts.l	pr,@-r15
	mov.l	.L0602C658,r0
	mov.l	r6,@r0
	mov.l	@(0,r1),r2
	add	#68,r2
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	@(160,gbr),r0
	mov	r0,r4
	mov.l	.L0602C65C,r0
	sub	r0,r4
	mov.l	@(168,gbr),r0
	mov	r0,r6
	mov.l	.L0602C660,r0
	sub	r0,r6
	mov.l	.L0602C664,r10
	jsr	@r10
	neg	r3,r0
	mov.l	.L0602C668,r0
	jsr	@r0
	nop
	mov.l	.L0602C65C,r8
	add	r4,r8
	mov.l	.L0602C660,r9
	add	r6,r9
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	add	r8,r4
	add	r9,r5
	dmuls.l	r4,r6
	sts	mach,r8
	sts	macl,r4
	xtrct	r8,r4
	dmuls.l	r5,r6
	sts	mach,r8
	sts	macl,r6
	xtrct	r8,r6
	swap.w	r4,r4
	exts.w	r4,r0
	mov.w	r0,@(0,r2)
	swap.w	r6,r6
	exts.w	r6,r0
	neg	r0,r0
	bra	.L0602C68C
	mov.w	r0,@(4,r2)
	.byte 0x00, 0x00
.L0602C658:
	.long D_0602C5F4
.L0602C65C:
	.long 0x10000000
.L0602C660:
	.long 0x12000000
.L0602C664:
	.long func_06007BD8
.L0602C668:
	.long func_06017B7C
	.byte 0x4F, 0x22, 0xD0, 0x1E, 0xD6, 0x1E, 0x20, 0x62, 0xE3, 0x00, 0x52, 0x10, 0x72, 0x44, 0xC6, 0x28
	.byte 0x60, 0x09, 0x60, 0x0F, 0x81, 0x20, 0xC6, 0x2A, 0x60, 0x09, 0x60, 0x0F, 0x60, 0x0B, 0x81, 0x22
.L0602C68C:
	mov.w	@(194,gbr),r0
	add	r3,r0
	neg	r0,r0
	mov.l	.L0602C6F0,r14
	jsr	@r14
	nop
	mov	r10,r12
	mov	r11,r13
	mov.w	@(192,gbr),r0
	neg	r0,r0
	mov.l	.L0602C6F4,r8
	add	r8,r0
	mov.l	.L0602C6F0,r14
	jsr	@r14
	nop
	mov.l	@(0,r1),r2
	shll2	r10
	shll2	r11
	shll2	r12
	shll2	r13
	mov.l	r13,@(28,r2)
	dmuls.l	r10,r12
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	mov.l	r8,@(36,r2)
	dmuls.l	r11,r13
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	mov.l	r8,@(44,r2)
	dmuls.l	r12,r11
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	mov.l	r8,@(32,r2)
	dmuls.l	r10,r13
	sts	mach,r0
	sts	macl,r8
	xtrct	r0,r8
	mov.l	r8,@(48,r2)
	neg	r12,r12
	mov.l	r12,@(40,r2)
	lds.l	@r15+,pr
	rts
	nop
	.long D_0602C5F4
	.byte 0x00, 0x01, 0x00, 0x00
.L0602C6F0:
	.long func_06007BD8
.L0602C6F4:
	.long 0x00004000
	endlabel func_0602C5F8

	.section .data.0602C6F8,"aw",@progbits
	.p2align 2
	.byte 0x98, 0x3D, 0x97, 0x3D, 0x99, 0x3D, 0x90, 0x3C, 0x35, 0x08, 0xC5, 0x52, 0x35, 0x08, 0x60, 0x53
	.byte 0xE4, 0xFF, 0xE2, 0xFF, 0x30, 0x9C, 0x6C, 0x03, 0x65, 0xC3, 0x45, 0x18, 0x45, 0x08, 0x53, 0x11
	.byte 0x33, 0x7C, 0x33, 0x7C
