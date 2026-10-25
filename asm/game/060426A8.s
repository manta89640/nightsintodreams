	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060426A8,"ax",@progbits
	.p2align 2

	glabel func_060426A8
	mov.w	r0,@(r0,r6)
	mov.b	r10,@-r9
	mov.w	r0,@(r0,r6)
	mov.b	r11,@-r9
	dlabel lbl_060426B0
	mov.l	.L060426E8,r0
	mov.l	r0,@(48,r1)
	mov.l	.L060426EC,r0
	mov.l	r0,@(52,r1)
	mov.l	.L060426F0,r0
	mov.l	r0,@(56,r1)
	mov.l	.L060426F4,r0
	mov.l	r0,@(44,r1)
	mov.l	.L060426F8,r0
	mov.l	r0,@(60,r1)
	mov.l	.L060426FC,r14
	mov.b	@(7,r14),r0
	add	#-1,r0
	mov.l	r0,@(0,r1)
	xor	r0,r0
	mov.l	r0,@(4,r1)
	mov.l	r0,@(8,r1)
	mov	#1,r0
	mov.l	r0,@(32,r1)
	mov	#8,r0
	mov.l	r0,@(16,r1)
	mov.w	.L060426E6,r0
	mov.w	r0,@(22,r1)
	mov.l	.L06042700,r0
	mov.l	r0,@-r1
	rts
	add	#4,r1
.L060426E6:
	.short 0x0100
.L060426E8:
	.long 0x00480000
.L060426EC:
	.long 0x00CC0000
.L060426F0:
	.long 0x00000000
.L060426F4:
	.long D_0601467E
.L060426F8:
	.long D_06042838
.L060426FC:
	.long D_060FFE50
.L06042700:
	.long func_06042704
	endlabel func_060426A8

	glabel func_06042704
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L060427D6
	mov.b	@(35,gbr),r0
	tst	r0,r0
	bt	.L06042714
	bra	.L060427D6
	nop
.L06042714:
	sts.l	pr,@-r15
	mov.l	.L06042750,r14
	mov.b	@(7,r14),r0
	mov	r0,r4
	mov.l	@(0,r1),r2
	cmp/eq	r4,r2
	bt	.L0604275C
	mov.l	r4,@(0,r1)
	mov	#99,r13
	cmp/gt	r13,r0
	bf	.L0604272C
	mov	r13,r0
.L0604272C:
	mov.l	.L06042754,r13
	add	#-50,r0
	mov.w	r0,@r13
	mov.l	.L06042758,r13
	mov.w	r0,@r13
	cmp/gt	r4,r2
	bt	.L060427A8
	cmp/gt	r2,r4
	mov.w	.L0604274E,r0
	mov.w	r0,@(22,r1)
	mov	#8,r0
	mov.l	r0,@(16,r1)
	mov	#0,r0
	mov.l	r0,@(8,r1)
	mov	#24,r0
	bra	.L060427B0
	mov.l	r0,@(4,r1)
.L0604274E:
	.short 0x0130
.L06042750:
	.long D_060FFE50
.L06042754:
	.long D_0604283E
.L06042758:
	.long D_06042844
.L0604275C:
	mov.l	@(4,r1),r3
	tst	r3,r3
	bf	.L060427B0
.L06042762:
	mov.w	@(22,r1),r0
	mov.w	.L06042798,r2
	cmp/gt	r2,r0
	bf	.L0604277E
	add	#-3,r0
	mov.w	r0,@(22,r1)
	mov.l	.L060427A0,r13
	mov.w	r0,@r13
	add	#6,r13
	mov.w	r0,@r13
	add	#6,r13
	mov.w	r0,@r13
	add	#6,r13
	mov.w	r0,@r13
