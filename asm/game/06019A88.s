	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06019A88,"ax",@progbits
	.p2align 2

	glabel func_06019A88
	sts.l	pr,@-r15
	mov.l	@(36,r1),r0
	tst	r0,r0
	bf	.L06019A96
	mov.l	@(32,r1),r0
	tst	r0,r0
	bt	.L06019AAC
.L06019A96:
	mov.l	@(60,r1),r2
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06019AA8,r0
	jsr	@r0
	nop
	bra	.L06019AC4
	nop
	.byte 0x00, 0x00
.L06019AA8:
	.long func_0601C9C2
.L06019AAC:
	mov.w	@(26,r1),r0
	tst	r0,r0
	bt	.L06019AC4
	mov.w	@(24,r1),r0
	add	#-1,r0
	cmp/pl	r0
	bt	.L06019AC2
	mov.b	@(8,r1),r0
	xor	#1,r0
	mov.b	r0,@(8,r1)
	mov.w	@(26,r1),r0
.L06019AC2:
	mov.w	r0,@(24,r1)
.L06019AC4:
	mov.l	@(56,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bt	.L06019AE8
	mov.l	@(60,r1),r2
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06019AE0,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L06019AE4,r0
	jmp	@r0
	nop
.L06019AE0:
	.long func_0601C9C2
.L06019AE4:
	.long func_0600D1A0
.L06019AE8:
	mov.l	r0,@(56,r1)
	mov.l	@(48,r1),r4
	mov.l	@(32,r1),r0
	tst	r0,r0
	bt	.L06019B04
	cmp/pz	r0
	bf	.L06019AFC
	add	#1,r4
	bra	.L06019B00
	add	#-1,r0
.L06019AFC:
	add	#-1,r4
	add	#1,r0
.L06019B00:
	mov.l	r4,@(48,r1)
	mov.l	r0,@(32,r1)
.L06019B04:
	mov.l	@(52,r1),r4
	mov.l	@(36,r1),r0
	tst	r0,r0
	bt	.L06019B1E
	cmp/pz	r0
	bf	.L06019B16
	add	#1,r4
	bra	.L06019B1A
	add	#-1,r0
.L06019B16:
	add	#-1,r4
	add	#1,r0
.L06019B1A:
	mov.l	r4,@(52,r1)
	mov.l	r0,@(36,r1)
.L06019B1E:
	mov.l	@(44,r1),r2
	mov.b	@(8,r1),r0
	tst	r0,r0
	bt	.L06019B28
	mov.l	@(60,r1),r2
.L06019B28:
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06019B38,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06019B38:
	.long func_0601C9C2
	endlabel func_06019A88

	.section .data.06019B3C,"aw",@progbits
	.p2align 2
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
