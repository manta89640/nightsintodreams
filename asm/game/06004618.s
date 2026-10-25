	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06004618,"ax",@progbits
	.p2align 2
	.byte 0x00, 0x09

	glabel func_0600461A
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	r1,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	macl,@-r15
	sts.l	mach,@-r15
	stc.l	gbr,@-r15
	mov.l	.L0600465C,r0
	ldc	r0,gbr
	mov.l	.L06004660,r0
	jsr	@r0
	nop
	mov.w	@(70,gbr),r0
	tst	r0,r0
	bf	.L060046AC
	mov.w	@(28,gbr),r0
	tst	#8,r0
	bf	.L06004664
	bra	.L060046AC
	nop
	.byte 0x00, 0x00
.L0600465C:
	.long gbr_block
.L06004660:
	.long func_060069B4
.L06004664:
	mov.b	@(35,gbr),r0
	tst	r0,r0
	bt	.L0600466E
	bra	.L060046AC
	nop
.L0600466E:
	mov.l	.L060047C0,r2
	mov	#-1,r0
	mov.w	r0,@r2
	mov	#100,r7
.L06004676:
	dt	r7
	bf	.L06004676
	mov.l	.L060047C4,r2
	mov.l	@r2,r0
	mov.l	.L060047C8,r4
	sub	r0,r4
	cmp/pz	r4
	bf	.L060046AC
	shar	r4
	shar	r4
	shar	r4
	shar	r4
	shar	r4
	shar	r4
	shar	r4
	mov.l	.L060047CC,r0
	jsr	@r0
	nop
	mov.l	r0,@-r15
	mov	#30,r4
	mov.l	.L060047D0,r0
	jsr	@r0
	mov	#7,r5
	mov	r0,r5
	mov.l	.L060047D4,r0
	jsr	@r0
	mov.l	@r15+,r4
.L060046AC:
	bsr	func_060049B0
	nop
	mov	#0,r0
	mov.l	.L060047D8,r4
	mov.b	r0,@r4
	mov.l	.L060047DC,r8
	mov.l	@r8,r0
	tst	r0,r0
	bt	.L060046C2
	jsr	@r0
	nop
.L060046C2:
	mov.b	@(34,gbr),r0
	tst	r0,r0
	bt	.L060046D0
	mov.l	.L060047E0,r2
	mov.l	.L060047E4,r0
	jsr	@r0
	nop
.L060046D0:
	mov.l	.L060047E8,r0
	jsr	@r0
	nop
	mov.b	@(0,gbr),r0
	cmp/eq	#1,r0
	bf	.L06004706
	mov.l	.L060047EC,r3
	mov.l	.L060047F0,r4
	mov.w	.L060047BA,r5
.L060046E2:
	mov.l	.L060047F4,r7
	mov.l	@r7,r7
	mov.l	.L060047F8,r6
	tst	r6,r7
	bf	.L060046E2
	mov.l	.L060047FC,r7
	mov	r4,r6
	mov.l	r6,@(4,r7)
	mov	r3,r6
	mov.l	r6,@r7
	mov	r5,r6
	mov.l	r6,@(8,r7)
	mov.w	.L060047BC,r6
	mov.l	r6,@(12,r7)
	mov	#7,r6
	mov.l	r6,@(20,r7)
	mov.w	.L060047BC,r6
	mov.l	r6,@(16,r7)
.L06004706:
	mov.l	.L06004800,r3
	mov.l	.L06004804,r4
	mov.w	.L060047BE,r5
.L0600470C:
	mov.l	.L060047F4,r7
	mov.l	@r7,r7
	mov.l	.L060047F8,r6
	tst	r6,r7
	bf	.L0600470C
	mov.l	.L060047FC,r7
	mov	r4,r6
	mov.l	r6,@(4,r7)
	mov	r3,r6
	mov.l	r6,@r7
	mov	r5,r6
	mov.l	r6,@(8,r7)
	mov.w	.L060047BC,r6
	mov.l	r6,@(12,r7)
	mov	#7,r6
	mov.l	r6,@(20,r7)
	mov.w	.L060047BC,r6
	mov.l	r6,@(16,r7)
	mov.w	@(116,gbr),r0
	tst	r0,r0
	bt	.L06004828
	mov.w	@(118,gbr),r0
	tst	r0,r0
	bt	.L06004828
	cmp/eq	#1,r0
	bf	.L06004776
	mov.l	.L06004808,r0
	mov.w	@r0,r0
	tst	r0,r0
	bt	.L06004776
	mov.l	.L0600480C,r4
	add	r0,r4
	add	#-4,r4
	mov.l	@r4,r0
	mov.l	.L06004810,r7
	or	r7,r0
	mov.l	r0,@r4
