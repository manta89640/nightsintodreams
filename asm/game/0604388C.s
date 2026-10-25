	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0604388C,"ax",@progbits
	.p2align 2

	glabel func_0604388C
	sts.l	pr,@-r15
	cmp/eq	#30,r0
	bt	.L060438A8
	mov.l	.L06043898,r0
	jmp	@r0
	nop
.L06043898:
	.long lbl_06042898
	.byte 0xD0, 0x01, 0x40, 0x2B, 0x00, 0x09, 0x00, 0x00
	.long func_0600D1A0
.L060438A8:
	mov	#2,r0
	mov.l	.L060438B0,r2
	jmp	@r2
	mov.b	r0,@(1,r1)
.L060438B0:
	.long lbl_06042898
	endlabel func_0604388C

	glabel func_060438B4
	mov.l	.L0604391C,r2
	mov.l	r2,@(44,r1)
	xor	r0,r0
	mov.w	r0,@(14,r1)
	mov.w	r0,@(20,r1)
	mov.l	.L06043920,r0
	mov.l	r0,@(0,r1)
	mov.l	.L06043924,r0
	mov.l	r0,@(4,r1)
	mov	r1,r2
	add	#64,r2
	mov.l	.L06043928,r4
	mov.l	@(752,gbr),r0
	mov.l	.L0604392C,r3
	mul.l	r0,r3
	sts	macl,r3
	mov.l	.L06043930,r0
	add	r3,r0
	mov.l	r0,@(752,gbr)
	and	r4,r3
	mov.l	r3,@(0,r2)
	mov.l	@(752,gbr),r0
	mov.l	.L0604392C,r3
	mul.l	r0,r3
	sts	macl,r3
	mov.l	.L06043930,r0
	add	r3,r0
	mov.l	r0,@(752,gbr)
	and	r4,r3
	mov.l	r3,@(4,r2)
	mov.l	@(752,gbr),r0
	mov.l	.L0604392C,r3
	mul.l	r0,r3
	sts	macl,r3
	mov.l	.L06043930,r0
	add	r3,r0
	mov.l	r0,@(752,gbr)
	and	r4,r3
	mov.l	r3,@(8,r2)
	mov.l	@(752,gbr),r0
	mov.l	.L0604392C,r3
	mul.l	r0,r3
	sts	macl,r3
	mov.l	.L06043930,r0
	add	r3,r0
	mov.l	r0,@(752,gbr)
	and	r4,r3
	mov.l	r3,@(12,r2)
	mov.l	.L06043934,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L0604391C:
	.long D_06013FCE
.L06043920:
	.long 0x000E1C2A
.L06043924:
	.long 0x38465462
.L06043928:
	.long 0x7FFF7FFF
.L0604392C:
	.long 0x41C64E6D
.L06043930:
	.long 0x00003039
.L06043934:
	.long func_06043938
	endlabel func_060438B4

	glabel func_06043938
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L060439C0
	endlabel func_06043938

	glabel func_0604393E
	sts.l	pr,@-r15
	mov	#0,r0
.L06043942:
	mov.l	r0,@-r15
	mov.l	@(32,r1),r3
	mov.b	@(r0,r1),r4
	mov	#56,r5
	cmp/gt	r5,r4
	bf	.L06043954
	sub	r5,r4
	sub	r4,r5
	mov	r5,r4
.L06043954:
	shll16	r4
	add	r4,r3
	mov.l	r3,@(60,r1)
	shll	r0
	mov	r1,r2
	add	#64,r2
	mov.l	.L060439A4,r3
	jsr	@r3
	mov.w	@(r0,r2),r0
	mov.l	.L060439A8,r0
	dmuls.l	r10,r0
	sts	mach,r10
	sts	macl,r0
	xtrct	r10,r0
	mov.l	@(36,r1),r3
	add	r3,r0
	mov.l	.L060439AC,r2
	jsr	@r2
	mov.l	r0,@(52,r1)
	mov.l	.L060439B0,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L060439B4,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L060439B8,r0
	jsr	@r0
	nop
	mov.l	.L060439BC,r0
	jsr	@r0
	nop
	mov.l	@r15+,r0
	add	#1,r0
	cmp/eq	#8,r0
	bf	.L06043942
	lds.l	@r15+,pr
	rts
	nop
.L060439A4:
	.long func_06007C08
.L060439A8:
	.long 0xFE200000
.L060439AC:
	.long func_06018E8C
.L060439B0:
	.long func_0600CA24
.L060439B4:
	.long func_0600CBDA
.L060439B8:
	.long func_060208FA
.L060439BC:
	.long func_0600CA4E
.L060439C0:
	mov.w	.L060439F6,r3
	mov.w	.L060439F8,r14
	mov	r1,r2
	add	#64,r2
	mov	#0,r0
.L060439CA:
	mov.w	@(r0,r2),r4
	add	r3,r4
	and	r14,r4
	mov.w	r4,@(r0,r2)
	add	#2,r0
	cmp/eq	#16,r0
	bf	.L060439CA
	mov.w	.L060439FA,r14
	mov	#0,r0
.L060439DC:
	mov.b	@(r0,r1),r4
	add	#1,r4
	cmp/eq	r14,r4
	bf	.L060439E6
	xor	r4,r4
.L060439E6:
	mov.b	r4,@(r0,r1)
	add	#1,r0
	cmp/eq	#8,r0
	bf	.L060439DC
	mov.l	.L060439FC,r2
	mov.l	.L06043A00,r0
	jmp	@r0
	nop
.L060439F6:
	.short 0x0200
.L060439F8:
	.short 0x7FFF
.L060439FA:
	.short 0x0070
.L060439FC:
	.long D_06014076
.L06043A00:
	.long func_0601EF98
	endlabel func_0604393E

	.section .data.06043A04,"aw",@progbits
	.p2align 2
	.byte 0x85, 0x13, 0x40, 0x10, 0x89, 0x08, 0x81, 0x13
