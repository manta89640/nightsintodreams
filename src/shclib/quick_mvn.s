	.include "macro.inc"
	.include "saturn.inc"

	.section .text.060508C4,"ax",@progbits
	.p2align 2

! SHC runtime block moves for struct copies of up to 64 bytes in whole longwords:
! r0 = size, r1 = dst, r2 = src (both 4-aligned). SHC calls __quick_evn_mvn for an even
! number of longwords and __quick_odd_mvn for an odd one. Both preload the last longword
! (into r0 or r3) and jump into an unrolled copy that alternates r0 and r3, at the entry
! _quick_mvn_tbl gives for the size; _quick_mvn_N copies the first N bytes. Only r0 changes.
	glabel _quick_evn_mvn
	mov.l	r3,@-r15
	mov.l	.L060508DC,r3
	mov.l	@(r0,r3),r3
	add	#-4,r0
	jmp	@r3
	mov.l	@(r0,r2),r0
	endlabel _quick_evn_mvn

	glabel _quick_odd_mvn
	mov.l	r3,@-r15
	mov.l	.L060508DC,r3
	mov.l	@(r0,r3),r3
	add	#-4,r0
	jmp	@r3
	mov.l	@(r0,r2),r3
.L060508DC:
	.long _quick_mvn_tbl
	nop			! puts _quick_mvn_tbl on a 4-byte boundary
	endlabel _quick_odd_mvn

	glabel _quick_mvn_64
	mov.l	@(56,r2),r3
	mov.l	r0,@(60,r1)
	endlabel _quick_mvn_64

	glabel _quick_mvn_60
	mov.l	@(52,r2),r0
	mov.l	r3,@(56,r1)
	endlabel _quick_mvn_60

	glabel _quick_mvn_56
	mov.l	@(48,r2),r3
	mov.l	r0,@(52,r1)
	endlabel _quick_mvn_56

	glabel _quick_mvn_52
	mov.l	@(44,r2),r0
	mov.l	r3,@(48,r1)
	endlabel _quick_mvn_52

	glabel _quick_mvn_48
	mov.l	@(40,r2),r3
	mov.l	r0,@(44,r1)
	endlabel _quick_mvn_48

	glabel _quick_mvn_44
	mov.l	@(36,r2),r0
	mov.l	r3,@(40,r1)
	endlabel _quick_mvn_44

	glabel _quick_mvn_40
	mov.l	@(32,r2),r3
	mov.l	r0,@(36,r1)
	endlabel _quick_mvn_40

	glabel _quick_mvn_36
	mov.l	@(28,r2),r0
	mov.l	r3,@(32,r1)
	endlabel _quick_mvn_36

	glabel _quick_mvn_32
	mov.l	@(24,r2),r3
	mov.l	r0,@(28,r1)
	endlabel _quick_mvn_32

	glabel _quick_mvn_28
	mov.l	@(20,r2),r0
	mov.l	r3,@(24,r1)
	endlabel _quick_mvn_28

	glabel _quick_mvn_24
	mov.l	@(16,r2),r3
	mov.l	r0,@(20,r1)
	endlabel _quick_mvn_24

	glabel _quick_mvn_20
	mov.l	@(12,r2),r0
	mov.l	r3,@(16,r1)
	endlabel _quick_mvn_20

	glabel _quick_mvn_16
	mov.l	@(8,r2),r3
	mov.l	r0,@(12,r1)
	endlabel _quick_mvn_16

	glabel _quick_mvn_12
	mov.l	@(4,r2),r0
	mov.l	r3,@(8,r1)
	endlabel _quick_mvn_12

	glabel _quick_mvn_8
	mov.l	@r2,r3
	mov.l	r0,@(4,r1)
	endlabel _quick_mvn_8

	glabel _quick_mvn_4
	mov.l	r3,@r1
	endlabel _quick_mvn_4

	glabel _quick_mvn_0
	rts
	mov.l	@r15+,r3
	endlabel _quick_mvn_0

	.section .data.06050924,"aw",@progbits
	.p2align 2
	dlabel _quick_mvn_tbl
	.long _quick_mvn_0
	.long _quick_mvn_4
	.long _quick_mvn_8
	.long _quick_mvn_12
	.long _quick_mvn_16
	.long _quick_mvn_20
	.long _quick_mvn_24
	.long _quick_mvn_28
	.long _quick_mvn_32
	.long _quick_mvn_36
	.long _quick_mvn_40
	.long _quick_mvn_44
	.long _quick_mvn_48
	.long _quick_mvn_52
	.long _quick_mvn_56
	.long _quick_mvn_60
	.long _quick_mvn_64
