	.include "macro.inc"
	.include "saturn.inc"
	.include "game/core.inc"

	.section .text.0600C9C8,"ax",@progbits
	.p2align 2

! Empty the matrix stack and load the identity.
	glabel mtx_init
	mov	#0,r0
	mov.w	r0,@(GBR_MTX_DEPTH,gbr)
	mov.l	.L0600CAF4,r0
	mov.l	r0,@(GBR_MTX,gbr)
	mov	#1,r3
	shll16	r3
	mov	#0,r2
	mov.l	r3,@(MTX_M00,r0)
	mov.l	r2,@(MTX_M10,r0)
	mov.l	r2,@(MTX_M20,r0)
	mov.l	r2,@(MTX_M01,r0)
	mov.l	r3,@(MTX_M11,r0)
	mov.l	r2,@(MTX_M21,r0)
	mov.l	r2,@(MTX_M02,r0)
	mov.l	r2,@(MTX_M12,r0)
	mov.l	r3,@(MTX_M22,r0)
	mov.l	r2,@(MTX_TX,r0)
	mov.l	r2,@(MTX_TY,r0)
	mov.l	r2,@(MTX_TZ,r0)
	rts
	nop
	endlabel mtx_init

! Push the identity matrix. Out: r0 = 1.
	glabel mtx_push_identity
	mov.w	@(GBR_MTX_DEPTH,gbr),r0
	add	#1,r0
	mov.w	r0,@(GBR_MTX_DEPTH,gbr)
	mov.l	@(GBR_MTX,gbr),r0
	add	#MTX_SIZE,r0
	mov.l	r0,@(GBR_MTX,gbr)
	mov	#1,r3
	shll16	r3
	mov	#0,r2
	mov.l	r3,@(MTX_M00,r0)
	mov.l	r2,@(MTX_M10,r0)
	mov.l	r2,@(MTX_M20,r0)
	mov.l	r2,@(MTX_M01,r0)
	mov.l	r3,@(MTX_M11,r0)
	mov.l	r2,@(MTX_M21,r0)
	mov.l	r2,@(MTX_M02,r0)
	mov.l	r2,@(MTX_M12,r0)
	mov.l	r3,@(MTX_M22,r0)
	mov.l	r2,@(MTX_TX,r0)
	mov.l	r2,@(MTX_TY,r0)
	mov.l	r2,@(MTX_TZ,r0)
	rts
	mov	#1,r0
	rts				! unreachable
	mov	#0,r0
	endlabel mtx_push_identity

! Push a copy of the current matrix. Out: r0 = 1. Clobbers r2-r7.
	glabel mtx_push
	mov.w	@(GBR_MTX_DEPTH,gbr),r0
	add	#1,r0
	mov.w	r0,@(GBR_MTX_DEPTH,gbr)
	mov.l	@(GBR_MTX,gbr),r0
	mov	#MTX_SIZE,r6
	add	r0,r6
	mov	#3,r7
.L0600CA32:
	mov.l	@r0+,r2
	mov.l	@r0+,r3
	mov.l	@r0+,r4
	mov.l	@r0+,r5
	mov.l	r2,@(0,r6)
	mov.l	r3,@(4,r6)
	mov.l	r4,@(8,r6)
	mov.l	r5,@(12,r6)
	dt	r7
	bf/s	.L0600CA32
	add	#16,r6
	mov.l	r0,@(GBR_MTX,gbr)
	rts
	mov	#1,r0
	endlabel mtx_push

! Pop the matrix stack, but not below its bottom. Out: r0 = 1.
	glabel mtx_pop
	mov.w	@(GBR_MTX_DEPTH,gbr),r0
	cmp/pl	r0
	bf	.L0600CA5E
	add	#-1,r0
	mov.w	r0,@(GBR_MTX_DEPTH,gbr)
	mov.l	@(GBR_MTX,gbr),r0
	add	#-MTX_SIZE,r0
	mov.l	r0,@(GBR_MTX,gbr)
.L0600CA5E:
	rts
	mov	#1,r0
	endlabel mtx_pop

! r0 = angle. Out: r4 = sin, r5 = cos (16.16).
	glabel math_sincos_fx
	add	#8,r0
	extu.w	r0,r0
	mov.l	.L0600CAEC,r4
	shlr2	r0
	shlr2	r0
	mov.l	.L0600CAF0,r5
	shll	r0
	mov.w	@(r0,r4),r4
	mov.w	@(r0,r5),r5
	shll2	r4
	rts
	shll2	r5
	endlabel math_sincos_fx

