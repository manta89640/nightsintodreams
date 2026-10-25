! sbl/stm_svr: matching source. The readable C for this object is stm_svr.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06069474,"ax",@progbits
	.p2align 2

	glabel STM_GrpHasNoCdKey
	mov.l	@(8,r4),r0
	tst	r0,r0
	bt	.L0606947E
	rts
	mov	#0,r0
.L0606947E:
	bra	.L0606949A
	mov.l	@r4,r5
.L06069482:
	mov.l	@(20,r5),r0
	mov.l	@(28,r0),r1
	tst	r1,r1
	bf	.L0606948E
	bra	.L06069490
	mov	#1,r0
.L0606948E:
	mov	#0,r0
.L06069490:
	cmp/eq	#1,r0
	bf	.L06069498
	rts
	mov	#0,r0
.L06069498:
	mov.l	@(8,r5),r5
.L0606949A:
	tst	r5,r5
	bf	.L06069482
	mov	#1,r0
	rts
	nop
	endlabel STM_GrpHasNoCdKey

	glabel STM_GrpIsAllEnd
	mov.l	@(8,r4),r1
	tst	r1,r1
	bt	.L060694AE
	rts
	mov	#0,r0
.L060694AE:
	mov.l	@(4,r4),r1
	tst	r1,r1
	bt	.L060694B8
	rts
	mov	#0,r0
.L060694B8:
	mov	#2,r6
	bra	.L060694CE
	mov.l	@r4,r5
.L060694BE:
	mov	#44,r0
	mov.b	@(r0,r5),r2
	extu.b	r2,r2
	tst	r6,r2
	bf	.L060694CC
	rts
	mov	#0,r0
.L060694CC:
	mov.l	@(8,r5),r5
.L060694CE:
	tst	r5,r5
	bf	.L060694BE
	mov	#1,r0
	rts
	nop
	endlabel STM_GrpIsAllEnd

	glabel STM_GrpCdCallback
	mov.l	r14,@-r15
	mov	#56,r0
	sts.l	pr,@-r15
	mov	r4,r14
	mov.w	@(r0,r14),r2
	mov	#4,r3
	or	r3,r2
	mov.w	r2,@(r0,r14)
	mov.l	@(36,r14),r0
	tst	r0,r0
	bt	.L06069528
	mov.l	@(28,r14),r0
	tst	r0,r0
	bf	.L0606950E
	mov.l	.L060695CC,r1
	jsr	@r1
	nop
	mov	r0,r4
	mov.l	@(32,r14),r3
	cmp/ge	r3,r4
	bt	.L06069528
	mov	#56,r0
	mov.w	@(r0,r14),r2
	mov	#8,r3
	or	r3,r2
	bra	.L06069528
	mov.w	r2,@(r0,r14)
.L0606950E:
	mov.l	@(28,r14),r4
	mov.l	.L060695D0,r2
	jsr	@r2
	mov.l	@(20,r4),r4
	mov	r0,r4
	mov.l	@(32,r14),r3
	cmp/ge	r3,r4
	bf	.L06069528
	mov	#56,r0
	mov.w	@(r0,r14),r2
	mov	#8,r3
	or	r3,r2
	mov.w	r2,@(r0,r14)
.L06069528:
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel STM_GrpCdCallback

	glabel STM_CheckCdStat
	mov	r4,r0
	mov.l	r14,@-r15
	cmp/eq	#3,r0
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	bf/s	.L06069540
	mov	#0,r14
	bra	.L0606956E
	mov	#-23,r14
.L06069540:
	mov	r4,r0
	cmp/eq	#4,r0
	bf	.L0606955C
	mov.l	.L060695D4,r3
	mov.l	@r3,r13
	mov.l	@(16,r13),r13
	tst	r13,r13
	bt	.L06069558
	bsr	STM_GrpHasNoCdKey
	mov	r13,r4
	tst	r0,r0
	bf	.L0606956E
.L06069558:
	bra	.L0606956E
	mov	#-2,r14
.L0606955C:
	mov	r4,r0
	cmp/eq	#6,r0
	bf	.L06069566
	bra	.L0606956E
	mov	#-25,r14
.L06069566:
	mov	r4,r0
	cmp/eq	#5,r0
	bf	.L0606956E
	mov	#-1,r14
.L0606956E:
	tst	r14,r14
	bt	.L0606957E
	mov	r14,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	mov.l	.L060695D8,r3
	jmp	@r3
	mov.l	@r15+,r14
.L0606957E:
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel STM_CheckCdStat

	glabel STM_ChgExecGrp
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r13
	mov.l	.L060695D4,r3
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	@r3,r4
	mov.l	@(16,r4),r2
	cmp/eq	r13,r2
	bf/s	.L060695A4
	mov	#1,r5
	bra	.L06069720
	nop
.L060695A4:
	mov.l	@(16,r4),r14
	tst	r14,r14
	bt/s	.L06069680
	mov	#0,r12
	mov.l	.L060695DC,r2
	mov	r15,r4
	jsr	@r2
	mov	#0,r5
	mov	r0,r11
	bsr	STM_CheckCdStat
	mov	r0,r4
	mov	#56,r0
	mov.w	@(r0,r14),r4
	mov	#2,r0
	extu.w	r4,r4
	tst	r4,r0
	bt	.L060695E0
	bra	.L060695E2
	mov	#1,r0
	.byte 0x00, 0x00
.L060695CC:
	.long stm_GetFreeBufSiz
.L060695D0:
	.long stm_GetSctNum
.L060695D4:
	.long stm_mng
.L060695D8:
	.long stm_set_err
.L060695DC:
	.long gfsFlow_GetCdStat
.L060695E0:
	mov	#0,r0
.L060695E2:
	cmp/eq	#1,r0
	bf	.L06069608
	mov	#16,r3
	tst	r4,r3
	bf	.L06069608
	mov.l	.L060696C0,r3
	jsr	@r3
	mov	r14,r4
	mov	r0,r4
	tst	r4,r4
	bt	.L060695FE
	mov.l	.L060696C4,r3
	jsr	@r3
	nop
.L060695FE:
	mov	#56,r0
	mov.w	@(r0,r14),r2
	mov	#16,r3
	or	r3,r2
	mov.w	r2,@(r0,r14)
.L06069608:
	mov.l	@(52,r14),r1
	cmp/pz	r1
	bf	.L06069620
	mov.l	.L060696C8,r2
	jsr	@r2
	mov.l	@(52,r14),r4
	mov.l	.L060696CC,r2
	mov	#-1,r3
	mov.l	r3,@(52,r14)
	mov	#0,r5
	jsr	@r2
	mov	r5,r4
.L06069620:
	mov.w	.L060696B8,r3
	mov.l	@(24,r14),r2
	cmp/eq	r3,r2
	bt	.L0606962C
	mov.w	.L060696BA,r0
	mov.l	r0,@(24,r14)
.L0606962C:
	tst	r11,r11
	bf	.L06069680
	mov.l	@(16,r14),r11
	tst	r11,r11
	bt	.L06069644
	mov	#-1,r5
	mov.l	.L060696D0,r3
	jsr	@r3
	mov.l	@(16,r11),r4
	mov.l	@(16,r11),r2
	mov.w	.L060696BC,r0
	mov.l	r12,@(r0,r2)
.L06069644:
	mov	#56,r0
	mov.w	@(r0,r14),r0
	extu.w	r0,r0
	tst	#16,r0
	bt	.L06069652
	bra	.L06069654
	mov	#1,r0
.L06069652:
	mov	#0,r0
.L06069654:
	cmp/eq	#1,r0
	bf	.L06069674
	mov.l	.L060696D4,r3
	jsr	@r3
	mov	r14,r4
	mov.l	r0,@(4,r15)
	mov.l	.L060696D8,r3
	jsr	@r3
	nop
	mov.l	r0,@r15
	mov.l	@(4,r15),r3
	mov.l	@(20,r14),r1
	cmp/gt	r3,r1
	bt	.L06069674
	mov.l	@r15,r3
	mov.l	r3,@(20,r14)
.L06069674:
	mov.l	.L060696DC,r3
	mov	#56,r0
	mov.w	@(r0,r14),r2
	and	r3,r2
	mov.w	r2,@(r0,r14)
	mov	r12,r14
.L06069680:
	tst	r14,r14
	bf	.L0606971E
	tst	r13,r13
	bt	.L06069714
	mov.l	@(52,r13),r3
	cmp/pz	r3
	bt	.L060696A6
	mov.l	.L060696E0,r1
	jsr	@r1
	nop
	mov	r0,r4
	cmp/pz	r4
	bf/s	.L0606969E
	mov	r13,r5
	mov.l	r4,@(52,r13)
.L0606969E:
	mov.l	.L060696E4,r4
	mov.l	.L060696CC,r2
	jsr	@r2
	nop
