	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06045780,"ax",@progbits
	.p2align 2

	glabel func_06045780
	mov.l	@(60,r1),r0
	add	#-1,r0
	mov.l	r0,@(60,r1)
	cmp/pz	r0
	bt	.L060457A4
	mov.l	.L060457C4,r0
	mov.l	@r0,r3
	rotl	r3
	mov.l	.L060457C8,r2
	swap.w	r3,r3
	dmuls.l	r3,r2
	sts	macl,r3
	add	r2,r3
	mov.l	r3,@r0
	mov.w	.L060457C0,r0
	and	r3,r0
	add	#32,r0
	mov.l	r0,@(60,r1)
.L060457A4:
	cmp/eq	#0,r0
	bt	.L060457CC
	cmp/eq	#2,r0
	bt	.L060457D8
	cmp/eq	#4,r0
	bt	.L060457E4
	cmp/eq	#8,r0
	bt	.L060457F0
	cmp/eq	#10,r0
	bt	.L060457E4
	cmp/eq	#12,r0
	bt	.L060457D8
	bra	.L06045802
	nop
.L060457C0:
	.short 0x00FF
	.byte 0x00, 0x00
.L060457C4:
	.long D_06045668
.L060457C8:
	.long 0x0D81A52B
.L060457CC:
	mov.l	.L060457D4,r2
	bra	.L060457F2
	nop
	.byte 0x00, 0x00
.L060457D4:
	.long D_060D9080
.L060457D8:
	mov.l	.L060457E0,r2
	bra	.L060457F2
	nop
	.byte 0x00, 0x00
.L060457E0:
	.long D_060D90A8
.L060457E4:
	mov.l	.L060457EC,r2
	bra	.L060457F2
	nop
	.byte 0x00, 0x00
.L060457EC:
	.long D_060D90D0
.L060457F0:
	mov.l	.L06045818,r2
.L060457F2:
	mov.l	.L0604581C,r3
	mov.l	.L06045820,r6
	mov.w	@r2+,r8
	mov.w	@r2+,r9
	sts.l	pr,@-r15
	bsr	func_06045848
	mov	#64,r14
	lds.l	@r15+,pr
.L06045802:
	mov.l	@(56,r1),r0
	add	#1,r0
	mov.l	r0,@(56,r1)
	tst	#63,r0
	bf	func_06045864
	tst	#64,r0
	bt	.L06045828
	mov.l	.L06045824,r2
	bra	.L0604582A
	nop
	.byte 0x00, 0x00
.L06045818:
	.long D_060D90F8
.L0604581C:
	.long VDP2_VRAM + 0x58124
.L06045820:
	.long 0x00001040
.L06045824:
	.long D_060D9120
.L06045828:
	mov.l	.L0604583C,r2
.L0604582A:
	mov.l	.L06045840,r3
	mov.l	.L06045844,r6
	mov.w	@r2+,r8
	mov.w	@r2+,r9
	sts.l	pr,@-r15
	bsr	func_06045848
	mov	#64,r14
	bra	func_06045864
	lds.l	@r15+,pr
.L0604583C:
	.long D_060D9154
.L06045840:
	.long VDP2_VRAM + 0x582E0
.L06045844:
	.long 0x00001040
	endlabel func_06045780

	glabel func_06045848
	mov	r8,r13
