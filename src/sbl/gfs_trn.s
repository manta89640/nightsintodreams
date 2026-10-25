! sbl/gfs_trn: matching source. The readable C for this object is gfs_trn.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0606C3C0,"ax",@progbits
	.p2align 2

	glabel gfsTrn_Init
	mov.l	r14,@-r15
	mov	#1,r3
	mov.l	r13,@-r15
	mov	r4,r14
	sts.l	pr,@-r15
	mov	#0,r13
	mov.l	r13,@r14
	mov	r3,r5
	mov.l	r13,@(4,r14)
	mov.l	r13,@(8,r14)
	mov.l	r13,@(12,r14)
	mov.l	r13,@(16,r14)
	mov.l	r3,@(20,r14)
	mov.l	r13,@(24,r14)
	mov.l	r13,@(28,r14)
	mov.l	r13,@(32,r14)
	bsr	gfsTrn_SetUnit
	mov	r14,r4
	mov.l	r13,@(52,r14)
	mov	#3,r5
	bsr	gfsTrn_SetMode
	mov	r14,r4
	lds.l	@r15+,pr
	mov	r14,r0
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfsTrn_Init

	glabel gfsTrn_SetMode
	mov.l	@(56,r4),r0
	mov.l	r5,@(56,r4)
	mov	#0,r5
	mov.l	r5,@(36,r4)
	rts
	mov.l	r5,@(40,r4)
	endlabel gfsTrn_SetMode

	glabel gfsTrn_SetUnit
	rts
	mov.l	r5,@(44,r4)
	endlabel gfsTrn_SetUnit

	glabel gfsTrn_Request
	sts.l	pr,@-r15
	mov.l	r5,@(24,r4)
	mov	#0,r5
	mov.l	r5,@(28,r4)
	mov.l	@(52,r4),r0
	cmp/eq	#6,r0
	bf	.L0606C442
	mov.l	r5,@(52,r4)
	mov.l	@(56,r4),r0
	cmp/eq	#1,r0
	bt/s	.L0606C42A
	mov	r0,r5
	mov	r5,r0
	cmp/eq	#2,r0
	bt	.L0606C42A
	mov	r5,r0
	cmp/eq	#3,r0
	bf	.L0606C442
.L0606C42A:
	mov	#4,r5
	mov.l	.L0606C4EC,r2
	mov	r5,r0
	mov.l	@(8,r4),r3
	add	#3,r3
	mov.l	r3,@(8,r4)
	jsr	@r2
	mov	r3,r1
	mov	r0,r3
	mul.l	r5,r3
	sts	macl,r3
	mov.l	r3,@(8,r4)
.L0606C442:
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfsTrn_Request

	glabel gfsTrn_GetNsct
	rts
	mov.l	@(24,r4),r0
	endlabel gfsTrn_GetNsct

	glabel gfsTrn_GetSctcnt
	rts
	mov.l	@(28,r4),r0
	endlabel gfsTrn_GetSctcnt

	glabel gfsTrn_SetTsize
	mov.l	@(20,r4),r0
	rts
	mov.l	r5,@(20,r4)
	endlabel gfsTrn_SetTsize

	glabel gfsTrn_Activate
	mov	#1,r3
	rts
	mov.l	r3,@(48,r4)
	endlabel gfsTrn_Activate

	glabel gfsTrn_Deactivate
	mov	#0,r2
	rts
	mov.l	r2,@(48,r4)
	endlabel gfsTrn_Deactivate

	glabel gfsTrn_Stop
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r13
	mov.w	.L0606C4EA,r0
	mov	r13,r14
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov	#0,r10
	mov.l	.L0606C4F0,r12
	sts.l	pr,@-r15
	mov.l	.L0606C4F4,r11
	add	#-8,r15
	mov.l	r5,@(4,r15)
	mov.l	@r12,r3
	mov.l	r10,@(r0,r3)
	bra	.L0606C49A
	add	#108,r14
.L0606C486:
	mov	r15,r5
	bsr	gfsTrn_Step
	mov	r13,r4
	mov.l	@r12,r3
	mov.w	.L0606C4EA,r0
	mov.l	@(r0,r3),r2
	add	#1,r2
	mov.l	r2,@(r0,r3)
	cmp/gt	r11,r2
	bt	.L0606C4AC
.L0606C49A:
	mov.l	@(52,r14),r4
	tst	r4,r4
	bt	.L0606C4AC
	mov	r4,r0
	cmp/eq	#6,r0
	bt	.L0606C4AC
	mov	r4,r0
	cmp/eq	#7,r0
	bf	.L0606C486
