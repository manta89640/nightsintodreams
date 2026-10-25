/* sbl/stm_cdsct: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is stm_cdsct.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.0606A89C");

void stm_CdContinue(void)
{
    push(pr);
    r0 = 16;
    r15 += -24;
    r3 = r15;
    *(s32 *)r15 = r4;
    r2 = r15;
    r4 = 3;
    r3 += 4;
    *(s32 *)r3 = r4;
    r2 += 4;
    *(s32 *)(r2 + 8) = r4;
    r3 = r15;
    r2 = *(s16 *)&L0606A9CA;
    r4 = r15;
    r3 += 4;
    r4 += 4;
    *(s8 *)(r0 + r3) = r2;
    r5 = *(s32 *)r15;
    r3 = *(s32 *)&L0606A9CC;
    (*r3)() slot(r5 = *(s32 *)(r5 + 52));
    r4 = r0;
    if (r4) {
        r15 += 24;
        pop(pr);
        return slot(r0 = -1);
        __nopool;
    }
    r0 = 0;
    r15 += 24;
    pop(pr);
    return;
    __nopool;
}

void stm_CdPlayFrom(void)
{
    r2 = 1;
    push(pr);
    r0 = 16;
    r15 += -28;
    r3 = r15;
    *(s32 *)(r15 + 4) = r4;
    r3 += 8;
    *(s32 *)r15 = r5;
    r4 = r15;
    *(s32 *)r3 = r2;
    r4 += 8;
    r2 = *(s32 *)r15;
    r3 = r15;
    r3 += 8;
    *(s32 *)(r3 + 4) = r2;
    r3 = r15;
    r3 += 8;
    r2 = 3;
    *(s32 *)(r3 + 8) = r2;
    r3 = r15;
    r3 += 8;
    r2 = 0;
    *(s8 *)(r0 + r3) = r2;
    r5 = *(s32 *)(r15 + 4);
    r3 = *(s32 *)&L0606A9CC;
    (*r3)() slot(r5 = *(s32 *)(r5 + 52));
    if (r0 == -13) slot(r4 = r0) {
        goto L0606A92E slot(r4 = -23);
        __nopool;
    }
    if (r4) {
        goto L0606A92E slot(r4 = -1);
        __nopool;
    }
    r3 = *(s32 *)&L0606A9D0;
    r1 = *(s32 *)r15;
    r2 = *(s32 *)r3;
    *(s32 *)(r2 + 20) = r1;
L0606A92E:
    r15 += 28;
    pop(pr);
    return slot(r0 = r4);
    __nopool;
}

void stm_CdPlayTo(void)
{
    r0 = 16;
    push(r14);
    push(pr);
    r14 = *(s32 *)&L0606A9D0;
    r15 += -28;
    *(s32 *)(r15 + 4) = r4;
    r3 = r15;
    *(s32 *)r15 = r5;
    r4 = 1;
    r3 += 8;
    r2 = r15;
    *(s32 *)r3 = r4;
    r2 += 8;
    r3 = *(s32 *)r14;
    r1 = *(s32 *)(r3 + 20);
    *(s32 *)(r2 + 4) = r1;
    r3 = r15;
    r3 += 8;
    r2 = r15;
    *(s32 *)(r3 + 8) = r4;
    r2 += 8;
    r3 = *(s32 *)r14;
    r3 = *(s32 *)(r3 + 20);
    r1 = *(s32 *)r15;
    r1 -= r3;
    r1 += r4;
    r3 = r15;
    *(s32 *)(r2 + 12) = r1;
    r3 += 8;
    r2 = *(s16 *)&L0606A9CA;
    *(s8 *)(r0 + r3) = r2;
    r5 = *(s32 *)(r15 + 4);
    r4 = r15;
    r3 = *(s32 *)&L0606A9CC;
    r4 += 8;
    (*r3)() slot(r5 = *(s32 *)(r5 + 52));
    if (r0 == -13) slot(r4 = r0) {
        goto L0606A998 slot(r4 = -23);
        __nopool;
    }
    if (r4) {
        goto L0606A998 slot(r4 = -1);
        __nopool;
    }
    r2 = *(s32 *)r14;
    r3 = *(s32 *)r15;
    *(s32 *)(r2 + 24) = r3;
L0606A998:
    r0 = r4;
    r15 += 28;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void stm_GetSctInfo(void)
{
    push(r14);
    push(pr);
    r14 = r6;
    r3 = *(s32 *)&L0606A9D8;
    r15 += -16;
    *(s32 *)(r15 + 4) = r4;
    *(s32 *)r15 = r5;
    r5 = *(s32 *)&L0606A9D4;
    r4 = *(s32 *)(r15 + 4);
    (*r3)() slot(r6 = 0);
    r2 = *(s32 *)r15;
    r4 = r0;
    if (!(r2 >= r4)) goto L0606A9DC;
    r0 = 0;
    r15 += 16;
    pop(pr);
    return slot(pop(r14));
    __data {
    L0606A9CA:
        u16 0x00FF;
    L0606A9CC:
        u32 &gfcd_Play;
    L0606A9D0:
        u32 &stm_mng;
    L0606A9D4:
        u32 0x7FFFFFFF;
    L0606A9D8:
        u32 &gfcf_GetNumSct;
    }
L0606A9DC:
    r5 = *(s32 *)r15;
    r6 = r15;
    r4 = *(s32 *)(r15 + 4);
    r6 += 8;
    r3 = *(s32 *)&L0606AB1C;
    (*r3)() slot(r4 = *(s32 *)(r4 + 32));
    r2 = r15;
    r2 += 8;
    r3 = *(s32 *)r2;
    *(s32 *)r14 = r3;
    r2 = r15;
    r2 += 8;
    r3 = r15;
    r0 = *(s8 *)(r2 + 4);
    r3 += 8;
    r0 = (u8)r0;
    *(s32 *)(r14 + 4) = r0;
    r0 = *(s8 *)(r3 + 5);
    r0 = (u8)r0;
    *(s32 *)(r14 + 8) = r0;
    r0 = r15;
    r0 += 8;
    r0 = *(s8 *)(r0 + 6);
    *(s8 *)(r14 + 12) = r0;
    r0 = r15;
    r0 += 8;
    r0 = *(s8 *)(r0 + 7);
    *(s8 *)(r14 + 13) = r0;
    r0 = 1;
    r15 += 16;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void stm_GetSctData(void)
{
    push(pr);
    r6 = 1;
    r15 += -16;
    r3 = r15;
    *(s32 *)(r15 + 4) = r4;
    r0 = 64;
    *(s32 *)(r15 + 12) = r5;
    push(r3);
    r5 = *(s32 *)(r15 + 8);
    r7 = r15;
    r3 = *(s32 *)(r15 + 16);
    r7 += 12;
    r5 = *(s32 *)(r0 + r5);
    r5 += r3;
    r4 = *(s32 *)(r15 + 8);
    r3 = *(s32 *)&L0606AB20;
    (*r3)() slot(r4 = *(s32 *)(r4 + 32));
    r2 = *(s32 *)&L0606AB24;
    (*r2)();
    r0 = *(s32 *)(r15 + 4);
    r15 += 20;
    pop(pr);
    return slot(r0 = (u32)r0 >> 1);
    __nopool;
}

void stm_DelSctData(void)
{
    push(r14);
    r14 = r6;
    r3 = *(s32 *)&L0606AB2C;
    push(r13);
    push(pr);
    r13 = r5;
    r5 = *(s32 *)&L0606AB28;
    r15 += -4;
    *(s32 *)r15 = r4;
    (*r3)() slot(r6 = 0);
    r4 = r0;
    r2 = r13;
    r2 += r14;
    if (r2 > r4) {
        r14 = r4;
        r14 -= r13;
    }
    if (r14 > 0) {
        r4 = *(s32 *)r15;
        r6 = r14;
        r3 = *(s32 *)&L0606AB30;
        r5 = r13;
        r4 = *(s32 *)(r4 + 32);
        r15 += 4;
        pop(pr);
        pop(r13);
        return (*r3)() slot(pop(r14));
        __nopool;
    }
    r15 += 4;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void stm_GetSctNum(void)
{
    push(r14);
    push(r13);
    push(pr);
    r13 = *(s32 *)&L0606AB34;
    r15 += -4;
    r14 = *(s32 *)(r4 + 32);
    do {
        r5 = r15;
        (*r13)() slot(r4 = r14);
        r4 = r0;
    } while (r4);
    r0 = *(s32 *)r15;
    r15 += 4;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void stm_GetFreeBufSiz(void)
{
    push(r14);
    push(pr);
    r15 += -12;
    r14 = *(s32 *)&L0606AB38;
    do {
        r6 = r15;
        r5 = r15;
        r5 += 8;
        r4 = r15;
        r4 += 4;
        (*r14)();
        r4 = r0;
    } while (r4);
    r0 = *(s32 *)r15;
    r15 += 12;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void stm_WaitCsct(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(r11);
    push(pr);
    r3 = *(s32 *)&L0606AB3C;
    (*r3)() slot(r4 = -5);
    r11 = *(s32 *)&L0606AB40;
    r13 = 4;
    r12 = *(s16 *)&L0606AB18;
    r14 = 0;
    do {
        (*r11)();
        r4 = (u16)r0;
        if ((r4 & r13) != 0) goto L0606AB0C;
        r14 += 1;
    } while (!(r14 >= r12));
L0606AB0C:
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __data {
    L0606AB18:
        u16 0x5F34;
        u8 0x00, 0x00;
    L0606AB1C:
        u32 &gfcd_GetSctInfo;
    L0606AB20:
        u32 &gfcd_GetSctNum;
    L0606AB24:
        u32 &gfcd_WaitServer;
    L0606AB28:
        u32 0x7FFFFFFF;
    L0606AB2C:
        u32 &gfcf_GetNumSct;
    L0606AB30:
        u32 &gfcd_DelSct;
    L0606AB34:
        u32 &CDC_GetSctNum;
    L0606AB38:
        u32 &CDC_GetBufSiz;
    L0606AB3C:
        u32 &CDC_ClrHirqReq;
    L0606AB40:
        u32 &CDC_GetHirqReq;
    }
}

