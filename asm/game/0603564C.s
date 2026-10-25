	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603564C,"ax",@progbits
	.p2align 2
	.byte 0x20, 0x22

	glabel func_0603564E
	sts.l	pr,@-r15
	mov.l	.L06035674,r0
	mov.l	.L06035678,r2
	jsr	@r0
	nop
	mov.l	.L0603567C,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov.l	.L06035680,r2
	mov.l	r3,@r2
	lds.l	@r15+,pr
	mov.l	.L06035684,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
	.long D_06035A6C
	.byte 0xDE, 0xAD, 0x0B, 0xAD
.L06035674:
	.long obj_alloc
.L06035678:
	.long obj_list_stage
.L0603567C:
	.long func_06035688
.L06035680:
	.long D_06035A70
.L06035684:
	.long D_06035A6C + 0x8
	endlabel func_0603564E

	glabel func_06035688
	rts
	nop
	endlabel func_06035688

	glabel func_0603568C
	mov.l	.L060356BC,r3
	mov	#0,r4
	mov.l	r4,@r3
	mov.l	.L060356C0,r3
	mov.l	r4,@r3
	mov.l	.L060356C4,r3
	mov.b	r4,@r3
	mov.b	@(107,gbr),r0
	cmp/eq	#1,r0
	bt	.L060356F0
	cmp/eq	#0,r0
	bt	.L060356D4
	mov.l	.L060356C8,r5
	mov.b	@(22,gbr),r0
	and	#254,r0
	shll2	r0
	shll	r0
	mov.l	.L060356CC,r2
	add	r0,r2
	mov.l	.L060356D0,r3
	mov.w	@r2,r0
	bra	.L060356EA
	mov.w	r0,@r3
	.byte 0x00, 0x00
.L060356BC:
	.long snd_variant_weights_cur
.L060356C0:
	.long D_060CFFCC
.L060356C4:
	.long D_060CFFA2
.L060356C8:
	.long D_060CE000
.L060356CC:
	.long 0x002FF000
.L060356D0:
	.long snd_tone_select
.L060356D4:
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bt	.L060356DC
	rts
.L060356DC:
	mov	#12,r2
	cmp/ge	r2,r0
	bt	.L06035708
	shll2	r0
	shll8	r0
	mov.l	.L0603587C,r5
	add	r0,r5
.L060356EA:
	mov.l	@r5,r0
	cmp/eq	#-1,r0
	bf	.L0603570A
.L060356F0:
	mov.l	.L06035880,r2
	mov	#-1,r0
	mov.b	r0,@(0,r2)
	mov	#0,r0
	mov.l	r0,@(4,r2)
	mov.l	r0,@(8,r2)
	mov.b	@(20,gbr),r0
	mov.l	.L06035884,r2
	shll2	r0
	mov.l	@(r0,r2),r5
	cmp/pl	r5
	bt	.L06035722
.L06035708:
	rts
.L0603570A:
	mov.b	@(20,gbr),r0
	shll2	r0
	shll	r0
	mov.l	.L06035888,r2
	add	r0,r2
	mov.l	@r2,r0
	mov.l	.L06035880,r3
	mov.l	r0,@r3
	mov.l	@(4,r2),r0
	mov.l	r0,@(4,r3)
	mov.l	@(8,r2),r0
	mov.l	r0,@(8,r3)
.L06035722:
	mov.l	.L0603588C,r2
	mov.l	.L06035890,r3
	mov.l	r2,@r3
	mov	#-1,r0
	mov.l	r0,@(8,r2)
