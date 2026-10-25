	.include "macro.inc"
	.include "saturn.inc"
	.include "game/core.inc"

	.section .text.0600CF6C,"ax",@progbits
	.p2align 2

! Gouraud-shade the model at r2 with the light: one colour per point from
! its normal, then 4 colours per polygon appended at GBR_GOURAUD_PTR.
! Clobbers r0, r4-r11.
	glabel light_shade_model
	mov.l	@(MODEL_NUM_POINTS,r2),r9
	mov.l	@(MODEL_NORMALS,r2),r10
	mov.l	.L0600D010,r7
	mov.l	@r7+,r8			! r8 = ramp, r7 = light direction
	mov.l	.L0600D014,r5
	mov	r5,r11
	mov.l	@(GBR_MTX,gbr),r0
	mov	r0,r6
	add	#MTX_M20,r6
.Lshade_point:
	! Rotate the normal into light_normal, z first (stored backwards from
	! light_vertex_colors)...
	clrmac
	mac.l	@r10+,@r6+
	mac.l	@r10+,@r6+
	mac.l	@r10+,@r6+
	add	#MTX_M10-MTX_TZ,r6
	add	#-VEC_SIZE,r10
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	mov.l	r4,@-r11
	clrmac
	mac.l	@r10+,@r6+
	mac.l	@r10+,@r6+
	mac.l	@r10+,@r6+
	add	#MTX_M00-MTX_TY,r6
	add	#-VEC_SIZE,r10
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	mov.l	r4,@-r11
	clrmac
	mac.l	@r10+,@r6+
	mac.l	@r10+,@r6+
	mac.l	@r10+,@r6+
	add	#MTX_M20-MTX_TX,r6
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	mov.l	r4,@-r11
	! ...and dot it with the light direction: -1.0..1.0 picks ramp[0..63].
	clrmac
	mac.l	@r7+,@r11+
	mac.l	@r7+,@r11+
	mac.l	@r7+,@r11+
	add	#-VEC_SIZE,r7
	sts	mach,r4
	sts	macl,r0
	xtrct	r4,r0
	shlr8	r0
	shlr2	r0
	exts.w	r0,r0
	add	#62,r0
	cmp/pz	r0
	bt	.Lshade_clamped
	mov	#0,r0
.Lshade_clamped:
	and	#126,r0
	mov.w	@(r0,r8),r0
	mov.w	r0,@r5
	add	#2,r5
	dt	r9
	bf/s	.Lshade_point
	nop
	mov.l	@(GBR_GOURAUD_PTR,gbr),r0
	mov	r0,r11
	mov.l	@(MODEL_POLYGONS,r2),r10
	mov.l	@(MODEL_NUM_POLYGONS,r2),r9
	shll2	r9
	mov.l	.L0600D014,r5
.Lshade_vertex:
	! A vertex reference is 8 * point, or -(8 * point + 8).
	mov.w	@r10+,r0
	cmp/pz	r0
	bt	.Lshade_vertex_ref
	neg	r0,r0
	add	#-8,r0
.Lshade_vertex_ref:
	shlr2	r0
	mov.w	@(r0,r5),r0
	mov.w	r0,@r11
	add	#2,r11
	dt	r9
	bf/s	.Lshade_vertex
	nop
	mov	r11,r0
	mov.l	r0,@(GBR_GOURAUD_PTR,gbr)
	rts
	nop
.L0600D010:
	.long light
.L0600D014:
	.long light_vertex_colors
	endlabel light_shade_model

! M = M * S(r4, r5, r6). Clobbers r2, r3, r7.
	glabel mtx_scale
	mov.l	@(GBR_MTX,gbr),r0
	mov.l	@(MTX_M00,r0),r2
	dmuls.l	r4,r2
	mov.l	@(MTX_M01,r0),r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r5,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M00,r0)
	mov.l	@(MTX_M02,r0),r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r6,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M01,r0)
	mov.l	@(MTX_M10,r0),r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r4,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M02,r0)
	mov.l	@(MTX_M11,r0),r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r5,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M10,r0)
	mov.l	@(MTX_M12,r0),r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r6,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M11,r0)
	mov.l	@(MTX_M20,r0),r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r4,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M12,r0)
	mov.l	@(MTX_M21,r0),r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r5,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M20,r0)
	mov.l	@(MTX_M22,r0),r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r6,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M21,r0)
	sts	mach,r2
	sts	macl,r3
	xtrct	r2,r3
	rts
	mov.l	r3,@(MTX_M22,r0)
	endlabel mtx_scale

! Empty all object lists and chain the whole pool into the free list.
	glabel obj_init
	mov	#0,r2
	mov.l	.L0600D0C0,r1
	mov	#8,r7
.Linit_list:
	mov.l	r2,@r1
	mov.l	r1,@(LIST_TAIL,r1)
	add	#LIST_SIZE,r1
	add	#-LIST_SIZE,r2
	dt	r7
	bf	.Linit_list
	mov	#0,r2
	mov.l	.L0600D0C4,r1
	mov.l	r2,@r1
	mov.l	.L0600D0C8,r0
	mov	r0,r1
	mov.l	.L0600D0CC,r2
	mov.l	r0,@r2
	mov.w	.L0600D0BC,r3
	mov.w	.L0600D0BE,r7
.Linit_node:
	mov	r0,r1
	add	r3,r0
	mov.l	r0,@(NODE_NEXT,r1)
	dt	r7
	bf	.Linit_node
	mov	#-1,r2
	rts
	mov.l	r2,@(NODE_NEXT,r1)
.L0600D0BC:
	.short NODE_SIZE
.L0600D0BE:
	.short OBJ_POOL_COUNT
.L0600D0C0:
	.long obj_list_core
.L0600D0C4:
	.long obj_count
.L0600D0C8:
	.long obj_pool
.L0600D0CC:
	.long obj_free_head
	endlabel obj_init

! Take a node from the free list, append it to the list at r2 and clear it
! (all but next, prev and handler).
! Out: r3 = node and T = 0, or r3 = obj_dummy_node and T = 1 when the pool
! is empty. Clobbers r0, r8.
	glabel obj_alloc
	mov.l	.L0600D12C,r8
	mov.l	@r8,r3
	cmp/pl	r3
	bf	.Lalloc_fail
	mov.l	@(NODE_NEXT,r3),r0
	mov.l	r0,@r8
	mov.l	@(LIST_TAIL,r2),r8
	mov.l	r8,@(NODE_PREV,r3)
	mov.l	@(NODE_NEXT,r8),r0
	cmp/pl	r0
	bf/s	.Lalloc_link
	mov.l	r0,@(NODE_NEXT,r3)
	mov.l	r3,@(NODE_PREV,r0)
.Lalloc_link:
	mov.l	r3,@(NODE_NEXT,r8)
	mov.l	r3,@(LIST_TAIL,r2)
	mov	#0,r0
	mov.l	r0,@(NODE_SPAWN_SLOT,r3)
	mov	r3,r8
	add	#NODE_SIZE,r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	.L0600D130,r8
	mov.l	@r8,r0
	add	#1,r0
	mov.l	r0,@r8
	rts
	clrt
	.byte 0x00, 0x00
.L0600D12C:
	.long obj_free_head
.L0600D130:
	.long obj_count
.Lalloc_fail:
	mov.l	.L0600D13C,r3
	rts
	sett
	.byte 0x00, 0x00
.L0600D13C:
	.long obj_dummy_node
	endlabel obj_alloc

	.section .data.0600D140,"aw",@progbits
	.p2align 2
	dlabel obj_dummy_node
	.fill	NODE_SIZE, 1, 0
