/* sbl/0606D4B4: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is 0606D4B4.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.0606D4B4");

void gfcf_Open(void)
{
    push(r14);
    r5 = r4;
    push(r13);
    r14 = r4;
    push(pr);
    r13 = 0;
    r15 += -16;
    r14 += 28;
    *(s32 *)r14 = r13;
    r3 = 1;
    *(s32 *)(r14 + 24) = r3;
    r2 = r15;
    r0 = *(s8 *)(r5 + 14);
    r3 = r15;
    r2 += 8;
    r3 += 8;
    *(s8 *)r2 = r0;
    r0 = r13;
    *(s8 *)(r3 + 1) = r0;
    r3 = r15;
    r3 += 8;
    *(s8 *)(r3 + 2) = r0;
    r3 = r15;
    r3 += 8;
    *(s8 *)(r3 + 3) = r0;
    r3 = r15;
    r3 += 8;
    *(s8 *)(r3 + 4) = r0;
    r3 = r15;
    r3 += 8;
    *(s8 *)(r3 + 5) = r0;
    r1 = r14;
    r3 = &_slow_mvn;
    r2 = r15;
    r1 += 16;
    r2 += 8;
    (*r3)() slot(r0 = 6);
    r3 = &gfcd_AllocBuf;
    r2 = -1;
    *(s32 *)(r14 + 28) = r2;
    r4 = r15;
    *(s32 *)(r14 + 36) = r13;
    r4 += 4;
    *(s32 *)(r14 + 32) = r13;
    *(s32 *)(r14 + 44) = r13;
    (*r3)() slot(*(s32 *)(r14 + 40) = r13);
    if (r0) {
        goto L0606D586 slot(r0 = 0);
        __nopool;
    }
    r3 = *(s32 *)(r15 + 4);
    r4 = r15;
    *(s32 *)(r14 + 4) = r3;
    r3 = &gfcd_AllocFilt;
    (*r3)();
    if (r0) {
        r4 = *(s32 *)(r15 + 4);
        r3 = &gfcd_FreeBuf;
        (*r3)();
        goto L0606D586 slot(r0 = 0);
        __nopool;
    }
    r2 = *(s32 *)r15;
    r7 = r13;
    r3 = &gfcd_SetFilt;
    *(s32 *)(r14 + 12) = r2;
    push(r13);
    r6 = r15;
    r4 = *(s32 *)(r15 + 4);
    r6 += 12;
    (*r3)() slot(r5 = *(s32 *)(r14 + 24));
    if (r0) slot(r15 += 4) {
        goto L0606D586 slot(r0 = 0);
        __nopool;
    }
    r6 = 0x00FF;
    r5 = *(s32 *)(r15 + 4);
    r4 = *(s32 *)r15;
    r3 = &gfcd_SetFiltCon;
    (*r3)();
    if (r0) {
        goto L0606D586 slot(r0 = 0);
        __nopool;
    }
    r3 = &gfcd_WaitServer;
    (*r3)();
    if (r0) {
        goto L0606D586 slot(r0 = 0);
        __nopool;
    }
    __bsr gfcf_Flush() slot(r4 = r14);
    if (r0) {
        goto L0606D586 slot(r0 = 0);
        __nopool;
    }
    r0 = 1;
L0606D586:
    r15 += 16;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfcf_Close(void)
{
    push(pr);
    r15 += -4;
    r3 = &gfcd_FreeBuf;
    *(s32 *)r15 = r4;
    (*r3)() slot(r4 = *(s32 *)(r4 + 4));
    r4 = *(s32 *)r15;
    r4 = *(s32 *)(r4 + 12);
    r3 = &gfcd_FreeFilt;
    r15 += 4;
    return (*r3)() slot(pop(pr));
    __nopool;
}

void gfcf_GetNumSct(void)
{
    push(r14);
    push(r13);
    push(r12);
    r13 = r6;
    r3 = &gfcd_GetSctNum;
    push(pr);
    r15 += -24;
    *(s32 *)(r15 + 16) = r4;
    *(s32 *)(r15 + 20) = r5;
    r14 = *(s32 *)(r15 + 16);
    push(r6);
    r14 += 28;
    r6 = *(s32 *)(r15 + 24);
    r7 = r15;
    r5 = *(s32 *)(r14 + 36);
    r7 += 4;
    (*r3)() slot(r4 = *(s32 *)(r14 + 4));
    r4 = r0;
    if (r4) slot(r15 += 4) {
        goto L0606D65A slot(r0 = 0);
    }
    r3 = &gfcd_WaitServer;
    (*r3)();
    if (r0) {
        goto L0606D65A slot(r0 = 0);
        __nopool;
    }
    if (!r13) goto L0606D658;
    r12 = 0;
    push(r12);
    r6 = r12;
    push(r12);
    r3 = r15;
    r3 += 12;
    push(r3);
    r3 = &gfsFlow_GetFinfo;
    r2 = r15;
    r2 += 24;
    push(r2);
    r4 = *(s32 *)(r15 + 32);
    r7 = r15;
    r7 += 24;
    (*r3)() slot(r5 = r12);
    r15 += 16;
    __bsr gfcf_Tell() slot(r4 = r14);
    r3 = *(s32 *)r15;
    r0 += r3;
    r2 = *(s32 *)(r15 + 12);
    if (!(r0 >= r2)) goto L0606D658;
    r0 = *(s32 *)(r15 + 4);
    if (!r0) goto L0606D658;
    if (r3 <= 0) goto L0606D658;
    r3 = *(s32 *)(r15 + 4);
    r2 = *(s32 *)(r15 + 8);
    r1 = *(s32 *)r13;
    r2 -= r3;
    r1 -= r2;
    *(s32 *)r13 = r1;
L0606D658:
    r0 = *(s32 *)r15;
L0606D65A:
    r15 += 24;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfcf_Dummy0(void)
{
    return slot(r0 = 0);
    __nopool;
}

void gfcf_SetFilt(void)
{
    r2 = r6;
    r3 = &_slow_mvn;
    push(r14);
    push(pr);
    r14 = r4;
    *(s32 *)(r14 + 24) = r5;
    r1 = r14;
    r1 += 16;
    (*r3)() slot(r0 = 6);
    r2 = 0;
    r3 = &gfcd_SetFilt;
    r7 = r2;
    push(r2);
    (*r3)() slot(r4 = *(s32 *)(r14 + 12));
    r4 = r0;
    if (!r4) slot(r15 += 4) {
        pop(pr);
        r3 = &gfcd_WaitServer;
        return (*r3)() slot(pop(r14));
        __nopool;
    }
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void gfcf_Flush(void)
{
    push(pr);
    r6 = -1;
    r3 = &gfcd_DelSct;
    r5 = 0;
    r15 += -4;
    *(s32 *)r15 = r4;
    (*r3)() slot(r4 = *(s32 *)(r4 + 4));
    r2 = &gfcd_WaitServer;
    r15 += 4;
    return (*r2)() slot(pop(pr));
    __nopool;
}

void gfcf_Tell(void)
{
    r3 = *(s32 *)(r4 + 36);
    r0 = *(s32 *)(r4 + 32);
    return slot(r0 += r3);
    __nopool;
}

void gfcf_GetBufSct(void)
{
    push(pr);
    r3 = 0;
    r6 = 0x0000FFFF;
    r15 += -8;
    r2 = &gfcd_GetSctNum;
    r5 = r3;
    *(s32 *)(r15 + 4) = r4;
    push(r3);
    r4 = *(s32 *)(r15 + 8);
    r7 = r15;
    r7 += 4;
    (*r2)() slot(r4 = *(s32 *)(r4 + 4));
    r4 = r0;
    if (r4) slot(r15 += 4) {
        r15 += 8;
        pop(pr);
        return slot(r0 = -1);
        __nopool;
    }
    r3 = &gfcd_WaitServer;
    (*r3)();
    if (r0) {
        r15 += 8;
        pop(pr);
        return slot(r0 = -1);
        __nopool;
    }
    r3 = *(s32 *)r15;
    if (r3 < 0) {
        r1 = 0;
        *(s32 *)r15 = r1;
    }
    r0 = *(s32 *)r15;
    r15 += 8;
    pop(pr);
    return;
    __nopool;
}

void gfcf_Seek(void)
{
    push(r14);
    push(r13);
    push(r12);
    r13 = r5;
    push(r11);
    T = r13 >= 0;
    push(pr);
    r11 = r4;
    r15 += -4;
    r14 = r11;
    *(s32 *)r15 = r6;
    if (!T) slot(r14 += 28) {
        r13 = 0;
    }
    r0 = *(s32 *)r15;
    if (r0 == 1) {
        r12 = r13;
        __bsr gfcf_Tell() slot(r4 = r14);
        r13 = r0;
        goto L0606D758 slot(r13 += r12);
        __nopool;
    }
    __bsr gfcf_Tell() slot(r4 = r14);
    if (r0 == r13) {
        goto L0606D7E6 slot(r0 = r13);
        __nopool;
    }
    __bsr gfcf_GetBufSct() slot(r4 = r14);
    r12 = r0;
    if (r12 >= 0) goto L0606D758;
    goto L0606D7E6 slot(r0 = -1);
    __nopool;
L0606D758:
    r0 = 76;
    r1 = *(s32 *)(r0 + r11);
    if (r1) goto L0606D798;
    r3 = *(s32 *)(r14 + 32);
    if (r3 > r13) goto L0606D774;
    __bsr gfcf_Tell() slot(r4 = r14);
    if (r13 >= r0) goto L0606D774;
    r12 = r13;
    r3 = *(s32 *)(r14 + 32);
    r12 -= r3;
L0606D774:
    if (r12 <= 0) goto L0606D790;
    r3 = &gfcd_DelSct;
    r6 = r12;
    r5 = 0;
    (*r3)() slot(r4 = *(s32 *)(r14 + 4));
    r2 = &gfcd_WaitServer;
    (*r2)();
    if (!r0) goto L0606D790;
    goto L0606D7E6 slot(r0 = -1);
    __nopool;
L0606D790:
    *(s32 *)(r14 + 32) = r13;
    r3 = 0;
    goto L0606D7D6 slot(*(s32 *)(r14 + 36) = r3);
    __nopool;
L0606D798:
    r0 = 76;
    r0 = *(s32 *)(r0 + r11);
    if (r0 != 1) goto L0606D7D6;
    r0 = *(s32 *)r15;
    if (r0 != 1) goto L0606D7B4;
    __bsr gfcf_GetBufSct() slot(r4 = r14);
    r12 = r0;
    if (r12 >= 0) goto L0606D7B4;
    goto L0606D7E6 slot(r0 = -1);
    __nopool;
L0606D7B4:
    r4 = *(s32 *)(r14 + 32);
    if (r13 >= r4) {
        r12 += r4;
        r12 += 1;
        if (!(r13 > r12)) goto L0606D7D0;
    }
    __bsr gfcf_Flush() slot(r4 = r14);
    if (r0) {
        goto L0606D7E6 slot(r0 = -1);
        __nopool;
    }
    *(s32 *)(r14 + 32) = r13;
L0606D7D0:
    r3 = *(s32 *)(r14 + 32);
    r13 -= r3;
    *(s32 *)(r14 + 36) = r13;
L0606D7D6:
    r4 = r14;
    r15 += 4;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    goto gfcf_Tell slot(pop(r14));
    __nopool;
L0606D7E6:
    r15 += 4;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
}

void gfcf_StartPickup(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(pr);
    r3 = &gfs_mng;
    r15 += -28;
    r2 = 0x0438;
    *(s32 *)(r15 + 20) = r4;
    *(s32 *)(r15 + 24) = r5;
    r12 = *(s32 *)(r15 + 20);
    r14 = *(s32 *)r3;
    r14 += r2;
    r0 = *(s32 *)(r14 + 16);
    if (r0) slot(r12 += 28) {
        goto L0606D8C8 slot(r0 = 0);
        __nopool;
    }
    r3 = r15;
    r3 += 4;
    push(r3);
    r7 = r15;
    r6 = *(s32 *)(r15 + 28);
    r7 += 4;
    r5 = *(s32 *)(r12 + 36);
    r3 = &gfcd_GetSctNum;
    (*r3)() slot(r4 = *(s32 *)(r12 + 4));
    if (r0) slot(r15 += 4) {
        goto L0606D8C8 slot(r0 = 0);
        __nopool;
    }
    r3 = &gfcd_WaitServer;
    (*r3)();
    if (r0) {
        goto L0606D8C8 slot(r0 = 0);
        __nopool;
    }
    r3 = *(s32 *)(r15 + 4);
    if (r3 <= 0) {
        goto L0606D8C8 slot(r0 = 0);
        __nopool;
    }
    r13 = 0;
    push(r13);
    r6 = r13;
    push(r13);
    r3 = r15;
    r3 += 16;
    push(r3);
    r3 = &gfsFlow_GetFinfo;
    r2 = r15;
    r2 += 28;
    push(r2);
    r4 = *(s32 *)(r15 + 36);
    r7 = r15;
    r7 += 28;
    (*r3)() slot(r5 = r13);
    r15 += 16;
    __bsr gfcf_Tell() slot(r4 = r12);
    r3 = *(s32 *)r15;
    r0 += r3;
    r2 = *(s32 *)(r15 + 16);
    if (!(r0 >= r2)) goto L0606D8B0;
    r0 = *(s32 *)(r15 + 8);
    if (!r0) goto L0606D8B0;
    if (r3 <= 0) goto L0606D8B0;
    r3 = *(s32 *)(r15 + 8);
    r2 = *(s32 *)(r15 + 12);
    r1 = *(s32 *)(r15 + 4);
    r2 -= r3;
    r1 -= r2;
    *(s32 *)(r15 + 4) = r1;
L0606D8B0:
    r3 = &CDC_GetDataPtr;
    (*r3)();
    *(s32 *)r14 = r0;
    *(s32 *)(r14 + 4) = r13;
    r0 = r14;
    r2 = *(s32 *)(r15 + 4);
    *(s32 *)(r14 + 8) = r2;
    r3 = *(s32 *)r15;
    r2 = 1;
    *(s32 *)(r14 + 12) = r3;
    *(s32 *)(r14 + 16) = r2;
L0606D8C8:
    r15 += 28;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfcf_StartTrans(void)
{
    push(pr);
    r15 += -8;
    r3 = &gfcd_StartTrans;
    *(s32 *)(r15 + 4) = r4;
    *(s32 *)r15 = r5;
    r6 = *(s32 *)(r15 + 4);
    r5 = *(s32 *)(r5 + 36);
    r6 = *(s32 *)(r6 + 12);
    r4 = *(s32 *)r15;
    (*r3)() slot(r4 = *(s32 *)(r4 + 4));
    r4 = r0;
    if (r4) {
        r15 += 8;
        pop(pr);
        return slot(r0 = 0);
        __nopool;
    }
    r3 = &gfcd_WaitServer;
    (*r3)();
    if (r0) {
        r15 += 8;
        pop(pr);
        return slot(r0 = 0);
        __nopool;
    }
    r0 = 1;
    r15 += 8;
    pop(pr);
    return;
    __nopool;
}

void gfcf_Dummy1(void)
{
    return slot(r0 = 0);
}

void gfcf_EndPickup(void)
{
    push(r14);
    push(pr);
    r3 = &gfcd_EndTrans;
    r15 += -12;
    *(s32 *)(r15 + 4) = r4;
    r4 = r15;
    *(s32 *)r15 = r5;
    r4 += 8;
    (*r3)() slot(r14 = r6);
    r0 = r14;
    if (r0 == -1) slot(r6 = 1) {
        r14 = *(s32 *)r15;
        r14 = *(s32 *)(r14 + 12);
    }
    r4 = *(s32 *)(r15 + 4);
    __bsr gfcf_Seek() slot(r5 = r14);
    r3 = 0;
    r2 = *(s32 *)r15;
    *(s32 *)(r2 + 16) = r3;
    r15 += 12;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void gfcf_CdSeek(void)
{
    r3 = &gfcd_Seek;
    r15 += -8;
    *(s32 *)(r15 + 4) = r4;
    *(s32 *)r15 = r5;
    r5 = *(s32 *)(r15 + 4);
    r5 = *(s32 *)(r5 + 28);
    r4 = *(s32 *)r15;
    goto *r3 slot(r15 += 8);
    __nopool;
}

void gfcf_SetCdCon(void)
{
    r5 = r4;
    r3 = &gfcd_SetCdCon;
    push(pr);
    r15 += -4;
    *(s32 *)r15 = r4;
    r5 = *(s32 *)(r5 + 28);
    (*r3)() slot(r4 = *(s32 *)(r4 + 12));
    r4 = r0;
    if (r4) {
        r15 += 4;
        pop(pr);
        return slot(r0 = 0);
        __nopool;
    }
    r3 = &gfcd_WaitServer;
    (*r3)();
    r4 = r0;
    if (r4) {
        r15 += 4;
        pop(pr);
        return slot(r0 = 0);
        __nopool;
    }
    r0 = 1;
    r15 += 4;
    pop(pr);
    return;
    __nopool;
}

void gfcf_Lock(void)
{
    push(pr);
    r3 = &gfcd_Lock;
    r15 += -4;
    *(s32 *)r15 = r4;
    (*r3)();
    r4 = r0;
    if (r4 < 0) {
        r15 += 4;
        pop(pr);
        return slot(r0 = 0);
        __nopool;
    }
    r3 = *(s32 *)r15;
    r0 = 1;
    *(s32 *)(r3 + 28) = r4;
    r15 += 4;
    pop(pr);
    return;
    __nopool;
}

void gfcf_IsLocked(void)
{
    r15 += -4;
    r3 = &gfcd_IsLocked;
    *(s32 *)r15 = r4;
    r4 = *(s32 *)(r4 + 28);
    goto *r3 slot(r15 += 4);
    __nopool;
}

void gfcf_Unlock(void)
{
    r15 += -4;
    r3 = &gfcd_Unlock;
    *(s32 *)r15 = r4;
    r4 = *(s32 *)(r4 + 28);
    goto *r3 slot(r15 += 4);
}

