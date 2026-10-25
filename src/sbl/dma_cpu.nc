/* sbl/dma_cpu: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is dma_cpu.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.060684BC");

void DMA_CpuSetComPrm(void)
{
    r3 = *(s32 *)(r4 + 8);
    r6 = -80;
    r7 = 1;
    r3 &= r7;
    if (r3 == r7) slot(r5 = *(s32 *)r6) {
        r3 = -9;
        r2 = *(s32 *)r4;
        r5 &= r3;
        r5 |= r2;
    }
    r7 = 8;
    r3 = *(s32 *)(r4 + 8);
    r3 &= r7;
    if (r3 == r7) slot(r7 = 2) {
        r3 = -2;
        r2 = *(s32 *)(r4 + 4);
        r5 &= r3;
        r5 |= r2;
    }
    r3 = *(s32 *)(r4 + 8);
    r3 &= r7;
    if (r3 == r7) slot(r7 = 4) {
        r3 = -5;
        r5 &= r3;
    }
    r2 = *(s32 *)(r4 + 8);
    r2 &= r7;
    if (r2 == r7) {
        r2 = -3;
        r5 &= r2;
    }
    return slot(*(s32 *)r6 = r5);
}

void DMA_CpuSetPrm(void)
{
    r3 = *(s32 *)(r4 + 36);
    r7 = 1;
    r6 = r5;
    r6 <<= 2;
    r3 &= r7;
    if (r3 == r7) slot(r6 <<= 2) {
        r2 = *(s32 *)r4;
        r3 = r6;
        r3 += -128;
        *(s32 *)r3 = r2;
    }
    r3 = *(s32 *)(r4 + 36);
    r7 = 2;
    r3 &= r7;
    if (r3 == r7) slot(r7 = 4) {
        r2 = *(s32 *)(r4 + 4);
        r3 = r6;
        r3 += -124;
        *(s32 *)r3 = r2;
    }
    r3 = *(s32 *)(r4 + 36);
    r3 &= r7;
    if (r3 == r7) slot(r7 = r6) {
        r3 = r6;
        r2 = *(s32 *)(r4 + 8);
        r3 += -120;
        *(s32 *)r3 = r2;
    }
    r7 += -116;
    r0 = *(s32 *)(r4 + 36);
    r0 &= 8;
    if (r0 == 8) slot(r6 = *(s32 *)r7) {
        r2 = 0xFFFF3FFF;
        r3 = *(s32 *)(r4 + 12);
        r6 &= r2;
        r3 <<= 8;
        r3 <<= 2;
        r3 <<= 2;
        r3 <<= 2;
        r6 |= r3;
    }
    r0 = *(s32 *)(r4 + 36);
    r0 &= 16;
    if (r0 == 16) slot(r0 = *(s32 *)(r4 + 36)) {
        r3 = __w(0xCFFF);
        r6 &= r3;
        r2 = *(s32 *)(r4 + 16);
        r2 <<= 8;
        r2 <<= 2;
        r2 <<= 2;
        r6 |= r2;
    }
    r0 &= 32;
    if (r0 == 32) slot(r0 = *(s32 *)(r4 + 36)) {
        r2 = __w(0xF3FF);
        r3 = *(s32 *)(r4 + 20);
        r6 &= r2;
        r6 |= r3;
    }
    r0 &= 64;
    if (r0 == 64) {
        r3 = __w(0xFDFF);
        r6 &= r3;
        r2 = *(s32 *)(r4 + 24);
        r6 |= r2;
    }
    r0 = *(s32 *)(r4 + 36);
    r3 = -17;
    r1 = 0x0080;
    r2 = -9;
    r6 &= r3;
    r0 &= 128;
    if (r0 == r1) slot(r6 &= r2) {
        r0 = -5;
        r3 = *(s32 *)(r4 + 28);
        r6 &= r0;
        r6 |= r3;
    }
    r3 = 0x0200;
    r2 = *(s32 *)(r4 + 36);
    r2 &= r3;
    if (r2 == r3) {
        r2 = -3;
        r6 &= r2;
    }
    *(s32 *)r7 = r6;
    r6 = 0x0100;
    r3 = *(s32 *)(r4 + 36);
    r3 &= r6;
    if (r3 != r6) goto L060685DE;
    r0 = *(s32 *)(r4 + 32);
    if (r0 != 1) slot(r6 = r0) {
        r0 = r6;
        if (r0 != 2) goto L060685DE;
    }
    r3 = __w(0xFE71);
    r2 = *(s32 *)(r4 + 32);
    r5 += r3;
    *(s8 *)r5 = r2;
L060685DE:
    return;
    __nopool;
}

void DMA_CpuStart(void)
{
    r5 = r4;
    r5 <<= 2;
    r5 <<= 2;
    r5 += -116;
    r3 = 1;
    r4 = *(s32 *)r5;
    r4 |= r3;
    return slot(*(s32 *)r5 = r4);
    __nopool;
}

void DMA_CpuStop(void)
{
    r5 = r4;
    r5 <<= 2;
    r5 <<= 2;
    r5 += -116;
    r4 = *(s32 *)r5;
    r3 = -2;
    r4 &= r3;
    return slot(*(s32 *)r5 = r4);
    __nopool;
}

void DMA_CpuAllStop(void)
{
    r5 = -80;
    r4 = *(s32 *)r5;
    r3 = -2;
    r4 &= r3;
    return slot(*(s32 *)r5 = r4);
    __nopool;
}

void DMA_CpuGetComStatus(void)
{
    r3 = -80;
    r5 = *(s32 *)r3;
    r2 = 4;
    r2 &= r5;
    r1 = 2;
    *(s32 *)r4 = r2;
    r5 &= r1;
    return slot(*(s32 *)(r4 + 4) = r5);
    __nopool;
}

void DMA_CpuGetStatus(void)
{
    r4 <<= 2;
    r4 <<= 2;
    r4 += -116;
    r0 = 2;
    r4 = *(s32 *)r4;
    return slot(r0 &= r4);
}

