	.include "macro.inc"
	.include "saturn.inc"

	.section .text.06004000,"ax",@progbits
	.p2align 2

	glabel _start
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#240,r0
	ldc	r0,sr
	mov.l	.L0600414C,r2
	mov	#16,r3
	mov.b	r3,@r2
	mov	#1,r3
	mov.b	r3,@r2
	mov.l	.L06004150,r15
	mov.l	.L06004154,r0
	ldc	r0,gbr
	mov.l	.L06004158,r2
	mov.l	.L0600415C,r7
	mov	#0,r0
.L06004024:
	mov.l	r0,@r2
	dt	r7
	bf/s	.L06004024
	add	#4,r2
	mov	#0,r0
	mov.b	r0,@(47,gbr)
	mov.b	r0,@(48,gbr)
	mov.b	r0,@(50,gbr)
	mov.b	r0,@(34,gbr)
	mov.b	r0,@(35,gbr)
	mov.w	.L06004140,r0
	mov.w	r0,@(28,gbr)
	mov	#0,r0
	mov.b	r0,@(149,gbr)
	mov	#0,r0
	mov.b	r0,@(148,gbr)
	mov.l	.L06004160,r2
	mov	#-1,r0
	mov.b	r0,@r2
	mov.l	.L06004164,r2
	mov	#0,r0
	mov	#8,r7
.L06004050:
	mov.w	r0,@r2
	dt	r7
	bf/s	.L06004050
	add	#2,r2
	mov	#-1,r0
	mov.l	.L06004168,r2
	mov.w	r0,@r2
	mov.l	.L0600416C,r2
	mov.l	.L06004170,r3
	mov.w	.L06004142,r7
.L06004064:
	mov.w	@r3+,r0
	mov.w	r0,@r2
	dt	r7
	bf/s	.L06004064
	add	#2,r2
	mov.l	.L06004174,r2
	mov.l	.L06004170,r3
	mov.w	.L06004144,r7
.L06004074:
	mov.w	@r3+,r0
	mov.w	r0,@r2
	dt	r7
	bf/s	.L06004074
	add	#2,r2
	mov.l	.L06004178,r0
	mov.l	r0,@(740,gbr)
	mov.l	.L0600417C,r8
	mov	r8,r0
	mov.l	r0,@(808,gbr)
	mov.l	@(740,gbr),r0
	add	r0,r8
	mov	r8,r0
	mov.l	r0,@(812,gbr)
	mov.l	.L06004180,r8
	mov	r8,r0
	mov.l	r0,@(816,gbr)
	mov.l	@(740,gbr),r0
	add	r0,r8
	mov	r8,r0
	mov.l	r0,@(820,gbr)
	mov.w	.L06004146,r4
	mov.l	.L06004184,r0
	jsr	@r0
	mov	#1,r5
	mov.l	.L06004188,r0
	jsr	@r0
	nop
	mov.l	.L0600418C,r0
	jsr	@r0
	nop
	mov.l	.L06004190,r2
	mov	#-1,r0
	mov.b	r0,@r2
	mov	#14,r0
	mov.b	r0,@(0,gbr)
	mov	#0,r0
	mov.l	r0,@(12,gbr)
	mov.l	r0,@(656,gbr)
	mov.l	r0,@(660,gbr)
	mov	#0,r0
	mov.b	r0,@(20,gbr)
	mov.b	r0,@(21,gbr)
	mov.b	r0,@(22,gbr)
	mov.b	r0,@(25,gbr)
	mov.l	.L06004194,r2
	mov	#0,r0
	mov.b	r0,@r2
	mov.l	.L06004198,r2
	mov	#0,r0
	mov.w	r0,@r2
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#0,r0
	ldc	r0,sr
	mov.l	.L0600419C,r0
	jsr	@r0
	nop
