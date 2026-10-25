	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06004FBC,"ax",@progbits
	.p2align 2

	glabel func_06004FBC
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov	r4,r11
	mov.l	.L06004FEC,r2
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	.L06004FF0,r9
	add	#-96,r15
	mova	.L06004FE0,r0
	mov	r15,r8
	mov.b	@r2,r3
	add	r0,r9
	mov.b	r3,@r15
	add	#4,r8
.L06004FE0:
	tst	r11,r11
	bf/s	.L06004FF8
	mov	r8,r4
	mov.l	.L06004FF4,r5
	bra	.L06005008
	nop
.L06004FEC:
	.long D_060FFC14
.L06004FF0:
	.long 0x0004B8B4
.L06004FF4:
	.long D_06051218
.L06004FF8:
	mov.b	@r15,r5
	mov	r5,r3
	shll	r5
	add	r3,r5
	mov.l	.L06005158,r3
	shll2	r5
	extu.b	r5,r5
	add	r3,r5
.L06005008:
	jsr	@r9
	nop
	mov.l	.L0600515C,r13
	mov	#1,r14
.L06005010:
	mov.b	@r13,r3
	extu.b	r3,r3
	and	r14,r3
	cmp/eq	r14,r3
	bt	.L06005010
	mov	#26,r3
	mov.b	r14,@r13
	mov.l	.L06005160,r12
	mov.b	r3,@r12
.L06005022:
	mov.b	@r13,r1
	extu.b	r1,r1
	tst	r14,r1
	bf	.L06005022
	mov	r15,r6
	mov.l	.L06005168,r5
	add	#84,r6
	mov.l	.L0600516C,r4
	mov.l	.L06005164,r2
	mov.l	@r2,r3
	jsr	@r3
	nop
.L0600503A:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L0600503A
	mov.b	r14,@r13
	mov	#25,r2
	mov.b	r2,@r12
.L0600504A:
	mov.b	@r13,r1
	extu.b	r1,r1
	tst	r14,r1
	bf	.L0600504A
	mov	r15,r6
	mov.w	.L06005152,r5
	add	#60,r6
	mov.l	.L06005170,r10
	mov.l	@r10,r3
	mov.l	@(12,r3),r2
	jsr	@r2
	mov	r11,r4
	mov	#0,r3
	mov	#76,r0
	mov.l	@(r0,r15),r2
	cmp/hi	r3,r2
	bt	.L06005070
	bra	.L0600519A
	nop
.L06005070:
	mov	r15,r4
	add	#24,r4
	jsr	@r9
	mov	r8,r5
	mov.l	.L06005174,r5
	mov	r15,r4
	add	#36,r4
	jsr	@r9
	nop
	mov	#0,r3
	mov.w	.L06005154,r2
	mov	#15,r4
	mov	#47,r0
	mov	#100,r1
	mov.b	r3,@(r0,r15)
	mov.b	@(6,r15),r0
	mov	r0,r5
	extu.b	r5,r3
	mov.b	@(5,r15),r0
	and	r5,r4
	shlr2	r3
	shlr2	r3
	mulu.w	r2,r3
	extu.b	r0,r0
	sts	macl,r3
	shlr2	r0
	mulu.w	r1,r4
	shlr2	r0
	sts	macl,r1
	add	r1,r3
	mov	r0,r1
	shll2	r0
	add	r1,r0
	shll	r0
	add	r0,r3
	add	r4,r3
	add	#68,r3
	mov	#16,r0
	mov.b	r3,@(r0,r15)
	mov	#4,r0
	mov.b	@(r0,r15),r0
	and	#15,r0
	mov	r15,r1
	add	#17,r1
	mov.b	r0,@r1
	mov.b	@(3,r15),r0
	mov	r0,r4
	extu.b	r4,r3
	shlr2	r3
	shlr2	r3
	mov	r3,r1
	shll2	r3
	add	r1,r3
	shll	r3
	mov	#15,r0
	and	r4,r0
	add	r0,r3
	mov	#18,r0
	mov.b	r3,@(r0,r15)
	mov.b	@(2,r15),r0
	mov	r0,r4
	extu.b	r4,r3
	shlr2	r3
	shlr2	r3
	mov	r3,r1
	shll2	r3
	add	r1,r3
	shll	r3
	mov	#15,r0
	and	r4,r0
	add	r0,r3
	mov	#19,r0
	mov.b	r3,@(r0,r15)
	mov.b	@(1,r15),r0
	mov	r0,r4
	extu.b	r4,r3
	shlr2	r3
	shlr2	r3
	mov	r3,r1
	shll2	r3
	add	r1,r3
	shll	r3
	mov	#15,r0
	and	r4,r0
	add	r0,r3
	mov	#20,r0
	mov.b	r3,@(r0,r15)
	mov	r15,r4
	mov.l	@r10,r1
	add	#16,r4
	mov.l	@(40,r1),r3
	jsr	@r3
	nop
	mov.l	r0,@(48,r15)
	mov.w	.L06005152,r3
	mov.l	r3,@(52,r15)
.L06005130:
	mov.b	@r13,r1
	extu.b	r1,r1
	and	r14,r1
	cmp/eq	r14,r1
	bt	.L06005130
	mov	#26,r2
	mov.b	r14,@r13
	mov.b	r2,@r12
.L06005140:
	mov.b	@r13,r1
	extu.b	r1,r1
	tst	r14,r1
	bf	.L06005140
	mov.l	@r10,r3
	mov	#0,r7
	mov.l	@(16,r3),r2
	bra	.L06005178
	nop
.L06005152:
	.short 0x3000
.L06005154:
	.short 0x00E8
	.byte 0x00, 0x00
.L06005158:
	.long D_06051158
.L0600515C:
	.long SMPC_REGS + 0x63
.L06005160:
	.long SMPC_REGS + 0x1F
.L06005164:
	.long BIOS_VECTORS + 0x58
.L06005168:
	.long D_06062CC4
.L0600516C:
	.long D_0607C000
.L06005170:
	.long BIOS_VECTORS + 0x54
.L06005174:
	.long D_06051224
.L06005178:
	mov.l	.L060051D8,r6
	mov	r15,r5
	add	#24,r5
	jsr	@r2
	mov	r11,r4
.L06005182:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L06005182
	mov.b	r14,@r13
	mov	#25,r2
	mov.b	r2,@r12
.L06005192:
	mov.b	@r13,r1
	extu.b	r1,r1
	tst	r14,r1
	bf	.L06005192
