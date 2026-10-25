	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0600D1A0,"ax",@progbits
	.p2align 2

	glabel obj_free
	add	#-16,r1
	mov.l	@(0,r1),r2
	mov.l	@(4,r1),r3
	cmp/pl	r2
	bf	.L0600D1CC
	mov.l	r3,@(4,r2)
	mov.l	r2,@(0,r3)
	mov.l	.L0600D1C4,r4
	mov.l	@r4,r3
	mov.l	r1,@r4
	mov.l	r3,@(0,r1)
	add	#16,r1
	mov.l	.L0600D1C8,r4
	mov.l	@r4,r0
	add	#-1,r0
	rts
	mov.l	r0,@r4
	.byte 0x00, 0x00
.L0600D1C4:
	.long obj_free_head
.L0600D1C8:
	.long obj_count
.L0600D1CC:
	mov.l	r2,@(0,r3)
	neg	r2,r2
	mov.l	.L0600D1EC,r4
	add	r4,r2
	mov.l	r3,@r2
	mov.l	.L0600D1F0,r4
	mov.l	@r4,r3
	mov.l	r1,@r4
	mov.l	r3,@(0,r1)
	add	#16,r1
	mov.l	.L0600D1F4,r4
	mov.l	@r4,r0
	add	#-1,r0
	mov	#-1,r2
	rts
	mov.l	r0,@r4
.L0600D1EC:
	.long obj_list_tails
.L0600D1F0:
	.long obj_free_head
.L0600D1F4:
	.long obj_count
	endlabel obj_free

	glabel obj_run_list
	sts.l	pr,@-r15
	mov.l	@r2,r1
.L0600D1FC:
	cmp/pl	r1
	bf	.L0600D224
	mov.l	@(12,r1),r0
	add	#16,r1
	mov.l	r1,@-r15
	jsr	@r0
	nop
	mov.l	@r15+,r0
	cmp/eq	r0,r1
	bf	.L0600D22A
.L0600D210:
	add	#-16,r1
	mov.l	.L0600D220,r0
	mov.l	@r0,r0
	cmp/eq	r0,r1
	bf	.L0600D21C
	mov.l	@(4,r1),r1
.L0600D21C:
	bra	.L0600D1FC
	mov.l	@(0,r1),r1
.L0600D220:
	.long obj_free_head
.L0600D224:
	lds.l	@r15+,pr
	rts
	nop
.L0600D22A:
	mov	r0,r1
	bra	.L0600D210
	nop
	endlabel obj_run_list

	glabel obj_free_list
	sts.l	pr,@-r15
	mov.l	@r5,r1
.L0600D234:
	cmp/pl	r1
	bf	.L0600D244
	add	#16,r1
	bsr	obj_free
	nop
	mov	r2,r1
	bra	.L0600D234
	nop
.L0600D244:
	lds.l	@r15+,pr
	rts
	nop
	endlabel obj_free_list

	glabel obj_free_level_lists
	sts.l	pr,@-r15
	mov.l	.L0600D278,r5
	bsr	obj_free_list
	nop
	mov.l	.L0600D27C,r5
	bsr	obj_free_list
	nop
	mov.l	.L0600D280,r5
	bsr	obj_free_list
	nop
	mov.l	.L0600D284,r5
	bsr	obj_free_list
	nop
	mov.l	.L0600D288,r5
	bsr	obj_free_list
	nop
	mov.l	.L0600D28C,r5
	bsr	obj_free_list
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0600D278:
	.long obj_list_core
.L0600D27C:
	.long obj_list_manager
.L0600D280:
	.long obj_list_stage
.L0600D284:
	.long obj_list_effect
.L0600D288:
	.long obj_list_unused
.L0600D28C:
	.long obj_list_pause
	endlabel obj_free_level_lists

	glabel obj_free_load_lists
	sts.l	pr,@-r15
	mov.l	.L0600D2A0,r5
	bsr	obj_free_list
	nop
	lds.l	@r15+,pr
	mov.l	.L0600D2A4,r5
	bra	obj_free_list
	nop
.L0600D2A0:
	.long obj_list_load_task
.L0600D2A4:
	.long obj_list_load_scene
	endlabel obj_free_load_lists

	glabel obj_move_to_list
	add	#-16,r1
	mov.l	@(0,r1),r2
	mov.l	@(4,r1),r3
	cmp/pl	r2
	bf	.L0600D2CC
	mov.l	r3,@(4,r2)
	mov.l	r2,@(0,r3)
.L0600D2B6:
	mov.l	@(4,r4),r8
	mov.l	r8,@(4,r1)
	mov.l	@(0,r8),r0
	cmp/pl	r0
	bf/s	.L0600D2C4
	mov.l	r0,@(0,r1)
	mov.l	r1,@(4,r0)
.L0600D2C4:
	mov.l	r1,@(0,r8)
	mov.l	r1,@(4,r4)
	rts
	nop
.L0600D2CC:
	mov.l	r2,@(0,r3)
	neg	r2,r2
	mov.l	.L0600D2DC,r0
	add	r0,r2
	mov.l	r3,@r2
	bra	.L0600D2B6
	nop
	.byte 0x00, 0x00
.L0600D2DC:
	.long obj_list_tails
	endlabel obj_move_to_list

	glabel obj_chain_alloc
	mov.l	.L0600D32C,r4
	mov.l	@r4,r3
	cmp/pl	r3
	bf	.L0600D334
	mov.l	@(0,r3),r0
	mov.l	r0,@r4
	mov.l	@r1,r0
	mov.l	r0,@r3
	mov.l	r3,@r1
	mov	#0,r0
	add	#96,r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	mov.l	r0,@-r3
	add	#-4,r3
	mov.l	.L0600D330,r4
	mov.l	@r4,r0
	add	#1,r0
	mov.l	r0,@r4
	rts
	clrt
	.byte 0x00, 0x00
.L0600D32C:
	.long obj_free_head
.L0600D330:
	.long obj_count
.L0600D334:
	mov.l	.L0600D33C,r3
	rts
	sett
	.byte 0x00, 0x00
.L0600D33C:
	.long obj_chain_dummy_node
	endlabel obj_chain_alloc

	.section .data.0600D340,"aw",@progbits
	.p2align 2
	dlabel obj_chain_dummy_node
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.section .text.0600D3A0,"ax",@progbits
	.p2align 2

	glabel obj_chain_free
	mov.l	@r1,r2
	tst	r2,r2
	bt	.L0600D3C6
	add	#-16,r2
	mov.l	.L0600D3B8,r4
	mov.l	@r4,r3
	mov.l	r2,@r4
.L0600D3AE:
	mov.l	@r2,r4
	tst	r4,r4
	bt	.L0600D3BC
	bra	.L0600D3AE
	mov	r4,r2
.L0600D3B8:
	.long obj_free_head
.L0600D3BC:
	mov.l	r3,@(0,r2)
	mov.l	.L0600D3CC,r4
	mov.l	@r4,r0
	add	#-1,r0
	mov.l	r0,@r4
.L0600D3C6:
	rts
	nop
	.byte 0x00, 0x00
.L0600D3CC:
	.long obj_count
	endlabel obj_chain_free
