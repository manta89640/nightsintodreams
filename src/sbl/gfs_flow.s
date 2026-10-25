! sbl/gfs_flow: matching source. The readable C for this object is gfs_flow.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0606CC64,"ax",@progbits
	.p2align 2

	glabel gfsFlow_InitCd
	mov.l	r14,@-r15
	mov	#-2,r2
	mov.w	.L0606CD72,r0
	sts.l	pr,@-r15
	mov.l	.L0606CD7C,r14
	add	#-4,r15
	mov.l	r4,@r15
	mov.l	@r14,r3
	mov.l	@(r0,r3),r1
	and	r2,r1
	mov.l	r1,@(r0,r3)
	mov.l	@r15,r5
	mov.l	@r14,r4
	mov.w	.L0606CD74,r3
	mov.l	.L0606CD80,r1
	jsr	@r1
	add	r3,r4
	mov	r0,r4
	tst	r4,r4
	bf	.L0606CC98
	mov.l	@r14,r3
	mov	#1,r2
	mov.w	.L0606CD72,r0
	mov.l	@(r0,r3),r1
	or	r2,r1
	mov.l	r1,@(r0,r3)
.L0606CC98:
	mov	r4,r0
	cmp/eq	#-16,r0
	bt	.L0606CCDA
	cmp/eq	#-15,r0
	bt	.L0606CCD0
	cmp/eq	#-14,r0
	bt	.L0606CCC6
	cmp/eq	#-13,r0
	bt	.L0606CCBC
	cmp/eq	#0,r0
	bt	.L0606CCB2
	bra	.L0606CCE4
	nop
.L0606CCB2:
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606CCBC:
	mov	#-23,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606CCC6:
	mov	#-2,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606CCD0:
	mov	#-3,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606CCDA:
	mov	#-25,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606CCE4:
	mov	#-1,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel gfsFlow_InitCd

	glabel gfsFlow_Init
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r5,r13
	mov.l	r12,@-r15
	tst	r13,r13
	mov.l	r11,@-r15
	mov	r4,r12
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	sts.l	pr,@-r15
	mov	r6,r9
	mov.w	.L0606CD76,r10
	bf/s	.L0606CD22
	mov	r4,r14
	mov	r14,r5
	mov.l	.L0606CD84,r3
	add	#4,r5
	mov.l	r9,@r14
	jsr	@r3
	mov	r9,r4
	tst	r0,r0
	bt	.L0606CD1E
	bra	.L0606CDC6
	mov	#0,r0
.L0606CD1E:
	bra	.L0606CD52
	mov.l	@(8,r14),r11
.L0606CD22:
	mov.b	@(11,r13),r0
	extu.b	r0,r0
	tst	#128,r0
	bt/s	.L0606CD3A
	mov.l	@(4,r13),r11
	mov.w	.L0606CD78,r1
	add	r11,r1
	mov.l	.L0606CD88,r3
	jsr	@r3
	mov	r10,r0
	mul.l	r10,r0
	sts	macl,r11
.L0606CD3A:
	mov.l	r9,@r14
	mov.l	@r13,r2
	mov.l	r2,@(4,r14)
	mov.l	r11,@(8,r14)
	mov.b	@(8,r13),r0
	mov.b	r0,@(12,r14)
	mov.b	@(9,r13),r0
	mov.b	r0,@(13,r14)
	mov.b	@(10,r13),r0
	mov.b	r0,@(14,r14)
	mov.b	@(11,r13),r0
	mov.b	r0,@(15,r14)
.L0606CD52:
	mov.b	@(11,r13),r0
	bsr	gfsFlow_SctSize
	extu.b	r0,r4
	mov.l	r0,@(16,r14)
	mov.w	.L0606CD78,r2
	add	r11,r2
	shlr8	r2
	shlr2	r2
	shlr	r2
	mov.l	r2,@(20,r14)
	mov.l	@(16,r14),r0
	tst	r0,r0
	bf/s	.L0606CD8C
	mov	#0,r13
	bra	.L0606CDA0
	mov.l	r13,@(24,r14)
.L0606CD72:
	.short 0x00C4