.L0600519A:
	add	#96,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel func_06004FBC

	glabel func_060051AE
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov	r4,r12
	mov.l	.L060051DC,r2
	tst	r12,r12
	mov.l	r10,@-r15
	sts.l	pr,@-r15
	add	#-96,r15
	mov	r15,r11
	mov.b	@r2,r3
	add	#4,r11
	mov.b	r3,@r15
	bf	.L060051E8
	mov.l	.L060051E0,r5
	mov.l	.L060051E4,r3
	bsrf	r3
	mov	r11,r4
	bra	.L060051FE
	nop
.L060051D8:
	.long D_002F9000
.L060051DC:
	.long D_060FFC14
.L060051E0:
	.long D_06051218
.L060051E4:
	.long 0x0004B6C0
.L060051E8:
	mov.b	@r15,r5
	mov	r5,r3
	mov.l	.L060052A8,r1
	shll	r5
	add	r3,r5
	shll2	r5
	mov.l	.L060052A4,r3
	extu.b	r5,r5
	add	r3,r5
	bsrf	r1
	mov	r11,r4
.L060051FE:
	mov	#1,r14
	mov.l	.L060052AC,r13
.L06005202:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L06005202
	mov.b	r14,@r13
	mov	#26,r2
	mov.l	.L060052B0,r10
	mov.b	r2,@r10
.L06005214:
	mov.b	@r13,r1
	extu.b	r1,r1
	tst	r14,r1
	bf	.L06005214
	mov.l	.L060052B4,r2
	mov	r15,r6
	mov.l	.L060052B8,r5
	add	#84,r6
	mov.l	.L060052BC,r4
	mov.l	@r2,r3
	jsr	@r3
	nop
.L0600522C:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L0600522C
	mov	#25,r2
	mov.b	r14,@r13
	mov.b	r2,@r10
.L0600523C:
	mov.b	@r13,r1
	extu.b	r1,r1
	tst	r14,r1
	bf	.L0600523C
	mov.l	.L060052C0,r2
	mov	r15,r6
	mov.w	.L060052A2,r5
	add	#60,r6
	mov.l	@r2,r3
	mov.l	@(12,r3),r1
	jsr	@r1
	mov	r12,r4
.L06005254:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L06005254
	mov	#26,r2
	mov.b	r14,@r13
	mov.b	r2,@r10
.L06005264:
	mov.b	@r13,r1
	extu.b	r1,r1
	tst	r14,r1
	bf	.L06005264
	mov.l	.L060052C0,r2
	mov	r11,r5
	mov.l	.L060052C4,r6
	mov.l	@r2,r3
	mov.l	@(20,r3),r1
	jsr	@r1
	mov	r12,r4
.L0600527A:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L0600527A
	mov.b	r14,@r13
	mov	#25,r2
	mov.b	r2,@r10
.L0600528A:
	mov.b	@r13,r1
	extu.b	r1,r1
	tst	r14,r1
	bf	.L0600528A
	add	#96,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L060052A2:
	.short 0x3000
.L060052A4:
	.long D_06051158
.L060052A8:
	.long 0x0004B696
.L060052AC:
	.long SMPC_REGS + 0x63
.L060052B0:
	.long SMPC_REGS + 0x1F
.L060052B4:
	.long BIOS_VECTORS + 0x58
.L060052B8:
	.long D_06062CC4
.L060052BC:
	.long D_0607C000
.L060052C0:
	.long BIOS_VECTORS + 0x54
.L060052C4:
	.long D_002F9000
	endlabel func_060051AE

	glabel func_060052C8
	mov.l	r14,@-r15
	mov	#1,r14
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	sts.l	pr,@-r15
	mov.l	.L06005418,r13
	add	#-84,r15
	mov.l	r4,@r15
.L060052DA:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L060052DA
	mov.b	r14,@r13
	mov	#26,r2
	mov.l	.L0600541C,r12
	mov.b	r2,@r12
.L060052EC:
	mov.b	@r13,r1
	extu.b	r1,r1
	tst	r14,r1
	bf	.L060052EC
	mov.l	.L06005420,r2
	mov	r15,r6
	mov.l	.L06005424,r5
	add	#72,r6
	mov.l	.L06005428,r4
	mov.l	@r2,r3
	jsr	@r3
	nop
.L06005304:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L06005304
	mov	#25,r2
	mov.b	r14,@r13
	mov.b	r2,@r12
.L06005314:
	mov.b	@r13,r1
	extu.b	r1,r1
	tst	r14,r1
	bf	.L06005314
	mov.l	.L0600542C,r11
	mov	r15,r6
	mov.w	.L06005412,r5
	add	#48,r6
	mov.l	@r15,r4
	mov.l	@r11,r3
	mov.l	@(12,r3),r2
	jsr	@r2
	nop
	mov	#0,r3
	mov	#64,r0
	mov.l	@(r0,r15),r2
	cmp/hi	r3,r2
	bt	.L0600533C
	bra	.L0600546A
	nop
.L0600533C:
	mov.l	.L06005430,r5
	mov	r15,r4
	mov.l	.L06005434,r2
	add	#12,r4
	bsrf	r2
	nop
	mov.l	.L06005438,r5
	mov	r15,r4
	mov.l	.L0600543C,r3
	add	#24,r4
	bsrf	r3
	nop
	mov.w	.L06005414,r3
	mov	#15,r5
	mov	#0,r2
	mov	#35,r0
	mov.b	r2,@(r0,r15)
	mov	#100,r2
	mov.b	@(6,r15),r0
	mov	r0,r4
	extu.b	r4,r0
	shlr2	r0
	shlr2	r0
	and	r4,r5
	mulu.w	r3,r0
	sts	macl,r0
	mulu.w	r2,r5
	sts	macl,r2
	add	r2,r0
	mov	r0,r1
	mov.b	@(5,r15),r0
	extu.b	r0,r0
	shlr2	r0
	shlr2	r0
	mov	r0,r2
	shll2	r0
	add	r2,r0
	shll	r0
	add	r1,r0
	add	r5,r0
	add	#68,r0
	mov.b	r0,@(4,r15)
	mov	#4,r0
	mov.b	@(r0,r15),r0
	and	#15,r0
	mov	#15,r1
	mov.b	r0,@(5,r15)
	mov.b	@(3,r15),r0
	mov	r0,r4
	extu.b	r4,r0
	shlr2	r0
	shlr2	r0
	mov	r0,r2
	shll2	r0
	add	r2,r0
	shll	r0
	and	r4,r1
	add	r1,r0
	mov.b	r0,@(6,r15)
	mov	#15,r1
	mov.b	@(2,r15),r0
	mov	r0,r4
	extu.b	r4,r0
	shlr2	r0
	shlr2	r0
	mov	r0,r2
	shll2	r0
	add	r2,r0
	shll	r0
	and	r4,r1
	add	r1,r0
	mov.b	r0,@(7,r15)
	mov.b	@(1,r15),r0
	mov	r0,r4
	extu.b	r4,r0
	shlr2	r0
	shlr2	r0
	mov	r0,r2
	shll2	r0
	add	r2,r0
	shll	r0
	mov	#15,r1
	and	r4,r1
	add	r1,r0
	mov.b	r0,@(8,r15)
	mov	r15,r4
	mov.l	@r11,r2
	add	#4,r4
	mov.l	@(40,r2),r1
	jsr	@r1
	nop
	mov.l	r0,@(36,r15)
	mov.w	.L06005412,r3
	mov.l	r3,@(40,r15)
