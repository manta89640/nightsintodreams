! sbl/cdc_exec: matching source. The readable C for this object is cdc_exec.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0606FCD8,"ax",@progbits
	.p2align 2

	glabel cdc_ExecCmdRsp
	bra	cdc_ExecCmdSub
	mov	#0,r7
	endlabel cdc_ExecCmdRsp

	glabel cdc_ExecCmd
	sts.l	pr,@-r15
	add	#-8,r15
	mov	r15,r6
	bsr	cdc_ExecCmdSub
	mov	#1,r7
	add	#8,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel cdc_ExecCmd

	glabel cdc_ExecCmdSub
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r6,r13
	mov.l	.L0606FDC0,r3
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	r7,@r15
	jsr	@r3
	mov	r13,r6
	mov	r0,r14
	tst	r14,r14
	bt	.L0606FD0A
	bra	.L0606FD46
	mov	r14,r0
.L0606FD0A:
	stc	sr,r0
	mov.w	.L0606FDBE,r3
	shlr2	r0
	shlr2	r0
	and	#15,r0
	mov.l	r0,@(4,r15)
	stc	sr,r0
	and	r3,r0
	or	#240,r0
	ldc	r0,sr
	mov.l	.L0606FDC4,r5
	mov.l	@r15,r0
	tst	r0,r0
	bt	.L0606FD2E
	bsr	cdc_RspToStat
	mov	r13,r4
	bra	.L0606FD32
	nop
.L0606FD2E:
	mov.b	@r13,r3
	mov.b	r3,@r5
.L0606FD32:
	stc	sr,r2
	mov.w	.L0606FDBE,r1
	mov.l	@(4,r15),r0
	and	#15,r0
	shll2	r0
	shll2	r0
	and	r1,r2
	or	r2,r0
	ldc	r0,sr
	mov	r14,r0
.L0606FD46:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel cdc_ExecCmdSub

	glabel cdc_GetLastStat
	sts.l	pr,@-r15
	stc	sr,r0
	mov.w	.L0606FDBE,r3
	shlr2	r0
	shlr2	r0
	and	#15,r0
	mov	r0,r5
	stc	sr,r0
	and	r3,r0
	or	#240,r0
	ldc	r0,sr
	mov	r4,r1
	mov.l	.L0606FDC4,r2
	mov.l	.L0606FDC8,r3
	jsr	@r3
	mov	#12,r0
	mov.w	.L0606FDBE,r3
	mov	r5,r0
	and	#15,r0
	shll2	r0
	shll2	r0
	stc	sr,r1
	and	r3,r1
	or	r1,r0
	ldc	r0,sr
	lds.l	@r15+,pr
	rts
	mov	#0,r0
	endlabel cdc_GetLastStat

	glabel cdc_RspToStat
	mov.b	@r4,r3
	mov.b	r3,@r5
	mov.b	@(1,r4),r0
	mov.b	r0,@(4,r5)
	mov.b	@(2,r4),r0
	mov.b	r0,@(5,r5)
	mov.b	@(3,r4),r0
	mov.b	r0,@(6,r5)
	mov.b	@(4,r4),r0
	mov.b	r0,@(7,r5)
	mov.l	.L0606FDCC,r3
	mov.l	@(4,r4),r2
	and	r3,r2
	rts
	mov.l	r2,@(8,r5)
	endlabel cdc_RspToStat

	glabel cdc_Wait
	add	#-4,r15
	mov.l	r4,@r15
	bra	.L0606FDB4
	nop
.L0606FDAE:
	mov.l	@r15,r2
	add	#-1,r2
	mov.l	r2,@r15
.L0606FDB4:
	mov.l	@r15,r3
	cmp/pl	r3
	bt	.L0606FDAE
	rts
	add	#4,r15
.L0606FDBE:
	.short 0xFF0F
.L0606FDC0:
	.long cdc_exec_cmd
.L0606FDC4:
	.long cdc_last_stat
.L0606FDC8:
	.long _quick_odd_mvn
.L0606FDCC:
	.long 0x00FFFFFF
	endlabel cdc_Wait
