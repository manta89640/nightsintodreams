	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06040660,"ax",@progbits
	.p2align 2

	glabel func_06040660
	sts.l	pr,@-r15
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L0604066C
	bra	.L060406D4
	nop
.L0604066C:
	mov.l	.L060406E0,r8
	mov.l	.L060406E4,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bf	.L060406D4
	mov.l	.L060406E8,r2
	mov.l	.L060406EC,r4
	shll2	r0
	add	r0,r4
	mov.l	@r4,r4
	mov.l	r4,@-r15
	mov.l	.L060406F0,r0
	jsr	@r0
	nop
	mov.l	.L060406F4,r0
	jsr	@r0
	nop
	mov.l	@r15+,r4
	cmp/pz	r0
	bt	.L06040698
	neg	r0,r0
.L06040698:
	mov.l	.L060406F8,r8
	cmp/ge	r8,r0
	bf	.L060406AE
	mov.l	@(60,r1),r0
	mov.l	r0,@(60,r4)
	mov.l	.L060406FC,r2
	mov.l	.L06040700,r0
	jsr	@r0
	nop
	mov.l	.L06040704,r0
	mov.l	r0,@(12,r3)
.L060406AE:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#27,r6
	mov.l	.L06040708,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L0604070C,r4
	mov.l	@r4,r4
	mov	#0,r0
	mov.l	r0,@(44,r4)
.L060406D4:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L06040710
	lds.l	@r15+,pr
	rts
	nop
.L060406E0:
	.long 0x00280000
.L060406E4:
	.long obj_find_near_player
.L060406E8:
	.long 0x00040000
.L060406EC:
	.long player_obj
.L060406F0:
	.long func_0602441C
.L060406F4:
	.long func_06018D60
.L060406F8:
	.long 0x00400000
.L060406FC:
	.long obj_list_effect
.L06040700:
	.long obj_alloc
.L06040704:
	.long func_0603E528
.L06040708:
	.long snd_seq_start
.L0604070C:
	.long D_06040538
.L06040710:
	mov.l	.L06040764,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06040768,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r4
	mov	r0,r5
	mov.l	.L0604076C,r14
	jsr	@r14
	mov	r0,r6
	mov.w	@(24,r1),r0
	mov.w	.L0604075E,r8
	mov.l	.L06040770,r14
	jsr	@r14
	add	r8,r0
	mov.w	@(26,r1),r0
	mov.w	.L06040760,r8
	mov.l	.L06040774,r14
	jsr	@r14
	add	r8,r0
	mov.w	@(22,r1),r0
	mov.l	.L06040778,r2
	jsr	@r2
	nop
	mov.l	.L0604077C,r2
	mov.l	.L06040780,r0
	jsr	@r0
	nop
	mov.l	.L06040784,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0604075E:
	.short 0x4000
.L06040760:
	.short 0xC000
	.byte 0x00, 0x00
.L06040764:
	.long mtx_push
.L06040768:
	.long mtx_translate
.L0604076C:
	.long mtx_scale
.L06040770:
	.long mtx_rot_y
.L06040774:
	.long mtx_rot_x
.L06040778:
	.long mtx_rot_z
.L0604077C:
	.long D_06082A64
.L06040780:
	.long poly_draw_model_color
.L06040784:
	.long mtx_pop
	endlabel func_06040660

	.section .data.06040788,"aw",@progbits
	.p2align 2
	dlabel D_06040788
	.byte 0x00, 0x00, 0x00, 0x04
	.long D_06083044
	.byte 0x00, 0x00, 0x2A, 0xAA
	.long D_06083324
	.byte 0x00, 0x00, 0x40, 0x00
	.long D_06083604
	.byte 0x00, 0x00, 0x40, 0x00
	.long D_060838E4
	.byte 0x00, 0x00, 0x10, 0x00
	.long D_06083044
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0x03, 0x80, 0x10, 0xD0, 0x02, 0x21, 0x06, 0x71, 0x04, 0x00, 0x0B
	.byte 0x00, 0x09, 0x00, 0x00
	.long D_060407C8
	dlabel D_060407C8
	.byte 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01
	.byte 0x40, 0x2B, 0x00, 0x09
	.long obj_free
