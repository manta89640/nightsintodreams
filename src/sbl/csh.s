! sbl/csh: matching source. The readable C for this object is csh.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060683E8,"ax",@progbits
	.p2align 2

	glabel CSH_Init
	mov.l	r12,@-r15
	mov	#0,r2
	mov.w	.L060684AA,r5
	mov	#64,r12
	mov.l	r11,@-r15
	mov	r2,r6
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.b	@r5,r0
	mov	#63,r9
	mov.w	.L060684AC,r10
	and	#254,r0
	mov.l	.L060684B0,r11
	mov.b	r0,@r5
.L06068404:
	mov.b	@r5,r3
	mov	r11,r7
	extu.b	r3,r3
	and	r9,r3
	or	r6,r3
	mov	r12,r1
	mov.b	r3,@r5
.L06068412:
	dt	r1
	mov.l	r2,@r7
	bf/s	.L06068412
	add	#16,r7
	add	#64,r6
	cmp/hs	r10,r6
	bf	.L06068404
	mov.b	@r5,r0
	and	#247,r0
	or	r4,r0
	mov.b	r0,@r5
	mov.b	@r5,r0
	and	#253,r0
	mov.b	r0,@r5
	mov.b	@r5,r0
	and	#251,r0
	mov.b	r0,@r5
	mov.b	@r5,r0
	and	#254,r0
	or	#1,r0
	mov.b	r0,@r5
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	rts
	mov.l	@r15+,r12
	endlabel CSH_Init

	glabel CSH_AllClr
	mov	#0,r1
	mov.l	r12,@-r15
	mov	r1,r5
	mov.w	.L060684AA,r4
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov	#63,r11
	mov.w	.L060684AC,r12
	mov	#64,r10
	mov.l	.L060684B0,r2
	mov.b	@r4,r0
	and	#254,r0
	mov.b	r0,@r4
.L06068460:
	mov.b	@r4,r3
	mov	r2,r6
	extu.b	r3,r3
	and	r11,r3
	or	r5,r3
	mov	r10,r7
	mov.b	r3,@r4
.L0606846E:
	dt	r7
	mov.l	r1,@r6
	bf/s	.L0606846E
	add	#16,r6
	add	#64,r5
	cmp/hs	r12,r5
	bf	.L06068460
	mov.b	@r4,r0
	and	#254,r0
	or	#1,r0
	mov.b	r0,@r4
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	rts
	mov.l	@r15+,r12
	endlabel CSH_AllClr

	glabel CSH_Purge
	mov.l	.L060684B4,r3
	mov	#-16,r1
	mov.l	.L060684B8,r2
	mov	#0,r6
	and	r3,r4
	or	r2,r4
	add	r4,r5
	add	#-16,r5
	and	r1,r4
.L0606849E:
	cmp/hs	r5,r4
	mov.l	r6,@r4
	bf/s	.L0606849E
	add	#16,r4
	rts
	nop
.L060684AA:
	.short 0xFE92
.L060684AC:
	.short 0x0100
	.byte 0x00, 0x00
.L060684B0:
	.long 0x60000000
.L060684B4:
	.long 0x1FFFFFFF
.L060684B8:
	.long 0x40000000
	endlabel CSH_Purge
