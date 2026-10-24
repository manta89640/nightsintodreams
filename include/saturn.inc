# Sega Saturn memory map. These are assembler constants, not linked symbols, so
# references stay plain literals the way SHC emits them for fixed addresses.
#
# `! size:N` marks a region: an address inside it is written as BASE + offset.
# Only registers whose addresses are certain get their own names; anything else
# uses its region base.

# BIOS work area and function vectors (SBL sega_sys.h)
.equ BIOS_WORK,         0x06000000  ! size:0x300
.equ SYS_SETUINT,       0x06000300
.equ SYS_GETUINT,       0x06000304
.equ SYS_SETSINT,       0x06000310
.equ SYS_GETSINT,       0x06000314
.equ SYS_CHGSYSCK,      0x06000320
.equ SYS_CHGSCUIM,      0x06000340
.equ SYS_SETSCUIM,      0x06000344
.equ SYS_GETSCUIM,      0x06000348
.equ BIOS_VECTORS,      0x06000300  ! size:0x100
.equ BIOS_WORK_HI,      0x06000400  ! size:0x3C00

# SMPC (cache-through)
.equ SMPC_REGS,         0x20100000  ! size:0x80

# CD block (A-bus CS2)
.equ CD_DATATRNS,       0x25818000  ! size:0x4
.equ CD_REGS,           0x25890000  ! size:0x8000
.equ CD_HIRQREQ,        0x25890008
.equ CD_HIRQMSK,        0x2589000C
.equ CD_CR1,            0x25890018
.equ CD_CR2,            0x2589001C
.equ CD_CR3,            0x25890020
.equ CD_CR4,            0x25890024
.equ CD_DATA,           0x25898000  ! size:0x8000

# SCSP
.equ SCSP_RAM,          0x25A00000  ! size:0x80000
.equ SCSP_REGS,         0x25B00000  ! size:0x1000

# VDP1
.equ VDP1_VRAM,         0x25C00000  ! size:0x80000
.equ VDP1_FB,           0x25C80000  ! size:0x40000
.equ VDP1_REGS,         0x25D00000  ! size:0x18
.equ VDP1_TVMR,         0x25D00000
.equ VDP1_FBCR,         0x25D00002
.equ VDP1_PTMR,         0x25D00004
.equ VDP1_EWDR,         0x25D00006
.equ VDP1_EWLR,         0x25D00008
.equ VDP1_EWRR,         0x25D0000A
.equ VDP1_ENDR,         0x25D0000C
.equ VDP1_EDSR,         0x25D00010
.equ VDP1_LOPR,         0x25D00012
.equ VDP1_COPR,         0x25D00014
.equ VDP1_MODR,         0x25D00016

# VDP2
.equ VDP2_VRAM,         0x25E00000  ! size:0x80000
.equ VDP2_CRAM,         0x25F00000  ! size:0x1000
.equ VDP2_REGS,         0x25F80000  ! size:0x120
.equ VDP2_TVMD,         0x25F80000
.equ VDP2_EXTEN,        0x25F80002
.equ VDP2_TVSTAT,       0x25F80004

# SCU
.equ SCU_REGS,          0x25FE0000  ! size:0xD0
.equ SCU_IMS,           0x25FE00A0
.equ SCU_IST,           0x25FE00A4

# Cached mirrors of the same A/B-bus regions
.equ CD_REGS_CACHED,    0x05890000  ! size:0x10000
.equ SCSP_RAM_CACHED,   0x05A00000  ! size:0x80000
.equ SCSP_REGS_CACHED,  0x05B00000  ! size:0x1000
.equ VDP1_VRAM_CACHED,  0x05C00000  ! size:0x80000
.equ VDP1_FB_CACHED,    0x05C80000  ! size:0x40000
.equ VDP1_REGS_CACHED,  0x05D00000  ! size:0x18
.equ VDP2_VRAM_CACHED,  0x05E00000  ! size:0x80000
.equ VDP2_CRAM_CACHED,  0x05F00000  ! size:0x1000
.equ VDP2_REGS_CACHED,  0x05F80000  ! size:0x120
.equ SCU_REGS_CACHED,   0x05FE0000  ! size:0xD0

# A-bus bound used by SBL's bus checks
.equ ABUS_DUMMY,        0x05900000

# SH-2 cache: associative purge area, address array, data array (cache-as-RAM)
.equ SH2_CACHE_PURGE,   0x40000000
.equ SH2_CACHE_ADDR,    0x60000000
.equ SH2_CACHE_DATA,    0xC0000000  ! size:0x1000

# SH-2 (SH7604) on-chip peripherals. These alias small negative numbers, so the
# splitter only applies them where the value is used as a memory address.
.equ ONCHIP_REGS,       0xFFFFFE00  ! size:0x200
.equ SH2_SMR,           0xFFFFFE00
.equ SH2_BRR,           0xFFFFFE01
.equ SH2_SCR,           0xFFFFFE02
.equ SH2_TDR,           0xFFFFFE03
.equ SH2_SSR,           0xFFFFFE04
.equ SH2_RDR,           0xFFFFFE05
.equ SH2_TIER,          0xFFFFFE10
.equ SH2_FTCSR,         0xFFFFFE11
.equ SH2_FRCH,          0xFFFFFE12
.equ SH2_FRCL,          0xFFFFFE13
.equ SH2_TCR,           0xFFFFFE16
.equ SH2_TOCR,          0xFFFFFE17
.equ SH2_IPRB,          0xFFFFFE60
.equ SH2_VCRA,          0xFFFFFE62
.equ SH2_VCRB,          0xFFFFFE64
.equ SH2_VCRC,          0xFFFFFE66
.equ SH2_VCRD,          0xFFFFFE68
.equ SH2_WTCSR,         0xFFFFFE80
.equ SH2_SBYCR,         0xFFFFFE91
.equ SH2_CCR,           0xFFFFFE92
.equ SH2_ICR,           0xFFFFFEE0
.equ SH2_IPRA,          0xFFFFFEE2
.equ SH2_VCRWDT,        0xFFFFFEE4
.equ SH2_DVSR,          0xFFFFFF00
.equ SH2_DVDNT,         0xFFFFFF04
.equ SH2_DVCR,          0xFFFFFF08
.equ SH2_VCRDIV,        0xFFFFFF0C
.equ SH2_DVDNTH,        0xFFFFFF10
.equ SH2_DVDNTL,        0xFFFFFF14
.equ SH2_SAR0,          0xFFFFFF80
.equ SH2_DAR0,          0xFFFFFF84
.equ SH2_TCR0,          0xFFFFFF88
.equ SH2_CHCR0,         0xFFFFFF8C
.equ SH2_SAR1,          0xFFFFFF90
.equ SH2_DAR1,          0xFFFFFF94
.equ SH2_TCR1,          0xFFFFFF98
.equ SH2_CHCR1,         0xFFFFFF9C
.equ SH2_VCRDMA0,       0xFFFFFFA0
.equ SH2_VCRDMA1,       0xFFFFFFA8
.equ SH2_DMAOR,         0xFFFFFFB0
.equ SH2_BCR1,          0xFFFFFFE0
.equ SH2_BCR2,          0xFFFFFFE4
.equ SH2_WCR,           0xFFFFFFE8
.equ SH2_MCR,           0xFFFFFFEC
.equ SH2_RTCSR,         0xFFFFFFF0
.equ SH2_RTCNT,         0xFFFFFFF4
.equ SH2_RTCOR,         0xFFFFFFF8
