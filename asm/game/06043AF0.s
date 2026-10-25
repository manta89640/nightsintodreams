	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06043AF0,"ax",@progbits
	.p2align 2

	glabel func_06043AF0
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov.b	@(1,r2),r0
	cmp/pz	r0
	bt	.L06043B08
	mov	#1,r0
	mov.b	r0,@(1,r2)
	mov.l	.L06043B04,r0
	jmp	@r0
	nop
.L06043B04:
	.long obj_free
.L06043B08:
	sts.l	pr,@-r15
	mov.l	.L06043B68,r8
	mov.l	.L06043B6C,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bt	.L06043C0A
	xor	r0,r0
	mov.b	r0,@(0,r1)
.L06043B1A:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bt	.L06043B94
	mov.l	.L06043B70,r0
	jsr	@r0
	nop
	mov.l	.L06043B74,r2
	mov.b	@(1,r1),r0
	add	r0,r2
	mov.b	@r2,r0
	mov.l	.L06043B78,r3
	mov.l	@(r0,r3),r0
	mov.w	r0,@(28,r1)
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L06043B7C,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.l	.L06043B80,r13
	jsr	@r13
	mov.w	@(24,r1),r0
	mov.l	.L06043B84,r4
	xor	r5,r5
	mov.l	.L06043B7C,r0
	jsr	@r0
	xor	r6,r6
	mov.l	.L06043B88,r0
	jsr	@r0
	mov.l	@(16,r1),r2
	mov.l	.L06043B80,r13
	jsr	@r13
	mov.w	@(4,r1),r0
	mov.l	.L06043B8C,r0
	jsr	@r0
	mov.l	@(40,r1),r2
	mov.l	.L06043B90,r0
	jmp	@r0
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L06043B68:
	.long 0x00200000
.L06043B6C:
	.long obj_find_near_player
.L06043B70:
	.long mtx_push
.L06043B74:
	.long D_06043AB8
.L06043B78:
	.long D_06043CCC
.L06043B7C:
	.long mtx_translate
.L06043B80:
	.long mtx_rot_y
.L06043B84:
	.long 0xFFAE0000
.L06043B88:
	.long poly_draw_model_color
.L06043B8C:
	.long poly_draw_model
.L06043B90:
	.long mtx_pop
.L06043B94:
	mov.b	@(20,gbr),r0
	cmp/eq	#5,r0
	bt	.L06043C04
	cmp/eq	#12,r0
	bt	.L06043C04
	cmp/eq	#14,r0
	bt	.L06043C04
	mov.l	.L06043BE8,r2
	mov.b	@(1,r1),r0
	add	r0,r2
	mov.b	@r2,r0
	tst	r0,r0
	bt	.L06043C04
	mov.l	@(12,gbr),r0
	tst	#2,r0
	bt	.L06043C04
	mov.l	.L06043BEC,r2
	mov.l	@r2,r3
	cmp/eq	r0,r3
	bt	.L06043C04
	mov.l	r0,@r2
	mov.b	@(2,r1),r0
	add	#1,r0
	cmp/eq	#16,r0
	bf	.L06043BC8
	xor	r0,r0
.L06043BC8:
	mov.b	r0,@(2,r1)
	mov	r0,r6
	mov	#8,r0
	cmp/gt	r0,r6
	bf	.L06043BD8
	sub	r0,r6
	sub	r6,r0
	mov	r0,r6
.L06043BD8:
	mov.l	.L06043BF0,r2
	mov.l	.L06043BF4,r3
	mov.l	.L06043BF8,r5
	mov.l	.L06043BFC,r4
	mov.l	.L06043C00,r14
	jmp	@r14
	lds.l	@r15+,pr
	.byte 0x00, 0x00
.L06043BE8:
	.long D_06043AB8
.L06043BEC:
	.long D_06043AB4
.L06043BF0:
	.long D_0608CD88
.L06043BF4:
	.long D_0608CF68
.L06043BF8:
	.long VDP1_VRAM + 0xFA50
.L06043BFC:
	.long 0x000000F0
.L06043C00:
	.long func_06043EF4
.L06043C04:
	lds.l	@r15+,pr
	rts
	nop
.L06043C0A:
	mov.b	@(0,r1),r0
	cmp/eq	#1,r0
	bt	.L06043B1A
	mov.b	@(20,gbr),r0
	cmp/eq	#10,r0
	bt	.L06043C88
	cmp/eq	#4,r0
.L06043C18:
	bf	.L06043C40
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#3,r5
	mov	#5,r6
	mov.l	.L06043C3C,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	bra	.L06043C5E
	nop
.L06043C3C:
	.long snd_seq_start
.L06043C40:
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#3,r5
	mov	#6,r6
	mov.l	.L06043C7C,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
.L06043C5E:
	mov	#1,r0
	mov.b	r0,@(0,r1)
	mov.l	.L06043C80,r7
	mov.l	@r7,r7
	mov.l	@(32,r7),r4
	cmp/pz	r4
	mov.w	.L06043C7A,r0
	bf	.L06043C70
	neg	r0,r0
.L06043C70:
	mov.w	r0,@(6,r1)
	mov.l	.L06043C84,r2
	mov.l	r2,@-r1
	bra	.L06043B1A
	add	#4,r1
.L06043C7A:
	.short 0x1000
.L06043C7C:
	.long snd_seq_start
.L06043C80:
	.long player_obj
.L06043C84:
	.long func_06043C9C
.L06043C88:
	mov.l	.L06043C98,r2
	mov.b	@(1,r1),r0
	add	r0,r2
	mov.b	@r2,r0
	tst	r0,r0
	bt	.L06043C18
	bra	.L06043B1A
	nop
.L06043C98:
	.long D_06043AB8
	endlabel func_06043AF0

	glabel func_06043C9C
	sts.l	pr,@-r15
	mov.w	@(6,r1),r0
	mov	r0,r2
	mov.w	@(4,r1),r0
	add	r2,r0
	mov.w	r0,@(4,r1)
	cmp/eq	#0,r0
	bt	.L06043CB0
	bra	.L06043B1A
	nop
.L06043CB0:
	mov.l	.L06043CC4,r2
	mov.b	@(1,r1),r0
	add	r0,r2
	mov.b	@r2,r0
	xor	#4,r0
	mov.b	r0,@r2
	mov.l	.L06043CC8,r2
	mov.l	r2,@-r1
	bra	.L06043B1A
	add	#4,r1
.L06043CC4:
	.long D_06043AB8
.L06043CC8:
	.long func_06043AF0
	endlabel func_06043C9C

	.section .data.06043CCC,"aw",@progbits
	.p2align 2
	dlabel D_06043CCC
	.byte 0x00, 0x00, 0x1F, 0x86, 0x00, 0x00, 0x1F, 0x4A, 0x11, 0x24, 0x11, 0x32, 0x21, 0x06, 0x00, 0x0B
	.byte 0x71, 0x04, 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x07, 0xE0, 0x01, 0x80, 0x21
	.byte 0xD0, 0x01, 0x40, 0x2B, 0x00, 0x09, 0x00, 0x00
	.long obj_free
