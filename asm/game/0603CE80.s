	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0603CE80,"ax",@progbits
	.p2align 2

	glabel func_0603CE80
	sts.l	pr,@-r15
	mov.l	.L0603CE94,r0
	jsr	@r0
	nop
	cmp/pl	r2
	bt	.L0603CE98
	lds.l	@r15+,pr
	rts
	mov.l	r2,@r1
	.byte 0x00, 0x00
.L0603CE94:
	.long func_06035DBC
.L0603CE98:
	mov.l	r1,@r2
	mov.l	.L0603CF2C,r0
	jsr	@r0
	mov.l	r2,@r1
	mov	#0,r0
	mov.w	r0,@(18,r2)
	mov	#0,r3
	mov	#65,r0
	mov.b	r3,@(r0,r2)
	mov	#64,r0
	mov.b	r3,@(r0,r2)
	mov	r14,r0
	mov.l	.L0603CF30,r3
	mov.l	@r3,r0
	rotl	r0
	mov.l	.L0603CF34,r4
	swap.w	r0,r0
	dmuls.l	r0,r4
	sts	macl,r0
	add	r4,r0
	mov.l	r0,@r3
	and	#192,r0
	or	r0,r14
	mov	#96,r0
	mov.b	r14,@(r0,r2)
	mov	#80,r3
	mov	#69,r0
	mov.b	r3,@(r0,r2)
	mov	#70,r0
	mov.b	r3,@(r0,r2)
	mov	#99,r0
	mov.b	r14,@(r0,r2)
	mov	#68,r3
	mov	#67,r0
	mov.b	r3,@(r0,r2)
	mov	#102,r0
	mov.b	r14,@(r0,r2)
	mov	#-13,r7
	mov	#12,r4
	mov.b	@(15,r2),r0
	and	r7,r0
	or	r4,r0
	mov.b	r0,@(15,r2)
	mov	#105,r0
	mov.b	r14,@(r0,r2)
	mov	#0,r3
	mov	#66,r0
	mov.b	r3,@(r0,r2)
	mov	#22,r3
	mov	#68,r0
	mov.b	r3,@(r0,r2)
	mov	#0,r3
	mov	#71,r0
	mov.b	r3,@(r0,r2)
	mov	#15,r3
	mov	#72,r0
	mov.b	r3,@(r0,r2)
	mov.b	@(15,r2),r0
	and	#15,r0
	or	#160,r0
	mov.b	r0,@(15,r2)
	mov	#0,r0
	mov.b	r0,@(13,r2)
	mov.b	r0,@(14,r2)
	mov.b	@(15,r2),r0
	and	#252,r0
	mov.b	r0,@(15,r2)
	mov.l	.L0603CF38,r9
	mov.b	@r9,r8
	add	#1,r8
	mov.b	r8,@r9
	lds.l	@r15+,pr
	rts
	nop
.L0603CF2C:
	.long func_06035FBA
.L0603CF30:
	.long D_06035A6C
.L0603CF34:
	.long 0x0D81A52B
.L0603CF38:
	.long D_060CFFCE
	endlabel func_0603CE80

	glabel func_0603CF3C
	mov.w	@(4,r1),r0
	mov.w	r0,@(6,r1)
	mov.w	r0,@(4,r1)
	mov.l	.L0603CF4C,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0603CF4C:
	.long func_0603CF6C
	endlabel func_0603CF3C

	glabel func_0603CF50
	mov.w	@(4,r1),r0
	mov.w	r0,@(6,r1)
	mov.w	r0,@(4,r1)
	mov.l	@(44,r1),r2
	mov.l	@r2,r0
	mov.l	r0,@(44,r1)
	mov.l	.L0603CF68,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
	.byte 0x00, 0x00
.L0603CF68:
	.long func_0603CF6C
	endlabel func_0603CF50

	glabel func_0603CF6C
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov.b	@(1,r2),r0
	cmp/pz	r0
	bt	.L0603CF84
	mov	#1,r0
	mov.b	r0,@(1,r2)
	mov.l	.L0603CF80,r0
	jmp	@r0
	nop
.L0603CF80:
	.long func_0600D1A0
.L0603CF84:
	mov.b	@(60,gbr),r0
	tst	r0,r0
	bf	func_0603CF94
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	func_0603CF94
	rts
	nop
	endlabel func_0603CF6C

	glabel func_0603CF94
	sts.l	pr,@-r15
	mov.l	.L0603CFE8,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0603CFEC,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r4
	mov	r0,r5
	mov.l	.L0603CFF0,r14
	jsr	@r14
	mov	r0,r6
	mov.b	@(0,r1),r0
	tst	r0,r0
	bt	.L0603CFD2
	extu.b	r0,r9
