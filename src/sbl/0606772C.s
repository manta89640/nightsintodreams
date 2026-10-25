! sbl/0606772C: matching source. The readable C for this object is 0606772C.ref.c;
! SHC 5.0 cannot reproduce the 1996 compiler's output for all of it.
	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0606772C,"ax",@progbits
	.p2align 2

	glabel stm_get_num_stm
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov.l	.L06067818,r3
	add	#-4,r15
	mov.l	r4,@r15
	mov.w	.L06067810,r4
	jsr	@r3
	mov	#0,r14
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L06067758
	mov.l	.L0606781C,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L06067820,r2
	jsr	@r2
	nop
	mov	#-11,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L06067758:
	mov.l	@r15,r4
	bra	.L06067762
	mov.l	@r4,r4
.L0606775E:
	add	#1,r14
	mov.l	@(8,r4),r4
.L06067762:
	tst	r4,r4
	bf	.L0606775E
	mov.l	.L06067824,r3
	jsr	@r3
	nop
	mov	r0,r4
	cmp/pz	r4
	bt	.L0606777C
	mov	r4,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L0606777C:
	mov	r14,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel stm_get_num_stm

	glabel stm_get_stm
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.l	.L06067818,r3
	add	#-4,r15
	mov.l	r4,@r15
	mov.w	.L06067812,r4
	jsr	@r3
	mov	r5,r13
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L060677AE
	mov.l	.L0606781C,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L06067820,r2
	jsr	@r2
	nop
	bra	.L060677E8
	mov	#0,r0
.L060677AE:
	cmp/pz	r13
	bt	.L060677C2
	mov.l	.L0606781C,r2
	jsr	@r2
	mov	#-14,r4
	mov.l	.L06067820,r3
	jsr	@r3
	nop
	bra	.L060677E8
	mov	#0,r0
.L060677C2:
	mov	#0,r4
	mov.l	@r15,r14
	bra	.L060677CE
	mov.l	@r14,r14
.L060677CA:
	add	#1,r4
	mov.l	@(8,r14),r14
.L060677CE:
	cmp/ge	r13,r4
	bt	.L060677D6
	tst	r14,r14
	bf	.L060677CA
.L060677D6:
	mov.l	.L06067824,r3
	jsr	@r3
	nop
	mov	r0,r4
	cmp/pz	r4
	bt	.L060677E6
	bra	.L060677E8
	mov	#0,r0
.L060677E6:
	mov	r14,r0
.L060677E8:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel stm_get_stm

	glabel stm_set_link
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov	r4,r14
	mov.l	.L06067818,r3
	sts.l	pr,@-r15
	mov.w	.L06067814,r4
	add	#-8,r15
	mov.l	r6,@r15
	mov.l	r7,@(4,r15)
	jsr	@r3
	mov	r5,r13
	tst	r14,r14
	bf	.L06067828
	bra	.L06067830
	mov	#-11,r4
.L06067810:
	.short 0x0303
.L06067812:
	.short 0x0304
.L06067814:
	.short 0x0305
	.byte 0x00, 0x00
.L06067818:
	.long stm_set_func_id
.L0606781C:
	.long stm_set_err
.L06067820:
	.long stm_call_err_func
.L06067824:
	.long stm_check_gfs_err
.L06067828:
	mov.l	@r15,r3
	cmp/pz	r3
	bt	.L06067842
	mov	#-14,r4
.L06067830:
	mov.l	.L0606792C,r3
	jsr	@r3
	nop
	add	#8,r15
	mov.l	.L06067930,r2
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	jmp	@r2
	mov.l	@r15+,r14
.L06067842:
	tst	r13,r13
	bt	.L06067848
	mov.l	@(4,r13),r13
.L06067848:
	mov.l	r13,@(28,r14)
	mov.l	@r15,r3
	mov.l	r3,@(32,r14)
	mov.l	@(4,r15),r2
	mov.l	r2,@(36,r14)
	mov.l	@(20,r15),r3
	mov.l	.L06067934,r2
	mov.l	r3,@(40,r14)
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	jmp	@r2
	mov.l	@r15+,r14
	.byte 0x7F, 0x08, 0x4F, 0x26, 0x6D, 0xF6, 0x00, 0x0B, 0x6E, 0xF6
	endlabel stm_set_link

	glabel stm_get_info
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	sts.l	pr,@-r15
	mov.l	.L06067938,r3
	add	#-28,r15
	mov.l	r4,@(12,r15)
	mov.l	r6,@(8,r15)
	mov.l	r7,@(4,r15)
	mov.l	@(52,r15),r14
	mov.w	.L0606792A,r4
	jsr	@r3
	mov	r5,r11
	mov.l	@(12,r15),r0
	tst	r0,r0
	bf	.L060678A0
	mov.l	.L0606792C,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L06067930,r2
	jsr	@r2
	nop
	bra	.L06067980
	mov	#0,r0
