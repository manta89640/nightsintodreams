	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601B5DC,"ax",@progbits
	.p2align 2

	glabel func_0601B5DC
	mov.b	@(51,gbr),r0
	tst	r0,r0
	bt	func_0601B5E6
	rts
	nop
	endlabel func_0601B5DC

	glabel func_0601B5E6
	sts.l	pr,@-r15
	mov.l	.L0601B688,r7
	mov.l	.L0601B68C,r9
	mov.b	@(3,r7),r0
	shll	r0
	add	r0,r9
	mov.w	@r9,r0
	mov	r0,r8
	mov.w	@(14,r7),r0
	add	#-1,r0
	cmp/gt	r8,r0
	bf	.L0601B600
	mov.w	r0,@r9
.L0601B600:
	mov.w	@(14,r7),r0
	add	#-1,r0
	cmp/pl	r0
	bf	.L0601B6EC
	mov.w	r0,@(2,r1)
	mov.b	@(2,r7),r0
	cmp/pl	r0
	bf	.L0601B6EC
	mov.w	r0,@(0,r1)
	shll	r0
	mov	#64,r8
	cmp/ge	r8,r0
	bf	.L0601B61C
	mov	r8,r0
.L0601B61C:
	mov	r0,r8
	mov.w	@(2,r1),r0
	mov	#2,r0
	muls.w	r0,r8
	sts	macl,r0
	shll	r0
	mov.w	r0,@(22,r1)
	mov.w	@(24,r1),r0
	mov.w	.L0601B682,r8
	add	#32,r0
	cmp/ge	r8,r0
	bf	.L0601B636
	mov	r8,r0
.L0601B636:
	mov.w	r0,@(24,r1)
	mov.l	.L0601B690,r2
.L0601B63A:
	add	#8,r2
	mov.w	@(2,r1),r0
	mov.l	@r2,r8
	cmp/gt	r8,r0
	bt	.L0601B63A
	mov	r2,r3
	add	#-4,r2
	add	#4,r3
	mov.l	@r2,r2
	mov.l	@r3,r3
	mov	#16,r7
	mov.l	.L0601B694,r6
	mov.w	@(4,r6),r0
	shll2	r0
	shll	r0
	mov.l	.L0601B698,r6
	add	r0,r6
	mov.w	.L0601B684,r8
.L0601B65E:
	mov.w	@r3+,r0
	or	r8,r0
	mov.w	r0,@r6
	dt	r7
	bf/s	.L0601B65E
	add	#2,r6
	mov.l	.L0601B69C,r6
	mov.w	@r3+,r0
	mov.w	r0,@(0,r6)
	mov.w	r0,@(2,r6)
	mov.w	@r3+,r0
	mov.w	r0,@(4,r6)
	mov.w	r0,@(6,r6)
	mov.b	@(35,gbr),r0
	tst	r0,r0
	bt	.L0601B6A0
	bra	.L0601B6D0
	nop
.L0601B682:
	.short 0x0100
.L0601B684:
	.short 0x8000
	.byte 0x00, 0x00
.L0601B688:
	.long play_state
.L0601B68C:
	.long mare_max_link
.L0601B690:
	.long D_0601B5A4
.L0601B694:
	.long D_060EE8E8
.L0601B698:
	.long VDP1_VRAM
.L0601B69C:
	.long VDP1_VRAM + 0xFFD0
.L0601B6A0:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0601B6AC
	lds.l	@r15+,pr
	rts
	nop
.L0601B6AC:
	mov.w	@(2,r1),r0
	mov.l	.L0601B6D8,r14
	jsr	@r14
	mov	r0,r4
	mov	#3,r14
	mov.l	.L0601B6DC,r2
	mov.l	r2,@(44,r1)
	mov.l	.L0601B6E0,r10
	jsr	@r10
	nop
	mov.l	.L0601B6E4,r0
	jsr	@r0
	nop
	mov.l	.L0601B6E8,r2
	mov.l	r2,@(44,r1)
	mov.l	.L0601B6E4,r0
	jsr	@r0
	nop
.L0601B6D0:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601B6D8:
	.long math_bin_to_bcd
.L0601B6DC:
	.long D_0601B6F6
.L0601B6E0:
	.long spr_build_number
.L0601B6E4:
	.long func_060204E4
.L0601B6E8:
	.long D_06013D90
.L0601B6EC:
	mov	#0,r0
	mov.w	r0,@(24,r1)
	lds.l	@r15+,pr
	rts
	nop
	dlabel D_0601B6F6
	.byte 0x00, 0x02
	endlabel func_0601B5E6

	.section .data.0601B6F8,"aw",@progbits
	.p2align 2
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
