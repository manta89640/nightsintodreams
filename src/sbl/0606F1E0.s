! sbl/0606F1E0: matching source. The readable C for this object is 0606F1E0.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0606F1E0,"ax",@progbits
	.p2align 2

	glabel CDC_GetCurStat
	mov.l	r14,@-r15
	mov	#1,r7
	mov.l	.L0606F334,r3
	mov	#0,r14
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	add	#-24,r15
	mov	r15,r5
	mov.l	r4,@r15
	mov	r15,r13
	add	#16,r5
	add	#8,r13
	mov.l	r14,@r5
	mov	r13,r6
	mov.l	r14,@(4,r5)
	mov.b	r14,@r5
	jsr	@r3
	mov	r14,r4
	mov.l	r0,@(4,r15)
	mov.l	@r15,r5
	mov.l	.L0606F338,r3
	jsr	@r3
	mov	r13,r4
	mov.l	@(4,r15),r0
	add	#24,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel CDC_GetCurStat

	glabel CDC_GetLastStat
	mov.l	.L0606F33C,r3
	jmp	@r3
	nop
	endlabel CDC_GetLastStat

	glabel CDC_GetPeriStat
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	add	#-12,r15
	mov.l	r4,@r15
	mov	r15,r13
	add	#4,r13
	bsr	cdc_GetPeriRsp
	mov	r13,r4
	mov	r0,r14
	tst	r14,r14
	bt	.L0606F23C
	bra	.L0606F25A
	mov	r14,r0
.L0606F23C:
	mov.l	@r15,r5
	mov.l	.L0606F338,r3
	jsr	@r3
	mov	r13,r4
	mov.l	@r15,r4
	mov.b	@r4,r4
	mov.w	.L0606F32E,r3
	extu.b	r4,r4
	cmp/eq	r3,r4
	bt	.L0606F256
	mov	#32,r1
	tst	r4,r1
	bf	.L0606F258
.L0606F256:
	mov	#-8,r14
.L0606F258:
	mov	r14,r0
.L0606F25A:
	add	#12,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel CDC_GetPeriStat

	glabel cdc_GetPeriRsp
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov	#0,r11
	mov.l	.L0606F340,r14
	mov	r4,r10
	mov.l	r9,@-r15
	mov	r11,r13
	mov.l	r8,@-r15
	mov	#-3,r9
	sts.l	pr,@-r15
	add	#-8,r15
	mov	r15,r12
.L0606F282:
	stc	sr,r0
	mov.w	.L0606F330,r3
	shlr2	r0
	shlr2	r0
	and	#15,r0
	mov	r0,r8
	stc	sr,r0
	and	r3,r0
	or	#240,r0
	ldc	r0,sr
	jsr	@r14
	mov	r10,r4
	jsr	@r14
	mov	r12,r4
	mov	r8,r0
	mov.w	.L0606F330,r3
	stc	sr,r2
	and	#15,r0
	shll2	r0
	shll2	r0
	and	r3,r2
	or	r2,r0
	ldc	r0,sr
	mov	r10,r5
	mov	r12,r4
	mov.l	@r5,r3
	mov.l	@r4,r2
	cmp/eq	r2,r3
	bf	.L0606F2C8
	mov.l	@(4,r4),r0
	mov.l	@(4,r5),r1
	cmp/eq	r0,r1
	bf	.L0606F2C8
	bra	.L0606F2D0
	mov	r11,r9
.L0606F2C8:
	add	#1,r13
	mov	#100,r3
	cmp/ge	r3,r13
	bf	.L0606F282
.L0606F2D0:
	mov	r9,r0
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel cdc_GetPeriRsp

	glabel CDC_GetHwInfo
	mov	#1,r3
	mov.l	.L0606F344,r2
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r13
	mov.l	r12,@-r15
	mov	#0,r12
	sts.l	pr,@-r15
	add	#-16,r15
	mov	r15,r5
	add	#8,r5
	mov.l	r12,@r5
	mov	r15,r14
	mov.l	r12,@(4,r5)
	mov	r14,r6
	mov.b	r3,@r5
	jsr	@r2
	mov	r12,r4
	mov	r0,r4
	mov.b	@(2,r14),r0
	mov.b	r0,@r13
	mov.b	@(3,r14),r0
	mov.b	r0,@(1,r13)
	mov.b	@(5,r14),r0
	mov.b	r0,@(2,r13)
	mov.b	@(6,r14),r0
	mov.b	r0,@(3,r13)
	mov.b	@(7,r14),r0
	mov.b	r0,@(4,r13)
	mov	r4,r0
	add	#16,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L0606F32E:
	.short 0x00FF
.L0606F330:
	.short 0xFF0F
	.byte 0x00, 0x00
.L0606F334:
	.long cdc_ExecCmdSub
.L0606F338:
	.long cdc_RspToStat
.L0606F33C:
	.long cdc_GetLastStat
.L0606F340:
	.long cdc_read_cr
.L0606F344:
	.long cdc_ExecCmdRsp
	endlabel CDC_GetHwInfo
