! sbl/gfs: matching source. The readable C for this object is gfs.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0606AB44,"ax",@progbits
	.p2align 2

	glabel GFS_Init
	mov.l	r14,@-r15
	mov	#0,r3
	mov.l	.L0606AC14,r2
	mov	#1,r1
	mov.l	r13,@-r15
	mov	r4,r13
	sts.l	pr,@-r15
	cmp/ge	r1,r13
	add	#-4,r15
	mov.l	r5,@r15
	mov.l	r3,@r2
	bf/s	.L0606AB64
	mov	r6,r14
	mov	#24,r0
	cmp/gt	r0,r13
	bf	.L0606AB68
.L0606AB64:
	bra	.L0606AC04
	mov	#-5,r0
.L0606AB68:
	mov.l	@r15,r0
	tst	#3,r0
	bt	.L0606AB72
	bra	.L0606AC04
	mov	#-21,r0
.L0606AB72:
	tst	r14,r14
	bt	.L0606AB94
	mov.l	@r14,r4
	tst	r4,r4
	bt	.L0606AB82
	mov	r4,r0
	cmp/eq	#1,r0
	bf	.L0606AB90
.L0606AB82:
	mov	#2,r2
	mov.l	@(4,r14),r3
	cmp/ge	r2,r3
	bf	.L0606AB90
	mov.l	@(8,r14),r0
	tst	r0,r0
	bf	.L0606AB94
.L0606AB90:
	bra	.L0606AC04
	mov	#-4,r0
.L0606AB94:
	mov.l	.L0606AC18,r2
	mov.l	@r2,r3
	mov.w	.L0606AC0E,r4
	jsr	@r3
	mov	#0,r5
	mov.l	@r15,r3
	mov.l	.L0606AC1C,r2
	mov.l	r3,@r2
	mov.l	.L0606AC20,r3
	jsr	@r3
	mov	r13,r4
	tst	r14,r14
	bf	.L0606ABB2
	bra	.L0606ABB4
	mov	#1,r4
.L0606ABB2:
	mov	#0,r4
.L0606ABB4:
	mov.l	.L0606AC24,r2
	jsr	@r2
	nop
	mov	r0,r4
	tst	r4,r4
	bf	.L0606ABE6
	mov.l	.L0606AC1C,r3
	mov.l	@r3,r0
	mov.w	.L0606AC10,r1
	mov.l	@(r0,r1),r0
	tst	#1,r0
	bf	.L0606ABDA
	mov.l	.L0606AC28,r2
	mov	#-2,r4
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	jmp	@r2
	mov.l	@r15+,r14
.L0606ABDA:
	bsr	gfs_ReadRootDir
	mov	r14,r4
	mov	r0,r14
	cmp/pz	r14
	bt	.L0606ABF2
	mov	r14,r4
.L0606ABE6:
	add	#4,r15
	mov.l	.L0606AC28,r3
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	jmp	@r3
	mov.l	@r15+,r14
.L0606ABF2:
	mov.l	.L0606AC28,r2
	jsr	@r2
	mov	#0,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606AC02
	bra	.L0606AC04
	mov	r4,r0
.L0606AC02:
	mov	r14,r0
.L0606AC04:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L0606AC0E:
	.short 0xF7FF
.L0606AC10:
	.short 0x00C4
	.byte 0x00, 0x00
.L0606AC14:
	.long gfs_scu_dma_busy
.L0606AC18:
	.long SYS_SETSCUIM
.L0606AC1C:
	.long gfs_mng
.L0606AC20:
	.long gfs_InitMng
.L0606AC24:
	.long gfsFlow_InitCd
.L0606AC28:
	.long gfs_SetErr
	endlabel GFS_Init

	glabel GFS_LoadDir
	mov.l	r14,@-r15
	mov	r5,r1
	sts.l	pr,@-r15
	tst	r1,r1
	add	#-8,r15
	mov.l	r5,@r15
	bf	.L0606AC78
	mov.l	.L0606AD24,r2
	mov.w	.L0606AD1C,r0
	mov.l	@r2,r3
	mov.l	@(r0,r3),r0
	tst	r0,r0
	bt	.L0606AC54
	mov.l	.L0606AD28,r3
	jsr	@r3
	mov	#-7,r4
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606AC54:
	mov.l	.L0606AD2C,r2
	jsr	@r2
	nop
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606AC6E
	mov.l	.L0606AD28,r2
	jsr	@r2
	nop
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606AC6E:
	mov	r4,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606AC78:
	bsr	GFS_Open
	nop
	mov	r0,r14
	tst	r14,r14
	bf	.L0606AC92
	mov.l	.L0606AD24,r3
	mov.w	.L0606AD1E,r1
	mov.l	@r3,r0
	mov.l	@(r0,r1),r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606AC92:
	mov	#0,r7
	mov	r15,r6
	add	#4,r6
	mov	r7,r5
	bsr	GFS_GetFileSize
	mov	r14,r4
	mov.l	@(4,r15),r6
	mov.l	@r15,r5
	mov.l	.L0606AD30,r3
	jsr	@r3
	mov	r14,r4
	mov.l	r0,@r15
	bsr	GFS_Close
	mov	r14,r4
	mov.l	@r15,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel GFS_LoadDir

	glabel GFS_SetDir
	mov.l	r14,@-r15
	tst	r4,r4
	mov.l	.L0606AD24,r3
	sts.l	pr,@-r15
	mov.l	@r3,r14
	mov.w	.L0606AD20,r2
	bf/s	.L0606ACE2
	add	r2,r14
	mov.l	@(8,r14),r1
	tst	r1,r1
	bt	.L0606ACD8
	mov	#-7,r4
	lds.l	@r15+,pr
	mov.l	.L0606AD28,r1
	jmp	@r1
	mov.l	@r15+,r14
.L0606ACD8:
	mov	#0,r4
	mov.l	r4,@(8,r14)
	mov.l	r4,@(12,r14)
	bra	.L0606ACF2
	mov.l	r4,@(4,r14)
.L0606ACE2:
	mov	r14,r1
	mov.l	.L0606AD34,r3
	mov	r4,r2
	jsr	@r3
	mov	#12,r0
	bsr	gfs_CountFiles
	nop
	mov.l	r0,@(12,r14)
.L0606ACF2:
	mov	#0,r4
	lds.l	@r15+,pr
	mov.l	.L0606AD28,r3
	jmp	@r3
	mov.l	@r15+,r14
	endlabel GFS_SetDir

	glabel GFS_NameToId
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606AD24,r3
	add	#-4,r15
	mov.w	.L0606AD20,r2
	mov.l	r4,@r15
	mov.l	@r3,r14
	add	r2,r14
	mov.l	@(8,r14),r0
	tst	r0,r0
	bt	.L0606AD18
	mov.l	@r14,r0
	cmp/eq	#1,r0
	bt	.L0606AD38
.L0606AD18:
	bra	.L0606AD4A
	mov	#-8,r4
.L0606AD1C:
	.short 0x00A0
.L0606AD1E:
	.short 0x00C0
.L0606AD20:
	.short 0x0098
	.byte 0x00, 0x00
.L0606AD24:
	.long gfs_mng
.L0606AD28:
	.long gfs_SetErr
.L0606AD2C:
	.long gfs_CdChgDir
.L0606AD30:
	.long gfs_LoadDirTbl
.L0606AD34:
	.long _quick_odd_mvn
.L0606AD38:
	mov.l	@(4,r14),r6
	mov.l	@r15,r5
	mov.l	.L0606AE34,r3
	jsr	@r3
	mov.l	@(8,r14),r4
	mov	r0,r14
	cmp/pz	r14
	bt	.L0606AD54
	mov	#-9,r4
.L0606AD4A:
	add	#4,r15
	mov.l	.L0606AE38,r3
	lds.l	@r15+,pr
	jmp	@r3
	mov.l	@r15+,r14
.L0606AD54:
	mov.l	.L0606AE38,r2
	jsr	@r2
	mov	#0,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606AD6A
	mov	r4,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606AD6A:
	mov	r14,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel GFS_NameToId

	glabel GFS_IdToName
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606AE3C,r3
	add	#-4,r15
	mov.w	.L0606AE30,r2
	mov.l	@r3,r14
	add	r2,r14
	mov.l	@(8,r14),r0
	tst	r0,r0
	bt	.L0606AD8E
	mov.l	@r14,r0
	cmp/eq	#1,r0
	bt	.L0606AD9C
.L0606AD8E:
	bsr	gfs_SetErr
	mov	#-8,r4
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606AD9C:
	cmp/pz	r4
	bf	.L0606ADA6
	mov.l	@(12,r14),r3
	cmp/gt	r4,r3
	bt	.L0606ADB4
.L0606ADA6:
	bsr	gfs_SetErr
	mov	#-9,r4
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606ADB4:
	mov.l	.L0606AE40,r2
	jsr	@r2
	mov.l	@(8,r14),r5
	mov.l	r0,@r15
	bsr	gfs_SetErr
	mov	#0,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606ADD0
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606ADD0:
	mov.l	@r15,r0
	add	#12,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel GFS_IdToName

	glabel GFS_GetDirInfo
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606AE3C,r3
	add	#-4,r15
	mov.w	.L0606AE30,r2
	mov.l	r5,@r15
	mov.l	@r3,r14
	add	r2,r14
	mov.l	@(8,r14),r0
	tst	r0,r0
	bt	.L0606ADFC
	cmp/pz	r4
	bf	.L0606ADFC
	mov.l	@(12,r14),r0
	cmp/ge	r0,r4
	bf	.L0606AE06
.L0606ADFC:
	mov	#-10,r4
	add	#4,r15
	lds.l	@r15+,pr
	bra	gfs_SetErr
	mov.l	@r15+,r14
.L0606AE06:
	mov.l	@r14,r0
	cmp/eq	#1,r0
	bf	.L0606AE16
	mov.l	.L0606AE40,r3
	jsr	@r3
	mov.l	@(8,r14),r5
	bra	.L0606AE1C
	nop
.L0606AE16:
	mov.l	.L0606AE44,r3
	jsr	@r3
	mov.l	@(8,r14),r5
.L0606AE1C:
	mov.l	@r15,r4
	mov	r0,r5
	mov.l	.L0606AE48,r3
	jsr	@r3
	mov	#12,r6
	mov	#0,r4
	add	#4,r15
	lds.l	@r15+,pr
	bra	gfs_SetErr
	mov.l	@r15+,r14
.L0606AE30:
	.short 0x0098
	.byte 0x00, 0x00
.L0606AE34:
	.long gfs_NameToIdx