.L060053F8:
	mov.b	@r13,r1
	extu.b	r1,r1
	and	r14,r1
	cmp/eq	r14,r1
	bt	.L060053F8
	mov	#26,r2
	mov.b	r14,@r13
	mov.b	r2,@r12
.L06005408:
	mov.b	@r13,r1
	extu.b	r1,r1
	tst	r14,r1
	bra	.L06005440
	nop
.L06005412:
	.short 0x0400
.L06005414:
	.short 0x00E8
	.byte 0x00, 0x00
.L06005418:
	.long SMPC_REGS + 0x63
.L0600541C:
	.long SMPC_REGS + 0x1F
.L06005420:
	.long BIOS_VECTORS + 0x58
.L06005424:
	.long D_06062CC4
.L06005428:
	.long D_0607C000
.L0600542C:
	.long BIOS_VECTORS + 0x54
.L06005430:
	.long D_06051230
.L06005434:
	.long 0x0004B54C
.L06005438:
	.long D_06051224
.L0600543C:
	.long 0x0004B540
.L06005440:
	bf	.L06005408
	mov	r15,r5
	mov.l	@r15,r4
	add	#12,r5
	mov.l	@r11,r3
	mov.l	@(16,r3),r2
	mov.l	.L06005540,r6
	jsr	@r2
	mov	#0,r7
.L06005452:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L06005452
	mov.b	r14,@r13
	mov	#25,r2
	mov.b	r2,@r12
.L06005462:
	mov.b	@r13,r1
	extu.b	r1,r1
	tst	r14,r1
	bf	.L06005462
.L0600546A:
	add	#84,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel func_060052C8

	glabel func_06005478
	mov.l	r14,@-r15
	mov	#1,r14
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	add	#-96,r15
	mov.l	.L06005544,r3
	mov	r15,r2
	mov.l	.L06005548,r13
	add	#4,r2
	mov.l	r4,@r15
	mov.l	@r3,r1
	mov.l	r1,@r2
	mov.l	@(4,r3),r1
	mov.l	r1,@(4,r2)
	mov.l	@(8,r3),r1
	mov.l	r1,@(8,r2)
.L0600549A:
	mov.b	@r13,r3
	extu.b	r3,r3
	and	r14,r3
	cmp/eq	r14,r3
	bt	.L0600549A
	mov.b	r14,@r13
	mov	#26,r3
	mov.l	.L0600554C,r12
	mov.b	r3,@r12
.L060054AC:
	mov.b	@r13,r1
	extu.b	r1,r1
	tst	r14,r1
	bf	.L060054AC
	mov.l	.L06005550,r2
	mov	r15,r6
	mov.l	.L06005554,r5
	add	#84,r6
	mov.l	.L06005558,r4
	mov.l	@r2,r3
	jsr	@r3
	nop
.L060054C4:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L060054C4
	mov	#25,r2
	mov.b	r14,@r13
	mov.b	r2,@r12
.L060054D4:
	mov.b	@r13,r1
	extu.b	r1,r1
	tst	r14,r1
	bf	.L060054D4
	mov.l	.L0600555C,r2
	mov	r15,r6
	mov.w	.L0600553C,r5
	add	#60,r6
	mov.l	@r15,r4
	mov.l	@r2,r3
	mov.l	@(12,r3),r1
	jsr	@r1
	nop
.L060054EE:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L060054EE
	mov.b	r14,@r13
	mov	#26,r2
	mov.b	r2,@r12
.L060054FE:
	mov.b	@r13,r1
	extu.b	r1,r1
	tst	r14,r1
	bf	.L060054FE
	mov	r15,r5
	mov.l	@r15,r4
	add	#4,r5
	mov.l	.L0600555C,r2
	mov.l	@r2,r3
	mov.l	.L06005540,r6
	mov.l	@(20,r3),r1
	jsr	@r1
	nop
.L06005518:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L06005518
	mov	#25,r2
	mov.b	r14,@r13
	mov.b	r2,@r12
.L06005528:
	mov.b	@r13,r1
	extu.b	r1,r1
	tst	r14,r1
	bf	.L06005528
	add	#96,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L0600553C:
	.short 0x0400
	.byte 0x00, 0x00
.L06005540:
	.long D_0607FC00
.L06005544:
	.long D_0605123C
.L06005548:
	.long SMPC_REGS + 0x63
.L0600554C:
	.long SMPC_REGS + 0x1F
.L06005550:
	.long BIOS_VECTORS + 0x58
.L06005554:
	.long D_06062CC4
.L06005558:
	.long D_0607C000
.L0600555C:
	.long BIOS_VECTORS + 0x54
	endlabel func_06005478

	glabel func_06005560
	mov.l	r14,@-r15
	mov	#1,r14
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	add	#-56,r15
	mov.l	.L06005610,r13
.L0600556E:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L0600556E
	mov.b	r14,@r13
	mov	#26,r2
	mov.l	.L06005614,r3
	mov.b	r2,@r3
.L06005580:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L06005580
	mov.l	.L06005618,r2
	mov	r15,r12
	mov.l	.L0600561C,r5
	add	#44,r12
	mov.l	@r2,r3
	mov.l	.L06005620,r4
	jsr	@r3
	mov	r12,r6
	mov.b	@(1,r12),r0
	mov.l	.L06005624,r3
	mov.l	.L06005628,r1
	mov.b	r0,@r3
	mov.w	@(4,r12),r0
	mov	r0,r2
	mov.b	r2,@r1
.L060055A6:
	mov.b	@r13,r3
	extu.b	r3,r3
	and	r14,r3
	cmp/eq	r14,r3
	bt	.L060055A6
	mov.b	r14,@r13
	mov	#25,r3
	mov.l	.L06005614,r2
	mov.b	r3,@r2
.L060055B8:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L060055B8
	add	#56,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel func_06005560

	glabel bup_write_save
	mov.l	r14,@-r15
	mov	#1,r14
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov	r4,r12
	mov.l	.L06005610,r13
	mov.l	r10,@-r15
	sts.l	pr,@-r15
	add	#-60,r15
	mov.l	r5,@r15
.L060055E2:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L060055E2
	mov.b	r14,@r13
	mov	#26,r2
	mov.l	.L06005614,r3
	mov.b	r2,@r3
