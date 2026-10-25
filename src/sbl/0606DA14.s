! sbl/0606DA14: matching source. The readable C for this object is 0606DA14.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0606DA14,"ax",@progbits
	.p2align 2

	glabel gfcd_Reserve
	mov.l	.L0606DB08,r5
	tst	r4,r4
	bt/s	.L0606DA2A
	mov.l	@r5,r6
	mov	#1,r4
	mov	#23,r0
	mov.b	r4,@(r0,r6)
	mov.l	@r5,r2
	add	#24,r2
	bra	.L0606DA38
	add	r2,r0
.L0606DA2A:
	mov	#0,r4
	mov	#23,r0
	mov.b	r4,@(r0,r6)
	mov.l	@r5,r2
	mov	r2,r3
	add	#24,r3
	add	r3,r0
.L0606DA38:
	rts
	mov.b	r4,@r0
	endlabel gfcd_Reserve

	glabel gfcd_Init
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov	#0,r12
	mov.l	.L0606DB0C,r3
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606DB08,r14
	add	#-24,r15
	mov.l	.L0606DB10,r13
	mov.l	r5,@(4,r15)
	mov.l	r4,@r14
	mov.l	r12,@r3
	mov.l	.L0606DB14,r2
	jsr	@r2
	mov.l	r12,@r13
	mov.l	@(4,r15),r4
	bsr	gfcd_Reserve
	nop
	mov	r15,r4
	add	#12,r4
	bsr	gfcd_GetStat
	nop
	mov.l	@r13,r4
	tst	r4,r4
	bt	.L0606DA7A
	bra	.L0606DC3E
	mov	r4,r0
.L0606DA7A:
	mov	#15,r11
	mov	r15,r0
	add	#12,r0
	mov.b	@r0,r0
	extu.b	r0,r0
	and	r11,r0
	cmp/eq	#9,r0
	bf	.L0606DA8E
	bra	.L0606DC3E
	mov	#-10,r0
.L0606DA8E:
	mov.l	.L0606DB18,r2
	jsr	@r2
	nop
	mov.l	.L0606DB1C,r3
	mov	#15,r7
	mov	#4,r6
	mov	#0,r5
	jsr	@r3
	mov	r5,r4
	mov.l	r0,@r15
	tst	r0,r0
	bt	.L0606DAAA
	bra	.L0606DC3E
	mov	#-2,r0
.L0606DAAA:
	mov	r12,r10
	mov.l	.L0606DB20,r9
.L0606DAAE:
	mov	#-1,r5
	jsr	@r9
	mov	#0,r4
	mov.l	r0,@r15
	tst	r0,r0
	bt	.L0606DACE
	mov.l	@r15,r0
	cmp/eq	#-1,r0
	bf	.L0606DAC6
	mov.l	.L0606DB24,r2
	cmp/gt	r2,r10
	bf	.L0606DACA
.L0606DAC6:
	bra	.L0606DC3E
	mov	#-2,r0
.L0606DACA:
	bra	.L0606DAAE
	add	#1,r10
.L0606DACE:
	mov.l	@r14,r3
	mov.l	.L0606DB24,r2
	mov.l	r2,@(60,r3)
	bra	.L0606DAE8
	nop
.L0606DAD8:
	mov.l	@r14,r1
	mov.l	@(60,r1),r3
	add	#-1,r3
	tst	r3,r3
	bf/s	.L0606DAE8
	mov.l	r3,@(60,r1)
	bra	.L0606DC3E
	mov	#-2,r0
.L0606DAE8:
	mov.l	.L0606DB28,r3
	jsr	@r3
	mov	#64,r4
	tst	r0,r0
	bt	.L0606DAD8
	mov.l	@r14,r3
	mov.l	.L0606DB2C,r2
	mov.l	r12,@(60,r3)
	jsr	@r2
	mov	#-25,r4
	mov.w	.L0606DB04,r8
	mov	r12,r9
	bra	.L0606DB80
	mov	r12,r10
.L0606DB04:
	.short 0xFBFF
	.byte 0x00, 0x00
.L0606DB08:
	.long gfcd_work
.L0606DB0C:
	.long gfcd_play
.L0606DB10:
	.long gfcd_err
.L0606DB14:
	.long gfcd_ResetWork
.L0606DB18:
	.long CDC_AbortFile
.L0606DB1C:
	.long CDC_CdInit
.L0606DB20:
	.long CDC_SetSctLen
.L0606DB24:
	.long 0x00030000
.L0606DB28:
	.long gfcd_TestHirq
.L0606DB2C:
	.long CDC_ClrHirqReq
.L0606DB30:
	mov.w	.L0606DBFC,r4
	mov.l	.L0606DC04,r2
	jsr	@r2
	nop
	tst	r0,r0
	bt	.L0606DB80
	mov.l	.L0606DC08,r2
	jsr	@r2
	mov	r8,r4
	add	#1,r9
	mov.w	.L0606DBFE,r3
	cmp/gt	r3,r9
	bf	.L0606DB4E
	bra	.L0606DC3E
	mov	#-2,r0
.L0606DB4E:
	mov	r15,r4
	add	#12,r4
	bsr	gfcd_GetStat
	nop
	mov.l	@r13,r0
	tst	r0,r0
	bt	.L0606DB60
	bra	.L0606DC3E
	mov.l	@r13,r0
.L0606DB60:
	mov	r15,r0
	add	#12,r0
	mov.b	@r0,r0
	extu.b	r0,r0
	and	r11,r0
	cmp/eq	#1,r0
	bt	.L0606DB7E
	cmp/eq	#2,r0
	bt	.L0606DB7E
	cmp/eq	#9,r0
	bt	.L0606DB7A
	bra	.L0606DB80
	nop
.L0606DB7A:
	bra	.L0606DC3E
	mov	#-10,r0
.L0606DB7E:
	mov	#1,r10
.L0606DB80:
	tst	r10,r10
	bt	.L0606DB30
	mov.l	.L0606DC0C,r3
	mov	r15,r4
	jsr	@r3
	nop
	mov.l	.L0606DC10,r3
	mov.l	@r3,r11
	mov.w	.L0606DC00,r2
	add	r2,r11
	mov.l	.L0606DC14,r1
	jsr	@r1
	mov	r11,r4
	tst	r0,r0
	mov.l	r0,@r15
	bt	.L0606DBA4
	bra	.L0606DC3E
	mov	#-2,r0
.L0606DBA4:
	mov.l	.L0606DC18,r3
	mov	r15,r5
	add	#8,r5
	jsr	@r3
	mov	#0,r4
	mov	r15,r5
	mov.l	.L0606DC18,r3
	mov	r15,r4
	add	#8,r5
	add	#8,r4
	mov.b	@r4,r4
	jsr	@r3
	extu.b	r4,r4
	mov	r15,r0
	mov.l	.L0606DC1C,r2
	add	#8,r0
	mov.b	@r0,r0
	extu.b	r0,r0
	add	#-1,r0
	shll2	r0
	mov.l	@(r0,r11),r3
	tst	r2,r3
	bf	.L0606DBD6
	bra	.L0606DC3E
	mov	#-15,r0
.L0606DBD6:
	mov.w	.L0606DC02,r5
	mov.l	.L0606DC20,r3
	mov	r5,r4
	jsr	@r3
	add	#-3,r4
	mov.l	r0,@r15
	mov.l	@r14,r3
	mov.l	.L0606DC24,r2
	mov.l	r2,@(60,r3)
	bra	.L0606DC28
	nop
.L0606DBEC:
	mov.l	@r14,r1
	mov.l	@(60,r1),r3
	add	#-1,r3
	tst	r3,r3
	bf/s	.L0606DC28
	mov.l	r3,@(60,r1)
	bra	.L0606DC3E
	mov	#-2,r0
.L0606DBFC:
	.short 0x0400
.L0606DBFE:
	.short 0x0258
.L0606DC00:
	.short 0x0460
.L0606DC02:
	.short 0x00FF
.L0606DC04:
	.long gfcd_TestHirq
.L0606DC08:
	.long CDC_ClrHirqReq
.L0606DC0C:
	.long CDC_DataEnd
.L0606DC10:
	.long gfs_mng
.L0606DC14:
	.long CDC_TgetToc
.L0606DC18:
	.long CDC_GetSes
.L0606DC1C:
	.long 0x40000000
.L0606DC20:
	.long CDC_ResetSelector
.L0606DC24:
	.long 0x00030000
.L0606DC28:
	mov.l	.L0606DE20,r3
	jsr	@r3
	mov	#64,r4
	tst	r0,r0
	bt	.L0606DBEC
	mov.l	@r14,r3
	mov.l	r12,@(60,r3)
	mov.l	@r14,r4
	bsr	gfcd_GetStat
	add	#64,r4
	mov.l	@r13,r0
.L0606DC3E:
	add	#24,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfcd_Init

	glabel gfcd_AllocFilt
	mov	#0,r5
	mov.l	.L0606DE24,r6
	mov	#1,r1
	mov	#24,r7
.L0606DC5A:
	mov.l	@r6,r3
	add	#24,r3
	add	r5,r3
	mov.b	@r3,r2
	tst	r2,r2
	bf	.L0606DC74
	mov.l	@r6,r3
	add	#24,r3
	add	r5,r3
	mov.b	r1,@r3
	mov.l	r5,@r4
	rts
	mov	#0,r0
.L0606DC74:
	add	#1,r5
	cmp/ge	r7,r5
	bf	.L0606DC5A
	mov	#-1,r3
	mov.l	r3,@r4
	mov	#-3,r0
	rts
	nop
	endlabel gfcd_AllocFilt

	glabel gfcd_FreeFilt
	cmp/pz	r4
	bf	.L0606DC8E
	mov	#24,r2
	cmp/ge	r2,r4
	bf	.L0606DC92
.L0606DC8E:
	rts
	mov	#-6,r0
.L0606DC92:
	mov.l	.L0606DE24,r2
	mov.l	@r2,r5
	mov	r5,r0
	add	#24,r0
	mov.b	@(r0,r4),r0
	cmp/eq	#1,r0
	bt	.L0606DCA4
	rts
	mov	#-7,r0
.L0606DCA4:
	mov	r5,r2
	add	#24,r2
	add	r2,r4
	mov	#0,r3
	mov.b	r3,@r4
	mov	r3,r0
	rts
	nop
	endlabel gfcd_FreeFilt

	glabel gfcd_AllocBuf
	mov.l	.L0606DE24,r6
	mov	#0,r5
	mov	#1,r1
	mov	#24,r7
.L0606DCBC:
	mov.l	@r6,r0
	mov.b	@(r0,r5),r3
	tst	r3,r3
	bf	.L0606DCCE
	mov.l	@r6,r0
	mov.b	r1,@(r0,r5)
	mov.l	r5,@r4
	rts
	mov	#0,r0
.L0606DCCE:
	add	#1,r5
	cmp/ge	r7,r5
	bf	.L0606DCBC
	mov	#-1,r2
	mov	#-4,r0
	mov.l	r2,@r4
	rts
	nop
	endlabel gfcd_AllocBuf

	glabel gfcd_FreeBuf
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov	r4,r14
	mov.l	.L0606DE28,r4
	mov.l	@r4,r0
	cmp/eq	#-16,r0
	bf	.L0606DCF0
	mov	#0,r2
	mov.l	r2,@r4