.L060678A0:
	mov.l	@(12,r15),r12
	mov	#0,r10
	mov.l	.L0606793C,r3
	mov	r11,r5
	mov.l	@(4,r12),r12
	mov.l	r10,@-r15
	mov.l	r10,@-r15
	mov.l	r10,@-r15
	mov.l	@(20,r15),r2
	add	#4,r2
	mov.l	r2,@-r15
	mov	r15,r7
	mov.l	@(24,r15),r6
	add	#32,r7
	jsr	@r3
	mov.l	@(20,r12),r4
	mov.l	.L06067940,r2
	add	#16,r15
	mov.l	@r11,r3
	cmp/eq	r2,r3
	bf/s	.L060678CE
	mov	#-1,r13
	mov.l	r13,@r11
.L060678CE:
	mov.l	@(20,r12),r3
	mov.l	@(28,r3),r0
	tst	r0,r0
	bf	.L06067948
	mov	r15,r6
	mov.l	@(4,r15),r1
	mov	r15,r5
	mov.l	@(20,r12),r3
	add	#20,r6
	mov.l	@(32,r3),r2
	mov.l	r2,@r1
	mov.l	@(20,r12),r4
	mov.l	.L06067944,r3
	jsr	@r3
	mov.l	@(40,r4),r4
	mov	r15,r2
	add	#20,r2
	mov.b	@r2,r3
	mov	r15,r0
	extu.b	r3,r3
	add	#20,r0
	mov.w	r3,@r14
	mov.b	@(1,r0),r0
	extu.b	r0,r0
	mov.w	r0,@(2,r14)
	mov	r15,r0
	add	#20,r0
	mov.b	@(2,r0),r0
	extu.b	r0,r0
	mov.w	r0,@(4,r14)
	mov	r15,r0
	add	#20,r0
	mov.b	@(3,r0),r0
	extu.b	r0,r0
	mov.w	r0,@(6,r14)
	mov	r15,r0
	add	#20,r0
	mov.b	@(4,r0),r0
	extu.b	r0,r0
	mov.w	r0,@(8,r14)
	mov	r15,r0
	add	#20,r0
	mov.b	@(5,r0),r0
	extu.b	r0,r0
	bra	.L0606794E
	mov.w	r0,@(10,r14)
.L0606792A:
	.short 0x0311
.L0606792C:
	.long stm_set_err
.L06067930:
	.long stm_call_err_func
.L06067934:
	.long stm_check_gfs_err
.L06067938:
	.long stm_set_func_id
.L0606793C:
	.long gfsFlow_GetFinfo
.L06067940:
	.long 0x3FFFFFFF
.L06067944:
	.long gfcd_GetFilt
.L06067948:
	mov.l	r10,@r15
	mov.l	@(4,r15),r3
	mov.l	r13,@r3
.L0606794E:
	mov.l	@r15,r0
	tst	#1,r0
	bf	.L06067956
	mov.w	r13,@r14
.L06067956:
	mov.l	@r15,r0
	tst	#2,r0
	bf	.L06067960
	mov	r13,r0
	mov.w	r0,@(2,r14)
.L06067960:
	mov.l	@r15,r0
	tst	#4,r0
	bf	.L0606796C
	mov	r13,r0
	mov.w	r0,@(6,r14)
	mov.w	r0,@(4,r14)
.L0606796C:
	mov.l	@r15,r0
	tst	#8,r0
	bf	.L06067978
	mov	r13,r0
	mov.w	r0,@(10,r14)
	mov.w	r0,@(8,r14)
.L06067978:
	mov.l	.L06067A44,r3
	jsr	@r3
	nop
	mov.l	@r12,r0
