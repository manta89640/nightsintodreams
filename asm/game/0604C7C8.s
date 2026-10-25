	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0604C7C8,"ax",@progbits
	.p2align 2

	glabel func_0604C7C8
	mov.l	.L0604C7E8,r0
	mov.b	@r0,r0
	cmp/eq	#7,r0
	bt	.L0604C7D4
	cmp/eq	#5,r0
	bf	.L0604C870
.L0604C7D4:
	mov	#0,r0
	mov.l	.L0604C7EC,r4
	mov.b	@r4,r2
	extu.b	r2,r2
	mov	#96,r3
	cmp/ge	r3,r2
	bt	.L0604C7F0
	bra	.L0604C7F8
	mov	#4,r0
	.byte 0x00, 0x00
.L0604C7E8:
	.long D_060D9052
.L0604C7EC:
	.long D_060D905C
.L0604C7F0:
	add	#64,r3
	cmp/ge	r3,r2
	bf	.L0604C7F8
	mov	#8,r0
.L0604C7F8:
	mov.l	.L0604C808,r4
	mov.b	@r4,r2
	extu.b	r2,r2
	mov	#96,r3
	cmp/ge	r3,r2
	bt	.L0604C80C
	bra	.L0604C814
	or	#1,r0
.L0604C808:
	.long D_060D905D
.L0604C80C:
	add	#64,r3
	cmp/ge	r3,r2
	bf	.L0604C814
	or	#2,r0
.L0604C814:
	mov	r0,r2
	mov	#-16,r3
	mov.l	.L0604C860,r12
	mov.w	@(76,gbr),r0
	mov.w	@r12,r11
	and	r3,r0
	or	r2,r0
	mov.w	r0,@r12
	mov	r11,r14
	mov	r0,r13
	xor	r11,r2
	not	r11,r11
	and	r11,r2
	add	#2,r12
	mov.w	@(78,gbr),r0
	and	r3,r0
	not	r3,r3
	and	r3,r2
	or	r2,r0
	mov.w	r0,@r12
.L0604C83C:
	mov	#15,r4
	and	r4,r13
	and	r4,r14
	mov.l	.L0604C864,r5
	cmp/eq	r13,r14
	bf	.L0604C868
	mov.w	@r5,r6
	add	#-1,r6
	cmp/pl	r6
	bt	.L0604C858
	mov.w	@r12,r0
	or	r13,r0
	mov.w	r0,@r12
	mov	#10,r6
.L0604C858:
	mov.w	r6,@r5
	rts
	nop
	.byte 0x00, 0x00
.L0604C860:
	.long D_0604C888
.L0604C864:
	.long D_0604C888 + 0x4
.L0604C868:
	mov	#30,r0
	mov.w	r0,@r5
	rts
	nop
.L0604C870:
	mov.l	.L0604C884,r12
	mov.w	@r12,r14
	mov.w	@(76,gbr),r0
	mov.w	r0,@r12
	mov	r0,r13
	add	#2,r12
	mov.w	@(78,gbr),r0
	bra	.L0604C83C
	mov.w	r0,@r12
	.byte 0x00, 0x00
.L0604C884:
	.long D_0604C888
	endlabel func_0604C7C8

	.section .data.0604C888,"aw",@progbits
	.p2align 2
	dlabel D_0604C888
	.byte 0x00, 0x00
	dlabel D_0604C88A
	.byte 0x00, 0x00
