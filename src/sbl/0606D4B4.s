! sbl/0606D4B4: matching source. The readable C for this object is 0606D4B4.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0606D4B4,"ax",@progbits
	.p2align 2

	glabel gfcf_Open
	mov.l	r14,@-r15
	mov	r4,r5
	mov.l	r13,@-r15
	mov	r4,r14
	sts.l	pr,@-r15
	mov	#0,r13
	add	#-16,r15
	add	#28,r14
	mov.l	r13,@r14
	mov	#1,r3
	mov.l	r3,@(24,r14)
	mov	r15,r2
	mov.b	@(14,r5),r0
	mov	r15,r3
	add	#8,r2
	add	#8,r3
	mov.b	r0,@r2
	mov	r13,r0
	mov.b	r0,@(1,r3)
	mov	r15,r3
	add	#8,r3
	mov.b	r0,@(2,r3)
	mov	r15,r3
	add	#8,r3
	mov.b	r0,@(3,r3)
	mov	r15,r3
	add	#8,r3
	mov.b	r0,@(4,r3)
	mov	r15,r3
	add	#8,r3
	mov.b	r0,@(5,r3)
	mov	r14,r1
	mov.l	.L0606D5DC,r3
	mov	r15,r2
	add	#16,r1
	add	#8,r2
	jsr	@r3
	mov	#6,r0
	mov.l	.L0606D5E0,r3
	mov	#-1,r2
	mov.l	r2,@(28,r14)
	mov	r15,r4
	mov.l	r13,@(36,r14)
	add	#4,r4
	mov.l	r13,@(32,r14)
	mov.l	r13,@(44,r14)
	jsr	@r3
	mov.l	r13,@(40,r14)
	tst	r0,r0
	bt	.L0606D51C
	bra	.L0606D586
	mov	#0,r0
.L0606D51C:
	mov.l	@(4,r15),r3
	mov	r15,r4
	mov.l	r3,@(4,r14)
	mov.l	.L0606D5E4,r3
	jsr	@r3
	nop
	tst	r0,r0
	bt	.L0606D538
	mov.l	@(4,r15),r4
	mov.l	.L0606D5E8,r3
	jsr	@r3
	nop
	bra	.L0606D586
	mov	#0,r0
.L0606D538:
	mov.l	@r15,r2
	mov	r13,r7
	mov.l	.L0606D5EC,r3
	mov.l	r2,@(12,r14)
	mov.l	r13,@-r15
	mov	r15,r6
	mov.l	@(4,r15),r4
	add	#12,r6
	jsr	@r3
	mov.l	@(24,r14),r5
	tst	r0,r0
	bt/s	.L0606D556
	add	#4,r15
	bra	.L0606D586
	mov	#0,r0
.L0606D556:
	mov.w	.L0606D5D8,r6
	mov.l	@(4,r15),r5
	mov.l	@r15,r4
	mov.l	.L0606D5F0,r3
	jsr	@r3
	nop
	tst	r0,r0
	bt	.L0606D56A
	bra	.L0606D586
	mov	#0,r0
.L0606D56A:
	mov.l	.L0606D5F4,r3
	jsr	@r3
	nop
	tst	r0,r0
	bt	.L0606D578
	bra	.L0606D586
	mov	#0,r0
.L0606D578:
	bsr	gfcf_Flush
	mov	r14,r4
	tst	r0,r0
	bt	.L0606D584
	bra	.L0606D586
	mov	#0,r0
.L0606D584:
	mov	#1,r0
