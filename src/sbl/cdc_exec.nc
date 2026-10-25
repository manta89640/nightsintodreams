/* sbl/cdc_exec: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is cdc_exec.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.0606FCD8");

void cdc_ExecCmdRsp(void)
{
    goto cdc_ExecCmdSub slot(r7 = 0);
}

void cdc_ExecCmd(void)
{
    push(pr);
    r15 += -8;
    r6 = r15;
    __bsr cdc_ExecCmdSub() slot(r7 = 1);
    r15 += 8;
    pop(pr);
    return;
}

void cdc_ExecCmdSub(void)
{
    push(r14);
    push(r13);
    r13 = r6;
    r3 = &cdc_exec_cmd;
    push(pr);
    r15 += -8;
    *(s32 *)r15 = r7;
    (*r3)() slot(r6 = r13);
    r14 = r0;
    if (r14) {
        goto L0606FD46 slot(r0 = r14);
        __nopool;
    }
    r0 = sr;
    r3 = __w(0xFF0F);
    r0 = (u32)r0 >> 2;
    r0 = (u32)r0 >> 2;
    r0 &= 15;
    *(s32 *)(r15 + 4) = r0;
    r0 = sr;
    r0 &= r3;
    r0 |= 240;
    sr = r0;
    r5 = &cdc_last_stat;
    r0 = *(s32 *)r15;
    if (r0) {
        __bsr cdc_RspToStat() slot(r4 = r13);
        goto L0606FD32;
        __nopool;
    }
    r3 = *(s8 *)r13;
    *(s8 *)r5 = r3;
L0606FD32:
    r2 = sr;
    r1 = __w(0xFF0F);
    r0 = *(s32 *)(r15 + 4);
    r0 &= 15;
    r0 <<= 2;
    r0 <<= 2;
    r2 &= r1;
    r0 |= r2;
    sr = r0;
    r0 = r14;
L0606FD46:
    r15 += 8;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void cdc_GetLastStat(void)
{
    push(pr);
    r0 = sr;
    r3 = __w(0xFF0F);
    r0 = (u32)r0 >> 2;
    r0 = (u32)r0 >> 2;
    r0 &= 15;
    r5 = r0;
    r0 = sr;
    r0 &= r3;
    r0 |= 240;
    sr = r0;
    r1 = r4;
    r2 = &cdc_last_stat;
    r3 = &_quick_odd_mvn;
    (*r3)() slot(r0 = 12);
    r3 = __w(0xFF0F);
    r0 = r5;
    r0 &= 15;
    r0 <<= 2;
    r0 <<= 2;
    r1 = sr;
    r1 &= r3;
    r0 |= r1;
    sr = r0;
    pop(pr);
    return slot(r0 = 0);
    __nopool;
}

void cdc_RspToStat(void)
{
    r3 = *(s8 *)r4;
    *(s8 *)r5 = r3;
    r0 = *(s8 *)(r4 + 1);
    *(s8 *)(r5 + 4) = r0;
    r0 = *(s8 *)(r4 + 2);
    *(s8 *)(r5 + 5) = r0;
    r0 = *(s8 *)(r4 + 3);
    *(s8 *)(r5 + 6) = r0;
    r0 = *(s8 *)(r4 + 4);
    *(s8 *)(r5 + 7) = r0;
    r3 = 0x00FFFFFF;
    r2 = *(s32 *)(r4 + 4);
    r2 &= r3;
    return slot(*(s32 *)(r5 + 8) = r2);
    __nopool;
}

void cdc_Wait(void)
{
    r15 += -4;
    *(s32 *)r15 = r4;
    goto L0606FDB4;
    __nopool;
L0606FDAE:
    r2 = *(s32 *)r15;
    r2 += -1;
    *(s32 *)r15 = r2;
L0606FDB4:
    r3 = *(s32 *)r15;
    if (r3 > 0) goto L0606FDAE;
    return slot(r15 += 4);
}

