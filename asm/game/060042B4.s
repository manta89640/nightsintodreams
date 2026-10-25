	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060042B4,"ax",@progbits
	.p2align 2

	glabel func_060042B4
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	dt	r2
	mov.w	.L06004430,r3
	stc	sr,r0
	and	r3,r0
	or	#240,r0
	ldc	r0,sr
	mov	#1,r2
	mov.w	.L06004432,r1
	mov.l	.L06004438,r3
	braf	r3
	mov.b	r2,@r1
	endlabel func_060042B4

	glabel func_06004348
	mov.l	r14,@-r15
	mov	#1,r14
	mov.w	.L06004432,r3
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L0600443C,r13
	mov.b	r14,@r3
.L06004358:
	mov.l	@r13,r3
	mov.b	@r3,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L06004358
	mov.l	@r13,r2
	mov.b	r14,@r2
	mov.l	.L06004440,r2
	mov.l	@r2,r3
	mov.l	.L06004444,r0
	mov.b	@r0,r1
	mov.b	r1,@r3
.L06004372:
	mov.l	@r13,r2
	mov.b	@r2,r3
	extu.b	r3,r3
	and	r14,r3
	cmp/eq	r14,r3
	bt	.L06004372
	mov	#0,r3
	mov.w	.L06004434,r4
	mov.w	r3,@r15
	bra	.L0600438E
	nop
.L06004388:
	mov.w	@r15,r2
	add	#1,r2
	mov.w	r2,@r15
.L0600438E:
	mov.w	@r15,r3
	extu.w	r3,r3
	cmp/ge	r4,r3
	bf	.L06004388
	mov.l	.L06004448,r3
	mov.l	.L0600444C,r5
	mov.l	@r3,r2
	mova	.L060043A0,r0
	add	r0,r5
.L060043A0:
	mov.w	.L06004436,r4
	jsr	@r2
	nop
	mov.l	@r13,r2
	mov.l	.L06004450,r0
	mov.b	r14,@r2
	mov.l	.L06004440,r2
	mov.l	@r2,r3
	mov.b	@r0,r1
	mov.b	r1,@r3
.L060043B4:
	mov.l	@r13,r2
	mov.b	@r2,r3
	extu.b	r3,r3
	and	r14,r3
	cmp/eq	r14,r3
	bt	.L060043B4
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel func_06004348

	glabel func_060043CA
	mov	r4,r0
	mov.l	.L06004454,r2
	sts.l	pr,@-r15
	mov.l	.L06004458,r1
	add	#-8,r15
	mov.w	r0,@(4,r15)
	mov.w	r5,@r15
	mov.l	@r2,r3
	mov.w	@(4,r15),r0
	extu.w	r0,r0
	mov.b	@(r0,r1),r4
	jsr	@r3
	extu.b	r4,r4
	mov.l	.L0600445C,r5
	mov	#1,r4
.L060043E8:
	mov.b	@r5,r2
	extu.b	r2,r2
	and	r4,r2
	cmp/eq	r4,r2
	bt	.L060043E8
	mov	#25,r2
	mov.l	.L06004460,r3
	mov.b	r4,@r5
	mov.b	r2,@r3
.L060043FA:
	mov.b	@r5,r0
	extu.b	r0,r0
	tst	r4,r0
	bf	.L060043FA
	mov.w	@r15,r4
	mov.l	.L06004464,r3
	bsrf	r3
	extu.w	r4,r4
	mov.w	@(4,r15),r0
	mov.l	.L06004468,r3
	extu.w	r0,r0
	mov.l	r0,@r15
	bsrf	r3
	mov	r0,r4
	mov.l	.L0600446C,r2
	bsrf	r2
	nop
	mov.l	@r15,r4
	mov.l	.L06004470,r3
	bsrf	r3
	nop
	mov.l	.L06004474,r2
	bsrf	r2
	nop
	add	#8,r15
	bra	func_06004348
	lds.l	@r15+,pr
.L06004430:
	.short 0xFF0F
.L06004432:
	.short 0xFE10
.L06004434:
	.short 0x03E8
.L06004436:
	.short 0x0094
.L06004438:
	.long 0x00001C28
.L0600443C:
	.long D_06051254
.L06004440:
	.long D_06051258
.L06004444:
	.long D_06051155
.L06004448:
	.long SYS_SETSINT
.L0600444C:
	.long 0xFFFFFF94
.L06004450:
	.long D_06051154
.L06004454:
	.long SYS_CHGSYSCK
.L06004458:
	.long D_0605125C
.L0600445C:
	.long SMPC_REGS + 0x63
.L06004460:
	.long SMPC_REGS + 0x1F
.L06004464:
	.long 0x000000BA
.L06004468:
	.long 0x000270EA
.L0600446C:
	.long 0x00008FB4
.L06004470:
	.long 0x0001A52C
.L06004474:
	.long 0x00001CA2
	endlabel func_060043CA

	glabel smpc_sndon
	mov.l	.L060044BC,r5
	mov	#1,r4
.L0600447C:
	mov.b	@r5,r2
	extu.b	r2,r2
	and	r4,r2
	cmp/eq	r4,r2
	bt	.L0600447C
	mov	#6,r2
	mov.l	.L060044C0,r3
	mov.b	r4,@r5
	mov.b	r2,@r3
.L0600448E:
	mov.b	@r5,r0
	extu.b	r0,r0
	tst	r4,r0
	bf	.L0600448E
	rts
	nop
	endlabel smpc_sndon

	glabel smpc_sndoff
	mov	#1,r4
	mov.l	.L060044BC,r5
