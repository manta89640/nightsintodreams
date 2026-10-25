! sbl/stm_grp: matching source. The readable C for this object is stm_grp.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06068644,"ax",@progbits
	.p2align 2

	glabel stm_init_mng
	mov.l	r14,@-r15
	mov	#60,r3
	sts.l	pr,@-r15
	add	#-12,r15
	mov.l	.L06068788,r14
	mov.l	r4,@(4,r15)
	mov.l	r5,@r15
	mov	#0,r5
	mov.l	r6,@r14
	mov.l	@(4,r15),r2
	mul.l	r3,r2
	sts	macl,r6
	mov.l	r6,@(8,r15)
	mov.l	@r15,r2
	mov	r2,r1
	shll	r2
	add	r1,r2
	shll2	r2
	shll2	r2
	add	r2,r6
	mov.l	.L0606878C,r2
	add	#48,r6
	jsr	@r2
	mov.l	@r14,r4
	mov.l	@r14,r3
	mov	#-1,r4
	mov	r3,r2
	add	#48,r2
	mov.l	r2,@r3
	mov.l	@r14,r3
	mov.l	@(4,r15),r2
	mov.l	r2,@(4,r3)
	mov.l	@r14,r3
	mov	r3,r2
	mov.l	@(8,r15),r1
	mov.l	@r2,r0
	add	r1,r0
	mov	#0,r1
	mov.l	r0,@(8,r3)
	mov.l	@r14,r3
	mov.l	@r15,r2
	mov.l	r2,@(12,r3)
	mov.l	@r14,r3
	mov.l	r4,@(20,r3)
	mov.l	@r14,r2
	mov.l	r4,@(24,r2)
	mov.l	@r14,r3
	mov	#0,r2
	mov.l	r2,@(44,r3)
	mov	r2,r5
	mov.l	.L06068790,r3
	mov.l	r2,@r3
	mov	r3,r2
	mov.l	r5,@(4,r2)
	mov.l	@r14,r4
	add	#28,r4
	mov.l	r1,@r4
	mov.w	.L06068782,r0
	mov.l	r0,@(4,r4)
	mov.l	r5,@(8,r4)
	mov.l	r5,@(12,r4)
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel stm_init_mng

	glabel stm_alloc_grp
	mov	#0,r4
	mov.l	.L06068788,r3
	mov	r4,r6
	mov.l	r14,@-r15
	mov	#1,r14
	mov.l	.L06068794,r7
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov	#-1,r11
	mov.w	.L06068784,r12
	mov	r12,r13
	mov.l	@r3,r10
	add	#107,r13
	bra	.L0606871C
	mov.l	@r10,r5
.L060686E8:
	mov	#58,r0
	mov.b	@(r0,r5),r3
	tst	r3,r3
	bf	.L06068718
	mov.l	r4,@r5
	mov	#56,r0
	mov.l	r4,@(4,r5)
	mov.l	r4,@(8,r5)
	mov.l	r4,@(12,r5)
	mov.l	r4,@(16,r5)
	mov.l	r12,@(20,r5)
	mov.l	r13,@(24,r5)
	mov.l	r4,@(28,r5)
	mov.l	r4,@(32,r5)
	mov.l	r4,@(36,r5)
	mov.l	r4,@(40,r5)
	mov.l	r7,@(44,r5)
	mov.l	r4,@(48,r5)
	mov.l	r11,@(52,r5)
	mov.w	r4,@(r0,r5)
	mov	#58,r0
	mov.b	r14,@(r0,r5)
	bra	.L06068724
	mov	r5,r0
.L06068718:
	add	#1,r6
	add	#60,r5
.L0606871C:
	mov.l	@(4,r10),r3
	cmp/ge	r3,r6
	bf	.L060686E8
	mov	#0,r0
.L06068724:
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel stm_alloc_grp

	glabel stm_alloc_stm
	mov.l	.L06068788,r3
	mov	#0,r5
	mov.l	@r3,r6
	bra	.L0606874A
	mov.l	@(8,r6),r4
.L0606873A:
	mov	#45,r0
	mov.b	@(r0,r4),r3
	tst	r3,r3
	bf	.L06068746
	rts
	mov	r4,r0
.L06068746:
	add	#1,r5
	add	#48,r4
.L0606874A:
	mov.l	@(12,r6),r3
	cmp/ge	r3,r5
	bf	.L0606873A
	mov	#0,r0
	rts
	nop
	endlabel stm_alloc_stm

	glabel stm_get_end_fad
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	@(12,r4),r14
	tst	r14,r14
	bf	.L0606876C
	add	#8,r15
	mov.w	.L06068784,r0
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606876C:
	mov.l	.L06068798,r2
	mov	r15,r6
	mov	r15,r5
	add	#4,r5
	jsr	@r2
	mov.l	@(20,r14),r4
	mov.l	@r15,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L06068782:
	.short 0x0300
.L06068784:
	.short 0x0096
	.byte 0x00, 0x00
.L06068788:
	.long stm_mng
.L0606878C:
	.long memset
.L06068790:
	.long stm_06070C70
.L06068794:
	.long 0x7FFFFFFF
.L06068798:
	.long stm_GetFadRange
	endlabel stm_get_end_fad

	glabel stm_set_err_gfs
	mov	r4,r0
	cmp/eq	#-16,r0
	bt	.L060687CE
	cmp/eq	#-15,r0
	bt	.L060687CA
	cmp/eq	#-14,r0
	bt	.L060687CA
	cmp/eq	#-13,r0
	bt	.L060687C6
	cmp/eq	#-12,r0
	bt	.L060687C2
	cmp/eq	#-11,r0
	bt	.L060687D2
	cmp/eq	#-10,r0
	bt	.L060687D2
	cmp/eq	#-2,r0
	bt	.L060687C6
	bra	.L060687D6
	nop
.L060687C2:
	bra	.L060687D8
	mov	#-22,r4
.L060687C6:
	bra	.L060687D8
	mov	#-23,r4
.L060687CA:
	bra	.L060687D8
	mov	#-2,r4
.L060687CE:
	bra	.L060687D8
	mov	#-25,r4
.L060687D2:
	bra	.L060687D8
	mov	#-1,r4
.L060687D6:
	mov	#0,r4
.L060687D8:
	bra	stm_set_err
	nop
	endlabel stm_set_err_gfs

	glabel stm_add_stm
	mov.l	r14,@-r15
	mov	#20,r0
	mov.l	r13,@-r15
	mov	r5,r14
	mov.l	r12,@-r15
	mov	r4,r13
	mov.l	r11,@-r15
	sts.l	pr,@-r15
	mov.l	.L06068848,r11
	add	#-24,r15
	mov.b	r6,@(r0,r15)
	mov	r15,r5
	mov	r15,r6
	add	#12,r6
	add	#8,r5
	jsr	@r11
	mov.l	@(20,r14),r4
	bra	.L0606881C
	mov	r13,r12
