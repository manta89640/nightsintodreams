	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601BC94,"ax",@progbits
	.p2align 2

	glabel func_0601BC94
	mov.l	r1,@-r15
	sts.l	pr,@-r15
	mov.l	@(16,gbr),r0
	shlr2	r0
	shlr2	r0
	mov.l	r0,@(752,gbr)
	mov.l	@(16,gbr),r0
	mov.l	r0,@(756,gbr)
	mov.l	.L0601BD18,r0
	jsr	@r0
	nop
	mov.l	.L0601BD1C,r0
	jsr	@r0
	nop
	mov.l	.L0601BD20,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	@r15+,r1
	mov.l	r1,@-r15
	sts.l	pr,@-r15
	mov.l	.L0601BD24,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	mov.l	@r15+,r1
	mov	#0,r0
	mov.b	r0,@(61,gbr)
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#3,r5
	mov	#0,r6
	mov.l	.L0601BD28,r0
	jsr	@r0
	mov	#2,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	sts.l	pr,@-r15
	mov.w	.L0601BD16,r0
	mov.w	r0,@(138,gbr)
	mov	#0,r0
	mov.w	r0,@(8,r1)
	mov.b	r0,@(10,r1)
	mov.l	@(656,gbr),r0
	mov.l	r0,@(0,r1)
	mov.l	r0,@(20,r1)
	mov.l	@(16,gbr),r0
	mov.l	r0,@(4,r1)
	mov.l	.L0601BD2C,r3
	mov.l	@r3,r3
	mov.l	@(8,r3),r3
	mov	#7,r0
	mov.l	r0,@(60,r3)
	lds.l	@r15+,pr
	mov.l	.L0601BD30,r0
	mov.l	r0,@-r1
	add	#4,r1
.L0601BD12:
	bra	.L0601BDC8
	nop
.L0601BD16:
	.short 0x0800
.L0601BD18:
	.long func_0603B84C
.L0601BD1C:
	.long snd_reroll_tone_variants
.L0601BD20:
	.long func_0603BA0C
.L0601BD24:
	.long cd_pause
.L0601BD28:
	.long snd_seq_start
.L0601BD2C:
	.long player_obj
.L0601BD30:
	.long .L0601BD12
	endlabel func_0601BC94

	glabel func_0601BD34
	mov.l	@(4,r1),r8
	mov.l	@(24,r1),r9
	add	#-60,r8
	add	#60,r9
	cmp/pz	r8
	bt	.L0601BD44
	mov	#0,r8
	add	#-60,r9
.L0601BD44:
	mov.l	r8,@(4,r1)
	mov.l	r9,@(24,r1)
	mov.l	.L0601BD60,r2
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov	#0,r7
.L0601BD54:
	mov.l	@r2+,r8
	cmp/gt	r8,r9
	bf	.L0601BD64
	bra	.L0601BD54
	add	#1,r7
	.byte 0x00, 0x00
.L0601BD60:
	.long D_0601C7FC
.L0601BD64:
	mov	r7,r0
	mov.b	r0,@(10,r1)
	bra	.L0601BDC8
	nop
	endlabel func_0601BD34

	glabel func_0601BD6C
	mov.b	@(13,r1),r0
	add	#-1,r0
	cmp/pz	r0
	bf	.L0601BD7A
	mov.b	r0,@(13,r1)
	rts
	nop
.L0601BD7A:
	mov	#30,r0
	mov.b	r0,@(13,r1)
	mov.b	@(10,r1),r0
	mov	r0,r8
	mov.b	@(11,r1),r0
	cmp/ge	r8,r0
	bf	.L0601BD90
	mov	#-1,r0
	mov.b	r0,@(12,r1)
	bra	.L0601BD94
	nop
.L0601BD90:
	add	#1,r0
	mov.b	r0,@(11,r1)
.L0601BD94:
	mov.l	.L0601BDC4,r2
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.b	@(11,r1),r0
	mov.b	@(r0,r2),r0
	mov.l	@(0,r1),r8
	dmulu.l	r8,r0
	sts	macl,r0
	mov	#100,r13
	mov	#-128,r14
	shll	r14
	mov.l	r13,@(0,r14)
	mov.l	r0,@(4,r14)
	mov.l	@(28,r14),r0
	mov	#10,r13
	dmulu.l	r13,r0
	sts	macl,r0
	mov.l	r0,@(20,r1)
	mov.l	r0,@(656,gbr)
	bra	.L0601BDC8
	nop
	.byte 0x00, 0x00
.L0601BDC4:
	.long D_0601C81C
.L0601BDC8:
	sts.l	pr,@-r15
	mov.b	@(35,gbr),r0
	tst	r0,r0
	bt	.L0601BDD4
	bra	.L0601BDF6
	nop
.L0601BDD4:
	mov.w	@(8,r1),r0
	add	#1,r0
	mov.w	r0,@(8,r1)
	mov.l	.L0601BDEC,r2
.L0601BDDC:
	mov.l	@r2+,r8
	cmp/pz	r8
	bf	.L0601BDF6
	cmp/eq	r8,r0
	bt	.L0601BDF0
	add	#4,r2
	bra	.L0601BDDC
	add	#4,r8
.L0601BDEC:
	.long D_0601BDFC
.L0601BDF0:
	mov.l	@r2+,r2
	jsr	@r2
	nop
.L0601BDF6:
	lds.l	@r15+,pr
	rts
	nop
	endlabel func_0601BD6C

	.section .data.0601BDFC,"aw",@progbits
	.p2align 2
	dlabel D_0601BDFC
	.byte 0x00, 0x00, 0x00, 0x3C
	.long func_0601BECC
	.byte 0x00, 0x00, 0x00, 0x78
	.long func_0601BEE0
	.byte 0x00, 0x00, 0x00, 0x96
	.long func_0601BEF0
	.byte 0x00, 0x00, 0x00, 0xA0
	.long func_0601BEB8
	.byte 0x00, 0x00, 0x00, 0xB4
	.long func_0601BF00
	.byte 0x00, 0x00, 0x00, 0xD2
	.long func_0601BF14
	.byte 0x00, 0x00, 0x00, 0xF0
	.long D_0601BE5A
	.byte 0x00, 0x00, 0x01, 0x7C
	.long D_0601BE68
	.byte 0x00, 0x00, 0x01, 0x9A
	.long D_0601BE88
	.byte 0x00, 0x00, 0x02, 0x1C
	.long D_0601BE50
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	dlabel D_0601BE50
	.byte 0x90, 0x02, 0xC1, 0x44, 0x00, 0x0B, 0x00, 0x09, 0x7F, 0xFF
	dlabel D_0601BE5A
	.byte 0xD0, 0x02, 0x21, 0x06, 0x71, 0x04, 0x00, 0x0B, 0x00, 0x09
	.long func_0601BD34
	dlabel D_0601BE68
	.byte 0xC6, 0x04, 0x11, 0x01, 0x0E, 0x2A, 0xD4, 0x04, 0xB0, 0x14, 0x00, 0x09, 0x4E, 0x2A, 0xD0, 0x03
	.byte 0x21, 0x06, 0x71, 0x04, 0x00, 0x0B, 0x00, 0x09
	.long func_0601C728
	.long .L0601BD12
	dlabel D_0601BE88
	.byte 0xE0, 0x00, 0x80, 0x1D, 0xD0, 0x02, 0x21, 0x06, 0x71, 0x04, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x00
	.long func_0601BD6C