.L0606CD74:
	.short 0x00CC
.L0606CD76:
	.short 0x0800
.L0606CD78:
	.short 0x07FF
	.byte 0x00, 0x00
.L0606CD7C:
	.long gfs_mng
.L0606CD80:
	.long gfcd_Init
.L0606CD84:
	.long gfcd_GetFileInfo
.L0606CD88:
	.long _divlspnm
.L0606CD8C:
	mov.l	.L0606CF30,r2
	mov	r11,r1
	jsr	@r2
	mov	r10,r0
	mov.l	.L0606CF30,r3
	mov	r10,r1
	sub	r0,r1
	jsr	@r3
	mov	r10,r0
	mov.l	r0,@(24,r14)
.L0606CDA0:
	mov.l	.L0606CF34,r2
	jsr	@r2
	mov	r12,r4
	tst	r0,r0
	bf	.L0606CDAE
	bra	.L0606CDC6
	mov	#0,r0
.L0606CDAE:
	mov	#76,r0
	mov.l	.L0606CF38,r3
	mov.l	r13,@(r0,r12)
	mov	#80,r0
	mov.l	r13,@(r0,r12)
	mov	#88,r0
	mov.l	r13,@(r0,r12)
	mov	#84,r0
	mov.l	r13,@(r0,r12)
	mov	#92,r0
	mov.l	r3,@(r0,r12)
	mov	#1,r0
.L0606CDC6:
	lds.l	@r15+,pr
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfsFlow_Init

	glabel gfsFlow_SetSct
	mov	#84,r0
	mov.l	.L0606CF3C,r3
	mov	#0,r6
	mov.l	r14,@-r15
	mov	r4,r14
	mov.l	r13,@-r15
	mov	r5,r13
	sts.l	pr,@-r15
	mov.l	r5,@(r0,r14)
	mov.l	.L0606CF38,r5
	jsr	@r3
	mov	r14,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606CDF6
	mov	#0,r4
.L0606CDF6:
	cmp/ge	r13,r4
	bt/s	.L0606CE00
	mov	#88,r0
	bra	.L0606CE02
	mov	r4,r3
.L0606CE00:
	mov	r13,r3
.L0606CE02:
	mov.l	r3,@(r0,r14)
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfsFlow_SetSct

	glabel gfsFlow_GetFinfo
	mov.l	r14,@-r15
	tst	r5,r5
	mov.l	@(8,r15),r14
	bt	.L0606CE18
	mov.l	@r4,r3
	mov.l	r3,@r5
.L0606CE18:
	tst	r6,r6
	bt	.L0606CE20
	mov.l	@(4,r4),r2
	mov.l	r2,@r6
.L0606CE20:
	mov.l	@(12,r15),r0
	tst	r0,r0
	bt	.L0606CE2E
	mov.l	@(12,r15),r3
	mov.b	@(14,r4),r0
	extu.b	r0,r0
	mov.l	r0,@r3
.L0606CE2E:
	tst	r7,r7
	bt	.L0606CE36
	mov.l	@(16,r4),r3
	mov.l	r3,@r7
.L0606CE36:
	mov.l	@(4,r15),r0
	tst	r0,r0
	bt	.L0606CE42
	mov.l	@(4,r15),r2
	mov.l	@(20,r4),r3
	mov.l	r3,@r2
.L0606CE42:
	mov.l	@(16,r15),r0
	tst	r0,r0
	bt	.L0606CE50
	mov.l	@(16,r15),r2
	mov.b	@(15,r4),r0
	extu.b	r0,r0
	mov.l	r0,@r2
.L0606CE50:
	tst	r14,r14
	bt	.L0606CE72
	mov.b	@(15,r4),r0
	mov	#8,r3
	extu.b	r0,r5
	tst	r5,r3
	bt	.L0606CE6A
	mov	#16,r1
	tst	r5,r1
	bt	.L0606CE6A
	mov	#0,r2
	bra	.L0606CE72
	mov.l	r2,@r14
.L0606CE6A:
	mov.l	@(24,r4),r3
	mov.l	@(16,r4),r1
	sub	r3,r1
	mov.l	r1,@r14
