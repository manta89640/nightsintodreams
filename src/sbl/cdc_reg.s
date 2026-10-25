! sbl/cdc_reg: matching source. The readable C for this object is cdc_reg.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060681C8,"ax",@progbits
	.p2align 2

	glabel CDC_GetDataPtr
	mov.l	.L060682E8,r0
	rts
	nop
	endlabel CDC_GetDataPtr

	glabel CDC_GetHirqReq
	mov.l	.L060682EC,r3
	mov.w	@r3,r0
	rts
	extu.w	r0,r0
	endlabel CDC_GetHirqReq

	glabel CDC_ClrHirqReq
	mov	#1,r0
	mov.l	.L060682F0,r5
	mov.l	.L060682EC,r1
	mov.w	@r5,r2
	mov.w	@r1,r3
	or	r3,r2
	mov.w	r2,@r5
	bra	cdc_set_hirq_req
	or	r0,r4
	endlabel CDC_ClrHirqReq

	glabel cdc_set_hirq_req
	mov.l	.L060682EC,r3
	rts
	mov.w	r4,@r3
	endlabel cdc_set_hirq_req

	glabel cdc_init_hirq
	sts.l	pr,@-r15
	mov.w	.L060682E4,r4
	bsr	cdc_set_hirq_req
	nop
	mov.w	.L060682E4,r2
	mov.l	.L060682F0,r3
	lds.l	@r15+,pr
	rts
	mov.w	r2,@r3
	endlabel cdc_init_hirq

	glabel cdc_add_hirq_stat
	mov.l	.L060682F0,r5
	mov.w	@r5,r3
	or	r4,r3
	rts
	mov.w	r3,@r5
	endlabel cdc_add_hirq_stat

	glabel cdc_get_hirq_msk
	mov.l	.L060682F4,r2
	mov.w	@r2,r0
	rts
	extu.w	r0,r0
	endlabel cdc_get_hirq_msk

	glabel cdc_set_hirq_msk
	mov.l	.L060682F4,r3
	rts
	mov.w	r4,@r3
	endlabel cdc_set_hirq_msk

	glabel cdc_get_25810028_ptr
	mov.l	.L060682F8,r0
	rts
	nop
	endlabel cdc_get_25810028_ptr

	glabel cdc_get_data_words
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov	r4,r14
	mov.l	.L060682FC,r3
	add	#-8,r15
	mov.l	r5,@(4,r15)
	jsr	@r3
	mov	#0,r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606823E
	mov	r4,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606823E:
	mov	#0,r7
	mov.l	.L06068300,r6
	cmp/ge	r14,r7
	mov.l	@(4,r15),r4
	bt/s	.L06068256
	mov	r7,r5
.L0606824A:
	add	#1,r5
	mov.w	@r6,r2
	cmp/ge	r14,r5
	mov.w	r2,@r4
	bf/s	.L0606824A
	add	#2,r4
.L06068256:
	mov	r15,r4
	mov.l	.L06068304,r2
	jsr	@r2
	nop
	mov	r0,r4
	tst	r4,r4
	bf	.L0606826C
	mov.l	@r15,r3
	cmp/eq	r3,r14
	bt	.L0606826C
	mov	#-7,r4
.L0606826C:
	mov	r4,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel cdc_get_data_words

	glabel cdc_exec_cmd
	stc	sr,r0
	mov.w	.L060682E6,r3
	shlr2	r0
	sts.l	pr,@-r15
	shlr2	r0
	add	#-4,r15
	and	#15,r0
	mov.l	r0,@r15
	stc	sr,r0
	and	r3,r0
	or	#240,r0
	ldc	r0,sr
	bsr	cdc_exec_cmd_body
	nop
	mov	r0,r4
	mov.w	.L060682E6,r2
	stc	sr,r3
	mov.l	@r15,r0
	and	r2,r3
	and	#15,r0
	shll2	r0
	shll2	r0
	or	r3,r0
	ldc	r0,sr
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	r4,r0
	endlabel cdc_exec_cmd

	glabel cdc_exec_cmd_body
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	mov	r4,r12
	mov.l	.L060682F0,r14
	add	#-12,r15
	mov.l	.L060682EC,r1
	mov.l	r5,@(8,r15)
	mov.l	r6,@r15
	mov.w	@r1,r3
	mov.w	@r14,r2
	or	r3,r2
	mov.w	r2,@r14
	mov.w	@r14,r4
	extu.w	r4,r4
	mov	r4,r3
	and	r12,r3
	cmp/eq	r12,r3
	bt	.L060682DA
	bra	.L0606835C
	mov	#-1,r0