.L0606D586:
	add	#16,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfcf_Open

	glabel gfcf_Close
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L0606D5E8,r3
	mov.l	r4,@r15
	jsr	@r3
	mov.l	@(4,r4),r4
	mov.l	@r15,r4
	mov.l	@(12,r4),r4
	mov.l	.L0606D5F8,r3
	add	#4,r15
	jmp	@r3
	lds.l	@r15+,pr
	endlabel gfcf_Close

	glabel gfcf_GetNumSct
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov	r6,r13
	mov.l	.L0606D5FC,r3
	sts.l	pr,@-r15
	add	#-24,r15
	mov.l	r4,@(16,r15)
	mov.l	r5,@(20,r15)
	mov.l	@(16,r15),r14
	mov.l	r6,@-r15
	add	#28,r14
	mov.l	@(24,r15),r6
	mov	r15,r7
	mov.l	@(36,r14),r5
	add	#4,r7
	jsr	@r3
	mov.l	@(4,r14),r4
	mov	r0,r4
	tst	r4,r4
	bt/s	.L0606D600
	add	#4,r15
	bra	.L0606D65A
	mov	#0,r0
.L0606D5D8:
	.short 0x00FF
	.byte 0x00, 0x00
.L0606D5DC:
	.long _slow_mvn
.L0606D5E0:
	.long gfcd_AllocBuf
.L0606D5E4:
	.long gfcd_AllocFilt
.L0606D5E8:
	.long gfcd_FreeBuf
.L0606D5EC:
	.long gfcd_SetFilt
.L0606D5F0:
	.long gfcd_SetFiltCon
.L0606D5F4:
	.long gfcd_WaitServer
.L0606D5F8:
	.long gfcd_FreeFilt
.L0606D5FC:
	.long gfcd_GetSctNum
.L0606D600:
	mov.l	.L0606D7F4,r3
	jsr	@r3
	nop
	tst	r0,r0
	bt	.L0606D60E
	bra	.L0606D65A
	mov	#0,r0
.L0606D60E:
	tst	r13,r13
	bt	.L0606D658
	mov	#0,r12
	mov.l	r12,@-r15
	mov	r12,r6
	mov.l	r12,@-r15
	mov	r15,r3
	add	#12,r3
	mov.l	r3,@-r15
	mov.l	.L0606D7F8,r3
	mov	r15,r2
	add	#24,r2
	mov.l	r2,@-r15
	mov.l	@(32,r15),r4
	mov	r15,r7
	add	#24,r7
	jsr	@r3
	mov	r12,r5
	add	#16,r15
	bsr	gfcf_Tell
	mov	r14,r4
	mov.l	@r15,r3
	add	r3,r0
	mov.l	@(12,r15),r2
	cmp/ge	r2,r0
	bf	.L0606D658
	mov.l	@(4,r15),r0
	tst	r0,r0
	bt	.L0606D658
	cmp/pl	r3
	bf	.L0606D658
	mov.l	@(4,r15),r3
	mov.l	@(8,r15),r2
	mov.l	@r13,r1
	sub	r3,r2
	sub	r2,r1
	mov.l	r1,@r13
.L0606D658:
	mov.l	@r15,r0
.L0606D65A:
	add	#24,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfcf_GetNumSct

	glabel gfcf_Dummy0
	rts
	mov	#0,r0
	endlabel gfcf_Dummy0

	glabel gfcf_SetFilt
	mov	r6,r2
	mov.l	.L0606D7FC,r3
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov	r4,r14
	mov.l	r5,@(24,r14)
	mov	r14,r1
	add	#16,r1
	jsr	@r3
	mov	#6,r0
	mov	#0,r2
	mov.l	.L0606D800,r3
	mov	r2,r7
	mov.l	r2,@-r15
	jsr	@r3
	mov.l	@(12,r14),r4
	mov	r0,r4
	tst	r4,r4
	bf/s	.L0606D69A
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	.L0606D7F4,r3
	jmp	@r3
	mov.l	@r15+,r14