.L0606CE72:
	rts
	mov.l	@r15+,r14
	endlabel gfsFlow_GetFinfo

	glabel gfsFlow_Read
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r14
	mov.l	r12,@-r15
	mov	r4,r13
	mov.l	r11,@-r15
	sts.l	pr,@-r15
	add	#-36,r15
	mov	r15,r5
	add	#12,r5
	mov	r15,r4
	add	#4,r4
	bsr	gfsFlow_GetCdStat
	add	#28,r14
	mov	r0,r12
	mov.l	.L0606CF40,r2
	mov	r15,r6
	mov.l	.L0606CF44,r1
	mov	r12,r5
	mov.l	r0,@r2
	mov.l	@(4,r15),r3
	mov.l	r3,@r1
	bsr	gfsFlow_CheckCd
	mov	r13,r4
	tst	r0,r0
	bf	.L0606CEB0
	mov.l	@r15,r0
	bra	.L0606CFCE
	nop
.L0606CEB0:
	mov.l	.L0606CF48,r11
	mov.l	.L0606CF4C,r3
	jsr	@r3
	mov	r14,r4
	tst	r0,r0
	bf	.L0606CF80
	mov	r15,r6
	mov	r15,r5
	add	#8,r5
	bsr	gfsFlow_SetRange
	mov	r13,r4
	tst	r0,r0
	bf	.L0606CED0
	mov.l	@r15,r0
	bra	.L0606CFCE
	nop
.L0606CED0:
	mov.l	.L0606CF50,r3
	jsr	@r3
	mov	r14,r4
	tst	r0,r0
	bf	.L0606CEDE
	bra	.L0606CFCE
	mov	#8,r0
.L0606CEDE:
	mov.l	.L0606CF54,r3
	jsr	@r3
	mov	r14,r4
	tst	r0,r0
	bf	.L0606CEEC
	bra	.L0606CFCE
	mov	#8,r0
.L0606CEEC:
	mov	#1,r4
	mov	r15,r3
	add	#16,r3
	mov	r15,r2
	mov.l	r4,@r3
	mov	#16,r0
	mov.l	@(40,r14),r3
	add	#16,r2
	mov.l	r3,@(4,r2)
	mov	r15,r2
	add	#16,r2
	mov	r15,r3
	mov.l	r4,@(8,r2)
	add	#16,r3
	mov.l	@(44,r14),r1
	mov	r15,r4
	mov	r15,r2
	add	#16,r2
	mov.l	@(4,r2),r2
	add	#16,r4
	sub	r2,r1
	mov	#0,r2
	mov.l	r1,@(12,r3)
	mov	r15,r3
	add	#16,r3
	mov.b	r2,@(r0,r3)
	mov.l	.L0606CF58,r3
	jsr	@r3
	mov.l	@(28,r14),r5
	tst	r0,r0
	mov.l	r0,@r15
	bt	.L0606CF5C
	bra	.L0606CFCE
	mov	#8,r0
.L0606CF30:
	.long _modlspnm
.L0606CF34:
	.long gfcf_Open
.L0606CF38:
	.long 0x7FFFFFFF
.L0606CF3C:
	.long gfcf_GetNumSct
.L0606CF40:
	.long gfs_last_cd_stat
.L0606CF44:
	.long gfs_last_cd_fad
.L0606CF48:
	.long gfs_mng
.L0606CF4C:
	.long gfcf_IsLocked
.L0606CF50:
	.long gfcf_Lock
.L0606CF54:
	.long gfcf_SetCdCon
.L0606CF58:
	.long gfcd_Play
.L0606CF5C:
	mov.l	@(8,r15),r3
	mov	#88,r0
	mov.w	.L0606D056,r1
	mov.l	@(r0,r13),r2
	add	r3,r2
	mov	r15,r3
	mov.l	r2,@(r0,r13)
	add	#16,r3
	mov.l	@r11,r0
	mov.l	@(4,r3),r2
	add	r0,r1
	mov.l	r2,@r1
	mov.l	@r11,r3
	mov.l	@(44,r14),r2
	mov.w	.L0606D058,r0
	mov.l	r2,@(r0,r3)
	bra	.L0606CFCE
	mov	#1,r0
