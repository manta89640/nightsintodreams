	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06049670,"ax",@progbits
	.p2align 2
	.byte 0x89, 0x1E

	glabel func_06049672
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#4,r6
	mov.l	.L060496A8,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L060496AC,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L0604979C
	nop
	.byte 0x00, 0x00
	.long D_060CB000
	.long D_0604AE50
	.long D_06047F1E
.L060496A8:
	.long func_0600E4C4
.L060496AC:
	.long func_06048258
	.byte 0xC8, 0xE0, 0x89, 0x35, 0x84, 0xC7, 0x88, 0x00, 0x89, 0x10, 0x88, 0x01, 0x89, 0x18, 0xD0, 0x06
	.byte 0x21, 0x06, 0x71, 0x04, 0x90, 0x06, 0x81, 0xC9, 0xE0, 0x07, 0x1C, 0x0A, 0xE0, 0x00, 0x80, 0x10
	.byte 0xA0, 0x64, 0x80, 0xC7, 0x00, 0x88, 0x00, 0x00
	.long func_060497D4
	.byte 0x80, 0xC9, 0xE0, 0xFF, 0x80, 0xC2, 0xD0, 0x02, 0x21, 0x06, 0x71, 0x04, 0xA0, 0x58, 0x00, 0x09
	.long func_06048258
	.byte 0x80, 0xC9, 0xD0, 0x0A, 0x21, 0x06, 0x71, 0x04, 0xE0, 0x01, 0x80, 0x10, 0xE0, 0x05, 0x1C, 0x0A
	.byte 0x84, 0xC2, 0x40, 0x11, 0x89, 0x00, 0xE0, 0x00, 0x80, 0xC7, 0xE3, 0x18, 0x20, 0x3E, 0x03, 0x1A
	.byte 0x90, 0x02, 0x30, 0x38, 0xA0, 0x42, 0x81, 0xC9, 0x00, 0x88, 0x00, 0x00
	.long func_060497D4
	.byte 0xE3, 0x08, 0xE4, 0x11, 0xC7, 0x04, 0xD2, 0x15, 0x42, 0x0B, 0xE5, 0x0F, 0x52, 0x41, 0x4E, 0x44
	.byte 0x4F, 0x4D, 0x20, 0x4F, 0x4E, 0xFF, 0x00, 0x09, 0xE3, 0x08, 0xE4, 0x11, 0xC7, 0x04, 0xD2, 0x0F
	.byte 0x42, 0x0B, 0xE5, 0x12, 0x52, 0x41, 0x4E, 0x44, 0x4F, 0x4D, 0x20, 0x4F, 0x46, 0x46, 0xFF, 0x09
	.byte 0xE3, 0x08, 0xE4, 0x11, 0xC7, 0x04, 0xD2, 0x09, 0x42, 0x0B, 0xE5, 0x15, 0x42, 0x45, 0x53, 0x54
	.byte 0x20, 0x54, 0x49, 0x4D, 0x45, 0xFF, 0x00, 0x09, 0xD0, 0x05, 0x40, 0x0B, 0x00, 0x09, 0x42, 0x15
	.byte 0x89, 0x0E, 0x42, 0x11, 0x8B, 0x06, 0xA0, 0x11, 0x00, 0x09, 0x00, 0x00
	.long func_06047980
	.long func_0604ACEC
	.byte 0x84, 0xC7, 0x40, 0x15, 0x8B, 0x08, 0x70, 0xFF, 0xA0, 0x06, 0x80, 0xC7, 0x84, 0xC7, 0xE2, 0x02
	.byte 0x30, 0x23, 0x89, 0x01, 0x70, 0x01, 0x80, 0xC7
.L0604979C:
	mov.l	.L060497C8,r5
	mov.b	@(7,r12),r0
	cmp/pz	r0
	bt	.L060497A8
	mov	#0,r0
	mov.b	r0,@(7,r12)
.L060497A8:
	mov.l	.L060497CC,r3
	mov.w	.L060497C4,r2
	mov.b	@(r0,r3),r3
	bsr	func_0604A598
	shll2	r3
	mov.b	@(9,r12),r0
	mov.l	.L060497CC,r3
	mov.w	.L060497C4,r2
	mov.b	@(r0,r3),r3
	bsr	func_0604A574
	shll2	r3
	lds.l	@r15+,pr
	rts
	nop
.L060497C4:
	.short 0x0083
	.byte 0x00, 0x00
.L060497C8:
	.long D_0604B4F0
.L060497CC:
	.long D_060497D0
	dlabel D_060497D0
	.byte 0x1E, 0x24, 0x2A, 0x00
	endlabel func_06049672

	glabel func_060497D4
	sts.l	pr,@-r15
	mov.l	.L06049818,r12
	mov.l	.L0604981C,r13
	bsr	func_06049A50
	nop
	mov.l	.L06049820,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L0604982C
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#7,r6
	mov.l	.L06049824,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.b	@(0,r1),r0
	tst	r0,r0
	bt	.L0604980E
	mov.b	@(7,r12),r0
	mov.b	r0,@(2,r12)
.L0604980E:
	mov.l	.L06049828,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L060498A2
	nop
.L06049818:
	.long D_060CB000
.L0604981C:
	.long D_0604AE50
.L06049820:
	.long D_06047F1E
.L06049824:
	.long func_0600E4C4
.L06049828:
	.long func_06048258
.L0604982C:
	tst	#16,r0
	bt	.L06049860
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#5,r6
	mov.l	.L06049858,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L0604985C,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L060498A2
	nop
.L06049858:
	.long func_0600E4C4
.L0604985C:
	.long func_06048258
.L06049860:
	mov.l	.L06049874,r0
	jsr	@r0
	nop
	cmp/pl	r2
	bt	.L06049890
	cmp/pz	r2
	bf	.L06049878
	bra	.L060498A2
	nop
	.byte 0x00, 0x00
.L06049874:
	.long func_0604ACEC
.L06049878:
	mov.b	@(7,r12),r0
	cmp/pl	r0
	bf	.L060498A2
	mov	#12,r0
	mov.b	r0,@(1,r1)
	mov.l	.L0604988C,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L060498A2
	nop
.L0604988C:
	.long D_06049960
.L06049890:
	mov.b	@(7,r12),r0
	mov.l	@(40,r12),r2
	cmp/ge	r2,r0
	bt	.L060498A2
	mov	#12,r0
	mov.b	r0,@(1,r1)
	mov.l	.L06049928,r0
	mov.l	r0,@-r1
	add	#4,r1
.L060498A2:
	mov	#0,r3
	mov.b	@(0,r1),r0
	tst	r0,r0
	bt	.L060498AC
	mov	#56,r3
.L060498AC:
	mov.l	.L0604992C,r5
	mov.b	@(7,r12),r0
	cmp/pz	r0
	bt	.L060498B8
	mov	#0,r0
	mov.b	r0,@(7,r12)
.L060498B8:
	shll2	r0
	shll	r0
	add	r0,r5
	mov.l	.L06049930,r0
	jsr	@r0
	mov	#0,r4
	mov.l	.L06049934,r5
	mov.l	.L06049938,r9
	mov	#104,r3
	mov.b	@(0,r1),r0
	tst	r0,r0
	bf	.L060498D6
	mov.l	.L0604993C,r5
	mov.l	.L06049940,r9
	mov	#52,r3
.L060498D6:
	mov.b	@(7,r12),r0
	cmp/pz	r0
	bt	.L060498E0
	mov	#0,r0
	mov.b	r0,@(7,r12)
.L060498E0:
	mov.l	r3,@-r15
	mov.w	@(18,r12),r0
	mov	r0,r4
	mov.l	.L06049944,r2
	jsr	@r2
	nop
	mov.l	@r15+,r3
	mov	r9,r5
	mov.b	@(7,r12),r0
	shll2	r0
	shll	r0
	add	r0,r5
	mov.w	.L0604991E,r4
	mov.l	.L06049948,r2
	jsr	@r2
	nop
	mov.b	@(0,r1),r0
	tst	r0,r0
	bf	.L0604990A
	bsr	func_06049AB0
	nop
.L0604990A:
	mov.w	.L06049920,r4
	mov.w	.L06049920,r5
	mov.w	.L06049922,r6
	mov.w	.L06049924,r7
	mov.l	.L0604994C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0604991E:
	.short 0x0088
.L06049920:
	.short 0x0000
.L06049922:
	.short 0x015F
.L06049924:
	.short 0x00DF
	.byte 0x00, 0x00
.L06049928:
	.long func_06049958
.L0604992C:
	.long D_0604B4F0
.L06049930:
	.long func_06047B98
.L06049934:
	.long D_0604B530
.L06049938:
	.long D_0604B564
.L0604993C:
	.long D_0604B6D4
.L06049940:
	.long D_0604B718
.L06049944:
	.long func_06047B5A
.L06049948:
	.long func_06047C70
.L0604994C:
	.long func_06047C34
	.byte 0x01, 0x03, 0x05, 0x07, 0x09, 0x0B, 0x0D, 0x0F
	endlabel func_060497D4

	glabel func_06049958
	sts.l	pr,@-r15
	mov	#-2,r10
	bra	.L06049964
	nop
	dlabel D_06049960
	.byte 0x4F, 0x22, 0xEA, 0x02
.L06049964:
	mov.l	.L060499D8,r12
	mov.l	.L060499DC,r13
	mov.b	@(1,r1),r0
	dt	r0
	bf/s	.L06049982
	mov.b	r0,@(1,r1)
	mov.l	.L060499E0,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.b	@(7,r12),r0
	cmp/pl	r10
	bt	.L0604997E
	add	#2,r0