.L06004756:
	mov.l	.L060047F4,r7
	mov.l	@r7,r7
	mov.l	.L060047F8,r6
	tst	r6,r7
	bf	.L06004756
	mov.l	.L060047FC,r7
	mov.l	.L0600480C,r6
	mov.l	r6,@(4,r7)
	mov.w	.L060047BC,r6
	mov.l	r6,@(12,r7)
	mov.l	.L06004814,r6
	mov.l	r6,@(20,r7)
	mov.w	.L060047BC,r6
	mov.l	r6,@(16,r7)
	mov	#0,r0
	mov.w	r0,@(4,gbr)
.L06004776:
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L060047B6
	mov.l	.L06004818,r2
	mov	#0,r0
	mov.w	r0,@r2
	mov.l	.L0600481C,r3
	mov.l	.L06004820,r4
	mov.l	@(740,gbr),r0
	shll	r0
	mov	r0,r5
.L0600478C:
	mov.l	.L060047F4,r7
	mov.l	@r7,r7
	mov.l	.L060047F8,r6
	tst	r6,r7
	bf	.L0600478C
	mov.l	.L060047FC,r7
	mov	r4,r6
	mov.l	r6,@(4,r7)
	mov	r3,r6
	mov.l	r6,@r7
	mov	r5,r6
	mov.l	r6,@(8,r7)
	mov.w	.L060047BC,r6
	mov.l	r6,@(12,r7)
	mov	#7,r6
	mov.l	r6,@(20,r7)
	mov.w	.L060047BC,r6
	mov.l	r6,@(16,r7)
	mov.l	.L06004824,r2
	mov	#1,r1
	mov.w	r1,@r2
.L060047B6:
	bra	.L06004970
	nop
.L060047BA:
	.short 0x0400
.L060047BC:
	.short 0x0101
.L060047BE:
	.short 0x0120
.L060047C0:
	.long 0x21000000
.L060047C4:
	.long D_060FFED8 + 0x20000000
.L060047C8:
	.long 0x00006D60
.L060047CC:
	.long math_bin_to_bcd
.L060047D0:
	.long txt_cell_addr
.L060047D4:
	.long txt_print_hex8
.L060047D8:
	.long D_060FF068
.L060047DC:
	.long D_060FFC08 + 0x20000000
.L060047E0:
	.long obj_list_load_task
.L060047E4:
	.long obj_run_list
.L060047E8:
	.long vdp2_cram_upload
.L060047EC:
	.long linewin_spans_a
.L060047F0:
	.long VDP2_VRAM + 0x5E600
.L060047F4:
	.long SCU_REGS + 0x7C
.L060047F8:
	.long 0x00010030
.L060047FC:
	.long SCU_REGS
.L06004800:
	.long vdp2_shadow
.L06004804:
	.long VDP2_REGS
.L06004808:
	.long D_060FFC04 + 0x20000000
.L0600480C:
	.long dma_table_a
.L06004810:
	.long 0x80000000
.L06004814:
	.long 0x01000007
.L06004818:
	.long VDP1_ENDR
.L0600481C:
	.long vdp1_alt_list_buf
.L06004820:
	.long VDP1_VRAM
.L06004824:
	.long VDP1_PTMR
.L06004828:
	mov.l	.L06004940,r0
	mov.w	@r0,r0
	tst	r0,r0
	bt	.L0600485E
	mov.l	.L06004944,r4
	add	r0,r4
	add	#-4,r4
	mov.l	@r4,r0
	mov.l	.L06004948,r7
	or	r7,r0
	mov.l	r0,@r4
