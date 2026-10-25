/* sbl/stm_cdplay: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is stm_cdplay.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.0606A748");

void stm_GetCurFad(void)
{
    push(r14);
    push(pr);
    r14 = &CDC_GetCurStat;
    r15 += -12;
    do {
        r4 = r15;
        (*r14)();
        r4 = r0;
    } while (r4);
    r0 = r15;
    r0 = *(s32 *)(r0 + 8);
    r15 += 12;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void stm_GetFadRange(void)
{
    push(r14);
    r14 = 0;
    push(r13);
    r7 = r14;
    push(pr);
    r13 = r5;
    r15 += -12;
    r3 = r15;
    *(s32 *)(r15 + 8) = r6;
    r3 += 4;
    push(r3);
    r6 = r13;
    push(r14);
    push(r14);
    r3 = &gfsFlow_GetFinfo;
    r2 = r15;
    r2 += 12;
    push(r2);
    (*r3)() slot(r5 = r14);
    r15 += 16;
    r0 = *(s32 *)(r15 + 4);
    if ((r0 & 6) == 0) {
        r2 = *(s32 *)(r15 + 8);
        r3 = *(s32 *)r15;
        r1 = *(s32 *)r13;
        r1 += r3;
        r1 += -1;
        goto L0606A7AE slot(*(s32 *)r2 = r1);
        __nopool;
    }
    r4 = 0x7FFFFFFF;
    *(s32 *)r13 = r4;
    r2 = *(s32 *)(r15 + 8);
    *(s32 *)r2 = r4;
L0606A7AE:
    r15 += 12;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void stm_CdPlayObj(void)
{
    push(r14);
    r14 = 0;
    push(r13);
    push(r12);
    push(pr);
    r12 = r4;
    r15 += -28;
    r6 = r15;
    r4 = *(s32 *)(r12 + 12);
    r5 = r15;
    r13 = *(s32 *)(r12 + 20);
    r5 += 4;
    __bsr stm_GetFadRange() slot(r4 = *(s32 *)(r4 + 20));
    r2 = *(s32 *)r15;
    if (!(r2 >= r13)) goto L0606A82C;
    r4 = 1;
    r2 = r15;
    r2 += 8;
    *(s32 *)r2 = r4;
    r3 = r15;
    r3 += 8;
    r2 = r15;
    *(s32 *)(r3 + 4) = r13;
    r0 = 16;
    r2 += 8;
    r3 = r15;
    *(s32 *)(r2 + 8) = r4;
    r3 += 8;
    r2 = *(s32 *)r15;
    r2 -= r13;
    r2 += r4;
    r4 = r15;
    *(s32 *)(r3 + 12) = r2;
    r4 += 8;
    r3 = r15;
    r3 += 8;
    r2 = 0;
    *(s8 *)(r0 + r3) = r2;
    r3 = &gfcd_Play;
    (*r3)() slot(r5 = *(s32 *)(r12 + 52));
    if (r0 == -13) slot(r14 = r0) {
        goto L0606A82C slot(r14 = -23);
        __nopool;
    }
    if (r14) {
        goto L0606A82C slot(r14 = -1);
        __nopool;
    }
    r4 = &stm_mng;
    r2 = *(s32 *)r4;
    *(s32 *)(r2 + 20) = r13;
    r3 = *(s32 *)r4;
    r2 = *(s32 *)r15;
    *(s32 *)(r3 + 24) = r2;
L0606A82C:
    r0 = r14;
    r15 += 28;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void stm_CdPause(void)
{
    r2 = 3;
    push(pr);
    r15 += -12;
    *(s32 *)r15 = r4;
    r3 = r15;
    r3 += 4;
    r4 = r15;
    *(s32 *)r3 = r2;
    r4 += 4;
    r5 = *(s32 *)r15;
    r3 = &gfcd_Seek;
    (*r3)() slot(r5 = *(s32 *)(r5 + 52));
    if (r0 == -13) slot(r4 = r0) {
        r15 += 12;
        pop(pr);
        return slot(r0 = -23);
        __nopool;
    }
    if (r4) {
        r15 += 12;
        pop(pr);
        return slot(r0 = -1);
        __nopool;
    }
    r6 = -1;
    r5 = &stm_mng;
    r0 = r4;
    r3 = *(s32 *)r5;
    *(s32 *)(r3 + 20) = r6;
    r2 = *(s32 *)r5;
    *(s32 *)(r2 + 24) = r6;
    r15 += 12;
    pop(pr);
    return;
}

