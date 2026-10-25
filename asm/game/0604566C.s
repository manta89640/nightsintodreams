	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0604566C,"ax",@progbits
	.p2align 2
	.byte 0x00, 0x00

	glabel func_0604566E
	mov.l	.L06045690,r0
	mov.w	@r0,r0
	cmp/eq	#0,r0
	bt	.L06045686
	mov.l	@(52,r1),r2
	mov.l	.L06045694,r3
	add	r3,r2
	mov.l	r2,@(52,r1)
	shlr16	r2
	mov.w	.L0604568C,r3
	cmp/ge	r3,r2
	bf	func_0604569C
.L06045686:
	mov.l	.L06045698,r0
	jmp	@r0
	nop
.L0604568C:
	.short 0x00A0
	.byte 0x00, 0x00
.L06045690:
	.long D_060455DC + 0x90
.L06045694:
	.long 0x00008000
.L06045698:
	.long func_0600D1A0
	endlabel func_0604566E

	glabel func_0604569C
	sts.l	pr,@-r15
	mov.l	.L060456B4,r7
	jsr	@r7
	mov.l	@(8,r1),r2
	lds.l	@r15+,pr
	sts.l	pr,@-r15
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L060456B8
	lds.l	@r15+,pr
	rts
	nop
.L060456B4:
	.long func_0601EF98
.L060456B8:
	mov.l	@(92,gbr),r0
	mov	r0,r3
	mov.l	@(44,r1),r4
	mov.w	@(20,r1),r0
	shll	r0
	mov.w	@(r0,r4),r0
	add	r0,r4
.L060456C6:
	mov.w	@r4+,r6
	cmp/pz	r6
	bf	.L06045728
	mov.l	.L06045718,r5
	shll2	r6
	add	r6,r5
	mov.w	.L06045712,r0
	mov.w	@r4+,r2
	or	r2,r0
	mov.w	r0,@r3
	mov.w	.L06045714,r0
	mov.w	r0,@(4,r3)
	mov.l	.L0604571C,r0
	mov.w	@r0,r0
	mov.w	r0,@(6,r3)
	mov.w	@r5+,r0
	mov.l	.L06045720,r8
	add	r8,r0
	mov.w	r0,@(8,r3)
	mov.w	@r5+,r0
	mov.w	r0,@(10,r3)
	mov.w	@r4+,r0
	mov.l	@(48,r1),r5
	add	r5,r0
	mov.w	r0,@(12,r3)
	mov.w	@r4+,r0
	mov.l	@(52,r1),r5
	shlr16	r5
	add	r5,r0
	mov.w	r0,@(14,r3)
	mov.l	.L06045724,r2
	mov	#4,r6
	jsr	@r2
	shll16	r6
	bsr	func_06045730
	nop
	bra	.L060456C6
	add	#32,r3
.L06045712:
	.short 0x1000
.L06045714:
	.short 0x0888
	.byte 0x00, 0x00
.L06045718:
	.long D_0604540C
.L0604571C:
	.long D_06045756
.L06045720:
	.long 0x04B8A000
.L06045724:
	.long func_0601F1EC
.L06045728:
	lds.l	@r15+,pr
	mov	r3,r0
	rts
	mov.l	r0,@(92,gbr)
	endlabel func_0604569C

	glabel func_06045730
	mov.l	@(52,r1),r0
	shlr16	r0
	mov.w	.L06045754,r12
	sub	r12,r0
	cmp/pz	r0
	bf	.L06045750
	shlr2	r0
	shll2	r0
	mov	r0,r12
	mov	#32,r0
	cmp/ge	r0,r12
	bf	.L0604574A
	mov	#28,r12
.L0604574A:
	mov.w	@(6,r3),r0
	add	r12,r0
	mov.w	r0,@(6,r3)
.L06045750:
	rts
	nop
.L06045754:
	.short 0x005F
	dlabel D_06045756
	.byte 0x30, 0x00
	endlabel func_06045730

	.section .data.06045758,"aw",@progbits
	.p2align 2
	.byte 0x30, 0x00, 0x30, 0x00, 0x30, 0x20, 0x30, 0x20, 0x30, 0x20, 0x30, 0x40, 0x30, 0x40, 0x30, 0x40
	.byte 0x30, 0x60, 0x30, 0x60, 0x30, 0x60, 0x30, 0x80, 0x30, 0x80, 0x30, 0x80, 0x30, 0xA0, 0x30, 0xA0
	.byte 0x30, 0xA0, 0x30, 0xC0, 0x30, 0xC0, 0x30, 0xC0