.L0606AE38:
	.long gfs_SetErr
.L0606AE3C:
	.long gfs_mng
.L0606AE40:
	.long gfs_DirNameRec
.L0606AE44:
	.long gfs_DirIdRec
.L0606AE48:
	.long memmove
	endlabel GFS_GetDirInfo

	glabel gfs_CloseAll
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606AF30,r12
	mov.w	.L0606AF2A,r3
	mov.l	@r12,r14
	mov.l	.L0606AF34,r11
	add	r3,r14
	bra	.L0606AE86
	mov	#0,r13
.L0606AE64:
	mov.l	@r14,r0
	cmp/eq	#1,r0
	bf	.L0606AE80
	mov	r14,r4
	add	#108,r4
	mov.l	@(56,r4),r0
	cmp/eq	#4,r0
	bf	.L0606AE7C
	mov.l	.L0606AF38,r5
	mov	r14,r6
	jsr	@r11
	mov	r14,r4
.L0606AE7C:
	bsr	GFS_Close
	mov	r14,r4
.L0606AE80:
	mov.w	.L0606AF2C,r2
	add	#1,r13
	add	r2,r14
.L0606AE86:
	mov.l	@r12,r3
	mov.l	@r3,r2
	cmp/ge	r2,r13
	bf	.L0606AE64
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_CloseAll

	glabel GFS_Open
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606AF30,r3
	mov.w	.L0606AF2E,r2
	mov.l	@r3,r14
	add	r2,r14
	mov.l	@(8,r14),r0
	tst	r0,r0
	bt/s	.L0606AEC4
	mov	r4,r13
	cmp/pz	r13
	bf	.L0606AEBC
	mov.l	@(12,r14),r0
	cmp/ge	r0,r13
	bf	.L0606AEC4
.L0606AEBC:
	bsr	gfs_SetErr
	mov	#-10,r4
	bra	.L0606AF20
	mov	#0,r0
.L0606AEC4:
	bsr	gfs_AllocHn
	nop
	mov	r0,r12
	tst	r12,r12
	bf	.L0606AED6
	bsr	gfs_SetErr
	mov	#-19,r4
	bra	.L0606AF20
	mov	#0,r0
.L0606AED6:
	mov.l	@(8,r14),r1
	tst	r1,r1
	bf	.L0606AEE0
	bra	.L0606AEFC
	mov	#0,r5
.L0606AEE0:
	mov.l	@r14,r0
	tst	r0,r0
	bf	.L0606AEF2
	mov.l	@(8,r14),r5
	mov.l	.L0606AF3C,r3
	jsr	@r3
	mov	r13,r4
	bra	.L0606AEFA
	nop
.L0606AEF2:
	mov.l	@(8,r14),r5
	mov.l	.L0606AF40,r3
	jsr	@r3
	mov	r13,r4
.L0606AEFA:
	mov	r0,r5
.L0606AEFC:
	mov	r13,r6
	bsr	gfs_InitHn
	mov	r12,r4
	mov	r0,r14
	tst	r14,r14
	bf	.L0606AF10
	bsr	gfs_SetErr
	mov	#-10,r4
	bra	.L0606AF1E
	nop
.L0606AF10:
	bsr	gfs_SetErr
	mov	#0,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606AF1E
	bra	.L0606AF20
	mov	#0,r0
.L0606AF1E:
	mov	r14,r0
.L0606AF20:
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L0606AF2A:
	.short 0x0C60
.L0606AF2C:
	.short 0x00A8
.L0606AF2E:
	.short 0x0098
.L0606AF30:
	.long gfs_mng
.L0606AF34:
	.long gfsTrn_SetFunc
.L0606AF38:
	.long gfs_TrFuncNull
.L0606AF3C:
	.long gfs_DirIdRec
.L0606AF40:
	.long gfs_DirNameRec
	endlabel GFS_Open

	glabel GFS_Close
	mov.l	r14,@-r15
	mov	r4,r14
	sts.l	pr,@-r15
	tst	r14,r14
	bt	.L0606AF5A
	mov	#1,r5
	bsr	gfs_StopIn
	mov	r14,r4
	mov.l	.L0606B158,r2
	jsr	@r2
	mov	r14,r4
.L0606AF5A:
	mov	#0,r4
	lds.l	@r15+,pr
	bra	gfs_SetErr
	mov.l	@r15+,r14
	endlabel GFS_Close

	glabel GFS_Seek
	tst	r4,r4
	mov.l	r14,@-r15
	mov	r5,r14
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	sts.l	pr,@-r15
	add	#-8,r15
	bf/s	.L0606AF7A
	mov	r6,r12
	bra	.L0606AFC0
	mov	#-11,r4
.L0606AF7A:
	mov	r4,r13
	mov.l	.L0606B15C,r3
	mov	#0,r7
	mov.l	@r3,r11
	mov	r15,r6
	add	#12,r13
	mov	r13,r5
	mov.l	@(28,r5),r2
	add	#4,r11
	shll2	r2
	shll2	r2
	add	r2,r11
	bsr	GFS_GetFileSize
	mov	r7,r5
	mov	r12,r0
	cmp/eq	#1,r0
	bf	.L0606AFA6
	mov.l	@(12,r11),r2
	jsr	@r2
	mov	r13,r4
	bra	.L0606AFBA
	add	r0,r14
.L0606AFA6:
	mov	r12,r0
	cmp/eq	#2,r0
	bf	.L0606AFB2
	mov.l	@r15,r3
	bra	.L0606AFBA
	add	r3,r14
.L0606AFB2:
	tst	r12,r12
	bt	.L0606AFBA
	bra	.L0606AFC0
	mov	#-13,r4
.L0606AFBA:
	cmp/pz	r14
	bt	.L0606AFC8
	mov	#-12,r4
.L0606AFC0:
	bsr	gfs_SetErr
	nop
	bra	.L0606AFF0
	nop
.L0606AFC8:
	mov.l	@r15,r2
	cmp/gt	r2,r14
	bf	.L0606AFD6
	bsr	gfs_SetErr
	mov	#-12,r4
	bra	.L0606AFF0
	nop
.L0606AFD6:
	mov	r14,r5
	mov.l	@(8,r11),r3
	jsr	@r3
	mov	r13,r4
	mov.l	r0,@(4,r15)
	bsr	gfs_SetErr
	mov	#0,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606AFEE
	bra	.L0606AFF0
	mov	r4,r0
.L0606AFEE:
	mov.l	@(4,r15),r0
.L0606AFF0:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel GFS_Seek

	glabel GFS_Tell
	tst	r4,r4
	sts.l	pr,@-r15
	add	#-4,r15
	bf	.L0606B00E
	mov	#-11,r4
	add	#4,r15
	bra	gfs_SetErr
	lds.l	@r15+,pr
.L0606B00E:
	add	#12,r4
	mov.l	.L0606B15C,r3
	mov	r4,r5
	mov.l	@r3,r2
	add	#28,r5
	mov.l	@r5,r1
	add	#4,r2
	shll2	r1
	shll2	r1
	add	r2,r1
	mov	r1,r2
	mov.l	r1,@r15
	mov.l	@(12,r2),r1
	jsr	@r1
	nop
	mov.l	r0,@r15
	bsr	gfs_SetErr
	mov	#0,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606B040
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	r4,r0
.L0606B040:
	mov.l	@r15,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel GFS_Tell

	glabel GFS_IsEof
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov	r4,r14
	add	#-8,r15
	tst	r14,r14
	bf	.L0606B062
	bsr	gfs_SetErr
	mov	#-11,r4
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B062:
	bsr	GFS_Tell
	mov	r14,r4
	mov	#0,r7
	mov.l	r0,@(4,r15)
	mov	r15,r6
	mov	r7,r5
	bsr	GFS_GetFileSize
	mov	r14,r4
	bsr	gfs_SetErr
	mov	#0,r4
	mov.l	@r15,r3
	mov.l	@(4,r15),r2
	cmp/ge	r3,r2
	bf	.L0606B088
	mov	#1,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B088:
	mov	#0,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel GFS_IsEof

	glabel GFS_ByteToSct
	tst	r4,r4
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	r5,@(4,r15)
	bf	.L0606B0A8
	bsr	gfs_SetErr
	mov	#-11,r4
	add	#8,r15
	lds.l	@r15+,pr
	rts
	nop
.L0606B0A8:
	mov	#0,r7
	mov	r15,r5
	bsr	GFS_GetFileSize
	mov	r7,r6
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L0606B0BE
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L0606B0BE:
	bsr	gfs_SetErr
	mov	#0,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606B0D0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov	r4,r0
.L0606B0D0:
	mov.l	@r15,r3
	mov.l	@(4,r15),r1
	add	r3,r1
	mov	r3,r0
	mov.l	.L0606B160,r3
	jsr	@r3
	add	#-1,r1
	add	#8,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel GFS_ByteToSct

	glabel GFS_GetFileSize
	tst	r4,r4
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	add	#-20,r15
	mov.l	r5,@(4,r15)
	mov.l	r6,@(12,r15)
	mov.l	r7,@(8,r15)
	bf	.L0606B0FE
	bsr	gfs_SetErr
	mov	#-11,r4
	bra	.L0606B132
	nop
.L0606B0FE:
	mov	r4,r3
	add	#12,r3
	mov	#0,r14
	mov.l	r3,@(16,r15)
	mov	r15,r2
	mov.l	.L0606B164,r3
	mov	r14,r6
	mov.l	r2,@-r15
	mov.l	r14,@-r15
	mov.l	@(16,r15),r1
	mov.l	r1,@-r15
	mov.l	@(24,r15),r2
	mov.l	r2,@-r15
	mov.l	@(20,r15),r7
	mov.l	@(32,r15),r4
	jsr	@r3
	mov	r14,r5
	add	#16,r15
	mov.l	@r15,r0
	tst	#8,r0
	bt	.L0606B132
	mov.l	@r15,r0
	tst	#16,r0
	bt	.L0606B132
	mov.l	@(4,r15),r1
	mov.l	r14,@r1
.L0606B132:
	bsr	gfs_SetErr
	mov	#0,r4
	add	#20,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel GFS_GetFileSize

	glabel GFS_GetFileInfo
	tst	r4,r4
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	add	#-20,r15
	mov.l	r6,@(12,r15)
	mov.l	r7,@(8,r15)
	mov.l	@(28,r15),r14
	bf	.L0606B168
	bsr	gfs_SetErr
	mov	#-11,r4
	bra	.L0606B1B0
	nop
	.byte 0x00, 0x00
.L0606B158:
	.long gfs_CloseHn
