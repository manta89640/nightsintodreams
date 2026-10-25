	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0601BE9C,"ax",@progbits
	.p2align 2

	glabel func_0601BE9C
	sts	pr,r13
	mov.l	.L0601BEB0,r2
	mov.l	.L0601BEB4,r0
	jsr	@r0
	nop
	mov.l	r4,@(12,r3)
	add	#16,r3
	lds	r13,pr
	rts
	mov.l	r1,@(16,r3)
.L0601BEB0:
	.long obj_list_stage
.L0601BEB4:
	.long obj_alloc
	endlabel func_0601BE9C

	glabel func_0601BEB8
	sts	pr,r14
	mov.l	.L0601BEC8,r4
	bsr	func_0601BE9C
	nop
	lds	r14,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601BEC8:
	.long func_0601BF28
	endlabel func_0601BEB8

	glabel func_0601BECC
	sts	pr,r14
	mov.l	.L0601BEDC,r4
	bsr	func_0601BE9C
	nop
	lds	r14,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601BEDC:
	.long func_0601BFE0
	endlabel func_0601BECC

	glabel func_0601BEE0
	mov.l	.L0601BEEC,r7
	mov.b	@(5,r7),r0
	or	#1,r0
	mov.b	r0,@(5,r7)
	rts
	nop
.L0601BEEC:
	.long play_state
	endlabel func_0601BEE0

	glabel func_0601BEF0
	mov.l	.L0601BEFC,r7
	mov.b	@(5,r7),r0
	or	#16,r0
	mov.b	r0,@(5,r7)
	rts
	nop
.L0601BEFC:
	.long play_state
	endlabel func_0601BEF0

	glabel func_0601BF00
	sts	pr,r14
	mov.l	.L0601BF10,r4
	bsr	func_0601BE9C
	nop
	lds	r14,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601BF10:
	.long func_0601C5B8
	endlabel func_0601BF00

	glabel func_0601BF14
	sts	pr,r14
	mov.l	.L0601BF24,r4
	bsr	func_0601BE9C
	nop
	lds	r14,pr
	rts
	nop
	.byte 0x00, 0x00
.L0601BF24:
	.long func_0601C11C
	endlabel func_0601BF14

	glabel func_0601BF28
	mov.l	.L0601BF40,r6
	mov.w	.L0601BF3E,r0
	mov.w	r0,@(0,r6)
	mov.w	r0,@(2,r6)
	mov	#0,r0
	mov.w	r0,@(26,r1)
	mov.l	.L0601BF44,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601BF3E:
	.short 0x7E10
.L0601BF40:
	.long VDP1_VRAM + 0xFFD8
.L0601BF44:
	.long func_0601BF48
	endlabel func_0601BF28

	glabel func_0601BF48
	sts.l	pr,@-r15
	mov.w	@(26,r1),r0
	mov.w	.L0601BFBA,r8
	add	r8,r0
	extu.w	r0,r0
	mov.l	.L0601BFC0,r8
	cmp/ge	r8,r0
	bf	.L0601BF5A
	mov	r8,r0
.L0601BF5A:
	mov.l	.L0601BFC4,r10
	jsr	@r10
	mov.w	r0,@(26,r1)
	shll2	r10
	neg	r10,r10
	mov	#15,r0
	shll16	r0
	dmuls.l	r0,r10
	sts	mach,r0
	mov	#16,r10
	add	r0,r10
	mov.l	.L0601BFC8,r6
	mov	r10,r11
	shll2	r11
	shll2	r11
	shll	r11
	mov	r11,r12
	shll2	r12
	shll2	r12
	shll	r12
	mov.w	@(26,r1),r0
	cmp/pz	r0
	bt	.L0601BF88
.L0601BF88:
	mov	r11,r0
	or	r12,r0
	or	r10,r0
	mov.w	r0,@(4,r6)
	mov.w	r0,@(6,r6)
	mov.l	.L0601BFCC,r2
	mov.l	r2,@(44,r1)
	mov	#0,r0
	mov.w	r0,@(20,r1)
	mov.l	.L0601BFD0,r0
	mov.l	r0,@(48,r1)
	mov.l	.L0601BFD4,r0
	mov.l	r0,@(52,r1)
	mov.l	.L0601BFD8,r0
	mov.l	r0,@(56,r1)
	mov.w	.L0601BFBC,r0
	mov.w	r0,@(22,r1)
	mov.w	.L0601BFBE,r0
	mov.w	r0,@(28,r1)
	mov.l	.L0601BFDC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0601BFBA:
	.short 0x0300
.L0601BFBC:
	.short 0x0100
