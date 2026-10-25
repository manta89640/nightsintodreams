! sbl/cdc_play: matching source. The readable C for this object is cdc_play.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060680CC,"ax",@progbits
	.p2align 2

	glabel CDC_CdPlay
	mov.l	r14,@-r15
	mov	#16,r3
	mov.l	r13,@-r15
	mov	r4,r13
	mov.l	r12,@-r15
	mov	#0,r12
	sts.l	pr,@-r15
	add	#-8,r15
	mov	r15,r14
	mov	r14,r5
	mov.l	r12,@r14
	add	#1,r5
	mov.l	r12,@(4,r14)
	mov.b	r3,@r14
	bsr	cdc_pos_to_cmd
	mov	r13,r4
	mov	#16,r0
	mov	r14,r5
	mov.b	@(r0,r13),r0
	mov	r13,r4
	mov.b	r0,@(4,r14)
	add	#5,r5
	bsr	cdc_pos_to_cmd
	add	#8,r4
	mov.l	.L060681C4,r2
	mov	r14,r5
	jsr	@r2
	mov	r12,r4
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel CDC_CdPlay

	glabel cdc_pos_to_cmd
	mov.l	@r4,r0
	mov	#0,r1
	mov	r5,r6
	add	#1,r6
	mov	r5,r7
	cmp/eq	#0,r0
	bt/s	.L06068160
	add	#2,r7
	cmp/eq	#1,r0
	bt	.L0606813A
	cmp/eq	#2,r0
	bt	.L06068130
	cmp/eq	#3,r0
	bt	.L06068156
	bra	.L06068160
	nop
.L06068130:
	mov.b	r1,@r5
	mov.b	@(4,r4),r0
	mov.b	r0,@r6
	bra	.L06068152
	mov.b	@(5,r4),r0
.L0606813A:
	mov	r4,r0
	add	#4,r0
	mov	r4,r3
	mov.b	@(1,r0),r0
	add	#4,r3
	or	#128,r0
	mov.b	r0,@r5
	mov.b	@(2,r3),r0
	mov	r4,r3
	mov.b	r0,@r6
	add	#4,r3
	mov.b	@(3,r3),r0
.L06068152:
	rts
	mov.b	r0,@r7
.L06068156:
	mov.w	.L060681C0,r4
	mov.b	r4,@r5
	mov.b	r4,@r6
	rts
	mov.b	r4,@r7
.L06068160:
	mov.b	r1,@r5
	mov.b	r1,@r6
	mov.b	r1,@r7
	rts
	nop
	endlabel cdc_pos_to_cmd

	glabel CDC_CdSeek
	mov	#17,r3
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov	#0,r13
	add	#-8,r15
	mov	r15,r14
	mov.l	r13,@r14
	mov	r14,r5
	mov.l	r13,@(4,r14)
	mov.b	r3,@r14
	bsr	cdc_pos_to_cmd
	add	#1,r5
	mov.l	.L060681C4,r3
	mov	r14,r5
	jsr	@r3
	mov	r13,r4
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel CDC_CdSeek

	glabel CDC_CdScan
	mov	#18,r3
	mov.l	r14,@-r15
	mov	r4,r0
	mov.l	r13,@-r15
	mov	#0,r13
	sts.l	pr,@-r15
	add	#-8,r15
	mov	r15,r14
	mov	r14,r5
	mov.l	r13,@r14
	mov.l	r13,@(4,r14)
	mov.b	r3,@r14
	mov.b	r0,@(1,r14)
	mov.l	.L060681C4,r3
	jsr	@r3
	mov	r13,r4
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L060681C0:
	.short 0x00FF
	.byte 0x00, 0x00
.L060681C4:
	.long cdc_ExecCmd
	endlabel CDC_CdScan
