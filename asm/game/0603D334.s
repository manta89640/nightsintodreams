	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603D334,"ax",@progbits
	.p2align 2
	.byte 0x4F, 0x26

	glabel func_0603D336
	sts.l	pr,@-r15
	mov.l	@(12,gbr),r0
	shll8	r0
	mov.l	.L0603D388,r10
	jsr	@r10
	shll2	r0
	shar	r10
	shar	r10
	mov.l	.L0603D38C,r0
	add	r0,r10
	mov.l	.L0603D390,r5
	mov.l	r10,@r5
	mov.l	.L0603D394,r2
	mov.l	@(156,gbr),r0
	mov.l	.L0603D398,r8
	cmp/ge	r8,r0
	bt	.L0603D39C
	mov.w	@(150,gbr),r0
	shll16	r0
	mov.l	r0,@(0,r2)
	mov.w	@(152,gbr),r0
	shll16	r0
	mov.l	r0,@(4,r2)
	mov.w	@(154,gbr),r0
	shll16	r0
	bra	.L0603D3A0
	mov.l	r0,@(8,r2)
	.byte 0x42, 0x10, 0x3C, 0x00
	.long VDP1_VRAM + 0xD820
	.long VDP1_VRAM + 0xD818
	.long obj_list_effect
	.long obj_alloc
	.long func_060404CE
	.long func_0603D336
.L0603D388:
	.long math_sin
.L0603D38C:
	.long 0x00010000
.L0603D390:
	.long D_0603D2F8
.L0603D394:
	.long D_0603BF8C
.L0603D398:
	.long 0x01000000
.L0603D39C:
	mov	#-1,r0
	mov.l	r0,@r2
.L0603D3A0:
	mov.l	.L0603D3C4,r0
	mov.l	r0,@(156,gbr)
	mov.l	.L0603D3C8,r7
	mov.b	@(4,r7),r0
	mov	#24,r8
	mulu.w	r0,r8
	sts	macl,r8
	mov.w	@(6,r1),r0
	cmp/eq	r0,r8
	bt	.L0603D3D6
	cmp/gt	r8,r0
	bt	.L0603D3CC
	add	#1,r0
	cmp/gt	r8,r0
	bf	.L0603D3D4
	bra	.L0603D3D4
	mov	r8,r0
	.byte 0x00, 0x00
.L0603D3C4:
	.long 0x3FFF0001
.L0603D3C8:
	.long play_state
.L0603D3CC:
	add	#-1,r0
	cmp/ge	r8,r0
	bt	.L0603D3D4
	mov	r8,r0
.L0603D3D4:
	mov.w	r0,@(6,r1)
.L0603D3D6:
	mov.w	@(6,r1),r0
	mov	r0,r8
	mov.l	.L0603D548,r9
	mov.w	@(6,r9),r0
	add	r0,r8
	mov.w	r8,@r9
	mov.l	@(12,gbr),r0
	tst	#3,r0
	bf	.L0603D46A
	mov.w	@(20,r1),r0
	add	#1,r0
	and	#15,r0
	mov.w	r0,@(20,r1)
	mov.l	.L0603D54C,r2
	mov.b	@(108,gbr),r0
	tst	#128,r0
	bt	.L0603D3FA
	mov.l	.L0603D550,r2
.L0603D3FA:
	mov.b	@(8,r1),r0
	add	#1,r0
	mov	#24,r8
	cmp/ge	r8,r0
	bf	.L0603D406
	mov	#0,r0
.L0603D406:
	mov.b	r0,@(8,r1)
	shlr	r0
	shll2	r0
	shll2	r0
	shll	r0
	add	r0,r2
	mov.l	.L0603D554,r0
	mov.l	.L0603D558,r6
	mov	#1,r7
	mov.l	.L0603D55C,r10
	jsr	@r10
	nop
	mov.w	@(20,r1),r0
	and	#7,r0
	mov	r0,r8
	mov.l	.L0603D560,r9
	mov.w	@(6,r9),r0
	mov.w	.L0603D534,r10
	muls.w	r8,r10
	sts	macl,r8
	add	r0,r8
	mov.w	r8,@r9
	mov.l	.L0603D564,r9
	mov.w	r8,@r9
	mov.l	.L0603D568,r9
	mov.w	r8,@r9
	mov.l	.L0603D56C,r9
	mov.w	r8,@r9
	mov.l	.L0603D570,r9
	mov.l	.L0603D574,r10
	mov.w	@(4,r1),r0
	add	#1,r0
	mov	#14,r8
	cmp/ge	r8,r0
	bf	.L0603D44E
	mov	#0,r0
