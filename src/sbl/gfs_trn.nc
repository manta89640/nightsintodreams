/* sbl/gfs_trn: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is gfs_trn.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.0606C3C0");

void gfsTrn_Init(void)
{
    push(r14);
    r3 = 1;
    push(r13);
    r14 = r4;
    push(pr);
    r13 = 0;
    *(s32 *)r14 = r13;
    r5 = r3;
    *(s32 *)(r14 + 4) = r13;
    *(s32 *)(r14 + 8) = r13;
    *(s32 *)(r14 + 12) = r13;
    *(s32 *)(r14 + 16) = r13;
    *(s32 *)(r14 + 20) = r3;
    *(s32 *)(r14 + 24) = r13;
    *(s32 *)(r14 + 28) = r13;
    *(s32 *)(r14 + 32) = r13;
    __bsr gfsTrn_SetUnit() slot(r4 = r14);
    *(s32 *)(r14 + 52) = r13;
    r5 = 3;
    __bsr gfsTrn_SetMode() slot(r4 = r14);
    pop(pr);
    r0 = r14;
    pop(r13);
    return slot(pop(r14));
}

void gfsTrn_SetMode(void)
{
    r0 = *(s32 *)(r4 + 56);
    *(s32 *)(r4 + 56) = r5;
    r5 = 0;
    *(s32 *)(r4 + 36) = r5;
    return slot(*(s32 *)(r4 + 40) = r5);
}

void gfsTrn_SetUnit(void)
{
    return slot(*(s32 *)(r4 + 44) = r5);
}

void gfsTrn_Request(void)
{
    push(pr);
    *(s32 *)(r4 + 24) = r5;
    r5 = 0;
    *(s32 *)(r4 + 28) = r5;
    r0 = *(s32 *)(r4 + 52);
    if (r0 != 6) goto L0606C442;
    *(s32 *)(r4 + 52) = r5;
    r0 = *(s32 *)(r4 + 56);
    if (r0 == 1) goto L0606C42A slot(r5 = r0);
    r0 = r5;
    if (r0 == 2) goto L0606C42A;
    r0 = r5;
    if (r0 != 3) goto L0606C442;
L0606C42A:
    r5 = 4;
    r2 = &_divlu;
    r0 = r5;
    r3 = *(s32 *)(r4 + 8);
    r3 += 3;
    *(s32 *)(r4 + 8) = r3;
    (*r2)() slot(r1 = r3);
    r3 = r0;
    macl = r3 * r5;
    r3 = macl;
    *(s32 *)(r4 + 8) = r3;
L0606C442:
    pop(pr);
    return;
    __nopool;
}

void gfsTrn_GetNsct(void)
{
    return slot(r0 = *(s32 *)(r4 + 24));
    __nopool;
}

void gfsTrn_GetSctcnt(void)
{
    return slot(r0 = *(s32 *)(r4 + 28));
    __nopool;
}

void gfsTrn_SetTsize(void)
{
    r0 = *(s32 *)(r4 + 20);
    return slot(*(s32 *)(r4 + 20) = r5);
    __nopool;
}

void gfsTrn_Activate(void)
{
    r3 = 1;
    return slot(*(s32 *)(r4 + 48) = r3);
    __nopool;
}

void gfsTrn_Deactivate(void)
{
    r2 = 0;
    return slot(*(s32 *)(r4 + 48) = r2);
    __nopool;
}

void gfsTrn_Stop(void)
{
    push(r14);
    push(r13);
    r13 = r4;
    r0 = 0x00C8;
    r14 = r13;
    push(r12);
    push(r11);
    push(r10);
    r10 = 0;
    r12 = &gfs_mng;
    push(pr);
    r11 = 0x00600000;
    r15 += -8;
    *(s32 *)(r15 + 4) = r5;
    r3 = *(s32 *)r12;
    *(s32 *)(r0 + r3) = r10;
    goto L0606C49A slot(r14 += 108);
    __nopool;
L0606C486:
    r5 = r15;
    __bsr gfsTrn_Step() slot(r4 = r13);
    r3 = *(s32 *)r12;
    r0 = 0x00C8;
    r2 = *(s32 *)(r0 + r3);
    r2 += 1;
    *(s32 *)(r0 + r3) = r2;
    if (r2 > r11) goto L0606C4AC;
L0606C49A:
    r4 = *(s32 *)(r14 + 52);
    if (!r4) goto L0606C4AC;
    r0 = r4;
    if (r0 == 6) goto L0606C4AC;
    r0 = r4;
    if (r0 != 7) goto L0606C486;
L0606C4AC:
    r0 = *(s32 *)(r14 + 12);
    if (r0) {
        r6 = *(s32 *)(r15 + 4);
        r5 = *(s32 *)(r14 + 12);
        r3 = &gfsAcc_ReleasePack;
        (*r3)() slot(r4 = r13);
        r2 = *(s32 *)(r14 + 12);
        r3 = *(s32 *)(r2 + 12);
        r1 = *(s32 *)(r14 + 28);
        r1 += r3;
        *(s32 *)(r14 + 28) = r1;
        *(s32 *)(r14 + 12) = r10;
    }
    r0 = *(s32 *)(r14 + 16);
    if (r0) {
        r5 = *(s32 *)(r14 + 16);
        __bsr gfsTrn_FreeDstPack() slot(r4 = r14);
        *(s32 *)(r14 + 16) = r10;
    }
    r2 = 6;
    *(s32 *)(r14 + 52) = r2;
    r15 += 8;
    pop(pr);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
}

void gfsTrn_Exec(void)
{
    push(r14);
    push(r13);
    push(r12);
    r12 = r4;
    push(pr);
    r4 = r12;
    r15 += -4;
    r4 += 108;
    *(s32 *)r15 = r5;
    r5 = *(s32 *)(r4 + 56);
    r0 = r5;
    if (r0 == 0) goto L0606C52C slot(r6 = 1);
    if (r0 == 1) goto L0606C52C;
    if (r0 == 2) goto L0606C52C;
    if (r0 == 3) goto L0606C53A;
    if (r0 == 4) goto L0606C53A;
    goto L0606C53A;
L0606C52C:
    r1 = *(s32 *)(r4 + 52);
    if (r1) {
        goto L0606C53C slot(r14 = 2);
    }
    goto L0606C53C slot(r14 = r6);
L0606C53A:
    r14 = r6;
L0606C53C:
    r4 = 0;
    if (r4 >= r14) goto L0606C560 slot(r13 = r4);
L0606C544:
    r5 = *(s32 *)r15;
    __bsr gfsTrn_Step() slot(r4 = r12);
    if (r0 == 7) goto L0606C560 slot(r4 = r0);
    if (r4) {
        r0 = r4;
        if (r0 != 6) goto L0606C560;
    }
    r13 += 1;
    if (!(r13 >= r14)) goto L0606C544;
L0606C560:
    r0 = r4;
    r15 += 4;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
}

void gfsTrn_Skip(void)
{
    push(r14);
    push(r13);
    r14 = r4;
    push(pr);
    r14 += 108;
    r3 = *(s32 *)(r14 + 24);
    if (r3 <= 0) slot(r13 = r4) {
        goto L0606C5D4 slot(r0 = 6);
    }
    r1 = *(s32 *)(r14 + 48);
    if (!r1) {
        goto L0606C5D4 slot(r0 = *(s32 *)(r14 + 52));
    }
    r0 = *(s32 *)(r14 + 52);
    if (r0 != 0) {
        if (r0 == 5) goto L0606C5AA;
        goto L0606C5D2;
    }
    __bsr gfsTrn_GetSrcPack() slot(r4 = r13);
    r0 = *(s32 *)(r14 + 12);
    if (!r0) goto L0606C5D2;
    r2 = 5;
    *(s32 *)(r14 + 52) = r2;
L0606C5AA:
    r6 = -1;
    r5 = *(s32 *)(r14 + 12);
    r3 = &gfsAcc_ReleasePack;
    (*r3)() slot(r4 = r13);
    r2 = *(s32 *)(r14 + 12);
    r4 = 0;
    r1 = *(s32 *)(r14 + 28);
    r3 = *(s32 *)(r2 + 12);
    r1 += r3;
    *(s32 *)(r14 + 28) = r1;
    *(s32 *)(r14 + 12) = r4;
    r3 = *(s32 *)(r14 + 24);
    r2 = *(s32 *)(r14 + 28);
    if (r2 >= r3) {
        r0 = 6;
        goto L0606C5D2 slot(*(s32 *)(r14 + 52) = r0);
        __nopool;
    }
    *(s32 *)(r14 + 52) = r4;
L0606C5D2:
    r0 = *(s32 *)(r14 + 52);
L0606C5D4:
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfsTrn_Step(void)
{
    push(r14);
    r14 = r4;
    push(r13);
    r14 += 108;
    push(r12);
    r12 = 0;
    push(r11);
    r11 = r4;
    push(r10);
    r10 = r5;
    push(pr);
    r3 = *(s32 *)(r14 + 24);
    if (!(r3 > r12)) slot(r13 = r12) {
        *(s32 *)r10 = r13;
        goto L0606C6A8 slot(r0 = 6);
        __nopool;
    }
    r1 = *(s32 *)(r14 + 48);
    if (!r1) {
        *(s32 *)r10 = r13;
        goto L0606C6A8 slot(r0 = *(s32 *)(r14 + 52));
        __nopool;
    }
    r0 = *(s32 *)(r14 + 52);
    if (r0 != 0) {
        if (r0 == 1) goto L0606C638;
        if (r0 == 2) goto L0606C646;
        if (r0 == 3) goto L0606C652;
        if (r0 == 4) goto L0606C65E;
        if (r0 == 5) goto L0606C66C;
        goto L0606C6A4;
        __nopool;
    }
    __bsr gfsTrn_GetSrcPack() slot(r4 = r11);
    r0 = *(s32 *)(r14 + 12);
    if (!r0) goto L0606C6A4;
    r2 = 1;
    *(s32 *)(r14 + 52) = r2;
L0606C638:
    __bsr gfsTrn_GetDstPack() slot(r4 = r14);
    r0 = *(s32 *)(r14 + 16);
    if (!r0) goto L0606C6A4;
    r2 = 2;
    *(s32 *)(r14 + 52) = r2;
L0606C646:
    __bsr gfsTrn_PrepPack() slot(r4 = r14);
    if (!r0) goto L0606C6A4;
    r2 = 3;
    *(s32 *)(r14 + 52) = r2;
L0606C652:
    __bsr gfsTrn_TransPack() slot(r4 = r11);
    if (!r0) goto L0606C6A4;
    r2 = 4;
    *(s32 *)(r14 + 52) = r2;
L0606C65E:
    __bsr gfsTrn_WaitPack() slot(r4 = r14);
    if (r0 > 0) goto L0606C6A4;
    r13 = 1;
    r2 = 5;
    *(s32 *)(r14 + 52) = r2;
L0606C66C:
    r3 = *(s32 *)(r14 + 12);
    r2 = *(s32 *)(r3 + 8);
    r1 = *(s32 *)(r14 + 32);
    if (r1 == r2) {
        r6 = -1;
        r5 = *(s32 *)(r14 + 12);
        r2 = &gfsAcc_ReleasePack;
        (*r2)() slot(r4 = r11);
        r3 = *(s32 *)(r14 + 12);
        r3 = *(s32 *)(r3 + 12);
        r2 = *(s32 *)(r14 + 28);
        r2 += r3;
        *(s32 *)(r14 + 28) = r2;
        *(s32 *)(r14 + 12) = r12;
    }
    r5 = *(s32 *)(r14 + 16);
    __bsr gfsTrn_FreeDstPack() slot(r4 = r14);
    *(s32 *)(r14 + 16) = r12;
    r2 = *(s32 *)(r14 + 24);
    r3 = *(s32 *)(r14 + 28);
    if (r3 >= r2) {
        r0 = 6;
        goto L0606C6A4 slot(*(s32 *)(r14 + 52) = r0);
        __nopool;
    }
    *(s32 *)(r14 + 52) = r12;
L0606C6A4:
    *(s32 *)r10 = r13;
    r0 = *(s32 *)(r14 + 52);
L0606C6A8:
    pop(pr);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfsTrn_GetSrcPack(void)
{
    push(r14);
    push(r13);
    r14 = r4;
    push(pr);
    r14 += 108;
    r15 += -4;
    *(s32 *)r15 = r4;
    r3 = *(s32 *)(r14 + 28);
    r4 = *(s32 *)(r14 + 24);
    r5 = *(s32 *)(r14 + 20);
    r4 -= r3;
    if (!(r4 >= r5)) slot(r2 = 1) {
        goto L0606C6DE slot(r13 = r4);
    }
    r13 = r5;
L0606C6DE:
    r3 = *(s32 *)(r14 + 44);
    if (!(r3 > r2)) goto L0606C70E;
    r0 = *(s32 *)(r14 + 12);
    if (r0) {
        r1 = *(s32 *)(r14 + 12);
        r3 = *(s32 *)(r14 + 32);
        r1 = *(s32 *)(r1 + 8);
        r1 -= r3;
        r3 = &_divlspnm;
        (*r3)() slot(r0 = *(s32 *)(r14 + 44));
        r13 = r0;
    }
    __bsr gfsTrn_GetFree() slot(r4 = r14);
    r1 = r0;
    r3 = &_divlspnm;
    (*r3)() slot(r0 = *(s32 *)(r14 + 44));
    r4 = r0;
    if (!(r13 >= r4)) goto L0606C70E;
    r13 = r4;
L0606C70E:
    r0 = *(s32 *)(r14 + 12);
    if (r0) goto L0606C728;
    r4 = *(s32 *)r15;
    r3 = &gfsAcc_GetPack;
    (*r3)() slot(r5 = r13);
    r1 = r0;
    if (!r1) goto L0606C728 slot(*(s32 *)(r14 + 12) = r0);
    r3 = 0;
    *(s32 *)(r14 + 32) = r3;
L0606C728:
    r15 += 4;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfsTrn_GetDstPack(void)
{
    r3 = 1;
    push(r14);
    r14 = r4;
    push(r13);
    push(pr);
    r2 = *(s32 *)(r14 + 44);
    if (r2 > r3) {
        r5 = *(s32 *)(r14 + 12);
        goto L0606C762 slot(r5 = *(s32 *)(r5 + 8));
        __nopool;
    }
    r13 = *(s32 *)(r14 + 12);
    r2 = *(s32 *)(r14 + 32);
    r13 = *(s32 *)(r13 + 8);
    r13 -= r2;
    __bsr gfsTrn_GetFree() slot(r4 = r14);
    if (!(r13 >= r0)) {
        goto L0606C762 slot(r5 = r13);
        __nopool;
    }
    __bsr gfsTrn_GetFree() slot(r4 = r14);
    r5 = r0;
L0606C762:
    __bsr gfsTrn_AllocDstPack() slot(r4 = r14);
    *(s32 *)(r14 + 16) = r0;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfsTrn_ScuPrep(void)
{
    return slot(r0 = 1);
    __nopool;
}

void gfsTrn_ScuTrans(void)
{
    push(r14);
    push(r13);
    push(pr);
    r13 = r4;
    r15 += -40;
    if (!r13) goto L0606C800;
    T = !r7;
    *(s32 *)r15 = r6;
    *(s32 *)(r15 + 4) = r13;
    r3 = *(s32 *)(r15 + 52);
    *(s32 *)(r15 + 8) = r3;
    if (T) slot(r14 = 0) {
        *(s32 *)(r15 + 12) = r14;
        goto L0606C79A;
        __nopool;
    }
    r2 = 0x0100;
    *(s32 *)(r15 + 12) = r2;
L0606C79A:
    if (!r5) slot(r4 = 1) {
        *(s32 *)(r15 + 16) = r14;
        goto L0606C7D8;
        __nopool;
    }
    r5 = 0x0FFFFFFF;
    r2 = &SCSP_RAM_CACHED;
    r5 &= r13;
    if (!((u32)r5 >= (u32)r2)) goto L0606C7D4;
    r1 = &SCU_REGS_CACHED;
    if ((u32)r5 >= (u32)r1) goto L0606C7D4;
    *(s32 *)(r15 + 16) = r4;
    goto L0606C7D8;
L0606C7D4:
    r2 = 2;
    *(s32 *)(r15 + 16) = r2;
L0606C7D8:
    *(s32 *)(r15 + 20) = r14;
    r3 = 7;
    *(s32 *)(r15 + 24) = r14;
    r2 = 3;
    *(s32 *)(r15 + 28) = r14;
    *(s32 *)(r15 + 32) = r3;
    *(s32 *)(r15 + 36) = r2;
    r3 = &gfs_scu_dma_busy;
    r2 = &DMA_ScuSetPrm;
    *(s32 *)r3 = r4;
    r4 = r15;
    (*r2)() slot(r5 = r14);
    r3 = &DMA_ScuStart;
    (*r3)() slot(r4 = r14);
    r5 = *(s32 *)(r15 + 52);
    r3 = &CSH_Purge;
    (*r3)() slot(r4 = r13);
L0606C800:
    r15 += 40;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfsTrn_ScuWait(void)
{
    push(pr);
    r3 = &DMA_ScuGetStatus;
    r15 += -4;
    r4 = r15;
    (*r3)() slot(r5 = 0);
    r0 = *(s32 *)r15;
    if (r0 == 1) {
        r15 += 4;
        pop(pr);
        return slot(r0 = 1);
        __nopool;
    }
    r2 = &gfs_scu_dma_busy;
    r4 = 0;
    *(s32 *)r2 = r4;
    r0 = r4;
    r15 += 4;
    pop(pr);
    return;
    __nopool;
}

void gfsTrn_SdmaPrep(void)
{
    return slot(r0 = 1);
    __nopool;
}

void gfsTrn_SdmaTrans(void)
{
    push(r14);
    r0 = 96;
    push(r13);
    push(r12);
    push(r11);
    r11 = r4;
    push(r10);
    r10 = r5;
    push(r9);
    push(r8);
    push(pr);
    r15 += -60;
    *(s32 *)r15 = r7;
    r12 = *(s32 *)(r0 + r15);
    r13 = r12;
    r13 = (u32)r13 >> 2;
    *(s32 *)(r15 + 4) = r13;
    if (r13 <= 0) goto L0606C900 slot(r8 = r6);
    r2 = &DMA_CpuStop;
    (*r2)() slot(r4 = r11);
    r14 = 0;
    *(s32 *)(r15 + 48) = r14;
    r9 = 1;
    *(s32 *)(r15 + 52) = r9;
    r3 = 15;
    *(s32 *)(r15 + 56) = r3;
    r4 = r15;
    r3 = &DMA_CpuSetComPrm;
    r4 += 48;
    (*r3)();
    r2 = *(s32 *)r15;
    T = r8 > 0;
    *(s32 *)(r15 + 8) = r2;
    *(s32 *)(r15 + 12) = r10;
    r3 = *(s32 *)(r15 + 4);
    *(s32 *)(r15 + 16) = r3;
    if (T) slot(r4 = 2) {
        *(s32 *)(r15 + 20) = r9;
        goto L0606C89E;
        __nopool;
    }
    if (r8 < 0) {
        *(s32 *)(r15 + 20) = r4;
        goto L0606C89E;
        __nopool;
    }
    *(s32 *)(r15 + 20) = r14;
L0606C89E:
    r0 = 92;
    r3 = *(s32 *)(r0 + r15);
    if (r3 > 0) {
        *(s32 *)(r15 + 24) = r9;
        goto L0606C8DA;
        __nopool;
    }
    r0 = 92;
    r2 = *(s32 *)(r0 + r15);
    if (r2 < 0) {
        *(s32 *)(r15 + 24) = r4;
        goto L0606C8DA;
    }
    *(s32 *)(r15 + 24) = r14;
L0606C8DA:
    r4 = r15;
    r3 = 0x0800;
    r4 += 8;
    r2 = 0x0200;
    *(s32 *)(r15 + 28) = r3;
    *(s32 *)(r15 + 32) = r2;
    *(s32 *)(r15 + 36) = r14;
    r3 = 0x02FF;
    *(s32 *)(r15 + 44) = r3;
    r3 = &DMA_CpuSetPrm;
    (*r3)() slot(r5 = r11);
    r2 = &DMA_CpuStart;
    (*r2)() slot(r4 = r11);
    r3 = &CSH_Purge;
    r5 = r12;
    (*r3)() slot(r4 = r10);
L0606C900:
    r2 = &gfs_cpu_dma_tail;
    r3 = 3;
    macl = r8 * r13;
    r0 = 92;
    r12 &= r3;
    r1 = r2;
    *(s32 *)r2 = r12;
    r8 = macl;
    r8 <<= 2;
    r8 += r10;
    *(s32 *)(r1 + 8) = r8;
    r3 = r1;
    r2 = *(s32 *)(r0 + r15);
    macl = r2 * r13;
    r1 = *(s32 *)r15;
    r13 = macl;
    r13 <<= 2;
    r13 += r1;
    *(s32 *)(r3 + 4) = r13;
    r15 += 60;
    pop(pr);
    pop(r8);
    pop(r9);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfsTrn_SdmaWait(void)
{
    push(pr);
    r3 = &DMA_CpuGetStatus;
    r15 += -4;
    *(s32 *)r15 = r4;
    (*r3)();
    if (!r0) {
        r15 += 4;
        pop(pr);
        return slot(r0 = 1);
        __nopool;
    }
    r6 = &gfs_cpu_dma_tail;
    r5 = &gfs_cpu_dma_tail;
    r6 = *(s32 *)(r6 + 4);
    r5 = *(s32 *)(r5 + 8);
    r4 = &gfs_cpu_dma_tail;
    __bsr gfsTrn_CopyTail() slot(r4 = *(s32 *)r4);
    r0 = 0;
    r15 += 4;
    pop(pr);
    return;
    __nopool;
}

void gfsTrn_Sdma0Prep(void)
{
    goto gfsTrn_SdmaPrep slot(r4 = 0);
    __nopool;
}

void gfsTrn_Sdma0Trans(void)
{
    push(pr);
    r15 += -16;
    *(s32 *)r15 = r4;
    *(s32 *)(r15 + 4) = r5;
    *(s32 *)(r15 + 8) = r6;
    *(s32 *)(r15 + 12) = r7;
    r3 = *(s32 *)(r15 + 20);
    push(r3);
    r2 = *(s32 *)(r15 + 16);
    push(r2);
    r7 = *(s32 *)(r15 + 16);
    r6 = *(s32 *)(r15 + 12);
    r5 = *(s32 *)(r15 + 8);
    __bsr gfsTrn_SdmaTrans() slot(r4 = 0);
    r15 += 24;
    pop(pr);
    return;
    __nopool;
}

void gfsTrn_Sdma0Wait(void)
{
    goto gfsTrn_SdmaWait slot(r4 = 0);
    __nopool;
}

void gfsTrn_Sdma1Prep(void)
{
    goto gfsTrn_SdmaPrep slot(r4 = 1);
    __nopool;
}

void gfsTrn_Sdma1Trans(void)
{
    push(pr);
    r15 += -16;
    *(s32 *)r15 = r4;
    *(s32 *)(r15 + 4) = r5;
    *(s32 *)(r15 + 8) = r6;
    *(s32 *)(r15 + 12) = r7;
    r3 = *(s32 *)(r15 + 20);
    push(r3);
    r2 = *(s32 *)(r15 + 16);
    push(r2);
    r7 = *(s32 *)(r15 + 16);
    r6 = *(s32 *)(r15 + 12);
    r5 = *(s32 *)(r15 + 8);
    __bsr gfsTrn_SdmaTrans() slot(r4 = 1);
    r15 += 24;
    pop(pr);
    return;
    __nopool;
}

void gfsTrn_Sdma1Wait(void)
{
    goto gfsTrn_SdmaWait slot(r4 = 1);
    __nopool;
}

void gfsTrn_CpuPrep(void)
{
    return slot(r0 = 1);
    __nopool;
}

void gfsTrn_CpuTrans(void)
{
    T = !r4;
    push(r14);
    push(r13);
    r13 = r6;
    if (!T) slot(r14 = r4) {
        r4 = 0;
        r6 = *(s32 *)(r15 + 8);
        r5 <<= 2;
        r6 = (u32)r6 >> 2;
        if (r6 > 0) slot(r7 <<= 2) {
            do {
                r2 = *(s32 *)r13;
                r4 += 1;
                *(s32 *)r14 = r2;
                T = r4 >= r6;
                r14 += r5;
            } while (!T) slot(r13 += r7);
        }
        r6 = r13;
        r0 = *(s32 *)(r15 + 8);
        r5 = r14;
        pop(r13);
        r0 &= 3;
        r4 = r0;
        goto gfsTrn_CopyTail slot(pop(r14));
        __nopool;
    }
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfsTrn_CpuWait(void)
{
    return slot(r0 = 0);
}

void gfsTrn_PrepPack(void)
{
    push(r14);
    r14 = *(s32 *)(r4 + 56);
    r4 = *(s32 *)(r4 + 16);
    r0 = r14;
    if (r0 == 0) goto L0606CA44 slot(r5 = *(s32 *)r4);
    if (r0 == 4) goto L0606CA3E;
    goto L0606CA62;
L0606CA3E:
    r0 = 1;
    return slot(pop(r14));
L0606CA44:
    r4 = 0x0FFFFFFF;
    r4 &= r5;
    r3 = 0x00200000;
    if ((u32)r4 >= (u32)r3) {
        r1 = 0x00300000;
        if (!((u32)r4 >= (u32)r1)) goto L0606CA60;
    }
    r3 = 0x02000000;
    if (!((u32)r4 >= (u32)r3)) goto L0606CA62;
    r1 = &ABUS_DUMMY;
    if ((u32)r4 >= (u32)r1) goto L0606CA62;
L0606CA60:
    r14 = 3;
L0606CA62:
    r0 = r14;
    r1 = &gfs_trn_func_tbl;
    r3 = r14;
    r0 <<= 1;
    r0 += r3;
    r0 <<= 2;
    r0 = (s8)r0;
    r0 = *(s32 *)(r0 + r1);
    goto *r0 slot(pop(r14));
    __nopool;
    __data {
        u8 0x00, 0x0B, 0x6E, 0xF6;
    }
}

void gfsTrn_TransPack(void)
{
    push(r14);
    push(r13);
    r14 = r4;
    push(r12);
    r14 += 108;
    push(r11);
    push(pr);
    r15 += -4;
    *(s32 *)r15 = r4;
    r13 = *(s32 *)(r14 + 12);
    r12 = *(s32 *)(r14 + 16);
    r0 = *(s32 *)(r14 + 56);
    if (r0 == 4) slot(r4 = r0) {
        r2 = *(s32 *)(r14 + 40);
        r5 = *(s32 *)(r13 + 12);
        (*r2)() slot(r4 = *(s32 *)(r14 + 36));
        r4 = r0;
        if (r4 >= 0) {
            *(s32 *)(r13 + 12) = r4;
            *(s32 *)(r12 + 12) = r4;
            r2 = *(s32 *)(r14 + 44);
            macl = r4 * r2;
            r4 = macl;
            *(s32 *)(r13 + 8) = r4;
            *(s32 *)(r12 + 8) = r4;
            goto L0606CB2C slot(*(s32 *)(r14 + 32) = r4);
            __nopool;
        }
        *(s32 *)(r13 + 8) = r4;
        goto L0606CB2E slot(r0 = 0);
        __nopool;
    }
    r1 = *(s32 *)(r14 + 32);
    if (r1) goto L0606CAD6;
    r5 = *(s32 *)r15;
    r5 += 12;
    r3 = &gfsAcc_PreparePack;
    (*r3)() slot(r4 = r13);
    if (r0) goto L0606CAD6;
    goto L0606CB2E slot(r0 = 0);
    __nopool;
L0606CAD6:
    r7 = *(s32 *)(r13 + 4);
    r6 = *(s32 *)(r14 + 32);
    macl = r7 * r6;
    r3 = *(s32 *)r13;
    r6 = macl;
    r5 = *(s32 *)(r12 + 4);
    r6 += r3;
    r4 = *(s32 *)r12;
    r0 = *(s32 *)(r14 + 56);
    T = r0 == 0;
    r13 = r0;
    if (!T) slot(r11 = *(s32 *)(r12 + 8)) {
        goto L0606CB12;
        __nopool;
    }
    r12 = 0x0FFFFFFF;
    r12 &= r4;
    r2 = 0x00200000;
    if ((u32)r12 >= (u32)r2) {
        r1 = 0x00300000;
        if (!((u32)r12 >= (u32)r1)) goto L0606CB10;
    }
    r2 = 0x02000000;
    if (!((u32)r12 >= (u32)r2)) goto L0606CB12;
    r1 = &ABUS_DUMMY;
    if ((u32)r12 >= (u32)r1) goto L0606CB12;
L0606CB10:
    r13 = 3;
L0606CB12:
    r3 = r13;
    r0 = &gfs_trn_func_tbl + 0x4;
    r13 <<= 1;
    r13 += r3;
    r13 <<= 2;
    r13 = (s8)r13;
    r2 = *(s32 *)(r0 + r13);
    (*r2)() slot(push(r11));
    r15 += 4;
    r3 = *(s32 *)(r14 + 32);
    r3 += r11;
    *(s32 *)(r14 + 32) = r3;
L0606CB2C:
    r0 = 1;
L0606CB2E:
    r15 += 4;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfsTrn_WaitPack(void)
{
    push(r14);
    r14 = *(s32 *)(r4 + 56);
    r5 = *(s32 *)(r4 + 16);
    r0 = r14;
    if (r0 != 0) slot(r5 = *(s32 *)r5) {
        if (r0 != 4) {
            goto L0606CB84;
            __nopool;
        }
        r0 = *(s32 *)(r4 + 16);
        r3 = *(s32 *)(r0 + 12);
        if (r3 >= 0) {
            r0 = 0;
            return slot(pop(r14));
            __nopool;
        }
        r0 = 1;
        return slot(pop(r14));
        __nopool;
    }
    r4 = 0x0FFFFFFF;
    r2 = 0x00200000;
    r4 &= r5;
    if ((u32)r4 >= (u32)r2) {
        r1 = 0x00300000;
        if (!((u32)r4 >= (u32)r1)) goto L0606CB82;
    }
    r2 = 0x02000000;
    if (!((u32)r4 >= (u32)r2)) goto L0606CB84;
    r1 = &ABUS_DUMMY;
    if ((u32)r4 >= (u32)r1) goto L0606CB84;
L0606CB82:
    r14 = 3;
L0606CB84:
    r1 = &gfs_trn_func_tbl + 0x8;
    r0 = r14;
    r3 = r14;
    r0 <<= 1;
    r0 += r3;
    r0 <<= 2;
    r0 = (s8)r0;
    r0 = *(s32 *)(r0 + r1);
    goto *r0 slot(pop(r14));
    __nopool;
    __data {
        u8 0x00, 0x0B, 0x6E, 0xF6;
    }
}

void gfsTrn_CopyTail(void)
{
    r15 += -4;
    if (r4 <= 0) goto L0606CBBE;
    r7 = r5;
    r2 = *(s32 *)r6;
    r6 = 0;
    *(s32 *)r15 = r2;
    if (r6 >= r4) goto L0606CBBE slot(r5 = r6);
    do {
        r0 = r15;
        r3 = *(s8 *)(r0 + r5);
        *(s8 *)r7 = r3;
        r5 += 1;
    } while (!(r5 >= r4)) slot(r7 += 1);
L0606CBBE:
    return slot(r15 += 4);
    __nopool;
}

void gfsTrn_GetWp(void)
{
    return slot(r0 = *(s32 *)(r4 + 8));
    __nopool;
}

void gfsTrn_GetFree(void)
{
    r3 = *(s32 *)(r4 + 44);
    r2 = *(s32 *)(r4 + 4);
    macl = r2 * r3;
    r1 = *(s32 *)(r4 + 8);
    r0 = macl;
    return slot(r0 -= r1);
}

void gfsTrn_AllocDstPack(void)
{
    r3 = &gfs_mng;
    r6 = *(s32 *)r3;
    r2 = 0x044C;
    r6 += r2;
    r0 = *(s32 *)(r6 + 16);
    if (r0) {
        return slot(r0 = 0);
        __nopool;
    }
    r0 = r6;
    r3 = *(s32 *)(r4 + 8);
    r2 = *(s32 *)r4;
    r2 += r3;
    r4 = 1;
    *(s32 *)r6 = r2;
    *(s32 *)(r6 + 4) = r4;
    *(s32 *)(r6 + 8) = r5;
    *(s32 *)(r6 + 16) = r4;
    return;
    __nopool;
}

void gfsTrn_FreeDstPack(void)
{
    r0 = *(s32 *)(r4 + 56);
    if (r0 != 4) slot(r6 = r0) {
        r3 = *(s32 *)(r5 + 8);
        r2 = *(s32 *)(r4 + 8);
        r2 += r3;
        *(s32 *)(r4 + 8) = r2;
    }
    r1 = 0;
    return slot(*(s32 *)(r5 + 16) = r1);
    __nopool;
}

void gfsTrn_GetBuf(void)
{
    r3 = *(s32 *)r4;
    *(s32 *)r5 = r3;
    r2 = *(s32 *)(r4 + 4);
    *(s32 *)r6 = r2;
    r3 = *(s32 *)(r4 + 44);
    return slot(*(s32 *)r7 = r3);
    __nopool;
}

void gfsTrn_SetBuf(void)
{
    *(s32 *)r4 = r5;
    r3 = 0;
    *(s32 *)(r4 + 4) = r6;
    *(s32 *)(r4 + 44) = r7;
    return slot(*(s32 *)(r4 + 8) = r3);
    __nopool;
}

void gfsTrn_SetFunc(void)
{
    r4 += 108;
    r3 = 4;
    *(s32 *)(r4 + 36) = r6;
    *(s32 *)(r4 + 40) = r5;
    return slot(*(s32 *)(r4 + 56) = r3);
}

