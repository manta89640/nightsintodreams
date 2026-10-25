/* shc-flags: -define=NONMATCHING */
#include "sbl/types.h"
#include "sbl/stm_api.h"

extern void DMA_CpuGetComStatus(DmaCpuComStatus *st);
extern Sint32 DMA_CpuGetStatus(Sint32 ch);
extern void CSH_Purge(void *adr, Uint32 size);

extern Uint32 dma_cpu0_dst;
extern Uint32 dma_cpu0_size;

#ifdef NONMATCHING
/* SHC 5.0 puts `mov r15,r4` in the jsr delay slot and loads the CSH_Purge arguments in the
   other order; the target leaves a nop and loads dma_cpu0_size first. */
/* Poll dma_cpu0_start's transfer: 1 address error, 2 still running, 0 done (the destination
   is purged from the cache). */
Sint32 dma_cpu0_check(void)
{
    DmaCpuComStatus st;
    Sint32 end;

    DMA_CpuGetComStatus(&st);
    if (st.ae == 4) {
        return 1;
    }
    end = DMA_CpuGetStatus(0);
    if (end == 0) {
        return 2;
    }
    CSH_Purge((void *)dma_cpu0_dst, dma_cpu0_size);
    return 0;
}
#endif
