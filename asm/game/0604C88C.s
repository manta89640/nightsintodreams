	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0604C88C,"ax",@progbits
	.p2align 2
	.byte 0x00, 0x00

	glabel func_0604C88E
	sts.l	pr,@-r15
	mov.l	.L0604C8B0,r2
	mov	#1,r0
	mov.l	r0,@r2
	mov.l	.L0604C8B4,r0
	jsr	@r0
	nop
.L0604C89C:
	mov.l	.L0604C8B8,r3
	mov.l	@r3,r0
	tst	r0,r0
	bt	.L0604C8BC
	mov.l	.L0604C8B4,r0
	jsr	@r0
	nop
	bra	.L0604C89C
	nop
	.byte 0x00, 0x00
.L0604C8B0:
	.long D_06051298
.L0604C8B4:
	.long func_06004BAE
.L0604C8B8:
	.long D_0605129C
.L0604C8BC:
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#240,r0
	ldc	r0,sr
	mov.l	.L0604C9B8,r0
	jsr	@r0
	nop
	mov.l	.L0604C9BC,r2
	mov.b	@(2,r2),r0
	not	r0,r0
	tst	#2,r0
	movt	r0
	mov.l	.L0604C9C0,r2
	mov.b	r0,@r2
	mov.l	.L0604C9C4,r2
	mov	#0,r0
	mov.b	r0,@r2
	mov.w	r0,@(116,gbr)
	mov.w	r0,@(118,gbr)
	mov.b	r0,@(110,gbr)
	mov.b	r0,@(60,gbr)
	mov	#0,r0
	mov.b	r0,@(20,gbr)
	mov.b	r0,@(30,gbr)
	mov.b	r0,@(31,gbr)
	mov	#0,r0
	mov.b	r0,@(63,gbr)
	mov.b	r0,@(107,gbr)
	mov.l	.L0604C9C8,r0
	jsr	@r0
	nop
	mov.l	.L0604C9CC,r0
	jsr	@r0
	nop
	mov.l	.L0604C9D0,r0
	jsr	@r0
	nop
	mov.l	r1,@-r15
	mov.l	.L0604C9D4,r14
	jsr	@r14
	nop
	mov.l	@r15+,r1
	mov	#0,r0
	mov.b	r0,@(20,gbr)
	mov.l	.L0604C9D8,r0
	jsr	@r0
	nop
	mov.l	.L0604C9DC,r0
	jsr	@r0
	nop
	mov.l	.L0604C9E0,r0
	jsr	@r0
	nop
	mov.l	.L0604C9E4,r0
	jsr	@r0
	nop
	mov.l	.L0604C9E8,r0
	jsr	@r0
	nop
	mova	.L0604CA00,r0
	mov	r0,r4
	mov.l	.L0604C9EC,r5
	mov.l	.L0604C9F0,r6
	mov	#-128,r3
	mov	#-116,r1
	shll2	r1
.L0604C946:
	mov.l	@(12,r3),r0
	and	#3,r0
	cmp/eq	#1,r0
	bt	.L0604C946
	mov.l	@(48,r3),r0
	mov	#0,r0
	mov.l	r0,@(12,r3)
	mov.b	r0,@r1
	mov.l	r4,@(0,r3)
	mov.l	r5,@(4,r3)
	mov.l	r6,@(8,r3)
	mov.w	.L0604CA04,r0
	mov.l	r0,@(12,r3)
	mov	#9,r0
	mov.l	r0,@(48,r3)
	mov	#-128,r1
.L0604C966:
	mov.l	@(12,r1),r0
	and	#3,r0
	cmp/eq	#1,r0
	bt	.L0604C966
	mov.l	.L0604C9F4,r5
	mov.l	.L0604C9F8,r0
	mov.w	.L0604C9B4,r6
	mov	r0,r2
	mov	#-112,r3
	mov	#-116,r1
	shll2	r1
.L0604C97C:
	mov.l	@(12,r3),r0
	and	#3,r0
	cmp/eq	#1,r0
	bt	.L0604C97C
	mov.l	@(32,r3),r0
	mov	#0,r0
	mov.l	r0,@(12,r3)
	mov.b	r0,@r1
	mov.l	r2,@(0,r3)
	mov.l	r5,@(4,r3)
	mov.l	r6,@(8,r3)
	mov.w	.L0604CA02,r0
	mov.l	r0,@(12,r3)
	mov	#9,r0
	mov.l	r0,@(32,r3)
	mov	#-112,r1
.L0604C99C:
	mov.l	@(12,r1),r0
	and	#3,r0
	cmp/eq	#1,r0
	bt	.L0604C99C
	mov	#6,r4
	mov.l	.L0604C9FC,r0
	mov.b	@(r0,r4),r4
	mov.w	@(224,gbr),r0
	or	r4,r0
	mov.w	r0,@(224,gbr)
	bra	.L0604CA06
	nop
.L0604C9B4:
	.short 0x0090
	.byte 0x00, 0x00
.L0604C9B8:
	.long func_06005560
.L0604C9BC:
	.long D_06064FA0
.L0604C9C0:
	.long D_060CB051
.L0604C9C4:
	.long D_060FFF96
.L0604C9C8:
	.long func_0600E586
.L0604C9CC:
	.long func_0600454C
.L0604C9D0:
	.long func_0602B94A
.L0604C9D4:
	.long func_0600DBCC
.L0604C9D8:
	.long func_0601EB14
.L0604C9DC:
	.long func_0601F068
.L0604C9E0:
	.long func_0601F16C
.L0604C9E4:
	.long func_0600D088
.L0604C9E8:
	.long func_06004348
.L0604C9EC:
	.long VDP2_VRAM
.L0604C9F0:
	.long 0x00040000
.L0604C9F4:
	.long D_060FFCE0
.L0604C9F8:
	.long D_0602D178
.L0604C9FC:
	.long lbl_0602B7E4
.L0604CA00:
	.byte 0x00, 0x00
.L0604CA02:
	.short 0x5601
.L0604CA04:
	.short 0x4601
.L0604CA06:
	mov.l	.L0604CB54,r2
	mov.l	.L0604CB58,r3
	mov.w	.L0604CB4C,r7