.L0604997E:
	add	#-1,r0
	mov.b	r0,@(7,r12)
.L06049982:
	mov.w	@(18,r12),r0
	add	r10,r0
	mov.w	r0,@(18,r12)
	bsr	func_06049A50
	nop
	mov.l	.L060499E4,r5
	mov	#104,r3
	mov.b	@(0,r1),r0
	tst	r0,r0
	bf	.L0604999A
	mov.l	.L060499E8,r5
	mov	#52,r3
.L0604999A:
	mov.w	@(18,r12),r0
	mov	r0,r4
	mov.l	.L060499EC,r2
	jsr	@r2
	nop
	mov.w	.L060499D0,r4
	mov.w	.L060499D0,r5
	mov.w	.L060499D2,r6
	mov.w	.L060499D4,r7
	mov.l	.L060499F0,r0
	jsr	@r0
	nop
	mov.b	@(1,r1),r0
	cmp/eq	#0,r0
	bf	.L060499CA
	mov.l	.L060499F4,r5
	mov.b	@(7,r12),r0
	shll2	r0
	shll	r0
	add	r0,r5
	mov.w	.L060499D6,r4
	mov.l	.L060499F8,r2
	jsr	@r2
	nop
.L060499CA:
	lds.l	@r15+,pr
	rts
	nop
.L060499D0:
	.short 0x0000
.L060499D2:
	.short 0x015F
.L060499D4:
	.short 0x00DF
.L060499D6:
	.short 0x0088
.L060499D8:
	.long D_060CB000
.L060499DC:
	.long D_0604AE50
.L060499E0:
	.long func_060497D4
.L060499E4:
	.long D_0604B530
.L060499E8:
	.long D_0604B6D4
.L060499EC:
	.long func_06047B5A
.L060499F0:
	.long func_06047C34
.L060499F4:
	.long D_0604B718
.L060499F8:
	.long func_06047C70
	endlabel func_06049958

	glabel func_060499FC
	sts.l	pr,@-r15
	mov.b	@(0,r11),r0
	mov.b	@r10+,r4
	mov.l	.L06049A10,r2
	jsr	@r2
	mov.b	@r10+,r5
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06049A10:
	.long func_06046A00
	endlabel func_060499FC

	glabel func_06049A14
	sts.l	pr,@-r15
	mov.b	@(1,r11),r0
	mov	r0,r4
	mov.l	.L06049A34,r0
	jsr	@r0
	nop
	mov	r0,r2
	mov.b	@r10+,r4
	mov.b	@r10+,r5
	mov.l	.L06049A38,r0
	jsr	@r0
	mov	#3,r3
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06049A34:
	.long func_0601CB9A
.L06049A38:
	.long func_06047A14
	dlabel D_06049A3C
	.byte 0x1C, 0x0E, 0x21, 0x0E, 0x1C, 0x10, 0x21, 0x10, 0x1C, 0x12, 0x21, 0x12, 0x1C, 0x14, 0x21, 0x14
	.byte 0x1C, 0x16, 0x21, 0x16
	endlabel func_06049A14

	glabel func_06049A50
	sts.l	pr,@-r15
	mov.b	@(0,r1),r0
	tst	r0,r0
	bt	.L06049A7E
	mov.l	.L06049A9C,r5
	mov.l	.L06049AA0,r0
	jsr	@r0
	nop
	mov.b	@(7,r12),r0
	tst	r0,r0
	bt	.L06049A6E
	mov.l	.L06049AA4,r5
	mov.l	.L06049AA0,r0
	jsr	@r0
	nop
.L06049A6E:
	mov.b	@(7,r12),r0
	mov.l	@(40,r12),r2
	cmp/hs	r2,r0
	bt	.L06049A7E
	mov.l	.L06049AA8,r5
	mov.l	.L06049AA0,r0
	jsr	@r0
	nop
.L06049A7E:
	mov.w	.L06049A92,r4
	mov.w	.L06049A94,r5
	mov.w	.L06049A96,r6
	mov.w	.L06049A98,r7
	mov.l	.L06049AAC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06049A92:
	.short 0x0020
.L06049A94:
	.short 0x0070
.L06049A96:
	.short 0x010F
.L06049A98:
	.short 0x00B7
	.byte 0x00, 0x00
.L06049A9C:
	.long D_0604B3C4
.L06049AA0:
	.long func_06047BCC
.L06049AA4:
	.long D_0604B468
.L06049AA8:
	.long D_0604B470
.L06049AAC:
	.long func_06047C34
	endlabel func_06049A50

	glabel func_06049AB0
	sts.l	pr,@-r15
	mov	#2,r3
	mov	#24,r4
	mov.l	.L06049B18,r6
	mov.l	.L06049B1C,r0
	jsr	@r0
	mov	#14,r5
	mov	#2,r3
	mov	#24,r4
	mov.l	.L06049B20,r6
	mov.l	.L06049B1C,r0
	jsr	@r0
	mov	#16,r5
	mov	#2,r3
	mov	#24,r4
	mov.l	.L06049B24,r6
	mov.l	.L06049B1C,r0
	jsr	@r0
	mov	#18,r5
	mov	#2,r3
	mov	#24,r4
	mov.l	.L06049B28,r6
	mov.l	.L06049B1C,r0
	jsr	@r0
	mov	#20,r5
	mov	#2,r3
	mov	#24,r4
	mov.l	.L06049B2C,r6
	mov.l	.L06049B1C,r0
	jsr	@r0
	mov	#22,r5
	mov.l	@(20,r12),r0
	mov.l	.L06049B30,r11
	add	r0,r11
	mov.b	@(7,r12),r0
	mov	#10,r2
	mulu.w	r0,r2
	sts	macl,r0
	add	r0,r11
	mov.l	.L06049B34,r10
	mov	#5,r9
.L06049B02:
	bsr	func_06049A14
	nop
	bsr	func_060499FC
	nop
	dt	r9
	bf/s	.L06049B02
	add	#2,r11
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06049B18:
	.long D_0027CC98
.L06049B1C:
	.long func_06047AB4
.L06049B20:
	.long D_0027CCA4
.L06049B24:
	.long D_0027CCB0
.L06049B28:
	.long D_0027CCBC
.L06049B2C:
	.long D_0027CCC8
.L06049B30:
	.long 0x000004C0
.L06049B34:
	.long D_06049A3C
	endlabel func_06049AB0

	glabel func_06049B38
	sts.l	pr,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#3,r6
	mov.l	.L06049B64,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L06049B68,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L06049B64:
	.long func_0600E4C4
.L06049B68:
	.long func_06048258
	endlabel func_06049B38

	glabel func_06049B6C
	sts.l	pr,@-r15
	mov.l	.L06049BE0,r12
	mov.l	.L06049BE4,r0
	jsr	@r0
	nop
	mov.w	.L06049BDE,r0
	mov.b	@(r0,r3),r0
	cmp/pz	r0
	bf	.L06049C4C
	mov.l	r3,@-r15
	mov.l	.L06049BE8,r2
	mov	#12,r3
	mov	#0,r11
.L06049B86:
	mov.b	@r2+,r0
	tst	r0,r0
	bt	.L06049B8E
	add	#1,r11
.L06049B8E:
	dt	r3
	bf	.L06049B86
	mov.l	@r15+,r3
	mov	#2,r0
	cmp/gt	r11,r0
	bt	.L06049C58
	mov.b	@(3,r12),r0
	mov	#80,r2
	mulu.w	r0,r2
	sts	macl,r0
	mov.l	.L06049BEC,r11
	add	r0,r11
	mov.l	@(20,r12),r0
	add	r0,r11
	mov.b	@(14,r11),r0
	tst	r0,r0
	bf	.L06049BF8
	mov	#2,r0
	mov.b	r0,@(6,r12)
	mov.l	.L06049BF0,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#9,r6
	mov.l	.L06049BF4,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	lds.l	@r15+,pr
	rts
	nop
.L06049BDE:
	.short 0x004B
.L06049BE0:
	.long D_060CB000
.L06049BE4:
	.long func_0604B8E0
.L06049BE8:
	.long D_060FF05C
.L06049BEC:
	.long 0x00000528
.L06049BF0:
	.long func_06048090
.L06049BF4:
	.long func_0600E4C4
.L06049BF8:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#4,r6
	mov.l	.L06049C3C,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#3,r0
	mov.b	r0,@(5,r12)
	mov	#0,r0
	mov.b	r0,@(4,r12)
	mov.l	.L06049C40,r2
	mov.l	.L06049C44,r3
	mov.w	.L06049C3A,r4
.L06049C24:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L06049C24
	add	#4,r2
	mov.l	.L06049C48,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L06049C3A:
	.short 0x0008
.L06049C3C:
	.long func_0600E4C4
.L06049C40:
	.long D_060CA220
.L06049C44:
	.long D_00281BF4
.L06049C48:
	.long D_060485B4
.L06049C4C:
	mov.l	.L06049C54,r0
	bra	.L06049C64
	mov.l	r0,@(48,r1)
	.byte 0x00, 0x00
.L06049C54:
	.long D_0604C048
.L06049C58:
	mov.l	.L06049C60,r0
	bra	.L06049C64
	mov.l	r0,@(48,r1)
	.byte 0x00, 0x00
.L06049C60:
	.long D_0604C064
