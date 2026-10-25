	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601C350,"ax",@progbits
	.p2align 2

	glabel func_0601C350
	sts.l	pr,@-r15
	mov.l	@(12,r1),r0
	mov.w	.L0601C3E6,r8
	add	r8,r0
	mov.l	.L0601C3F0,r8
	cmp/ge	r8,r0
	bf	.L0601C370
	mov.l	.L0601C3F4,r4
	mov.l	@r4,r0
	mov.l	r0,@(16,r1)
	mov.l	.L0601C3F8,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov	#40,r0
	mov.w	r0,@(4,r1)
	mov	r8,r0
.L0601C370:
	mov.l	r0,@(12,r1)
	mov	#0,r7
.L0601C374:
	mov.w	.L0601C3E8,r0
	mov.w	r0,@(28,r1)
	mov.l	@(12,r1),r9
	mov	r7,r0
	shll8	r0
	shll2	r0
	shll2	r0
	add	r0,r9
	mov.l	.L0601C3F0,r8
	cmp/ge	r8,r9
	bf	.L0601C38C
	mov	r8,r9
.L0601C38C:
	mov.w	.L0601C3EA,r0
	shll16	r0
	dmuls.l	r9,r0
	sts	mach,r0
	mov.w	.L0601C3EC,r8
	neg	r0,r0
	add	r8,r0
	cmp/ge	r8,r0
	bf	.L0601C3A0
	mov	r8,r0
.L0601C3A0:
	mov.w	r0,@(22,r1)
	mov.l	.L0601C3FC,r8
	mov.l	.L0601C400,r0
	sub	r8,r0
	dmuls.l	r9,r0
	sts	mach,r0
	cmp/pz	r0
	bf	.L0601C3B2
	mov	#0,r0
.L0601C3B2:
	shll16	r0
	add	r8,r0
	mov.l	r0,@(48,r1)
	mov.l	.L0601C404,r8
	mov.l	.L0601C408,r0
	sub	r8,r0
	dmuls.l	r9,r0
	sts	mach,r0
	cmp/pz	r0
	bt	.L0601C3C8
	mov	#0,r0
.L0601C3C8:
	shll16	r0
	add	r8,r0
	mov.l	r0,@(52,r1)
	mov.l	r7,@-r15
	mov.l	.L0601C40C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r7
	add	#1,r7
	mov	#4,r0
	cmp/ge	r0,r7
	bf	.L0601C374
	lds.l	@r15+,pr
	rts
	nop
.L0601C3E6:
	.short 0x1800
.L0601C3E8:
	.short 0x1FFF
.L0601C3EA:
	.short 0x0040
.L0601C3EC:
	.short 0x0100
	.byte 0x00, 0x00
.L0601C3F0:
	.long 0x00010000
.L0601C3F4:
	.long D_0601BC54
.L0601C3F8:
	.long func_0601C410
.L0601C3FC:
	.long 0x01400000
.L0601C400:
	.long 0x00900000
.L0601C404:
	.long 0x001C0000
.L0601C408:
	.long 0x006C0000
.L0601C40C:
	.long func_060204EE
	endlabel func_0601C350

	glabel func_0601C410
	sts.l	pr,@-r15
	mov.w	@(4,r1),r0
	add	#-1,r0
	mov.w	r0,@(4,r1)
	tst	r0,r0
	bf	.L0601C41C
.L0601C41C:
	mov.w	@(4,r1),r0
	mov	#20,r8
	cmp/ge	r8,r0
	bt	.L0601C43A
	mov.l	.L0601C46C,r2
	mov.l	r2,@(44,r1)
	mov	#2,r0
	mov.w	r0,@(20,r1)
	mov.w	.L0601C464,r0
	mov.w	r0,@(28,r1)
	mov.w	.L0601C466,r0
	mov.w	r0,@(22,r1)
	mov.l	.L0601C470,r0
	jsr	@r0
	nop
.L0601C43A:
	mov.l	.L0601C474,r2
	mov.l	r2,@(44,r1)
	mov	#0,r0
	mov.w	r0,@(20,r1)
	mov.w	.L0601C464,r0
	mov.w	r0,@(28,r1)
	mov.w	.L0601C468,r0
	mov.w	r0,@(22,r1)
	mov.l	@(16,r1),r4
	mov.l	@(0,r4),r0
	mov.l	.L0601C478,r14
	jsr	@r14
	mov	r0,r4
	mov	#6,r14
	mov.l	.L0601C47C,r10
	jsr	@r10
	nop
	lds.l	@r15+,pr
	mov.l	.L0601C470,r0
	jmp	@r0
	nop
.L0601C464:
	.short 0x1FFF
.L0601C466:
	.short 0x0100
.L0601C468:
	.short 0x00C0
	.byte 0x00, 0x00
.L0601C46C:
	.long D_06014246
.L0601C470:
	.long func_060204EE
.L0601C474:
	.long D_0601A118
.L0601C478:
	.long func_0601CB9A
.L0601C47C:
	.long func_06019D42
	endlabel func_0601C410

	glabel func_0601C480
	sts.l	pr,@-r15
	mov.l	@(12,r1),r0
	mov.w	.L0601C516,r8
	add	r8,r0
	mov.l	.L0601C520,r8
	cmp/ge	r8,r0
	bf	.L0601C4A0
	mov.l	.L0601C524,r4
	mov.l	@r4,r0
	mov.l	r0,@(16,r1)
	mov.l	.L0601C528,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov	#40,r0
	mov.w	r0,@(4,r1)
	mov	r8,r0
.L0601C4A0:
	mov.l	r0,@(12,r1)
	mov	#0,r7
