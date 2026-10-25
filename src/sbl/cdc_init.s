! sbl/cdc_init: matching source. The readable C for this object is cdc_init.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0606F348,"ax",@progbits
	.p2align 2

	glabel CDC_TgetToc
	mov.l	r14,@-r15
	mov	#2,r3
	mov.l	.L0606F45C,r2
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov	#0,r13
	add	#-20,r15
	mov	r15,r5
	mov.l	r4,@r15
	mov	r15,r14
	add	#12,r5
	add	#4,r14
	mov.l	r13,@r5
	mov	r14,r6
	mov.l	r13,@(4,r5)
	mov.b	r3,@r5
	jsr	@r2
	mov	r13,r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606F376
	bra	.L0606F382
	mov	r4,r0
.L0606F376:
	mov.l	.L0606F460,r3
	mov.l	@r14,r4
	mov.l	@r15,r5
	mov.l	.L0606F464,r2
	jsr	@r2
	and	r3,r4
.L0606F382:
	add	#20,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel CDC_TgetToc

	glabel CDC_GetSes
	mov.l	r14,@-r15
	mov	#3,r3
	mov.l	r13,@-r15
	mov	r4,r0
	mov.l	r12,@-r15
	mov	#0,r13
	sts.l	pr,@-r15
	add	#-20,r15
	mov.l	r5,@r15
	mov	r15,r14
	add	#12,r14
	mov	r15,r12
	mov.l	r13,@r14
	mov	r14,r5
	mov.l	r13,@(4,r14)
	add	#4,r12
	mov.b	r3,@r14
	mov	r12,r6
	mov.b	r0,@(1,r14)
	mov.l	.L0606F45C,r3
	jsr	@r3
	mov	r13,r4
	mov.l	@r15,r2
	mov	r0,r4
	mov.l	@(4,r12),r3
	mov	r4,r0
	mov.l	r3,@r2
	add	#20,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel CDC_GetSes

	glabel CDC_CdInit
	mov	#0,r3
	mov.l	r14,@-r15
	mov	r4,r0
	mov.l	r13,@-r15
	mov	r3,r2
	sts.l	pr,@-r15
	add	#-8,r15
	mov	r15,r14
	mov.l	r3,@r14
	mov.l	r3,@(4,r14)
	mov	#4,r3
	mov.b	r3,@r14
	mov.b	r0,@(1,r14)
	mov	r5,r0
	mov.w	r0,@(2,r14)
	mov	r6,r0
	mov.b	r0,@(6,r14)
	mov	r7,r0
	mov.b	r0,@(7,r14)
	mov.w	.L0606F458,r0
	and	r4,r0
	cmp/eq	#1,r0
	bf	.L0606F422
	mov.w	.L0606F45A,r4
	mov.l	.L0606F468,r2
	jsr	@r2
	nop
	mov.l	.L0606F46C,r3
	jsr	@r3
	mov	#65,r4
	mov	r14,r5
	mov.l	.L0606F470,r2
	jsr	@r2
	mov	#64,r4
	mov	r0,r13
	tst	r13,r13
	bf	.L0606F42C
	mov.l	.L0606F474,r3
	jsr	@r3
	nop
	bra	.L0606F42C
	nop
.L0606F422:
	mov	r14,r5
	mov.l	.L0606F470,r3
	jsr	@r3
	mov	#0,r4
	mov	r0,r13
.L0606F42C:
	mov	r13,r0
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel CDC_CdInit

	glabel CDC_CdOpen
	mov.l	r14,@-r15
	mov	#5,r3
	mov.l	.L0606F470,r2
	mov	#0,r14
	sts.l	pr,@-r15
	add	#-8,r15
	mov	r15,r5
	mov.l	r14,@r5
	mov.l	r14,@(4,r5)
	mov.b	r3,@r5
	jsr	@r2
	mov	r14,r4
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606F458:
	.short 0x0081
.L0606F45A:
	.short 0x2904
.L0606F45C:
	.long cdc_ExecCmdRsp
.L0606F460:
	.long 0x00FFFFFF
.L0606F464:
	.long cdc_get_data_words
.L0606F468:
	.long cdc_Wait
.L0606F46C:
	.long cdc_add_hirq_stat
.L0606F470:
	.long cdc_ExecCmd
.L0606F474:
	.long cdc_init_hirq
	endlabel CDC_CdOpen