.L0606CF80:
	mov.l	@(44,r14),r3
	mov.l	@(4,r15),r2
	cmp/ge	r3,r2
	bf	.L0606CFCC
	mov.l	@(12,r15),r0
	tst	#4,r0
	bf	.L0606CF92
	tst	r12,r12
	bf	.L0606CFCC
.L0606CF92:
	mov.l	.L0606D05C,r2
	jsr	@r2
	mov	r14,r4
	mov	#88,r0
	mov.l	@(r0,r13),r3
	mov	#84,r0
	mov.l	@(r0,r13),r2
	cmp/eq	r3,r2
	bf	.L0606CFC8
	mov.l	.L0606D060,r1
	mov.l	@r1,r3
	mov.l	@(4,r15),r2
	mov.w	.L0606D058,r0
	mov.l	@(r0,r3),r3
	cmp/gt	r2,r3
	bt	.L0606CFC8
	mov	r12,r0
	cmp/eq	#2,r0
	bt	.L0606CFC8
	mov.l	@r11,r3
	mov	r3,r2
	mov.w	.L0606D058,r0
	mov.l	@(r0,r2),r1
	add	#-4,r0
	mov.l	r1,@(r0,r3)
	bra	.L0606CFCE
	mov	#4,r0
.L0606CFC8:
	bra	.L0606CFCE
	mov	#2,r0
.L0606CFCC:
	mov	#2,r0
.L0606CFCE:
	add	#36,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfsFlow_Read

	glabel gfsFlow_StopRead
	mov.l	r14,@-r15
	mov	#0,r1
	mov.w	.L0606D058,r0
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov	r4,r13
	mov.l	.L0606D060,r14
	add	#-16,r15
	mov.l	r5,@(4,r15)
	add	#28,r13
	mov.l	@r14,r3
	mov	r15,r5
	mov	r3,r2
	add	#8,r5
	mov.l	r1,@(r0,r2)
	add	#-4,r0
	mov.l	r1,@(r0,r3)
	mov	#3,r2
	mov	r15,r3
	add	#8,r3
	mov.l	r2,@r3
	mov.l	.L0606D064,r3
	jsr	@r3
	mov	r13,r4
	mov.l	@(4,r15),r0
	tst	r0,r0
	bt	.L0606D018
	mov.l	.L0606D068,r3
	jsr	@r3
	nop
.L0606D018:
	mov.l	.L0606D06C,r2
	jsr	@r2
	mov	r13,r4
	mov.l	.L0606D070,r3
	jsr	@r3
	mov	r13,r4
	tst	r0,r0
	bt	.L0606D04C
	mov.l	.L0606D05C,r3
	jsr	@r3
	mov	r13,r4
	mov	r15,r4
	bsr	gfsFlow_GetCdStat
	mov	#0,r5
	mov.l	@r14,r3
	mov.l	@r15,r2
	mov.w	.L0606D058,r0
	mov.l	@(r0,r3),r1
	cmp/gt	r2,r1
	bt	.L0606D04C
	mov.l	@r14,r3
	mov	r3,r2
	mov.w	.L0606D058,r0
	mov.l	@(r0,r2),r1
	add	#-4,r0
	mov.l	r1,@(r0,r3)
.L0606D04C:
	add	#16,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L0606D056:
	.short 0x00AC
.L0606D058:
	.short 0x00B0
	.byte 0x00, 0x00
.L0606D05C:
	.long gfcf_Unlock
.L0606D060:
	.long gfs_mng
.L0606D064:
	.long gfcf_CdSeek
.L0606D068:
	.long gfcd_WaitPause
.L0606D06C:
	.long gfcf_Flush
