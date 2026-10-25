	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06007438,"ax",@progbits
	.p2align 2

	glabel func_06007438
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.b	@(0,gbr),r0
	cmp/eq	#2,r0
	bt	.L06007454
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bt	.L06007460
.L06007454:
	mov.l	.L0600745C,r4
	bra	.L06007476
	nop
	.byte 0x00, 0x00
.L0600745C:
	.long D_060514E7
.L06007460:
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L06007474
	mov.b	@(20,gbr),r0
	shll2	r0
	mov.l	.L06007470,r2
	bra	.L06007476
	mov.l	@(r0,r2),r4
.L06007470:
	.long D_060074B8
.L06007474:
	mov.l	.L060074A4,r4
.L06007476:
	mov.l	.L060074A8,r5
	mov.l	.L060074AC,r6
	mov	#2,r7
	sts.l	pr,@-r15
	mov.l	.L060074B0,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	sts.l	pr,@-r15
	mov.l	.L060074B4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	rts
	nop
.L060074A4:
	.long D_060514A0
.L060074A8:
	.long SCSP_RAM + 0xA000
.L060074AC:
	.long D_060D9000
.L060074B0:
	.long func_06006C94
.L060074B4:
	.long func_06006EA0
	endlabel func_06007438

	.section .data.060074B8,"aw",@progbits
	.p2align 2
	dlabel D_060074B8
	.long D_06051437
	.long D_06051443
	.long D_0605144F
	.long D_0605145B
	.long D_06051466
	.long D_06051472
	.long D_0605147D
	.long D_06051488
	.long D_06051494
	.long D_060514AC
	.long D_060514B8
	.long D_060514C3
	.long D_060514CF
	.long D_060514DB
	.long D_060514CF
	.long D_060514DB