.L0604584A:
	mov.w	@r2+,r0
	add	r6,r0
	mov.w	r0,@r3
	add	#2,r3
	dt	r13
	bf	.L0604584A
	add	r14,r3
	sub	r8,r3
	sub	r8,r3
	dt	r9
	bf	func_06045848
	rts
	nop
	endlabel func_06045848

	glabel func_06045864
	sts.l	pr,@-r15
	mov.l	.L060458B8,r2
	mov.l	.L060458BC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L060458C0,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	r1,@r3
	mov.l	.L060458C4,r4
	mov.l	@r4,r6
	rotl	r6
	mov.l	.L060458C8,r5
	swap.w	r6,r6
	dmuls.l	r6,r5
	sts	macl,r6
	add	r5,r6
	mov.l	r6,@r4
	mov.w	.L060458B6,r4
	mov	#0,r5
	mov	#-1,r14
	shll8	r14
	mov.l	r4,@(0,r14)
	mov.l	r5,@(16,r14)
	mov.l	r6,@(20,r14)
	mov.l	@(24,r14),r6
	add	#60,r6
	mov.l	r6,@(48,r3)
	mov	#8,r0
	and	r6,r0
	mov	#70,r6
	shll16	r6
	mov.l	r6,@(52,r3)
	mov.l	.L060458CC,r6
	add	r0,r6
	mov.l	@r6+,r0
	mov.l	r0,@(44,r3)
	mov.l	@r6+,r0
	rts
	mov.l	r0,@(8,r3)
.L060458B6:
	.short 0x00F0
.L060458B8:
	.long obj_list_stage
.L060458BC:
	.long obj_alloc
.L060458C0:
	.long func_0604566E
.L060458C4:
	.long D_06045668
.L060458C8:
	.long 0x0D81A52B
.L060458CC:
	.long D_060458D0
	dlabel D_060458D0
	.long D_060D9188
	.long D_060D92E4
	.long D_060D935A
	.long D_060D9486
	endlabel func_06045864

	glabel func_060458E0
	sts.l	pr,@-r15
	bsr	func_06045780
	nop
	lds.l	@r15+,pr
	mov.b	@(1,r1),r0
	tst	r0,r0
	bf	.L0604595C
	mov.l	.L0604590C,r2
	mov.w	@(2,r2),r0
	add	#-1,r0
	mov.w	r0,@(2,r2)
	cmp/pl	r0
	bt	.L0604595C
	mov	#1,r0
	mov.w	r0,@r2
	mov.b	r0,@(107,gbr)
	mov.w	@(28,gbr),r0
	tst	#16,r0
	bt	.L06045914
	mov.l	.L06045910,r3
	bra	.L06045926
	mov.b	@r3,r0
.L0604590C:
	.long D_060D9074
.L06045910:
	.long D_060D907C
.L06045914:
	mov.l	.L06045948,r3
	mov.b	@(9,r2),r0
	add	#1,r0
	mov	#6,r8
	cmp/ge	r8,r0
	bf	.L06045922
	mov	#0,r0
.L06045922:
	mov.b	r0,@(9,r2)
	mov.b	@(r0,r3),r0
.L06045926:
	mov.b	r0,@(21,gbr)
	sts.l	pr,@-r15
	mov.l	.L0604594C,r2
	mov.l	.L06045950,r0
	jsr	@r0
	nop
	mov.l	.L06045954,r0
	mov.l	r0,@(12,r3)
	lds.l	@r15+,pr
	mov.l	.L06045958,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.w	.L06045946,r0
	mov.w	r0,@r1
	rts
	nop
.L06045946:
	.short 0x0081
.L06045948:
	.long D_06046160
.L0604594C:
	.long obj_list_stage
.L06045950:
	.long obj_alloc
.L06045954:
	.long func_06032FB4
.L06045958:
	.long func_06045D8E
.L0604595C:
	mov.w	@(500,gbr),r0
	cmp/pz	r0
	bf	.L0604599C
	mov	#79,r0
	tst.b	#128,@(r0,gbr)
	bt	.L0604599C
	mov.w	.L06045992,r0
	mov.w	r0,@(2,r1)
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#0,r6
	mov.l	.L06045994,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L06045998,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L06045992:
	.short 0x00FF
.L06045994:
	.long snd_seq_start
.L06045998:
	.long func_060459A8
.L0604599C:
	sts.l	pr,@-r15
	lds.l	@r15+,pr
	sts.l	pr,@-r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_060458E0

	glabel func_060459A8
	sts.l	pr,@-r15
	bsr	func_06045780
	nop
	mov.l	.L060459D4,r2
	mov.l	.L060459D8,r0
	jsr	@r0
	nop
	mov.l	.L060459DC,r0
	mov.l	r0,@(12,r3)
	bsr	func_06045A50
	nop
	mov.l	.L060459E0,r3
	mov	#0,r0
	mov.w	r0,@r3
	mov.w	.L060459D2,r0
	mov.w	r0,@r1
	mov.l	.L060459E4,r8
	lds.l	@r15+,pr
	mov.l	r8,@-r1
	rts
	add	#4,r1
