/* sbl/0606F1E0: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is 0606F1E0.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.0606F1E0");

void CDC_GetCurStat(void)
{
    push(r14);
    r7 = 1;
    r3 = &cdc_ExecCmdSub;
    r14 = 0;
    push(r13);
    push(pr);
    r15 += -24;
    r5 = r15;
    *(s32 *)r15 = r4;
    r13 = r15;
    r5 += 16;
    r13 += 8;
    *(s32 *)r5 = r14;
    r6 = r13;
    *(s32 *)(r5 + 4) = r14;
    *(s8 *)r5 = r14;
    (*r3)() slot(r4 = r14);
    *(s32 *)(r15 + 4) = r0;
    r5 = *(s32 *)r15;
    r3 = &cdc_RspToStat;
    (*r3)() slot(r4 = r13);
    r0 = *(s32 *)(r15 + 4);
    r15 += 24;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void CDC_GetLastStat(void)
{
    r3 = &cdc_GetLastStat;
    goto *r3;
    __nopool;
}

void CDC_GetPeriStat(void)
{
    push(r14);
    push(r13);
    push(pr);
    r15 += -12;
    *(s32 *)r15 = r4;
    r13 = r15;
    r13 += 4;
    __bsr cdc_GetPeriRsp() slot(r4 = r13);
    r14 = r0;
    if (r14) {
        goto L0606F25A slot(r0 = r14);
        __nopool;
    }
    r5 = *(s32 *)r15;
    r3 = &cdc_RspToStat;
    (*r3)() slot(r4 = r13);
    r4 = *(s32 *)r15;
    r4 = *(s8 *)r4;
    r3 = 0x00FF;
    r4 = (u8)r4;
    if (r4 != r3) {
        r1 = 32;
        if ((r1 & r4) != 0) goto L0606F258;
    }
    r14 = -8;
L0606F258:
    r0 = r14;
L0606F25A:
    r15 += 12;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void cdc_GetPeriRsp(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(r11);
    push(r10);
    r11 = 0;
    r14 = &cdc_read_cr;
    r10 = r4;
    push(r9);
    r13 = r11;
    push(r8);
    r9 = -3;
    push(pr);
    r15 += -8;
    r12 = r15;
L0606F282:
    r0 = sr;
    r3 = __w(0xFF0F);
    r0 = (u32)r0 >> 2;
    r0 = (u32)r0 >> 2;
    r0 &= 15;
    r8 = r0;
    r0 = sr;
    r0 &= r3;
    r0 |= 240;
    sr = r0;
    (*r14)() slot(r4 = r10);
    (*r14)() slot(r4 = r12);
    r0 = r8;
    r3 = __w(0xFF0F);
    r2 = sr;
    r0 &= 15;
    r0 <<= 2;
    r0 <<= 2;
    r2 &= r3;
    r0 |= r2;
    sr = r0;
    r5 = r10;
    r4 = r12;
    r3 = *(s32 *)r5;
    r2 = *(s32 *)r4;
    if (r3 != r2) goto L0606F2C8;
    r0 = *(s32 *)(r4 + 4);
    r1 = *(s32 *)(r5 + 4);
    if (r1 != r0) goto L0606F2C8;
    goto L0606F2D0 slot(r9 = r11);
    __nopool;
L0606F2C8:
    r13 += 1;
    r3 = 100;
    if (!(r13 >= r3)) goto L0606F282;
L0606F2D0:
    r0 = r9;
    r15 += 8;
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

void CDC_GetHwInfo(void)
{
    r3 = 1;
    r2 = &cdc_ExecCmdRsp;
    push(r14);
    push(r13);
    r13 = r4;
    push(r12);
    r12 = 0;
    push(pr);
    r15 += -16;
    r5 = r15;
    r5 += 8;
    *(s32 *)r5 = r12;
    r14 = r15;
    *(s32 *)(r5 + 4) = r12;
    r6 = r14;
    *(s8 *)r5 = r3;
    (*r2)() slot(r4 = r12);
    r4 = r0;
    r0 = *(s8 *)(r14 + 2);
    *(s8 *)r13 = r0;
    r0 = *(s8 *)(r14 + 3);
    *(s8 *)(r13 + 1) = r0;
    r0 = *(s8 *)(r14 + 5);
    *(s8 *)(r13 + 2) = r0;
    r0 = *(s8 *)(r14 + 6);
    *(s8 *)(r13 + 3) = r0;
    r0 = *(s8 *)(r14 + 7);
    *(s8 *)(r13 + 4) = r0;
    r0 = r4;
    r15 += 16;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
}