.L0606C4AC:
	mov.l	@(12,r14),r0
	tst	r0,r0
	bt	.L0606C4C8
	mov.l	@(4,r15),r6
	mov.l	@(12,r14),r5
	mov.l	.L0606C4F8,r3
	jsr	@r3
	mov	r13,r4
	mov.l	@(12,r14),r2
	mov.l	@(12,r2),r3
	mov.l	@(28,r14),r1
	add	r3,r1
	mov.l	r1,@(28,r14)
	mov.l	r10,@(12,r14)
.L0606C4C8:
	mov.l	@(16,r14),r0
	tst	r0,r0
	bt	.L0606C4D6
	mov.l	@(16,r14),r5
	bsr	gfsTrn_FreeDstPack
	mov	r14,r4
	mov.l	r10,@(16,r14)
.L0606C4D6:
	mov	#6,r2
	mov.l	r2,@(52,r14)
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L0606C4EA:
	.short 0x00C8
.L0606C4EC:
	.long _divlu
.L0606C4F0:
	.long gfs_mng
.L0606C4F4:
	.long 0x00600000
.L0606C4F8:
	.long gfsAcc_ReleasePack
	endlabel gfsTrn_Stop

	glabel gfsTrn_Exec
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov	r4,r12
	sts.l	pr,@-r15
	mov	r12,r4
	add	#-4,r15
	add	#108,r4
	mov.l	r5,@r15
	mov.l	@(56,r4),r5
	mov	r5,r0
	cmp/eq	#0,r0
	bt/s	.L0606C52C
	mov	#1,r6
	cmp/eq	#1,r0
	bt	.L0606C52C
	cmp/eq	#2,r0
	bt	.L0606C52C
	cmp/eq	#3,r0
	bt	.L0606C53A
	cmp/eq	#4,r0
	bt	.L0606C53A
	bra	.L0606C53A
	nop
.L0606C52C:
	mov.l	@(52,r4),r1
	tst	r1,r1
	bt	.L0606C536
	bra	.L0606C53C
	mov	#2,r14
.L0606C536:
	bra	.L0606C53C
	mov	r6,r14
.L0606C53A:
	mov	r6,r14
.L0606C53C:
	mov	#0,r4
	cmp/ge	r14,r4
	bt/s	.L0606C560
	mov	r4,r13
.L0606C544:
	mov.l	@r15,r5
	bsr	gfsTrn_Step
	mov	r12,r4
	cmp/eq	#7,r0
	bt/s	.L0606C560
	mov	r0,r4
	tst	r4,r4
	bt	.L0606C55A
	mov	r4,r0
	cmp/eq	#6,r0
	bf	.L0606C560
.L0606C55A:
	add	#1,r13
	cmp/ge	r14,r13
	bf	.L0606C544
.L0606C560:
	mov	r4,r0
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfsTrn_Exec

	glabel gfsTrn_Skip
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r14
	sts.l	pr,@-r15
	add	#108,r14
	mov.l	@(24,r14),r3
	cmp/pl	r3
	bt/s	.L0606C584
	mov	r4,r13
	bra	.L0606C5D4
	mov	#6,r0
.L0606C584:
	mov.l	@(48,r14),r1
	tst	r1,r1
	bf	.L0606C58E
	bra	.L0606C5D4
	mov.l	@(52,r14),r0
.L0606C58E:
	mov.l	@(52,r14),r0
	cmp/eq	#0,r0
	bt	.L0606C59C
	cmp/eq	#5,r0
	bt	.L0606C5AA
	bra	.L0606C5D2
	nop
.L0606C59C:
	bsr	gfsTrn_GetSrcPack
	mov	r13,r4
	mov.l	@(12,r14),r0
	tst	r0,r0
	bt	.L0606C5D2
	mov	#5,r2
	mov.l	r2,@(52,r14)
.L0606C5AA:
	mov	#-1,r6
	mov.l	@(12,r14),r5
	mov.l	.L0606C6D8,r3
	jsr	@r3
	mov	r13,r4
	mov.l	@(12,r14),r2
	mov	#0,r4
	mov.l	@(28,r14),r1
	mov.l	@(12,r2),r3
	add	r3,r1
	mov.l	r1,@(28,r14)
	mov.l	r4,@(12,r14)
	mov.l	@(24,r14),r3
	mov.l	@(28,r14),r2
	cmp/ge	r3,r2
	bf	.L0606C5D0
	mov	#6,r0
	bra	.L0606C5D2
	mov.l	r0,@(52,r14)
.L0606C5D0:
	mov.l	r4,@(52,r14)
.L0606C5D2:
	mov.l	@(52,r14),r0