.L0606D070:
	.long gfcf_IsLocked
	endlabel gfsFlow_StopRead

	glabel gfsFlow_PlayNoChg
	mov.l	r14,@-r15
	mov	r4,r14
	mov.l	.L0606D174,r3
	add	#28,r14
	sts.l	pr,@-r15
	add	#-20,r15
	jsr	@r3
	mov	r14,r4
	tst	r0,r0
	bt	.L0606D0B2
	mov	#3,r4
	mov	r15,r3
	mov.l	r4,@r3
	mov	r15,r2
	mov.l	r4,@(8,r2)
	mov	r15,r3
	mov.w	.L0606D170,r2
	mov	#16,r0
	mov.b	r2,@(r0,r3)
	mov	r15,r4
	mov.l	.L0606D178,r3
	jsr	@r3
	mov.l	@(28,r14),r5
	mov	r0,r4
	tst	r4,r4
	bt	.L0606D0BC
	mov	#8,r0
	add	#20,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606D0B2:
	mov	#8,r0
	add	#20,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606D0BC:
	mov	#2,r0
	add	#20,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel gfsFlow_PlayNoChg

	glabel gfsFlow_GetSctPos
	add	#-4,r15
	mov.l	.L0606D17C,r3
	mov.l	r4,@r15
	add	#28,r4
	jmp	@r3
	add	#4,r15
	endlabel gfsFlow_GetSctPos

	glabel gfsFlow_SetSctPos
	mov.l	.L0606D180,r3
	jmp	@r3
	mov	#0,r6
	endlabel gfsFlow_SetSctPos

	glabel gfsFlow_Seek
	mov.l	r14,@-r15
	mov	r4,r14
	mov.l	r13,@-r15
	mov	r14,r13
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	add	#-12,r15
	mov.l	r5,@r15
	mov	#0,r5
	bsr	gfsFlow_GetCdStat
	mov	r5,r4
	tst	r0,r0
	bt	.L0606D0F6
	bra	.L0606D156
	mov	#-20,r0
.L0606D0F6:
	mov	r14,r4
	mov.l	.L0606D184,r3
	jsr	@r3
	add	#28,r4
	tst	r0,r0
	bf	.L0606D106
	bra	.L0606D156
	mov	#-20,r0
.L0606D106:
	mov	r15,r3
	add	#4,r3
	mov	#1,r2
	mov.l	r2,@r3
	mov	r15,r3
	mov.l	@r15,r5
	add	#4,r3
	mov	r3,r8
	add	#4,r8
	bsr	gfsFlow_SctToFad
	mov	r13,r4
	mov.l	@(4,r13),r2
	mov	r15,r5
	mov.l	.L0606D188,r3
	mov	r14,r4
	add	r2,r0
	add	#4,r5
	mov.l	r0,@r8
	jsr	@r3
	add	#28,r4
	cmp/eq	#-13,r0
	bt	.L0606D146
	cmp/eq	#-9,r0
	bt	.L0606D142
	cmp/eq	#0,r0
	bt	.L0606D13E
	bra	.L0606D14A
	nop
.L0606D13E:
	bra	.L0606D14C
	mov	#0,r13
.L0606D142:
	bra	.L0606D14C
	mov	#-20,r13
.L0606D146:
	bra	.L0606D14C
	mov	#-23,r13
.L0606D14A:
	mov	#-1,r13
.L0606D14C:
	mov.l	.L0606D18C,r2
	mov	r14,r4
	jsr	@r2
	add	#28,r4
	mov	r13,r0
.L0606D156:
	add	#12,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfsFlow_Seek

	glabel gfsFlow_SctToFad
	sts.l	pr,@-r15
	mov.b	@(12,r4),r0
	tst	r0,r0
	bf	.L0606D190
	lds.l	@r15+,pr
	rts
	mov	r5,r0
.L0606D170:
	.short 0x00FF
	.byte 0x00, 0x00
.L0606D174:
	.long gfcf_IsLocked
.L0606D178:
	.long gfcd_Play
.L0606D17C:
	.long gfcf_Tell
.L0606D180:
	.long gfcf_Seek
.L0606D184:
	.long gfcf_Lock
.L0606D188:
	.long gfcf_CdSeek
.L0606D18C:
	.long gfcf_Unlock