.L0606DCF0:
	cmp/pz	r14
	bf	.L0606DCFA
	mov	#24,r2
	cmp/ge	r2,r14
	bf	.L0606DD02
.L0606DCFA:
	mov	#-6,r0
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606DD02:
	mov.l	.L0606DE24,r3
	mov.l	@r3,r0
	mov.b	@(r0,r14),r0
	cmp/eq	#1,r0
	bt	.L0606DD14
	lds.l	@r15+,pr
	mov	#-7,r0
	rts
	mov.l	@r15+,r14
.L0606DD14:
	mov	#-1,r6
	mov	#0,r5
	bsr	gfcd_DelSct
	mov	r14,r4
	mov.l	.L0606DE2C,r4
	bsr	gfcd_SetTimeout
	nop
.L0606DD22:
	bsr	gfcd_ExecServer
	nop
	cmp/eq	#3,r0
	bf/s	.L0606DD34
	mov	r0,r4
	lds.l	@r15+,pr
	mov	#-12,r0
	rts
	mov.l	@r15+,r14
.L0606DD34:
	mov	r4,r0
	cmp/eq	#2,r0
	bf	.L0606DD42
	mov	#-16,r0
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606DD42:
	bsr	gfcd_DelDone
	mov	r14,r4
	cmp/eq	#1,r0
	bf	.L0606DD22
	bsr	gfcd_SetTimeout
	mov	#0,r4
	mov	#0,r2
	mov.l	.L0606DE24,r3
	mov.l	@r3,r0
	mov.b	r2,@(r0,r14)
	mov	r2,r0
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel gfcd_FreeBuf

	glabel gfcd_GetLastSesFad
	sts.l	pr,@-r15
	mov.l	.L0606DE30,r3
	add	#-4,r15
	mov	r15,r5
	jsr	@r3
	mov	#0,r4
	mov	r15,r5
	mov.l	.L0606DE30,r3
	mov	r15,r4
	mov.b	@r4,r4
	jsr	@r3
	extu.b	r4,r4
	mov	r15,r0
	mov.l	.L0606DE34,r3
	mov.l	@r0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	and	r3,r0
	endlabel gfcd_GetLastSesFad

	glabel gfcd_Lock
	mov.l	.L0606DE24,r4
	mov.l	@r4,r5
	mov.l	@(48,r5),r0
	cmp/eq	#1,r0
	bf	.L0606DD92
	rts
	mov	#-5,r0
.L0606DD92:
	mov	#1,r2
	mov.l	r2,@(48,r5)
	mov.l	@r4,r3
	mov.l	@(56,r3),r2
	add	#1,r2
	mov.l	r2,@(56,r3)
	mov.l	@r4,r3
	mov.l	@(56,r3),r2
	cmp/pz	r2
	bt	.L0606DDAC
	mov	#0,r3
	mov.l	@r4,r1
	mov.l	r3,@(56,r1)
.L0606DDAC:
	mov.l	@r4,r0
	mov.l	@(56,r0),r0
	rts
	nop
	endlabel gfcd_Lock

	glabel gfcd_Unlock
	mov.l	.L0606DE24,r3
	mov.l	@r3,r5
	mov.l	@(48,r5),r0
	tst	r0,r0
	bf	.L0606DDC2
	rts
	mov	#-7,r0
.L0606DDC2:
	mov.l	@(56,r5),r3
	cmp/eq	r4,r3
	bt	.L0606DDCC
	rts
	mov	#-9,r0
.L0606DDCC:
	mov	#0,r4
	mov	r4,r0
	mov.l	r4,@(48,r5)
	rts
	nop
	endlabel gfcd_Unlock

	glabel gfcd_IsLocked
	mov.l	.L0606DE24,r3
	mov.l	@r3,r5
	mov.l	@(48,r5),r0
	tst	r0,r0
	bf	.L0606DDE4
	rts
	mov	#0,r0
.L0606DDE4:
	mov.l	@(56,r5),r3
	cmp/eq	r4,r3
	bf	.L0606DDEE
	rts
	mov	#1,r0
.L0606DDEE:
	mov	#0,r0
	rts
	nop
	endlabel gfcd_IsLocked

	glabel gfcd_SetFilt
	mov.l	r14,@-r15
	mov	#84,r0
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L0606DE24,r14
	mov.l	@r14,r13
	mov.l	@(r0,r13),r12
	mov	r13,r0
	add	#24,r0
	mov.b	@(r0,r4),r0
	cmp/eq	#1,r0
	bt	.L0606DE14
	bra	.L0606DE94
	mov	#-7,r0
.L0606DE14:
	mov	#24,r2
	cmp/ge	r2,r12
	bf	.L0606DE38
	bra	.L0606DE94
	mov	#-8,r0
	.byte 0x00, 0x00
.L0606DE20:
	.long gfcd_TestHirq
.L0606DE24:
	.long gfcd_work
.L0606DE28:
	.long gfcd_err
.L0606DE2C:
	.long 0x00030000
.L0606DE30:
	.long CDC_GetSes
.L0606DE34:
	.long 0x00FFFFFF
.L0606DE38:
	mov	#88,r0
	mov.l	@(r0,r13),r1
	tst	r1,r1
	bf	.L0606DE46
	mov	#1,r3
	mov	#88,r0
	mov.l	r3,@(r0,r13)
.L0606DE46:
	mov	r12,r13
	mov.l	@r14,r3
	mov	r5,r0
	shll2	r13
	shll2	r13
	add	#92,r3
	add	r13,r3
	mov.b	r4,@r3
	mov	r6,r2
	mov.l	@r14,r3
	add	#92,r3
	add	r13,r3
	mov.b	r0,@(1,r3)
	mov.l	@r14,r1
	add	#92,r1
	mov.l	.L0606DF68,r3
	add	r13,r1
	add	#2,r1
	jsr	@r3
	mov	#6,r0
	mov	#84,r0
	mov.l	@r14,r3
	mov	r15,r4
	add	#92,r3
	add	r13,r3
	mov.l	r7,@(8,r3)
	mov.l	@r14,r2
	mov	r2,r3
	add	#92,r3
	mov.l	@(20,r15),r2
	add	r3,r13
	mov.l	r2,@(12,r13)
	mov.l	@r14,r3
	mov.l	@(r0,r3),r2
	add	#1,r2
	mov.l	r2,@(r0,r3)
	bsr	gfcd_ExecFilt
	nop
	mov	#0,r0
.L0606DE94:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfcd_SetFilt

	glabel gfcd_GetFilt
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	.L0606DF6C,r3
	mov.l	r4,@r15
	mov.l	r6,@(4,r15)
	mov.l	@r15,r4
	jsr	@r3
	nop
	mov	r0,r4
	tst	r4,r4
	bt	.L0606DEBE
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov	#-10,r0
.L0606DEBE:
	mov.l	@(4,r15),r5
	mov.l	@r15,r4
	mov.l	.L0606DF70,r3
	jsr	@r3
	nop
	mov	r0,r4
	tst	r4,r4
	bt	.L0606DED6
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov	#-10,r0
.L0606DED6:
	mov.l	.L0606DF74,r3
	jsr	@r3
	nop
	mov	#0,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfcd_GetFilt

	glabel gfcd_SetCdCon
	sts.l	pr,@-r15
	mov.w	.L0606DF62,r3
	add	#-4,r15
	cmp/eq	r3,r4
	bt	.L0606DF04
	mov.l	.L0606DF78,r2
	mov.l	@r2,r0
	add	#24,r0
	mov.b	@(r0,r4),r0
	cmp/eq	#1,r0
	bt	.L0606DF04
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#-7,r0
.L0606DF04:
	mov.l	.L0606DF78,r7
	mov.l	@r7,r6
	mov.l	@(56,r6),r3
	cmp/eq	r5,r3
	bt	.L0606DF16
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#-9,r0
.L0606DF16:
	mov	#1,r3
	mov.w	.L0606DF64,r0
	mov.l	r3,@(r0,r6)
	mov.l	@r7,r2
	add	#4,r0
	mov.l	r4,@(r0,r2)
	mov	r15,r4
	bsr	gfcd_ExecCdCon
	nop
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfcd_SetCdCon

	glabel gfcd_Play
	sts.l	pr,@-r15
	mov.l	.L0606DF78,r2
	add	#-16,r15
	mov.l	r4,@r15
	mov.l	@r2,r3
	mov.l	@(56,r3),r1
	cmp/eq	r5,r1
	bt	.L0606DF4A
	add	#16,r15
	lds.l	@r15+,pr
	rts
	mov	#-9,r0
.L0606DF4A:
	mov	r15,r4
	add	#4,r4
	bsr	gfcd_GetStat
	nop
	mov.l	.L0606DF7C,r3
	mov.l	@r3,r4
	tst	r4,r4
	bt	.L0606DF80
	add	#16,r15
	lds.l	@r15+,pr
	rts
	mov	r4,r0
.L0606DF62:
	.short 0x00FF
.L0606DF64:
	.short 0x0304
	.byte 0x00, 0x00
.L0606DF68:
	.long _slow_mvn
.L0606DF6C:
	.long CDC_GetFiltMode
.L0606DF70:
	.long CDC_GetFiltSubh
.L0606DF74:
	.long gfcd_UpdStat
.L0606DF78:
	.long gfcd_work
.L0606DF7C:
	.long gfcd_err
.L0606DF80:
	mov.l	.L0606E0B4,r3
	jsr	@r3
	mov	#-21,r4
	mov.l	@r15,r4
	mov.l	.L0606E0B8,r3
	jsr	@r3
	nop
	mov	#1,r2
	mov.l	.L0606E0BC,r3
	mov	#0,r0
	mov.l	r2,@r3
	add	#16,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfcd_Play

	glabel gfcd_GetSctNum
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L0606E0C0,r14
	mov.l	@r14,r1
	mov.w	.L0606E0AA,r0
	mov.l	@(r0,r1),r0
	tst	r0,r0
	bt	.L0606DFBA
	mov	#-1,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606DFBA:
	mov	#1,r3
	mov.w	.L0606E0AA,r0
	mov.l	r3,@(r0,r1)
	mov.l	@r14,r2
	add	#4,r0
	mov.l	r4,@(r0,r2)
	add	#4,r0
	mov.l	@r14,r3
	mov	#0,r2
	mov.l	r5,@(r0,r3)
	mov	r15,r4
	mov.l	@r14,r3
	add	#4,r0
	mov.l	r6,@(r0,r3)
	add	#4,r0
	mov.l	@r14,r3
	mov.l	r2,@(r0,r3)
	mov.l	@r14,r3
	add	#4,r0
	mov.l	r7,@(r0,r3)
	mov.l	@r14,r3
	mov.l	@(12,r15),r2
	mov.w	.L0606E0AC,r0
	mov.l	r2,@(r0,r3)
	bsr	gfcd_ExecGetSct
	nop
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel gfcd_GetSctNum

	glabel gfcd_StartTrans
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L0606E0C0,r7
	mov.l	@r7,r1
	mov.w	.L0606E0AE,r0
	mov.l	@(r0,r1),r0
	tst	r0,r0
	bt	.L0606E010
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#-1,r0
.L0606E010:
	mov.l	@(52,r1),r0
	cmp/eq	#-1,r0
	bt	.L0606E01E
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#-5,r0
.L0606E01E:
	mov	#1,r3
	mov.w	.L0606E0AE,r0
	mov.l	r4,@(52,r1)
	mov.l	@r7,r2
	mov.l	r3,@(r0,r2)
	mov.l	@r7,r2
	add	#4,r0
	mov.l	r4,@(r0,r2)
	add	#4,r0
	mov.l	@r7,r3
	mov	r15,r4
	mov.l	r5,@(r0,r3)
	add	#4,r0
	mov.l	@r7,r3
	mov.l	r6,@(r0,r3)
	bsr	gfcd_ExecTrans
	nop
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfcd_StartTrans

	glabel gfcd_EndTrans
	sts.l	pr,@-r15
	mov.l	.L0606E0C0,r3
	mov.l	@r3,r0
	mov.l	@(52,r0),r0
	cmp/eq	#-1,r0
	bf	.L0606E05C
	lds.l	@r15+,pr
	rts
	mov	#-7,r0