.L0606C5D4:
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfsTrn_Skip

	glabel gfsTrn_Step
	mov.l	r14,@-r15
	mov	r4,r14
	mov.l	r13,@-r15
	add	#108,r14
	mov.l	r12,@-r15
	mov	#0,r12
	mov.l	r11,@-r15
	mov	r4,r11
	mov.l	r10,@-r15
	mov	r5,r10
	sts.l	pr,@-r15
	mov.l	@(24,r14),r3
	cmp/gt	r12,r3
	bt/s	.L0606C600
	mov	r12,r13
	mov.l	r13,@r10
	bra	.L0606C6A8
	mov	#6,r0
.L0606C600:
	mov.l	@(48,r14),r1
	tst	r1,r1
	bf	.L0606C60C
	mov.l	r13,@r10
	bra	.L0606C6A8
	mov.l	@(52,r14),r0
.L0606C60C:
	mov.l	@(52,r14),r0
	cmp/eq	#0,r0
	bt	.L0606C62A
	cmp/eq	#1,r0
	bt	.L0606C638
	cmp/eq	#2,r0
	bt	.L0606C646
	cmp/eq	#3,r0
	bt	.L0606C652
	cmp/eq	#4,r0
	bt	.L0606C65E
	cmp/eq	#5,r0
	bt	.L0606C66C
	bra	.L0606C6A4
	nop
.L0606C62A:
	bsr	gfsTrn_GetSrcPack
	mov	r11,r4
	mov.l	@(12,r14),r0
	tst	r0,r0
	bt	.L0606C6A4
	mov	#1,r2
	mov.l	r2,@(52,r14)
.L0606C638:
	bsr	gfsTrn_GetDstPack
	mov	r14,r4
	mov.l	@(16,r14),r0
	tst	r0,r0
	bt	.L0606C6A4
	mov	#2,r2
	mov.l	r2,@(52,r14)
.L0606C646:
	bsr	gfsTrn_PrepPack
	mov	r14,r4
	tst	r0,r0
	bt	.L0606C6A4
	mov	#3,r2
	mov.l	r2,@(52,r14)
.L0606C652:
	bsr	gfsTrn_TransPack
	mov	r11,r4
	tst	r0,r0
	bt	.L0606C6A4
	mov	#4,r2
	mov.l	r2,@(52,r14)
.L0606C65E:
	bsr	gfsTrn_WaitPack
	mov	r14,r4
	cmp/pl	r0
	bt	.L0606C6A4
	mov	#1,r13
	mov	#5,r2
	mov.l	r2,@(52,r14)
.L0606C66C:
	mov.l	@(12,r14),r3
	mov.l	@(8,r3),r2
	mov.l	@(32,r14),r1
	cmp/eq	r2,r1
	bf	.L0606C68C
	mov	#-1,r6
	mov.l	@(12,r14),r5
	mov.l	.L0606C6D8,r2
	jsr	@r2
	mov	r11,r4
	mov.l	@(12,r14),r3
	mov.l	@(12,r3),r3
	mov.l	@(28,r14),r2
	add	r3,r2
	mov.l	r2,@(28,r14)
	mov.l	r12,@(12,r14)
.L0606C68C:
	mov.l	@(16,r14),r5
	bsr	gfsTrn_FreeDstPack
	mov	r14,r4
	mov.l	r12,@(16,r14)
	mov.l	@(24,r14),r2
	mov.l	@(28,r14),r3
	cmp/ge	r2,r3
	bf	.L0606C6A2
	mov	#6,r0
	bra	.L0606C6A4
	mov.l	r0,@(52,r14)
.L0606C6A2:
	mov.l	r12,@(52,r14)
.L0606C6A4:
	mov.l	r13,@r10
	mov.l	@(52,r14),r0
.L0606C6A8:
	lds.l	@r15+,pr
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfsTrn_Step

	glabel gfsTrn_GetSrcPack
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r14
	sts.l	pr,@-r15
	add	#108,r14
	add	#-4,r15
	mov.l	r4,@r15
	mov.l	@(28,r14),r3
	mov.l	@(24,r14),r4
	mov.l	@(20,r14),r5
	sub	r3,r4
	cmp/ge	r5,r4
	bt/s	.L0606C6DC
	mov	#1,r2
	bra	.L0606C6DE
	mov	r4,r13
	.byte 0x00, 0x00
.L0606C6D8:
	.long gfsAcc_ReleasePack
.L0606C6DC:
	mov	r5,r13
.L0606C6DE:
	mov.l	@(44,r14),r3
	cmp/gt	r2,r3
	bf	.L0606C70E
	mov.l	@(12,r14),r0
	tst	r0,r0
	bt	.L0606C6FA
	mov.l	@(12,r14),r1
	mov.l	@(32,r14),r3
	mov.l	@(8,r1),r1
	sub	r3,r1
	mov.l	.L0606C7C0,r3
	jsr	@r3
	mov.l	@(44,r14),r0
	mov	r0,r13