.L0606D190:
	mov.b	@(12,r4),r0
	mov	r5,r1
	mov.l	.L0606D288,r3
	extu.b	r0,r6
	jsr	@r3
	mov	r6,r0
	mov.l	.L0606D28C,r2
	mov	r0,r3
	mov.b	@(13,r4),r0
	mov	r5,r1
	extu.b	r0,r0
	add	r6,r0
	mul.l	r0,r3
	sts	macl,r0
	mov	r0,r3
	jsr	@r2
	mov	r6,r0
	add	r3,r0
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfsFlow_SctToFad

	glabel gfsFlow_GetCdStat
	sts.l	pr,@-r15
	mov.l	.L0606D290,r3
	add	#-20,r15
	mov.l	r4,@r15
	mov	r15,r4
	mov.l	r5,@(4,r15)
	add	#8,r4
	jsr	@r3
	nop
	mov.l	@(4,r15),r1
	mov	r0,r4
	tst	r1,r1
	bt	.L0606D1D8
	mov.l	@(4,r15),r3
	mov.l	r4,@r3
.L0606D1D8:
	mov.l	@r15,r1
	tst	r1,r1
	bt	.L0606D1E8
	mov	r15,r2
	mov.l	@r15,r3
	add	#8,r2
	mov.l	@(8,r2),r1
	mov.l	r1,@r3
.L0606D1E8:
	mov.l	.L0606D294,r3
	mov.l	@r3,r4
	tst	r4,r4
	bf	.L0606D246
	mov	r15,r0
	add	#8,r0
	mov.b	@r0,r0
	extu.b	r0,r0
	and	#15,r0
	cmp/eq	#0,r0
	bt	.L0606D21E
	cmp/eq	#1,r0
	bt	.L0606D226
	cmp/eq	#2,r0
	bt	.L0606D226
	cmp/eq	#3,r0
	bt	.L0606D22E
	cmp/eq	#4,r0
	bt	.L0606D236
	cmp/eq	#5,r0
	bt	.L0606D23E
	cmp/eq	#8,r0
	bt	.L0606D22E
	cmp/eq	#9,r0
	bt	.L0606D270
	bra	.L0606D270
	nop
.L0606D21E:
	add	#20,r15
	lds.l	@r15+,pr
	rts
	mov	#2,r0
.L0606D226:
	add	#20,r15
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L0606D22E:
	add	#20,r15
	lds.l	@r15+,pr
	rts
	mov	#1,r0
.L0606D236:
	add	#20,r15
	lds.l	@r15+,pr
	rts
	mov	#2,r0
.L0606D23E:
	add	#20,r15
	lds.l	@r15+,pr
	rts
	mov	#1,r0
.L0606D246:
	mov	r4,r0
	cmp/eq	#-13,r0
	bf	.L0606D254
	add	#20,r15
	lds.l	@r15+,pr
	rts
	mov	#3,r0
.L0606D254:
	mov	r4,r0
	cmp/eq	#-14,r0
	bf	.L0606D262
	add	#20,r15
	lds.l	@r15+,pr
	rts
	mov	#4,r0
.L0606D262:
	mov	r4,r0
	cmp/eq	#-16,r0
	bf	.L0606D270
	add	#20,r15
	lds.l	@r15+,pr
	rts
	mov	#6,r0
.L0606D270:
	mov	#5,r0
	add	#20,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfsFlow_GetCdStat

	glabel gfsFlow_SctSize
	mov	#64,r3
	tst	r4,r3
	bt	.L0606D298
	mov.w	.L0606D286,r4
	bra	.L0606D2B6
	nop
.L0606D286:
	.short 0x0930
.L0606D288:
	.long _divlspnm
.L0606D28C:
	.long _modlspnm
.L0606D290:
	.long gfcd_GetStat
.L0606D294:
	.long gfcd_err
.L0606D298:
	mov	#8,r5
	mov	#16,r2
	tst	r4,r2
	bt/s	.L0606D2B0
	and	r4,r5
	tst	r5,r5
	bt	.L0606D2AA
	bra	.L0606D2B6
	mov	#0,r4
.L0606D2AA:
	mov.w	.L0606D362,r4
	bra	.L0606D2B6
	nop