.L06049C64:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#4,r6
	mov.l	.L06049C90,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L06049C94,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06049C90:
	.long func_0600E4C4
.L06049C94:
	.long func_06049C98
	endlabel func_06049B6C

	glabel func_06049C98
	sts.l	pr,@-r15
	mov.l	@(48,r1),r11
	mov	#60,r3
	mov	#9,r4
	mov	r11,r2
	mov.l	.L06049CBC,r0
	jsr	@r0
	mov	#17,r5
	mov.l	.L06049CC0,r0
	mov.w	@r0,r0
	tst	#240,r0
	bt	.L06049CB6
	mov.l	.L06049CC4,r0
	mov.l	r0,@-r1
	add	#4,r1
.L06049CB6:
	lds.l	@r15+,pr
	rts
	nop
.L06049CBC:
	.long func_0604792C
.L06049CC0:
	.long D_06047F1E
.L06049CC4:
	.long func_06048258
	endlabel func_06049C98

	glabel func_06049CC8
	sts.l	pr,@-r15
	mov.l	.L06049D08,r12
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#5,r6
	mov.l	.L06049D0C,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#0,r0
	mov.l	r0,@(56,r12)
	mov.w	.L06049D04,r0
	mov.w	r0,@(18,r12)
	mov.l	.L06049D10,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.l	.L06049D14,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06049D04:
	.short 0x0088
	.byte 0x00, 0x00
.L06049D08:
	.long D_060CB000
.L06049D0C:
	.long func_0600E4C4
.L06049D10:
	.long func_06049D18
.L06049D14:
	.long func_0604B844
	endlabel func_06049CC8

	glabel func_06049D18
	sts.l	pr,@-r15
	mov.l	r1,@-r15
	mov.l	.L06049D44,r12
	mov.l	.L06049D48,r13
	mov.w	.L06049D3A,r4
	mov.w	.L06049D3C,r5
	mov.w	.L06049D3E,r6
	mov.w	.L06049D40,r7
	mov.l	.L06049D4C,r0
	jsr	@r0
	nop
	mov.l	.L06049D50,r0
	mov.w	@r0,r0
	tst	#224,r0
	bt	.L06049D54
	bra	.L06049E50
	nop
.L06049D3A:
	.short 0x0020
.L06049D3C:
	.short 0x0070
.L06049D3E:
	.short 0x010F
.L06049D40:
	.short 0x00B7
	.byte 0x00, 0x00
.L06049D44:
	.long D_060CB000
.L06049D48:
	.long D_0604AE50
.L06049D4C:
	.long func_06047C34
.L06049D50:
	.long D_06047F1E
.L06049D54:
	tst	#16,r0
	bt	.L06049DB4
	mov	#0,r4
	mov.l	.L06049DA0,r0
	jsr	@r0
	nop
	mov.l	r1,@-r15
	mov.l	.L06049DA4,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	mov.b	@(0,gbr),r0
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r1,@-r15
	mov.l	r0,@-r15
	mov	#2,r0
	mov.b	r0,@(0,gbr)
	mov.l	.L06049DA8,r0
	jsr	@r0
	nop
	mov.l	@r15+,r0
	mov.l	@r15+,r1
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.b	r0,@(0,gbr)
	mov	#17,r4
	mov.l	r1,@-r15
	mov.l	.L06049DAC,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	mov.l	.L06049DB0,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L06049DEE
	nop
	.byte 0x00, 0x00
.L06049DA0:
	.long func_0600E4F6
.L06049DA4:
	.long func_06006B20
.L06049DA8:
	.long func_0600DBCC
.L06049DAC:
	.long func_06006A7E
.L06049DB0:
	.long func_06048258
.L06049DB4:
	bsr	func_0604ACEC
	nop
	cmp/pl	r2
	bt	.L06049DDC
	cmp/pz	r2
	bf	.L06049DC4
	bra	.L06049DEE
	nop
.L06049DC4:
	mov.l	@(56,r12),r0
	cmp/pl	r0
	bf	.L06049DEE
	mov	#12,r0
	mov.b	r0,@(1,r1)
	mov.l	.L06049DD8,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L06049DEE
	nop
.L06049DD8:
	.long D_06049F74
.L06049DDC:
	mov.l	@(56,r12),r0
	mov.l	.L06049E34,r2
	cmp/ge	r2,r0
	bt	.L06049DEE
	mov	#12,r0
	mov.b	r0,@(1,r1)
	mov.l	.L06049E38,r0
	mov.l	r0,@-r1
	add	#4,r1
.L06049DEE:
	mov.l	.L06049E3C,r5
	mov.l	@(56,r12),r0
	cmp/pz	r0
	bt	.L06049DFA
	mov	#0,r0
	mov.l	r0,@(56,r12)
.L06049DFA:
	mov	#0,r3
	mov.w	@(18,r12),r0
	mov	r0,r4
	mov.l	.L06049E40,r2
	jsr	@r2
	nop
	mov.l	@(56,r12),r0
	shll2	r0
	mov.l	.L06049E44,r2
	mov.l	@(r0,r2),r2
	mov	#30,r3
	mov	#17,r4
	mov.l	.L06049E48,r0
	jsr	@r0
	mov	#17,r5
	mov.w	.L06049E2E,r4
	mov.w	.L06049E2E,r5
	mov.w	.L06049E30,r6
	mov.w	.L06049E32,r7
	mov.l	.L06049E4C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
.L06049E2E:
	.short 0x0000
.L06049E30:
	.short 0x015F
.L06049E32:
	.short 0x00DF
.L06049E34:
	.long 0x0000000E
.L06049E38:
	.long func_06049F6C
.L06049E3C:
	.long D_0604B75C
.L06049E40:
	.long func_06047B5A
.L06049E44:
	.long D_0604BC94
.L06049E48:
	.long func_0604792C
.L06049E4C:
	.long func_06047C34
.L06049E50:
	mov.l	@(56,r12),r0
	mov.l	.L06049E64,r2
	mov.l	@r2,r3
	mov	#1,r2
.L06049E58:
	cmp/pl	r0
	bf	.L06049E68
	shll	r2
	bra	.L06049E58
	add	#-1,r0
	.byte 0x00, 0x00
.L06049E64:
	.long D_0604B7D8
.L06049E68:
	tst	r2,r3
	bt	.L06049E70
	bra	.L06049DEE
	nop
.L06049E70:
	mov.l	.L06049ED0,r2
	mov	#1,r0
	mov.b	r0,@r2
	mov	#0,r4
	mov.l	.L06049ED4,r0
	jsr	@r0
	nop
	mov.l	r1,@-r15
	mov.l	.L06049ED8,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	mov	#0,r0
	mov.b	r0,@(4,r1)
	mov.b	r0,@(5,r1)
	mov.b	r0,@(6,r1)
	mov.b	r0,@(8,r1)
	mov.l	.L06049EDC,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.l	@(56,r12),r0
	cmp/eq	#14,r0
	bt	.L06049EEC
	cmp/eq	#13,r0
	bt	.L06049F1C
	cmp/eq	#10,r0
	bt	.L06049F1C
	mov.l	.L06049EE0,r2
	mov.b	@(r0,r2),r0
	mov.b	r0,@(20,gbr)
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r1,@-r15
	mov.l	.L06049EE4,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	.L06049EE8,r2
	mov.l	@(56,r12),r0
	mov.b	@(r0,r2),r0
	mov.b	r0,@(7,r1)
	bra	.L06049DEE
	nop
	.byte 0x00, 0x00
.L06049ED0:
	.long D_0604A24F
.L06049ED4:
	.long func_0600E4F6
.L06049ED8:
	.long func_06006B20
.L06049EDC:
	.long D_06049FF4
.L06049EE0:
	.long D_06049F54
.L06049EE4:
	.long func_0600DBCC
.L06049EE8:
	.long D_0604C14C
.L06049EEC:
	mov.b	@(0,gbr),r0
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r1,@-r15
	mov.l	r0,@-r15
	mov	#2,r0
	mov.b	r0,@(0,gbr)
	mov.l	.L06049F18,r0
	jsr	@r0
	nop
	mov.l	@r15+,r0
	mov.l	@r15+,r1
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.b	r0,@(0,gbr)
	mov	#3,r0
	mov.b	r0,@(8,r1)
	mov	#9,r0
	mov.b	r0,@(7,r1)
	bra	.L06049DEE
	nop
	.byte 0x00, 0x00
.L06049F18:
	.long func_0600DBCC
.L06049F1C:
	mov.l	.L06049F48,r2
	mov.b	@(r0,r2),r0
	mov.b	r0,@(20,gbr)
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r1,@-r15
	mov.l	.L06049F4C,r0
	jsr	@r0
	nop
	mov.l	@r15+,r1
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	mov.l	.L06049F50,r2
	mov.l	@(56,r12),r0
	mov.b	@(r0,r2),r0
	mov.b	r0,@(7,r1)
	mov	#1,r0
	bra	.L06049DEE
	mov.b	r0,@(8,r1)
	.byte 0x00, 0x00
.L06049F48:
	.long D_06049F54
.L06049F4C:
	.long func_0600DBCC
.L06049F50:
	.long D_0604C14C
	dlabel D_06049F54
	.byte 0x00, 0x02, 0x04, 0x06, 0x08, 0x0A, 0x0C, 0x01, 0x03, 0x05, 0x07, 0x09, 0x0B, 0x0D, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x09
	endlabel func_06049D18

	glabel func_06049F6C
	sts.l	pr,@-r15
	mov	#-2,r10
	bra	.L06049F78
	nop
	dlabel D_06049F74
	.byte 0x4F, 0x22, 0xEA, 0x02
