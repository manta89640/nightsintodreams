! sbl/gfs_dir: matching source. The readable C for this object is gfs_dir.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060703F4,"ax",@progbits
	.p2align 2

	glabel gfs_LoadDirTbl
	mov.l	r14,@-r15
	mov	r4,r14
	mov.l	r13,@-r15
	tst	r14,r14
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	r6,@(4,r15)
	bt/s	.L06070434
	mov	r5,r13
	mov	r15,r3
	mov.l	.L06070600,r2
	mov	#0,r7
	mov.l	r3,@-r15
	mov	r7,r6
	mov	r7,r5
	jsr	@r2
	mov	r14,r4
	add	#4,r15
	mov.l	@r15,r0
	tst	#128,r0
	bf	.L06070422
	bra	.L06070450
	mov	#-6,r0
.L06070422:
	mov.l	@(4,r15),r5
	mov.l	.L06070604,r3
	jsr	@r3
	mov	r14,r4
	mov	r0,r4
	tst	r4,r4
	bt	.L06070434
	bra	.L06070450
	mov	r4,r0
.L06070434:
	mov.l	@r13,r2
	tst	r2,r2
	bf	.L06070446
	mov.l	@(4,r13),r6
	mov.l	@(8,r13),r5
	bsr	gfs_ReadDirId
	mov	r14,r4
	bra	.L0607044E
	nop
.L06070446:
	mov.l	@(4,r13),r6
	mov.l	@(8,r13),r5
	bsr	gfs_ReadDirName
	mov	r14,r4
.L0607044E:
	mov	r0,r4
.L06070450:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_LoadDirTbl

	glabel gfs_NameToIdx
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r13
	mov.l	r12,@-r15
	mov	#0,r4
	mov.l	r11,@-r15
	mov	r4,r14
	mov.l	r10,@-r15
	mov	r6,r11
	sts.l	pr,@-r15
	cmp/ge	r11,r4
	mov.l	.L06070608,r10
	add	#-4,r15
	mov.l	r5,@r15
	bt/s	.L0607049C
	mov	#1,r12
.L0607047A:
	mov	#12,r6
	mov.l	@r15,r4
	mov	r13,r5
	jsr	@r10
	add	#12,r5
	tst	r0,r0
	bf	.L0607048C
	bra	.L0607049E
	mov	r14,r0
.L0607048C:
	mov.b	@(11,r13),r0
	extu.b	r0,r0
	tst	r12,r0
	bf	.L0607049C
	add	#1,r14
	cmp/ge	r11,r14
	bf/s	.L0607047A
	add	#24,r13
.L0607049C:
	mov	#-1,r0
.L0607049E:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_NameToIdx

	glabel gfs_DirIdRec
	mov	r4,r0
	mov	r4,r3
	shll	r0
	add	r3,r0
	shll2	r0
	rts
	add	r5,r0
	endlabel gfs_DirIdRec

	glabel gfs_DirNameRec
	mov	r4,r0
	mov	r4,r3
	shll	r0
	add	r3,r0
	shll2	r0
	shll	r0
	rts
	add	r5,r0
	endlabel gfs_DirNameRec

	glabel gfs_DirIdAtr
	mov	r4,r0
	mov	r4,r3
	shll	r0
	add	r3,r0
	shll2	r0
	add	r5,r0
	mov.b	@(11,r0),r0
	rts
	extu.b	r0,r0
	endlabel gfs_DirIdAtr

	glabel gfs_DirNameAtr
	mov	r4,r0
	mov	r4,r3
	shll	r0
	add	r3,r0
	shll2	r0
	shll	r0
	add	r5,r0
	mov.b	@(11,r0),r0
	rts
	extu.b	r0,r0
	endlabel gfs_DirNameAtr

	glabel gfs_CdChgRootDir
	bra	gfs_CdChgDir
	mov	#-1,r4
	endlabel gfs_CdChgRootDir

	glabel gfs_CdChgDir
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.l	.L06070610,r3
	add	#-8,r15
	mov.l	r4,@(4,r15)
	mov.l	.L0607060C,r4
	jsr	@r3
	nop
	mov.l	.L06070614,r13
	mov.l	.L06070618,r14