.L0606D69A:
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel gfcf_SetFilt

	glabel gfcf_Flush
	sts.l	pr,@-r15
	mov	#-1,r6
	mov.l	.L0606D804,r3
	mov	#0,r5
	add	#-4,r15
	mov.l	r4,@r15
	jsr	@r3
	mov.l	@(4,r4),r4
	mov.l	.L0606D7F4,r2
	add	#4,r15
	jmp	@r2
	lds.l	@r15+,pr
	endlabel gfcf_Flush

	glabel gfcf_Tell
	mov.l	@(36,r4),r3
	mov.l	@(32,r4),r0
	rts
	add	r3,r0
	endlabel gfcf_Tell

	glabel gfcf_GetBufSct
	sts.l	pr,@-r15
	mov	#0,r3
	mov.l	.L0606D808,r6
	add	#-8,r15
	mov.l	.L0606D80C,r2
	mov	r3,r5
	mov.l	r4,@(4,r15)
	mov.l	r3,@-r15
	mov.l	@(8,r15),r4
	mov	r15,r7
	add	#4,r7
	jsr	@r2
	mov.l	@(4,r4),r4
	mov	r0,r4
	tst	r4,r4
	bt/s	.L0606D6EA
	add	#4,r15
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov	#-1,r0
.L0606D6EA:
	mov.l	.L0606D7F4,r3
	jsr	@r3
	nop
	tst	r0,r0
	bt	.L0606D6FC
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov	#-1,r0
.L0606D6FC:
	mov.l	@r15,r3
	cmp/pz	r3
	bt	.L0606D706
	mov	#0,r1
	mov.l	r1,@r15
.L0606D706:
	mov.l	@r15,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfcf_GetBufSct

	glabel gfcf_Seek
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov	r5,r13
	mov.l	r11,@-r15
	cmp/pz	r13
	sts.l	pr,@-r15
	mov	r4,r11
	add	#-4,r15
	mov	r11,r14
	mov.l	r6,@r15
	bt/s	.L0606D72C
	add	#28,r14
	mov	#0,r13
.L0606D72C:
	mov.l	@r15,r0
	cmp/eq	#1,r0
	bf	.L0606D73E
	mov	r13,r12
	bsr	gfcf_Tell
	mov	r14,r4
	mov	r0,r13
	bra	.L0606D758
	add	r12,r13
.L0606D73E:
	bsr	gfcf_Tell
	mov	r14,r4
	cmp/eq	r13,r0
	bf	.L0606D74A
	bra	.L0606D7E6
	mov	r13,r0
.L0606D74A:
	bsr	gfcf_GetBufSct
	mov	r14,r4
	mov	r0,r12
	cmp/pz	r12
	bt	.L0606D758
	bra	.L0606D7E6
	mov	#-1,r0
.L0606D758:
	mov	#76,r0
	mov.l	@(r0,r11),r1
	tst	r1,r1
	bf	.L0606D798
	mov.l	@(32,r14),r3
	cmp/gt	r13,r3
	bt	.L0606D774
	bsr	gfcf_Tell
	mov	r14,r4
	cmp/ge	r0,r13
	bt	.L0606D774
	mov	r13,r12
	mov.l	@(32,r14),r3
	sub	r3,r12
.L0606D774:
	cmp/pl	r12
	bf	.L0606D790
	mov.l	.L0606D804,r3
	mov	r12,r6
	mov	#0,r5
	jsr	@r3
	mov.l	@(4,r14),r4
	mov.l	.L0606D7F4,r2
	jsr	@r2
	nop
	tst	r0,r0
	bt	.L0606D790
	bra	.L0606D7E6
	mov	#-1,r0
.L0606D790:
	mov.l	r13,@(32,r14)
	mov	#0,r3
	bra	.L0606D7D6
	mov.l	r3,@(36,r14)
.L0606D798:
	mov	#76,r0
	mov.l	@(r0,r11),r0
	cmp/eq	#1,r0
	bf	.L0606D7D6
	mov.l	@r15,r0
	cmp/eq	#1,r0
	bf	.L0606D7B4
	bsr	gfcf_GetBufSct
	mov	r14,r4
	mov	r0,r12
	cmp/pz	r12
	bt	.L0606D7B4
	bra	.L0606D7E6
	mov	#-1,r0
.L0606D7B4:
	mov.l	@(32,r14),r4
	cmp/ge	r4,r13
	bf	.L0606D7C2
	add	r4,r12
	add	#1,r12
	cmp/gt	r12,r13
	bf	.L0606D7D0
