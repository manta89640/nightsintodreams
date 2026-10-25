	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0602F104,"ax",@progbits
	.p2align 2

	glabel game_mode_play
	sts.l	pr,@-r15
	bsr	func_0602FD1C
	nop
	mov.l	.L0602F128,r0
	jsr	@r0
	nop
	mov.l	.L0602F12C,r2
	mov	#0,r0
	mov.w	r0,@r2
.L0602F116:
	mov.b	@(111,gbr),r0
	tst	r0,r0
	bt	.L0602F130
	mov.l	.L0602F128,r0
	jsr	@r0
	nop
	bra	.L0602F116
	nop
	.byte 0x00, 0x00
.L0602F128:
	.long sys_wait_vblank
.L0602F12C:
	.long D_0602F264
.L0602F130:
	mov.b	@(109,gbr),r0
	add	#1,r0
	mov	#4,r8
	cmp/gt	r8,r0
	bf	.L0602F13C
	mov	#0,r0
.L0602F13C:
	mov.b	r0,@(109,gbr)
	mov	#0,r0
	mov.b	r0,@(110,gbr)
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L0602F15A
	mov.l	.L0602F1E4,r8
	mov	r8,r0
	mov.l	r0,@(808,gbr)
	mov.l	@(740,gbr),r0
	add	r0,r8
	mov	r8,r0
	mov.l	r0,@(812,gbr)
	mov	#0,r0
	mov.b	r0,@(31,gbr)
.L0602F15A:
	bsr	game_frame
	nop
	bsr	func_0602F23E
	nop
	bsr	func_0602FD1C
	nop
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L0602F172
	mov.l	.L0602F1E8,r0
	jsr	@r0
	nop
.L0602F172:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0602F198
	mov	#1,r0
	mov.b	r0,@(110,gbr)
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L0602F194
	mov.l	.L0602F1EC,r8
	mov	r8,r0
	mov.l	r0,@(808,gbr)
	mov.l	@(740,gbr),r0
	add	r0,r8
	mov	r8,r0
	mov.l	r0,@(812,gbr)
	mov	#1,r0
	mov.b	r0,@(31,gbr)
.L0602F194:
	bsr	game_frame
	nop
.L0602F198:
	mov.l	.L0602F1F0,r2
	mov.l	.L0602F1F4,r3
	mov.b	@(1,r2),r0
	tst	r0,r0
	bt	.L0602F1B0
	mov	#0,r0
	mov.b	r0,@(1,r2)
	mov.l	.L0602F1F8,r4
	mov.l	.L0602F1FC,r5
	mov.l	.L0602F200,r6
	jsr	@r3
	mov.l	@r6,r6
.L0602F1B0:
	mov.b	@(2,r2),r0
	tst	r0,r0
	bt	.L0602F1C6
	mov	#0,r0
	mov.b	r0,@(2,r2)
	mov.l	.L0602F204,r4
	mov.l	.L0602F208,r5
	mov	#1,r6
	shll8	r6
	jsr	@r3
	mov.l	@r5,r5
.L0602F1C6:
	mov.l	.L0602F20C,r1
	mov.l	@r1,r2
	tst	r2,r2
	bt	.L0602F210
	mov	#0,r0
	mov.l	r0,@r1
.L0602F1D2:
	mov.l	@r2+,r4
	cmp/pz	r4
	bf	.L0602F210
	mov.l	@r2+,r5
	jsr	@r3
	mov.l	@r2+,r6
	bra	.L0602F1D2
	nop
	.byte 0x00, 0x00
.L0602F1E4:
	.long vdp1_list_buf
.L0602F1E8:
	.long sys_wait_vblank
.L0602F1EC:
	.long vdp1_alt_list_buf
.L0602F1F0:
	.long D_060DB2E8
.L0602F1F4:
	.long dma_queue_xfer
.L0602F1F8:
	.long D_060D9518
.L0602F1FC:
	.long VDP1_VRAM_CACHED + 0x7E800
.L0602F200:
	.long D_060DAD18
.L0602F204:
	.long D_060D9200
.L0602F208:
	.long D_060DB2E4
.L0602F20C:
	.long D_060DB570
.L0602F210:
	bsr	func_0602F74C
	nop
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L0602F220
	mov.l	.L0602F230,r0
	jsr	@r0
	nop
.L0602F220:
	mov.l	.L0602F234,r1
	mov.b	@r1,r0
	cmp/pz	r0
	bf	.L0602F22A
	mov.b	r0,@(0,gbr)
.L0602F22A:
	lds.l	@r15+,pr
	rts
	nop
.L0602F230:
	.long sys_wait_vblank
.L0602F234:
	.long next_game_mode
	.byte 0x00, 0x01, 0x00, 0x01, 0x00, 0x09
	endlabel game_mode_play

	glabel func_0602F23E
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L0602F254
	mov.l	.L0602F25C,r3
	mov.l	.L0602F260,r2
	mov.w	.L0602F258,r1
.L0602F24A:
	dt	r3
	bt	.L0602F254
	mov.b	@r2,r0
	tst	r1,r0
	bt	.L0602F24A
.L0602F254:
	rts
	nop
.L0602F258:
	.short 0x0080
	.byte 0x00, 0x00
.L0602F25C:
	.long 0x000186A0
.L0602F260:
	.long 0xFFFFFE11
	dlabel D_0602F264
	.byte 0x00, 0x00
	endlabel func_0602F23E

	glabel game_frame
	sts.l	pr,@-r15
	mov	#-1,r0
	mov.l	r0,@(728,gbr)
	mov.l	.L0602F284,r0
	jsr	@r0
	nop
	mov.w	@(28,gbr),r0
	tst	#8,r0
	bf	.L0602F28C
	mov.b	@(107,gbr),r0
	tst	r0,r0
	bf	.L0602F288
	bra	.L0602F28C
	nop
	.byte 0x00, 0x00
.L0602F284:
	.long snd_cmd_flush
.L0602F288:
	bra	.L0602F45E
	nop
.L0602F28C:
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L0602F2A0
	mov.w	@(70,gbr),r0
	tst	r0,r0
	bt	.L0602F29C
	bra	.L0602F5D6
	nop
.L0602F29C:
	bra	.L0602F45E
	nop
