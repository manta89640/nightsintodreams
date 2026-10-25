! sbl/dma_cpu: matching source. The readable C for this object is dma_cpu.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060684BC,"ax",@progbits
	.p2align 2

	glabel DMA_CpuSetComPrm
	mov.l	@(8,r4),r3
	mov	#-80,r6
	mov	#1,r7
	and	r7,r3
	cmp/eq	r7,r3
	bf/s	.L060684D2
	mov.l	@r6,r5
	mov	#-9,r3
	mov.l	@r4,r2
	and	r3,r5
	or	r2,r5
.L060684D2:
	mov	#8,r7
	mov.l	@(8,r4),r3
	and	r7,r3
	cmp/eq	r7,r3
	bf/s	.L060684E6
	mov	#2,r7
	mov	#-2,r3
	mov.l	@(4,r4),r2
	and	r3,r5
	or	r2,r5
.L060684E6:
	mov.l	@(8,r4),r3
	and	r7,r3
	cmp/eq	r7,r3
	bf/s	.L060684F4
	mov	#4,r7
	mov	#-5,r3
	and	r3,r5
.L060684F4:
	mov.l	@(8,r4),r2
	and	r7,r2
	cmp/eq	r7,r2
	bf	.L06068500
	mov	#-3,r2
	and	r2,r5
.L06068500:
	rts
	mov.l	r5,@r6
	endlabel DMA_CpuSetComPrm

	glabel DMA_CpuSetPrm
	mov.l	@(36,r4),r3
	mov	#1,r7
	mov	r5,r6
	shll2	r6
	and	r7,r3
	cmp/eq	r7,r3
	bf/s	.L0606851C
	shll2	r6
	mov.l	@r4,r2
	mov	r6,r3
	add	#-128,r3
	mov.l	r2,@r3
.L0606851C:
	mov.l	@(36,r4),r3
	mov	#2,r7
	and	r7,r3
	cmp/eq	r7,r3
	bf/s	.L06068530
	mov	#4,r7
	mov.l	@(4,r4),r2
	mov	r6,r3
	add	#-124,r3
	mov.l	r2,@r3
.L06068530:
	mov.l	@(36,r4),r3
	and	r7,r3
	cmp/eq	r7,r3
	bf/s	.L06068542
	mov	r6,r7
	mov	r6,r3
	mov.l	@(8,r4),r2
	add	#-120,r3
	mov.l	r2,@r3
.L06068542:
	add	#-116,r7
	mov.l	@(36,r4),r0
	and	#8,r0
	cmp/eq	#8,r0
	bf/s	.L0606855E
	mov.l	@r7,r6
	mov.l	.L06068640,r2
	mov.l	@(12,r4),r3
	and	r2,r6
	shll8	r3
	shll2	r3
	shll2	r3
	shll2	r3
	or	r3,r6
.L0606855E:
	mov.l	@(36,r4),r0
	and	#16,r0
	cmp/eq	#16,r0
	bf/s	.L06068576
	mov.l	@(36,r4),r0
	mov.w	.L06068632,r3
	and	r3,r6
	mov.l	@(16,r4),r2
	shll8	r2
	shll2	r2
	shll2	r2
	or	r2,r6
.L06068576:
	and	#32,r0
	cmp/eq	#32,r0
	bf/s	.L06068586
	mov.l	@(36,r4),r0
	mov.w	.L06068634,r2
	mov.l	@(20,r4),r3
	and	r2,r6
	or	r3,r6
.L06068586:
	and	#64,r0
	cmp/eq	#64,r0
	bf	.L06068594
	mov.w	.L06068636,r3
	and	r3,r6
	mov.l	@(24,r4),r2
	or	r2,r6
.L06068594:
	mov.l	@(36,r4),r0
	mov	#-17,r3
	mov.w	.L06068638,r1
	mov	#-9,r2
	and	r3,r6
	and	#128,r0
	cmp/eq	r1,r0
	bf/s	.L060685AE
	and	r2,r6
	mov	#-5,r0
	mov.l	@(28,r4),r3
	and	r0,r6
	or	r3,r6
.L060685AE:
	mov.w	.L0606863A,r3
	mov.l	@(36,r4),r2
	and	r3,r2
	cmp/eq	r3,r2
	bf	.L060685BC
	mov	#-3,r2
	and	r2,r6
.L060685BC:
	mov.l	r6,@r7
	mov.w	.L0606863C,r6
	mov.l	@(36,r4),r3
	and	r6,r3
	cmp/eq	r6,r3
	bf	.L060685DE
	mov.l	@(32,r4),r0
	cmp/eq	#1,r0
	bt/s	.L060685D6
	mov	r0,r6
	mov	r6,r0
	cmp/eq	#2,r0
	bf	.L060685DE
.L060685D6:
	mov.w	.L0606863E,r3
	mov.l	@(32,r4),r2
	add	r3,r5
	mov.b	r2,@r5
.L060685DE:
	rts
	nop
	endlabel DMA_CpuSetPrm

	glabel DMA_CpuStart
	mov	r4,r5
	shll2	r5
	shll2	r5
	add	#-116,r5
	mov	#1,r3
	mov.l	@r5,r4
	or	r3,r4
	rts
	mov.l	r4,@r5
	endlabel DMA_CpuStart

	glabel DMA_CpuStop
	mov	r4,r5
	shll2	r5
	shll2	r5
	add	#-116,r5
	mov.l	@r5,r4
	mov	#-2,r3
	and	r3,r4
	rts
	mov.l	r4,@r5
	endlabel DMA_CpuStop

	glabel DMA_CpuAllStop
	mov	#-80,r5
	mov.l	@r5,r4
	mov	#-2,r3
	and	r3,r4
	rts
	mov.l	r4,@r5
	endlabel DMA_CpuAllStop

	glabel DMA_CpuGetComStatus
	mov	#-80,r3
	mov.l	@r3,r5
	mov	#4,r2
	and	r5,r2
	mov	#2,r1
	mov.l	r2,@r4
	and	r1,r5
	rts
	mov.l	r5,@(4,r4)
	endlabel DMA_CpuGetComStatus

	glabel DMA_CpuGetStatus
	shll2	r4
	shll2	r4
	add	#-116,r4
	mov	#2,r0
	mov.l	@r4,r4
	rts
	and	r4,r0
.L06068632:
	.short 0xCFFF
.L06068634:
	.short 0xF3FF
.L06068636:
	.short 0xFDFF
.L06068638:
	.short 0x0080
.L0606863A:
	.short 0x0200
.L0606863C:
	.short 0x0100
.L0606863E:
	.short 0xFE71
.L06068640:
	.long 0xFFFF3FFF
	endlabel DMA_CpuGetStatus