.L0606C6FA:
	bsr	gfsTrn_GetFree
	mov	r14,r4
	mov	r0,r1
	mov.l	.L0606C7C0,r3
	jsr	@r3
	mov.l	@(44,r14),r0
	mov	r0,r4
	cmp/ge	r4,r13
	bf	.L0606C70E
	mov	r4,r13
.L0606C70E:
	mov.l	@(12,r14),r0
	tst	r0,r0
	bf	.L0606C728
	mov.l	@r15,r4
	mov.l	.L0606C7C4,r3
	jsr	@r3
	mov	r13,r5
	mov	r0,r1
	tst	r1,r1
	bt/s	.L0606C728
	mov.l	r0,@(12,r14)
	mov	#0,r3
	mov.l	r3,@(32,r14)
.L0606C728:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfsTrn_GetSrcPack

	glabel gfsTrn_GetDstPack
	mov	#1,r3
	mov.l	r14,@-r15
	mov	r4,r14
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.l	@(44,r14),r2
	cmp/gt	r3,r2
	bf	.L0606C748
	mov.l	@(12,r14),r5
	bra	.L0606C762
	mov.l	@(8,r5),r5
.L0606C748:
	mov.l	@(12,r14),r13
	mov.l	@(32,r14),r2
	mov.l	@(8,r13),r13
	sub	r2,r13
	bsr	gfsTrn_GetFree
	mov	r14,r4
	cmp/ge	r0,r13
	bt	.L0606C75C
	bra	.L0606C762
	mov	r13,r5
.L0606C75C:
	bsr	gfsTrn_GetFree
	mov	r14,r4
	mov	r0,r5
.L0606C762:
	bsr	gfsTrn_AllocDstPack
	mov	r14,r4
	mov.l	r0,@(16,r14)
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfsTrn_GetDstPack

	glabel gfsTrn_ScuPrep
	rts
	mov	#1,r0
	endlabel gfsTrn_ScuPrep

	glabel gfsTrn_ScuTrans
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov	r4,r13
	add	#-40,r15
	tst	r13,r13
	bt	.L0606C800
	tst	r7,r7
	mov.l	r6,@r15
	mov.l	r13,@(4,r15)
	mov.l	@(52,r15),r3
	mov.l	r3,@(8,r15)
	bf/s	.L0606C796
	mov	#0,r14
	mov.l	r14,@(12,r15)
	bra	.L0606C79A
	nop
.L0606C796:
	mov.w	.L0606C7BC,r2
	mov.l	r2,@(12,r15)
.L0606C79A:
	tst	r5,r5
	bf/s	.L0606C7A6
	mov	#1,r4
	mov.l	r14,@(16,r15)
	bra	.L0606C7D8
	nop
.L0606C7A6:
	mov.l	.L0606C7C8,r5
	mov.l	.L0606C7CC,r2
	and	r13,r5
	cmp/hs	r2,r5
	bf	.L0606C7D4
	mov.l	.L0606C7D0,r1
	cmp/hs	r1,r5
	bt	.L0606C7D4
	mov.l	r4,@(16,r15)
	bra	.L0606C7D8
	nop
.L0606C7BC:
	.short 0x0100
	.byte 0x00, 0x00
.L0606C7C0:
	.long _divlspnm
.L0606C7C4:
	.long gfsAcc_GetPack
.L0606C7C8:
	.long 0x0FFFFFFF
.L0606C7CC:
	.long SCSP_RAM_CACHED
.L0606C7D0:
	.long SCU_REGS_CACHED
.L0606C7D4:
	mov	#2,r2
	mov.l	r2,@(16,r15)
.L0606C7D8:
	mov.l	r14,@(20,r15)
	mov	#7,r3
	mov.l	r14,@(24,r15)
	mov	#3,r2
	mov.l	r14,@(28,r15)
	mov.l	r3,@(32,r15)
	mov.l	r2,@(36,r15)
	mov.l	.L0606C8BC,r3
	mov.l	.L0606C8C0,r2
	mov.l	r4,@r3
	mov	r15,r4
	jsr	@r2
	mov	r14,r5
	mov.l	.L0606C8C4,r3
	jsr	@r3
	mov	r14,r4
	mov.l	@(52,r15),r5
	mov.l	.L0606C8C8,r3
	jsr	@r3
	mov	r13,r4
