/* sbl/cdc_filt: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is cdc_filt.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.0606F5BC");

void CDC_SetFiltRange(void)
{
    push(r14);
    r7 = 0;
    push(pr);
    r3 = 64;
    r15 += -8;
    r14 = r15;
    *(s32 *)r14 = r7;
    r0 = r4;
    *(s32 *)(r14 + 4) = r7;
    r4 = r3;
    *(s32 *)r14 = r5;
    *(s8 *)r14 = r3;
    *(s32 *)(r14 + 4) = r6;
    *(s8 *)(r14 + 4) = r0;
    r3 = &cdc_ExecCmd;
    (*r3)() slot(r5 = r14);
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void CDC_GetFiltRange(void)
{
    r3 = 65;
    push(r14);
    r0 = r4;
    push(r13);
    push(r12);
    push(pr);
    r12 = 0;
    r15 += -24;
    r14 = r15;
    *(s32 *)r15 = r5;
    r13 = r15;
    *(s32 *)(r15 + 4) = r6;
    r14 += 16;
    *(s32 *)r14 = r12;
    r13 += 8;
    *(s32 *)(r14 + 4) = r12;
    r5 = r14;
    *(s8 *)r14 = r3;
    r6 = r13;
    *(s8 *)(r14 + 4) = r0;
    r3 = &cdc_ExecCmdRsp;
    (*r3)() slot(r4 = r12);
    r4 = 0x00FFFFFF;
    r5 = r0;
    r2 = *(s32 *)r15;
    r0 = r5;
    r3 = *(s32 *)r13;
    r3 &= r4;
    *(s32 *)r2 = r3;
    r2 = *(s32 *)(r15 + 4);
    r3 = *(s32 *)(r13 + 4);
    r4 &= r3;
    *(s32 *)r2 = r4;
    r15 += 24;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void CDC_SetFiltSubh(void)
{
    r6 = 0;
    push(r14);
    r3 = 66;
    push(pr);
    r15 += -8;
    r14 = r15;
    *(s32 *)r14 = r6;
    *(s32 *)(r14 + 4) = r6;
    *(s8 *)r14 = r3;
    r0 = *(s8 *)(r5 + 1);
    *(s8 *)(r14 + 1) = r0;
    r0 = *(s8 *)(r5 + 2);
    *(s8 *)(r14 + 2) = r0;
    r0 = *(s8 *)(r5 + 4);
    *(s8 *)(r14 + 3) = r0;
    r3 = &cdc_ExecCmd;
    r0 = r4;
    *(s8 *)(r14 + 4) = r0;
    r0 = *(s8 *)r5;
    *(s8 *)(r14 + 5) = r0;
    r0 = *(s8 *)(r5 + 3);
    *(s8 *)(r14 + 6) = r0;
    r0 = *(s8 *)(r5 + 5);
    *(s8 *)(r14 + 7) = r0;
    r5 = r14;
    (*r3)() slot(r4 = 64);
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void CDC_GetFiltSubh(void)
{
    push(r14);
    r3 = 67;
    push(r13);
    r0 = r4;
    push(r12);
    r12 = r5;
    push(r11);
    r11 = 0;
    push(pr);
    r15 += -16;
    r13 = r15;
    r13 += 8;
    *(s32 *)r13 = r11;
    r14 = r15;
    *(s32 *)(r13 + 4) = r11;
    r5 = r13;
    *(s8 *)r13 = r3;
    r6 = r14;
    *(s8 *)(r13 + 4) = r0;
    r3 = &cdc_ExecCmdRsp;
    (*r3)() slot(r4 = r11);
    r4 = r0;
    r0 = *(s8 *)(r14 + 1);
    *(s8 *)(r12 + 1) = r0;
    r0 = *(s8 *)(r14 + 2);
    *(s8 *)(r12 + 2) = r0;
    r0 = *(s8 *)(r14 + 3);
    *(s8 *)(r12 + 4) = r0;
    r0 = *(s8 *)(r14 + 5);
    *(s8 *)r12 = r0;
    r0 = *(s8 *)(r14 + 6);
    *(s8 *)(r12 + 3) = r0;
    r0 = *(s8 *)(r14 + 7);
    *(s8 *)(r12 + 5) = r0;
    r0 = r4;
    r15 += 16;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void CDC_SetFiltMode(void)
{
    r6 = 0;
    push(r14);
    r3 = 68;
    push(pr);
    r0 = r5;
    r15 += -8;
    r14 = r15;
    *(s32 *)r14 = r6;
    r5 = r14;
    *(s32 *)(r14 + 4) = r6;
    *(s8 *)r14 = r3;
    *(s8 *)(r14 + 1) = r0;
    r0 = r4;
    r3 = &cdc_ExecCmd;
    *(s8 *)(r14 + 4) = r0;
    (*r3)() slot(r4 = 64);
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void CDC_GetFiltMode(void)
{
    push(r14);
    r3 = 69;
    push(r13);
    r0 = r4;
    push(r12);
    r13 = 0;
    push(pr);
    r15 += -20;
    *(s32 *)r15 = r5;
    r14 = r15;
    r14 += 12;
    r12 = r15;
    *(s32 *)r14 = r13;
    r5 = r14;
    *(s32 *)(r14 + 4) = r13;
    r12 += 4;
    *(s8 *)r14 = r3;
    r6 = r12;
    *(s8 *)(r14 + 4) = r0;
    r3 = &cdc_ExecCmdRsp;
    (*r3)() slot(r4 = r13);
    r2 = *(s32 *)r15;
    r4 = r0;
    r0 = *(s8 *)(r12 + 1);
    r0 = (u8)r0;
    *(s32 *)r2 = r0;
    r0 = r4;
    r15 += 20;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void CDC_SetFiltCon(void)
{
    push(r14);
    r3 = 0;
    push(pr);
    r0 = r5;
    r15 += -8;
    r14 = r15;
    *(s32 *)r14 = r3;
    r2 = r3;
    *(s32 *)(r14 + 4) = r3;
    r5 = r14;
    r3 = 70;
    *(s8 *)r14 = r3;
    *(s8 *)(r14 + 1) = r0;
    r0 = r6;
    r3 = &cdc_ExecCmd;
    *(s8 *)(r14 + 2) = r0;
    r0 = r7;
    *(s8 *)(r14 + 3) = r0;
    r0 = r4;
    *(s8 *)(r14 + 4) = r0;
    (*r3)() slot(r4 = 64);
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void CDC_GetFiltCon(void)
{
    push(r14);
    r3 = 71;
    push(r13);
    r0 = r4;
    push(r12);
    r12 = 0;
    push(pr);
    r15 += -24;
    *(s32 *)(r15 + 4) = r5;
    r14 = r15;
    *(s32 *)r15 = r6;
    r13 = r15;
    r14 += 16;
    r13 += 8;
    *(s32 *)r14 = r12;
    r5 = r14;
    *(s32 *)(r14 + 4) = r12;
    r6 = r13;
    *(s8 *)r14 = r3;
    *(s8 *)(r14 + 4) = r0;
    r3 = &cdc_ExecCmdRsp;
    (*r3)() slot(r4 = r12);
    r4 = r0;
    r2 = *(s32 *)(r15 + 4);
    r0 = *(s8 *)(r13 + 2);
    r0 = (u8)r0;
    *(s32 *)r2 = r0;
    r3 = *(s32 *)r15;
    r0 = *(s8 *)(r13 + 3);
    r0 = (u8)r0;
    *(s32 *)r3 = r0;
    r0 = r4;
    r15 += 24;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void CDC_ResetSelector(void)
{
    r6 = 0;
    push(r14);
    r3 = 72;
    push(pr);
    r0 = r4;
    r15 += -8;
    r14 = r15;
    *(s32 *)r14 = r6;
    *(s32 *)(r14 + 4) = r6;
    *(s8 *)r14 = r3;
    *(s8 *)(r14 + 1) = r0;
    r3 = &cdc_ExecCmd;
    r0 = r5;
    *(s8 *)(r14 + 4) = r0;
    r5 = r14;
    (*r3)() slot(r4 = 64);
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
}

