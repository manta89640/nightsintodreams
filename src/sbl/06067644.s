! sbl/06067644: matching source. The readable C for this object is 06067644.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06067644,"ax",@progbits
	.p2align 2

	glabel dma_cpu0_start
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov.l	.L060676BC,r3
	add	#-64,r15
	mov.l	r4,@(4,r15)
	mov.l	r5,@(8,r15)
	mov.l	r6,@r15
	jsr	@r3
	mov	#0,r4
	mov	#0,r2
	mov.l	r2,@(52,r15)
	mov	#1,r14
	mov.l	r14,@(56,r15)
	mov	#15,r3
	mov.l	r3,@(60,r15)
	mov	r15,r4
	mov.l	.L060676C0,r3
	add	#52,r4
	jsr	@r3
	nop
	mov.l	@(8,r15),r2
	mov	r15,r4
	mov.l	r2,@(12,r15)
	add	#12,r4
	mov.l	@(4,r15),r3
	mov.l	r3,@(16,r15)
	mov.l	@r15,r2
	mov.l	r2,@(20,r15)
	mov.l	r14,@(24,r15)
	mov.l	r14,@(28,r15)
	mov.w	.L060676B4,r3
	mov.l	r3,@(32,r15)
	mov.w	.L060676B6,r2
	mov	#0,r3
	mov.l	r2,@(36,r15)
	mov	r3,r5
	mov.l	r3,@(40,r15)
	mov.w	.L060676B8,r2
	mov.l	.L060676C4,r3
	mov.l	r2,@(48,r15)
	jsr	@r3
	nop
	mov.l	.L060676C8,r2
	jsr	@r2
	mov	#0,r4
	mov.l	@(4,r15),r3
	mov.l	.L060676CC,r2
	mov.l	r3,@r2
	mov.l	@r15,r1
	shll2	r1
	mov.l	.L060676D0,r3
	mov.l	r1,@r3
	add	#64,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L060676B4:
	.short 0x0800
.L060676B6:
	.short 0x0200
.L060676B8:
	.short 0x02FF
	.byte 0x00, 0x00
.L060676BC:
	.long DMA_CpuStop
.L060676C0:
	.long DMA_CpuSetComPrm
.L060676C4:
	.long DMA_CpuSetPrm
.L060676C8:
	.long DMA_CpuStart
.L060676CC:
	.long dma_cpu0_dst
.L060676D0:
	.long dma_cpu0_size
	endlabel dma_cpu0_start