.L0607050C:
	mov.l	@(4,r15),r4
	mov	r15,r6
	jsr	@r13
	mov	#23,r5
	cmp/eq	#-5,r0
	bf/s	.L0607051E
	mov	r0,r4
	bra	.L06070554
	mov	#-7,r0
.L0607051E:
	jsr	@r14
	nop
	cmp/eq	#-12,r0
	bf/s	.L0607052C
	mov	r0,r4
	bra	.L06070554
	mov	#-22,r0
.L0607052C:
	mov	r4,r0
	cmp/eq	#-16,r0
	bf	.L06070536
	bra	.L06070554
	mov	#-25,r0
.L06070536:
	tst	r4,r4
	bf	.L0607050C
	mov.l	.L0607061C,r3
	jsr	@r3
	nop
	cmp/eq	#-16,r0
	bf/s	.L0607054A
	mov	r0,r4
	bra	.L06070554
	mov	#-25,r0
.L0607054A:
	tst	r4,r4
	bt	.L06070552
	bra	.L06070554
	mov	#-1,r0
.L06070552:
	mov.l	@r15,r0
.L06070554:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_CdChgDir

	glabel gfs_ReadDirId
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r5,r14
	mov.l	r12,@-r15
	mov	r4,r5
	sts.l	pr,@-r15
	add	#-52,r15
	mov.l	r4,@r15
	mov	r15,r4
	add	#32,r4
	bsr	gfs_RdrInit
	mov	r6,r13
	mov	#0,r4
	cmp/gt	r4,r13
	bf/s	.L060705B0
	mov	r4,r12
.L0607057E:
	mov	r15,r5
	add	#4,r5
	mov	r15,r4
	add	#32,r4
	bsr	gfs_RdrRec
	nop
	mov	r0,r4
	tst	r4,r4
	bt	.L06070594
	bra	.L060705BA
	mov	r4,r0
.L06070594:
	mov	r15,r3
	add	#4,r3
	mov.b	@(8,r3),r0
	tst	r0,r0
	bt	.L060705B0
	mov	r15,r5
	add	#4,r5
	bsr	gfs_RecToDir
	mov	r14,r4
	add	#12,r14
	add	#-1,r13
	cmp/pl	r13
	bt/s	.L0607057E
	add	#1,r12
.L060705B0:
	add	#-12,r14
	mov.b	@(11,r14),r0
	or	#1,r0
	mov.b	r0,@(11,r14)
	mov	r12,r0
.L060705BA:
	add	#52,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_ReadDirId

	glabel gfs_ReadDirName
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r5,r14
	mov.l	r12,@-r15
	mov	r4,r5
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	sts.l	pr,@-r15
	add	#-52,r15
	mov.l	r4,@r15
	mov	r15,r4
	add	#32,r4
	bsr	gfs_RdrInit
	mov	r6,r12
	mov	#2,r11
	mov.l	.L06070620,r10
	bra	.L06070662
	mov	#0,r13
.L060705EA:
	mov	r15,r5
	add	#4,r5
	mov	r15,r4
	add	#32,r4
	bsr	gfs_RdrRec
	nop
	mov	r0,r4
	tst	r4,r4
	bt	.L06070624
	bra	.L06070670
	mov	r4,r0
.L06070600:
	.long GFS_GetFileInfo
.L06070604:
	.long GFS_NwCdRead
.L06070608:
	.long strncmp
.L0607060C:
	.long 0x00030000
.L06070610:
	.long gfcd_SetTimeout
.L06070614:
	.long gfcd_ChgDir
.L06070618:
	.long gfcd_ExecServer
.L0607061C:
	.long gfcd_WaitServer
.L06070620:
	.long strncpy
