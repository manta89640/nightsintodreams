/* sbl/0606DA14: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is 0606DA14.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.0606DA14");

void gfcd_Reserve(void)
{
    r5 = &gfcd_work;
    if (r4) slot(r6 = *(s32 *)r5) {
        r4 = 1;
        r0 = 23;
        *(s8 *)(r0 + r6) = r4;
        r2 = *(s32 *)r5;
        r2 += 24;
        goto L0606DA38 slot(r0 += r2);
        __nopool;
    }
    r4 = 0;
    r0 = 23;
    *(s8 *)(r0 + r6) = r4;
    r2 = *(s32 *)r5;
    r3 = r2;
    r3 += 24;
    r0 += r3;
L0606DA38:
    return slot(*(s8 *)r0 = r4);
    __nopool;
}

void gfcd_Init(void)
{
    push(r14);
    push(r13);
    push(r12);
    r12 = 0;
    r3 = &gfcd_play;
    push(r11);
    push(r10);
    push(r9);
    push(r8);
    push(pr);
    r14 = &gfcd_work;
    r15 += -24;
    r13 = &gfcd_err;
    *(s32 *)(r15 + 4) = r5;
    *(s32 *)r14 = r4;
    *(s32 *)r3 = r12;
    r2 = &gfcd_ResetWork;
    (*r2)() slot(*(s32 *)r13 = r12);
    r4 = *(s32 *)(r15 + 4);
    __bsr gfcd_Reserve();
    r4 = r15;
    r4 += 12;
    __bsr gfcd_GetStat();
    r4 = *(s32 *)r13;
    if (r4) {
        goto L0606DC3E slot(r0 = r4);
        __nopool;
    }
    r11 = 15;
    r0 = r15;
    r0 += 12;
    r0 = *(s8 *)r0;
    r0 = (u8)r0;
    r0 &= r11;
    if (r0 == 9) {
        goto L0606DC3E slot(r0 = -10);
        __nopool;
    }
    r2 = &CDC_AbortFile;
    (*r2)();
    r3 = &CDC_CdInit;
    r7 = 15;
    r6 = 4;
    r5 = 0;
    (*r3)() slot(r4 = r5);
    *(s32 *)r15 = r0;
    if (r0) {
        goto L0606DC3E slot(r0 = -2);
        __nopool;
    }
    r10 = r12;
    r9 = &CDC_SetSctLen;
L0606DAAE:
    r5 = -1;
    (*r9)() slot(r4 = 0);
    *(s32 *)r15 = r0;
    if (!r0) goto L0606DACE;
    r0 = *(s32 *)r15;
    if (r0 == -1) {
        r2 = 0x00030000;
        if (!(r10 > r2)) goto L0606DACA;
    }
    goto L0606DC3E slot(r0 = -2);
    __nopool;
L0606DACA:
    goto L0606DAAE slot(r10 += 1);
    __nopool;
L0606DACE:
    r3 = *(s32 *)r14;
    r2 = 0x00030000;
    *(s32 *)(r3 + 60) = r2;
    goto L0606DAE8;
    __nopool;
L0606DAD8:
    r1 = *(s32 *)r14;
    r3 = *(s32 *)(r1 + 60);
    r3 += -1;
    if (r3) goto L0606DAE8 slot(*(s32 *)(r1 + 60) = r3);
    goto L0606DC3E slot(r0 = -2);
    __nopool;
L0606DAE8:
    r3 = &gfcd_TestHirq;
    (*r3)() slot(r4 = 64);
    if (!r0) goto L0606DAD8;
    r3 = *(s32 *)r14;
    r2 = &CDC_ClrHirqReq;
    *(s32 *)(r3 + 60) = r12;
    (*r2)() slot(r4 = -25);
    r8 = __w(0xFBFF);
    r9 = r12;
    goto L0606DB80 slot(r10 = r12);
L0606DB30:
    r4 = 0x0400;
    r2 = &gfcd_TestHirq;
    (*r2)();
    if (!r0) goto L0606DB80;
    r2 = &CDC_ClrHirqReq;
    (*r2)() slot(r4 = r8);
    r9 += 1;
    r3 = 0x0258;
    if (r9 > r3) {
        goto L0606DC3E slot(r0 = -2);
        __nopool;
    }
    r4 = r15;
    r4 += 12;
    __bsr gfcd_GetStat();
    r0 = *(s32 *)r13;
    if (r0) {
        goto L0606DC3E slot(r0 = *(s32 *)r13);
        __nopool;
    }
    r0 = r15;
    r0 += 12;
    r0 = *(s8 *)r0;
    r0 = (u8)r0;
    r0 &= r11;
    if (r0 == 1) goto L0606DB7E;
    if (r0 == 2) goto L0606DB7E;
    if (r0 != 9) {
        goto L0606DB80;
        __nopool;
    }
    goto L0606DC3E slot(r0 = -10);
    __nopool;
L0606DB7E:
    r10 = 1;
L0606DB80:
    if (!r10) goto L0606DB30;
    r3 = &CDC_DataEnd;
    r4 = r15;
    (*r3)();
    r3 = &gfs_mng;
    r11 = *(s32 *)r3;
    r2 = 0x0460;
    r11 += r2;
    r1 = &CDC_TgetToc;
    (*r1)() slot(r4 = r11);
    T = !r0;
    *(s32 *)r15 = r0;
    if (!T) {
        goto L0606DC3E slot(r0 = -2);
        __nopool;
    }
    r3 = &CDC_GetSes;
    r5 = r15;
    r5 += 8;
    (*r3)() slot(r4 = 0);
    r5 = r15;
    r3 = &CDC_GetSes;
    r4 = r15;
    r5 += 8;
    r4 += 8;
    r4 = *(s8 *)r4;
    (*r3)() slot(r4 = (u8)r4);
    r0 = r15;
    r2 = 0x40000000;
    r0 += 8;
    r0 = *(s8 *)r0;
    r0 = (u8)r0;
    r0 += -1;
    r0 <<= 2;
    r3 = *(s32 *)(r0 + r11);
    if ((r3 & r2) == 0) {
        goto L0606DC3E slot(r0 = -15);
        __nopool;
    }
    r5 = 0x00FF;
    r3 = &CDC_ResetSelector;
    r4 = r5;
    (*r3)() slot(r4 += -3);
    *(s32 *)r15 = r0;
    r3 = *(s32 *)r14;
    r2 = 0x00030000;
    *(s32 *)(r3 + 60) = r2;
    goto L0606DC28;
    __nopool;
L0606DBEC:
    r1 = *(s32 *)r14;
    r3 = *(s32 *)(r1 + 60);
    r3 += -1;
    if (r3) goto L0606DC28 slot(*(s32 *)(r1 + 60) = r3);
    goto L0606DC3E slot(r0 = -2);
L0606DC28:
    r3 = &gfcd_TestHirq;
    (*r3)() slot(r4 = 64);
    if (!r0) goto L0606DBEC;
    r3 = *(s32 *)r14;
    *(s32 *)(r3 + 60) = r12;
    r4 = *(s32 *)r14;
    __bsr gfcd_GetStat() slot(r4 += 64);
    r0 = *(s32 *)r13;
L0606DC3E:
    r15 += 24;
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

void gfcd_AllocFilt(void)
{
    r5 = 0;
    r6 = &gfcd_work;
    r1 = 1;
    r7 = 24;
L0606DC5A:
    r3 = *(s32 *)r6;
    r3 += 24;
    r3 += r5;
    r2 = *(s8 *)r3;
    if (!r2) {
        r3 = *(s32 *)r6;
        r3 += 24;
        r3 += r5;
        *(s8 *)r3 = r1;
        *(s32 *)r4 = r5;
        return slot(r0 = 0);
        __nopool;
    }
    r5 += 1;
    if (!(r5 >= r7)) goto L0606DC5A;
    r3 = -1;
    *(s32 *)r4 = r3;
    r0 = -3;
    return;
    __nopool;
}

void gfcd_FreeFilt(void)
{
    if (r4 >= 0) {
        r2 = 24;
        if (!(r4 >= r2)) goto L0606DC92;
    }
    return slot(r0 = -6);
    __nopool;
L0606DC92:
    r2 = &gfcd_work;
    r5 = *(s32 *)r2;
    r0 = r5;
    r0 += 24;
    r0 = *(s8 *)(r0 + r4);
    if (r0 != 1) {
        return slot(r0 = -7);
        __nopool;
    }
    r2 = r5;
    r2 += 24;
    r4 += r2;
    r3 = 0;
    *(s8 *)r4 = r3;
    r0 = r3;
    return;
    __nopool;
}

void gfcd_AllocBuf(void)
{
    r6 = &gfcd_work;
    r5 = 0;
    r1 = 1;
    r7 = 24;
L0606DCBC:
    r0 = *(s32 *)r6;
    r3 = *(s8 *)(r0 + r5);
    if (!r3) {
        r0 = *(s32 *)r6;
        *(s8 *)(r0 + r5) = r1;
        *(s32 *)r4 = r5;
        return slot(r0 = 0);
        __nopool;
    }
    r5 += 1;
    if (!(r5 >= r7)) goto L0606DCBC;
    r2 = -1;
    r0 = -4;
    *(s32 *)r4 = r2;
    return;
    __nopool;
}

void gfcd_FreeBuf(void)
{
    push(r14);
    push(pr);
    r14 = r4;
    r4 = &gfcd_err;
    r0 = *(s32 *)r4;
    if (r0 == -16) {
        r2 = 0;
        *(s32 *)r4 = r2;
    }
    if (r14 >= 0) {
        r2 = 24;
        if (!(r14 >= r2)) goto L0606DD02;
    }
    r0 = -6;
    pop(pr);
    return slot(pop(r14));
    __nopool;
L0606DD02:
    r3 = &gfcd_work;
    r0 = *(s32 *)r3;
    r0 = *(s8 *)(r0 + r14);
    if (r0 != 1) {
        pop(pr);
        r0 = -7;
        return slot(pop(r14));
        __nopool;
    }
    r6 = -1;
    r5 = 0;
    __bsr gfcd_DelSct() slot(r4 = r14);
    r4 = 0x00030000;
    __bsr gfcd_SetTimeout();
L0606DD22:
    __bsr gfcd_ExecServer();
    if (r0 == 3) slot(r4 = r0) {
        pop(pr);
        r0 = -12;
        return slot(pop(r14));
        __nopool;
    }
    r0 = r4;
    if (r0 == 2) {
        r0 = -16;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    __bsr gfcd_DelDone() slot(r4 = r14);
    if (r0 != 1) goto L0606DD22;
    __bsr gfcd_SetTimeout() slot(r4 = 0);
    r2 = 0;
    r3 = &gfcd_work;
    r0 = *(s32 *)r3;
    *(s8 *)(r0 + r14) = r2;
    r0 = r2;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void gfcd_GetLastSesFad(void)
{
    push(pr);
    r3 = &CDC_GetSes;
    r15 += -4;
    r5 = r15;
    (*r3)() slot(r4 = 0);
    r5 = r15;
    r3 = &CDC_GetSes;
    r4 = r15;
    r4 = *(s8 *)r4;
    (*r3)() slot(r4 = (u8)r4);
    r0 = r15;
    r3 = 0x00FFFFFF;
    r0 = *(s32 *)r0;
    r15 += 4;
    pop(pr);
    return slot(r0 &= r3);
    __nopool;
}

void gfcd_Lock(void)
{
    r4 = &gfcd_work;
    r5 = *(s32 *)r4;
    r0 = *(s32 *)(r5 + 48);
    if (r0 == 1) {
        return slot(r0 = -5);
        __nopool;
    }
    r2 = 1;
    *(s32 *)(r5 + 48) = r2;
    r3 = *(s32 *)r4;
    r2 = *(s32 *)(r3 + 56);
    r2 += 1;
    *(s32 *)(r3 + 56) = r2;
    r3 = *(s32 *)r4;
    r2 = *(s32 *)(r3 + 56);
    if (r2 < 0) {
        r3 = 0;
        r1 = *(s32 *)r4;
        *(s32 *)(r1 + 56) = r3;
    }
    r0 = *(s32 *)r4;
    r0 = *(s32 *)(r0 + 56);
    return;
    __nopool;
}

void gfcd_Unlock(void)
{
    r3 = &gfcd_work;
    r5 = *(s32 *)r3;
    r0 = *(s32 *)(r5 + 48);
    if (!r0) {
        return slot(r0 = -7);
        __nopool;
    }
    r3 = *(s32 *)(r5 + 56);
    if (r3 != r4) {
        return slot(r0 = -9);
        __nopool;
    }
    r4 = 0;
    r0 = r4;
    *(s32 *)(r5 + 48) = r4;
    return;
    __nopool;
}

void gfcd_IsLocked(void)
{
    r3 = &gfcd_work;
    r5 = *(s32 *)r3;
    r0 = *(s32 *)(r5 + 48);
    if (!r0) {
        return slot(r0 = 0);
        __nopool;
    }
    r3 = *(s32 *)(r5 + 56);
    if (r3 == r4) {
        return slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
    return;
    __nopool;
}

void gfcd_SetFilt(void)
{
    push(r14);
    r0 = 84;
    push(r13);
    push(r12);
    push(pr);
    r15 += -4;
    r14 = &gfcd_work;
    r13 = *(s32 *)r14;
    r12 = *(s32 *)(r0 + r13);
    r0 = r13;
    r0 += 24;
    r0 = *(s8 *)(r0 + r4);
    if (r0 != 1) {
        goto L0606DE94 slot(r0 = -7);
        __nopool;
    }
    r2 = 24;
    if (r12 >= r2) {
        goto L0606DE94 slot(r0 = -8);
    }
    r0 = 88;
    r1 = *(s32 *)(r0 + r13);
    if (!r1) {
        r3 = 1;
        r0 = 88;
        *(s32 *)(r0 + r13) = r3;
    }
    r13 = r12;
    r3 = *(s32 *)r14;
    r0 = r5;
    r13 <<= 2;
    r13 <<= 2;
    r3 += 92;
    r3 += r13;
    *(s8 *)r3 = r4;
    r2 = r6;
    r3 = *(s32 *)r14;
    r3 += 92;
    r3 += r13;
    *(s8 *)(r3 + 1) = r0;
    r1 = *(s32 *)r14;
    r1 += 92;
    r3 = &_slow_mvn;
    r1 += r13;
    r1 += 2;
    (*r3)() slot(r0 = 6);
    r0 = 84;
    r3 = *(s32 *)r14;
    r4 = r15;
    r3 += 92;
    r3 += r13;
    *(s32 *)(r3 + 8) = r7;
    r2 = *(s32 *)r14;
    r3 = r2;
    r3 += 92;
    r2 = *(s32 *)(r15 + 20);
    r13 += r3;
    *(s32 *)(r13 + 12) = r2;
    r3 = *(s32 *)r14;
    r2 = *(s32 *)(r0 + r3);
    r2 += 1;
    *(s32 *)(r0 + r3) = r2;
    __bsr gfcd_ExecFilt();
    r0 = 0;
L0606DE94:
    r15 += 4;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfcd_GetFilt(void)
{
    push(pr);
    r15 += -8;
    r3 = &CDC_GetFiltMode;
    *(s32 *)r15 = r4;
    *(s32 *)(r15 + 4) = r6;
    r4 = *(s32 *)r15;
    (*r3)();
    r4 = r0;
    if (r4) {
        r15 += 8;
        pop(pr);
        return slot(r0 = -10);
        __nopool;
    }
    r5 = *(s32 *)(r15 + 4);
    r4 = *(s32 *)r15;
    r3 = &CDC_GetFiltSubh;
    (*r3)();
    r4 = r0;
    if (r4) {
        r15 += 8;
        pop(pr);
        return slot(r0 = -10);
        __nopool;
    }
    r3 = &gfcd_UpdStat;
    (*r3)();
    r0 = 0;
    r15 += 8;
    pop(pr);
    return;
    __nopool;
}

void gfcd_SetCdCon(void)
{
    push(pr);
    r3 = 0x00FF;
    r15 += -4;
    if (r4 == r3) goto L0606DF04;
    r2 = &gfcd_work;
    r0 = *(s32 *)r2;
    r0 += 24;
    r0 = *(s8 *)(r0 + r4);
    if (r0 == 1) goto L0606DF04;
    r15 += 4;
    pop(pr);
    return slot(r0 = -7);
    __nopool;
L0606DF04:
    r7 = &gfcd_work;
    r6 = *(s32 *)r7;
    r3 = *(s32 *)(r6 + 56);
    if (r3 != r5) {
        r15 += 4;
        pop(pr);
        return slot(r0 = -9);
        __nopool;
    }
    r3 = 1;
    r0 = 0x0304;
    *(s32 *)(r0 + r6) = r3;
    r2 = *(s32 *)r7;
    r0 += 4;
    *(s32 *)(r0 + r2) = r4;
    r4 = r15;
    __bsr gfcd_ExecCdCon();
    r0 = 0;
    r15 += 4;
    pop(pr);
    return;
    __nopool;
}

void gfcd_Play(void)
{
    push(pr);
    r2 = &gfcd_work;
    r15 += -16;
    *(s32 *)r15 = r4;
    r3 = *(s32 *)r2;
    r1 = *(s32 *)(r3 + 56);
    if (r1 != r5) {
        r15 += 16;
        pop(pr);
        return slot(r0 = -9);
        __nopool;
    }
    r4 = r15;
    r4 += 4;
    __bsr gfcd_GetStat();
    r3 = &gfcd_err;
    r4 = *(s32 *)r3;
    if (r4) {
        r15 += 16;
        pop(pr);
        return slot(r0 = r4);
    }
    r3 = &CDC_ClrHirqReq;
    (*r3)() slot(r4 = -21);
    r4 = *(s32 *)r15;
    r3 = &CDC_CdPlay;
    (*r3)();
    r2 = 1;
    r3 = &gfcd_play;
    r0 = 0;
    *(s32 *)r3 = r2;
    r15 += 16;
    pop(pr);
    return;
    __nopool;
}

void gfcd_GetSctNum(void)
{
    push(r14);
    push(pr);
    r15 += -4;
    r14 = &gfcd_work;
    r1 = *(s32 *)r14;
    r0 = 0x030C;
    r0 = *(s32 *)(r0 + r1);
    if (r0) {
        r0 = -1;
        r15 += 4;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r3 = 1;
    r0 = 0x030C;
    *(s32 *)(r0 + r1) = r3;
    r2 = *(s32 *)r14;
    r0 += 4;
    *(s32 *)(r0 + r2) = r4;
    r0 += 4;
    r3 = *(s32 *)r14;
    r2 = 0;
    *(s32 *)(r0 + r3) = r5;
    r4 = r15;
    r3 = *(s32 *)r14;
    r0 += 4;
    *(s32 *)(r0 + r3) = r6;
    r0 += 4;
    r3 = *(s32 *)r14;
    *(s32 *)(r0 + r3) = r2;
    r3 = *(s32 *)r14;
    r0 += 4;
    *(s32 *)(r0 + r3) = r7;
    r3 = *(s32 *)r14;
    r2 = *(s32 *)(r15 + 12);
    r0 = 0x0324;
    *(s32 *)(r0 + r3) = r2;
    __bsr gfcd_ExecGetSct();
    r0 = 0;
    r15 += 4;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void gfcd_StartTrans(void)
{
    push(pr);
    r15 += -4;
    r7 = &gfcd_work;
    r1 = *(s32 *)r7;
    r0 = 0x0328;
    r0 = *(s32 *)(r0 + r1);
    if (r0) {
        r15 += 4;
        pop(pr);
        return slot(r0 = -1);
        __nopool;
    }
    r0 = *(s32 *)(r1 + 52);
    if (r0 != -1) {
        r15 += 4;
        pop(pr);
        return slot(r0 = -5);
        __nopool;
    }
    r3 = 1;
    r0 = 0x0328;
    *(s32 *)(r1 + 52) = r4;
    r2 = *(s32 *)r7;
    *(s32 *)(r0 + r2) = r3;
    r2 = *(s32 *)r7;
    r0 += 4;
    *(s32 *)(r0 + r2) = r4;
    r0 += 4;
    r3 = *(s32 *)r7;
    r4 = r15;
    *(s32 *)(r0 + r3) = r5;
    r0 += 4;
    r3 = *(s32 *)r7;
    *(s32 *)(r0 + r3) = r6;
    __bsr gfcd_ExecTrans();
    r0 = 0;
    r15 += 4;
    pop(pr);
    return;
    __nopool;
}

void gfcd_EndTrans(void)
{
    push(pr);
    r3 = &gfcd_work;
    r0 = *(s32 *)r3;
    r0 = *(s32 *)(r0 + 52);
    if (r0 == -1) {
        pop(pr);
        return slot(r0 = -7);
        __nopool;
    }
    r3 = &CDC_DataEnd;
    (*r3)();
    r4 = r0;
    r3 = &gfcd_work;
    r1 = -1;
    r2 = *(s32 *)r3;
    if (r4) slot(*(s32 *)(r2 + 52) = r1) {
        pop(pr);
        return slot(r0 = -10);
        __nopool;
    }
    r3 = &gfcd_UpdStat;
    (*r3)();
    r0 = 0;
    pop(pr);
    return;
    __nopool;
}

void gfcd_DelSct(void)
{
    push(pr);
    r15 += -4;
    r1 = &gfcd_work;
    r7 = *(s32 *)r1;
    r0 = 0x0338;
    r0 = *(s32 *)(r0 + r7);
    if (r0) {
        r15 += 4;
        pop(pr);
        return slot(r0 = -1);
        __nopool;
    }
    r3 = *(s32 *)(r7 + 52);
    if (r3 == r4) {
        r15 += 4;
        pop(pr);
        return slot(r0 = -5);
    }
    r0 = 0x0338;
    r3 = 1;
    *(s32 *)(r0 + r7) = r3;
    r0 += 4;
    r2 = *(s32 *)r1;
    *(s32 *)(r0 + r2) = r4;
    r3 = *(s32 *)r1;
    r0 += 4;
    *(s32 *)(r0 + r3) = r5;
    r4 = r15;
    r3 = *(s32 *)r1;
    r0 += 4;
    *(s32 *)(r0 + r3) = r6;
    __bsr gfcd_ExecDel();
    r0 = 0;
    r15 += 4;
    pop(pr);
    return;
    __nopool;
}

void gfcd_DelDone(void)
{
    r3 = &gfcd_work;
    r5 = *(s32 *)r3;
    r0 = 0x0338;
    r0 = *(s32 *)(r0 + r5);
    if (!r0) goto L0606E10C;
    r0 = 0x033C;
    r2 = *(s32 *)(r0 + r5);
    if (r2 != r4) goto L0606E10C;
    return slot(r0 = 0);
    __nopool;
L0606E10C:
    r0 = 1;
    return;
    __nopool;
}

void gfcd_GetStat(void)
{
    push(r14);
    push(r13);
    push(pr);
    r5 = &gfcd_play;
    r15 += -8;
    r0 = *(s32 *)r5;
    if (r0 == 1) slot(r14 = r4) {
        r4 = -8;
        r2 = 0;
        goto L0606E134 slot(*(s32 *)r5 = r2);
        __nopool;
    }
    r2 = &CDC_GetPeriStat;
    (*r2)() slot(r4 = r14);
    r4 = r0;
L0606E134:
    if (r4) {
        r3 = &CDC_GetCurStat;
        (*r3)() slot(r4 = r14);
    }
    r2 = &CDC_GetHirqReq;
    (*r2)();
    r4 = &gfcd_err;
    r3 = 32;
    r13 = r0;
    if ((r3 & r13) != 0) goto L0606E166 slot(r5 = -13);
    r0 = *(s8 *)r14;
    r0 = (u8)r0;
    r0 &= 15;
    if (r0 == 6) goto L0606E166;
    if (r0 == 7) goto L0606E16A;
    if (r0 == 10) goto L0606E170;
    goto L0606E18E;
    __nopool;
L0606E166:
    goto L0606E18E slot(*(s32 *)r4 = r5);
    __nopool;
L0606E16A:
    r2 = -14;
    goto L0606E18E slot(*(s32 *)r4 = r2);
    __nopool;
L0606E170:
    r1 = -16;
    r3 = r15;
    *(s32 *)r4 = r1;
    r2 = 0;
    *(s32 *)r3 = r2;
    r4 = r15;
    r3 = &CDC_CdSeek;
    (*r3)();
    r2 = &gfcd_WaitScdq;
    (*r2)();
    r3 = &gfcd_WaitScdq;
    (*r3)();
L0606E18E:
    r0 = r13;
    r15 += 8;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfcd_Seek(void)
{
    push(pr);
    r2 = &gfcd_work;
    r15 += -16;
    *(s32 *)r15 = r4;
    r3 = *(s32 *)r2;
    r1 = *(s32 *)(r3 + 56);
    if (r1 != r5) {
        r15 += 16;
        pop(pr);
        return slot(r0 = -9);
        __nopool;
    }
    r4 = r15;
    r4 += 4;
    __bsr gfcd_GetStat();
    r3 = &gfcd_err;
    r4 = *(s32 *)r3;
    if (r4) {
        r15 += 16;
        pop(pr);
        return slot(r0 = r4);
    }
    r4 = *(s32 *)r15;
    r3 = &CDC_CdSeek;
    (*r3)();
    r0 = 0;
    r15 += 16;
    pop(pr);
    return;
    __nopool;
}

void gfcd_MoveSct(void)
{
    push(r14);
    push(r13);
    push(pr);
    r14 = &gfcd_work;
    r15 += -8;
    r13 = *(s32 *)r14;
    r0 = r13;
    r0 += 24;
    *(s32 *)(r15 + 4) = r0;
    r3 = *(s8 *)(r0 + r4);
    if (r3) {
        r2 = *(s32 *)(r15 + 4);
        r2 += r5;
        r3 = *(s8 *)r2;
        if (r3) goto L0606E228;
    }
    goto L0606E25A slot(r0 = -7);
    __nopool;
L0606E228:
    r0 = 0x0348;
    r1 = *(s32 *)(r0 + r13);
    if (r1) {
        goto L0606E25A slot(r0 = -1);
        __nopool;
    }
    r0 = 0x0348;
    r3 = 1;
    *(s32 *)(r0 + r13) = r3;
    r0 += 4;
    r2 = *(s32 *)r14;
    *(s32 *)(r0 + r2) = r4;
    r3 = *(s32 *)r14;
    r0 += 4;
    *(s32 *)(r0 + r3) = r5;
    r4 = r15;
    r3 = *(s32 *)r14;
    r0 += 4;
    *(s32 *)(r0 + r3) = r6;
    r0 += 4;
    r3 = *(s32 *)r14;
    *(s32 *)(r0 + r3) = r7;
    __bsr gfcd_ExecMove();
    r0 = 0;
L0606E25A:
    r15 += 8;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfcd_MoveDone(void)
{
    r2 = &gfcd_work;
    r3 = *(s32 *)r2;
    r0 = 0x0348;
    r0 = *(s32 *)(r0 + r3);
    if (r0) {
        return slot(r0 = 0);
        __nopool;
    }
    r0 = 1;
    return;
    __nopool;
}

void gfcd_GetSctInfo(void)
{
    T = r4 >= 0;
    push(pr);
    if (T) {
        r2 = 24;
        if (!(r4 >= r2)) goto L0606E28C;
    }
    pop(pr);
    return slot(r0 = -6);
    __nopool;
L0606E28C:
    r3 = &gfcd_work;
    r0 = *(s32 *)r3;
    r2 = *(s8 *)(r0 + r4);
    if (!r2) {
        pop(pr);
        return slot(r0 = -7);
        __nopool;
    }
    r3 = &CDC_GetSctInfo;
    (*r3)();
    r4 = r0;
    if (r4) {
        pop(pr);
        return slot(r0 = -10);
        __nopool;
    }
    __bsr gfcd_UpdStat();
    r0 = 0;
    pop(pr);
    return;
    __nopool;
}

void gfcd_ChgDir(void)
{
    push(r14);
    push(pr);
    r15 += -4;
    r14 = &gfcd_work;
    r7 = *(s32 *)r14;
    r0 = r7;
    r0 += 24;
    r0 = *(s8 *)(r0 + r5);
    if (r0 == 1) {
        r0 = r7;
        r0 = *(s8 *)(r0 + r5);
        if (r0 == 1) goto L0606E2E0;
    }
    r0 = -5;
    r15 += 4;
    pop(pr);
    return slot(pop(r14));
    __nopool;
L0606E2E0:
    r0 = 0x0360;
    r1 = *(s32 *)(r0 + r7);
    if (r1) {
        r0 = -1;
        r15 += 4;
        pop(pr);
        return slot(pop(r14));
    }
    r0 = r4;
    if (r0 == -1) {
        r2 = 3;
        r0 = 0x0360;
        goto L0606E318 slot(*(s32 *)(r0 + r7) = r2);
        __nopool;
    }
    r1 = 1;
    r0 = 0x0360;
    *(s32 *)(r0 + r7) = r1;
L0606E318:
    r3 = *(s32 *)r14;
    r0 = 0x0364;
    *(s16 *)(r0 + r3) = r4;
    r0 += 2;
    r3 = *(s32 *)r14;
    r4 = r15;
    *(s16 *)(r0 + r3) = r5;
    r0 += 2;
    r3 = *(s32 *)r14;
    *(s32 *)(r0 + r3) = r6;
    __bsr gfcd_ExecChgDir();
    r0 = 0;
    r15 += 4;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void gfcd_SetFiltCon(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(pr);
    r15 += -4;
    r14 = &gfcd_work;
    r7 = *(s32 *)r14;
    r0 = 0x01DC;
    r13 = 0x00FF;
    if (r4 == r13) goto L0606E362 slot(r12 = *(s32 *)(r0 + r7));
    r0 = r4;
    if (r0 == -2) goto L0606E362;
    if (r4 < 0) goto L0606E37E;
    r2 = 24;
    if (r4 >= r2) goto L0606E37E;
L0606E362:
    if (r5 < 0) goto L0606E37E;
    r3 = 24;
    if (r5 >= r3) goto L0606E37E;
    if (r6 == r13) goto L0606E382;
    r0 = r6;
    if (r0 == -2) goto L0606E382;
    if (r6 < 0) goto L0606E37E;
    if (!(r6 >= r3)) goto L0606E382;
L0606E37E:
    goto L0606E416 slot(r0 = -6);
    __nopool;
L0606E382:
    if (r4 == r13) goto L0606E396;
    r0 = r4;
    if (r0 == -2) goto L0606E396;
    r0 = r7;
    r0 += 24;
    r0 = *(s8 *)(r0 + r4);
    if (r0 != 1) goto L0606E3B2;
L0606E396:
    if (r6 == r13) goto L0606E3AA;
    r0 = r6;
    if (r0 == -2) goto L0606E3AA;
    r0 = r7;
    r0 += 24;
    r0 = *(s8 *)(r0 + r6);
    if (r0 != 1) goto L0606E3B2;
L0606E3AA:
    r0 = r7;
    r0 = *(s8 *)(r0 + r5);
    if (r0 == 1) goto L0606E3B6;
L0606E3B2:
    goto L0606E416 slot(r0 = -7);
    __nopool;
L0606E3B6:
    r2 = 24;
    if (r12 >= r2) {
        goto L0606E416 slot(r0 = -8);
    }
    r0 = *(s16 *)&L0606E4B2;
    r1 = *(s32 *)(r0 + r7);
    if (!r1) {
        r0 = *(s16 *)&L0606E4B2;
        r3 = 1;
        *(s32 *)(r0 + r7) = r3;
    }
    r7 = r12;
    r0 = *(s16 *)&L0606E4B6;
    r3 = r12;
    r2 = *(s32 *)r14;
    r7 <<= 1;
    r7 += r3;
    r7 <<= 2;
    r3 = *(s16 *)&L0606E4B4;
    r7 = (s16)r7;
    r2 += r3;
    r2 += r7;
    *(s32 *)r2 = r4;
    r1 = r3;
    r2 = *(s32 *)r14;
    r4 = r15;
    r1 += r2;
    r1 += r7;
    *(s32 *)(r1 + 4) = r5;
    r1 = r3;
    r2 = *(s32 *)r14;
    r1 += r2;
    r7 += r1;
    *(s32 *)(r7 + 8) = r6;
    r2 = *(s32 *)r14;
    r1 = *(s32 *)(r0 + r2);
    r1 += 1;
    *(s32 *)(r0 + r2) = r1;
    __bsr gfcd_ExecCon();
    r0 = 0;
L0606E416:
    r15 += 4;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfcd_GetFileInfo(void)
{
    push(r14);
    push(r13);
    r14 = r4;
    r3 = *(s32 *)&L0606E4BC;
    r13 = r5;
    push(r12);
    push(pr);
    r15 += -12;
    r6 = r15;
    r6 += 8;
    r5 = r15;
    r5 += 4;
    r4 = r15;
    (*r3)();
    r4 = r0;
    if (r4) {
        goto L0606E4F4 slot(r0 = -11);
        __nopool;
    }
    r3 = *(s32 *)r15;
    if (r14 >= r3) {
        r3 = *(s32 *)(r15 + 4);
        r2 = *(s32 *)r15;
        r2 += r3;
        if (r2 > r14) goto L0606E4A0;
    }
    r5 = r14;
    r3 = *(s32 *)&L0606E4C0;
    (*r3)() slot(r4 = 23);
    r4 = r0;
    if (r4) {
        goto L0606E4F4 slot(r0 = -11);
        __nopool;
    }
    r12 = *(s16 *)&L0606E4B8;
    do {
        __bsr gfcd_TestHirq() slot(r4 = r12);
    } while (!r0);
    r6 = r15;
    r3 = *(s32 *)&L0606E4BC;
    r5 = r15;
    r6 += 8;
    r5 += 4;
    r4 = r15;
    (*r3)();
    r4 = r0;
    if (!r4) {
        r3 = *(s32 *)r15;
        if (r14 >= r3) goto L0606E4A0;
        r3 = *(s32 *)(r15 + 4);
        r2 = *(s32 *)r15;
        r2 += r3;
        if (r2 > r14) goto L0606E4A0;
    }
    goto L0606E4F4 slot(r0 = -11);
    __nopool;
L0606E4A0:
    r3 = *(s32 *)&L0606E4C4;
    r5 = r13;
    (*r3)() slot(r4 = r14);
    r4 = r0;
    if (!r4) goto L0606E4C8;
    goto L0606E4F4 slot(r0 = -11);
    __data {
    L0606E4B2:
        u16 0x01E0;
    L0606E4B4:
        u16 0x01E4;
    L0606E4B6:
        u16 0x01DC;
    L0606E4B8:
        u16 0x0200;
        u8 0x00, 0x00;
    L0606E4BC:
        u32 &CDC_GetFileScope;
    L0606E4C0:
        u32 &CDC_ReadDir;
    L0606E4C4:
        u32 &CDC_TgetFileInfo;
    }
L0606E4C8:
    r0 = *(s8 *)(r13 + 11);
    r0 = (u8)r0;
    if ((r0 & 2) != 0) {
        r0 = *(s8 *)(r13 + 11);
        r0 |= 128;
        *(s8 *)(r13 + 11) = r0;
    }
    r1 = *(s32 *)(r15 + 8);
    if (!r1) goto L0606E4EE;
    r3 = *(s32 *)(r15 + 4);
    r2 = *(s32 *)r15;
    r2 += r3;
    r2 += -1;
    if (r2 != r14) goto L0606E4EE;
    r0 = *(s8 *)(r13 + 11);
    r0 |= 1;
    *(s8 *)(r13 + 11) = r0;
L0606E4EE:
    __bsr gfcd_UpdStat();
    r0 = 0;
L0606E4F4:
    r15 += 12;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
}

void gfcd_GetFreeSiz(void)
{
    push(pr);
    r15 += -12;
    r3 = &CDC_GetBufSiz;
    r6 = r15;
    r5 = r15;
    r5 += 8;
    r4 = r15;
    r4 += 4;
    (*r3)();
    r4 = r0;
    if (r4) {
        r15 += 12;
        pop(pr);
        return slot(r0 = -10);
        __nopool;
    }
    __bsr gfcd_UpdStat();
    r0 = *(s32 *)r15;
    r15 += 12;
    pop(pr);
    return;
    __nopool;
}

void gfcd_ExecServer(void)
{
    push(r14);
    push(r13);
    push(r12);
    r13 = 0;
    r14 = &gfcd_work;
    push(r11);
    push(r10);
    push(pr);
    r15 += -4;
    *(s32 *)r15 = r13;
    r4 = *(s32 *)r14;
    r1 = *(s32 *)(r4 + 60);
    if (!r1) goto L0606E560 slot(r12 = r13);
    r3 = *(s32 *)(r4 + 60);
    r3 += -1;
    if (r3 > 0) goto L0606E560 slot(*(s32 *)(r4 + 60) = r3);
    __bsr gfcd_ResetWork();
    goto L0606E5EC slot(r0 = 3);
    __nopool;
L0606E560:
    r4 = *(s32 *)r14;
    __bsr gfcd_GetStat() slot(r4 += 64);
    r3 = &gfcd_err;
    r0 = *(s32 *)r3;
    if (r0) {
        goto L0606E5EC slot(r0 = 2);
        __nopool;
    }
    r4 = 0x0400;
    __bsr gfcd_TestHirq();
    if (r0 != 1) goto L0606E59C;
    r4 = __w(0xFBFF);
    r2 = &CDC_ClrHirqReq;
    (*r2)();
    r3 = *(s32 *)r14;
    r0 = 76;
    r0 = *(s32 *)(r0 + r3);
    if (!r0) goto L0606E59C;
    r0 = 76;
    r2 = *(s32 *)r14;
    r3 = *(s32 *)(r0 + r2);
    r4 = r2;
    r0 = 80;
    (*r3)() slot(r4 = *(s32 *)(r0 + r4));
L0606E59C:
    r10 = 30;
    r11 = 8;
    goto L0606E5DE slot(r14 = r13);
    __nopool;
L0606E5A4:
    __bsr gfcd_IsIdle() slot(r4 = r14);
    if (r0) goto L0606E5DC;
    r5 = r15;
    __bsr gfcd_Exec() slot(r4 = r14);
    r4 = r0;
    if (r4 < 0) {
        goto L0606E5EC slot(r0 = r4);
    }
    r2 = *(s32 *)r15;
    if (!(r2 > r10)) goto L0606E5DC slot(r12 += r4);
    goto L0606E5EC slot(r0 = 1);
L0606E5DC:
    r14 += 1;
L0606E5DE:
    if (!(r14 >= r11)) goto L0606E5A4;
    if (r12 > 0) {
        goto L0606E5EC slot(r0 = 1);
    }
    r0 = 0;
L0606E5EC:
    r15 += 4;
    pop(pr);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
}

void gfcd_IsIdle(void)
{
    r3 = &gfcd_work;
    r0 = r4;
    if (r0 != 0) slot(r5 = *(s32 *)r3) {
        if (r0 == 1) goto L0606E62A;
        if (r0 == 2) goto L0606E630;
        if (r0 == 3) goto L0606E636;
        if (r0 == 4) goto L0606E63C;
        if (r0 == 5) goto L0606E642;
        if (r0 == 6) goto L0606E648;
        if (r0 == 7) goto L0606E64E;
        goto L0606E652;
        __nopool;
    }
    goto L0606E650 slot(r0 = 88);
    __nopool;
L0606E62A:
    r0 = 0x0304;
    goto L0606E650;
    __nopool;
L0606E630:
    r0 = 0x030C;
    goto L0606E650;
    __nopool;
L0606E636:
    r0 = 0x0328;
    goto L0606E650;
    __nopool;
L0606E63C:
    r0 = 0x0338;
    goto L0606E650;
    __nopool;
L0606E642:
    r0 = 0x0348;
    goto L0606E650;
    __nopool;
L0606E648:
    r0 = 0x01E0;
    goto L0606E650;
    __nopool;
L0606E64E:
    r0 = 0x0360;
L0606E650:
    r4 = *(s32 *)(r0 + r5);
L0606E652:
    if (!r4) {
        return slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
    return;
}

void gfcd_Exec(void)
{
    push(r14);
    r0 = r4;
    if (r0 != 0) slot(r14 = r5) {
        if (r0 == 1) goto L0606E6A4;
        if (r0 == 2) goto L0606E6AA;
        if (r0 == 3) goto L0606E6B0;
        if (r0 == 4) goto L0606E6B6;
        if (r0 == 5) goto L0606E6BC;
        if (r0 == 6) goto L0606E6C2;
        if (r0 == 7) goto L0606E6C8;
        goto L0606E6CE;
    }
    r4 = r14;
    goto gfcd_ExecFilt slot(pop(r14));
L0606E6A4:
    r4 = r14;
    goto gfcd_ExecCdCon slot(pop(r14));
L0606E6AA:
    r4 = r14;
    goto gfcd_ExecGetSct slot(pop(r14));
L0606E6B0:
    r4 = r14;
    goto gfcd_ExecTrans slot(pop(r14));
L0606E6B6:
    r4 = r14;
    goto gfcd_ExecDel slot(pop(r14));
L0606E6BC:
    r4 = r14;
    goto gfcd_ExecMove slot(pop(r14));
L0606E6C2:
    r4 = r14;
    goto gfcd_ExecCon slot(pop(r14));
L0606E6C8:
    r4 = r14;
    goto gfcd_ExecChgDir slot(pop(r14));
L0606E6CE:
    return slot(pop(r14));
}

void gfcd_SetTimeout(void)
{
    r2 = &gfcd_work;
    r3 = *(s32 *)r2;
    return slot(*(s32 *)(r3 + 60) = r4);
    __nopool;
}

void gfcd_WaitServer(void)
{
    push(r14);
    push(pr);
    r4 = 0x00030000;
    __bsr gfcd_SetTimeout();
    do {
        __bsr gfcd_ExecServer();
    } while (r0 == 1) slot(r14 = r0);
    __bsr gfcd_SetTimeout() slot(r4 = 0);
    r0 = r14;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void gfcd_ExecFilt(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(r11);
    r12 = 1;
    r14 = &gfcd_work;
    r11 = r4;
    push(r10);
    r10 = 0;
    push(r9);
    r9 = 3;
    push(r8);
    push(pr);
    goto L0606E7DE slot(r13 = r10);
    __nopool;
L0606E718:
    r0 = *(s32 *)r14;
    r1 = 88;
    r0 = *(s32 *)(r0 + r1);
    if (r0 == 1) {
        r3 = r13;
        r8 = *(s32 *)r14;
        r3 <<= 2;
        r3 <<= 2;
        r8 += 92;
        r8 += r3;
        r0 = *(s8 *)(r8 + 1);
        r4 = *(s8 *)r8;
        r5 = (u8)r0;
        r3 = &CDC_SetFiltMode;
        (*r3)() slot(r4 = (u8)r4);
        r4 = r0;
        if (r4) goto L0606E7E8;
        __bsr gfcd_UpdStat();
        r3 = *(s32 *)r11;
        r0 = 88;
        r3 += 1;
        *(s32 *)r11 = r3;
        r2 = *(s32 *)r14;
        r3 = 2;
        *(s32 *)(r0 + r2) = r3;
    }
    r1 = 88;
    r0 = *(s32 *)r14;
    r0 = *(s32 *)(r0 + r1);
    if (r0 != 2) goto L0606E7A4;
    r8 = *(s32 *)r14;
    r3 = r13;
    r2 = &CDC_SetFiltSubh;
    r8 += 92;
    r3 <<= 2;
    r3 <<= 2;
    r8 += r3;
    r5 = r8;
    r4 = *(s8 *)r8;
    r5 += 2;
    (*r2)() slot(r4 = (u8)r4);
    r4 = r0;
    if (r4) goto L0606E7E8;
    __bsr gfcd_UpdStat();
    r3 = *(s32 *)r11;
    r3 += 1;
    *(s32 *)r11 = r3;
    r2 = *(s32 *)r14;
    r3 = r13;
    r3 <<= 2;
    r3 <<= 2;
    r2 += 92;
    r3 += r2;
    r0 = *(s32 *)(r3 + 12);
    if (r0) {
        r0 = 88;
        r1 = *(s32 *)r14;
        goto L0606E7A4 slot(*(s32 *)(r0 + r1) = r9);
        __nopool;
    }
    r0 = 88;
    r2 = *(s32 *)r14;
    *(s32 *)(r0 + r2) = r12;
L0606E7A4:
    r0 = *(s32 *)r14;
    r1 = 88;
    r0 = *(s32 *)(r0 + r1);
    if (r0 == 3) {
        r3 = r13;
        r2 = &CDC_SetFiltRange;
        r3 <<= 2;
        r8 = *(s32 *)r14;
        r3 <<= 2;
        r8 += 92;
        r8 += r3;
        r6 = *(s32 *)(r8 + 12);
        r5 = *(s32 *)(r8 + 8);
        r4 = *(s8 *)r8;
        (*r2)() slot(r4 = (u8)r4);
        r4 = r0;
        if (r4) goto L0606E7E8;
        __bsr gfcd_UpdStat();
        r3 = *(s32 *)r11;
        r0 = 88;
        r3 += 1;
        *(s32 *)r11 = r3;
        r2 = *(s32 *)r14;
        *(s32 *)(r0 + r2) = r12;
    }
    r13 += 1;
L0606E7DE:
    r0 = 84;
    r3 = *(s32 *)r14;
    r2 = *(s32 *)(r0 + r3);
    if (!(r13 >= r2)) goto L0606E718;
L0606E7E8:
    r1 = *(s32 *)r14;
    r0 = 84;
    r3 = *(s32 *)(r0 + r1);
    if (r13 >= r3) {
        r0 = 84;
        r1 = *(s32 *)r14;
        goto L0606E82C slot(*(s32 *)(r0 + r1) = r10);
        __nopool;
    }
    goto L0606E81C slot(r4 = r10);
    __nopool;
L0606E7FE:
    r1 = r4;
    r3 = &_quick_evn_mvn;
    r2 = r13;
    r5 = *(s32 *)r14;
    r1 <<= 2;
    r5 += 92;
    r1 <<= 2;
    r1 += r5;
    r2 <<= 2;
    r2 <<= 2;
    r2 += r5;
    (*r3)() slot(r0 = 16);
    r13 += 1;
    r4 += 1;
L0606E81C:
    r2 = *(s32 *)r14;
    r0 = 84;
    r3 = *(s32 *)(r0 + r2);
    if (!(r13 >= r3)) goto L0606E7FE;
    r0 = 84;
    r1 = *(s32 *)r14;
    *(s32 *)(r0 + r1) = r4;
L0606E82C:
    __bsr gfcd_TestHirq() slot(r4 = 64);
    if (!r0) goto L0606E844;
    r3 = *(s32 *)r14;
    r0 = 84;
    r0 = *(s32 *)(r0 + r3);
    if (r0) goto L0606E844;
    r0 = 88;
    r2 = *(s32 *)r14;
    *(s32 *)(r0 + r2) = r10;
L0606E844:
    r0 = *(s32 *)r14;
    r1 = 84;
    pop(pr);
    r0 = *(s32 *)(r0 + r1);
    pop(r8);
    pop(r9);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
}

void gfcd_ExecCdCon(void)
{
    push(r14);
    push(r13);
    push(pr);
    r15 += -4;
    r14 = &gfcd_work;
    *(s32 *)r15 = r4;
    r13 = *(s32 *)r14;
    r0 = 0x0304;
    r0 = *(s32 *)(r0 + r13);
    if (r0 == 1) {
        r0 = 0x0308;
        r3 = &CDC_CdSetCon;
        (*r3)() slot(r4 = *(s32 *)(r0 + r13));
        r4 = r0;
        r2 = *(s32 *)r15;
        T = !r4;
        r3 = *(s32 *)r2;
        r3 += 1;
        if (T) slot(*(s32 *)r2 = r3) {
            r2 = *(s32 *)r14;
            r3 = 2;
            r0 = 0x0304;
            *(s32 *)(r0 + r2) = r3;
        }
        __bsr gfcd_UpdStat();
    }
    r0 = *(s32 *)r14;
    r1 = 0x0304;
    r0 = *(s32 *)(r0 + r1);
    if (r0 != 2) goto L0606E8C6;
    __bsr gfcd_TestHirq() slot(r4 = 64);
    if (!r0) goto L0606E8C6;
    r2 = 0;
    r0 = 0x0304;
    r3 = *(s32 *)r14;
    *(s32 *)(r0 + r3) = r2;
L0606E8C6:
    r0 = *(s32 *)r14;
    r1 = 0x0304;
    r0 = *(s32 *)(r0 + r1);
    r15 += 4;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfcd_ExecGetSct(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(r11);
    r12 = r4;
    r14 = &gfcd_work;
    push(pr);
    r0 = 0x030C;
    r15 += -8;
    r11 = *(s32 *)r14;
    r0 = *(s32 *)(r0 + r11);
    if (r0 != 1) goto L0606E964 slot(r13 = 0);
    r5 = r15;
    r0 = 0x0310;
    r3 = &CDC_GetSctNum;
    (*r3)() slot(r4 = *(s32 *)(r0 + r11));
    __bsr gfcd_UpdStat();
    r3 = *(s32 *)r12;
    r3 += 1;
    *(s32 *)r12 = r3;
    r2 = *(s32 *)r14;
    r0 = 0x0314;
    r3 = *(s32 *)(r0 + r2);
    r1 = *(s32 *)r15;
    r1 -= r3;
    *(s32 *)r15 = r1;
    r4 = *(s32 *)r14;
    r0 = 0x0318;
    r4 = *(s32 *)(r0 + r4);
    if (!(r1 >= r4)) {
        r2 = *(s32 *)r15;
        goto L0606E924;
        __nopool;
    }
    r2 = r4;
L0606E924:
    *(s32 *)r15 = r2;
    r3 = *(s32 *)r14;
    r0 = 0x0320;
    r2 = *(s32 *)(r0 + r3);
    r1 = *(s32 *)r15;
    *(s32 *)r2 = r1;
    r3 = *(s32 *)r14;
    r0 = 0x0324;
    r0 = *(s32 *)(r0 + r3);
    if (!r0) {
        r2 = *(s32 *)r14;
        r0 = 0x030C;
        *(s32 *)(r0 + r2) = r13;
        goto L0606EA1C slot(r0 = r13);
        __nopool;
    }
    r3 = *(s32 *)r15;
    if (r3 <= 0) {
        r1 = *(s32 *)r14;
        r0 = 0x030C;
        *(s32 *)(r0 + r1) = r13;
        r3 = *(s32 *)r14;
        r0 += 24;
        r2 = *(s32 *)(r0 + r3);
        *(s32 *)r2 = r13;
        goto L0606EA1C slot(r0 = r13);
        __nopool;
    }
    r3 = *(s32 *)r14;
    r2 = 2;
    r0 = 0x030C;
    *(s32 *)(r0 + r3) = r2;
L0606E964:
    r0 = *(s32 *)r14;
    r1 = 0x030C;
    r0 = *(s32 *)(r0 + r1);
    if (r0 == 2) {
        r0 = *(s32 *)r14;
        r0 = *(s32 *)(r0 + 52);
        if (r0 != -1) {
            goto L0606EA1C slot(r0 = 2);
        }
        r2 = *(s32 *)r14;
        r3 = r2;
        r0 = 0x0310;
        r1 = *(s32 *)(r0 + r3);
        r3 = &CDC_CalActSiz;
        r0 += 16;
        *(s32 *)(r2 + 52) = r1;
        r6 = *(s32 *)r14;
        r5 = *(s32 *)r14;
        r6 = *(s32 *)(r0 + r6);
        r4 = *(s32 *)r14;
        r0 += -12;
        r6 = *(s32 *)r6;
        r5 = *(s32 *)(r0 + r5);
        r0 += -4;
        (*r3)() slot(r4 = *(s32 *)(r0 + r4));
        r4 = r0;
        if (r4) {
            goto L0606EA1C slot(r0 = 2);
            __nopool;
        }
        __bsr gfcd_UpdStat();
        r2 = *(s32 *)r12;
        r2 += 1;
        *(s32 *)r12 = r2;
        r2 = 3;
        r0 = 0x030C;
        r3 = *(s32 *)r14;
        *(s32 *)(r0 + r3) = r2;
    }
    r0 = *(s32 *)r14;
    r1 = 0x030C;
    r0 = *(s32 *)(r0 + r1);
    if (r0 == 3) {
        r2 = &CDC_GetActSiz;
        r4 = r15;
        r4 += 4;
        (*r2)();
        r4 = r0;
        if (r4) {
            goto L0606EA1C slot(r0 = 1);
            __nopool;
        }
        __bsr gfcd_UpdStat();
        r2 = *(s32 *)r12;
        r2 += 1;
        *(s32 *)r12 = r2;
        r3 = *(s32 *)r14;
        r0 = 0x030C;
        *(s32 *)(r0 + r3) = r13;
        r3 = *(s32 *)r14;
        r0 += 24;
        r1 = *(s32 *)(r15 + 4);
        r2 = *(s32 *)(r0 + r3);
        r1 <<= 1;
        *(s32 *)r2 = r1;
        r3 = *(s32 *)r14;
        r2 = -1;
        *(s32 *)(r3 + 52) = r2;
        goto L0606EA1C slot(r0 = r13);
        __nopool;
    }
    r0 = 1;
L0606EA1C:
    r15 += 8;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfcd_ExecTrans(void)
{
    push(r14);
    push(r13);
    push(pr);
    r13 = &gfcd_work;
    r15 += -4;
    r0 = 0x0328;
    *(s32 *)r15 = r4;
    r14 = *(s32 *)r13;
    r0 = *(s32 *)(r0 + r14);
    if (r0 == 1) {
        r0 = 0x0334;
        r6 = *(s32 *)(r0 + r14);
        r3 = &CDC_GetSctData;
        r0 += -4;
        r5 = *(s32 *)(r0 + r14);
        r0 += -4;
        (*r3)() slot(r4 = *(s32 *)(r0 + r14));
        r4 = r0;
        if (r4) {
            goto L0606EA92 slot(r0 = 1);
            __nopool;
        }
        __bsr gfcd_UpdStat();
        r2 = *(s32 *)r15;
        r0 = 0x0328;
        r3 = *(s32 *)r2;
        r3 += 1;
        *(s32 *)r2 = r3;
        r2 = *(s32 *)r13;
        r3 = 2;
        *(s32 *)(r0 + r2) = r3;
    }
    r0 = *(s32 *)r13;
    r1 = 0x0328;
    r0 = *(s32 *)(r0 + r1);
    if (r0 != 2) goto L0606EA90;
    r2 = &CDC_DataReady;
    (*r2)() slot(r4 = 0);
    r4 = r0;
    if (r4) goto L0606EA90;
    r3 = *(s32 *)r13;
    r4 = 0;
    r0 = 0x0328;
    *(s32 *)(r0 + r3) = r4;
    goto L0606EA92 slot(r0 = r4);
    __nopool;
L0606EA90:
    r0 = 1;
L0606EA92:
    r15 += 4;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
}

void gfcd_ExecDel(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(r11);
    push(pr);
    r15 += -4;
    r14 = &gfcd_work;
    *(s32 *)r15 = r4;
    r13 = *(s32 *)r14;
    r4 = 1;
    r0 = 0x0338;
    r12 = r4;
    r3 = *(s32 *)(r0 + r13);
    if (r3 != r4) goto L0606EB26 slot(r11 = 0);
    r0 = 0x0340;
    r1 = *(s32 *)(r0 + r13);
    if (r1) goto L0606EB14;
    r0 = 0x0344;
    r0 = *(s32 *)(r0 + r13);
    if (r0 != -1) goto L0606EB14;
    r0 = 0x033C;
    r5 = *(s32 *)(r0 + r13);
    r3 = &CDC_ResetSelector;
    (*r3)() slot(r4 = 0);
    r4 = r0;
    if (r4) {
        goto L0606EBA2 slot(r0 = 1);
        __nopool;
    }
    __bsr gfcd_UpdStat();
    r2 = *(s32 *)r15;
    r3 = *(s32 *)r2;
    r0 = 0x0338;
    r3 += 1;
    *(s32 *)r2 = r3;
    r3 = 4;
    r2 = *(s32 *)r14;
    *(s32 *)(r0 + r2) = r3;
    goto L0606EB26;
    __nopool;
L0606EB14:
    r0 = 0x0344;
    r4 = *(s32 *)(r0 + r13);
    if (!r4) {
        goto L0606EB26 slot(r12 = r11);
        __nopool;
    }
    r0 = 0x0338;
    r2 = 2;
    *(s32 *)(r0 + r13) = r2;
L0606EB26:
    r0 = *(s32 *)r14;
    r1 = 0x0338;
    r0 = *(s32 *)(r0 + r1);
    if (r0 != 2) goto L0606EB60;
    r6 = *(s32 *)r14;
    r0 = 0x0344;
    r5 = *(s32 *)r14;
    r6 = *(s32 *)(r0 + r6);
    r4 = *(s32 *)r14;
    r0 += -4;
    r3 = &CDC_DelSctData;
    r5 = *(s32 *)(r0 + r5);
    r0 += -4;
    (*r3)() slot(r4 = *(s32 *)(r0 + r4));
    r4 = r0;
    r2 = *(s32 *)r15;
    T = !r4;
    r3 = *(s32 *)r2;
    r3 += 1;
    if (!T) goto L0606EB60 slot(*(s32 *)r2 = r3);
    r2 = *(s32 *)r14;
    r3 = 3;
    r0 = 0x0338;
    *(s32 *)(r0 + r2) = r3;
    __bsr gfcd_UpdStat();
L0606EB60:
    r0 = *(s32 *)r14;
    r1 = 0x0338;
    r0 = *(s32 *)(r0 + r1);
    if (r0 != 3) goto L0606EB76;
    r4 = 0x0080;
    __bsr gfcd_TestHirq();
    if (!r0) goto L0606EB76;
    r12 = r11;
L0606EB76:
    r0 = *(s32 *)r14;
    r1 = 0x0338;
    r0 = *(s32 *)(r0 + r1);
    if (r0 != 4) goto L0606EB8A;
    __bsr gfcd_TestHirq() slot(r4 = 64);
    if (!r0) goto L0606EB8A;
    r12 = r11;
L0606EB8A:
    r0 = r12;
    if (r0 == 1) {
        goto L0606EBA2 slot(r0 = 1);
        __nopool;
    }
    r2 = &CDC_ClrHirqReq;
    (*r2)() slot(r4 = -9);
    r3 = *(s32 *)r14;
    r0 = 0x0338;
    *(s32 *)(r0 + r3) = r11;
    r0 = r11;
L0606EBA2:
    r15 += 4;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
}

void gfcd_ExecMove(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(pr);
    r14 = &gfcd_work;
    r12 = *(s32 *)r14;
    r0 = 0x0348;
    r0 = *(s32 *)(r0 + r12);
    if (r0 == 1) slot(r13 = r4) {
        r5 = 0x035C;
        r0 = 0x034C;
        r5 += r12;
        r3 = &CDC_GetFiltMode;
        (*r3)() slot(r4 = *(s32 *)(r0 + r12));
        r2 = *(s32 *)r13;
        r2 += 1;
        __bsr gfcd_UpdStat() slot(*(s32 *)r13 = r2);
        r5 = 0;
        r4 = *(s32 *)r14;
        r0 = 0x034C;
        r3 = &CDC_SetFiltMode;
        (*r3)() slot(r4 = *(s32 *)(r0 + r4));
        r4 = r0;
        if (r4) {
            goto L0606ECE6 slot(r0 = 1);
            __nopool;
        }
        __bsr gfcd_UpdStat();
        r2 = *(s32 *)r13;
        r2 += 1;
        *(s32 *)r13 = r2;
        r2 = 2;
        r0 = 0x0348;
        r3 = *(s32 *)r14;
        *(s32 *)(r0 + r3) = r2;
    }
    r0 = *(s32 *)r14;
    r1 = 0x0348;
    r0 = *(s32 *)(r0 + r1);
    if (r0 == 2) {
        r7 = *(s32 *)r14;
        r0 = 0x034C;
        r6 = *(s32 *)r14;
        r7 = *(s32 *)(r0 + r7);
        r5 = *(s32 *)r14;
        r0 += 12;
        r4 = *(s32 *)r14;
        r6 = *(s32 *)(r0 + r6);
        r3 = &CDC_MoveSctData;
        r0 += -4;
        r5 = *(s32 *)(r0 + r5);
        r0 += -4;
        (*r3)() slot(r4 = *(s32 *)(r0 + r4));
        r4 = r0;
        if (r4) {
            goto L0606ECE6 slot(r0 = 1);
            __nopool;
        }
        __bsr gfcd_UpdStat();
        r2 = *(s32 *)r13;
        r0 = 0x0348;
        r2 += 1;
        *(s32 *)r13 = r2;
        r2 = 3;
        r3 = *(s32 *)r14;
        *(s32 *)(r0 + r3) = r2;
    }
    r0 = *(s32 *)r14;
    r1 = 0x0348;
    r0 = *(s32 *)(r0 + r1);
    if (r0 != 3) goto L0606EC7C;
    r4 = 0x0100;
    __bsr gfcd_TestHirq();
    if (!r0) goto L0606EC7C;
    r3 = *(s32 *)r14;
    r2 = 4;
    r0 = 0x0348;
    *(s32 *)(r0 + r3) = r2;
L0606EC7C:
    r0 = *(s32 *)r14;
    r1 = 0x0348;
    r0 = *(s32 *)(r0 + r1);
    if (r0 == 4) {
        r5 = *(s32 *)r14;
        r0 = 0x035C;
        r5 = *(s32 *)(r0 + r5);
        r4 = *(s32 *)r14;
        r0 += -16;
        r3 = &CDC_SetFiltMode;
        (*r3)() slot(r4 = *(s32 *)(r0 + r4));
        r4 = r0;
        if (r4) {
            goto L0606ECE6 slot(r0 = 1);
        }
        r3 = *(s32 *)r13;
        r3 += 1;
        *(s32 *)r13 = r3;
        r3 = 5;
        r0 = *(s16 *)&L0606ED8E;
        r2 = *(s32 *)r14;
        *(s32 *)(r0 + r2) = r3;
    }
    r0 = *(s32 *)r14;
    r1 = *(s16 *)&L0606ED8E;
    r0 = *(s32 *)(r0 + r1);
    if (r0 != 5) goto L0606ECE0;
    __bsr gfcd_TestHirq() slot(r4 = 64);
    if (r0 != 1) goto L0606ECE0;
    r2 = *(s32 *)r14;
    r3 = 0;
    r0 = *(s16 *)&L0606ED8E;
    *(s32 *)(r0 + r2) = r3;
L0606ECE0:
    r0 = *(s32 *)r14;
    r1 = *(s16 *)&L0606ED8E;
    r0 = *(s32 *)(r0 + r1);
L0606ECE6:
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfcd_ExecChgDir(void)
{
    push(r14);
    push(r13);
    push(r12);
    r12 = -1;
    r14 = *(s32 *)&L0606ED98;
    push(r11);
    push(r10);
    r11 = r4;
    r1 = *(s16 *)&L0606ED90;
    push(pr);
    r10 = *(s32 *)&L0606ED94;
    r15 += -24;
    r0 = *(s32 *)r14;
    r0 = *(s32 *)(r0 + r1);
    if (r0 != 1) goto L0606EDAE slot(r13 = 0);
    r6 = r15;
    r6 += 8;
    r5 = r15;
    r5 += 4;
    r4 = r15;
    (*r10)();
    r4 = r0;
    if (r4) {
        r3 = *(s32 *)r14;
        r0 = *(s16 *)&L0606ED90;
        *(s32 *)(r0 + r3) = r13;
        r3 = *(s32 *)r14;
        r0 += 8;
        r2 = *(s32 *)(r0 + r3);
        *(s32 *)r2 = r12;
        goto L0606EEB8 slot(r0 = -11);
        __nopool;
    }
    r3 = *(s32 *)r11;
    r3 += 1;
    *(s32 *)r11 = r3;
    r4 = *(s32 *)r14;
    r0 = *(s16 *)&L0606ED92;
    r4 = *(s16 *)(r0 + r4);
    if (!r4) goto L0606ED5E;
    r0 = r4;
    if (r0 == 1) goto L0606ED5E;
    r2 = *(s32 *)r15;
    if (r2 > r4) goto L0606ED6A;
    r3 = *(s32 *)(r15 + 4);
    r1 = *(s32 *)r15;
    r1 += r3;
    if (r4 >= r1) goto L0606ED6A;
L0606ED5E:
    r2 = 3;
    r0 = *(s16 *)&L0606ED90;
    r3 = *(s32 *)r14;
    *(s32 *)(r0 + r3) = r2;
    goto L0606EDAE;
    __nopool;
L0606ED6A:
    r5 = *(s32 *)r14;
    r0 = *(s16 *)&L0606ED92;
    r5 = *(s16 *)(r0 + r5);
    r3 = *(s32 *)&L0606ED9C;
    (*r3)() slot(r4 = 23);
    r4 = r0;
    if (!r4) goto L0606EDA0;
    r3 = *(s32 *)r14;
    r0 = *(s16 *)&L0606ED90;
    *(s32 *)(r0 + r3) = r13;
    r0 += 8;
    r3 = *(s32 *)r14;
    r2 = *(s32 *)(r0 + r3);
    *(s32 *)r2 = r12;
    goto L0606EEB8 slot(r0 = -11);
    __data {
    L0606ED8E:
        u16 0x0348;
    L0606ED90:
        u16 0x0360;
    L0606ED92:
        u16 0x0364;
    L0606ED94:
        u32 &CDC_GetFileScope;
    L0606ED98:
        u32 &gfcd_work;
    L0606ED9C:
        u32 &CDC_ReadDir;
    }
L0606EDA0:
    r3 = *(s32 *)r11;
    r3 += 1;
    *(s32 *)r11 = r3;
    r3 = 2;
    r0 = 0x0360;
    r2 = *(s32 *)r14;
    *(s32 *)(r0 + r2) = r3;
L0606EDAE:
    r0 = *(s32 *)r14;
    r1 = 0x0360;
    r0 = *(s32 *)(r0 + r1);
    if (r0 != 2) goto L0606EE0E;
    r4 = 0x0200;
    __bsr gfcd_TestHirq();
    if (!r0) goto L0606EE0E;
    r6 = r15;
    r6 += 8;
    r5 = r15;
    r5 += 4;
    r4 = r15;
    (*r10)();
    r4 = r0;
    if (!r4) {
        r2 = &gfcd_work;
        r0 = 0x0364;
        r3 = *(s32 *)r2;
        r1 = *(s16 *)(r0 + r3);
        r3 = *(s32 *)r15;
        if (r1 >= r3) goto L0606EE06;
        r3 = *(s32 *)(r15 + 4);
        r1 = *(s32 *)r15;
        r0 = *(s32 *)r2;
        r1 += r3;
        r3 = 0x0364;
        r3 = *(s16 *)(r0 + r3);
        if (r1 > r3) goto L0606EE06;
    }
    r3 = *(s32 *)r14;
    r0 = 0x0360;
    *(s32 *)(r0 + r3) = r13;
    r0 += 8;
    r3 = *(s32 *)r14;
    r2 = *(s32 *)(r0 + r3);
    *(s32 *)r2 = r12;
    goto L0606EEB8 slot(r0 = -11);
    __nopool;
L0606EE06:
    r2 = 3;
    r0 = 0x0360;
    r3 = *(s32 *)r14;
    *(s32 *)(r0 + r3) = r2;
L0606EE0E:
    r0 = *(s32 *)r14;
    r1 = 0x0360;
    r0 = *(s32 *)(r0 + r1);
    if (r0 == 3) {
        r4 = r15;
        r4 += 12;
        __bsr gfcd_GetStat();
        r3 = &gfcd_err;
        r4 = *(s32 *)r3;
        if (r4) {
            goto L0606EEB8 slot(r0 = r4);
            __nopool;
        }
        r5 = *(s32 *)r14;
        r0 = 0x0364;
        r4 = *(s32 *)r14;
        r5 = *(s16 *)(r0 + r5);
        r3 = &CDC_ChgDir;
        r0 += 2;
        (*r3)() slot(r4 = *(s16 *)(r0 + r4));
        r4 = r0;
        if (r4) {
            goto L0606EEB8 slot(r0 = 1);
            __nopool;
        }
        __bsr gfcd_UpdStat();
        r2 = *(s32 *)r11;
        r0 = 0x0360;
        r2 += 1;
        *(s32 *)r11 = r2;
        r2 = 4;
        r3 = *(s32 *)r14;
        *(s32 *)(r0 + r3) = r2;
    }
    r0 = *(s32 *)r14;
    r1 = 0x0360;
    r0 = *(s32 *)(r0 + r1);
    if (r0 != 4) goto L0606EEB2;
    r4 = 0x0200;
    __bsr gfcd_TestHirq();
    if (!r0) goto L0606EEB2;
    r3 = *(s32 *)r14;
    r6 = r15;
    r0 = 0x0360;
    r5 = r15;
    r6 += 8;
    r5 += 4;
    r4 = r15;
    (*r10)() slot(*(s32 *)(r0 + r3) = r13);
    r4 = r0;
    if (r4) {
        r3 = *(s32 *)r14;
        r0 = 0x0360;
        *(s32 *)(r0 + r3) = r13;
        r0 += 8;
        r3 = *(s32 *)r14;
        r2 = *(s32 *)(r0 + r3);
        *(s32 *)r2 = r12;
        goto L0606EEB8 slot(r0 = -11);
    }
    r3 = *(s32 *)r14;
    r0 = *(s16 *)&L0606EFA6;
    r1 = *(s32 *)(r15 + 4);
    r2 = *(s32 *)(r0 + r3);
    *(s32 *)r2 = r1;
L0606EEB2:
    r0 = *(s32 *)r14;
    r1 = *(s16 *)&L0606EFA8;
    r0 = *(s32 *)(r0 + r1);
L0606EEB8:
    r15 += 24;
    pop(pr);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfcd_ExecCon(void)
{
    push(r14);
    push(r13);
    push(r12);
    r12 = 0;
    r14 = *(s32 *)&L0606EFB4;
    push(r11);
    push(r10);
    r10 = 1;
    r11 = *(s16 *)&L0606EFAA;
    push(r9);
    push(r8);
    r9 = 2;
    push(pr);
    r15 += -4;
    r8 = *(s32 *)&L0606EFB0;
    *(s32 *)r15 = r4;
    goto L0606EF86 slot(r13 = r12);
    __nopool;
L0606EEEC:
    r0 = *(s32 *)r14;
    r3 = r13;
    r2 = r13;
    r3 <<= 1;
    r3 += r2;
    r3 <<= 2;
    r2 = *(s16 *)&L0606EFAC;
    r3 = (s16)r3;
    r0 += r2;
    r0 += r3;
    r0 = *(s32 *)(r0 + 4);
    if (r0 == -2) slot(r0 = *(s32 *)r14) {
        r5 = r12;
        goto L0606EF26 slot(r6 = r11);
        __nopool;
    }
    r5 = r10;
    r6 = *(s32 *)r14;
    r3 = r13;
    r1 = r13;
    r3 <<= 1;
    r3 += r1;
    r3 <<= 2;
    r1 = *(s16 *)&L0606EFAC;
    r3 = (s16)r3;
    r6 += r1;
    r6 += r3;
    r6 = *(s32 *)(r6 + 4);
L0606EF26:
    r3 = r13;
    r2 = r13;
    r3 <<= 1;
    r3 += r2;
    r3 <<= 2;
    r2 = *(s16 *)&L0606EFAC;
    r3 = (s16)r3;
    r0 += r2;
    r0 += r3;
    r0 = *(s32 *)(r0 + 8);
    if (r0 == -2) slot(r4 = *(s32 *)r14) {
        goto L0606EF5C slot(r7 = r11);
        __nopool;
    }
    r7 = *(s32 *)r14;
    r3 = r13;
    r5 |= r9;
    r1 = r13;
    r3 <<= 1;
    r3 += r1;
    r1 = *(s16 *)&L0606EFAC;
    r3 <<= 2;
    r3 = (s16)r3;
    r7 += r1;
    r7 += r3;
    r7 = *(s32 *)(r7 + 8);
L0606EF5C:
    r3 = r13;
    r2 = r13;
    r3 <<= 1;
    r3 += r2;
    r2 = *(s16 *)&L0606EFAC;
    r3 <<= 2;
    r3 = (s16)r3;
    r4 += r2;
    r4 += r3;
    (*r8)() slot(r4 = *(s32 *)r4);
    r4 = r0;
    if (r4) goto L0606EF90;
    __bsr gfcd_UpdStat();
    r3 = *(s32 *)r15;
    r13 += 1;
    r2 = *(s32 *)r3;
    r2 += 1;
    *(s32 *)r3 = r2;
L0606EF86:
    r3 = *(s32 *)r14;
    r0 = *(s16 *)&L0606EFAE;
    r2 = *(s32 *)(r0 + r3);
    if (!(r13 >= r2)) goto L0606EEEC;
L0606EF90:
    r1 = *(s32 *)r14;
    r0 = *(s16 *)&L0606EFAE;
    r3 = *(s32 *)(r0 + r1);
    if (r13 >= r3) {
        r1 = *(s32 *)r14;
        r0 = *(s16 *)&L0606EFAE;
        goto L0606F014 slot(*(s32 *)(r0 + r1) = r12);
        __nopool;
    }
    goto L0606F004 slot(r4 = r12);
    __data {
    L0606EFA6:
        u16 0x0368;
    L0606EFA8:
        u16 0x0360;
    L0606EFAA:
        u16 0x00FF;
    L0606EFAC:
        u16 0x01E4;
    L0606EFAE:
        u16 0x01DC;
    L0606EFB0:
        u32 &CDC_SetFiltCon;
    L0606EFB4:
        u32 &gfcd_work;
    }
L0606EFB8:
    r7 = *(s32 *)r14;
    r5 = r4;
    r3 = 0x01E4;
    r2 = r4;
    r7 += r3;
    r5 <<= 1;
    r5 += r2;
    r5 <<= 2;
    r5 = (s16)r5;
    r1 = r7;
    r1 += r5;
    r6 = r13;
    r2 = r13;
    r6 <<= 1;
    r6 += r2;
    r6 <<= 2;
    r6 = (s16)r6;
    r0 = r7;
    r2 = *(s32 *)(r0 + r6);
    *(s32 *)r1 = r2;
    r7 = *(s32 *)r14;
    r2 = r3;
    r7 += r2;
    r1 = r7;
    r1 += r5;
    r0 = r7;
    r0 += r6;
    r0 = *(s32 *)(r0 + 4);
    *(s32 *)(r1 + 4) = r0;
    r1 = r2;
    r7 = *(s32 *)r14;
    r7 += r1;
    r5 += r7;
    r6 += r7;
    r3 = *(s32 *)(r6 + 8);
    r13 += 1;
    *(s32 *)(r5 + 8) = r3;
    r4 += 1;
L0606F004:
    r2 = *(s32 *)r14;
    r0 = 0x01DC;
    r3 = *(s32 *)(r0 + r2);
    if (!(r13 >= r3)) goto L0606EFB8;
    r1 = *(s32 *)r14;
    r0 = 0x01DC;
    *(s32 *)(r0 + r1) = r4;
L0606F014:
    __bsr gfcd_TestHirq() slot(r4 = 64);
    if (!r0) goto L0606F02C;
    r3 = *(s32 *)r14;
    r0 = 0x01DC;
    r0 = *(s32 *)(r0 + r3);
    if (r0) goto L0606F02C;
    r2 = *(s32 *)r14;
    r0 = 0x01E0;
    *(s32 *)(r0 + r2) = r12;
L0606F02C:
    r0 = *(s32 *)r14;
    r1 = 0x01DC;
    r0 = *(s32 *)(r0 + r1);
    r15 += 4;
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

void gfcd_TestHirq(void)
{
    push(pr);
    r3 = &CDC_GetHirqReq;
    r15 += -4;
    *(s32 *)r15 = r4;
    (*r3)();
    r4 = r0;
    r0 = *(s32 *)r15;
    if ((r0 & r4) != 0) {
        r15 += 4;
        pop(pr);
        return slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
    r15 += 4;
    pop(pr);
    return;
    __nopool;
}

void gfcd_ResetWork(void)
{
    r5 = &gfcd_work;
    r4 = 0;
    r7 = 23;
    r6 = r4;
    do {
        r0 = *(s32 *)r5;
        *(s8 *)(r0 + r6) = r4;
        r0 = *(s32 *)r5;
        r3 = r0;
        r3 += 24;
        r3 += r6;
        r6 += 1;
    } while (!(r6 >= r7)) slot(*(s8 *)r3 = r4);
    r3 = *(s32 *)r5;
    r6 = -1;
    *(s32 *)(r3 + 48) = r4;
    r0 = 76;
    r2 = *(s32 *)r5;
    *(s32 *)(r2 + 52) = r6;
    r3 = *(s32 *)r5;
    *(s32 *)(r3 + 56) = r6;
    r2 = *(s32 *)r5;
    *(s32 *)(r2 + 60) = r4;
    r3 = *(s32 *)r5;
    *(s32 *)(r0 + r3) = r4;
    r3 = *(s32 *)r5;
    r0 = 80;
    *(s32 *)(r0 + r3) = r4;
    r0 = 84;
    r3 = *(s32 *)r5;
    *(s32 *)(r0 + r3) = r4;
    r3 = *(s32 *)r5;
    r0 = 88;
    *(s32 *)(r0 + r3) = r4;
    r3 = *(s32 *)r5;
    r0 = 0x0304;
    *(s32 *)(r0 + r3) = r4;
    r3 = *(s32 *)r5;
    r0 += 8;
    *(s32 *)(r0 + r3) = r4;
    r0 += 28;
    r3 = *(s32 *)r5;
    *(s32 *)(r0 + r3) = r4;
    r3 = *(s32 *)r5;
    r0 += 16;
    *(s32 *)(r0 + r3) = r4;
    r0 += 16;
    r3 = *(s32 *)r5;
    *(s32 *)(r0 + r3) = r4;
    r3 = *(s32 *)r5;
    r0 += 24;
    *(s32 *)(r0 + r3) = r4;
    r3 = *(s32 *)r5;
    r0 = 0x01DC;
    *(s32 *)(r0 + r3) = r4;
    r3 = *(s32 *)r5;
    r0 += 4;
    return slot(*(s32 *)(r0 + r3) = r4);
    __nopool;
}

void gfcd_UpdStat(void)
{
    push(pr);
    r15 += -12;
    r3 = &CDC_GetLastStat;
    r4 = r15;
    (*r3)();
    r3 = &gfcd_work;
    r1 = r15;
    r2 = *(s32 *)r3;
    r0 = *(s8 *)r1;
    r1 = 64;
    r1 += r2;
    *(s8 *)r1 = r0;
    r15 += 12;
    pop(pr);
    return;
    __nopool;
}

void gfcd_SetCallback(void)
{
    r0 = 76;
    r6 = &gfcd_work;
    r3 = *(s32 *)r6;
    *(s32 *)(r0 + r3) = r4;
    r0 = 80;
    r3 = *(s32 *)r6;
    return slot(*(s32 *)(r0 + r3) = r5);
}

void gfcd_TestScdq(void)
{
    push(pr);
    r3 = &CDC_GetHirqReq;
    (*r3)();
    r2 = 0x0400;
    if ((r0 & r2) != 0) {
        pop(pr);
        return slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
    pop(pr);
    return;
    __nopool;
}

void gfcd_ClrScdq(void)
{
    r4 = __w(0xFBFF);
    r3 = &CDC_ClrHirqReq;
    goto *r3;
    __nopool;
}

void gfcd_WaitScdq(void)
{
    push(r14);
    r14 = 0;
    push(r13);
    push(pr);
    r13 = 0x5F34;
L0606F15A:
    __bsr gfcd_TestScdq();
    if (r0 == 1) {
        __bsr gfcd_ClrScdq();
        goto L0606F172 slot(r0 = 0);
        __nopool;
    }
    r14 += 1;
    if (!(r14 >= r13)) goto L0606F15A;
    r0 = 1;
L0606F172:
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfcd_WaitPause(void)
{
    push(r14);
    push(r13);
    r14 = 15;
    push(r12);
    r13 = 0;
    push(pr);
    r15 += -12;
    r12 = 0x00069CB5;
    do {
        r4 = r15;
        r3 = &gfcd_GetStat;
        (*r3)();
        r0 = r15;
        r0 = *(s8 *)r0;
        r0 = (u8)r0;
        r0 &= r14;
        if (r0 == 1) goto L0606F1B8;
        r0 = r15;
        r0 = *(s8 *)r0;
        r0 = (u8)r0;
        r0 &= r14;
        if (r0 == 2) goto L0606F1B8;
        r3 = &gfcd_err;
        r0 = *(s32 *)r3;
        if (r0) goto L0606F1B8;
        r13 += 1;
    } while (!(r13 >= r12));
L0606F1B8:
    r15 += 12;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
}