.L0603572C:
	mov	#0,r0
	mov.b	@(r0,r5),r8
	mov	#64,r0
	mov.b	r8,@(r0,r2)
	mov	#65,r0
	mov.b	r8,@(r0,r2)
	mov	#1,r0
	mov.b	@(r0,r5),r8
	mov	#66,r0
	mov.b	r8,@(r0,r2)
	mov	#2,r0
	mov.b	@(r0,r5),r8
	mov	#67,r0
	mov.b	r8,@(r0,r2)
	mov	#3,r0
	mov.b	@(r0,r5),r8
	mov	#68,r0
	mov.b	r8,@(r0,r2)
	mov	#4,r0
	mov.b	@(r0,r5),r8
	mov	#69,r0
	mov.b	r8,@(r0,r2)
	mov	#5,r0
	mov.b	@(r0,r5),r8
	mov	#70,r0
	mov.b	r8,@(r0,r2)
	mov	#6,r0
	mov.b	@(r0,r5),r8
	mov	#71,r0
	mov.b	r8,@(r0,r2)
	mov	#7,r0
	mov.b	@(r0,r5),r8
	mov	#72,r0
	mov.b	r8,@(r0,r2)
	mov.b	@(9,r5),r0
	mov.b	r0,@(14,r2)
	mov.b	@(8,r5),r0
	mov.b	r0,@(15,r2)
	extu.b	r0,r0
	shll2	r0
	shlr8	r0
	mov.l	.L06035894,r8
	mov.b	@(r0,r8),r4
	add	#1,r4
	mov.b	r4,@(r0,r8)
	mov	#10,r0
	mov.b	@(r0,r5),r8
	mov	#96,r0
	mov.b	r8,@(r0,r2)
	mov	#11,r0
	mov.b	@(r0,r5),r8
	mov	#97,r0
	mov.b	r8,@(r0,r2)
	mov	#12,r0
	mov.b	@(r0,r5),r8
	mov	#98,r0
	mov.b	r8,@(r0,r2)
	mov	#13,r0
	mov.b	@(r0,r5),r8
	mov	#99,r0
	mov.b	r8,@(r0,r2)
	mov	#14,r0
	mov.b	@(r0,r5),r8
	mov	#100,r0
	mov.b	r8,@(r0,r2)
	mov	#15,r0
	mov.b	@(r0,r5),r8
	mov	#101,r0
	mov.b	r8,@(r0,r2)
	mov	#16,r0
	mov.b	@(r0,r5),r8
	mov	#102,r0
	mov.b	r8,@(r0,r2)
	mov	#17,r0
	mov.b	@(r0,r5),r8
	mov	#103,r0
	mov.b	r8,@(r0,r2)
	mov	#18,r0
	mov.b	@(r0,r5),r8
	mov	#104,r0
	mov.b	r8,@(r0,r2)
	mov	#19,r0
	mov.b	@(r0,r5),r8
	mov	#105,r0
	mov.b	r8,@(r0,r2)
	mov	#20,r0
	mov.b	@(r0,r5),r8
	mov	#106,r0
	mov.b	r8,@(r0,r2)
	mov	#21,r0
	mov.b	@(r0,r5),r8
	mov	#107,r0
	mov.b	r8,@(r0,r2)
	mov	#22,r0
	mov.b	@(r0,r5),r8
	shll8	r8
	extu.w	r8,r8
	mov	#120,r0
	mov.l	r8,@(r0,r2)
	mov	#23,r0
	mov.b	@(r0,r5),r8
	mov	#12,r0
	mov.b	r8,@(r0,r2)
	mov.w	@(24,r5),r0
	shll16	r0
	mov.l	r0,@(48,r2)
	mov.w	@(26,r5),r0
	shll16	r0
	mov.l	r0,@(52,r2)
	mov.w	@(28,r5),r0
	shll16	r0
	mov.l	r0,@(56,r2)
	mov.w	@(30,r5),r0
	shll16	r0
	mov.l	r0,@(60,r2)
	mov	#0,r0
	mov.b	r0,@(13,r2)
	mov.l	r0,@(16,r2)
	mov.l	r0,@(20,r2)
	mov.l	r0,@(24,r2)
	mov.l	r0,@(28,r2)
	mov.l	r0,@(32,r2)
	mov.l	r0,@(36,r2)
	mov.l	r0,@(40,r2)
	mov.l	r0,@(44,r2)
	mov.l	r0,@r2
	mov	#120,r0
	mov.l	@(r0,r2),r4
	tst	r4,r4
	bf	.L06035834
	mov.w	.L06035878,r4
	mov.l	r4,@(r0,r2)
