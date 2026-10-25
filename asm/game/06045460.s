	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06045460,"ax",@progbits
	.p2align 2

	glabel func_06045460
	sts.l	pr,@-r15
	mov.l	.L06045574,r2
	mov.l	.L06045578,r3
	mov.l	.L0604557C,r6
	mov	#32,r8
	mov	#32,r9
	mov	#32,r14
	mov.l	.L06045580,r0
	jsr	@r0
	nop
	mov.l	.L06045584,r2
	mov.l	.L06045588,r3
	mov.l	.L0604558C,r6
	mov	#32,r8
	mov	#32,r9
	mov	#32,r14
	mov.l	.L06045580,r0
	jsr	@r0
	nop
	mov.l	.L06045590,r2
	mov.l	.L06045594,r3
	mov.l	.L0604558C,r6
	mov	#32,r8
	mov	#32,r9
	mov	#32,r14
	mov.l	.L06045580,r0
	jsr	@r0
	nop
	mov.l	.L06045598,r2
	mov.l	.L0604559C,r3
	mov.l	r3,@r2
	mov.l	.L060455A0,r3
	mov.l	.L060455A4,r2
	mov.w	.L0604556C,r4
.L060454A4:
	mov.w	@r2+,r5
	mov.w	r5,@-r3
	dt	r4
	bf	.L060454A4
	mov.l	.L060455A8,r3
	mov.w	.L0604556E,r0
	mov.w	r0,@r3
	mov.l	.L060455A8,r3
	mov.w	@r3,r0
	or	#64,r0
	mov.w	r0,@r3
	mov.l	.L060455AC,r3
	mov.w	.L06045570,r0
	mov.w	r0,@r3
	mov.l	.L060455B0,r3
	mov	#0,r0
	xor	#1,r0
	add	r0,r3
	mov	#1,r0
	mov.b	r0,@r3
	mov.l	.L060455B0,r3
	mov	#1,r0
	xor	#1,r0
	add	r0,r3
	mov	#6,r0
	mov.b	r0,@r3
	mov.l	.L060455B0,r3
	mov	#2,r0
	xor	#1,r0
	add	r0,r3
	mov	#7,r0
	mov.b	r0,@r3
	mov.l	.L060455B4,r3
	mov	#1,r0
	xor	#1,r0
	add	r0,r3
	mov	#2,r0
	mov.b	r0,@r3
	mov.l	.L060455B4,r3
	mov	#2,r0
	xor	#1,r0
	add	r0,r3
	mov	#2,r0
	mov.b	r0,@r3
	mov.l	.L060455B4,r3
	mov	#3,r0
	xor	#1,r0
	add	r0,r3
	mov	#2,r0
	mov.b	r0,@r3
	mov.l	.L060455B8,r3
	mov.w	.L06045572,r0
	mov.w	r0,@r3
	mov.l	.L060455BC,r2
	mov.l	.L060455C0,r4
	mov.l	.L060455C4,r6
	mov	#21,r5
.L06045516:
	mov.b	@(3,r6),r0
	extu.b	r0,r3
	mov.b	@(2,r6),r0
	mulu.w	r0,r3
	sts	macl,r3
	mov.w	@r6,r0
	shll2	r0
	shll	r0
.L06045526:
	mov.b	@r4+,r7
	mov.b	r7,@(r0,r2)
	add	#1,r0
	mov.b	@r4+,r7
	mov.b	r7,@(r0,r2)
	add	#1,r0
	mov.b	@r4+,r7
	mov.b	r7,@(r0,r2)
	add	#1,r0
	mov.b	@r4+,r7
	mov.b	r7,@(r0,r2)
	dt	r3
	bf/s	.L06045526
	add	#1,r0
	dt	r5
	bf/s	.L06045516
	add	#4,r6
	mov.w	.L06045570,r0
	mov.w	r0,@(352,gbr)
	mov	#0,r0
	mov.w	r0,@(146,gbr)
	mov.w	r0,@(144,gbr)
	mov.w	r0,@(142,gbr)
	mov.l	.L060455C8,r2
	mov.l	.L060455CC,r0
	mov.l	.L060455D0,r6
	mov.l	.L060455D4,r5
	jsr	@r5
	mov	#7,r7
	mov.l	.L060455D8,r3
	mov	#1,r0
	mov.w	r0,@r3
	lds.l	@r15+,pr
	rts
	nop
.L0604556C:
	.short 0x003C
.L0604556E:
	.short 0x0100
.L06045570:
	.short 0x0000
.L06045572:
	.short 0x3023
.L06045574:
	.long 0x00294D1C
.L06045578:
	.long VDP2_VRAM + 0x5D800
.L0604557C:
	.long 0x00002294
.L06045580:
	.long func_0602C204
.L06045584:
	.long 0x00200004
.L06045588:
	.long VDP2_VRAM + 0x58000
.L0604558C:
	.long 0x00001040
.L06045590:
	.long 0x00200804
.L06045594:
	.long VDP2_VRAM + 0x58800
.L06045598:
	.long D_060FFD8C
.L0604559C:
	.long 0x92F2F100
.L060455A0:
	.long VDP2_VRAM + 0x5E32E
.L060455A4:
	.long D_0022D264
.L060455A8:
	.long D_060FFDCC
.L060455AC:
	.long D_060FFD04
.L060455B0:
	.long vdp2_prina
.L060455B4:
	.long vdp2_prisa
.L060455B8:
	.long D_060FFDC0
.L060455BC:
	.long VDP1_VRAM + 0x50000
.L060455C0:
	.long 0x0022C81C
.L060455C4:
	.long D_0604540C
.L060455C8:
	.long 0x0022CE1C
.L060455CC:
	.long D_060455EA
.L060455D0:
	.long 0x00010000
.L060455D4:
	.long vdp1_build_fog_cluts
.L060455D8:
	.long D_060455DC + 0x90
	endlabel func_06045460

	.section .data.060455DC,"aw",@progbits
	.p2align 2
	dlabel D_060455DC
	.byte 0x60, 0x16, 0x22, 0x02, 0x4E, 0x10, 0x8F, 0xFB, 0x72, 0x04, 0x00, 0x0B, 0x00, 0x09
	dlabel D_060455EA
	.byte 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x20, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x30, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x60, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x30, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0xA0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x30, 0xC0, 0x00, 0x00, 0x64, 0x63, 0x44, 0x28, 0x26, 0x4B, 0x64, 0x23
	.byte 0x6A, 0x93, 0x48, 0x21, 0xED, 0x20, 0x6B, 0x83, 0x6C, 0x23, 0xE0, 0x00, 0x23, 0x02, 0x73, 0x04
	.byte 0x4D, 0x10, 0x89, 0x05, 0x7B, 0xFF, 0x2B, 0xB8, 0x8B, 0xF7, 0x6B, 0x83, 0xAF, 0xF5, 0x6C, 0x23
	.byte 0x32, 0x8C, 0x32, 0x8C, 0x32, 0x8C, 0x32, 0x8C, 0x4E, 0x10, 0x89, 0x05, 0x7A, 0xFF, 0x2A, 0xA8
	.byte 0x8B, 0xE8, 0x6A, 0x93, 0xAF, 0xE6, 0x62, 0x43, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x09
	dlabel D_06045668
	.byte 0x00, 0x00, 0x00, 0x00