.L060040EE:
	mov	#0,r8
	mov.w	@(84,gbr),r0
	mov.w	.L06004148,r9
	cmp/eq	r9,r0
	bf	.L060041E2
	mov.w	@(84,gbr),r0
	exts.b	r0,r0
	cmp/pz	r0
	bt	.L060041E2
	mov.l	.L060041A0,r3
	mov.w	@r3,r0
	tst	r0,r0
	bf	.L060041E6
	mov.b	@(0,gbr),r0
	cmp/eq	#12,r0
	bt	.L0600413A
	cmp/eq	#5,r0
	bt	.L060041B0
	cmp/eq	#3,r0
	bf	.L06004120
	mov.l	.L060041A4,r1
	mov.w	@r1,r0
	tst	r0,r0
	bt	.L0600413A
	bf	.L060041B0
.L06004120:
	cmp/eq	#1,r0
	bf	.L0600412C
	mov.b	@(107,gbr),r0
	cmp/pl	r0
	bt	.L0600413A
	bf	.L060041B0
.L0600412C:
	cmp/eq	#17,r0
	bf	.L0600413A
	mov.l	.L060041A8,r4
	mov.b	@r4,r0
	mov	#4,r4
	cmp/hs	r4,r0
	bt	.L060041B0
.L0600413A:
	mov.l	.L060041AC,r0
	jmp	@r0
	nop
.L06004140:
	.short 0x02A0
.L06004142:
	.short 0x0200
.L06004144:
	.short 0x0040
.L06004146:
	.short 0x0002
.L06004148:
	.short 0x00F0
	.byte 0x00, 0x00
.L0600414C:
	.long SH2_CCR
.L06004150:
	.long BIOS_WORK_HI + 0x1C00
.L06004154:
	.long gbr_block
.L06004158:
	.long bss_start
.L0600415C:
	.long 0x00023400
.L06004160:
	.long D_060D907D
.L06004164:
	.long D_060FEF0C
.L06004168:
	.long D_002FBFFE
.L0600416C:
	.long D_0607FC00
.L06004170:
	.long D_0604EE74
.L06004174:
	.long func_060042B4
.L06004178:
	.long 0x00006000
.L0600417C:
	.long vdp1_list_buf
.L06004180:
	.long vdp1_alt_list_buf
.L06004184:
	.long func_060043CA
.L06004188:
	.long file_init
.L0600418C:
	.long load_sound_driver
.L06004190:
	.long D_060CB061
.L06004194:
	.long D_060CB000
.L06004198:
	.long D_0602E514
.L0600419C:
	.long sys_wait_vblank
.L060041A0:
	.long reset_combo_held
.L060041A4:
	.long soft_reset_allowed
.L060041A8:
	.long D_060FFF97
.L060041AC:
	.long sys_exec_dmp
.L060041B0:
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#240,r0
	ldc	r0,sr
	mov.l	.L060041FC,r0
	jsr	@r0
	nop
	mov.l	.L06004200,r0
	jsr	@r0
	mov	#1,r4
	mov	#0,r0
	mov.b	r0,@(34,gbr)
	mov	#2,r0
	mov.b	r0,@(0,gbr)
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#0,r0
	ldc	r0,sr
	mov	#1,r8
.L060041E2:
	mov.l	.L06004204,r3
	mov.w	r8,@r3
.L060041E6:
	mov.b	@(0,gbr),r0
	mov.l	.L06004208,r2
	shll2	r0
	mov.l	@(r0,r2),r0
	jsr	@r0
	nop
	mov.l	.L0600420C,r0
	jsr	@r0
	nop
	bra	.L060040EE
	nop
.L060041FC:
	.long func_06007380
.L06004200:
	.long func_060044C4
.L06004204:
	.long reset_combo_held
.L06004208:
	.long game_mode_table
.L0600420C:
	.long file_server
	endlabel _start

	.section .data.06004210,"aw",@progbits
	.p2align 2
	dlabel reset_combo_held
	.byte 0xFF, 0xFF
	dlabel soft_reset_allowed
	.byte 0x00, 0x00
	dlabel game_mode_table
	.long lbl_0602E6E4
	.long game_mode_play
	.long func_06044DEC
	.long func_0604510E
	.long func_06044DEC
	.long func_060451FE
	.long func_06033970
	.long func_060451FE
	.long func_0603C35C
	.long func_06004260
	.long func_06044DEC
	.long func_06046214
	.long func_060463C6
	.long func_0602E51E
	.long func_0604C88E
	.long run_end_program
	.long run_movie_program
	.long D_060506A4
	.long func_0604DEA0