.L0604CA0C:
	mov.w	@r3+,r0
	mov.w	r0,@r2
	dt	r7
	bf/s	.L0604CA0C
	add	#2,r2
	mov	#2,r4
	mov.l	.L0604CB5C,r0
	mov.b	@(r0,r4),r4
	mov.w	@(224,gbr),r0
	or	r4,r0
	mov.w	r0,@(224,gbr)
	mov.w	.L0604CB4E,r0
	mov.w	r0,@(500,gbr)
	mov.w	r0,@(502,gbr)
	mov.w	r0,@(504,gbr)
	mov.w	r0,@(506,gbr)
	mov.w	r0,@(508,gbr)
	mov.w	r0,@(510,gbr)
	mov.w	.L0604CB50,r0
	mov.w	r0,@(498,gbr)
	mov.l	.L0604CB60,r3
	mov	#0,r0
	mov.l	.L0604CB64,r2
.L0604CA3A:
	mov.l	r0,@r3
	dt	r2
	bf/s	.L0604CA3A
	add	#4,r3
	mov.l	.L0604CB68,r3
	mov	#0,r0
	mov.l	.L0604CB64,r2
.L0604CA48:
	mov.l	r0,@r3
	dt	r2
	bf/s	.L0604CA48
	add	#4,r3
	mov.l	.L0604CB6C,r3
	mov	#0,r0
	mov.l	.L0604CB64,r2
.L0604CA56:
	mov.l	r0,@r3
	dt	r2
	bf/s	.L0604CA56
	add	#4,r3
	mov.l	.L0604CB70,r0
	jsr	@r0
	nop
	mov.l	.L0604CB74,r0
	jsr	@r0
	nop
	mov	#1,r0
	mov.w	r0,@(460,gbr)
	mov	#0,r0
	mov.l	r0,@(76,gbr)
	mov.l	.L0604CB78,r2
	mov.l	.L0604CB7C,r3
	mov	#0,r0
.L0604CA78:
	mov.w	r0,@r2
	dt	r3
	bf/s	.L0604CA78
	add	#2,r2
	mov	#1,r2
	mov.l	.L0604CB80,r3
	mov.b	r2,@r3
	mov.l	.L0604CB84,r4
	tst	r2,r2
	bt	.L0604CA8E
	mov.l	.L0604CB88,r4
.L0604CA8E:
	mov.l	r1,@-r15
	mov.l	.L0604CB8C,r5
	mov.l	.L0604CB90,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	mov.l	.L0604CB94,r6
	mov.l	.L0604CB80,r2
	mov.b	@r2,r0
	tst	r0,r0
	bt	.L0604CAA6
	mov.l	.L0604CB98,r6
.L0604CAA6:
	mov.l	.L0604CB9C,r7
	mov.l	.L0604CBA0,r0
	jsr	@r0
	nop
	mov.l	.L0604CBA4,r2
	mov.l	.L0604CBA8,r3
	mov.w	.L0604CB52,r4
.L0604CAB4:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604CAB4
	add	#4,r2
	mov.l	.L0604CBAC,r2
	mov.l	.L0604CBB0,r3
	mov.w	.L0604CB52,r4
.L0604CAC4:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604CAC4
	add	#4,r2
	mov.l	.L0604CBB4,r2
	mov.l	.L0604CBA8,r3
	mov.w	.L0604CB52,r4
.L0604CAD4:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604CAD4
	add	#4,r2
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#0,r0
	ldc	r0,sr
	mov.l	.L0604CBB8,r0
	jsr	@r0
	nop
	mov	#3,r0
	mov.b	r0,@(0,gbr)
	mov.l	.L0604CBBC,r0
	mov.l	.L0604CBC0,r2
	mov.l	r0,@r2
	mov.l	.L0604CBC4,r2
	mov	#1,r0
	mov.b	r0,@r2
	mov	#0,r0
	mov.l	.L0604CBC8,r2
	mov.b	r0,@r2
	mov.l	.L0604CBCC,r0
	mov	#0,r2
	mov.w	r2,@r0
	add	#2,r0
	mov.w	r2,@r0
	add	#2,r0
	mov	#30,r2
	mov.w	r2,@r0
	mov.l	.L0604CBD0,r2
	mov.l	.L0604CBD4,r0
	jsr	@r0
	nop
	mov.l	.L0604CBD8,r0
	mov.l	r0,@(12,r3)
	mov.l	.L0604CBDC,r2
	mov.b	@r2,r0
	cmp/pz	r0
	bf	.L0604CBE4
	mov.l	.L0604CBD0,r2
	mov.l	.L0604CBD4,r0
	jsr	@r0
	nop
	mov.l	.L0604CBDC,r2
	mov.b	@r2,r0
	mov.l	.L0604CBE0,r2
	shll2	r0
	mov.l	@(r0,r2),r0
	mov.l	r0,@(12,r3)
	mov.l	.L0604CBDC,r2
	mov	#-1,r0
	mov.b	r0,@r2
	lds.l	@r15+,pr
	rts
	nop
.L0604CB4C:
	.short 0x0090
.L0604CB4E:
	.short 0x0000
.L0604CB50:
	.short 0x003F
.L0604CB52:
	.short 0x0018
.L0604CB54:
	.long D_060FFCE0
.L0604CB58:
	.long D_0602D178
.L0604CB5C:
	.long lbl_0602B7E4
.L0604CB60:
	.long VDP2_VRAM + 0x58000
.L0604CB64:
	.long 0x00000380
.L0604CB68:
	.long VDP2_VRAM + 0x5A000
.L0604CB6C:
	.long VDP2_VRAM + 0x5C000
.L0604CB70:
	.long func_0602C390
.L0604CB74:
	.long func_0602C4D0
.L0604CB78:
	.long D_060CA000
.L0604CB7C:
	.long 0x00000800
.L0604CB80:
	.long D_0604CC3D
.L0604CB84:
	.long D_060512EC
.L0604CB88:
	.long D_060512F8
.L0604CB8C:
	.long D_00200000
.L0604CB90:
	.long func_06006C12
.L0604CB94:
	.long D_0604D454
.L0604CB98:
	.long D_0604D668
.L0604CB9C:
	.long VDP1_VRAM + 0x20000
.L0604CBA0:
	.long func_06047DB2
.L0604CBA4:
	.long D_060CA200
.L0604CBA8:
	.long D_0604DAF0
.L0604CBAC:
	.long D_060CA400
.L0604CBB0:
	.long D_0604DB50
.L0604CBB4:
	.long D_060CA600
.L0604CBB8:
	.long func_0602B93E
.L0604CBBC:
	.long 0x002FF100
.L0604CBC0:
	.long D_060CB014
.L0604CBC4:
	.long D_060CB062
.L0604CBC8:
	.long D_060CB003
.L0604CBCC:
	.long D_0604C888
.L0604CBD0:
	.long D_060FFFB0
.L0604CBD4:
	.long func_0600D0D0
.L0604CBD8:
	.long func_0604C7C8
.L0604CBDC:
	.long D_060CB061
