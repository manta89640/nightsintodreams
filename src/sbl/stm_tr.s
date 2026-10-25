! sbl/stm_tr: matching source. The readable C for this object is stm_tr.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06070070,"ax",@progbits
	.p2align 2

	glabel stm_CallTrFunc
	mov.l	r14,@-r15
	mov	r5,r6
	sts.l	pr,@-r15
	mov	r4,r14
	add	#-4,r15
	mov.l	r5,@r15
	mov.l	@(24,r14),r3
	mov	r4,r5
	jsr	@r3
	mov.l	@(28,r14),r4
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel stm_CallTrFunc

	glabel STM_SetTrFunc
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	add	#-12,r15
	mov.l	.L06070184,r3
	mov.l	r4,@(4,r15)
	mov.l	r5,@r15
	mov.l	r6,@(8,r15)
	mov.w	.L0607017C,r4
	jsr	@r3
	nop
	mov.l	@(4,r15),r0
	tst	r0,r0
	bf	.L060700BA
	mov.l	.L06070188,r3
	jsr	@r3
	mov	#-11,r4
	add	#12,r15
	mov.l	.L0607018C,r2
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	jmp	@r2
	mov.l	@r15+,r14
.L060700BA:
	mov.l	@(4,r15),r14
	mov.l	@r15,r3
	mov.l	@(4,r14),r14
	mov.l	@(16,r14),r13
	mov.l	r3,@(24,r14)
	mov.l	@r15,r1
	tst	r1,r1
	bf/s	.L060700F0
	add	#108,r13
	mov.w	.L0607017E,r7
	mov	#0,r6
	mov.l	.L06070190,r3
	mov	r6,r5
	jsr	@r3
	mov	r13,r4
	mov.l	.L06070194,r2
	mov	#3,r5
	jsr	@r2
	mov	r13,r4
	mov.l	.L06070198,r3
	mov	#0,r6
	mov	r6,r5
	jsr	@r3
	mov.l	@(16,r14),r4
	mov	#0,r2
	bra	.L06070112
	mov.l	r2,@(28,r14)
.L060700F0:
	mov.w	.L0607017E,r7
	mov	#0,r5
	mov.l	.L06070190,r2
	mov.l	.L0607019C,r6
	jsr	@r2
	mov	r13,r4
	mov.l	.L06070194,r3
	mov	#4,r5
	jsr	@r3
	mov	r13,r4
	mov.l	.L060701A0,r5
	mov	r14,r6
	mov.l	.L06070198,r2
	jsr	@r2
	mov.l	@(16,r14),r4
	mov.l	@(8,r15),r3
	mov.l	r3,@(28,r14)
.L06070112:
	add	#12,r15
	mov.l	.L060701A4,r2
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	jmp	@r2
	mov.l	@r15+,r14
	endlabel STM_SetTrFunc

	glabel STM_StartTrans
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.l	.L06070184,r3
	add	#-8,r15
	mov.l	r4,@r15
	mov.l	r5,@(4,r15)
	mov.w	.L06070180,r4
	jsr	@r3
	nop
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L06070148
	mov.l	.L06070188,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L0607018C,r2
	jsr	@r2
	nop
	bra	.L06070172
	mov	#0,r0
.L06070148:
	mov.l	@r15,r13
	mov	#120,r0
	mov.l	@(4,r13),r13
	mov.l	@(16,r13),r14
	mov.l	@(20,r13),r3
	mov.l	@(28,r3),r1
	tst	r1,r1
	bf/s	.L06070164
	mov.l	@(r0,r14),r14
	mov.l	@(20,r13),r5
	mov.l	.L060701A8,r3
	add	#28,r5
	jsr	@r3
	mov	r14,r4
.L06070164:
	mov.l	@(4,r15),r2
	mov.l	@(4,r14),r3
	mov.l	r3,@r2
	mov.l	.L060701A4,r2
	jsr	@r2
	nop
	mov.l	@r14,r0
.L06070172:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L0607017C:
	.short 0x0317
.L0607017E:
	.short 0x0800
.L06070180:
	.short 0x0318
	.byte 0x00, 0x00
