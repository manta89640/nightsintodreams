	.include "macro.inc"
	.include "saturn.inc"
	.include "game/core.inc"

	.section .text.0600D1A0,"ax",@progbits
	.p2align 2

! Free the object whose body is r1.
! Out: r1 = the body again (its node now heads the free list), r2 = the
! following node, or -1 when it was the last one. Clobbers r3, r4.
	glabel obj_free
	add	#-OBJ_BODY,r1
	mov.l	@(NODE_NEXT,r1),r2
	mov.l	@(NODE_PREV,r1),r3
	cmp/pl	r2
	bf	.Lfree_last
	mov.l	r3,@(NODE_PREV,r2)
	mov.l	r2,@(NODE_NEXT,r3)
	mov.l	.L0600D1C4,r4
	mov.l	@r4,r3
	mov.l	r1,@r4
	mov.l	r3,@(NODE_NEXT,r1)
	add	#OBJ_BODY,r1
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
.Lfree_last:
	! The terminator gives the list: its tail slot is obj_list_tails - next.
	mov.l	r2,@(NODE_NEXT,r3)
	neg	r2,r2
	mov.l	.L0600D1EC,r4
	add	r4,r2
	mov.l	r3,@r2
	mov.l	.L0600D1F0,r4
	mov.l	@r4,r3
	mov.l	r1,@r4
	mov.l	r3,@(NODE_NEXT,r1)
	add	#OBJ_BODY,r1
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

! Call the handler of every object in the list at r2, with r1 = body.
! Handlers may change r1 and may free their own object.
	glabel obj_run_list
	sts.l	pr,@-r15
	mov.l	@r2,r1
.Lrun_next:
	cmp/pl	r1
	bf	.Lrun_done
	mov.l	@(NODE_HANDLER,r1),r0
	add	#OBJ_BODY,r1
	mov.l	r1,@-r15
	jsr	@r0
	nop
	mov.l	@r15+,r0
	cmp/eq	r0,r1
	bf	.Lrun_restore
.Lrun_step:
	add	#-OBJ_BODY,r1
	mov.l	.L0600D220,r0
	mov.l	@r0,r0
	! A node that freed itself heads the free list now, but its prev still
	! points into this list.
	cmp/eq	r0,r1
	bf	.Lrun_follow
	mov.l	@(NODE_PREV,r1),r1
.Lrun_follow:
	bra	.Lrun_next
	mov.l	@(NODE_NEXT,r1),r1
.L0600D220:
	.long obj_free_head
.Lrun_done:
	lds.l	@r15+,pr
	rts
	nop
.Lrun_restore:
	mov	r0,r1
	bra	.Lrun_step
	nop
	endlabel obj_run_list

! Free every object in the list at r5.
	glabel obj_free_list
	sts.l	pr,@-r15
	mov.l	@r5,r1
.Lfree_list_next:
	cmp/pl	r1
	bf	.Lfree_list_done
	add	#OBJ_BODY,r1
	bsr	obj_free
	nop
	mov	r2,r1
	bra	.Lfree_list_next
	nop
.Lfree_list_done:
	lds.l	@r15+,pr
	rts
	nop
	endlabel obj_free_list

! Free every object of the lists that only live during a level.
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

! Free every object of the two lists used while loading.
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

! Move the object whose body is r1 to the end of the list at r4.
! Out: r1 = its node. Clobbers r0, r2, r3, r8.
	glabel obj_move_to_list
	add	#-OBJ_BODY,r1
	mov.l	@(NODE_NEXT,r1),r2
	mov.l	@(NODE_PREV,r1),r3
	cmp/pl	r2
	bf	.Lmove_last
	mov.l	r3,@(NODE_PREV,r2)
	mov.l	r2,@(NODE_NEXT,r3)
.Lmove_append:
	mov.l	@(LIST_TAIL,r4),r8
	mov.l	r8,@(NODE_PREV,r1)
	mov.l	@(NODE_NEXT,r8),r0
	cmp/pl	r0
	bf/s	.Lmove_link
	mov.l	r0,@(NODE_NEXT,r1)
	mov.l	r1,@(NODE_PREV,r0)
.Lmove_link:
	mov.l	r1,@(NODE_NEXT,r8)
	mov.l	r1,@(LIST_TAIL,r4)
	rts
	nop
.Lmove_last:
	mov.l	r2,@(NODE_NEXT,r3)
	neg	r2,r2
	mov.l	.L0600D2DC,r0
	add	r0,r2
	mov.l	r3,@r2
	bra	.Lmove_append
	nop
	.byte 0x00, 0x00
.L0600D2DC:
	.long obj_list_tails
	endlabel obj_move_to_list

! Unused: an older allocator that pushes the new node onto a singly linked
! chain at r1 instead of a list, and clears the body except its first long.
! Out: r3 = body and T = 0, or r3 = obj_chain_dummy_node and T = 1 when the
! pool is empty.
	glabel obj_chain_alloc
	mov.l	.L0600D32C,r4
	mov.l	@r4,r3
	cmp/pl	r3
	bf	.Lchain_alloc_fail
	mov.l	@(NODE_NEXT,r3),r0
	mov.l	r0,@r4
	mov.l	@r1,r0
	mov.l	r0,@r3
	mov.l	r3,@r1
	mov	#0,r0
	add	#NODE_SIZE,r3
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
.Lchain_alloc_fail:
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
	.fill	NODE_SIZE, 1, 0

	.section .text.0600D3A0,"ax",@progbits
	.p2align 2

! Unused: returns the whole chain at r1 to the free list (and counts only
! one object).
	glabel obj_chain_free
	mov.l	@r1,r2
	tst	r2,r2
	bt	.Lchain_free_done
	add	#-OBJ_BODY,r2
	mov.l	.L0600D3B8,r4
	mov.l	@r4,r3
	mov.l	r2,@r4
.Lchain_find_last:
	mov.l	@r2,r4
	tst	r4,r4
	bt	.Lchain_splice
	bra	.Lchain_find_last
	mov	r4,r2
.L0600D3B8:
	.long obj_free_head
.Lchain_splice:
	mov.l	r3,@(NODE_NEXT,r2)
	mov.l	.L0600D3CC,r4
	mov.l	@r4,r0
	add	#-1,r0
	mov.l	r0,@r4
.Lchain_free_done:
	rts
	nop
	.byte 0x00, 0x00
.L0600D3CC:
	.long obj_count
	endlabel obj_chain_free