.L0600483E:
	mov.l	.L0600494C,r7
	mov.l	@r7,r7
	mov.l	.L06004950,r6
	tst	r6,r7
	bf	.L0600483E
	mov.l	.L06004954,r7
	mov.l	.L06004944,r6
	mov.l	r6,@(4,r7)
	mov.w	.L0600493C,r6
	mov.l	r6,@(12,r7)
	mov.l	.L06004958,r6
	mov.l	r6,@(20,r7)
	mov.w	.L0600493C,r6
	mov.l	r6,@(16,r7)
	mov	#0,r0
	mov.w	r0,@(6,gbr)
.L0600485E:
	mov.b	@(62,gbr),r0
	tst	r0,r0
	bt	.L06004934
	mov	#0,r0
	mov.b	r0,@(62,gbr)
	mov.l	.L0600495C,r2
	mov	#0,r0
	mov.w	r0,@r2
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L060048A2
	mov.l	.L06004960,r3
	mov.l	.L06004964,r4
	mov.l	@(740,gbr),r0
	shll	r0
	mov	r0,r5
.L0600487E:
	mov.l	.L0600494C,r7
	mov.l	@r7,r7
	mov.l	.L06004950,r6
	tst	r6,r7
	bf	.L0600487E
	mov.l	.L06004954,r7
	mov	r4,r6
	mov.l	r6,@(4,r7)
	mov	r3,r6
	mov.l	r6,@r7
	mov	r5,r6
	mov.l	r6,@(8,r7)
	mov.w	.L0600493C,r6
	mov.l	r6,@(12,r7)
	mov	#7,r6
	mov.l	r6,@(20,r7)
	mov.w	.L0600493C,r6
	mov.l	r6,@(16,r7)
.L060048A2:
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L06004934
	mov.l	@(808,gbr),r0
	mov	r0,r3
	mov.l	.L06004964,r4
	mov.l	.L06004968,r0
	mov.l	@r0,r0
	sub	r3,r0
	mov	r0,r5
	add	#2,r5
	mov.b	@(48,gbr),r0
	cmp/eq	#1,r0
	bf	.L060048C2
	mov.l	@(816,gbr),r0
	mov	r0,r3
.L060048C2:
	mov	r5,r0
	mov.l	r0,@(800,gbr)
.L060048C6:
	mov.l	.L0600494C,r7
	mov.l	@r7,r7
	mov.l	.L06004950,r6
	tst	r6,r7
	bf	.L060048C6
	mov.l	.L06004954,r7
	mov	r4,r6
	mov.l	r6,@(4,r7)
	mov	r3,r6
	mov.l	r6,@r7
	mov	r5,r6
	mov.l	r6,@(8,r7)
	mov.w	.L0600493C,r6
	mov.l	r6,@(12,r7)
	mov	#7,r6
	mov.l	r6,@(20,r7)
	mov.w	.L0600493C,r6
	mov.l	r6,@(16,r7)
	mov.l	@(812,gbr),r0
	mov	r0,r3
	mov.l	.L06004964,r4
	mov.l	@(740,gbr),r0
	add	r0,r4
	mov.l	.L0600496C,r0
	mov.l	@r0,r0
	sub	r3,r0
	mov	r0,r5
	add	#2,r5
	mov.b	@(48,gbr),r0
	cmp/eq	#1,r0
	bf	.L0600490C
	mov	#2,r0
	mov.b	r0,@(47,gbr)
	mov.l	@(820,gbr),r0
	mov	r0,r3
.L0600490C:
	mov	r5,r0
	mov.l	r0,@(804,gbr)
.L06004910:
	mov.l	.L0600494C,r7
	mov.l	@r7,r7
	mov.l	.L06004950,r6
	tst	r6,r7
	bf	.L06004910
	mov.l	.L06004954,r7
	mov	r4,r6
	mov.l	r6,@(4,r7)
	mov	r3,r6
	mov.l	r6,@r7
	mov	r5,r6
	mov.l	r6,@(8,r7)
	mov.w	.L0600493C,r6
	mov.l	r6,@(12,r7)
	mov	#7,r6
	mov.l	r6,@(20,r7)
	mov.w	.L0600493C,r6
	mov.l	r6,@(16,r7)
.L06004934:
	mov	#0,r0
	mov.b	r0,@(111,gbr)
	bra	.L06004976
	nop
.L0600493C:
	.short 0x0101
	.byte 0x00, 0x00