.L060055F4:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L060055F4
	mov.l	.L0600562C,r3
	mov.l	.L06005630,r11
	mova	.L06005604,r0
	add	r0,r11
.L06005604:
	jsr	@r11
	mov.l	r14,@r3
	mov.l	.L06005634,r10
	bra	.L0600563C
	nop
	.byte 0x00, 0x00
.L06005610:
	.long SMPC_REGS + 0x63
.L06005614:
	.long SMPC_REGS + 0x1F
.L06005618:
	.long BIOS_VECTORS + 0x58
.L0600561C:
	.long D_06062CC4
.L06005620:
	.long D_0607C000
.L06005624:
	.long D_060CB040
.L06005628:
	.long D_060CB041
.L0600562C:
	.long D_06051298
.L06005630:
	.long 0xFFFFF5AA
.L06005634:
	.long D_0605129C
.L06005638:
	jsr	@r11
	nop
.L0600563C:
	mov.l	@r10,r0
	tst	r0,r0
	bf	.L06005638
	mov	#100,r1
	mov.l	.L06005734,r4
	mov.b	@(1,r4),r0
	mov.b	@r4,r5
	mov	r0,r6
	extu.b	r6,r0
	shlr2	r0
	shlr2	r0
	mov	r0,r3
	shll2	r0
	add	r3,r0
	mov.w	.L06005730,r3
	shll	r0
	extu.b	r5,r2
	shlr2	r2
	shlr2	r2
	mulu.w	r3,r2
	sts	macl,r2
	add	r2,r0
	mov	#15,r2
	and	r5,r2
	mulu.w	r1,r2
	sts	macl,r2
	add	r2,r0
	mov	#15,r2
	and	r6,r2
	add	r2,r0
	add	#68,r0
	mov.b	r0,@(4,r15)
	mov	#2,r0
	mov.b	@(r0,r4),r0
	and	#15,r0
	mov	#15,r2
	mov.b	r0,@(5,r15)
	mov.b	@(3,r4),r0
	mov	r0,r5
	extu.b	r5,r0
	shlr2	r0
	shlr2	r0
	mov	r0,r3
	shll2	r0
	add	r3,r0
	shll	r0
	and	r5,r2
	add	r2,r0
	mov.b	r0,@(6,r15)
	mov	#15,r2
	mov.b	@(4,r4),r0
	mov	r0,r5
	extu.b	r5,r0
	shlr2	r0
	shlr2	r0
	mov	r0,r3
	shll2	r0
	add	r3,r0
	shll	r0
	and	r5,r2
	add	r2,r0
	mov.b	r0,@(7,r15)
	mov.b	@(5,r4),r0
	mov	r0,r5
	extu.b	r5,r0
	shlr2	r0
	shlr2	r0
	mov	r0,r3
	mov.l	.L06005738,r10
	mov	r15,r4
	shll2	r0
	add	r3,r0
	shll	r0
	mov	#15,r2
	and	r5,r2
	add	r2,r0
	mov.b	r0,@(8,r15)
	add	#4,r4
	mov.l	@r10,r3
	mov.l	@(40,r3),r2
	jsr	@r2
	nop
	mov.l	r0,@(36,r15)
	mov	#0,r4
	mov.l	.L0600573C,r11
	mov	#35,r0
	mov.b	r4,@(r0,r15)
	mov	r4,r5
	mova	.L060056F0,r0
	add	r0,r11
.L060056F0:
	mov.l	@r15,r0
	mov	r15,r4
	add	#12,r4
	cmp/eq	#1,r0
	bt	.L06005702
	cmp/eq	#2,r0
	bt	.L0600574C
	bra	.L06005772
	nop
.L06005702:
	mov.l	.L06005740,r5
	jsr	@r11
	nop
	mov.l	.L06005744,r5
	mov	r15,r4
	add	#24,r4
	jsr	@r11
	nop
	mov	#0,r7
	mov.l	.L06005748,r0
	mov	r15,r5
	mov.w	.L06005732,r3
	mov	r12,r6
	mov.l	r3,@(40,r15)
	add	#12,r5
	mov.l	@r10,r2
	shll2	r6
	mov.l	@(16,r2),r3
	mov.l	@(r0,r6),r6
	jsr	@r3
	mov	r12,r4
	bra	.L06005770
	nop
.L06005730:
	.short 0x00E8
.L06005732:
	.short 0x0740
.L06005734:
	.long D_06064F98
.L06005738:
	.long BIOS_VECTORS + 0x54
.L0600573C:
	.long 0x0004B1A4
.L06005740:
	.long D_06051260
.L06005744:
	.long D_06051278
.L06005748:
	.long D_06051290
.L0600574C:
	mov.l	.L06005818,r5
	jsr	@r11
	nop
	mov	r15,r4
	mov.l	.L0600581C,r5
	add	#24,r4
	jsr	@r11
	nop
	mov.w	.L06005814,r2
	mov	#0,r7
	mov.l	.L06005820,r6
	mov	r15,r5
	mov.l	r2,@(40,r15)
	add	#12,r5
	mov.l	@r10,r3
	mov.l	@(16,r3),r2
	jsr	@r2
	mov	r12,r4
.L06005770:
	mov	r0,r5
.L06005772:
	mov.b	@r13,r3
	extu.b	r3,r3
	and	r14,r3
	cmp/eq	r14,r3
	bt	.L06005772
	mov.b	r14,@r13
	mov	#25,r3
	mov.l	.L06005824,r2
	mov.b	r3,@r2
.L06005784:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L06005784
	mov	r5,r0
	add	#60,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel bup_write_save

	glabel func_0600579E
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	#1,r14
	sts.l	pr,@-r15
	add	#-16,r15
	mov.l	.L06005828,r13
	mov.l	r4,@r15
.L060057AC:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L060057AC
	mov	#26,r2
	mov.l	.L06005824,r3
	mov.b	r14,@r13
	mov.b	r2,@r3
.L060057BE:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L060057BE
	mov	r5,r0
	cmp/eq	#1,r0
	bt	.L060057D4
	cmp/eq	#2,r0
	bt	.L060057E0
	bra	.L060057F0
	nop
.L060057D4:
	mov.l	.L0600582C,r2
	mov.l	@r2,r3
	mov.l	.L06005830,r5
	mov.l	@(24,r3),r1
	bra	.L060057EA
	nop
.L060057E0:
	mov.l	.L0600582C,r3
	mov.l	@r3,r2
	mov.l	.L06005818,r5
	add	#24,r2
	mov.l	@r2,r1
.L060057EA:
	mov.l	@r15,r4
	jsr	@r1
	nop
.L060057F0:
	mov.b	@r13,r3
	extu.b	r3,r3
	and	r14,r3
	cmp/eq	r14,r3
	bt	.L060057F0
	mov	#25,r3
	mov.l	.L06005824,r2
	mov.b	r14,@r13
	mov.b	r3,@r2