.L06067980:
	add	#28,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel stm_get_info

	glabel stm_connect_filt
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	.L06067A48,r3
	mov.l	r4,@(4,r15)
	mov.l	r5,@r15
	mov.w	.L06067A3C,r4
	jsr	@r3
	nop
	mov.l	@(4,r15),r0
	tst	r0,r0
	bf	.L060679BC
	mov.l	.L06067A4C,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L06067A50,r2
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	jmp	@r2
	mov.l	@r15+,r14
.L060679BC:
	mov.l	@(4,r15),r13
	mov.l	@r15,r1
	tst	r1,r1
	bf/s	.L060679CC
	mov.l	@(4,r13),r13
	mov.w	.L06067A3E,r14
	bra	.L060679D4
	nop
.L060679CC:
	mov.l	@r15,r5
	mov.l	@(4,r5),r5
	mov.l	@(20,r5),r14
	mov.l	@(32,r14),r14
.L060679D4:
	mov.l	@(20,r13),r3
	mov	#-2,r6
	mov.l	r14,@(32,r3)
	mov	r14,r5
	mov.l	@(20,r13),r4
	mov.l	.L06067A54,r3
	jsr	@r3
	mov.l	@(40,r4),r4
	mov.l	.L06067A58,r2
	jsr	@r2
	nop
	mov	r0,r4
	tst	r4,r4
	bt	.L06067A02
	mov.l	.L06067A5C,r3
	jsr	@r3
	nop
	add	#8,r15
	mov.l	.L06067A50,r2
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	jmp	@r2
	mov.l	@r15+,r14
.L06067A02:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel stm_connect_filt

	glabel stm_move_sct
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	add	#-16,r15
	mov.l	.L06067A48,r3
	mov.l	r4,@r15
	mov.l	r5,@(8,r15)
	mov.l	r6,@(12,r15)
	mov.l	r7,@(4,r15)
	mov.w	.L06067A40,r4
	jsr	@r3
	nop
	mov.l	.L06067A50,r13
	mov.l	@r15,r0
	tst	r0,r0
	bt	.L06067A32
	mov.l	@(4,r15),r1
	tst	r1,r1
	bf	.L06067A60
.L06067A32:
	mov.l	.L06067A4C,r3
	jsr	@r3
	mov	#-11,r4
	bra	.L06067A72
	nop
.L06067A3C:
	.short 0x0337
.L06067A3E:
	.short 0x00FF
.L06067A40:
	.short 0x0338
	.byte 0x00, 0x00
.L06067A44:
	.long stm_check_gfs_err
.L06067A48:
	.long stm_set_func_id
.L06067A4C:
	.long stm_set_err
.L06067A50:
	.long stm_call_err_func
.L06067A54:
	.long gfcd_SetFiltCon
.L06067A58:
	.long gfcd_WaitServer
.L06067A5C:
	.long stm_set_err_gfs
.L06067A60:
	mov.l	@(8,r15),r2
	cmp/pz	r2
	bf	.L06067A6C
	mov.l	@(12,r15),r1
	cmp/pz	r1
	bt	.L06067A7A
.L06067A6C:
	mov.l	.L06067B68,r2
	jsr	@r2
	mov	#-14,r4
.L06067A72:
	jsr	@r13
	nop
	bra	.L06067AB4
	nop
.L06067A7A:
	mov.l	@r15,r3
	mov.l	@(4,r3),r2
	mov.l	r2,@r15
	mov.l	@(4,r15),r14
	mov	r2,r5
	mov.l	.L06067B6C,r3
	mov.l	@(4,r14),r14
	mov.l	@(12,r15),r7
	mov.l	@(8,r15),r6
	mov.l	@(20,r5),r5
	mov.l	@(32,r5),r5
	mov.l	@(20,r14),r4
	jsr	@r3
	mov.l	@(32,r4),r4
	mov	#44,r0
	mov.w	.L06067B60,r3
	mov.b	@(r0,r14),r2
	mov.l	.L06067B70,r1
	and	r3,r2
	jsr	@r1
	mov.b	r2,@(r0,r14)
	mov	r0,r4
	tst	r4,r4
	bt	.L06067AB4
	mov.l	.L06067B74,r3
	jsr	@r3
	nop
	jsr	@r13
	nop
