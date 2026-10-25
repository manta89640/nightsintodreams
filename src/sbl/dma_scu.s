! sbl/dma_scu: matching source. The readable C for this object is dma_scu.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0606FDD0,"ax",@progbits
	.p2align 2

	glabel DMA_ScuSetPrm
	mov.l	r14,@-r15
	mov	#1,r6
	mov.l	@(36,r4),r3
	mov	r5,r14
	shll2	r14
	shll2	r14
	shll	r14
	and	r6,r3
	cmp/eq	r6,r3
	bf/s	.L0606FDEC
	mov	#2,r5
	mov.l	.L0606FF08,r0
	mov.l	@r4,r3
	mov.l	r3,@(r0,r14)
.L0606FDEC:
	mov.l	@(36,r4),r2
	and	r5,r2
	cmp/eq	r5,r2
	bf	.L0606FDFA
	mov.l	.L0606FF0C,r0
	mov.l	@(4,r4),r2
	mov.l	r2,@(r0,r14)
.L0606FDFA:
	mov.l	.L0606FF10,r0
	mov.l	@(8,r4),r3
	mov.l	r3,@(r0,r14)
	mov.l	@(16,r4),r3
	add	#4,r0
	mov.l	@(12,r4),r2
	or	r3,r2
	mov.l	r2,@(r0,r14)
	add	#8,r0
	mov.l	@(24,r4),r3
	shll16	r3
	mov.l	@(20,r4),r2
	or	r2,r3
	mov.l	@(28,r4),r1
	shll8	r1
	mov.l	@(32,r4),r2
	or	r1,r3
	or	r2,r3
	mov.l	r3,@(r0,r14)
	rts
	mov.l	@r15+,r14
	endlabel DMA_ScuSetPrm

	glabel DMA_ScuStart
	mov.l	r14,@-r15
	stc	sr,r0
	mov.w	.L0606FF02,r3
	shlr2	r0
	mov.l	r13,@-r15
	shlr2	r0
	mov.l	r12,@-r15
	mov	r4,r13
	mov.l	r8,@-r15
	and	#15,r0
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	r0,@r15
	stc	sr,r0
	and	r3,r0
	or	#240,r0
	ldc	r0,sr
	mov	r13,r0
	cmp/eq	#0,r0
	bt	.L0606FE58
	cmp/eq	#1,r0
	bt	.L0606FE5E
	cmp/eq	#2,r0
	bt	.L0606FE64
	bra	.L0606FE68
	nop
.L0606FE58:
	mov.l	.L0606FF14,r12
	bra	.L0606FE68
	mov	#75,r14
.L0606FE5E:
	mov.l	.L0606FF18,r12
	bra	.L0606FE68
	mov	#74,r14
.L0606FE64:
	mov.l	.L0606FF1C,r12
	mov	#73,r14
.L0606FE68:
	mov.l	.L0606FF20,r8
	mov	r13,r3
	mov.l	.L0606FF24,r2
	shll2	r3
	mov.l	r3,@(4,r15)
	add	r3,r8
	jsr	@r2
	mov	r14,r4
	mov.l	r0,@r8
	mov.l	.L0606FF28,r3
	mov.l	@(4,r15),r2
	add	r3,r2
	mov.l	.L0606FF2C,r0
	mov	r2,r8
	mov.l	@r0,r1
	jsr	@r1
	mov	r14,r4
	mov	#1,r3
	mov.l	.L0606FF34,r2
	mov	r12,r5
	mov.l	r0,@r8
	mov.l	.L0606FF30,r0
	mov.b	r3,@(r0,r13)
	jsr	@r2
	mov	r14,r4
	mov	#0,r5
	mov.l	.L0606FF38,r2
	mov.l	@r2,r3
	jsr	@r3
	mov	r14,r4
	mov.l	.L0606FF3C,r0
	shll2	r13
	mov.w	.L0606FF04,r3
	shll2	r13
	mov.w	.L0606FF02,r1
	shll	r13
	mov.l	r3,@(r0,r13)
	stc	sr,r2
	mov.l	@r15,r0
	and	r1,r2
	and	#15,r0
	shll2	r0
	shll2	r0
	or	r2,r0
	ldc	r0,sr
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel DMA_ScuStart

	glabel DMA_ScuGetStatus
	mov.w	.L0606FF02,r3
	stc	sr,r0
	shlr2	r0
	shlr2	r0
	and	#15,r0
	mov	r0,r6
	stc	sr,r0
	and	r3,r0
	or	#240,r0
	ldc	r0,sr
	mov.l	.L0606FF30,r0
	stc	sr,r3
	mov.w	.L0606FF02,r1
	mov.b	@(r0,r5),r2
	extu.b	r2,r2
	mov	r6,r0
	mov.l	r2,@r4
	and	r1,r3
	and	#15,r0
	shll2	r0
	shll2	r0
	or	r3,r0
	ldc	r0,sr
	rts
	nop
.L0606FF02:
	.short 0xFF0F
.L0606FF04:
	.short 0x0101
	.byte 0x00, 0x00
.L0606FF08:
	.long SCU_REGS
.L0606FF0C:
	.long SCU_REGS + 0x4