.L0603CFBC:
	and	#3,r0
	shlr2	r9
	mov.l	.L0603CFF4,r2
	add	r0,r0
	mov.w	@(r0,r2),r0
	add	r2,r0
	jsr	@r0
	nop
	mov	r9,r0
	tst	r9,r9
	bf	.L0603CFBC
.L0603CFD2:
	mov.l	@(44,r1),r2
	mov.l	.L0603CFF8,r0
	jsr	@r0
	nop
	mov.l	.L0603CFFC,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L0603CFE8:
	.long func_0600CA24
.L0603CFEC:
	.long func_0600CBDA
.L0603CFF0:
	.long func_0600D018
.L0603CFF4:
	.long .L0603D080
.L0603CFF8:
	.long func_0601F4A0
.L0603CFFC:
	.long func_0600CA4E
	endlabel func_0603CF94

	glabel func_0603D000
	mov.w	@(4,r1),r0
	mov.w	r0,@(6,r1)
	mov.w	r0,@(4,r1)
	mov.l	.L0603D010,r0
	mov.l	r0,@-r1
	add	#4,r1
	rts
	nop
.L0603D010:
	.long func_0603D014
	endlabel func_0603D000

	glabel func_0603D014
	mov	#-8,r0
	mov.l	@(r0,r1),r2
	mov.b	@(1,r2),r0
	cmp/pz	r0
	bt	func_0603D02C
	mov	#1,r0
	mov.b	r0,@(1,r2)
	mov.l	.L0603D028,r0
	jmp	@r0
	nop
.L0603D028:
	.long func_0600D1A0
	endlabel func_0603D014

	glabel func_0603D02C
	sts.l	pr,@-r15
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L0603D038
	bra	.L0603D06A
	nop
.L0603D038:
	mov.l	.L0603D074,r0
	mov.l	@r0,r0
	mov.b	@(6,r0),r0
	tst	r0,r0
	bt	.L0603D06A
	mov	#64,r0
	mov.l	@(r0,r1),r2
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r3
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	@(56,r1),r6
	mov.w	@(24,r1),r0
	mov	r0,r12
	mov.l	.L0603D078,r0
	cmp/eq	r2,r0
	bf	.L0603D060
	mov.w	.L0603D070,r0
	add	r0,r12
.L0603D060:
	mov.w	@(26,r1),r0
	mov	r0,r13
	mov.l	.L0603D07C,r0
	jsr	@r0
	mov.l	@r2+,r7
.L0603D06A:
	lds.l	@r15+,pr
	bra	.L0603CF84
	nop
.L0603D070:
	.short 0xC000
	.byte 0x00, 0x00
.L0603D074:
	.long D_060F3064
.L0603D078:
	.long D_06041F8C
.L0603D07C:
	.long func_06017A98
.L0603D080:
	.short func_0603D088 - .L0603D080
	.short func_0603D08C - .L0603D080
	.short func_0603D0A0 - .L0603D080
	.short func_0603D0B4 - .L0603D080
	endlabel func_0603D02C

	glabel func_0603D088
	rts
	nop
	endlabel func_0603D088

	glabel func_0603D08C
	mov.w	@(2,r1),r0
	mov	r0,r4
	mov.w	@(22,r1),r0
	add	r4,r0
	mov.w	r0,@(22,r1)
	mov.l	.L0603D09C,r14
	jmp	@r14
	nop
.L0603D09C:
	.long func_0600CA7A
	endlabel func_0603D08C

	glabel func_0603D0A0
	mov.w	@(2,r1),r0
	mov	r0,r4
	mov.w	@(24,r1),r0
	add	r4,r0
	mov.w	r0,@(24,r1)
	mov.l	.L0603D0B0,r14
	jmp	@r14
	nop
.L0603D0B0:
	.long func_0600CAF8
	endlabel func_0603D0A0

	glabel func_0603D0B4
	mov.w	@(2,r1),r0
	mov	r0,r4
	mov.w	@(26,r1),r0
	add	r4,r0
	mov.w	r0,@(26,r1)
	mov.l	.L0603D0C4,r14
	jmp	@r14
	nop
.L0603D0C4:
	.long func_0600CB68
	endlabel func_0603D0B4