.L0604CBE0:
	.long D_0604CC34
.L0604CBE4:
	mov.l	r1,@-r15
	mov.l	.L0604CC08,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	tst	r0,r0
	mov.l	.L0604CC0C,r2
	mov.b	r0,@r2
	bt	.L0604CC1C
	mov.l	.L0604CC10,r2
	mov.l	.L0604CC14,r0
	jsr	@r0
	nop
	mov.l	.L0604CC18,r0
	mov.l	r0,@(12,r3)
	lds.l	@r15+,pr
	rts
	nop
.L0604CC08:
	.long func_0600598C
.L0604CC0C:
	.long D_0604CC3C
.L0604CC10:
	.long D_060FFFB0
.L0604CC14:
	.long func_0600D0D0
.L0604CC18:
	.long func_0604CE10
.L0604CC1C:
	mov.l	r1,@-r15
	mov.l	.L0604CC30,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	bsr	func_0604CC40
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0604CC30:
	.long func_06005C96
	dlabel D_0604CC34
	.long func_0604D104
	.long func_0604D1F0
	dlabel D_0604CC3C
	.byte 0x00
	dlabel D_0604CC3D
	.byte 0x00, 0x00, 0x09
	endlabel func_0604C88E

	glabel func_0604CC40
	sts.l	pr,@-r15
	bsr	func_0604D3D8
	nop
	bsr	func_0604D3EC
	nop
	mov.l	.L0604CCC4,r13
	mov	#0,r14
	mov.b	@(4,r13),r0
	cmp/eq	#3,r0
	bt	.L0604CCE0
	mov	#1,r14
	mov.b	@(5,r13),r0
	cmp/eq	#3,r0
	bt	.L0604CCE0
	mov	#0,r14
	mov.b	@(4,r13),r0
	cmp/eq	#1,r0
	bt	.L0604CCF0
	mov	#1,r14
	mov.b	@(5,r13),r0
	cmp/eq	#1,r0
	bt	.L0604CCF0
	mov	#0,r14
	mov.b	@(4,r13),r0
	cmp/eq	#2,r0
	bt	.L0604CD24
	mov	#1,r14
	mov.b	@(5,r13),r0
	cmp/eq	#2,r0
	bt	.L0604CD24
	mov	#0,r14
	mov.w	@(8,r13),r0
	mov	#3,r2
	cmp/ge	r2,r0
	bt	.L0604CCD8
	mov	#1,r14
	mov.w	@(10,r13),r0
	mov	#3,r2
	cmp/ge	r2,r0
	bt	.L0604CCD8
	mov	#0,r14
	mov.w	@(8,r13),r0
	mov	#1,r2
	cmp/ge	r2,r0
	bt	.L0604CCDC
	mov	#1,r14
	mov.w	@(10,r13),r0
	mov	#1,r2
	cmp/ge	r2,r0
	bt	.L0604CCDC
	mov	#-1,r14
	mov.l	.L0604CCC8,r2
	mov.b	r14,@r2
	mov.l	.L0604CCCC,r2
	mov.l	.L0604CCD0,r0
	jsr	@r0
	nop
	mov.l	.L0604CCD4,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov	#0,r0
	mov.b	r0,@(0,r3)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604CCC4:
	.long D_060CB040
.L0604CCC8:
	.long D_060CB050
.L0604CCCC:
	.long D_060FFFB0
.L0604CCD0:
	.long func_0600D0D0
.L0604CCD4:
	.long func_0604D14C
.L0604CCD8:
	bra	.L0604CD90
	nop
.L0604CCDC:
	bra	.L0604CDA8
	nop
.L0604CCE0:
	bsr	func_0604CDE6
	nop
	bsr	func_0604D3C0
	nop
	bsr	func_0604D3A8
	nop
	bra	.L0604CDDC
	nop
.L0604CCF0:
	bsr	func_0604CDE6
	nop
	bsr	func_0604D3EC
	nop
	tst	r14,r14
	bf	.L0604CD10
	bsr	func_0604D3C0
	nop
	mov.w	@(8,r13),r0
	mov	#2,r2
	cmp/ge	r2,r0
	bf	.L0604CDDC
	bsr	func_0604D37C
	nop
	bra	.L0604CDDC
	nop
.L0604CD10:
	bsr	func_0604D3C0
	nop
	mov.w	@(10,r13),r0
	mov	#2,r2
	cmp/ge	r2,r0
	bf	.L0604CDDC
	bsr	func_0604D37C
	nop
	bra	.L0604CDDC
	nop
.L0604CD24:
	bsr	func_0604CDE6
	nop
	bsr	func_0604D3D8
	nop
	tst	r14,r14
	bf	.L0604CD4E
	bsr	func_0604D3A8
	nop
	mov.w	@(8,r13),r0
	mov	#1,r2
	cmp/ge	r2,r0
	bt	.L0604CD46
	mov.w	@(10,r13),r0
	cmp/ge	r2,r0
	bf	.L0604CD6C
	bsr	func_0604CDE6
	mov	#1,r14
.L0604CD46:
	bsr	func_0604D350
	nop
	bra	.L0604CDDC
	nop
.L0604CD4E:
	bsr	func_0604D3A8
	nop
	mov.w	@(10,r13),r0
	mov	#1,r2
	cmp/ge	r2,r0
	bt	.L0604CD64
	mov.w	@(8,r13),r0
	cmp/ge	r2,r0
	bf	.L0604CD6C
	bsr	func_0604CDE6
	mov	#0,r14
.L0604CD64:
	bsr	func_0604D350
	nop
	bra	.L0604CDDC
	nop
.L0604CD6C:
	mov.l	.L0604CD84,r2
	mov.l	.L0604CD88,r0
	jsr	@r0
	nop
	mov.l	.L0604CD8C,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov	#0,r0
	mov.w	r0,@(10,r3)
	lds.l	@r15+,pr
	rts
	nop
.L0604CD84:
	.long D_060FFFB0
.L0604CD88:
	.long func_0600D0D0
.L0604CD8C:
	.long func_0604D14C
.L0604CD90:
	bsr	func_0604CDE6
	nop
	bsr	func_0604D350
	nop
	bsr	func_0604D37C
	nop
	mov	r14,r12
	add	r13,r12
	mov	#3,r0
	mov.b	r0,@(4,r12)
	bra	.L0604CDDC
	nop
.L0604CDA8:
	bsr	func_0604CDE6
	nop
	bsr	func_0604D350
	nop
	mov	r14,r12
	add	r13,r12
	mov	#1,r0
	mov.b	r0,@(4,r12)
	mov.l	.L0604CDD0,r2
	mov.l	.L0604CDD4,r0
	jsr	@r0
	nop
	mov.l	.L0604CDD8,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov	#0,r0
	mov.w	r0,@(10,r3)
	lds.l	@r15+,pr
	rts
	nop