.L06049F78:
	mov.l	.L06049FDC,r12
	mov.l	.L06049FE0,r13
	mov.b	@(1,r1),r0
	dt	r0
	bf/s	.L06049F96
	mov.b	r0,@(1,r1)
	mov.l	.L06049FE4,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.l	@(56,r12),r0
	cmp/pl	r10
	bt	.L06049F92
	add	#2,r0
.L06049F92:
	add	#-1,r0
	mov.l	r0,@(56,r12)
.L06049F96:
	mov.w	@(18,r12),r0
	add	r10,r0
	mov.w	r0,@(18,r12)
	mov.w	.L06049FCC,r4
	mov.w	.L06049FCE,r5
	mov.w	.L06049FD0,r6
	mov.w	.L06049FD2,r7
	mov.l	.L06049FE8,r0
	jsr	@r0
	nop
	mov	#0,r3
	mov.l	.L06049FEC,r5
	mov.w	@(18,r12),r0
	mov	r0,r4
	mov.l	.L06049FF0,r2
	jsr	@r2
	nop
	mov.w	.L06049FD4,r4
	mov.w	.L06049FD4,r5
	mov.w	.L06049FD6,r6
	mov.w	.L06049FD8,r7
	mov.l	.L06049FE8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06049FCC:
	.short 0x0020
.L06049FCE:
	.short 0x0070
.L06049FD0:
	.short 0x010F
.L06049FD2:
	.short 0x00B7
.L06049FD4:
	.short 0x0000
.L06049FD6:
	.short 0x015F
.L06049FD8:
	.short 0x00DF
	.byte 0x00, 0x00
.L06049FDC:
	.long D_060CB000
.L06049FE0:
	.long D_0604AE50
.L06049FE4:
	.long func_06049D18
.L06049FE8:
	.long func_06047C34
.L06049FEC:
	.long D_0604B75C
.L06049FF0:
	.long func_06047B5A
	dlabel D_06049FF4
	.byte 0x4F, 0x22, 0x2F, 0x16, 0xDC, 0x05, 0xDD, 0x06, 0xD5, 0x06, 0xD0, 0x07, 0x40, 0x0B, 0x00, 0x09
	.byte 0xD0, 0x06, 0x60, 0x01, 0xC8, 0xE0, 0x89, 0x0B, 0xA0, 0xB0, 0x00, 0x09
	.long D_060CB000
	.long D_0604AE50
	.long D_0604B3C4
	.long func_06047BCC
	.long D_06047F1E
	.byte 0xC8, 0x10, 0x89, 0x13, 0xE4, 0x00, 0xD0, 0x06, 0x40, 0x0B, 0x00, 0x09, 0x2F, 0x16, 0xD0, 0x05
	.byte 0x40, 0x0B, 0x00, 0x09, 0x61, 0xF6, 0xD0, 0x04, 0x21, 0x06, 0x71, 0x04, 0xA0, 0x4C, 0x00, 0x09
	.long func_0600E4F6
	.long func_06006B20
	.long func_06049D18
	.byte 0xB6, 0x4C, 0x00, 0x09, 0x42, 0x15, 0x89, 0x06, 0x42, 0x11, 0x8B, 0x01, 0xA0, 0x06, 0x00, 0x09
	.byte 0xE0, 0x00, 0xA0, 0x3B, 0x80, 0x16, 0xE0, 0x01, 0xA0, 0x38, 0x80, 0x16, 0xD0, 0x04, 0x40, 0x0B
	.byte 0x00, 0x09, 0x42, 0x15, 0x89, 0x06, 0x42, 0x11, 0x8B, 0x1B, 0xA0, 0x2F, 0x00, 0x09, 0x00, 0x00
	.long func_0604AD38
	.byte 0x84, 0x16, 0x20, 0x08, 0x89, 0x0A, 0x84, 0x18, 0x64, 0x03, 0x84, 0x15, 0x30, 0x43, 0x8B, 0x00
	.byte 0xE0, 0xFF, 0x70, 0x01, 0xA0, 0x20, 0x80, 0x15, 0xA0, 0x1E, 0x00, 0x09, 0x84, 0x17, 0x64, 0x03
	.byte 0x84, 0x14, 0x30, 0x43, 0x8B, 0x00, 0xE0, 0xFF, 0x70, 0x01, 0xA0, 0x15, 0x80, 0x14, 0x84, 0x16
	.byte 0x20, 0x08, 0x89, 0x09, 0x84, 0x15, 0x40, 0x15, 0x89, 0x01, 0x84, 0x18, 0x70, 0x01, 0x70, 0xFF
	.byte 0xA0, 0x0A, 0x80, 0x15, 0xA0, 0x08, 0x00, 0x09, 0x84, 0x14, 0x40, 0x15, 0x89, 0x01, 0x84, 0x17
	.byte 0x70, 0x01, 0x70, 0xFF, 0xA0, 0x00, 0x80, 0x14, 0xE8, 0x0C, 0xE9, 0x08, 0x84, 0x16, 0x20, 0x08
	.byte 0x89, 0x01, 0xE8, 0x08, 0xE9, 0x0C, 0x63, 0x83, 0xE4, 0x0A, 0xC7, 0x03, 0xD2, 0x19, 0x42, 0x0B
	.byte 0xE5, 0x10, 0x53, 0x45, 0xFF, 0x09, 0x00, 0x09, 0x63, 0x93, 0xE4, 0x0A, 0xC7, 0x02, 0xD2, 0x15
	.byte 0x42, 0x0B, 0xE5, 0x12, 0x42, 0x47, 0x4D, 0xFF, 0x84, 0x14, 0x64, 0x03, 0xD0, 0x12, 0x40, 0x0B
	.byte 0xE3, 0x02, 0x62, 0x03, 0xE4, 0x10, 0xD0, 0x11, 0x40, 0x0B, 0xE5, 0x10, 0x50, 0xCE, 0x40, 0x08
	.byte 0xD2, 0x0F, 0x02, 0x2E, 0xE3, 0x1E, 0xE4, 0x10, 0xD0, 0x0E, 0x40, 0x0B, 0xE5, 0x0D, 0x50, 0xCE
	.byte 0x40, 0x08, 0xD2, 0x0D, 0x02, 0x2E, 0x84, 0x18, 0x20, 0x08, 0x89, 0x02, 0x84, 0x15, 0x40, 0x08
	.byte 0x02, 0x2E, 0xE3, 0x64, 0xE4, 0x08, 0xD0, 0x07, 0x40, 0x0B, 0xE5, 0x14, 0x61, 0xF6, 0x4F, 0x26
	.byte 0x00, 0x0B, 0x00, 0x09
	.long func_06047980
	.long func_0601CB9A
	.long func_06047A14
	.long D_0604BC94
	.long func_0604792C
	.long D_0604BCDC
	.byte 0x84, 0x16, 0x20, 0x08, 0x8B, 0x12, 0xD2, 0x07, 0x50, 0xCE, 0x40, 0x08, 0x03, 0x2E, 0x84, 0x14
	.byte 0x40, 0x00, 0xE4, 0x07, 0x05, 0x3C, 0x70, 0x01, 0x06, 0x3C, 0xD0, 0x03, 0x40, 0x0B, 0x00, 0x09
	.byte 0xAF, 0xA4, 0x00, 0x09
	.long D_0604C100
	.long func_0600E4C4
	.byte 0xE4, 0x00, 0xD0, 0x0C, 0x40, 0x0B, 0x00, 0x09, 0x2F, 0x16, 0xD0, 0x0B, 0x40, 0x0B, 0x00, 0x09
	.byte 0x61, 0xF6, 0x50, 0xCE, 0x88, 0x06, 0x89, 0x21, 0x88, 0x0A, 0x89, 0x2D, 0x88, 0x0D, 0x89, 0x25
	.byte 0x88, 0x0E, 0x89, 0x2F, 0xE3, 0x06, 0x30, 0x37, 0x89, 0x0A, 0xD0, 0x04, 0x40, 0x0B, 0x00, 0x09
	.byte 0xAF, 0x86, 0x00, 0x09
	.long func_0600E4F6
	.long func_06006B20
	.long func_060325AC
	.byte 0x70, 0xF9, 0xD2, 0x04, 0x04, 0x2C, 0x2F, 0x16, 0xD0, 0x03, 0x40, 0x0B, 0x00, 0x09, 0x61, 0xF6
	.byte 0xAF, 0x76, 0x00, 0x09
	.long D_0604A240
	.long func_06006A20
	.byte 0xD0, 0x02, 0x40, 0x0B, 0x00, 0x09, 0xAF, 0x6D, 0x00, 0x09, 0x00, 0x00
	.long func_060327A0
	.byte 0xD2, 0x01, 0xA0, 0x0A, 0x00, 0x09, 0x00, 0x00
	.long D_0604A24D
	.byte 0xD2, 0x01, 0xA0, 0x04, 0x00, 0x09, 0x00, 0x00
	.long D_0604A24B
	.byte 0xD2, 0x05, 0x84, 0x15, 0x00, 0x2C, 0x64, 0x03, 0x2F, 0x16, 0xD0, 0x04, 0x40, 0x0B, 0x00, 0x09
	.byte 0x61, 0xF6, 0xAF, 0x53, 0x00, 0x09, 0x00, 0x00
	.long D_0604A247
	.long func_06006A20
	dlabel D_0604A240
	.byte 0x08, 0x09, 0x0A, 0x0B, 0x0D, 0x0E, 0x10
	dlabel D_0604A247
	.byte 0x12, 0x13, 0x14, 0x11
	dlabel D_0604A24B
	.byte 0x0B, 0x0C
	dlabel D_0604A24D
	.byte 0x0F, 0x10
	dlabel D_0604A24F
	.byte 0x00
	dlabel D_0604A250
	.byte 0xDC, 0x0C
	endlabel func_06049F6C

	glabel func_0604A252
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#5,r6
	mov.l	.L0604A288,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.b	@(1,r12),r0
	tst	r0,r0
	movt	r0
	xor	#1,r0
	mov.b	r0,@(8,r12)
	mov.l	.L0604A28C,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
	.long D_060CB000