.L06035834:
	mov	#0,r4
	mov	#116,r0
	mov.l	r4,@(r0,r2)
	mov.l	@(60,r2),r4
	mov.b	@(14,r2),r0
	shlr16	r4
	mov	#2,r3
	and	r3,r4
	or	r4,r0
	mov.b	r0,@(14,r2)
	mov.b	@(15,r2),r0
	and	#48,r0
	cmp/eq	#0,r0
	bt	.L06035860
	mov	#66,r0
	mov.b	@(r0,r2),r0
	mov.l	.L06035898,r3
	and	#3,r0
	add	r0,r3
	mov.b	@r3,r0
	add	#1,r0
	mov.b	r0,@r3
.L06035860:
	mov	r2,r8
	mov.w	.L0603587A,r0
	add	r0,r8
	mov.l	r2,@(8,r8)
	mov.l	r8,@(4,r2)
	mov	r8,r2
	add	#32,r5
	mov.l	@r5,r0
	cmp/eq	#-1,r0
	bt	.L0603589C
	bra	.L0603572C
	nop
.L06035878:
	.short 0x2EE0
.L0603587A:
	.short 0x0080
.L0603587C:
	.long 0x002FC000
.L06035880:
	.long snd_tone_select
.L06035884:
	.long D_060394E0
.L06035888:
	.long 0x002FF000
.L0603588C:
	.long D_060CC000
.L06035890:
	.long D_060CFFC4
.L06035894:
	.long D_060CFFCC
.L06035898:
	.long snd_variant_weights_cur
.L0603589C:
	mov	r2,r8
	mov.w	.L060358CA,r0
	add	r0,r8
	mov	#-1,r9
	mov.l	r9,@(4,r8)
	mov.l	.L060358D0,r5
	mov.l	.L060358D4,r0
	cmp/eq	r5,r2
	bt	.L060358DE
	mov.l	r2,@r0
	mov	#-1,r0
	mov.l	r0,@(8,r2)
	mov.w	.L060358CC,r8
.L060358B6:
	mov	#-1,r0
	mov.l	r0,@r2
	mov	r2,r3
	add	r8,r3
	cmp/eq	r5,r3
	bt	.L060358D8
	mov.l	r3,@(4,r2)
	mov.l	r2,@(8,r3)
	bra	.L060358B6
	mov	r3,r2
.L060358CA:
	.short 0xFF80
.L060358CC:
	.short 0x0080
	.byte 0x00, 0x00
.L060358D0:
	.long D_060CFF80
.L060358D4:
	.long D_060CFFC8
.L060358D8:
	mov	#-1,r3
	bra	.L060358E2
	mov.l	r3,@(4,r2)
.L060358DE:
	mov	#-1,r2
	mov.l	r2,@r0
.L060358E2:
	sts.l	pr,@-r15
	mov.l	.L060359AC,r3
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r3),r3
	mov.l	.L060359B0,r14
	mov.l	.L060359B4,r2
	bsr	func_060359FA
	mov	r2,r0
	mov.l	@r3+,r6
	bsr	func_060359EC
	mov.l	@r3+,r7
	bsr	func_060359FA
	mov	r2,r0
	mov.l	@r3+,r6
	bsr	func_060359EC
	mov.l	@r3+,r7
	bsr	func_060359FA
	mov	r2,r0
	mov.l	@r3+,r6
	bsr	func_060359EC
	mov.l	@r3+,r7
	bsr	func_060359FA
	mov	r2,r0
	mov.l	@r3+,r6
	bsr	func_060359EC
	mov.l	@r3+,r7
	bsr	func_060359FA
	mov	r2,r0
	mov.l	@r3+,r6
	bsr	func_060359EC
	mov.l	@r3+,r7
	mov.l	.L060359B8,r14
	mov.l	.L060359BC,r2
	bsr	func_060359FA
	mov	r2,r0
	mov.l	@r3+,r6
	bsr	func_06035A04
	mov.l	@r3+,r7
	bsr	func_060359FA
	mov	r2,r0
	mov.l	@r3+,r6
	bsr	func_06035A04
	mov.l	@r3+,r7
	bsr	func_060359FA
	mov	r2,r0
	mov.l	@r3+,r6
	bsr	func_06035A04
	mov.l	@r3+,r7
	bsr	func_060359FA
	mov	r2,r0
	mov.l	@r3+,r6
	bsr	func_06035A04
	mov.l	@r3+,r7
	bsr	func_060359FA
	mov	r2,r0
	mov.l	@r3+,r6
	bsr	func_06035A04
	mov.l	@r3+,r7
	mov.b	@(20,gbr),r0
	mov.l	.L060359C0,r3
	shlr	r0
	shll2	r0
	mov	r0,r14
	mov.l	.L060359C4,r2
	mov.l	@(r0,r3),r7
	bsr	func_060359EC
	mov	#4,r6
	mov	r14,r0
	mov.l	.L060359C8,r3
	mov.l	.L060359CC,r2
	mov.l	@(r0,r3),r7
	bsr	func_060359EC
	mov	#4,r6
	mov.l	.L060359D0,r2
	mov.l	.L060359D4,r0
	jsr	@r0
	nop
	mov.l	.L060359D8,r0
	mov.l	r0,@(12,r3)
	mov.l	.L060359DC,r2
	mov.l	.L060359D4,r0
	jsr	@r0
	nop
	mov.l	.L060359E0,r0
	mov.l	r0,@(12,r3)
	mov.l	.L060359E4,r8
	mov.b	@r8,r0
	cmp/pl	r0
	bf	.L060359A4
	mov.l	.L060359D0,r2
	mov.l	.L060359D4,r0
	jsr	@r0
	nop
	mov.l	.L060359E8,r0
	mov.l	r0,@(12,r3)