.L060696A6:
	mov.l	@(52,r13),r3
	cmp/pz	r3
	bf	.L0606970E
	mov.l	@(4,r13),r5
	tst	r5,r5
	bt	.L060696E8
	mov.l	@(20,r5),r4
	bra	.L060696EA
	mov.l	@(40,r4),r4
.L060696B8:
	.short 0x0100
.L060696BA:
	.short 0x0101
.L060696BC:
	.short 0x00A0
	.byte 0x00, 0x00
.L060696C0:
	.long stm_CdPause
.L060696C4:
	.long stm_set_err
.L060696C8:
	.long gfcd_Unlock
.L060696CC:
	.long gfcd_SetCallback
.L060696D0:
	.long gfsTrn_Stop
.L060696D4:
	.long stm_get_end_fad
.L060696D8:
	.long stm_GetCurFad
.L060696DC:
	.long 0x0000FFC9
.L060696E0:
	.long gfcd_Lock
.L060696E4:
	.long STM_GrpCdCallback
.L060696E8:
	mov.w	.L060697E8,r4
.L060696EA:
	mov.l	.L060697F0,r2
	jsr	@r2
	mov.l	@(52,r13),r5
	mov.l	.L060697F4,r3
	jsr	@r3
	nop
	mov	r0,r4
	tst	r4,r4
	bt	.L06069702
	mov.l	.L060697F8,r3
	jsr	@r3
	nop
.L06069702:
	mov	#56,r0
	mov.l	.L060697FC,r3
	mov.w	@(r0,r13),r2
	and	r3,r2
	bra	.L06069714
	mov.w	r2,@(r0,r13)
.L0606970E:
	mov.l	.L06069800,r3
	jsr	@r3
	mov	#-20,r4
.L06069714:
	mov.l	.L06069804,r3
	mov.l	@r3,r2
	mov.l	r13,@(16,r2)
	bra	.L06069720
	mov	#1,r5
.L0606971E:
	mov	r12,r5
.L06069720:
	mov	r5,r0
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel STM_ChgExecGrp

	glabel STM_ReqExecGrp
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L06069808,r3
	mov.l	r4,@r15
	mov.l	@r3,r0
	tst	r0,r0
	bt	.L06069746
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L06069746:
	mov.w	.L060697EA,r4
	mov.l	.L0606980C,r3
	jsr	@r3
	nop
	mov.l	.L06069808,r2
	mov.l	.L06069810,r3
	mov	r2,r1
	mov.l	r3,@r2
	mov.l	@r15,r3
	mov.l	r3,@(4,r1)
	mov.l	.L06069814,r3
	jsr	@r3
	nop
	mov	#1,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel STM_ReqExecGrp

	glabel STM_SetExecGrpWait
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	bsr	STM_ReqExecGrp
	nop
	mov	r0,r4
	tst	r4,r4
	bf	.L06069780
	lds.l	@r15+,pr
	mov	#0,r0
	rts
	mov.l	@r15+,r14
.L06069780:
	mov.w	.L060697EC,r14
.L06069782:
	bsr	STM_ExecServer
	nop
	mov	r0,r4
	cmp/eq	r14,r4
	bf	.L06069782
	mov	#1,r0
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel STM_SetExecGrpWait

	glabel STM_IsGfsActive
	mov.l	@(16,r4),r3
	mov	#120,r0
	mov.l	@(r0,r3),r0
	tst	r0,r0
	bt	.L060697A2
	bra	.L060697A4
	mov	#1,r4
.L060697A2:
	mov	#0,r4
.L060697A4:
	rts
	mov	r4,r0
	endlabel STM_IsGfsActive

	glabel STM_IsStmActive
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L0606980C,r3
	mov.l	r4,@r15
	mov.w	.L060697EE,r4
	jsr	@r3
	nop
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L060697D0
	mov.l	.L06069800,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L06069818,r2
	jsr	@r2
	nop
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L060697D0:
	mov.l	@r15,r4
	bsr	STM_IsGfsActive
	mov.l	@(4,r4),r4
	mov.l	r0,@r15
	mov.l	.L06069814,r3
	jsr	@r3
	nop
	mov.l	@r15,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
.L060697E8:
	.short 0x00FF
.L060697EA:
	.short 0x0329
.L060697EC:
	.short 0x0104
.L060697EE:
	.short 0x0328
.L060697F0:
	.long gfcd_SetCdCon
.L060697F4:
	.long gfcd_WaitServer
.L060697F8:
	.long stm_set_err_gfs
.L060697FC:
	.long 0x0000FFD9
.L06069800:
	.long stm_set_err
.L06069804:
	.long stm_mng
.L06069808:
	.long stm_06070C70
.L0606980C:
	.long stm_set_func_id
.L06069810:
	.long STM_ChgExecGrp
.L06069814:
	.long stm_check_gfs_err
.L06069818:
	.long stm_call_err_func
	endlabel STM_IsStmActive

	glabel STM_GrpClearReached
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov	#0,r13
	mov.l	r11,@-r15
	sts.l	pr,@-r15
	mov.l	.L06069914,r12
	add	#-8,r15
	mov.l	@(20,r4),r11
	bra	.L06069852
	mov.l	@r4,r14
.L06069832:
	mov	r15,r6
	add	#4,r6
	mov	r15,r5
	jsr	@r12
	mov.l	@(20,r14),r4
	mov.l	@r15,r2
	cmp/gt	r11,r2
	bf	.L06069850
	mov	#44,r0
	mov.w	.L0606990C,r3
	mov.l	@(16,r14),r1
	mov.l	r13,@(8,r1)
	mov.b	@(r0,r14),r2
	and	r3,r2
	mov.b	r2,@(r0,r14)
.L06069850:
	mov.l	@(8,r14),r14
.L06069852:
	tst	r14,r14
	bf	.L06069832
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel STM_GrpClearReached

	glabel STM_GrpResetStms
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	mov.l	.L06069918,r12
	mov.l	.L0606991C,r13
	bra	.L06069882
	mov.l	@r4,r14
.L06069874:
	mov	#0,r6
	mov	r6,r5
	jsr	@r12
	mov.l	@(16,r14),r4
	jsr	@r13
	mov	r14,r4
	mov.l	@(8,r14),r14
.L06069882:
	tst	r14,r14
	bf	.L06069874
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel STM_GrpResetStms

	glabel STM_GrpClearEndFlags
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov	#2,r13
	sts.l	pr,@-r15
	mov.l	.L06069918,r12
	bra	.L060698CE
	mov.l	@r4,r14
.L060698A0:
	mov.w	.L0606990E,r3
	mov	#44,r0
	mov.b	@(r0,r14),r2
	and	r3,r2
	mov.b	r2,@(r0,r14)
	mov.w	.L06069910,r2
	mov.b	@(r0,r14),r1
	and	r2,r1
	mov.b	r1,@(r0,r14)
	mov.b	@(r0,r14),r0
	extu.b	r0,r0
	tst	r13,r0
	bt	.L060698BE
	bra	.L060698C0
	mov	#1,r0
.L060698BE:
	mov	#0,r0
.L060698C0:
	cmp/eq	#1,r0
	bf	.L060698CC
	mov	#0,r6
	mov	r6,r5
	jsr	@r12
	mov.l	@(16,r14),r4
.L060698CC:
	mov.l	@(8,r14),r14
.L060698CE:
	tst	r14,r14
	bf	.L060698A0
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel STM_GrpClearEndFlags

	glabel STM_SetLoopSub
	mov.l	r14,@-r15
	mov	r4,r14
	mov.w	.L06069912,r3
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov	r5,r13
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	r6,@r15
	mov.l	@(24,r14),r2
	cmp/eq	r3,r2
	bf/s	.L060698FE
	mov	#1,r12
	bsr	STM_GrpResetStms
	mov	r14,r4
	bsr	STM_GrpClearEndFlags
	mov	r14,r4
.L060698FE:
	mov	r13,r0
	cmp/eq	#-1,r0
	bf/s	.L06069944
	mov	#0,r7
	mov	#8,r6
	bra	.L06069934
	mov.l	@r14,r5
.L0606990C:
	.short 0x00FE
.L0606990E:
	.short 0x00EF
.L06069910:
	.short 0x00DF
.L06069912:
	.short 0x0100
.L06069914:
	.long stm_GetFadRange
.L06069918:
	.long GFS_Seek
.L0606991C:
	.long stm_ResetTrBuf
.L06069920:
	mov	#44,r0
	mov.b	@(r0,r5),r4
	extu.b	r4,r4
	mov	r4,r3
	tst	r6,r3
	bf	.L06069932
	mov	#2,r1
	tst	r4,r1
	bt	.L06069938
.L06069932:
	mov.l	@(8,r5),r5
.L06069934:
	tst	r5,r5
	bf	.L06069920
.L06069938:
	mov.l	r5,@(8,r14)
	mov	#56,r0
	mov.l	.L06069A1C,r3
	mov.w	@(r0,r14),r2
	bra	.L06069962
	and	r3,r2