.L0604A288:
	.long func_0600E4C4
.L0604A28C:
	.long D_0604A290
	dlabel D_0604A290
	.byte 0x4F, 0x22, 0xDC, 0x0E, 0xDD, 0x0E, 0xE3, 0x08, 0xE4, 0x13, 0xC7, 0x04, 0xD2, 0x0D, 0x42, 0x0B
	.byte 0xE5, 0x11, 0x4E, 0x4F, 0x52, 0x4D, 0x41, 0x4C, 0xFF, 0x09, 0x00, 0x09, 0xE3, 0x08, 0xE4, 0x14
	.byte 0xC7, 0x03, 0xD2, 0x08, 0x42, 0x0B, 0xE5, 0x15, 0x57, 0x49, 0x44, 0x45, 0xFF, 0x09, 0x00, 0x09
	.byte 0x7C, 0x01, 0xB0, 0x4B, 0x00, 0x09, 0x4F, 0x26, 0x00, 0x0B, 0x00, 0x09
	.long D_060CB000
	.long D_0604AE50
	.long func_06047980
	dlabel D_0604A2D8
	.byte 0xDC, 0x0B
	endlabel func_0604A252

	glabel func_0604A2DA
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#5,r6
	mov.l	.L0604A30C,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.b	@(0,r12),r0
	mov.b	r0,@(7,r12)
	mov.l	.L0604A310,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
	.byte 0x00, 0x00
	.long D_060CB000
.L0604A30C:
	.long func_0600E4C4
.L0604A310:
	.long D_0604A314
	dlabel D_0604A314
	.byte 0x4F, 0x22, 0xDC, 0x0E, 0xDD, 0x0E, 0xE3, 0x08, 0xE4, 0x13, 0xC7, 0x04, 0xD2, 0x0D, 0x42, 0x0B
	.byte 0xE5, 0x11, 0x53, 0x54, 0x45, 0x52, 0x45, 0x4F, 0xFF, 0x09, 0x00, 0x09, 0xE3, 0x08, 0xE4, 0x14
	.byte 0xC7, 0x03, 0xD2, 0x08, 0x42, 0x0B, 0xE5, 0x15, 0x4D, 0x4F, 0x4E, 0x4F, 0xFF, 0x09, 0x00, 0x09
	.byte 0xB0, 0x0A, 0x00, 0x09, 0x4F, 0x26, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x00
	.long D_060CB000
	.long D_0604AE50
	.long func_06047980
	endlabel func_0604A2DA

	glabel func_0604A35C
	sts.l	pr,@-r15
	mov.l	.L0604A3A4,r0
	mov.w	@r0,r0
	tst	#1,r0
	bf	.L0604A3E4
	tst	#2,r0
	bf	.L0604A414
	tst	#16,r0
	bf	.L0604A3B4
	tst	#224,r0
	bt	.L0604A43C
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#7,r6
	mov.l	.L0604A3A8,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L0604A3AC,r0
	mov.l	r0,@-r1
	add	#4,r1
	mov.b	@(7,r12),r0
	mov.b	r0,@(0,r12)
	mov.l	.L0604A3B0,r0
	jsr	@r0
	nop
	bra	.L0604A43C
	nop
.L0604A3A4:
	.long D_06047F1E
.L0604A3A8:
	.long func_0600E4C4
.L0604A3AC:
	.long func_06048258
.L0604A3B0:
	.long func_0600DD28
.L0604A3B4:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#5,r6
	mov.l	.L0604A3DC,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L0604A3E0,r0
	mov.l	r0,@-r1
	add	#4,r1
	bra	.L0604A43C
	nop
.L0604A3DC:
	.long func_0600E4C4
.L0604A3E0:
	.long func_06048258
.L0604A3E4:
	mov.b	@(7,r12),r0
	cmp/pl	r0
	bf	.L0604A43C
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#6,r6
	mov.l	.L0604A410,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#0,r0
	bra	.L0604A43C
	mov.b	r0,@(7,r12)
	.byte 0x00, 0x00
.L0604A410:
	.long func_0600E4C4
.L0604A414:
	mov.b	@(7,r12),r0
	cmp/eq	#0,r0
	bf	.L0604A43C
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#6,r6
	mov.l	.L0604A450,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov	#1,r0
	mov.b	r0,@(7,r12)
.L0604A43C:
	mov.b	@(0,r12),r0
	cmp/eq	#0,r0
	bf	.L0604A454
	mov.w	.L0604A44E,r2
	mov.w	.L0604A44E,r3
	bsr	func_0604A574
	nop
	bra	.L0604A45C
	nop
.L0604A44E:
	.short 0x0088
.L0604A450:
	.long func_0600E4C4
.L0604A454:
	mov.w	.L0604A46A,r2
	mov.w	.L0604A46C,r3
	bsr	func_0604A574
	nop
.L0604A45C:
	mov.b	@(7,r12),r0
	cmp/eq	#0,r0
	bf	.L0604A46E
	mov.w	.L0604A46A,r2
	mov.w	.L0604A46A,r3
	bra	func_0604A598
	lds.l	@r15+,pr
.L0604A46A:
	.short 0x0088
.L0604A46C:
	.short 0x00A8
.L0604A46E:
	mov.w	.L0604A476,r2
	mov.w	.L0604A478,r3
	bra	func_0604A598
	lds.l	@r15+,pr
.L0604A476:
	.short 0x0088
.L0604A478:
	.short 0x00A8
	endlabel func_0604A35C

	glabel func_0604A47A
	sts.l	pr,@-r15
	mov.l	.L0604A4A8,r12
	mov.l	.L0604A4AC,r0
	jsr	@r0
	nop
	mov.b	@(2,r12),r0
	mov.b	r0,@(15,r3)
	mov.b	@(10,r12),r0
	mov.b	r0,@(3,r12)
	mov.b	@(14,r12),r0
	mov.l	.L0604A4B0,r2
	mov.b	r0,@r2
	mov.l	.L0604A4AC,r0
	jsr	@r0
	nop
	mov.b	@(15,r3),r0
	mov.b	r0,@(2,r12)
	mov.l	.L0604A4B4,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L0604A4A8:
	.long D_060CB000
.L0604A4AC:
	.long func_0604B8E0
.L0604A4B0:
	.long D_060CB050
.L0604A4B4:
	.long func_0604A4B8
	endlabel func_0604A47A

	glabel func_0604A4B8
	sts.l	pr,@-r15
	mov.l	r1,@-r15
	mov.l	.L0604A50C,r12
	mov.l	.L0604A510,r13
	mov.l	.L0604A514,r0
	jsr	@r0
	nop
	mov.b	@(3,r12),r0
	mov	#80,r2
	mulu.w	r0,r2
	mov.l	.L0604A518,r2
	sts	macl,r0
	add	r0,r2
	mov.l	@(20,r12),r0
	add	r0,r2
	mov.b	@(14,r2),r0
	tst	r0,r0
	bf	.L0604A524
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#7,r6
	mov.l	.L0604A51C,r0
	jsr	@r0
	mov	#7,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r1
	mov	#1,r0
	mov.b	r0,@(6,r12)
	mov.l	.L0604A520,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L0604A50C:
	.long D_060CB000
.L0604A510:
	.long D_0604AE50
.L0604A514:
	.long func_0604AA08
.L0604A518:
	.long 0x00000528
.L0604A51C:
	.long func_0600E4C4
.L0604A520:
	.long func_06048090
.L0604A524:
	mov	#0,r0
	mov.b	r0,@(14,r2)
	mov	#1,r0
	mov.b	r0,@(13,r12)
	mov	#3,r0
	mov.b	r0,@(5,r12)
	mov	#0,r0
	mov.b	r0,@(6,r12)
	mov.l	@r15+,r1
	mov.l	.L0604A544,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604A544:
	.long D_06049140
	endlabel func_0604A4B8

	glabel func_0604A548
	sts.l	pr,@-r15
	mov.l	.L0604A56C,r5
	mov	r3,r0
	add	#1,r0
	mov.w	r0,@(6,r5)
	add	#3,r0
	mov.w	r0,@(14,r5)
	mov.w	r0,@(22,r5)
	mov	r2,r0
	add	#4,r0
	mov.w	r0,@(4,r5)
	add	#-20,r0
	mov.w	r0,@(12,r5)
	add	#104,r0
	mov.w	r0,@(20,r5)
	mov.l	.L0604A570,r0
	jmp	@r0
	lds.l	@r15+,pr
.L0604A56C:
	.long D_0604B438
