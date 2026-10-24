	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06067300,"ax",@progbits
	.p2align 2

! Hand-written assembly (it saves r1-r14 and its helpers share its registers), not SHC output.
!
! vdp2_bmp_decode(x r4, y r5, src r6, flags r7) unpacks a compressed 15-bit RGB image into
! the 512x256 16bpp VDP2 bitmap at pixel (x, y) (rows are 0x400 bytes apart).
! src: u16 unused, u16 depth (must be 15), u16 width, u16 height, then a 32-bit-word bitstream.
! flags: 1 clear the rectangle first, 8 use the second VRAM half (+0x40000),
!        2 then set bit 15 (opaque) on every pixel, 4 only on non-zero pixels.
! The image is a sequence of runs that repeat the pixel to the left, each followed by one
! new pixel: a literal colour, or an index into a 128-entry move-to-front colour list.
! A new pixel can start a "chain" that marks the same colour in the following rows.
!
! Registers while decoding: r6 bit buffer (MSB first), r7 bits left in it, r14 source,
! r9 output pointer, r4 pixels left in the row, r3 current run length, r8 row pitch,
! r11/r12/r13 the colour list's value/next/prev tables (u16 byte offsets).
! Stack: @(0) list head, @(2) rows left, @(4) flags, @(8) width, @(12) height,
! @(16) top-left pixel address, @(24) next row.

! Bad header or rectangle out of range: return without drawing. Placed before the entry point.
.L06067300:
	add	#28,r15
	mov.l	@r15+,r14
	mov.l	@r15+,r13
	mov.l	@r15+,r12
	mov.l	@r15+,r11
	mov.l	@r15+,r10
	mov.l	@r15+,r9
	mov.l	@r15+,r8
	mov.l	@r15+,r7
	mov.l	@r15+,r6
	mov.l	@r15+,r5
	mov.l	@r15+,r4
	mov.l	@r15+,r3
	mov.l	@r15+,r2
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop

	glabel vdp2_bmp_decode
	sts.l	pr,@-r15
	mov.l	r1,@-r15
	mov.l	r2,@-r15
	mov.l	r3,@-r15
	mov.l	r4,@-r15
	mov.l	r5,@-r15
	mov.l	r6,@-r15
	mov.l	r7,@-r15
	mov.l	r8,@-r15
	mov.l	r9,@-r15
	mov.l	r10,@-r15
	mov.l	r11,@-r15
	mov.l	r12,@-r15
	mov.l	r13,@-r15
	mov.l	r14,@-r15
	add	#-28,r15
	mov.l	.L060673D0,r11
	mov	r6,r14
	mov.l	r6,@(20,r15)
	mov	r7,r0
	mov.w	r0,@(4,r15)
	mov	#32,r7
	! Header words come through r6 one step behind the r0 copies.
	mov.w	@r14+,r6
	mov	r6,r0
	mov.w	@r14+,r6
	mov	r6,r0
	mov.w	@r14+,r6
	cmp/eq	#15,r0
	bf	.L06067300
	mov	r6,r0
	mov.w	@r14+,r6
	mov.l	r0,@(8,r15)
	add	#-1,r0
	mov	r0,r1
	mov	r6,r0
	mov.l	@r14+,r6
	mov.l	r0,@(12,r15)
	add	#-1,r0
	mov	r0,r2
	add	r4,r1
	! x + width - 1 <= 511 and y + height - 1 <= 255
	mov.w	.L060673C8,r0
	cmp/hi	r0,r1
	bt	.L06067300
	add	r5,r2
	mov.w	.L060673CA,r0
	cmp/hi	r0,r2
	bt	.L06067300
	mov.w	.L060673CC,r0
	mulu.w	r0,r5
	shll	r4
	mov.w	@(4,r15),r0
	tst	#8,r0
	mov.l	.L060673D4,r0
	bt	.L06067392
	mov.l	.L060673D8,r0
.L06067392:
	sts	macl,r5
	add	r4,r0
	add	r5,r0
	mov.l	r0,@(16,r15)
	mov.w	@(4,r15),r0
	tst	#1,r0
	bt	.L060673A4
	bsr	vdp2_bmp_clear
	nop