! M = M * Rx(r0). Clobbers r2-r8. sin and cos are pushed so that mac.l
! can take one term of each new element from the stack.
	glabel mtx_rot_x
	sts.l	pr,@-r15
	bsr	math_sincos_fx
	nop
	lds.l	@r15+,pr
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	@(GBR_MTX,gbr),r0
	mov	r15,r8
	mov.l	@(MTX_M01,r0),r7
	mov	r0,r6
	dmuls.l	r5,r7
	neg	r4,r4
	add	#8,r0
	mac.l	@r8+,@r0+
	add	#-4,r0
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r4,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M01,r6)
	mac.l	@r8+,@r0+
	mov.l	@(MTX_M11,r6),r7
	add	#12,r0
	mov	r15,r8
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r5,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M02,r6)
	mac.l	@r8+,@r0+
	add	#-4,r0
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r4,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M11,r6)
	mac.l	@r8+,@r0+
	mov.l	@(MTX_M21,r6),r7
	add	#12,r0
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r5,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M12,r6)
	mac.l	@r15+,@r0+
	add	#-4,r0
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r4,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M21,r6)
	mac.l	@r15+,@r0+
	sts	mach,r2
	sts	macl,r3
	xtrct	r2,r3
	rts
	mov.l	r3,@(MTX_M22,r6)
.L0600CAEC:
	.long sin_table
.L0600CAF0:
	.long cos_table
.L0600CAF4:
	.long mtx_stack
	endlabel mtx_rot_x

! M = M * Ry(r0). Clobbers r2-r8.
	glabel mtx_rot_y
	sts.l	pr,@-r15
	bsr	math_sincos_fx
	nop
	lds.l	@r15+,pr
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	@(GBR_MTX,gbr),r0
	mov	r15,r8
	mov.l	@(MTX_M02,r0),r7
	dmuls.l	r5,r7
	neg	r4,r4
	mov	r0,r6
	mac.l	@r8+,@r0+
	add	#-4,r0
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r4,r7
	xtrct	r2,r3
	mov.l	@(MTX_M12,r6),r7
	mac.l	@r8+,@r0+
	mov.l	r3,@(MTX_M02,r6)
	add	#12,r0
	mov	r15,r8
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r5,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M00,r6)
	mac.l	@r8+,@r0+
	add	#-4,r0
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r4,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M12,r6)
	mac.l	@r8+,@r0+
	add	#12,r0
	mov.l	@(MTX_M22,r6),r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r5,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M10,r6)
	mac.l	@r15+,@r0+
	add	#-4,r0
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r4,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M22,r6)
	mac.l	@r15+,@r0+
	sts	mach,r2
	sts	macl,r3
	xtrct	r2,r3
	rts
	mov.l	r3,@(MTX_M20,r6)
	endlabel mtx_rot_y

! M = M * Rz(r0). Clobbers r2-r8.
	glabel mtx_rot_z
	sts.l	pr,@-r15
	bsr	math_sincos_fx
	nop
	lds.l	@r15+,pr
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	@(GBR_MTX,gbr),r0
	mov	r15,r8
	mov.l	@(MTX_M00,r0),r7
	neg	r4,r4
	dmuls.l	r5,r7
	mov	r0,r6
	add	#4,r0
	mac.l	@r8+,@r0+
	add	#-4,r0
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r4,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M00,r6)
	mac.l	@r8+,@r0+
	add	#8,r0
	mov	r15,r8
	mov.l	@r0+,r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r5,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M01,r6)
	mac.l	@r8+,@r0+
	add	#-4,r0
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r4,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M10,r6)
	mac.l	@r8+,@r0+
	add	#8,r0
	mov.l	@r0+,r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r5,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M11,r6)
	mac.l	@r15+,@r0+
	add	#-4,r0
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r4,r7
	xtrct	r2,r3
	mov.l	r3,@(MTX_M20,r6)
	mac.l	@r15+,@r0+
	sts	mach,r2
	sts	macl,r3
	xtrct	r2,r3
	rts
	mov.l	r3,@(MTX_M21,r6)
	endlabel mtx_rot_z

! M = M * T(r4, r5, r6): adds the rotated vector to the translation.
! Clobbers r2, r3, r5-r7. r0 walks the matrix, r5 the pushed y and z.
	glabel mtx_translate
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r8,@-r15
	mov.l	@(GBR_MTX,gbr),r0
	mov	r15,r5
	mov.l	@r0+,r8
	add	#4,r5
	dmuls.l	r4,r8
	mac.l	@r5+,@r0+
	mov.l	@(4,r0),r8			! tx (r0 = &m02)
	mac.l	@r5+,@r0+
	add	#-8,r5
	add	#4,r0
	mov	r0,r7
	sts	mach,r2
	sts	macl,r3
	mov.l	@r0+,r6
	dmuls.l	r4,r6
	xtrct	r2,r3
	add	r8,r3
	mac.l	@r5+,@r0+
	add	#-4,r7
	mov.l	r3,@r7
	mac.l	@r5+,@r0+
	add	#-8,r5
	mov.l	@r0+,r8
	mov.l	@r0+,r6
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r4,r6
	xtrct	r2,r3
	add	r8,r3
	mac.l	@r5+,@r0+
	add	#16,r7
	mov.l	r3,@r7
	mac.l	@r5+,@r0+
	mov.l	@r0,r7
	sts	mach,r2
	sts	macl,r3
	xtrct	r2,r3
	add	r7,r3
	mov.l	r3,@r0
	mov.l	@r15+,r8
	rts
	add	#8,r15
	endlabel mtx_translate