.L060459D2:
	.short 0x0030
.L060459D4:
	.long obj_list_stage
.L060459D8:
	.long obj_alloc
.L060459DC:
	.long func_06032FD4
.L060459E0:
	.long D_060455DC + 0x90
.L060459E4:
	.long D_060459E8
	dlabel D_060459E8
	.byte 0x60, 0x11, 0x70, 0xFF, 0x21, 0x01, 0x40, 0x15, 0x89, 0x19
	endlabel func_060459A8

	glabel func_060459F2
	sts.l	pr,@-r15
	mov.l	r1,@-r15
	mov.l	.L06045A34,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	mov.l	.L06045A38,r8
	mov.l	r8,@-r1
	add	#4,r1
	mov	#2,r4
	mov.l	.L06045A3C,r0
	mov.b	@(r0,r4),r4
	mov.w	@(224,gbr),r0
	mov.w	.L06045A32,r8
	and	r8,r0
	or	r4,r0
	mov.w	r0,@(224,gbr)
	mov.l	.L06045A40,r3
	mov.l	@r3,r3
	mov.l	.L06045A44,r0
	mov.l	r0,@(48,r3)
	mov.l	.L06045A48,r0
	mov.l	r0,@(52,r3)
	mov.l	.L06045A4C,r0
	mov.l	r0,@(56,r3)
	lds.l	@r15+,pr
	sts.l	pr,@-r15
	bsr	func_06045780
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06045A32:
	.short 0xFFF0
.L06045A34:
	.long load_sel_program
.L06045A38:
	.long func_06045F0C
.L06045A3C:
	.long lbl_0602B7E4
.L06045A40:
	.long active_cam_obj
.L06045A44:
	.long 0x10300000
.L06045A48:
	.long 0x01F40000
.L06045A4C:
	.long 0x10000000
	endlabel func_060459F2

	glabel func_06045A50
	sts.l	pr,@-r15
	mov.l	.L06045AEC,r2
	mov.l	.L06045AF0,r0
	jsr	@r0
	nop
	mov.l	.L06045AF4,r0
	mov.l	r0,@(12,r3)
	mov.l	.L06045AF8,r2
	mov.l	.L06045AF0,r0
	jsr	@r0
	nop
	mov.l	.L06045AFC,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L06045B00,r0
	mov.l	r0,@(48,r3)
	mov.l	.L06045B04,r0
	mov.l	r0,@(52,r3)
	mov.l	.L06045B08,r10
	mov.l	r0,@r10
	mov.l	.L06045B00,r0
	mov.l	r0,@(56,r3)
	mov.w	.L06045AE6,r0
	mov.w	r0,@(24,r3)
	mov.l	.L06045AF8,r2
	mov.l	.L06045AF0,r0
	jsr	@r0
	nop
	mov.l	.L06045B0C,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L06045B10,r0
	mov.l	r0,@(48,r3)
	mov.l	.L06045B04,r0
	mov.l	r0,@(52,r3)
	mov.l	.L06045B00,r0
	mov.l	r0,@(56,r3)
	mov.w	.L06045AE8,r0
	mov.w	r0,@(24,r3)
	mov.l	.L06045AF8,r2
	mov.l	.L06045AF0,r0
	jsr	@r0
	nop
	mov.l	.L06045B14,r0
	mov.l	r0,@(12,r3)
	mov.l	.L06045AF8,r2
	mov.l	.L06045AF0,r0
	jsr	@r0
	nop
	mov.l	.L06045B18,r0
	mov.l	r0,@(12,r3)
	mov.l	.L06045B1C,r4
	mov	#0,r0
	mov.l	r0,@r4
	mov.l	r0,@(4,r4)
	mov.l	r0,@(8,r4)
	mov.l	r0,@(12,r4)
	mov.l	r0,@(16,r4)
	mov.l	r0,@(20,r4)
	mov.l	.L06045AF8,r2
	mov.l	.L06045AF0,r0
	jsr	@r0
	nop
	mov.l	.L06045B20,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L06045B24,r0
	mov.l	r0,@(48,r3)
	mov.l	.L06045B24,r0
	mov.l	r0,@(52,r3)
	mov.l	.L06045B24,r0
	mov.l	r0,@(56,r3)
	lds.l	@r15+,pr
	rts
	nop