.L06069944:
	tst	r13,r13
	bt	.L06069952
	mov	#44,r0
	mov.b	@(r0,r13),r0
	extu.b	r0,r0
	tst	#2,r0
	bf	.L06069966
.L06069952:
	tst	r13,r13
	bt	.L06069958
	mov.l	@(4,r13),r13
.L06069958:
	mov.l	r13,@(8,r14)
	mov	#56,r0
	mov.w	@(r0,r14),r2
	mov	#1,r3
	or	r3,r2
.L06069962:
	bra	.L06069968
	mov.w	r2,@(r0,r14)
.L06069966:
	mov	r7,r12
.L06069968:
	mov.l	@r15,r3
	mov	r12,r0
	mov.l	r3,@(44,r14)
	mov.l	r7,@(48,r14)
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel STM_SetLoopSub

	glabel STM_SetLoop
	sts.l	pr,@-r15
	add	#-12,r15
	mov.l	.L06069A20,r3
	mov.l	r4,@r15
	mov.l	r5,@(8,r15)
	mov.l	r6,@(4,r15)
	mov.w	.L06069A18,r4
	jsr	@r3
	nop
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L060699A8
	mov.l	.L06069A24,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L06069A28,r2
	jsr	@r2
	nop
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L060699A8:
	mov.l	@(4,r15),r3
	cmp/pz	r3
	bt	.L060699C2
	mov.l	.L06069A24,r3
	jsr	@r3
	mov	#-14,r4
	mov.l	.L06069A28,r2
	jsr	@r2
	nop
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L060699C2:
	mov.l	@(4,r15),r6
	mov.l	@(8,r15),r5
	mov.l	@r15,r4
	bsr	STM_SetLoopSub
	nop
	mov.l	r0,@r15
	mov.l	.L06069A2C,r3
	jsr	@r3
	nop
	mov.l	@r15,r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel STM_SetLoop

	glabel STM_GrpMarkReached
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	.L06069A30,r13
	mov.l	@(20,r4),r12
	bra	.L06069A4A
	mov.l	@r4,r14
.L060699F0:
	mov	r15,r6
	add	#4,r6
	mov	r15,r5
	jsr	@r13
	mov.l	@(20,r14),r4
	mov.l	@r15,r2
	cmp/ge	r12,r2
	bf	.L06069A0A
	mov	#44,r0
	mov.b	@(r0,r14),r0
	extu.b	r0,r0
	tst	#8,r0
	bt	.L06069A3A
.L06069A0A:
	mov	#44,r0
	mov.b	@(r0,r14),r0
	extu.b	r0,r0
	tst	#2,r0
	bt	.L06069A34
	bra	.L06069A36
	mov	#1,r0
.L06069A18:
	.short 0x0332
	.byte 0x00, 0x00
.L06069A1C:
	.long 0x0000FFFE
.L06069A20:
	.long stm_set_func_id
.L06069A24:
	.long stm_set_err
.L06069A28:
	.long stm_call_err_func
.L06069A2C:
	.long stm_check_gfs_err
.L06069A30:
	.long stm_GetFadRange
.L06069A34:
	mov	#0,r0
.L06069A36:
	cmp/eq	#1,r0
	bf	.L06069A48
.L06069A3A:
	mov	#44,r0
	mov.b	@(r0,r14),r2
	mov	#1,r3
	or	r3,r2
	mov.b	r2,@(r0,r14)
	mov.l	@(16,r14),r1
	mov.l	r3,@(8,r1)
.L06069A48:
	mov.l	@(8,r14),r14
.L06069A4A:
	tst	r14,r14
	bf	.L060699F0
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel STM_GrpMarkReached

	glabel STM_GrpCheckPassed
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r13
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	.L06069C00,r8
	add	#-8,r15
	mov.l	.L06069C04,r9
	mov.l	@(20,r13),r11
	mov.l	.L06069C08,r10
	bra	.L06069ADE
	mov.l	@(4,r13),r14
.L06069A7A:
	mov	r15,r6
	mov	r15,r5
	add	#4,r5
	jsr	@r10
	mov.l	@(20,r14),r4
	mov.l	@r15,r2
	cmp/ge	r11,r2
	bt	.L06069ADC
	mov	#44,r0
	mov.b	@(r0,r14),r0
	extu.b	r0,r0
	tst	#1,r0
	bt	.L06069A98
	bra	.L06069A9A
	mov	#1,r0
.L06069A98:
	mov	#0,r0
.L06069A9A:
	cmp/eq	#1,r0
	bf	.L06069ADC
	mov	#44,r0
	mov.b	@(r0,r14),r0
	extu.b	r0,r0
	tst	#4,r0
	bt	.L06069AAC
	bra	.L06069AAE
	mov	#1,r0
.L06069AAC:
	mov	#0,r0
.L06069AAE:
	cmp/eq	#1,r0
	bf	.L06069ADC
	mov	#44,r0
	mov.b	@(r0,r14),r2
	mov	#8,r3
	or	r3,r2
	mov.b	r2,@(r0,r14)
	jsr	@r9
	mov	r14,r4
	mov.l	@(8,r13),r3
	cmp/eq	r14,r3
	bf	.L06069AD2
	mov	#-1,r5
	mov.l	@(44,r13),r6
	mov.l	@(48,r13),r12
	bsr	STM_SetLoopSub
	mov	r13,r4
	mov.l	r12,@(48,r13)
.L06069AD2:
	mov.l	@(12,r13),r2
	cmp/eq	r14,r2
	bf	.L06069ADC
	jsr	@r8
	mov	r13,r4
.L06069ADC:
	mov.l	@(12,r14),r14
.L06069ADE:
	tst	r14,r14
	bf	.L06069A7A
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
	endlabel STM_GrpCheckPassed

	glabel STM_GrpNextStart
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r5,r13
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	@(20,r4),r3
	cmp/ge	r3,r13
	bt	.L06069B0C
	mov.l	@(20,r4),r13
.L06069B0C:
	mov.l	.L06069C08,r11
	mov	#8,r12
	bra	.L06069B42
	mov.l	@r4,r14
.L06069B14:
	mov	#44,r0
	mov.b	@(r0,r14),r2
	extu.b	r2,r2
	tst	r12,r2
	bf	.L06069B40
	mov	r15,r6
	add	#4,r6
	mov	r15,r5
	jsr	@r11
	mov.l	@(20,r14),r4
	mov.l	@r15,r2
	cmp/gt	r13,r2
	bt	.L06069B34
	mov.l	@(4,r15),r1
	cmp/ge	r13,r1
	bt	.L06069B46
.L06069B34:
	mov.l	@r15,r3
	cmp/gt	r13,r3
	bf	.L06069B40
	mov.l	@r15,r0
	bra	.L06069B48
	nop
.L06069B40:
	mov.l	@(8,r14),r14
.L06069B42:
	tst	r14,r14
	bf	.L06069B14
.L06069B46:
	mov	#-1,r0
.L06069B48:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel STM_GrpNextStart

	glabel STM_GrpLoopStart
	sts.l	pr,@-r15
	mov.l	.L06069C08,r3
	add	#-12,r15
	mov.l	r4,@(8,r15)
	mov	r15,r6
	mov.l	@(8,r4),r4
	mov	r15,r5
	add	#4,r6
	jsr	@r3
	mov.l	@(20,r4),r4
	mov.l	@r15,r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel STM_GrpLoopStart

	glabel STM_GrpNextPickup
	mov.l	r14,@-r15
	mov	r4,r14
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov	#0,r11
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov	r5,r9
	sts.l	pr,@-r15
	mov	r7,r8
	add	#-8,r15
	mov.l	r6,@r15
	mov.l	@(40,r15),r13
	mov.l	@(44,r15),r10
	mov.l	r11,@(4,r15)
	mov.l	@(44,r14),r3
	mov.l	@(48,r14),r2
	cmp/eq	r3,r2
	bf/s	.L06069BDA
	mov	#-1,r12
	mov.l	@r15,r0
	mov.l	@(20,r14),r1
	cmp/gt	r0,r1
	bf	.L06069BB0
	mov.l	r12,@r13
	mov.l	r11,@r10
	bra	.L06069D2C
	mov	#1,r0
.L06069BB0:
	tst	r8,r8
	bf	.L06069C22
	mov.l	.L06069C0C,r3
	mov	#0,r5
	jsr	@r3
	mov	r5,r4
	bsr	STM_CheckCdStat
	mov	r0,r4
	mov.l	.L06069C10,r2
	mov.l	@r2,r3
	mov.l	@(24,r3),r1
	cmp/gt	r1,r9
	bf	.L06069C22
	mov.l	.L06069C14,r3
	jsr	@r3
	nop
	mov.l	r0,@(20,r14)
	mov.l	@(48,r14),r2
	add	#-1,r2
	bra	.L06069C22
	mov.l	r2,@(48,r14)
