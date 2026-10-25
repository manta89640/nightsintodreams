! sbl/cdc_data: matching source. The readable C for this object is cdc_data.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0606F478,"ax",@progbits
	.p2align 2

	glabel CDC_DataReady
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	add	#-12,r15
	mov.l	r4,@(4,r15)
	mov.l	@(4,r15),r0
	cmp/eq	#1,r0
	bf/s	.L0606F48A
	mov	#2,r4
	mov.w	.L0606F504,r4
.L0606F48A:
	mov	r15,r5
	mov.l	.L0606F508,r2
	jsr	@r2
	nop
	mov	r0,r14
	mov.l	@(4,r15),r0
	cmp/eq	#1,r0
	bf	.L0606F4A6
	tst	r14,r14
	bf	.L0606F4A6
	mov.l	@r15,r0
	tst	#128,r0
	bt	.L0606F4A6
	mov	#-4,r14
.L0606F4A6:
	tst	r14,r14
	bt	.L0606F4B2
	mov	r15,r4
	add	#8,r4
	bsr	CDC_DataEnd
	nop
.L0606F4B2:
	mov.l	.L0606F50C,r2
	jsr	@r2
	mov	#-3,r4
	mov	r14,r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel CDC_DataReady

	glabel CDC_DataEnd
	mov	#6,r3
	mov.l	.L0606F510,r2
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	#0,r13
	sts.l	pr,@-r15
	add	#-24,r15
	mov.l	r4,@r15
	mov	r15,r5
	add	#16,r5
	mov	r15,r14
	mov.l	r13,@r5
	add	#8,r14
	mov.l	r13,@(4,r5)
	mov	r14,r6
	mov.b	r3,@r5
	jsr	@r2
	mov	r13,r4
	mov.l	r0,@(4,r15)
	mov.l	@r15,r3
	mov.l	.L0606F514,r2
	mov.l	@r14,r1
	and	r2,r1
	mov.l	r1,@r3
	mov.l	.L0606F50C,r3
	jsr	@r3
	mov	#-3,r4
	mov.l	@(4,r15),r0
	add	#24,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L0606F504:
	.short 0x0082
	.byte 0x00, 0x00
.L0606F508:
	.long cdc_wait_hirq
.L0606F50C:
	.long cdc_set_hirq_req
.L0606F510:
	.long cdc_ExecCmdRsp
.L0606F514:
	.long 0x00FFFFFF
	endlabel CDC_DataEnd