.L0606B15C:
	.long gfs_mng
.L0606B160:
	.long _divlu
.L0606B164:
	.long gfs_GetFinfo
.L0606B168:
	mov	r4,r3
	add	#12,r3
	mov.l	r3,@(16,r15)
	mov	#0,r7
	mov.l	r14,@-r15
	mov.l	@(16,r15),r2
	mov.l	.L0606B264,r3
	mov.l	r2,@-r15
	mov	r15,r1
	add	#12,r1
	mov.l	r1,@-r15
	mov	r15,r2
	add	#12,r2
	mov.l	r2,@-r15
	mov.l	@(32,r15),r4
	jsr	@r3
	mov	r7,r6
	tst	r14,r14
	bt/s	.L0606B198
	add	#16,r15
	mov.l	@r14,r2
	mov	#-7,r3
	and	r3,r2
	mov.l	r2,@r14
.L0606B198:
	mov.l	@(8,r15),r0
	tst	r0,r0
	bt	.L0606B1B0
	mov.l	@(8,r15),r1
	mov.l	@r15,r3
	add	#-1,r3
	mov.l	@(4,r15),r2
	shll8	r3
	shll2	r3
	shll	r3
	add	r2,r3
	mov.l	r3,@r1
.L0606B1B0:
	bsr	gfs_SetErr
	mov	#0,r4
	add	#20,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel GFS_GetFileInfo

	glabel GFS_GetNumCdbuf
	tst	r4,r4
	bf	.L0606B1C4
	bra	gfs_SetErr
	mov	#-11,r4
.L0606B1C4:
	mov.l	.L0606B268,r2
	jmp	@r2
	nop
	endlabel GFS_GetNumCdbuf

	glabel GFS_Load
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	r5,@r15
	mov.l	r6,@(4,r15)
	bsr	GFS_Open
	mov	r7,r13
	mov	r0,r14
	tst	r14,r14
	bf	.L0606B1EC
	mov.l	.L0606B26C,r3
	mov.l	@r3,r0
	mov.w	.L0606B25C,r1
	mov.l	@(r0,r1),r0
	bra	.L0606B252
	nop
.L0606B1EC:
	mov.l	@r15,r5
	mov	#0,r6
	bsr	GFS_Seek
	mov	r14,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606B206
	mov	#-15,r4
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	bra	gfs_SetErr
	mov.l	@r15+,r14
.L0606B206:
	mov	r14,r5
	add	#12,r5
	mov.l	@(16,r5),r6
	mov	r6,r4
	tst	r4,r4
	bf	.L0606B216
	mov.w	.L0606B25E,r4
	mov.w	.L0606B260,r6
.L0606B216:
	mov	r13,r0
	mov.l	@r15,r3
	cmp/eq	#-1,r0
	mov.l	@(20,r5),r5
	bf/s	.L0606B226
	sub	r3,r5
	mul.l	r4,r5
	sts	macl,r13
.L0606B226:
	mov	r13,r1
	mov.l	.L0606B270,r3
	add	r4,r1
	add	#-1,r1
	jsr	@r3
	mov	r6,r0
	mov	r0,r4
	cmp/ge	r4,r5
	bf/s	.L0606B23C
	mov	r13,r7
	mov	r4,r5
.L0606B23C:
	mov.l	@(4,r15),r6
	bsr	GFS_Fread
	mov	r14,r4
	mov	r0,r13
	bsr	GFS_Close
	mov	r14,r4
	cmp/pz	r13
	bf	.L0606B250
	bsr	gfs_SetErr
	mov	#0,r4
.L0606B250:
	mov	r13,r0
.L0606B252:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L0606B25C:
	.short 0x00C0
.L0606B25E:
	.short 0x0914
.L0606B260:
	.short 0x0800
	.byte 0x00, 0x00
.L0606B264:
	.long gfs_GetFinfo
.L0606B268:
	.long gfsAcc_CountSctAll
.L0606B26C:
	.long gfs_mng
.L0606B270:
	.long _divlspnm
	endlabel GFS_Load

	glabel GFS_Fread
	mov.l	r14,@-r15
	mov	r4,r14
	mov.l	r13,@-r15
	tst	r14,r14
	sts.l	pr,@-r15
	add	#-8,r15
	bf	.L0606B28A
	bsr	gfs_SetErr
	mov	#-11,r4
	bra	.L0606B2D8
	nop
.L0606B28A:
	bsr	GFS_NwFread
	mov	r14,r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606B298
	bra	.L0606B2D8
	mov	r4,r0
.L0606B298:
	mov.l	.L0606B460,r5
	bsr	GFS_SetReadPara
	mov	r14,r4
	mov	r0,r13
	bsr	gfs_WaitNw
	mov	r14,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606B2B4
	bsr	gfs_SetErr
	nop
	mov.l	r0,@r15
	bra	.L0606B2CC
	nop
.L0606B2B4:
	mov	r15,r6
	mov	r15,r5
	add	#4,r5
	bsr	GFS_NwGetStat
	mov	r14,r4
	bsr	gfs_SetErr
	mov	#0,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606B2CC
	bra	.L0606B2D8
	mov	r4,r0
.L0606B2CC:
	cmp/pz	r13
	bf	.L0606B2D6
	mov	r13,r5
	bsr	GFS_SetReadPara
	mov	r14,r4
.L0606B2D6:
	mov.l	@r15,r0
.L0606B2D8:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel GFS_Fread

	glabel gfs_WaitNw
	mov	#0,r7
	mov.l	r14,@-r15
	mov	r7,r6
	mov.l	r13,@-r15
	mov	r7,r5
	mov.l	r12,@-r15
	mov	r4,r13
	mov.l	r11,@-r15
	mov	r4,r12
	mov.l	r10,@-r15
	mov	r4,r11
	sts.l	pr,@-r15
	add	#40,r12
	add	#-4,r15
	add	#108,r11
	mov	r15,r3
	mov.l	r3,@-r15
	bsr	GFS_GetFileInfo
	mov	r13,r4
	add	#4,r15
	mov.l	@r15,r0
	tst	#64,r0
	bt	.L0606B314
	bra	.L0606B316
	mov	#-1,r14
.L0606B314:
	mov	#0,r14
.L0606B316:
	mov.l	.L0606B464,r10
.L0606B318:
	bsr	GFS_NwExecOne
	mov	r13,r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606B358
	cmp/pz	r4
	bf	.L0606B358
	mov.l	@(52,r11),r0
	cmp/eq	#6,r0
	bf	.L0606B344
	mov.l	@r12,r0
	tst	r0,r0
	bf	.L0606B358
	mov.l	@(44,r12),r3
	mov.l	.L0606B468,r1
	mov.l	@r1,r2
	cmp/ge	r3,r2
	bf	.L0606B358
	mov.l	.L0606B46C,r3
	mov.l	@r3,r0
	cmp/eq	#2,r0
	bf	.L0606B358
.L0606B344:
	mov.l	@(8,r11),r0
	tst	r0,r0
	bf	.L0606B318
	cmp/pz	r14
	bf	.L0606B318
	add	#1,r14
	cmp/gt	r10,r14
	bf	.L0606B318
	bra	.L0606B35A
	mov	#-22,r0
.L0606B358:
	mov	r4,r0
.L0606B35A:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_WaitNw

	glabel GFS_NwFread
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r14
	mov.l	r12,@-r15
	tst	r14,r14
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	add	#-20,r15
	mov.l	r5,@(4,r15)
	mov.l	r6,@(8,r15)
	mov.l	r7,@(12,r15)
	bf/s	.L0606B38E
	mov	#0,r11
	bra	.L0606B430
	mov	#-11,r4
.L0606B38E:
	mov	r14,r10
	add	#12,r10
	mov	r14,r13
	mov.l	r10,@(16,r15)
	mov	r10,r3
	mov.l	@(20,r3),r8
	add	#108,r13
	bsr	GFS_Tell
	mov	r14,r4
	mov.l	@(4,r15),r3
	mov	r8,r4
	sub	r0,r4
	cmp/ge	r3,r4
	bt	.L0606B3AE
	bra	.L0606B3B0
	mov	r4,r12
.L0606B3AE:
	mov.l	@(4,r15),r12
.L0606B3B0:
	cmp/pz	r12
	bt	.L0606B3B8
	bra	.L0606B430
	mov	#-17,r4
.L0606B3B8:
	mov.l	@(4,r14),r0
	tst	r0,r0
	bf/s	.L0606B3C8
	mov	#1,r9
	mov	r12,r5
	bsr	gfs_SetupFlow
	mov	r10,r4
	mov	r9,r11
.L0606B3C8:
	mov.l	r9,@(4,r14)
	mov	r15,r2
	mov.l	r2,@-r15
	mov	#0,r7
	mov	r7,r6
	mov	r7,r5
	bsr	GFS_GetFileInfo
	mov	r14,r4
	add	#4,r15
	mov.l	@r15,r0
	tst	#64,r0
	bt	.L0606B3F8
	mov.l	.L0606B470,r3
	mov	#0,r5
	jsr	@r3
	mov	r13,r4
	mov.l	.L0606B474,r2
	mov	#1,r7
	mov	#0,r6
	mov	r6,r5
	jsr	@r2
	mov	r13,r4
	bra	.L0606B420
	nop
.L0606B3F8:
	mov.l	@(52,r13),r4
	tst	r4,r4
	bt	.L0606B404
	mov	r4,r0
	cmp/eq	#6,r0
	bf	.L0606B420
.L0606B404:
	mov.l	.L0606B470,r2
	mov	r12,r5
	jsr	@r2
	mov	r13,r4
	mov.l	@(12,r15),r6
	mov	#1,r7
	mov.l	@(8,r15),r5
	mov.l	.L0606B474,r3
	jsr	@r3
	mov	r13,r4
	mov.l	.L0606B478,r2
	jsr	@r2
	mov	r13,r4
	mov	#1,r11
.L0606B420:
	tst	r11,r11
	bf	.L0606B428
	bra	.L0606B430
	mov	#-16,r4
.L0606B428:
	bsr	gfs_AddSvr
	mov	r14,r4
	mov.l	r9,@(8,r14)
	mov	#0,r4
.L0606B430:
	bsr	gfs_SetErr
	nop
	add	#20,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel GFS_NwFread

	glabel GFS_NwCdRead
	mov.l	r14,@-r15
	mov	r4,r14
	mov.l	r13,@-r15
	tst	r14,r14
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	r5,@r15
	bf	.L0606B47C
	bra	.L0606B48A
	mov	#-11,r4
	.byte 0x00, 0x00
