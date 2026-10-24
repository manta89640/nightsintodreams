#ifndef SBL_DMA_SCU_H
#define SBL_DMA_SCU_H

#include "sbl/types.h"

typedef struct {
    Uint32 dxr;     /* read address */
    Uint32 dxw;     /* write address */
    Uint32 dxc;     /* transfer count */
    Uint32 dxad_r;  /* read address add value (already in position) */
    Uint32 dxad_w;  /* write address add value */
    Uint32 dxmod;   /* mode */
    Uint32 dxrup;   /* read address update */
    Uint32 dxwup;   /* write address update */
    Uint32 dxft;    /* start factor */
    Uint32 msk;     /* which of dxr/dxw to set (bit 0, bit 1) */
} DmaScuPrm;

typedef struct {
    Uint32 dxmv;    /* transfer in progress */
} DmaScuStatus;

#define DMA_SCU_MSK_DXR 1
#define DMA_SCU_MSK_DXW 2

void DMA_ScuSetPrm(DmaScuPrm *prm, Uint32 ch);
void DMA_ScuStart(Uint32 ch);
void DMA_ScuGetStatus(DmaScuStatus *status, Uint32 ch);

#endif