! Transform r9 points (vectors) from r10 to r11 by M, rows z, y, x.
! Out: r10 and r11 past the arrays. Clobbers r0, r2-r6.
	glabel mtx_transform_points
	mov.l	@(GBR_MTX,gbr),r0
	mov	r0,r6
	add	#MTX_M20,r6
	add	#-VEC_SIZE,r11
.L0600CC3C:
	clrmac
	mac.l	@r10+,@r6+
	mac.l	@r10+,@r6+
	mac.l	@r10+,@r6+
	mov.l	@r6,r2
	add	#MTX_M10-MTX_TZ,r6
	add	#-VEC_SIZE,r10
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	add	r2,r3
	clrmac
	mac.l	@r10+,@r6+
	add	#VEC_SIZE,r11
	mac.l	@r10+,@r6+
	mov.l	r3,@(VEC_Z,r11)
	mac.l	@r10+,@r6+
	mov.l	@r6,r2
	add	#MTX_M10-MTX_TZ,r6
	add	#-VEC_SIZE,r10
	sts	mach,r0
	sts	macl,r5
	clrmac
	mac.l	@r10+,@r6+
	xtrct	r0,r5
	add	r2,r5
	mac.l	@r10+,@r6+
	mov.l	r5,@(VEC_Y,r11)
	mac.l	@r10+,@r6+
	mov.l	@r6,r2
	add	#MTX_M20-MTX_TX,r6
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	add	r2,r4
	mov.l	r4,@(VEC_X,r11)
	dt	r9
	bf/s	.L0600CC3C
	nop
	rts
	nop
	endlabel mtx_transform_points

! Set the light: r8 = colour ramp, (r5, r6, r7) = direction, divided by the
! object scale r4 unless that is 1.0, then turned by the camera yaw and
! pitch. Clobbers r0, r2, r3, r5-r7, r10, r11.
	glabel light_set_dir
	mov	#1,r0
	shll16	r0
	cmp/eq	r4,r0
	bt	.L0600CCCA
	mov	r5,r2
	shlr16	r2
	exts.w	r2,r2
	shll16	r5
	mov	#-128,r10
	shll	r10
	mov.l	r4,@(DIVU_DVSR,r10)
	mov.l	r2,@(DIVU_DVDNTH,r10)
	mov.l	r5,@(DIVU_DVDNTL,r10)
	mov.l	@(DIVU_QUOT,r10),r5
	mov	r6,r2
	shlr16	r2
	exts.w	r2,r2
	shll16	r6
	mov.l	r4,@(DIVU_DVSR,r10)
	mov.l	r2,@(DIVU_DVDNTH,r10)
	mov.l	r6,@(DIVU_DVDNTL,r10)
	mov.l	@(DIVU_QUOT,r10),r6
	mov	r7,r2
	shlr16	r2
	exts.w	r2,r2
	shll16	r7
	mov.l	r4,@(DIVU_DVSR,r10)
	mov.l	r2,@(DIVU_DVDNTH,r10)
	mov.l	r7,@(DIVU_DVDNTL,r10)
	mov.l	@(DIVU_QUOT,r10),r7
.L0600CCCA:
	mov.w	@(GBR_CAM_YAW,gbr),r0
	sts.l	pr,@-r15
	mov.l	.L0600CD48,r10
	jsr	@r10
	nop
	lds.l	@r15+,pr
	shll2	r10
	shll2	r11
	dmuls.l	r11,r5
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	sub	r2,r3
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r7
	xtrct	r0,r7
	dmuls.l	r10,r5
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	add	r2,r7
	mov	r3,r5
	mov.w	@(GBR_CAM_PITCH,gbr),r0
	neg	r0,r0
	sts.l	pr,@-r15
	mov.l	.L0600CD48,r10
	jsr	@r10
	nop
	lds.l	@r15+,pr
	shll2	r10
	shll2	r11
	dmuls.l	r11,r6
	sts	mach,r0
	sts	macl,r3
	xtrct	r0,r3
	dmuls.l	r10,r7
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	add	r2,r3
	dmuls.l	r11,r7
	sts	mach,r0
	sts	macl,r7
	xtrct	r0,r7
	dmuls.l	r10,r6
	sts	mach,r0
	sts	macl,r2
	xtrct	r0,r2
	sub	r2,r7
	mov	r3,r6
	mov.l	.L0600CD4C,r2		! the end of light
	mov.l	r7,@-r2
	mov.l	r6,@-r2
	mov.l	r5,@-r2
	mov.l	r8,@-r2
	rts
	nop
	.byte 0x00, 0x00
.L0600CD48:
	.long math_sincos
.L0600CD4C:
	.long light_normal
	endlabel light_set_dir

	.section .data.0600CD50,"aw",@progbits
	.p2align 2
	dlabel light
	.fill	LIGHT_SIZE, 1, 0
	dlabel light_normal			! light_shade_model: the rotated normal
	.fill	VEC_SIZE, 1, 0
	dlabel light_vertex_colors		! light_shade_model: a colour per point
	.fill	512, 1, 0