.L0606C800:
	add	#40,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfsTrn_ScuTrans

	glabel gfsTrn_ScuWait
	sts.l	pr,@-r15
	mov.l	.L0606C8CC,r3
	add	#-4,r15
	mov	r15,r4
	jsr	@r3
	mov	#0,r5
	mov.l	@r15,r0
	cmp/eq	#1,r0
	bf	.L0606C824
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#1,r0
.L0606C824:
	mov.l	.L0606C8BC,r2
	mov	#0,r4
	mov.l	r4,@r2
	mov	r4,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfsTrn_ScuWait

	glabel gfsTrn_SdmaPrep
	rts
	mov	#1,r0
	endlabel gfsTrn_SdmaPrep

	glabel gfsTrn_SdmaTrans
	mov.l	r14,@-r15
	mov	#96,r0
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov	r4,r11
	mov.l	r10,@-r15
	mov	r5,r10
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	add	#-60,r15
	mov.l	r7,@r15
	mov.l	@(r0,r15),r12
	mov	r12,r13
	shlr2	r13
	mov.l	r13,@(4,r15)
	cmp/pl	r13
	bf/s	.L0606C900
	mov	r6,r8
	mov.l	.L0606C8D0,r2
	jsr	@r2
	mov	r11,r4
	mov	#0,r14
	mov.l	r14,@(48,r15)
	mov	#1,r9
	mov.l	r9,@(52,r15)
	mov	#15,r3
	mov.l	r3,@(56,r15)
	mov	r15,r4
	mov.l	.L0606C8D4,r3
	add	#48,r4
	jsr	@r3
	nop
	mov.l	@r15,r2
	cmp/pl	r8
	mov.l	r2,@(8,r15)
	mov.l	r10,@(12,r15)
	mov.l	@(4,r15),r3
	mov.l	r3,@(16,r15)
	bf/s	.L0606C892
	mov	#2,r4
	mov.l	r9,@(20,r15)
	bra	.L0606C89E
	nop
.L0606C892:
	cmp/pz	r8
	bt	.L0606C89C
	mov.l	r4,@(20,r15)
	bra	.L0606C89E
	nop
.L0606C89C:
	mov.l	r14,@(20,r15)
.L0606C89E:
	mov	#92,r0
	mov.l	@(r0,r15),r3
	cmp/pl	r3
	bf	.L0606C8AC
	mov.l	r9,@(24,r15)
	bra	.L0606C8DA
	nop
.L0606C8AC:
	mov	#92,r0
	mov.l	@(r0,r15),r2
	cmp/pz	r2
	bt	.L0606C8D8
	mov.l	r4,@(24,r15)
	bra	.L0606C8DA
	nop
	.byte 0x00, 0x00
.L0606C8BC:
	.long gfs_scu_dma_busy
.L0606C8C0:
	.long DMA_ScuSetPrm
.L0606C8C4:
	.long DMA_ScuStart
.L0606C8C8:
	.long CSH_Purge
.L0606C8CC:
	.long DMA_ScuGetStatus
.L0606C8D0:
	.long DMA_CpuStop
.L0606C8D4:
	.long DMA_CpuSetComPrm
.L0606C8D8:
	mov.l	r14,@(24,r15)
.L0606C8DA:
	mov	r15,r4
	mov.w	.L0606CA0C,r3
	add	#8,r4
	mov.w	.L0606CA0E,r2
	mov.l	r3,@(28,r15)
	mov.l	r2,@(32,r15)
	mov.l	r14,@(36,r15)
	mov.w	.L0606CA10,r3
	mov.l	r3,@(44,r15)
	mov.l	.L0606CA14,r3
	jsr	@r3
	mov	r11,r5
	mov.l	.L0606CA18,r2
	jsr	@r2
	mov	r11,r4
	mov.l	.L0606CA1C,r3
	mov	r12,r5
	jsr	@r3
	mov	r10,r4