.L0602F2A0:
	mov.l	.L0602F2AC,r2
	mov.w	@r2,r2
	tst	r2,r2
	bt	.L0602F2B0
	bra	.L0602F2CC
	mov	#0,r0
.L0602F2AC:
	.long D_060D9074 + 0x20000000
.L0602F2B0:
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L0602F2C0
	mov.b	@(83,gbr),r0
	mov	r0,r8
	mov.b	@(79,gbr),r0
	bra	.L0602F2C2
	or	r8,r0
.L0602F2C0:
	mov.b	@(79,gbr),r0
.L0602F2C2:
	mov	r0,r8
	mov.l	.L0602F2F8,r2
	mov.w	@r2,r0
	or	r8,r0
	mov.w	r0,@r2
.L0602F2CC:
	cmp/pz	r0
	bt	.L0602F36E
	mov.w	@(76,gbr),r0
	and	#112,r0
	cmp/eq	#112,r0
	bt	.L0602F36E
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L0602F36E
	mov.w	@(70,gbr),r0
	xor	#1,r0
	mov.w	r0,@(70,gbr)
	tst	r0,r0
	bt	.L0602F324
	mov.b	@(127,gbr),r0
	tst	r0,r0
	bt	.L0602F2FC
	mov.w	@(70,gbr),r0
	xor	#1,r0
	mov.w	r0,@(70,gbr)
	bra	.L0602F36E
	nop
.L0602F2F8:
	.long D_0602F264
.L0602F2FC:
	mov	#1,r0
	mov.b	r0,@(36,gbr)
	mov.b	@(35,gbr),r0
	tst	r0,r0
	bt	.L0602F30A
	bra	.L0602F324
	nop
.L0602F30A:
	mov.l	.L0602F31C,r2
	mov.l	.L0602F320,r0
	jsr	@r0
	nop
	bsr	func_0602F860
	nop
	bra	.L0602F330
	nop
	.byte 0x00, 0x00
.L0602F31C:
	.long D_0602F6E4
.L0602F320:
	.long txt_print_big_at
.L0602F324:
	bsr	func_0602F9B4
	nop
	mov.l	.L0602F34C,r2
	mov.l	.L0602F350,r0
	jsr	@r0
	nop
.L0602F330:
	mov.w	@(70,gbr),r0
	tst	r0,r0
	bt	.L0602F35C
	mov.l	.L0602F354,r0
	jsr	@r0
	nop
	mov.b	@(61,gbr),r0
	tst	r0,r0
	bt	.L0602F348
	mov.l	.L0602F358,r0
	jsr	@r0
	nop
.L0602F348:
	bra	.L0602F456
	nop
.L0602F34C:
	.long D_0602F6FE
.L0602F350:
	.long txt_print_big_at
.L0602F354:
	.long snd_seq_pause_all
.L0602F358:
	.long cd_pause
.L0602F35C:
	mov.l	.L0602F394,r0
	jsr	@r0
	nop
	mov.b	@(61,gbr),r0
	tst	r0,r0
	bt	.L0602F36E
	mov.l	.L0602F398,r0
	jsr	@r0
	nop
.L0602F36E:
	mov.w	@(70,gbr),r0
	tst	r0,r0
	bt	.L0602F45E
	mov.b	@(84,gbr),r0
	and	#26,r0
	cmp/eq	#26,r0
	bf	.L0602F388
	mov.l	.L0602F39C,r2
	mov.l	.L0602F3A0,r0
	jsr	@r0
	nop
	mov.l	.L0602F3A4,r0
	mov.l	r0,@(12,r3)
.L0602F388:
	mov.w	@(28,gbr),r0
	tst	#8,r0
	bf	.L0602F3A8
	bra	.L0602F440
	nop
	.byte 0x00, 0x00
.L0602F394:
	.long snd_seq_continue_all
.L0602F398:
	.long func_06006B48
.L0602F39C:
	.long obj_list_pause
.L0602F3A0:
	.long obj_alloc
.L0602F3A4:
	.long dbg_sound_test_init
.L0602F3A8:
	mov.b	@(78,gbr),r0
	tst	#8,r0
	bt	.L0602F3C2
	mov.b	@(35,gbr),r0
	xor	#1,r0
	mov.b	r0,@(35,gbr)
	mov.l	.L0602F3FC,r2
	mov	#0,r0
	mov.l	.L0602F400,r7
.L0602F3BA:
	mov.l	r0,@r2
	dt	r7
	bf/s	.L0602F3BA
	add	#4,r2
.L0602F3C2:
	mov.b	@(76,gbr),r0
	tst	#1,r0
	bt	.L0602F3E0
	mov.l	.L0602F404,r4
	mov.l	@r4,r4
	mov.l	@(8,r4),r12
	mov.b	@(1,r12),r0
	and	#207,r0
	mov.b	r0,@(1,r12)
	mov.l	.L0602F408,r2
	mov.l	.L0602F40C,r0
	jsr	@r0
	nop
	mov.l	.L0602F410,r0
	mov.l	r0,@(12,r3)
.L0602F3E0:
	mov.b	@(76,gbr),r0
	tst	#4,r0
	bt	.L0602F414
	mov.b	@(20,gbr),r0
	add	#1,r0
	mov	#16,r8
	cmp/ge	r8,r0
	bf	.L0602F3F2
	mov	#0,r0
.L0602F3F2:
	mov.b	r0,@(21,gbr)
	mov	#0,r0
	mov.b	r0,@(0,gbr)
	bra	.L0602F5D0
	nop
.L0602F3FC:
	.long VDP2_VRAM + 0x5C000
.L0602F400:
	.long 0x00000600
.L0602F404:
	.long player_obj
.L0602F408:
	.long obj_list_pause
.L0602F40C:
	.long obj_alloc
.L0602F410:
	.long 0x00000000
.L0602F414:
	mov.l	.L0602F420,r2
	mov.w	@r2,r2
	tst	r2,r2
	bt	.L0602F424
	bra	.L0602F426
	mov.w	@(82,gbr),r0
.L0602F420:
	.long D_060D9074 + 0x20000000
.L0602F424:
	mov.w	@(78,gbr),r0
.L0602F426:
	tst	#64,r0
	bf	.L0602F456
	nop
	tst	#16,r0
	bt	.L0602F440
	nop
	mov.l	.L0602F43C,r0
	jsr	@r0
	nop
	bra	.L0602F456
	nop
