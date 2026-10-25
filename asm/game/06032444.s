	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06032444,"ax",@progbits
	.p2align 2

	glabel func_06032444
	mov.l	r1,@-r15
	sts.l	pr,@-r15
	mov.l	.L06032468,r0
	jsr	@r0
	mov	#15,r4
	mov	#1,r0
	mov.b	r0,@(61,gbr)
	mov.l	.L0603246C,r2
	mov.l	.L06032470,r0
	jsr	@r0
	nop
	mov.l	.L06032474,r0
	mov.l	r0,@(12,r3)
	lds.l	@r15+,pr
	mov.l	@r15+,r1
	rts
	nop
	.byte 0x00, 0x00
.L06032468:
	.long cd_play_track
.L0603246C:
	.long obj_list_load_scene
.L06032470:
	.long obj_alloc
.L06032474:
	.long func_06032CCA
	endlabel func_06032444

	glabel func_06032478
	mov.l	.L06032488,r0
	mov.l	@r0,r4
	mov	#2,r13
	mov.b	r13,@r4
	mov	#11,r0
	mov.b	r0,@(1,r4)
	rts
	nop
.L06032488:
	.long D_060F30A8
	endlabel func_06032478

	glabel func_0603248C
	mov.l	.L0603249C,r0
	mov.l	@r0,r4
	mov	#4,r13
	mov.b	r13,@r4
	mov	#11,r0
	mov.b	r0,@(1,r4)
	rts
	nop
.L0603249C:
	.long D_060F30A8
	endlabel func_0603248C

	glabel func_060324A0
	mov.l	.L060324B0,r0
	mov.l	@r0,r4
	mov	#8,r13
	mov.b	r13,@r4
	mov	#11,r0
	mov.b	r0,@(1,r4)
	rts
	nop
.L060324B0:
	.long D_060F30A8
	endlabel func_060324A0

	glabel func_060324B4
	mov.l	.L060324C4,r0
	mov.l	@r0,r4
	mov	#16,r13
	mov.b	r13,@r4
	mov	#11,r0
	mov.b	r0,@(1,r4)
	rts
	nop
.L060324C4:
	.long D_060F30A8
	endlabel func_060324B4

	glabel func_060324C8
	mov.l	.L060324D8,r0
	mov.l	@r0,r4
	mov	#1,r13
	mov.b	r13,@r4
	mov	#11,r0
	mov.b	r0,@(1,r4)
	rts
	nop
.L060324D8:
	.long D_060F30A8
	endlabel func_060324C8

	glabel func_060324DC
	mov.b	@(20,gbr),r0
	mov	#13,r8
	cmp/ge	r8,r0
	bt	.L060324EE
	mov.l	.L060324F4,r4
	mov.l	@r4,r4
	mov.l	@(8,r4),r12
	mov	#10,r0
	mov.w	r0,@(22,r12)
.L060324EE:
	rts
	nop
	.byte 0x00, 0x00
.L060324F4:
	.long player_obj
	endlabel func_060324DC

	glabel func_060324F8
	sts.l	pr,@-r15
	mov.l	.L06032550,r2
	mov.l	.L06032554,r0
	jsr	@r0
	nop
	mov.b	@(0,gbr),r0
	cmp/eq	#13,r0
	bt	.L06032510
	mov.b	@(107,gbr),r0
	mov.l	.L06032558,r2
	cmp/pl	r0
	bf	.L06032512
.L06032510:
	mov.l	.L0603255C,r2
.L06032512:
	mov.l	r2,@(12,r3)
	cmp/pz	r0
	bf	.L0603252E
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov.l	.L06032560,r0
	jsr	@r0
	mov	#2,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	bsr	func_060325AC
	nop
.L0603252E:
	mov.l	.L06032564,r4
	mov.l	@r4,r4
	mov.l	.L06032568,r3
	mov.l	@r3,r3
	mov.l	.L0603256C,r2
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bf	.L06032570
	shlr	r0
	shll2	r0
	add	r0,r2
	mov.w	@r2+,r0
	mov.w	r0,@(24,r4)
	mov.w	@r2+,r0
	bra	.L06032574
	mov.w	r0,@(20,r3)
	.byte 0x00, 0x00
.L06032550:
	.long obj_list_core
.L06032554:
	.long obj_alloc
.L06032558:
	.long func_06033034
.L0603255C:
	.long func_06032F74
.L06032560:
	.long snd_seq_stop
.L06032564:
	.long player_obj
.L06032568:
	.long cam_obj