.L0606C900:
	mov.l	.L0606CA20,r2
	mov	#3,r3
	mul.l	r13,r8
	mov	#92,r0
	and	r3,r12
	mov	r2,r1
	mov.l	r12,@r2
	sts	macl,r8
	shll2	r8
	add	r10,r8
	mov.l	r8,@(8,r1)
	mov	r1,r3
	mov.l	@(r0,r15),r2
	mul.l	r13,r2
	mov.l	@r15,r1
	sts	macl,r13
	shll2	r13
	add	r1,r13
	mov.l	r13,@(4,r3)
	add	#60,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfsTrn_SdmaTrans

	glabel gfsTrn_SdmaWait
	sts.l	pr,@-r15
	mov.l	.L0606CA24,r3
	add	#-4,r15
	mov.l	r4,@r15
	jsr	@r3
	nop
	tst	r0,r0
	bf	.L0606C952
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#1,r0
.L0606C952:
	mov.l	.L0606CA20,r6
	mov.l	.L0606CA20,r5
	mov.l	@(4,r6),r6
	mov.l	@(8,r5),r5
	mov.l	.L0606CA20,r4
	bsr	gfsTrn_CopyTail
	mov.l	@r4,r4
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfsTrn_SdmaWait

	glabel gfsTrn_Sdma0Prep
	bra	gfsTrn_SdmaPrep
	mov	#0,r4
	endlabel gfsTrn_Sdma0Prep

	glabel gfsTrn_Sdma0Trans
	sts.l	pr,@-r15
	add	#-16,r15
	mov.l	r4,@r15
	mov.l	r5,@(4,r15)
	mov.l	r6,@(8,r15)
	mov.l	r7,@(12,r15)
	mov.l	@(20,r15),r3
	mov.l	r3,@-r15
	mov.l	@(16,r15),r2
	mov.l	r2,@-r15
	mov.l	@(16,r15),r7
	mov.l	@(12,r15),r6
	mov.l	@(8,r15),r5
	bsr	gfsTrn_SdmaTrans
	mov	#0,r4
	add	#24,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfsTrn_Sdma0Trans

	glabel gfsTrn_Sdma0Wait
	bra	gfsTrn_SdmaWait
	mov	#0,r4
	endlabel gfsTrn_Sdma0Wait

	glabel gfsTrn_Sdma1Prep
	bra	gfsTrn_SdmaPrep
	mov	#1,r4
	endlabel gfsTrn_Sdma1Prep

	glabel gfsTrn_Sdma1Trans
	sts.l	pr,@-r15
	add	#-16,r15
	mov.l	r4,@r15
	mov.l	r5,@(4,r15)
	mov.l	r6,@(8,r15)
	mov.l	r7,@(12,r15)
	mov.l	@(20,r15),r3
	mov.l	r3,@-r15
	mov.l	@(16,r15),r2
	mov.l	r2,@-r15
	mov.l	@(16,r15),r7
	mov.l	@(12,r15),r6
	mov.l	@(8,r15),r5
	bsr	gfsTrn_SdmaTrans
	mov	#1,r4
	add	#24,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfsTrn_Sdma1Trans

	glabel gfsTrn_Sdma1Wait
	bra	gfsTrn_SdmaWait
	mov	#1,r4
	endlabel gfsTrn_Sdma1Wait

	glabel gfsTrn_CpuPrep
	rts
	mov	#1,r0
	endlabel gfsTrn_CpuPrep

	glabel gfsTrn_CpuTrans
	tst	r4,r4
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r6,r13
	bt/s	.L0606CA02
	mov	r4,r14
	mov	#0,r4
	mov.l	@(8,r15),r6
	shll2	r5
	shlr2	r6
	cmp/pl	r6
	bf/s	.L0606C9F2
	shll2	r7
.L0606C9E4:
	mov.l	@r13,r2
	add	#1,r4
	mov.l	r2,@r14
	cmp/ge	r6,r4
	add	r5,r14
	bf/s	.L0606C9E4
	add	r7,r13
.L0606C9F2:
	mov	r13,r6
	mov.l	@(8,r15),r0
	mov	r14,r5
	mov.l	@r15+,r13
	and	#3,r0
	mov	r0,r4
	bra	gfsTrn_CopyTail
	mov.l	@r15+,r14
.L0606CA02:
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfsTrn_CpuTrans

	glabel gfsTrn_CpuWait
	rts
	mov	#0,r0
.L0606CA0C:
	.short 0x0800
.L0606CA0E:
	.short 0x0200
.L0606CA10:
	.short 0x02FF
	.byte 0x00, 0x00
.L0606CA14:
	.long DMA_CpuSetPrm
.L0606CA18:
	.long DMA_CpuStart
.L0606CA1C:
	.long CSH_Purge
.L0606CA20:
	.long gfs_cpu_dma_tail
.L0606CA24:
	.long DMA_CpuGetStatus
	endlabel gfsTrn_CpuWait

	glabel gfsTrn_PrepPack
	mov.l	r14,@-r15
	mov.l	@(56,r4),r14
	mov.l	@(16,r4),r4
	mov	r14,r0
	cmp/eq	#0,r0
	bt/s	.L0606CA44
	mov.l	@r4,r5
	cmp/eq	#4,r0
	bt	.L0606CA3E
	bra	.L0606CA62
	nop
.L0606CA3E:
	mov	#1,r0
	rts
	mov.l	@r15+,r14
.L0606CA44:
	mov.l	.L0606CBD4,r4
	and	r5,r4
	mov.l	.L0606CBD8,r3
	cmp/hs	r3,r4
	bf	.L0606CA54
	mov.l	.L0606CBDC,r1
	cmp/hs	r1,r4
	bf	.L0606CA60