.L0606B460:
	.long 0x7FFFFFFF
.L0606B464:
	.long 0x000493E0
.L0606B468:
	.long gfs_last_cd_fad
.L0606B46C:
	.long gfs_last_cd_stat
.L0606B470:
	.long gfsTrn_Request
.L0606B474:
	.long gfsTrn_SetBuf
.L0606B478:
	.long gfsTrn_Activate
.L0606B47C:
	mov	r14,r13
	add	#12,r13
	mov.l	r13,@(4,r15)
	mov.l	@(4,r14),r1
	tst	r1,r1
	bt	.L0606B496
	mov	#-16,r4
.L0606B48A:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r13
	bra	gfs_SetErr
	mov.l	@r15+,r14
.L0606B496:
	mov.l	@(4,r15),r2
	mov.l	@(20,r2),r8
	bsr	GFS_Tell
	mov	r14,r4
	mov	r8,r4
	mov.l	@r15,r3
	sub	r0,r4
	cmp/ge	r3,r4
	bt	.L0606B4AC
	bra	.L0606B4AE
	mov	r4,r5
.L0606B4AC:
	mov.l	@r15,r5
.L0606B4AE:
	bsr	gfs_SetupFlow
	mov	r13,r4
	mov	#2,r3
	mov.l	r3,@(4,r14)
	mov	#1,r2
	mov.l	r2,@(8,r14)
	bsr	gfs_AddSvr
	mov	r14,r4
	mov	#0,r4
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r13
	bra	gfs_SetErr
	mov.l	@r15+,r14
	.byte 0x7F, 0x08, 0x4F, 0x26, 0x68, 0xF6, 0x6D, 0xF6, 0x00, 0x0B, 0x6E, 0xF6
	endlabel GFS_NwCdRead

	glabel GFS_NwIsComplete
	sts.l	pr,@-r15
	mov	r4,r1
	add	#-4,r15
	tst	r1,r1
	mov.l	r4,@r15
	bf	.L0606B4F0
	bsr	gfs_SetErr
	mov	#-11,r4
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#1,r0
.L0606B4F0:
	bsr	gfs_SetErr
	mov	#0,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606B502
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#1,r0
.L0606B502:
	mov.l	@r15,r0
	mov.l	@(8,r0),r1
	tst	r1,r1
	bf	.L0606B512
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#1,r0
.L0606B512:
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel GFS_NwIsComplete

	glabel GFS_NwStop
	mov.l	r14,@-r15
	mov	r4,r14
	mov.l	r13,@-r15
	tst	r14,r14
	sts.l	pr,@-r15
	add	#-4,r15
	bf	.L0606B536
	mov	#-11,r4
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	bra	gfs_SetErr
	mov.l	@r15+,r14
.L0606B536:
	mov	#0,r13
	mov.l	r13,@(4,r14)
	mov.l	r13,@(8,r14)
	bsr	gfs_DelSvr
	mov	r14,r4
	bsr	gfs_GetGmode
	mov	r14,r4
	tst	r0,r0
	bf/s	.L0606B54E
	mov	r14,r4
	bra	.L0606B550
	mov	r13,r5
.L0606B54E:
	mov	#1,r5
.L0606B550:
	bsr	gfs_StopIn
	nop
	bsr	GFS_Tell
	mov	r14,r4
	mov.l	r0,@r15
	bsr	gfs_SetErr
	mov	#0,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606B568
	bra	.L0606B56A
	mov	r4,r0
.L0606B568:
	mov.l	@r15,r0
.L0606B56A:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel GFS_NwStop

	glabel GFS_NwGetStat
	mov.l	r14,@-r15
	mov	r4,r14
	mov.l	r13,@-r15
	tst	r14,r14
	sts.l	pr,@-r15
	add	#-8,r15
	bf/s	.L0606B58C
	mov	r6,r13
	bsr	gfs_SetErr
	mov	#-11,r4
	bra	.L0606B5C8
	nop
.L0606B58C:
	mov	r14,r3
	add	#108,r3
	mov.l	r3,@(4,r15)
	mov	#0,r7
	mov.l	@(4,r14),r2
	mov	r15,r3
	mov.l	r2,@r5
	mov	r7,r6
	mov.l	r3,@-r15
	mov	r7,r5
	bsr	GFS_GetFileInfo
	mov	r14,r4
	add	#4,r15
	mov.l	@r15,r0
	tst	#64,r0
	bt	.L0606B5B2
	mov	#0,r3
	bra	.L0606B5C8
	mov.l	r3,@r13
.L0606B5B2:
	mov.l	@(4,r14),r0
	cmp/eq	#2,r0
	bf	.L0606B5C2
	mov.l	.L0606B68C,r2
	jsr	@r2
	mov	r14,r4
	bra	.L0606B5C8
	mov.l	r0,@r13
.L0606B5C2:
	mov.l	@(4,r15),r2
	mov.l	@(8,r2),r3
	mov.l	r3,@r13
.L0606B5C8:
	bsr	gfs_SetErr
	mov	#0,r4
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel GFS_NwGetStat

	glabel gfs_ChkCdStat
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov	r4,r14
	add	#12,r4
	mov	r4,r5
	add	#28,r5
	mov.l	@r5,r0
	tst	r0,r0
	bf	.L0606B5F8
	mov.l	.L0606B690,r3
	jsr	@r3
	nop
	cmp/eq	#2,r0
	bf/s	.L0606B5F8
	mov	r0,r4
	mov	#1,r3
	mov.l	r3,@(8,r14)
.L0606B5F8:
	mov.l	@(8,r14),r0
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel gfs_ChkCdStat

	glabel GFS_NwExecOne
	mov.l	r14,@-r15
	mov	r4,r14
	sts.l	pr,@-r15
	tst	r14,r14
	add	#-4,r15
	bf	.L0606B618
	bsr	gfs_SetErr
	mov	#-11,r4
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B618:
	mov.l	@(8,r14),r0
	tst	r0,r0
	bt	.L0606B6AE
	mov.l	.L0606B694,r3
	mov.l	@r3,r0
	cmp/eq	#1,r0
	bf	.L0606B640
	mov	r15,r5
	mov.l	.L0606B698,r1
	jsr	@r1
	mov	r14,r4
	mov.l	.L0606B694,r3
	mov.l	@r3,r0
	cmp/eq	#1,r0
	bf	.L0606B640
	mov.l	@(8,r14),r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B640:
	mov.l	@(8,r14),r0
	cmp/eq	#-1,r0
	bf	.L0606B652
	bsr	gfs_ChkCdStat
	mov	r14,r4
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B652:
	bsr	gfs_ExecFlow
	mov	r14,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606B666
	mov	r4,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B666:
	mov	#92,r0
	mov.l	@(r0,r14),r1
	tst	r1,r1
	bt	.L0606B6AE
	bsr	gfs_ExecTrans
	mov	r14,r4
	cmp/eq	#6,r0
	bf/s	.L0606B6AE
	mov	r0,r4
	bsr	gfs_ExecFlow
	mov	r14,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606B69C
	mov	r4,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B68C:
	.long gfsAcc_CountSctAll
.L0606B690:
	.long gfsFlow_PlayNoChg
.L0606B694:
	.long gfs_scu_dma_busy
.L0606B698:
	.long gfsTrn_Step
.L0606B69C:
	bsr	gfs_IsFlowEnd
	mov	r14,r4
	tst	r0,r0
	bt	.L0606B6AE
	mov	#0,r4
	mov.l	r4,@(4,r14)
	mov.l	r4,@(8,r14)
	bsr	gfs_DelSvr
	mov	r14,r4
.L0606B6AE:
	bsr	gfs_SetErr
	mov	#0,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606B6C2
	mov	r4,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B6C2:
	mov.l	@(8,r14),r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel GFS_NwExecOne

	glabel GFS_NwExecServer
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov	#0,r12
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L0606B8EC,r3
	mov.l	r4,@r15
	mov.l	@r3,r13
	add	#52,r13
	bra	.L0606B6FE
	mov	r12,r14
.L0606B6E4:
	mov	r14,r4
	shll2	r4
	mov	r13,r3
	add	r3,r4
	bsr	GFS_NwExecOne
	mov.l	@r4,r4
	mov	r0,r4
	cmp/pz	r4
	bf	.L0606B706
	tst	r4,r4
	bf	.L0606B6FC
	add	#-1,r14
.L0606B6FC:
	add	#1,r14
.L0606B6FE:
	mov	#96,r0
	mov.l	@(r0,r13),r3
	cmp/ge	r3,r14
	bf	.L0606B6E4
.L0606B706:
	mov	#96,r0
	mov.l	@(r0,r13),r1
	tst	r1,r1
	bf	.L0606B716
	mov.l	@r15,r2
	mov.l	r12,@r2
	bra	.L0606B728
	mov	r12,r4
.L0606B716:
	mov	r4,r0
	mov.l	@r15,r2
	cmp/eq	#-20,r0
	mov.l	@r13,r3
	mov.l	r3,@r2
	bf	.L0606B728
	cmp/pl	r14
	bf	.L0606B728
	mov	#1,r4