.L060359A4:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L060359AC:
	.long D_06039520
.L060359B0:
	.long D_060CFFD8
.L060359B4:
	.long VDP1_VRAM + 0x57700
.L060359B8:
	.long D_060CFFEC
.L060359BC:
	.long VDP1_VRAM + 0x65180
.L060359C0:
	.long D_0603953C
.L060359C4:
	.long D_06039574
.L060359C8:
	.long D_06039558
.L060359CC:
	.long D_06039584
.L060359D0:
	.long obj_list_stage
.L060359D4:
	.long obj_alloc
.L060359D8:
	.long func_060391F8
.L060359DC:
	.long obj_list_manager
.L060359E0:
	.long D_06035648
.L060359E4:
	.long D_060CFFCC
.L060359E8:
	.long func_0603B408
	endlabel func_0603568C

	glabel func_060359EC
	mov.l	@r7+,r0
	mov.l	r0,@r2
	dt	r6
	bf/s	func_060359EC
	add	#4,r2
	rts
	nop
	endlabel func_060359EC

	glabel func_060359FA
	shlr2	r0
	shlr	r0
	mov.l	r0,@r14
	rts
	add	#4,r14
	endlabel func_060359FA

	glabel func_06035A04
	sts.l	pr,@-r15
	mov.l	r1,@-r15
	mov.l	r3,@-r15
	mov.l	r14,@-r15
	mov.l	.L06035A50,r1
	shlr2	r6
	shlr2	r6
.L06035A12:
	mov.l	.L06035A54,r3
	mov.l	.L06035A58,r14
.L06035A16:
	mov	#8,r0
	cmp/eq	r0,r14
	bt	.L06035A5C
	mov.l	r14,@-r15
	mov	#16,r14
.L06035A20:
	mov.w	@r7+,r4
	mov.w	@(140,gbr),r0
	mov	r0,r5
	jsr	@r1
	mov	r3,r0
	mov.w	r0,@r2
	dt	r14
	bf/s	.L06035A20
	add	#2,r2
	mov.l	@r15+,r14
	add	#-32,r7
.L06035A36:
	add	#24,r3
	dt	r14
	bf	.L06035A16
	add	#64,r7
	dt	r6
	bf	.L06035A12
	mov.l	@r15+,r14
	mov.l	@r15+,r3
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06035A50:
	.long vdp_rgb555_lerp
.L06035A54:
	.long 0x00000000
.L06035A58:
	.long 0x00000008
.L06035A5C:
	mov	#8,r4
.L06035A5E:
	mov.l	@r7+,r0
	mov.l	r0,@r2
	dt	r4
	bf/s	.L06035A5E
	add	#4,r2
	bra	.L06035A36
	add	#-32,r7
	endlabel func_06035A04

	.section .data.06035A6C,"aw",@progbits
	.p2align 2
	dlabel D_06035A6C
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_06035A70
	.byte 0x00, 0x00, 0x00, 0x00
