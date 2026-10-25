	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060425F0,"ax",@progbits
	.p2align 2

	glabel func_060425F0
	sts.l	pr,@-r15
	mov.b	@(35,gbr),r0
	tst	r0,r0
	bt	.L060425FC
	bra	.L06042674
	nop
.L060425FC:
	mov.w	@(22,r1),r0
	shll8	r0
	mov.l	r0,@(32,r1)
	mov.l	.L0604267C,r2
	mov.l	r2,@(36,r1)
	mov.l	@(48,r1),r0
	mov.l	r0,@(40,r1)
	mov.l	.L06042680,r2
	mov.l	r2,@(8,r1)
	mov.l	@(16,r1),r0
	mov	#20,r2
	sub	r0,r2
	mov.l	r2,@-r15
	cmp/eq	#0,r0
	bt	.L06042644
.L0604261A:
	mov.l	r0,@-r15
	mov.l	@(8,r1),r3
	mov.b	@r3+,r0
	mov.l	r3,@(8,r1)
	mov.w	r0,@(20,r1)
	mov.l	@(36,r1),r0
	mov.l	@r0+,r2
	mov.l	r0,@(36,r1)
	mov.l	@(32,r1),r3
	dmuls.l	r2,r3
	sts	mach,r2
	sts	macl,r3
	xtrct	r2,r3
	mov.l	@(40,r1),r0
	add	r0,r3
	mov.l	.L06042684,r14
	jsr	@r14
	mov.l	r3,@(48,r1)
	mov.l	@r15+,r0
	dt	r0
	bf	.L0604261A
.L06042644:
	mov	#7,r0
	mov.w	r0,@(20,r1)
	mov.l	@r15+,r0
	cmp/eq	#0,r0
	bt	.L06042670
.L0604264E:
	mov.l	r0,@-r15
	mov.l	@(36,r1),r0
	mov.l	@r0+,r2
	mov.l	r0,@(36,r1)
	mov.l	@(32,r1),r3
	dmuls.l	r2,r3
	sts	mach,r2
	sts	macl,r3
	xtrct	r2,r3
	mov.l	@(40,r1),r0
	add	r0,r3
	mov.l	.L06042684,r14
	jsr	@r14
	mov.l	r3,@(48,r1)
	mov.l	@r15+,r0
	dt	r0
	bf	.L0604264E
.L06042670:
	mov.l	@(40,r1),r0
	mov.l	r0,@(48,r1)
.L06042674:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0604267C:
	.long D_0604258C
.L06042680:
	.long D_060425DC
.L06042684:
	.long func_060204EE
	endlabel func_060425F0

	.section .data.06042688,"aw",@progbits
	.p2align 2
	dlabel D_06042688
	.byte 0x00, 0x00, 0x00, 0x01, 0x01, 0x00
	dlabel D_0604268E
	.byte 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05
	.byte 0x01, 0x00
	dlabel D_060426A0
	.long D_0605299C
	.long D_060529AC