.L0603256C:
	.long D_0603258C
.L06032570:
	mov	#0,r0
	mov.w	r0,@(24,r4)
.L06032574:
	mov.l	.L06032588,r2
	mov.b	@(20,gbr),r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.l	r2,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L06032588:
	.long func_06032834
	dlabel D_0603258C
	.byte 0x80, 0x00, 0xC0, 0x00, 0x80, 0x00, 0xC0, 0x00, 0x80, 0x00, 0xC0, 0x00, 0x80, 0x00, 0xC0, 0x00
	.byte 0x40, 0x00, 0x80, 0x00, 0x40, 0x00, 0x80, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	endlabel func_060324F8

	glabel func_060325AC
	sts.l	pr,@-r15
	mov.l	.L060325C0,r2
	mov.b	@(20,gbr),r0
	shll2	r0
	mov.l	@(r0,r2),r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L060325C0:
	.long func_060325C4
	endlabel func_060325AC

	glabel func_060325C4
	bsrf	r6
	tst	r0,r6
	bsrf	r6
	mov.b	r0,@-r6
	bsrf	r6
	cmp/str	r3,r6
	bsrf	r6
	mov.b	r0,@-r6
	bsrf	r6
	mov.b	r7,@r6
	bsrf	r6
	mov.b	r0,@-r6
	bsrf	r6
	mov.b	r10,@r6
	bsrf	r6
	mov.b	r0,@-r6
	bsrf	r6
	mov.b	r13,@-r6
	bsrf	r6
	mov.b	r0,@-r6
	bsrf	r6
	tst	r0,r7
	bsrf	r6
	mov.b	r0,@-r6
	bsrf	r6
	cmp/str	r3,r7
	bsrf	r6
	mov.b	r0,@-r6
	bsrf	r6
	cmp/str	r3,r7
	bsrf	r6
	mov.b	r0,@-r6
	rts
	nop
	endlabel func_060325C4

	glabel func_06032608
	mov.l	.L06032634,r2
	mov.w	.L0603262A,r0
	mov.w	r0,@r2
	mov.w	.L0603262C,r0
	mov.w	r0,@(2,r2)
	mov.w	.L0603262E,r0
	mov.w	r0,@(4,r2)
	mov.w	.L06032630,r0
	mov.w	r0,@(6,r2)
	mov.w	.L06032632,r0
	mov.w	r0,@(8,r2)
	mov	#0,r4
	mov	#0,r5
	mov	#0,r6
	mov.l	.L06032638,r0
	jmp	@r0
	nop
.L0603262A:
	.short 0x0001
.L0603262C:
	.short 0x0203
.L0603262E:
	.short 0x0405
.L06032630:
	.short 0x0680
.L06032632:
	.short 0x00FF
.L06032634:
	.long SCSP_RAM + 0x7C0
.L06032638:
	.long snd_seq_start
	endlabel func_06032608

	glabel func_0603263C
	mov.l	.L06032668,r2
	mov.w	.L0603265E,r0
	mov.w	r0,@r2
	mov.w	.L06032660,r0
	mov.w	r0,@(2,r2)
	mov.w	.L06032662,r0
	mov.w	r0,@(4,r2)
	mov.w	.L06032664,r0
	mov.w	r0,@(6,r2)
	mov.w	.L06032666,r0
	mov.w	r0,@(8,r2)
	mov	#0,r4
	mov	#0,r5
	mov	#0,r6
	mov.l	.L0603266C,r0
	jmp	@r0
	nop
.L0603265E:
	.short 0x0001
.L06032660:
	.short 0x0203
.L06032662:
	.short 0x0405
.L06032664:
	.short 0x8000
.L06032666:
	.short 0xFF00
.L06032668:
	.long SCSP_RAM + 0x7C0
.L0603266C:
	.long snd_seq_start
	endlabel func_0603263C

	glabel func_06032670
	mov.l	.L06032698,r2
	mov.w	.L0603268E,r0
	mov.w	r0,@r2
	mov.w	.L06032690,r0
	mov.w	r0,@(2,r2)
	mov.w	.L06032692,r0
	mov.w	r0,@(4,r2)
	mov.w	.L06032694,r0
	mov.w	r0,@(6,r2)
	mov	#0,r4
	mov	#0,r5
	mov	#0,r6
	mov.l	.L0603269C,r0
	jmp	@r0
	nop
.L0603268E:
	.short 0x0001
.L06032690:
	.short 0x0203
.L06032692:
	.short 0x0480
