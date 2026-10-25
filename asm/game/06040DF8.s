	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06040DF8,"ax",@progbits
	.p2align 2

	glabel func_06040DF8
	sts.l	pr,@-r15
	mov.l	.L06040E4C,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06040E50,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.w	@(4,r1),r0
	mov.w	r0,@(16,r1)
	shll8	r0
	mov	r0,r4
	mov	r0,r5
	mov.l	.L06040E54,r14
	jsr	@r14
	mov	r0,r6
	mov.l	.L06040E58,r2
	mov.l	r2,@(44,r1)
	mov	#0,r0
	mov.w	r0,@(20,r1)
	mov.l	.L06040E5C,r0
	jsr	@r0
	nop
	mov.l	.L06040E60,r10
	jsr	@r10
	mov.w	@(194,gbr),r0
	mov.w	@(2,r1),r0
	mov	r0,r4
	mov.w	@(26,r1),r0
	add	r4,r0
	mov.l	.L06040E64,r14
	jsr	@r14
	mov.w	r0,@(26,r1)
	mov.l	.L06040E68,r2
	mov.l	.L06040E6C,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L06040E70,r0
	jmp	@r0
	nop
.L06040E4C:
	.long func_0600CA24
.L06040E50:
	.long func_0600CBDA
.L06040E54:
	.long func_0600D018
.L06040E58:
	.long D_060B883E
.L06040E5C:
	.long func_060208FA
.L06040E60:
	.long func_0600CAF8
.L06040E64:
	.long func_0600CB68
.L06040E68:
	.long D_0609BB24
.L06040E6C:
	.long func_0601F434
.L06040E70:
	.long func_0600CA4E
	endlabel func_06040DF8

	.section .data.06040E74,"aw",@progbits
	.p2align 2
	.byte 0xD0, 0x02, 0x21, 0x06, 0x71, 0x04, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x00
	.long D_06040E84
	dlabel D_06040E84
	.byte 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01
	.byte 0x40, 0x2B, 0x00, 0x09
	.long func_0600D1A0