.L0602F43C:
	.long sys_wait_vblank
.L0602F440:
	bra	.L0602F5D6
	nop
	.byte 0xD0, 0x16, 0x40, 0x0B, 0x00, 0x09, 0xD0, 0x15, 0x40, 0x0B, 0x00, 0x09, 0xD0, 0x13, 0x40, 0x0B
	.byte 0x00, 0x09
.L0602F456:
	mov	#0,r0
	mov.w	r0,@(82,gbr)
	mov	#1,r0
	mov.b	r0,@(110,gbr)
.L0602F45E:
	mov.l	.L0602F4A4,r4
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L0602F46E
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L0602F46E
	mov.l	.L0602F4A8,r4
.L0602F46E:
	mov.w	@r4,r0
	mov.l	.L0602F4AC,r4
	mov.w	r0,@r4
	mov.l	.L0602F4B0,r4
	mov.w	r0,@r4
	mov.l	.L0602F4B4,r4
	mov.w	r0,@r4
	mov.l	.L0602F4B8,r4
	mov.w	r0,@r4
	mov.l	.L0602F4BC,r4
	mov.w	r0,@r4
	mov.l	.L0602F4C0,r4
	mov.w	r0,@r4
	mov.l	.L0602F4C4,r4
	mov.w	r0,@r4
	mov.l	.L0602F4C8,r4
	mov.w	r0,@r4
	bsr	func_0602FD70
	nop
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L0602F4CC
	bra	.L0602F4E8
	nop
	.byte 0x00, 0x00
	.long sys_wait_vblank
.L0602F4A4:
	.long .L0602F5D4
.L0602F4A8:
	.long .L0602F5D2
.L0602F4AC:
	.long poly_draw_model
.L0602F4B0:
	.long poly_draw_model_color
.L0602F4B4:
	.long D_0601F4AE
.L0602F4B8:
	.long func_060213DA
.L0602F4BC:
	.long func_06020578
.L0602F4C0:
	.long spr_draw_obj
.L0602F4C4:
	.long spr_draw_billboard_unscaled
.L0602F4C8:
	.long spr_draw_billboard
.L0602F4CC:
	mov.b	@(149,gbr),r0
	tst	#2,r0
	bf	.L0602F4DC
	mov.w	@(28,gbr),r0
	tst	#8,r0
	bf	.L0602F4DC
	bra	.L0602F4E8
	nop
.L0602F4DC:
	mov.b	@(78,gbr),r0
	tst	#4,r0
	bt	.L0602F4E8
	mov.l	.L0602F578,r7
	mov	#1,r0
	mov.b	r0,@(9,r7)
.L0602F4E8:
	mov	#0,r0
	mov.b	r0,@(46,gbr)
	mov.l	.L0602F57C,r0
	jsr	@r0
	nop
	mov.l	.L0602F580,r2
	mov.l	.L0602F584,r0
	jsr	@r0
	nop
	mov.l	.L0602F588,r2
	mov.l	.L0602F584,r0
	jsr	@r0
	nop
	mov.l	.L0602F58C,r2
	mov.l	.L0602F584,r0
	jsr	@r0
	nop
	mov.l	.L0602F590,r2
	mov.l	.L0602F584,r0
	jsr	@r0
	nop
	mov.l	.L0602F594,r2
	mov.l	.L0602F584,r0
	jsr	@r0
	nop
	mov.l	@(12,gbr),r0
	add	#1,r0
	mov.l	r0,@(12,gbr)
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bf	.L0602F5AE
	mov.l	.L0602F598,r4
	mov.l	@r4,r4
	mov.b	@(6,r4),r0
	cmp/eq	#0,r0
	mov.l	@(712,gbr),r0
	add	#1,r0
	mov.l	r0,@(712,gbr)
	mov.w	@(28,gbr),r0
	tst	#1,r0
	bf	.L0602F5AE
	mov.b	@(38,gbr),r0
	tst	r0,r0
	bf	.L0602F5AE
	mov.l	@(16,gbr),r0
	add	#-1,r0
	cmp/pz	r0
	bt	.L0602F54A
	mov	#0,r0
.L0602F54A:
	mov.l	r0,@(16,gbr)
	mov.b	@(149,gbr),r0
	tst	#1,r0
	bt	.L0602F55E
	mov.l	@(16,gbr),r0
	mov.l	.L0602F59C,r8
	cmp/ge	r8,r0
	bt	.L0602F55E
	mov.l	.L0602F5A0,r0
	mov.l	r0,@(16,gbr)
.L0602F55E:
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L0602F5AE
	mov.l	.L0602F5A4,r2
	mov.l	@(16,gbr),r0
.L0602F568:
	mov.l	@r2+,r8
	cmp/pz	r8
	bf	.L0602F5AE
	cmp/eq	r8,r0
	bt	.L0602F5A8
	bra	.L0602F568
	add	#4,r2
	.byte 0x00, 0x00
.L0602F578:
	.long play_state
.L0602F57C:
	.long vdp1_cmdlist_begin
.L0602F580:
	.long obj_list_core
.L0602F584:
	.long obj_run_list
.L0602F588:
	.long obj_list_manager
.L0602F58C:
	.long obj_list_stage
.L0602F590:
	.long obj_list_effect
.L0602F594:
	.long obj_list_pause
.L0602F598:
	.long player_obj
.L0602F59C:
	.long 0x0000001E
.L0602F5A0:
	.long 0x00001C20
.L0602F5A4:
	.long D_0602F638
.L0602F5A8:
	mov.l	@r2+,r8
	jsr	@r8
	nop
.L0602F5AE:
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L0602F5BA
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L0602F5D0
.L0602F5BA:
	mov.l	.L0602F604,r0
	jsr	@r0
	nop
	mov	#-1,r0
	mov.b	r0,@(62,gbr)
	mov.b	@(46,gbr),r0
	tst	r0,r0
	bf	.L0602F5D0
	mov	#0,r0
	mov.l	.L0602F608,r8
	mov.w	r0,@r8
.L0602F5D0:
	lds.l	@r15+,pr
.L0602F5D2:
	rts
.L0602F5D4:
	nop