.L06045AE6:
	.short 0x0000
.L06045AE8:
	.short 0x6000
	.byte 0x00, 0x00
.L06045AEC:
	.long obj_list_core
.L06045AF0:
	.long obj_alloc
.L06045AF4:
	.long func_0602FF50
.L06045AF8:
	.long obj_list_manager
.L06045AFC:
	.long func_06021E2A
.L06045B00:
	.long 0x10000000
.L06045B04:
	.long 0x02000000
.L06045B08:
	.long D_0602FF34
.L06045B0C:
	.long func_06021F34
.L06045B10:
	.long 0x10600000
.L06045B14:
	.long func_0604E2B8
.L06045B18:
	.long D_060342CC + 0x180
.L06045B1C:
	.long D_060F30A8
.L06045B20:
	.long func_06045BC0
.L06045B24:
	.long 0x00000000
	.byte 0xD2, 0x21, 0xE0, 0xFF, 0x22, 0x02, 0x12, 0x01, 0xD0, 0x20, 0x60, 0x02, 0xD3, 0x20, 0x33, 0x0C
	.byte 0xE6, 0x50, 0xD0, 0x20, 0x60, 0x00, 0x26, 0x0E, 0x06, 0x1A, 0x76, 0x40, 0x36, 0x3C, 0xE0, 0x00
	.byte 0x80, 0x20, 0x84, 0x60, 0x40, 0x11, 0x8B, 0x13, 0x70, 0xFD, 0x69, 0x03, 0xE0, 0x04, 0x80, 0x21
	.byte 0x84, 0x62, 0x40, 0x11, 0x8B, 0x0C, 0x70, 0xFD, 0x29, 0x09, 0xE0, 0x08, 0x80, 0x22, 0x84, 0x64
	.byte 0x40, 0x11, 0x8B, 0x05, 0x70, 0xFD, 0x29, 0x09, 0x49, 0x11, 0x89, 0x01, 0xE0, 0x0C, 0x80, 0x23
	.byte 0xE0, 0x06, 0x80, 0x27, 0x84, 0x63, 0x40, 0x11, 0x8B, 0x13, 0x70, 0xFD, 0x69, 0x03, 0xE0, 0x02
	.byte 0x80, 0x26, 0x84, 0x61, 0x40, 0x11, 0x8B, 0x0C, 0x70, 0xFD, 0x29, 0x09, 0xE0, 0x0A, 0x80, 0x25
	.byte 0x84, 0x65, 0x40, 0x11, 0x8B, 0x05, 0x70, 0xFD, 0x29, 0x09, 0x49, 0x11, 0x89, 0x01, 0xE0, 0x0E
	.byte 0x80, 0x24, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x00
	.long D_060C084C
	.long D_060CB014
	.byte 0x00, 0x00, 0x05, 0x28
	.long D_060CB003
	endlabel func_06045A50

	glabel func_06045BC0
	mov.l	.L06045BFC,r4
	mov.l	@r4,r4
	mov.w	.L06045BF4,r0
	mov.w	r0,@(2,r4)
	mov.w	r0,@(2,r1)
	mov	#2,r0
	mov.b	r0,@(4,r4)
	mov.w	.L06045BF6,r0
	mov.w	r0,@(0,r1)
	mov.w	.L06045BF8,r0
	mov.w	r0,@(22,r1)
	mov.w	.L06045BFA,r0
	mov.w	r0,@(24,r1)
	mov.l	.L06045C00,r4
	mov.l	r1,@r4
	mov	#0,r0
	mov.b	r0,@(5,r1)
	mov.b	r0,@(4,r1)
	mov.l	.L06045C04,r4
	mov.l	@r4,r4
	mov.l	r4,@(16,r1)
	mov.l	.L06045C08,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L06045BF4:
	.short 0x0040