.L0606B728:
	mov	r4,r0
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel GFS_NwExecServer

	glabel GFS_SetGmode
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov	r4,r14
	add	#-12,r15
	tst	r14,r14
	mov.l	r5,@(4,r15)
	bf	.L0606B750
	bsr	gfs_SetErr
	mov	#-11,r4
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B750:
	mov	r15,r2
	mov	#0,r7
	mov.l	r2,@-r15
	mov	r7,r6
	mov	r7,r5
	bsr	GFS_GetFileInfo
	mov	r14,r4
	add	#4,r15
	mov.l	@r15,r0
	tst	#64,r0
	bt	.L0606B770
	mov	#-17,r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B770:
	mov	r14,r4
	add	#12,r4
	mov	#76,r0
	mov.l	@(r0,r4),r3
	mov.l	r3,@(8,r15)
	mov	#76,r0
	mov.l	@(4,r15),r2
	mov.l	r2,@(r0,r4)
	bsr	gfs_SetErr
	mov	#0,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606B794
	mov	r4,r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B794:
	mov.l	@(8,r15),r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel GFS_SetGmode

	glabel GFS_SetTmode
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov	r4,r14
	add	#-8,r15
	tst	r14,r14
	mov.l	r5,@(4,r15)
	bf	.L0606B7B8
	bsr	gfs_SetErr
	mov	#-11,r4
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B7B8:
	mov	r15,r2
	mov	#0,r7
	mov.l	r2,@-r15
	mov	r7,r6
	mov	r7,r5
	bsr	GFS_GetFileInfo
	mov	r14,r4
	add	#4,r15
	mov.l	@r15,r0
	tst	#64,r0
	bt	.L0606B7D8
	mov	#-17,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B7D8:
	mov.l	@(4,r15),r5
	mov	r14,r4
	mov.l	.L0606B8F0,r3
	add	#12,r4
	mov	r14,r4
	jsr	@r3
	add	#108,r4
	mov.l	r0,@(4,r15)
	bsr	gfs_SetErr
	mov	#0,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606B7FC
	mov	r4,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B7FC:
	mov.l	@(4,r15),r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel GFS_SetTmode

	glabel GFS_SetReadPara
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov	r4,r14
	add	#-12,r15
	tst	r14,r14
	mov.l	r5,@(4,r15)
	bf	.L0606B820
	bsr	gfs_SetErr
	mov	#-11,r4
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B820:
	mov	r15,r2
	mov	#0,r7
	mov.l	r2,@-r15
	mov	r7,r6
	mov	r7,r5
	bsr	GFS_GetFileInfo
	mov	r14,r4
	add	#4,r15
	mov.l	@r15,r0
	tst	#64,r0
	bt	.L0606B840
	mov	#-17,r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B840:
	mov	r14,r4
	add	#12,r4
	mov	#92,r0
	mov.l	@(r0,r4),r3
	mov.l	r3,@(8,r15)
	mov	#92,r0
	mov.l	@(4,r15),r2
	mov.l	r2,@(r0,r4)
	bsr	gfs_SetErr
	mov	#0,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606B864
	mov	r4,r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B864:
	mov.l	@(8,r15),r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel GFS_SetReadPara

	glabel GFS_SetTransPara
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov	r4,r14
	add	#-8,r15
	tst	r14,r14
	mov.l	r5,@(4,r15)
	bf	.L0606B888
	bsr	gfs_SetErr
	mov	#-11,r4
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B888:
	mov	r15,r2
	mov	#0,r7
	mov.l	r2,@-r15
	mov	r7,r6
	mov	r7,r5
	bsr	GFS_GetFileInfo
	mov	r14,r4
	add	#4,r15
	mov.l	@r15,r0
	tst	#64,r0
	bt	.L0606B8A8
	mov	#-17,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B8A8:
	mov.l	@(4,r15),r5
	mov	r14,r4
	mov.l	.L0606B8F4,r3
	jsr	@r3
	add	#108,r4
	mov.l	r0,@(4,r15)
	bsr	gfs_SetErr
	mov	#0,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606B8C8
	mov	r4,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606B8C8:
	mov.l	@(4,r15),r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel GFS_SetTransPara

	glabel GFS_SetTrFunc
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov	r4,r14
	add	#-4,r15
	tst	r14,r14
	mov.l	r5,@r15
	bf	.L0606B8F8
	mov	#-11,r4
	add	#4,r15
	lds.l	@r15+,pr
	bra	gfs_SetErr
	mov.l	@r15+,r14
	.byte 0x00, 0x00
.L0606B8EC:
	.long gfs_mng
.L0606B8F0:
	.long gfsTrn_SetMode
.L0606B8F4:
	.long gfsTrn_SetTsize
.L0606B8F8:
	mov.w	.L0606B9F0,r7
	mov	#0,r5
	mov.l	.L0606B9FC,r2
	mov	r14,r4
	mov.l	.L0606B9F8,r6
	jsr	@r2
	add	#108,r4
	mov	#4,r5
	mov.l	.L0606BA00,r3
	mov	r14,r4
	jsr	@r3
	add	#108,r4
	mov.l	@r15,r5
	mov	r14,r4
	mov.l	.L0606BA04,r3
	mov	r14,r6
	add	#4,r15
	lds.l	@r15+,pr
	jmp	@r3
	mov.l	@r15+,r14
	endlabel GFS_SetTrFunc

	glabel GFS_StartTrans
	mov.l	r14,@-r15
	tst	r4,r4
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	r5,@r15
	bf	.L0606B936
	bsr	gfs_SetErr
	mov	#-11,r4
	bra	.L0606B958
	mov	#0,r0
.L0606B936:
	mov	r4,r5
	add	#12,r5
	mov	r5,r13
	add	#28,r13
	mov	#120,r0
	mov.l	@r13,r1
	tst	r1,r1
	bf/s	.L0606B950
	mov.l	@(r0,r4),r14
	mov.l	.L0606BA08,r3
	mov	r13,r5
	jsr	@r3
	mov	r14,r4
.L0606B950:
	mov.l	@r15,r2
	mov.l	@(4,r14),r3
	mov.l	r3,@r2
	mov.l	@r14,r0
.L0606B958:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel GFS_StartTrans

	glabel GFS_CdMovePickup
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r14
	sts.l	pr,@-r15
	tst	r14,r14
	bf	.L0606B972
	bra	.L0606B99C
	mov	#-11,r4
.L0606B972:
	mov	r14,r13
	add	#12,r13
	mov	r13,r4
	add	#28,r4
	mov.l	@r4,r0
	tst	r0,r0
	bf	.L0606B99A
	bsr	GFS_Tell
	mov	r14,r4
	mov.l	.L0606BA0C,r2
	mov	r0,r5
	jsr	@r2
	mov	r13,r4
	mov	r0,r4
	tst	r4,r4
	bf	.L0606B99C
	mov.l	.L0606BA10,r3
	mov.w	.L0606B9F2,r0
	mov.l	@r3,r2
	mov.l	r14,@(r0,r2)
.L0606B99A:
	mov	#0,r4
.L0606B99C:
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	bra	gfs_SetErr
	mov.l	@r15+,r14
	.byte 0x4F, 0x26, 0x6D, 0xF6, 0x00, 0x0B, 0x6E, 0xF6
	endlabel GFS_CdMovePickup

	glabel GFS_SetErrFunc
	mov.l	.L0606BA10,r6
	mov.l	@r6,r3
	mov.w	.L0606B9F4,r0
	mov.l	r4,@(r0,r3)
	mov.l	@r6,r3
	add	#4,r0
	mov.l	r5,@(r0,r3)
	bra	gfs_SetErr
	mov	#0,r4
	endlabel GFS_SetErrFunc

	glabel GFS_GetErrStat
	mov	r4,r1
	mov.w	.L0606B9F4,r0
	sts.l	pr,@-r15
	mov.l	.L0606BA10,r3
	mov.l	@r3,r2
	mov.l	.L0606BA14,r3
	add	r0,r2
	jsr	@r3
	mov	#12,r0
	lds.l	@r15+,pr
	rts
	nop
	endlabel GFS_GetErrStat

	glabel gfs_ConvSesFad
	mov.l	.L0606BA18,r1
	mov.b	@r1,r0
	extu.b	r0,r0
	cmp/eq	#1,r0
	movt	r0
	cmp/eq	#1,r0
	bf	.L0606B9EC
	mov.l	.L0606BA1C,r3
	mov.b	@r3,r2
	extu.b	r2,r2
	add	r2,r4
.L0606B9EC:
	rts
	mov	r4,r0
.L0606B9F0:
	.short 0x0800
.L0606B9F2:
	.short 0x00A8
.L0606B9F4:
	.short 0x00B8
	.byte 0x00, 0x00
.L0606B9F8:
	.long 0x000FFFFF
.L0606B9FC:
	.long gfsTrn_SetBuf
.L0606BA00:
	.long gfsTrn_SetMode
.L0606BA04:
	.long gfsTrn_SetFunc
.L0606BA08:
	.long gfcf_StartTrans
.L0606BA0C:
	.long gfsFlow_Seek
.L0606BA10:
	.long gfs_mng
.L0606BA14:
	.long _quick_odd_mvn
.L0606BA18:
	.long BIOS_WORK_HI + 0x8CC
.L0606BA1C:
	.long BIOS_WORK_HI + 0x8CD
	endlabel gfs_ConvSesFad

	glabel gfs_ReadRootDir
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606BADC,r3
	mov.b	@r3,r0
	extu.b	r0,r0
	cmp/eq	#1,r0
	movt	r0
	cmp/eq	#1,r0
	bf/s	.L0606BA82
	mov	r4,r14
	tst	r14,r14
	bt	.L0606BA40
	mov.l	.L0606BAE0,r2
	jsr	@r2
	mov	#1,r4
.L0606BA40:
	mov.l	.L0606BAE4,r3
	jsr	@r3
	nop
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606BA56
	lds.l	@r15+,pr
	mov	#-7,r4
	mov.l	@r15+,r13
	bra	gfs_SetErr
	mov.l	@r15+,r14
.L0606BA56:
	mov	#0,r13
	mov.l	.L0606BAE8,r3
	mov.l	@r3,r4
	mov.w	.L0606BAD8,r2
	add	r2,r4
	mov.l	r13,@(8,r4)
	mov.l	r13,@(12,r4)
	mov.l	r13,@(4,r4)
	bsr	GFS_SetDir
	mov	r13,r4
	tst	r14,r14
	bt	.L0606BA74
	mov.l	.L0606BAE0,r3
	jsr	@r3
	mov	#0,r4
.L0606BA74:
	mov.l	.L0606BAEC,r2
	mov.w	@r2,r4
	extu.w	r4,r4
	bsr	GFS_LoadDir
	mov	r14,r5
	bra	.L0606BAAA
	mov	r0,r13
.L0606BA82:
	tst	r14,r14
	bf	.L0606BA96
	mov.l	.L0606BAE4,r2
	jsr	@r2
	nop
	mov	r0,r13
	cmp/pz	r13
	bt	.L0606BAAA
	bra	.L0606BAA2
	mov	#-7,r4
.L0606BA96:
	bsr	gfs_LoadRootDir
	mov	r14,r4
	mov	r0,r13
	cmp/pl	r13
	bt	.L0606BAAA
	mov	r13,r4
.L0606BAA2:
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	bra	gfs_SetErr
	mov.l	@r15+,r14
.L0606BAAA:
	bsr	GFS_SetDir
	mov	r14,r4
	bsr	gfs_SetErr
	mov	#0,r4
	mov	r13,r0
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_ReadRootDir

	glabel gfs_TrFuncNull
	rts
	mov	#0,r0
	endlabel gfs_TrFuncNull

	glabel gfs_InitFuncTbl
	mov.l	.L0606BAE8,r3
	mov.l	@r3,r4
	mov.l	.L0606BAF0,r2
	add	#4,r4
	mov.l	.L0606BAF4,r1
	mov.l	r2,@r4
	mov.l	r1,@(4,r4)
	mov.l	.L0606BAF8,r2
	mov.l	.L0606BAFC,r1
	mov.l	r2,@(8,r4)
	rts
	mov.l	r1,@(12,r4)