.L0606E05C:
	mov.l	.L0606E0C4,r3
	jsr	@r3
	nop
	mov	r0,r4
	mov.l	.L0606E0C0,r3
	mov	#-1,r1
	mov.l	@r3,r2
	tst	r4,r4
	bt/s	.L0606E076
	mov.l	r1,@(52,r2)
	lds.l	@r15+,pr
	rts
	mov	#-10,r0
.L0606E076:
	mov.l	.L0606E0C8,r3
	jsr	@r3
	nop
	mov	#0,r0
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfcd_EndTrans

	glabel gfcd_DelSct
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L0606E0C0,r1
	mov.l	@r1,r7
	mov.w	.L0606E0B0,r0
	mov.l	@(r0,r7),r0
	tst	r0,r0
	bt	.L0606E09C
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#-1,r0
.L0606E09C:
	mov.l	@(52,r7),r3
	cmp/eq	r4,r3
	bf	.L0606E0CC
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#-5,r0
.L0606E0AA:
	.short 0x030C
.L0606E0AC:
	.short 0x0324
.L0606E0AE:
	.short 0x0328
.L0606E0B0:
	.short 0x0338
	.byte 0x00, 0x00
.L0606E0B4:
	.long CDC_ClrHirqReq
.L0606E0B8:
	.long CDC_CdPlay
.L0606E0BC:
	.long gfcd_play
.L0606E0C0:
	.long gfcd_work
.L0606E0C4:
	.long CDC_DataEnd
.L0606E0C8:
	.long gfcd_UpdStat
.L0606E0CC:
	mov.w	.L0606E1CA,r0
	mov	#1,r3
	mov.l	r3,@(r0,r7)
	add	#4,r0
	mov.l	@r1,r2
	mov.l	r4,@(r0,r2)
	mov.l	@r1,r3
	add	#4,r0
	mov.l	r5,@(r0,r3)
	mov	r15,r4
	mov.l	@r1,r3
	add	#4,r0
	mov.l	r6,@(r0,r3)
	bsr	gfcd_ExecDel
	nop
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfcd_DelSct

	glabel gfcd_DelDone
	mov.l	.L0606E1D0,r3
	mov.l	@r3,r5
	mov.w	.L0606E1CA,r0
	mov.l	@(r0,r5),r0
	tst	r0,r0
	bt	.L0606E10C
	mov.w	.L0606E1CC,r0
	mov.l	@(r0,r5),r2
	cmp/eq	r4,r2
	bf	.L0606E10C
	rts
	mov	#0,r0
.L0606E10C:
	mov	#1,r0
	rts
	nop
	endlabel gfcd_DelDone

	glabel gfcd_GetStat
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606E1D4,r5
	add	#-8,r15
	mov.l	@r5,r0
	cmp/eq	#1,r0
	bf/s	.L0606E12C
	mov	r4,r14
	mov	#-8,r4
	mov	#0,r2
	bra	.L0606E134
	mov.l	r2,@r5
.L0606E12C:
	mov.l	.L0606E1D8,r2
	jsr	@r2
	mov	r14,r4
	mov	r0,r4
.L0606E134:
	tst	r4,r4
	bt	.L0606E13E
	mov.l	.L0606E1DC,r3
	jsr	@r3
	mov	r14,r4
.L0606E13E:
	mov.l	.L0606E1E0,r2
	jsr	@r2
	nop
	mov.l	.L0606E1E4,r4
	mov	#32,r3
	mov	r0,r13
	tst	r13,r3
	bf/s	.L0606E166
	mov	#-13,r5
	mov.b	@r14,r0
	extu.b	r0,r0
	and	#15,r0
	cmp/eq	#6,r0
	bt	.L0606E166
	cmp/eq	#7,r0
	bt	.L0606E16A
	cmp/eq	#10,r0
	bt	.L0606E170
	bra	.L0606E18E
	nop
.L0606E166:
	bra	.L0606E18E
	mov.l	r5,@r4
.L0606E16A:
	mov	#-14,r2
	bra	.L0606E18E
	mov.l	r2,@r4
.L0606E170:
	mov	#-16,r1
	mov	r15,r3
	mov.l	r1,@r4
	mov	#0,r2
	mov.l	r2,@r3
	mov	r15,r4
	mov.l	.L0606E1E8,r3
	jsr	@r3
	nop
	mov.l	.L0606E1EC,r2
	jsr	@r2
	nop
	mov.l	.L0606E1EC,r3
	jsr	@r3
	nop
.L0606E18E:
	mov	r13,r0
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfcd_GetStat

	glabel gfcd_Seek
	sts.l	pr,@-r15
	mov.l	.L0606E1D0,r2
	add	#-16,r15
	mov.l	r4,@r15
	mov.l	@r2,r3
	mov.l	@(56,r3),r1
	cmp/eq	r5,r1
	bt	.L0606E1B2
	add	#16,r15
	lds.l	@r15+,pr
	rts
	mov	#-9,r0
.L0606E1B2:
	mov	r15,r4
	add	#4,r4
	bsr	gfcd_GetStat
	nop
	mov.l	.L0606E1E4,r3
	mov.l	@r3,r4
	tst	r4,r4
	bt	.L0606E1F0
	add	#16,r15
	lds.l	@r15+,pr
	rts
	mov	r4,r0
.L0606E1CA:
	.short 0x0338
.L0606E1CC:
	.short 0x033C
	.byte 0x00, 0x00
.L0606E1D0:
	.long gfcd_work
.L0606E1D4:
	.long gfcd_play
.L0606E1D8:
	.long CDC_GetPeriStat
.L0606E1DC:
	.long CDC_GetCurStat
.L0606E1E0:
	.long CDC_GetHirqReq
.L0606E1E4:
	.long gfcd_err
.L0606E1E8:
	.long CDC_CdSeek
.L0606E1EC:
	.long gfcd_WaitScdq
.L0606E1F0:
	mov.l	@r15,r4
	mov.l	.L0606E2F8,r3
	jsr	@r3
	nop
	mov	#0,r0
	add	#16,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfcd_Seek

	glabel gfcd_MoveSct
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606E2FC,r14
	add	#-8,r15
	mov.l	@r14,r13
	mov	r13,r0
	add	#24,r0
	mov.l	r0,@(4,r15)
	mov.b	@(r0,r4),r3
	tst	r3,r3
	bt	.L0606E224
	mov.l	@(4,r15),r2
	add	r5,r2
	mov.b	@r2,r3
	tst	r3,r3
	bf	.L0606E228
.L0606E224:
	bra	.L0606E25A
	mov	#-7,r0
.L0606E228:
	mov.w	.L0606E2F2,r0
	mov.l	@(r0,r13),r1
	tst	r1,r1
	bt	.L0606E234
	bra	.L0606E25A
	mov	#-1,r0
.L0606E234:
	mov.w	.L0606E2F2,r0
	mov	#1,r3
	mov.l	r3,@(r0,r13)
	add	#4,r0
	mov.l	@r14,r2
	mov.l	r4,@(r0,r2)
	mov.l	@r14,r3
	add	#4,r0
	mov.l	r5,@(r0,r3)
	mov	r15,r4
	mov.l	@r14,r3
	add	#4,r0
	mov.l	r6,@(r0,r3)
	add	#4,r0
	mov.l	@r14,r3
	mov.l	r7,@(r0,r3)
	bsr	gfcd_ExecMove
	nop
	mov	#0,r0
.L0606E25A:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfcd_MoveSct

	glabel gfcd_MoveDone
	mov.l	.L0606E2FC,r2
	mov.l	@r2,r3
	mov.w	.L0606E2F2,r0
	mov.l	@(r0,r3),r0
	tst	r0,r0
	bt	.L0606E274
	rts
	mov	#0,r0
.L0606E274:
	mov	#1,r0
	rts
	nop
	endlabel gfcd_MoveDone

	glabel gfcd_GetSctInfo
	cmp/pz	r4
	sts.l	pr,@-r15
	bf	.L0606E286
	mov	#24,r2
	cmp/ge	r2,r4
	bf	.L0606E28C
.L0606E286:
	lds.l	@r15+,pr
	rts
	mov	#-6,r0
.L0606E28C:
	mov.l	.L0606E2FC,r3
	mov.l	@r3,r0
	mov.b	@(r0,r4),r2
	tst	r2,r2
	bf	.L0606E29C
	lds.l	@r15+,pr
	rts
	mov	#-7,r0
.L0606E29C:
	mov.l	.L0606E300,r3
	jsr	@r3
	nop
	mov	r0,r4
	tst	r4,r4
	bt	.L0606E2AE
	lds.l	@r15+,pr
	rts
	mov	#-10,r0
.L0606E2AE:
	bsr	gfcd_UpdStat
	nop
	mov	#0,r0
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfcd_GetSctInfo

	glabel gfcd_ChgDir
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L0606E2FC,r14
	mov.l	@r14,r7
	mov	r7,r0
	add	#24,r0
	mov.b	@(r0,r5),r0
	cmp/eq	#1,r0
	bf	.L0606E2D6
	mov	r7,r0
	mov.b	@(r0,r5),r0
	cmp/eq	#1,r0
	bt	.L0606E2E0
.L0606E2D6:
	mov	#-5,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606E2E0:
	mov.w	.L0606E2F4,r0
	mov.l	@(r0,r7),r1
	tst	r1,r1
	bt	.L0606E304
	mov	#-1,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606E2F2:
	.short 0x0348
.L0606E2F4:
	.short 0x0360
	.byte 0x00, 0x00
.L0606E2F8:
	.long CDC_CdSeek
.L0606E2FC:
	.long gfcd_work
.L0606E300:
	.long CDC_GetSctInfo
.L0606E304:
	mov	r4,r0
	cmp/eq	#-1,r0
	bf	.L0606E312
	mov	#3,r2
	mov.w	.L0606E3C0,r0
	bra	.L0606E318
	mov.l	r2,@(r0,r7)
.L0606E312:
	mov	#1,r1
	mov.w	.L0606E3C0,r0
	mov.l	r1,@(r0,r7)
.L0606E318:
	mov.l	@r14,r3
	mov.w	.L0606E3C2,r0
	mov.w	r4,@(r0,r3)
	add	#2,r0
	mov.l	@r14,r3
	mov	r15,r4
	mov.w	r5,@(r0,r3)
	add	#2,r0
	mov.l	@r14,r3
	mov.l	r6,@(r0,r3)
	bsr	gfcd_ExecChgDir
	nop
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel gfcd_ChgDir

	glabel gfcd_SetFiltCon
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L0606E3C8,r14
	mov.l	@r14,r7
	mov.w	.L0606E3C4,r0
	mov.w	.L0606E3C6,r13
	cmp/eq	r13,r4
	bt/s	.L0606E362
	mov.l	@(r0,r7),r12
	mov	r4,r0
	cmp/eq	#-2,r0
	bt	.L0606E362
	cmp/pz	r4
	bf	.L0606E37E
	mov	#24,r2
	cmp/ge	r2,r4
	bt	.L0606E37E