.L06070624:
	mov	r15,r3
	add	#4,r3
	mov.b	@(8,r3),r0
	tst	r0,r0
	bt	.L06070666
	cmp/gt	r11,r13
	bf	.L06070646
	mov	#12,r6
	mov.l	.L0607070C,r3
	mov	r15,r5
	add	#4,r5
	add	#12,r5
	mov	r14,r4
	jsr	@r3
	add	#-12,r4
	tst	r0,r0
	bt	.L0607065C
.L06070646:
	mov	r15,r5
	add	#4,r5
	bsr	gfs_RecToDir
	mov	r14,r4
	mov	#12,r6
	mov	r15,r5
	add	#4,r5
	add	#12,r5
	mov	r14,r4
	jsr	@r10
	add	#12,r4
.L0607065C:
	add	#24,r14
	add	#1,r13
	add	#-1,r12
.L06070662:
	cmp/pl	r12
	bt	.L060705EA
.L06070666:
	add	#-24,r14
	mov.b	@(11,r14),r0
	or	#1,r0
	mov.b	r0,@(11,r14)
	mov	r13,r0
.L06070670:
	add	#52,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_ReadDirName

	glabel gfs_RdrInit
	mov.l	r5,@r4
	mov	r5,r6
	mov.l	.L06070710,r2
	add	#12,r6
	mov.w	.L06070708,r1
	mov.l	@r2,r3
	add	r3,r1
	mov	#-1,r3
	mov.l	r1,@(4,r4)
	mov.l	r3,@(8,r4)
	mov.l	@(20,r6),r1
	mov	#0,r3
	mov.l	r1,@(16,r4)
	rts
	mov.l	r3,@(12,r4)
	endlabel gfs_RdrInit

	glabel gfs_RdrRead
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r14
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov	r5,r10
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	@r14,r0
	tst	r0,r0
	bf/s	.L060706C6
	mov	r6,r13
	mov.l	.L06070714,r3
	mov	r13,r6
	mov	#0,r5
	jsr	@r3
	mov	r10,r4
	bra	.L06070766
	mov	#0,r0
.L060706C6:
	mov.w	.L0607070A,r11
	mov.l	@(8,r14),r0
	cmp/eq	#-1,r0
	bt/s	.L060706D6
	mov	r0,r4
	mov.w	.L0607070A,r3
	cmp/ge	r3,r4
	bf	.L060706F8
.L060706D6:
	mov	r11,r7
	mov.l	@(4,r14),r6
	mov	#1,r5
	mov.l	.L06070718,r3
	jsr	@r3
	mov.l	@r14,r4
	mov	r0,r4
	cmp/eq	r11,r4
	bt	.L060706F4
	cmp/pz	r4
	bt	.L060706F0
	bra	.L06070766
	mov	r4,r0
.L060706F0:
	bra	.L06070766
	mov	#-1,r0
.L060706F4:
	mov	#0,r2
	mov.l	r2,@(8,r14)
.L060706F8:
	mov.l	@(8,r14),r4
	mov.l	r4,@r15
	neg	r4,r4
	add	r11,r4
	cmp/hs	r13,r4
	bt	.L0607071C
	bra	.L0607071E
	mov	r4,r12
.L06070708:
	.short 0x0460
.L0607070A:
	.short 0x0800
.L0607070C:
	.long strncmp
.L06070710:
	.long gfs_mng
.L06070714:
	.long memset
.L06070718:
	.long GFS_Fread
.L0607071C:
	mov	r13,r12
.L0607071E:
	mov	r12,r6
	mov.l	@r15,r3
	mov.l	@(4,r14),r5
	add	r3,r5
	mov.l	.L0607088C,r3
	jsr	@r3
	mov	r10,r4
	mov.l	@(8,r14),r2
	cmp/hs	r13,r12
	add	r12,r2
	bt/s	.L06070764
	mov.l	r2,@(8,r14)
	sub	r12,r13
	mov.l	@(4,r14),r6
	mov	#1,r5
	mov.l	.L06070890,r2
	mov	r11,r7
	jsr	@r2
	mov.l	@r14,r4
	mov	r0,r4
	cmp/eq	r11,r4
	bt	.L06070756
	cmp/pz	r4
	bt	.L06070752
	bra	.L06070766
	mov	r4,r0