.L0606D2B0:
	mov.w	.L0606D364,r6
	tst	r5,r5
	mov	r6,r4
.L0606D2B6:
	rts
	mov	r4,r0
	endlabel gfsFlow_SctSize

	glabel gfsFlow_CheckCd
	mov	r4,r3
	mov.l	r14,@-r15
	mov	r5,r0
	mov.l	r13,@-r15
	add	#28,r3
	sts.l	pr,@-r15
	mov	r4,r13
	add	#-4,r15
	cmp/eq	#0,r0
	mov.l	r3,@r15
	bt/s	.L0606D2F4
	mov	r6,r14
	cmp/eq	#1,r0
	bt	.L0606D326
	cmp/eq	#2,r0
	bt	.L0606D2EA
	cmp/eq	#3,r0
	bt	.L0606D306
	cmp/eq	#4,r0
	bt	.L0606D30E
	cmp/eq	#6,r0
	bt	.L0606D316
	bra	.L0606D31E
	nop
.L0606D2EA:
	mov	#80,r0
	mov.l	@(r0,r13),r3
	mov.l	r3,@r14
	bra	.L0606D358
	mov	#0,r0
.L0606D2F4:
	mov.l	.L0606D368,r2
	jsr	@r2
	nop
	tst	r0,r0
	bf	.L0606D326
	mov	#3,r3
	mov.l	r3,@r14
	bra	.L0606D358
	mov	#0,r0
.L0606D306:
	mov	#5,r1
	mov.l	r1,@r14
	bra	.L0606D358
	mov	#0,r0
.L0606D30E:
	mov	#6,r3
	mov.l	r3,@r14
	bra	.L0606D358
	mov	#0,r0
.L0606D316:
	mov	#9,r2
	mov.l	r2,@r14
	bra	.L0606D358
	mov	#0,r0
.L0606D31E:
	mov	#8,r3
	mov.l	r3,@r14
	bra	.L0606D358
	mov	#0,r0
.L0606D326:
	mov	#76,r0
	mov.l	@(r0,r13),r0
	cmp/eq	#1,r0
	bt	.L0606D352
	mov	#80,r0
	mov.l	@(r0,r13),r1
	tst	r1,r1
	bf	.L0606D352
	mov.l	@r15,r4
	mov.l	.L0606D36C,r3
	jsr	@r3
	nop
	mov	#0,r5
	mov.l	.L0606D370,r4
	mov	#88,r0
	mov.l	r5,@(r0,r13)
	add	#88,r0
	mov.l	@r4,r3
	mov	r3,r2
	mov.l	r5,@(r0,r2)
	add	#-4,r0
	mov.l	r5,@(r0,r3)
.L0606D352:
	mov	#1,r4
	mov.l	r4,@r14
	mov	r4,r0
.L0606D358:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L0606D362:
	.short 0x0914
.L0606D364:
	.short 0x0800
	.byte 0x00, 0x00
.L0606D368:
	.long gfcd_GetFreeSiz
.L0606D36C:
	.long gfcf_Flush
.L0606D370:
	.long gfs_mng
	endlabel gfsFlow_CheckCd

	glabel gfsFlow_SetRange
	mov.l	r14,@-r15
	mov	#88,r0
	mov.l	r13,@-r15
	mov	r4,r14
	mov.l	r12,@-r15
	mov	r4,r13
	mov.l	r11,@-r15
	mov	r5,r11
	mov.l	r10,@-r15
	mov	r4,r10
	mov.l	r9,@-r15
	mov	r6,r9
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	@(r0,r14),r3
	mov	#84,r0
	mov.l	@(r0,r14),r2
	mov	#92,r0
	sub	r3,r2
	mov	r2,r5
	mov.l	r2,@r11
	mov.l	@(r0,r14),r4
	cmp/ge	r4,r5
	bt/s	.L0606D3AA
	add	#28,r13
	bra	.L0606D3AC
	mov	r5,r3
.L0606D3AA:
	mov	r4,r3