.L0606E362:
	cmp/pz	r5
	bf	.L0606E37E
	mov	#24,r3
	cmp/ge	r3,r5
	bt	.L0606E37E
	cmp/eq	r13,r6
	bt	.L0606E382
	mov	r6,r0
	cmp/eq	#-2,r0
	bt	.L0606E382
	cmp/pz	r6
	bf	.L0606E37E
	cmp/ge	r3,r6
	bf	.L0606E382
.L0606E37E:
	bra	.L0606E416
	mov	#-6,r0
.L0606E382:
	cmp/eq	r13,r4
	bt	.L0606E396
	mov	r4,r0
	cmp/eq	#-2,r0
	bt	.L0606E396
	mov	r7,r0
	add	#24,r0
	mov.b	@(r0,r4),r0
	cmp/eq	#1,r0
	bf	.L0606E3B2
.L0606E396:
	cmp/eq	r13,r6
	bt	.L0606E3AA
	mov	r6,r0
	cmp/eq	#-2,r0
	bt	.L0606E3AA
	mov	r7,r0
	add	#24,r0
	mov.b	@(r0,r6),r0
	cmp/eq	#1,r0
	bf	.L0606E3B2
.L0606E3AA:
	mov	r7,r0
	mov.b	@(r0,r5),r0
	cmp/eq	#1,r0
	bt	.L0606E3B6
.L0606E3B2:
	bra	.L0606E416
	mov	#-7,r0
.L0606E3B6:
	mov	#24,r2
	cmp/ge	r2,r12
	bf	.L0606E3CC
	bra	.L0606E416
	mov	#-8,r0
.L0606E3C0:
	.short 0x0360
.L0606E3C2:
	.short 0x0364
.L0606E3C4:
	.short 0x01DC
.L0606E3C6:
	.short 0x00FF
.L0606E3C8:
	.long gfcd_work
.L0606E3CC:
	mov.w	.L0606E4B2,r0
	mov.l	@(r0,r7),r1
	tst	r1,r1
	bf	.L0606E3DA
	mov.w	.L0606E4B2,r0
	mov	#1,r3
	mov.l	r3,@(r0,r7)
.L0606E3DA:
	mov	r12,r7
	mov.w	.L0606E4B6,r0
	mov	r12,r3
	mov.l	@r14,r2
	shll	r7
	add	r3,r7
	shll2	r7
	mov.w	.L0606E4B4,r3
	exts.w	r7,r7
	add	r3,r2
	add	r7,r2
	mov.l	r4,@r2
	mov	r3,r1
	mov.l	@r14,r2
	mov	r15,r4
	add	r2,r1
	add	r7,r1
	mov.l	r5,@(4,r1)
	mov	r3,r1
	mov.l	@r14,r2
	add	r2,r1
	add	r1,r7
	mov.l	r6,@(8,r7)
	mov.l	@r14,r2
	mov.l	@(r0,r2),r1
	add	#1,r1
	mov.l	r1,@(r0,r2)
	bsr	gfcd_ExecCon
	nop
	mov	#0,r0
.L0606E416:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfcd_SetFiltCon

	glabel gfcd_GetFileInfo
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r14
	mov.l	.L0606E4BC,r3
	mov	r5,r13
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	add	#-12,r15
	mov	r15,r6
	add	#8,r6
	mov	r15,r5
	add	#4,r5
	mov	r15,r4
	jsr	@r3
	nop
	mov	r0,r4
	tst	r4,r4
	bt	.L0606E44A
	bra	.L0606E4F4
	mov	#-11,r0
.L0606E44A:
	mov.l	@r15,r3
	cmp/ge	r3,r14
	bf	.L0606E45A
	mov.l	@(4,r15),r3
	mov.l	@r15,r2
	add	r3,r2
	cmp/gt	r14,r2
	bt	.L0606E4A0
.L0606E45A:
	mov	r14,r5
	mov.l	.L0606E4C0,r3
	jsr	@r3
	mov	#23,r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606E46C
	bra	.L0606E4F4
	mov	#-11,r0
.L0606E46C:
	mov.w	.L0606E4B8,r12
.L0606E46E:
	bsr	gfcd_TestHirq
	mov	r12,r4
	tst	r0,r0
	bt	.L0606E46E
	mov	r15,r6
	mov.l	.L0606E4BC,r3
	mov	r15,r5
	add	#8,r6
	add	#4,r5
	mov	r15,r4
	jsr	@r3
	nop
	mov	r0,r4
	tst	r4,r4
	bf	.L0606E49C
	mov.l	@r15,r3
	cmp/ge	r3,r14
	bt	.L0606E4A0
	mov.l	@(4,r15),r3
	mov.l	@r15,r2
	add	r3,r2
	cmp/gt	r14,r2
	bt	.L0606E4A0
.L0606E49C:
	bra	.L0606E4F4
	mov	#-11,r0
.L0606E4A0:
	mov.l	.L0606E4C4,r3
	mov	r13,r5
	jsr	@r3
	mov	r14,r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606E4C8
	bra	.L0606E4F4
	mov	#-11,r0
.L0606E4B2:
	.short 0x01E0
.L0606E4B4:
	.short 0x01E4
.L0606E4B6:
	.short 0x01DC
.L0606E4B8:
	.short 0x0200
	.byte 0x00, 0x00
.L0606E4BC:
	.long CDC_GetFileScope
.L0606E4C0:
	.long CDC_ReadDir
.L0606E4C4:
	.long CDC_TgetFileInfo
.L0606E4C8:
	mov.b	@(11,r13),r0
	extu.b	r0,r0
	tst	#2,r0
	bt	.L0606E4D6
	mov.b	@(11,r13),r0
	or	#128,r0
	mov.b	r0,@(11,r13)
.L0606E4D6:
	mov.l	@(8,r15),r1
	tst	r1,r1
	bt	.L0606E4EE
	mov.l	@(4,r15),r3
	mov.l	@r15,r2
	add	r3,r2
	add	#-1,r2
	cmp/eq	r14,r2
	bf	.L0606E4EE
	mov.b	@(11,r13),r0
	or	#1,r0
	mov.b	r0,@(11,r13)
.L0606E4EE:
	bsr	gfcd_UpdStat
	nop
	mov	#0,r0
.L0606E4F4:
	add	#12,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfcd_GetFileInfo

	glabel gfcd_GetFreeSiz
	sts.l	pr,@-r15
	add	#-12,r15
	mov.l	.L0606E5C0,r3
	mov	r15,r6
	mov	r15,r5
	add	#8,r5
	mov	r15,r4
	add	#4,r4
	jsr	@r3
	nop
	mov	r0,r4
	tst	r4,r4
	bt	.L0606E522
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov	#-10,r0
.L0606E522:
	bsr	gfcd_UpdStat
	nop
	mov.l	@r15,r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfcd_GetFreeSiz

	glabel gfcd_ExecServer
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov	#0,r13
	mov.l	.L0606E5C4,r14
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	r13,@r15
	mov.l	@r14,r4
	mov.l	@(60,r4),r1
	tst	r1,r1
	bt/s	.L0606E560
	mov	r13,r12
	mov.l	@(60,r4),r3
	add	#-1,r3
	cmp/pl	r3
	bt/s	.L0606E560
	mov.l	r3,@(60,r4)
	bsr	gfcd_ResetWork
	nop
	bra	.L0606E5EC
	mov	#3,r0
.L0606E560:
	mov.l	@r14,r4
	bsr	gfcd_GetStat
	add	#64,r4
	mov.l	.L0606E5C8,r3
	mov.l	@r3,r0
	tst	r0,r0
	bt	.L0606E572
	bra	.L0606E5EC
	mov	#2,r0
.L0606E572:
	mov.w	.L0606E5BC,r4
	bsr	gfcd_TestHirq
	nop
	cmp/eq	#1,r0
	bf	.L0606E59C
	mov.w	.L0606E5BE,r4
	mov.l	.L0606E5CC,r2
	jsr	@r2
	nop
	mov.l	@r14,r3
	mov	#76,r0
	mov.l	@(r0,r3),r0
	tst	r0,r0
	bt	.L0606E59C
	mov	#76,r0
	mov.l	@r14,r2
	mov.l	@(r0,r2),r3
	mov	r2,r4
	mov	#80,r0
	jsr	@r3
	mov.l	@(r0,r4),r4
.L0606E59C:
	mov	#30,r10
	mov	#8,r11
	bra	.L0606E5DE
	mov	r13,r14
.L0606E5A4:
	bsr	gfcd_IsIdle
	mov	r14,r4
	tst	r0,r0
	bf	.L0606E5DC
	mov	r15,r5
	bsr	gfcd_Exec
	mov	r14,r4
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606E5D0
	bra	.L0606E5EC
	mov	r4,r0
.L0606E5BC:
	.short 0x0400
.L0606E5BE:
	.short 0xFBFF
.L0606E5C0:
	.long CDC_GetBufSiz
.L0606E5C4:
	.long gfcd_work
.L0606E5C8:
	.long gfcd_err
.L0606E5CC:
	.long CDC_ClrHirqReq
.L0606E5D0:
	mov.l	@r15,r2
	cmp/gt	r10,r2
	bf/s	.L0606E5DC
	add	r4,r12
	bra	.L0606E5EC
	mov	#1,r0
.L0606E5DC:
	add	#1,r14
.L0606E5DE:
	cmp/ge	r11,r14
	bf	.L0606E5A4
	cmp/pl	r12
	bf	.L0606E5EA
	bra	.L0606E5EC
	mov	#1,r0
.L0606E5EA:
	mov	#0,r0
.L0606E5EC:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfcd_ExecServer

	glabel gfcd_IsIdle
	mov.l	.L0606E670,r3
	mov	r4,r0
	cmp/eq	#0,r0
	bt/s	.L0606E626
	mov.l	@r3,r5
	cmp/eq	#1,r0
	bt	.L0606E62A
	cmp/eq	#2,r0
	bt	.L0606E630
	cmp/eq	#3,r0
	bt	.L0606E636
	cmp/eq	#4,r0
	bt	.L0606E63C
	cmp/eq	#5,r0
	bt	.L0606E642
	cmp/eq	#6,r0
	bt	.L0606E648
	cmp/eq	#7,r0
	bt	.L0606E64E
	bra	.L0606E652
	nop
.L0606E626:
	bra	.L0606E650
	mov	#88,r0
.L0606E62A:
	mov.w	.L0606E660,r0
	bra	.L0606E650
	nop
.L0606E630:
	mov.w	.L0606E662,r0
	bra	.L0606E650
	nop
.L0606E636:
	mov.w	.L0606E664,r0
	bra	.L0606E650
	nop
.L0606E63C:
	mov.w	.L0606E666,r0
	bra	.L0606E650
	nop
.L0606E642:
	mov.w	.L0606E668,r0
	bra	.L0606E650
	nop
.L0606E648:
	mov.w	.L0606E66A,r0
	bra	.L0606E650
	nop
.L0606E64E:
	mov.w	.L0606E66C,r0
.L0606E650:
	mov.l	@(r0,r5),r4