.L0604277E:
	xor	r0,r0
	mov.w	r0,@(20,r1)
	mov.w	.L0604279A,r0
	mov.l	.L060427A4,r2
	jsr	@r2
	mov.w	r0,@(28,r1)
	mov	#1,r0
	mov.w	r0,@(20,r1)
	mov.w	.L0604279C,r0
	lds.l	@r15+,pr
	mov.l	.L060427A4,r2
	jmp	@r2
	mov.w	r0,@(28,r1)
.L06042798:
	.short 0x0100
.L0604279A:
	.short 0x1FEE
.L0604279C:
	.short 0x1FEF
	.byte 0x00, 0x00
.L060427A0:
	.long D_0604283C
.L060427A4:
	.long func_060204EE
.L060427A8:
	mov	#4,r0
	mov.l	r0,@(8,r1)
	mov	#16,r0
	mov.l	r0,@(4,r1)
.L060427B0:
	mov	#1,r0
	mov.l	r0,@(32,r1)
	mov.l	@(4,r1),r0
	add	#-1,r0
	mov.l	r0,@(4,r1)
	tst	r0,r0
	bt	.L060427D0
	mov.l	@(16,r1),r0
	add	#2,r0
	cmp/eq	#16,r0
	bt	.L060427CA
	bra	.L06042762
	mov.l	r0,@(16,r1)
.L060427CA:
	xor	r0,r0
	bra	.L06042762
	mov.l	r0,@(16,r1)
.L060427D0:
	mov	#8,r0
	bra	.L06042762
	mov.l	r0,@(16,r1)
.L060427D6:
	mov.l	@(32,r1),r0
	tst	r0,r0
	bf	.L060427E0
	rts
	nop
.L060427E0:
	sts.l	pr,@-r15
	xor	r0,r0
	mov.l	r0,@(32,r1)
	mov.l	.L06042820,r2
	mov.l	.L06042824,r0
	mov.l	@(8,r1),r3
	add	r3,r0
	mov.l	@r0,r3
	mov.l	.L06042828,r5
	mov.l	@(16,r1),r6
	mov	#8,r7
	cmp/gt	r7,r6
	bf	.L06042800
	sub	r7,r6
	sub	r6,r7
	mov	r7,r6
.L06042800:
	mov.l	r6,@-r15
	mov.l	.L0604282C,r0
	jsr	@r0
	mov	#4,r4
	mov.l	.L06042820,r2
	mov.l	.L06042830,r0
	mov.l	@(8,r1),r3
	add	r3,r0
	mov.l	@r0,r3
	mov.l	.L06042834,r5
	mov.l	@r15+,r6
	lds.l	@r15+,pr
	mov.l	.L0604282C,r0
	jmp	@r0
	mov	#4,r4
	.byte 0x00, 0x00
.L06042820:
	.long D_06052994
.L06042824:
	.long D_060426A0
.L06042828:
	.long VDP1_VRAM + 0xFF70
.L0604282C:
	.long func_06043EF4
.L06042830:
	.long func_060426A8
.L06042834:
	.long VDP1_VRAM + 0xFF78
	endlabel func_06042704

	.section .data.06042838,"aw",@progbits
	.p2align 2
	dlabel D_06042838
	.byte 0xFF, 0xCE, 0xFF, 0xFF
	dlabel D_0604283C
	.byte 0x01, 0x00
	dlabel D_0604283E
	.byte 0x00, 0x00, 0xFF, 0xFF, 0x01, 0x00
	dlabel D_06042844
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0xFF, 0xCE, 0x00, 0x00, 0x01, 0x00
	dlabel D_06042850
	.byte 0xD2, 0x03, 0x11, 0x2B, 0x20, 0x0A, 0x81, 0x10, 0xD0, 0x02, 0x21, 0x06, 0x00, 0x0B, 0x71, 0x04
	.long D_06013FCE
	.long D_06042868
	dlabel D_06042868
	.byte 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01
	.byte 0x40, 0x2B, 0x00, 0x09
	.long func_0600D1A0