.L06032694:
	.short 0x00FF
	.byte 0x00, 0x00
.L06032698:
	.long SCSP_RAM + 0x7C0
.L0603269C:
	.long snd_seq_start
	endlabel func_06032670

	glabel func_060326A0
	mov.l	.L060326CC,r2
	mov.w	.L060326C2,r0
	mov.w	r0,@r2
	mov.w	.L060326C4,r0
	mov.w	r0,@(2,r2)
	mov.w	.L060326C6,r0
	mov.w	r0,@(4,r2)
	mov.w	.L060326C8,r0
	mov.w	r0,@(6,r2)
	mov.w	.L060326CA,r0
	mov.w	r0,@(8,r2)
	mov	#0,r4
	mov	#0,r5
	mov	#0,r6
	mov.l	.L060326D0,r0
	jmp	@r0
	nop
.L060326C2:
	.short 0x0001
.L060326C4:
	.short 0x0203
.L060326C6:
	.short 0x0405
.L060326C8:
	.short 0x8001
.L060326CA:
	.short 0xFFFF
.L060326CC:
	.long SCSP_RAM + 0x7C0
.L060326D0:
	.long snd_seq_start
	endlabel func_060326A0

	glabel func_060326D4
	mov.l	.L06032700,r2
	mov.w	.L060326F6,r0
	mov.w	r0,@r2
	mov.w	.L060326F8,r0
	mov.w	r0,@(2,r2)
	mov.w	.L060326FA,r0
	mov.w	r0,@(4,r2)
	mov.w	.L060326FC,r0
	mov.w	r0,@(6,r2)
	mov.w	.L060326FE,r0
	mov.w	r0,@(8,r2)
	mov	#0,r4
	mov	#0,r5
	mov	#0,r6
	mov.l	.L06032704,r0
	jmp	@r0
	nop
.L060326F6:
	.short 0x0001
.L060326F8:
	.short 0x0203
.L060326FA:
	.short 0x0405
.L060326FC:
	.short 0x8000
.L060326FE:
	.short 0xFFFF
.L06032700:
	.long SCSP_RAM + 0x7C0
.L06032704:
	.long snd_seq_start
	endlabel func_060326D4

	glabel func_06032708
	mov.l	.L06032734,r2
	mov.w	.L0603272A,r0
	mov.w	r0,@r2
	mov.w	.L0603272C,r0
	mov.w	r0,@(2,r2)
	mov.w	.L0603272E,r0
	mov.w	r0,@(4,r2)
	mov.w	.L06032730,r0
	mov.w	r0,@(6,r2)
	mov.w	.L06032732,r0
	mov.w	r0,@(8,r2)
	mov	#0,r4
	mov	#0,r5
	mov	#0,r6
	mov.l	.L06032738,r0
	jmp	@r0
	nop
.L0603272A:
	.short 0x0001
.L0603272C:
	.short 0x0203
.L0603272E:
	.short 0x0405
.L06032730:
	.short 0x8000
.L06032732:
	.short 0xFFFF
.L06032734:
	.long SCSP_RAM + 0x7C0
.L06032738:
	.long snd_seq_start
	endlabel func_06032708

	glabel func_0603273C
	mov.l	.L06032758,r2
	mov.w	.L06032752,r0
	mov.w	r0,@r2
	mov.w	.L06032754,r0
	mov.w	r0,@(2,r2)
	mov	#0,r4
	mov	#0,r5
	mov	#0,r6
	mov.l	.L0603275C,r0
	jmp	@r0
	nop
.L06032752:
	.short 0x0080
.L06032754:
	.short 0x00FF
	.byte 0x00, 0x00
.L06032758:
	.long SCSP_RAM + 0x7C0
.L0603275C:
	.long snd_seq_start
	endlabel func_0603273C

	glabel func_06032760
	sts.l	pr,@-r15
	mov.l	.L06032794,r2
	mov.w	.L0603278C,r0
	mov.w	r0,@r2
	mov.w	.L0603278E,r0
	mov.w	r0,@(2,r2)
	mov.w	.L06032790,r0
	mov.w	r0,@(4,r2)
	mov	#0,r4
	mov	#0,r5
	mov	#0,r6
	mov.l	.L06032798,r0
	jsr	@r0
	nop
	mov	#0,r4
	mov	#127,r5
	mov.l	.L0603279C,r0
	jsr	@r0
	mov	#0,r6
	lds.l	@r15+,pr
	rts
	nop
.L0603278C:
	.short 0x0102
.L0603278E:
	.short 0x8001