.L0606E652:
	tst	r4,r4
	bf	.L0606E65A
	rts
	mov	#1,r0
.L0606E65A:
	mov	#0,r0
	rts
	nop
.L0606E660:
	.short 0x0304
.L0606E662:
	.short 0x030C
.L0606E664:
	.short 0x0328
.L0606E666:
	.short 0x0338
.L0606E668:
	.short 0x0348
.L0606E66A:
	.short 0x01E0
.L0606E66C:
	.short 0x0360
	.byte 0x00, 0x00
.L0606E670:
	.long gfcd_work
	endlabel gfcd_IsIdle

	glabel gfcd_Exec
	mov.l	r14,@-r15
	mov	r4,r0
	cmp/eq	#0,r0
	bt/s	.L0606E69E
	mov	r5,r14
	cmp/eq	#1,r0
	bt	.L0606E6A4
	cmp/eq	#2,r0
	bt	.L0606E6AA
	cmp/eq	#3,r0
	bt	.L0606E6B0
	cmp/eq	#4,r0
	bt	.L0606E6B6
	cmp/eq	#5,r0
	bt	.L0606E6BC
	cmp/eq	#6,r0
	bt	.L0606E6C2
	cmp/eq	#7,r0
	bt	.L0606E6C8
	bra	.L0606E6CE
	nop
.L0606E69E:
	mov	r14,r4
	bra	gfcd_ExecFilt
	mov.l	@r15+,r14
.L0606E6A4:
	mov	r14,r4
	bra	gfcd_ExecCdCon
	mov.l	@r15+,r14
.L0606E6AA:
	mov	r14,r4
	bra	gfcd_ExecGetSct
	mov.l	@r15+,r14
.L0606E6B0:
	mov	r14,r4
	bra	gfcd_ExecTrans
	mov.l	@r15+,r14
.L0606E6B6:
	mov	r14,r4
	bra	gfcd_ExecDel
	mov.l	@r15+,r14
.L0606E6BC:
	mov	r14,r4
	bra	gfcd_ExecMove
	mov.l	@r15+,r14
.L0606E6C2:
	mov	r14,r4
	bra	gfcd_ExecCon
	mov.l	@r15+,r14
.L0606E6C8:
	mov	r14,r4
	bra	gfcd_ExecChgDir
	mov.l	@r15+,r14
.L0606E6CE:
	rts
	mov.l	@r15+,r14
	endlabel gfcd_Exec

	glabel gfcd_SetTimeout
	mov.l	.L0606E85C,r2
	mov.l	@r2,r3
	rts
	mov.l	r4,@(60,r3)
	endlabel gfcd_SetTimeout

	glabel gfcd_WaitServer
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606E860,r4
	bsr	gfcd_SetTimeout
	nop
.L0606E6E4:
	bsr	gfcd_ExecServer
	nop
	cmp/eq	#1,r0
	bt/s	.L0606E6E4
	mov	r0,r14
	bsr	gfcd_SetTimeout
	mov	#0,r4
	mov	r14,r0
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel gfcd_WaitServer

	glabel gfcd_ExecFilt
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov	#1,r12
	mov.l	.L0606E85C,r14
	mov	r4,r11
	mov.l	r10,@-r15
	mov	#0,r10
	mov.l	r9,@-r15
	mov	#3,r9
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	bra	.L0606E7DE
	mov	r10,r13
.L0606E718:
	mov.l	@r14,r0
	mov	#88,r1
	mov.l	@(r0,r1),r0
	cmp/eq	#1,r0
	bf	.L0606E752
	mov	r13,r3
	mov.l	@r14,r8
	shll2	r3
	shll2	r3
	add	#92,r8
	add	r3,r8
	mov.b	@(1,r8),r0
	mov.b	@r8,r4
	extu.b	r0,r5
	mov.l	.L0606E864,r3
	jsr	@r3
	extu.b	r4,r4
	mov	r0,r4
	tst	r4,r4
	bf	.L0606E7E8
	bsr	gfcd_UpdStat
	nop
	mov.l	@r11,r3
	mov	#88,r0
	add	#1,r3
	mov.l	r3,@r11
	mov.l	@r14,r2
	mov	#2,r3
	mov.l	r3,@(r0,r2)
.L0606E752:
	mov	#88,r1
	mov.l	@r14,r0
	mov.l	@(r0,r1),r0
	cmp/eq	#2,r0
	bf	.L0606E7A4
	mov.l	@r14,r8
	mov	r13,r3
	mov.l	.L0606E868,r2
	add	#92,r8
	shll2	r3
	shll2	r3
	add	r3,r8
	mov	r8,r5
	mov.b	@r8,r4
	add	#2,r5
	jsr	@r2
	extu.b	r4,r4
	mov	r0,r4
	tst	r4,r4
	bf	.L0606E7E8
	bsr	gfcd_UpdStat
	nop
	mov.l	@r11,r3
	add	#1,r3
	mov.l	r3,@r11
	mov.l	@r14,r2
	mov	r13,r3
	shll2	r3
	shll2	r3
	add	#92,r2
	add	r2,r3
	mov.l	@(12,r3),r0
	tst	r0,r0
	bt	.L0606E79E
	mov	#88,r0
	mov.l	@r14,r1
	bra	.L0606E7A4
	mov.l	r9,@(r0,r1)
.L0606E79E:
	mov	#88,r0
	mov.l	@r14,r2
	mov.l	r12,@(r0,r2)
.L0606E7A4:
	mov.l	@r14,r0
	mov	#88,r1
	mov.l	@(r0,r1),r0
	cmp/eq	#3,r0
	bf	.L0606E7DC
	mov	r13,r3
	mov.l	.L0606E86C,r2
	shll2	r3
	mov.l	@r14,r8
	shll2	r3
	add	#92,r8
	add	r3,r8
	mov.l	@(12,r8),r6
	mov.l	@(8,r8),r5
	mov.b	@r8,r4
	jsr	@r2
	extu.b	r4,r4
	mov	r0,r4
	tst	r4,r4
	bf	.L0606E7E8
	bsr	gfcd_UpdStat
	nop
	mov.l	@r11,r3
	mov	#88,r0
	add	#1,r3
	mov.l	r3,@r11
	mov.l	@r14,r2
	mov.l	r12,@(r0,r2)
.L0606E7DC:
	add	#1,r13
.L0606E7DE:
	mov	#84,r0
	mov.l	@r14,r3
	mov.l	@(r0,r3),r2
	cmp/ge	r2,r13
	bf	.L0606E718
.L0606E7E8:
	mov.l	@r14,r1
	mov	#84,r0
	mov.l	@(r0,r1),r3
	cmp/ge	r3,r13
	bf	.L0606E7FA
	mov	#84,r0
	mov.l	@r14,r1
	bra	.L0606E82C
	mov.l	r10,@(r0,r1)
.L0606E7FA:
	bra	.L0606E81C
	mov	r10,r4
.L0606E7FE:
	mov	r4,r1
	mov.l	.L0606E870,r3
	mov	r13,r2
	mov.l	@r14,r5
	shll2	r1
	add	#92,r5
	shll2	r1
	add	r5,r1
	shll2	r2
	shll2	r2
	add	r5,r2
	jsr	@r3
	mov	#16,r0
	add	#1,r13
	add	#1,r4
.L0606E81C:
	mov.l	@r14,r2
	mov	#84,r0
	mov.l	@(r0,r2),r3
	cmp/ge	r3,r13
	bf	.L0606E7FE
	mov	#84,r0
	mov.l	@r14,r1
	mov.l	r4,@(r0,r1)
.L0606E82C:
	bsr	gfcd_TestHirq
	mov	#64,r4
	tst	r0,r0
	bt	.L0606E844
	mov.l	@r14,r3
	mov	#84,r0
	mov.l	@(r0,r3),r0
	tst	r0,r0
	bf	.L0606E844
	mov	#88,r0
	mov.l	@r14,r2
	mov.l	r10,@(r0,r2)
.L0606E844:
	mov.l	@r14,r0
	mov	#84,r1
	lds.l	@r15+,pr
	mov.l	@(r0,r1),r0
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L0606E85C:
	.long gfcd_work
.L0606E860:
	.long 0x00030000
.L0606E864:
	.long CDC_SetFiltMode
.L0606E868:
	.long CDC_SetFiltSubh
.L0606E86C:
	.long CDC_SetFiltRange
.L0606E870:
	.long _quick_evn_mvn
	endlabel gfcd_ExecFilt

	glabel gfcd_ExecCdCon
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L0606E98C,r14
	mov.l	r4,@r15
	mov.l	@r14,r13
	mov.w	.L0606E97A,r0
	mov.l	@(r0,r13),r0
	cmp/eq	#1,r0
	bf	.L0606E8AC
	mov.w	.L0606E97C,r0
	mov.l	.L0606E990,r3
	jsr	@r3
	mov.l	@(r0,r13),r4
	mov	r0,r4
	mov.l	@r15,r2
	tst	r4,r4
	mov.l	@r2,r3
	add	#1,r3
	bf/s	.L0606E8A8
	mov.l	r3,@r2
	mov.l	@r14,r2
	mov	#2,r3
	mov.w	.L0606E97A,r0
	mov.l	r3,@(r0,r2)
.L0606E8A8:
	bsr	gfcd_UpdStat
	nop
.L0606E8AC:
	mov.l	@r14,r0
	mov.w	.L0606E97A,r1
	mov.l	@(r0,r1),r0
	cmp/eq	#2,r0
	bf	.L0606E8C6
	bsr	gfcd_TestHirq
	mov	#64,r4
	tst	r0,r0
	bt	.L0606E8C6
	mov	#0,r2
	mov.w	.L0606E97A,r0
	mov.l	@r14,r3
	mov.l	r2,@(r0,r3)
.L0606E8C6:
	mov.l	@r14,r0
	mov.w	.L0606E97A,r1
	mov.l	@(r0,r1),r0
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfcd_ExecCdCon

	glabel gfcd_ExecGetSct
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov	r4,r12
	mov.l	.L0606E98C,r14
	sts.l	pr,@-r15
	mov.w	.L0606E97E,r0
	add	#-8,r15
	mov.l	@r14,r11
	mov.l	@(r0,r11),r0
	cmp/eq	#1,r0
	bf/s	.L0606E964
	mov	#0,r13
	mov	r15,r5
	mov.w	.L0606E980,r0
	mov.l	.L0606E994,r3
	jsr	@r3
	mov.l	@(r0,r11),r4
	bsr	gfcd_UpdStat
	nop
	mov.l	@r12,r3
	add	#1,r3
	mov.l	r3,@r12
	mov.l	@r14,r2
	mov.w	.L0606E982,r0
	mov.l	@(r0,r2),r3
	mov.l	@r15,r1
	sub	r3,r1
	mov.l	r1,@r15
	mov.l	@r14,r4
	mov.w	.L0606E984,r0
	mov.l	@(r0,r4),r4
	cmp/ge	r4,r1
	bt	.L0606E922
	mov.l	@r15,r2
	bra	.L0606E924
	nop
.L0606E922:
	mov	r4,r2
.L0606E924:
	mov.l	r2,@r15
	mov.l	@r14,r3
	mov.w	.L0606E986,r0
	mov.l	@(r0,r3),r2
	mov.l	@r15,r1
	mov.l	r1,@r2
	mov.l	@r14,r3
	mov.w	.L0606E988,r0
	mov.l	@(r0,r3),r0
	tst	r0,r0
	bf	.L0606E944
	mov.l	@r14,r2
	mov.w	.L0606E97E,r0
	mov.l	r13,@(r0,r2)
	bra	.L0606EA1C
	mov	r13,r0