.L0606FF10:
	.long SCU_REGS + 0x8
.L0606FF14:
	.long dma_ScuEnd0
.L0606FF18:
	.long dma_ScuEnd1
.L0606FF1C:
	.long dma_ScuEnd2
.L0606FF20:
	.long dma_scu_save_func
.L0606FF24:
	.long INT_GetScuFunc
.L0606FF28:
	.long dma_scu_save_sint
.L0606FF2C:
	.long SYS_GETSINT
.L0606FF30:
	.long dma_scu_busy
.L0606FF34:
	.long INT_SetScuFunc
.L0606FF38:
	.long SYS_SETSINT
.L0606FF3C:
	.long SCU_REGS + 0x10
	endlabel DMA_ScuGetStatus

	glabel dma_ScuEnd0
	sts.l	pr,@-r15
	stc	sr,r0
	mov.w	.L06070042,r3
	add	#-8,r15
	shlr2	r0
	shlr2	r0
	and	#15,r0
	mov.l	r0,@r15
	stc	sr,r0
	and	r3,r0
	or	#240,r0
	ldc	r0,sr
	mov.l	.L06070044,r2
	mov	#0,r3
	mov.l	.L06070048,r5
	mov.l	r2,@(4,r15)
	mov.b	r3,@r2
	mov.l	@r5,r5
	mov.l	.L0607004C,r2
	jsr	@r2
	mov	#75,r4
	mov.l	.L06070050,r2
	mov.l	.L06070054,r5
	mov.l	@r2,r3
	mov.l	@r5,r5
	jsr	@r3
	mov	#75,r4
	mov	#0,r2
	mov.w	.L06070042,r1
	mov.l	@(4,r15),r3
	mov.b	r2,@r3
	stc	sr,r3
	mov.l	@r15,r0
	and	r1,r3
	and	#15,r0
	shll2	r0
	shll2	r0
	or	r3,r0
	ldc	r0,sr
	add	#8,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel dma_ScuEnd0

	glabel dma_ScuEnd1
	stc	sr,r0
	mov.w	.L06070042,r3
	shlr2	r0
	sts.l	pr,@-r15
	shlr2	r0
	add	#-8,r15
	and	#15,r0
	mov.l	r0,@r15
	stc	sr,r0
	and	r3,r0
	or	#240,r0
	ldc	r0,sr
	mov	#0,r3
	mov.l	.L0607005C,r5
	mov.l	.L06070058,r2
	mov.l	r2,@(4,r15)
	mov.b	r3,@r2
	mov.l	@r5,r5
	mov.l	.L0607004C,r2
	jsr	@r2
	mov	#74,r4
	mov.l	.L06070050,r2
	mov.l	@r2,r3
	mov.l	.L06070060,r5
	mov.l	@r5,r5
	jsr	@r3
	mov	#74,r4
	mov.l	@(4,r15),r3
	mov	#0,r2
	mov.w	.L06070042,r1
	mov.b	r2,@r3
	mov.l	@r15,r0
	stc	sr,r3
	and	#15,r0
	shll2	r0
	shll2	r0
	and	r1,r3
	or	r3,r0
	ldc	r0,sr
	add	#8,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel dma_ScuEnd1

	glabel dma_ScuEnd2
	sts.l	pr,@-r15
	stc	sr,r0
	mov.w	.L06070042,r3
	add	#-8,r15
	shlr2	r0
	shlr2	r0
	and	#15,r0
	mov.l	r0,@r15
	stc	sr,r0
	and	r3,r0
	or	#240,r0
	ldc	r0,sr
	mov.l	.L06070064,r2
	mov	#0,r3
	mov.l	.L06070068,r5
	mov.l	r2,@(4,r15)
	mov.b	r3,@r2
	mov.l	@r5,r5
	mov.l	.L0607004C,r2
	jsr	@r2
	mov	#73,r4
	mov.l	.L06070050,r2
	mov.l	.L0607006C,r5
	mov.l	@r2,r3
	mov.l	@r5,r5
	jsr	@r3
	mov	#73,r4
	mov	#0,r2
	mov.w	.L06070042,r1
	mov.l	@(4,r15),r3
	mov.b	r2,@r3
	stc	sr,r3
	mov.l	@r15,r0
	and	r1,r3
	and	#15,r0
	shll2	r0
	shll2	r0
	or	r3,r0
	ldc	r0,sr
	add	#8,r15
	lds.l	@r15+,pr
	rts
	nop
.L06070042:
	.short 0xFF0F
.L06070044:
	.long dma_scu_busy
.L06070048:
	.long dma_scu_save_func
.L0607004C:
	.long INT_SetScuFunc
.L06070050:
	.long SYS_SETSINT
.L06070054:
	.long dma_scu_save_sint
.L06070058:
	.long dma_scu_busy + 0x1
.L0607005C:
	.long dma_scu_save_func + 0x4
.L06070060:
	.long dma_scu_save_sint + 0x4
.L06070064:
	.long dma_scu_busy + 0x2
.L06070068:
	.long dma_scu_save_func + 0x8
.L0607006C:
	.long dma_scu_save_sint + 0x8
	endlabel dma_ScuEnd2