.L0606D7C2:
	bsr	gfcf_Flush
	mov	r14,r4
	tst	r0,r0
	bt	.L0606D7CE
	bra	.L0606D7E6
	mov	#-1,r0
.L0606D7CE:
	mov.l	r13,@(32,r14)
.L0606D7D0:
	mov.l	@(32,r14),r3
	sub	r3,r13
	mov.l	r13,@(36,r14)
.L0606D7D6:
	mov	r14,r4
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	bra	gfcf_Tell
	mov.l	@r15+,r14
.L0606D7E6:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L0606D7F4:
	.long gfcd_WaitServer
.L0606D7F8:
	.long gfsFlow_GetFinfo
.L0606D7FC:
	.long _slow_mvn
.L0606D800:
	.long gfcd_SetFilt
.L0606D804:
	.long gfcd_DelSct
.L0606D808:
	.long 0x0000FFFF
.L0606D80C:
	.long gfcd_GetSctNum
	endlabel gfcf_Seek

	glabel gfcf_StartPickup
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606D91C,r3
	add	#-28,r15
	mov.w	.L0606D918,r2
	mov.l	r4,@(20,r15)
	mov.l	r5,@(24,r15)
	mov.l	@(20,r15),r12
	mov.l	@r3,r14
	add	r2,r14
	mov.l	@(16,r14),r0
	tst	r0,r0
	bt/s	.L0606D834
	add	#28,r12
	bra	.L0606D8C8
	mov	#0,r0
.L0606D834:
	mov	r15,r3
	add	#4,r3
	mov.l	r3,@-r15
	mov	r15,r7
	mov.l	@(28,r15),r6
	add	#4,r7
	mov.l	@(36,r12),r5
	mov.l	.L0606D920,r3
	jsr	@r3
	mov.l	@(4,r12),r4
	tst	r0,r0
	bt/s	.L0606D852
	add	#4,r15
	bra	.L0606D8C8
	mov	#0,r0
.L0606D852:
	mov.l	.L0606D924,r3
	jsr	@r3
	nop
	tst	r0,r0
	bt	.L0606D860
	bra	.L0606D8C8
	mov	#0,r0
.L0606D860:
	mov.l	@(4,r15),r3
	cmp/pl	r3
	bt	.L0606D86A
	bra	.L0606D8C8
	mov	#0,r0
.L0606D86A:
	mov	#0,r13
	mov.l	r13,@-r15
	mov	r13,r6
	mov.l	r13,@-r15
	mov	r15,r3
	add	#16,r3
	mov.l	r3,@-r15
	mov.l	.L0606D928,r3
	mov	r15,r2
	add	#28,r2
	mov.l	r2,@-r15
	mov.l	@(36,r15),r4
	mov	r15,r7
	add	#28,r7
	jsr	@r3
	mov	r13,r5
	add	#16,r15
	bsr	gfcf_Tell
	mov	r12,r4
	mov.l	@r15,r3
	add	r3,r0
	mov.l	@(16,r15),r2
	cmp/ge	r2,r0
	bf	.L0606D8B0
	mov.l	@(8,r15),r0
	tst	r0,r0
	bt	.L0606D8B0
	cmp/pl	r3
	bf	.L0606D8B0
	mov.l	@(8,r15),r3
	mov.l	@(12,r15),r2
	mov.l	@(4,r15),r1
	sub	r3,r2
	sub	r2,r1
	mov.l	r1,@(4,r15)
.L0606D8B0:
	mov.l	.L0606D92C,r3
	jsr	@r3
	nop
	mov.l	r0,@r14
	mov.l	r13,@(4,r14)
	mov	r14,r0
	mov.l	@(4,r15),r2
	mov.l	r2,@(8,r14)
	mov.l	@r15,r3
	mov	#1,r2
	mov.l	r3,@(12,r14)
	mov.l	r2,@(16,r14)
