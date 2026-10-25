/* sbl/stm_svr: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is stm_svr.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.06069474");

void STM_GrpHasNoCdKey(void)
{
    r0 = *(s32 *)(r4 + 8);
    if (r0) {
        return slot(r0 = 0);
    }
    goto L0606949A slot(r5 = *(s32 *)r4);
L06069482:
    r0 = *(s32 *)(r5 + 20);
    r1 = *(s32 *)(r0 + 28);
    if (!r1) {
        goto L06069490 slot(r0 = 1);
    }
    r0 = 0;
L06069490:
    if (r0 == 1) {
        return slot(r0 = 0);
    }
    r5 = *(s32 *)(r5 + 8);
L0606949A:
    if (r5) goto L06069482;
    r0 = 1;
    return;
}

void STM_GrpIsAllEnd(void)
{
    r1 = *(s32 *)(r4 + 8);
    if (r1) {
        return slot(r0 = 0);
    }
    r1 = *(s32 *)(r4 + 4);
    if (r1) {
        return slot(r0 = 0);
    }
    r6 = 2;
    goto L060694CE slot(r5 = *(s32 *)r4);
L060694BE:
    r0 = 44;
    r2 = *(s8 *)(r0 + r5);
    r2 = (u8)r2;
    if ((r2 & r6) == 0) {
        return slot(r0 = 0);
    }
    r5 = *(s32 *)(r5 + 8);
L060694CE:
    if (r5) goto L060694BE;
    r0 = 1;
    return;
}

void STM_GrpCdCallback(void)
{
    push(r14);
    r0 = 56;
    push(pr);
    r14 = r4;
    r2 = *(s16 *)(r0 + r14);
    r3 = 4;
    r2 |= r3;
    *(s16 *)(r0 + r14) = r2;
    r0 = *(s32 *)(r14 + 36);
    if (!r0) goto L06069528;
    r0 = *(s32 *)(r14 + 28);
    if (!r0) {
        r1 = &stm_GetFreeBufSiz;
        (*r1)();
        r4 = r0;
        r3 = *(s32 *)(r14 + 32);
        if (r4 >= r3) goto L06069528;
        r0 = 56;
        r2 = *(s16 *)(r0 + r14);
        r3 = 8;
        r2 |= r3;
        goto L06069528 slot(*(s16 *)(r0 + r14) = r2);
        __nopool;
    }
    r4 = *(s32 *)(r14 + 28);
    r2 = &stm_GetSctNum;
    (*r2)() slot(r4 = *(s32 *)(r4 + 20));
    r4 = r0;
    r3 = *(s32 *)(r14 + 32);
    if (!(r4 >= r3)) goto L06069528;
    r0 = 56;
    r2 = *(s16 *)(r0 + r14);
    r3 = 8;
    r2 |= r3;
    *(s16 *)(r0 + r14) = r2;
L06069528:
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void STM_CheckCdStat(void)
{
    r0 = r4;
    push(r14);
    T = r0 == 3;
    push(r13);
    push(pr);
    if (T) slot(r14 = 0) {
        goto L0606956E slot(r14 = -23);
        __nopool;
    }
    r0 = r4;
    if (r0 == 4) {
        r3 = &stm_mng;
        r13 = *(s32 *)r3;
        r13 = *(s32 *)(r13 + 16);
        if (r13) {
            __bsr STM_GrpHasNoCdKey() slot(r4 = r13);
            if (r0) goto L0606956E;
        }
        goto L0606956E slot(r14 = -2);
        __nopool;
    }
    r0 = r4;
    if (r0 == 6) {
        goto L0606956E slot(r14 = -25);
        __nopool;
    }
    r0 = r4;
    if (r0 != 5) goto L0606956E;
    r14 = -1;
L0606956E:
    if (r14) {
        r4 = r14;
        pop(pr);
        pop(r13);
        r3 = &stm_set_err;
        return (*r3)() slot(pop(r14));
        __nopool;
    }
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void STM_ChgExecGrp(void)
{
    push(r14);
    push(r13);
    r13 = r4;
    r3 = &stm_mng;
    push(r12);
    push(r11);
    push(pr);
    r15 += -8;
    r4 = *(s32 *)r3;
    r2 = *(s32 *)(r4 + 16);
    if (r2 == r13) slot(r5 = 1) {
        goto L06069720;
        __nopool;
    }
    r14 = *(s32 *)(r4 + 16);
    if (!r14) goto L06069680 slot(r12 = 0);
    r2 = &gfsFlow_GetCdStat;
    r4 = r15;
    (*r2)() slot(r5 = 0);
    r11 = r0;
    __bsr STM_CheckCdStat() slot(r4 = r0);
    r0 = 56;
    r4 = *(s16 *)(r0 + r14);
    r0 = 2;
    r4 = (u16)r4;
    if ((r0 & r4) != 0) {
        goto L060695E2 slot(r0 = 1);
    }
    r0 = 0;
L060695E2:
    if (r0 != 1) goto L06069608;
    r3 = 16;
    if ((r3 & r4) != 0) goto L06069608;
    r3 = &stm_CdPause;
    (*r3)() slot(r4 = r14);
    r4 = r0;
    if (r4) {
        r3 = &stm_set_err;
        (*r3)();
    }
    r0 = 56;
    r2 = *(s16 *)(r0 + r14);
    r3 = 16;
    r2 |= r3;
    *(s16 *)(r0 + r14) = r2;
L06069608:
    r1 = *(s32 *)(r14 + 52);
    if (r1 >= 0) {
        r2 = &gfcd_Unlock;
        (*r2)() slot(r4 = *(s32 *)(r14 + 52));
        r2 = &gfcd_SetCallback;
        r3 = -1;
        *(s32 *)(r14 + 52) = r3;
        r5 = 0;
        (*r2)() slot(r4 = r5);
    }
    r3 = 0x0100;
    r2 = *(s32 *)(r14 + 24);
    if (r2 != r3) {
        r0 = 0x0101;
        *(s32 *)(r14 + 24) = r0;
    }
    if (r11) goto L06069680;
    r11 = *(s32 *)(r14 + 16);
    if (r11) {
        r5 = -1;
        r3 = &gfsTrn_Stop;
        (*r3)() slot(r4 = *(s32 *)(r11 + 16));
        r2 = *(s32 *)(r11 + 16);
        r0 = 0x00A0;
        *(s32 *)(r0 + r2) = r12;
    }
    r0 = 56;
    r0 = *(s16 *)(r0 + r14);
    r0 = (u16)r0;
    if ((r0 & 16) != 0) {
        goto L06069654 slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
L06069654:
    if (r0 != 1) goto L06069674;
    r3 = &stm_get_end_fad;
    (*r3)() slot(r4 = r14);
    *(s32 *)(r15 + 4) = r0;
    r3 = &stm_GetCurFad;
    (*r3)();
    *(s32 *)r15 = r0;
    r3 = *(s32 *)(r15 + 4);
    r1 = *(s32 *)(r14 + 20);
    if (r1 > r3) goto L06069674;
    r3 = *(s32 *)r15;
    *(s32 *)(r14 + 20) = r3;
L06069674:
    r3 = 0x0000FFC9;
    r0 = 56;
    r2 = *(s16 *)(r0 + r14);
    r2 &= r3;
    *(s16 *)(r0 + r14) = r2;
    r14 = r12;
L06069680:
    if (r14) goto L0606971E;
    if (!r13) goto L06069714;
    r3 = *(s32 *)(r13 + 52);
    if (r3 < 0) {
        r1 = &gfcd_Lock;
        (*r1)();
        r4 = r0;
        if (r4 >= 0) slot(r5 = r13) {
            *(s32 *)(r13 + 52) = r4;
        }
        r4 = &STM_GrpCdCallback;
        r2 = &gfcd_SetCallback;
        (*r2)();
    }
    r3 = *(s32 *)(r13 + 52);
    if (r3 < 0) goto L0606970E;
    r5 = *(s32 *)(r13 + 4);
    if (r5) {
        r4 = *(s32 *)(r5 + 20);
        goto L060696EA slot(r4 = *(s32 *)(r4 + 40));
    }
    r4 = 0x00FF;
L060696EA:
    r2 = &gfcd_SetCdCon;
    (*r2)() slot(r5 = *(s32 *)(r13 + 52));
    r3 = &gfcd_WaitServer;
    (*r3)();
    r4 = r0;
    if (r4) {
        r3 = &stm_set_err_gfs;
        (*r3)();
    }
    r0 = 56;
    r3 = 0x0000FFD9;
    r2 = *(s16 *)(r0 + r13);
    r2 &= r3;
    goto L06069714 slot(*(s16 *)(r0 + r13) = r2);
    __nopool;
L0606970E:
    r3 = &stm_set_err;
    (*r3)() slot(r4 = -20);
L06069714:
    r3 = &stm_mng;
    r2 = *(s32 *)r3;
    *(s32 *)(r2 + 16) = r13;
    goto L06069720 slot(r5 = 1);
    __nopool;
L0606971E:
    r5 = r12;
L06069720:
    r0 = r5;
    r15 += 8;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void STM_ReqExecGrp(void)
{
    push(pr);
    r15 += -4;
    r3 = &stm_06070C70;
    *(s32 *)r15 = r4;
    r0 = *(s32 *)r3;
    if (r0) {
        r15 += 4;
        pop(pr);
        return slot(r0 = 0);
        __nopool;
    }
    r4 = 0x0329;
    r3 = &stm_set_func_id;
    (*r3)();
    r2 = &stm_06070C70;
    r3 = &STM_ChgExecGrp;
    r1 = r2;
    *(s32 *)r2 = r3;
    r3 = *(s32 *)r15;
    *(s32 *)(r1 + 4) = r3;
    r3 = &stm_check_gfs_err;
    (*r3)();
    r0 = 1;
    r15 += 4;
    pop(pr);
    return;
    __nopool;
}

void STM_SetExecGrpWait(void)
{
    push(r14);
    push(pr);
    __bsr STM_ReqExecGrp();
    r4 = r0;
    if (!r4) {
        pop(pr);
        r0 = 0;
        return slot(pop(r14));
        __nopool;
    }
    r14 = 0x0104;
    do {
        __bsr STM_ExecServer();
        r4 = r0;
    } while (r4 != r14);
    r0 = 1;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void STM_IsGfsActive(void)
{
    r3 = *(s32 *)(r4 + 16);
    r0 = 120;
    r0 = *(s32 *)(r0 + r3);
    if (r0) {
        goto L060697A4 slot(r4 = 1);
        __nopool;
    }
    r4 = 0;
L060697A4:
    return slot(r0 = r4);
    __nopool;
}

void STM_IsStmActive(void)
{
    push(pr);
    r15 += -4;
    r3 = &stm_set_func_id;
    *(s32 *)r15 = r4;
    r4 = 0x0328;
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
    __bsr STM_IsGfsActive() slot(r4 = *(s32 *)(r4 + 4));
    *(s32 *)r15 = r0;
    r3 = &stm_check_gfs_err;
    (*r3)();
    r0 = *(s32 *)r15;
    r15 += 4;
    pop(pr);
    return;
}

void STM_GrpClearReached(void)
{
    push(r14);
    push(r13);
    push(r12);
    r13 = 0;
    push(r11);
    push(pr);
    r12 = &stm_GetFadRange;
    r15 += -8;
    r11 = *(s32 *)(r4 + 20);
    goto L06069852 slot(r14 = *(s32 *)r4);
    __nopool;
L06069832:
    r6 = r15;
    r6 += 4;
    r5 = r15;
    (*r12)() slot(r4 = *(s32 *)(r14 + 20));
    r2 = *(s32 *)r15;
    if (r2 > r11) {
        r0 = 44;
        r3 = 0x00FE;
        r1 = *(s32 *)(r14 + 16);
        *(s32 *)(r1 + 8) = r13;
        r2 = *(s8 *)(r0 + r14);
        r2 &= r3;
        *(s8 *)(r0 + r14) = r2;
    }
    r14 = *(s32 *)(r14 + 8);
L06069852:
    if (r14) goto L06069832;
    r15 += 8;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void STM_GrpResetStms(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(pr);
    r12 = &GFS_Seek;
    r13 = &stm_ResetTrBuf;
    goto L06069882 slot(r14 = *(s32 *)r4);
    __nopool;
L06069874:
    r6 = 0;
    r5 = r6;
    (*r12)() slot(r4 = *(s32 *)(r14 + 16));
    (*r13)() slot(r4 = r14);
    r14 = *(s32 *)(r14 + 8);
L06069882:
    if (r14) goto L06069874;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void STM_GrpClearEndFlags(void)
{
    push(r14);
    push(r13);
    push(r12);
    r13 = 2;
    push(pr);
    r12 = &GFS_Seek;
    goto L060698CE slot(r14 = *(s32 *)r4);
    __nopool;
L060698A0:
    r3 = 0x00EF;
    r0 = 44;
    r2 = *(s8 *)(r0 + r14);
    r2 &= r3;
    *(s8 *)(r0 + r14) = r2;
    r2 = 0x00DF;
    r1 = *(s8 *)(r0 + r14);
    r1 &= r2;
    *(s8 *)(r0 + r14) = r1;
    r0 = *(s8 *)(r0 + r14);
    r0 = (u8)r0;
    if ((r0 & r13) != 0) {
        goto L060698C0 slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
L060698C0:
    if (r0 == 1) {
        r6 = 0;
        r5 = r6;
        (*r12)() slot(r4 = *(s32 *)(r14 + 16));
    }
    r14 = *(s32 *)(r14 + 8);
L060698CE:
    if (r14) goto L060698A0;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void STM_SetLoopSub(void)
{
    push(r14);
    r14 = r4;
    r3 = 0x0100;
    push(r13);
    push(r12);
    r13 = r5;
    push(pr);
    r15 += -4;
    *(s32 *)r15 = r6;
    r2 = *(s32 *)(r14 + 24);
    if (r2 == r3) slot(r12 = 1) {
        __bsr STM_GrpResetStms() slot(r4 = r14);
        __bsr STM_GrpClearEndFlags() slot(r4 = r14);
    }
    r0 = r13;
    if (r0 != -1) goto L06069944 slot(r7 = 0);
    r6 = 8;
    goto L06069934 slot(r5 = *(s32 *)r14);
L06069920:
    r0 = 44;
    r4 = *(s8 *)(r0 + r5);
    r4 = (u8)r4;
    r3 = r4;
    if ((r3 & r6) == 0) {
        r1 = 2;
        if ((r1 & r4) == 0) goto L06069938;
    }
    r5 = *(s32 *)(r5 + 8);
L06069934:
    if (r5) goto L06069920;
L06069938:
    *(s32 *)(r14 + 8) = r5;
    r0 = 56;
    r3 = 0x0000FFFE;
    r2 = *(s16 *)(r0 + r14);
    goto L06069962 slot(r2 &= r3);
    __nopool;
L06069944:
    if (r13) {
        r0 = 44;
        r0 = *(s8 *)(r0 + r13);
        r0 = (u8)r0;
        if ((r0 & 2) != 0) goto L06069966;
    }
    if (r13) {
        r13 = *(s32 *)(r13 + 4);
    }
    *(s32 *)(r14 + 8) = r13;
    r0 = 56;
    r2 = *(s16 *)(r0 + r14);
    r3 = 1;
    r2 |= r3;
L06069962:
    goto L06069968 slot(*(s16 *)(r0 + r14) = r2);
    __nopool;
L06069966:
    r12 = r7;
L06069968:
    r3 = *(s32 *)r15;
    r0 = r12;
    *(s32 *)(r14 + 44) = r3;
    *(s32 *)(r14 + 48) = r7;
    r15 += 4;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void STM_SetLoop(void)
{
    push(pr);
    r15 += -12;
    r3 = &stm_set_func_id;
    *(s32 *)r15 = r4;
    *(s32 *)(r15 + 8) = r5;
    *(s32 *)(r15 + 4) = r6;
    r4 = 0x0332;
    (*r3)();
    r0 = *(s32 *)r15;
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        (*r2)();
        r15 += 12;
        pop(pr);
        return slot(r0 = 0);
        __nopool;
    }
    r3 = *(s32 *)(r15 + 4);
    if (r3 < 0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -14);
        r2 = &stm_call_err_func;
        (*r2)();
        r15 += 12;
        pop(pr);
        return slot(r0 = 0);
        __nopool;
    }
    r6 = *(s32 *)(r15 + 4);
    r5 = *(s32 *)(r15 + 8);
    r4 = *(s32 *)r15;
    __bsr STM_SetLoopSub();
    *(s32 *)r15 = r0;
    r3 = &stm_check_gfs_err;
    (*r3)();
    r0 = *(s32 *)r15;
    r15 += 12;
    pop(pr);
    return;
    __nopool;
}

void STM_GrpMarkReached(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(pr);
    r15 += -8;
    r13 = &stm_GetFadRange;
    r12 = *(s32 *)(r4 + 20);
    goto L06069A4A slot(r14 = *(s32 *)r4);
    __nopool;
L060699F0:
    r6 = r15;
    r6 += 4;
    r5 = r15;
    (*r13)() slot(r4 = *(s32 *)(r14 + 20));
    r2 = *(s32 *)r15;
    if (r2 >= r12) {
        r0 = 44;
        r0 = *(s8 *)(r0 + r14);
        r0 = (u8)r0;
        if ((r0 & 8) == 0) goto L06069A3A;
    }
    r0 = 44;
    r0 = *(s8 *)(r0 + r14);
    r0 = (u8)r0;
    if ((r0 & 2) != 0) {
        goto L06069A36 slot(r0 = 1);
    }
    r0 = 0;
L06069A36:
    if (r0 != 1) goto L06069A48;
L06069A3A:
    r0 = 44;
    r2 = *(s8 *)(r0 + r14);
    r3 = 1;
    r2 |= r3;
    *(s8 *)(r0 + r14) = r2;
    r1 = *(s32 *)(r14 + 16);
    *(s32 *)(r1 + 8) = r3;
L06069A48:
    r14 = *(s32 *)(r14 + 8);
L06069A4A:
    if (r14) goto L060699F0;
    r15 += 8;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
}

void STM_GrpCheckPassed(void)
{
    push(r14);
    push(r13);
    r13 = r4;
    push(r12);
    push(r11);
    push(r10);
    push(r9);
    push(r8);
    push(pr);
    r8 = &stm_update_cur;
    r15 += -8;
    r9 = &stm_remove_cd;
    r11 = *(s32 *)(r13 + 20);
    r10 = &stm_GetFadRange;
    goto L06069ADE slot(r14 = *(s32 *)(r13 + 4));
    __nopool;
L06069A7A:
    r6 = r15;
    r5 = r15;
    r5 += 4;
    (*r10)() slot(r4 = *(s32 *)(r14 + 20));
    r2 = *(s32 *)r15;
    if (r2 >= r11) goto L06069ADC;
    r0 = 44;
    r0 = *(s8 *)(r0 + r14);
    r0 = (u8)r0;
    if ((r0 & 1) != 0) {
        goto L06069A9A slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
L06069A9A:
    if (r0 != 1) goto L06069ADC;
    r0 = 44;
    r0 = *(s8 *)(r0 + r14);
    r0 = (u8)r0;
    if ((r0 & 4) != 0) {
        goto L06069AAE slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
L06069AAE:
    if (r0 != 1) goto L06069ADC;
    r0 = 44;
    r2 = *(s8 *)(r0 + r14);
    r3 = 8;
    r2 |= r3;
    *(s8 *)(r0 + r14) = r2;
    (*r9)() slot(r4 = r14);
    r3 = *(s32 *)(r13 + 8);
    if (r3 == r14) {
        r5 = -1;
        r6 = *(s32 *)(r13 + 44);
        r12 = *(s32 *)(r13 + 48);
        __bsr STM_SetLoopSub() slot(r4 = r13);
        *(s32 *)(r13 + 48) = r12;
    }
    r2 = *(s32 *)(r13 + 12);
    if (r2 != r14) goto L06069ADC;
    (*r8)() slot(r4 = r13);
L06069ADC:
    r14 = *(s32 *)(r14 + 12);
L06069ADE:
    if (r14) goto L06069A7A;
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

void STM_GrpNextStart(void)
{
    push(r14);
    push(r13);
    r13 = r5;
    push(r12);
    push(r11);
    push(pr);
    r15 += -8;
    r3 = *(s32 *)(r4 + 20);
    if (!(r13 >= r3)) {
        r13 = *(s32 *)(r4 + 20);
    }
    r11 = &stm_GetFadRange;
    r12 = 8;
    goto L06069B42 slot(r14 = *(s32 *)r4);
    __nopool;
L06069B14:
    r0 = 44;
    r2 = *(s8 *)(r0 + r14);
    r2 = (u8)r2;
    if ((r2 & r12) != 0) goto L06069B40;
    r6 = r15;
    r6 += 4;
    r5 = r15;
    (*r11)() slot(r4 = *(s32 *)(r14 + 20));
    r2 = *(s32 *)r15;
    if (!(r2 > r13)) {
        r1 = *(s32 *)(r15 + 4);
        if (r1 >= r13) goto L06069B46;
    }
    r3 = *(s32 *)r15;
    if (!(r3 > r13)) goto L06069B40;
    r0 = *(s32 *)r15;
    goto L06069B48;
    __nopool;
L06069B40:
    r14 = *(s32 *)(r14 + 8);
L06069B42:
    if (r14) goto L06069B14;
L06069B46:
    r0 = -1;
L06069B48:
    r15 += 8;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void STM_GrpLoopStart(void)
{
    push(pr);
    r3 = &stm_GetFadRange;
    r15 += -12;
    *(s32 *)(r15 + 8) = r4;
    r6 = r15;
    r4 = *(s32 *)(r4 + 8);
    r5 = r15;
    r6 += 4;
    (*r3)() slot(r4 = *(s32 *)(r4 + 20));
    r0 = *(s32 *)r15;
    r15 += 12;
    pop(pr);
    return;
    __nopool;
}

void STM_GrpNextPickup(void)
{
    push(r14);
    r14 = r4;
    push(r13);
    push(r12);
    push(r11);
    r11 = 0;
    push(r10);
    push(r9);
    push(r8);
    r9 = r5;
    push(pr);
    r8 = r7;
    r15 += -8;
    *(s32 *)r15 = r6;
    r13 = *(s32 *)(r15 + 40);
    r10 = *(s32 *)(r15 + 44);
    *(s32 *)(r15 + 4) = r11;
    r3 = *(s32 *)(r14 + 44);
    r2 = *(s32 *)(r14 + 48);
    if (r2 == r3) slot(r12 = -1) {
        r0 = *(s32 *)r15;
        r1 = *(s32 *)(r14 + 20);
        if (r1 > r0) {
            *(s32 *)r13 = r12;
            *(s32 *)r10 = r11;
            goto L06069D2C slot(r0 = 1);
            __nopool;
        }
        if (r8) goto L06069C22;
        r3 = &gfsFlow_GetCdStat;
        r5 = 0;
        (*r3)() slot(r4 = r5);
        __bsr STM_CheckCdStat() slot(r4 = r0);
        r2 = &stm_mng;
        r3 = *(s32 *)r2;
        r1 = *(s32 *)(r3 + 24);
        if (!(r9 > r1)) goto L06069C22;
        r3 = &stm_GetCurFad;
        (*r3)();
        *(s32 *)(r14 + 20) = r0;
        r2 = *(s32 *)(r14 + 48);
        r2 += -1;
        goto L06069C22 slot(*(s32 *)(r14 + 48) = r2);
        __nopool;
    }
    r1 = *(s32 *)r15;
    r3 = *(s32 *)(r14 + 20);
    if (r3 > r1) {
        r0 = 56;
        r0 = *(s16 *)(r0 + r14);
        r0 = (u16)r0;
        if ((r0 & 2) == 0) goto L06069BF2;
    }
    r1 = *(s32 *)(r14 + 4);
    if (r1) goto L06069C22;
L06069BF2:
    r1 = *(s32 *)(r14 + 8);
    if (!r1) {
        *(s32 *)r13 = r12;
        *(s32 *)r10 = r11;
        goto L06069D2C slot(r0 = 1);
    }
    __bsr STM_GrpLoopStart() slot(r4 = r14);
    *(s32 *)(r14 + 20) = r0;
    __bsr STM_GrpClearEndFlags() slot(r4 = r14);
L06069C22:
    r0 = 56;
    r0 = *(s16 *)(r0 + r14);
    r0 = (u16)r0;
    if ((r0 & 2) == 0) {
        r2 = *(s32 *)(r14 + 52);
        if (r2 >= 0) {
            r5 = *(s32 *)(r14 + 20);
            __bsr STM_GrpNextStart() slot(r4 = r14);
            r3 = r0;
            if (r3 >= 0) slot(*(s32 *)r13 = r0) {
                r1 = *(s32 *)r13;
                *(s32 *)(r14 + 20) = r1;
            }
            r2 = 0x0102;
            r3 = 1;
            *(s32 *)r10 = r3;
            *(s32 *)(r14 + 24) = r2;
            goto L06069D2A slot(*(s32 *)r13 = r12);
            __nopool;
        }
        *(s32 *)r13 = r12;
        goto L06069D2A slot(*(s32 *)r10 = r11);
        __nopool;
    }
    r0 = 56;
    r0 = *(s16 *)(r0 + r14);
    r0 = (u16)r0;
    if ((r0 & 4) != 0) {
        goto L06069C66 slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
L06069C66:
    if (r0 != 1) goto L06069D26;
    r3 = *(s32 *)r15;
    if (r9 > r3) goto L06069CE4;
    r3 = &gfsFlow_GetCdStat;
    r5 = 0;
    (*r3)() slot(r4 = r5);
    __bsr STM_CheckCdStat() slot(r4 = r0);
    if (r8) goto L06069C98;
    r2 = &stm_mng;
    r3 = *(s32 *)r2;
    r1 = *(s32 *)(r3 + 24);
    if (!(r9 > r1)) goto L06069C98;
    r0 = 56;
    r3 = 0x0000FFD9;
    *(s32 *)(r14 + 20) = r9;
    r2 = *(s16 *)(r0 + r14);
    r2 &= r3;
    goto L06069D26 slot(*(s16 *)(r0 + r14) = r2);
    __nopool;
L06069C98:
    *(s32 *)(r14 + 20) = r9;
    r0 = 56;
    r0 = *(s16 *)(r0 + r14);
    r0 = (u16)r0;
    if ((r0 & 32) == 0) {
        r5 = r9;
        __bsr STM_GrpNextStart() slot(r4 = r14);
        r3 = r0;
        if (r3 < 0) goto L06069D28 slot(*(s32 *)r13 = r0);
        r0 = 56;
        r2 = *(s16 *)(r0 + r14);
        r3 = 32;
        r2 |= r3;
        goto L06069D28 slot(*(s16 *)(r0 + r14) = r2);
        __nopool;
    }
    r0 = r8;
    if (r0 != 2) {
        r3 = 0x0000FFDF;
        r0 = 56;
        r2 = *(s16 *)(r0 + r14);
        r2 &= r3;
        *(s16 *)(r0 + r14) = r2;
    }
    goto L06069D28 slot(*(s32 *)r13 = r12);
L06069CE4:
    if (!r8) {
        *(s32 *)(r14 + 20) = r9;
        r0 = 56;
        r3 = 0x0000FFD9;
        r2 = *(s16 *)(r0 + r14);
        r2 &= r3;
        *(s16 *)(r0 + r14) = r2;
        __bsr STM_GrpCheckPassed() slot(r4 = r14);
        __bsr STM_GrpIsAllEnd() slot(r4 = r14);
        if (!r0) {
            r3 = *(s32 *)(r14 + 48);
            r3 += 1;
            *(s32 *)(r14 + 48) = r3;
        }
        *(s32 *)r10 = r11;
        *(s32 *)r13 = r12;
        r0 = *(s32 *)(r14 + 8);
        if (r0) {
            r3 = *(s32 *)(r14 + 44);
            r2 = *(s32 *)(r14 + 48);
            if (!(r2 >= r3)) goto L06069D2A;
        }
        r0 = 1;
        *(s32 *)(r15 + 4) = r0;
        goto L06069D2A;
        __nopool;
    }
    *(s32 *)r13 = r12;
    goto L06069D2A slot(*(s32 *)r10 = r11);
    __nopool;
L06069D26:
    *(s32 *)r13 = r12;
L06069D28:
    *(s32 *)r10 = r11;
L06069D2A:
    r0 = *(s32 *)(r15 + 4);
L06069D2C:
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

void STM_GrpSeek(void)
{
    push(r14);
    r14 = r4;
    push(r13);
    r13 = r5;
    push(pr);
    r5 = 0;
    if (r13 >= r5) slot(r4 = r5) {
        r5 = r13;
        r2 = &stm_CdPlayFrom;
        (*r2)() slot(r4 = r14);
        r4 = r0;
        goto L06069D90 slot(*(s32 *)(r14 + 20) = r13);
        __nopool;
    }
    r2 = *(s32 *)(r14 + 20);
    if (r2 > r6) goto L06069D90;
    r0 = r7;
    if (r0 != 1) goto L06069D90;
    r0 = 56;
    r0 = *(s16 *)(r0 + r14);
    r0 = (u16)r0;
    if ((r0 & 2) != 0) goto L06069D90;
    __bsr STM_GrpMarkReached() slot(r4 = r14);
    r3 = &stm_CdPlayObj;
    (*r3)() slot(r4 = r14);
    r4 = r0;
    if (r4) goto L06069D90;
    r0 = 56;
    r2 = *(s16 *)(r0 + r14);
    r3 = 2;
    r2 |= r3;
    *(s16 *)(r0 + r14) = r2;
L06069D90:
    pop(pr);
    r0 = r4;
    pop(r13);
    return slot(pop(r14));
}

void STM_GrpExecPickup(void)
{
    push(r14);
    r14 = r4;
    push(pr);
    r15 += -20;
    *(s32 *)(r15 + 16) = r5;
    *(s32 *)(r15 + 12) = r6;
    *(s32 *)(r15 + 8) = r7;
    __bsr STM_GrpIsAllEnd() slot(r4 = r14);
    if (r0 != 1) goto L06069E02;
    r3 = 0x0101;
    r2 = *(s32 *)(r14 + 24);
    if (r2 != r3) {
        r0 = 56;
        r0 = *(s16 *)(r0 + r14);
        r0 = (u16)r0;
        if ((r0 & 64) == 0) goto L06069DF8;
    }
    r2 = *(s32 *)r14;
    if (!r2) goto L06069DF8;
    r3 = *(s32 *)(r14 + 44);
    r2 = *(s32 *)(r14 + 48);
    if (r2 >= r3) goto L06069DF8;
    __bsr STM_GrpMarkReached() slot(r4 = r14);
    __bsr STM_GrpClearEndFlags() slot(r4 = r14);
    r0 = 56;
    r3 = 0x7FFFFFFF;
    *(s32 *)(r14 + 20) = r3;
    r2 = 0x0102;
    *(s32 *)(r14 + 24) = r2;
    r3 = 0x0000FFBF;
    r2 = *(s16 *)(r0 + r14);
    r2 &= r3;
    *(s16 *)(r0 + r14) = r2;
L06069DF8:
    r0 = 1;
    r15 += 20;
    pop(pr);
    return slot(pop(r14));
    __nopool;
L06069E02:
    r3 = r15;
    r3 += 4;
    push(r3);
    r2 = r15;
    r2 += 4;
    push(r2);
    r7 = *(s32 *)(r15 + 16);
    r6 = *(s32 *)(r15 + 20);
    r5 = *(s32 *)(r15 + 24);
    __bsr STM_GrpNextPickup() slot(r4 = r14);
    r15 += 8;
    *(s32 *)(r15 + 8) = r0;
    r7 = *(s32 *)(r15 + 4);
    r6 = *(s32 *)(r15 + 12);
    r5 = *(s32 *)r15;
    __bsr STM_GrpSeek() slot(r4 = r14);
    r4 = r0;
    if (r4) {
        r3 = &stm_set_err;
        (*r3)();
    }
    r0 = *(s32 *)(r15 + 8);
    r15 += 20;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void STM_GetNumSct(void)
{
    push(r14);
    r14 = r4;
    push(pr);
    r15 += -4;
    r3 = *(s32 *)(r14 + 20);
    r0 = *(s32 *)(r3 + 28);
    if (!r0) {
        r6 = 0x7FFFFFFF;
        r1 = 0;
        r3 = &gfcd_GetSctNum;
        r5 = r1;
        push(r1);
        r7 = r15;
        r4 = *(s32 *)(r14 + 20);
        r7 += 4;
        (*r3)() slot(r4 = *(s32 *)(r4 + 32));
        r4 = r0;
        if (r4) slot(r15 += 4) {
            r3 = &stm_set_err_gfs;
            (*r3)();
            r0 = 0;
            r15 += 4;
            pop(pr);
            return slot(pop(r14));
            __nopool;
        }
        r2 = &gfcd_WaitServer;
        (*r2)();
        r4 = r0;
        if (!r4) goto L06069E9C;
        r3 = &stm_set_err_gfs;
        (*r3)();
        r0 = 0;
        r15 += 4;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r3 = &gfsAcc_CountSctAll;
    (*r3)() slot(r4 = *(s32 *)(r14 + 16));
    *(s32 *)r15 = r0;
L06069E9C:
    r0 = *(s32 *)r15;
    r15 += 4;
    pop(pr);
    return slot(pop(r14));
}

void STM_GetNumSctHn(void)
{
    push(pr);
    r15 += -4;
    r3 = &stm_set_func_id;
    *(s32 *)r15 = r4;
    r4 = 0x0324;
    (*r3)();
    r0 = *(s32 *)r15;
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        (*r2)();
        r15 += 4;
        pop(pr);
        return slot(r0 = -11);
        __nopool;
    }
    r4 = *(s32 *)r15;
    __bsr STM_GetNumSct() slot(r4 = *(s32 *)(r4 + 4));
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
    r15 += 4;
    pop(pr);
    return;
    __nopool;
}

void STM_GetStmStat(void)
{
    r0 = 44;
    push(r14);
    r14 = r4;
    push(r13);
    push(r12);
    push(pr);
    r12 = r7;
    r15 += -8;
    *(s32 *)(r15 + 4) = r5;
    r13 = *(s32 *)r14;
    r0 = *(s8 *)(r0 + r14);
    r0 = (u8)r0;
    if ((r0 & 8) != 0) slot(r13 = *(s32 *)(r13 + 20)) {
        goto L06069F3A slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
L06069F3A:
    if (r0 != 1) goto L06069F48;
    if (r12) goto L06069F48;
    r0 = 0x0100;
    goto L0606A012;
    __nopool;
L06069F48:
    if (r13 > r6) goto L06069F9C slot(r4 = 1);
    r2 = *(s32 *)(r14 + 20);
    r0 = *(s32 *)(r2 + 28);
    if (r0) goto L06069F9C;
    r0 = 44;
    r5 = *(s8 *)(r0 + r14);
    r5 = (u8)r5;
    r3 = r5;
    if ((r3 & r4) != 0) {
        goto L06069F68 slot(r1 = r4);
        __nopool;
    }
    r1 = 0;
L06069F68:
    if (r1 == r4) goto L06069F76;
    r3 = 4;
    if ((r3 & r5) == 0) goto L06069F76;
    if (r4) goto L06069F98;
L06069F76:
    r5 = r15;
    r3 = &gfsFlow_GetCdStat;
    (*r3)() slot(r4 = 0);
    __bsr STM_CheckCdStat() slot(r4 = r0);
    r0 = *(s32 *)r15;
    if ((r0 & 8) == 0) {
        r0 = 0x0102;
        goto L0606A012;
        __nopool;
    }
    if (r12) goto L06069FD8;
    r0 = 0x0103;
    goto L0606A012;
    __nopool;
L06069F98:
    goto L0606A012 slot(r0 = 32);
    __nopool;
L06069F9C:
    r0 = 44;
    r2 = *(s8 *)(r0 + r14);
    r2 = (u8)r2;
    if ((r2 & r4) != 0) {
        goto L06069FCA slot(r3 = r4);
    }
    r3 = 0;
L06069FCA:
    if (r3 != r4) goto L06069FD8;
    if (r12) goto L06069FD8;
    r0 = 0x0100;
    goto L0606A012;
    __nopool;
L06069FD8:
    r3 = 0x7FFFFFFF;
    r2 = *(s32 *)(r14 + 40);
    if (r2 == r3) {
        r2 = &stm_get_end_fad;
        (*r2)() slot(r4 = *(s32 *)r14);
        goto L06069FEC slot(r12 = r0);
        __nopool;
    }
    r12 = *(s32 *)(r14 + 40);
L06069FEC:
    r2 = *(s32 *)(r14 + 16);
    r0 = 0x009C;
    r0 = *(s32 *)(r0 + r2);
    if (!r0) goto L0606A00A;
    r3 = *(s32 *)(r15 + 4);
    if (r13 >= r3) {
        if (!(r13 >= r12)) goto L0606A00A;
    }
    r2 = &stm_IsTrBufFull;
    (*r2)() slot(r4 = r14);
    if (r0 != 1) goto L0606A010;
L0606A00A:
    r0 = 0x0103;
    goto L0606A012;
    __nopool;
L0606A010:
    r0 = 0x0102;
L0606A012:
    r15 += 8;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void STM_TransStmSub(void)
{
    r3 = r4;
    push(r14);
    r14 = r4;
    push(pr);
    r15 += -8;
    *(s32 *)(r15 + 4) = r4;
    r1 = *(s32 *)(r3 + 24);
    if (!r1) slot(r14 = *(s32 *)(r14 + 16)) {
        r0 = 108;
        r1 = *(s32 *)(r0 + r14);
        if (!r1) goto L0606A052;
    }
    r4 = r14;
    r3 = &gfsTrn_GetFree;
    (*r3)() slot(r4 += 108);
    if (r0 <= 0) goto L0606A052;
    r5 = r15;
    r3 = &gfsTrn_Exec;
    (*r3)() slot(r4 = r14);
    goto L0606A056;
    __nopool;
L0606A052:
    r3 = 0;
    *(s32 *)r15 = r3;
L0606A056:
    r0 = *(s32 *)r15;
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void STM_GrpCallFunc(void)
{
    push(r14);
    r14 = r4;
    push(pr);
    r0 = *(s32 *)(r14 + 36);
    if (!r0) goto L0606A086;
    r0 = 56;
    r0 = *(s16 *)(r0 + r14);
    r0 = (u16)r0;
    if ((r0 & 8) == 0) goto L0606A086;
    r3 = *(s32 *)(r14 + 36);
    (*r3)() slot(r4 = *(s32 *)(r14 + 40));
    r3 = 0x0000FFF7;
    r0 = 56;
    r2 = *(s16 *)(r0 + r14);
    r2 &= r3;
    *(s16 *)(r0 + r14) = r2;
L0606A086:
    pop(pr);
    return slot(pop(r14));
}

void STM_ExecStmRound(void)
{
    push(r14);
    r0 = r6;
    push(r13);
    push(r12);
    push(r11);
    r12 = 1;
    push(r10);
    r11 = 0;
    push(r9);
    r10 = r4;
    push(r8);
    push(pr);
    r15 += -36;
    *(s32 *)(r15 + 28) = r5;
    *(s8 *)(r15 + 12) = r0;
    r0 = 68;
    *(s32 *)(r15 + 16) = r7;
    r13 = *(s32 *)(r0 + r15);
    *(s32 *)(r15 + 32) = r11;
    r3 = *(s32 *)(r15 + 16);
    *(s32 *)r3 = r11;
    r14 = *(s32 *)(r10 + 16);
    r3 = *(s32 *)(r14 + 20);
    r0 = *(s32 *)(r3 + 28);
    if (!r0) slot(r9 = r12) {
        if (!r12) goto L0606A0FE;
    } else {
        if (!r11) goto L0606A0FE;
    }
    r6 = r15;
    r3 = &stm_GetFadRange;
    r5 = r15;
    r6 += 4;
    (*r3)() slot(r4 = *(s32 *)(r14 + 20));
    goto L0606A104;
    __nopool;
L0606A0FE:
    r3 = 0x0096;
    *(s32 *)(r15 + 4) = r3;
    *(s32 *)r15 = r3;
L0606A104:
    r3 = 0x7FFFFFFF;
    r0 = 44;
    r0 = *(s8 *)(r0 + r14);
    *(s8 *)(r15 + 8) = r0;
    r2 = *(s32 *)(r14 + 40);
    if (r2 == r3) {
        r2 = &stm_get_end_fad;
        (*r2)() slot(r4 = r10);
        goto L0606A11E slot(r5 = r0);
        __nopool;
    }
    r5 = *(s32 *)(r14 + 40);
L0606A11E:
    r6 = 16;
    r0 = *(s8 *)(r15 + 8);
    r4 = r0;
    r4 = (u8)r4;
    r3 = r4;
    if ((r3 & r6) != 0) goto L0606A144;
    r2 = *(s32 *)r15;
    r1 = *(s32 *)(r10 + 20);
    if (!(r1 > r2)) goto L0606A144;
    r3 = *(s32 *)(r10 + 20);
    if (!(r3 >= r5)) goto L0606A144;
    r0 = 44;
    r2 = *(s8 *)(r0 + r14);
    r3 = 16;
    r2 |= r3;
    *(s8 *)(r0 + r14) = r2;
L0606A144:
    r7 = 32;
    r3 = r4;
    if ((r3 & r7) != 0) goto L0606A164;
    r2 = *(s32 *)(r15 + 4);
    r1 = *(s32 *)(r10 + 20);
    if (!(r1 > r2)) goto L0606A164;
    r3 = *(s32 *)(r10 + 20);
    if (!(r3 >= r5)) goto L0606A164;
    r0 = 44;
    r2 = *(s8 *)(r0 + r14);
    r3 = 32;
    r2 |= r3;
    *(s8 *)(r0 + r14) = r2;
L0606A164:
    r1 = r4;
    if ((r1 & r7) != 0) goto L0606A1A0;
    r0 = 44;
    r3 = *(s8 *)(r0 + r14);
    r3 = (u8)r3;
    if ((r3 & r7) == 0) goto L0606A1A0;
    r3 = &gfsAcc_CountSctAll;
    (*r3)() slot(r4 = *(s32 *)(r14 + 16));
    r5 = r0;
    r4 = *(s32 *)(r14 + 16);
    r3 = &gfsTrn_Request;
    (*r3)() slot(r4 += 108);
    goto L0606A1B8;
L0606A1A0:
    if ((r4 & r6) != 0) goto L0606A1B8;
    r0 = 44;
    r3 = *(s8 *)(r0 + r14);
    r3 = (u8)r3;
    if ((r3 & r6) == 0) goto L0606A1B8;
    r5 = 0x7FFFFFFF;
    r4 = *(s32 *)(r14 + 16);
    r3 = &gfsTrn_Request;
    (*r3)() slot(r4 += 108);
L0606A1B8:
    __bsr STM_TransStmSub() slot(r4 = r14);
    __bsr STM_IsGfsActive() slot(r4 = r14);
    if (r0 == 1) {
        r3 = *(s32 *)(r15 + 16);
        r7 = r12;
        *(s32 *)r3 = r12;
        r6 = *(s32 *)(r15 + 4);
        r5 = *(s32 *)r15;
        __bsr STM_GetStmStat() slot(r4 = r14);
        *(s32 *)r13 = r0;
        goto L0606A2B2 slot(r0 = 0);
        __nopool;
    }
    *(s32 *)(r15 + 20) = r14;
    goto L0606A294 slot(r8 = r11);
    __nopool;
L0606A1DE:
    T = !r8;
    r14 = *(s32 *)(r14 + 8);
    r0 = T;
    *(s32 *)(r15 + 24) = r0;
L0606A1E6:
    if (!r14) {
        r14 = *(s32 *)r10;
    }
    r3 = *(s32 *)(r15 + 28);
    if (r14 == r3) {
        r1 = *(s32 *)(r15 + 16);
        *(s32 *)r1 = r12;
    }
    r3 = &gfsAcc_CountSctAll;
    (*r3)() slot(r4 = *(s32 *)(r14 + 16));
    *(s32 *)(r15 + 8) = r0;
    r3 = *(s32 *)(r14 + 20);
    r0 = *(s32 *)(r3 + 28);
    if (!r0) {
        r6 = r15;
        r3 = &stm_GetFadRange;
        r5 = r15;
        r6 += 4;
        (*r3)() slot(r4 = *(s32 *)(r14 + 20));
        goto L0606A21C;
        __nopool;
    }
    r3 = 0x0096;
    *(s32 *)(r15 + 4) = r3;
    *(s32 *)r15 = r3;
L0606A21C:
    r7 = *(s32 *)(r15 + 8);
    r6 = *(s32 *)(r15 + 4);
    r5 = *(s32 *)r15;
    __bsr STM_GetStmStat() slot(r4 = r14);
    *(s32 *)r13 = r0;
    r2 = *(s32 *)(r15 + 8);
    if (r2 > 0) goto L0606A23E;
    r0 = *(s8 *)(r15 + 12);
    r0 = (u8)r0;
    if (r0 == 2) goto L0606A23E;
    r0 = *(s8 *)(r15 + 12);
    r0 = (u8)r0;
    if (r0 != 1) goto L0606A278;
L0606A23E:
    r0 = *(s32 *)(r15 + 24);
    if (r0) {
        r3 = 0x0102;
        r2 = *(s32 *)r13;
        if (r2 == r3) goto L0606A25A;
    }
    r0 = r8;
    if (r0 != 1) goto L0606A278;
    r2 = 0x0103;
    r3 = *(s32 *)r13;
    if (r3 != r2) goto L0606A278;
L0606A25A:
    *(s32 *)(r15 + 32) = r12;
    goto L0606A292 slot(r9 = r11);
L0606A278:
    r4 = *(s32 *)r13;
    r2 = 0x0102;
    if (r4 != r2) {
        r1 = 0x0103;
        if (r4 != r1) goto L0606A288;
    }
    r9 = r11;
L0606A288:
    r2 = *(s32 *)(r15 + 20);
    if (r14 == r2) goto L0606A292;
    goto L0606A1E6 slot(r14 = *(s32 *)(r14 + 8));
    __nopool;
L0606A292:
    r8 += 1;
L0606A294:
    r2 = 2;
    if (!(r8 >= r2)) {
        r0 = *(s32 *)(r15 + 32);
        if (r0 != 1) goto L0606A1DE;
    }
    *(s32 *)(r10 + 16) = r14;
    r0 = *(s32 *)(r15 + 32);
    if (r0) goto L0606A2B0;
    if (r9) goto L0606A2B0;
    r3 = 0x0102;
    *(s32 *)r13 = r3;
L0606A2B0:
    r0 = r9;
L0606A2B2:
    r15 += 36;
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

void STM_GrpResetGfs(void)
{
    push(r14);
    push(r13);
    push(pr);
    r13 = &GFS_Seek;
    goto L0606A2DC slot(r14 = *(s32 *)r4);
    __nopool;
L0606A2D2:
    r6 = 0;
    r5 = r6;
    (*r13)() slot(r4 = *(s32 *)(r14 + 16));
    r14 = *(s32 *)(r14 + 8);
L0606A2DC:
    if (r14) goto L0606A2D2;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void STM_GrpExecStms(void)
{
    push(r14);
    r0 = r5;
    push(r13);
    r14 = r4;
    push(r12);
    push(pr);
    r15 += -12;
    *(s8 *)(r15 + 8) = r0;
    r1 = *(s32 *)(r14 + 16);
    if (!r1) {
        r3 = *(s32 *)r14;
        *(s32 *)(r14 + 16) = r3;
    }
    r12 = *(s32 *)(r14 + 16);
    do {
        r2 = r15;
        r5 = r12;
        push(r2);
        r7 = r15;
        r0 = *(s8 *)(r15 + 12);
        r7 += 8;
        r6 = r0;
        __bsr STM_ExecStmRound() slot(r4 = r14);
        r15 += 4;
        r1 = *(s32 *)(r15 + 4);
        r13 = r0;
    } while (!r1);
    r4 = 0x0103;
    r3 = *(s32 *)r15;
    if (r3 != r4) {
        r1 = *(s32 *)(r14 + 24);
        if (r1 != r4) goto L0606A334;
    }
    r2 = *(s32 *)r15;
    goto L0606A37C slot(*(s32 *)(r14 + 24) = r2);
    __nopool;
L0606A334:
    __bsr STM_GrpIsAllEnd() slot(r4 = r14);
    if (r0 != 1) goto L0606A37C;
    r2 = *(s32 *)(r14 + 44);
    r3 = *(s32 *)(r14 + 48);
    if (!(r3 >= r2)) {
        r0 = 0x0100;
        r1 = *(s32 *)r15;
        if (r1 == r0) slot(r13 = 0) {
            r0 = 56;
            r2 = *(s32 *)(r14 + 48);
            r3 = 64;
            r2 += 1;
            *(s32 *)(r14 + 48) = r2;
            r2 = *(s16 *)(r0 + r14);
            r2 |= r3;
            *(s16 *)(r0 + r14) = r2;
        }
        goto L0606A37C;
    }
    r2 = 0x0096;
    r0 = 56;
    *(s32 *)(r14 + 20) = r2;
    r3 = 64;
    r2 = *(s16 *)(r0 + r14);
    r13 = 1;
    r2 |= r3;
    *(s16 *)(r0 + r14) = r2;
L0606A37C:
    r0 = r13;
    r15 += 12;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void STM_ExecServer(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(r11);
    push(pr);
    r13 = &stm_mng;
    r15 += -12;
    r3 = &stm_06070C70;
    r0 = *(s32 *)r3;
    if (r0) slot(r12 = 0) {
        r2 = &stm_06070C70;
        r1 = *(s32 *)r2;
        r4 = r2;
        (*r1)() slot(r4 = *(s32 *)(r4 + 4));
        if (r0 == 1) slot(r4 = r0) {
            r2 = &stm_06070C70;
            r0 = 0x0104;
            goto L0606A4B6 slot(*(s32 *)r2 = r12);
            __nopool;
        }
        r0 = *(s32 *)r13;
        goto L0606A4B6 slot(r0 = *(s32 *)(r0 + 32));
        __nopool;
    }
    r4 = 0x0330;
    r3 = &stm_set_func_id;
    (*r3)();
    r14 = *(s32 *)r13;
    r14 = *(s32 *)(r14 + 16);
    if (!r14) goto L0606A4B2;
    r1 = *(s32 *)r14;
    if (!r1) goto L0606A4B2;
    r3 = *(s32 *)r13;
    r0 = *(s32 *)(r3 + 44);
    if (r0) goto L0606A49E;
    r4 = 1;
    r3 = *(s32 *)r13;
    *(s32 *)(r3 + 44) = r4;
    r3 = &gfs_scu_dma_busy;
    r2 = *(s32 *)r3;
    if (r2 != r4) goto L0606A414;
    r4 = *(s32 *)(r14 + 16);
    r5 = r15;
    r2 = &gfsTrn_Step;
    (*r2)() slot(r4 = *(s32 *)(r4 + 16));
    r3 = &gfs_scu_dma_busy;
    r0 = *(s32 *)r3;
    if (r0 != 1) goto L0606A414;
    r1 = *(s32 *)r13;
    r2 = &stm_check_gfs_err;
    (*r2)() slot(*(s32 *)(r1 + 44) = r12);
    r4 = r0;
    if (!(r4 >= r12)) {
        goto L0606A4B6 slot(r0 = r4);
        __nopool;
    }
    goto L0606A4B6 slot(r0 = *(s32 *)(r14 + 24));
    __nopool;
L0606A414:
    __bsr STM_GrpCallFunc() slot(r4 = r14);
    r3 = &gfsFlow_GetCdStat;
    r4 = r15;
    r4 += 4;
    (*r3)() slot(r5 = 0);
    r11 = r0;
    __bsr STM_CheckCdStat() slot(r4 = r0);
    r0 = *(s32 *)r13;
    r1 = *(s32 *)(r0 + 28);
    if (r1) {
        goto L0606A436 slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
L0606A436:
    if (r0 == 1) {
        r3 = &stm_call_err_func;
        (*r3)();
        goto L0606A49A;
    }
    r3 = &stm_get_end_fad;
    (*r3)() slot(r4 = r14);
    r6 = r0;
    r5 = *(s32 *)(r15 + 4);
    r7 = r11;
    __bsr STM_GrpExecPickup() slot(r4 = r14);
    *(s32 *)(r15 + 8) = r0;
    r5 = r11;
    __bsr STM_GrpExecStms() slot(r4 = r14);
    *(s32 *)r15 = r0;
    r0 = *(s32 *)(r15 + 8);
    if (r0 != 1) goto L0606A49A;
    r0 = *(s32 *)r15;
    if (r0 != 1) goto L0606A49A;
    r2 = 0x0100;
    *(s32 *)(r14 + 24) = r2;
    __bsr STM_GrpResetGfs() slot(r4 = r14);
L0606A49A:
    r2 = *(s32 *)r13;
    *(s32 *)(r2 + 44) = r12;
L0606A49E:
    r3 = &stm_check_gfs_err;
    (*r3)();
    r5 = r0;
    if (r5 < 0) {
        goto L0606A4B4 slot(r4 = r5);
        __nopool;
    }
    goto L0606A4B4 slot(r4 = *(s32 *)(r14 + 24));
    __nopool;
L0606A4B2:
    r4 = 0x0101;
L0606A4B4:
    r0 = r4;
L0606A4B6:
    r15 += 12;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void STM_MovePickup(void)
{
    push(r14);
    push(r13);
    push(pr);
    r15 += -16;
    r3 = &stm_set_func_id;
    *(s32 *)(r15 + 4) = r4;
    *(s32 *)(r15 + 12) = r5;
    r4 = 0x0331;
    (*r3)();
    r0 = *(s32 *)(r15 + 4);
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        (*r2)();
        goto L0606A5B4;
        __nopool;
    }
    r13 = *(s32 *)(r15 + 4);
    r2 = &stm_mng;
    r13 = *(s32 *)(r13 + 4);
    r3 = *(s32 *)r2;
    r14 = *(s32 *)r13;
    r1 = *(s32 *)(r3 + 16);
    if (r1 != r14) goto L0606A594;
    r0 = 56;
    r0 = *(s16 *)(r0 + r14);
    r0 = (u16)r0;
    if ((r0 & 2) != 0) {
        goto L0606A50E slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
L0606A50E:
    if (r0 == 1) {
        r3 = &stm_CdPause;
        (*r3)() slot(r4 = *(s32 *)r13);
        r4 = r0;
        if (r4) {
            r3 = &stm_set_err;
            (*r3)();
        }
        r2 = 0x0101;
        *(s32 *)(r14 + 24) = r2;
    }
    r3 = &gfsFlow_GetCdStat;
    r4 = r15;
    (*r3)() slot(r5 = 0);
    r2 = &STM_CheckCdStat;
    (*r2)() slot(r4 = r0);
    r3 = &stm_mng;
    r0 = *(s32 *)r3;
    r1 = *(s32 *)(r0 + 28);
    if (r1) {
        goto L0606A546 slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
L0606A546:
    if (r0 == 1) {
        r3 = &stm_call_err_func;
        (*r3)();
        goto L0606A5B4;
    }
    r2 = *(s32 *)r15;
    if (r2 >= 0) {
        r1 = *(s32 *)r15;
        *(s32 *)(r14 + 20) = r1;
    }
    r0 = 56;
    r3 = 0x0000FFD9;
    r2 = *(s16 *)(r0 + r14);
    r2 &= r3;
    *(s16 *)(r0 + r14) = r2;
L0606A594:
    __bsr STM_GrpCheckPassed() slot(r4 = r14);
    __bsr STM_GrpClearReached() slot(r4 = r14);
    r3 = &stm_GetFadRange;
    r6 = r15;
    r6 += 8;
    r5 = r15;
    (*r3)() slot(r4 = *(s32 *)(r13 + 20));
    r3 = *(s32 *)r15;
    r2 = *(s32 *)(r15 + 12);
    r2 += r3;
    r3 = &stm_check_gfs_err;
    (*r3)() slot(*(s32 *)(r14 + 20) = r2);
L0606A5B4:
    r15 += 16;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void STM_GetExecGrpPos(void)
{
    push(r14);
    push(pr);
    r3 = &stm_mng;
    r2 = &stm_CdContinue;
    r4 = *(s32 *)r3;
    (*r2)() slot(r4 = *(s32 *)(r4 + 16));
    r3 = &stm_check_gfs_err;
    (*r3)() slot(r14 = r0);
    r4 = r0;
    if (r4 < 0) {
        r14 = r4;
    }
    r0 = r14;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void STM_IsComplete(void)
{
    push(r14);
    push(r13);
    push(pr);
    r3 = &stm_set_func_id;
    r15 += -12;
    *(s32 *)r15 = r4;
    r4 = 0x0335;
    (*r3)();
    r0 = *(s32 *)r15;
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        (*r2)();
        goto L0606A652 slot(r0 = 0);
        __nopool;
    }
    r14 = *(s32 *)r15;
    r14 = *(s32 *)(r14 + 4);
    __bsr STM_GetNumSct() slot(r4 = r14);
    r6 = r15;
    r3 = &stm_GetFadRange;
    r5 = r15;
    *(s32 *)r15 = r0;
    r6 += 8;
    r5 += 4;
    (*r3)() slot(r4 = *(s32 *)(r14 + 20));
    r7 = *(s32 *)r15;
    r6 = *(s32 *)(r15 + 8);
    r5 = *(s32 *)(r15 + 4);
    __bsr STM_GetStmStat() slot(r4 = r14);
    r2 = &stm_check_gfs_err;
    (*r2)() slot(r13 = r0);
    r3 = 0x0100;
    if (r13 == r3) {
        goto L0606A652 slot(r0 = 1);
        __nopool;
    }
    r3 = 0x0103;
    if (r13 != r3) goto L0606A650;
    r1 = *(s32 *)(r14 + 16);
    r0 = 0x009C;
    r0 = *(s32 *)(r0 + r1);
    if (r0) goto L0606A650;
    goto L0606A652 slot(r0 = 1);
    __nopool;
L0606A650:
    r0 = 0;
L0606A652:
    r15 += 12;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void STM_TransStm(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(r11);
    push(pr);
    r15 += -8;
    r3 = &stm_set_func_id;
    *(s32 *)(r15 + 4) = r4;
    r4 = 0x0336;
    (*r3)();
    r0 = *(s32 *)(r15 + 4);
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        (*r2)();
        goto L0606A71C slot(r0 = 0);
    }
    r11 = &stm_mng;
    r4 = *(s32 *)r11;
    r0 = *(s32 *)(r4 + 44);
    if (r0) goto L0606A712 slot(r12 = 0);
    r2 = &gfs_scu_dma_busy;
    r5 = 1;
    *(s32 *)(r4 + 44) = r5;
    r14 = *(s32 *)(r15 + 4);
    r3 = *(s32 *)r2;
    if (r3 != r5) goto L0606A6EA slot(r14 = *(s32 *)(r14 + 4));
    r3 = &gfsTrn_Step;
    r5 = r15;
    (*r3)() slot(r4 = *(s32 *)(r14 + 16));
    r2 = &gfs_scu_dma_busy;
    r0 = *(s32 *)r2;
    if (r0 != 1) goto L0606A6EA;
    r1 = *(s32 *)r11;
    *(s32 *)(r1 + 44) = r12;
    r0 = *(s32 *)r15;
    goto L0606A71C;
    __nopool;
L0606A6EA:
    r13 = *(s32 *)(r14 + 16);
    r3 = &gfsTrn_GetNsct;
    r13 += 108;
    (*r3)() slot(r4 = r13);
    *(s32 *)(r15 + 4) = r0;
    r5 = 0x7FFFFFFF;
    r3 = &gfsTrn_Request;
    (*r3)() slot(r4 = r13);
    __bsr STM_TransStmSub() slot(r4 = r14);
    *(s32 *)r15 = r0;
    r5 = *(s32 *)(r15 + 4);
    r3 = &gfsTrn_Request;
    (*r3)() slot(r4 = r13);
    r2 = *(s32 *)r11;
    goto L0606A714 slot(*(s32 *)(r2 + 44) = r12);
    __nopool;
L0606A712:
    *(s32 *)r15 = r12;
L0606A714:
    r3 = &stm_check_gfs_err;
    (*r3)();
    r0 = *(s32 *)r15;
L0606A71C:
    r15 += 8;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
}