.L06069BDA:
	mov.l	@r15,r1
	mov.l	@(20,r14),r3
	cmp/gt	r1,r3
	bf	.L06069BEC
	mov	#56,r0
	mov.w	@(r0,r14),r0
	extu.w	r0,r0
	tst	#2,r0
	bt	.L06069BF2
.L06069BEC:
	mov.l	@(4,r14),r1
	tst	r1,r1
	bf	.L06069C22
.L06069BF2:
	mov.l	@(8,r14),r1
	tst	r1,r1
	bf	.L06069C18
	mov.l	r12,@r13
	mov.l	r11,@r10
	bra	.L06069D2C
	mov	#1,r0
.L06069C00:
	.long stm_update_cur
.L06069C04:
	.long stm_remove_cd
.L06069C08:
	.long stm_GetFadRange
.L06069C0C:
	.long gfsFlow_GetCdStat
.L06069C10:
	.long stm_mng
.L06069C14:
	.long stm_GetCurFad
.L06069C18:
	bsr	STM_GrpLoopStart
	mov	r14,r4
	mov.l	r0,@(20,r14)
	bsr	STM_GrpClearEndFlags
	mov	r14,r4
.L06069C22:
	mov	#56,r0
	mov.w	@(r0,r14),r0
	extu.w	r0,r0
	tst	#2,r0
	bf	.L06069C56
	mov.l	@(52,r14),r2
	cmp/pz	r2
	bf	.L06069C50
	mov.l	@(20,r14),r5
	bsr	STM_GrpNextStart
	mov	r14,r4
	mov	r0,r3
	cmp/pz	r3
	bf/s	.L06069C44
	mov.l	r0,@r13
	mov.l	@r13,r1
	mov.l	r1,@(20,r14)
.L06069C44:
	mov.w	.L06069CD2,r2
	mov	#1,r3
	mov.l	r3,@r10
	mov.l	r2,@(24,r14)
	bra	.L06069D2A
	mov.l	r12,@r13
.L06069C50:
	mov.l	r12,@r13
	bra	.L06069D2A
	mov.l	r11,@r10
.L06069C56:
	mov	#56,r0
	mov.w	@(r0,r14),r0
	extu.w	r0,r0
	tst	#4,r0
	bt	.L06069C64
	bra	.L06069C66
	mov	#1,r0
.L06069C64:
	mov	#0,r0
.L06069C66:
	cmp/eq	#1,r0
	bf	.L06069D26
	mov.l	@r15,r3
	cmp/gt	r3,r9
	bt	.L06069CE4
	mov.l	.L06069CD4,r3
	mov	#0,r5
	jsr	@r3
	mov	r5,r4
	bsr	STM_CheckCdStat
	mov	r0,r4
	tst	r8,r8
	bf	.L06069C98
	mov.l	.L06069CD8,r2
	mov.l	@r2,r3
	mov.l	@(24,r3),r1
	cmp/gt	r1,r9
	bf	.L06069C98
	mov	#56,r0
	mov.l	.L06069CDC,r3
	mov.l	r9,@(20,r14)
	mov.w	@(r0,r14),r2
	and	r3,r2
	bra	.L06069D26
	mov.w	r2,@(r0,r14)
.L06069C98:
	mov.l	r9,@(20,r14)
	mov	#56,r0
	mov.w	@(r0,r14),r0
	extu.w	r0,r0
	tst	#32,r0
	bf	.L06069CBE
	mov	r9,r5
	bsr	STM_GrpNextStart
	mov	r14,r4
	mov	r0,r3
	cmp/pz	r3
	bf/s	.L06069D28
	mov.l	r0,@r13
	mov	#56,r0
	mov.w	@(r0,r14),r2
	mov	#32,r3
	or	r3,r2
	bra	.L06069D28
	mov.w	r2,@(r0,r14)
.L06069CBE:
	mov	r8,r0
	cmp/eq	#2,r0
	bt	.L06069CCE
	mov.l	.L06069CE0,r3
	mov	#56,r0
	mov.w	@(r0,r14),r2
	and	r3,r2
	mov.w	r2,@(r0,r14)
.L06069CCE:
	bra	.L06069D28
	mov.l	r12,@r13
.L06069CD2:
	.short 0x0102
.L06069CD4:
	.long gfsFlow_GetCdStat
.L06069CD8:
	.long stm_mng
.L06069CDC:
	.long 0x0000FFD9
.L06069CE0:
	.long 0x0000FFDF
.L06069CE4:
	tst	r8,r8
	bf	.L06069D20
	mov.l	r9,@(20,r14)
	mov	#56,r0
	mov.l	.L06069D9C,r3
	mov.w	@(r0,r14),r2
	and	r3,r2
	mov.w	r2,@(r0,r14)
	bsr	STM_GrpCheckPassed
	mov	r14,r4
	bsr	STM_GrpIsAllEnd
	mov	r14,r4
	tst	r0,r0
	bf	.L06069D06
	mov.l	@(48,r14),r3
	add	#1,r3
	mov.l	r3,@(48,r14)
.L06069D06:
	mov.l	r11,@r10
	mov.l	r12,@r13
	mov.l	@(8,r14),r0
	tst	r0,r0
	bt	.L06069D18
	mov.l	@(44,r14),r3
	mov.l	@(48,r14),r2
	cmp/ge	r3,r2
	bf	.L06069D2A
.L06069D18:
	mov	#1,r0
	mov.l	r0,@(4,r15)
	bra	.L06069D2A
	nop
.L06069D20:
	mov.l	r12,@r13
	bra	.L06069D2A
	mov.l	r11,@r10
.L06069D26:
	mov.l	r12,@r13
.L06069D28:
	mov.l	r11,@r10
.L06069D2A:
	mov.l	@(4,r15),r0
.L06069D2C:
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
	endlabel STM_GrpNextPickup

	glabel STM_GrpSeek
	mov.l	r14,@-r15
	mov	r4,r14
	mov.l	r13,@-r15
	mov	r5,r13
	sts.l	pr,@-r15
	mov	#0,r5
	cmp/ge	r5,r13
	bf/s	.L06069D60
	mov	r5,r4
	mov	r13,r5
	mov.l	.L06069DA0,r2
	jsr	@r2
	mov	r14,r4
	mov	r0,r4
	bra	.L06069D90
	mov.l	r13,@(20,r14)
.L06069D60:
	mov.l	@(20,r14),r2
	cmp/gt	r6,r2
	bt	.L06069D90
	mov	r7,r0
	cmp/eq	#1,r0
	bf	.L06069D90
	mov	#56,r0
	mov.w	@(r0,r14),r0
	extu.w	r0,r0
	tst	#2,r0
	bf	.L06069D90
	bsr	STM_GrpMarkReached
	mov	r14,r4
	mov.l	.L06069DA4,r3
	jsr	@r3
	mov	r14,r4
	mov	r0,r4
	tst	r4,r4
	bf	.L06069D90
	mov	#56,r0
	mov.w	@(r0,r14),r2
	mov	#2,r3
	or	r3,r2
	mov.w	r2,@(r0,r14)
.L06069D90:
	lds.l	@r15+,pr
	mov	r4,r0
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	.byte 0x00, 0x00
.L06069D9C:
	.long 0x0000FFD9
.L06069DA0:
	.long stm_CdPlayFrom
.L06069DA4:
	.long stm_CdPlayObj
	endlabel STM_GrpSeek

	glabel STM_GrpExecPickup
	mov.l	r14,@-r15
	mov	r4,r14
	sts.l	pr,@-r15
	add	#-20,r15
	mov.l	r5,@(16,r15)
	mov.l	r6,@(12,r15)
	mov.l	r7,@(8,r15)
	bsr	STM_GrpIsAllEnd
	mov	r14,r4
	cmp/eq	#1,r0
	bf	.L06069E02
	mov.w	.L06069EA6,r3
	mov.l	@(24,r14),r2
	cmp/eq	r3,r2
	bt	.L06069DD0
	mov	#56,r0
	mov.w	@(r0,r14),r0
	extu.w	r0,r0
	tst	#64,r0
	bt	.L06069DF8
.L06069DD0:
	mov.l	@r14,r2
	tst	r2,r2
	bt	.L06069DF8
	mov.l	@(44,r14),r3
	mov.l	@(48,r14),r2
	cmp/ge	r3,r2
	bt	.L06069DF8
	bsr	STM_GrpMarkReached
	mov	r14,r4
	bsr	STM_GrpClearEndFlags
	mov	r14,r4
	mov	#56,r0
	mov.l	.L06069EAC,r3
	mov.l	r3,@(20,r14)
	mov.w	.L06069EA8,r2
	mov.l	r2,@(24,r14)
	mov.l	.L06069EB0,r3
	mov.w	@(r0,r14),r2
	and	r3,r2
	mov.w	r2,@(r0,r14)