.L0606BAD8:
	.short 0x0098
	.byte 0x00, 0x00
.L0606BADC:
	.long BIOS_WORK_HI + 0x8CC
.L0606BAE0:
	.long gfcd_Reserve
.L0606BAE4:
	.long gfs_CdChgRootDir
.L0606BAE8:
	.long gfs_mng
.L0606BAEC:
	.long BIOS_WORK_HI + 0x8CE
.L0606BAF0:
	.long gfsFlow_Read
.L0606BAF4:
	.long gfsFlow_StopRead
.L0606BAF8:
	.long gfsFlow_SetSctPos
.L0606BAFC:
	.long gfsFlow_GetSctPos
	endlabel gfs_InitFuncTbl

	glabel gfs_InitMng
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov	r4,r13
	mov.l	.L0606BC20,r14
	mov.l	@r14,r3
	bsr	gfs_InitFuncTbl
	mov.l	r4,@r3
	mov.l	@r14,r3
	mov	#0,r4
	mov.w	.L0606BC14,r0
	cmp/ge	r13,r4
	mov.l	r4,@(r0,r3)
	add	#32,r0
	mov.l	@r14,r3
	mov	r3,r2
	mov.l	r4,@(r0,r2)
	add	#-12,r0
	mov.l	r4,@(r0,r3)
	add	#8,r0
	mov.l	@r14,r3
	mov	r3,r2
	mov.l	r4,@(r0,r2)
	add	#-4,r0
	mov.l	r4,@(r0,r3)
	add	#12,r0
	mov.l	@r14,r3
	mov.l	r4,@(r0,r3)
	mov.l	@r14,r3
	add	#12,r0
	mov.l	r4,@(r0,r3)
	mov.l	@r14,r5
	mov.w	.L0606BC16,r3
	add	r3,r5
	bt/s	.L0606BB54
	mov	r4,r6
.L0606BB48:
	mov.l	r4,@r5
	add	#1,r6
	mov.w	.L0606BC18,r3
	cmp/ge	r13,r6
	bf/s	.L0606BB48
	add	r3,r5
.L0606BB54:
	mov.l	@r14,r5
	mov.w	.L0606BC1A,r3
	mov.w	.L0606BC1C,r2
	add	r3,r5
	mov.l	r4,@r5
	mov.l	r4,@(12,r5)
	mov.l	r4,@(8,r5)
	mov.l	r4,@(4,r5)
	mov.l	r4,@(16,r5)
	mov.l	@r14,r5
	add	r2,r5
	mov.l	r4,@r5
	mov.l	r4,@(12,r5)
	mov.l	r4,@(8,r5)
	mov.l	r4,@(4,r5)
	mov.l	r4,@(16,r5)
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_InitMng

	glabel gfs_CountFiles
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov	r4,r13
	mov.l	r11,@-r15
	mov	#1,r12
	mov.l	r10,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606BC24,r10
	mov.l	.L0606BC28,r11
	bra	.L0606BBBA
	mov	#0,r14
.L0606BB94:
	mov.l	@r13,r0
	tst	r0,r0
	bf	.L0606BBA4
	mov.l	@(8,r13),r5
	jsr	@r11
	mov	r14,r4
	bra	.L0606BBAA
	nop
.L0606BBA4:
	mov.l	@(8,r13),r5
	jsr	@r10
	mov	r14,r4
.L0606BBAA:
	mov	r0,r4
	tst	r12,r4
	bt	.L0606BBB8
	tst	r12,r12
	bt	.L0606BBB8
	bra	.L0606BBC0
	nop
.L0606BBB8:
	add	#1,r14
.L0606BBBA:
	mov.l	@(4,r13),r3
	cmp/ge	r3,r14
	bf	.L0606BB94
.L0606BBC0:
	mov.l	@(4,r13),r1
	cmp/gt	r1,r14
	bf	.L0606BBCA
	bra	.L0606BBCE
	mov	#0,r0
.L0606BBCA:
	mov	r14,r0
	add	#1,r0
.L0606BBCE:
	lds.l	@r15+,pr
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_CountFiles

	glabel gfs_AllocHn
	mov.l	.L0606BC20,r3
	mov	#0,r7
	mov.w	.L0606BC16,r4
	mov.l	@r3,r6
	add	r6,r4
	bra	.L0606BBF6
	mov	r7,r5
.L0606BBEA:
	mov.l	@r4,r0
	tst	r0,r0
	bt	.L0606BBFC
	mov.w	.L0606BC18,r2
	add	#1,r5
	add	r2,r4
.L0606BBF6:
	mov.l	@r6,r3
	cmp/ge	r3,r5
	bf	.L0606BBEA
.L0606BBFC:
	mov.l	@r6,r1
	cmp/eq	r1,r5
	bf	.L0606BC06
	bra	.L0606BC0A
	mov	r7,r4
.L0606BC06:
	mov	#1,r3
	mov.l	r3,@r4
.L0606BC0A:
	rts
	mov	r4,r0
	endlabel gfs_AllocHn

	glabel gfs_FreeHn
	mov	#0,r3
	rts
	mov.l	r3,@r4
.L0606BC14:
	.short 0x0094
.L0606BC16:
	.short 0x0C60
.L0606BC18:
	.short 0x00A8
.L0606BC1A:
	.short 0x0438
.L0606BC1C:
	.short 0x044C
	.byte 0x00, 0x00
.L0606BC20:
	.long gfs_mng
.L0606BC24:
	.long gfs_DirNameAtr
.L0606BC28:
	.long gfs_DirIdAtr
	endlabel gfs_FreeHn

	glabel gfs_StopIn
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov	r4,r13
	mov.w	.L0606BD20,r0
	mov	r13,r14
	mov.l	r11,@-r15
	add	#12,r14
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	.L0606BD28,r11
	mov.l	r5,@r15
	mov.l	@r11,r4
	mov.l	@(r0,r4),r3
	cmp/eq	r13,r3
	bf/s	.L0606BC5A
	mov	#0,r12
	mov	#-1,r5
	mov.l	.L0606BD2C,r3
	mov.w	.L0606BD20,r0
	mov.l	r12,@(r0,r4)
	jsr	@r3
	mov	r13,r4
.L0606BC5A:
	mov.l	@r11,r5
	mov.w	.L0606BD22,r0
	mov.l	@(r0,r5),r5
	cmp/eq	r13,r5
	bt/s	.L0606BC6E
	mov.l	@(28,r14),r4
	tst	r4,r4
	bt	.L0606BC92
	tst	r5,r5
	bf	.L0606BC92
.L0606BC6E:
	shll2	r4
	mov.l	@r11,r3
	shll2	r4
	mov.w	.L0606BD22,r0
	mov.l	r12,@(r0,r3)
	mov.l	@r11,r2
	add	#4,r2
	add	r2,r4
	mov	r4,r3
	mov.l	r4,@(4,r15)
	mov.l	@(4,r3),r2
	mov.l	@r15,r5
	jsr	@r2
	mov	r14,r4
	mov	#80,r0
	mov.l	r12,@(r0,r14)
	mov	#88,r0
	mov.l	r12,@(r0,r14)
.L0606BC92:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_StopIn

	glabel gfs_SetErr
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606BD30,r3
	mov.l	@r3,r0
	cmp/eq	#-16,r0
	bt/s	.L0606BCC8
	mov	r4,r14
	cmp/eq	#-14,r0
	bt	.L0606BCC4
	cmp/eq	#-13,r0
	bt	.L0606BCC0
	cmp/eq	#0,r0
	bt	.L0606BCCA
	bra	.L0606BCCA
	nop
.L0606BCC0:
	bra	.L0606BCCA
	mov	#-23,r14
.L0606BCC4:
	bra	.L0606BCCA
	mov	#-2,r14
.L0606BCC8:
	mov	#-25,r14
.L0606BCCA:
	tst	r14,r14
	mov.l	.L0606BD28,r3
	mov.l	@r3,r13
	mov.w	.L0606BD24,r2
	add	r2,r13
	bt/s	.L0606BCE6
	mov.l	r14,@(8,r13)
	mov.l	@r13,r1
	tst	r1,r1
	bt	.L0606BCE6
	mov	r14,r5
	mov.l	@r13,r3
	jsr	@r3
	mov.l	@(4,r13),r4
.L0606BCE6:
	mov	r14,r0
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_SetErr

	glabel gfs_FindSvr
	mov.l	.L0606BD28,r3
	mov.l	@r3,r6
	add	#52,r6
	bra	.L0606BD0A
	mov	#0,r5
.L0606BCFA:
	mov	r5,r3
	shll2	r3
	mov	r6,r2
	add	r2,r3
	mov.l	@r3,r1
	cmp/eq	r1,r4
	bt	.L0606BD12
	add	#1,r5
.L0606BD0A:
	mov	#96,r0
	mov.l	@(r0,r6),r3
	cmp/ge	r3,r5
	bf	.L0606BCFA
.L0606BD12:
	mov	#96,r0
	mov.l	@(r0,r6),r1
	cmp/eq	r1,r5
	bf	.L0606BD1C
	mov	#-1,r5
.L0606BD1C:
	rts
	mov	r5,r0
.L0606BD20:
	.short 0x00B4
.L0606BD22:
	.short 0x00A8
.L0606BD24:
	.short 0x00B8
	.byte 0x00, 0x00
.L0606BD28:
	.long gfs_mng
.L0606BD2C:
	.long gfsTrn_Stop
.L0606BD30:
	.long gfcd_err
	endlabel gfs_FindSvr

	glabel gfs_AddSvr
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	r4,@r15
	bsr	gfs_FindSvr
	nop
	cmp/eq	#-1,r0
	bf/s	.L0606BD60
	mov	r0,r4
	mov.l	.L0606BE60,r3
	mov	#96,r0
	mov.l	@r3,r4
	add	#52,r4
	mov.l	@(r0,r4),r2
	mov	r4,r1
	shll2	r2
	add	r1,r2
	mov.l	@r15,r1
	mov	#96,r0
	mov.l	r1,@r2
	mov.l	@(r0,r4),r2
	add	#1,r2
	mov.l	r2,@(r0,r4)
