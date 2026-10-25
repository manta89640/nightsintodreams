/* sbl/dma_scu: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is dma_scu.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.0606FDD0");

void DMA_ScuSetPrm(void)
{
    push(r14);
    r6 = 1;
    r3 = *(s32 *)(r4 + 36);
    r14 = r5;
    r14 <<= 2;
    r14 <<= 2;
    r14 <<= 1;
    r3 &= r6;
    if (r3 == r6) slot(r5 = 2) {
        r0 = *(s32 *)&L0606FF08;
        r3 = *(s32 *)r4;
        *(s32 *)(r0 + r14) = r3;
    }
    r2 = *(s32 *)(r4 + 36);
    r2 &= r5;
    if (r2 == r5) {
        r0 = *(s32 *)&L0606FF0C;
        r2 = *(s32 *)(r4 + 4);
        *(s32 *)(r0 + r14) = r2;
    }
    r0 = *(s32 *)&L0606FF10;
    r3 = *(s32 *)(r4 + 8);
    *(s32 *)(r0 + r14) = r3;
    r3 = *(s32 *)(r4 + 16);
    r0 += 4;
    r2 = *(s32 *)(r4 + 12);
    r2 |= r3;
    *(s32 *)(r0 + r14) = r2;
    r0 += 8;
    r3 = *(s32 *)(r4 + 24);
    r3 <<= 16;
    r2 = *(s32 *)(r4 + 20);
    r3 |= r2;
    r1 = *(s32 *)(r4 + 28);
    r1 <<= 8;
    r2 = *(s32 *)(r4 + 32);
    r3 |= r1;
    r3 |= r2;
    *(s32 *)(r0 + r14) = r3;
    return slot(pop(r14));
    __nopool;
}

void DMA_ScuStart(void)
{
    push(r14);
    r0 = sr;
    r3 = *(s16 *)&L0606FF02;
    r0 = (u32)r0 >> 2;
    push(r13);
    r0 = (u32)r0 >> 2;
    push(r12);
    r13 = r4;
    push(r8);
    r0 &= 15;
    push(pr);
    r15 += -8;
    *(s32 *)r15 = r0;
    r0 = sr;
    r0 &= r3;
    r0 |= 240;
    sr = r0;
    r0 = r13;
    if (r0 != 0) {
        if (r0 == 1) goto L0606FE5E;
        if (r0 == 2) goto L0606FE64;
        goto L0606FE68;
        __nopool;
    }
    r12 = *(s32 *)&L0606FF14;
    goto L0606FE68 slot(r14 = 75);
    __nopool;
L0606FE5E:
    r12 = *(s32 *)&L0606FF18;
    goto L0606FE68 slot(r14 = 74);
    __nopool;
L0606FE64:
    r12 = *(s32 *)&L0606FF1C;
    r14 = 73;
L0606FE68:
    r8 = *(s32 *)&L0606FF20;
    r3 = r13;
    r2 = *(s32 *)&L0606FF24;
    r3 <<= 2;
    *(s32 *)(r15 + 4) = r3;
    r8 += r3;
    (*r2)() slot(r4 = r14);
    *(s32 *)r8 = r0;
    r3 = *(s32 *)&L0606FF28;
    r2 = *(s32 *)(r15 + 4);
    r2 += r3;
    r0 = *(s32 *)&L0606FF2C;
    r8 = r2;
    r1 = *(s32 *)r0;
    (*r1)() slot(r4 = r14);
    r3 = 1;
    r2 = *(s32 *)&L0606FF34;
    r5 = r12;
    *(s32 *)r8 = r0;
    r0 = *(s32 *)&L0606FF30;
    *(s8 *)(r0 + r13) = r3;
    (*r2)() slot(r4 = r14);
    r5 = 0;
    r2 = *(s32 *)&L0606FF38;
    r3 = *(s32 *)r2;
    (*r3)() slot(r4 = r14);
    r0 = *(s32 *)&L0606FF3C;
    r13 <<= 2;
    r3 = *(s16 *)&L0606FF04;
    r13 <<= 2;
    r1 = *(s16 *)&L0606FF02;
    r13 <<= 1;
    *(s32 *)(r0 + r13) = r3;
    r2 = sr;
    r0 = *(s32 *)r15;
    r2 &= r1;
    r0 &= 15;
    r0 <<= 2;
    r0 <<= 2;
    r0 |= r2;
    sr = r0;
    r15 += 8;
    pop(pr);
    pop(r8);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void DMA_ScuGetStatus(void)
{
    r3 = *(s16 *)&L0606FF02;
    r0 = sr;
    r0 = (u32)r0 >> 2;
    r0 = (u32)r0 >> 2;
    r0 &= 15;
    r6 = r0;
    r0 = sr;
    r0 &= r3;
    r0 |= 240;
    sr = r0;
    r0 = *(s32 *)&L0606FF30;
    r3 = sr;
    r1 = *(s16 *)&L0606FF02;
    r2 = *(s8 *)(r0 + r5);
    r2 = (u8)r2;
    r0 = r6;
    *(s32 *)r4 = r2;
    r3 &= r1;
    r0 &= 15;
    r0 <<= 2;
    r0 <<= 2;
    r0 |= r3;
    sr = r0;
    return;
    __data {
    L0606FF02:
        u16 0xFF0F;
    L0606FF04:
        u16 0x0101;
        u8 0x00, 0x00;
    L0606FF08:
        u32 &SCU_REGS;
    L0606FF0C:
        u32 &SCU_REGS + 0x4;
    L0606FF10:
        u32 &SCU_REGS + 0x8;
    L0606FF14:
        u32 &dma_ScuEnd0;
    L0606FF18:
        u32 &dma_ScuEnd1;
    L0606FF1C:
        u32 &dma_ScuEnd2;
    L0606FF20:
        u32 &dma_scu_save_func;
    L0606FF24:
        u32 &INT_GetScuFunc;
    L0606FF28:
        u32 &dma_scu_save_sint;
    L0606FF2C:
        u32 &SYS_GETSINT;
    L0606FF30:
        u32 &dma_scu_busy;
    L0606FF34:
        u32 &INT_SetScuFunc;
    L0606FF38:
        u32 &SYS_SETSINT;
    L0606FF3C:
        u32 &SCU_REGS + 0x10;
    }
}

void dma_ScuEnd0(void)
{
    push(pr);
    r0 = sr;
    r3 = *(s16 *)&L06070042;
    r15 += -8;
    r0 = (u32)r0 >> 2;
    r0 = (u32)r0 >> 2;
    r0 &= 15;
    *(s32 *)r15 = r0;
    r0 = sr;
    r0 &= r3;
    r0 |= 240;
    sr = r0;
    r2 = *(s32 *)&L06070044;
    r3 = 0;
    r5 = *(s32 *)&L06070048;
    *(s32 *)(r15 + 4) = r2;
    *(s8 *)r2 = r3;
    r5 = *(s32 *)r5;
    r2 = *(s32 *)&L0607004C;
    (*r2)() slot(r4 = 75);
    r2 = *(s32 *)&L06070050;
    r5 = *(s32 *)&L06070054;
    r3 = *(s32 *)r2;
    r5 = *(s32 *)r5;
    (*r3)() slot(r4 = 75);
    r2 = 0;
    r1 = *(s16 *)&L06070042;
    r3 = *(s32 *)(r15 + 4);
    *(s8 *)r3 = r2;
    r3 = sr;
    r0 = *(s32 *)r15;
    r3 &= r1;
    r0 &= 15;
    r0 <<= 2;
    r0 <<= 2;
    r0 |= r3;
    sr = r0;
    r15 += 8;
    pop(pr);
    return;
    __nopool;
}

void dma_ScuEnd1(void)
{
    r0 = sr;
    r3 = *(s16 *)&L06070042;
    r0 = (u32)r0 >> 2;
    push(pr);
    r0 = (u32)r0 >> 2;
    r15 += -8;
    r0 &= 15;
    *(s32 *)r15 = r0;
    r0 = sr;
    r0 &= r3;
    r0 |= 240;
    sr = r0;
    r3 = 0;
    r5 = *(s32 *)&L0607005C;
    r2 = *(s32 *)&L06070058;
    *(s32 *)(r15 + 4) = r2;
    *(s8 *)r2 = r3;
    r5 = *(s32 *)r5;
    r2 = *(s32 *)&L0607004C;
    (*r2)() slot(r4 = 74);
    r2 = *(s32 *)&L06070050;
    r3 = *(s32 *)r2;
    r5 = *(s32 *)&L06070060;
    r5 = *(s32 *)r5;
    (*r3)() slot(r4 = 74);
    r3 = *(s32 *)(r15 + 4);
    r2 = 0;
    r1 = *(s16 *)&L06070042;
    *(s8 *)r3 = r2;
    r0 = *(s32 *)r15;
    r3 = sr;
    r0 &= 15;
    r0 <<= 2;
    r0 <<= 2;
    r3 &= r1;
    r0 |= r3;
    sr = r0;
    r15 += 8;
    pop(pr);
    return;
    __nopool;
}

void dma_ScuEnd2(void)
{
    push(pr);
    r0 = sr;
    r3 = *(s16 *)&L06070042;
    r15 += -8;
    r0 = (u32)r0 >> 2;
    r0 = (u32)r0 >> 2;
    r0 &= 15;
    *(s32 *)r15 = r0;
    r0 = sr;
    r0 &= r3;
    r0 |= 240;
    sr = r0;
    r2 = *(s32 *)&L06070064;
    r3 = 0;
    r5 = *(s32 *)&L06070068;
    *(s32 *)(r15 + 4) = r2;
    *(s8 *)r2 = r3;
    r5 = *(s32 *)r5;
    r2 = *(s32 *)&L0607004C;
    (*r2)() slot(r4 = 73);
    r2 = *(s32 *)&L06070050;
    r5 = *(s32 *)&L0607006C;
    r3 = *(s32 *)r2;
    r5 = *(s32 *)r5;
    (*r3)() slot(r4 = 73);
    r2 = 0;
    r1 = *(s16 *)&L06070042;
    r3 = *(s32 *)(r15 + 4);
    *(s8 *)r3 = r2;
    r3 = sr;
    r0 = *(s32 *)r15;
    r3 &= r1;
    r0 &= 15;
    r0 <<= 2;
    r0 <<= 2;
    r0 |= r3;
    sr = r0;
    r15 += 8;
    pop(pr);
    return;
    __data {
    L06070042:
        u16 0xFF0F;
    L06070044:
        u32 &dma_scu_busy;
    L06070048:
        u32 &dma_scu_save_func;
    L0607004C:
        u32 &INT_SetScuFunc;
    L06070050:
        u32 &SYS_SETSINT;
    L06070054:
        u32 &dma_scu_save_sint;
    L06070058:
        u32 &dma_scu_busy + 0x1;
    L0607005C:
        u32 &dma_scu_save_func + 0x4;
    L06070060:
        u32 &dma_scu_save_sint + 0x4;
    L06070064:
        u32 &dma_scu_busy + 0x2;
    L06070068:
        u32 &dma_scu_save_func + 0x8;
    L0607006C:
        u32 &dma_scu_save_sint + 0x8;
    }
}