.L0604CDD0:
	.long D_060FFFB0
.L0604CDD4:
	.long func_0600D0D0
.L0604CDD8:
	.long func_0604D298
.L0604CDDC:
	mov	#16,r0
	mov.b	r0,@(0,gbr)
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_0604CC40

	glabel func_0604CDE6
	mov.l	.L0604CDF8,r2
	mov.b	r14,@r2
	mov.l	.L0604CDFC,r2
	tst	r14,r14
	bf	.L0604CE04
	mov.l	.L0604CE00,r0
	rts
	mov.l	r0,@r2
	.byte 0x00, 0x00
.L0604CDF8:
	.long D_060CB050
.L0604CDFC:
	.long D_060CB014
.L0604CE00:
	.long 0x002FF100
.L0604CE04:
	mov.l	.L0604CE0C,r0
	rts
	mov.l	r0,@r2
	.byte 0x00, 0x00
.L0604CE0C:
	.long 0x002FF880
	endlabel func_0604CDE6

	glabel func_0604CE10
	sts.l	pr,@-r15
	mov.l	.L0604CE60,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L0604CE44
	mov	#0,r0
	mov.b	r0,@(0,r1)
	mov.l	.L0604CE64,r2
	mov.l	.L0604CE68,r3
	mov.w	.L0604CE5C,r4
.L0604CE24:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604CE24
	add	#4,r2
	mov.l	.L0604CE6C,r2
	mov.l	.L0604CE70,r3
	mov.w	.L0604CE5C,r4
.L0604CE34:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604CE34
	add	#4,r2
	mov.l	.L0604CE74,r0
	mov.l	r0,@-r1
	add	#4,r1
.L0604CE44:
	mov	#0,r5
	mov.l	.L0604CE78,r2
	mov.b	@r2,r4
	shll2	r4
	shll	r4
	add	#-8,r4
	mov.l	.L0604CE7C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0604CE5C:
	.short 0x0008
	.byte 0x00, 0x00
.L0604CE60:
	.long D_0604C88A
.L0604CE64:
	.long D_060CA400
.L0604CE68:
	.long D_0604DAF0
.L0604CE6C:
	.long D_060CA600
.L0604CE70:
	.long D_0604DB50
.L0604CE74:
	.long func_0604CE80
.L0604CE78:
	.long D_0604CC3C
.L0604CE7C:
	.long func_0604D400
	endlabel func_0604CE10

	glabel func_0604CE80
	sts.l	pr,@-r15
	mov.l	.L0604CEBC,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L0604CED8
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#0,r6
	mov.l	.L0604CEC0,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.b	@(0,r1),r0
	cmp/eq	#0,r0
	bt	.L0604CEC8
	mov.l	.L0604CEC4,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604CEBC:
	.long D_0604C88A
.L0604CEC0:
	.long func_0600E4C4
.L0604CEC4:
	.long func_0604D04C
.L0604CEC8:
	mov.l	.L0604CED4,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L0604CED4:
	.long func_0604D018
.L0604CED8:
	bsr	func_0604CEFC
	nop
	mov	#4,r5
	mov.l	.L0604CEF4,r2
	mov.b	@r2,r4
	shll2	r4
	shll	r4
	add	#-8,r4
	mov.l	.L0604CEF8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0604CEF4:
	.long D_0604CC3C
.L0604CEF8:
	.long func_0604D400
	endlabel func_0604CE80

	glabel func_0604CEFC
	sts.l	pr,@-r15
	mov.l	.L0604CF2C,r0
	mov.w	@r0,r0
	tst	#8,r0
	bt	.L0604CF34
	mov	#1,r0
	mov.b	r0,@(0,r1)
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#0,r6
	mov.l	.L0604CF30,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	bra	.L0604CF64
	nop
.L0604CF2C:
	.long D_0604C88A
.L0604CF30:
	.long func_0600E4C4
.L0604CF34:
	tst	#4,r0
	bt	.L0604CF64
	mov	#0,r0
	mov.b	r0,@(0,r1)
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#0,r6
	mov.l	.L0604CF60,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	bra	.L0604CF64
	nop
	.byte 0x00, 0x00
.L0604CF60:
	.long func_0600E4C4
.L0604CF64:
	mov.b	@(0,r1),r0
	tst	r0,r0
	bt	.L0604CFA0
	mov.l	.L0604CF90,r2
	mov.l	.L0604CF94,r3
	mov.w	.L0604CF8E,r4
.L0604CF70:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604CF70
	add	#4,r2
	mov.l	.L0604CF98,r2
	mov.l	.L0604CF9C,r3
	mov.w	.L0604CF8E,r4
.L0604CF80:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604CF80
	add	#4,r2
	bra	.L0604CFC0
	nop
.L0604CF8E:
	.short 0x0008
.L0604CF90:
	.long D_060CA400
.L0604CF94:
	.long D_0604DB50
.L0604CF98:
	.long D_060CA600
.L0604CF9C:
	.long D_0604DAF0
.L0604CFA0:
	mov.l	.L0604CFDC,r2
	mov.l	.L0604CFE0,r3
	mov.w	.L0604CFD8,r4
.L0604CFA6:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604CFA6
	add	#4,r2
	mov.l	.L0604CFE4,r2
	mov.l	.L0604CFE8,r3
	mov.w	.L0604CFD8,r4
.L0604CFB6:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604CFB6
	add	#4,r2
.L0604CFC0:
	mov.l	.L0604CFEC,r2
	mov.b	@r2,r2
	tst	r2,r2
	bt	.L0604CFFC
	mov.l	.L0604CFF0,r13
	mov.l	.L0604CFF4,r5
	mov.l	.L0604CFF8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0604CFD8:
	.short 0x0008
	.byte 0x00, 0x00
.L0604CFDC:
	.long D_060CA400
.L0604CFE0:
	.long D_0604DAF0
.L0604CFE4:
	.long D_060CA600
.L0604CFE8:
	.long D_0604DB50
.L0604CFEC:
	.long D_0604CC3D
.L0604CFF0:
	.long D_0604D668
.L0604CFF4:
	.long D_0604DADC
.L0604CFF8:
	.long func_06047B44
.L0604CFFC:
	mov.l	.L0604D00C,r13
	mov.l	.L0604D010,r5
	mov.l	.L0604D014,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0604D00C:
	.long D_0604D454
.L0604D010:
	.long D_0604D9C0
