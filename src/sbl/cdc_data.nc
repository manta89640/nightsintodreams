/* sbl/cdc_data: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is cdc_data.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.0606F478");

void CDC_DataReady(void)
{
    push(r14);
    push(pr);
    r15 += -12;
    *(s32 *)(r15 + 4) = r4;
    r0 = *(s32 *)(r15 + 4);
    if (r0 == 1) slot(r4 = 2) {
        r4 = 0x0082;
    }
    r5 = r15;
    r2 = &cdc_wait_hirq;
    (*r2)();
    r14 = r0;
    r0 = *(s32 *)(r15 + 4);
    if (r0 != 1) goto L0606F4A6;
    if (r14) goto L0606F4A6;
    r0 = *(s32 *)r15;
    if ((r0 & 128) == 0) goto L0606F4A6;
    r14 = -4;
L0606F4A6:
    if (r14) {
        r4 = r15;
        r4 += 8;
        __bsr CDC_DataEnd();
    }
    r2 = &cdc_set_hirq_req;
    (*r2)() slot(r4 = -3);
    r0 = r14;
    r15 += 12;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void CDC_DataEnd(void)
{
    r3 = 6;
    r2 = &cdc_ExecCmdRsp;
    push(r14);
    push(r13);
    r13 = 0;
    push(pr);
    r15 += -24;
    *(s32 *)r15 = r4;
    r5 = r15;
    r5 += 16;
    r14 = r15;
    *(s32 *)r5 = r13;
    r14 += 8;
    *(s32 *)(r5 + 4) = r13;
    r6 = r14;
    *(s8 *)r5 = r3;
    (*r2)() slot(r4 = r13);
    *(s32 *)(r15 + 4) = r0;
    r3 = *(s32 *)r15;
    r2 = 0x00FFFFFF;
    r1 = *(s32 *)r14;
    r1 &= r2;
    *(s32 *)r3 = r1;
    r3 = &cdc_set_hirq_req;
    (*r3)() slot(r4 = -3);
    r0 = *(s32 *)(r15 + 4);
    r15 += 24;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
}