.L06067AB4:
	add	#16,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel stm_move_sct

	glabel stm_delete_sct
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	sts.l	pr,@-r15
	mov.l	.L06067B78,r3
	add	#-12,r15
	mov.l	r4,@(8,r15)
	mov.l	r5,@r15
	mov.l	r6,@(4,r15)
	mov.w	.L06067B62,r4
	jsr	@r3
	nop
	mov.l	.L06067B7C,r13
	mov.l	@(8,r15),r0
	tst	r0,r0
	bf	.L06067AE6
	mov.l	.L06067B68,r3
	jsr	@r3
	mov	#-11,r4
	bra	.L06067AF8
	nop
.L06067AE6:
	mov.l	@r15,r2
	cmp/pz	r2
	bf	.L06067AF2
	mov.l	@(4,r15),r1
	cmp/pz	r1
	bt	.L06067B00
.L06067AF2:
	mov.l	.L06067B68,r2
	jsr	@r2
	mov	#-14,r4
.L06067AF8:
	jsr	@r13
	nop
	bra	.L06067B56
	nop
.L06067B00:
	mov.l	@(8,r15),r14
	mov	#0,r5
	mov.l	.L06067B80,r3
	mov.l	@(4,r14),r14
	jsr	@r3
	mov.l	@(16,r14),r4
	mov.l	@(16,r14),r2
	mov	#0,r3
	mov.w	.L06067B64,r0
	mov.l	r3,@(r0,r2)
	mov.l	@(20,r14),r2
	mov.l	@(28,r2),r1
	tst	r1,r1
	bf	.L06067B40
	mov.l	@(4,r15),r6
	mov.l	@r15,r5
	mov.l	.L06067B84,r3
	jsr	@r3
	mov.l	@(20,r14),r4
	mov.l	.L06067B70,r2
	jsr	@r2
	nop
	mov	r0,r4
	tst	r4,r4
	bt	.L06067B56
	mov.l	.L06067B74,r3
	jsr	@r3
	nop
	jsr	@r13
	nop
	bra	.L06067B56
	nop
.L06067B40:
	mov.l	.L06067B88,r3
	mov	#0,r6
	mov	r6,r5
	jsr	@r3
	mov.l	@(16,r14),r4
	add	#12,r15
	mov.l	.L06067B8C,r2
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	jmp	@r2
	mov.l	@r15+,r14
.L06067B56:
	add	#12,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
.L06067B60:
	.short 0x00DF
.L06067B62:
	.short 0x0339
.L06067B64:
	.short 0x00A0
	.byte 0x00, 0x00
.L06067B68:
	.long stm_set_err
.L06067B6C:
	.long gfcd_MoveSct
.L06067B70:
	.long gfcd_WaitServer
.L06067B74:
	.long stm_set_err_gfs
.L06067B78:
	.long stm_set_func_id
.L06067B7C:
	.long stm_call_err_func
.L06067B80:
	.long gfsTrn_Stop
.L06067B84:
	.long stm_DelSctData
.L06067B88:
	.long GFS_Seek
.L06067B8C:
	.long stm_check_gfs_err
	endlabel stm_delete_sct

	glabel stm_get_data_size
	sts.l	pr,@-r15
	add	#-12,r15
	mov.l	.L06067C98,r3
	mov.l	r4,@r15
	mov.l	r5,@(8,r15)
	mov.w	.L06067C92,r4
	jsr	@r3
	nop
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L06067BBA
	mov.l	.L06067C9C,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L06067CA0,r2
	jsr	@r2
	nop
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov	#-11,r0
.L06067BBA:
	mov.l	@(8,r15),r3
	cmp/pz	r3
	bt	.L06067BD4
	mov.l	.L06067C9C,r3
	jsr	@r3
	mov	#-14,r4
	mov.l	.L06067CA0,r2
	jsr	@r2
	nop
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov	#-14,r0
.L06067BD4:
	mov.l	@r15,r3
	mov	r15,r6
	mov.l	@(4,r3),r2
	add	#4,r6
	mov.l	r2,@r15
	mov	r2,r4
	mov.l	.L06067CA4,r3
	mov.l	@(8,r15),r5
	jsr	@r3
	mov.l	@(16,r4),r4
	mov.l	.L06067CA8,r2
	jsr	@r2
	nop
	mov	r0,r4
	cmp/pz	r4
	bt	.L06067BFC
	add	#12,r15
	lds.l	@r15+,pr
	rts
	mov	r4,r0
