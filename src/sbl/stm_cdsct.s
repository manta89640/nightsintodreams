! sbl/stm_cdsct: matching source. The readable C for this object is stm_cdsct.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0606A89C,"ax",@progbits
	.p2align 2

	glabel stm_CdContinue
	sts.l	pr,@-r15
	mov	#16,r0
	add	#-24,r15
	mov	r15,r3
	mov.l	r4,@r15
	mov	r15,r2
	mov	#3,r4
	add	#4,r3
	mov.l	r4,@r3
	add	#4,r2
	mov.l	r4,@(8,r2)
	mov	r15,r3
	mov.w	.L0606A9CA,r2
	mov	r15,r4
	add	#4,r3
	add	#4,r4
	mov.b	r2,@(r0,r3)
	mov.l	@r15,r5
	mov.l	.L0606A9CC,r3
	jsr	@r3
	mov.l	@(52,r5),r5
	mov	r0,r4
	tst	r4,r4
	bt	.L0606A8D4
	add	#24,r15
	lds.l	@r15+,pr
	rts
	mov	#-1,r0
.L0606A8D4:
	mov	#0,r0
	add	#24,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel stm_CdContinue

	glabel stm_CdPlayFrom
	mov	#1,r2
	sts.l	pr,@-r15
	mov	#16,r0
	add	#-28,r15
	mov	r15,r3
	mov.l	r4,@(4,r15)
	add	#8,r3
	mov.l	r5,@r15
	mov	r15,r4
	mov.l	r2,@r3
	add	#8,r4
	mov.l	@r15,r2
	mov	r15,r3
	add	#8,r3
	mov.l	r2,@(4,r3)
	mov	r15,r3
	add	#8,r3
	mov	#3,r2
	mov.l	r2,@(8,r3)
	mov	r15,r3
	add	#8,r3
	mov	#0,r2
	mov.b	r2,@(r0,r3)
	mov.l	@(4,r15),r5
	mov.l	.L0606A9CC,r3
	jsr	@r3
	mov.l	@(52,r5),r5
	cmp/eq	#-13,r0
	bf/s	.L0606A91E
	mov	r0,r4
	bra	.L0606A92E
	mov	#-23,r4
.L0606A91E:
	tst	r4,r4
	bt	.L0606A926
	bra	.L0606A92E
	mov	#-1,r4
.L0606A926:
	mov.l	.L0606A9D0,r3
	mov.l	@r15,r1
	mov.l	@r3,r2
	mov.l	r1,@(20,r2)
.L0606A92E:
	add	#28,r15
	lds.l	@r15+,pr
	rts
	mov	r4,r0
	endlabel stm_CdPlayFrom

	glabel stm_CdPlayTo
	mov	#16,r0
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606A9D0,r14
	add	#-28,r15
	mov.l	r4,@(4,r15)
	mov	r15,r3
	mov.l	r5,@r15
	mov	#1,r4
	add	#8,r3
	mov	r15,r2
	mov.l	r4,@r3
	add	#8,r2
	mov.l	@r14,r3
	mov.l	@(20,r3),r1
	mov.l	r1,@(4,r2)
	mov	r15,r3
	add	#8,r3
	mov	r15,r2
	mov.l	r4,@(8,r3)
	add	#8,r2
	mov.l	@r14,r3
	mov.l	@(20,r3),r3
	mov.l	@r15,r1
	sub	r3,r1
	add	r4,r1
	mov	r15,r3
	mov.l	r1,@(12,r2)
	add	#8,r3
	mov.w	.L0606A9CA,r2
	mov.b	r2,@(r0,r3)
	mov.l	@(4,r15),r5
	mov	r15,r4
	mov.l	.L0606A9CC,r3
	add	#8,r4
	jsr	@r3
	mov.l	@(52,r5),r5
	cmp/eq	#-13,r0
	bf/s	.L0606A98A
	mov	r0,r4
	bra	.L0606A998
	mov	#-23,r4
.L0606A98A:
	tst	r4,r4
	bt	.L0606A992
	bra	.L0606A998
	mov	#-1,r4
.L0606A992:
	mov.l	@r14,r2
	mov.l	@r15,r3
	mov.l	r3,@(24,r2)
.L0606A998:
	mov	r4,r0
	add	#28,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel stm_CdPlayTo

	glabel stm_GetSctInfo
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov	r6,r14
	mov.l	.L0606A9D8,r3
	add	#-16,r15
	mov.l	r4,@(4,r15)
	mov.l	r5,@r15
	mov.l	.L0606A9D4,r5
	mov.l	@(4,r15),r4
	jsr	@r3
	mov	#0,r6
	mov.l	@r15,r2
	mov	r0,r4
	cmp/ge	r4,r2
	bf	.L0606A9DC
	mov	#0,r0
	add	#16,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606A9CA:
	.short 0x00FF
.L0606A9CC:
	.long gfcd_Play
.L0606A9D0:
	.long stm_mng