.L06032790:
	.short 0xFFFF
	.byte 0x00, 0x00
.L06032794:
	.long SCSP_RAM + 0x7C0
.L06032798:
	.long snd_seq_start
.L0603279C:
	.long snd_seq_volume
	endlabel func_06032760

	glabel func_060327A0
	sts.l	pr,@-r15
	mov.l	.L060327F4,r0
	mov.l	@r0,r0
	mov.l	.L060327F8,r3
	add	r0,r3
	mov	#80,r6
	mov.l	.L060327FC,r0
	mov.b	@r0,r0
	mulu.w	r0,r6
	sts	macl,r6
	add	#64,r6
	add	r3,r6
	mov.b	@(0,r6),r0
	add	#-3,r0
	mov	r0,r9
	mov.b	@(2,r6),r0
	add	#-3,r0
	and	r0,r9
	mov.b	@(4,r6),r0
	add	#-3,r0
	and	r0,r9
	cmp/pz	r9
	bf	.L06032804
	mov.b	@(3,r6),r0
	add	#-3,r0
	mov	r0,r9
	mov.b	@(1,r6),r0
	add	#-3,r0
	and	r0,r9
	mov.b	@(5,r6),r0
	add	#-3,r0
	and	r0,r9
	cmp/pz	r9
	bf	.L06032804
	mov.l	.L06032800,r2
	mov.w	.L060327F0,r0
	mov.w	r0,@r2
	mov.w	.L060327F2,r0
	bra	.L06032812
	mov.w	r0,@(2,r2)
.L060327F0:
	.short 0x0080
.L060327F2:
	.short 0x00FF
.L060327F4:
	.long D_060CB014
.L060327F8:
	.long 0x00000528
.L060327FC:
	.long D_060CB003
.L06032800:
	.long SCSP_RAM + 0x7C0
.L06032804:
	mov.l	.L0603282C,r2
	mov.w	.L06032824,r0
	mov.w	r0,@r2
	mov.w	.L06032826,r0
	mov.w	r0,@(2,r2)
	mov.w	.L06032828,r0
	mov.w	r0,@(4,r2)
.L06032812:
	mov	#0,r4
	mov	#0,r5
	mov	#0,r6
	mov.l	.L06032830,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06032824:
	.short 0x0001
.L06032826:
	.short 0x0280
.L06032828:
	.short 0x02FF
	.byte 0x00, 0x00
.L0603282C:
	.long SCSP_RAM + 0x7C0
.L06032830:
	.long snd_seq_start
	endlabel func_060327A0

	glabel func_06032834
	bsrf	r6
	mov.b	r7,@-r8
	bsrf	r6
	tst	r1,r12
	bsrf	r6
	mov.b	r7,@-r8
	bsrf	r6
	tst	r1,r12
	bsrf	r6
	mov.b	r7,@-r8
	bsrf	r6
	tst	r1,r12
	bsrf	r6
	mov.b	r7,@-r8
	bsrf	r6
	tst	r1,r12
	bsrf	r6
	mov.b	r7,@-r8
	bsrf	r6
	tst	r1,r12
	bsrf	r6
	mov.b	r7,@-r8
	bsrf	r6
	tst	r1,r12
	bsrf	r6
	cmp/str	r14,r10
	bsrf	r6
	tst	r1,r12
	bsrf	r6
	cmp/str	r14,r10
	bsrf	r6
	tst	r1,r12
	sts.l	pr,@-r15
	mov.l	.L0603290C,r4
	mov.l	@r4,r4
	mov.w	.L060328FE,r0
	mov.w	r0,@(12,r4)
	mov.w	@(20,r4),r0
	mov.w	.L06032900,r8
	and	r8,r0
	mov.w	r0,@(20,r4)
	mov.w	.L06032902,r0
	mov.w	r0,@(0,r4)
	mov.w	.L06032904,r0
	mov.w	r0,@(0,r1)
	mov.l	.L06032910,r2
	mov	#0,r0
	mov.w	r0,@r2
	mov.l	.L06032914,r2
	mov	#0,r0
	mov.w	r0,@r2
	mov.l	.L06032918,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
.L060328A2:
	mov.l	r8,@-r15
	mov.l	r2,@-r15
	mov.l	r0,@-r15
	mov.l	.L0603291C,r2
	mov	#0,r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.b	@(2,r2),r0
	mov	#90,r8
	cmp/gt	r0,r8
	bf	.L060328C2
	mov	r8,r0
	mov.b	r0,@(2,r2)
	mov	#13,r0
	mov.b	r0,@(0,r2)