.L0606E944:
	mov.l	@r15,r3
	cmp/pl	r3
	bt	.L0606E95C
	mov.l	@r14,r1
	mov.w	.L0606E97E,r0
	mov.l	r13,@(r0,r1)
	mov.l	@r14,r3
	add	#24,r0
	mov.l	@(r0,r3),r2
	mov.l	r13,@r2
	bra	.L0606EA1C
	mov	r13,r0
.L0606E95C:
	mov.l	@r14,r3
	mov	#2,r2
	mov.w	.L0606E97E,r0
	mov.l	r2,@(r0,r3)
.L0606E964:
	mov.l	@r14,r0
	mov.w	.L0606E97E,r1
	mov.l	@(r0,r1),r0
	cmp/eq	#2,r0
	bf	.L0606E9D6
	mov.l	@r14,r0
	mov.l	@(52,r0),r0
	cmp/eq	#-1,r0
	bt	.L0606E998
	bra	.L0606EA1C
	mov	#2,r0
.L0606E97A:
	.short 0x0304
.L0606E97C:
	.short 0x0308
.L0606E97E:
	.short 0x030C
.L0606E980:
	.short 0x0310
.L0606E982:
	.short 0x0314
.L0606E984:
	.short 0x0318
.L0606E986:
	.short 0x0320
.L0606E988:
	.short 0x0324
	.byte 0x00, 0x00
.L0606E98C:
	.long gfcd_work
.L0606E990:
	.long CDC_CdSetCon
.L0606E994:
	.long CDC_GetSctNum
.L0606E998:
	mov.l	@r14,r2
	mov	r2,r3
	mov.w	.L0606EA9C,r0
	mov.l	@(r0,r3),r1
	mov.l	.L0606EAA4,r3
	add	#16,r0
	mov.l	r1,@(52,r2)
	mov.l	@r14,r6
	mov.l	@r14,r5
	mov.l	@(r0,r6),r6
	mov.l	@r14,r4
	add	#-12,r0
	mov.l	@r6,r6
	mov.l	@(r0,r5),r5
	add	#-4,r0
	jsr	@r3
	mov.l	@(r0,r4),r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606E9C4
	bra	.L0606EA1C
	mov	#2,r0
.L0606E9C4:
	bsr	gfcd_UpdStat
	nop
	mov.l	@r12,r2
	add	#1,r2
	mov.l	r2,@r12
	mov	#3,r2
	mov.w	.L0606EA9E,r0
	mov.l	@r14,r3
	mov.l	r2,@(r0,r3)
.L0606E9D6:
	mov.l	@r14,r0
	mov.w	.L0606EA9E,r1
	mov.l	@(r0,r1),r0
	cmp/eq	#3,r0
	bf	.L0606EA1A
	mov.l	.L0606EAA8,r2
	mov	r15,r4
	add	#4,r4
	jsr	@r2
	nop
	mov	r0,r4
	tst	r4,r4
	bt	.L0606E9F4
	bra	.L0606EA1C
	mov	#1,r0
.L0606E9F4:
	bsr	gfcd_UpdStat
	nop
	mov.l	@r12,r2
	add	#1,r2
	mov.l	r2,@r12
	mov.l	@r14,r3
	mov.w	.L0606EA9E,r0
	mov.l	r13,@(r0,r3)
	mov.l	@r14,r3
	add	#24,r0
	mov.l	@(4,r15),r1
	mov.l	@(r0,r3),r2
	shll	r1
	mov.l	r1,@r2
	mov.l	@r14,r3
	mov	#-1,r2
	mov.l	r2,@(52,r3)
	bra	.L0606EA1C
	mov	r13,r0
.L0606EA1A:
	mov	#1,r0
.L0606EA1C:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfcd_ExecGetSct

	glabel gfcd_ExecTrans
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606EAAC,r13
	add	#-4,r15
	mov.w	.L0606EAA0,r0
	mov.l	r4,@r15
	mov.l	@r13,r14
	mov.l	@(r0,r14),r0
	cmp/eq	#1,r0
	bf	.L0606EA6E
	mov.w	.L0606EAA2,r0
	mov.l	@(r0,r14),r6
	mov.l	.L0606EAB0,r3
	add	#-4,r0
	mov.l	@(r0,r14),r5
	add	#-4,r0
	jsr	@r3
	mov.l	@(r0,r14),r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606EA5A
	bra	.L0606EA92
	mov	#1,r0
.L0606EA5A:
	bsr	gfcd_UpdStat
	nop
	mov.l	@r15,r2
	mov.w	.L0606EAA0,r0
	mov.l	@r2,r3
	add	#1,r3
	mov.l	r3,@r2
	mov.l	@r13,r2
	mov	#2,r3
	mov.l	r3,@(r0,r2)
.L0606EA6E:
	mov.l	@r13,r0
	mov.w	.L0606EAA0,r1
	mov.l	@(r0,r1),r0
	cmp/eq	#2,r0
	bf	.L0606EA90
	mov.l	.L0606EAB4,r2
	jsr	@r2
	mov	#0,r4
	mov	r0,r4
	tst	r4,r4
	bf	.L0606EA90
	mov.l	@r13,r3
	mov	#0,r4
	mov.w	.L0606EAA0,r0
	mov.l	r4,@(r0,r3)
	bra	.L0606EA92
	mov	r4,r0
.L0606EA90:
	mov	#1,r0
.L0606EA92:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L0606EA9C:
	.short 0x0310
.L0606EA9E:
	.short 0x030C
.L0606EAA0:
	.short 0x0328
.L0606EAA2:
	.short 0x0334
.L0606EAA4:
	.long CDC_CalActSiz
.L0606EAA8:
	.long CDC_GetActSiz
.L0606EAAC:
	.long gfcd_work
.L0606EAB0:
	.long CDC_GetSctData
.L0606EAB4:
	.long CDC_DataReady
	endlabel gfcd_ExecTrans

	glabel gfcd_ExecDel
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L0606EBBC,r14
	mov.l	r4,@r15
	mov.l	@r14,r13
	mov	#1,r4
	mov.w	.L0606EBB0,r0
	mov	r4,r12
	mov.l	@(r0,r13),r3
	cmp/eq	r4,r3
	bf/s	.L0606EB26
	mov	#0,r11
	mov.w	.L0606EBB2,r0
	mov.l	@(r0,r13),r1
	tst	r1,r1
	bf	.L0606EB14
	mov.w	.L0606EBB4,r0
	mov.l	@(r0,r13),r0
	cmp/eq	#-1,r0
	bf	.L0606EB14
	mov.w	.L0606EBB6,r0
	mov.l	@(r0,r13),r5
	mov.l	.L0606EBC0,r3
	jsr	@r3
	mov	#0,r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606EAFC
	bra	.L0606EBA2
	mov	#1,r0
.L0606EAFC:
	bsr	gfcd_UpdStat
	nop
	mov.l	@r15,r2
	mov.l	@r2,r3
	mov.w	.L0606EBB0,r0
	add	#1,r3
	mov.l	r3,@r2
	mov	#4,r3
	mov.l	@r14,r2
	mov.l	r3,@(r0,r2)
	bra	.L0606EB26
	nop
.L0606EB14:
	mov.w	.L0606EBB4,r0
	mov.l	@(r0,r13),r4
	tst	r4,r4
	bf	.L0606EB20
	bra	.L0606EB26
	mov	r11,r12
.L0606EB20:
	mov.w	.L0606EBB0,r0
	mov	#2,r2
	mov.l	r2,@(r0,r13)
.L0606EB26:
	mov.l	@r14,r0
	mov.w	.L0606EBB0,r1
	mov.l	@(r0,r1),r0
	cmp/eq	#2,r0
	bf	.L0606EB60
	mov.l	@r14,r6
	mov.w	.L0606EBB4,r0
	mov.l	@r14,r5
	mov.l	@(r0,r6),r6
	mov.l	@r14,r4
	add	#-4,r0
	mov.l	.L0606EBC4,r3
	mov.l	@(r0,r5),r5
	add	#-4,r0
	jsr	@r3
	mov.l	@(r0,r4),r4
	mov	r0,r4
	mov.l	@r15,r2
	tst	r4,r4
	mov.l	@r2,r3
	add	#1,r3
	bf/s	.L0606EB60
	mov.l	r3,@r2
	mov.l	@r14,r2
	mov	#3,r3
	mov.w	.L0606EBB0,r0
	mov.l	r3,@(r0,r2)
	bsr	gfcd_UpdStat
	nop
.L0606EB60:
	mov.l	@r14,r0
	mov.w	.L0606EBB0,r1
	mov.l	@(r0,r1),r0
	cmp/eq	#3,r0
	bf	.L0606EB76
	mov.w	.L0606EBB8,r4
	bsr	gfcd_TestHirq
	nop
	tst	r0,r0
	bt	.L0606EB76
	mov	r11,r12
.L0606EB76:
	mov.l	@r14,r0
	mov.w	.L0606EBB0,r1
	mov.l	@(r0,r1),r0
	cmp/eq	#4,r0
	bf	.L0606EB8A
	bsr	gfcd_TestHirq
	mov	#64,r4
	tst	r0,r0
	bt	.L0606EB8A
	mov	r11,r12
.L0606EB8A:
	mov	r12,r0
	cmp/eq	#1,r0
	bf	.L0606EB94
	bra	.L0606EBA2
	mov	#1,r0
.L0606EB94:
	mov.l	.L0606EBC8,r2
	jsr	@r2
	mov	#-9,r4
	mov.l	@r14,r3
	mov.w	.L0606EBB0,r0
	mov.l	r11,@(r0,r3)
	mov	r11,r0
.L0606EBA2:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L0606EBB0:
	.short 0x0338
.L0606EBB2:
	.short 0x0340
.L0606EBB4:
	.short 0x0344
.L0606EBB6:
	.short 0x033C
.L0606EBB8:
	.short 0x0080
	.byte 0x00, 0x00
.L0606EBBC:
	.long gfcd_work
.L0606EBC0:
	.long CDC_ResetSelector
.L0606EBC4:
	.long CDC_DelSctData
.L0606EBC8:
	.long CDC_ClrHirqReq
	endlabel gfcd_ExecDel

	glabel gfcd_ExecMove
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606ECA8,r14
	mov.l	@r14,r12
	mov.w	.L0606ECA0,r0
	mov.l	@(r0,r12),r0
	cmp/eq	#1,r0
	bf/s	.L0606EC1E
	mov	r4,r13
	mov.w	.L0606ECA2,r5
	mov.w	.L0606ECA4,r0
	add	r12,r5
	mov.l	.L0606ECAC,r3
	jsr	@r3
	mov.l	@(r0,r12),r4
	mov.l	@r13,r2
	add	#1,r2
	bsr	gfcd_UpdStat
	mov.l	r2,@r13
	mov	#0,r5
	mov.l	@r14,r4
	mov.w	.L0606ECA4,r0
	mov.l	.L0606ECB0,r3
	jsr	@r3
	mov.l	@(r0,r4),r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606EC0C
	bra	.L0606ECE6
	mov	#1,r0