.L0604D014:
	.long func_06047B44
	endlabel func_0604CEFC

	glabel func_0604D018
	sts.l	pr,@-r15
	mov.l	r1,@-r15
	mov.l	.L0604D034,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	tst	r0,r0
	bf	.L0604D03C
	mov.l	.L0604D038,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L0604D034:
	.long func_06005AF8
.L0604D038:
	.long func_0604D090
.L0604D03C:
	mov.l	.L0604D048,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L0604D048:
	.long func_0604D0C8
	endlabel func_0604D018

	glabel func_0604D04C
	sts.l	pr,@-r15
	mov.l	.L0604D06C,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L0604D05C
	mov.l	.L0604D070,r0
	mov.l	r0,@-r1
	add	#4,r1
.L0604D05C:
	mov	#8,r5
	mov	#0,r4
	mov.l	.L0604D074,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0604D06C:
	.long D_0604C88A
.L0604D070:
	.long func_0604D078
.L0604D074:
	.long func_0604D400
	endlabel func_0604D04C

	glabel func_0604D078
	sts.l	pr,@-r15
	mov	#12,r5
	mov	#0,r4
	mov.l	.L0604D08C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604D08C:
	.long func_0604D400
	endlabel func_0604D078

	glabel func_0604D090
	sts.l	pr,@-r15
	mov.l	.L0604D0B8,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L0604D09E
	mov	#14,r0
	mov.b	r0,@(0,gbr)
.L0604D09E:
	mov.l	.L0604D0BC,r5
	mov.l	.L0604D0C0,r2
	mov.b	@r2,r4
	shll2	r4
	shll	r4
	add	#-8,r4
	mov.l	.L0604D0C4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604D0B8:
	.long D_0604C88A
.L0604D0BC:
	.long 0x00000010
.L0604D0C0:
	.long D_0604CC3C
.L0604D0C4:
	.long func_0604D400
	endlabel func_0604D090

	glabel func_0604D0C8
	sts.l	pr,@-r15
	mov.l	.L0604D0F0,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L0604D0D8
	mov.l	.L0604D0F4,r0
	mov.l	r0,@-r1
	add	#4,r1
.L0604D0D8:
	mov.l	.L0604D0F8,r5
	mov.l	.L0604D0FC,r2
	mov.b	@r2,r4
	shll2	r4
	shll	r4
	add	#-8,r4
	mov.l	.L0604D100,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0604D0F0:
	.long D_0604C88A
.L0604D0F4:
	.long func_0604D04C
.L0604D0F8:
	.long 0x00000014
.L0604D0FC:
	.long D_0604CC3C
.L0604D100:
	.long func_0604D400
	endlabel func_0604D0C8

	glabel func_0604D104
	sts.l	pr,@-r15
	mov.l	.L0604D138,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L0604D114
	mov.l	.L0604D13C,r0
	mov.l	r0,@-r1
	add	#4,r1
.L0604D114:
	mov.l	.L0604D140,r2
	mov.b	@r2,r4
	shll2	r4
	mov	#24,r5
	mov.l	.L0604D144,r0
	jsr	@r0
	shll	r4
	mov	#64,r5
	mov.l	.L0604D148,r2
	mov.b	@r2,r4
	add	#-1,r4
	shll2	r4
	mov.l	.L0604D144,r0
	jsr	@r0
	shll	r4
	lds.l	@r15+,pr
	rts
	nop
.L0604D138:
	.long D_0604C88A
.L0604D13C:
	.long func_0604D078
.L0604D140:
	.long D_060CB050
.L0604D144:
	.long func_0604D400
.L0604D148:
	.long D_060CB052
	endlabel func_0604D104

	glabel func_0604D14C
	sts.l	pr,@-r15
	mov.l	.L0604D188,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L0604D1A8
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#0,r6
	mov.l	.L0604D18C,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.b	@(0,r1),r0
	cmp/eq	#0,r0
	bt	.L0604D194
	mov.l	.L0604D190,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604D188:
	.long D_0604C88A
.L0604D18C:
	.long func_0600E4C4
.L0604D190:
	.long func_0604D2C8
.L0604D194:
	mov	#16,r0
	mov.b	r0,@(0,gbr)
	mov.l	.L0604D1A4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0604D1A4:
	.long func_0600D1A0
.L0604D1A8:
	bsr	func_0604CEFC
	nop
	mov	#28,r5
	mov.l	.L0604D1BC,r0
	jsr	@r0
	mov	#0,r4
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604D1BC:
	.long func_0604D400
	endlabel func_0604D14C

	glabel func_0604D1C0
	sts.l	pr,@-r15
	mov.l	.L0604D1E0,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L0604D1D0
	mov.l	.L0604D1E4,r0
	mov.l	r0,@-r1
	add	#4,r1
.L0604D1D0:
	mov	#32,r5
	mov.l	.L0604D1E8,r0
	jsr	@r0
	mov	#0,r4
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604D1E0:
	.long D_0604C88A
.L0604D1E4:
	.long func_0604D078
.L0604D1E8:
	.long func_0604D400
	.byte 0x00, 0x0B, 0x00, 0x09
	endlabel func_0604D1C0

	glabel func_0604D1F0
	sts.l	pr,@-r15
	mov.l	.L0604D22C,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L0604D248
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#0,r6
	mov.l	.L0604D230,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.b	@(0,r1),r0
	cmp/eq	#0,r0
	bf	.L0604D238
	mov.l	.L0604D234,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604D22C:
	.long D_0604C88A
.L0604D230:
	.long func_0600E4C4
.L0604D234:
	.long func_0604D2F4
.L0604D238:
	mov.l	.L0604D244,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L0604D244:
	.long func_0604D260
.L0604D248:
	bsr	func_0604CEFC
	nop
	mov	#36,r5
	mov.l	.L0604D25C,r0
	jsr	@r0
	mov	#0,r4
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604D25C:
	.long func_0604D400
	endlabel func_0604D1F0

	glabel func_0604D260
	sts.l	pr,@-r15
	mov.l	.L0604D27C,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L0604D284
	mov	#14,r0
	mov.b	r0,@(0,gbr)
	mov.l	.L0604D280,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604D27C:
	.long D_0604C88A
.L0604D280:
	.long func_0600D1A0
.L0604D284:
	mov	#40,r5
	mov.l	.L0604D294,r0
	jsr	@r0
	mov	#0,r4
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604D294:
	.long func_0604D400
	endlabel func_0604D260

	glabel func_0604D298
	sts.l	pr,@-r15
	mov.l	.L0604D2BC,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L0604D2AC
	mov	#16,r0
	mov.b	r0,@(0,gbr)
	mov.l	.L0604D2C0,r0
	jsr	@r0
	nop