.L06069DF8:
	mov	#1,r0
	add	#20,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L06069E02:
	mov	r15,r3
	add	#4,r3
	mov.l	r3,@-r15
	mov	r15,r2
	add	#4,r2
	mov.l	r2,@-r15
	mov.l	@(16,r15),r7
	mov.l	@(20,r15),r6
	mov.l	@(24,r15),r5
	bsr	STM_GrpNextPickup
	mov	r14,r4
	add	#8,r15
	mov.l	r0,@(8,r15)
	mov.l	@(4,r15),r7
	mov.l	@(12,r15),r6
	mov.l	@r15,r5
	bsr	STM_GrpSeek
	mov	r14,r4
	mov	r0,r4
	tst	r4,r4
	bt	.L06069E32
	mov.l	.L06069EB4,r3
	jsr	@r3
	nop
.L06069E32:
	mov.l	@(8,r15),r0
	add	#20,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel STM_GrpExecPickup

	glabel STM_GetNumSct
	mov.l	r14,@-r15
	mov	r4,r14
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	@(20,r14),r3
	mov.l	@(28,r3),r0
	tst	r0,r0
	bf	.L06069E94
	mov.l	.L06069EAC,r6
	mov	#0,r1
	mov.l	.L06069EB8,r3
	mov	r1,r5
	mov.l	r1,@-r15
	mov	r15,r7
	mov.l	@(20,r14),r4
	add	#4,r7
	jsr	@r3
	mov.l	@(32,r4),r4
	mov	r0,r4
	tst	r4,r4
	bt/s	.L06069E78
	add	#4,r15
	mov.l	.L06069EBC,r3
	jsr	@r3
	nop
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L06069E78:
	mov.l	.L06069EC0,r2
	jsr	@r2
	nop
	mov	r0,r4
	tst	r4,r4
	bt	.L06069E9C
	mov.l	.L06069EBC,r3
	jsr	@r3
	nop
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L06069E94:
	mov.l	.L06069EC4,r3
	jsr	@r3
	mov.l	@(16,r14),r4
	mov.l	r0,@r15
.L06069E9C:
	mov.l	@r15,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L06069EA6:
	.short 0x0101
.L06069EA8:
	.short 0x0102
	.byte 0x00, 0x00
.L06069EAC:
	.long 0x7FFFFFFF
.L06069EB0:
	.long 0x0000FFBF
.L06069EB4:
	.long stm_set_err
.L06069EB8:
	.long gfcd_GetSctNum
.L06069EBC:
	.long stm_set_err_gfs
.L06069EC0:
	.long gfcd_WaitServer
.L06069EC4:
	.long gfsAcc_CountSctAll
	endlabel STM_GetNumSct

	glabel STM_GetNumSctHn
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L06069FB4,r3
	mov.l	r4,@r15
	mov.w	.L06069FAA,r4
	jsr	@r3
	nop
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L06069EF0
	mov.l	.L06069FB8,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L06069FBC,r2
	jsr	@r2
	nop
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#-11,r0
.L06069EF0:
	mov.l	@r15,r4
	bsr	STM_GetNumSct
	mov.l	@(4,r4),r4
	mov.l	r0,@r15
	mov.l	.L06069FC0,r3
	jsr	@r3
	nop
	mov	r0,r4
	cmp/pz	r4
	bt	.L06069F0C
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	r4,r0
.L06069F0C:
	mov.l	@r15,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel STM_GetNumSctHn

	glabel STM_GetStmStat
	mov	#44,r0
	mov.l	r14,@-r15
	mov	r4,r14
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	mov	r7,r12
	add	#-8,r15
	mov.l	r5,@(4,r15)
	mov.l	@r14,r13
	mov.b	@(r0,r14),r0
	extu.b	r0,r0
	tst	#8,r0
	bt/s	.L06069F38
	mov.l	@(20,r13),r13
	bra	.L06069F3A
	mov	#1,r0
.L06069F38:
	mov	#0,r0
.L06069F3A:
	cmp/eq	#1,r0
	bf	.L06069F48
	tst	r12,r12
	bf	.L06069F48
	mov.w	.L06069FAC,r0
	bra	.L0606A012
	nop
.L06069F48:
	cmp/gt	r6,r13
	bt/s	.L06069F9C
	mov	#1,r4
	mov.l	@(20,r14),r2
	mov.l	@(28,r2),r0
	tst	r0,r0
	bf	.L06069F9C
	mov	#44,r0
	mov.b	@(r0,r14),r5
	extu.b	r5,r5
	mov	r5,r3
	tst	r4,r3
	bt	.L06069F66
	bra	.L06069F68
	mov	r4,r1
.L06069F66:
	mov	#0,r1
.L06069F68:
	cmp/eq	r4,r1
	bt	.L06069F76
	mov	#4,r3
	tst	r5,r3
	bt	.L06069F76
	tst	r4,r4
	bf	.L06069F98
.L06069F76:
	mov	r15,r5
	mov.l	.L06069FC4,r3
	jsr	@r3
	mov	#0,r4
	bsr	STM_CheckCdStat
	mov	r0,r4
	mov.l	@r15,r0
	tst	#8,r0
	bf	.L06069F8E
	mov.w	.L06069FAE,r0
	bra	.L0606A012
	nop
.L06069F8E:
	tst	r12,r12
	bf	.L06069FD8
	mov.w	.L06069FB0,r0
	bra	.L0606A012
	nop
.L06069F98:
	bra	.L0606A012
	mov	#32,r0
.L06069F9C:
	mov	#44,r0
	mov.b	@(r0,r14),r2
	extu.b	r2,r2
	tst	r4,r2
	bt	.L06069FC8
	bra	.L06069FCA
	mov	r4,r3
.L06069FAA:
	.short 0x0324
.L06069FAC:
	.short 0x0100
.L06069FAE:
	.short 0x0102
.L06069FB0:
	.short 0x0103
	.byte 0x00, 0x00
.L06069FB4:
	.long stm_set_func_id
.L06069FB8:
	.long stm_set_err
.L06069FBC:
	.long stm_call_err_func
.L06069FC0:
	.long stm_check_gfs_err
.L06069FC4:
	.long gfsFlow_GetCdStat
.L06069FC8:
	mov	#0,r3
.L06069FCA:
	cmp/eq	r4,r3
	bf	.L06069FD8
	tst	r12,r12
	bf	.L06069FD8
	mov.w	.L0606A08C,r0
	bra	.L0606A012
	nop
.L06069FD8:
	mov.l	.L0606A094,r3
	mov.l	@(40,r14),r2
	cmp/eq	r3,r2
	bf	.L06069FEA
	mov.l	.L0606A098,r2
	jsr	@r2
	mov.l	@r14,r4
	bra	.L06069FEC
	mov	r0,r12
.L06069FEA:
	mov.l	@(40,r14),r12
.L06069FEC:
	mov.l	@(16,r14),r2
	mov.w	.L0606A08E,r0
	mov.l	@(r0,r2),r0
	tst	r0,r0
	bt	.L0606A00A
	mov.l	@(4,r15),r3
	cmp/ge	r3,r13
	bf	.L0606A000
	cmp/ge	r12,r13
	bf	.L0606A00A
.L0606A000:
	mov.l	.L0606A09C,r2
	jsr	@r2
	mov	r14,r4
	cmp/eq	#1,r0
	bf	.L0606A010
.L0606A00A:
	mov.w	.L0606A090,r0
	bra	.L0606A012
	nop
.L0606A010:
	mov.w	.L0606A092,r0
.L0606A012:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel STM_GetStmStat

	glabel STM_TransStmSub
	mov	r4,r3
	mov.l	r14,@-r15
	mov	r4,r14
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	r4,@(4,r15)
	mov.l	@(24,r3),r1
	tst	r1,r1
	bf/s	.L0606A03A
	mov.l	@(16,r14),r14
	mov	#108,r0
	mov.l	@(r0,r14),r1
	tst	r1,r1
	bt	.L0606A052
.L0606A03A:
	mov	r14,r4
	mov.l	.L0606A0A0,r3
	jsr	@r3
	add	#108,r4
	cmp/pl	r0
	bf	.L0606A052
	mov	r15,r5
	mov.l	.L0606A0A4,r3
	jsr	@r3
	mov	r14,r4
	bra	.L0606A056
	nop
.L0606A052:
	mov	#0,r3
	mov.l	r3,@r15
.L0606A056:
	mov.l	@r15,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel STM_TransStmSub

	glabel STM_GrpCallFunc
	mov.l	r14,@-r15
	mov	r4,r14
	sts.l	pr,@-r15
	mov.l	@(36,r14),r0
	tst	r0,r0
	bt	.L0606A086
	mov	#56,r0
	mov.w	@(r0,r14),r0
	extu.w	r0,r0
	tst	#8,r0
	bt	.L0606A086
	mov.l	@(36,r14),r3
	jsr	@r3
	mov.l	@(40,r14),r4
	mov.l	.L0606A0A8,r3
	mov	#56,r0
	mov.w	@(r0,r14),r2
	and	r3,r2
	mov.w	r2,@(r0,r14)