.L0606EC0C:
	bsr	gfcd_UpdStat
	nop
	mov.l	@r13,r2
	add	#1,r2
	mov.l	r2,@r13
	mov	#2,r2
	mov.w	.L0606ECA0,r0
	mov.l	@r14,r3
	mov.l	r2,@(r0,r3)
.L0606EC1E:
	mov.l	@r14,r0
	mov.w	.L0606ECA0,r1
	mov.l	@(r0,r1),r0
	cmp/eq	#2,r0
	bf	.L0606EC60
	mov.l	@r14,r7
	mov.w	.L0606ECA4,r0
	mov.l	@r14,r6
	mov.l	@(r0,r7),r7
	mov.l	@r14,r5
	add	#12,r0
	mov.l	@r14,r4
	mov.l	@(r0,r6),r6
	mov.l	.L0606ECB4,r3
	add	#-4,r0
	mov.l	@(r0,r5),r5
	add	#-4,r0
	jsr	@r3
	mov.l	@(r0,r4),r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606EC4E
	bra	.L0606ECE6
	mov	#1,r0
.L0606EC4E:
	bsr	gfcd_UpdStat
	nop
	mov.l	@r13,r2
	mov.w	.L0606ECA0,r0
	add	#1,r2
	mov.l	r2,@r13
	mov	#3,r2
	mov.l	@r14,r3
	mov.l	r2,@(r0,r3)
.L0606EC60:
	mov.l	@r14,r0
	mov.w	.L0606ECA0,r1
	mov.l	@(r0,r1),r0
	cmp/eq	#3,r0
	bf	.L0606EC7C
	mov.w	.L0606ECA6,r4
	bsr	gfcd_TestHirq
	nop
	tst	r0,r0
	bt	.L0606EC7C
	mov.l	@r14,r3
	mov	#4,r2
	mov.w	.L0606ECA0,r0
	mov.l	r2,@(r0,r3)
.L0606EC7C:
	mov.l	@r14,r0
	mov.w	.L0606ECA0,r1
	mov.l	@(r0,r1),r0
	cmp/eq	#4,r0
	bf	.L0606ECC6
	mov.l	@r14,r5
	mov.w	.L0606ECA2,r0
	mov.l	@(r0,r5),r5
	mov.l	@r14,r4
	add	#-16,r0
	mov.l	.L0606ECB0,r3
	jsr	@r3
	mov.l	@(r0,r4),r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606ECB8
	bra	.L0606ECE6
	mov	#1,r0
.L0606ECA0:
	.short 0x0348
.L0606ECA2:
	.short 0x035C
.L0606ECA4:
	.short 0x034C
.L0606ECA6:
	.short 0x0100
.L0606ECA8:
	.long gfcd_work
.L0606ECAC:
	.long CDC_GetFiltMode
.L0606ECB0:
	.long CDC_SetFiltMode
.L0606ECB4:
	.long CDC_MoveSctData
.L0606ECB8:
	mov.l	@r13,r3
	add	#1,r3
	mov.l	r3,@r13
	mov	#5,r3
	mov.w	.L0606ED8E,r0
	mov.l	@r14,r2
	mov.l	r3,@(r0,r2)
.L0606ECC6:
	mov.l	@r14,r0
	mov.w	.L0606ED8E,r1
	mov.l	@(r0,r1),r0
	cmp/eq	#5,r0
	bf	.L0606ECE0
	bsr	gfcd_TestHirq
	mov	#64,r4
	cmp/eq	#1,r0
	bf	.L0606ECE0
	mov.l	@r14,r2
	mov	#0,r3
	mov.w	.L0606ED8E,r0
	mov.l	r3,@(r0,r2)
.L0606ECE0:
	mov.l	@r14,r0
	mov.w	.L0606ED8E,r1
	mov.l	@(r0,r1),r0
.L0606ECE6:
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfcd_ExecMove

	glabel gfcd_ExecChgDir
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov	#-1,r12
	mov.l	.L0606ED98,r14
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov	r4,r11
	mov.w	.L0606ED90,r1
	sts.l	pr,@-r15
	mov.l	.L0606ED94,r10
	add	#-24,r15
	mov.l	@r14,r0
	mov.l	@(r0,r1),r0
	cmp/eq	#1,r0
	bf/s	.L0606EDAE
	mov	#0,r13
	mov	r15,r6
	add	#8,r6
	mov	r15,r5
	add	#4,r5
	mov	r15,r4
	jsr	@r10
	nop
	mov	r0,r4
	tst	r4,r4
	bt	.L0606ED38
	mov.l	@r14,r3
	mov.w	.L0606ED90,r0
	mov.l	r13,@(r0,r3)
	mov.l	@r14,r3
	add	#8,r0
	mov.l	@(r0,r3),r2
	mov.l	r12,@r2
	bra	.L0606EEB8
	mov	#-11,r0
.L0606ED38:
	mov.l	@r11,r3
	add	#1,r3
	mov.l	r3,@r11
	mov.l	@r14,r4
	mov.w	.L0606ED92,r0
	mov.w	@(r0,r4),r4
	tst	r4,r4
	bt	.L0606ED5E
	mov	r4,r0
	cmp/eq	#1,r0
	bt	.L0606ED5E
	mov.l	@r15,r2
	cmp/gt	r4,r2
	bt	.L0606ED6A
	mov.l	@(4,r15),r3
	mov.l	@r15,r1
	add	r3,r1
	cmp/ge	r1,r4
	bt	.L0606ED6A
.L0606ED5E:
	mov	#3,r2
	mov.w	.L0606ED90,r0
	mov.l	@r14,r3
	mov.l	r2,@(r0,r3)
	bra	.L0606EDAE
	nop
.L0606ED6A:
	mov.l	@r14,r5
	mov.w	.L0606ED92,r0
	mov.w	@(r0,r5),r5
	mov.l	.L0606ED9C,r3
	jsr	@r3
	mov	#23,r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606EDA0
	mov.l	@r14,r3
	mov.w	.L0606ED90,r0
	mov.l	r13,@(r0,r3)
	add	#8,r0
	mov.l	@r14,r3
	mov.l	@(r0,r3),r2
	mov.l	r12,@r2
	bra	.L0606EEB8
	mov	#-11,r0
.L0606ED8E:
	.short 0x0348
.L0606ED90:
	.short 0x0360
.L0606ED92:
	.short 0x0364
.L0606ED94:
	.long CDC_GetFileScope
.L0606ED98:
	.long gfcd_work
.L0606ED9C:
	.long CDC_ReadDir
.L0606EDA0:
	mov.l	@r11,r3
	add	#1,r3
	mov.l	r3,@r11
	mov	#2,r3
	mov.w	.L0606EE96,r0
	mov.l	@r14,r2
	mov.l	r3,@(r0,r2)
.L0606EDAE:
	mov.l	@r14,r0
	mov.w	.L0606EE96,r1
	mov.l	@(r0,r1),r0
	cmp/eq	#2,r0
	bf	.L0606EE0E
	mov.w	.L0606EE98,r4
	bsr	gfcd_TestHirq
	nop
	tst	r0,r0
	bt	.L0606EE0E
	mov	r15,r6
	add	#8,r6
	mov	r15,r5
	add	#4,r5
	mov	r15,r4
	jsr	@r10
	nop
	mov	r0,r4
	tst	r4,r4
	bf	.L0606EDF4
	mov.l	.L0606EE9C,r2
	mov.w	.L0606EE9A,r0
	mov.l	@r2,r3
	mov.w	@(r0,r3),r1
	mov.l	@r15,r3
	cmp/ge	r3,r1
	bt	.L0606EE06
	mov.l	@(4,r15),r3
	mov.l	@r15,r1
	mov.l	@r2,r0
	add	r3,r1
	mov.w	.L0606EE9A,r3
	mov.w	@(r0,r3),r3
	cmp/gt	r3,r1
	bt	.L0606EE06
.L0606EDF4:
	mov.l	@r14,r3
	mov.w	.L0606EE96,r0
	mov.l	r13,@(r0,r3)
	add	#8,r0
	mov.l	@r14,r3
	mov.l	@(r0,r3),r2
	mov.l	r12,@r2
	bra	.L0606EEB8
	mov	#-11,r0
.L0606EE06:
	mov	#3,r2
	mov.w	.L0606EE96,r0
	mov.l	@r14,r3
	mov.l	r2,@(r0,r3)
.L0606EE0E:
	mov.l	@r14,r0
	mov.w	.L0606EE96,r1
	mov.l	@(r0,r1),r0
	cmp/eq	#3,r0
	bf	.L0606EE58
	mov	r15,r4
	add	#12,r4
	bsr	gfcd_GetStat
	nop
	mov.l	.L0606EEA0,r3
	mov.l	@r3,r4
	tst	r4,r4
	bt	.L0606EE2C
	bra	.L0606EEB8
	mov	r4,r0
.L0606EE2C:
	mov.l	@r14,r5
	mov.w	.L0606EE9A,r0
	mov.l	@r14,r4
	mov.w	@(r0,r5),r5
	mov.l	.L0606EEA4,r3
	add	#2,r0
	jsr	@r3
	mov.w	@(r0,r4),r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606EE46
	bra	.L0606EEB8
	mov	#1,r0
.L0606EE46:
	bsr	gfcd_UpdStat
	nop
	mov.l	@r11,r2
	mov.w	.L0606EE96,r0
	add	#1,r2
	mov.l	r2,@r11
	mov	#4,r2
	mov.l	@r14,r3
	mov.l	r2,@(r0,r3)
.L0606EE58:
	mov.l	@r14,r0
	mov.w	.L0606EE96,r1
	mov.l	@(r0,r1),r0
	cmp/eq	#4,r0
	bf	.L0606EEB2
	mov.w	.L0606EE98,r4
	bsr	gfcd_TestHirq
	nop
	tst	r0,r0
	bt	.L0606EEB2
	mov.l	@r14,r3
	mov	r15,r6
	mov.w	.L0606EE96,r0
	mov	r15,r5
	add	#8,r6
	add	#4,r5
	mov	r15,r4
	jsr	@r10
	mov.l	r13,@(r0,r3)
	mov	r0,r4
	tst	r4,r4
	bt	.L0606EEA8
	mov.l	@r14,r3
	mov.w	.L0606EE96,r0
	mov.l	r13,@(r0,r3)
	add	#8,r0
	mov.l	@r14,r3
	mov.l	@(r0,r3),r2
	mov.l	r12,@r2
	bra	.L0606EEB8
	mov	#-11,r0
.L0606EE96:
	.short 0x0360
.L0606EE98:
	.short 0x0200
.L0606EE9A:
	.short 0x0364
.L0606EE9C:
	.long gfcd_work
.L0606EEA0:
	.long gfcd_err
.L0606EEA4:
	.long CDC_ChgDir
.L0606EEA8:
	mov.l	@r14,r3
	mov.w	.L0606EFA6,r0
	mov.l	@(4,r15),r1
	mov.l	@(r0,r3),r2
	mov.l	r1,@r2
.L0606EEB2:
	mov.l	@r14,r0
	mov.w	.L0606EFA8,r1
	mov.l	@(r0,r1),r0
.L0606EEB8:
	add	#24,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfcd_ExecChgDir

	glabel gfcd_ExecCon
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov	#0,r12
	mov.l	.L0606EFB4,r14
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov	#1,r10
	mov.w	.L0606EFAA,r11
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov	#2,r9
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L0606EFB0,r8
	mov.l	r4,@r15
	bra	.L0606EF86
	mov	r12,r13
