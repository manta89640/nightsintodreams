	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06007560,"ax",@progbits
	.p2align 2

	glabel load_dream_data
	mov.l	r11,@-r15
	mov.l	r10,@-r15
	mov.l	r9,@-r15
	mov.l	r8,@-r15
	sts.l	pr,@-r15
	mov.l	r14,@-r15
	mov.l	r13,@-r15
	mov.l	r12,@-r15
	mov.w	@(28,gbr),r0
	tst	#16,r0
	bf	.L06007594
	mov.b	@(107,gbr),r0
	cmp/pl	r0
	bf	.L06007594
	mov.b	@(20,gbr),r0
	shll2	r0
	mov.l	.L060075FC,r2
	mov.l	@(r0,r2),r4
	mov.l	.L06007600,r5
	mov.l	.L06007604,r6
	mov	#2,r7
	sts.l	pr,@-r15
	mov.l	.L06007608,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
.L06007594:
	mov.b	@(20,gbr),r0
	tst	#1,r0
	bt	.L06007640
	mov.l	.L0600760C,r4
	mov.l	.L06007610,r5
	mov.l	.L06007614,r6
	mov	#2,r7
	sts.l	pr,@-r15
	mov.l	.L06007608,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	.L06007618,r2
	mov.l	@(r0,r2),r4
	mov.l	.L0600761C,r5
	mov.l	.L06007620,r6
	mov	#2,r7
	sts.l	pr,@-r15
	mov.l	.L06007608,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L06007624,r4
	mov.l	.L06007628,r5
	mov.l	.L0600762C,r6
	mov	#2,r7
	sts.l	pr,@-r15
	mov.l	.L06007608,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L06007630,r5
	mov.b	@(20,gbr),r0
	cmp/eq	#7,r0
	bf	.L060075E2
	mov.l	.L06007634,r5
.L060075E2:
	shlr	r0
	shll2	r0
	mov.l	.L06007638,r2
	mov.l	@(r0,r2),r4
	mov.l	.L0600763C,r6
	mov	#2,r7
	sts.l	pr,@-r15
	mov.l	.L06007608,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	bra	.L06007698
	nop
.L060075FC:
	.long demo_names
.L06007600:
	.long D_06073000
.L06007604:
	.long D_060D900A
.L06007608:
	.long file_queue
.L0600760C:
	.long D_060515E4
.L06007610:
	.long D_06080000
.L06007614:
	.long D_060D900C
.L06007618:
	.long dream_mhead_names
.L0600761C:
	.long D_06086000
.L06007620:
	.long D_060D900E
.L06007624:
	.long D_06051634
.L06007628:
	.long D_0029F000
.L0600762C:
	.long D_060D9010
.L06007630:
	.long 0x00200000
.L06007634:
	.long 0x00210000
.L06007638:
	.long dream_mdata_names
.L0600763C:
	.long D_060D9012
.L06007640:
	mov.l	.L060076C0,r4
	mov.l	.L060076C4,r5
	mov.l	.L060076C8,r6
	mov	#2,r7
	sts.l	pr,@-r15
	mov.l	.L060076CC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L060076D0,r4
	mov.l	.L060076D4,r5
	mov.l	.L060076D8,r6
	mov	#2,r7
	sts.l	pr,@-r15
	mov.l	.L060076CC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	.L060076DC,r2
	mov.l	@(r0,r2),r4
	mov.l	.L060076E0,r5
	mov.l	.L060076E4,r6
	mov	#2,r7
	sts.l	pr,@-r15
	mov.l	.L060076CC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	.L060076E8,r2
	mov.l	@(r0,r2),r4
	mov.l	.L060076EC,r5
	mov.l	.L060076F0,r6
	mov	#2,r7
	sts.l	pr,@-r15
	mov.l	.L060076CC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
.L06007698:
	sts.l	pr,@-r15
	mov.l	.L060076F4,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	.L060076F8,r2
	mov.l	@r2,r0
	tst	r0,r0
	bf	.L06007698
	mov.l	@r15+,r12
	mov.l	@r15+,r13
	mov.l	@r15+,r14
	lds.l	@r15+,pr
	mov.l	@r15+,r8
	mov.l	@r15+,r9
	mov.l	@r15+,r10
	mov.l	@r15+,r11
	rts
	nop
	.byte 0x00, 0x00
.L060076C0:
	.long D_0605154C
.L060076C4:
	.long D_06080000
.L060076C8:
	.long D_060D900C
.L060076CC:
	.long file_queue
.L060076D0:
	.long D_0605159C
.L060076D4:
	.long D_00270000
.L060076D8:
	.long D_060D900E
.L060076DC:
	.long dream_phead_names
.L060076E0:
	.long D_06098000
.L060076E4:
	.long D_060D9010
.L060076E8:
	.long dream_pdata_names
.L060076EC:
	.long D_00200010
.L060076F0:
	.long D_060D9012
.L060076F4:
	.long file_server
.L060076F8:
	.long file_busy_count
	endlabel load_dream_data

	.section .data.060076FC,"aw",@progbits
	.p2align 2
	dlabel dream_mhead_names
	.long D_060515EE
	.long D_060515F8
	.long D_06051602
	.long D_0605160C
	.long D_06051616
	.long D_06051620
	.long D_0605162A
	.long D_0605162A
	dlabel dream_mdata_names
	.long D_0605163D
	.long D_06051646
	.long D_0605164F
	.long D_06051658
	.long D_06051661
	.long D_0605166A
	.long D_06051673
	.long D_06051673
	dlabel dream_phead_names
	.long D_06051556
	.long D_06051560
	.long D_0605156A
	.long D_06051574
	.long D_0605157E
	.long D_06051588
	.long D_06051592
	.long D_06051592
	dlabel dream_pdata_names
	.long D_060515A5
	.long D_060515AE
	.long D_060515B7
	.long D_060515C0
	.long D_060515C9
	.long D_060515D2
	.long D_060515DB
	.long D_060515DB
	dlabel demo_names
	.long D_060513B3
	.long D_060513BE
	.long D_060513C9
	.long D_060513D4
	.long D_060513DF
	.long D_060513EA
	.long D_060513F5
	.long D_06051400
	.long D_0605140B
	.long D_06051416
	.long D_06051421
	.long D_0605142C
	.long D_060513BE
	.long D_060513BE
	.long D_060513BE
	.long D_060513BE
