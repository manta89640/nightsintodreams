#include "sbl/types.h"
#include "sbl/dma.h"

/* NONMATCHING: target tests mask bits with the constant in r7 (and r7,r3; cmp/eq r7,r3), SHC 5.0 uses and #imm,r0 */
void DMA_CpuSetComPrm(DmaCpuComPrm *prm)
{
    Uint32 *dmaor;
    Uint32 reg;

    dmaor = (Uint32 *)DMA_DMAOR_ADR;
    reg = *dmaor;
    if ((prm->msk & 0x01) == 0x01) {
        reg = reg & ~0x08;
        reg = reg | prm->pr;
    }
    if ((prm->msk & 0x08) == 0x08) {
        reg = reg & ~0x01;
        reg = reg | prm->dme;
    }
    if ((prm->msk & 0x02) == 0x02) {
        reg = reg & ~0x04;
    }
    if ((prm->msk & 0x04) == 0x04) {
        reg = reg & ~0x02;
    }
    *dmaor = reg;
}

/* NONMATCHING: target tests mask bits with the constant in r7 (and r7,r3; cmp/eq r7,r3), SHC 5.0 uses and #imm,r0; field and constant loads also swap registers */
void DMA_CpuSetPrm(DmaCpuPrm *prm, Uint32 ch)
{
    Uint32 *chcr;
    Uint32 reg;

    if ((prm->msk & 0x001) == 0x001) {
        *(Uint32 *)DMA_SAR_ADR(ch) = prm->sar;
    }
    if ((prm->msk & 0x002) == 0x002) {
        *(Uint32 *)DMA_DAR_ADR(ch) = prm->dar;
    }
    if ((prm->msk & 0x004) == 0x004) {
        *(Uint32 *)DMA_TCR_ADR(ch) = prm->tcr;
    }
    chcr = (Uint32 *)DMA_CHCR_ADR(ch);
    reg = *chcr;
    if ((prm->msk & 0x008) == 0x008) {
        reg = reg & 0xFFFF3FFF;
        reg = reg | (prm->dm << 14);
    }
    if ((prm->msk & 0x010) == 0x010) {
        reg = reg & 0xFFFFCFFF;
        reg = reg | (prm->sm << 12);
    }
    if ((prm->msk & 0x020) == 0x020) {
        reg = reg & 0xFFFFF3FF;
        reg = reg | prm->ts;
    }
    if ((prm->msk & 0x040) == 0x040) {
        reg = reg & 0xFFFFFDFF;
        reg = reg | prm->ar;
    }
    reg = reg & ~0x10;
    reg = reg & ~0x08;
    if ((prm->msk & 0x080) == 0x080) {
        reg = reg & ~0x04;
        reg = reg | prm->ie;
    }
    if ((prm->msk & 0x200) == 0x200) {
        reg = reg & ~0x02;
    }
    *chcr = reg;
    if ((prm->msk & 0x100) == 0x100) {
        if (prm->drcr == 1 || prm->drcr == 2) {
            *(Uint8 *)DMA_DRCR_ADR(ch) = prm->drcr;
        }
    }
}

/* NONMATCHING: SHC 5.0 loads #1 after the CHCR read here (tie-break that depends on the code before it) */
void DMA_CpuStart(Uint32 ch)
{
    Uint32 *chcr;
    Uint32 reg;

    chcr = (Uint32 *)DMA_CHCR_ADR(ch);
    reg = *chcr;
    reg |= 0x01;
    *chcr = reg;
}

void DMA_CpuStop(Uint32 ch)
{
    Uint32 *chcr;
    Uint32 reg;

    chcr = (Uint32 *)DMA_CHCR_ADR(ch);
    reg = *chcr;
    reg = reg & ~0x01;
    *chcr = reg;
}

void DMA_CpuAllStop(void)
{
    Uint32 *dmaor;
    Uint32 reg;

    dmaor = (Uint32 *)DMA_DMAOR_ADR;
    reg = *dmaor;
    reg = reg & ~0x01;
    *dmaor = reg;
}

void DMA_CpuGetComStatus(DmaCpuComStatus *status)
{
    Uint32 *dmaor;
    Uint32 reg;

    dmaor = (Uint32 *)DMA_DMAOR_ADR;
    reg = *dmaor;
    status->ae = 0x04 & reg;
    status->nmif = reg & 0x02;
}

Uint32 DMA_CpuGetStatus(Uint32 ch)
{
    Uint32 *chcr;
    Uint32 reg;

    chcr = (Uint32 *)DMA_CHCR_ADR(ch);
    reg = *chcr;
    return reg & 0x02;
}