.L06005802:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L06005802
	add	#16,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L06005814:
	.short 0x3100
	.byte 0x00, 0x00
.L06005818:
	.long D_0605126C
.L0600581C:
	.long D_06051284
.L06005820:
	.long D_002FC000
.L06005824:
	.long SMPC_REGS + 0x1F
.L06005828:
	.long SMPC_REGS + 0x63
.L0600582C:
	.long BIOS_VECTORS + 0x54
.L06005830:
	.long D_06051260
	endlabel func_0600579E

	glabel func_06005834
	mov.l	r14,@-r15
	mov	#1,r14
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.l	.L06005970,r13
	add	#-16,r15
	mov.l	r4,@r15
.L06005842:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L06005842
	mov.b	r14,@r13
	mov	#26,r2
	mov.l	.L06005974,r3
	mov.b	r2,@r3
.L06005854:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L06005854
	mov.l	.L06005978,r2
	mov.l	@r2,r3
	mov.l	@r15,r6
	mov.l	@(20,r3),r1
	mov.l	.L0600597C,r0
	shll2	r6
	mov.l	.L06005980,r5
	mov.l	@(r0,r6),r6
	mov.l	@r15,r4
	jsr	@r1
	nop
	mov	r0,r4
.L06005874:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L06005874
	mov	#25,r2
	mov.l	.L06005974,r3
	mov.b	r14,@r13
	mov.b	r2,@r3
.L06005886:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L06005886
	mov	r4,r0
	add	#16,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel func_06005834

	glabel func_0600589A
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	#1,r14
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	mov.l	.L06005970,r13
	add	#-16,r15
	mov.l	r4,@r15
.L060058AA:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L060058AA
	mov.b	r14,@r13
	mov	#26,r2
	mov.l	.L06005974,r3
	mov.b	r2,@r3
.L060058BC:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L060058BC
	mov.l	@r15,r2
	tst	r2,r2
	bf	.L060058CE
	bra	.L060058D0
	mov	r14,r12
.L060058CE:
	mov	#0,r12
.L060058D0:
	mov.l	.L06005978,r3
	mov	r12,r6
	mov.l	.L0600597C,r0
	shll2	r6
	mov.l	.L06005980,r5
	mov.l	@r3,r2
	mov.l	@(r0,r6),r6
	mov.l	@(20,r2),r1
	mov.l	@r15,r4
	jsr	@r1
	nop
	mov	r0,r4
.L060058E8:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L060058E8
	mov	#25,r2
	mov.l	.L06005974,r3
	mov.b	r14,@r13
	mov.b	r2,@r3
.L060058FA:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L060058FA
	mov	r4,r0
	add	#16,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel func_0600589A

	glabel func_06005910
	mov.l	r14,@-r15
	mov	#1,r14
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.l	.L06005970,r13
	add	#-16,r15
	mov.l	r4,@r15
.L0600591E:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L0600591E
	mov.b	r14,@r13
	mov	#26,r2
	mov.l	.L06005974,r3
	mov.b	r2,@r3
.L06005930:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L06005930
	mov.l	.L06005978,r2
	mov.l	@r2,r3
	mov.l	.L06005984,r6
	mov.l	@(20,r3),r1
	mov.l	.L06005988,r5
	mov.l	@r15,r4
	jsr	@r1
	nop
	mov	r0,r4
.L0600594A:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L0600594A
	mov.b	r14,@r13
	mov	#25,r2
	mov.l	.L06005974,r3
	mov.b	r2,@r3
.L0600595C:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L0600595C
	mov	r4,r0
	add	#16,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L06005970:
	.long SMPC_REGS + 0x63
.L06005974:
	.long SMPC_REGS + 0x1F
.L06005978:
	.long BIOS_VECTORS + 0x54
.L0600597C:
	.long D_06051290
.L06005980:
	.long D_06051260
.L06005984:
	.long D_002FC000
.L06005988:
	.long D_0605126C
	endlabel func_06005910

	glabel bup_check_devices
	mov.l	r14,@-r15
	mov	#1,r14
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	add	#-36,r15
	mov.l	.L06005A68,r13
.L060059A2:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L060059A2
	mov.b	r14,@r13
	mov	#26,r2
	mov.l	.L06005A6C,r3
	mov.b	r2,@r3
.L060059B4:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L060059B4
	mov.l	.L06005A70,r3
	mov	#0,r12
	mov.l	.L06005A74,r8
	mov.b	r12,@r3
	mov.b	r12,@r8
	add	#-2,r3
	mov.l	.L06005A78,r2
	mov.w	r12,@r2
	mov.l	.L06005A7C,r1
	mov.w	r12,@r1
	mov.l	.L06005A80,r10
	mov.l	r12,@r10
	mov.l	.L06005A84,r11
	mov.b	@r3,r0
	tst	r0,r0
	bt	.L06005A3A
	mov.l	@r11,r2
	mov	r15,r6
	mov.w	.L06005A60,r5
	mov	r12,r9
	mov.l	@(12,r2),r0
	jsr	@r0
	mov	#0,r4
	cmp/eq	#2,r0
	bf/s	.L060059FC
	mov	r0,r4
	mov.l	@r10,r2
	or	r14,r2
	mov.l	r2,@r10
	mov.l	.L06005A70,r3
	bra	.L06005A3A
	mov.b	r12,@r3
.L060059FC:
	mov.l	@(20,r15),r2
	mov	#0,r1
	cmp/hi	r1,r2
	bf	.L06005A32
	mov.l	@r11,r2
	mov	r15,r6
	mov.w	.L06005A62,r5
	mov	r14,r9
	mov.l	@(12,r2),r3
	jsr	@r3
	mov	r1,r4
	mov	#0,r2
	mov.l	@(20,r15),r3
	cmp/hi	r2,r3
	bf	.L06005A32
	mov	#2,r9
	mov.l	@r11,r3
	mov	r15,r6
	mov.w	.L06005A64,r5
	mov.l	@(12,r3),r1
	jsr	@r1
	mov	r2,r4
	mov.l	@(20,r15),r1
	mov	#0,r3
	cmp/hi	r3,r1
	bf	.L06005A32
	mov	#3,r9
.L06005A32:
	mov.l	.L06005A78,r3
	mov.l	.L06005A70,r2
	mov.w	r9,@r3
	mov.b	r14,@r2
.L06005A3A:
	mov.l	.L06005A88,r3
	mov.b	@r3,r0
	tst	r0,r0
	bt	.L06005AC8
	mov	r12,r9
	mov.l	@r11,r2
	mov	r15,r6
	mov.w	.L06005A60,r5
	mov.l	@(12,r2),r1
	jsr	@r1
	mov	#1,r4
	cmp/eq	#2,r0
	bf/s	.L06005A8C
	mov	r0,r4
	mov.l	@r10,r0
	or	#2,r0
	mov.l	r0,@r10
	bra	.L06005AC8
	mov.b	r12,@r8