.L06070184:
	.long stm_set_func_id
.L06070188:
	.long stm_set_err
.L0607018C:
	.long stm_call_err_func
.L06070190:
	.long gfsTrn_SetBuf
.L06070194:
	.long gfsTrn_SetMode
.L06070198:
	.long gfsTrn_SetFunc
.L0607019C:
	.long 0x000FFFFF
.L060701A0:
	.long stm_CallTrFunc
.L060701A4:
	.long stm_check_gfs_err
.L060701A8:
	.long gfcf_StartTrans
	endlabel STM_StartTrans

	glabel stm_SetTrBuf
	mov.l	r14,@-r15
	mov	r7,r0
	sts.l	pr,@-r15
	cmp/eq	#2,r0
	add	#-4,r15
	mov.l	r4,@r15
	bf	.L060701BE
	add	r6,r6
	mov	#1,r7
.L060701BE:
	mov	r7,r0
	mov.l	@r15,r4
	cmp/eq	#1,r0
	bt/s	.L060701CE
	mov.l	@(20,r4),r4
	mov.l	@(16,r4),r0
	tst	r0,r0
	bt	.L060701E6
.L060701CE:
	mov.w	.L060702B8,r14
	mov.l	@(8,r4),r1
	mov.l	.L060702C0,r3
	jsr	@r3
	mov	r14,r0
	mov.l	.L060702C0,r3
	neg	r0,r1
	add	r14,r1
	jsr	@r3
	mov	r14,r0
	bra	.L060701EA
	mov.l	r0,@(24,r4)
.L060701E6:
	mov	#0,r3
	mov.l	r3,@(24,r4)
.L060701EA:
	mov.l	@r15,r4
	mov.l	.L060702C4,r3
	mov.l	@(16,r4),r4
	add	#108,r4
	add	#4,r15
	lds.l	@r15+,pr
	jmp	@r3
	mov.l	@r15+,r14
	endlabel stm_SetTrBuf

	glabel STM_SetTrBuf
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	add	#-12,r15
	mov.l	.L060702C8,r3
	mov.l	r4,@(4,r15)
	mov.l	r5,@(8,r15)
	mov.l	r6,@r15
	mov.w	.L060702BA,r4
	jsr	@r3
	mov	r7,r14
	mov.l	.L060702CC,r12
	mov.l	.L060702D0,r13
	mov.l	@(4,r15),r0
	tst	r0,r0
	bf	.L06070220
	bra	.L06070244
	mov	#-11,r4
.L06070220:
	mov.l	@r15,r3
	cmp/pz	r3
	bt	.L0607022A
	bra	.L06070244
	mov	#-14,r4
.L0607022A:
	mov	r14,r0
	cmp/eq	#1,r0
	bt	.L06070250
	mov	r14,r0
	cmp/eq	#2,r0
	bt	.L06070250
	mov.w	.L060702B8,r3
	cmp/eq	r3,r14
	bt	.L06070250
	mov.w	.L060702BC,r1
	cmp/eq	r1,r14
	bt	.L06070250
	mov	#-17,r4
.L06070244:
	jsr	@r13
	nop
	jsr	@r12
	nop
	bra	.L0607026A
	nop
.L06070250:
	mov.l	@(4,r15),r4
	mov.l	@(4,r4),r4
	mov.l	@r15,r6
	mov.l	@(8,r15),r5
	bsr	stm_SetTrBuf
	mov	r14,r7
	mov.l	.L060702D4,r2
	add	#12,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	jmp	@r2
	mov.l	@r15+,r14
.L0607026A:
	add	#12,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel STM_SetTrBuf

	glabel stm_ResetTrBuf
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	add	#-12,r15
	mov.l	.L060702D8,r3
	mov.l	@(16,r4),r14
	add	#108,r14
	jsr	@r3
	mov	r14,r4
	mov	r0,r5
	mov.l	.L060702DC,r2
	jsr	@r2
	mov	r14,r4
	mov.l	@r14,r0
	tst	r0,r0
	bt	.L060702B0
	mov.l	.L060702E0,r3
	mov	r15,r7
	add	#8,r7
	mov	r15,r6
	add	#4,r6
	mov	r15,r5
	jsr	@r3
	mov	r14,r4
	mov.l	@(8,r15),r7
	mov.l	@(4,r15),r6
	mov.l	@r15,r5
	mov.l	.L060702C4,r3
	jsr	@r3
	mov	r14,r4