.L06067BFC:
	mov.l	@(4,r15),r0
	shlr	r0
	add	#12,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel stm_get_data_size

	glabel stm_get_num_sct
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov	#0,r11
	mov.l	.L06067C98,r3
	mov.l	r9,@-r15
	sts.l	pr,@-r15
	add	#-8,r15
	mov.l	r4,@(4,r15)
	mov.l	r11,@r15
	mov.w	.L06067C94,r4
	jsr	@r3
	mov	r5,r13
	mov.l	@(4,r15),r0
	tst	r0,r0
	bf	.L06067C3C
	mov.l	.L06067C9C,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L06067CA0,r2
	jsr	@r2
	nop
	bra	.L06067CF8
	mov	#-11,r0
.L06067C3C:
	cmp/pz	r13
	bt	.L06067C50
	mov.l	.L06067C9C,r2
	jsr	@r2
	mov	#-14,r4
	mov.l	.L06067CA0,r3
	jsr	@r3
	nop
	bra	.L06067CF8
	mov	#-14,r0
.L06067C50:
	mov.l	@(4,r15),r12
	tst	r13,r13
	bf/s	.L06067C5C
	mov.l	@(4,r12),r12
	bra	.L06067CF8
	mov	#0,r0
.L06067C5C:
	mov.l	@(20,r12),r3
	mov.l	@(28,r3),r0
	tst	r0,r0
	bt	.L06067C6A
	mov.l	.L06067CA4,r11
	bra	.L06067CC2
	mov	#1,r14
.L06067C6A:
	mov	#0,r6
	mov.l	.L06067CAC,r5
	mov.l	.L06067CB0,r3
	jsr	@r3
	mov.l	@(20,r12),r4
	mov.l	.L06067CB4,r9
	mov	r0,r10
	cmp/ge	r10,r11
	bt/s	.L06067CE6
	mov	r11,r14
.L06067C7E:
	mov	r14,r5
	jsr	@r9
	mov.l	@(20,r12),r4
	mov.l	@r15,r3
	add	r0,r3
	mov.l	r3,@r15
	cmp/ge	r13,r3
	bf	.L06067CB8
	bra	.L06067CE6
	add	#1,r14
.L06067C92:
	.short 0x0312
.L06067C94:
	.short 0x0313
	.byte 0x00, 0x00
.L06067C98:
	.long stm_set_func_id
.L06067C9C:
	.long stm_set_err
.L06067CA0:
	.long stm_call_err_func
.L06067CA4:
	.long gfsAcc_CountSct
.L06067CA8:
	.long stm_check_gfs_err
.L06067CAC:
	.long 0x7FFFFFFF
.L06067CB0:
	.long gfcf_GetNumSct
.L06067CB4:
	.long stm_GetSctData
.L06067CB8:
	add	#1,r14
	cmp/ge	r10,r14
	bf	.L06067C7E
	bra	.L06067CE6
	nop
.L06067CC2:
	mov	r15,r6
	mov	r14,r5
	jsr	@r11
	mov.l	@(16,r12),r4
	mov	r0,r4
	mov.l	@r15,r1
	mov.l	.L06067DBC,r2
	jsr	@r2
	mov	#2,r0
	mov.l	r0,@r15
	cmp/ge	r13,r0
	bt	.L06067CE6
	cmp/gt	r4,r14
	bf	.L06067CE2
	bra	.L06067CE6
	add	#-1,r14
.L06067CE2:
	bra	.L06067CC2
	add	#1,r14
.L06067CE6:
	mov.l	.L06067DC0,r2
	jsr	@r2
	nop
	mov	r0,r4
	cmp/pz	r4
	bt	.L06067CF6
	bra	.L06067CF8
	mov	r4,r0
.L06067CF6:
	mov	r14,r0
.L06067CF8:
	add	#8,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel stm_get_num_sct

	glabel stm_set_alternative
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	.L06067DC4,r3
	mov.l	r4,@r15
	mov.w	.L06067DB6,r4
	jsr	@r3
	mov	r5,r14
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L06067D36
	mov.l	.L06067DC8,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L06067DCC,r2
	jsr	@r2
	nop
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L06067D36:
	mov	#45,r0
	mov.b	@(r0,r14),r3
	tst	r3,r3
	bf	.L06067D48
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L06067D48:
	mov.l	.L06067DD0,r3
	mov	#0,r5
	mov.l	@r3,r6
	bra	.L06067D74
	mov.l	@(8,r6),r4