.L06005A60:
	.short 0x0740
.L06005A62:
	.short 0x3100
.L06005A64:
	.short 0x3840
	.byte 0x00, 0x00
.L06005A68:
	.long SMPC_REGS + 0x63
.L06005A6C:
	.long SMPC_REGS + 0x1F
.L06005A70:
	.long D_060CB042
.L06005A74:
	.long D_060CB043
.L06005A78:
	.long D_060CB048
.L06005A7C:
	.long D_060CB04A
.L06005A80:
	.long D_06064F94
.L06005A84:
	.long BIOS_VECTORS + 0x54
.L06005A88:
	.long D_060CB041
.L06005A8C:
	mov.l	@(20,r15),r2
	mov	#0,r3
	cmp/hi	r3,r2
	bf	.L06005AC2
	mov.l	@r11,r2
	mov	r15,r6
	mov.w	.L06005B86,r5
	mov	r14,r9
	mov.l	@(12,r2),r1
	jsr	@r1
	mov	#1,r4
	mov	#0,r3
	mov.l	@(20,r15),r2
	cmp/hi	r3,r2
	bf	.L06005AC2
	mov	#2,r9
	mov.l	@r11,r2
	mov	r15,r6
	mov.w	.L06005B88,r5
	mov.l	@(12,r2),r1
	jsr	@r1
	mov	#1,r4
	mov.l	@(20,r15),r2
	mov	#0,r3
	cmp/hi	r3,r2
	bf	.L06005AC2
	mov	#3,r9
.L06005AC2:
	mov.l	.L06005B8C,r3
	mov.w	r9,@r3
	mov.b	r14,@r8
.L06005AC8:
	mov.b	@r13,r3
	extu.b	r3,r3
	and	r14,r3
	cmp/eq	r14,r3
	bt	.L06005AC8
	mov	#25,r3
	mov.l	.L06005B90,r2
	mov.b	r14,@r13
	mov.b	r3,@r2
.L06005ADA:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L06005ADA
	mov.l	@r10,r0
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
	endlabel bup_check_devices

	glabel func_06005AF8
	mov.l	r14,@-r15
	mov	#1,r14
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	sts.l	pr,@-r15
	mov.l	.L06005B94,r13
.L06005B06:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L06005B06
	mov.b	r14,@r13
	mov	#26,r2
	mov.l	.L06005B90,r3
	mov.b	r2,@r3
.L06005B18:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L06005B18
	mov.l	.L06005B98,r2
	mov	#0,r11
	mov.l	@r2,r3
	tst	r14,r3
	bt/s	.L06005B40
	mov	r11,r12
	mov.l	.L06005B9C,r1
	mov.l	@r1,r12
	mov.l	@(8,r12),r12
	jsr	@r12
	mov	#0,r4
	mov	r0,r12
	tst	r12,r12
	bf	.L06005B40
	mov.l	.L06005BA0,r3
	mov.b	r14,@r3
.L06005B40:
	mov.l	.L06005B98,r2
	mov.l	@r2,r0
	tst	#2,r0
	bt	.L06005B5C
	mov.l	.L06005B9C,r3
	mov.l	@r3,r11
	mov.l	@(8,r11),r11
	jsr	@r11
	mov	#1,r4
	mov	r0,r11
	tst	r11,r11
	bf	.L06005B5C
	mov.l	.L06005BA4,r3
	mov.b	r14,@r3
.L06005B5C:
	mov.b	@r13,r1
	extu.b	r1,r1
	and	r14,r1
	cmp/eq	r14,r1
	bt	.L06005B5C
	mov	#25,r2
	mov.l	.L06005B90,r3
	mov.b	r14,@r13
	mov.b	r2,@r3
.L06005B6E:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L06005B6E
	mov	r12,r0
	lds.l	@r15+,pr
	or	r11,r0
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L06005B86:
	.short 0x3100
.L06005B88:
	.short 0x3840
	.byte 0x00, 0x00
.L06005B8C:
	.long D_060CB04A
.L06005B90:
	.long SMPC_REGS + 0x1F
.L06005B94:
	.long SMPC_REGS + 0x63
.L06005B98:
	.long D_06064F94
.L06005B9C:
	.long BIOS_VECTORS + 0x54
.L06005BA0:
	.long D_060CB042
.L06005BA4:
	.long D_060CB043
	endlabel func_06005AF8

	glabel func_06005BA8
	mov.l	r14,@-r15
	mov	#1,r14
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	add	#-92,r15
	mov.l	.L06005D88,r12
.L06005BBE:
	mov.b	@r12,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L06005BBE
	mov.b	r14,@r12
	mov	#26,r2
	mov.l	.L06005D8C,r3
	mov.b	r2,@r3
.L06005BD0:
	mov.b	@r12,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L06005BD0
	mov.l	.L06005D90,r10
	mov	#0,r11
	mov	r11,r13
	mov	#2,r9
.L06005BE0:
	mov.l	.L06005D94,r0
	mov	r11,r8
	mov.l	r8,@(8,r15)
	mov.l	r11,@(4,r15)
	mov.l	r11,@r15
	mov.b	@(r0,r13),r1
	tst	r1,r1
	bt	.L06005C50
	mov.l	@r10,r3
	mov	#10,r6
	mov.l	.L06005D9C,r5
	mov.l	@(28,r3),r2
	mov.l	.L06005D98,r7
	jsr	@r2
	mov	r13,r4
	mov	r0,r4
	cmp/pl	r4
	bf	.L06005C24
	mov.l	r14,@r15
	mov	r13,r6
	mov.l	.L06005DA0,r0
	shll2	r6
	mov.l	.L06005D9C,r5
	mov.l	@r10,r3
	mov.l	@(r0,r6),r6
	mov.l	@(20,r3),r2
	jsr	@r2
	mov	r13,r4
	tst	r0,r0
	bf	.L06005C22
	mov.l	r14,@(8,r15)
	bra	.L06005C24
	nop
.L06005C22:
	mov.l	r11,@(8,r15)
.L06005C24:
	mov.l	@r10,r3
	mov	#10,r6
	mov.l	.L06005DA4,r5
	mov.l	@(28,r3),r2
	mov.l	.L06005D98,r7
	jsr	@r2
	mov	r13,r4
	mov	r0,r4
	cmp/pl	r4
	bf	.L06005C50
	mov.l	r9,@(4,r15)
	mov.l	@r10,r3
	mov.l	.L06005DA8,r6
	mov.l	@(20,r3),r2
	mov.l	.L06005DA4,r5
	jsr	@r2
	mov	r13,r4
	tst	r0,r0
	bf	.L06005C4E
	bra	.L06005C50
	mov	r9,r8