.L06068802:
	mov	r15,r6
	mov.l	@r12,r4
	mov	r15,r5
	add	#4,r6
	jsr	@r11
	mov.l	@(20,r4),r4
	mov.l	@r15,r3
	mov.l	@(8,r15),r2
	cmp/gt	r3,r2
	bf	.L06068822
	mov.l	@r12,r1
	mov	r1,r12
	add	#8,r12
.L0606881C:
	mov.l	@r12,r0
	tst	r0,r0
	bf	.L06068802
.L06068822:
	mov.l	@r12,r3
	mov.l	r3,@(8,r14)
	mov.l	r14,@r12
	mov.l	@(20,r14),r2
	mov.l	@(28,r2),r0
	tst	r0,r0
	bf	.L060688AC
	bsr	stm_get_end_fad
	mov	r13,r4
	mov.l	r0,@(4,r15)
	mov.l	@(12,r15),r3
	cmp/gt	r0,r3
	bf/s	.L06068840
	mov	#0,r11
	mov.l	r14,@(12,r13)
.L06068840:
	mov	r13,r12
	bra	.L06068854
	add	#4,r12
	.byte 0x00, 0x00
.L06068848:
	.long stm_GetFadRange
.L0606884C:
	mov.l	@r12,r4
	mov	r4,r11
	mov	r4,r12
	add	#12,r12
.L06068854:
	mov.l	@r12,r0
	tst	r0,r0
	bf	.L0606884C
	mov.w	.L0606892C,r6
	mov.l	@(20,r14),r5
	mov.l	r5,@(16,r15)
	mov.l	@(32,r5),r5
	mov.l	@(16,r15),r4
	mov.l	.L06068930,r3
	jsr	@r3
	mov.l	@(40,r4),r4
	tst	r11,r11
	bt	.L06068884
	mov.l	@(20,r14),r6
	mov.l	@(20,r11),r5
	mov.l	@(32,r6),r6
	mov.l	r5,@(16,r15)
	mov.l	@(32,r5),r5
	mov.l	@(16,r15),r4
	mov.l	.L06068930,r3
	jsr	@r3
	mov.l	@(40,r4),r4
	bra	.L06068894
	nop
.L06068884:
	mov.l	@(52,r13),r3
	cmp/pz	r3
	bf	.L06068894
	mov.l	@(52,r13),r5
	mov.l	@(20,r14),r4
	mov.l	.L06068934,r3
	jsr	@r3
	mov.l	@(40,r4),r4
.L06068894:
	mov.l	r14,@r12
	mov	#0,r2
	mov.l	.L06068938,r3
	jsr	@r3
	mov.l	r2,@(12,r14)
	mov	r0,r4
	tst	r4,r4
	bt	.L060688AC
	bsr	stm_set_err_gfs
	nop
	bra	.L060688D0
	mov	#0,r0
.L060688AC:
	mov	#1,r4
	mov	#56,r0
	mov.w	@(r0,r13),r2
	extu.w	r2,r2
	tst	r4,r2
	bt	.L060688BC
	tst	r4,r4
	bf	.L060688CE
.L060688BC:
	mov	#20,r0
	mov.b	@(r0,r15),r0
	extu.b	r0,r0
	tst	#2,r0
	bf	.L060688CE
	mov.l	@r13,r3
	cmp/eq	r3,r14
	bf	.L060688CE
	mov.l	r14,@(8,r13)
.L060688CE:
	mov	#1,r0
.L060688D0:
	add	#24,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel stm_add_stm

	glabel stm_key_to_mode
	mov.w	@r4,r0
	cmp/eq	#-1,r0
	bt/s	.L060688E8
	mov	#64,r5
	mov	#65,r5
.L060688E8:
	mov.w	@(2,r4),r0
	cmp/eq	#-1,r0
	bt/s	.L060688F4
	mov.w	@(4,r4),r0
	mov	#2,r2
	or	r2,r5
.L060688F4:
	cmp/eq	#-1,r0
	bt/s	.L060688FE
	mov.w	@(8,r4),r0
	mov	#4,r2
	or	r2,r5
.L060688FE:
	cmp/eq	#-1,r0
	bt	.L06068906
	mov	#8,r2
	or	r2,r5
.L06068906:
	rts
	mov	r5,r0
	endlabel stm_key_to_mode

	glabel stm_key_to_subh
	sts.l	pr,@-r15
	mov.b	@(1,r4),r0
	mov.b	r0,@r6
	mov.b	@(3,r4),r0
	mov.b	r0,@(1,r6)
	mov.b	@(5,r4),r0
	mov.b	r0,@(2,r6)
	mov.b	@(7,r4),r0
	mov.b	r0,@(3,r6)
	mov.b	@(9,r4),r0
	mov.b	r0,@(4,r6)
	mov.b	@(11,r4),r0
	bsr	stm_key_to_mode
	mov.b	r0,@(5,r6)
	lds.l	@r15+,pr
	rts
	nop
.L0606892C:
	.short 0x00FF
	.byte 0x00, 0x00
.L06068930:
	.long gfcd_SetFiltCon
.L06068934:
	.long gfcd_SetCdCon
.L06068938:
	.long gfcd_WaitServer
	endlabel stm_key_to_subh

	glabel stm_init_stm
	mov.l	r14,@-r15
	mov	r4,r14
	mov.l	.L06068A2C,r3
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov	r5,r13
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov	r6,r9
	sts.l	pr,@-r15
	mov	r9,r11
	add	#-24,r15
	add	#12,r11
	mov.l	r7,@(12,r15)
	mov	r11,r12
	mov.l	@(20,r12),r5
	jsr	@r3
	mov	r11,r4
	mov	r0,r4
	mov.l	r0,@(20,r12)
	mov	#0,r10
	mov.l	.L06068A30,r3
	mov	r15,r6
	mov.l	r10,@(24,r12)
	mov	#59,r0
	mov.l	r13,@r14
	add	#8,r6
	mov.l	r14,@(4,r14)
	mov	r15,r5
	mov.l	r9,@(16,r14)
	add	#4,r5
	mov.l	r12,@(20,r14)
	mov.l	r10,@(24,r14)
	mov.l	r10,@(28,r14)
	mov.b	@(r0,r15),r2
	mov	#44,r0
	mov.b	r2,@(r0,r14)
	jsr	@r3
	mov	r12,r4
	mov	#56,r0
	mov.w	@(r0,r13),r0
	extu.w	r0,r0
	tst	#2,r0
	bt	.L0606899A
	bra	.L0606899C
	mov	#1,r0