.L06070752:
	bra	.L06070766
	mov	#-1,r0
.L06070756:
	mov	r13,r6
	mov.l	@(4,r14),r5
	mov	r12,r4
	mov.l	.L0607088C,r3
	jsr	@r3
	add	r10,r4
	mov.l	r13,@(8,r14)
.L06070764:
	mov	#0,r0
.L06070766:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_RdrRead

	glabel gfs_RdrByte
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov	r5,r8
	add	#-8,r15
	mov.l	r5,@(4,r15)
	mov	r15,r5
	bsr	gfs_RdrRead
	mov	#1,r6
	mov.l	r0,@r8
	mov.b	@r15,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r8
	endlabel gfs_RdrByte

	glabel gfs_RdrHalf
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov	r5,r8
	add	#-8,r15
	mov.l	r5,@(4,r15)
	mov	r15,r5
	bsr	gfs_RdrRead
	mov	#2,r6
	mov.l	r0,@r8
	mov.w	@r15,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r8
	endlabel gfs_RdrHalf

	glabel gfs_RdrHalf2
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov	r5,r14
	add	#-12,r15
	mov	r15,r5
	mov.l	r4,@(4,r15)
	add	#8,r5
	bsr	gfs_RdrRead
	mov	#2,r6
	mov	r0,r1
	tst	r1,r1
	bt/s	.L060707D2
	mov.l	r0,@r14
	mov	#0,r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L060707D2:
	mov	r15,r5
	mov.l	@(4,r15),r4
	bsr	gfs_RdrRead
	mov	#2,r6
	mov	r0,r1
	tst	r1,r1
	bt/s	.L060707EC
	mov.l	r0,@r14
	mov	#0,r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L060707EC:
	mov.w	@r15,r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel gfs_RdrHalf2

	glabel gfs_RdrWord2
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov	r5,r14
	add	#-12,r15
	mov	r15,r5
	mov.l	r4,@(4,r15)
	add	#8,r5
	bsr	gfs_RdrRead
	mov	#4,r6
	mov	r0,r1
	tst	r1,r1
	bt/s	.L0607081A
	mov.l	r0,@r14
	mov	#0,r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0607081A:
	mov	r15,r5
	mov.l	@(4,r15),r4
	bsr	gfs_RdrRead
	mov	#4,r6
	mov	r0,r1
	tst	r1,r1
	bt/s	.L06070834
	mov.l	r0,@r14
	mov	#0,r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L06070834:
	mov.l	@r15,r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel gfs_RdrWord2

	glabel gfs_RdrWord
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov	r5,r8
	add	#-8,r15
	mov.l	r5,@(4,r15)
	mov	r15,r5
	bsr	gfs_RdrRead
	mov	#4,r6
	mov.l	r0,@r8
	mov.l	@r15,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r8
	endlabel gfs_RdrWord

	glabel gfs_RdrRecLen
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r14
	sts.l	pr,@-r15
	bsr	gfs_RdrByte
	mov	r5,r13
	extu.b	r0,r4
	mov.l	@r13,r0
	tst	r0,r0
	bt	.L06070872
	bra	.L060708D2
	mov	#0,r0
.L06070872:
	tst	r4,r4
	bt	.L0607087A
	bra	.L060708D2
	mov	r4,r0
.L0607087A:
	mov.l	@(12,r14),r3
	add	#1,r3
	mov	r3,r1
	mov.l	r3,@(12,r14)
	mov.l	@(16,r14),r2
	cmp/ge	r2,r1
	bf	.L06070894
	bra	.L060708D2
	mov	r4,r0
.L0607088C:
	.long memmove
.L06070890:
	.long GFS_Fread
.L06070894:
	mov.w	.L06070972,r7
	mov	#1,r5
	mov.l	.L06070978,r2
	mov.l	@(4,r14),r6
	jsr	@r2
	mov.l	@r14,r4
	mov.w	.L06070972,r3
	mov	r0,r4
	cmp/eq	r3,r4
	bt	.L060708BA
	cmp/pl	r4
	bf/s	.L060708B4
	mov	#0,r0
	mov	#-1,r2
	bra	.L060708B6
	mov.l	r2,@r13
