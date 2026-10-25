! sbl/stm_cdplay: matching source. The readable C for this object is stm_cdplay.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0606A748,"ax",@progbits
	.p2align 2

	glabel stm_GetCurFad
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606A884,r14
	add	#-12,r15
.L0606A750:
	mov	r15,r4
	jsr	@r14
	nop
	mov	r0,r4
	tst	r4,r4
	bf	.L0606A750
	mov	r15,r0
	mov.l	@(8,r0),r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel stm_GetCurFad

	glabel stm_GetFadRange
	mov.l	r14,@-r15
	mov	#0,r14
	mov.l	r13,@-r15
	mov	r14,r7
	sts.l	pr,@-r15
	mov	r5,r13
	add	#-12,r15
	mov	r15,r3
	mov.l	r6,@(8,r15)
	add	#4,r3
	mov.l	r3,@-r15
	mov	r13,r6
	mov.l	r14,@-r15
	mov.l	r14,@-r15
	mov.l	.L0606A888,r3
	mov	r15,r2
	add	#12,r2
	mov.l	r2,@-r15
	jsr	@r3
	mov	r14,r5
	add	#16,r15
	mov.l	@(4,r15),r0
	tst	#6,r0
	bf	.L0606A7A6
	mov.l	@(8,r15),r2
	mov.l	@r15,r3
	mov.l	@r13,r1
	add	r3,r1
	add	#-1,r1
	bra	.L0606A7AE
	mov.l	r1,@r2
.L0606A7A6:
	mov.l	.L0606A88C,r4
	mov.l	r4,@r13
	mov.l	@(8,r15),r2
	mov.l	r4,@r2
.L0606A7AE:
	add	#12,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel stm_GetFadRange

	glabel stm_CdPlayObj
	mov.l	r14,@-r15
	mov	#0,r14
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	mov	r4,r12
	add	#-28,r15
	mov	r15,r6
	mov.l	@(12,r12),r4
	mov	r15,r5
	mov.l	@(20,r12),r13
	add	#4,r5
	bsr	stm_GetFadRange
	mov.l	@(20,r4),r4
	mov.l	@r15,r2
	cmp/ge	r13,r2
	bf	.L0606A82C
	mov	#1,r4
	mov	r15,r2
	add	#8,r2
	mov.l	r4,@r2
	mov	r15,r3
	add	#8,r3
	mov	r15,r2
	mov.l	r13,@(4,r3)
	mov	#16,r0
	add	#8,r2
	mov	r15,r3
	mov.l	r4,@(8,r2)
	add	#8,r3
	mov.l	@r15,r2
	sub	r13,r2
	add	r4,r2
	mov	r15,r4
	mov.l	r2,@(12,r3)
	add	#8,r4
	mov	r15,r3
	add	#8,r3
	mov	#0,r2
	mov.b	r2,@(r0,r3)
	mov.l	.L0606A890,r3
	jsr	@r3
	mov.l	@(52,r12),r5
	cmp/eq	#-13,r0
	bf/s	.L0606A818
	mov	r0,r14
	bra	.L0606A82C
	mov	#-23,r14
.L0606A818:
	tst	r14,r14
	bt	.L0606A820
	bra	.L0606A82C
	mov	#-1,r14
.L0606A820:
	mov.l	.L0606A894,r4
	mov.l	@r4,r2
	mov.l	r13,@(20,r2)
	mov.l	@r4,r3
	mov.l	@r15,r2
	mov.l	r2,@(24,r3)
.L0606A82C:
	mov	r14,r0
	add	#28,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel stm_CdPlayObj

	glabel stm_CdPause
	mov	#3,r2
	sts.l	pr,@-r15
	add	#-12,r15
	mov.l	r4,@r15
	mov	r15,r3
	add	#4,r3
	mov	r15,r4
	mov.l	r2,@r3
	add	#4,r4
	mov.l	@r15,r5
	mov.l	.L0606A898,r3
	jsr	@r3
	mov.l	@(52,r5),r5
	cmp/eq	#-13,r0
	bf/s	.L0606A862
	mov	r0,r4
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov	#-23,r0
.L0606A862:
	tst	r4,r4
	bt	.L0606A86E
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov	#-1,r0
.L0606A86E:
	mov	#-1,r6
	mov.l	.L0606A894,r5
	mov	r4,r0
	mov.l	@r5,r3
	mov.l	r6,@(20,r3)
	mov.l	@r5,r2
	mov.l	r6,@(24,r2)
	add	#12,r15
	lds.l	@r15+,pr
	rts
	nop
.L0606A884:
	.long CDC_GetCurStat
.L0606A888:
	.long gfsFlow_GetFinfo
.L0606A88C:
	.long 0x7FFFFFFF
.L0606A890:
	.long gfcd_Play
.L0606A894:
	.long stm_mng
.L0606A898:
	.long gfcd_Seek
	endlabel stm_CdPause