.L06067D52:
	mov	#45,r0
	mov.b	@(r0,r4),r0
	extu.b	r0,r0
	cmp/eq	#1,r0
	bf	.L06067D70
	cmp/eq	r14,r4
	bt	.L06067D70
	mov.l	@(4,r4),r3
	cmp/eq	r14,r3
	bf	.L06067D70
	mov	#0,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L06067D70:
	add	#1,r5
	add	#48,r4
.L06067D74:
	mov.l	@(12,r6),r3
	cmp/ge	r3,r5
	bf	.L06067D52
	mov.l	@r15,r1
	mov.l	.L06067DC0,r3
	jsr	@r3
	mov.l	r14,@(4,r1)
	mov	#1,r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel stm_set_alternative

	glabel stm_reset_alternative
	mov.l	r14,@-r15
	mov	r4,r14
	mov.l	.L06067DC4,r3
	sts.l	pr,@-r15
	mov.w	.L06067DB8,r4
	jsr	@r3
	nop
	tst	r14,r14
	bf	.L06067DAC
	mov.l	.L06067DC8,r3
	jsr	@r3
	mov	#-11,r4
	lds.l	@r15+,pr
	mov.l	.L06067DCC,r2
	jmp	@r2
	mov.l	@r15+,r14
.L06067DAC:
	mov.l	r14,@(4,r14)
	lds.l	@r15+,pr
	mov.l	.L06067DC0,r3
	jmp	@r3
	mov.l	@r15+,r14
.L06067DB6:
	.short 0x0314
.L06067DB8:
	.short 0x0315
	.byte 0x00, 0x00
.L06067DBC:
	.long _divlu
.L06067DC0:
	.long stm_check_gfs_err
.L06067DC4:
	.long stm_set_func_id
.L06067DC8:
	.long stm_set_err
.L06067DCC:
	.long stm_call_err_func
.L06067DD0:
	.long stm_mng
	endlabel stm_reset_alternative

	glabel stm_set_trn_mode
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov.l	.L06067EE8,r3
	add	#-8,r15
	mov.l	r4,@r15
	mov.l	r5,@(4,r15)
	mov.w	.L06067EE0,r4
	jsr	@r3
	nop
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L06067DFC
	mov.l	.L06067EEC,r3
	jsr	@r3
	mov	#-11,r4
	add	#8,r15
	mov.l	.L06067EF0,r2
	lds.l	@r15+,pr
	jmp	@r2
	mov.l	@r15+,r14
.L06067DFC:
	mov.l	@r15,r14
	mov.w	.L06067EE2,r3
	mov.l	@(4,r15),r2
	cmp/eq	r3,r2
	bf/s	.L06067E14
	mov.l	@(4,r14),r14
	mov.l	@(16,r14),r4
	mov.l	.L06067EF4,r2
	jsr	@r2
	add	#108,r4
	bra	.L06067E1C
	nop
.L06067E14:
	mov.l	@(16,r14),r4
	mov.l	.L06067EF8,r2
	jsr	@r2
	add	#108,r4
.L06067E1C:
	mov.l	.L06067EFC,r3
	add	#8,r15
	lds.l	@r15+,pr
	jmp	@r3
	mov.l	@r15+,r14
	endlabel stm_set_trn_mode

	glabel stm_set_trn_size
	sts.l	pr,@-r15
	mov.l	.L06067EE8,r3
	add	#-8,r15
	mov.l	r4,@r15
	mov.l	r5,@(4,r15)
	mov.w	.L06067EE4,r4
	jsr	@r3
	nop
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L06067E40
	bra	.L06067E48
	mov	#-11,r4
.L06067E40:
	mov.l	@(4,r15),r3
	cmp/pz	r3
	bt	.L06067E56
	mov	#-14,r4
.L06067E48:
	mov.l	.L06067EEC,r3
	jsr	@r3
	nop
	add	#8,r15
	mov.l	.L06067EF0,r2
	jmp	@r2
	lds.l	@r15+,pr