.L06004940:
	.long D_060FFC06 + 0x20000000
.L06004944:
	.long dma_table_b
.L06004948:
	.long 0x80000000
.L0600494C:
	.long SCU_REGS + 0x7C
.L06004950:
	.long 0x00010030
.L06004954:
	.long SCU_REGS
.L06004958:
	.long 0x01000007
.L0600495C:
	.long VDP1_ENDR
.L06004960:
	.long vdp1_list_buf
.L06004964:
	.long VDP1_VRAM
.L06004968:
	.long vdp1_wp0
.L0600496C:
	.long vdp1_wp1 + 0x20000000
.L06004970:
	mov.b	@(111,gbr),r0
	add	#1,r0
	mov.b	r0,@(111,gbr)
.L06004976:
	mov.l	.L060049AC,r0
	jsr	@r0
	nop
	mov.b	@(3,gbr),r0
	add	#-1,r0
	mov.b	r0,@(3,gbr)
	ldc.l	@r15+,gbr
	lds.l	@r15+,mach
	lds.l	@r15+,macl
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r15+,r1
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r0
	.byte 0x00, 0x00
.L060049AC:
	.long func_0600629C
	endlabel func_0600461A

	glabel func_060049B0
	sts.l	pr,@-r15
	mov.l	.L060049E4,r0
	jsr	@r0
	nop
	mov.l	.L060049E8,r2
	mov	#6,r4
.L060049BC:
	mov.b	@r2,r0
	tst	r0,r0
	bf	.L060049F4
	dt	r4
	bf/s	.L060049BC
	add	#1,r2
	mov	#0,r0
	mov.w	r0,@(84,gbr)
	mov.w	r0,@(88,gbr)
	mov.w	r0,@(86,gbr)
	mov.w	r0,@(90,gbr)
	mov.l	.L060049EC,r3
	bsr	func_06004AE0
	nop
	mov.l	.L060049F0,r3
	bsr	func_06004AE0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L060049E4:
	.long func_06006304
.L060049E8:
	.long D_060FF05C
.L060049EC:
	.long D_060D9042
.L060049F0:
	.long D_060D9022
.L060049F4:
	mov.l	r2,@-r15
	mov.l	r4,@-r15
	add	#-6,r4
	neg	r4,r4
	mov	r4,r3
	shll	r3
	mov.l	.L06004A30,r0
	mov.w	@(r0,r3),r0
	mov.w	r0,@(84,gbr)
	mov.l	.L06004A34,r0
	mov.w	@(r0,r3),r0
	mov.l	.L06004A38,r3
	bsr	func_06004A68
	mov.w	r0,@(86,gbr)
	mov.l	@r15+,r4
	mov.l	@r15+,r2
	add	#6,r4
	add	#1,r2
	add	#-1,r4
	tst	r4,r4
	bf	.L06004A40
.L06004A1E:
	mov	#0,r0
	mov.l	.L06004A3C,r3
	mov.w	r0,@(88,gbr)
	bsr	func_06004AE0
	mov.w	r0,@(90,gbr)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06004A30:
	.long D_060FEF5E
.L06004A34:
	.long D_060FEF76
.L06004A38:
	.long D_060D9042
.L06004A3C:
	.long D_060D9022
.L06004A40:
	mov.b	@r2,r0
	tst	r0,r0
	bf	.L06004A50
	dt	r4
	bf/s	.L06004A40
	add	#1,r2
	bra	.L06004A1E
	nop
.L06004A50:
	add	#-12,r4
	neg	r4,r4
	mov	r4,r3
	shll	r3
	mov.l	.L06004A90,r0
	mov.w	@(r0,r3),r0
	mov.w	r0,@(88,gbr)
	mov.l	.L06004A94,r0
	mov.w	@(r0,r3),r0
	mov.l	.L06004A98,r3
	mov.w	r0,@(90,gbr)
	lds.l	@r15+,pr
	endlabel func_060049B0

	glabel func_06004A68
	mov.b	@r2,r0
	mov.b	r0,@r3
	cmp/eq	#7,r0
	bt	.L06004ABC
	cmp/eq	#5,r0
	bt	.L06004AA0
	cmp/eq	#4,r0
	bf	.L06004AD8
	mov.l	.L06004A9C,r2
	add	r4,r2
	mov.b	@r2,r0
	add	#12,r2
	add	r4,r2
	mov.b	r0,@(1,r3)
	mov.w	@r2,r0
	add	#24,r2
	mov.w	r0,@(2,r3)
	mov.w	@r2,r0
	bra	.L06004AD8
	mov.w	r0,@(4,r3)