.L0603D44E:
	mov.w	r0,@(4,r1)
	shll2	r0
	add	r0,r10
	mov.w	@r10+,r8
	mov.w	.L0603D536,r11
	add	r11,r8
	mov.w	@r10,r0
	mov.l	.L0603D570,r9
	mov.w	r8,@r9
	mov.w	r0,@(2,r9)
	mov.l	.L0603D578,r9
	add	#4,r8
	mov.w	r8,@r9
	mov.w	r0,@(2,r9)
.L0603D46A:
	mov.l	.L0603D57C,r9
	mov.l	.L0603D580,r10
	mov.w	@(0,r1),r0
	add	#1,r0
	mov	#64,r8
	cmp/ge	r8,r0
	bf	.L0603D47A
	mov	#0,r0
.L0603D47A:
	mov.w	r0,@(0,r1)
	shar	r0
	shll2	r0
	add	r0,r10
	mov.w	@r10+,r8
	mov.w	.L0603D538,r11
	add	r11,r8
	mov.w	r8,@r9
	mov.w	@r10,r0
	mov.w	r0,@(2,r9)
	mov.w	@(10,r1),r0
	mov.w	.L0603D53A,r2
	add	r2,r0
	mov.w	r0,@(10,r1)
	shll2	r0
	shll	r0
	mov.l	.L0603D584,r13
	jsr	@r13
	nop
	mov.w	.L0603D53C,r8
	add	r8,r10
	shll	r10
	shlr8	r10
	mov	r10,r0
	mov.w	.L0603D53E,r4
	mov.w	.L0603D540,r5
	mov.l	.L0603D588,r13
	jsr	@r13
	nop
	mov.l	.L0603D58C,r2
	mov.w	r0,@r2
	add	#2,r2
	mov.w	r0,@r2
	add	#2,r2
	mov.w	r0,@r2
	add	#2,r2
	mov.w	r0,@r2
	mov.w	.L0603D542,r0
	mov.l	.L0603D590,r2
	mov.w	r0,@r2
	add	#2,r2
	mov.w	r0,@r2
	add	#2,r2
	mov.w	r0,@r2
	add	#2,r2
	mov.w	r0,@r2
	mov.l	.L0603D584,r13
	jsr	@r13
	mov.w	@(10,r1),r0
	mov.w	.L0603D53C,r8
	add	r8,r10
	shll	r10
	shlr8	r10
	mov	r10,r0
	mov.w	.L0603D544,r4
	mov.w	.L0603D540,r5
	mov.l	.L0603D588,r13
	jsr	@r13
	nop
	mov.l	.L0603D594,r2
	mov.w	r0,@r2
	add	#4,r2
	mov.w	r0,@r2
	mov.l	.L0603D598,r10
	mov.w	@(2,r1),r0
	add	#1,r0
	mov	#16,r8
	cmp/ge	r8,r0
	bf	.L0603D506
	mov	#0,r0
.L0603D506:
	mov.w	r0,@(2,r1)
	shlr2	r0
	mov	r0,r12
	mov	#4,r7
	mov.l	.L0603D59C,r9
.L0603D510:
	shll2	r0
	add	r10,r0
	mov.w	@r0,r8
	mov.w	.L0603D546,r11
	add	r11,r8
	mov.w	r8,@r9
	mov.w	@(2,r0),r0
	mov.w	r0,@(2,r9)
	dt	r7
	bt	.L0603D5A0
	add	#4,r9
	mov	r12,r0
	add	#1,r0
	cmp/eq	#4,r0
	bf	.L0603D530
	mov	#0,r0
.L0603D530:
	bra	.L0603D510
	mov	r0,r12
.L0603D534:
	.short 0x0040
.L0603D536:
	.short 0x00DB
.L0603D538:
	.short 0x0119
.L0603D53A:
	.short 0x0400
.L0603D53C:
	.short 0x4000
.L0603D53E:
	.short 0x2108
.L0603D540:
	.short 0x7FFF
.L0603D542:
	.short 0x03FF
.L0603D544:
	.short 0x03E0
.L0603D546:
	.short 0x0181
.L0603D548:
	.long D_060ED948
.L0603D54C:
	.long D_060934B0
.L0603D550:
	.long D_06093638
.L0603D554:
	.long D_060EEB60
.L0603D558:
	.long 0x0000C000
.L0603D55C:
	.long vdp1_build_fog_cluts
.L0603D560:
	.long D_060ED6C8
