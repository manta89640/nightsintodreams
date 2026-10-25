/* sbl/cdc_buf: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is cdc_buf.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.0606F7F0");

void CDC_GetBufSiz(void)
{
    push(r14);
    r3 = 80;
    r2 = &cdc_ExecCmdRsp;
    push(r13);
    push(pr);
    r13 = 0;
    r15 += -28;
    r14 = r15;
    *(s32 *)(r15 + 4) = r4;
    r14 += 12;
    *(s32 *)r15 = r5;
    r5 = r15;
    *(s32 *)(r15 + 8) = r6;
    r5 += 20;
    *(s32 *)r5 = r13;
    r6 = r14;
    *(s32 *)(r5 + 4) = r13;
    *(s8 *)r5 = r3;
    (*r2)() slot(r4 = r13);
    r3 = *(s32 *)(r15 + 8);
    r4 = r0;
    r0 = *(s16 *)(r14 + 2);
    r0 = (u16)r0;
    *(s32 *)r3 = r0;
    r3 = *(s32 *)r15;
    r0 = *(s8 *)(r14 + 4);
    r0 = (u8)r0;
    *(s32 *)r3 = r0;
    r3 = *(s32 *)(r15 + 4);
    r0 = *(s16 *)(r14 + 6);
    r0 = (u16)r0;
    *(s32 *)r3 = r0;
    r0 = r4;
    r15 += 28;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void CDC_GetSctNum(void)
{
    r3 = 81;
    push(r14);
    r0 = r4;
    push(r13);
    r13 = 0;
    push(r12);
    push(pr);
    r15 += -20;
    r14 = r15;
    *(s32 *)r15 = r5;
    r12 = r15;
    r14 += 12;
    r12 += 4;
    *(s32 *)r14 = r13;
    r5 = r14;
    *(s32 *)(r14 + 4) = r13;
    r6 = r12;
    *(s8 *)r14 = r3;
    *(s8 *)(r14 + 4) = r0;
    r3 = &cdc_ExecCmdRsp;
    (*r3)() slot(r4 = r13);
    r4 = r0;
    r2 = *(s32 *)r15;
    r0 = *(s16 *)(r12 + 6);
    r0 = (u16)r0;
    *(s32 *)r2 = r0;
    r0 = r4;
    r15 += 20;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void CDC_CalActSiz(void)
{
    r7 = 0;
    push(r14);
    r3 = 82;
    push(pr);
    r0 = r5;
    r15 += -8;
    r14 = r15;
    *(s32 *)r14 = r7;
    r5 = r14;
    *(s32 *)(r14 + 4) = r7;
    *(s8 *)r14 = r3;
    *(s16 *)(r14 + 2) = r0;
    r0 = r4;
    r3 = &cdc_ExecCmd;
    *(s8 *)(r14 + 4) = r0;
    r0 = r6;
    *(s16 *)(r14 + 6) = r0;
    (*r3)() slot(r4 = 64);
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void CDC_GetActSiz(void)
{
    push(r14);
    r5 = 0;
    push(pr);
    r3 = 83;
    r15 += -20;
    r14 = r15;
    *(s32 *)r15 = r4;
    r14 += 4;
    r4 = r15;
    r4 += 12;
    *(s32 *)r4 = r5;
    *(s32 *)(r4 + 4) = r5;
    *(s8 *)r4 = r3;
    __bsr cdc_ExecAfterEsel() slot(r5 = r14);
    r4 = r0;
    r3 = *(s32 *)r15;
    r0 = r4;
    r2 = 0x00FFFFFF;
    r1 = *(s32 *)r14;
    r1 &= r2;
    *(s32 *)r3 = r1;
    r15 += 20;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void cdc_ExecAfterEsel(void)
{
    push(pr);
    r15 += -8;
    r3 = &CDC_GetHirqReq;
    *(s32 *)(r15 + 4) = r4;
    *(s32 *)r15 = r5;
    (*r3)();
    r4 = r0;
    r2 = 64;
    if ((r4 & r2) == 0) {
        r15 += 8;
        pop(pr);
        return slot(r0 = -1);
        __nopool;
    }
    r6 = *(s32 *)r15;
    r5 = *(s32 *)(r15 + 4);
    r3 = &cdc_ExecCmdRsp;
    (*r3)() slot(r4 = 0);
    r15 += 8;
    pop(pr);
    return;
    __nopool;
}

void CDC_GetSctInfo(void)
{
    push(r14);
    r3 = 84;
    push(r13);
    r0 = r5;
    push(r12);
    r12 = r6;
    push(r11);
    r11 = 0;
    push(pr);
    r15 += -16;
    r14 = r15;
    r14 += 8;
    *(s32 *)r14 = r11;
    r13 = r15;
    *(s32 *)(r14 + 4) = r11;
    r5 = r14;
    *(s8 *)r14 = r3;
    r6 = r13;
    *(s16 *)(r14 + 2) = r0;
    r0 = r4;
    r3 = &cdc_ExecCmdRsp;
    *(s8 *)(r14 + 4) = r0;
    (*r3)() slot(r4 = r11);
    r3 = 0x00FFFFFF;
    r4 = r0;
    r2 = *(s32 *)r13;
    r2 &= r3;
    *(s32 *)r12 = r2;
    r0 = *(s8 *)(r13 + 4);
    *(s8 *)(r12 + 4) = r0;
    r0 = *(s8 *)(r13 + 5);
    *(s8 *)(r12 + 5) = r0;
    r0 = *(s8 *)(r13 + 6);
    *(s8 *)(r12 + 6) = r0;
    r0 = *(s8 *)(r13 + 7);
    *(s8 *)(r12 + 7) = r0;
    r0 = r4;
    r15 += 16;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void CDC_ExeFadSearch(void)
{
    r7 = 0;
    push(r14);
    r3 = 85;
    push(pr);
    r0 = r5;
    r15 += -8;
    r14 = r15;
    *(s32 *)r14 = r7;
    r5 = r14;
    *(s32 *)(r14 + 4) = r7;
    *(s8 *)r14 = r3;
    *(s16 *)(r14 + 2) = r0;
    r0 = r4;
    r3 = &cdc_ExecCmd;
    *(s32 *)(r14 + 4) = r6;
    *(s8 *)(r14 + 4) = r0;
    (*r3)() slot(r4 = 64);
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void CDC_GetFadSearch(void)
{
    r3 = 86;
    push(r14);
    push(pr);
    r15 += -28;
    r14 = r15;
    *(s32 *)r15 = r4;
    r14 += 12;
    *(s32 *)(r15 + 8) = r5;
    r4 = r15;
    *(s32 *)(r15 + 4) = r6;
    r5 = 0;
    r4 += 20;
    *(s32 *)r4 = r5;
    *(s32 *)(r4 + 4) = r5;
    *(s8 *)r4 = r3;
    __bsr cdc_ExecAfterEsel() slot(r5 = r14);
    r3 = *(s32 *)(r15 + 8);
    r4 = r0;
    r2 = 0x00FFFFFF;
    r0 = *(s16 *)(r14 + 2);
    r0 = (u16)r0;
    *(s32 *)r3 = r0;
    r3 = *(s32 *)r15;
    r0 = *(s8 *)(r14 + 4);
    r0 = (u8)r0;
    *(s32 *)r3 = r0;
    r3 = *(s32 *)(r15 + 4);
    r0 = r4;
    r1 = *(s32 *)(r14 + 4);
    r1 &= r2;
    *(s32 *)r3 = r1;
    r15 += 28;
    pop(pr);
    return slot(pop(r14));
}

