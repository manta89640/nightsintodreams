/* sbl/cdc_init: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is cdc_init.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.0606F348");

void CDC_TgetToc(void)
{
    push(r14);
    r3 = 2;
    r2 = &cdc_ExecCmdRsp;
    push(r13);
    push(pr);
    r13 = 0;
    r15 += -20;
    r5 = r15;
    *(s32 *)r15 = r4;
    r14 = r15;
    r5 += 12;
    r14 += 4;
    *(s32 *)r5 = r13;
    r6 = r14;
    *(s32 *)(r5 + 4) = r13;
    *(s8 *)r5 = r3;
    (*r2)() slot(r4 = r13);
    r4 = r0;
    if (r4) {
        goto L0606F382 slot(r0 = r4);
        __nopool;
    }
    r3 = 0x00FFFFFF;
    r4 = *(s32 *)r14;
    r5 = *(s32 *)r15;
    r2 = &cdc_get_data_words;
    (*r2)() slot(r4 &= r3);
L0606F382:
    r15 += 20;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void CDC_GetSes(void)
{
    push(r14);
    r3 = 3;
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
    *(s8 *)(r14 + 1) = r0;
    r3 = &cdc_ExecCmdRsp;
    (*r3)() slot(r4 = r13);
    r2 = *(s32 *)r15;
    r4 = r0;
    r3 = *(s32 *)(r12 + 4);
    r0 = r4;
    *(s32 *)r2 = r3;
    r15 += 20;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void CDC_CdInit(void)
{
    r3 = 0;
    push(r14);
    r0 = r4;
    push(r13);
    r2 = r3;
    push(pr);
    r15 += -8;
    r14 = r15;
    *(s32 *)r14 = r3;
    *(s32 *)(r14 + 4) = r3;
    r3 = 4;
    *(s8 *)r14 = r3;
    *(s8 *)(r14 + 1) = r0;
    r0 = r5;
    *(s16 *)(r14 + 2) = r0;
    r0 = r6;
    *(s8 *)(r14 + 6) = r0;
    r0 = r7;
    *(s8 *)(r14 + 7) = r0;
    r0 = 0x0081;
    r0 &= r4;
    if (r0 == 1) {
        r4 = 0x2904;
        r2 = &cdc_Wait;
        (*r2)();
        r3 = &cdc_add_hirq_stat;
        (*r3)() slot(r4 = 65);
        r5 = r14;
        r2 = &cdc_ExecCmd;
        (*r2)() slot(r4 = 64);
        r13 = r0;
        if (r13) goto L0606F42C;
        r3 = &cdc_init_hirq;
        (*r3)();
        goto L0606F42C;
        __nopool;
    }
    r5 = r14;
    r3 = &cdc_ExecCmd;
    (*r3)() slot(r4 = 0);
    r13 = r0;
L0606F42C:
    r0 = r13;
    r15 += 8;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void CDC_CdOpen(void)
{
    push(r14);
    r3 = 5;
    r2 = &cdc_ExecCmd;
    r14 = 0;
    push(pr);
    r15 += -8;
    r5 = r15;
    *(s32 *)r5 = r14;
    *(s32 *)(r5 + 4) = r14;
    *(s8 *)r5 = r3;
    (*r2)() slot(r4 = r14);
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
}