.L060328C2:
	mov.l	@r15+,r0
	mov.l	@r15+,r2
	mov.l	@r15+,r8
	mov.l	.L0603290C,r4
	mov.l	@r4,r4
	mov.w	@(0,r1),r0
	add	#-1,r0
	cmp/pl	r0
	bt	.L06032928
	mov	#0,r0
	mov.b	r0,@(127,gbr)
	mov.w	.L06032906,r0
	mov.w	r0,@(2,r4)
	mov	#0,r0
	mov.w	r0,@(12,r4)
	mov.w	.L06032908,r0
	mov.w	r0,@(0,r4)
	mov.w	.L0603290A,r0
	mov.w	r0,@(0,r1)
	mov.l	.L06032920,r4
	mov.l	@r4,r4
	mov.l	@(8,r4),r12
	mov.b	@(1,r12),r0
	and	#223,r0
	mov.b	r0,@(1,r12)
	mov.l	.L06032924,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L060328FE:
	.short 0x0000
.L06032900:
	.short 0xC000
.L06032902:
	.short 0x1000
.L06032904:
	.short 0x0080
.L06032906:
	.short 0x00C0
.L06032908:
	.short 0x0200
.L0603290A:
	.short 0x0020
.L0603290C:
	.long cam_obj
.L06032910:
	.long D_060329D2
.L06032914:
	.long D_060329D4
.L06032918:
	.long .L060328A2
.L0603291C:
	.long D_060FEA2C
.L06032920:
	.long player_obj
.L06032924:
	.long func_06032960
.L06032928:
	mov.w	r0,@(0,r1)
	mov	#1,r8
	mov.w	@(210,gbr),r0
	or	r8,r0
	mov.w	r0,@(210,gbr)
	mov.w	@(2,r4),r0
	add	#1,r0
	mov.w	.L06032954,r8
	cmp/ge	r8,r0
	bf	.L0603293E
	mov	r8,r0
.L0603293E:
	mov.w	r0,@(2,r4)
	mov.w	@(12,r4),r0
	mov.w	.L06032956,r8
	sub	r8,r0
	mov.w	r0,@(12,r4)
	mov.l	.L06032958,r4
	mov.l	@r4,r4
	mov.l	.L0603295C,r0
	mov.l	r0,@(36,r4)
	rts
	nop
.L06032954:
	.short 0x00C0
.L06032956:
	.short 0x0200
.L06032958:
	.long player_obj
.L0603295C:
	.long 0x00040000
	endlabel func_06032834

	glabel func_06032960
	mov.l	r8,@-r15
	mov.l	r2,@-r15
	mov.l	r0,@-r15
	mov.l	.L060329B8,r2
	mov	#0,r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.b	@(2,r2),r0
	mov	#90,r8
	cmp/gt	r0,r8
	bf	.L06032980
	mov	r8,r0
	mov.b	r0,@(2,r2)
	mov	#13,r0
	mov.b	r0,@(0,r2)
.L06032980:
	mov.l	@r15+,r0
	mov.l	@r15+,r2
	mov.l	@r15+,r8
	mov.w	@(0,r1),r0
	add	#-1,r0
	cmp/pl	r0
	bt	.L060329CC
	sts.l	pr,@-r15
	mov.l	.L060329BC,r2
	mov	#4,r7
.L06032994:
	mov.l	.L060329C0,r0
	jsr	@r0
	nop
	mov.l	.L060329C4,r0
	mov.l	r0,@(12,r3)
	add	#16,r3
	mov	#4,r0
	sub	r7,r0
	mov.b	r0,@(0,r3)
	dt	r7
	bf	.L06032994
	lds.l	@r15+,pr
	mov.l	.L060329C8,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
	.byte 0x00, 0x00
.L060329B8:
	.long D_060FEA2C
.L060329BC:
	.long obj_list_effect
.L060329C0:
	.long obj_alloc
.L060329C4:
	.long func_06033246
.L060329C8:
	.long func_060329D6
.L060329CC:
	mov.w	r0,@(0,r1)
	rts
	nop
	dlabel D_060329D2
	.byte 0x00, 0x00
	dlabel D_060329D4
	.byte 0x00, 0x00
	endlabel func_06032960

	glabel func_060329D6
	mov.l	r8,@-r15
	mov.l	r2,@-r15
	mov.l	r0,@-r15
	mov.l	.L06032A50,r2
	mov	#0,r0
	shll2	r0
	shll2	r0
	add	r0,r2
	mov.b	@(2,r2),r0
	mov	#90,r8
	cmp/gt	r0,r8
	bf	.L060329F6
	mov	r8,r0
	mov.b	r0,@(2,r2)
	mov	#13,r0
	mov.b	r0,@(0,r2)