.L0606BD60:
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfs_AddSvr

	glabel gfs_DelSvr
	sts.l	pr,@-r15
	tst	r4,r4
	bt	.L0606BDAE
	bsr	gfs_FindSvr
	nop
	cmp/eq	#-1,r0
	bt/s	.L0606BDAE
	mov	r0,r4
	mov.l	.L0606BE60,r3
	mov	#96,r0
	mov.l	@r3,r5
	add	#52,r5
	mov.l	@(r0,r5),r2
	add	#-1,r2
	mov.l	r2,@(r0,r5)
	mov	r2,r6
	cmp/ge	r6,r4
	bt	.L0606BDA4
.L0606BD8C:
	mov	r5,r7
	mov	r4,r3
	shll2	r3
	add	r7,r3
	mov	r4,r0
	add	#1,r0
	shll2	r0
	add	#1,r4
	mov.l	@(r0,r7),r2
	cmp/ge	r6,r4
	mov.l	r2,@r3
	bf	.L0606BD8C
.L0606BDA4:
	shll2	r4
	mov	r5,r2
	add	r2,r4
	mov	#0,r3
	mov.l	r3,@r4
.L0606BDAE:
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfs_DelSvr

	glabel gfs_InitHn
	mov.l	r14,@-r15
	mov	r4,r14
	sts.l	pr,@-r15
	tst	r14,r14
	add	#-8,r15
	mov.l	r5,@r15
	mov.l	r6,@(4,r15)
	bf	.L0606BDCE
	mov	#0,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606BDCE:
	mov	r14,r4
	mov.l	.L0606BE64,r3
	jsr	@r3
	add	#108,r4
	mov	r14,r4
	mov.l	.L0606BE68,r3
	mov.l	@(4,r15),r6
	mov.l	@r15,r5
	jsr	@r3
	add	#12,r4
	mov	r0,r4
	tst	r4,r4
	bf	.L0606BDF2
	mov	#0,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606BDF2:
	mov	#0,r4
	mov.l	r4,@(4,r14)
	mov	r14,r0
	mov.l	r4,@(8,r14)
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel gfs_InitHn

	glabel gfs_ReadPvd
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	add	#-28,r15
	mov.l	.L0606BE6C,r2
	mov	r15,r3
	mov.l	r4,@r15
	add	#16,r3
	jsr	@r2
	mov	r3,r8
	mov.w	.L0606BE5A,r1
	mov	r15,r3
	mov.w	.L0606BE5C,r13
	mov	#0,r4
	add	r1,r0
	add	#16,r3
	mov.l	r0,@r8
	mov	r15,r2
	mov.l	r13,@(4,r3)
	mov	r4,r0
	add	#16,r2
	mov	r15,r3
	mov.b	r0,@(10,r2)
	add	#16,r3
	mov.b	r0,@(11,r3)
	mov	r15,r3
	add	#16,r3
	mov.b	r0,@(8,r3)
	mov	r15,r3
	add	#16,r3
	mov.b	r0,@(9,r3)
	bsr	gfs_AllocHn
	nop
	mov	r0,r4
	mov	r15,r5
	add	#16,r5
	bsr	gfs_InitHn
	mov	#0,r6
	mov	r0,r14
	tst	r14,r14
	bf	.L0606BE70
	bra	.L0606BEAC
	mov	#-1,r0
.L0606BE5A:
	.short 0x00A6
.L0606BE5C:
	.short 0x0800
	.byte 0x00, 0x00
.L0606BE60:
	.long gfs_mng
.L0606BE64:
	.long gfsTrn_Init
.L0606BE68:
	.long gfsFlow_Init
.L0606BE6C:
	.long gfcd_GetLastSesFad
.L0606BE70:
	mov.l	@r15,r6
	mov	#1,r5
	mov	r13,r7
	bsr	GFS_Fread
	mov	r14,r4
	mov	r0,r4
	cmp/eq	r13,r4
	bt	.L0606BE84
	bra	.L0606BEAC
	mov	#-1,r0
.L0606BE84:
	mov	r15,r4
	add	#4,r4
	bsr	GFS_GetErrStat
	nop
	mov	r15,r13
	add	#4,r13
	mov.l	@(8,r13),r13
	tst	r13,r13
	bf	.L0606BEA6
	mov.l	.L0606BF80,r5
	mov.l	@r15,r4
	mov.l	.L0606BF84,r3
	jsr	@r3
	mov	#6,r6
	tst	r0,r0
	bt	.L0606BEA6
	mov	#-3,r13
.L0606BEA6:
	bsr	GFS_Close
	mov	r14,r4
	mov	r13,r0
.L0606BEAC:
	add	#28,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_ReadPvd

	glabel gfs_GetRootRec
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L0606BF88,r3
	mov.l	@r3,r13
	mov.w	.L0606BF70,r0
	mov.l	@(r0,r13),r0
	tst	#1,r0
	bf/s	.L0606BED2
	mov	r4,r14
	bra	.L0606BF4A
	mov	#-2,r0
.L0606BED2:
	mov.w	.L0606BF72,r4
	bsr	gfs_ReadPvd
	add	r13,r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606BEE2
	bra	.L0606BF4A
	mov	r4,r0
.L0606BEE2:
	mov	#4,r6
	mov.l	.L0606BF88,r3
	mov.l	@r3,r13
	mov.w	.L0606BF74,r2
	mov.w	.L0606BF72,r1
	mov.l	.L0606BF8C,r3
	add	r1,r13
	add	r2,r13
	mov	r13,r5
	add	#6,r5
	jsr	@r3
	mov	r14,r4
	mov.w	.L0606BF76,r3
	mov.l	@r14,r2
	add	r3,r2
	mov.l	r2,@r14
	mov	r2,r0
	mov.w	.L0606BF78,r1
	cmp/ge	r1,r0
	bt	.L0606BF0E
	bra	.L0606BF4A
	mov	#-3,r0
.L0606BF0E:
	mov	#4,r6
	mov.l	.L0606BF8C,r3
	mov	r13,r5
	mov	r15,r4
	jsr	@r3
	add	#14,r5
	mov.l	@r15,r2
	cmp/pl	r2
	bt	.L0606BF24
	bra	.L0606BF4A
	mov	#-3,r0
.L0606BF24:
	mov.w	.L0606BF7A,r4
	mov	r4,r3
	mov.l	@r15,r1
	add	#-1,r3
	mov.l	.L0606BF90,r2
	add	r3,r1
	jsr	@r2
	mov	r4,r0
	mul.l	r4,r0
	mov	#0,r4
	sts	macl,r0
	mov.l	r0,@(4,r14)
	mov	r4,r0
	mov.b	r0,@(10,r14)
	mov.w	.L0606BF7C,r0
	mov.b	r0,@(11,r14)
	mov	r4,r0
	mov.b	r0,@(8,r14)
	mov.b	r0,@(9,r14)
.L0606BF4A:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_GetRootRec

	glabel gfs_LoadRootDir
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	add	#-16,r15
	mov.l	r4,@r15
	mov	r15,r4
	add	#4,r4
	bsr	gfs_GetRootRec
	nop
	mov	r0,r13
	tst	r13,r13
	bt	.L0606BF94
	bra	.L0606BFA4
	mov	#0,r14
.L0606BF70:
	.short 0x00C4
.L0606BF72:
	.short 0x0460
.L0606BF74:
	.short 0x009C
.L0606BF76:
	.short 0x0096
.L0606BF78:
	.short 0x00A6
.L0606BF7A:
	.short 0x0800
.L0606BF7C:
	.short 0x0080
	.byte 0x00, 0x00
.L0606BF80:
	.long gfs_iso_vd_id
.L0606BF84:
	.long memcmp
.L0606BF88:
	.long gfs_mng
.L0606BF8C:
	.long memmove
.L0606BF90:
	.long _divlspnm
.L0606BF94:
	bsr	gfs_AllocHn
	nop
	mov	r0,r4
	mov	r15,r5
	add	#4,r5
	bsr	gfs_InitHn
	mov	#0,r6
	mov	r0,r14
.L0606BFA4:
	mov.l	.L0606C09C,r3
	mov.l	@r3,r0
	mov.w	.L0606C094,r1
	mov.l	@(r0,r1),r0
	tst	#1,r0
	bt	.L0606BFB8
	tst	r14,r14
	bf	.L0606BFB8
	bra	.L0606BFD4
	mov	r13,r0
.L0606BFB8:
	mov.l	@r15,r5
	mov	r15,r6
	mov.l	.L0606C0A0,r3
	add	#4,r6
	mov.l	@(4,r6),r6
	jsr	@r3
	mov	r14,r4
	tst	r14,r14
	mov.l	r0,@r15
	bt	.L0606BFD2
	mov.l	.L0606C0A4,r3
	jsr	@r3
	mov	r14,r4
.L0606BFD2:
	mov.l	@r15,r0
.L0606BFD4:
	add	#16,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_LoadRootDir

	glabel gfs_ExecFlow
	mov	#80,r0
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov	r4,r13
	sts.l	pr,@-r15
	add	#12,r13
	add	#-4,r15
	mov.l	@(r0,r13),r0
	cmp/eq	#4,r0
	bf/s	.L0606BFFC
	mov	r4,r12
	mov	#80,r0
	bra	.L0606C06A
	mov.l	@(r0,r13),r0
.L0606BFFC:
	mov.l	.L0606C09C,r14
	mov.l	@r14,r4
	mov.w	.L0606C096,r0
	mov.l	@(r0,r4),r5
	tst	r5,r5
	bt	.L0606C010
	cmp/eq	r12,r5
	bt	.L0606C010
	bra	.L0606C06A
	mov	#7,r0
.L0606C010:
	mov.l	@(28,r13),r2
	mov	r4,r3
	shll2	r2
	shll2	r2
	add	#4,r3
	add	r3,r2
	mov.l	r2,@r15
	mov	r2,r3
	mov.l	@r3,r2
	jsr	@r2
	mov	r13,r4
	cmp/eq	#1,r0
	bf/s	.L0606C034
	mov	r0,r5
	mov.l	@r14,r2
	mov.w	.L0606C096,r0
	bra	.L0606C058
	mov.l	r12,@(r0,r2)
.L0606C034:
	mov	r5,r0
	cmp/eq	#4,r0
	bf	.L0606C058
	mov.l	@r14,r3
	mov.w	.L0606C096,r0
	mov.l	@(r0,r3),r2
	cmp/eq	r12,r2
	bf	.L0606C058
	mov.l	@r14,r2
	mov	#0,r4
	mov.w	.L0606C096,r0
	mov.l	r4,@(r0,r2)
	mov.l	@r14,r3
	add	#8,r0
	mov	r3,r2
	mov.l	r4,@(r0,r2)
	add	#-4,r0
	mov.l	r4,@(r0,r3)