.L0606899A:
	mov	r10,r0
.L0606899C:
	cmp/eq	#1,r0
	bf	.L060689B2
	mov.l	@(20,r13),r3
	mov.l	@(4,r15),r2
	cmp/ge	r3,r2
	bf	.L060689B2
	mov	#44,r0
	mov	#1,r3
	mov.b	@(r0,r14),r2
	or	r3,r2
	mov.b	r2,@(r0,r14)
.L060689B2:
	mov	#1,r1
	mov.w	.L06068A28,r2
	mov	#45,r0
	mov.b	r1,@(r0,r14)
	mov	#6,r3
	add	#115,r0
	mov.l	r3,@(r0,r9)
	mov.l	r2,@(40,r14)
	mov.l	@(20,r14),r3
	mov.l	@(28,r3),r1
	tst	r1,r1
	bf	.L06068A04
	mov	r15,r6
	mov.l	@(12,r15),r5
	add	#16,r6
	mov.l	@(52,r15),r4
	bsr	stm_key_to_subh
	nop
	mov	r0,r5
	mov.l	@(20,r12),r2
	mov.l	r2,@-r15
	mov.l	@(4,r12),r7
	mov	r15,r6
	mov.l	.L06068A34,r3
	add	#20,r6
	jsr	@r3
	mov.l	@(40,r11),r4
	mov.l	.L06068A38,r2
	jsr	@r2
	add	#4,r15
	mov	r0,r4
	tst	r4,r4
	bt	.L060689FC
	bsr	stm_set_err_gfs
	nop
	bra	.L06068A80
	mov	#0,r0
.L060689FC:
	mov.l	.L06068A3C,r5
	mov.l	.L06068A40,r2
	jsr	@r2
	mov	r11,r4
.L06068A04:
	mov	#59,r0
	mov	r14,r5
	mov.b	@(r0,r15),r6
	bsr	stm_add_stm
	mov	r13,r4
	mov	r0,r4
	tst	r4,r4
	bf	.L06068A18
	bra	.L06068A80
	mov	#0,r0
.L06068A18:
	mov	#56,r0
	mov.w	@(r0,r13),r4
	extu.w	r4,r4
	mov	#2,r0
	tst	r4,r0
	bt	.L06068A44
	bra	.L06068A46
	mov	#1,r0
.L06068A28:
	.short 0x0096
	.byte 0x00, 0x00
.L06068A2C:
	.long gfsFlow_SctToFad
.L06068A30:
	.long stm_GetFadRange
.L06068A34:
	.long gfcd_SetFilt
.L06068A38:
	.long gfcd_WaitServer
.L06068A3C:
	.long 0x7FFFFFFF
.L06068A40:
	.long gfsFlow_SetSct
.L06068A44:
	mov	#0,r0
.L06068A46:
	cmp/eq	#1,r0
	bf	.L06068A7E
	mov	#32,r3
	tst	r4,r3
	bf	.L06068A7E
	mov.l	@(12,r13),r1
	cmp/eq	r14,r1
	bf	.L06068A7E
	mov	r15,r4
	mov.l	.L06068B2C,r2
	jsr	@r2
	mov	#0,r5
	mov.l	.L06068B30,r2
	mov.l	@r2,r3
	mov.l	@(24,r3),r1
	mov.l	@r15,r3
	add	#-10,r1
	cmp/ge	r1,r3
	bt	.L06068A7E
	mov.l	@(8,r15),r5
	mov.l	.L06068B34,r3
	jsr	@r3
	mov	r13,r4
	mov	r0,r4
	tst	r4,r4
	bt	.L06068A7E
	bsr	stm_set_err
	nop
.L06068A7E:
	mov	r14,r0
.L06068A80:
	add	#24,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel stm_init_stm

	glabel stm_free_grp
	mov	#0,r5
	mov.l	r5,@r4
	mov	#58,r0
	mov.l	r5,@(4,r4)
	rts
	mov.b	r5,@(r0,r4)
	endlabel stm_free_grp

	glabel stm_remove_cd
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	@(20,r4),r3
	mov.l	@(28,r3),r0
	tst	r0,r0
	bf	.L06068B1C
	mov.l	@r4,r12
	mov	#0,r14
	mov	r12,r5
	bra	.L06068AC2
	add	#4,r5
.L06068ABA:
	mov.l	@r5,r6
	mov	r6,r14
	mov	r6,r5
	add	#12,r5
.L06068AC2:
	mov.l	@r5,r6
	tst	r6,r6
	bt	.L06068ACC
	cmp/eq	r4,r6
	bf	.L06068ABA
.L06068ACC:
	mov.l	@r5,r0
	tst	r0,r0
	bt	.L06068B1C
	mov.l	@(12,r4),r3
	mov	r3,r0
	tst	r0,r0
	bf/s	.L06068AE2
	mov.l	r3,@r5
	mov.w	.L06068B2A,r13
	bra	.L06068AE8
	nop
.L06068AE2:
	mov.l	@r5,r13
	mov.l	@(20,r13),r13
	mov.l	@(40,r13),r13
.L06068AE8:
	tst	r14,r14
	bf	.L06068AF8
	mov.l	@(52,r12),r5
	mov.l	.L06068B38,r3
	jsr	@r3
	mov	r13,r4
	bra	.L06068B08
	nop
.L06068AF8:
	mov.l	@(20,r14),r5
	mov	r13,r6
	mov.l	.L06068B3C,r3
	mov.l	r5,@r15
	mov.l	@(32,r5),r5
	mov.l	@r15,r4
	jsr	@r3
	mov.l	@(40,r4),r4
.L06068B08:
	mov.l	.L06068B40,r2
	jsr	@r2
	nop
	mov	r0,r4
	tst	r4,r4
	bt	.L06068B1C
	bsr	stm_set_err_gfs
	nop
	bra	.L06068B1E
	mov	#0,r0
.L06068B1C:
	mov	#1,r0
.L06068B1E:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L06068B2A:
	.short 0x00FF
.L06068B2C:
	.long gfsFlow_GetCdStat
.L06068B30:
	.long stm_mng
.L06068B34:
	.long stm_CdPlayTo
.L06068B38:
	.long gfcd_SetCdCon
.L06068B3C:
	.long gfcd_SetFiltCon
.L06068B40:
	.long gfcd_WaitServer
	endlabel stm_remove_cd

	glabel stm_free_stm
	mov.l	r14,@-r15
	mov	#1,r5
	sts.l	pr,@-r15
	mov	r4,r14
	mov	#45,r0
	mov.b	@(r0,r14),r3
	extu.b	r3,r3
	cmp/eq	r5,r3
	bf/s	.L06068B8C
	mov	r5,r4
	mov	#0,r2
	mov	#45,r0
	mov.b	r2,@(r0,r14)
	mov.l	@r14,r5
	tst	r5,r5
	bt	.L06068B8E
	bra	.L06068B6E
	mov	r5,r4