.L0606D8C8:
	add	#28,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel gfcf_StartPickup

	glabel gfcf_StartTrans
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	.L0606D930,r3
	mov.l	r4,@(4,r15)
	mov.l	r5,@r15
	mov.l	@(4,r15),r6
	mov.l	@(36,r5),r5
	mov.l	@(12,r6),r6
	mov.l	@r15,r4
	jsr	@r3
	mov.l	@(4,r4),r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606D8F8
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L0606D8F8:
	mov.l	.L0606D924,r3
	jsr	@r3
	nop
	tst	r0,r0
	bt	.L0606D90A
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L0606D90A:
	mov	#1,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfcf_StartTrans

	glabel gfcf_Dummy1
	rts
	mov	#0,r0
.L0606D918:
	.short 0x0438
	.byte 0x00, 0x00
.L0606D91C:
	.long gfs_mng
.L0606D920:
	.long gfcd_GetSctNum
.L0606D924:
	.long gfcd_WaitServer
.L0606D928:
	.long gfsFlow_GetFinfo
.L0606D92C:
	.long CDC_GetDataPtr
.L0606D930:
	.long gfcd_StartTrans
	endlabel gfcf_Dummy1

	glabel gfcf_EndPickup
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606D9F8,r3
	add	#-12,r15
	mov.l	r4,@(4,r15)
	mov	r15,r4
	mov.l	r5,@r15
	add	#8,r4
	jsr	@r3
	mov	r6,r14
	mov	r14,r0
	cmp/eq	#-1,r0
	bf/s	.L0606D954
	mov	#1,r6
	mov.l	@r15,r14
	mov.l	@(12,r14),r14
.L0606D954:
	mov.l	@(4,r15),r4
	bsr	gfcf_Seek
	mov	r14,r5
	mov	#0,r3
	mov.l	@r15,r2
	mov.l	r3,@(16,r2)
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel gfcf_EndPickup

	glabel gfcf_CdSeek
	mov.l	.L0606D9FC,r3
	add	#-8,r15
	mov.l	r4,@(4,r15)
	mov.l	r5,@r15
	mov.l	@(4,r15),r5
	mov.l	@(28,r5),r5
	mov.l	@r15,r4
	jmp	@r3
	add	#8,r15
	endlabel gfcf_CdSeek

	glabel gfcf_SetCdCon
	mov	r4,r5
	mov.l	.L0606DA00,r3
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	r4,@r15
	mov.l	@(28,r5),r5
	jsr	@r3
	mov.l	@(12,r4),r4
	mov	r0,r4
	tst	r4,r4
	bt	.L0606D998
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L0606D998:
	mov.l	.L0606DA04,r3
	jsr	@r3
	nop
	mov	r0,r4
	tst	r4,r4
	bt	.L0606D9AC
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L0606D9AC:
	mov	#1,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfcf_SetCdCon

	glabel gfcf_Lock
	sts.l	pr,@-r15
	mov.l	.L0606DA08,r3
	add	#-4,r15
	mov.l	r4,@r15
	jsr	@r3
	nop
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606D9D0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L0606D9D0:
	mov.l	@r15,r3
	mov	#1,r0
	mov.l	r4,@(28,r3)
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel gfcf_Lock

	glabel gfcf_IsLocked
	add	#-4,r15
	mov.l	.L0606DA0C,r3
	mov.l	r4,@r15
	mov.l	@(28,r4),r4
	jmp	@r3
	add	#4,r15
	endlabel gfcf_IsLocked

	glabel gfcf_Unlock
	add	#-4,r15
	mov.l	.L0606DA10,r3
	mov.l	r4,@r15
	mov.l	@(28,r4),r4
	jmp	@r3
	add	#4,r15
	.byte 0x00, 0x00
.L0606D9F8:
	.long gfcd_EndTrans
.L0606D9FC:
	.long gfcd_Seek
.L0606DA00:
	.long gfcd_SetCdCon
.L0606DA04:
	.long gfcd_WaitServer
.L0606DA08:
	.long gfcd_Lock
.L0606DA0C:
	.long gfcd_IsLocked
.L0606DA10:
	.long gfcd_Unlock
	endlabel gfcf_Unlock