.L0606EEEC:
	mov.l	@r14,r0
	mov	r13,r3
	mov	r13,r2
	shll	r3
	add	r2,r3
	shll2	r3
	mov.w	.L0606EFAC,r2
	exts.w	r3,r3
	add	r2,r0
	add	r3,r0
	mov.l	@(4,r0),r0
	cmp/eq	#-2,r0
	bf/s	.L0606EF0E
	mov.l	@r14,r0
	mov	r12,r5
	bra	.L0606EF26
	mov	r11,r6
.L0606EF0E:
	mov	r10,r5
	mov.l	@r14,r6
	mov	r13,r3
	mov	r13,r1
	shll	r3
	add	r1,r3
	shll2	r3
	mov.w	.L0606EFAC,r1
	exts.w	r3,r3
	add	r1,r6
	add	r3,r6
	mov.l	@(4,r6),r6
.L0606EF26:
	mov	r13,r3
	mov	r13,r2
	shll	r3
	add	r2,r3
	shll2	r3
	mov.w	.L0606EFAC,r2
	exts.w	r3,r3
	add	r2,r0
	add	r3,r0
	mov.l	@(8,r0),r0
	cmp/eq	#-2,r0
	bf/s	.L0606EF44
	mov.l	@r14,r4
	bra	.L0606EF5C
	mov	r11,r7
.L0606EF44:
	mov.l	@r14,r7
	mov	r13,r3
	or	r9,r5
	mov	r13,r1
	shll	r3
	add	r1,r3
	mov.w	.L0606EFAC,r1
	shll2	r3
	exts.w	r3,r3
	add	r1,r7
	add	r3,r7
	mov.l	@(8,r7),r7
.L0606EF5C:
	mov	r13,r3
	mov	r13,r2
	shll	r3
	add	r2,r3
	mov.w	.L0606EFAC,r2
	shll2	r3
	exts.w	r3,r3
	add	r2,r4
	add	r3,r4
	jsr	@r8
	mov.l	@r4,r4
	mov	r0,r4
	tst	r4,r4
	bf	.L0606EF90
	bsr	gfcd_UpdStat
	nop
	mov.l	@r15,r3
	add	#1,r13
	mov.l	@r3,r2
	add	#1,r2
	mov.l	r2,@r3
.L0606EF86:
	mov.l	@r14,r3
	mov.w	.L0606EFAE,r0
	mov.l	@(r0,r3),r2
	cmp/ge	r2,r13
	bf	.L0606EEEC
.L0606EF90:
	mov.l	@r14,r1
	mov.w	.L0606EFAE,r0
	mov.l	@(r0,r1),r3
	cmp/ge	r3,r13
	bf	.L0606EFA2
	mov.l	@r14,r1
	mov.w	.L0606EFAE,r0
	bra	.L0606F014
	mov.l	r12,@(r0,r1)
.L0606EFA2:
	bra	.L0606F004
	mov	r12,r4
.L0606EFA6:
	.short 0x0368
.L0606EFA8:
	.short 0x0360
.L0606EFAA:
	.short 0x00FF
.L0606EFAC:
	.short 0x01E4
.L0606EFAE:
	.short 0x01DC
.L0606EFB0:
	.long CDC_SetFiltCon
.L0606EFB4:
	.long gfcd_work
.L0606EFB8:
	mov.l	@r14,r7
	mov	r4,r5
	mov.w	.L0606F116,r3
	mov	r4,r2
	add	r3,r7
	shll	r5
	add	r2,r5
	shll2	r5
	exts.w	r5,r5
	mov	r7,r1
	add	r5,r1
	mov	r13,r6
	mov	r13,r2
	shll	r6
	add	r2,r6
	shll2	r6
	exts.w	r6,r6
	mov	r7,r0
	mov.l	@(r0,r6),r2
	mov.l	r2,@r1
	mov.l	@r14,r7
	mov	r3,r2
	add	r2,r7
	mov	r7,r1
	add	r5,r1
	mov	r7,r0
	add	r6,r0
	mov.l	@(4,r0),r0
	mov.l	r0,@(4,r1)
	mov	r2,r1
	mov.l	@r14,r7
	add	r1,r7
	add	r7,r5
	add	r7,r6
	mov.l	@(8,r6),r3
	add	#1,r13
	mov.l	r3,@(8,r5)
	add	#1,r4
.L0606F004:
	mov.l	@r14,r2
	mov.w	.L0606F118,r0
	mov.l	@(r0,r2),r3
	cmp/ge	r3,r13
	bf	.L0606EFB8
	mov.l	@r14,r1
	mov.w	.L0606F118,r0
	mov.l	r4,@(r0,r1)
.L0606F014:
	bsr	gfcd_TestHirq
	mov	#64,r4
	tst	r0,r0
	bt	.L0606F02C
	mov.l	@r14,r3
	mov.w	.L0606F118,r0
	mov.l	@(r0,r3),r0
	tst	r0,r0
	bf	.L0606F02C
	mov.l	@r14,r2
	mov.w	.L0606F11A,r0
	mov.l	r12,@(r0,r2)
.L0606F02C:
	mov.l	@r14,r0
	mov.w	.L0606F118,r1
	mov.l	@(r0,r1),r0
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfcd_ExecCon

	glabel gfcd_TestHirq
	sts.l	pr,@-r15
	mov.l	.L0606F120,r3
	add	#-4,r15
	mov.l	r4,@r15
	jsr	@r3
	nop
	mov	r0,r4
	mov.l	@r15,r0
	tst	r4,r0
	bt	.L0606F062
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#1,r0
.L0606F062:
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfcd_TestHirq

	glabel gfcd_ResetWork
	mov.l	.L0606F124,r5
	mov	#0,r4
	mov	#23,r7
	mov	r4,r6
.L0606F074:
	mov.l	@r5,r0
	mov.b	r4,@(r0,r6)
	mov.l	@r5,r0
	mov	r0,r3
	add	#24,r3
	add	r6,r3
	add	#1,r6
	cmp/ge	r7,r6
	bf/s	.L0606F074
	mov.b	r4,@r3
	mov.l	@r5,r3
	mov	#-1,r6
	mov.l	r4,@(48,r3)
	mov	#76,r0
	mov.l	@r5,r2
	mov.l	r6,@(52,r2)
	mov.l	@r5,r3
	mov.l	r6,@(56,r3)
	mov.l	@r5,r2
	mov.l	r4,@(60,r2)
	mov.l	@r5,r3
	mov.l	r4,@(r0,r3)
	mov.l	@r5,r3
	mov	#80,r0
	mov.l	r4,@(r0,r3)
	mov	#84,r0
	mov.l	@r5,r3
	mov.l	r4,@(r0,r3)
	mov.l	@r5,r3
	mov	#88,r0
	mov.l	r4,@(r0,r3)
	mov.l	@r5,r3
	mov.w	.L0606F11C,r0
	mov.l	r4,@(r0,r3)
	mov.l	@r5,r3
	add	#8,r0
	mov.l	r4,@(r0,r3)
	add	#28,r0
	mov.l	@r5,r3
	mov.l	r4,@(r0,r3)
	mov.l	@r5,r3
	add	#16,r0
	mov.l	r4,@(r0,r3)
	add	#16,r0
	mov.l	@r5,r3
	mov.l	r4,@(r0,r3)
	mov.l	@r5,r3
	add	#24,r0
	mov.l	r4,@(r0,r3)
	mov.l	@r5,r3
	mov.w	.L0606F118,r0
	mov.l	r4,@(r0,r3)
	mov.l	@r5,r3
	add	#4,r0
	rts
	mov.l	r4,@(r0,r3)
	endlabel gfcd_ResetWork

	glabel gfcd_UpdStat
	sts.l	pr,@-r15
	add	#-12,r15
	mov.l	.L0606F128,r3
	mov	r15,r4
	jsr	@r3
	nop
	mov.l	.L0606F124,r3
	mov	r15,r1
	mov.l	@r3,r2
	mov.b	@r1,r0
	mov	#64,r1
	add	r2,r1
	mov.b	r0,@r1
	add	#12,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfcd_UpdStat

	glabel gfcd_SetCallback
	mov	#76,r0
	mov.l	.L0606F124,r6
	mov.l	@r6,r3
	mov.l	r4,@(r0,r3)
	mov	#80,r0
	mov.l	@r6,r3
	rts
	mov.l	r5,@(r0,r3)
.L0606F116:
	.short 0x01E4
.L0606F118:
	.short 0x01DC
.L0606F11A:
	.short 0x01E0
.L0606F11C:
	.short 0x0304
	.byte 0x00, 0x00
.L0606F120:
	.long CDC_GetHirqReq
.L0606F124:
	.long gfcd_work
.L0606F128:
	.long CDC_GetLastStat
	endlabel gfcd_SetCallback

	glabel gfcd_TestScdq
	sts.l	pr,@-r15
	mov.l	.L0606F1CC,r3
	jsr	@r3
	nop
	mov.w	.L0606F1C4,r2
	tst	r2,r0
	bt	.L0606F140
	lds.l	@r15+,pr
	rts
	mov	#1,r0
.L0606F140:
	mov	#0,r0
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfcd_TestScdq

	glabel gfcd_ClrScdq
	mov.w	.L0606F1C6,r4
	mov.l	.L0606F1D0,r3
	jmp	@r3
	nop
	endlabel gfcd_ClrScdq

	glabel gfcd_WaitScdq
	mov.l	r14,@-r15
	mov	#0,r14
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.w	.L0606F1C8,r13
.L0606F15A:
	bsr	gfcd_TestScdq
	nop
	cmp/eq	#1,r0
	bf	.L0606F16A
	bsr	gfcd_ClrScdq
	nop
	bra	.L0606F172
	mov	#0,r0
.L0606F16A:
	add	#1,r14
	cmp/ge	r13,r14
	bf	.L0606F15A
	mov	#1,r0
.L0606F172:
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfcd_WaitScdq

	glabel gfcd_WaitPause
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	#15,r14
	mov.l	r12,@-r15
	mov	#0,r13
	sts.l	pr,@-r15
	add	#-12,r15
	mov.l	.L0606F1D4,r12
.L0606F18A:
	mov	r15,r4
	mov.l	.L0606F1D8,r3
	jsr	@r3
	nop
	mov	r15,r0
	mov.b	@r0,r0
	extu.b	r0,r0
	and	r14,r0
	cmp/eq	#1,r0
	bt	.L0606F1B8
	mov	r15,r0
	mov.b	@r0,r0
	extu.b	r0,r0
	and	r14,r0
	cmp/eq	#2,r0
	bt	.L0606F1B8
	mov.l	.L0606F1DC,r3
	mov.l	@r3,r0
	tst	r0,r0
	bf	.L0606F1B8
	add	#1,r13
	cmp/ge	r12,r13
	bf	.L0606F18A
.L0606F1B8:
	add	#12,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L0606F1C4:
	.short 0x0400
.L0606F1C6:
	.short 0xFBFF
.L0606F1C8:
	.short 0x5F34
	.byte 0x00, 0x00
.L0606F1CC:
	.long CDC_GetHirqReq
.L0606F1D0:
	.long CDC_ClrHirqReq
.L0606F1D4:
	.long 0x00069CB5
.L0606F1D8:
	.long gfcd_GetStat
.L0606F1DC:
	.long gfcd_err
	endlabel gfcd_WaitPause