.L06068B68:
	mov.l	@r4,r2
	mov	r2,r4
	add	#8,r4
.L06068B6E:
	mov.l	@r4,r5
	tst	r5,r5
	bt	.L06068B78
	cmp/eq	r14,r5
	bf	.L06068B68
.L06068B78:
	mov.l	@r4,r0
	tst	r0,r0
	bt	.L06068B82
	mov.l	@(8,r14),r3
	mov.l	r3,@r4
.L06068B82:
	bsr	stm_remove_cd
	mov	r14,r4
	mov	r0,r4
	mov	#0,r3
	mov.l	r3,@r14
.L06068B8C:
	mov	r4,r0
.L06068B8E:
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel stm_free_stm

	glabel stm_update_cur
	mov.l	r14,@-r15
	mov	r4,r14
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov	#0,r12
	mov.w	.L06068C30,r13
	sts.l	pr,@-r15
	mov.l	.L06068C34,r11
	add	#-12,r15
	mov.l	r4,@(8,r15)
	bra	.L06068BCC
	mov.l	@(4,r14),r14
.L06068BAE:
	mov.l	@(20,r14),r2
	mov.l	@(28,r2),r0
	tst	r0,r0
	bf	.L06068BCA
	mov	r15,r6
	mov	r15,r5
	add	#4,r5
	jsr	@r11
	mov.l	@(20,r14),r4
	mov.l	@r15,r2
	cmp/ge	r2,r13
	bt	.L06068BCA
	mov	r14,r12
	mov.l	@r15,r13
.L06068BCA:
	mov.l	@(12,r14),r14
.L06068BCC:
	tst	r14,r14
	bf	.L06068BAE
	mov.l	@(8,r15),r3
	mov.l	r12,@(12,r3)
	add	#12,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel stm_update_cur

	glabel STM_Init
	tst	r6,r6
	sts.l	pr,@-r15
	bf	.L06068BEE
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L06068BEE:
	bsr	stm_init_mng
	nop
	mov	#1,r0
	lds.l	@r15+,pr
	rts
	nop
	endlabel STM_Init

	glabel STM_OpenGrp
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov.w	.L06068C32,r4
	bsr	stm_set_func_id
	nop
	bsr	stm_alloc_grp
	nop
	mov	r0,r14
	tst	r14,r14
	bf	.L06068C16
	mov	#0,r0
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L06068C16:
	bsr	stm_check_gfs_err
	nop
	mov	r0,r4
	cmp/pz	r4
	bt	.L06068C28
	lds.l	@r15+,pr
	mov	#0,r0
	rts
	mov.l	@r15+,r14
.L06068C28:
	mov	r14,r0
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L06068C30:
	.short 0x0096
.L06068C32:
	.short 0x0301
.L06068C34:
	.long stm_GetFadRange
	endlabel STM_OpenGrp

	glabel stm_close
	mov.l	r14,@-r15
	mov	#45,r0
	mov.l	r13,@-r15
	mov	r4,r13
	mov.l	r12,@-r15
	sts.l	pr,@-r15
	add	#-16,r15
	mov.b	@(r0,r13),r0
	extu.b	r0,r0
	cmp/eq	#1,r0
	bf/s	.L06068D28
	mov.l	@r13,r14
	mov.l	@(8,r14),r2
	cmp/eq	r2,r13
	bf	.L06068C7A
	bra	.L06068C6A
	mov.l	@r14,r4
.L06068C5A:
	cmp/eq	r13,r4
	bt	.L06068C68
	mov	#44,r0
	mov.b	@(r0,r4),r0
	extu.b	r0,r0
	tst	#2,r0
	bt	.L06068C6E
.L06068C68:
	mov.l	@(8,r4),r4
.L06068C6A:
	tst	r4,r4
	bf	.L06068C5A
.L06068C6E:
	mov	#56,r0
	mov.l	.L06068CDC,r3
	mov.l	r4,@(8,r14)
	mov.w	@(r0,r14),r2
	and	r3,r2
	mov.w	r2,@(r0,r14)
.L06068C7A:
	mov.l	@(16,r14),r3
	cmp/eq	r3,r13
	bf/s	.L06068CA6
	mov	#0,r12
	mov	#-1,r5
	mov.l	.L06068CE0,r3
	jsr	@r3
	mov.l	@(16,r13),r4
	mov.l	@(16,r13),r2
	mov.w	.L06068CD8,r0
	mov.l	r12,@(r0,r2)
	mov.l	@(8,r13),r3
	mov	r3,r1
	tst	r1,r1
	bf/s	.L06068C9E
	mov.l	r3,@(16,r14)
	mov.l	@r14,r2
	mov.l	r2,@(16,r14)
.L06068C9E:
	mov.l	@(16,r14),r3
	cmp/eq	r13,r3
	bf	.L06068CA6
	mov.l	r12,@(16,r14)
.L06068CA6:
	mov.l	@(20,r13),r4
	mov.l	@(40,r4),r3
	mov.l	r3,@(32,r4)
	bsr	stm_free_stm
	mov	r13,r4
	mov.l	.L06068CE4,r2
	mov	r15,r3
	add	#12,r3
	mov	r12,r7
	mov.l	r3,@-r15
	mov	r12,r6
	mov.l	r12,@-r15
	mov	r12,r5
	mov.l	r12,@-r15
	mov.l	r12,@-r15
	jsr	@r2
	mov.l	@(20,r13),r4
	mov	#56,r0
	mov.w	@(r0,r14),r0
	extu.w	r0,r0
	tst	#2,r0
	bt/s	.L06068CE8
	add	#16,r15
	bra	.L06068CEA
	mov	#1,r0
.L06068CD8:
	.short 0x00A0
	.byte 0x00, 0x00
.L06068CDC:
	.long 0x0000FFFE
.L06068CE0:
	.long gfsTrn_Stop
.L06068CE4:
	.long gfsFlow_GetFinfo
.L06068CE8:
	mov	#0,r0
.L06068CEA:
	cmp/eq	#1,r0
	bf	.L06068D22
	mov.l	@(12,r15),r0
	tst	#64,r0
	bf	.L06068D22
	mov.l	.L06068DB4,r3
	mov	r15,r6
	mov	r15,r5
	add	#8,r5
	jsr	@r3
	mov.l	@(20,r13),r4
	mov.l	.L06068DB8,r2
	mov	r15,r4
	add	#4,r4
	jsr	@r2
	mov	#0,r5
	mov.l	@(8,r15),r3
	mov.l	@(4,r15),r2
	add	#-10,r3
	cmp/ge	r2,r3
	bt	.L06068D22
	mov.l	@r15,r1
	mov.l	@(4,r15),r3
	cmp/gt	r1,r3
	bt	.L06068D22
	mov.l	.L06068DBC,r3
	jsr	@r3
	nop