.L06067E56:
	mov.l	@r15,r3
	mov.l	@(4,r3),r2
	mov.l	r2,@r15
	mov.l	@(4,r15),r5
	mov	r2,r4
	mov.l	.L06067F00,r3
	mov.l	@(16,r4),r4
	jsr	@r3
	add	#108,r4
	mov.l	.L06067EFC,r2
	add	#8,r15
	jmp	@r2
	lds.l	@r15+,pr
	.byte 0x7F, 0x08, 0x4F, 0x26, 0x00, 0x0B, 0x00, 0x09
	endlabel stm_set_trn_size

	glabel stm_set_trn_type
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov.l	.L06067EE8,r3
	add	#-4,r15
	mov.l	r4,@r15
	mov.w	.L06067EE6,r4
	jsr	@r3
	mov	r5,r14
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L06067E9E
	mov.l	.L06067EEC,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L06067EF0,r2
	add	#4,r15
	lds.l	@r15+,pr
	jmp	@r2
	mov.l	@r15+,r14
.L06067E9E:
	tst	r14,r14
	bt	.L06067EC4
	mov	r14,r0
	cmp/eq	#1,r0
	bt	.L06067EC4
	mov	r14,r0
	cmp/eq	#2,r0
	bt	.L06067EC4
	mov	r14,r0
	cmp/eq	#3,r0
	bt	.L06067EC4
	mov.l	.L06067EEC,r2
	jsr	@r2
	mov	#-17,r4
	add	#4,r15
	mov.l	.L06067EF0,r3
	lds.l	@r15+,pr
	jmp	@r3
	mov.l	@r15+,r14
.L06067EC4:
	mov.l	@r15,r2
	mov	r14,r5
	mov.l	@(4,r2),r3
	mov.l	r3,@r15
	mov	r3,r4
	mov.l	@(16,r4),r4
	mov.l	.L06067F04,r3
	jsr	@r3
	add	#108,r4
	add	#4,r15
	mov.l	.L06067EFC,r2
	lds.l	@r15+,pr
	jmp	@r2
	mov.l	@r15+,r14
.L06067EE0:
	.short 0x0319
.L06067EE2:
	.short 0x0300
.L06067EE4:
	.short 0x0320
.L06067EE6:
	.short 0x0322
.L06067EE8:
	.long stm_set_func_id
.L06067EEC:
	.long stm_set_err
.L06067EF0:
	.long stm_call_err_func
.L06067EF4:
	.long gfsTrn_Activate
.L06067EF8:
	.long gfsTrn_Deactivate
.L06067EFC:
	.long stm_check_gfs_err
.L06067F00:
	.long gfsTrn_SetTsize
.L06067F04:
	.long gfsTrn_SetMode
	endlabel stm_set_trn_type

	glabel stm_get_sct_info
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov	r5,r11
	mov.l	.L06068018,r3
	sts.l	pr,@-r15
	add	#-4,r15
	mov.l	r4,@r15
	mov.w	.L06068012,r4
	jsr	@r3
	mov	r6,r14
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L06067F38
	mov.l	.L0606801C,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L06068020,r2
	jsr	@r2
	nop
	bra	.L06067F8E
	mov	#0,r0
.L06067F38:
	cmp/pz	r11
	bt	.L06067F4C
	mov.l	.L0606801C,r2
	jsr	@r2
	mov	#-14,r4
	mov.l	.L06068020,r3
	jsr	@r3
	nop
	bra	.L06067F8E
	mov	#0,r0
.L06067F4C:
	mov.l	@r15,r12
	mov.l	@(4,r12),r12
	mov.l	@(20,r12),r3
	mov.l	@(28,r3),r0
	tst	r0,r0
	bf	.L06067F66
	mov.l	.L06068024,r3
	mov	r14,r6
	mov	r11,r5
	jsr	@r3
	mov.l	@(20,r12),r4
	bra	.L06067F86
	mov	r0,r10
.L06067F66:
	mov	#0,r13
	mov.l	.L06068028,r3
	jsr	@r3
	mov	r12,r4
	cmp/ge	r0,r11
	bt	.L06067F84
	mov	r13,r0
	mov.l	.L0606802C,r3
	mov.l	r3,@r14
	mov.l	r13,@(4,r14)
	mov.l	r13,@(8,r14)
	mov.b	r0,@(12,r14)
	mov.b	r0,@(13,r14)
	bra	.L06067F86
	mov	#1,r10
.L06067F84:
	mov	r13,r10
.L06067F86:
	mov.l	.L06068030,r2
	jsr	@r2
	nop
	mov	r10,r0