.L060708B4:
	mov.l	r4,@r13
.L060708B6:
	bra	.L060708D2
	nop
.L060708BA:
	mov	#0,r3
	mov.l	r3,@(8,r14)
	mov	r13,r5
	bsr	gfs_RdrByte
	mov	r14,r4
	extu.b	r0,r4
	mov.l	@r13,r0
	tst	r0,r0
	bt	.L060708D0
	bra	.L060708D2
	mov	#0,r0
.L060708D0:
	mov	r4,r0
.L060708D2:
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_RdrRecLen

	glabel gfs_RdrRec
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r14
	mov.l	r12,@-r15
	mov	r5,r12
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	add	#-12,r15
	mov.l	@r14,r0
	tst	r0,r0
	bf/s	.L06070900
	mov	#0,r9
	mov	r9,r0
	mov.b	r0,@(8,r12)
	bra	.L06070BF6
	mov	#0,r0
.L06070900:
	mov	r15,r5
	bsr	gfs_RdrRecLen
	mov	r14,r4
	mov.b	r0,@(8,r12)
	mov.l	@r15,r1
	tst	r1,r1
	bt	.L06070914
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L06070914:
	mov.b	@(8,r12),r0
	tst	r0,r0
	bf	.L0607091E
	bra	.L06070BF6
	mov	#0,r0
.L0607091E:
	mov	r15,r5
	bsr	gfs_RdrByte
	mov	r14,r4
	mov.l	@r15,r0
	tst	r0,r0
	bt	.L06070930
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L06070930:
	mov	r15,r5
	bsr	gfs_RdrWord2
	mov	r14,r4
	mov.w	.L06070974,r2
	add	r2,r0
	mov.l	r0,@r12
	mov.l	@r15,r1
	tst	r1,r1
	bt	.L06070948
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L06070948:
	mov	r15,r5
	bsr	gfs_RdrWord2
	mov	r14,r4
	mov.l	r0,@(4,r12)
	mov.l	@r15,r1
	tst	r1,r1
	bt	.L0607095C
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L0607095C:
	mov	r9,r13
	mov	#7,r11
.L06070960:
	mov	r15,r5
	bsr	gfs_RdrByte
	mov	r14,r4
	mov.l	@r15,r0
	tst	r0,r0
	bt	.L0607097C
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L06070972:
	.short 0x0800
.L06070974:
	.short 0x0096
	.byte 0x00, 0x00
.L06070978:
	.long GFS_Fread
.L0607097C:
	add	#1,r13
	cmp/ge	r11,r13
	bf	.L06070960
	mov	r15,r5
	bsr	gfs_RdrByte
	mov	r14,r4
	mov.b	r0,@(8,r15)
	mov.l	@r15,r2
	tst	r2,r2
	bt	.L06070996
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L06070996:
	mov	r15,r5
	bsr	gfs_RdrByte
	mov	r14,r4
	mov.b	r0,@(10,r12)
	mov.l	@r15,r1
	tst	r1,r1
	bt	.L060709AA
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L060709AA:
	mov	r15,r5
	bsr	gfs_RdrByte
	mov	r14,r4
	mov.b	r0,@(11,r12)
	mov.l	@r15,r1
	tst	r1,r1
	bt	.L060709BE
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L060709BE:
	mov	r15,r5
	bsr	gfs_RdrHalf2
	mov	r14,r4
	mov.l	@r15,r0
	tst	r0,r0
	bt	.L060709D0
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L060709D0:
	mov	r15,r5
	bsr	gfs_RdrByte
	mov	r14,r4
	mov	r0,r4
	mov.l	@r15,r1
	tst	r1,r1
	bt	.L060709E4
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L060709E4:
	extu.b	r4,r11
	mov	r11,r3
	add	#33,r3
	mov	r12,r10
	mov.l	r3,@(4,r15)
	mov	r9,r13
	add	#12,r10
	bra	.L06070A20
	mov	#8,r8
