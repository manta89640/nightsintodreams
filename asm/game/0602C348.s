	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0602C348,"ax",@progbits
	.p2align 2
	.byte 0x00, 0x09

	glabel func_0602C34A
	mov.l	.L0602C380,r2
	mov.b	@(20,gbr),r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	.L0602C384,r3
	mov.l	.L0602C388,r7
	shar	r7
.L0602C358:
	mov.w	@r2+,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L0602C358
	add	#2,r3
	mov.l	.L0602C38C,r3
	mov	#16,r7
.L0602C366:
	mov.w	@r2+,r0
	mov.w	r0,@r3
	dt	r7
	bf/s	.L0602C366
	add	#2,r3
	mov	#0,r0
	mov.l	r0,@(528,gbr)
	mov.l	r0,@(532,gbr)
	mov.l	r0,@(536,gbr)
	mov.l	r0,@(540,gbr)
	rts
	nop
	.byte 0x00, 0x00
.L0602C380:
	.long D_0602D298
.L0602C384:
	.long D_060FFCEE
.L0602C388:
	.long 0x00000052
.L0602C38C:
	.long D_060FFDD0
	endlabel func_0602C34A

	glabel func_0602C390
	sts.l	pr,@-r15
	mov.l	.L0602C42C,r2
	mov.l	.L0602C430,r4
	mov.l	.L0602C434,r3
	mov	#24,r7
.L0602C39A:
	mov.l	@r3+,r0
	mov.l	r0,@r2
	add	#4,r2
	mov.l	r0,@r4
	add	#4,r4
	dt	r7
	bf	.L0602C39A
	mov.l	.L0602C438,r2
	mov.l	.L0602C43C,r4
	mov.l	.L0602C434,r3
	mov	#24,r7
.L0602C3B0:
	mov.l	@r3+,r0
	mov.l	r0,@r2
	add	#4,r2
	mov.l	r0,@r4
	add	#4,r4
	dt	r7
	bf	.L0602C3B0
	mov.l	.L0602C440,r2
	mov.l	.L0602C444,r4
	mov.l	.L0602C434,r3
	mov	#24,r7
.L0602C3C6:
	mov.l	@r3+,r0
	mov.l	r0,@r2
	add	#4,r2
	mov.l	r0,@r4
	add	#4,r4
	dt	r7
	bf	.L0602C3C6
	mov.l	.L0602C448,r2
	mov.l	.L0602C44C,r4
	mov.l	.L0602C434,r3
	mov	#24,r7
.L0602C3DC:
	mov.l	@r3+,r0
	mov.l	r0,@r2
	add	#4,r2
	mov.l	r0,@r4
	add	#4,r4
	dt	r7
	bf	.L0602C3DC
	mov.l	.L0602C450,r2
	mov.l	.L0602C454,r3
	mov.l	.L0602C458,r7
	mov.w	.L0602C428,r0
.L0602C3F2:
	mov.w	r0,@r2
	add	#2,r2
	mov.w	r0,@r3
	add	#2,r3
	dt	r7
	bf	.L0602C3F2
	mov.l	.L0602C450,r4
	mov.l	.L0602C45C,r5
	mov.l	.L0602C460,r6
	mov.l	.L0602C464,r14
	jsr	@r14
	nop
	mov.l	.L0602C42C,r4
	mov.l	.L0602C468,r5
	mov.w	.L0602C42A,r6
	mov.l	.L0602C464,r14
	jsr	@r14
	nop
	mov.l	.L0602C440,r4
	mov.l	.L0602C46C,r5
	mov.w	.L0602C42A,r6
	mov.l	.L0602C464,r14
	jsr	@r14
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0602C428:
	.short 0x0400
.L0602C42A:
	.short 0x00C0
.L0602C42C:
	.long D_060F68F8
.L0602C430:
	.long D_060F6A78
.L0602C434:
	.long D_0602C470
.L0602C438:
	.long D_060F6958
.L0602C43C:
	.long D_060F6AD8
.L0602C440:
	.long D_060F69B8
.L0602C444:
	.long D_060F6B38
.L0602C448:
	.long D_060F6A18
.L0602C44C:
	.long D_060F6B98
.L0602C450:
	.long D_060F60F8
.L0602C454:
	.long D_060F64F8
.L0602C458:
	.long 0x000000F0
.L0602C45C:
	.long VDP2_VRAM + 0x5E000
.L0602C460:
	.long 0x000001C0
.L0602C464:
	.long func_060045BC
.L0602C468:
	.long VDP2_VRAM + 0x5EE00
.L0602C46C:
	.long VDP2_VRAM + 0x5EF00
	endlabel func_0602C390

	.section .data.0602C470,"aw",@progbits
	.p2align 2
	dlabel D_0602C470
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x70, 0x01, 0x00, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x70
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