.L06068D22:
	mov.l	.L06068DC0,r2
	jsr	@r2
	mov.l	@(16,r13),r4
.L06068D28:
	mov.l	@(12,r14),r3
	cmp/eq	r3,r13
	bf	.L06068D9E
	bsr	stm_update_cur
	mov	r14,r4
	mov.l	@(12,r14),r0
	tst	r0,r0
	bt	.L06068D9E
	mov	#56,r0
	mov.w	@(r0,r14),r0
	extu.w	r0,r0
	tst	#2,r0
	bt	.L06068D46
	bra	.L06068D48
	mov	#1,r0
.L06068D46:
	mov	#0,r0
.L06068D48:
	cmp/eq	#1,r0
	bf	.L06068D9E
	mov.l	@(12,r14),r4
	mov	r15,r6
	mov.l	.L06068DB4,r3
	mov	r15,r5
	add	#8,r5
	jsr	@r3
	mov.l	@(20,r4),r4
	mov.l	.L06068DC4,r3
	mov.l	@r15,r1
	mov.l	@r3,r2
	mov.l	@(20,r2),r2
	sub	r2,r1
	cmp/pz	r1
	bf	.L06068D74
	mov.l	@r15,r5
	mov.l	.L06068DC8,r2
	jsr	@r2
	mov	r14,r4
	bra	.L06068D96
	mov	r0,r13
.L06068D74:
	mov.l	.L06068DCC,r2
	jsr	@r2
	mov	r14,r4
	mov	r0,r13
	mov.l	.L06068DD0,r3
	jsr	@r3
	mov	r14,r4
	mov	#56,r0
	mov.l	@(48,r14),r2
	add	#1,r2
	mov.l	r2,@(48,r14)
	mov.w	.L06068DB2,r3
	mov.l	r3,@(20,r14)
	mov.l	.L06068DD4,r3
	mov.w	@(r0,r14),r2
	and	r3,r2
	mov.w	r2,@(r0,r14)
.L06068D96:
	tst	r13,r13
	bt	.L06068D9E
	bsr	stm_set_err
	mov	r13,r4
.L06068D9E:
	mov.l	@(4,r14),r0
	tst	r0,r0
	bf	.L06068E0C
	mov	#56,r0
	mov.w	@(r0,r14),r0
	extu.w	r0,r0
	tst	#2,r0
	bt	.L06068DD8
	bra	.L06068DDA
	mov	#1,r0
.L06068DB2:
	.short 0x0096
.L06068DB4:
	.long stm_GetFadRange
.L06068DB8:
	.long gfsFlow_GetCdStat
.L06068DBC:
	.long stm_WaitCsct
.L06068DC0:
	.long GFS_Close
.L06068DC4:
	.long stm_mng
.L06068DC8:
	.long stm_CdPlayTo
.L06068DCC:
	.long stm_CdPause
.L06068DD0:
	.long STM_GrpCheckPassed
.L06068DD4:
	.long 0x0000FFD9
.L06068DD8:
	mov	#0,r0
.L06068DDA:
	cmp/eq	#1,r0
	bf	.L06068E0C
	mov.l	.L06068EB8,r3
	jsr	@r3
	mov	r14,r4
	mov	r0,r4
	tst	r4,r4
	bt	.L06068DF2
	bsr	stm_set_err
	nop
	bra	.L06068E0C
	nop
.L06068DF2:
	mov.l	.L06068EBC,r2
	jsr	@r2
	mov	r14,r4
	mov.l	@(48,r14),r3
	mov	#56,r0
	mov.w	.L06068EB4,r2
	add	#1,r3
	mov.l	r3,@(48,r14)
	mov.l	r2,@(20,r14)
	mov.l	.L06068EC0,r3
	mov.w	@(r0,r14),r2
	and	r3,r2
	mov.w	r2,@(r0,r14)
.L06068E0C:
	add	#16,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel stm_close

	glabel STM_CloseGrp
	mov.l	r14,@-r15
	mov	r4,r14
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.w	.L06068EB6,r4
	bsr	stm_set_func_id
	nop
	tst	r14,r14
	bf	.L06068E3A
	bsr	stm_set_err
	mov	#-11,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	bra	stm_call_err_func
	mov.l	@r15+,r14
.L06068E36:
	bsr	stm_close
	nop
.L06068E3A:
	mov.l	@r14,r4
	tst	r4,r4
	bf	.L06068E36
	mov.l	@(52,r14),r3
	cmp/pz	r3
	bf	.L06068E66
	mov	#0,r13
	mov.l	.L06068EC4,r2
	mov.l	@r2,r3
	mov.l	r13,@(16,r3)
	mov.l	.L06068EC8,r3
	jsr	@r3
	mov.l	@(52,r14),r4
	mov.l	.L06068ECC,r3
	mov	#-1,r2
	mov.l	r2,@(52,r14)
	mov	r13,r5
	jsr	@r3
	mov	r13,r4
	mov.l	.L06068ED0,r2
	jsr	@r2
	nop
.L06068E66:
	bsr	stm_free_grp
	mov	r14,r4
	mov.l	.L06068EC4,r3
	mov.l	@r3,r0
	mov.l	@(28,r0),r1
	tst	r1,r1
	bt	.L06068E78
	bra	.L06068E7A
	mov	#1,r0
.L06068E78:
	mov	#0,r0
.L06068E7A:
	cmp/eq	#1,r0
	bf	.L06068E82
	bsr	stm_call_err_func
	nop
.L06068E82:
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	bra	stm_check_gfs_err
	mov.l	@r15+,r14
	endlabel STM_CloseGrp

	glabel stm_func_nop
	rts
	mov	#0,r0
	endlabel stm_func_nop

	glabel stm_close_all
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov	#0,r12
	mov.l	r10,@-r15
	sts.l	pr,@-r15
	mov.l	.L06068ED4,r10
	mov.l	.L06068EC4,r11
	mov.l	@r11,r13
	bra	.L06068EF4
	mov.l	@r13,r13
.L06068EA6:
	mov	#58,r0
	mov.b	@(r0,r13),r0
	extu.b	r0,r0
	cmp/eq	#1,r0
	bf	.L06068EF0
	bra	.L06068EE8
	mov.l	@r13,r14
.L06068EB4:
	.short 0x0096
.L06068EB6:
	.short 0x0302
.L06068EB8:
	.long stm_CdPause