.L060329F6:
	mov.l	@r15+,r0
	mov.l	@r15+,r2
	mov.l	@r15+,r8
	mov.l	.L06032A54,r2
	mov.w	@r2,r0
	tst	r0,r0
	bt	.L06032A4A
	sts.l	pr,@-r15
	mov.l	.L06032A58,r4
	mov.l	@r4,r0
	or	#4,r0
	mov.l	r0,@r4
	mov.l	.L06032A5C,r3
	mov.l	@r3,r3
	mov	#1,r0
	mov.b	r0,@(4,r3)
	mov.l	.L06032A60,r2
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	shll	r0
	add	r0,r2
	mov.l	.L06032A64,r4
	mov.w	@r2+,r0
	shll16	r0
	mov.l	r0,@(0,r4)
	mov.w	@r2+,r0
	shll16	r0
	mov.l	r0,@(4,r4)
	mov.w	@r2+,r0
	shll16	r0
	mov.l	r0,@(8,r4)
	mov.l	.L06032A68,r4
	mov.l	@r4,r4
	mov.l	@(8,r4),r12
	mov.b	@(1,r12),r0
	or	#32,r0
	mov.b	r0,@(1,r12)
	mov.l	.L06032A6C,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
.L06032A4A:
	rts
	nop
	.byte 0x00, 0x00
.L06032A50:
	.long D_060FEA2C
.L06032A54:
	.long D_060329D2
.L06032A58:
	.long D_0602FF48
.L06032A5C:
	.long cam_obj
.L06032A60:
	.long D_06033928
.L06032A64:
	.long D_0602FF3C
.L06032A68:
	.long player_obj
.L06032A6C:
	.long func_06032A70
	endlabel func_060329D6

	glabel func_06032A70
	mov.l	.L06032AC0,r2
	mov.w	@r2,r0
	cmp/eq	#-2,r0
	bf	.L06032AE8
	mov.l	.L06032AC4,r4
	mov.l	@r4,r0
	and	#251,r0
	mov.l	r0,@r4
	mov.l	.L06032AC8,r3
	mov.l	@r3,r3
	mov	#0,r0
	mov.b	r0,@(4,r3)
	mov.l	.L06032ACC,r4
	mov.l	@r4,r4
	mov.l	@(52,r4),r8
	mov.l	.L06032AD0,r10
	mov.l	r8,@r10
	mov	#-2,r8
	mov.w	@(210,gbr),r0
	and	r8,r0
	mov.w	r0,@(210,gbr)
	mov.l	.L06032AD4,r2
	mov	#1,r0
	mov.w	r0,@r2
	mov.l	.L06032AC4,r6
	mov.l	@r6,r0
	and	#247,r0
	mov.l	r0,@r6
	sts.l	pr,@-r15
	mov.l	.L06032AD8,r2
	mov.l	.L06032ADC,r0
	jsr	@r0
	nop
	mov.l	.L06032AE0,r0
	mov.l	r0,@(12,r3)
	lds.l	@r15+,pr
	mov.l	.L06032AE4,r0
	jmp	@r0
	nop
	.byte 0x00, 0x00
.L06032AC0:
	.long D_060329D2
.L06032AC4:
	.long D_0602FF48
.L06032AC8:
	.long cam_obj
.L06032ACC:
	.long player_obj
.L06032AD0:
	.long D_0602FF34
.L06032AD4:
	.long D_060329D4
.L06032AD8:
	.long obj_list_manager
.L06032ADC:
	.long obj_alloc
.L06032AE0:
	.long func_06034C4C
.L06032AE4:
	.long obj_free
.L06032AE8:
	rts
	nop
	endlabel func_06032A70

	glabel func_06032AEC
	sts.l	pr,@-r15
	mov.l	.L06032BB4,r4
	mov.l	@r4,r4
	mov.w	.L06032BA6,r0
	mov.w	r0,@(12,r4)
	mov.w	@(20,r4),r0
	mov.w	.L06032BA8,r8
	and	r8,r0
	mov.w	r0,@(20,r4)
	mov.w	.L06032BAA,r0
	mov.w	r0,@(0,r4)
	mov.w	.L06032BAC,r0
	mov.w	r0,@(0,r1)
	mov.l	.L06032BB8,r2
	mov	#0,r0
	mov.w	r0,@r2
	mov.l	.L06032BBC,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