.L06004A90:
	.long D_060FEF5E
.L06004A94:
	.long D_060FEF76
.L06004A98:
	.long D_060D9022
.L06004A9C:
	.long D_060FEFB2 + 0x20000000
.L06004AA0:
	mov.l	.L06004AB8,r2
	add	#10,r3
	add	r4,r2
	mov.b	@r2,r0
	add	#12,r2
	mov.b	r0,@r3
	mov.b	@r2,r0
	add	#12,r2
	mov.b	r0,@(1,r3)
	mov.b	@r2,r0
	bra	.L06004AD8
	mov.b	r0,@(2,r3)
.L06004AB8:
	.long D_060FF01E + 0x20000000
.L06004ABC:
	mov.l	.L06004ADC,r2
	add	#10,r3
	add	r4,r2
	mov.b	@r2,r0
	add	#12,r2
	mov.b	r0,@r3
	mov.b	@r2,r0
	add	#24,r2
	mov.b	r0,@(1,r3)
	mov.b	@r2,r0
	add	#12,r2
	mov.b	r0,@(2,r3)
	mov.b	@r2,r0
	mov.b	r0,@(3,r3)
.L06004AD8:
	rts
	nop
.L06004ADC:
	.long D_060FF01E + 0x20000000
	endlabel func_06004A68

	glabel func_06004AE0
	mov	#0,r0
	mov.b	r0,@r3
	mov.b	r0,@(1,r3)
	mov.w	r0,@(2,r3)
	mov.w	r0,@(4,r3)
	mov	#-128,r0
	mov.b	r0,@(10,r3)
	mov.b	r0,@(11,r3)
	mov	#0,r0
	mov.b	r0,@(12,r3)
	rts
	mov.b	r0,@(13,r3)
	endlabel func_06004AE0

	glabel func_06004AF8
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	r1,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	macl,@-r15
	sts.l	mach,@-r15
	stc.l	gbr,@-r15
	mov.l	.L06004B48,r0
	ldc	r0,gbr
	mov.l	.L06004B4C,r2
	mov.w	@(116,gbr),r0
	tst	r0,r0
	bt	.L06004B68
	mov	r0,r1
	mov.w	@(118,gbr),r0
	tst	r0,r0
	bf	.L06004B50
	cmp/pz	r1
	bf	.L06004B68
	mov	#3,r1
	mov.w	r1,@r2
	add	#2,r2
	mov	#2,r1
	mov.w	r1,@r2
	mov.w	@(116,gbr),r0
	mov.w	r0,@(118,gbr)
	bra	.L06004B78
	nop
.L06004B48:
	.long gbr_block
.L06004B4C:
	.long VDP1_FBCR
.L06004B50:
	add	#-1,r0
	mov.w	r0,@(118,gbr)
	tst	r0,r0
	bf	.L06004B78
	mov	#2,r1
	mov.w	r1,@r2
	bra	.L06004B78
	nop
	.byte 0xC5, 0x3A, 0xC1, 0x3B, 0xA0, 0x08, 0x00, 0x09
.L06004B68:
	mov	#0,r1
	mov.w	r1,@r2
	add	#2,r2
	mov	#2,r1
	mov.w	r1,@r2
	mov	#0,r0
	mov.w	r0,@(118,gbr)
	mov.w	r0,@(116,gbr)
.L06004B78:
	mov.b	@(34,gbr),r0
	tst	r0,r0
	bt	.L06004B86
	mov	#1,r0
	mov.b	r0,@(110,gbr)
	bsr	func_06004F24
	nop
.L06004B86:
	ldc.l	@r15+,gbr
	lds.l	@r15+,mach
	lds.l	@r15+,macl
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r15+,r1
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r0
	endlabel func_06004AF8

	glabel sys_wait_vblank
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	r1,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov.l	.L06004C2C,r0
	ldc	r0,gbr
	mov.l	.L06004C30,r0
	mov.w	.L06004C26,r4
	mov.l	@r0,r0
	mov	#0,r5
	jsr	@r0
	nop