.L0601BFBE:
	.short 0x1FFB
.L0601BFC0:
	.long 0x0000A000
.L0601BFC4:
	.long math_cos
.L0601BFC8:
	.long VDP1_VRAM + 0xFFD8
.L0601BFCC:
	.long D_06014246
.L0601BFD0:
	.long 0x00B00000
.L0601BFD4:
	.long 0x002C0000
.L0601BFD8:
	.long 0x00000000
.L0601BFDC:
	.long spr_draw_obj
	endlabel func_0601BF48

	glabel func_0601BFE0
	mov.l	.L0601C010,r0
	mov.l	r0,@(48,r1)
	mov.l	.L0601C014,r0
	mov.l	r0,@(52,r1)
	mov.l	.L0601C018,r0
	mov.l	r0,@(56,r1)
	mov.w	.L0601C008,r0
	mov.w	r0,@(22,r1)
	mov.l	.L0601C01C,r6
	mov.w	.L0601C00A,r0
	mov.w	r0,@(0,r6)
	mov.w	r0,@(2,r6)
	mov	#0,r0
	mov.w	.L0601C00C,r0
	mov.w	r0,@(28,r1)
	mov.l	.L0601C020,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601C008:
	.short 0x0100
.L0601C00A:
	.short 0x7E10
.L0601C00C:
	.short 0x1FFB
	.byte 0x00, 0x00
.L0601C010:
	.long 0x01B00000
.L0601C014:
	.long 0x00480000
.L0601C018:
	.long 0x00100000
.L0601C01C:
	.long VDP1_VRAM + 0xFFD8
.L0601C020:
	.long func_0601C024
	endlabel func_0601BFE0

	glabel func_0601C024
	sts.l	pr,@-r15
	mov.l	@(48,r1),r0
	mov.l	.L0601C088,r8
	add	r8,r0
	mov.l	.L0601C08C,r8
	cmp/ge	r8,r0
	bt	.L0601C034
	mov	r8,r0
.L0601C034:
	mov.l	r0,@(48,r1)
	mov.l	.L0601C090,r2
	mov.l	r2,@(44,r1)
	mov.l	.L0601C094,r0
	mov.l	@r0,r0
	mov.l	.L0601C098,r4
	add	r0,r4
	mov.l	.L0601C09C,r2
	mov.b	@r2,r0
	mov.w	.L0601C084,r3
	mulu.w	r0,r3
	sts	macl,r0
	add	r0,r4
	mov	r4,r5
	add	#16,r4
	mov.b	@(22,gbr),r0
	cmp/pz	r0
	bt	.L0601C05C
	mov	#0,r0
	mov.b	r0,@(22,gbr)
.L0601C05C:
	mov.w	@(r0,r4),r4
	mov.l	.L0601C0A0,r14
	jsr	@r14
	add	#1,r4
	and	#31,r0
	cmp/eq	#17,r0
	bt	.L0601C0A8
	cmp/eq	#18,r0
	bt	.L0601C0A8
	cmp/eq	#19,r0
	bt	.L0601C0A8
	and	#15,r0
	cmp/eq	#1,r0
	bt	.L0601C0A4
	cmp/eq	#2,r0
	bt	.L0601C0A4
	cmp/eq	#3,r0
	bt	.L0601C0A4
	bra	.L0601C0A8
	nop
.L0601C084:
	.short 0x0050
	.byte 0x00, 0x00
.L0601C088:
	.long 0xFFF00000
.L0601C08C:
	.long 0x00B00000
.L0601C090:
	.long D_06014246
.L0601C094:
	.long D_060CB014
.L0601C098:
	.long 0x00000528
.L0601C09C:
	.long D_060CB003
.L0601C0A0:
	.long math_bin_to_bcd
.L0601C0A4:
	bra	.L0601C0AA
	add	#9,r0
.L0601C0A8:
	mov	#13,r0
.L0601C0AA:
	mov.w	r0,@(20,r1)
	mov.w	.L0601C0F8,r0
	mov.w	r0,@(22,r1)
	mov.l	.L0601C100,r0
	jsr	@r0
	nop
	mov.l	.L0601C104,r2
	mov.l	r2,@(44,r1)
	mov	#0,r0
	mov.w	r0,@(20,r1)
	mov.l	.L0601C108,r0
	mov.l	@r0,r0
	mov.l	.L0601C10C,r4
	add	r0,r4
	mov.l	.L0601C110,r2
	mov.b	@r2,r0
	mov.w	.L0601C0FA,r3
	mulu.w	r0,r3
	sts	macl,r0
	add	r0,r4
	mov	r4,r5
	add	#16,r4
	mov.b	@(22,gbr),r0
	mov.w	@(r0,r4),r4
	mov.l	.L0601C114,r14
	jsr	@r14
	add	#1,r4
	mov	#6,r14
	mov.l	.L0601C118,r10
	jsr	@r10
	nop
	mov.w	.L0601C0FC,r0
	mov.w	r0,@(22,r1)
	mov.l	.L0601C100,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L0601C0F8:
	.short 0x0100