.L06005C4E:
	mov	r11,r8
.L06005C50:
	mov.l	@r15,r2
	mov.l	@(4,r15),r3
	mov.l	.L06005DAC,r0
	or	r3,r2
	mov.b	r2,@(r0,r13)
	mov.l	@(8,r15),r3
	mov.l	.L06005DB0,r0
	or	r8,r3
	mov.b	r3,@(r0,r13)
	add	#1,r13
	cmp/ge	r9,r13
	bf	.L06005BE0
.L06005C68:
	mov.b	@r12,r3
	extu.b	r3,r3
	and	r14,r3
	cmp/eq	r14,r3
	bt	.L06005C68
	mov	#25,r3
	mov.l	.L06005D8C,r2
	mov.b	r14,@r12
	mov.b	r3,@r2
.L06005C7A:
	mov.b	@r12,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L06005C7A
	add	#92,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel func_06005BA8

	glabel bup_scan_save_files
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	#1,r14
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	.L06005D88,r13
	add	#-80,r15
.L06005CAC:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L06005CAC
	mov	#26,r2
	mov.l	.L06005D8C,r3
	mov.b	r14,@r13
	mov.b	r2,@r3
.L06005CBE:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L06005CBE
	mov	#0,r12
	mov.l	.L06005D90,r10
	mov	#2,r11
.L06005CCC:
	mov.l	.L06005D94,r0
	mov	#0,r8
	mov.b	@(r0,r12),r0
	tst	r0,r0
	bt/s	.L06005D04
	mov	r8,r9
	mov.l	@r10,r3
	mov	#10,r6
	mov.l	.L06005D9C,r5
	mov.l	@(28,r3),r2
	mov.l	.L06005D98,r7
	jsr	@r2
	mov	r12,r4
	mov	r0,r4
	cmp/pl	r4
	bf/s	.L06005CF0
	mov.l	@r10,r2
	mov	r14,r9
.L06005CF0:
	mov.l	@(28,r2),r3
	mov	#10,r6
	mov.l	.L06005DA4,r5
	mov.l	.L06005D98,r7
	jsr	@r3
	mov	r12,r4
	mov	r0,r4
	cmp/pl	r4
	bf	.L06005D04
	mov	r11,r8
.L06005D04:
	mov.l	.L06005DAC,r0
	or	r8,r9
	mov.b	r9,@(r0,r12)
	add	#1,r12
	cmp/ge	r11,r12
	bf	.L06005CCC
.L06005D10:
	mov.b	@r13,r3
	extu.b	r3,r3
	and	r14,r3
	cmp/eq	r14,r3
	bt	.L06005D10
	mov	#25,r3
	mov.l	.L06005D8C,r2
	mov.b	r14,@r13
	mov.b	r3,@r2
.L06005D22:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L06005D22
	add	#80,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel bup_scan_save_files

	glabel func_06005D3E
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r14
	sts.l	pr,@-r15
	tst	r14,r14
	bf	.L06005D4E
	bra	.L06005D50
	mov	#1,r13
.L06005D4E:
	mov	#0,r13
.L06005D50:
	mov	r5,r0
	cmp/eq	#0,r0
	bt	.L06005D5E
	cmp/eq	#1,r0
	bt	.L06005D72
	bra	.L06005D7C
	nop
.L06005D5E:
	mov	#1,r5
	bsr	bup_write_save
	mov	r14,r4
	bsr	func_0600589A
	mov	r14,r4
	mov	#1,r5
	bsr	bup_write_save
	mov	r13,r4
	bra	.L06005D7C
	nop
.L06005D72:
	bsr	func_06005910
	mov	r14,r4
	mov	#2,r5
	bsr	bup_write_save
	mov	r13,r4
.L06005D7C:
	bsr	bup_check_devices
	nop
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	bra	bup_scan_save_files
	mov.l	@r15+,r14
.L06005D88:
	.long SMPC_REGS + 0x63
.L06005D8C:
	.long SMPC_REGS + 0x1F
.L06005D90:
	.long BIOS_VECTORS + 0x54
.L06005D94:
	.long D_060CB040
.L06005D98:
	.long D_06064CC4
.L06005D9C:
	.long D_06051260
.L06005DA0:
	.long D_06051290
.L06005DA4:
	.long D_0605126C
.L06005DA8:
	.long D_002FC000
.L06005DAC:
	.long D_060CB044
.L06005DB0:
	.long D_060CB046
	endlabel func_06005D3E

	glabel func_06005DB4
	mov.l	r14,@-r15
	mov	#1,r14
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.l	.L06005E14,r13
	add	#-16,r15
	mov.l	r4,@r15
.L06005DC2:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L06005DC2
	mov.b	r14,@r13
	mov	#26,r2
	mov.l	.L06005E18,r3
	mov.b	r2,@r3
.L06005DD4:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L06005DD4
	mov.l	.L06005E1C,r2
	mov.l	@r2,r3
	mov.l	.L06005E20,r5
	mov.l	@(24,r3),r1
	mov.l	@r15,r4
	jsr	@r1
	nop
.L06005DEA:
	mov.b	@r13,r2
	extu.b	r2,r2
	and	r14,r2
	cmp/eq	r14,r2
	bt	.L06005DEA
	mov.b	r14,@r13
	mov	#25,r2
	mov.l	.L06005E18,r3
	mov.b	r2,@r3
.L06005DFC:
	mov.b	@r13,r0
	extu.b	r0,r0
	tst	r14,r0
	bf	.L06005DFC
	bsr	bup_check_devices
	nop
	add	#16,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	bra	bup_scan_save_files
	mov.l	@r15+,r14
	.byte 0x00, 0x00
.L06005E14:
	.long SMPC_REGS + 0x63
.L06005E18:
	.long SMPC_REGS + 0x1F
.L06005E1C:
	.long BIOS_VECTORS + 0x54
.L06005E20:
	.long D_0605126C
	endlabel func_06005DB4

	glabel func_06005E24
	sts.l	pr,@-r15
	lds.l	@r15+,pr
	mov.l	.L06005E4C,r4
	mov.w	.L06005E4A,r7
	mov.l	.L06005E50,r2
	mov.l	.L06005E54,r3
.L06005E30:
	mov.l	@r2,r0
	tst	r3,r0
	bf	.L06005E30
	mov	#0,r0
	mov.l	r0,@r2
	mov.l	r0,@r2
	add	#4,r2
.L06005E3E:
	mov.l	@r4+,r0
	mov.l	r0,@r2
	dt	r7
	bf	.L06005E3E
	rts
	nop
.L06005E4A:
	.short 0x00FF