.L06004BDE:
	mov.b	@(3,gbr),r0
	cmp/pz	r0
	bt	.L06004BDE
	mov.b	@(1,gbr),r0
	mov.l	.L06004C34,r3
	mov.w	.L06004C28,r4
	mov	#8,r5
	mov	#0,r8
	tst	#1,r0
	bt	.L06004BF6
	mov	#0,r5
	mov	#1,r8
.L06004BF6:
	mov.l	r8,@r3
	mov.l	.L06004C30,r0
	mov.l	@r0,r0
	jsr	@r0
	nop
	mov.b	@(2,gbr),r0
	mov.b	r0,@(3,gbr)
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r15+,r1
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r0
.L06004C26:
	.short 0xDFFC
.L06004C28:
	.short 0xFFF7
	.byte 0x00, 0x00
.L06004C2C:
	.long gbr_block
.L06004C30:
	.long SYS_SETSCUIM
.L06004C34:
	.long SCU_REGS + 0x98
	endlabel sys_wait_vblank

	glabel func_06004C38
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	r1,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	macl,@-r15
	sts.l	mach,@-r15
	stc.l	gbr,@-r15
	mov.l	.L06004C6C,r0
	ldc	r0,gbr
	mov.w	@(28,gbr),r0
	tst	#8,r0
	bf	.L06004C70
	bra	.L06004CA4
	nop
.L06004C6C:
	.long gbr_block
.L06004C70:
	mov.b	@(35,gbr),r0
	tst	r0,r0
	bt	.L06004C7A
	bra	.L06004CA4
	nop
.L06004C7A:
	mov.l	.L06004CD0,r2
	mov.w	@r2,r4
	mov.l	.L06004CD4,r2
	mov.w	@r2,r4
	mov.b	@(111,gbr),r0
	mov.w	.L06004CCC,r9
	mulu.w	r9,r0
	sts	macl,r0
	add	r0,r4
	mov.l	.L06004CD8,r0
	jsr	@r0
	nop
	mov.l	r0,@-r15
	mov	#30,r4
	mov.l	.L06004CDC,r0
	jsr	@r0
	mov	#8,r5
	mov	r0,r5
	mov.l	.L06004CE0,r0
	jsr	@r0
	mov.l	@r15+,r4
.L06004CA4:
	ldc.l	@r15+,gbr
	lds.l	@r15+,mach
	lds.l	@r15+,macl
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r15+,r1
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r0
.L06004CCC:
	.short 0x03E8
	.byte 0x00, 0x00
.L06004CD0:
	.long VDP2_EXTEN
.L06004CD4:
	.long VDP2_REGS + 0xA
.L06004CD8:
	.long math_bin_to_bcd
.L06004CDC:
	.long txt_cell_addr
.L06004CE0:
	.long txt_print_hex8
	endlabel func_06004C38

	glabel func_06004CE4
	rts
.L06004CE6:
	nop
	endlabel func_06004CE4

	glabel func_06004CE8
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	r1,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	macl,@-r15
	sts.l	mach,@-r15
	stc.l	gbr,@-r15
	mov.l	.L06004D24,r0
	ldc	r0,gbr
	mov.l	.L06004D28,r0
	jsr	@r0
	nop
	mov.b	@(34,gbr),r0
	tst	r0,r0
	bf	.L06004D2C
	bra	.L06004E26
	nop
	.byte 0x00, 0x00
.L06004D24:
	.long gbr_block
.L06004D28:
	.long func_060069B4
.L06004D2C:
	mov.l	.L06004D4C,r2
	mov.l	.L06004D50,r0
	jsr	@r0
	nop
	mov.w	@(116,gbr),r0
	tst	r0,r0
	bt	.L06004D54
	mov.w	@(118,gbr),r0
	tst	r0,r0
	bt	.L06004D54
	cmp/eq	#1,r0
	bf	.L06004D48
	mov	#0,r0
	mov.w	r0,@(4,gbr)
.L06004D48:
	bra	.L06004E20
	nop
.L06004D4C:
	.long obj_list_load_task
.L06004D50:
	.long obj_run_list
