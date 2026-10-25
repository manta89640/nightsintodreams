/* sbl/stm_tr: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is stm_tr.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.06070070");

void stm_CallTrFunc(void)
{
    push(r14);
    r6 = r5;
    push(pr);
    r14 = r4;
    r15 += -4;
    *(s32 *)r15 = r5;
    r3 = *(s32 *)(r14 + 24);
    r5 = r4;
    (*r3)() slot(r4 = *(s32 *)(r14 + 28));
    r15 += 4;
    pop(pr);
    return slot(pop(r14));
}

void STM_SetTrFunc(void)
{
    push(r14);
    push(r13);
    push(pr);
    r15 += -12;
    r3 = &stm_set_func_id;
    *(s32 *)(r15 + 4) = r4;
    *(s32 *)r15 = r5;
    *(s32 *)(r15 + 8) = r6;
    r4 = 0x0317;
    (*r3)();
    r0 = *(s32 *)(r15 + 4);
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r15 += 12;
        r2 = &stm_call_err_func;
        pop(pr);
        pop(r13);
        return (*r2)() slot(pop(r14));
        __nopool;
    }
    r14 = *(s32 *)(r15 + 4);
    r3 = *(s32 *)r15;
    r14 = *(s32 *)(r14 + 4);
    r13 = *(s32 *)(r14 + 16);
    *(s32 *)(r14 + 24) = r3;
    r1 = *(s32 *)r15;
    if (!r1) slot(r13 += 108) {
        r7 = 0x0800;
        r6 = 0;
        r3 = &gfsTrn_SetBuf;
        r5 = r6;
        (*r3)() slot(r4 = r13);
        r2 = &gfsTrn_SetMode;
        r5 = 3;
        (*r2)() slot(r4 = r13);
        r3 = &gfsTrn_SetFunc;
        r6 = 0;
        r5 = r6;
        (*r3)() slot(r4 = *(s32 *)(r14 + 16));
        r2 = 0;
        goto L06070112 slot(*(s32 *)(r14 + 28) = r2);
        __nopool;
    }
    r7 = 0x0800;
    r5 = 0;
    r2 = &gfsTrn_SetBuf;
    r6 = 0x000FFFFF;
    (*r2)() slot(r4 = r13);
    r3 = &gfsTrn_SetMode;
    r5 = 4;
    (*r3)() slot(r4 = r13);
    r5 = &stm_CallTrFunc;
    r6 = r14;
    r2 = &gfsTrn_SetFunc;
    (*r2)() slot(r4 = *(s32 *)(r14 + 16));
    r3 = *(s32 *)(r15 + 8);
    *(s32 *)(r14 + 28) = r3;
L06070112:
    r15 += 12;
    r2 = &stm_check_gfs_err;
    pop(pr);
    pop(r13);
    return (*r2)() slot(pop(r14));
    __nopool;
}

void STM_StartTrans(void)
{
    push(r14);
    push(r13);
    push(pr);
    r3 = &stm_set_func_id;
    r15 += -8;
    *(s32 *)r15 = r4;
    *(s32 *)(r15 + 4) = r5;
    r4 = 0x0318;
    (*r3)();
    r0 = *(s32 *)r15;
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        (*r2)();
        goto L06070172 slot(r0 = 0);
        __nopool;
    }
    r13 = *(s32 *)r15;
    r0 = 120;
    r13 = *(s32 *)(r13 + 4);
    r14 = *(s32 *)(r13 + 16);
    r3 = *(s32 *)(r13 + 20);
    r1 = *(s32 *)(r3 + 28);
    if (!r1) slot(r14 = *(s32 *)(r0 + r14)) {
        r5 = *(s32 *)(r13 + 20);
        r3 = &gfcf_StartTrans;
        r5 += 28;
        (*r3)() slot(r4 = r14);
    }
    r2 = *(s32 *)(r15 + 4);
    r3 = *(s32 *)(r14 + 4);
    *(s32 *)r2 = r3;
    r2 = &stm_check_gfs_err;
    (*r2)();
    r0 = *(s32 *)r14;
L06070172:
    r15 += 8;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
}

void stm_SetTrBuf(void)
{
    push(r14);
    r0 = r7;
    push(pr);
    T = r0 == 2;
    r15 += -4;
    *(s32 *)r15 = r4;
    if (T) {
        r6 += r6;
        r7 = 1;
    }
    r0 = r7;
    r4 = *(s32 *)r15;
    if (r0 != 1) slot(r4 = *(s32 *)(r4 + 20)) {
        r0 = *(s32 *)(r4 + 16);
        if (!r0) goto L060701E6;
    }
    r14 = 0x0800;
    r1 = *(s32 *)(r4 + 8);
    r3 = &_modlspnm;
    (*r3)() slot(r0 = r14);
    r3 = &_modlspnm;
    r1 = -r0;
    r1 += r14;
    (*r3)() slot(r0 = r14);
    goto L060701EA slot(*(s32 *)(r4 + 24) = r0);
    __nopool;
L060701E6:
    r3 = 0;
    *(s32 *)(r4 + 24) = r3;
L060701EA:
    r4 = *(s32 *)r15;
    r3 = &gfsTrn_SetBuf;
    r4 = *(s32 *)(r4 + 16);
    r4 += 108;
    r15 += 4;
    pop(pr);
    return (*r3)() slot(pop(r14));
    __nopool;
}

void STM_SetTrBuf(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(pr);
    r15 += -12;
    r3 = &stm_set_func_id;
    *(s32 *)(r15 + 4) = r4;
    *(s32 *)(r15 + 8) = r5;
    *(s32 *)r15 = r6;
    r4 = 0x0316;
    (*r3)() slot(r14 = r7);
    r12 = &stm_call_err_func;
    r13 = &stm_set_err;
    r0 = *(s32 *)(r15 + 4);
    if (!r0) {
        goto L06070244 slot(r4 = -11);
        __nopool;
    }
    r3 = *(s32 *)r15;
    if (r3 < 0) {
        goto L06070244 slot(r4 = -14);
        __nopool;
    }
    r0 = r14;
    if (r0 == 1) goto L06070250;
    r0 = r14;
    if (r0 == 2) goto L06070250;
    r3 = 0x0800;
    if (r14 == r3) goto L06070250;
    r1 = 0x0914;
    if (r14 == r1) goto L06070250;
    r4 = -17;
L06070244:
    (*r13)();
    (*r12)();
    goto L0607026A;
    __nopool;
L06070250:
    r4 = *(s32 *)(r15 + 4);
    r4 = *(s32 *)(r4 + 4);
    r6 = *(s32 *)r15;
    r5 = *(s32 *)(r15 + 8);
    __bsr stm_SetTrBuf() slot(r7 = r14);
    r2 = &stm_check_gfs_err;
    r15 += 12;
    pop(pr);
    pop(r12);
    pop(r13);
    return (*r2)() slot(pop(r14));
    __nopool;
L0607026A:
    r15 += 12;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void stm_ResetTrBuf(void)
{
    push(r14);
    push(pr);
    r15 += -12;
    r3 = &gfsTrn_GetNsct;
    r14 = *(s32 *)(r4 + 16);
    r14 += 108;
    (*r3)() slot(r4 = r14);
    r5 = r0;
    r2 = &gfsTrn_Request;
    (*r2)() slot(r4 = r14);
    r0 = *(s32 *)r14;
    if (r0) {
        r3 = &gfsTrn_GetBuf;
        r7 = r15;
        r7 += 8;
        r6 = r15;
        r6 += 4;
        r5 = r15;
        (*r3)() slot(r4 = r14);
        r7 = *(s32 *)(r15 + 8);
        r6 = *(s32 *)(r15 + 4);
        r5 = *(s32 *)r15;
        r3 = &gfsTrn_SetBuf;
        (*r3)() slot(r4 = r14);
    }
    r15 += 12;
    pop(pr);
    return slot(pop(r14));
}

void STM_ResetTrBuf(void)
{
    push(pr);
    r15 += -4;
    r3 = &stm_set_func_id;
    *(s32 *)r15 = r4;
    r4 = 0x0323;
    (*r3)();
    r0 = *(s32 *)r15;
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r15 += 4;
        r2 = &stm_call_err_func;
        return (*r2)() slot(pop(pr));
        __nopool;
    }
    r4 = *(s32 *)r15;
    __bsr stm_ResetTrBuf() slot(r4 = *(s32 *)(r4 + 4));
    r2 = &stm_check_gfs_err;
    r15 += 4;
    return (*r2)() slot(pop(pr));
    __nopool;
}

void STM_GetLenTrBuf(void)
{
    push(pr);
    r15 += -4;
    r3 = &stm_set_func_id;
    *(s32 *)r15 = r4;
    r4 = 0x0326;
    (*r3)();
    r0 = *(s32 *)r15;
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        (*r2)();
        r15 += 4;
        pop(pr);
        return slot(r0 = -1);
        __nopool;
    }
    r3 = *(s32 *)r15;
    r2 = *(s32 *)(r3 + 4);
    r3 = &gfsTrn_GetWp;
    r4 = r2;
    *(s32 *)r15 = r2;
    r4 = *(s32 *)(r4 + 16);
    (*r3)() slot(r4 += 108);
    *(s32 *)r15 = r0;
    r3 = &stm_check_gfs_err;
    (*r3)();
    r4 = r0;
    if (r4 < 0) {
        r15 += 4;
        pop(pr);
        return slot(r0 = r4);
        __nopool;
    }
    r0 = *(s32 *)r15;
    r0 = (u32)r0 >> 1;
    r15 += 4;
    pop(pr);
    return;
    __nopool;
}

void stm_IsTrBufFull(void)
{
    push(pr);
    r3 = &gfsTrn_GetFree;
    r15 += -4;
    *(s32 *)r15 = r4;
    r4 = *(s32 *)(r4 + 16);
    (*r3)() slot(r4 += 108);
    r4 = r0;
    if (!r4) {
        r15 += 4;
        pop(pr);
        return slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
    r15 += 4;
    pop(pr);
    return;
    __nopool;
}

void STM_IsTrBufFull(void)
{
    push(pr);
    r15 += -4;
    r3 = &stm_set_func_id;
    *(s32 *)r15 = r4;
    r4 = 0x0327;
    (*r3)();
    r0 = *(s32 *)r15;
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        (*r2)();
        r15 += 4;
        pop(pr);
        return slot(r0 = 0);
        __nopool;
    }
    r4 = *(s32 *)r15;
    __bsr stm_IsTrBufFull() slot(r4 = *(s32 *)(r4 + 4));
    *(s32 *)r15 = r0;
    r3 = &stm_check_gfs_err;
    (*r3)();
    r0 = *(s32 *)r15;
    r15 += 4;
    pop(pr);
    return;
}