.L0604A570:
	.long func_06047B44
	endlabel func_0604A548

	glabel func_0604A574
	sts.l	pr,@-r15
	mov.l	.L0604A590,r5
	mov	r3,r0
	add	#4,r0
	mov.w	r0,@(6,r5)
	mov.w	r0,@(14,r5)
	mov	r2,r0
	add	#-12,r0
	mov.w	r0,@(4,r5)
	add	#96,r0
	mov.w	r0,@(12,r5)
	mov.l	.L0604A594,r0
	jmp	@r0
	lds.l	@r15+,pr
.L0604A590:
	.long D_0604B440
.L0604A594:
	.long func_06047B44
	endlabel func_0604A574

	glabel func_0604A598
	sts.l	pr,@-r15
	mov.l	.L0604A5B0,r5
	mov	r3,r0
	add	#1,r0
	mov.w	r0,@(6,r5)
	mov	r2,r0
	add	#4,r0
	mov.w	r0,@(4,r5)
	mov.l	.L0604A5B4,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L0604A5B0:
	.long D_0604B438
.L0604A5B4:
	.long func_06047BCC
	endlabel func_0604A598

	glabel func_0604A5B8
	mov	r11,r10
	mov	#20,r2
	mov.l	.L0604A5F0,r0
.L0604A5BE:
	mov.l	r0,@r10
	dt	r2
	bf/s	.L0604A5BE
	add	#4,r10
	mov.b	@(10,r12),r0
	shll2	r0
	shll	r0
	mov.l	.L0604A5F4,r2
	add	r0,r2
	mov.l	@r2+,r3
	mov.l	@r2+,r4
	mov.l	r3,@(0,r11)
	mov.l	r4,@(4,r11)
	mov	#1,r0
	mov.b	r0,@(14,r11)
	mov	#-1,r0
	mov.b	r0,@(15,r11)
	mov	#64,r6
	add	r11,r6
	mov.l	r0,@(0,r6)
	mov.l	r0,@(4,r6)
	mov.l	r0,@(8,r6)
	mov.l	r0,@(12,r6)
	rts
	nop
.L0604A5F0:
	.long 0x00000000
.L0604A5F4:
	.long D_0604B914
	endlabel func_0604A5B8

	glabel func_0604A5F8
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r2,@-r15
	sts.l	pr,@-r15
	mov.l	.L0604A63C,r8
	mov.l	.L0604A640,r9
	mov.l	@(20,r12),r2
	add	r2,r9
	add	r9,r8
	mov.b	@(10,r12),r0
	mov	r0,r7
	mov.w	.L0604A63A,r5
	mov	#8,r6
.L0604A61A:
	bsr	func_0604A644
	nop
	dt	r6
	add	r5,r8
	bf/s	.L0604A61A
	add	r5,r9
	lds.l	@r15+,pr
	mov.l	@r15+,r2
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	rts
	nop
.L0604A63A:
	.short 0x0078
.L0604A63C:
	.long 0x00000060
.L0604A640:
	.long 0x00000100
	endlabel func_0604A5F8

	glabel func_0604A644
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r2,@-r15
	sts.l	pr,@-r15
	mov	r8,r10
	mov	r9,r11
	mov	#5,r2
.L0604A652:
	mov.b	@(0,r11),r0
	cmp/eq	r7,r0
	bf	.L0604A65E
	bsr	func_0604A670
	nop
	add	#-24,r11
.L0604A65E:
	add	#24,r11
	dt	r2
	bf	.L0604A652
	lds.l	@r15+,pr
	mov.l	@r15+,r2
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	rts
	nop
	endlabel func_0604A644

	glabel func_0604A670
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	r1,@-r15
	mov.w	.L0604A6BE,r0
.L0604A67C:
	cmp/hs	r10,r11
	bt	.L0604A68E
	mov	#6,r2
.L0604A682:
	mov.l	@(r0,r11),r3
	dt	r2
	mov.l	r3,@r11
	bf/s	.L0604A682
	add	#4,r11
	bt	.L0604A67C
.L0604A68E:
	mov	r10,r11
	sub	r0,r11
	mov.l	.L0604A6C0,r2
	mov	#4,r3
	mov.l	@(4,r11),r0
.L0604A698:
	mov.l	@(4,r2),r1
	cmp/hi	r1,r0
	bt	.L0604A6A4
	dt	r3
	bf/s	.L0604A698
	add	#24,r2
.L0604A6A4:
	mov	#6,r3
.L0604A6A6:
	mov.l	@r2+,r0
	mov.l	r0,@r10
	dt	r3
	bf/s	.L0604A6A6
	add	#4,r10
	mov.l	@r15+,r1
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	rts
	nop
.L0604A6BE:
	.short 0x0018
.L0604A6C0:
	.long D_0604B93C
	endlabel func_0604A670

	glabel func_0604A6C4
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r2,@-r15
	sts.l	pr,@-r15
	mov.l	.L0604A704,r8
	mov.l	.L0604A708,r9
	mov.l	@(20,r12),r2
	add	r2,r9
	add	r9,r8
	mov.b	@(10,r12),r0
	mov	r0,r7
	mov.w	.L0604A702,r5
	mov	#10,r6
.L0604A6E4:
	bsr	func_0604A70C
	nop
	dt	r6
	add	r5,r8
	bf/s	.L0604A6E4
	add	r5,r9
	lds.l	@r15+,pr
	mov.l	@r15+,r2
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	rts
	nop
.L0604A702:
	.short 0x000A
.L0604A704:
	.long 0x00000008
.L0604A708:
	.long 0x000004C0
	endlabel func_0604A6C4

	glabel func_0604A70C
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r2,@-r15
	sts.l	pr,@-r15
	mov	r8,r10
	mov	r9,r11
	mov	#5,r2
.L0604A71A:
	mov.b	@(0,r11),r0
	cmp/eq	r7,r0
	bf	.L0604A726
	bsr	func_0604A738
	nop
	add	#-2,r11
.L0604A726:
	add	#2,r11
	dt	r2
	bf	.L0604A71A
	lds.l	@r15+,pr
	mov.l	@r15+,r2
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	rts
	nop
	endlabel func_0604A70C

	glabel func_0604A738
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov.l	r1,@-r15
.L0604A742:
	cmp/hs	r10,r11
	bt	.L0604A74E
	mov.w	@(2,r11),r0
	mov.w	r0,@r11
	bra	.L0604A742
	add	#2,r11
.L0604A74E:
	mov	r10,r11
	add	#0,r11
	mov.l	.L0604A778,r2
	mov	#4,r3
	mov.b	@(1,r11),r0
	mov	r0,r1
.L0604A75A:
	mov.b	@(1,r2),r0
	cmp/hi	r0,r1
	bt	.L0604A766
	dt	r3
	bf/s	.L0604A75A
	add	#2,r2
.L0604A766:
	mov.w	@r2+,r0
	mov.w	r0,@r10
	mov.l	@r15+,r1
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	rts
	nop
.L0604A778:
	.long D_0604BA9C
	endlabel func_0604A738

	glabel func_0604A77C
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov.l	r7,@-r15
	mov.l	r6,@-r15
	sts.l	pr,@-r15
	mov.l	r11,@-r15
	mov.l	.L0604A7E0,r10
	mov.l	@(20,r12),r0
	add	r0,r10
	mov.l	.L0604A7E4,r9
	add	r0,r9
	mov	#4,r8
	mov	#8,r7
	mov.b	@(10,r12),r0
	mov	r0,r6
	mov	r9,r11
.L0604A79E:
	mov.b	@(0,r10),r0
	cmp/eq	r6,r0
	bf	.L0604A7A8
	bsr	func_0604A7E8
	nop
.L0604A7A8:
	mov.b	@(1,r10),r0
	cmp/eq	r6,r0
	bf	.L0604A7B2
	bsr	func_0604A826
	nop
.L0604A7B2:
	add	#4,r9
	dt	r8
	bf/s	.L0604A79E
	add	#8,r10
	mov	#4,r8
	mov.w	.L0604A7DA,r0
	add	r0,r11
	mov.w	.L0604A7DC,r0
	dt	r7
	bf/s	.L0604A79E
	add	r0,r9
	mov.l	@r15+,r11
	lds.l	@r15+,pr
	mov.l	@r15+,r6
	mov.l	@r15+,r7
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	rts
	nop
.L0604A7DA:
	.short 0x0078
.L0604A7DC:
	.short 0x0068
	.byte 0x00, 0x00
.L0604A7E0:
	.long 0x00000000
.L0604A7E4:
	.long 0x00000100
	endlabel func_0604A77C

	glabel func_0604A7E8
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov	#5,r3
	mov	#5,r4
	mov.w	.L0604A824,r5
	mov	r9,r2
	mov	r11,r6
.L0604A7FC:
	mov.l	@(8,r2),r0
	cmp/hi	r5,r0
	bf	.L0604A808
	mov	r0,r5
	mov.b	@(0,r6),r0
	mov	r0,r3
.L0604A808:
	add	#24,r6
	dt	r4
	bf/s	.L0604A7FC
	add	#24,r2
	mov	r3,r0
	mov.b	r0,@(0,r10)
	mov.l	r5,@(4,r10)
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	rts
	nop
.L0604A824:
	.short 0x07D0
	endlabel func_0604A7E8

	glabel func_0604A826
	mov	#5,r0
	mov.b	r0,@(1,r10)
	mov.w	.L0604A832,r0
	mov.w	r0,@(2,r10)
	rts
	nop