.L060682DA:
	mov	#1,r13
	tst	r13,r4
	bf	.L06068308
	bra	.L0606835C
	mov	#-2,r0
.L060682E4:
	.short 0x0BE1
.L060682E6:
	.short 0xFF0F
.L060682E8:
	.long CD_DATATRNS
.L060682EC:
	.long CD_HIRQREQ
.L060682F0:
	.long cdc_hirq_stat
.L060682F4:
	.long CD_HIRQMSK
.L060682F8:
	.long 0x25810028
.L060682FC:
	.long CDC_DataReady
.L06068300:
	.long CD_DATA
.L06068304:
	.long CDC_DataEnd
.L06068308:
	mov	r12,r4
	or	r13,r4
	bsr	cdc_set_hirq_req
	not	r4,r4
	mov.l	.L060683D0,r3
	mov.w	@r14,r2
	and	r3,r2
	mov.w	r2,@r14
	mov.l	@(8,r15),r4
	bsr	cdc_write_cr
	nop
	mov	r15,r5
	add	#4,r5
	bsr	cdc_wait_hirq
	mov	r13,r4
	mov	r0,r13
	tst	r13,r13
	bt	.L06068330
	bra	.L0606835C
	mov	r13,r0
.L06068330:
	mov.l	@r15,r4
	bsr	cdc_read_cr
	nop
	mov.l	@r15,r4
	mov.w	.L060683CA,r3
	mov.b	@r4,r4
	extu.b	r4,r4
	cmp/eq	r3,r4
	bf	.L06068346
	bra	.L0606834E
	mov	#-5,r13
.L06068346:
	mov.w	.L060683CC,r2
	tst	r2,r4
	bt	.L0606834E
	mov	#-6,r13
.L0606834E:
	tst	r13,r13
	bf/s	.L0606835C
	mov	r13,r0
	mov.w	@r14,r3
	not	r12,r12
	and	r12,r3
	mov.w	r3,@r14
.L0606835C:
	add	#12,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel cdc_exec_cmd_body

	glabel cdc_wait_hirq
	mov.l	r14,@-r15
	mov	#0,r14
	mov.l	.L060683D8,r1
	mov	r14,r7
	mov.l	r12,@-r15
	mov	#-3,r12
	mov.l	r11,@-r15
	mov.l	.L060683D4,r11
.L06068378:
	mov.w	@r11,r6
	mov	r4,r3
	extu.w	r6,r6
	tst	r6,r3
	bt	.L06068388
	mov	r14,r12
	bra	.L0606838E
	mov.l	r6,@r5
.L06068388:
	add	#1,r7
	cmp/ge	r1,r7
	bf	.L06068378
.L0606838E:
	mov	r12,r0
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	rts
	mov.l	@r15+,r14
	endlabel cdc_wait_hirq

	glabel cdc_write_cr
	mov.w	@r4,r3
	mov.l	.L060683DC,r2
	mov.l	.L060683E0,r1
	mov.w	r3,@r2
	mov.w	@(2,r4),r0
	add	#12,r2
	mov.l	.L060683E4,r3
	mov.w	r0,@r1
	mov.w	@(4,r4),r0
	mov.w	r0,@r3
	mov.w	@(6,r4),r0
	rts
	mov.w	r0,@r2
	endlabel cdc_write_cr

	glabel cdc_read_cr
	mov.l	.L060683DC,r1
	mov.l	.L060683E0,r2
	mov.w	@r1,r3
	mov.w	r3,@r4
	mov.w	@r2,r0
	mov.l	.L060683E4,r3
	mov.w	r0,@(2,r4)
	mov.w	@r3,r0
	mov.w	r0,@(4,r4)
	mov.w	@(12,r1),r0
	rts
	mov.w	r0,@(6,r4)
.L060683CA:
	.short 0x00FF
.L060683CC:
	.short 0x0080
	.byte 0x00, 0x00
.L060683D0:
	.long 0x0000FFFE
.L060683D4:
	.long CD_HIRQREQ
.L060683D8:
	.long 0x00240000
.L060683DC:
	.long CD_CR1
.L060683E0:
	.long CD_CR2
.L060683E4:
	.long CD_CR3
	endlabel cdc_read_cr
