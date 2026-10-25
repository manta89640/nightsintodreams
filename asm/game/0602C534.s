	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0602C534,"ax",@progbits
	.p2align 2

	glabel func_0602C534
	sts.l	pr,@-r15
	mov.l	.L0602C588,r4
	mov.l	@r4,r4
	mov.l	@(52,r4),r8
	mov.l	.L0602C58C,r0
	cmp/ge	r0,r8
	bt	.L0602C5AC
	mov.l	.L0602C590,r7
	mov.l	@(16,gbr),r0
	cmp/pl	r0
	bt	.L0602C5EC
	mov.l	.L0602C588,r4
	mov.l	@r4,r4
	mov.b	@(7,r4),r0
	and	#112,r0
	tst	r0,r0
	bf	.L0602C5AC
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	.L0602C594,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov	#0,r0
	mov.b	r0,@(108,gbr)
	mov.l	.L0602C598,r0
	mov.l	r0,@(16,gbr)
	mov.l	.L0602C588,r4
	mov.l	@r4,r4
	mov.l	.L0602C59C,r0
	mov.l	r0,@-r4
	mov.l	.L0602C5A0,r2
	mov.l	.L0602C5A4,r0
	jsr	@r0
	nop
	mov.l	.L0602C5A8,r0
	mov.l	r0,@(12,r3)
	bra	.L0602C5EC
	nop
.L0602C588:
	.long player_obj
.L0602C58C:
	.long 0x7C000000
.L0602C590:
	.long play_state
.L0602C594:
	.long snd_seq_stop
.L0602C598:
	.long 0x0000EA24
.L0602C59C:
	.long func_060255C8
.L0602C5A0:
	.long obj_list_stage
.L0602C5A4:
	.long obj_alloc
.L0602C5A8:
	.long func_0603E500
.L0602C5AC:
	mov.l	.L0602C5DC,r2
	mov.l	.L0602C5E0,r0
	jsr	@r0
	nop
	mov.l	.L0602C5E4,r0
	mov.l	r0,@(12,r3)
	mov.l	@(656,gbr),r0
	mov.l	.L0602C5E8,r8
	mov.l	@r8+,r9
	add	r9,r0
	mov.l	@r8+,r9
	add	r9,r0
	mov.l	@r8+,r9
	add	r9,r0
	mov.l	@r8+,r9
	add	r9,r0
	mov.l	r0,@(656,gbr)
	mov.w	.L0602C5D8,r0
	mov.l	r0,@(44,r1)
	lds.l	@r15+,pr
	rts
	mov	#-1,r0
.L0602C5D8:
	.short 0x0082
	.byte 0x00, 0x00
.L0602C5DC:
	.long obj_list_stage
.L0602C5E0:
	.long obj_alloc
.L0602C5E4:
	.long func_06033054
.L0602C5E8:
	.long mare_score
.L0602C5EC:
	lds.l	@r15+,pr
	rts
	mov	#0,r0
	.byte 0x00, 0x09
	endlabel func_0602C534

	.section .data.0602C5F4,"aw",@progbits
	.p2align 2
	dlabel D_0602C5F4
	.byte 0x00, 0x00, 0x00, 0x00