.L060709F6:
	mov	r15,r5
	bsr	gfs_RdrByte
	mov	r14,r4
	mov	r0,r4
	mov.l	@r15,r0
	tst	r0,r0
	bt/s	.L06070A0C
	add	#1,r13
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L06070A0C:
	exts.b	r4,r0
	cmp/eq	#59,r0
	bt	.L06070A2E
	exts.b	r4,r0
	mov.b	r4,@r10
	cmp/eq	#46,r0
	bf/s	.L06070A20
	add	#1,r10
	bra	.L06070A2E
	mov	r10,r8
.L06070A20:
	cmp/gt	r8,r11
	bf	.L06070A28
	bra	.L06070A2A
	mov	r8,r3
.L06070A28:
	mov	r11,r3
.L06070A2A:
	cmp/ge	r3,r13
	bf	.L060709F6
.L06070A2E:
	exts.b	r4,r0
	cmp/eq	#59,r0
	bf	.L06070A54
	cmp/ge	r11,r13
	bt	.L06070AE2
.L06070A38:
	mov	r15,r5
	bsr	gfs_RdrByte
	mov	r14,r4
	mov.l	@r15,r0
	tst	r0,r0
	bt/s	.L06070A4C
	add	#1,r13
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L06070A4C:
	cmp/ge	r11,r13
	bf	.L06070A38
	bra	.L06070AE2
	nop
.L06070A54:
	exts.b	r4,r0
	cmp/eq	#46,r0
	bt	.L06070AE2
	cmp/ge	r11,r13
	bt	.L06070AE2
.L06070A5E:
	mov	r15,r5
	bsr	gfs_RdrByte
	mov	r14,r4
	mov	r0,r4
	mov.l	@r15,r0
	tst	r0,r0
	bt/s	.L06070A74
	add	#1,r13
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L06070A74:
	exts.b	r4,r0
	cmp/eq	#46,r0
	bf	.L06070A82
	mov.b	r4,@r10
	add	#1,r10
	bra	.L06070AE2
	mov	r10,r8
.L06070A82:
	cmp/ge	r11,r13
	bf	.L06070A5E
	bra	.L06070AE2
	nop
.L06070A8A:
	mov	r15,r5
	bsr	gfs_RdrByte
	mov	r14,r4
	mov	r0,r4
	mov.l	@r15,r0
	tst	r0,r0
	bt/s	.L06070AA0
	add	#1,r13
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L06070AA0:
	exts.b	r4,r0
	cmp/eq	#59,r0
	bf	.L06070AC6
	cmp/ge	r11,r13
	bt	.L06070AE6
.L06070AAA:
	mov	r15,r5
	bsr	gfs_RdrByte
	mov	r14,r4
	mov.l	@r15,r0
	tst	r0,r0
	bt/s	.L06070ABE
	add	#1,r13
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L06070ABE:
	cmp/ge	r11,r13
	bf	.L06070AAA
	bra	.L06070AE6
	nop
.L06070AC6:
	mov	r10,r3
	sub	r8,r3
	mov	#3,r2
	cmp/gt	r2,r3
	bt	.L06070AE2
	mov	r12,r3
	add	#12,r3
	mov	r10,r1
	sub	r3,r1
	mov	#12,r2
	cmp/ge	r2,r1
	bt	.L06070AE2
	mov.b	r4,@r10
	add	#1,r10
.L06070AE2:
	cmp/ge	r11,r13
	bf	.L06070A8A
.L06070AE6:
	mov	r12,r3
	add	#12,r3
	mov	r10,r2
	sub	r3,r2
	mov	#12,r1
	cmp/ge	r1,r2
	bt/s	.L06070AF8
	mov	r11,r0
	mov.b	r9,@r10
.L06070AF8:
	add	#1,r0
	tst	#1,r0
	bt	.L06070B16
	mov	r15,r5
	bsr	gfs_RdrByte
	mov	r14,r4
	mov.l	@r15,r0
	tst	r0,r0
	bt	.L06070B10
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L06070B10:
	mov.l	@(4,r15),r3
	add	#1,r3
	mov.l	r3,@(4,r15)