.L0604A832:
	.short 0x000A
	endlabel func_0604A826

	glabel func_0604A834
	sts.l	pr,@-r15
	mov.l	r1,@-r15
	mov.l	.L0604A8B4,r9
	mov.b	@r9,r10
	cmp/pz	r10
	bf	.L0604A86A
	mov.l	.L0604A8B8,r8
	mov.b	@r8+,r0
	tst	#1,r0
	bt	.L0604A84E
	mov.l	.L0604A8BC,r0
	jsr	@r0
	mov	#0,r4
.L0604A84E:
	mov.b	@r8+,r0
	tst	#1,r0
	bt	.L0604A85A
	mov.l	.L0604A8BC,r0
	jsr	@r0
	mov	#1,r4
.L0604A85A:
	mov.l	.L0604A8B8,r0
	mov.b	@(r0,r10),r0
	tst	#2,r0
	bt	.L0604A86A
	mov	r10,r4
	mov.l	.L0604A8C0,r0
	jsr	@r0
	nop
.L0604A86A:
	mov.l	.L0604A8C4,r2
	mov.l	.L0604A8B4,r0
	mov.b	@r0,r0
	cmp/pl	r0
	bf	.L0604A876
	mov.l	.L0604A8C8,r2
.L0604A876:
	mov.l	.L0604A8CC,r3
	mov.l	r2,@r3
	mov.l	.L0604A8D0,r0
	add	r0,r2
	mov.l	.L0604A8D4,r4
	mov.b	@r2+,r3
	mov.b	r3,@r4
	mov.l	.L0604A8D8,r4
	mov.b	@r2+,r3
	mov.b	r3,@r4
	mov.l	.L0604A8DC,r4
	mov.b	@r2+,r3
	mov.b	r3,@r4
	mov.l	r2,@-r15
	mov.l	.L0604A8E0,r0
	jsr	@r0
	nop
	mov.l	@r15+,r2
	mov.l	.L0604A8E4,r4
	mov.b	@r2+,r3
	mov.b	r3,@r4
	mov.l	.L0604A8E8,r0
	jsr	@r0
	nop
	mov.b	@(15,r3),r0
	mov.l	.L0604A8D8,r4
	mov.b	r0,@r4
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
.L0604A8B4:
	.long D_060CB050
.L0604A8B8:
	.long D_060CB044
.L0604A8BC:
	.long func_06005834
.L0604A8C0:
	.long func_06005910
.L0604A8C4:
	.long 0x002FF100
.L0604A8C8:
	.long 0x002FF880
.L0604A8CC:
	.long D_060CB014
.L0604A8D0:
	.long 0x00000524
.L0604A8D4:
	.long D_060CB003
.L0604A8D8:
	.long D_060CB002
.L0604A8DC:
	.long D_060CB000
.L0604A8E0:
	.long func_0600DD28
.L0604A8E4:
	.long D_060CB001
.L0604A8E8:
	.long func_0604B8E0
	endlabel func_0604A834

	glabel func_0604A8EC
	sts.l	pr,@-r15
	mov.l	.L0604A9CC,r2
	mov.l	.L0604A9D0,r3
	mov	#0,r0
.L0604A8F4:
	mov.l	r0,@r2
	dt	r3
	bf/s	.L0604A8F4
	add	#4,r2
	mov.l	.L0604A9D4,r2
	mov.l	.L0604A9D8,r3
	mov	#5,r4
	mov.w	.L0604A9CA,r5
.L0604A904:
	mov.l	@r2+,r0
	mov.l	r0,@(0,r3)
	mov.l	@r2+,r0
	mov.l	r0,@(4,r3)
	mov	#1,r0
	mov.b	r0,@(14,r3)
	mov	#-1,r0
	mov.b	r0,@(15,r3)
	mov	#64,r6
	add	r3,r6
	mov.l	r0,@(0,r6)
	mov.l	r0,@(4,r6)
	mov.l	r0,@(8,r6)
	mov.l	r0,@(12,r6)
	dt	r4
	bf/s	.L0604A904
	add	r5,r3
	mov.l	.L0604A9CC,r3
	mov	#4,r7
.L0604A92A:
	mov.l	.L0604A9DC,r2
	mov	#8,r4
	mov	#8,r5
	mov.l	.L0604A9E0,r6
.L0604A932:
	mov.l	@r2+,r0
	mov.l	r0,@(4,r3)
	mov.b	@r6+,r0
	mov.b	r0,@(0,r3)
	mov.b	r0,@(1,r3)
	mov	#10,r0
	mov.w	r0,@(2,r3)
	dt	r4
	bf/s	.L0604A932
	add	r5,r3
	dt	r7
	bf	.L0604A92A
	mov.l	.L0604A9E4,r3
	mov	#24,r5
	mov	#8,r6
.L0604A950:
	mov.l	.L0604A9E8,r2
	mov	#5,r4
.L0604A954:
	mov.b	@r2+,r0
	mov.b	r0,@(0,r3)
	mov.b	@r2+,r0
	mov.b	r0,@(1,r3)
	mov.b	@r2+,r0
	mov.b	r0,@(2,r3)
	mov.b	@r2+,r0
	mov.b	r0,@(3,r3)
	mov.l	@r2+,r0
	mov.l	r0,@(4,r3)
	mov.l	@r2+,r0
	mov.l	r0,@(8,r3)
	mov.l	@r2+,r0
	mov.l	r0,@(12,r3)
	mov.l	@r2+,r0
	mov.l	r0,@(16,r3)
	mov.l	@r2+,r0
	mov.l	r0,@(20,r3)
	dt	r4
	bf/s	.L0604A954
	add	r5,r3
	dt	r6
	bf	.L0604A950
	mov.l	.L0604A9EC,r3
	mov	#2,r5
	mov	#10,r6
.L0604A988:
	mov.l	.L0604A9F0,r2
	mov	#5,r4
.L0604A98C:
	mov.b	@r2+,r0
	mov.b	r0,@(0,r3)
	mov.b	@r2+,r0
	mov.b	r0,@(1,r3)
	dt	r4
	bf/s	.L0604A98C
	add	r5,r3
	dt	r6
	bf	.L0604A988
	mov	#0,r0
	mov.l	.L0604A9F4,r2
	mov.b	r0,@r2
	mov.l	.L0604A9F8,r3
	mov.l	.L0604A9FC,r2
	mov.b	@r3,r0
	mov.b	r0,@r2
	mov.l	.L0604A9CC,r2
	mov.l	.L0604AA00,r4
	mov.l	.L0604A9D0,r3
.L0604A9B2:
	mov.l	@r2+,r0
	dt	r3
	mov.l	r0,@r4
	bf/s	.L0604A9B2
	add	#4,r4
	mov.l	.L0604A9F4,r2
	mov.b	@r2,r0
	mov.l	.L0604AA04,r2
	mov.b	r0,@r2
	lds.l	@r15+,pr
	rts
	nop
.L0604A9CA:
	.short 0x0050
.L0604A9CC:
	.long D_002FF100
.L0604A9D0:
	.long 0x000001AE
.L0604A9D4:
	.long D_0604B914
.L0604A9D8:
	.long D_002FF628
.L0604A9DC:
	.long D_0604B9FC
.L0604A9E0:
	.long D_0604BA7C
.L0604A9E4:
	.long D_002FF200
.L0604A9E8:
	.long D_0604B93C
.L0604A9EC:
	.long D_002FF5C0
.L0604A9F0:
	.long D_0604BA9C
.L0604A9F4:
	.long D_002FF624
.L0604A9F8:
	.long D_060CB051
.L0604A9FC:
	.long D_002FF626
.L0604AA00:
	.long D_002FF880
.L0604AA04:
	.long D_060CB003
	endlabel func_0604A8EC

	glabel func_0604AA08
	sts.l	pr,@-r15
	mov.l	.L0604AA30,r2
	mov.l	.L0604AA34,r3
	mov	#0,r0
.L0604AA10:
	mov.l	r0,@r2
	dt	r3
	bf/s	.L0604AA10
	add	#4,r2
	mov.l	.L0604AA30,r5
	mov.w	.L0604AA2E,r4
	mov	#-1,r0
	mov	#6,r3
.L0604AA20:
	mov.l	r0,@r5
	dt	r3
	bf/s	.L0604AA20
	add	r4,r5
	lds.l	@r15+,pr
	rts
	nop
.L0604AA2E:
	.short 0x0800
.L0604AA30:
	.long D_002FC000
.L0604AA34:
	.long 0x00000C40
	endlabel func_0604AA08

	glabel func_0604AA38
	mov	#0,r0
	mov.b	r0,@(6,r12)
	mov.b	r0,@(4,r12)
	mov.b	r0,@(7,r12)
	mov.b	r0,@(7,r12)
	mov.b	r0,@(10,r12)
	mov.b	r0,@(9,r12)
	mov.b	r0,@(13,r12)
	mov.w	r0,@(16,r12)
	mov	#3,r0
	mov.b	r0,@(5,r12)
	mov.w	.L0604AA62,r0
	mov.l	r0,@(32,r12)
	mov.w	.L0604AA64,r0
	mov.l	r0,@(36,r12)
	mov	#4,r0
	mov.l	r0,@(28,r12)
	mov	#9,r0
	mov.l	r0,@(40,r12)
	rts
	nop
.L0604AA62:
	.short 0x00ED
.L0604AA64:
	.short 0x0070
	endlabel func_0604AA38

	glabel func_0604AA66
	sts.l	pr,@-r15
	mov.l	.L0604AC10,r6
	mov.l	.L0604AC14,r7
	mov.l	.L0604AC18,r0
	jsr	@r0
	nop
	mov.l	.L0604AC1C,r2
	mov.l	.L0604AC20,r3
	mov.l	.L0604AC24,r4