.L06045BF6:
	.short 0x0200
.L06045BF8:
	.short 0x0B00
.L06045BFA:
	.short 0x9D00
.L06045BFC:
	.long cam_obj
.L06045C00:
	.long active_cam_obj
.L06045C04:
	.long player_obj
.L06045C08:
	.long func_06045C0C
	endlabel func_06045BC0

	glabel func_06045C0C
	sts.l	pr,@-r15
	mov.b	@(0,gbr),r0
	cmp/eq	#0,r0
	bf	.L06045C14
.L06045C14:
	mov.b	@(5,r1),r0
	tst	r0,r0
	bt	.L06045C70
	cmp/eq	#2,r0
	bf	.L06045C3C
	mov.l	@(16,r1),r4
	mov.l	@(48,r4),r0
	mov.l	@(32,r1),r8
	add	r8,r0
	mov.l	r0,@(48,r1)
	mov.l	@(52,r4),r0
	mov.l	@(36,r1),r8
	add	r8,r0
	mov.l	r0,@(52,r1)
	mov.l	@(56,r4),r0
	mov.l	@(40,r1),r8
	add	r8,r0
	mov.l	r0,@(56,r1)
	bra	.L06045C70
	nop
.L06045C3C:
	cmp/eq	#1,r0
	bf	.L06045C70
	mov.w	@(12,r1),r0
	mov.w	r0,@(14,r1)
	mov.l	@(32,r1),r4
	mov.l	@(48,r1),r8
	sub	r8,r4
	mov.l	r4,@(32,r1)
	mov.l	@(36,r1),r5
	mov.l	@(52,r1),r8
	sub	r8,r5
	mov.l	r5,@(36,r1)
	mov.l	@(40,r1),r6
	mov.l	@(56,r1),r8
	sub	r8,r6
	mov.l	r6,@(40,r1)
	mov	#0,r0
	mov.b	r0,@(5,r1)
	mov	#64,r13
	add	r1,r13
	mov.l	@(48,r1),r0
	mov.l	r0,@(0,r13)
	mov.l	@(52,r1),r0
	mov.l	r0,@(4,r13)
	mov.l	@(56,r1),r0
	mov.l	r0,@(8,r13)
.L06045C70:
	bsr	func_06045C7E
	nop
	bsr	func_06045CE8
	nop
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06045C0C

	glabel func_06045C7E
	mov.w	@(12,r1),r0
	cmp/pl	r0
	bt	.L06045C88
	rts
	nop
