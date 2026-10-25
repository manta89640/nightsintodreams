/*
 * Hardware layouts reached through a base register (saturn.inc has the
 * absolute addresses). Offsets from a register block end in _OFS.
 */

! VDP1 command table entry (32 bytes, in VDP1 VRAM or a WRAM copy)
.equ VCMD_CTRL,         0x00
.equ VCMD_LINK,         0x02
.equ VCMD_PMOD,         0x04
.equ VCMD_COLR,         0x06
.equ VCMD_SRCA,         0x08
.equ VCMD_SIZE,         0x0A
.equ VCMD_XA,           0x0C
.equ VCMD_YA,           0x0E
.equ VCMD_XB,           0x10
.equ VCMD_YB,           0x12
.equ VCMD_XC,           0x14
.equ VCMD_YC,           0x16
.equ VCMD_XD,           0x18
.equ VCMD_YD,           0x1A
.equ VCMD_GRDA,         0x1C
.equ VCMD_LEN,          0x20

! SCU DMA level 0 registers, from SCU_REGS (level n at + 0x20 * n)
.equ SCU_D0R_OFS,       0x00    ! read address
.equ SCU_D0W_OFS,       0x04    ! write address
.equ SCU_D0C_OFS,       0x08    ! byte count
.equ SCU_D0AD_OFS,      0x0C    ! address add values
.equ SCU_D0EN_OFS,      0x10    ! enable / start
.equ SCU_D0MD_OFS,      0x14    ! mode
.equ SCU_DSTA_OFS,      0x7C    ! DMA status

! SMPC registers, from SMPC_REGS
.equ SMPC_COMREG_OFS,   0x1F    ! command
.equ SMPC_SF_OFS,       0x63    ! status flag: 1 while a command runs
.equ SMPC_SNDON,        0x06
.equ SMPC_SNDOFF,       0x07