.L0604AA78:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AA78
	add	#4,r2
	mov.l	.L0604AC28,r2
	mov.l	.L0604AC2C,r3
	mov.l	.L0604AC30,r4
.L0604AA88:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AA88
	add	#4,r2
	mov.l	.L0604AC34,r2
	mov.l	.L0604AC38,r3
	mov.l	.L0604AC3C,r4
.L0604AA98:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AA98
	add	#4,r2
	mov.l	.L0604AC40,r2
	mov.l	.L0604AC44,r3
	mov.w	.L0604AC00,r4
.L0604AAA8:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AAA8
	add	#4,r2
	mov.l	.L0604AC48,r2
	mov.l	.L0604AC4C,r3
	mov.w	.L0604AC02,r4
.L0604AAB8:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AAB8
	add	#4,r2
	mov.l	.L0604AC50,r2
	mov.l	.L0604AC54,r3
	mov.w	.L0604AC00,r4
.L0604AAC8:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AAC8
	add	#4,r2
	mov.l	.L0604AC58,r2
	mov.l	.L0604AC5C,r3
	mov.w	.L0604AC04,r4
.L0604AAD8:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AAD8
	add	#4,r2
	mov.l	.L0604AC60,r2
	mov.l	.L0604AC5C,r3
	mov.w	.L0604AC04,r4
.L0604AAE8:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AAE8
	add	#4,r2
	mov.l	.L0604AC64,r2
	mov.l	.L0604AC68,r3
	mov.w	.L0604AC00,r4
.L0604AAF8:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AAF8
	add	#4,r2
	mov.l	.L0604AC6C,r2
	mov.l	.L0604AC70,r3
	mov.w	.L0604AC00,r4
.L0604AB08:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AB08
	add	#4,r2
	mov.l	.L0604AC74,r2
	mov.l	.L0604AC78,r3
	mov.w	.L0604AC00,r4
.L0604AB18:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AB18
	add	#4,r2
	mov.l	.L0604AC7C,r2
	mov.l	.L0604AC80,r3
	mov.w	.L0604AC00,r4
.L0604AB28:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AB28
	add	#4,r2
	mov.l	.L0604AC84,r2
	mov.l	.L0604AC88,r3
	mov.w	.L0604AC00,r4
.L0604AB38:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AB38
	add	#4,r2
	mov.l	.L0604AC8C,r2
	mov.l	.L0604AC68,r3
	mov.w	.L0604AC00,r4
.L0604AB48:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AB48
	add	#4,r2
	mov.l	.L0604AC90,r2
	mov.l	.L0604AC94,r3
	mov.w	.L0604AC00,r4
.L0604AB58:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AB58
	add	#4,r2
	mov.l	.L0604AC98,r2
	mov.l	.L0604AC9C,r3
	mov.w	.L0604AC00,r4
.L0604AB68:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AB68
	add	#4,r2
	mov.l	.L0604ACA0,r2
	mov.l	.L0604ACA4,r3
	mov.w	.L0604AC06,r4
.L0604AB78:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AB78
	add	#4,r2
	mov.l	.L0604ACA8,r2
	mov.l	.L0604ACAC,r3
	mov.w	.L0604AC00,r4
.L0604AB88:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AB88
	add	#4,r2
	mov.l	.L0604ACB0,r2
	mov.l	.L0604ACB4,r3
	mov.w	.L0604AC00,r4
.L0604AB98:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604AB98
	add	#4,r2
	mov.l	.L0604ACB8,r2
	mov.l	.L0604ACBC,r3
	mov.w	.L0604AC00,r4
.L0604ABA8:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604ABA8
	add	#4,r2
	mov.l	.L0604ACC0,r2
	mov.l	.L0604ACC4,r3
	mov.w	.L0604AC00,r4
.L0604ABB8:
	mov.l	@r3+,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604ABB8
	add	#4,r2
	mov.l	.L0604ACC8,r2
	mov.l	.L0604ACCC,r3
	mov.l	.L0604ACD0,r4
	mov.l	.L0604ACD4,r5
.L0604ABCA:
	mov.l	@r3+,r0
	add	r5,r0
	dt	r4
	mov.l	r0,@r2
	bf/s	.L0604ABCA
	add	#4,r2
	mov.l	.L0604ACD8,r2
	mov.w	.L0604AC08,r0
	mov.l	r0,@r2
	mov	#1,r3
	mov	#0,r4
	mov.l	.L0604ACDC,r6
	mov.l	.L0604ACE0,r0
	jsr	@r0
	mov	#0,r5
	mov.l	.L0604ACE4,r2
	mov.w	.L0604AC08,r0
	mov.l	r0,@r2
	mov.l	.L0604ACD8,r2
	mov.w	.L0604AC0A,r0
	mov.l	r0,@r2
	mov.l	.L0604ACE8,r2
	mov.w	.L0604AC0C,r0
	mov.l	r0,@r2
	lds.l	@r15+,pr
	rts
	nop
.L0604AC00:
	.short 0x0008
.L0604AC02:
	.short 0x0010
.L0604AC04:
	.short 0x0018
.L0604AC06:
	.short 0x0080
.L0604AC08:
	.short 0x0000
.L0604AC0A:
	.short 0x40D4
.L0604AC0C:
	.short 0x00E8
	.byte 0x00, 0x00
.L0604AC10:
	.long D_0604AE50
.L0604AC14:
	.long VDP1_VRAM + 0x65000
.L0604AC18:
	.long func_06047DB2
.L0604AC1C:
	.long VDP2_VRAM + 0x40000
.L0604AC20:
	.long D_0026F7B0
.L0604AC24:
	.long 0x000006A0
.L0604AC28:
	.long VDP2_VRAM + 0x41A80
.L0604AC2C:
	.long D_00271548
.L0604AC30:
	.long 0x00000098
.L0604AC34:
	.long VDP2_VRAM + 0x51D00
.L0604AC38:
	.long D_0027CDD0
.L0604AC3C:
	.long 0x00000B40
.L0604AC40:
	.long D_060CA260
.L0604AC44:
	.long D_00281BF4
.L0604AC48:
	.long D_060CA200
.L0604AC4C:
	.long D_00271230
.L0604AC50:
	.long D_060CA280
.L0604AC54:
	.long D_002717A8
.L0604AC58:
	.long D_060CA700
.L0604AC5C:
	.long D_0027E3D0
.L0604AC60:
	.long D_060CA600
.L0604AC64:
	.long D_060CA780
.L0604AC68:
	.long D_00281B14
.L0604AC6C:
	.long D_060CA7A0
.L0604AC70:
	.long D_0028F114
.L0604AC74:
	.long D_060CA800
.L0604AC78:
	.long D_0028C728
.L0604AC7C:
	.long D_060CA820
.L0604AC80:
	.long D_00284C38
.L0604AC84:
	.long D_060CAC40
.L0604AC88:
	.long D_00281B34
.L0604AC8C:
	.long D_060CACA0
.L0604AC90:
	.long D_060CAD00
.L0604AC94:
	.long D_00281B94
.L0604AC98:
	.long D_060CAD40
.L0604AC9C:
	.long D_00281BB4
.L0604ACA0:
	.long D_060CAE00
.L0604ACA4:
	.long D_0028EE64
.L0604ACA8:
	.long D_060CADA0
.L0604ACAC:
	.long D_00284554
.L0604ACB0:
	.long D_060CADC0
.L0604ACB4:
	.long D_00284574
.L0604ACB8:
	.long D_060CACE0
.L0604ACBC:
	.long D_0604C0E0
.L0604ACC0:
	.long D_060CAD20
.L0604ACC4:
	.long D_0604C0C0
.L0604ACC8:
	.long VDP2_VRAM + 0x58000
.L0604ACCC:
	.long D_0028CE64
.L0604ACD0:
	.long 0x00000800
.L0604ACD4:
	.long 0x70007000
.L0604ACD8:
	.long D_06047AF8
.L0604ACDC:
	.long D_0026D7AC
.L0604ACE0:
	.long func_06047AB4
.L0604ACE4:
	.long D_06047AF0
.L0604ACE8:
	.long D_06047B00
	endlabel func_0604AA66

	glabel func_0604ACEC
	mov	#0,r2
	mov.l	.L0604AD14,r0
	mov.w	@r0,r0
	tst	#1,r0
	bf	.L0604AD18
	tst	#2,r0
	bf	.L0604AD28
	mov.b	@(11,r12),r0
	mov	r0,r3
	mov.l	.L0604AD14,r0
	mov.w	@r0,r0
	tst	#1,r0
	bf	.L0604AD1C
	tst	#2,r0
	bf	.L0604AD2C
.L0604AD0A:
	mov	r3,r0
	mov.b	r0,@(11,r12)
	rts
	mov	r2,r0
	.byte 0x00, 0x00
.L0604AD14:
	.long D_06047F1E
.L0604AD18:
	bra	.L0604AD24
	mov	#30,r3
.L0604AD1C:
	add	#-1,r3
	cmp/pl	r3
	bt	.L0604AD0A
	mov	#8,r3
.L0604AD24:
	bra	.L0604AD0A
	mov	#-1,r2
.L0604AD28:
	bra	.L0604AD34
	mov	#30,r3
.L0604AD2C:
	add	#-1,r3
	cmp/pl	r3
	bt	.L0604AD0A
	mov	#8,r3
.L0604AD34:
	bra	.L0604AD0A
	mov	#1,r2
	endlabel func_0604ACEC