.L06045C88:
	mov	#64,r13
	add	r1,r13
	add	#-1,r0
	mov.w	r0,@(12,r1)
	mov	r0,r8
	mov.w	@(14,r1),r0
	sub	r0,r8
	neg	r8,r8
	mov.l	@(32,r1),r4
	dmuls.l	r4,r8
	sts	mach,r10
	sts	macl,r4
	xtrct	r10,r4
	mov	#-128,r14
	shll	r14
	mov.l	r0,@(0,r14)
	mov.l	r4,@(4,r14)
	mov.l	@(28,r14),r4
	shll16	r4
	mov.l	@(0,r13),r9
	add	r4,r9
	mov.l	r9,@(48,r1)
	mov.l	@(36,r1),r4
	dmuls.l	r4,r8
	sts	mach,r10
	sts	macl,r4
	xtrct	r10,r4
	mov.l	r0,@(0,r14)
	mov.l	r4,@(4,r14)
	mov.l	@(28,r14),r5
	shll16	r5
	mov.l	@(4,r13),r9
	add	r5,r9
	mov.l	r9,@(52,r1)
	mov.l	@(40,r1),r4
	dmuls.l	r4,r8
	sts	mach,r10
	sts	macl,r4
	xtrct	r10,r4
	mov.l	r0,@(0,r14)
	mov.l	r4,@(4,r14)
	mov.l	@(28,r14),r6
	shll16	r6
	mov.l	@(8,r13),r9
	add	r6,r9
	mov.l	r9,@(56,r1)
	rts
	nop
	endlabel func_06045C7E

	glabel func_06045CE8
	rts
	nop
	.byte 0xC4, 0x50, 0xC8, 0x08, 0x89, 0x1C, 0x55, 0x1D, 0xC5, 0x28, 0xD6, 0x0C, 0xE8, 0x00, 0xC8, 0x01
	.byte 0x89, 0x00, 0x68, 0x6B, 0xC8, 0x02, 0x89, 0x00, 0x68, 0x63, 0x35, 0x8C, 0x11, 0x5D, 0x55, 0x1C
	.byte 0xC5, 0x28, 0xD6, 0x06, 0xE8, 0x00, 0xC8, 0x04, 0x89, 0x00, 0x68, 0x6B, 0xC8, 0x08, 0x89, 0x00
	.byte 0x68, 0x63, 0x35, 0x8C, 0x11, 0x5C, 0xA0, 0x31, 0x00, 0x09, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00
	.byte 0xC4, 0x50, 0xC8, 0x10, 0x8B, 0x2A, 0xE6, 0x00, 0xC4, 0x50, 0xC8, 0x02, 0x89, 0x00, 0xE6, 0x04
	.byte 0xC8, 0x01, 0x89, 0x00, 0xE6, 0xFC, 0xC8, 0x04, 0x89, 0x01, 0x46, 0x00, 0x46, 0x00, 0x85, 0x11
	.byte 0x30, 0x6C, 0x81, 0x11, 0x85, 0x1B, 0x65, 0x03, 0xC5, 0x28, 0x96, 0x19, 0xE8, 0x00, 0xC8, 0x01
	.byte 0x89, 0x00, 0x68, 0x6B, 0xC8, 0x02, 0x89, 0x00, 0x68, 0x63, 0x35, 0x8C, 0x60, 0x53, 0x81, 0x1B
	.byte 0x85, 0x1C, 0x65, 0x03, 0xC5, 0x28, 0x96, 0x0B, 0xE8, 0x00, 0xC8, 0x04, 0x89, 0x00, 0x68, 0x6B
	.byte 0xC8, 0x08, 0x89, 0x00, 0x68, 0x63, 0x35, 0x8C, 0x60, 0x53, 0x81, 0x1C, 0x00, 0x0B, 0x00, 0x09
	.byte 0xFF, 0x00
	endlabel func_06045CE8

	glabel func_06045D8E
	sts.l	pr,@-r15
	bsr	func_06045780
	nop
	lds.l	@r15+,pr
	mov.w	@r1,r0
	add	#-1,r0
	mov.w	r0,@r1
	tst	r0,r0
	bf	.L06045E7C
	mov.w	.L06045DE0,r5
	mov	#0,r3
	mov.l	.L06045DE4,r2
.L06045DA6:
	mov.w	r3,@r2
	add	#2,r2
	dt	r5
	bf	.L06045DA6
	sts.l	pr,@-r15
	mov.l	.L06045DE8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.w	@(28,gbr),r0
	tst	#16,r0
	bt	.L06045DF4
	mov.l	.L06045DEC,r2
	mov.b	@(77,gbr),r0
	tst	#64,r0
	bt	.L06045DF4
	mov	#2,r0
	mov.w	r0,@r2
	mov.b	r0,@(107,gbr)
	mov.l	.L06045DF0,r3
	mov	#0,r0
	mov.w	.L06045DE2,r14
.L06045DD2:
	mov.l	r0,@r3
	dt	r14
	bf/s	.L06045DD2
	add	#4,r3
	bt	.L06045E24
	bra	.L06045DF4
	nop