.L060673A4:
	bsr	vdp2_bmp_init_lru
	nop
	mov.w	.L060673CC,r8
	mov.l	@(16,r15),r0
	bsr	vdp2_bmp_read_count
	mov.l	r0,@(24,r15)
	mov.l	@(12,r15),r0
.L060673B2:
	mov.w	r0,@(2,r15)
	mov.l	@(24,r15),r0
	mov	r0,r9
	add	r8,r0
	mov.l	r0,@(24,r15)
	mov.l	@(8,r15),r0
	mov	r0,r4
.L060673C0:
	cmp/hi	r4,r3
	bf	.L060673DC
	bra	.L060674FE
	nop
.L060673C8:
	.short 0x01FF
.L060673CA:
	.short 0x00FF
.L060673CC:
	.short 0x0400
	.byte 0x00, 0x00
.L060673D0:
	.long D_060CB100
.L060673D4:
	.long VDP2_VRAM_CACHED
.L060673D8:
	.long VDP2_VRAM_CACHED + 0x40000
.L060673DC:
	! The run fits in this row: copy run-1 pixels, then decode one new pixel.
	sub	r3,r4
	add	#-1,r3
	tst	r3,r3
	bt	.L060673E8
	bsr	vdp2_bmp_copy_run
	mov	r3,r5
.L060673E8:
	! Bit 0: a 16-bit literal colour; it replaces the entry after the head, which becomes the head.
	! Bit 1: a 7-bit list index; that entry moves to the head.
	cmp/pz	r6
	bf	.L06067426
	mov	#16,r0
	cmp/hs	r0,r7
	bf	.L06067404
	mov	r6,r2
	shlr16	r2
	add	#-16,r7
	tst	r7,r7
	bf/s	.L0606741C
	shll16	r6
	mov	#32,r7
	bra	.L0606741C
	mov.l	@r14+,r6
.L06067404:
	shlr16	r6
	mov	r6,r0
	mov.l	@r14+,r6
	neg	r7,r10
	add	#16,r10
	add	#16,r7
	mov	#0,r2
.L06067412:
	shll	r6
	rotcl	r2
	dt	r10
	bf	.L06067412
	add	r0,r2
.L0606741C:
	mov.w	@(0,r15),r0
	mov.w	@(r0,r12),r0
	mov.w	r0,@(0,r15)
	bra	.L0606748E
	mov.w	r2,@(r0,r11)
.L06067426:
	mov.w	@(0,r15),r0
	mov	r0,r1
	mov	#8,r0
	cmp/hs	r0,r7
	bf	.L06067446
	mov	r6,r0
	shll8	r6
	shlr16	r0
	shlr8	r0
	add	#-8,r7
	tst	r7,r7
	bf/s	.L06067462
	and	#127,r0
	mov	#32,r7
	bra	.L06067462
	mov.l	@r14+,r6
.L06067446:
	shlr16	r6
	shlr8	r6
	mov	r6,r0
	mov.l	@r14+,r6
	and	#127,r0
	neg	r7,r10
	add	#8,r10
	add	#24,r7
	mov	#0,r2
.L06067458:
	shll	r6
	rotcl	r2
	dt	r10
	bf	.L06067458
	add	r2,r0
.L06067462:
	shll	r0
	mov	r0,r10
	cmp/eq	r1,r0
	bt	.L0606748C
	mov.w	@(r0,r13),r2
	mov.w	@(r0,r12),r1
	mov	r2,r0
	mov.w	r1,@(r0,r12)
	mov	r1,r0
	mov.w	r2,@(r0,r13)
	mov.w	@(0,r15),r0
	mov	r0,r1
	mov.w	@(r0,r12),r2
	mov.w	r10,@(r0,r12)
	mov	r10,r0
	mov.w	r2,@(r0,r12)
	mov	r2,r0
	mov.w	r10,@(r0,r13)
	mov	r10,r0
	mov.w	r1,@(r0,r13)
	mov.w	r0,@(0,r15)
.L0606748C:
	mov.w	@(r0,r11),r2
