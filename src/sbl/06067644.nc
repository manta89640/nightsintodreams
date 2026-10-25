/* sbl/06067644: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is 06067644.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.06067644");

void dma_cpu0_start(void)
{
    push(r14);
    push(pr);
    r3 = &DMA_CpuStop;
    r15 += -64;
    *(s32 *)(r15 + 4) = r4;
    *(s32 *)(r15 + 8) = r5;
    *(s32 *)r15 = r6;
    (*r3)() slot(r4 = 0);
    r2 = 0;
    *(s32 *)(r15 + 52) = r2;
    r14 = 1;
    *(s32 *)(r15 + 56) = r14;
    r3 = 15;
    *(s32 *)(r15 + 60) = r3;
    r4 = r15;
    r3 = &DMA_CpuSetComPrm;
    r4 += 52;
    (*r3)();
    r2 = *(s32 *)(r15 + 8);
    r4 = r15;
    *(s32 *)(r15 + 12) = r2;
    r4 += 12;
    r3 = *(s32 *)(r15 + 4);
    *(s32 *)(r15 + 16) = r3;
    r2 = *(s32 *)r15;
    *(s32 *)(r15 + 20) = r2;
    *(s32 *)(r15 + 24) = r14;
    *(s32 *)(r15 + 28) = r14;
    r3 = 0x0800;
    *(s32 *)(r15 + 32) = r3;
    r2 = 0x0200;
    r3 = 0;
    *(s32 *)(r15 + 36) = r2;
    r5 = r3;
    *(s32 *)(r15 + 40) = r3;
    r2 = 0x02FF;
    r3 = &DMA_CpuSetPrm;
    *(s32 *)(r15 + 48) = r2;
    (*r3)();
    r2 = &DMA_CpuStart;
    (*r2)() slot(r4 = 0);
    r3 = *(s32 *)(r15 + 4);
    r2 = &dma_cpu0_dst;
    *(s32 *)r2 = r3;
    r1 = *(s32 *)r15;
    r1 <<= 2;
    r3 = &dma_cpu0_size;
    *(s32 *)r3 = r1;
    r15 += 64;
    pop(pr);
    return slot(pop(r14));
}