.L0606CA54:
	mov.l	.L0606CBE0,r3
	cmp/hs	r3,r4
	bf	.L0606CA62
	mov.l	.L0606CBE4,r1
	cmp/hs	r1,r4
	bt	.L0606CA62
.L0606CA60:
	mov	#3,r14
.L0606CA62:
	mov	r14,r0
	mov.l	.L0606CBE8,r1
	mov	r14,r3
	shll	r0
	add	r3,r0
	shll2	r0
	exts.b	r0,r0
	mov.l	@(r0,r1),r0
	jmp	@r0
	mov.l	@r15+,r14
	.byte 0x00, 0x0B, 0x6E, 0xF6
	endlabel gfsTrn_PrepPack

	glabel gfsTrn_TransPack
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r14
	mov.l	r12,@-r15
	add	#108,r14
	mov.l	r11,@-r15
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	r4,@r15
	mov.l	@(12,r14),r13
	mov.l	@(16,r14),r12
	mov.l	@(56,r14),r0
	cmp/eq	#4,r0
	bf/s	.L0606CABE
	mov	r0,r4
	mov.l	@(40,r14),r2
	mov.l	@(12,r13),r5
	jsr	@r2
	mov.l	@(36,r14),r4
	mov	r0,r4
	cmp/pz	r4
	bf	.L0606CAB8
	mov.l	r4,@(12,r13)
	mov.l	r4,@(12,r12)
	mov.l	@(44,r14),r2
	mul.l	r2,r4
	sts	macl,r4
	mov.l	r4,@(8,r13)
	mov.l	r4,@(8,r12)
	bra	.L0606CB2C
	mov.l	r4,@(32,r14)
.L0606CAB8:
	mov.l	r4,@(8,r13)
	bra	.L0606CB2E
	mov	#0,r0
.L0606CABE:
	mov.l	@(32,r14),r1
	tst	r1,r1
	bf	.L0606CAD6
	mov.l	@r15,r5
	add	#12,r5
	mov.l	.L0606CBEC,r3
	jsr	@r3
	mov	r13,r4
	tst	r0,r0
	bf	.L0606CAD6
	bra	.L0606CB2E
	mov	#0,r0
.L0606CAD6:
	mov.l	@(4,r13),r7
	mov.l	@(32,r14),r6
	mul.l	r6,r7
	mov.l	@r13,r3
	sts	macl,r6
	mov.l	@(4,r12),r5
	add	r3,r6
	mov.l	@r12,r4
	mov.l	@(56,r14),r0
	cmp/eq	#0,r0
	mov	r0,r13
	bt/s	.L0606CAF4
	mov.l	@(8,r12),r11
	bra	.L0606CB12
	nop
.L0606CAF4:
	mov.l	.L0606CBD4,r12
	and	r4,r12
	mov.l	.L0606CBD8,r2
	cmp/hs	r2,r12
	bf	.L0606CB04
	mov.l	.L0606CBDC,r1
	cmp/hs	r1,r12
	bf	.L0606CB10
.L0606CB04:
	mov.l	.L0606CBE0,r2
	cmp/hs	r2,r12
	bf	.L0606CB12
	mov.l	.L0606CBE4,r1
	cmp/hs	r1,r12
	bt	.L0606CB12
.L0606CB10:
	mov	#3,r13
.L0606CB12:
	mov	r13,r3
	mov.l	.L0606CBF0,r0
	shll	r13
	add	r3,r13
	shll2	r13
	exts.b	r13,r13
	mov.l	@(r0,r13),r2
	jsr	@r2
	mov.l	r11,@-r15
	add	#4,r15
	mov.l	@(32,r14),r3
	add	r11,r3
	mov.l	r3,@(32,r14)
.L0606CB2C:
	mov	#1,r0
.L0606CB2E:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfsTrn_TransPack

	glabel gfsTrn_WaitPack
	mov.l	r14,@-r15
	mov.l	@(56,r4),r14
	mov.l	@(16,r4),r5
	mov	r14,r0
	cmp/eq	#0,r0
	bt/s	.L0606CB66
	mov.l	@r5,r5
	cmp/eq	#4,r0
	bt	.L0606CB52
	bra	.L0606CB84
	nop
.L0606CB52:
	mov.l	@(16,r4),r0
	mov.l	@(12,r0),r3
	cmp/pz	r3
	bf	.L0606CB60
	mov	#0,r0
	rts
	mov.l	@r15+,r14
.L0606CB60:
	mov	#1,r0
	rts
	mov.l	@r15+,r14
.L0606CB66:
	mov.l	.L0606CBD4,r4
	mov.l	.L0606CBD8,r2
	and	r5,r4
	cmp/hs	r2,r4
	bf	.L0606CB76
	mov.l	.L0606CBDC,r1
	cmp/hs	r1,r4
	bf	.L0606CB82