.L060702B0:
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L060702B8:
	.short 0x0800
.L060702BA:
	.short 0x0316
.L060702BC:
	.short 0x0914
	.byte 0x00, 0x00
.L060702C0:
	.long _modlspnm
.L060702C4:
	.long gfsTrn_SetBuf
.L060702C8:
	.long stm_set_func_id
.L060702CC:
	.long stm_call_err_func
.L060702D0:
	.long stm_set_err
.L060702D4:
	.long stm_check_gfs_err
.L060702D8:
	.long gfsTrn_GetNsct
.L060702DC:
	.long gfsTrn_Request
.L060702E0:
	.long gfsTrn_GetBuf
	endlabel stm_ResetTrBuf

	glabel STM_ResetTrBuf
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L060703DC,r3
	mov.l	r4,@r15
	mov.w	.L060703D4,r4
	jsr	@r3
	nop
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L06070306
	mov.l	.L060703E0,r3
	jsr	@r3
	mov	#-11,r4
	add	#4,r15
	mov.l	.L060703E4,r2
	jmp	@r2
	lds.l	@r15+,pr
.L06070306:
	mov.l	@r15,r4
	bsr	stm_ResetTrBuf
	mov.l	@(4,r4),r4
	mov.l	.L060703E8,r2
	add	#4,r15
	jmp	@r2
	lds.l	@r15+,pr
	endlabel STM_ResetTrBuf

	glabel STM_GetLenTrBuf
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L060703DC,r3
	mov.l	r4,@r15
	mov.w	.L060703D6,r4
	jsr	@r3
	nop
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L0607033C
	mov.l	.L060703E0,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L060703E4,r2
	jsr	@r2
	nop
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#-1,r0
.L0607033C:
	mov.l	@r15,r3
	mov.l	@(4,r3),r2
	mov.l	.L060703EC,r3
	mov	r2,r4
	mov.l	r2,@r15
	mov.l	@(16,r4),r4
	jsr	@r3
	add	#108,r4
	mov.l	r0,@r15
	mov.l	.L060703E8,r3
	jsr	@r3
	nop
	mov	r0,r4
	cmp/pz	r4
	bt	.L06070362
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	r4,r0
.L06070362:
	mov.l	@r15,r0
	shlr	r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel STM_GetLenTrBuf

	glabel stm_IsTrBufFull
	sts.l	pr,@-r15
	mov.l	.L060703F0,r3
	add	#-4,r15
	mov.l	r4,@r15
	mov.l	@(16,r4),r4
	jsr	@r3
	add	#108,r4
	mov	r0,r4
	tst	r4,r4
	bf	.L0607038A
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#1,r0
.L0607038A:
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel stm_IsTrBufFull

	glabel STM_IsTrBufFull
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L060703DC,r3
	mov.l	r4,@r15
	mov.w	.L060703D8,r4
	jsr	@r3
	nop
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L060703BC
	mov.l	.L060703E0,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L060703E4,r2
	jsr	@r2
	nop
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L060703BC:
	mov.l	@r15,r4
	bsr	stm_IsTrBufFull
	mov.l	@(4,r4),r4
	mov.l	r0,@r15
	mov.l	.L060703E8,r3
	jsr	@r3
	nop
	mov.l	@r15,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
.L060703D4:
	.short 0x0323
.L060703D6:
	.short 0x0326
.L060703D8:
	.short 0x0327
	.byte 0x00, 0x00
.L060703DC:
	.long stm_set_func_id
.L060703E0:
	.long stm_set_err
.L060703E4:
	.long stm_call_err_func
.L060703E8:
	.long stm_check_gfs_err
.L060703EC:
	.long gfsTrn_GetWp
.L060703F0:
	.long gfsTrn_GetFree
	endlabel STM_IsTrBufFull