.L06005E4C:
	.long D_06005EC8
.L06005E50:
	.long SCU_REGS + 0x80
.L06005E54:
	.long 0x00800000
	endlabel func_06005E24

	.section .data.06005E58,"aw",@progbits
	.p2align 2
	.byte 0xD2, 0x07, 0xD3, 0x08, 0x60, 0x22, 0x20, 0x38, 0x8B, 0xFC, 0xE0, 0x00, 0x22, 0x02, 0x72, 0x08
	.byte 0x22, 0x52, 0x72, 0x04, 0x60, 0x46, 0x22, 0x02, 0x47, 0x10, 0x8B, 0xFB, 0x00, 0x0B, 0x00, 0x09
	.long SCU_REGS + 0x80
	.byte 0x00, 0x80, 0x00, 0x00, 0xD2, 0x06, 0xD3, 0x07, 0x60, 0x22, 0x20, 0x38, 0x8B, 0xFC, 0xE0, 0x00
	.byte 0x22, 0x02, 0xD0, 0x05, 0x22, 0x02, 0xD0, 0x05, 0x22, 0x02, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x00
	.long SCU_REGS + 0x80
	.byte 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x01, 0x00, 0x00, 0xD2, 0x04, 0xD3, 0x05
	.byte 0x60, 0x22, 0x20, 0x38, 0x8B, 0xFC, 0xE0, 0x00, 0x22, 0x02, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x00
	.long SCU_REGS + 0x80
	.byte 0x00, 0x80, 0x00, 0x00
	dlabel D_06005EC8
	.byte 0x00, 0x00, 0x1E, 0x00, 0x88, 0x01, 0x82, 0x70, 0x88, 0x09, 0x78, 0x16, 0x00, 0x00, 0x1E, 0x00
	.byte 0x90, 0x00, 0x01, 0x00, 0x00, 0x08, 0x80, 0x00, 0x01, 0x02, 0x00, 0x00, 0x10, 0x00, 0x32, 0x09
	.byte 0x00, 0x08, 0x80, 0x00, 0x01, 0x02, 0x00, 0x00, 0x10, 0x00, 0x32, 0x09, 0x00, 0x00, 0x1E, 0x02
	.byte 0x88, 0x00, 0x02, 0x68, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x36, 0x02
	.byte 0xC0, 0x01, 0x00, 0x40, 0x00, 0x86, 0x95, 0x40, 0x10, 0x04, 0x32, 0x09, 0x00, 0x00, 0x1C, 0x00
	.byte 0x00, 0x00, 0x37, 0x02, 0xC0, 0x00, 0x90, 0x40, 0x00, 0x86, 0x95, 0x40, 0x10, 0x04, 0x32, 0x09
	.byte 0x00, 0x86, 0x95, 0x01, 0x14, 0x04, 0x32, 0x09, 0xD2, 0x08, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x72, 0x00, 0x00, 0x01, 0x81, 0xC0, 0x00, 0x00, 0x00, 0x03, 0x80
	.byte 0x7B, 0xDE, 0x7B, 0xDE, 0x84, 0x21, 0x84, 0x21, 0xD0, 0x01, 0x00, 0x0B, 0x40, 0x1E, 0x00, 0x00
	.long gbr_block
	.byte 0x41, 0x43, 0x54, 0x00, 0xD2, 0x1C, 0xE3, 0x10, 0x22, 0x30, 0xE3, 0x01, 0x22, 0x30, 0xDF, 0x1B
	.byte 0xD0, 0x1B, 0x40, 0x1E, 0xE0, 0x00, 0xC1, 0x1B, 0xC0, 0x2C, 0xC0, 0x2D, 0xD2, 0x19, 0x60, 0x20
	.byte 0xE0, 0x00, 0x22, 0x00, 0xD8, 0x18, 0xE9, 0xFF, 0x28, 0x91, 0xD3, 0x18, 0x64, 0x32, 0xD2, 0x15
	.byte 0x91, 0x20, 0x60, 0x20, 0x20, 0x18, 0x8D, 0xFC, 0x74, 0x01, 0xE1, 0x00, 0x22, 0x10, 0x60, 0x32
	.byte 0x40, 0x11, 0x89, 0x00, 0xE4, 0x00, 0x23, 0x42, 0xD0, 0x0D, 0x40, 0x1E, 0xC4, 0x2C, 0x68, 0x03
	.byte 0xC4, 0x2D, 0x30, 0x80, 0x89, 0x1E, 0x68, 0x03, 0x70, 0x01, 0xC9, 0x07, 0xC0, 0x2D, 0xD3, 0x0C
	.byte 0x48, 0x08, 0x48, 0x00, 0x33, 0x8C, 0x68, 0x36, 0x60, 0x83, 0xC2, 0x0A, 0x48, 0x0B, 0x00, 0x09
	.byte 0xA0, 0x36, 0x00, 0x09, 0x00, 0x80, 0x00, 0x00, 0xFF, 0xFF, 0xFE, 0x92
	.long BIOS_WORK_HI + 0xC00
	.long gbr_block + 0x20000000
	.byte 0xFF, 0xFF, 0xFE, 0x11, 0x21, 0x80, 0x00, 0x00
	.long D_060FFED8 + 0x20000000
	.long slave_job_ring + 0x20000000
	.byte 0xC5, 0x1B, 0x20, 0x08, 0x89, 0x29, 0x40, 0x11, 0x89, 0x10, 0xD5, 0x06, 0xD4, 0x06, 0x63, 0x43
	.byte 0xE7, 0x11, 0x68, 0x56, 0x69, 0x56, 0x24, 0x92, 0x47, 0x10, 0x8F, 0xFB, 0x74, 0x04, 0xE0, 0x00
	.byte 0xA0, 0x10, 0xC0, 0x36
	.long D_060FE3FC + 0x20000000
	.long D_060FE92C
	.byte 0xD5, 0x0D, 0xD4, 0x0E, 0x63, 0x43, 0xE7, 0x11, 0x68, 0x56, 0x69, 0x56, 0x24, 0x92, 0x47, 0x10
	.byte 0x8F, 0xFB, 0x74, 0x04, 0xE0, 0x00, 0xC0, 0x37, 0x60, 0x83, 0xC2, 0x0A, 0x48, 0x0B, 0x00, 0x09
	.byte 0xE0, 0x00, 0xC2, 0x0A, 0xD2, 0x06, 0x91, 0x06, 0x60, 0x20, 0x20, 0x18, 0x8B, 0xAC, 0xD2, 0x04
	.byte 0xE1, 0x00, 0xAF, 0x97, 0x22, 0x10, 0x00, 0x80
	.long D_060FE444 + 0x20000000
	.long D_060FE92C
	.byte 0xFF, 0xFF, 0xFE, 0x11