.L0606C058:
	mov	#80,r0
	mov	r12,r4
	mov.l	r5,@(r0,r13)
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	bra	gfs_SetAstat
	mov.l	@r15+,r14
.L0606C06A:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_ExecFlow

	glabel gfs_ExecTrans
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r14
	mov.w	.L0606C098,r0
	sts.l	pr,@-r15
	mov.l	.L0606C09C,r13
	add	#-8,r15
	mov.l	@r13,r4
	mov.l	@(r0,r4),r4
	cmp/eq	r14,r4
	bt	.L0606C0A8
	tst	r4,r4
	bt	.L0606C0A8
	bra	.L0606C110
	mov	#1,r0
.L0606C094:
	.short 0x00C4
.L0606C096:
	.short 0x00A8
.L0606C098:
	.short 0x00B4
	.byte 0x00, 0x00
.L0606C09C:
	.long gfs_mng
.L0606C0A0:
	.long gfs_LoadDirTbl
.L0606C0A4:
	.long GFS_Close
.L0606C0A8:
	mov	r15,r3
	mov	#0,r7
	mov.l	r3,@-r15
	mov	r7,r6
	mov	r7,r5
	bsr	GFS_GetFileInfo
	mov	r14,r4
	add	#4,r15
	mov.l	@r15,r0
	tst	#64,r0
	bt	.L0606C0C2
	bra	.L0606C110
	mov	#6,r0
.L0606C0C2:
	mov	r14,r4
	mov.l	.L0606C1AC,r3
	jsr	@r3
	add	#108,r4
	mov	r0,r4
	tst	r4,r4
	bf	.L0606C0DA
	mov.l	.L0606C1B0,r3
	jsr	@r3
	mov	r14,r4
	bra	.L0606C0E4
	nop
.L0606C0DA:
	mov	r15,r5
	mov.l	.L0606C1B4,r3
	add	#4,r5
	jsr	@r3
	mov	r14,r4
.L0606C0E4:
	cmp/eq	#6,r0
	bf/s	.L0606C0FE
	mov	r0,r4
	mov.l	@r13,r3
	mov.w	.L0606C1AA,r0
	mov.l	@(r0,r3),r2
	cmp/eq	r14,r2
	bf	.L0606C10E
	mov.l	@r13,r1
	mov	#0,r3
	mov.w	.L0606C1AA,r0
	bra	.L0606C10E
	mov.l	r3,@(r0,r1)
.L0606C0FE:
	mov.l	@r13,r1
	mov.w	.L0606C1AA,r0
	mov.l	@(r0,r1),r0
	tst	r0,r0
	bf	.L0606C10E
	mov.l	@r13,r3
	mov.w	.L0606C1AA,r0
	mov.l	r14,@(r0,r3)
.L0606C10E:
	mov	r4,r0
.L0606C110:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfs_ExecTrans

	glabel gfs_GetSctFad
	sts.l	pr,@-r15
	mov.l	.L0606C1B8,r3
	add	#-16,r15
	mov.l	r5,@r15
	mov	r15,r5
	add	#4,r5
	jsr	@r3
	nop
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606C138
	add	#16,r15
	lds.l	@r15+,pr
	rts
	mov	r4,r0
.L0606C138:
	mov	r15,r4
	add	#4,r4
	mov.b	@(8,r4),r0
	extu.b	r0,r4
	tst	r4,r4
	bf	.L0606C154
	mov.l	@r15,r3
	mov	r15,r0
	add	#4,r0
	mov.l	@r0,r0
	add	#16,r15
	lds.l	@r15+,pr
	rts
	add	r3,r0
.L0606C154:
	mov.l	@r15,r1
	mov.l	.L0606C1BC,r3
	jsr	@r3
	mov	r4,r0
	mov	r0,r3
	mov	r15,r2
	add	#4,r2
	mov.b	@(9,r2),r0
	extu.b	r0,r0
	add	r4,r0
	mul.l	r0,r3
	mov	r15,r0
	sts	macl,r3
	add	#4,r0
	mov.l	@r0,r0
	add	r3,r0
	add	#16,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfs_GetSctFad

	glabel gfs_SetupFlow
	mov.l	r14,@-r15
	mov	r4,r14
	sts.l	pr,@-r15
	add	#28,r4
	mov.l	@r4,r0
	tst	r0,r0
	bf	.L0606C194
	mov.l	.L0606C1C0,r3
	jsr	@r3
	mov	r14,r4
	bra	.L0606C19E
	nop
.L0606C194:
	mov	#84,r0
	mov	#0,r3
	mov.l	r5,@(r0,r14)
	mov	#88,r0
	mov.l	r3,@(r0,r14)
.L0606C19E:
	mov	#0,r2
	mov	#80,r0
	mov.l	r2,@(r0,r14)
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606C1AA:
	.short 0x00B4
.L0606C1AC:
	.long gfsTrn_GetFree
.L0606C1B0:
	.long gfsTrn_Skip
.L0606C1B4:
	.long gfsTrn_Exec
.L0606C1B8:
	.long GFS_GetDirInfo
.L0606C1BC:
	.long _divlspnm
.L0606C1C0:
	.long gfsFlow_SetSct
	endlabel gfs_SetupFlow

	glabel gfs_GetFinfo
	tst	r5,r5
	bt	.L0606C1CC
	mov.l	@r4,r3
	mov.l	r3,@r5
.L0606C1CC:
	tst	r6,r6
	bt	.L0606C1D4
	mov.l	@(4,r4),r2
	mov.l	r2,@r6
.L0606C1D4:
	tst	r7,r7
	bt	.L0606C1DC
	mov.l	@(16,r4),r3
	mov.l	r3,@r7
.L0606C1DC:
	mov.l	@r15,r0
	tst	r0,r0
	bt	.L0606C1E8
	mov.l	@r15,r2
	mov.l	@(20,r4),r3
	mov.l	r3,@r2
.L0606C1E8:
	mov.l	@(4,r15),r0
	tst	r0,r0
	bt	.L0606C1F8
	mov.l	@(4,r15),r2
	mov.l	@(24,r4),r3
	mov.l	@(16,r4),r1
	sub	r3,r1
	mov.l	r1,@r2
.L0606C1F8:
	mov.l	@(8,r15),r0
	tst	r0,r0
	bt	.L0606C206
	mov.l	@(8,r15),r3
	mov.b	@(14,r4),r0
	extu.b	r0,r0
	mov.l	r0,@r3
.L0606C206:
	mov.l	@(12,r15),r1
	tst	r1,r1
	bt	.L0606C214
	mov.l	@(12,r15),r3
	mov.b	@(15,r4),r0
	extu.b	r0,r0
	mov.l	r0,@r3
.L0606C214:
	rts
	nop
	endlabel gfs_GetFinfo

	glabel gfs_CloseHn
	mov.l	r14,@-r15
	mov	r4,r14
	sts.l	pr,@-r15
	tst	r14,r14
	add	#-4,r15
	bt	.L0606C242
	mov	r14,r4
	add	#12,r4
	mov	r4,r3
	add	#28,r3
	mov.l	r3,@r15
	bsr	gfs_DelSvr
	mov	r14,r4
	bsr	gfs_FreeHn
	mov	r14,r4
	mov.l	@r15,r4
	mov.l	.L0606C30C,r3
	add	#4,r15
	lds.l	@r15+,pr
	jmp	@r3
	mov.l	@r15+,r14
.L0606C242:
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel gfs_CloseHn

	glabel gfs_GetGmode
	add	#12,r4
	mov	#76,r0
	rts
	mov.l	@(r0,r4),r0
	endlabel gfs_GetGmode

	glabel gfs_IsFlowEnd
	mov	r4,r3
	mov.l	.L0606C310,r1
	mov	#0,r7
	mov.l	r14,@-r15
	add	#12,r3
	sts.l	pr,@-r15
	mov	r4,r14
	add	#-8,r15
	mov	r15,r2
	mov.l	r3,@(4,r15)
	mov	r7,r6
	mov.l	r2,@-r15
	mov	r7,r5
	jsr	@r1
	mov	r14,r4
	add	#4,r15
	mov	#80,r1
	mov.l	@(4,r15),r0
	mov.l	@(r0,r1),r0
	cmp/eq	#4,r0
	bf	.L0606C296
	mov.l	.L0606C314,r2
	jsr	@r2
	mov	r14,r4
	tst	r0,r0
	bt	.L0606C28C
	mov.l	@r15,r0
	tst	#64,r0
	bt	.L0606C296
.L0606C28C:
	mov	#1,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606C296:
	mov	#0,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel gfs_IsFlowEnd

	glabel gfs_SetAstat
	mov.l	r14,@-r15
	mov	r5,r0
	sts.l	pr,@-r15
	cmp/eq	#3,r0
	bt/s	.L0606C2EC
	mov	r4,r14
	cmp/eq	#5,r0
	bt	.L0606C2D4
	cmp/eq	#6,r0
	bt	.L0606C2DC
	cmp/eq	#7,r0
	bt	.L0606C2E4
	cmp/eq	#8,r0
	bt	.L0606C2CC
	cmp/eq	#9,r0
	bt	.L0606C2C4
	bra	.L0606C300
	nop
.L0606C2C4:
	mov	#-25,r3
	mov.l	r3,@(8,r14)
	bra	.L0606C2FA
	mov	r3,r4
.L0606C2CC:
	mov	#-1,r3
	mov.l	r3,@(8,r14)
	bra	.L0606C2FA
	mov	r3,r4
.L0606C2D4:
	mov	#-23,r3
	mov.l	r3,@(8,r14)
	bra	.L0606C2FA
	mov	r3,r4
.L0606C2DC:
	mov	#-2,r3
	mov.l	r3,@(8,r14)
	bra	.L0606C2FA
	mov	r3,r4
.L0606C2E4:
	mov	#-20,r3
	mov.l	r3,@(8,r14)
	bra	.L0606C2FA
	mov	r3,r4
.L0606C2EC:
	bsr	gfs_GetGmode
	mov	r14,r4
	cmp/eq	#1,r0
	bf	.L0606C304
	mov	#-24,r3
	mov	#-24,r4
	mov.l	r3,@(8,r14)
.L0606C2FA:
	lds.l	@r15+,pr
	bra	gfs_SetErr
	mov.l	@r15+,r14
.L0606C300:
	mov	#1,r2
	mov.l	r2,@(8,r14)
.L0606C304:
	mov	#0,r0
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606C30C:
	.long gfcf_Close
.L0606C310:
	.long GFS_GetFileInfo
.L0606C314:
	.long gfsAcc_CountSctAll
	endlabel gfs_SetAstat