.L0606CB76:
	mov.l	.L0606CBE0,r2
	cmp/hs	r2,r4
	bf	.L0606CB84
	mov.l	.L0606CBE4,r1
	cmp/hs	r1,r4
	bt	.L0606CB84
.L0606CB82:
	mov	#3,r14
.L0606CB84:
	mov.l	.L0606CBF4,r1
	mov	r14,r0
	mov	r14,r3
	shll	r0
	add	r3,r0
	shll2	r0
	exts.b	r0,r0
	mov.l	@(r0,r1),r0
	jmp	@r0
	mov.l	@r15+,r14
	.byte 0x00, 0x0B, 0x6E, 0xF6
	endlabel gfsTrn_WaitPack

	glabel gfsTrn_CopyTail
	add	#-4,r15
	cmp/pl	r4
	bf	.L0606CBBE
	mov	r5,r7
	mov.l	@r6,r2
	mov	#0,r6
	mov.l	r2,@r15
	cmp/ge	r4,r6
	bt/s	.L0606CBBE
	mov	r6,r5
.L0606CBB0:
	mov	r15,r0
	mov.b	@(r0,r5),r3
	mov.b	r3,@r7
	add	#1,r5
	cmp/ge	r4,r5
	bf/s	.L0606CBB0
	add	#1,r7
.L0606CBBE:
	rts
	add	#4,r15
	endlabel gfsTrn_CopyTail

	glabel gfsTrn_GetWp
	rts
	mov.l	@(8,r4),r0
	endlabel gfsTrn_GetWp

	glabel gfsTrn_GetFree
	mov.l	@(44,r4),r3
	mov.l	@(4,r4),r2
	mul.l	r3,r2
	mov.l	@(8,r4),r1
	sts	macl,r0
	rts
	sub	r1,r0
.L0606CBD4:
	.long 0x0FFFFFFF
.L0606CBD8:
	.long 0x00200000
.L0606CBDC:
	.long 0x00300000
.L0606CBE0:
	.long 0x02000000
.L0606CBE4:
	.long ABUS_DUMMY
.L0606CBE8:
	.long gfs_trn_func_tbl
.L0606CBEC:
	.long gfsAcc_PreparePack
.L0606CBF0:
	.long gfs_trn_func_tbl + 0x4
.L0606CBF4:
	.long gfs_trn_func_tbl + 0x8
	endlabel gfsTrn_GetFree

	glabel gfsTrn_AllocDstPack
	mov.l	.L0606CC60,r3
	mov.l	@r3,r6
	mov.w	.L0606CC5C,r2
	add	r2,r6
	mov.l	@(16,r6),r0
	tst	r0,r0
	bt	.L0606CC0A
	rts
	mov	#0,r0
.L0606CC0A:
	mov	r6,r0
	mov.l	@(8,r4),r3
	mov.l	@r4,r2
	add	r3,r2
	mov	#1,r4
	mov.l	r2,@r6
	mov.l	r4,@(4,r6)
	mov.l	r5,@(8,r6)
	mov.l	r4,@(16,r6)
	rts
	nop
	endlabel gfsTrn_AllocDstPack

	glabel gfsTrn_FreeDstPack
	mov.l	@(56,r4),r0
	cmp/eq	#4,r0
	bt/s	.L0606CC30
	mov	r0,r6
	mov.l	@(8,r5),r3
	mov.l	@(8,r4),r2
	add	r3,r2
	mov.l	r2,@(8,r4)
.L0606CC30:
	mov	#0,r1
	rts
	mov.l	r1,@(16,r5)
	endlabel gfsTrn_FreeDstPack

	glabel gfsTrn_GetBuf
	mov.l	@r4,r3
	mov.l	r3,@r5
	mov.l	@(4,r4),r2
	mov.l	r2,@r6
	mov.l	@(44,r4),r3
	rts
	mov.l	r3,@r7
	endlabel gfsTrn_GetBuf

	glabel gfsTrn_SetBuf
	mov.l	r5,@r4
	mov	#0,r3
	mov.l	r6,@(4,r4)
	mov.l	r7,@(44,r4)
	rts
	mov.l	r3,@(8,r4)
	endlabel gfsTrn_SetBuf

	glabel gfsTrn_SetFunc
	add	#108,r4
	mov	#4,r3
	mov.l	r6,@(36,r4)
	mov.l	r5,@(40,r4)
	rts
	mov.l	r3,@(56,r4)
.L0606CC5C:
	.short 0x044C
	.byte 0x00, 0x00
.L0606CC60:
	.long gfs_mng
	endlabel gfsTrn_SetFunc