.L0601C0FA:
	.short 0x0050
.L0601C0FC:
	.short 0x0060
	.byte 0x00, 0x00
.L0601C100:
	.long spr_draw_obj
.L0601C104:
	.long D_0601C200
.L0601C108:
	.long D_060CB014
.L0601C10C:
	.long 0x00000528
.L0601C110:
	.long D_060CB003
.L0601C114:
	.long math_bin_to_bcd
.L0601C118:
	.long spr_build_number
	endlabel func_0601C024

	glabel func_0601C11C
	mov.l	.L0601C14C,r6
	mov.w	.L0601C146,r0
	mov.w	r0,@(0,r6)
	mov.w	r0,@(2,r6)
	mov.w	r0,@(4,r6)
	mov.w	r0,@(6,r6)
	mov.l	.L0601C150,r0
	mov.l	r0,@(48,r1)
	mov.l	.L0601C154,r0
	mov.l	r0,@(52,r1)
	mov.l	.L0601C158,r0
	mov.l	r0,@(56,r1)
	mov.w	.L0601C148,r0
	mov.w	r0,@(22,r1)
	mov.w	.L0601C14A,r0
	mov.w	r0,@(28,r1)
	mov.l	.L0601C15C,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0601C146:
	.short 0x4210
.L0601C148:
	.short 0x0100
.L0601C14A:
	.short 0x1FF8
.L0601C14C:
	.long VDP1_VRAM + 0xFFC0
.L0601C150:
	.long 0x00DC0000
.L0601C154:
	.long 0x00680000
.L0601C158:
	.long 0x00100000
.L0601C15C:
	.long func_0601C160
	endlabel func_0601C11C

	glabel func_0601C160
	sts.l	pr,@-r15
	mov.l	.L0601C1E0,r2
	mov.l	r2,@(44,r1)
	mov.w	.L0601C1DE,r0
	mov.w	r0,@(22,r1)
	mov.l	.L0601C1E4,r0
	jsr	@r0
	nop
	mov.l	.L0601C1E8,r2
	mov.l	r2,@(44,r1)
	mov.l	@(16,r1),r4
	mov.l	.L0601C1EC,r2
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.b	@(10,r4),r0
	mov.b	@(r0,r2),r0
	mov.l	.L0601C1F0,r14
	jsr	@r14
	mov	r0,r4
	shlr2	r0
	shlr2	r0
	mov	#1,r14
	mov.l	.L0601C1F4,r10
	jsr	@r10
	nop
	mov.l	.L0601C1E4,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r8
	mov.l	.L0601C1F8,r0
	add	r0,r8
	mov.l	r8,@(48,r1)
	mov.l	.L0601C1FC,r2
	mov.l	r2,@(44,r1)
	mov.l	@(16,r1),r4
	mov.l	.L0601C1EC,r2
	mov.b	@(20,gbr),r0
	shlr	r0
	shll2	r0
	mov.l	@(r0,r2),r2
	mov.b	@(10,r4),r0
	mov.b	@(r0,r2),r0
	mov.b	r0,@(27,gbr)
	mov.l	.L0601C1F0,r14
	jsr	@r14
	mov	r0,r4
	and	#15,r0
	mov	#1,r14
	mov.l	.L0601C1F4,r10
	jsr	@r10
	nop
	mov.l	.L0601C1E4,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r8
	mov.l	.L0601C1F8,r0
	sub	r0,r8
	mov.l	r8,@(48,r1)
	lds.l	@r15+,pr
	rts
	nop
.L0601C1DE:
	.short 0x0100
.L0601C1E0:
	.long D_06013DA8
.L0601C1E4:
	.long spr_draw_obj
.L0601C1E8:
	.long D_0601C320
.L0601C1EC:
	.long D_0601C81C
.L0601C1F0:
	.long math_bin_to_bcd
.L0601C1F4:
	.long spr_build_number
.L0601C1F8:
	.long 0x00180000
.L0601C1FC:
	.long D_0601C338
	endlabel func_0601C160

	.section .data.0601C200,"aw",@progbits
	.p2align 2
	dlabel D_0601C200
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_0601C27C
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	dlabel D_0601C320
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dlabel D_0601C338
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