.L0604D2AC:
	mov	#52,r5
	mov.l	.L0604D2C4,r0
	jsr	@r0
	mov	#0,r4
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604D2BC:
	.long D_0604C88A
.L0604D2C0:
	.long func_0600D1A0
.L0604D2C4:
	.long func_0604D400
	endlabel func_0604D298

	glabel func_0604D2C8
	sts.l	pr,@-r15
	mov.l	.L0604D2E8,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L0604D2D8
	mov.l	.L0604D2EC,r0
	mov.l	r0,@-r1
	add	#4,r1
.L0604D2D8:
	mov	#56,r5
	mov.l	.L0604D2F0,r0
	jsr	@r0
	mov	#0,r4
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604D2E8:
	.long D_0604C88A
.L0604D2EC:
	.long func_0604D1C0
.L0604D2F0:
	.long func_0604D400
	endlabel func_0604D2C8

	glabel func_0604D2F4
	sts.l	pr,@-r15
	mov.l	r1,@-r15
	mov.l	.L0604D324,r2
	mov.b	@r2,r4
	mov.l	.L0604D328,r2
	mov.b	@r2,r5
	mov.l	.L0604D32C,r0
	jsr	@r0
	nop
	mov.l	.L0604D330,r0
	jsr	@r0
	nop
	mov.l	.L0604D334,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	tst	r0,r0
	bt	.L0604D33C
	mov.l	.L0604D338,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L0604D324:
	.long D_060CB050
.L0604D328:
	.long D_060CB052
.L0604D32C:
	.long func_060055CC
.L0604D330:
	.long func_0600598C
.L0604D334:
	.long func_06005C96
.L0604D338:
	.long func_0604D1F0
.L0604D33C:
	mov	#2,r0
	mov.b	r0,@(0,gbr)
	mov.l	.L0604D34C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0604D34C:
	.long func_0600D1A0
	endlabel func_0604D2F4

	glabel func_0604D350
	mov.l	r1,@-r15
	sts.l	pr,@-r15
	mov	r14,r4
	mov	#1,r5
	mov.l	.L0604D370,r0
	jsr	@r0
	nop
	mov.l	.L0604D374,r0
	jsr	@r0
	nop
	mov.l	.L0604D378,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r1
.L0604D370:
	.long func_060055CC
.L0604D374:
	.long func_0600598C
.L0604D378:
	.long func_06005C96
	endlabel func_0604D350

	glabel func_0604D37C
	mov.l	r1,@-r15
	sts.l	pr,@-r15
	mov	r14,r4
	mov	#2,r5
	mov.l	.L0604D39C,r0
	jsr	@r0
	nop
	mov.l	.L0604D3A0,r0
	jsr	@r0
	nop
	mov.l	.L0604D3A4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r1
.L0604D39C:
	.long func_060055CC
.L0604D3A0:
	.long func_0600598C
.L0604D3A4:
	.long func_06005C96
	endlabel func_0604D37C

	glabel func_0604D3A8
	mov.l	r1,@-r15
	sts.l	pr,@-r15
	mov	r14,r4
	mov.l	.L0604D3BC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r1
	.byte 0x00, 0x00
.L0604D3BC:
	.long func_06005910
	endlabel func_0604D3A8

	glabel func_0604D3C0
	mov.l	r1,@-r15
	sts.l	pr,@-r15
	mov	r14,r4
	mov.l	.L0604D3D4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r1
	.byte 0x00, 0x00
.L0604D3D4:
	.long func_06005834
	endlabel func_0604D3C0

	glabel func_0604D3D8
	sts.l	pr,@-r15
	mov.l	.L0604D3E8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604D3E8:
	.long func_0604A8EC
	endlabel func_0604D3D8

	glabel func_0604D3EC
	sts.l	pr,@-r15
	mov.l	.L0604D3FC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604D3FC:
	.long func_0604AA08
	endlabel func_0604D3EC

	glabel func_0604D400
	sts.l	pr,@-r15
	mov.l	.L0604D420,r2
	mov.b	@r2,r2
	tst	r2,r2
	bt	.L0604D430
	mov.l	.L0604D424,r3
	add	r3,r5
	mov.l	@r5,r5
	add	r4,r5
	mov.l	.L0604D428,r13
	mov.l	.L0604D42C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0604D420:
	.long D_0604CC3D
.L0604D424:
	.long D_0604D8A0
.L0604D428:
	.long D_0604D668
.L0604D42C:
	.long func_06047BCC
.L0604D430:
	mov.l	.L0604D448,r3
	add	r3,r5
	mov.l	@r5,r5
	add	r4,r5
	mov.l	.L0604D44C,r13
	mov.l	.L0604D450,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604D448:
	.long D_0604D85C
.L0604D44C:
	.long D_0604D454