.L06032B14:
	mov.l	.L06032BB4,r4
	mov.l	@r4,r4
	mov.w	@(0,r1),r0
	add	#-1,r0
	cmp/pl	r0
	bt	.L06032BE0
	mov	#0,r0
	mov.b	r0,@(127,gbr)
	mov.w	.L06032BAE,r0
	mov.w	r0,@(2,r4)
	mov	#0,r0
	mov.w	r0,@(12,r4)
	mov.w	.L06032BB0,r0
	mov.w	r0,@(0,r4)
	mov.l	.L06032BC0,r4
	mov.l	@r4,r4
	mov.l	@(8,r4),r12
	mov.b	@(1,r12),r0
	and	#223,r0
	mov.b	r0,@(1,r12)
	sts.l	pr,@-r15
	mov.l	.L06032BC4,r0
	jsr	@r0
	nop
	mov.l	.L06032BC8,r0
	mov.l	@r0,r4
	mov.l	.L06032BCC,r2
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov	#30,r13
	mov.b	r13,@r4
	mov	#7,r0
	mov.b	r0,@(1,r4)
	add	#16,r4
	mov	#4,r14
.L06032B5E:
	mov.l	@r2+,r3
	mov.l	@r3+,r0
	mov.l	r14,@-r15
	mov.l	r4,@-r15
	mov.l	r3,@-r15
	mov.l	r2,@-r15
	mov	r0,r3
	extu.b	r3,r0
	mov.l	.L06032BD0,r10
	jsr	@r10
	nop
	mov.l	@r15+,r2
	mov.l	@r15+,r3
	mov.l	@r15+,r4
	mov.l	@r15+,r14
	mov.l	r6,@r4
	mov.l	@r3+,r0
	mov.l	.L06032BD4,r8
	sub	r8,r0
	mov.l	r0,@(4,r4)
	mov.l	r7,@(8,r4)
	add	#12,r4
	dt	r14
	bf	.L06032B5E
	mov	#-2,r8
	mov.w	@(210,gbr),r0
	and	r8,r0
	mov.w	r0,@(210,gbr)
	lds.l	@r15+,pr
	mov.l	.L06032BD8,r6
	mov.l	@r6,r0
	and	#247,r0
	mov.l	r0,@r6
	mov.l	.L06032BDC,r0
	jmp	@r0
	nop
.L06032BA6:
	.short 0x0000
.L06032BA8:
	.short 0xC000
.L06032BAA:
	.short 0x1000
.L06032BAC:
	.short 0x0080
.L06032BAE:
	.short 0x0100
.L06032BB0:
	.short 0x0200
	.byte 0x00, 0x00
.L06032BB4:
	.long cam_obj
.L06032BB8:
	.long D_060329D2
.L06032BBC:
	.long .L06032B14
.L06032BC0:
	.long player_obj
.L06032BC4:
	.long func_0603E964
.L06032BC8:
	.long D_060F30A8
.L06032BCC:
	.long D_0603EB54
.L06032BD0:
	.long path_eval
.L06032BD4:
	.long 0x00500000
.L06032BD8:
	.long D_0602FF48
.L06032BDC:
	.long obj_free
.L06032BE0:
	mov.w	r0,@(0,r1)
	mov	#1,r8
	mov.w	@(210,gbr),r0
	or	r8,r0
	mov.w	r0,@(210,gbr)
	mov.w	@(2,r4),r0
	add	#1,r0
	mov.w	.L06032C0C,r8
	cmp/ge	r8,r0
	bf	.L06032BF6
	mov	r8,r0
.L06032BF6:
	mov.w	r0,@(2,r4)
	mov.w	@(12,r4),r0
	mov.w	.L06032C0E,r8
	sub	r8,r0
	mov.w	r0,@(12,r4)
	mov.l	.L06032C10,r4
	mov.l	@r4,r4
	mov.l	.L06032C14,r0
	mov.l	r0,@(36,r4)
	rts
	nop
.L06032C0C:
	.short 0x00C0
.L06032C0E:
	.short 0x0200
.L06032C10:
	.long player_obj
.L06032C14:
	.long 0x00040000
	endlabel func_06032AEC

	glabel func_06032C18
	mov.l	.L06032C34,r4
	mov.l	@r4,r4
	mov.w	.L06032C30,r0
	mov.w	r0,@(12,r4)
	mov.w	r0,@(20,r4)
	mov.w	.L06032C32,r0
	mov.w	r0,@(0,r1)
	mov.l	.L06032C38,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L06032C30:
	.short 0x0000