.L0601C4A4:
	mov.w	.L0601C518,r0
	mov.w	r0,@(28,r1)
	mov.l	@(12,r1),r9
	mov	r7,r0
	shll8	r0
	shll2	r0
	shll2	r0
	add	r0,r9
	mov.l	.L0601C520,r8
	cmp/ge	r8,r9
	bf	.L0601C4BC
	mov	r8,r9
.L0601C4BC:
	mov.w	.L0601C51A,r0
	shll16	r0
	dmuls.l	r9,r0
	sts	mach,r0
	mov.w	.L0601C51C,r8
	neg	r0,r0
	add	r8,r0
	cmp/ge	r8,r0
	bf	.L0601C4D0
	mov	r8,r0
.L0601C4D0:
	mov.w	r0,@(22,r1)
	mov.l	.L0601C52C,r8
	mov.l	.L0601C530,r0
	sub	r8,r0
	dmuls.l	r9,r0
	sts	mach,r0
	cmp/pz	r0
	bt	.L0601C4E2
	mov	#0,r0
.L0601C4E2:
	shll16	r0
	add	r8,r0
	mov.l	r0,@(48,r1)
	mov.l	.L0601C534,r8
	mov.l	.L0601C538,r0
	sub	r8,r0
	dmuls.l	r9,r0
	sts	mach,r0
	cmp/pz	r0
	bt	.L0601C4F8
	mov	#0,r0
.L0601C4F8:
	shll16	r0
	add	r8,r0
	mov.l	r0,@(52,r1)
	mov.l	r7,@-r15
	mov.l	.L0601C53C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r7
	add	#1,r7
	mov	#4,r0
	cmp/ge	r0,r7
	bf	.L0601C4A4
	lds.l	@r15+,pr
	rts
	nop
.L0601C516:
	.short 0x1800
.L0601C518:
	.short 0x1FF9
.L0601C51A:
	.short 0x0040
.L0601C51C:
	.short 0x0140
	.byte 0x00, 0x00
.L0601C520:
	.long 0x00010000
.L0601C524:
	.long D_0601BC54
.L0601C528:
	.long func_0601C540
.L0601C52C:
	.long 0x00BC0000
.L0601C530:
	.long 0x011C0000
.L0601C534:
	.long 0x00180000
.L0601C538:
	.long 0x00880000
.L0601C53C:
	.long func_060204EE
	endlabel func_0601C480

	glabel func_0601C540
	sts.l	pr,@-r15
	mov.w	@(4,r1),r0
	add	#-1,r0
	mov.w	r0,@(4,r1)
	mov.w	@(4,r1),r0
	mov	#20,r8
	cmp/ge	r8,r0
	bt	.L0601C566
	mov.l	.L0601C5A4,r2
	mov.l	r2,@(44,r1)
	mov	#4,r0
	mov.w	r0,@(20,r1)
	mov.w	.L0601C5A0,r0
	mov.w	r0,@(28,r1)
	mov.w	.L0601C5A2,r0
	mov.w	r0,@(22,r1)
	mov.l	.L0601C5A8,r0
	jsr	@r0
	nop
.L0601C566:
	mov.l	.L0601C5AC,r2
	mov.l	r2,@(44,r1)
	mov	#0,r0
	mov.w	r0,@(20,r1)
	mov.w	.L0601C5A0,r0
	mov.w	r0,@(28,r1)
	mov.w	.L0601C5A2,r0
	mov.w	r0,@(22,r1)
	mov.l	@(16,r1),r4
	mov.l	@(4,r4),r0
	mov	r0,r8
	mov	#60,r13
	mov	#-128,r14
	shll	r14
	mov.l	r13,@(0,r14)
	mov.l	r0,@(4,r14)
	mov.l	@(28,r14),r0
	mov.b	r0,@(26,gbr)
	mov.l	.L0601C5B0,r14
	jsr	@r14
	mov	r0,r4
	mov	#3,r14
	mov.l	.L0601C5B4,r10
	jsr	@r10
	nop
	lds.l	@r15+,pr
	mov.l	.L0601C5A8,r0
	jmp	@r0
	nop
.L0601C5A0:
	.short 0x1FF9
.L0601C5A2:
	.short 0x0100
.L0601C5A4:
	.long D_06014246
.L0601C5A8:
	.long func_060204EE
.L0601C5AC:
	.long D_0601B510
.L0601C5B0:
	.long func_0601CB9A
.L0601C5B4:
	.long func_06019D42
	endlabel func_0601C540

	glabel func_0601C5B8
	mov.l	.L0601C5E4,r6
	mov.w	.L0601C5DE,r0
	mov.w	r0,@(0,r6)
	mov.w	r0,@(2,r6)
	mov.w	r0,@(4,r6)
	mov.w	r0,@(6,r6)
	mov.w	.L0601C5E0,r0
	mov.w	r0,@(22,r1)
	mov	#30,r0
	mov.w	r0,@(4,r1)
	mov	#0,r0
	mov.w	r0,@(8,r1)
	mov.l	.L0601C5E8,r0
	mov.l	r0,@(12,r1)
	mov.l	.L0601C5EC,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601C5DE:
	.short 0x18C6
.L0601C5E0:
	.short 0x0100
	.byte 0x00, 0x00
.L0601C5E4:
	.long VDP1_VRAM + 0xFFE8
.L0601C5E8:
	.long 0x00001C20
.L0601C5EC:
	.long func_0601C610
	endlabel func_0601C5B8

	.section .data.0601C5F0,"aw",@progbits
	.p2align 2
	dlabel D_0601C5F0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_0601C5F8
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0xAA, 0x00, 0x00, 0x01, 0x00, 0x00, 0xAA, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