.L06004D54:
	mov	#0,r0
	mov.w	r0,@(6,gbr)
	mov.b	@(62,gbr),r0
	tst	r0,r0
	bt	.L06004DFA
	mov	#0,r0
	mov.b	r0,@(62,gbr)
	mov.l	.L06004E04,r2
	mov	#0,r0
	mov.w	r0,@r2
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L06004DFA
	mov.l	@(808,gbr),r0
	mov	r0,r3
	mov.l	.L06004E08,r4
	mov.l	.L06004E0C,r0
	mov.l	@r0,r0
	sub	r3,r0
	mov	r0,r5
	add	#2,r5
	mov.b	@(48,gbr),r0
	cmp/eq	#1,r0
	bf	.L06004D88
	mov.l	@(816,gbr),r0
	mov	r0,r3
.L06004D88:
	mov	r5,r0
	mov.l	r0,@(800,gbr)
.L06004D8C:
	mov.l	.L06004E10,r7
	mov.l	@r7,r7
	mov.l	.L06004E14,r6
	tst	r6,r7
	bf	.L06004D8C
	mov.l	.L06004E18,r7
	mov	r4,r6
	mov.l	r6,@(4,r7)
	mov	r3,r6
	mov.l	r6,@r7
	mov	r5,r6
	mov.l	r6,@(8,r7)
	mov.w	.L06004E02,r6
	mov.l	r6,@(12,r7)
	mov	#7,r6
	mov.l	r6,@(20,r7)
	mov.w	.L06004E02,r6
	mov.l	r6,@(16,r7)
	mov.l	@(812,gbr),r0
	mov	r0,r3
	mov.l	.L06004E08,r4
	mov.l	@(740,gbr),r0
	add	r0,r4
	mov.l	.L06004E1C,r0
	mov.l	@r0,r0
	sub	r3,r0
	mov	r0,r5
	add	#2,r5
	mov.b	@(48,gbr),r0
	cmp/eq	#1,r0
	bf	.L06004DD2
	mov	#2,r0
	mov.b	r0,@(47,gbr)
	mov.l	@(820,gbr),r0
	mov	r0,r3
.L06004DD2:
	mov	r5,r0
	mov.l	r0,@(804,gbr)
.L06004DD6:
	mov.l	.L06004E10,r7
	mov.l	@r7,r7
	mov.l	.L06004E14,r6
	tst	r6,r7
	bf	.L06004DD6
	mov.l	.L06004E18,r7
	mov	r4,r6
	mov.l	r6,@(4,r7)
	mov	r3,r6
	mov.l	r6,@r7
	mov	r5,r6
	mov.l	r6,@(8,r7)
	mov.w	.L06004E02,r6
	mov.l	r6,@(12,r7)
	mov	#7,r6
	mov.l	r6,@(20,r7)
	mov.w	.L06004E02,r6
	mov.l	r6,@(16,r7)
.L06004DFA:
	mov	#0,r0
	mov.b	r0,@(111,gbr)
	bra	.L06004E26
	nop
.L06004E02:
	.short 0x0101
.L06004E04:
	.long VDP1_ENDR
.L06004E08:
	.long VDP1_VRAM
.L06004E0C:
	.long vdp1_wp0
.L06004E10:
	.long SCU_REGS + 0x7C
.L06004E14:
	.long 0x00010030
.L06004E18:
	.long SCU_REGS
.L06004E1C:
	.long vdp1_wp1 + 0x20000000
.L06004E20:
	mov.b	@(111,gbr),r0
	add	#1,r0
	mov.b	r0,@(111,gbr)
.L06004E26:
	mov.l	.L06004E5C,r0
	jsr	@r0
	nop
	mov.b	@(3,gbr),r0
	add	#-1,r0
	mov.b	r0,@(3,gbr)
	ldc.l	@r15+,gbr
	lds.l	@r15+,mach
	lds.l	@r15+,macl
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r15+,r1
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r0
	.byte 0x00, 0x00
