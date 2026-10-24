	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06050B34,"ax",@progbits
	.p2align 2

! SBL INT: the handler INT_SetScuFunc installs for a vector. int_scu_entry_NN (one per
! vector, listed in int_scu_entry_tbl) passes NN*4 to int_scu_entry_common, which calls
! int_scu_func_tbl[NN] if it is set, with MACH, MACL and PR saved around the call.
! The mov immediate is sign-extended, so stubs 80-FF index before the table.
	.irp hi, 0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F
	.irp lo, 0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F
	glabel int_scu_entry_\hi\lo
	mov	#0x\hi\lo,r0
	bra	int_scu_entry_common
	shll2	r0
	endlabel int_scu_entry_\hi\lo
	.endr
	.endr

	glabel int_scu_entry_common
	mov.l	.L06051150,r1
	mov.l	@(r0,r1),r2
	tst	r2,r2
	bt	.L0605114C
	sts.l	macl,@-r15
	sts.l	mach,@-r15
	sts.l	pr,@-r15
	jsr	@r2
	nop
	lds.l	@r15+,pr
	lds.l	@r15+,mach
	lds.l	@r15+,macl
.L0605114C:
	rts
	nop
.L06051150:
	.long int_scu_func_tbl
	endlabel int_scu_entry_common