.L06045DE0:
	.short 0x00E0
.L06045DE2:
	.short 0x2400
.L06045DE4:
	.long VDP2_VRAM + 0x5E200
.L06045DE8:
	.long func_0601ECE8
.L06045DEC:
	.long D_060D9074
.L06045DF0:
	.long bss_start
.L06045DF4:
	mov.b	@(107,gbr),r0
	tst	r0,r0
	bt	.L06045E24
	mov.w	@(28,gbr),r0
	tst	#16,r0
	bf	.L06045E0E
	mov.l	.L06045E1C,r2
	mov	#2,r0
	mov.b	r0,@r2
	mov.b	@(21,gbr),r0
	shlr	r0
	mov	#16,r0
	bf	.L06045E10
.L06045E0E:
	mov	#13,r0
.L06045E10:
	mov.b	r0,@(0,gbr)
	mov.l	.L06045E20,r2
	mov	#-1,r0
	rts
	mov.w	r0,@r2
	.byte 0x00, 0x00
.L06045E1C:
	.long movie_id
.L06045E20:
	.long soft_reset_allowed
.L06045E24:
	mov.l	.L06045E88,r4
	mov.l	@r4,r4
	mov.l	@(8,r4),r12
	mov.b	@(6,r4),r0
	cmp/eq	#2,r0
	mov.w	.L06045E80,r0
	bt	.L06045E34
	mov.w	.L06045E82,r0
.L06045E34:
	mov.w	r0,@(22,r12)
	mov.l	@(12,r4),r13
	mov	#48,r4
	add	r13,r4
	mov	#1,r0
	mov.b	r0,@r4
	mov	#0,r0
	mov.b	r0,@(0,gbr)
	mov.l	.L06045E8C,r4
	mov	#-1,r0
	mov.w	r0,@r4
	mov.l	.L06045E90,r4
	mov.l	@r4,r4
	mov	#2,r0
	mov.b	r0,@(5,r4)
	mov	#0,r0
	mov.w	r0,@(0,r4)
	mov.l	.L06045E88,r5
	mov.l	@r5,r5
	mov.l	r5,@(16,r4)
	mov.w	.L06045E84,r0
	mov.w	r0,@(28,r5)
	mov.l	@(48,r5),r8
	mov.l	@(48,r4),r0
	sub	r8,r0
	mov.l	r0,@(32,r4)
	mov.l	@(52,r5),r8
	mov.l	@(52,r4),r0
	sub	r8,r0
	mov.l	r0,@(36,r4)
	mov.l	@(56,r5),r8
	mov.l	@(56,r4),r0
	sub	r8,r0
	mov.l	r0,@(40,r4)
	mov	#1,r0
	mov.b	r0,@(148,gbr)
.L06045E7C:
	rts
	nop
.L06045E80:
	.short 0x00C1
.L06045E82:
	.short 0x00AA
.L06045E84:
	.short 0x1801
	.byte 0x00, 0x00
.L06045E88:
	.long player_obj
.L06045E8C:
	.long soft_reset_allowed
.L06045E90:
	.long active_cam_obj
	endlabel func_06045D8E

	.section .data.06045E94,"aw",@progbits
	.p2align 2
	.byte 0x60, 0x11, 0x70, 0xFF, 0x21, 0x01, 0x20, 0x08, 0x89, 0x01, 0xAD, 0x7F, 0x00, 0x09, 0xD2, 0x03
	.byte 0xE0, 0xFF, 0x22, 0x01, 0xE0, 0x04, 0xC0, 0x00, 0xAD, 0x78, 0x00, 0x09
	.long soft_reset_allowed
	.byte 0x60, 0x11, 0x70, 0xFF, 0x21, 0x01, 0x20, 0x08, 0x89, 0x01, 0xAD, 0x6F, 0x00, 0x09, 0xD2, 0x03
	.byte 0xE0, 0xFF, 0x22, 0x01, 0xE0, 0x0A, 0xC0, 0x00, 0xAD, 0x68, 0x00, 0x09
	.long soft_reset_allowed