.L06068EBC:
	.long STM_GrpCheckPassed
.L06068EC0:
	.long 0x0000FFD9
.L06068EC4:
	.long stm_mng
.L06068EC8:
	.long gfcd_Unlock
.L06068ECC:
	.long gfcd_SetCallback
.L06068ED0:
	.long gfcd_WaitPause
.L06068ED4:
	.long gfsTrn_SetFunc
.L06068ED8:
	mov.l	@(24,r14),r0
	tst	r0,r0
	bt	.L06068EE6
	mov	r14,r6
	mov.l	.L06069054,r5
	jsr	@r10
	mov.l	@(16,r14),r4
.L06068EE6:
	mov.l	@(8,r14),r14
.L06068EE8:
	tst	r14,r14
	bf	.L06068ED8
	bsr	STM_CloseGrp
	mov	r13,r4
.L06068EF0:
	add	#1,r12
	add	#60,r13
.L06068EF4:
	mov.l	@r11,r2
	mov.l	@(4,r2),r3
	cmp/ge	r3,r12
	bf	.L06068EA6
	lds.l	@r15+,pr
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	bra	stm_check_gfs_err
	mov.l	@r15+,r14
	endlabel stm_close_all

	glabel stm_open
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	sts.l	pr,@-r15
	add	#-28,r15
	mov.l	r4,@(16,r15)
	mov.l	r5,@(12,r15)
	mov.l	r6,@(24,r15)
	mov.l	r7,@(20,r15)
	bsr	stm_alloc_stm
	nop
	mov	r0,r13
	tst	r13,r13
	bf	.L06068F34
	bsr	stm_set_err
	mov	#-19,r4
	bsr	stm_call_err_func
	nop
	bra	.L06068FDE
	mov	#0,r0
.L06068F34:
	mov.l	.L06069058,r3
	jsr	@r3
	nop
	mov	r0,r4
	tst	r4,r4
	bf	.L06068F50
	bsr	stm_free_stm
	mov	r13,r4
	bsr	stm_set_err
	mov	#-19,r4
	bsr	stm_call_err_func
	nop
	bra	.L06068FDE
	mov	#0,r0
.L06068F50:
	mov.l	@(24,r15),r6
	mov.l	@(12,r15),r5
	mov.l	.L0606905C,r3
	jsr	@r3
	nop
	mov	r0,r14
	mov	#51,r0
	mov	r14,r6
	mov.b	@(r0,r15),r2
	mov.l	r2,@-r15
	mov.l	@(24,r15),r3
	mov.l	r3,@-r15
	mov.l	@(20,r15),r7
	mov.l	@(24,r15),r5
	bsr	stm_init_stm
	mov	r13,r4
	mov	r0,r12
	tst	r12,r12
	bf/s	.L06068F80
	add	#8,r15
	bsr	stm_call_err_func
	nop
	bra	.L06068FDE
	mov	#0,r0
.L06068F80:
	mov	#51,r0
	mov.b	@(r0,r15),r0
	extu.b	r0,r0
	tst	#2,r0
	bt	.L06068F92
	mov	#1,r5
	mov.l	.L06069060,r3
	jsr	@r3
	mov	r14,r4
.L06068F92:
	mov.l	@(20,r13),r2
	mov.l	@(28,r2),r0
	tst	r0,r0
	bt	.L06068FCA
	mov	#0,r7
	mov.l	.L06069064,r2
	mov	r15,r6
	add	#4,r6
	mov	r7,r5
	jsr	@r2
	mov	r14,r4
	mov.l	@(4,r15),r5
	mov.l	.L06069068,r3
	jsr	@r3
	mov	r14,r4
	mov.l	.L0606906C,r11
	mov.l	.L06069070,r13
.L06068FB4:
	jsr	@r11
	mov	r14,r4
	mov	r15,r6
	mov	r15,r5
	add	#8,r5
	jsr	@r13
	mov	r14,r4
	mov.l	@(4,r15),r3
	mov.l	@r15,r2
	cmp/ge	r3,r2
	bf	.L06068FB4
.L06068FCA:
	mov	#1,r4
	mov.l	@(16,r12),r3
	mov.l	r4,@(4,r3)
	mov.l	@(16,r12),r2
	mov.l	r4,@(8,r2)
	mov.l	.L06069074,r3
	mov	r14,r4
	jsr	@r3
	add	#108,r4
	mov	r12,r0
.L06068FDE:
	add	#28,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel stm_open

	glabel stm_open_fid
	sts.l	pr,@-r15
	mov	r7,r0
	mov.l	.L06069078,r3
	add	#-40,r15
	mov.l	r4,@(4,r15)
	mov.l	r5,@r15
	mov.l	r6,@(12,r15)
	mov	r15,r5
	mov.b	r0,@(8,r15)
	add	#28,r5
	mov.l	@r15,r4
	jsr	@r3
	nop
	mov	r0,r4
	tst	r4,r4
	bf	.L06069042
	mov.l	@(12,r15),r5
	mov	r15,r4
	mov.l	.L0606907C,r3
	add	#16,r4
	jsr	@r3
	mov	#12,r6
	mov	r15,r2
	add	#16,r2
	mov	r15,r3
	add	#28,r3
	mov.b	@(10,r3),r0
	extu.b	r0,r0
	mov.w	r0,@r2
	mov.b	@(8,r15),r0
	mov	r0,r3
	mov.l	r3,@-r15
	mov.l	@(4,r15),r6
	mov	r15,r5
	mov.l	@(8,r15),r4
	mov	r15,r7
	add	#20,r7
	add	#32,r5
	bsr	stm_open
	nop
	add	#4,r15
	bra	.L0606904C
	mov	r0,r4
.L06069042:
	bsr	stm_set_err
	nop
	bsr	stm_call_err_func
	nop
	mov	#0,r4
.L0606904C:
	add	#40,r15
	lds.l	@r15+,pr
	rts
	mov	r4,r0
.L06069054:
	.long stm_func_nop
.L06069058:
	.long gfs_AllocHn
.L0606905C:
	.long gfs_InitHn
.L06069060:
	.long GFS_SetGmode
.L06069064:
	.long GFS_GetFileSize
.L06069068:
	.long GFS_NwCdRead
.L0606906C:
	.long GFS_NwExecOne
.L06069070:
	.long GFS_NwGetStat
.L06069074:
	.long gfsTrn_Activate
.L06069078:
	.long GFS_GetDirInfo
