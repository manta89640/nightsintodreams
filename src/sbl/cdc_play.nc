/* sbl/cdc_play: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is cdc_play.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.060680CC");

void CDC_CdPlay(void)
{
    push(r14);
    r3 = 16;
    push(r13);
    r13 = r4;
    push(r12);
    r12 = 0;
    push(pr);
    r15 += -8;
    r14 = r15;
    r5 = r14;
    *(s32 *)r14 = r12;
    r5 += 1;
    *(s32 *)(r14 + 4) = r12;
    *(s8 *)r14 = r3;
    __bsr cdc_pos_to_cmd() slot(r4 = r13);
    r0 = 16;
    r5 = r14;
    r0 = *(s8 *)(r0 + r13);
    r4 = r13;
    *(s8 *)(r14 + 4) = r0;
    r5 += 5;
    __bsr cdc_pos_to_cmd() slot(r4 += 8);
    r2 = &cdc_ExecCmd;
    r5 = r14;
    (*r2)() slot(r4 = r12);
    r15 += 8;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void cdc_pos_to_cmd(void)
{
    r0 = *(s32 *)r4;
    r1 = 0;
    r6 = r5;
    r6 += 1;
    r7 = r5;
    if (r0 == 0) goto L06068160 slot(r7 += 2);
    if (r0 != 1) {
        if (r0 != 2) {
            if (r0 == 3) goto L06068156;
            goto L06068160;
            __nopool;
        }
        *(s8 *)r5 = r1;
        r0 = *(s8 *)(r4 + 4);
        *(s8 *)r6 = r0;
        goto L06068152 slot(r0 = *(s8 *)(r4 + 5));
        __nopool;
    }
    r0 = r4;
    r0 += 4;
    r3 = r4;
    r0 = *(s8 *)(r0 + 1);
    r3 += 4;
    r0 |= 128;
    *(s8 *)r5 = r0;
    r0 = *(s8 *)(r3 + 2);
    r3 = r4;
    *(s8 *)r6 = r0;
    r3 += 4;
    r0 = *(s8 *)(r3 + 3);
L06068152:
    return slot(*(s8 *)r7 = r0);
    __nopool;
L06068156:
    r4 = 0x00FF;
    *(s8 *)r5 = r4;
    *(s8 *)r6 = r4;
    return slot(*(s8 *)r7 = r4);
    __nopool;
L06068160:
    *(s8 *)r5 = r1;
    *(s8 *)r6 = r1;
    *(s8 *)r7 = r1;
    return;
    __nopool;
}

void CDC_CdSeek(void)
{
    r3 = 17;
    push(r14);
    push(r13);
    push(pr);
    r13 = 0;
    r15 += -8;
    r14 = r15;
    *(s32 *)r14 = r13;
    r5 = r14;
    *(s32 *)(r14 + 4) = r13;
    *(s8 *)r14 = r3;
    __bsr cdc_pos_to_cmd() slot(r5 += 1);
    r3 = &cdc_ExecCmd;
    r5 = r14;
    (*r3)() slot(r4 = r13);
    r15 += 8;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void CDC_CdScan(void)
{
    r3 = 18;
    push(r14);
    r0 = r4;
    push(r13);
    r13 = 0;
    push(pr);
    r15 += -8;
    r14 = r15;
    r5 = r14;
    *(s32 *)r14 = r13;
    *(s32 *)(r14 + 4) = r13;
    *(s8 *)r14 = r3;
    *(s8 *)(r14 + 1) = r0;
    r3 = &cdc_ExecCmd;
    (*r3)() slot(r4 = r13);
    r15 += 8;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
}

