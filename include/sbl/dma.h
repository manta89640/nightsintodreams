#ifndef SBL_DMA_H
#define SBL_DMA_H

#include "sbl/types.h"

/* SH-2 on-chip DMAC registers. Channel registers are 0x10 bytes apart. */
#define DMA_SAR_ADR(ch)   (0xFFFFFF80 + (ch) * 0x10)
#define DMA_DAR_ADR(ch)   (0xFFFFFF84 + (ch) * 0x10)
#define DMA_TCR_ADR(ch)   (0xFFFFFF88 + (ch) * 0x10)
#define DMA_CHCR_ADR(ch)  (0xFFFFFF8C + (ch) * 0x10)
#define DMA_DRCR_ADR(ch)  (0xFFFFFE71 + (ch))
#define DMA_DMAOR_ADR     0xFFFFFFB0

typedef struct {
    Uint32 pr;
    Uint32 dme;
    Uint32 msk;
} DmaCpuComPrm;

typedef struct {
    Uint32 sar;
    Uint32 dar;
    Uint32 tcr;
    Uint32 dm;
    Uint32 sm;
    Uint32 ts;
    Uint32 ar;
    Uint32 ie;
    Uint32 drcr;
    Uint32 msk;
} DmaCpuPrm;

typedef struct {
    Uint32 ae;
    Uint32 nmif;
} DmaCpuComStatus;

#endif