.L0606907C:
	.long memmove
	endlabel stm_open_fid

	glabel STM_OpenFid
	sts.l	pr,@-r15
	add	#-16,r15
	mov.l	r4,@r15
	mov.l	r5,@(8,r15)
	mov.l	r6,@(12,r15)
	mov.l	r7,@(4,r15)
	mov.w	.L06069182,r4
	bsr	stm_set_func_id
	nop
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L060690A8
	bsr	stm_set_err
	mov	#-11,r4
	bsr	stm_call_err_func
	nop
	add	#16,r15
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L060690A8:
	mov.l	@(4,r15),r1
	tst	r1,r1
	bf	.L060690B2
	bra	.L060690CC
	mov	#4,r7
.L060690B2:
	mov.l	@(4,r15),r0
	cmp/eq	#1,r0
	bf	.L060690BC
	bra	.L060690CC
	mov	#0,r7
.L060690BC:
	bsr	stm_set_err
	mov	#-17,r4
	bsr	stm_call_err_func
	nop
	add	#16,r15
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L060690CC:
	mov.l	@(12,r15),r6
	mov.l	@(8,r15),r5
	mov.l	@r15,r4
	bsr	stm_open_fid
	nop
	mov.l	r0,@r15
	bsr	stm_check_gfs_err
	nop
	mov	r0,r4
	cmp/pz	r4
	bt	.L060690EA
	add	#16,r15
	lds.l	@r15+,pr
	rts
	mov	#0,r0
.L060690EA:
	mov.l	@r15,r0
	add	#16,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel STM_OpenFid

	glabel STM_OpenFrange
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	add	#-24,r15
	mov.l	r4,@r15
	mov.l	r6,@(4,r15)
	mov.l	r7,@(8,r15)
	mov.w	.L06069184,r4
	bsr	stm_set_func_id
	mov	r5,r14
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L0606911E
	bsr	stm_set_err
	mov	#-11,r4
	bsr	stm_call_err_func
	nop
	mov	#0,r0
	add	#24,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606911E:
	mov.w	.L06069186,r3
	mov.l	@r14,r2
	cmp/ge	r3,r2
	bf	.L0606912C
	mov.l	@(4,r14),r0
	cmp/pz	r0
	bt	.L0606913E
.L0606912C:
	bsr	stm_set_err
	mov	#-14,r4
	bsr	stm_call_err_func
	nop
	mov	#0,r0
	add	#24,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606913E:
	mov	r15,r3
	mov.l	@r14,r2
	mov	#0,r5
	add	#12,r3
	mov.l	r2,@r3
	mov.l	@(4,r14),r2
	mov	r15,r3
	add	#12,r3
	shll8	r2
	shll2	r2
	shll	r2
	mov.l	r2,@(4,r3)
	mov	r15,r3
	mov.l	@(4,r15),r0
	add	#12,r3
	mov.b	@(1,r0),r0
	mov.b	r0,@(10,r3)
	mov	r15,r3
	add	#12,r3
	mov	r5,r0
	mov.b	r0,@(11,r3)
	mov	r15,r3
	add	#12,r3
	mov	#1,r0
	mov.b	r0,@(8,r3)
	mov	r15,r3
	add	#12,r3
	mov	r5,r0
	mov.b	r0,@(9,r3)
	mov.l	@(8,r15),r1
	tst	r1,r1
	bf	.L06069188
	bra	.L060691A4
	mov	#4,r4
.L06069182:
	.short 0x0306
.L06069184:
	.short 0x0307
.L06069186:
	.short 0x0096
.L06069188:
	mov.l	@(8,r15),r0
	cmp/eq	#1,r0
	bf	.L06069192
	bra	.L060691A4
	mov	r5,r4
.L06069192:
	bsr	stm_set_err
	mov	#-17,r4
	bsr	stm_call_err_func
	nop
	mov	#0,r0
	add	#24,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L060691A4:
	mov.l	r4,@-r15
	mov	r15,r5
	mov.l	@(4,r15),r4
	add	#16,r5
	mov.l	@(8,r15),r7
	mov.l	.L06069294,r6
	bsr	stm_open
	nop
	add	#4,r15
	mov.l	r0,@r15
	bsr	stm_check_gfs_err
	nop
	mov	r0,r4
	cmp/pz	r4
	bt	.L060691CC
	mov	#0,r0
	add	#24,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L060691CC:
	mov.l	@r15,r0
	add	#24,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel STM_OpenFrange

	glabel stm_set_param_sub
	mov	#44,r0
	mov.l	r14,@-r15
	mov	r4,r14
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	r5,@r15
	mov.b	@(r0,r14),r0
	extu.b	r0,r0
	tst	#2,r0
	bt	.L060691F4
	mov	#0,r6
	mov.l	.L06069298,r2
	mov	r6,r5
	jsr	@r2
	mov.l	@(16,r14),r4
.L060691F4:
	mov.l	@(16,r14),r3
	mov	#0,r2
	mov.w	.L0606928C,r0
	mov.l	r2,@(r0,r3)
	mov.l	@r15,r3
	mov.l	r3,@(40,r14)
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel stm_set_param_sub

	glabel stm_set_param
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	r4,@(4,r15)
	mov.l	r5,@r15
	mov.w	.L0606928E,r4
	bsr	stm_set_func_id
	nop
	mov.l	@(4,r15),r0
	tst	r0,r0
	bf	.L06069220
	bra	.L06069228
	mov	#-11,r4
.L06069220:
	mov.l	@r15,r3
	cmp/pz	r3
	bt	.L06069232
	mov	#-14,r4
.L06069228:
	bsr	stm_set_err
	nop
	add	#8,r15
	bra	stm_call_err_func
	lds.l	@r15+,pr
.L06069232:
	mov.l	@(4,r15),r4
	mov.l	@r15,r5
	bsr	stm_set_param_sub
	mov.l	@(4,r4),r4
	add	#8,r15
	bra	stm_check_gfs_err
	lds.l	@r15+,pr
	.byte 0x7F, 0x08, 0x4F, 0x26, 0x00, 0x0B, 0x00, 0x09
	endlabel stm_set_param

	glabel STM_OpenResp
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	add	#-16,r15
	mov.l	r4,@(4,r15)
	mov.l	r5,@(8,r15)
	mov.l	r6,@(12,r15)
	mov.l	r7,@r15
	mov.w	.L06069290,r4
	bsr	stm_set_func_id
	nop
	mov.l	@(4,r15),r0
	tst	r0,r0
	bf	.L06069274
	bsr	stm_set_err
	mov	#-11,r4
	bsr	stm_call_err_func
	nop
	mov	#0,r0
	add	#16,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L06069274:
	mov.l	@r15,r3
	cmp/pz	r3
	bt	.L0606929C
	bsr	stm_set_err
	mov	#-14,r4
	bsr	stm_call_err_func
	nop
	mov	#0,r0
	add	#16,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606928C:
	.short 0x00A0
.L0606928E:
	.short 0x0321
