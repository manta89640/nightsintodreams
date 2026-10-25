	.include "macro.inc"
	.include "saturn.inc"

	.section .text.0600CF6C,"ax",@progbits
	.p2align 2

	glabel func_0600CF6C
	mov.l	@(4,r2),r9
	mov.l	@(20,r2),r10
	mov.l	.L0600D010,r7
	mov.l	@r7+,r8
	mov.l	.L0600D014,r5
	mov	r5,r11
	mov.l	@(120,gbr),r0
	mov	r0,r6
	add	#32,r6
.L0600CF7E:
	clrmac
	mac.l	@r10+,@r6+
	mac.l	@r10+,@r6+
	mac.l	@r10+,@r6+
	add	#-28,r6
	add	#-12,r10
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	mov.l	r4,@-r11
	clrmac
	mac.l	@r10+,@r6+
	mac.l	@r10+,@r6+
	mac.l	@r10+,@r6+
	add	#-28,r6
	add	#-12,r10
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	mov.l	r4,@-r11
	clrmac
	mac.l	@r10+,@r6+
	mac.l	@r10+,@r6+
	mac.l	@r10+,@r6+
	add	#20,r6
	sts	mach,r0
	sts	macl,r4
	xtrct	r0,r4
	mov.l	r4,@-r11
	clrmac
	mac.l	@r7+,@r11+
	mac.l	@r7+,@r11+
	mac.l	@r7+,@r11+
	add	#-12,r7
	sts	mach,r4
	sts	macl,r0
	xtrct	r4,r0
	shlr8	r0
	shlr2	r0
	exts.w	r0,r0
	add	#62,r0
	cmp/pz	r0
	bt	.L0600CFD6
	mov	#0,r0
.L0600CFD6:
	and	#126,r0
	mov.w	@(r0,r8),r0
	mov.w	r0,@r5
	add	#2,r5
	dt	r9
	bf/s	.L0600CF7E
	nop
	mov.l	@(112,gbr),r0
	mov	r0,r11
	mov.l	@(8,r2),r10
	mov.l	@(12,r2),r9
	shll2	r9
	mov.l	.L0600D014,r5
.L0600CFF0:
	mov.w	@r10+,r0
	cmp/pz	r0
	bt	.L0600CFFA
	neg	r0,r0
	add	#-8,r0
.L0600CFFA:
	shlr2	r0
	mov.w	@(r0,r5),r0
	mov.w	r0,@r11
	add	#2,r11
	dt	r9
	bf/s	.L0600CFF0
	nop
	mov	r11,r0
	mov.l	r0,@(112,gbr)
	rts
	nop
.L0600D010:
	.long D_0600CD50
.L0600D014:
	.long D_0600CD6C
	endlabel func_0600CF6C

	glabel func_0600D018
	mov.l	@(120,gbr),r0
	mov.l	@(0,r0),r2
	dmuls.l	r4,r2
	mov.l	@(4,r0),r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r5,r7
	xtrct	r2,r3
	mov.l	r3,@(0,r0)
	mov.l	@(8,r0),r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r6,r7
	xtrct	r2,r3
	mov.l	r3,@(4,r0)
	mov.l	@(16,r0),r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r4,r7
	xtrct	r2,r3
	mov.l	r3,@(8,r0)
	mov.l	@(20,r0),r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r5,r7
	xtrct	r2,r3
	mov.l	r3,@(16,r0)
	mov.l	@(24,r0),r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r6,r7
	xtrct	r2,r3
	mov.l	r3,@(20,r0)
	mov.l	@(32,r0),r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r4,r7
	xtrct	r2,r3
	mov.l	r3,@(24,r0)
	mov.l	@(36,r0),r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r5,r7
	xtrct	r2,r3
	mov.l	r3,@(32,r0)
	mov.l	@(40,r0),r7
	sts	mach,r2
	sts	macl,r3
	dmuls.l	r6,r7
	xtrct	r2,r3
	mov.l	r3,@(36,r0)
	sts	mach,r2
	sts	macl,r3
	xtrct	r2,r3
	rts
	mov.l	r3,@(40,r0)
	endlabel func_0600D018

	glabel func_0600D088
	mov	#0,r2
	mov.l	.L0600D0C0,r1
	mov	#8,r7
.L0600D08E:
	mov.l	r2,@r1
	mov.l	r1,@(4,r1)
	add	#8,r1
	add	#-8,r2
	dt	r7
	bf	.L0600D08E
	mov	#0,r2
	mov.l	.L0600D0C4,r1
	mov.l	r2,@r1
	mov.l	.L0600D0C8,r0
	mov	r0,r1
	mov.l	.L0600D0CC,r2
	mov.l	r0,@r2
	mov.w	.L0600D0BC,r3
	mov.w	.L0600D0BE,r7
.L0600D0AC:
	mov	r0,r1
	add	r3,r0
	mov.l	r0,@(0,r1)
	dt	r7
	bf	.L0600D0AC
	mov	#-1,r2
	rts
	mov.l	r2,@(0,r1)
.L0600D0BC:
	.short 0x0060
.L0600D0BE:
	.short 0x0180
.L0600D0C0:
	.long D_060FFFA0
.L0600D0C4:
	.long D_060FFFE4
.L0600D0C8:
	.long D_060D0000
.L0600D0CC:
	.long D_060FFFE0
	endlabel func_0600D088

	glabel func_0600D0D0
	mov.l	.L0600D12C,r8
	mov.l	@r8,r3
	cmp/pl	r3
	bf	.L0600D134
	mov.l	@(0,r3),r0
	mov.l	r0,@r8
	mov.l	@(4,r2),r8
	mov.l	r8,@(4,r3)
	mov.l	@(0,r8),r0
	cmp/pl	r0
	bf/s	.L0600D0EA
	mov.l	r0,@(0,r3)
	mov.l	r3,@(4,r0)
.L0600D0EA:
	mov.l	r3,@(0,r8)
	mov.l	r3,@(4,r2)
	mov	#0,r0
	mov.l	r0,@(8,r3)
	mov	r3,r8
	add	#96,r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	r0,@-r8
	mov.l	.L0600D130,r8
	mov.l	@r8,r0
	add	#1,r0
	mov.l	r0,@r8
	rts
	clrt
	.byte 0x00, 0x00
.L0600D12C:
	.long D_060FFFE0
.L0600D130:
	.long D_060FFFE4
.L0600D134:
	mov.l	.L0600D13C,r3
	rts
	sett
	.byte 0x00, 0x00
.L0600D13C:
	.long D_0600D140
	endlabel func_0600D0D0

	.section .data.0600D140,"aw",@progbits
	.p2align 2
	dlabel D_0600D140
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