.L0606748E:
	! Store the new pixel. A following 1 bit starts a chain: each 2-bit step 1-3 marks
	! the pixel one row down at dx -1..+1; step 0 then 0 ends it, step 0 then 1 then b
	! moves dx -2 (b=0) or +2 (b=1). Marks are the inverted colour (bit 15 set), which
	! vdp2_bmp_copy_run picks up when a later run passes over them.
	mov.w	r2,@r9
	mov	r9,r10
	add	#2,r9
	dt	r7
	bf/s	.L0606749E
	shll	r6
	mov.l	@r14+,r6
	mov	#32,r7
.L0606749E:
	bf	.L060674F2
	not	r2,r1
.L060674A2:
	mov	#0,r0
	dt	r7
	bf/s	.L060674AE
	shll	r6
	mov.l	@r14+,r6
	mov	#32,r7
.L060674AE:
	rotcl	r0
	dt	r7
	bf/s	.L060674BA
	shll	r6
	mov.l	@r14+,r6
	mov	#32,r7
.L060674BA:
	rotcl	r0
	tst	r0,r0
	bt	.L060674CC
	shll	r0
	add	#-4,r0
	add	r0,r10
	add	r8,r10
	bra	.L060674A2
	mov.w	r1,@r10
.L060674CC:
	dt	r7
	bf/s	.L060674D6
	shll	r6
	mov.l	@r14+,r6
	mov	#32,r7
.L060674D6:
	bf	.L060674F2
	dt	r7
	bf/s	.L060674E2
	shll	r6
	mov.l	@r14+,r6
	mov	#32,r7
.L060674E2:
	bt/s	.L060674EC
	add	r8,r10
	add	#-4,r10
	bra	.L060674A2
	mov.w	r1,@r10
.L060674EC:
	add	#4,r10
	bra	.L060674A2
	mov.w	r1,@r10
	! Next run length; the run may continue into the following rows.
.L060674F2:
	bsr	vdp2_bmp_read_count
	nop
	tst	r4,r4
	bt	.L06067504
	bra	.L060673C0
	nop
.L060674FE:
	bsr	vdp2_bmp_copy_run
	mov	r4,r5
	sub	r4,r3
.L06067504:
	mov.w	@(2,r15),r0
	add	#-1,r0
	cmp/pl	r0
	bf	.L06067510
	bra	.L060673B2
	nop
.L06067510:
	mov.w	@(4,r15),r0
	tst	#2,r0
	bt	.L0606751C
	bsr	vdp2_bmp_set_msb
	nop
	bra	.L06067524
	! Also the delay slot of the bra above.
.L0606751C:
	tst	#4,r0
	bt	.L06067524
	bsr	vdp2_bmp_set_msb_nonzero
	nop
.L06067524:
	add	#28,r15
	mov.l	@r15+,r14
	mov.l	@r15+,r13
	mov.l	@r15+,r12
	mov.l	@r15+,r11
	mov.l	@r15+,r10
	mov.l	@r15+,r9
	mov.l	@r15+,r8
	mov.l	@r15+,r7
	mov.l	@r15+,r6
	mov.l	@r15+,r5
	mov.l	@r15+,r4
	mov.l	@r15+,r3
	mov.l	@r15+,r2
	mov.l	@r15+,r1
	lds.l	@r15+,pr
	rts
	nop
	endlabel vdp2_bmp_decode

! Write r5 pixels at r9 (advancing it): the colour in r2, except that a chain mark already
! in the bitmap (bit 15 set) switches r2 to the marked colour.
	glabel vdp2_bmp_copy_run
	mov	#-2,r0
.L0606754A:
	mov.w	@r9+,r1
	cmp/pz	r1
	bf/s	.L0606755A
	dt	r5
	bf/s	.L0606754A
	mov.w	r2,@(r0,r9)
	rts
	nop
.L0606755A:
	not	r1,r2
	bf/s	.L0606754A
	mov.w	r2,@(r0,r9)
	rts
	nop
	endlabel vdp2_bmp_copy_run

! Read a gamma-style count from the bitstream: n 1 bits, a 0, then n+1 bits b;
! returns r3 = 2^(n+1) - 1 + b, so at least 1 (r0, r1 clobbered).
	glabel vdp2_bmp_read_count
	mov	#0,r0
	mov	#1,r3