.L0606A9D4:
	.long 0x7FFFFFFF
.L0606A9D8:
	.long gfcf_GetNumSct
.L0606A9DC:
	mov.l	@r15,r5
	mov	r15,r6
	mov.l	@(4,r15),r4
	add	#8,r6
	mov.l	.L0606AB1C,r3
	jsr	@r3
	mov.l	@(32,r4),r4
	mov	r15,r2
	add	#8,r2
	mov.l	@r2,r3
	mov.l	r3,@r14
	mov	r15,r2
	add	#8,r2
	mov	r15,r3
	mov.b	@(4,r2),r0
	add	#8,r3
	extu.b	r0,r0
	mov.l	r0,@(4,r14)
	mov.b	@(5,r3),r0
	extu.b	r0,r0
	mov.l	r0,@(8,r14)
	mov	r15,r0
	add	#8,r0
	mov.b	@(6,r0),r0
	mov.b	r0,@(12,r14)
	mov	r15,r0
	add	#8,r0
	mov.b	@(7,r0),r0
	mov.b	r0,@(13,r14)
	mov	#1,r0
	add	#16,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel stm_GetSctInfo

	glabel stm_GetSctData
	sts.l	pr,@-r15
	mov	#1,r6
	add	#-16,r15
	mov	r15,r3
	mov.l	r4,@(4,r15)
	mov	#64,r0
	mov.l	r5,@(12,r15)
	mov.l	r3,@-r15
	mov.l	@(8,r15),r5
	mov	r15,r7
	mov.l	@(16,r15),r3
	add	#12,r7
	mov.l	@(r0,r5),r5
	add	r3,r5
	mov.l	@(8,r15),r4
	mov.l	.L0606AB20,r3
	jsr	@r3
	mov.l	@(32,r4),r4
	mov.l	.L0606AB24,r2
	jsr	@r2
	nop
	mov.l	@(4,r15),r0
	add	#20,r15
	lds.l	@r15+,pr
	rts
	shlr	r0
	endlabel stm_GetSctData

	glabel stm_DelSctData
	mov.l	r14,@-r15
	mov	r6,r14
	mov.l	.L0606AB2C,r3
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov	r5,r13
	mov.l	.L0606AB28,r5
	add	#-4,r15
	mov.l	r4,@r15
	jsr	@r3
	mov	#0,r6
	mov	r0,r4
	mov	r13,r2
	add	r14,r2
	cmp/gt	r4,r2
	bf	.L0606AA78
	mov	r4,r14
	sub	r13,r14
.L0606AA78:
	cmp/pl	r14
	bf	.L0606AA90
	mov.l	@r15,r4
	mov	r14,r6
	mov.l	.L0606AB30,r3
	mov	r13,r5
	mov.l	@(32,r4),r4
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	jmp	@r3
	mov.l	@r15+,r14
.L0606AA90:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel stm_DelSctData

	glabel stm_GetSctNum
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606AB34,r13
	add	#-4,r15
	mov.l	@(32,r4),r14
.L0606AAA6:
	mov	r15,r5
	jsr	@r13
	mov	r14,r4
	mov	r0,r4
	tst	r4,r4
	bf	.L0606AAA6
	mov.l	@r15,r0
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel stm_GetSctNum

	glabel stm_GetFreeBufSiz
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	add	#-12,r15
	mov.l	.L0606AB38,r14
.L0606AAC6:
	mov	r15,r6
	mov	r15,r5
	add	#8,r5
	mov	r15,r4
	add	#4,r4
	jsr	@r14
	nop
	mov	r0,r4
	tst	r4,r4
	bf	.L0606AAC6
	mov.l	@r15,r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel stm_GetFreeBufSiz

	glabel stm_WaitCsct
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606AB3C,r3
	jsr	@r3
	mov	#-5,r4
	mov.l	.L0606AB40,r11
	mov	#4,r13
	mov.w	.L0606AB18,r12
	mov	#0,r14
.L0606AAFC:
	jsr	@r11
	nop
	extu.w	r0,r4
	tst	r13,r4
	bf	.L0606AB0C
	add	#1,r14
	cmp/ge	r12,r14
	bf	.L0606AAFC
.L0606AB0C:
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L0606AB18:
	.short 0x5F34
	.byte 0x00, 0x00
.L0606AB1C:
	.long gfcd_GetSctInfo
.L0606AB20:
	.long gfcd_GetSctNum
.L0606AB24:
	.long gfcd_WaitServer
.L0606AB28:
	.long 0x7FFFFFFF
.L0606AB2C:
	.long gfcf_GetNumSct
.L0606AB30:
	.long gfcd_DelSct
.L0606AB34:
	.long CDC_GetSctNum
.L0606AB38:
	.long CDC_GetBufSiz
.L0606AB3C:
	.long CDC_ClrHirqReq
.L0606AB40:
	.long CDC_GetHirqReq
	endlabel stm_WaitCsct