.L06004E5C:
	.long snd_cmd_flush
	endlabel func_06004CE8

	glabel func_06004E60
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	r1,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	macl,@-r15
	sts.l	mach,@-r15
	stc.l	gbr,@-r15
	mov.l	.L06004EB8,r0
	ldc	r0,gbr
	mov.l	.L06004EBC,r2
	mov.w	@(116,gbr),r0
	tst	r0,r0
	bt	.L06004EEC
	mov	r0,r1
	mov.w	@(118,gbr),r0
	tst	r0,r0
	bf	.L06004ED4
	cmp/pz	r1
	bf	.L06004EEC
	mov	#3,r1
	mov.w	r1,@r2
	add	#2,r2
	mov	#2,r1
	mov.w	r1,@r2
	mov.w	@(116,gbr),r0
	mov.w	r0,@(118,gbr)
	mov.b	@(34,gbr),r0
	tst	r0,r0
	bf	.L06004EC0
	bra	.L06004EFC
	nop
	.byte 0x00, 0x00
.L06004EB8:
	.long gbr_block
.L06004EBC:
	.long VDP1_FBCR
.L06004EC0:
	mov	#0,r0
	mov.b	r0,@(110,gbr)
	bsr	func_06004F24
	nop
	mov	#1,r0
	mov.b	r0,@(110,gbr)
	bsr	func_06004F24
	nop
	bra	.L06004EFC
	nop
.L06004ED4:
	add	#-1,r0
	mov.w	r0,@(118,gbr)
	tst	r0,r0
	bf	.L06004EFC
	mov	#2,r1
	mov.w	r1,@r2
	bra	.L06004EFC
	nop
	.byte 0xC5, 0x3A, 0xC1, 0x3B, 0xA0, 0x08, 0x00, 0x09
.L06004EEC:
	mov	#0,r1
	mov.w	r1,@r2
	add	#2,r2
	mov	#2,r1
	mov.w	r1,@r2
	mov	#0,r0
	mov.w	r0,@(118,gbr)
	mov.w	r0,@(116,gbr)
.L06004EFC:
	ldc.l	@r15+,gbr
	lds.l	@r15+,mach
	lds.l	@r15+,macl
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	@r15+,r1
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r0
	endlabel func_06004E60

	glabel func_06004F24
	sts.l	pr,@-r15
	mov.l	.L06004F7C,r4
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06004F30
	mov.l	.L06004F80,r4
.L06004F30:
	mov.w	@r4,r0
	mov.l	.L06004F84,r4
	mov.w	r0,@r4
	mov.l	.L06004F88,r4
	mov.w	r0,@r4
	mov.l	.L06004F8C,r4
	mov.w	r0,@r4
	mov.l	.L06004F90,r4
	mov.w	r0,@r4
	mov.l	.L06004F94,r4
	mov.w	r0,@r4
	mov.l	.L06004F98,r4
	mov.w	r0,@r4
	mov.l	.L06004F9C,r4
	mov.w	r0,@r4
	mov.l	.L06004FA0,r4
	mov.w	r0,@r4
	mov.l	.L06004FA4,r0
	jsr	@r0
	nop
	mov.l	.L06004FA8,r2
	mov.l	.L06004FAC,r0
	jsr	@r0
	nop
	mov.l	@(12,gbr),r0
	add	#1,r0
	mov.l	r0,@(12,gbr)
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06004F76
	mov.l	.L06004FB0,r0
	jsr	@r0
	nop
	mov	#-1,r0
	mov.b	r0,@(62,gbr)
.L06004F76:
	lds.l	@r15+,pr
	rts
	nop
.L06004F7C:
	.long .L06004CE6
.L06004F80:
	.long func_06004CE4
.L06004F84:
	.long poly_draw_model
.L06004F88:
	.long poly_draw_model_color
.L06004F8C:
	.long D_0601F4AE
.L06004F90:
	.long func_060213DA
.L06004F94:
	.long func_06020578
.L06004F98:
	.long spr_draw_obj
.L06004F9C:
	.long spr_draw_billboard_unscaled
.L06004FA0:
	.long spr_draw_billboard
.L06004FA4:
	.long vdp1_cmdlist_begin
.L06004FA8:
	.long obj_list_load_scene
.L06004FAC:
	.long obj_run_list
.L06004FB0:
	.long vdp1_cmdlist_end
	endlabel func_06004F24

	.section .data.06004FB4,"aw",@progbits
	.p2align 2
	.byte 0x00, 0x0B, 0x00, 0x09, 0x56, 0x01, 0x00, 0x00
