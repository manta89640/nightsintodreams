! sbl/060676D4: matching source. The readable C for this object is 060676D4.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060676D4,"ax",@progbits
	.p2align 2

	glabel dma_cpu0_check
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	.L06067718,r3
	mov	r15,r4
	jsr	@r3
	nop
	mov.l	@r15,r0
	cmp/eq	#4,r0
	bf	.L060676EE
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov	#1,r0
.L060676EE:
	mov.l	.L0606771C,r2
	jsr	@r2
	mov	#0,r4
	mov	r0,r4
	tst	r4,r4
	bf	.L06067702
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov	#2,r0
.L06067702:
	mov.l	.L06067720,r3
	mov.l	.L06067724,r2
	mov.l	@r3,r5
	mov.l	.L06067728,r1
	jsr	@r1
	mov.l	@r2,r4
	mov	#0,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	nop
.L06067718:
	.long DMA_CpuGetComStatus
.L0606771C:
	.long DMA_CpuGetStatus
.L06067720:
	.long dma_cpu0_size
.L06067724:
	.long dma_cpu0_dst
.L06067728:
	.long CSH_Purge
	endlabel dma_cpu0_check