.L06067568:
	dt	r7
	bf/s	.L06067572
	shll	r6
	mov.l	@r14+,r6
	mov	#32,r7
.L06067572:
	add	#1,r0
	bt/s	.L06067568
	shll	r3
	add	#-1,r3
.L0606757A:
	dt	r7
	bf/s	.L06067584
	shll	r6
	mov.l	@r14+,r6
	mov	#32,r7
.L06067584:
	rotcl	r1
	dt	r0
	bf	.L0606757A
	and	r3,r1
	rts
	add	r1,r3
	endlabel vdp2_bmp_read_count

! Reset the colour list: 128 zero colours in a circular doubly linked list, head 0.
! Leaves r11/r12/r13 at the value/next/prev tables (r11 holds the work area on entry).
	glabel vdp2_bmp_init_lru
	mov	#0,r1
	mov.w	.L060675BC,r2
	mov.w	.L060675BE,r3
	add	r2,r11
	mov	r2,r12
	add	r11,r12
	mov	r2,r13
	add	r12,r13
	mov.w	.L060675C0,r0
.L060675A2:
	mov.w	r1,@-r11
	mov.w	r2,@-r12
	mov.w	r3,@-r13
	add	#-2,r2
	dt	r0
	bf/s	.L060675A2
	add	#-2,r3
	mov.w	r0,@(0,r15)
	mov.w	r0,@-r13
	mov.w	.L060675C2,r0
	add	#2,r13
	rts
	mov.w	r0,@r13
.L060675BC:
	.short 0x0100
.L060675BE:
	.short 0x00FC
.L060675C0:
	.short 0x0080
.L060675C2:
	.short 0x00FE
	endlabel vdp2_bmp_init_lru

! The helpers below read the rectangle from vdp2_bmp_decode's stack frame (their
! caller's @(8..16,r15) is theirs too, as bsr pushes nothing).
	glabel vdp2_bmp_clear
	mov.l	@(16,r15),r1
	mov.l	@(8,r15),r3
	add	#-1,r3
	add	r3,r3
	mov.l	@(12,r15),r4
	mov.w	.L060675E6,r8
	mov	#0,r5
.L060675D2:
	mov	r3,r0
.L060675D4:
	mov.w	r5,@(r0,r1)
	add	#-2,r0
	cmp/pz	r0
	bt	.L060675D4
	add	r8,r1
	dt	r4
	bf	.L060675D2
	rts
	nop
.L060675E6:
	.short 0x0400
	endlabel vdp2_bmp_clear

	glabel vdp2_bmp_set_msb
	mov.l	@(16,r15),r1
	mov.l	.L06067610,r2
	mov.l	@(8,r15),r3
	add	#-1,r3
	add	r3,r3
	mov.l	@(12,r15),r4
	mov.w	.L0606760E,r8
.L060675F6:
	mov	r3,r0
.L060675F8:
	mov.w	@(r0,r1),r5
	or	r2,r5
	mov.w	r5,@(r0,r1)
	add	#-2,r0
	cmp/pz	r0
	bt	.L060675F8
	add	r8,r1
	dt	r4
	bf	.L060675F6
	rts
	nop
.L0606760E:
	.short 0x0400
.L06067610:
	.long 0x00008000
	endlabel vdp2_bmp_set_msb

	glabel vdp2_bmp_set_msb_nonzero
	mov.l	@(16,r15),r1
	mov.l	.L06067640,r2
	mov.l	@(8,r15),r3
	add	#-1,r3
	add	r3,r3
	mov.l	@(12,r15),r4
	mov.w	.L0606763E,r8
.L06067622:
	mov	r3,r0
.L06067624:
	mov.w	@(r0,r1),r5
	tst	r5,r5
	bt	.L0606762E
	or	r2,r5
	mov.w	r5,@(r0,r1)
.L0606762E:
	cmp/pl	r0
	bt/s	.L06067624
	add	#-2,r0
	dt	r4
	bf/s	.L06067622
	add	r8,r1
	rts
	nop
.L0606763E:
	.short 0x0400
.L06067640:
	.long 0x00008000
	endlabel vdp2_bmp_set_msb_nonzero