.L0606A086:
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606A08C:
	.short 0x0100
.L0606A08E:
	.short 0x009C
.L0606A090:
	.short 0x0103
.L0606A092:
	.short 0x0102
.L0606A094:
	.long 0x7FFFFFFF
.L0606A098:
	.long stm_get_end_fad
.L0606A09C:
	.long stm_IsTrBufFull
.L0606A0A0:
	.long gfsTrn_GetFree
.L0606A0A4:
	.long gfsTrn_Exec
.L0606A0A8:
	.long 0x0000FFF7
	endlabel STM_GrpCallFunc

	glabel STM_ExecStmRound
	mov.l	r14,@-r15
	mov	r6,r0
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov	#1,r12
	mov.l	r10,@-r15
	mov	#0,r11
	mov.l	r9,@-r15
	mov	r4,r10
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	add	#-36,r15
	mov.l	r5,@(28,r15)
	mov.b	r0,@(12,r15)
	mov	#68,r0
	mov.l	r7,@(16,r15)
	mov.l	@(r0,r15),r13
	mov.l	r11,@(32,r15)
	mov.l	@(16,r15),r3
	mov.l	r11,@r3
	mov.l	@(16,r10),r14
	mov.l	@(20,r14),r3
	mov.l	@(28,r3),r0
	tst	r0,r0
	bf/s	.L0606A0EA
	mov	r12,r9
	tst	r12,r12
	bt	.L0606A0FE
	bra	.L0606A0EE
	nop
.L0606A0EA:
	tst	r11,r11
	bt	.L0606A0FE
.L0606A0EE:
	mov	r15,r6
	mov.l	.L0606A18C,r3
	mov	r15,r5
	add	#4,r6
	jsr	@r3
	mov.l	@(20,r14),r4
	bra	.L0606A104
	nop
.L0606A0FE:
	mov.w	.L0606A188,r3
	mov.l	r3,@(4,r15)
	mov.l	r3,@r15
.L0606A104:
	mov.l	.L0606A190,r3
	mov	#44,r0
	mov.b	@(r0,r14),r0
	mov.b	r0,@(8,r15)
	mov.l	@(40,r14),r2
	cmp/eq	r3,r2
	bf	.L0606A11C
	mov.l	.L0606A194,r2
	jsr	@r2
	mov	r10,r4
	bra	.L0606A11E
	mov	r0,r5
.L0606A11C:
	mov.l	@(40,r14),r5
.L0606A11E:
	mov	#16,r6
	mov.b	@(8,r15),r0
	mov	r0,r4
	extu.b	r4,r4
	mov	r4,r3
	tst	r6,r3
	bf	.L0606A144
	mov.l	@r15,r2
	mov.l	@(20,r10),r1
	cmp/gt	r2,r1
	bf	.L0606A144
	mov.l	@(20,r10),r3
	cmp/ge	r5,r3
	bf	.L0606A144
	mov	#44,r0
	mov.b	@(r0,r14),r2
	mov	#16,r3
	or	r3,r2
	mov.b	r2,@(r0,r14)
.L0606A144:
	mov	#32,r7
	mov	r4,r3
	tst	r7,r3
	bf	.L0606A164
	mov.l	@(4,r15),r2
	mov.l	@(20,r10),r1
	cmp/gt	r2,r1
	bf	.L0606A164
	mov.l	@(20,r10),r3
	cmp/ge	r5,r3
	bf	.L0606A164
	mov	#44,r0
	mov.b	@(r0,r14),r2
	mov	#32,r3
	or	r3,r2
	mov.b	r2,@(r0,r14)
.L0606A164:
	mov	r4,r1
	tst	r7,r1
	bf	.L0606A1A0
	mov	#44,r0
	mov.b	@(r0,r14),r3
	extu.b	r3,r3
	tst	r7,r3
	bt	.L0606A1A0
	mov.l	.L0606A198,r3
	jsr	@r3
	mov.l	@(16,r14),r4
	mov	r0,r5
	mov.l	@(16,r14),r4
	mov.l	.L0606A19C,r3
	jsr	@r3
	add	#108,r4
	bra	.L0606A1B8
	nop
.L0606A188:
	.short 0x0096
	.byte 0x00, 0x00
.L0606A18C:
	.long stm_GetFadRange
.L0606A190:
	.long 0x7FFFFFFF
.L0606A194:
	.long stm_get_end_fad
.L0606A198:
	.long gfsAcc_CountSctAll
.L0606A19C:
	.long gfsTrn_Request
.L0606A1A0:
	tst	r6,r4
	bf	.L0606A1B8
	mov	#44,r0
	mov.b	@(r0,r14),r3
	extu.b	r3,r3
	tst	r6,r3
	bt	.L0606A1B8
	mov.l	.L0606A268,r5
	mov.l	@(16,r14),r4
	mov.l	.L0606A26C,r3
	jsr	@r3
	add	#108,r4
.L0606A1B8:
	bsr	STM_TransStmSub
	mov	r14,r4
	bsr	STM_IsGfsActive
	mov	r14,r4
	cmp/eq	#1,r0
	bf	.L0606A1D8
	mov.l	@(16,r15),r3
	mov	r12,r7
	mov.l	r12,@r3
	mov.l	@(4,r15),r6
	mov.l	@r15,r5
	bsr	STM_GetStmStat
	mov	r14,r4
	mov.l	r0,@r13
	bra	.L0606A2B2
	mov	#0,r0
.L0606A1D8:
	mov.l	r14,@(20,r15)
	bra	.L0606A294
	mov	r11,r8
.L0606A1DE:
	tst	r8,r8
	mov.l	@(8,r14),r14
	movt	r0
	mov.l	r0,@(24,r15)
.L0606A1E6:
	tst	r14,r14
	bf	.L0606A1EC
	mov.l	@r10,r14
.L0606A1EC:
	mov.l	@(28,r15),r3
	cmp/eq	r3,r14
	bf	.L0606A1F6
	mov.l	@(16,r15),r1
	mov.l	r12,@r1
.L0606A1F6:
	mov.l	.L0606A270,r3
	jsr	@r3
	mov.l	@(16,r14),r4
	mov.l	r0,@(8,r15)
	mov.l	@(20,r14),r3
	mov.l	@(28,r3),r0
	tst	r0,r0
	bf	.L0606A216
	mov	r15,r6
	mov.l	.L0606A274,r3
	mov	r15,r5
	add	#4,r6
	jsr	@r3
	mov.l	@(20,r14),r4
	bra	.L0606A21C
	nop
.L0606A216:
	mov.w	.L0606A260,r3
	mov.l	r3,@(4,r15)
	mov.l	r3,@r15
.L0606A21C:
	mov.l	@(8,r15),r7
	mov.l	@(4,r15),r6
	mov.l	@r15,r5
	bsr	STM_GetStmStat
	mov	r14,r4
	mov.l	r0,@r13
	mov.l	@(8,r15),r2
	cmp/pl	r2
	bt	.L0606A23E
	mov.b	@(12,r15),r0
	extu.b	r0,r0
	cmp/eq	#2,r0
	bt	.L0606A23E
	mov.b	@(12,r15),r0
	extu.b	r0,r0
	cmp/eq	#1,r0
	bf	.L0606A278
.L0606A23E:
	mov.l	@(24,r15),r0
	tst	r0,r0
	bt	.L0606A24C
	mov.w	.L0606A262,r3
	mov.l	@r13,r2
	cmp/eq	r3,r2
	bt	.L0606A25A
.L0606A24C:
	mov	r8,r0
	cmp/eq	#1,r0
	bf	.L0606A278
	mov.w	.L0606A264,r2
	mov.l	@r13,r3
	cmp/eq	r2,r3
	bf	.L0606A278
.L0606A25A:
	mov.l	r12,@(32,r15)
	bra	.L0606A292
	mov	r11,r9
.L0606A260:
	.short 0x0096
.L0606A262:
	.short 0x0102
.L0606A264:
	.short 0x0103
	.byte 0x00, 0x00
.L0606A268:
	.long 0x7FFFFFFF
.L0606A26C:
	.long gfsTrn_Request
.L0606A270:
	.long gfsAcc_CountSctAll
.L0606A274:
	.long stm_GetFadRange
.L0606A278:
	mov.l	@r13,r4
	mov.w	.L0606A362,r2
	cmp/eq	r2,r4
	bt	.L0606A286
	mov.w	.L0606A364,r1
	cmp/eq	r1,r4
	bf	.L0606A288
.L0606A286:
	mov	r11,r9