.L06069290:
	.short 0x0308
	.byte 0x00, 0x00
.L06069294:
	.long 0x3FFFFFFF
.L06069298:
	.long GFS_Seek
.L0606929C:
	mov.l	@(12,r15),r6
	mov.l	@(8,r15),r5
	mov.l	@(4,r15),r4
	bsr	stm_open_fid
	mov	#6,r7
	mov	r0,r14
	tst	r14,r14
	bf	.L060692B6
	mov	#0,r0
	add	#16,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L060692B6:
	mov.l	@r15,r5
	bsr	stm_set_param_sub
	mov	r14,r4
	bsr	stm_check_gfs_err
	nop
	mov	r0,r4
	cmp/pz	r4
	bt	.L060692D0
	mov	#0,r0
	add	#16,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L060692D0:
	mov	r14,r0
	add	#16,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel STM_OpenResp

	glabel STM_Close
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	r4,@r15
	mov.w	.L0606933A,r4
	bsr	stm_set_func_id
	nop
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L060692F4
	bsr	stm_set_err
	mov	#-11,r4
	bsr	stm_call_err_func
	nop
.L060692F4:
	mov.l	@r15,r4
	bsr	stm_close
	mov.l	@(4,r4),r4
	mov.l	.L06069340,r3
	mov.l	@r3,r0
	mov.l	@(28,r0),r1
	tst	r1,r1
	bt	.L06069308
	bra	.L0606930A
	mov	#1,r0
.L06069308:
	mov	#0,r0
.L0606930A:
	cmp/eq	#1,r0
	bf	.L06069312
	bsr	stm_call_err_func
	nop
.L06069312:
	add	#4,r15
	bra	stm_check_gfs_err
	lds.l	@r15+,pr
	endlabel STM_Close

	glabel STM_SetKey
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	add	#-12,r15
	mov.l	r4,@r15
	mov.w	.L0606933C,r4
	bsr	stm_set_func_id
	mov	r5,r14
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L06069344
	bsr	stm_set_err
	mov	#-11,r4
	bsr	stm_call_err_func
	nop
	bra	.L060693B0
	nop
.L0606933A:
	.short 0x0309
.L0606933C:
	.short 0x0310
	.byte 0x00, 0x00
.L06069340:
	.long stm_mng
.L06069344:
	mov.l	@r15,r13
	mov.l	@(4,r13),r13
	mov.l	@(20,r13),r3
	mov.l	@(28,r3),r0
	tst	r0,r0
	bf	.L060693B0
	mov.b	@(1,r14),r0
	mov	r15,r3
	mov	r15,r1
	add	#4,r1
	mov.b	r0,@r1
	add	#4,r3
	mov.b	@(3,r14),r0
	mov.b	r0,@(1,r3)
	mov.b	@(5,r14),r0
	mov	r15,r3
	add	#4,r3
	mov.b	r0,@(2,r3)
	mov.b	@(7,r14),r0
	mov	r15,r3
	add	#4,r3
	mov.b	r0,@(3,r3)
	mov.b	@(9,r14),r0
	mov	r15,r3
	add	#4,r3
	mov.b	r0,@(4,r3)
	mov.b	@(11,r14),r0
	mov	r15,r3
	add	#4,r3
	mov.b	r0,@(5,r3)
	bsr	stm_key_to_mode
	mov	r14,r4
	mov.l	@(20,r13),r14
	mov	r0,r5
	mov.l	r14,@r15
	mov.l	@(20,r14),r3
	mov.l	r3,@-r15
	mov	r15,r6
	mov.l	@(4,r15),r4
	add	#8,r6
	mov.l	.L06069464,r3
	mov.l	@(4,r14),r7
	jsr	@r3
	mov.l	@(40,r4),r4
	mov.l	.L06069468,r2
	jsr	@r2
	add	#4,r15
	mov	r0,r4
	tst	r4,r4
	bt	.L060693B0
	bsr	stm_set_err_gfs
	nop
	bsr	stm_call_err_func
	nop
.L060693B0:
	add	#12,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel STM_SetKey

	glabel stm_set_func_id
	mov.l	.L0606946C,r2
	mov.l	@r2,r3
	rts
	mov.l	r4,@(32,r3)
	endlabel stm_set_func_id

	glabel stm_set_err
	mov.l	.L0606946C,r3
	mov.l	@r3,r5
	mov.l	@(28,r5),r0
	tst	r0,r0
	bf	.L060693D2
	mov.l	r4,@(28,r5)
	rts
	mov	#1,r0
.L060693D2:
	mov	#0,r0
	rts
	nop
	endlabel stm_set_err

	glabel stm_check_gfs_err
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov.l	.L06069470,r3
	mov.l	@r3,r0
	cmp/eq	#-16,r0
	bt	.L06069404
	cmp/eq	#-14,r0
	bt	.L06069400
	cmp/eq	#-13,r0
	bt	.L060693FC
	cmp/eq	#0,r0
	bt	.L060693F4
	bra	.L06069408
	nop
.L060693F4:
	lds.l	@r15+,pr
	mov	#0,r0
	rts
	mov.l	@r15+,r14
.L060693FC:
	bra	.L06069410
	mov	#-23,r14
.L06069400:
	bra	.L06069410
	mov	#-2,r14
.L06069404:
	bra	.L06069410
	mov	#-25,r14
.L06069408:
	lds.l	@r15+,pr
	mov	#0,r0
	rts
	mov.l	@r15+,r14
.L06069410:
	bsr	stm_set_err
	mov	r14,r4
	cmp/eq	#1,r0
	bf/s	.L06069426
	mov	r0,r4
	bsr	stm_call_err_func
	nop
	mov	r14,r0
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L06069426:
	mov	#0,r0
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel stm_check_gfs_err

	glabel stm_call_err_func
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov.l	.L0606946C,r3
	mov.l	@r3,r4
	mov	r4,r14
	add	#28,r14
	mov.l	@(8,r14),r0
	tst	r0,r0
	bt	.L06069458
	mov.l	@(28,r4),r1
	tst	r1,r1
	bt	.L0606944A
	bra	.L0606944C
	mov	#1,r0
.L0606944A:
	mov	#0,r0
.L0606944C:
	cmp/eq	#1,r0
	bf	.L06069458
	mov.l	@(8,r14),r3
	mov.l	@r14,r5
	jsr	@r3
	mov.l	@(12,r14),r4
.L06069458:
	mov	#0,r2
	mov.l	r2,@r14
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	.byte 0x00, 0x00
.L06069464:
	.long gfcd_SetFilt
.L06069468:
	.long gfcd_WaitServer
.L0606946C:
	.long stm_mng
.L06069470:
	.long gfcd_err
	endlabel stm_call_err_func
