/* sbl/060676D4: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is 060676D4.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.060676D4");

void dma_cpu0_check(void)
{
    push(pr);
    r15 += -8;
    r3 = &DMA_CpuGetComStatus;
    r4 = r15;
    (*r3)();
    r0 = *(s32 *)r15;
    if (r0 == 4) {
        r15 += 8;
        pop(pr);
        return slot(r0 = 1);
        __nopool;
    }
    r2 = &DMA_CpuGetStatus;
    (*r2)() slot(r4 = 0);
    r4 = r0;
    if (!r4) {
        r15 += 8;
        pop(pr);
        return slot(r0 = 2);
        __nopool;
    }
    r3 = &dma_cpu0_size;
    r2 = &dma_cpu0_dst;
    r5 = *(s32 *)r3;
    r1 = &CSH_Purge;
    (*r1)() slot(r4 = *(s32 *)r2);
    r0 = 0;
    r15 += 8;
    pop(pr);
    return;
}

