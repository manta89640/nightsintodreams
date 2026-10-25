	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06043808,"ax",@progbits
	.p2align 2
	.byte 0x89, 0x1C

	glabel func_0604380A
	sts.l	pr,@-r15
	mov.l	.L06043830,r0
	jsr	@r0
	nop
	mov.l	.L06043834,r0
	jsr	@r0
	mov.l	@(16,r1),r2
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06043838,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L0604383C,r0
	jsr	@r0
	nop
	mov.l	.L06043840,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L06043830:
	.long func_0600CA24
.L06043834:
	.long func_0601EF98
.L06043838:
	.long func_0600CBDA
.L0604383C:
	.long func_06020906
.L06043840:
	.long func_0600CA4E
	endlabel func_0604380A

	.section .data.06043844,"aw",@progbits
	.p2align 2
	.byte 0x85, 0x13, 0x70, 0xFF, 0x81, 0x13, 0x20, 0x08