.L06032C32:
	.short 0x0040
.L06032C34:
	.long cam_obj
.L06032C38:
	.long func_06032C3C
	endlabel func_06032C18

	glabel func_06032C3C
	mov.w	@(0,r1),r0
	dt	r0
	bf	.L06032C52
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	.L06032C4C
	mov	#0,r0
	mov.b	r0,@(127,gbr)
.L06032C4C:
	mov.l	.L06032C58,r0
	mov.l	r0,@-r1
	add	#4,r1
.L06032C52:
	mov.w	r0,@(0,r1)
	rts
	nop
.L06032C58:
	.long func_06032C5C
	endlabel func_06032C3C

	glabel func_06032C5C
	mov.l	@(16,gbr),r0
	cmp/pl	r0
	bf	.L06032C66
	rts
	nop
.L06032C66:
	sts.l	pr,@-r15
	mov.l	.L06032C88,r2
	mov.l	.L06032C8C,r0
	jsr	@r0
	nop
	mov.l	.L06032C90,r2
	mov.l	r2,@(12,r3)
	mov.w	.L06032C84,r0
	mov.w	r0,@(0,r1)
	mov.l	.L06032C94,r0
	mov.l	r0,@-r1
	add	#4,r1
	lds.l	@r15+,pr
	rts
	nop
.L06032C84:
	.short 0x0082
	.byte 0x00, 0x00
.L06032C88:
	.long obj_list_stage
.L06032C8C:
	.long obj_alloc
.L06032C90:
	.long func_06033054
.L06032C94:
	.long func_06032C98
	endlabel func_06032C5C

	glabel func_06032C98
	mov.l	.L06032CB0,r4
	mov.l	@r4,r4
	mov.w	@(0,r1),r0
	add	#-1,r0
	cmp/pl	r0
	bt	.L06032CB4
	mov	#0,r0
	mov.b	r0,@(21,gbr)
	mov	#6,r0
	mov.b	r0,@(0,gbr)
	rts
	nop
.L06032CB0:
	.long cam_obj
.L06032CB4:
	mov.w	r0,@(0,r1)
	mov.w	@(2,r4),r0
	add	#2,r0
	mov.w	r0,@(2,r4)
	mov.w	@(12,r4),r0
	mov.w	.L06032CC8,r8
	sub	r8,r0
	mov.w	r0,@(12,r4)
	rts
	nop
.L06032CC8:
	.short 0xFFE0
	endlabel func_06032C98

	glabel func_06032CCA
	sts.l	pr,@-r15
	bsr	func_06032D04
	nop
	mov.l	.L06032CE8,r4
	bsr	func_06032CF4
	nop
	mov.l	.L06032CEC,r4
	bsr	func_06032CF4
	nop
	mov.l	.L06032CF0,r4
	bsr	func_06032CF4
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06032CE8:
	.long player_obj
.L06032CEC:
	.long player_obj_p2
.L06032CF0:
	.long D_060F306C
	endlabel func_06032CCA

	glabel func_06032CF4
	mov.l	@r4,r4
	tst	r4,r4
	add	#30,r4
	mov.b	@r4,r11
	mov	#32,r10
	or	r10,r11
	rts
	mov.b	r11,@r4
	endlabel func_06032CF4

	glabel func_06032D04
	sts.l	pr,@-r15
	mov.w	@(8,r1),r0
	add	#1,r0
	mov.w	r0,@(8,r1)
	mov.l	.L06032D20,r2
.L06032D0E:
	mov.l	@r2+,r8
	cmp/pz	r8
	bf	.L06032D2A
	cmp/eq	r8,r0
	bt	.L06032D24
	add	#4,r2
	bra	.L06032D0E
	add	#4,r8
	.byte 0x00, 0x00
.L06032D20:
	.long D_06032D30
.L06032D24:
	mov.l	@r2+,r2
	jsr	@r2
	nop
.L06032D2A:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_06032D04

	.section .data.06032D30,"aw",@progbits
	.p2align 2
	dlabel D_06032D30
	.byte 0x00, 0x00, 0x00, 0x01
	.long func_06032D6C
	.byte 0x00, 0x00, 0x02, 0x12
	.long func_06032D4C
	.byte 0x00, 0x00, 0x02, 0x58
	.long func_06032DAC
	.byte 0xFF, 0xFF, 0xFF, 0xFF
