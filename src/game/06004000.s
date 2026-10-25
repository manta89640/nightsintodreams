	.include "macro.inc"
	.include "saturn.inc"
	.include "game/core.inc"

	.section .text.06004000,"ax",@progbits
	.p2align 2

! Entry point (1st Read). Sets up the CPU, GBR and the globals, then runs
! the main loop: each pass calls the handler of GBR_GAME_MODE from
! game_mode_table and services the CD.
!
! A + B + C + Start (GBR_PAD1_RAW_HELD = 0x00F0) either returns to the BIOS
! (sys_exec_dmp) or soft-resets the game (game mode 2), depending on the mode;
! reset_combo_held keeps one press from acting twice.
	glabel _start
	mov	#-1,r0			! mask all interrupts
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#240,r0
	ldc	r0,sr
	mov.l	.L0600414C,r2		! purge and enable the cache
	mov	#16,r3
	mov.b	r3,@r2
	mov	#1,r3
	mov.b	r3,@r2
	mov.l	.L06004150,r15
	mov.l	.L06004154,r0
	ldc	r0,gbr
	mov.l	.L06004158,r2		! clear the rest of High Work RAM
	mov.l	.L0600415C,r7
	mov	#0,r0
.Lclear_ram:
	mov.l	r0,@r2
	dt	r7
	bf/s	.Lclear_ram
	add	#4,r2
	mov	#0,r0
	mov.b	r0,@(GBR_VDP1_ALT_STATE,gbr)
	mov.b	r0,@(GBR_VDP1_ALT_SRC,gbr)
	mov.b	r0,@(GBR_UNK_32,gbr)
	mov.b	r0,@(GBR_LOADING,gbr)
	mov.b	r0,@(GBR_HUD_OFF,gbr)
	mov.w	.L06004140,r0
	mov.w	r0,@(GBR_DEBUG_FLAGS,gbr)
	mov	#0,r0
	mov.b	r0,@(GBR_DEBUG_OPTS,gbr)
	mov	#0,r0
	mov.b	r0,@(GBR_RELEASE_ACTIVE_CAM,gbr)
	mov.l	.L06004160,r2
	mov	#-1,r0
	mov.b	r0,@r2
	mov.l	.L06004164,r2
	mov	#0,r0
	mov	#8,r7
.Lclear_words:
	mov.w	r0,@r2
	dt	r7
	bf/s	.Lclear_words
	add	#2,r2
	mov	#-1,r0
	mov.l	.L06004168,r2
	mov.w	r0,@r2
	mov.l	.L0600416C,r2
	mov.l	.L06004170,r3
	mov.w	.L06004142,r7
.Lcopy_gradient:
	mov.w	@r3+,r0
	mov.w	r0,@r2
	dt	r7
	bf/s	.Lcopy_gradient
	add	#2,r2
	mov.l	.L06004174,r2		! the split takes this colour buffer for code
	mov.l	.L06004170,r3
	mov.w	.L06004144,r7
.Lcopy_gradient2:
	mov.w	@r3+,r0
	mov.w	r0,@r2
	dt	r7
	bf/s	.Lcopy_gradient2
	add	#2,r2
	mov.l	.L06004178,r0
	mov.l	r0,@(GBR_VDP1_AREA_SIZE,gbr)
	mov.l	.L0600417C,r8
	mov	r8,r0
	mov.l	r0,@(GBR_VDP1_LIST0,gbr)
	mov.l	@(GBR_VDP1_AREA_SIZE,gbr),r0
	add	r0,r8
	mov	r8,r0
	mov.l	r0,@(GBR_VDP1_LIST1,gbr)
	mov.l	.L06004180,r8
	mov	r8,r0
	mov.l	r0,@(GBR_VDP1_ALT0,gbr)
	mov.l	@(GBR_VDP1_AREA_SIZE,gbr),r0
	add	r0,r8
	mov	r8,r0
	mov.l	r0,@(GBR_VDP1_ALT1,gbr)
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
	mov.b	r0,@(GBR_GAME_MODE,gbr)
	mov	#0,r0
	mov.l	r0,@(GBR_TICK_COUNT,gbr)
	mov.l	r0,@(GBR_SCORE,gbr)
	mov.l	r0,@(GBR_SCORE+4,gbr)
	mov	#0,r0
	mov.b	r0,@(GBR_STAGE,gbr)
	mov.b	r0,@(GBR_NEXT_STAGE,gbr)
	mov.b	r0,@(GBR_DREAM,gbr)
	mov.b	r0,@(GBR_BOSS_STAGE,gbr)
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
	or	#0,r0			! unmask interrupts
	ldc	r0,sr
	mov.l	.L0600419C,r0
	jsr	@r0
	nop
.Lmain_loop:
	mov	#0,r8
	mov.w	@(GBR_PAD1_RAW_HELD,gbr),r0
	mov.w	.L06004148,r9
	cmp/eq	r9,r0
	bf	.Lreset_combo_seen
	mov.w	@(GBR_PAD1_RAW_HELD,gbr),r0
	exts.b	r0,r0
	cmp/pz	r0
	bt	.Lreset_combo_seen
	mov.l	.L060041A0,r3
	mov.w	@r3,r0
	tst	r0,r0
	bf	.Lrun_mode
	mov.b	@(GBR_GAME_MODE,gbr),r0	! modes 5, 3 (if allowed), 1 (unless a
	cmp/eq	#12,r0			! demo) and 17 (late in a movie) reset
	bt	.Lexit_to_bios
	cmp/eq	#5,r0
	bt	.Lsoft_reset
	cmp/eq	#3,r0
	bf	.L06004120
	mov.l	.L060041A4,r1
	mov.w	@r1,r0
	tst	r0,r0
	bt	.Lexit_to_bios
	bf	.Lsoft_reset
.L06004120:
	cmp/eq	#1,r0
	bf	.L0600412C
	mov.b	@(GBR_DEMO_MODE,gbr),r0
	cmp/pl	r0
	bt	.Lexit_to_bios
	bf	.Lsoft_reset
.L0600412C:
	cmp/eq	#17,r0
	bf	.Lexit_to_bios
	mov.l	.L060041A8,r4
	mov.b	@r4,r0
	mov	#4,r4
	cmp/hs	r4,r0
	bt	.Lsoft_reset
.Lexit_to_bios:
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
.Lsoft_reset:
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
	mov.b	r0,@(GBR_LOADING,gbr)
	mov	#2,r0
	mov.b	r0,@(GBR_GAME_MODE,gbr)
	mov	#-1,r0
	and	#15,r0
	mov	r0,r14
	stc	sr,r0
	and	r14,r0
	or	#0,r0
	ldc	r0,sr
	mov	#1,r8
.Lreset_combo_seen:
	mov.l	.L06004204,r3
	mov.w	r8,@r3
.Lrun_mode:
	mov.b	@(GBR_GAME_MODE,gbr),r0
	mov.l	.L06004208,r2
	shll2	r0
	mov.l	@(r0,r2),r0
	jsr	@r0
	nop
	mov.l	.L0600420C,r0
	jsr	@r0
	nop
	bra	.Lmain_loop
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
	.short	-1
	dlabel soft_reset_allowed	! in game mode 3
	.short	0
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