.L06067F8E:
	add	#4,r15
	lds.l	@r15+,pr
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	rts
	mov.l	@r15+,r14
	endlabel stm_get_sct_info

	glabel stm_get_loop_cnt
	sts.l	pr,@-r15
	mov.l	.L06068018,r3
	add	#-4,r15
	mov.l	r4,@r15
	mov.w	.L06068014,r4
	jsr	@r3
	nop
	mov.l	@r15,r0
	tst	r0,r0
	bf	.L06067FC6
	mov.l	.L0606801C,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L06068020,r2
	jsr	@r2
	nop
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	#-11,r0
.L06067FC6:
	mov.l	.L06068030,r3
	jsr	@r3
	nop
	mov	r0,r4
	cmp/pz	r4
	bt	.L06067FDA
	add	#4,r15
	lds.l	@r15+,pr
	rts
	mov	r4,r0
.L06067FDA:
	mov.l	@r15,r0
	mov.l	@(48,r0),r0
	add	#4,r15
	lds.l	@r15+,pr
	rts
	nop
	endlabel stm_get_loop_cnt

	glabel stm_get_exec_stat
	mov.l	r14,@-r15
	sts.l	pr,@-r15
	mov	r4,r14
	mov.l	.L06068018,r3
	add	#-8,r15
	mov.w	.L06068016,r4
	mov.l	r5,@(4,r15)
	jsr	@r3
	nop
	tst	r14,r14
	bf	.L06068034
	mov.l	.L0606801C,r3
	jsr	@r3
	mov	#-11,r4
	mov.l	.L06068020,r2
	jsr	@r2
	nop
	mov	#-11,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L06068012:
	.short 0x0325
.L06068014:
	.short 0x0333
.L06068016:
	.short 0x0334
.L06068018:
	.long stm_set_func_id
.L0606801C:
	.long stm_set_err
.L06068020:
	.long stm_call_err_func
.L06068024:
	.long stm_GetSctInfo
.L06068028:
	.long STM_GetNumSct
.L0606802C:
	.long 0x7FFFFFFF
.L06068030:
	.long stm_check_gfs_err
.L06068034:
	mov.l	.L060680BC,r2
	mov.l	@r2,r3
	mov.l	@(16,r3),r1
	cmp/eq	r14,r1
	bf	.L06068076
	mov	#56,r0
	mov.w	@(r0,r14),r4
	mov	#2,r0
	extu.w	r4,r4
	tst	r4,r0
	bt	.L0606804E
	bra	.L06068050
	mov	#1,r0
.L0606804E:
	mov	#0,r0
.L06068050:
	cmp/eq	#1,r0
	bf	.L06068076
	mov	#4,r0
	tst	r4,r0
	bt	.L0606805E
	bra	.L06068060
	mov	#1,r0
.L0606805E:
	mov	#0,r0
.L06068060:
	cmp/eq	#1,r0
	bf	.L06068076
	mov.l	.L060680C0,r3
	mov	r15,r4
	jsr	@r3
	mov	#0,r5
	mov.l	@r15,r2
	cmp/pz	r2
	bf	.L06068076
	mov.l	@r15,r1
	mov.l	r1,@(20,r14)
.L06068076:
	mov.l	@(4,r15),r3
	mov.l	@(20,r14),r2
	mov.l	r2,@r3
	mov.l	.L060680C4,r3
	jsr	@r3
	nop
	mov	r0,r4
	cmp/pz	r4
	bt	.L06068092
	mov	r4,r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
.L06068092:
	mov.l	@(24,r14),r0
	add	#8,r15
	lds.l	@r15+,pr
	rts
	mov.l	@r15+,r14
	endlabel stm_get_exec_stat

	glabel STM_SetErrFunc
	mov.l	.L060680BC,r6
	mov	#0,r2
	mov.l	@r6,r3
	mov.l	r2,@(28,r3)
	mov.l	@r6,r3
	mov.l	r4,@(36,r3)
	mov.l	@r6,r2
	rts
	mov.l	r5,@(40,r2)
	endlabel STM_SetErrFunc

	glabel STM_GetErrStat
	mov	#16,r6
	mov.l	.L060680BC,r3
	mov.l	@r3,r5
	mov.l	.L060680C8,r2
	jmp	@r2
	add	#28,r5
	.byte 0x00, 0x00
.L060680BC:
	.long stm_mng
.L060680C0:
	.long gfsFlow_GetCdStat
.L060680C4:
	.long stm_check_gfs_err
.L060680C8:
	.long memmove
	endlabel STM_GetErrStat
