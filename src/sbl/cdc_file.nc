/* sbl/cdc_file: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is cdc_file.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.0606FB80");

void CDC_ChgDir(void)
{
    push(r14);
    r6 = 0;
    push(pr);
    r3 = 112;
    r15 += -8;
    r14 = r15;
    *(s32 *)r14 = r6;
    r0 = r4;
    *(s32 *)(r14 + 4) = r6;
    *(s8 *)r14 = r3;
    *(s32 *)(r14 + 4) = r5;
    *(s8 *)(r14 + 4) = r0;
    r4 = 0x0200;
    r3 = &cdc_ExecCmd;
    (*r3)() slot(r5 = r14);
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void CDC_ReadDir(void)
{
    push(r14);
    r6 = 0;
    push(pr);
    r3 = 113;
    r15 += -8;
    r14 = r15;
    *(s32 *)r14 = r6;
    r0 = r4;
    *(s32 *)(r14 + 4) = r6;
    *(s8 *)r14 = r3;
    *(s32 *)(r14 + 4) = r5;
    *(s8 *)(r14 + 4) = r0;
    r4 = 0x0200;
    r3 = &cdc_ExecCmd;
    (*r3)() slot(r5 = r14);
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void CDC_GetFileScope(void)
{
    push(r14);
    r3 = 114;
    r2 = &cdc_ExecCmdRsp;
    push(r13);
    push(pr);
    r13 = 0;
    r15 += -28;
    r14 = r15;
    *(s32 *)(r15 + 4) = r4;
    r14 += 12;
    *(s32 *)(r15 + 8) = r5;
    r5 = r15;
    *(s32 *)r15 = r6;
    r5 += 20;
    *(s32 *)r5 = r13;
    r6 = r14;
    *(s32 *)(r5 + 4) = r13;
    *(s8 *)r5 = r3;
    (*r2)() slot(r4 = r13);
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
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void CDC_TgetFileInfo(void)
{
    push(r14);
    r3 = 115;
    push(r13);
    r13 = 0;
    push(r12);
    r0 = r13;
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
    *(s32 *)(r14 + 4) = r4;
    *(s8 *)(r14 + 4) = r0;
    r3 = &cdc_ExecCmdRsp;
    (*r3)() slot(r4 = r0);
    r4 = r0;
    if (r4) {
        goto L0606FC64 slot(r0 = r4);
        __nopool;
    }
    r3 = 0x00FFFFFF;
    r4 = *(s32 *)r12;
    r5 = *(s32 *)r15;
    r2 = &cdc_get_data_words;
    (*r2)() slot(r4 &= r3);
L0606FC64:
    r15 += 20;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void CDC_ReadFile(void)
{
    push(r14);
    r7 = 0;
    push(pr);
    r3 = 116;
    r15 += -8;
    r14 = r15;
    *(s32 *)r14 = r7;
    r0 = r4;
    *(s32 *)(r14 + 4) = r7;
    *(s32 *)r14 = r6;
    *(s8 *)r14 = r3;
    *(s32 *)(r14 + 4) = r5;
    *(s8 *)(r14 + 4) = r0;
    r4 = 0x0200;
    r3 = &cdc_ExecCmd;
    (*r3)() slot(r5 = r14);
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void CDC_AbortFile(void)
{
    r4 = 0;
    r2 = &cdc_add_hirq_stat;
    r3 = 117;
    push(r14);
    push(pr);
    r15 += -8;
    r14 = r15;
    *(s32 *)r14 = r4;
    *(s32 *)(r14 + 4) = r4;
    r4 = 0x0200;
    (*r2)() slot(*(s8 *)r14 = r3);
    r4 = 0x0200;
    r3 = &cdc_ExecCmd;
    (*r3)() slot(r5 = r14);
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
}

