	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06033970,"ax",@progbits
	.p2align 2

	glabel func_06033970
	sts.l	pr,@-r15
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#240,r0
	ldc	r0,sr
	mov.l	.L06033A70,r0
	jsr	@r0
	nop
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	.L06033A74,r0
	jsr	@r0
	mov	#1,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	.L06033A78,r0
	jsr	@r0
	nop
	mov.l	.L06033A7C,r0
	jsr	@r0
	nop
	mov.l	.L06033A80,r0
	jsr	@r0
	nop
	mov.l	.L06033A84,r10
	mov	#6,r4
	mov.b	@(20,gbr),r0
	and	#1,r0
	add	r0,r4
	jsr	@r10
	nop
	mov.l	.L06033A88,r0
	jsr	@r0
	nop
	mov.l	.L06033A8C,r0
	jsr	@r0
	nop
	mov.l	.L06033A90,r0
	jsr	@r0
	nop
	mov.l	.L06033A94,r0
	jsr	@r0
	nop
	mov.l	.L06033A98,r2
	mov.l	.L06033A9C,r3
	mov.w	.L06033A66,r7
.L060339D6:
	mov.w	@r3+,r0
	mov.w	r0,@r2
	dt	r7
	bf/s	.L060339D6
	add	#2,r2
	mov.l	.L06033AA0,r0
	jsr	@r0
	nop
	mov	#2,r4
	mov.l	.L06033AA4,r0
	mov.b	@(r0,r4),r4
	mov.w	@(224,gbr),r0
	or	r4,r0
	mov.w	r0,@(224,gbr)
	mov.w	.L06033A68,r0
	mov.w	r0,@(500,gbr)
	mov.w	r0,@(502,gbr)
	mov.w	r0,@(504,gbr)
	mov.w	r0,@(506,gbr)
	mov.w	r0,@(508,gbr)
	mov.w	r0,@(510,gbr)
	mov.w	.L06033A6A,r0
	mov.w	r0,@(498,gbr)
	mov.l	.L06033AA8,r2
	mov.l	.L06033AAC,r0
	jsr	@r0
	nop
	mov.l	.L06033AB0,r2
	mov.l	.L06033AB4,r0
	jsr	@r0
	nop
	mov.l	.L06033AB8,r2
	mov.l	.L06033ABC,r3
	mov.l	.L06033AC0,r6
	mov.w	.L06033A6C,r8
	mov.w	.L06033A6C,r9
	mov.w	.L06033A6C,r14
	mov.l	.L06033AC4,r0
	jsr	@r0
	nop
	mov.l	.L06033AC8,r2
	mov.l	.L06033ACC,r3
	mov.w	.L06033A6E,r7
.L06033A2C:
	mov.w	@r3+,r0
	mov.w	r0,@r2
	dt	r7
	bf/s	.L06033A2C
	add	#2,r2
	mov.l	.L06033AD0,r2
	mov.l	.L06033AD4,r0
	jsr	@r0
	nop
	mov.l	.L06033AD8,r0
	mov.l	r0,@(12,r3)
	mov.l	.L06033AD0,r2
	mov.l	.L06033AD4,r0
	jsr	@r0
	nop
	mov.l	.L06033ADC,r0
	mov.l	r0,@(12,r3)
	mov	#5,r0
	mov.b	r0,@(0,gbr)
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#0,r0
	ldc	r0,sr
	lds.l	@r15+,pr
	rts
	nop
.L06033A66:
	.short 0x0090
.L06033A68:
	.short 0x00FF
.L06033A6A:
	.short 0x003E
.L06033A6C:
	.short 0x0020
.L06033A6E:
	.short 0x0010
.L06033A70:
	.long func_0600454C
.L06033A74:
	.long snd_seq_stop
.L06033A78:
	.long func_0604DF68
.L06033A7C:
	.long load_over
.L06033A80:
	.long snd_seq_stop_all
.L06033A84:
	.long cd_play_track
.L06033A88:
	.long vdp1_cmdlist_begin
.L06033A8C:
	.long vdp1_cmdlist_end
.L06033A90:
	.long func_0601EC24
.L06033A94:
	.long obj_init
.L06033A98:
	.long vdp2_shadow
.L06033A9C:
	.long vdp2_shadow_defaults
.L06033AA0:
	.long func_0602B960
.L06033AA4:
	.long lbl_0602B7E4
.L06033AA8:
	.long D_06033CA0
.L06033AAC:
	.long func_0602CAE0
.L06033AB0:
	.long D_06033AE0
.L06033AB4:
	.long func_0602B9F2
.L06033AB8:
	.long 0x00200004
.L06033ABC:
	.long VDP2_VRAM + 0x58000
.L06033AC0:
	.long 0x00004000
.L06033AC4:
	.long func_0602C204
.L06033AC8:
	.long D_060CA200
.L06033ACC:
	.long D_0020A1B4
.L06033AD0:
	.long obj_list_stage
.L06033AD4:
	.long obj_alloc
.L06033AD8:
	.long func_06033B0A
.L06033ADC:
	.long func_06033034
	endlabel func_06033970

	.section .data.06033AE0,"aw",@progbits
	.p2align 2
	dlabel D_06033AE0
	.long VDP2_VRAM
	.byte 0x00, 0x20, 0x08, 0x04, 0x00, 0x00, 0x7C, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.long D_060CA800
	.byte 0x00, 0x20, 0x84, 0x04, 0x00, 0x00, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x0B, 0x00, 0x09
