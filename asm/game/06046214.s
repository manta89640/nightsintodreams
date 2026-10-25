	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06046214,"ax",@progbits
	.p2align 2

	glabel func_06046214
	sts.l	pr,@-r15
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#240,r0
	ldc	r0,sr
	mov.l	.L060462E8,r0
	jsr	@r0
	nop
	mov.l	.L060462EC,r4
	mov.l	.L060462F0,r0
	mov.l	.L060462F4,r5
	jsr	@r0
	nop
	mov.l	.L060462F8,r0
	jsr	@r0
	nop
	mov.l	.L060462FC,r0
	jsr	@r0
	nop
	mov.l	.L06046300,r0
	jsr	@r0
	nop
	mov.l	.L06046304,r0
	jsr	@r0
	nop
	mov.l	.L06046308,r0
	jsr	@r0
	nop
	mov.l	.L0604630C,r14
	jsr	@r14
	nop
	mov.l	.L06046310,r5
	mov.l	.L06046314,r0
	mov.w	.L060462E4,r6
	mov	r0,r2
	mov	#-112,r3
	mov	#-116,r1
	shll2	r1
.L06046266:
	mov.l	@(12,r3),r0
	and	#3,r0
	cmp/eq	#1,r0
	bt	.L06046266
	mov.l	@(32,r3),r0
	mov	#0,r0
	mov.l	r0,@(12,r3)
	mov.b	r0,@r1
	mov.l	r2,@(0,r3)
	mov.l	r5,@(4,r3)
	mov.l	r6,@(8,r3)
	mov.w	.L06046424,r0
	mov.l	r0,@(12,r3)
	mov	#9,r0
	mov.l	r0,@(32,r3)
	mov	#-112,r1
.L06046286:
	mov.l	@(12,r1),r0
	and	#3,r0
	cmp/eq	#1,r0
	bt	.L06046286
	mov	#6,r4
	mov.l	.L06046318,r0
	mov.b	@(r0,r4),r4
	mov.w	@(224,gbr),r0
	or	r4,r0
	mov.w	r0,@(224,gbr)
	mov.w	.L060462E6,r0
	mov.w	r0,@(500,gbr)
	mov.w	r0,@(502,gbr)
	mov.w	r0,@(504,gbr)
	mov.l	.L0604631C,r0
	jsr	@r0
	nop
	mov.l	.L06046320,r0
	jsr	@r0
	nop
	mov.l	.L06046324,r2
	mov.l	.L06046328,r3
	mov.l	.L0604632C,r7
	shar	r7
.L060462B6:
	mov.w	@r2+,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L060462B6
	add	#2,r3
	mov.l	.L06046330,r3
	mov	#16,r7
.L060462C4:
	mov.w	@r2+,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L060462C4
	add	#2,r3
	mov.l	.L06046334,r2
.L060462D0:
	mov.l	@r2+,r5
	cmp/pz	r5
	bf	.L0604633C
	mov.l	@r2+,r4
	mov.l	@r2+,r6
	mov.l	.L06046338,r14
	jsr	@r14
	nop
	bra	.L060462D0
	nop
.L060462E4:
	.short 0x0090
.L060462E6:
	.short 0xFF01
.L060462E8:
	.long snd_seq_stop_all
.L060462EC:
	.long D_060512D6
.L060462F0:
	.long file_load
.L060462F4:
	.long lwram_buf
.L060462F8:
	.long func_0600454C
.L060462FC:
	.long func_0602B94A
.L06046300:
	.long vdp1_cmdlist_begin
.L06046304:
	.long vdp1_cmdlist_end
.L06046308:
	.long obj_init
.L0604630C:
	.long vdp_init_palette_gouraud
.L06046310:
	.long vdp2_shadow
.L06046314:
	.long vdp2_shadow_defaults
.L06046318:
	.long lbl_0602B7E4
.L0604631C:
	.long func_06004348
.L06046320:
	.long func_0602B960
.L06046324:
	.long D_06046428
.L06046328:
	.long vdp2_ramctl
.L0604632C:
	.long 0x00000052
.L06046330:
	.long vdp2_prisa
.L06046334:
	.long D_0604649C
.L06046338:
	.long func_060463B8