.L0604D450:
	.long func_06047BCC
	endlabel func_0604D400

	.section .data.0604D454,"aw",@progbits
	.p2align 2
	dlabel D_0604D454
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x10, 0x00, 0x20, 0x00, 0x00, 0x00, 0x20, 0x02, 0xC0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x58, 0x0B, 0x10, 0x00, 0x20, 0x02, 0xE0, 0x00, 0x20, 0x05, 0xA0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0xB0, 0x21, 0x2A, 0x00, 0x20, 0x05, 0xC0, 0x00, 0x20, 0x1B, 0x68
	.byte 0x01, 0x00, 0x00, 0x00, 0x03, 0x68, 0x1B, 0x2A, 0x00, 0x20, 0x1B, 0x88, 0x00, 0x20, 0x2D, 0x40
	.byte 0x01, 0x00, 0x00, 0x00
	.long SCSP_RAM_CACHED + 0x1D2A
	.byte 0x00, 0x20, 0x2D, 0x60, 0x00, 0x20, 0x40, 0x68, 0x01, 0x00, 0x00, 0x00, 0x08, 0x04, 0x1E, 0x29
	.byte 0x00, 0x20, 0x40, 0x88, 0x00, 0x20, 0x53, 0xC0, 0x01, 0x00, 0x00, 0x00, 0x0A, 0x6C, 0x1B, 0x29
	.byte 0x00, 0x20, 0x53, 0xE0, 0x00, 0x20, 0x65, 0x2C, 0x01, 0x00, 0x00, 0x00, 0x0C, 0x98, 0x19, 0x29
	.byte 0x00, 0x20, 0x65, 0x4C, 0x00, 0x20, 0x75, 0x50, 0x01, 0x00, 0x00, 0x00, 0x0E, 0x9C, 0x21, 0x29
	.byte 0x00, 0x20, 0x75, 0x70, 0x00, 0x20, 0x8A, 0x94, 0x01, 0x00, 0x00, 0x00, 0x11, 0x44, 0x25, 0x2B
	.byte 0x00, 0x20, 0x8A, 0xB4, 0x00, 0x20, 0xA3, 0x90, 0x01, 0x00, 0x00, 0x00, 0x14, 0x60, 0x22, 0x1B
	.byte 0x00, 0x20, 0xA3, 0xB0, 0x00, 0x20, 0xB2, 0x08, 0x01, 0x00, 0x00, 0x00, 0x16, 0x2C, 0x1D, 0x1B
	.byte 0x00, 0x20, 0xB2, 0x28, 0x00, 0x20, 0xBE, 0x64, 0x01, 0x00, 0x00, 0x00, 0x17, 0xB4, 0x1D, 0x1B
	.byte 0x00, 0x20, 0xBE, 0x84, 0x00, 0x20, 0xCA, 0xC0, 0x01, 0x00, 0x00, 0x00, 0x19, 0x3C, 0x21, 0x2A
	.byte 0x00, 0x20, 0xCA, 0xE0, 0x00, 0x20, 0xE0, 0x88, 0x01, 0x00, 0x00, 0x00, 0x1B, 0xF4, 0x17, 0x2A
	.byte 0x00, 0x20, 0xE0, 0xA8, 0x00, 0x20, 0xEF, 0xC0, 0x01, 0x00, 0x00, 0x00, 0x1D, 0xD8, 0x1B, 0x2A
	.byte 0x00, 0x20, 0xEF, 0xE0, 0x00, 0x21, 0x01, 0x98, 0x01, 0x00, 0x00, 0x00, 0x20, 0x10, 0x1F, 0x1A
	.byte 0x00, 0x21, 0x01, 0xB8, 0x00, 0x21, 0x0E, 0x50, 0x01, 0x00, 0x00, 0x00, 0x21, 0xA4, 0x1F, 0x1A
	.byte 0x00, 0x21, 0x0E, 0x70, 0x00, 0x21, 0x1B, 0x08, 0x01, 0x00, 0x00, 0x00, 0x23, 0x38, 0x1F, 0x1A
	.byte 0x00, 0x21, 0x1B, 0x28, 0x00, 0x21, 0x27, 0xC0, 0x01, 0x00, 0x00, 0x00, 0x24, 0xCC, 0x26, 0x29
	.byte 0x00, 0x21, 0x27, 0xE0, 0x00, 0x21, 0x40, 0x38, 0x01, 0x00, 0x00, 0x00, 0x27, 0xD8, 0x1E, 0x1E
	.byte 0x00, 0x21, 0x40, 0x58, 0x00, 0x21, 0x4E, 0x68, 0x01, 0x00, 0x00, 0x00, 0x29, 0x9C, 0x1E, 0x38
	.byte 0x00, 0x21, 0x4E, 0x88, 0x00, 0x21, 0x68, 0xC8, 0x01, 0x00, 0x00, 0x00, 0x2C, 0xE4, 0x11, 0x0B
	.byte 0x00, 0x21, 0x68, 0xE8, 0x00, 0x21, 0x6B, 0xD4, 0x01, 0x00, 0x00, 0x00, 0x2D, 0x44, 0x13, 0x20
	.byte 0x00, 0x21, 0x6B, 0xF4, 0x00, 0x21, 0x75, 0x74, 0x01, 0x00, 0x00, 0x00, 0x2E, 0x74, 0x21, 0x0D
	.byte 0x00, 0x21, 0x75, 0x94, 0x00, 0x21, 0x7C, 0x48, 0x01, 0x00, 0x00, 0x00, 0x2F, 0x4C, 0x1A, 0x1B
	.byte 0x00, 0x21, 0x7C, 0x68, 0x00, 0x21, 0x87, 0x60, 0x01, 0x00, 0x00, 0x00, 0x30, 0xAC, 0x25, 0x0C
	.byte 0x00, 0x21, 0x87, 0x80, 0x00, 0x21, 0x8E, 0x70, 0x01, 0x00, 0x00, 0x00, 0x31, 0x8C, 0x22, 0x48
	.byte 0x00, 0x21, 0x8E, 0x90, 0x00, 0x21, 0xB4, 0xD0, 0x01, 0x00, 0x00, 0x00, 0x36, 0x54, 0x1C, 0x1B
	.byte 0x00, 0x21, 0xB4, 0xF0, 0x00, 0x21, 0xC0, 0xC0, 0x01, 0x00, 0x00, 0x00, 0x37, 0xD0, 0x26, 0x1A
	.byte 0x00, 0x21, 0xC0, 0xE0, 0x00, 0x21, 0xD0, 0x50, 0x01, 0x00, 0x00, 0x00, 0x39, 0xC0, 0x26, 0x1A
	.byte 0x00, 0x21, 0xD0, 0x70, 0x00, 0x21, 0xDF, 0xE0, 0x02, 0x00, 0x00, 0x00, 0x3B, 0xB0, 0x05, 0x0B
	.byte 0x00, 0x21, 0xE0, 0x00, 0x00, 0x21, 0xE0, 0xDC, 0x03, 0x00, 0x00, 0x00, 0x3B, 0xCC, 0x03, 0x0B
	.byte 0x00, 0x21, 0xE0, 0xFC, 0x00, 0x21, 0xE1, 0x80, 0xFF, 0xFF, 0x00, 0x09
	dlabel D_0604D668
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x10, 0x00, 0x20, 0x00, 0x00, 0x00, 0x20, 0x02, 0xC0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x58, 0x0B, 0x10, 0x00, 0x20, 0x02, 0xE0, 0x00, 0x20, 0x05, 0xA0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0xB0, 0x1F, 0x1E, 0x00, 0x20, 0x05, 0xC0, 0x00, 0x20, 0x14, 0x48
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x84, 0x21, 0x1E, 0x00, 0x20, 0x14, 0x68, 0x00, 0x20, 0x23, 0xE0
	.byte 0x01, 0x00, 0x00, 0x00, 0x04, 0x74, 0x21, 0x20, 0x00, 0x20, 0x24, 0x00, 0x00, 0x20, 0x34, 0x80
	.byte 0x01, 0x00, 0x00, 0x00, 0x06, 0x84, 0x1D, 0x20, 0x00, 0x20, 0x34, 0xA0, 0x00, 0x20, 0x43, 0x20
	.byte 0x01, 0x00, 0x00, 0x00, 0x08, 0x54, 0x1D, 0x20, 0x00, 0x20, 0x43, 0x40, 0x00, 0x20, 0x51, 0xC0
	.byte 0x01, 0x00, 0x00, 0x00
	.asciz "\n$% "
	.byte 0x20, 0x51, 0xE0, 0x00, 0x20, 0x64, 0x60, 0x01, 0x00, 0x00, 0x00, 0x0C, 0x74, 0x21, 0x20, 0x00
	.byte 0x20, 0x64, 0x80, 0x00, 0x20, 0x75, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0E, 0x84, 0x21, 0x6A, 0x00
	.byte 0x20, 0x75, 0x20, 0x00, 0x20, 0xAB, 0xC8, 0x01, 0x00, 0x00, 0x00, 0x15, 0x5C, 0x21, 0x0D, 0x00
	.byte 0x20, 0xAB, 0xE8, 0x00, 0x20, 0xB2, 0x9C, 0x01, 0x00, 0x00, 0x00, 0x16, 0x34, 0x23, 0x0D, 0x00
	.byte 0x20, 0xB2, 0xBC, 0x00, 0x20, 0xB9, 0xD8, 0x01, 0x00, 0x00, 0x00, 0x17, 0x18, 0x21, 0x20, 0x00
	.byte 0x20, 0xB9, 0xF8, 0x00, 0x20, 0xCA, 0x78, 0x01, 0x00, 0x00, 0x00, 0x19, 0x28, 0x17, 0x20, 0x00
	.byte 0x20, 0xCA, 0x98, 0x00, 0x20, 0xD6, 0x18, 0x01, 0x00, 0x00, 0x00, 0x1A, 0x98, 0x17, 0x20, 0x00
	.byte 0x20, 0xD6, 0x38, 0x00, 0x20, 0xE1, 0xB8, 0x01, 0x00, 0x00, 0x00, 0x1C, 0x08, 0x24, 0x20, 0x00
	.byte 0x20, 0xE1, 0xD8, 0x00, 0x20, 0xF3, 0xD8, 0x01, 0x00, 0x00, 0x00, 0x1E, 0x48, 0x1E, 0x20, 0x00
	.byte 0x20, 0xF3, 0xF8, 0x00, 0x21, 0x02, 0xF8, 0x01, 0x00, 0x00, 0x00, 0x20, 0x28, 0x1D, 0x32, 0x00
	.byte 0x21, 0x03, 0x18, 0x00, 0x21, 0x19, 0xC0, 0x01, 0x00, 0x00, 0x00, 0x23, 0x00, 0x20, 0x20, 0x00
	.byte 0x21, 0x19, 0xE0, 0x00, 0x21, 0x29, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x25, 0x00, 0x20, 0x32, 0x00
	.byte 0x21, 0x2A, 0x00, 0x00, 0x21, 0x43, 0x00, 0x01, 0x00, 0x00, 0x00
	.asciz "( !Y"
	.byte 0x21, 0x43, 0x20, 0x00, 0x21, 0x71, 0x04, 0x01, 0x00, 0x00, 0x00, 0x2D, 0xE0, 0x26, 0x45, 0x00
	.byte 0x21, 0x71, 0x24, 0x00, 0x21, 0x9A, 0x1C, 0x01, 0x00, 0x00, 0x00, 0x33, 0x00, 0x26, 0x20, 0x00
	.byte 0x21, 0x9A, 0x3C, 0x00, 0x21, 0xAD, 0x3C, 0x01, 0x00, 0x00, 0x00, 0x35, 0x60, 0x1A, 0x0C, 0x00
	.byte 0x21, 0xAD, 0x5C, 0x00, 0x21, 0xB2, 0x3C, 0x01, 0x00, 0x00, 0x00, 0x35, 0xFC, 0x17, 0x1F, 0x00
	.byte 0x21, 0xB2, 0x5C, 0x00, 0x21, 0xBD, 0x80, 0x01, 0x00, 0x00, 0x00, 0x37, 0x64, 0x1A, 0x1F, 0x00
	.byte 0x21, 0xBD, 0xA0, 0x00, 0x21, 0xCA, 0x38, 0x01, 0x00, 0x00, 0x00, 0x38, 0xF8, 0x1B, 0x1F, 0x00
	.byte 0x21, 0xCA, 0x58, 0x00, 0x21, 0xD7, 0x6C, 0x01, 0x00, 0x00, 0x00, 0x3A, 0x9C, 0x24, 0x33, 0x00
	.byte 0x21, 0xD7, 0x8C, 0x00, 0x21, 0xF4, 0x3C, 0x01, 0x00, 0x00, 0x00
	.asciz ">4#2"
	.byte 0x21, 0xF4, 0x5C, 0x00, 0x22, 0x0F, 0xB4, 0x02, 0x00, 0x00, 0x00, 0x41, 0xA0, 0x03, 0x0B, 0x00
	.byte 0x22, 0x0F, 0xD4, 0x00, 0x22, 0x10, 0x58, 0x03, 0x00, 0x00, 0x00, 0x41, 0xB4, 0x04, 0x0B, 0x00
	.byte 0x22, 0x10, 0x78, 0x00, 0x22, 0x11, 0x28, 0xFF, 0xFF, 0x00, 0x09
	dlabel D_0604D85C
	.long D_0604D8E4
	.long D_0604D8FC
	.long D_0604D914
	.long D_0604D91C
	.long D_0604D924
	.long D_0604D93C
	.long D_0604D954
	.long D_0604D96C
	.long D_0604D974
	.long D_0604D97C
	.long D_0604D984
	.long D_0604D98C
	.long D_0604D994
	.long D_0604D9AC
	.long D_0604D9B4
	.long D_0604D9C0
	.long D_0604D9DC
	dlabel D_0604D8A0
	.long D_0604DA0C
	.long D_0604DA24
	.long D_0604DA3C
	.long D_0604DA44
	.long D_0604DA4C
	.long D_0604DA64
	.long D_0604DA7C
	.long D_0604DA9C
	.long D_0604DAA4
	.long D_0604DAAC
	.long D_0604DAB4
	.long D_0604DABC
	.long D_0604DAC4
	.long D_0604DACC
	.long D_0604DAD4
	.long D_0604DADC
	.long D_0604D9F8
	dlabel D_0604D8E4
	.byte 0x00, 0x03, 0x20, 0x00, 0x00, 0x3C, 0x00, 0x58, 0x00, 0x04, 0x20, 0x00, 0x00, 0x3C, 0x00, 0x58
	.byte 0x00, 0x02, 0x20, 0x00, 0x00, 0x30, 0x00, 0x58
	dlabel D_0604D8FC
	.byte 0x00, 0x06, 0x20, 0x00