.L0606A288:
	mov.l	@(20,r15),r2
	cmp/eq	r2,r14
	bt	.L0606A292
	bra	.L0606A1E6
	mov.l	@(8,r14),r14
.L0606A292:
	add	#1,r8
.L0606A294:
	mov	#2,r2
	cmp/ge	r2,r8
	bt	.L0606A2A0
	mov.l	@(32,r15),r0
	cmp/eq	#1,r0
	bf	.L0606A1DE
.L0606A2A0:
	mov.l	r14,@(16,r10)
	mov.l	@(32,r15),r0
	tst	r0,r0
	bf	.L0606A2B0
	tst	r9,r9
	bf	.L0606A2B0
	mov.w	.L0606A362,r3
	mov.l	r3,@r13
.L0606A2B0:
	mov	r9,r0
.L0606A2B2:
	add	#36,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel STM_ExecStmRound

	glabel STM_GrpResetGfs
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606A368,r13
	bra	.L0606A2DC
	mov.l	@r4,r14
.L0606A2D2:
	mov	#0,r6
	mov	r6,r5
	jsr	@r13
	mov.l	@(16,r14),r4
	mov.l	@(8,r14),r14
.L0606A2DC:
	tst	r14,r14
	bf	.L0606A2D2
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel STM_GrpResetGfs

	glabel STM_GrpExecStms
	mov.l	r14,@-r15
	mov	r5,r0
	mov.l	r13,@-r15
	mov	r4,r14
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	add	#-12,r15
	mov.b	r0,@(8,r15)
	mov.l	@(16,r14),r1
	tst	r1,r1
	bf	.L0606A302
	mov.l	@r14,r3
	mov.l	r3,@(16,r14)
.L0606A302:
	mov.l	@(16,r14),r12
.L0606A304:
	mov	r15,r2
	mov	r12,r5
	mov.l	r2,@-r15
	mov	r15,r7
	mov.b	@(12,r15),r0
	add	#8,r7
	mov	r0,r6
	bsr	STM_ExecStmRound
	mov	r14,r4
	add	#4,r15
	mov.l	@(4,r15),r1
	mov	r0,r13
	tst	r1,r1
	bt	.L0606A304
	mov.w	.L0606A364,r4
	mov.l	@r15,r3
	cmp/eq	r4,r3
	bt	.L0606A32E
	mov.l	@(24,r14),r1
	cmp/eq	r4,r1
	bf	.L0606A334
.L0606A32E:
	mov.l	@r15,r2
	bra	.L0606A37C
	mov.l	r2,@(24,r14)
.L0606A334:
	bsr	STM_GrpIsAllEnd
	mov	r14,r4
	cmp/eq	#1,r0
	bf	.L0606A37C
	mov.l	@(44,r14),r2
	mov.l	@(48,r14),r3
	cmp/ge	r2,r3
	bt	.L0606A36C
	mov.w	.L0606A366,r0
	mov.l	@r15,r1
	cmp/eq	r0,r1
	bf/s	.L0606A35E
	mov	#0,r13
	mov	#56,r0
	mov.l	@(48,r14),r2
	mov	#64,r3
	add	#1,r2
	mov.l	r2,@(48,r14)
	mov.w	@(r0,r14),r2
	or	r3,r2
	mov.w	r2,@(r0,r14)
.L0606A35E:
	bra	.L0606A37C
	nop
.L0606A362:
	.short 0x0102
.L0606A364:
	.short 0x0103
.L0606A366:
	.short 0x0100
.L0606A368:
	.long GFS_Seek
.L0606A36C:
	mov.w	.L0606A444,r2
	mov	#56,r0
	mov.l	r2,@(20,r14)
	mov	#64,r3
	mov.w	@(r0,r14),r2
	mov	#1,r13
	or	r3,r2
	mov.w	r2,@(r0,r14)
.L0606A37C:
	mov	r13,r0
	add	#12,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel STM_GrpExecStms

	glabel STM_ExecServer
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606A44C,r13
	add	#-12,r15
	mov.l	.L0606A450,r3
	mov.l	@r3,r0
	tst	r0,r0
	bt/s	.L0606A3C0
	mov	#0,r12
	mov.l	.L0606A450,r2
	mov.l	@r2,r1
	mov	r2,r4
	jsr	@r1
	mov.l	@(4,r4),r4
	cmp/eq	#1,r0
	bf/s	.L0606A3BA
	mov	r0,r4
	mov.l	.L0606A450,r2
	mov.w	.L0606A446,r0
	bra	.L0606A4B6
	mov.l	r12,@r2
.L0606A3BA:
	mov.l	@r13,r0
	bra	.L0606A4B6
	mov.l	@(32,r0),r0
.L0606A3C0:
	mov.w	.L0606A448,r4
	mov.l	.L0606A454,r3
	jsr	@r3
	nop
	mov.l	@r13,r14
	mov.l	@(16,r14),r14
	tst	r14,r14
	bt	.L0606A4B2
	mov.l	@r14,r1
	tst	r1,r1
	bt	.L0606A4B2
	mov.l	@r13,r3
	mov.l	@(44,r3),r0
	tst	r0,r0
	bf	.L0606A49E
	mov	#1,r4
	mov.l	@r13,r3
	mov.l	r4,@(44,r3)
	mov.l	.L0606A458,r3
	mov.l	@r3,r2
	cmp/eq	r4,r2
	bf	.L0606A414
	mov.l	@(16,r14),r4
	mov	r15,r5
	mov.l	.L0606A45C,r2
	jsr	@r2
	mov.l	@(16,r4),r4
	mov.l	.L0606A458,r3
	mov.l	@r3,r0
	cmp/eq	#1,r0
	bf	.L0606A414
	mov.l	@r13,r1
	mov.l	.L0606A460,r2
	jsr	@r2
	mov.l	r12,@(44,r1)
	mov	r0,r4
	cmp/ge	r12,r4
	bt	.L0606A410
	bra	.L0606A4B6
	mov	r4,r0
.L0606A410:
	bra	.L0606A4B6
	mov.l	@(24,r14),r0
.L0606A414:
	bsr	STM_GrpCallFunc
	mov	r14,r4
	mov.l	.L0606A464,r3
	mov	r15,r4
	add	#4,r4
	jsr	@r3
	mov	#0,r5
	mov	r0,r11
	bsr	STM_CheckCdStat
	mov	r0,r4
	mov.l	@r13,r0
	mov.l	@(28,r0),r1
	tst	r1,r1
	bt	.L0606A434
	bra	.L0606A436
	mov	#1,r0
.L0606A434:
	mov	#0,r0
.L0606A436:
	cmp/eq	#1,r0
	bf	.L0606A46C
	mov.l	.L0606A468,r3
	jsr	@r3
	nop
	bra	.L0606A49A
	nop
.L0606A444:
	.short 0x0096
.L0606A446:
	.short 0x0104
.L0606A448:
	.short 0x0330
	.byte 0x00, 0x00
.L0606A44C:
	.long stm_mng
.L0606A450:
	.long stm_06070C70
.L0606A454:
	.long stm_set_func_id
.L0606A458:
	.long gfs_scu_dma_busy
.L0606A45C:
	.long gfsTrn_Step
.L0606A460:
	.long stm_check_gfs_err
.L0606A464:
	.long gfsFlow_GetCdStat
.L0606A468:
	.long stm_call_err_func
.L0606A46C:
	mov.l	.L0606A55C,r3
	jsr	@r3
	mov	r14,r4
	mov	r0,r6
	mov.l	@(4,r15),r5
	mov	r11,r7
	bsr	STM_GrpExecPickup
	mov	r14,r4
	mov.l	r0,@(8,r15)
	mov	r11,r5
	bsr	STM_GrpExecStms
	mov	r14,r4
	mov.l	r0,@r15
	mov.l	@(8,r15),r0
	cmp/eq	#1,r0
	bf	.L0606A49A
	mov.l	@r15,r0
	cmp/eq	#1,r0
	bf	.L0606A49A
	mov.w	.L0606A554,r2
	mov.l	r2,@(24,r14)
	bsr	STM_GrpResetGfs
	mov	r14,r4
.L0606A49A:
	mov.l	@r13,r2
	mov.l	r12,@(44,r2)
.L0606A49E:
	mov.l	.L0606A560,r3
	jsr	@r3
	nop
	mov	r0,r5
	cmp/pz	r5
	bt	.L0606A4AE
	bra	.L0606A4B4
	mov	r5,r4
.L0606A4AE:
	bra	.L0606A4B4
	mov.l	@(24,r14),r4
.L0606A4B2:
	mov.w	.L0606A556,r4
.L0606A4B4:
	mov	r4,r0
.L0606A4B6:
	add	#12,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel STM_ExecServer

	glabel STM_MovePickup
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	add	#-16,r15
	mov.l	.L0606A564,r3
	mov.l	r4,@(4,r15)
	mov.l	r5,@(12,r15)
	mov.w	.L0606A558,r4
	jsr	@r3
	nop
	mov.l	@(4,r15),r0
	tst	r0,r0
	bf	.L0606A4EE
	mov.l	.L0606A568,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L0606A56C,r2
	jsr	@r2
	nop
	bra	.L0606A5B4
	nop
