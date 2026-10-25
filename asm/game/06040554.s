	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06040554,"ax",@progbits
	.p2align 2

	glabel func_06040554
	sts.l	pr,@-r15
	mov.b	@(63,gbr),r0
	tst	r0,r0
	bt	.L06040560
	bra	.L060405AE
	nop
.L06040560:
	mov.l	.L060405BC,r0
	mov.l	@r0,r2
	mov	#64,r0
	add	r0,r2
	mov.b	@r2,r0
	tst	r0,r0
	bf	.L060405AE
	mov.l	.L060405C0,r8
	mov.l	.L060405C4,r0
	jsr	@r0
	nop
	cmp/pz	r0
	bf	.L060405AE
	mov.l	.L060405C8,r2
	mov.l	.L060405BC,r4
	shll2	r0
	add	r0,r4
	mov.l	.L060405CC,r0
	jsr	@r0
	mov.l	@r4,r4
	mov.l	r6,@-r15
	mov.l	r5,@-r15
	mov.l	r4,@-r15
	mov.l	r0,@-r15
	sts.l	pr,@-r15
	mov	#1,r5
	mov	#27,r6
	mov.l	.L060405D0,r0
	jsr	@r0
	mov	#3,r4
	lds.l	@r15+,pr
	mov.l	@r15+,r0
	mov.l	@r15+,r4
	mov.l	@r15+,r5
	mov.l	@r15+,r6
	mov.l	.L060405D4,r4
	mov.l	@r4,r4
	mov	#0,r0
	mov.l	r0,@(44,r4)
.L060405AE:
	mov.b	@(110,gbr),r0
	tst	r0,r0
	bf	.L060405D8
	lds.l	@r15+,pr
	rts
	nop
	.byte 0x00, 0x00
.L060405BC:
	.long D_060F3064
.L060405C0:
	.long 0x00280000
.L060405C4:
	.long func_060172DE
.L060405C8:
	.long 0x00040000
.L060405CC:
	.long func_0602441C
.L060405D0:
	.long func_0600E4C4
.L060405D4:
	.long D_06040538
.L060405D8:
	mov.l	.L06040628,r0
	jsr	@r0
	nop
	mov.l	@(48,r1),r4
	mov.l	@(52,r1),r5
	mov.l	.L0604062C,r0
	jsr	@r0
	mov.l	@(56,r1),r6
	mov.w	@(4,r1),r0
	shll8	r0
	mov	r0,r4
	mov	r0,r5
	mov.l	.L06040630,r14
	jsr	@r14
	mov	r0,r6
	mov.w	@(24,r1),r0
	mov.w	.L06040624,r8
	mov.l	.L06040634,r14
	jsr	@r14
	add	r8,r0
	mov.w	@(26,r1),r0
	mov.w	.L06040626,r8
	mov.l	.L06040638,r14
	jsr	@r14
	add	r8,r0
	mov.l	.L0604063C,r2
	mov.l	@(0,r2),r0
	tst	r0,r0
	bt	.L06040618
	mov.l	.L06040640,r0
	jsr	@r0
	nop
.L06040618:
	mov.l	.L06040644,r0
	jsr	@r0
	nop
	lds.l	@r15+,pr
	rts
	nop
.L06040624:
	.short 0x4000
.L06040626:
	.short 0xC000
.L06040628:
	.long func_0600CA24
.L0604062C:
	.long func_0600CBDA
.L06040630:
	.long func_0600D018
.L06040634:
	.long func_0600CAF8
.L06040638:
	.long func_0600CA7A
.L0604063C:
	.long D_06082A64
.L06040640:
	.long func_0601F4A0
.L06040644:
	.long func_0600CA4E
	endlabel func_06040554

	.section .data.06040648,"aw",@progbits
	.p2align 2
	.byte 0xE0, 0xF8, 0x02, 0x1E, 0x84, 0x21, 0x40, 0x11, 0x89, 0x06, 0xE0, 0x01, 0x80, 0x21, 0xD0, 0x01
	.byte 0x40, 0x2B, 0x00, 0x09
	.long func_0600D1A0