.L0602F5D6:
	mov.l	.L0602F60C,r2
	mov.l	.L0602F610,r0
	jsr	@r0
	nop
	mov.b	@(76,gbr),r0
	and	#7,r0
	cmp/eq	#7,r0
	bf	.L0602F622
	mov.b	@(78,gbr),r0
	tst	#7,r0
	bt	.L0602F622
	mov.l	.L0602F614,r2
	mov.b	@(36,gbr),r0
	xor	#1,r0
	mov.b	r0,@(36,gbr)
	tst	r0,r0
	bt	.L0602F5FA
	mov.l	.L0602F618,r2
.L0602F5FA:
	mov.b	@(35,gbr),r0
	tst	r0,r0
	bt	.L0602F61C
	bra	.L0602F622
	nop
.L0602F604:
	.long vdp1_cmdlist_end
.L0602F608:
	.long D_060FFC36 + 0x20000000
.L0602F60C:
	.long obj_list_pause
.L0602F610:
	.long obj_run_list
.L0602F614:
	.long D_0602F6FE
.L0602F618:
	.long D_0602F6E4
.L0602F61C:
	mov.l	.L0602F634,r0
	jsr	@r0
	nop
.L0602F622:
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bt	.L0602F62C
	mov	#-1,r0
	mov.b	r0,@(62,gbr)
.L0602F62C:
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0602F634:
	.long txt_print_big_at
	dlabel D_0602F638
	.byte 0x00, 0x00, 0x02, 0x94
	.long func_0602F644
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	endlabel game_frame

	glabel func_0602F644
	sts.l	pr,@-r15
	mov.l	.L0602F670,r2
	mov.l	.L0602F674,r0
	jsr	@r0
	nop
	mov.l	.L0602F678,r0
	mov.l	r0,@(12,r3)
	mov.b	@(61,gbr),r0
	cmp/eq	#1,r0
	bf	.L0602F65E
	mov.l	.L0602F67C,r0
	jsr	@r0
	nop
.L0602F65E:
	mov.l	.L0602F680,r0
	jsr	@r0
	mov	#4,r4
	mov	#2,r0
	mov.b	r0,@(61,gbr)
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0602F670:
	.long obj_list_effect
.L0602F674:
	.long obj_alloc
.L0602F678:
	.long func_0602F684
.L0602F67C:
	.long snd_bgm_fade_in
.L0602F680:
	.long cd_play_track
	endlabel func_0602F644

	glabel func_0602F684
	mov.l	.L0602F6A8,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L0602F6B4
	mov	#0,r0
	mov.b	r0,@(61,gbr)
	mov.l	r1,@-r15
	sts.l	pr,@-r15
	mov.l	.L0602F6AC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	@r15+,r1
	mov.l	.L0602F6B0,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L0602F6A8:
	.long player_obj
.L0602F6AC:
	.long cd_pause
.L0602F6B0:
	.long obj_free
.L0602F6B4:
	mov.l	@(16,gbr),r0
	mov.l	.L0602F6C0,r8
	cmp/gt	r8,r0
	bt	.L0602F6C4
	rts
	nop
.L0602F6C0:
	.long 0x00000294
.L0602F6C4:
	mov	#0,r0
	mov.b	r0,@(61,gbr)
	mov.l	r1,@-r15
	sts.l	pr,@-r15
	mov.l	.L0602F6DC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	@r15+,r1
	mov.l	.L0602F6E0,r0
	jmp	@r0
	nop
.L0602F6DC:
	.long cd_pause
.L0602F6E0:
	.long obj_free
	dlabel D_0602F6E4
	.byte 0x00, 0x1E, 0x00, 0x05, 0x40, 0x31, 0x20, 0x20, 0x20, 0x20, 0x20, 0x40, 0x32, 0x2B, 0x40, 0x31
	.byte 0x50, 0x41, 0x55, 0x53, 0x45, 0x40, 0x32, 0x2B, 0xFE, 0x09
	dlabel D_0602F6FE
	.byte 0x00, 0x1E, 0x00, 0x05, 0x40, 0x32, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0xFE, 0x09, 0x00, 0x02, 0x00, 0x10, 0x58, 0x3A, 0x00, 0x09, 0x00, 0x02, 0x00, 0x11
	.byte 0x59, 0x3A, 0x00, 0x09, 0x00, 0x02, 0x00, 0x12, 0x5A, 0x3A, 0x00, 0x09, 0x00, 0x02, 0x00, 0x14
	.byte 0x52, 0x3A, 0x00, 0x09, 0x00, 0x02, 0x00, 0x15, 0x4C, 0x3A, 0x00, 0x09, 0x00, 0x02, 0x00, 0x17
	.byte 0x53, 0x57, 0x3A, 0x00, 0x00, 0x02, 0x00, 0x18, 0x45, 0x44, 0x3A, 0x00, 0xFF, 0xFF
	endlabel func_0602F684

	glabel func_0602F74C
	sts.l	pr,@-r15
	mov.l	.L0602F76C,r7
	mov.b	@(6,r7),r0
	extu.b	r0,r0
	mov.l	.L0602F770,r4
	mov.l	@r4,r4
	mov.l	@(0,r4),r0
	mov.l	.L0602F770,r4
	mov.l	@r4,r4
	mov.w	@(22,r4),r0
	mov.w	@(28,gbr),r0
	tst	#8,r0
	bf	.L0602F774
	bra	.L0602F7FE
	nop
	.byte 0x00, 0x00
.L0602F76C:
	.long play_state
.L0602F770:
	.long player_obj
.L0602F774:
	mov.b	@(35,gbr),r0
	tst	r0,r0
	bt	.L0602F77E
	bra	.L0602F7FE
	nop