.L0606A4EE:
	mov.l	@(4,r15),r13
	mov.l	.L0606A570,r2
	mov.l	@(4,r13),r13
	mov.l	@r2,r3
	mov.l	@r13,r14
	mov.l	@(16,r3),r1
	cmp/eq	r14,r1
	bf	.L0606A594
	mov	#56,r0
	mov.w	@(r0,r14),r0
	extu.w	r0,r0
	tst	#2,r0
	bt	.L0606A50C
	bra	.L0606A50E
	mov	#1,r0
.L0606A50C:
	mov	#0,r0
.L0606A50E:
	cmp/eq	#1,r0
	bf	.L0606A528
	mov.l	.L0606A574,r3
	jsr	@r3
	mov.l	@r13,r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606A524
	mov.l	.L0606A568,r3
	jsr	@r3
	nop
.L0606A524:
	mov.w	.L0606A556,r2
	mov.l	r2,@(24,r14)
.L0606A528:
	mov.l	.L0606A578,r3
	mov	r15,r4
	jsr	@r3
	mov	#0,r5
	mov.l	.L0606A57C,r2
	jsr	@r2
	mov	r0,r4
	mov.l	.L0606A570,r3
	mov.l	@r3,r0
	mov.l	@(28,r0),r1
	tst	r1,r1
	bt	.L0606A544
	bra	.L0606A546
	mov	#1,r0
.L0606A544:
	mov	#0,r0
.L0606A546:
	cmp/eq	#1,r0
	bf	.L0606A580
	mov.l	.L0606A56C,r3
	jsr	@r3
	nop
	bra	.L0606A5B4
	nop
.L0606A554:
	.short 0x0100
.L0606A556:
	.short 0x0101
.L0606A558:
	.short 0x0331
	.byte 0x00, 0x00
.L0606A55C:
	.long stm_get_end_fad
.L0606A560:
	.long stm_check_gfs_err
.L0606A564:
	.long stm_set_func_id
.L0606A568:
	.long stm_set_err
.L0606A56C:
	.long stm_call_err_func
.L0606A570:
	.long stm_mng
.L0606A574:
	.long stm_CdPause
.L0606A578:
	.long gfsFlow_GetCdStat
.L0606A57C:
	.long STM_CheckCdStat
.L0606A580:
	mov.l	@r15,r2
	cmp/pz	r2
	bf	.L0606A58A
	mov.l	@r15,r1
	mov.l	r1,@(20,r14)
.L0606A58A:
	mov	#56,r0
	mov.l	.L0606A694,r3
	mov.w	@(r0,r14),r2
	and	r3,r2
	mov.w	r2,@(r0,r14)
.L0606A594:
	bsr	STM_GrpCheckPassed
	mov	r14,r4
	bsr	STM_GrpClearReached
	mov	r14,r4
	mov.l	.L0606A698,r3
	mov	r15,r6
	add	#8,r6
	mov	r15,r5
	jsr	@r3
	mov.l	@(20,r13),r4
	mov.l	@r15,r3
	mov.l	@(12,r15),r2
	add	r3,r2
	mov.l	.L0606A69C,r3
	jsr	@r3
	mov.l	r2,@(20,r14)
.L0606A5B4:
	add	#16,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel STM_MovePickup

	glabel STM_GetExecGrpPos
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606A6A0,r3
	mov.l	.L0606A6A4,r2
	mov.l	@r3,r4
	jsr	@r2
	mov.l	@(16,r4),r4
	mov.l	.L0606A69C,r3
	jsr	@r3
	mov	r0,r14
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606A5DA
	mov	r4,r14
.L0606A5DA:
	mov	r14,r0
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel STM_GetExecGrpPos

	glabel STM_IsComplete
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606A6A8,r3
	add	#-12,r15
	mov.l	r4,@r15
	mov.w	.L0606A688,r4
	jsr	@r3
	nop
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L0606A60A
	mov.l	.L0606A6AC,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L0606A6B0,r2
	jsr	@r2
	nop
	bra	.L0606A652
	mov	#0,r0
.L0606A60A:
	mov.l	@r15,r14
	mov.l	@(4,r14),r14
	bsr	STM_GetNumSct
	mov	r14,r4
	mov	r15,r6
	mov.l	.L0606A698,r3
	mov	r15,r5
	mov.l	r0,@r15
	add	#8,r6
	add	#4,r5
	jsr	@r3
	mov.l	@(20,r14),r4
	mov.l	@r15,r7
	mov.l	@(8,r15),r6
	mov.l	@(4,r15),r5
	bsr	STM_GetStmStat
	mov	r14,r4
	mov.l	.L0606A69C,r2
	jsr	@r2
	mov	r0,r13
	mov.w	.L0606A68A,r3
	cmp/eq	r3,r13
	bf	.L0606A63C
	bra	.L0606A652
	mov	#1,r0
.L0606A63C:
	mov.w	.L0606A68C,r3
	cmp/eq	r3,r13
	bf	.L0606A650
	mov.l	@(16,r14),r1
	mov.w	.L0606A68E,r0
	mov.l	@(r0,r1),r0
	tst	r0,r0
	bf	.L0606A650
	bra	.L0606A652
	mov	#1,r0
.L0606A650:
	mov	#0,r0
.L0606A652:
	add	#12,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel STM_IsComplete

	glabel STM_TransStm
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	.L0606A6A8,r3
	mov.l	r4,@(4,r15)
	mov.w	.L0606A690,r4
	jsr	@r3
	nop
	mov.l	@(4,r15),r0
	tst	r0,r0
	bf	.L0606A6B4
	mov.l	.L0606A6AC,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L0606A6B0,r2
	jsr	@r2
	nop
	bra	.L0606A71C
	mov	#0,r0
.L0606A688:
	.short 0x0335
.L0606A68A:
	.short 0x0100
.L0606A68C:
	.short 0x0103
.L0606A68E:
	.short 0x009C
.L0606A690:
	.short 0x0336
	.byte 0x00, 0x00
.L0606A694:
	.long 0x0000FFD9
.L0606A698:
	.long stm_GetFadRange
.L0606A69C:
	.long stm_check_gfs_err
.L0606A6A0:
	.long stm_mng
.L0606A6A4:
	.long stm_CdContinue
.L0606A6A8:
	.long stm_set_func_id
.L0606A6AC:
	.long stm_set_err
.L0606A6B0:
	.long stm_call_err_func
.L0606A6B4:
	mov.l	.L0606A72C,r11
	mov.l	@r11,r4
	mov.l	@(44,r4),r0
	tst	r0,r0
	bf/s	.L0606A712
	mov	#0,r12
	mov.l	.L0606A730,r2
	mov	#1,r5
	mov.l	r5,@(44,r4)
	mov.l	@(4,r15),r14
	mov.l	@r2,r3
	cmp/eq	r5,r3
	bf/s	.L0606A6EA
	mov.l	@(4,r14),r14
	mov.l	.L0606A734,r3
	mov	r15,r5
	jsr	@r3
	mov.l	@(16,r14),r4
	mov.l	.L0606A730,r2
	mov.l	@r2,r0
	cmp/eq	#1,r0
	bf	.L0606A6EA
	mov.l	@r11,r1
	mov.l	r12,@(44,r1)
	mov.l	@r15,r0
	bra	.L0606A71C
	nop
.L0606A6EA:
	mov.l	@(16,r14),r13
	mov.l	.L0606A738,r3
	add	#108,r13
	jsr	@r3
	mov	r13,r4
	mov.l	r0,@(4,r15)
	mov.l	.L0606A73C,r5
	mov.l	.L0606A740,r3
	jsr	@r3
	mov	r13,r4
	bsr	STM_TransStmSub
	mov	r14,r4
	mov.l	r0,@r15
	mov.l	@(4,r15),r5
	mov.l	.L0606A740,r3
	jsr	@r3
	mov	r13,r4
	mov.l	@r11,r2
	bra	.L0606A714
	mov.l	r12,@(44,r2)
.L0606A712:
	mov.l	r12,@r15
.L0606A714:
	mov.l	.L0606A744,r3
	jsr	@r3
	nop
	mov.l	@r15,r0
.L0606A71C:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	.byte 0x00, 0x00
.L0606A72C:
	.long stm_mng
.L0606A730:
	.long gfs_scu_dma_busy
.L0606A734:
	.long gfsTrn_Step
.L0606A738:
	.long gfsTrn_GetNsct
.L0606A73C:
	.long 0x7FFFFFFF
.L0606A740:
	.long gfsTrn_Request
.L0606A744:
	.long stm_check_gfs_err
	endlabel STM_TransStm