.L0603D564:
	.long D_060ED710
.L0603D568:
	.long D_060ED718
.L0603D56C:
	.long D_060ED720
.L0603D570:
	.long D_060F0004
.L0603D574:
	.long D_0603D670
.L0603D578:
	.long D_060F0008
.L0603D57C:
	.long D_060F0000
.L0603D580:
	.long D_0603D5F0
.L0603D584:
	.long math_sin
.L0603D588:
	.long vdp_rgb555_lerp
.L0603D58C:
	.long VDP1_VRAM + 0xD828
.L0603D590:
	.long VDP1_VRAM + 0xD830
.L0603D594:
	.long VDP1_VRAM + 0xD818
.L0603D598:
	.long D_0603D6A8
.L0603D59C:
	.long D_060F0040
.L0603D5A0:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x68, 0x25
	endlabel func_0603D336

	.section .data.0603D5A8,"aw",@progbits
	.p2align 2
	.byte 0x30, 0x80, 0x89, 0x0A, 0x30, 0x87, 0x89, 0x04, 0x70, 0x02, 0x30, 0x87, 0x8B, 0x05, 0xA0, 0x04
	.byte 0x60, 0x83, 0x70, 0xFE, 0x30, 0x83, 0x89, 0x00, 0x60, 0x83, 0x00, 0x0B, 0x00, 0x09, 0x30, 0x87
	.byte 0x8B, 0x00, 0x60, 0x83, 0x30, 0x93, 0x89, 0x00, 0x60, 0x93, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xF0, 0xFF, 0xF0, 0x00, 0x20, 0x00, 0x00, 0x00, 0x10
	.byte 0xFF, 0xD0, 0xFF, 0xD0, 0x00, 0x00, 0x00, 0x09
	dlabel D_0603D5F0
	.byte 0x00, 0x00, 0x0A, 0x01, 0x00, 0x01, 0x0A, 0x01, 0x00, 0x02, 0x0A, 0x01, 0x00, 0x03, 0x0A, 0x01
	.byte 0x00, 0x04, 0x0A, 0x01, 0x00, 0x05, 0x0A, 0x01, 0x00, 0x06, 0x0A, 0x01, 0x00, 0x07, 0x0A, 0x01
	.byte 0x00, 0x08, 0x0A, 0x01, 0x00, 0x09, 0x0A, 0x01, 0x00, 0x0A, 0x0A, 0x01, 0x00, 0x0B, 0x0A, 0x01
	.byte 0x00, 0x0C, 0x0A, 0x01, 0x00, 0x0D, 0x0A, 0x01, 0x00, 0x0E, 0x0A, 0x01, 0x00, 0x0F, 0x0A, 0x01
	.byte 0x00, 0x10, 0x0A, 0x01, 0x00, 0x0F, 0x0A, 0x11, 0x00, 0x0E, 0x0A, 0x11, 0x00, 0x0D, 0x0A, 0x11
	.byte 0x00, 0x0C, 0x0A, 0x11, 0x00, 0x0B, 0x0A, 0x11, 0x00, 0x0A, 0x0A, 0x11, 0x00, 0x09, 0x0A, 0x11
	.byte 0x00, 0x08, 0x0A, 0x11, 0x00, 0x07, 0x0A, 0x11, 0x00, 0x06, 0x0A, 0x11, 0x00, 0x05, 0x0A, 0x11
	.byte 0x00, 0x04, 0x0A, 0x11, 0x00, 0x03, 0x0A, 0x11, 0x00, 0x02, 0x0A, 0x11, 0x00, 0x01, 0x0A, 0x11
	dlabel D_0603D670
	.byte 0x00, 0x00, 0x0A, 0x01, 0x00, 0x01, 0x0A, 0x01, 0x00, 0x02, 0x0A, 0x01, 0x00, 0x03, 0x0A, 0x01
	.byte 0x00, 0x03, 0x0A, 0x11, 0x00, 0x02, 0x0A, 0x11, 0x00, 0x01, 0x0A, 0x11, 0x00, 0x00, 0x0A, 0x11
	.byte 0x00, 0x01, 0x0A, 0x11, 0x00, 0x02, 0x0A, 0x11, 0x00, 0x03, 0x0A, 0x11, 0x00, 0x03, 0x0A, 0x01
	.byte 0x00, 0x02, 0x0A, 0x01, 0x00, 0x01, 0x0A, 0x01
	dlabel D_0603D6A8
	.byte 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00, 0x02
	dlabel D_0603D6B8
	.byte 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00, 0x02
	.byte 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00, 0x03
