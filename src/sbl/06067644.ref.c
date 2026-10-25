/* shc-flags: -define=NONMATCHING */
#include "sbl/types.h"
#include "sbl/stm_api.h"

extern void DMA_CpuStop(Sint32 ch);
extern void DMA_CpuSetComPrm(DmaCpuComPrm *prm);
extern void DMA_CpuSetPrm(DmaCpuPrm *prm, Sint32 ch);
extern void DMA_CpuStart(Sint32 ch);

/* Destination and byte size of the transfer, for dma_cpu0_check's cache purge. */
Uint32 dma_cpu0_dst;
Uint32 dma_cpu0_size;

#ifdef NONMATCHING
/* SHC 5.0 fills both jsr delay slots with the `add #n,r4` of &com/&prm; the target leaves nops. */
/* Copy cnt longwords from src to dst with CPU DMA channel 0 (auto-request, both incrementing). */
void dma_cpu0_start(Uint32 dst, Uint32 src, Uint32 cnt)
{
    DmaCpuComPrm com;
    DmaCpuPrm prm;

    DMA_CpuStop(0);
    com.pr = 0;
    com.dme = 1;
    com.msk = 15;
    DMA_CpuSetComPrm(&com);
    prm.sar = src;
    prm.dar = dst;
    prm.tcr = cnt;
    prm.dm = 1;
    prm.sm = 1;
    prm.ts = 0x800;
    prm.ar = 0x200;
    prm.ie = 0;
    prm.msk = 0x2FF;
    DMA_CpuSetPrm(&prm, 0);
    DMA_CpuStart(0);
    dma_cpu0_dst = dst;
    dma_cpu0_size = cnt << 2;
}
#endif
