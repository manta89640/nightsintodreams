! sbl/cdc_file: matching source. The readable C for this object is cdc_file.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0606FB80,"ax",@progbits
	.p2align 2

	glabel CDC_ChgDir
	mov.l	r14,@-r15
	mov	#0,r6
	sts.l	pr,@-r15
	mov	#112,r3
	add	#-8,r15
	mov	r15,r14
	mov.l	r6,@r14
	mov	r4,r0
	mov.l	r6,@(4,r14)
	mov.b	r3,@r14
	mov.l	r5,@(4,r14)
	mov.b	r0,@(4,r14)
	mov.w	.L0606FCC2,r4
	mov.l	.L0606FCC4,r3
	jsr	@r3
	mov	r14,r5
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel CDC_ChgDir

	glabel CDC_ReadDir
	mov.l	r14,@-r15
	mov	#0,r6
	sts.l	pr,@-r15
	mov	#113,r3
	add	#-8,r15
	mov	r15,r14
	mov.l	r6,@r14
	mov	r4,r0
	mov.l	r6,@(4,r14)
	mov.b	r3,@r14
	mov.l	r5,@(4,r14)
	mov.b	r0,@(4,r14)
	mov.w	.L0606FCC2,r4
	mov.l	.L0606FCC4,r3
	jsr	@r3
	mov	r14,r5
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel CDC_ReadDir

	glabel CDC_GetFileScope
	mov.l	r14,@-r15
	mov	#114,r3
	mov.l	.L0606FCC8,r2
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov	#0,r13
	add	#-28,r15
	mov	r15,r14
	mov.l	r4,@(4,r15)
	add	#12,r14
	mov.l	r5,@(8,r15)
	mov	r15,r5
	mov.l	r6,@r15
	add	#20,r5
	mov.l	r13,@r5
	mov	r14,r6
	mov.l	r13,@(4,r5)
	mov.b	r3,@r5
	jsr	@r2
	mov	r13,r4
	mov.l	@(8,r15),r3
	mov	r0,r4
	mov.l	.L0606FCCC,r2
	mov.w	@(2,r14),r0
	extu.w	r0,r0
	mov.l	r0,@r3
	mov.l	@r15,r3
	mov.b	@(4,r14),r0
	extu.b	r0,r0
	mov.l	r0,@r3
	mov.l	@(4,r15),r3
	mov	r4,r0
	mov.l	@(4,r14),r1
	and	r2,r1
	mov.l	r1,@r3
	add	#28,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel CDC_GetFileScope

	glabel CDC_TgetFileInfo
	mov.l	r14,@-r15
	mov	#115,r3
	mov.l	r13,@-r15
	mov	#0,r13
	mov.l	r12,@-r15
	mov	r13,r0
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
	mov.l	r4,@(4,r14)
	mov.b	r0,@(4,r14)
	mov.l	.L0606FCC8,r3
	jsr	@r3
	mov	r0,r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606FC58
	bra	.L0606FC64
	mov	r4,r0
.L0606FC58:
	mov.l	.L0606FCCC,r3
	mov.l	@r12,r4
	mov.l	@r15,r5
	mov.l	.L0606FCD0,r2
	jsr	@r2
	and	r3,r4
.L0606FC64:
	add	#20,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel CDC_TgetFileInfo

	glabel CDC_ReadFile
	mov.l	r14,@-r15
	mov	#0,r7
	sts.l	pr,@-r15
	mov	#116,r3
	add	#-8,r15
	mov	r15,r14
	mov.l	r7,@r14
	mov	r4,r0
	mov.l	r7,@(4,r14)
	mov.l	r6,@r14
	mov.b	r3,@r14
	mov.l	r5,@(4,r14)
	mov.b	r0,@(4,r14)
	mov.w	.L0606FCC2,r4
	mov.l	.L0606FCC4,r3
	jsr	@r3
	mov	r14,r5
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel CDC_ReadFile

	glabel CDC_AbortFile
	mov	#0,r4
	mov.l	.L0606FCD4,r2
	mov	#117,r3
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	add	#-8,r15
	mov	r15,r14
	mov.l	r4,@r14
	mov.l	r4,@(4,r14)
	mov.w	.L0606FCC2,r4
	jsr	@r2
	mov.b	r3,@r14
	mov.w	.L0606FCC2,r4
	mov.l	.L0606FCC4,r3
	jsr	@r3
	mov	r14,r5
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606FCC2:
	.short 0x0200
.L0606FCC4:
	.long cdc_ExecCmd
.L0606FCC8:
	.long cdc_ExecCmdRsp
.L0606FCCC:
	.long 0x00FFFFFF
.L0606FCD0:
	.long cdc_get_data_words
.L0606FCD4:
	.long cdc_add_hirq_stat
	endlabel CDC_AbortFile