.L0604633C:
	mov.l	.L0604635C,r8
	mov.l	@r2+,r5
	cmp/pz	r5
	bf	.L06046360
	mov.l	@r2+,r4
	mov.l	@r2+,r6
	shar	r6
.L0604634A:
	mov.l	@r4+,r0
	or	r8,r0
	mov.l	r0,@r5
	dt	r6
	bf/s	.L0604634A
	add	#4,r5
	bra	.L0604633C
	nop
	.byte 0x00, 0x00
.L0604635C:
	.long 0x80008000
.L06046360:
	mov.l	@r2+,r0
	jsr	@r0
	nop
	mov.l	.L060463A4,r2
	mov.l	.L060463A8,r0
	jsr	@r0
	nop
	mov.l	.L060463AC,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov	#64,r0
	mov.w	r0,@r3
	mov.l	.L060463B0,r0
	mov.l	r0,@(4,r3)
	mov	#1,r0
	mov.w	r0,@(460,gbr)
	mov	#12,r0
	mov.b	r0,@(0,gbr)
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#0,r0
	ldc	r0,sr
	mov	#0,r0
	mov.l	r0,@(76,gbr)
	mov.l	.L060463B4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L060463A4:
	.long obj_list_stage
.L060463A8:
	.long obj_alloc
.L060463AC:
	.long func_0604654C
.L060463B0:
	.long func_06046578
.L060463B4:
	.long func_0602B93E
	endlabel func_06046214

	glabel func_060463B8
	mov.b	@r4+,r0
	mov.b	r0,@r5
	dt	r6
	bf/s	func_060463B8
	add	#1,r5
	rts
	nop
	endlabel func_060463B8

	glabel func_060463C6
	sts.l	pr,@-r15
	mov.l	.L06046408,r0
	jsr	@r0
	nop
	mov.l	.L0604640C,r0
	jsr	@r0
	nop
	mov	#-1,r0
	mov.l	r0,@(728,gbr)
	mov	#0,r0
	mov.b	r0,@(110,gbr)
	mov.l	.L06046410,r0
	jsr	@r0
	nop
	mov.l	@(12,gbr),r0
	add	#1,r0
	mov.l	r0,@(12,gbr)
	mov.l	.L06046414,r0
	jsr	@r0
	nop
	mov.l	.L06046418,r2
	mov.l	.L0604641C,r0
	jsr	@r0
	nop
	mov.l	.L06046420,r0
	jsr	@r0
	nop
	mov	#-1,r0
	mov.b	r0,@(62,gbr)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06046408:
	.long sys_wait_vblank
.L0604640C:
	.long func_0602FD1C
.L06046410:
	.long snd_cmd_flush
.L06046414:
	.long vdp1_cmdlist_begin
.L06046418:
	.long obj_list_stage
.L0604641C:
	.long obj_run_list
.L06046420:
	.long vdp1_cmdlist_end
.L06046424:
	.short 0x5601
	.byte 0x46, 0x01
	endlabel func_060463C6

	.section .data.06046428,"aw",@progbits
	.p2align 2
	dlabel D_06046428
	.byte 0x03, 0x00, 0x44, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0x11, 0x11, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x80, 0x00, 0x80, 0x00, 0x80, 0x0A, 0x80, 0x40, 0x40, 0x00, 0x00, 0x00, 0x00, 0x22
	.byte 0x00, 0x00, 0x31, 0x30, 0x00, 0x00, 0x35, 0x34, 0x00, 0x00, 0x2E, 0x2D, 0x2D, 0x2D, 0x3A, 0x3A
	.byte 0x3A, 0x3A, 0x20, 0x20, 0x20, 0x20, 0x21, 0x21, 0x21, 0x21, 0x22, 0x22, 0x22, 0x22, 0x23, 0x23
	.byte 0x23, 0x23, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x06, 0x07, 0x04, 0x05, 0x00, 0x03
	.byte 0x00, 0x00, 0x10, 0x07, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x09
	dlabel D_0604649C
	.long VDP2_VRAM + 0x2000
	.byte 0x00, 0x20, 0x10, 0x04, 0x00, 0x00, 0x75, 0x00
	.long VDP2_VRAM + 0xA000
	.byte 0x00, 0x20, 0x97, 0x18, 0x00, 0x00, 0xAE, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.long D_060CA200
	.byte 0x00, 0x20, 0x85, 0x04, 0x00, 0x00, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.long func_060464CC