.L0600449E:
	mov.b	@r5,r2
	extu.b	r2,r2
	and	r4,r2
	cmp/eq	r4,r2
	bt	.L0600449E
	mov.b	r4,@r5
	mov	#7,r2
	mov.l	.L060044C0,r3
	mov.b	r2,@r3
.L060044B0:
	mov.b	@r5,r0
	extu.b	r0,r0
	tst	r4,r0
	bf	.L060044B0
	rts
	nop
.L060044BC:
	.long SMPC_REGS + 0x63
.L060044C0:
	.long SMPC_REGS + 0x1F
	endlabel smpc_sndoff

	glabel func_060044C4
	sts.l	pr,@-r15
	mov.l	.L06004530,r0
	ldc	r0,gbr
	add	#-1,r4
	extu.b	r4,r0
	shll8	r4
	or	r4,r0
	mov.w	r0,@(2,gbr)
	mov	#0,r0
	mov.b	r0,@(1,gbr)
	mov.w	r0,@(4,gbr)
	mov.w	r0,@(6,gbr)
	mov.l	r0,@(8,gbr)
	mov.l	.L06004534,r0
	mov.l	.L06004538,r5
	mov.l	@r0,r0
	jsr	@r0
	mov	#64,r4
	mov.l	.L06004534,r0
	mov.l	.L0600453C,r5
	mov.l	@r0,r0
	jsr	@r0
	mov	#65,r4
	mov.l	.L06004534,r0
	mov.l	.L06004540,r5
	mov.l	@r0,r0
	jsr	@r0
	mov	#77,r4
	mov.l	.L06004534,r0
	mov.l	.L06004544,r5
	mov.l	@r0,r0
	jsr	@r0
	mov	#67,r4
	mov.l	.L06004548,r0
	mov.w	.L0600452E,r4
	mov.l	@r0,r0
	mov	#-1,r5
	jsr	@r0
	nop
	mov	#0,r0
	mov.l	r0,@(76,gbr)
	mov.l	r0,@(80,gbr)
	mov.l	r0,@(84,gbr)
	mov.l	r0,@(88,gbr)
	mov.b	r0,@(126,gbr)
	mov.b	r0,@(111,gbr)
	mov	#0,r0
	mov.w	r0,@(116,gbr)
	mov.w	r0,@(118,gbr)
	mov.b	r0,@(46,gbr)
	lds.l	@r15+,pr
	rts
	nop
.L0600452E:
	.short 0xDFF4
.L06004530:
	.long gbr_block
.L06004534:
	.long SYS_SETUINT
.L06004538:
	.long func_0600461A
.L0600453C:
	.long func_06004AF8
.L06004540:
	.long func_06004C38
.L06004544:
	.long func_06004570
.L06004548:
	.long SYS_SETSCUIM
	endlabel func_060044C4

	glabel func_0600454C
	sts.l	pr,@-r15
	mov	#0,r0
	mov.b	r0,@(1,gbr)
	mov.w	r0,@(4,gbr)
	mov.w	r0,@(6,gbr)
	mov.l	r0,@(8,gbr)
	mov.l	.L06004568,r0
	mov.l	.L0600456C,r5
	mov.l	@r0,r0
	jsr	@r0
	mov	#67,r4
	lds.l	@r15+,pr
	rts
	nop
.L06004568:
	.long SYS_SETUINT
.L0600456C:
	.long func_06004570
	endlabel func_0600454C

	glabel func_06004570
	rts
	nop
	endlabel func_06004570

	glabel func_06004574
	sts.l	pr,@-r15
	mov.l	.L0600458C,r0
	mov.l	.L06004590,r5
	mov.l	@r0,r0
	jsr	@r0
	mov	#65,r4
	lds.l	@r15+,pr
	mov.l	.L0600458C,r0
	mov.l	.L06004594,r5
	mov.l	@r0,r0
	jmp	@r0
	mov	#64,r4
.L0600458C:
	.long SYS_SETUINT
.L06004590:
	.long func_06004AF8
.L06004594:
	.long func_0600461A
	endlabel func_06004574

	glabel func_06004598
	sts.l	pr,@-r15
	mov.l	.L060045B0,r0
	mov.l	.L060045B4,r5
	mov.l	@r0,r0
	jsr	@r0
	mov	#65,r4
	lds.l	@r15+,pr
	mov.l	.L060045B0,r0
	mov.l	.L060045B8,r5
	mov.l	@r0,r0
	jmp	@r0
	mov	#64,r4
.L060045B0:
	.long SYS_SETUINT
.L060045B4:
	.long func_06004E60
.L060045B8:
	.long func_06004CE8
	endlabel func_06004598

	glabel dma_queue_xfer
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#240,r0
	ldc	r0,sr
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L060045E8
	mov.l	.L060045E0,r8
	mov.l	.L060045E4,r0
	mov.w	@r0,r0
	add	r0,r8
	add	#12,r0
	bra	.L060045F4
	mov.w	r0,@(4,gbr)
	.byte 0x00, 0x00
.L060045E0:
	.long dma_table_a
.L060045E4:
	.long D_060FFC04 + 0x20000000
.L060045E8:
	mov.l	.L0600460C,r8
	mov.l	.L06004610,r0
	mov.w	@r0,r0
	add	r0,r8
	add	#12,r0
	mov.w	r0,@(6,gbr)
.L060045F4:
	mov.l	r4,@(8,r8)
	mov.l	r5,@(4,r8)
	mov.l	r6,@(0,r8)
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#0,r0
	ldc	r0,sr
	rts
	nop
.L0600460C:
	.long dma_table_b
.L06004610:
	.long D_060FFC06 + 0x20000000
	endlabel dma_queue_xfer

	.section .data.06004614,"aw",@progbits
	.p2align 2
	.byte 0xC2, 0x02, 0x00, 0x0B