.L06070B16:
	mov.b	@(12,r12),r0
	tst	r0,r0
	bf	.L06070B2A
	mov.l	.L06070BE0,r1
	mov	r12,r0
	mov.l	.L06070BE4,r3
	jsr	@r3
	add	#12,r0
	bra	.L06070B3A
	nop
.L06070B2A:
	mov.b	@(12,r12),r0
	cmp/eq	#1,r0
	bf	.L06070B3A
	mov.l	.L06070BE8,r1
	mov	r12,r0
	mov.l	.L06070BE4,r2
	jsr	@r2
	add	#12,r0
.L06070B3A:
	mov.b	@(8,r12),r0
	mov.l	@(4,r15),r3
	extu.b	r0,r0
	cmp/ge	r0,r3
	bt	.L06070BCE
	mov	r15,r5
	bsr	gfs_RdrWord
	mov	r14,r4
	mov.l	@r15,r0
	tst	r0,r0
	bt	.L06070B56
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L06070B56:
	mov	r15,r5
	bsr	gfs_RdrByte
	mov	r14,r4
	and	#248,r0
	mov.b	r0,@(9,r12)
	mov.l	@r15,r1
	tst	r1,r1
	bt	.L06070B6C
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L06070B6C:
	mov	r15,r5
	bsr	gfs_RdrByte
	mov	r14,r4
	mov.l	@r15,r0
	tst	r0,r0
	bt	.L06070B7E
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L06070B7E:
	mov	r15,r5
	bsr	gfs_RdrHalf
	mov	r14,r4
	mov.l	@r15,r0
	tst	r0,r0
	bt	.L06070B90
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L06070B90:
	mov	r15,r5
	bsr	gfs_RdrByte
	mov	r14,r4
	mov	#25,r1
	add	r12,r1
	mov.b	r0,@r1
	mov.l	@r15,r2
	tst	r2,r2
	bt	.L06070BA8
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L06070BA8:
	mov.l	@(4,r15),r13
	bra	.L06070BC2
	add	#9,r13
.L06070BAE:
	mov	r15,r5
	bsr	gfs_RdrByte
	mov	r14,r4
	mov.l	@r15,r0
	tst	r0,r0
	bt	.L06070BC0
	mov.l	@r15,r0
	bra	.L06070BF6
	nop
.L06070BC0:
	add	#1,r13
.L06070BC2:
	mov.b	@(8,r12),r0
	extu.b	r0,r0
	cmp/ge	r0,r13
	bf	.L06070BAE
	bra	.L06070BF4
	nop
.L06070BCE:
	mov.b	@(8,r15),r0
	extu.b	r0,r0
	tst	#2,r0
	bt	.L06070BEC
	mov.w	.L06070BDC,r0
	bra	.L06070BEE
	nop
.L06070BDC:
	.short 0x0080
	.byte 0x00, 0x00
.L06070BE0:
	.long gfs_dir_dot
.L06070BE4:
	.long _slow_strcpy
.L06070BE8:
	.long gfs_dir_dotdot
.L06070BEC:
	mov	#0,r0
.L06070BEE:
	mov.b	r0,@(9,r12)
	mov	#25,r0
	mov.b	r9,@(r0,r12)
.L06070BF4:
	mov	#0,r0
.L06070BF6:
	add	#12,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_RdrRec

	glabel gfs_RecToDir
	mov	#25,r0
	mov.l	@r5,r3
	mov.l	r3,@r4
	mov.l	@(4,r5),r2
	mov.l	r2,@(4,r4)
	mov.b	@(r0,r5),r0
	mov.b	r0,@(10,r4)
	mov.b	@(9,r5),r0
	mov.b	r0,@(11,r4)
	mov.b	@(10,r5),r0
	mov.b	r0,@(8,r4)
	mov.b	@(11,r5),r0
	rts
	mov.b	r0,@(9,r4)
	.byte 0x00, 0x00
	endlabel gfs_RecToDir
