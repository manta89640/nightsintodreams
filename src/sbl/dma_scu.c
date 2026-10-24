#include <machine.h>
#include "sbl/types.h"
#include "sbl/dma_scu.h"
#include "sbl/int.h"

/* SCU DMA registers of level ch (0x20 apart). */
#define SCU_DMA_BASE 0x25FE0000
#define SCU_DXR(off)  (*(volatile Uint32 *)(SCU_DMA_BASE + 0x00 + (off)))
#define SCU_DXW(off)  (*(volatile Uint32 *)(SCU_DMA_BASE + 0x04 + (off)))
#define SCU_DXC(off)  (*(volatile Uint32 *)(SCU_DMA_BASE + 0x08 + (off)))
#define SCU_DXAD(off) (*(volatile Uint32 *)(SCU_DMA_BASE + 0x0C + (off)))
#define SCU_DXEN(off) (*(volatile Uint32 *)(SCU_DMA_BASE + 0x10 + (off)))
#define SCU_DXMD(off) (*(volatile Uint32 *)(SCU_DMA_BASE + 0x14 + (off)))

/* BIOS: set/get the handler of an SH-2 interrupt vector. */
#define SYS_SETSINT(n, f) ((**(void (**)(Uint32, void *))0x06000310)((n), (f)))
#define SYS_GETSINT(n)    ((**(void *(**)(Uint32))0x06000314)(n))

/* Interrupt vectors of the SCU DMA level 0/1/2 end interrupts. */
#define VEC_DMA0 0x4B
#define VEC_DMA1 0x4A
#define VEC_DMA2 0x49

extern void (*dma_scu_save_func[3])(void);  /* SCU table entries replaced while a DMA runs */
extern void *dma_scu_save_sint[3];   /* vector handlers replaced while a DMA runs */
extern volatile Uint8 dma_scu_busy[3];

void dma_ScuEnd0(void);
void dma_ScuEnd1(void);
void dma_ScuEnd2(void);

/* NONMATCHING: the original keeps the offset in r14 and the masks 1 and 2 in
 * registers (and/cmp/eq rn); SHC 5 tests them with and #imm,r0. */
void DMA_ScuSetPrm(DmaScuPrm *prm, Uint32 ch)
{
    Uint32 off = ch << 5;

    if ((prm->msk & DMA_SCU_MSK_DXR) == DMA_SCU_MSK_DXR) {
        SCU_DXR(off) = prm->dxr;
    }
    if ((prm->msk & DMA_SCU_MSK_DXW) == DMA_SCU_MSK_DXW) {
        SCU_DXW(off) = prm->dxw;
    }
    SCU_DXC(off) = prm->dxc;
    SCU_DXAD(off) = prm->dxad_r | prm->dxad_w;
    SCU_DXMD(off) = (prm->dxrup << 16) | prm->dxmod | (prm->dxwup << 8) | prm->dxft;
}

/* NONMATCHING: same code, scheduled differently (the original pushes the
 * saved registers first and loads pool constants earlier). */
void DMA_ScuStart(Uint32 ch)
{
    Sint32 imask;
    Uint32 vec;
    void (*func)(void);

    imask = get_imask();
    set_imask(15);
    switch (ch) {
    case 0:
        func = dma_ScuEnd0;
        vec = VEC_DMA0;
        break;
    case 1:
        func = dma_ScuEnd1;
        vec = VEC_DMA1;
        break;
    case 2:
        func = dma_ScuEnd2;
        vec = VEC_DMA2;
        break;
    }
    dma_scu_save_func[ch] = INT_GetScuFunc(vec);
    dma_scu_save_sint[ch] = SYS_GETSINT(vec);
    dma_scu_busy[ch] = 1;
    INT_SetScuFunc(vec, func);
    SYS_SETSINT(vec, 0);
    SCU_DXEN(ch << 5) = 0x101;
    set_imask(imask);
}

void DMA_ScuGetStatus(DmaScuStatus *status, Uint32 ch)
{
    Sint32 imask;

    imask = get_imask();
    set_imask(15);
    status->dxmv = dma_scu_busy[ch];
    set_imask(imask);
}

/* End of a level 0/1/2 transfer: clear the busy flag and put back the
 * handlers DMA_ScuStart replaced.
 * NONMATCHING: the original keeps the flag pointer on the stack instead of in
 * r14, and schedules the pool loads differently. */
void dma_ScuEnd0(void)
{
    Sint32 imask;
    volatile Uint8 *busy;

    imask = get_imask();
    set_imask(15);
    busy = &dma_scu_busy[0];
    *busy = 0;
    INT_SetScuFunc(VEC_DMA0, dma_scu_save_func[0]);
    SYS_SETSINT(VEC_DMA0, dma_scu_save_sint[0]);
    *busy = 0;
    set_imask(imask);
}

void dma_ScuEnd1(void)
{
    Sint32 imask;
    volatile Uint8 *busy;

    imask = get_imask();
    set_imask(15);
    busy = &dma_scu_busy[1];
    *busy = 0;
    INT_SetScuFunc(VEC_DMA1, dma_scu_save_func[1]);
    SYS_SETSINT(VEC_DMA1, dma_scu_save_sint[1]);
    *busy = 0;
    set_imask(imask);
}

void dma_ScuEnd2(void)
{
    Sint32 imask;
    volatile Uint8 *busy;

    imask = get_imask();
    set_imask(15);
    busy = &dma_scu_busy[2];
    *busy = 0;
    INT_SetScuFunc(VEC_DMA2, dma_scu_save_func[2]);
    SYS_SETSINT(VEC_DMA2, dma_scu_save_sint[2]);
    *busy = 0;
    set_imask(imask);
}