.L0602F77E:
	mov.l	.L0602F808,r2
	mov.w	@r2,r4
	mov.l	.L0602F80C,r2
	mov.w	@r2,r4
	mov.b	@(111,gbr),r0
	mov.w	.L0602F804,r9
	mulu.w	r9,r0
	sts	macl,r0
	add	r0,r4
	mov.l	.L0602F810,r0
	jsr	@r0
	nop
	mov.l	r0,@-r15
	mov	#30,r4
	mov.l	.L0602F814,r0
	jsr	@r0
	mov	#6,r5
	mov	r0,r5
	mov.l	.L0602F818,r0
	jsr	@r0
	mov.l	@r15+,r4
	mov.w	@(72,gbr),r0
	mov	r0,r4
	mov.l	.L0602F810,r0
	jsr	@r0
	nop
	mov.l	r0,@-r15
	mov	#30,r4
	mov.l	.L0602F814,r0
	jsr	@r0
	mov	#9,r5
	mov	r0,r5
	mov.l	.L0602F818,r0
	jsr	@r0
	mov.l	@r15+,r4
	mov.l	.L0602F81C,r0
	mov.w	@r0,r0
	mov	r0,r4
	mov.l	.L0602F810,r0
	jsr	@r0
	nop
	mov.l	r0,@-r15
	mov	#30,r4
	mov.l	.L0602F814,r0
	jsr	@r0
	mov	#10,r5
	mov	r0,r5
	mov.l	.L0602F818,r0
	jsr	@r0
	mov.l	@r15+,r4
	mov.l	.L0602F820,r2
	mov.l	@r2,r4
	mov.l	.L0602F810,r0
	jsr	@r0
	nop
	mov.l	r0,@-r15
	mov	#30,r4
	mov.l	.L0602F814,r0
	jsr	@r0
	mov	#11,r5
	mov	r0,r5
	mov.l	.L0602F818,r0
	jsr	@r0
	mov.l	@r15+,r4
.L0602F7FE:
	lds.l	@r15+,pr
	rts
	nop
.L0602F804:
	.short 0x03E8
	.byte 0x00, 0x00
.L0602F808:
	.long VDP2_EXTEN
.L0602F80C:
	.long VDP2_REGS + 0xA
.L0602F810:
	.long math_bin_to_bcd
.L0602F814:
	.long txt_cell_addr
.L0602F818:
	.long txt_print_hex8
.L0602F81C:
	.long D_060FFC4A + 0x20000000
.L0602F820:
	.long obj_count
	.byte 0x00, 0x02, 0x00, 0x17, 0x40, 0x32, 0x23, 0x20, 0x40, 0x30, 0x4C, 0x49, 0x56, 0x45, 0x40, 0x31
	.byte 0x3A, 0x40, 0x32, 0x43, 0x4C, 0x41, 0x52, 0x49, 0x53, 0x20, 0x40, 0x32, 0x23, 0xFE, 0x00, 0x02
	.byte 0x00, 0x17, 0x40, 0x32, 0x23, 0x20, 0x40, 0x30, 0x4C, 0x49, 0x56, 0x45, 0x40, 0x31, 0x3A, 0x40
	.byte 0x31, 0x4E, 0x49, 0x47, 0x48, 0x54, 0x53, 0x20, 0x40, 0x32, 0x23, 0xFE
	endlabel func_0602F74C

	glabel func_0602F860
	mov.w	@(28,gbr),r0
	mov.w	.L0602F86C,r8
	tst	r8,r0
	bf	.L0602F86E
	rts
	nop
.L0602F86C:
	.short 0x0400
.L0602F86E:
	sts.l	pr,@-r15
	mov	#0,r7
	mov.l	.L0602F890,r8
	mov	#0,r9
	mov.l	.L0602F894,r10
.L0602F878:
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L0602F89C
	mov.b	@(21,gbr),r0
	cmp/pz	r0
	bt	.L0602F89C
	mov.l	.L0602F898,r0
	mov.b	@r0,r0
	cmp/eq	r0,r7
	bf	.L0602F89C
	bra	.L0602F89E
	mov.l	@(656,gbr),r0
.L0602F890:
	.long mare_score
.L0602F894:
	.long D_0602FAF4
.L0602F898:
	.long D_060FFE53
.L0602F89C:
	mov.l	@r8,r0
.L0602F89E:
	add	#4,r8
	add	r0,r9
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov.l	r7,@-r15
	mov.l	.L0602F904,r14
	jsr	@r14
	mov	r0,r4
	mov	r10,r5
	add	#10,r5
	mov	#6,r14
	mov.l	.L0602F908,r10
	jsr	@r10
	mov	r0,r4
	mov.l	@r15+,r7
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	add	#20,r10
	add	#1,r7
	mov	#4,r0
	cmp/ge	r0,r7
	bf	.L0602F878
	add	#20,r10
	mov.l	.L0602F904,r14
	jsr	@r14
	mov	r9,r4
	mov	r10,r5
	add	#10,r5
	mov	#6,r14
	mov.l	.L0602F908,r10
	jsr	@r10
	mov	r0,r4
	mov	#0,r7
	mov.l	.L0602F90C,r8
	mov	#0,r9
	mov.l	.L0602F910,r10
.L0602F8EA:
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L0602F918
	mov.b	@(21,gbr),r0
	cmp/pz	r0
	bt	.L0602F918
	mov.l	.L0602F914,r0
	mov.b	@r0,r0
	cmp/eq	r0,r7
	bf	.L0602F918
	bra	.L0602F91A
	mov.l	@(712,gbr),r0
	.byte 0x00, 0x00
.L0602F904:
	.long math_bin_to_bcd
.L0602F908:
	.long txt_bcd_to_ascii
.L0602F90C:
	.long mare_time
.L0602F910:
	.long D_0602FB84
.L0602F914:
	.long D_060FFE53
.L0602F918:
	mov.l	@r8,r0