.L0606D3AC:
	mov.l	r3,@r11
	mov.l	.L0606D490,r3
	jsr	@r3
	mov	r13,r4
	mov	r0,r5
	bsr	gfsFlow_SctToFad
	mov	r10,r4
	mov.l	@(4,r10),r8
	mov.l	.L0606D494,r12
	add	r0,r8
	mov	#76,r0
	mov.l	@(r0,r14),r0
	cmp/eq	#1,r0
	bf	.L0606D3F8
	mov.l	.L0606D498,r5
	mov	#0,r6
	mov.l	.L0606D49C,r2
	jsr	@r2
	mov	r14,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606D3DA
	mov	#0,r4
.L0606D3DA:
	cmp/pl	r4
	bf	.L0606D3FA
	mov.l	.L0606D494,r2
	mov.w	.L0606D48A,r0
	mov.l	@r2,r3
	mov.l	@(r0,r3),r1
	cmp/ge	r1,r8
	bt	.L0606D3FA
	mov.l	@r12,r2
	mov.w	.L0606D48A,r0
	mov.l	@(r0,r2),r3
	sub	r8,r3
	sub	r3,r4
	bra	.L0606D3FA
	nop
.L0606D3F8:
	mov	#0,r4
.L0606D3FA:
	mov.l	@r11,r2
	cmp/ge	r2,r4
	bf	.L0606D436
	mov.l	@r11,r3
	mov	#88,r0
	mov.l	@(r0,r14),r2
	add	r3,r2
	mov.l	r2,@(r0,r14)
	mov	r2,r1
	mov	#84,r0
	mov.l	@(r0,r14),r0
	cmp/eq	r1,r0
	bf	.L0606D428
	mov.w	.L0606D48C,r0
	mov	#4,r2
	mov.l	r2,@r9
	mov.l	@r12,r3
	mov	r3,r2
	mov.l	@(r0,r2),r1
	add	#-4,r0
	mov.l	r1,@(r0,r3)
	bra	.L0606D432
	nop
.L0606D428:
	mov.w	.L0606D48A,r0
	mov	#2,r2
	mov.l	r2,@r9
	mov.l	@r12,r3
	mov.l	r8,@(r0,r3)
.L0606D432:
	bra	.L0606D4A2
	mov	#0,r0
.L0606D436:
	mov.l	@r11,r3
	mov.l	.L0606D490,r2
	sub	r4,r3
	mov.l	r3,@r11
	mov.l	r8,@(40,r13)
	jsr	@r2
	mov	r13,r4
	mov.l	@r11,r5
	add	r0,r5
	bsr	gfsFlow_SctToFad
	mov	r10,r4
	mov.l	@(4,r10),r2
	add	r2,r0
	mov.l	r0,@(44,r13)
	mov.l	@r12,r4
	mov.w	.L0606D48A,r0
	mov.l	@(r0,r4),r4
	mov.l	@(40,r13),r5
	cmp/gt	r5,r4
	bt	.L0606D4A0
	mov.l	@r12,r2
	mov.w	.L0606D48C,r0
	mov.l	@(r0,r2),r3
	cmp/ge	r3,r5
	bt	.L0606D4A0
	mov.l	@(44,r13),r1
	cmp/ge	r1,r4
	bt	.L0606D4A0
	mov.l	@r12,r2
	mov.w	.L0606D48C,r0
	mov.l	@(r0,r2),r3
	mov.l	@(44,r13),r1
	cmp/gt	r3,r1
	bt	.L0606D4A0
	mov.l	@r12,r3
	mov.l	@(40,r13),r2
	mov.w	.L0606D48A,r0
	mov.l	r2,@(r0,r3)
	mov	#1,r3
	mov.l	r3,@r9
	bra	.L0606D4A2
	mov	#0,r0
.L0606D48A:
	.short 0x00AC
.L0606D48C:
	.short 0x00B0
	.byte 0x00, 0x00
.L0606D490:
	.long gfcf_Tell
.L0606D494:
	.long gfs_mng
.L0606D498:
	.long 0x7FFFFFFF
.L0606D49C:
	.long gfcf_GetNumSct
.L0606D4A0:
	mov	#1,r0
.L0606D4A2:
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfsFlow_SetRange