.L0602F91A:
	add	#4,r8
	mov	#60,r13
	mov	#-128,r14
	shll	r14
	mov.l	r13,@(0,r14)
	mov.l	r0,@(4,r14)
	mov.l	@(28,r14),r0
	add	r0,r9
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	mov.l	r7,@-r15
	mov.l	.L0602F998,r14
	jsr	@r14
	mov	r0,r4
	mov	r10,r5
	add	#11,r5
	mov	#4,r14
	mov.l	.L0602F99C,r10
	jsr	@r10
	mov	r0,r4
	mov.l	@r15+,r7
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	add	#20,r10
	add	#1,r7
	mov	#4,r0
	cmp/ge	r0,r7
	bf	.L0602F8EA
	add	#20,r10
	mov.l	.L0602F998,r14
	jsr	@r14
	mov	r9,r4
	mov	r10,r5
	add	#11,r5
	mov	#4,r14
	mov.l	.L0602F99C,r10
	jsr	@r10
	mov	r0,r4
	mov.w	.L0602F994,r4
	mov.w	.L0602F996,r5
	mov.l	.L0602F9A0,r2
	mov.b	@(22,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	.L0602F9A4,r0
	jsr	@r0
	nop
	mov.l	.L0602F9A8,r2
	mov.l	.L0602F9AC,r0
	jsr	@r0
	nop
	mov.l	.L0602F9B0,r2
	mov.l	.L0602F9AC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0602F994:
	.short 0x000C
.L0602F996:
	.short 0x0006
.L0602F998:
	.long math_bin_to_bcd
.L0602F99C:
	.long txt_bcd_to_ascii
.L0602F9A0:
	.long D_0602FA00
.L0602F9A4:
	.long func_0601C9C2
.L0602F9A8:
	.long D_0602FADC
.L0602F9AC:
	.long txt_print_big_at
.L0602F9B0:
	.long D_0602FB6C
	endlabel func_0602F860

	glabel func_0602F9B4
	mov.w	@(28,gbr),r0
	mov.w	.L0602F9C0,r8
	tst	r8,r0
	bf	.L0602F9C2
	rts
	nop
.L0602F9C0:
	.short 0x0400
.L0602F9C2:
	sts.l	pr,@-r15
	mov.w	.L0602F9E6,r4
	mov.w	.L0602F9E8,r5
	mov.l	.L0602F9EC,r2
	mov.l	.L0602F9F0,r0
	jsr	@r0
	nop
	mov.l	.L0602F9F4,r2
	mov.l	.L0602F9F8,r0
	jsr	@r0
	nop
	mov.l	.L0602F9FC,r2
	mov.l	.L0602F9F8,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0602F9E6:
	.short 0x000C
.L0602F9E8:
	.short 0x0006
	.byte 0x00, 0x00
.L0602F9EC:
	.long D_0602FAC4
.L0602F9F0:
	.long func_0601C9C2
.L0602F9F4:
	.long D_0602FBFC
.L0602F9F8:
	.long txt_print_big_at
.L0602F9FC:
	.long D_0602FC8C
	dlabel D_0602FA00
	.long D_0602FA1C
	.long D_0602FA34
	.long D_0602FA4C
	.long D_0602FA64
	.long D_0602FA7C
	.long D_0602FA94
	.long D_0602FAAC
	dlabel D_0602FA1C
	.byte 0x40, 0x31, 0x20, 0x2A, 0x2A, 0x20, 0x53, 0x50, 0x52, 0x49, 0x4E, 0x47, 0x20, 0x56, 0x41, 0x4C
	.byte 0x4C, 0x45, 0x59, 0x20, 0x2A, 0x2A, 0xFE, 0x09
	dlabel D_0602FA34
	.byte 0x40, 0x31, 0x20, 0x20, 0x2A, 0x2A, 0x20, 0x46, 0x52, 0x4F, 0x5A, 0x45, 0x4E, 0x20, 0x42, 0x45
	.byte 0x4C, 0x4C, 0x20, 0x2A, 0x2A, 0x20, 0xFE, 0x09
	dlabel D_0602FA4C
	.byte 0x40, 0x31, 0x20, 0x2A, 0x2A, 0x20, 0x4D, 0x59, 0x53, 0x54, 0x49, 0x43, 0x20, 0x46, 0x4F, 0x52
	.byte 0x45, 0x53, 0x54, 0x20, 0x2A, 0x2A, 0xFE, 0x09
	dlabel D_0602FA64
	.byte 0x40, 0x31, 0x20, 0x2A, 0x2A, 0x20, 0x53, 0x50, 0x4C, 0x41, 0x53, 0x48, 0x20, 0x47, 0x41, 0x52
	.byte 0x44, 0x45, 0x4E, 0x20, 0x2A, 0x2A, 0xFE, 0x09
	dlabel D_0602FA7C
	.byte 0x40, 0x31, 0x20, 0x20, 0x2A, 0x2A, 0x20, 0x53, 0x4F, 0x46, 0x54, 0x20, 0x4D, 0x55, 0x53, 0x45
	.byte 0x55, 0x4D, 0x20, 0x2A, 0x2A, 0x20, 0xFE, 0x09
	dlabel D_0602FA94
	.byte 0x40, 0x31, 0x20, 0x2A, 0x2A, 0x20, 0x53, 0x54, 0x49, 0x43, 0x4B, 0x20, 0x43, 0x41, 0x4E, 0x59
	.byte 0x4F, 0x4E, 0x20, 0x2A, 0x2A, 0x20, 0xFE, 0x09
	dlabel D_0602FAAC
	.byte 0x40, 0x31, 0x20, 0x20, 0x2A, 0x2A, 0x20, 0x2D, 0x2D, 0x2D, 0x2D, 0x2D, 0x2D, 0x2D, 0x2D, 0x2D
	.byte 0x2D, 0x2D, 0x20, 0x2A, 0x2A, 0x20, 0xFE, 0x09
	dlabel D_0602FAC4
	.byte 0x40, 0x31, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFE, 0x09
	dlabel D_0602FADC
	.byte 0x00, 0x04, 0x00, 0x08, 0x40, 0x31, 0x2D, 0x2D, 0x20, 0x53, 0x43, 0x4F, 0x52, 0x45, 0x20, 0x54
	.byte 0x41, 0x42, 0x4C, 0x45, 0x20, 0x2D, 0x2D, 0xFF
	dlabel D_0602FAF4
	.byte 0x40, 0x31, 0x43, 0x4F, 0x55, 0x52, 0x53, 0x45, 0x31, 0x3A, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58
	.byte 0x50, 0x54, 0x53, 0xFF, 0x40, 0x31, 0x43, 0x4F, 0x55, 0x52, 0x53, 0x45, 0x32, 0x3A, 0x58, 0x58
	.byte 0x58, 0x58, 0x58, 0x58, 0x50, 0x54, 0x53, 0xFF, 0x40, 0x31, 0x43, 0x4F, 0x55, 0x52, 0x53, 0x45
	.byte 0x33, 0x3A, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x50, 0x54, 0x53, 0xFF, 0x40, 0x31, 0x43, 0x4F
	.byte 0x55, 0x52, 0x53, 0x45, 0x34, 0x3A, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x50, 0x54, 0x53, 0xFF
	.byte 0x40, 0x31, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x2D, 0x2D, 0x2D, 0x2D, 0x2D, 0x2D
	.byte 0x2D, 0x2D, 0x2D, 0xFF, 0x40, 0x31, 0x20, 0x20, 0x54, 0x4F, 0x54, 0x41, 0x4C, 0x3A, 0x58, 0x58
	.byte 0x58, 0x58, 0x58, 0x58, 0x50, 0x54, 0x53, 0xFE
	dlabel D_0602FB6C
	.byte 0x00, 0x19, 0x00, 0x08, 0x40, 0x31, 0x2D, 0x2D, 0x20, 0x54, 0x49, 0x4D, 0x45, 0x20, 0x54, 0x41
	.byte 0x42, 0x4C, 0x45, 0x20, 0x2D, 0x2D, 0x20, 0xFF
	dlabel D_0602FB84
	.byte 0x40, 0x31, 0x43, 0x4F, 0x55, 0x52, 0x53, 0x45, 0x31, 0x3A, 0x20, 0x58, 0x58, 0x58, 0x58, 0x53
	.byte 0x45, 0x43, 0x20, 0xFF, 0x40, 0x31, 0x43, 0x4F, 0x55, 0x52, 0x53, 0x45, 0x32, 0x3A, 0x20, 0x58
	.byte 0x58, 0x58, 0x58, 0x53, 0x45, 0x43, 0x20, 0xFF, 0x40, 0x31, 0x43, 0x4F, 0x55, 0x52, 0x53, 0x45
	.byte 0x33, 0x3A, 0x20, 0x58, 0x58, 0x58, 0x58, 0x53, 0x45, 0x43, 0x20, 0xFF, 0x40, 0x31, 0x43, 0x4F
	.byte 0x55, 0x52, 0x53, 0x45, 0x34, 0x3A, 0x20, 0x58, 0x58, 0x58, 0x58, 0x53, 0x45, 0x43, 0x20, 0xFF
	.byte 0x40, 0x31, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x2D, 0x2D, 0x2D, 0x2D, 0x2D, 0x2D
	.byte 0x2D, 0x2D, 0x20, 0xFF, 0x40, 0x31, 0x20, 0x20, 0x54, 0x4F, 0x54, 0x41, 0x4C, 0x3A, 0x20, 0x58
	.byte 0x58, 0x58, 0x58, 0x53, 0x45, 0x43, 0x20, 0xFE
	dlabel D_0602FBFC
	.byte 0x00, 0x04, 0x00, 0x08, 0x40, 0x31, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFF, 0x40, 0x31, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFF, 0x40, 0x31, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFF
	.byte 0x40, 0x31, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0xFF, 0x40, 0x31, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFF, 0x40, 0x31, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFF, 0x40, 0x31, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFE
	dlabel D_0602FC8C
	.byte 0x00, 0x19, 0x00, 0x08, 0x40, 0x31, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFF, 0x40, 0x31, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFF, 0x40, 0x31, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFF
	.byte 0x40, 0x31, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0xFF, 0x40, 0x31, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFF, 0x40, 0x31, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFF, 0x40, 0x31, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0xFE
	endlabel func_0602F9B4

	glabel func_0602FD1C
	mov.l	.L0602FD68,r2
	mov.l	@(88,gbr),r0
	mov	r2,r3
	add	#16,r3
	mov	r3,r4
	mov.l	r0,@(80,gbr)
	mov.l	@(84,gbr),r0
	add	#16,r4
	mov.l	r0,@(76,gbr)
	mov.l	r0,@(16,r4)
	mov.l	@r2,r5
	mov.l	@(4,r2),r6
	mov.l	@(12,r2),r7
	mov.l	@(4,r3),r8
	mov.l	r5,@r3
	mov.l	r6,@(4,r3)
	mov.l	r7,@(12,r3)
	mov.l	r8,@(8,r3)
	mov.l	@r3,r5
	mov.l	@(4,r3),r6
	mov.l	@(8,r3),r7
	mov.l	@(12,r3),r8
	mov.l	r5,@r4
	mov.l	r6,@(4,r4)
	mov.l	r7,@(8,r4)
	mov.l	r8,@(12,r4)
	mov.l	.L0602FD6C,r2
	mov	r2,r3
	add	#16,r3
	mov.l	@r2,r5
	mov.l	@(4,r2),r6
	mov.l	@(12,r2),r7
	mov.l	@(4,r3),r8
	mov.l	r5,@r3
	mov.l	r6,@(4,r3)
	mov.l	r7,@(12,r3)
	rts
	mov.l	r8,@(8,r3)
.L0602FD68:
	.long D_060D9040
.L0602FD6C:
	.long D_060D9020
	endlabel func_0602FD1C

	glabel func_0602FD70
	mov.l	.L0602FD94,r3
	mov.l	.L0602FD98,r4
	mov.l	.L0602FD9C,r5
	mov.w	@r4,r0
	mov.l	@r5,r6
	tst	r0,r0
	bt	.L0602FD88
	cmp/pz	r0
	bf	.L0602FDEC
	shlr	r0
	bt	.L0602FDEC
	bf	.L0602FDA0
.L0602FD88:
	mov.b	@(20,gbr),r0
	shlr	r0
	bf	.L0602FDA0
	bra	.L0602FF16
	nop
	.byte 0x00, 0x00
.L0602FD94:
	.long D_060D9050
.L0602FD98:
	.long D_060D9074
.L0602FD9C:
	.long D_060D9078
.L0602FDA0:
	mov.w	@(76,gbr),r0
	add	#7,r6
	mov.b	r0,@(2,r6)
	shlr8	r0
	mov.b	r0,@(1,r6)
	mov.b	@(2,r3),r0
	mov.b	r0,@r6
	cmp/eq	#7,r0
	bt	.L0602FDDA
	cmp/eq	#5,r0
	bt	.L0602FDCC
	cmp/eq	#4,r0
	bf	.L0602FE76
	mov.w	@(4,r3),r0
	mov.b	r0,@(4,r6)
	shlr8	r0
	mov.b	r0,@(3,r6)
	mov.w	@(6,r3),r0
	mov.b	r0,@(6,r6)
	shlr8	r0
	bra	.L0602FE76
	mov.b	r0,@(5,r6)
.L0602FDCC:
	mov.b	@(12,r3),r0
	mov.b	r0,@(3,r6)
	mov.b	@(13,r3),r0
	mov.b	r0,@(4,r6)
	mov.b	@(14,r3),r0
	bra	.L0602FE76
	mov.b	r0,@(5,r6)
.L0602FDDA:
	mov.b	@(12,r3),r0
	mov.b	r0,@(3,r6)
	mov.b	@(13,r3),r0
	mov.b	r0,@(4,r6)
	mov.b	@(14,r3),r0
	mov.b	r0,@(5,r6)
	mov.b	@(15,r3),r0
	bra	.L0602FE76
	mov.b	r0,@(6,r6)
.L0602FDEC:
	mov.b	@(1,r6),r0
	extu.b	r0,r0
	swap.b	r0,r7
	mov.b	@(2,r6),r0
	and	#127,r0
	or	r0,r7
	not	r7,r7
	mov.b	@(8,r6),r0
	extu.b	r0,r0
	swap.b	r0,r8
	mov.b	@(9,r6),r0
	and	#127,r0
	or	r8,r0
	mov.w	r0,@(76,gbr)
	and	r7,r0
	mov.w	r0,@(78,gbr)
	mov.b	@(7,r6),r0
	mov.b	r0,@(2,r3)
	cmp/eq	#7,r0
	bt	.L0602FE64
	cmp/eq	#5,r0
	bt	.L0602FE56
	cmp/eq	#4,r0
	bf	.L0602FE74
	mov.b	@(10,r6),r0
	extu.b	r0,r0
	swap.b	r0,r7
	mov.b	@(11,r6),r0
	extu.b	r0,r0
	or	r7,r0
	mov.w	r0,@(4,r3)
	mov.b	@(12,r6),r0
	extu.b	r0,r0
	swap.b	r0,r7
	mov.b	@(13,r6),r0
	extu.b	r0,r0
	or	r7,r0
	mov.w	r0,@(6,r3)
	mov.b	@(3,r6),r0
	extu.b	r0,r0
	swap.b	r0,r7
	mov.b	@(4,r6),r0
	extu.b	r0,r0
	or	r7,r0
	mov.w	r0,@(8,r3)
	mov.b	@(5,r6),r0
	extu.b	r0,r0
	swap.b	r0,r7
	mov.b	@(6,r6),r0
	extu.b	r0,r0
	or	r7,r0
	bra	.L0602FE74
	mov.w	r0,@(10,r3)
.L0602FE56:
	mov.b	@(10,r6),r0
	mov.b	r0,@(12,r3)
	mov.b	@(11,r6),r0
	mov.b	r0,@(13,r3)
	mov.b	@(12,r6),r0
	bra	.L0602FE74
	mov.b	r0,@(14,r3)
.L0602FE64:
	mov.b	@(10,r6),r0
	mov.b	r0,@(12,r3)
	mov.b	@(11,r6),r0
	mov.b	r0,@(13,r3)
	mov.b	@(12,r6),r0
	mov.b	r0,@(14,r3)
	mov.b	@(13,r6),r0
	mov.b	r0,@(15,r3)
.L0602FE74:
	add	#7,r6
.L0602FE76:
	mov.l	.L0602FEB8,r7
	cmp/ge	r7,r6
	bt	.L0602FE7E
	mov.l	r6,@r5
.L0602FE7E:
	mov.w	@r4,r9
	tst	r9,r9
	bt	.L0602FF16
	mov.b	@(85,gbr),r0
	tst	#128,r0
	bt	.L0602FEC4
	mov	#2,r8
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bt	.L0602FE9A
	mov.l	.L0602FEBC,r2
	mov	#2,r0
	mov.b	r0,@r2
	mov	#18,r8
.L0602FE9A:
	mov.b	@(85,gbr),r0
	cmp/pz	r9
	bt	.L0602FEA6
	tst	#64,r0
	bt	.L0602FEA6
	mov	#13,r8
.L0602FEA6:
	mov.b	@(10,r4),r0
	tst	r0,r0
	bf	.L0602FEC4
	mov	r8,r0
	mov.b	r0,@(10,r4)
	mov.l	.L0602FEC0,r7
	mov	#33,r0
	bra	.L0602FF00
	mov.w	r0,@(2,r4)
.L0602FEB8:
	.long D_0607BFF2
.L0602FEBC:
	.long D_0604DBB8
.L0602FEC0:
	.long func_06032FF4
.L0602FEC4:
	mov.w	@(2,r4),r0
	dt	r0
	bf	.L0602FEDC
	mov	#0,r0
	mov.w	r0,@r4
	mov.b	r0,@(107,gbr)
	mov.b	@(10,r4),r0
	mov.l	.L0602FED8,r1
	bra	.L0602FF16
	mov.b	r0,@r1
.L0602FED8:
	.long next_game_mode
.L0602FEDC:
	mov.w	.L0602FF1A,r7
	mov.w	r0,@(2,r4)
	cmp/eq	r7,r0
	bf	.L0602FF16
	mov.b	@(10,r4),r0
	tst	r0,r0
	bf	.L0602FF16
	mov	#11,r8
	mov.b	@(107,gbr),r0
	cmp/pz	r0
	bt	.L0602FEFA
	mov.l	.L0602FF1C,r2
	mov	#11,r0
	mov.b	r0,@r2
	mov	#18,r8
.L0602FEFA:
	mov	r8,r0
	mov.b	r0,@(10,r4)
	mov.l	.L0602FF20,r7
.L0602FF00:
	mov.b	@(10,r4),r0
	cmp/eq	#18,r0
	bf	.L0602FF08
	mov.l	.L0602FF24,r7
.L0602FF08:
	sts.l	pr,@-r15
	mov.l	.L0602FF28,r0
	mov.l	.L0602FF2C,r2
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	r7,@(12,r3)
.L0602FF16:
	rts
	nop
.L0602FF1A:
	.short 0x0081
.L0602FF1C:
	.long D_0604DBB8
.L0602FF20:
	.long func_06032FB4
.L0602FF24:
	.long func_06033094
.L0602FF28:
	.long obj_alloc
.L0602FF2C:
	.long obj_list_effect
	endlabel func_0602FD70

	.section .data.0602FF30,"aw",@progbits
	.p2align 2
	dlabel D_0602FF30
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_0602FF34
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_0602FF38
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_0602FF3C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_0602FF48
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_0602FF4C
	.byte 0x00, 0x00, 0x00, 0x00
