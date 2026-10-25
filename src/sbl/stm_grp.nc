/* sbl/stm_grp: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is stm_grp.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.06068644");

void stm_init_mng(void)
{
    push(r14);
    r3 = 60;
    push(pr);
    r15 += -12;
    r14 = &stm_mng;
    *(s32 *)(r15 + 4) = r4;
    *(s32 *)r15 = r5;
    r5 = 0;
    *(s32 *)r14 = r6;
    r2 = *(s32 *)(r15 + 4);
    macl = r2 * r3;
    r6 = macl;
    *(s32 *)(r15 + 8) = r6;
    r2 = *(s32 *)r15;
    r1 = r2;
    r2 <<= 1;
    r2 += r1;
    r2 <<= 2;
    r2 <<= 2;
    r6 += r2;
    r2 = &memset;
    r6 += 48;
    (*r2)() slot(r4 = *(s32 *)r14);
    r3 = *(s32 *)r14;
    r4 = -1;
    r2 = r3;
    r2 += 48;
    *(s32 *)r3 = r2;
    r3 = *(s32 *)r14;
    r2 = *(s32 *)(r15 + 4);
    *(s32 *)(r3 + 4) = r2;
    r3 = *(s32 *)r14;
    r2 = r3;
    r1 = *(s32 *)(r15 + 8);
    r0 = *(s32 *)r2;
    r0 += r1;
    r1 = 0;
    *(s32 *)(r3 + 8) = r0;
    r3 = *(s32 *)r14;
    r2 = *(s32 *)r15;
    *(s32 *)(r3 + 12) = r2;
    r3 = *(s32 *)r14;
    *(s32 *)(r3 + 20) = r4;
    r2 = *(s32 *)r14;
    *(s32 *)(r2 + 24) = r4;
    r3 = *(s32 *)r14;
    r2 = 0;
    *(s32 *)(r3 + 44) = r2;
    r5 = r2;
    r3 = &stm_06070C70;
    *(s32 *)r3 = r2;
    r2 = r3;
    *(s32 *)(r2 + 4) = r5;
    r4 = *(s32 *)r14;
    r4 += 28;
    *(s32 *)r4 = r1;
    r0 = 0x0300;
    *(s32 *)(r4 + 4) = r0;
    *(s32 *)(r4 + 8) = r5;
    *(s32 *)(r4 + 12) = r5;
    r15 += 12;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void stm_alloc_grp(void)
{
    r4 = 0;
    r3 = &stm_mng;
    r6 = r4;
    push(r14);
    r14 = 1;
    r7 = 0x7FFFFFFF;
    push(r13);
    push(r12);
    push(r11);
    push(r10);
    r11 = -1;
    r12 = 0x0096;
    r13 = r12;
    r10 = *(s32 *)r3;
    r13 += 107;
    goto L0606871C slot(r5 = *(s32 *)r10);
    __nopool;
L060686E8:
    r0 = 58;
    r3 = *(s8 *)(r0 + r5);
    if (!r3) {
        *(s32 *)r5 = r4;
        r0 = 56;
        *(s32 *)(r5 + 4) = r4;
        *(s32 *)(r5 + 8) = r4;
        *(s32 *)(r5 + 12) = r4;
        *(s32 *)(r5 + 16) = r4;
        *(s32 *)(r5 + 20) = r12;
        *(s32 *)(r5 + 24) = r13;
        *(s32 *)(r5 + 28) = r4;
        *(s32 *)(r5 + 32) = r4;
        *(s32 *)(r5 + 36) = r4;
        *(s32 *)(r5 + 40) = r4;
        *(s32 *)(r5 + 44) = r7;
        *(s32 *)(r5 + 48) = r4;
        *(s32 *)(r5 + 52) = r11;
        *(s16 *)(r0 + r5) = r4;
        r0 = 58;
        *(s8 *)(r0 + r5) = r14;
        goto L06068724 slot(r0 = r5);
        __nopool;
    }
    r6 += 1;
    r5 += 60;
L0606871C:
    r3 = *(s32 *)(r10 + 4);
    if (!(r6 >= r3)) goto L060686E8;
    r0 = 0;
L06068724:
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void stm_alloc_stm(void)
{
    r3 = &stm_mng;
    r5 = 0;
    r6 = *(s32 *)r3;
    goto L0606874A slot(r4 = *(s32 *)(r6 + 8));
    __nopool;
L0606873A:
    r0 = 45;
    r3 = *(s8 *)(r0 + r4);
    if (!r3) {
        return slot(r0 = r4);
        __nopool;
    }
    r5 += 1;
    r4 += 48;
L0606874A:
    r3 = *(s32 *)(r6 + 12);
    if (!(r5 >= r3)) goto L0606873A;
    r0 = 0;
    return;
    __nopool;
}

void stm_get_end_fad(void)
{
    push(r14);
    push(pr);
    r15 += -8;
    r14 = *(s32 *)(r4 + 12);
    if (!r14) {
        r15 += 8;
        r0 = 0x0096;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r2 = &stm_GetFadRange;
    r6 = r15;
    r5 = r15;
    r5 += 4;
    (*r2)() slot(r4 = *(s32 *)(r14 + 20));
    r0 = *(s32 *)r15;
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
}

void stm_set_err_gfs(void)
{
    r0 = r4;
    if (r0 == -16) goto L060687CE;
    if (r0 == -15) goto L060687CA;
    if (r0 == -14) goto L060687CA;
    if (r0 == -13) goto L060687C6;
    if (r0 != -12) {
        if (r0 == -11) goto L060687D2;
        if (r0 == -10) goto L060687D2;
        if (r0 == -2) goto L060687C6;
        goto L060687D6;
    }
    goto L060687D8 slot(r4 = -22);
L060687C6:
    goto L060687D8 slot(r4 = -23);
L060687CA:
    goto L060687D8 slot(r4 = -2);
L060687CE:
    goto L060687D8 slot(r4 = -25);
L060687D2:
    goto L060687D8 slot(r4 = -1);
L060687D6:
    r4 = 0;
L060687D8:
    goto stm_set_err;
}

void stm_add_stm(void)
{
    push(r14);
    r0 = 20;
    push(r13);
    r14 = r5;
    push(r12);
    r13 = r4;
    push(r11);
    push(pr);
    r11 = &stm_GetFadRange;
    r15 += -24;
    *(s8 *)(r0 + r15) = r6;
    r5 = r15;
    r6 = r15;
    r6 += 12;
    r5 += 8;
    (*r11)() slot(r4 = *(s32 *)(r14 + 20));
    goto L0606881C slot(r12 = r13);
    __nopool;
L06068802:
    r6 = r15;
    r4 = *(s32 *)r12;
    r5 = r15;
    r6 += 4;
    (*r11)() slot(r4 = *(s32 *)(r4 + 20));
    r3 = *(s32 *)r15;
    r2 = *(s32 *)(r15 + 8);
    if (!(r2 > r3)) goto L06068822;
    r1 = *(s32 *)r12;
    r12 = r1;
    r12 += 8;
L0606881C:
    r0 = *(s32 *)r12;
    if (r0) goto L06068802;
L06068822:
    r3 = *(s32 *)r12;
    *(s32 *)(r14 + 8) = r3;
    *(s32 *)r12 = r14;
    r2 = *(s32 *)(r14 + 20);
    r0 = *(s32 *)(r2 + 28);
    if (r0) goto L060688AC;
    __bsr stm_get_end_fad() slot(r4 = r13);
    *(s32 *)(r15 + 4) = r0;
    r3 = *(s32 *)(r15 + 12);
    if (r3 > r0) slot(r11 = 0) {
        *(s32 *)(r13 + 12) = r14;
    }
    r12 = r13;
    goto L06068854 slot(r12 += 4);
L0606884C:
    r4 = *(s32 *)r12;
    r11 = r4;
    r12 = r4;
    r12 += 12;
L06068854:
    r0 = *(s32 *)r12;
    if (r0) goto L0606884C;
    r6 = 0x00FF;
    r5 = *(s32 *)(r14 + 20);
    *(s32 *)(r15 + 16) = r5;
    r5 = *(s32 *)(r5 + 32);
    r4 = *(s32 *)(r15 + 16);
    r3 = &gfcd_SetFiltCon;
    (*r3)() slot(r4 = *(s32 *)(r4 + 40));
    if (r11) {
        r6 = *(s32 *)(r14 + 20);
        r5 = *(s32 *)(r11 + 20);
        r6 = *(s32 *)(r6 + 32);
        *(s32 *)(r15 + 16) = r5;
        r5 = *(s32 *)(r5 + 32);
        r4 = *(s32 *)(r15 + 16);
        r3 = &gfcd_SetFiltCon;
        (*r3)() slot(r4 = *(s32 *)(r4 + 40));
        goto L06068894;
        __nopool;
    }
    r3 = *(s32 *)(r13 + 52);
    if (r3 < 0) goto L06068894;
    r5 = *(s32 *)(r13 + 52);
    r4 = *(s32 *)(r14 + 20);
    r3 = &gfcd_SetCdCon;
    (*r3)() slot(r4 = *(s32 *)(r4 + 40));
L06068894:
    *(s32 *)r12 = r14;
    r2 = 0;
    r3 = &gfcd_WaitServer;
    (*r3)() slot(*(s32 *)(r14 + 12) = r2);
    r4 = r0;
    if (!r4) goto L060688AC;
    __bsr stm_set_err_gfs();
    goto L060688D0 slot(r0 = 0);
    __nopool;
L060688AC:
    r4 = 1;
    r0 = 56;
    r2 = *(s16 *)(r0 + r13);
    r2 = (u16)r2;
    if ((r2 & r4) != 0) {
        if (r4) goto L060688CE;
    }
    r0 = 20;
    r0 = *(s8 *)(r0 + r15);
    r0 = (u8)r0;
    if ((r0 & 2) != 0) goto L060688CE;
    r3 = *(s32 *)r13;
    if (r14 != r3) goto L060688CE;
    *(s32 *)(r13 + 8) = r14;
L060688CE:
    r0 = 1;
L060688D0:
    r15 += 24;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void stm_key_to_mode(void)
{
    r0 = *(s16 *)r4;
    if (r0 != -1) slot(r5 = 64) {
        r5 = 65;
    }
    r0 = *(s16 *)(r4 + 2);
    if (r0 != -1) slot(r0 = *(s16 *)(r4 + 4)) {
        r2 = 2;
        r5 |= r2;
    }
    if (r0 != -1) slot(r0 = *(s16 *)(r4 + 8)) {
        r2 = 4;
        r5 |= r2;
    }
    if (r0 != -1) {
        r2 = 8;
        r5 |= r2;
    }
    return slot(r0 = r5);
    __nopool;
}

void stm_key_to_subh(void)
{
    push(pr);
    r0 = *(s8 *)(r4 + 1);
    *(s8 *)r6 = r0;
    r0 = *(s8 *)(r4 + 3);
    *(s8 *)(r6 + 1) = r0;
    r0 = *(s8 *)(r4 + 5);
    *(s8 *)(r6 + 2) = r0;
    r0 = *(s8 *)(r4 + 7);
    *(s8 *)(r6 + 3) = r0;
    r0 = *(s8 *)(r4 + 9);
    *(s8 *)(r6 + 4) = r0;
    r0 = *(s8 *)(r4 + 11);
    __bsr stm_key_to_mode() slot(*(s8 *)(r6 + 5) = r0);
    pop(pr);
    return;
}

void stm_init_stm(void)
{
    push(r14);
    r14 = r4;
    r3 = &gfsFlow_SctToFad;
    push(r13);
    push(r12);
    r13 = r5;
    push(r11);
    push(r10);
    push(r9);
    r9 = r6;
    push(pr);
    r11 = r9;
    r15 += -24;
    r11 += 12;
    *(s32 *)(r15 + 12) = r7;
    r12 = r11;
    r5 = *(s32 *)(r12 + 20);
    (*r3)() slot(r4 = r11);
    r4 = r0;
    *(s32 *)(r12 + 20) = r0;
    r10 = 0;
    r3 = &stm_GetFadRange;
    r6 = r15;
    *(s32 *)(r12 + 24) = r10;
    r0 = 59;
    *(s32 *)r14 = r13;
    r6 += 8;
    *(s32 *)(r14 + 4) = r14;
    r5 = r15;
    *(s32 *)(r14 + 16) = r9;
    r5 += 4;
    *(s32 *)(r14 + 20) = r12;
    *(s32 *)(r14 + 24) = r10;
    *(s32 *)(r14 + 28) = r10;
    r2 = *(s8 *)(r0 + r15);
    r0 = 44;
    *(s8 *)(r0 + r14) = r2;
    (*r3)() slot(r4 = r12);
    r0 = 56;
    r0 = *(s16 *)(r0 + r13);
    r0 = (u16)r0;
    if ((r0 & 2) != 0) {
        goto L0606899C slot(r0 = 1);
        __nopool;
    }
    r0 = r10;
L0606899C:
    if (r0 != 1) goto L060689B2;
    r3 = *(s32 *)(r13 + 20);
    r2 = *(s32 *)(r15 + 4);
    if (!(r2 >= r3)) goto L060689B2;
    r0 = 44;
    r3 = 1;
    r2 = *(s8 *)(r0 + r14);
    r2 |= r3;
    *(s8 *)(r0 + r14) = r2;
L060689B2:
    r1 = 1;
    r2 = 0x0096;
    r0 = 45;
    *(s8 *)(r0 + r14) = r1;
    r3 = 6;
    r0 += 115;
    *(s32 *)(r0 + r9) = r3;
    *(s32 *)(r14 + 40) = r2;
    r3 = *(s32 *)(r14 + 20);
    r1 = *(s32 *)(r3 + 28);
    if (!r1) {
        r6 = r15;
        r5 = *(s32 *)(r15 + 12);
        r6 += 16;
        r4 = *(s32 *)(r15 + 52);
        __bsr stm_key_to_subh();
        r5 = r0;
        r2 = *(s32 *)(r12 + 20);
        push(r2);
        r7 = *(s32 *)(r12 + 4);
        r6 = r15;
        r3 = &gfcd_SetFilt;
        r6 += 20;
        (*r3)() slot(r4 = *(s32 *)(r11 + 40));
        r2 = &gfcd_WaitServer;
        (*r2)() slot(r15 += 4);
        r4 = r0;
        if (r4) {
            __bsr stm_set_err_gfs();
            goto L06068A80 slot(r0 = 0);
            __nopool;
        }
        r5 = 0x7FFFFFFF;
        r2 = &gfsFlow_SetSct;
        (*r2)() slot(r4 = r11);
    }
    r0 = 59;
    r5 = r14;
    r6 = *(s8 *)(r0 + r15);
    __bsr stm_add_stm() slot(r4 = r13);
    r4 = r0;
    if (!r4) {
        goto L06068A80 slot(r0 = 0);
        __nopool;
    }
    r0 = 56;
    r4 = *(s16 *)(r0 + r13);
    r4 = (u16)r4;
    r0 = 2;
    if ((r0 & r4) != 0) {
        goto L06068A46 slot(r0 = 1);
    }
    r0 = 0;
L06068A46:
    if (r0 != 1) goto L06068A7E;
    r3 = 32;
    if ((r3 & r4) != 0) goto L06068A7E;
    r1 = *(s32 *)(r13 + 12);
    if (r1 != r14) goto L06068A7E;
    r4 = r15;
    r2 = &gfsFlow_GetCdStat;
    (*r2)() slot(r5 = 0);
    r2 = &stm_mng;
    r3 = *(s32 *)r2;
    r1 = *(s32 *)(r3 + 24);
    r3 = *(s32 *)r15;
    r1 += -10;
    if (r3 >= r1) goto L06068A7E;
    r5 = *(s32 *)(r15 + 8);
    r3 = &stm_CdPlayTo;
    (*r3)() slot(r4 = r13);
    r4 = r0;
    if (!r4) goto L06068A7E;
    __bsr stm_set_err();
L06068A7E:
    r0 = r14;
L06068A80:
    r15 += 24;
    pop(pr);
    pop(r9);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void stm_free_grp(void)
{
    r5 = 0;
    *(s32 *)r4 = r5;
    r0 = 58;
    *(s32 *)(r4 + 4) = r5;
    return slot(*(s8 *)(r0 + r4) = r5);
    __nopool;
}

void stm_remove_cd(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(pr);
    r15 += -4;
    r3 = *(s32 *)(r4 + 20);
    r0 = *(s32 *)(r3 + 28);
    if (r0) goto L06068B1C;
    r12 = *(s32 *)r4;
    r14 = 0;
    r5 = r12;
    goto L06068AC2 slot(r5 += 4);
    __nopool;
L06068ABA:
    r6 = *(s32 *)r5;
    r14 = r6;
    r5 = r6;
    r5 += 12;
L06068AC2:
    r6 = *(s32 *)r5;
    if (r6) {
        if (r6 != r4) goto L06068ABA;
    }
    r0 = *(s32 *)r5;
    if (!r0) goto L06068B1C;
    r3 = *(s32 *)(r4 + 12);
    r0 = r3;
    if (!r0) slot(*(s32 *)r5 = r3) {
        r13 = 0x00FF;
        goto L06068AE8;
        __nopool;
    }
    r13 = *(s32 *)r5;
    r13 = *(s32 *)(r13 + 20);
    r13 = *(s32 *)(r13 + 40);
L06068AE8:
    if (!r14) {
        r5 = *(s32 *)(r12 + 52);
        r3 = &gfcd_SetCdCon;
        (*r3)() slot(r4 = r13);
        goto L06068B08;
        __nopool;
    }
    r5 = *(s32 *)(r14 + 20);
    r6 = r13;
    r3 = &gfcd_SetFiltCon;
    *(s32 *)r15 = r5;
    r5 = *(s32 *)(r5 + 32);
    r4 = *(s32 *)r15;
    (*r3)() slot(r4 = *(s32 *)(r4 + 40));
L06068B08:
    r2 = &gfcd_WaitServer;
    (*r2)();
    r4 = r0;
    if (!r4) goto L06068B1C;
    __bsr stm_set_err_gfs();
    goto L06068B1E slot(r0 = 0);
    __nopool;
L06068B1C:
    r0 = 1;
L06068B1E:
    r15 += 4;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
}

void stm_free_stm(void)
{
    push(r14);
    r5 = 1;
    push(pr);
    r14 = r4;
    r0 = 45;
    r3 = *(s8 *)(r0 + r14);
    r3 = (u8)r3;
    if (r3 != r5) goto L06068B8C slot(r4 = r5);
    r2 = 0;
    r0 = 45;
    *(s8 *)(r0 + r14) = r2;
    r5 = *(s32 *)r14;
    if (!r5) goto L06068B8E;
    goto L06068B6E slot(r4 = r5);
L06068B68:
    r2 = *(s32 *)r4;
    r4 = r2;
    r4 += 8;
L06068B6E:
    r5 = *(s32 *)r4;
    if (r5) {
        if (r5 != r14) goto L06068B68;
    }
    r0 = *(s32 *)r4;
    if (r0) {
        r3 = *(s32 *)(r14 + 8);
        *(s32 *)r4 = r3;
    }
    __bsr stm_remove_cd() slot(r4 = r14);
    r4 = r0;
    r3 = 0;
    *(s32 *)r14 = r3;
L06068B8C:
    r0 = r4;
L06068B8E:
    pop(pr);
    return slot(pop(r14));
}

void stm_update_cur(void)
{
    push(r14);
    r14 = r4;
    push(r13);
    push(r12);
    push(r11);
    r12 = 0;
    r13 = 0x0096;
    push(pr);
    r11 = &stm_GetFadRange;
    r15 += -12;
    *(s32 *)(r15 + 8) = r4;
    goto L06068BCC slot(r14 = *(s32 *)(r14 + 4));
    __nopool;
L06068BAE:
    r2 = *(s32 *)(r14 + 20);
    r0 = *(s32 *)(r2 + 28);
    if (r0) goto L06068BCA;
    r6 = r15;
    r5 = r15;
    r5 += 4;
    (*r11)() slot(r4 = *(s32 *)(r14 + 20));
    r2 = *(s32 *)r15;
    if (r13 >= r2) goto L06068BCA;
    r12 = r14;
    r13 = *(s32 *)r15;
L06068BCA:
    r14 = *(s32 *)(r14 + 12);
L06068BCC:
    if (r14) goto L06068BAE;
    r3 = *(s32 *)(r15 + 8);
    *(s32 *)(r3 + 12) = r12;
    r15 += 12;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void STM_Init(void)
{
    T = !r6;
    push(pr);
    if (T) {
        pop(pr);
        return slot(r0 = 0);
        __nopool;
    }
    __bsr stm_init_mng();
    r0 = 1;
    pop(pr);
    return;
    __nopool;
}

void STM_OpenGrp(void)
{
    push(r14);
    push(pr);
    r4 = 0x0301;
    __bsr stm_set_func_id();
    __bsr stm_alloc_grp();
    r14 = r0;
    if (!r14) {
        r0 = 0;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    __bsr stm_check_gfs_err();
    r4 = r0;
    if (r4 < 0) {
        pop(pr);
        r0 = 0;
        return slot(pop(r14));
        __nopool;
    }
    r0 = r14;
    pop(pr);
    return slot(pop(r14));
}

void stm_close(void)
{
    push(r14);
    r0 = 45;
    push(r13);
    r13 = r4;
    push(r12);
    push(pr);
    r15 += -16;
    r0 = *(s8 *)(r0 + r13);
    r0 = (u8)r0;
    if (r0 != 1) goto L06068D28 slot(r14 = *(s32 *)r13);
    r2 = *(s32 *)(r14 + 8);
    if (r13 != r2) goto L06068C7A;
    goto L06068C6A slot(r4 = *(s32 *)r14);
L06068C5A:
    if (r4 != r13) {
        r0 = 44;
        r0 = *(s8 *)(r0 + r4);
        r0 = (u8)r0;
        if ((r0 & 2) == 0) goto L06068C6E;
    }
    r4 = *(s32 *)(r4 + 8);
L06068C6A:
    if (r4) goto L06068C5A;
L06068C6E:
    r0 = 56;
    r3 = 0x0000FFFE;
    *(s32 *)(r14 + 8) = r4;
    r2 = *(s16 *)(r0 + r14);
    r2 &= r3;
    *(s16 *)(r0 + r14) = r2;
L06068C7A:
    r3 = *(s32 *)(r14 + 16);
    if (r13 != r3) goto L06068CA6 slot(r12 = 0);
    r5 = -1;
    r3 = &gfsTrn_Stop;
    (*r3)() slot(r4 = *(s32 *)(r13 + 16));
    r2 = *(s32 *)(r13 + 16);
    r0 = 0x00A0;
    *(s32 *)(r0 + r2) = r12;
    r3 = *(s32 *)(r13 + 8);
    r1 = r3;
    if (!r1) slot(*(s32 *)(r14 + 16) = r3) {
        r2 = *(s32 *)r14;
        *(s32 *)(r14 + 16) = r2;
    }
    r3 = *(s32 *)(r14 + 16);
    if (r3 != r13) goto L06068CA6;
    *(s32 *)(r14 + 16) = r12;
L06068CA6:
    r4 = *(s32 *)(r13 + 20);
    r3 = *(s32 *)(r4 + 40);
    *(s32 *)(r4 + 32) = r3;
    __bsr stm_free_stm() slot(r4 = r13);
    r2 = &gfsFlow_GetFinfo;
    r3 = r15;
    r3 += 12;
    r7 = r12;
    push(r3);
    r6 = r12;
    push(r12);
    r5 = r12;
    push(r12);
    push(r12);
    (*r2)() slot(r4 = *(s32 *)(r13 + 20));
    r0 = 56;
    r0 = *(s16 *)(r0 + r14);
    r0 = (u16)r0;
    if ((r0 & 2) != 0) slot(r15 += 16) {
        goto L06068CEA slot(r0 = 1);
    }
    r0 = 0;
L06068CEA:
    if (r0 != 1) goto L06068D22;
    r0 = *(s32 *)(r15 + 12);
    if ((r0 & 64) != 0) goto L06068D22;
    r3 = &stm_GetFadRange;
    r6 = r15;
    r5 = r15;
    r5 += 8;
    (*r3)() slot(r4 = *(s32 *)(r13 + 20));
    r2 = &gfsFlow_GetCdStat;
    r4 = r15;
    r4 += 4;
    (*r2)() slot(r5 = 0);
    r3 = *(s32 *)(r15 + 8);
    r2 = *(s32 *)(r15 + 4);
    r3 += -10;
    if (r3 >= r2) goto L06068D22;
    r1 = *(s32 *)r15;
    r3 = *(s32 *)(r15 + 4);
    if (r3 > r1) goto L06068D22;
    r3 = &stm_WaitCsct;
    (*r3)();
L06068D22:
    r2 = &GFS_Close;
    (*r2)() slot(r4 = *(s32 *)(r13 + 16));
L06068D28:
    r3 = *(s32 *)(r14 + 12);
    if (r13 != r3) goto L06068D9E;
    __bsr stm_update_cur() slot(r4 = r14);
    r0 = *(s32 *)(r14 + 12);
    if (!r0) goto L06068D9E;
    r0 = 56;
    r0 = *(s16 *)(r0 + r14);
    r0 = (u16)r0;
    if ((r0 & 2) != 0) {
        goto L06068D48 slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
L06068D48:
    if (r0 != 1) goto L06068D9E;
    r4 = *(s32 *)(r14 + 12);
    r6 = r15;
    r3 = &stm_GetFadRange;
    r5 = r15;
    r5 += 8;
    (*r3)() slot(r4 = *(s32 *)(r4 + 20));
    r3 = &stm_mng;
    r1 = *(s32 *)r15;
    r2 = *(s32 *)r3;
    r2 = *(s32 *)(r2 + 20);
    r1 -= r2;
    if (r1 >= 0) {
        r5 = *(s32 *)r15;
        r2 = &stm_CdPlayTo;
        (*r2)() slot(r4 = r14);
        goto L06068D96 slot(r13 = r0);
        __nopool;
    }
    r2 = &stm_CdPause;
    (*r2)() slot(r4 = r14);
    r13 = r0;
    r3 = &STM_GrpCheckPassed;
    (*r3)() slot(r4 = r14);
    r0 = 56;
    r2 = *(s32 *)(r14 + 48);
    r2 += 1;
    *(s32 *)(r14 + 48) = r2;
    r3 = 0x0096;
    *(s32 *)(r14 + 20) = r3;
    r3 = 0x0000FFD9;
    r2 = *(s16 *)(r0 + r14);
    r2 &= r3;
    *(s16 *)(r0 + r14) = r2;
L06068D96:
    if (!r13) goto L06068D9E;
    __bsr stm_set_err() slot(r4 = r13);
L06068D9E:
    r0 = *(s32 *)(r14 + 4);
    if (r0) goto L06068E0C;
    r0 = 56;
    r0 = *(s16 *)(r0 + r14);
    r0 = (u16)r0;
    if ((r0 & 2) != 0) {
        goto L06068DDA slot(r0 = 1);
    }
    r0 = 0;
L06068DDA:
    if (r0 != 1) goto L06068E0C;
    r3 = &stm_CdPause;
    (*r3)() slot(r4 = r14);
    r4 = r0;
    if (r4) {
        __bsr stm_set_err();
        goto L06068E0C;
        __nopool;
    }
    r2 = &STM_GrpCheckPassed;
    (*r2)() slot(r4 = r14);
    r3 = *(s32 *)(r14 + 48);
    r0 = 56;
    r2 = 0x0096;
    r3 += 1;
    *(s32 *)(r14 + 48) = r3;
    *(s32 *)(r14 + 20) = r2;
    r3 = 0x0000FFD9;
    r2 = *(s16 *)(r0 + r14);
    r2 &= r3;
    *(s16 *)(r0 + r14) = r2;
L06068E0C:
    r15 += 16;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void STM_CloseGrp(void)
{
    push(r14);
    r14 = r4;
    push(r13);
    push(pr);
    r4 = 0x0302;
    __bsr stm_set_func_id();
    if (r14) goto L06068E3A;
    __bsr stm_set_err() slot(r4 = -11);
    pop(pr);
    pop(r13);
    goto stm_call_err_func slot(pop(r14));
    __nopool;
L06068E36:
    __bsr stm_close();
L06068E3A:
    r4 = *(s32 *)r14;
    if (r4) goto L06068E36;
    r3 = *(s32 *)(r14 + 52);
    if (r3 >= 0) {
        r13 = 0;
        r2 = &stm_mng;
        r3 = *(s32 *)r2;
        *(s32 *)(r3 + 16) = r13;
        r3 = &gfcd_Unlock;
        (*r3)() slot(r4 = *(s32 *)(r14 + 52));
        r3 = &gfcd_SetCallback;
        r2 = -1;
        *(s32 *)(r14 + 52) = r2;
        r5 = r13;
        (*r3)() slot(r4 = r13);
        r2 = &gfcd_WaitPause;
        (*r2)();
    }
    __bsr stm_free_grp() slot(r4 = r14);
    r3 = &stm_mng;
    r0 = *(s32 *)r3;
    r1 = *(s32 *)(r0 + 28);
    if (r1) {
        goto L06068E7A slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
L06068E7A:
    if (r0 == 1) {
        __bsr stm_call_err_func();
    }
    pop(pr);
    pop(r13);
    goto stm_check_gfs_err slot(pop(r14));
    __nopool;
}

void stm_func_nop(void)
{
    return slot(r0 = 0);
    __nopool;
}

void stm_close_all(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(r11);
    r12 = 0;
    push(r10);
    push(pr);
    r10 = &gfsTrn_SetFunc;
    r11 = &stm_mng;
    r13 = *(s32 *)r11;
    goto L06068EF4 slot(r13 = *(s32 *)r13);
    __nopool;
L06068EA6:
    r0 = 58;
    r0 = *(s8 *)(r0 + r13);
    r0 = (u8)r0;
    if (r0 != 1) goto L06068EF0;
    goto L06068EE8 slot(r14 = *(s32 *)r13);
L06068ED8:
    r0 = *(s32 *)(r14 + 24);
    if (r0) {
        r6 = r14;
        r5 = &stm_func_nop;
        (*r10)() slot(r4 = *(s32 *)(r14 + 16));
    }
    r14 = *(s32 *)(r14 + 8);
L06068EE8:
    if (r14) goto L06068ED8;
    __bsr STM_CloseGrp() slot(r4 = r13);
L06068EF0:
    r12 += 1;
    r13 += 60;
L06068EF4:
    r2 = *(s32 *)r11;
    r3 = *(s32 *)(r2 + 4);
    if (!(r12 >= r3)) goto L06068EA6;
    pop(pr);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    goto stm_check_gfs_err slot(pop(r14));
    __nopool;
}

void stm_open(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(r11);
    push(pr);
    r15 += -28;
    *(s32 *)(r15 + 16) = r4;
    *(s32 *)(r15 + 12) = r5;
    *(s32 *)(r15 + 24) = r6;
    *(s32 *)(r15 + 20) = r7;
    __bsr stm_alloc_stm();
    r13 = r0;
    if (!r13) {
        __bsr stm_set_err() slot(r4 = -19);
        __bsr stm_call_err_func();
        goto L06068FDE slot(r0 = 0);
        __nopool;
    }
    r3 = &gfs_AllocHn;
    (*r3)();
    r4 = r0;
    if (!r4) {
        __bsr stm_free_stm() slot(r4 = r13);
        __bsr stm_set_err() slot(r4 = -19);
        __bsr stm_call_err_func();
        goto L06068FDE slot(r0 = 0);
        __nopool;
    }
    r6 = *(s32 *)(r15 + 24);
    r5 = *(s32 *)(r15 + 12);
    r3 = &gfs_InitHn;
    (*r3)();
    r14 = r0;
    r0 = 51;
    r6 = r14;
    r2 = *(s8 *)(r0 + r15);
    push(r2);
    r3 = *(s32 *)(r15 + 24);
    push(r3);
    r7 = *(s32 *)(r15 + 20);
    r5 = *(s32 *)(r15 + 24);
    __bsr stm_init_stm() slot(r4 = r13);
    r12 = r0;
    if (!r12) slot(r15 += 8) {
        __bsr stm_call_err_func();
        goto L06068FDE slot(r0 = 0);
        __nopool;
    }
    r0 = 51;
    r0 = *(s8 *)(r0 + r15);
    r0 = (u8)r0;
    if ((r0 & 2) != 0) {
        r5 = 1;
        r3 = &GFS_SetGmode;
        (*r3)() slot(r4 = r14);
    }
    r2 = *(s32 *)(r13 + 20);
    r0 = *(s32 *)(r2 + 28);
    if (r0) {
        r7 = 0;
        r2 = &GFS_GetFileSize;
        r6 = r15;
        r6 += 4;
        r5 = r7;
        (*r2)() slot(r4 = r14);
        r5 = *(s32 *)(r15 + 4);
        r3 = &GFS_NwCdRead;
        (*r3)() slot(r4 = r14);
        r11 = &GFS_NwExecOne;
        r13 = &GFS_NwGetStat;
        do {
            (*r11)() slot(r4 = r14);
            r6 = r15;
            r5 = r15;
            r5 += 8;
            (*r13)() slot(r4 = r14);
            r3 = *(s32 *)(r15 + 4);
            r2 = *(s32 *)r15;
        } while (!(r2 >= r3));
    }
    r4 = 1;
    r3 = *(s32 *)(r12 + 16);
    *(s32 *)(r3 + 4) = r4;
    r2 = *(s32 *)(r12 + 16);
    *(s32 *)(r2 + 8) = r4;
    r3 = &gfsTrn_Activate;
    r4 = r14;
    (*r3)() slot(r4 += 108);
    r0 = r12;
L06068FDE:
    r15 += 28;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void stm_open_fid(void)
{
    push(pr);
    r0 = r7;
    r3 = &GFS_GetDirInfo;
    r15 += -40;
    *(s32 *)(r15 + 4) = r4;
    *(s32 *)r15 = r5;
    *(s32 *)(r15 + 12) = r6;
    r5 = r15;
    *(s8 *)(r15 + 8) = r0;
    r5 += 28;
    r4 = *(s32 *)r15;
    (*r3)();
    r4 = r0;
    if (!r4) {
        r5 = *(s32 *)(r15 + 12);
        r4 = r15;
        r3 = &memmove;
        r4 += 16;
        (*r3)() slot(r6 = 12);
        r2 = r15;
        r2 += 16;
        r3 = r15;
        r3 += 28;
        r0 = *(s8 *)(r3 + 10);
        r0 = (u8)r0;
        *(s16 *)r2 = r0;
        r0 = *(s8 *)(r15 + 8);
        r3 = r0;
        push(r3);
        r6 = *(s32 *)(r15 + 4);
        r5 = r15;
        r4 = *(s32 *)(r15 + 8);
        r7 = r15;
        r7 += 20;
        r5 += 32;
        __bsr stm_open();
        r15 += 4;
        goto L0606904C slot(r4 = r0);
        __nopool;
    }
    __bsr stm_set_err();
    __bsr stm_call_err_func();
    r4 = 0;
L0606904C:
    r15 += 40;
    pop(pr);
    return slot(r0 = r4);
}

void STM_OpenFid(void)
{
    push(pr);
    r15 += -16;
    *(s32 *)r15 = r4;
    *(s32 *)(r15 + 8) = r5;
    *(s32 *)(r15 + 12) = r6;
    *(s32 *)(r15 + 4) = r7;
    r4 = 0x0306;
    __bsr stm_set_func_id();
    r0 = *(s32 *)r15;
    if (!r0) {
        __bsr stm_set_err() slot(r4 = -11);
        __bsr stm_call_err_func();
        r15 += 16;
        pop(pr);
        return slot(r0 = 0);
        __nopool;
    }
    r1 = *(s32 *)(r15 + 4);
    if (!r1) {
        goto L060690CC slot(r7 = 4);
        __nopool;
    }
    r0 = *(s32 *)(r15 + 4);
    if (r0 == 1) {
        goto L060690CC slot(r7 = 0);
        __nopool;
    }
    __bsr stm_set_err() slot(r4 = -17);
    __bsr stm_call_err_func();
    r15 += 16;
    pop(pr);
    return slot(r0 = 0);
    __nopool;
L060690CC:
    r6 = *(s32 *)(r15 + 12);
    r5 = *(s32 *)(r15 + 8);
    r4 = *(s32 *)r15;
    __bsr stm_open_fid();
    *(s32 *)r15 = r0;
    __bsr stm_check_gfs_err();
    r4 = r0;
    if (r4 < 0) {
        r15 += 16;
        pop(pr);
        return slot(r0 = 0);
        __nopool;
    }
    r0 = *(s32 *)r15;
    r15 += 16;
    pop(pr);
    return;
    __nopool;
}

void STM_OpenFrange(void)
{
    push(r14);
    push(pr);
    r15 += -24;
    *(s32 *)r15 = r4;
    *(s32 *)(r15 + 4) = r6;
    *(s32 *)(r15 + 8) = r7;
    r4 = 0x0307;
    __bsr stm_set_func_id() slot(r14 = r5);
    r0 = *(s32 *)r15;
    if (!r0) {
        __bsr stm_set_err() slot(r4 = -11);
        __bsr stm_call_err_func();
        r0 = 0;
        r15 += 24;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r3 = 0x0096;
    r2 = *(s32 *)r14;
    if (r2 >= r3) {
        r0 = *(s32 *)(r14 + 4);
        if (r0 >= 0) goto L0606913E;
    }
    __bsr stm_set_err() slot(r4 = -14);
    __bsr stm_call_err_func();
    r0 = 0;
    r15 += 24;
    pop(pr);
    return slot(pop(r14));
    __nopool;
L0606913E:
    r3 = r15;
    r2 = *(s32 *)r14;
    r5 = 0;
    r3 += 12;
    *(s32 *)r3 = r2;
    r2 = *(s32 *)(r14 + 4);
    r3 = r15;
    r3 += 12;
    r2 <<= 8;
    r2 <<= 2;
    r2 <<= 1;
    *(s32 *)(r3 + 4) = r2;
    r3 = r15;
    r0 = *(s32 *)(r15 + 4);
    r3 += 12;
    r0 = *(s8 *)(r0 + 1);
    *(s8 *)(r3 + 10) = r0;
    r3 = r15;
    r3 += 12;
    r0 = r5;
    *(s8 *)(r3 + 11) = r0;
    r3 = r15;
    r3 += 12;
    r0 = 1;
    *(s8 *)(r3 + 8) = r0;
    r3 = r15;
    r3 += 12;
    r0 = r5;
    *(s8 *)(r3 + 9) = r0;
    r1 = *(s32 *)(r15 + 8);
    if (!r1) {
        goto L060691A4 slot(r4 = 4);
    }
    r0 = *(s32 *)(r15 + 8);
    if (r0 == 1) {
        goto L060691A4 slot(r4 = r5);
    }
    __bsr stm_set_err() slot(r4 = -17);
    __bsr stm_call_err_func();
    r0 = 0;
    r15 += 24;
    pop(pr);
    return slot(pop(r14));
L060691A4:
    push(r4);
    r5 = r15;
    r4 = *(s32 *)(r15 + 4);
    r5 += 16;
    r7 = *(s32 *)(r15 + 8);
    r6 = 0x3FFFFFFF;
    __bsr stm_open();
    r15 += 4;
    *(s32 *)r15 = r0;
    __bsr stm_check_gfs_err();
    r4 = r0;
    if (r4 < 0) {
        r0 = 0;
        r15 += 24;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r0 = *(s32 *)r15;
    r15 += 24;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void stm_set_param_sub(void)
{
    r0 = 44;
    push(r14);
    r14 = r4;
    push(pr);
    r15 += -4;
    *(s32 *)r15 = r5;
    r0 = *(s8 *)(r0 + r14);
    r0 = (u8)r0;
    if ((r0 & 2) != 0) {
        r6 = 0;
        r2 = &GFS_Seek;
        r5 = r6;
        (*r2)() slot(r4 = *(s32 *)(r14 + 16));
    }
    r3 = *(s32 *)(r14 + 16);
    r2 = 0;
    r0 = 0x00A0;
    *(s32 *)(r0 + r3) = r2;
    r3 = *(s32 *)r15;
    *(s32 *)(r14 + 40) = r3;
    r15 += 4;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void stm_set_param(void)
{
    push(pr);
    r15 += -8;
    *(s32 *)(r15 + 4) = r4;
    *(s32 *)r15 = r5;
    r4 = 0x0321;
    __bsr stm_set_func_id();
    r0 = *(s32 *)(r15 + 4);
    if (!r0) {
        goto L06069228 slot(r4 = -11);
        __nopool;
    }
    r3 = *(s32 *)r15;
    if (r3 >= 0) goto L06069232;
    r4 = -14;
L06069228:
    __bsr stm_set_err();
    r15 += 8;
    goto stm_call_err_func slot(pop(pr));
    __nopool;
L06069232:
    r4 = *(s32 *)(r15 + 4);
    r5 = *(s32 *)r15;
    __bsr stm_set_param_sub() slot(r4 = *(s32 *)(r4 + 4));
    r15 += 8;
    goto stm_check_gfs_err slot(pop(pr));
    __nopool;
    __data {
        u8 0x7F, 0x08, 0x4F, 0x26, 0x00, 0x0B, 0x00, 0x09;
    }
}

void STM_OpenResp(void)
{
    push(r14);
    push(pr);
    r15 += -16;
    *(s32 *)(r15 + 4) = r4;
    *(s32 *)(r15 + 8) = r5;
    *(s32 *)(r15 + 12) = r6;
    *(s32 *)r15 = r7;
    r4 = 0x0308;
    __bsr stm_set_func_id();
    r0 = *(s32 *)(r15 + 4);
    if (!r0) {
        __bsr stm_set_err() slot(r4 = -11);
        __bsr stm_call_err_func();
        r0 = 0;
        r15 += 16;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r3 = *(s32 *)r15;
    if (r3 < 0) {
        __bsr stm_set_err() slot(r4 = -14);
        __bsr stm_call_err_func();
        r0 = 0;
        r15 += 16;
        pop(pr);
        return slot(pop(r14));
    }
    r6 = *(s32 *)(r15 + 12);
    r5 = *(s32 *)(r15 + 8);
    r4 = *(s32 *)(r15 + 4);
    __bsr stm_open_fid() slot(r7 = 6);
    r14 = r0;
    if (!r14) {
        r0 = 0;
        r15 += 16;
        pop(pr);
        return slot(pop(r14));
    }
    r5 = *(s32 *)r15;
    __bsr stm_set_param_sub() slot(r4 = r14);
    __bsr stm_check_gfs_err();
    r4 = r0;
    if (r4 < 0) {
        r0 = 0;
        r15 += 16;
        pop(pr);
        return slot(pop(r14));
    }
    r0 = r14;
    r15 += 16;
    pop(pr);
    return slot(pop(r14));
}

void STM_Close(void)
{
    push(pr);
    r15 += -4;
    *(s32 *)r15 = r4;
    r4 = 0x0309;
    __bsr stm_set_func_id();
    r0 = *(s32 *)r15;
    if (!r0) {
        __bsr stm_set_err() slot(r4 = -11);
        __bsr stm_call_err_func();
    }
    r4 = *(s32 *)r15;
    __bsr stm_close() slot(r4 = *(s32 *)(r4 + 4));
    r3 = &stm_mng;
    r0 = *(s32 *)r3;
    r1 = *(s32 *)(r0 + 28);
    if (r1) {
        goto L0606930A slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
L0606930A:
    if (r0 == 1) {
        __bsr stm_call_err_func();
    }
    r15 += 4;
    goto stm_check_gfs_err slot(pop(pr));
    __nopool;
}

void STM_SetKey(void)
{
    push(r14);
    push(r13);
    push(pr);
    r15 += -12;
    *(s32 *)r15 = r4;
    r4 = 0x0310;
    __bsr stm_set_func_id() slot(r14 = r5);
    r0 = *(s32 *)r15;
    if (!r0) {
        __bsr stm_set_err() slot(r4 = -11);
        __bsr stm_call_err_func();
        goto L060693B0;
    }
    r13 = *(s32 *)r15;
    r13 = *(s32 *)(r13 + 4);
    r3 = *(s32 *)(r13 + 20);
    r0 = *(s32 *)(r3 + 28);
    if (r0) goto L060693B0;
    r0 = *(s8 *)(r14 + 1);
    r3 = r15;
    r1 = r15;
    r1 += 4;
    *(s8 *)r1 = r0;
    r3 += 4;
    r0 = *(s8 *)(r14 + 3);
    *(s8 *)(r3 + 1) = r0;
    r0 = *(s8 *)(r14 + 5);
    r3 = r15;
    r3 += 4;
    *(s8 *)(r3 + 2) = r0;
    r0 = *(s8 *)(r14 + 7);
    r3 = r15;
    r3 += 4;
    *(s8 *)(r3 + 3) = r0;
    r0 = *(s8 *)(r14 + 9);
    r3 = r15;
    r3 += 4;
    *(s8 *)(r3 + 4) = r0;
    r0 = *(s8 *)(r14 + 11);
    r3 = r15;
    r3 += 4;
    *(s8 *)(r3 + 5) = r0;
    __bsr stm_key_to_mode() slot(r4 = r14);
    r14 = *(s32 *)(r13 + 20);
    r5 = r0;
    *(s32 *)r15 = r14;
    r3 = *(s32 *)(r14 + 20);
    push(r3);
    r6 = r15;
    r4 = *(s32 *)(r15 + 4);
    r6 += 8;
    r3 = &gfcd_SetFilt;
    r7 = *(s32 *)(r14 + 4);
    (*r3)() slot(r4 = *(s32 *)(r4 + 40));
    r2 = &gfcd_WaitServer;
    (*r2)() slot(r15 += 4);
    r4 = r0;
    if (!r4) goto L060693B0;
    __bsr stm_set_err_gfs();
    __bsr stm_call_err_func();
L060693B0:
    r15 += 12;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void stm_set_func_id(void)
{
    r2 = &stm_mng;
    r3 = *(s32 *)r2;
    return slot(*(s32 *)(r3 + 32) = r4);
    __nopool;
}

void stm_set_err(void)
{
    r3 = &stm_mng;
    r5 = *(s32 *)r3;
    r0 = *(s32 *)(r5 + 28);
    if (!r0) {
        *(s32 *)(r5 + 28) = r4;
        return slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
    return;
    __nopool;
}

void stm_check_gfs_err(void)
{
    push(r14);
    push(pr);
    r3 = &gfcd_err;
    r0 = *(s32 *)r3;
    if (r0 != -16) {
        if (r0 != -14) {
            if (r0 != -13) {
                if (r0 != 0) {
                    goto L06069408;
                    __nopool;
                }
                pop(pr);
                r0 = 0;
                return slot(pop(r14));
                __nopool;
            }
            goto L06069410 slot(r14 = -23);
            __nopool;
        }
        goto L06069410 slot(r14 = -2);
        __nopool;
    }
    goto L06069410 slot(r14 = -25);
    __nopool;
L06069408:
    pop(pr);
    r0 = 0;
    return slot(pop(r14));
    __nopool;
L06069410:
    __bsr stm_set_err() slot(r4 = r14);
    if (r0 == 1) slot(r4 = r0) {
        __bsr stm_call_err_func();
        r0 = r14;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r0 = 0;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void stm_call_err_func(void)
{
    push(r14);
    push(pr);
    r3 = &stm_mng;
    r4 = *(s32 *)r3;
    r14 = r4;
    r14 += 28;
    r0 = *(s32 *)(r14 + 8);
    if (!r0) goto L06069458;
    r1 = *(s32 *)(r4 + 28);
    if (r1) {
        goto L0606944C slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
L0606944C:
    if (r0 != 1) goto L06069458;
    r3 = *(s32 *)(r14 + 8);
    r5 = *(s32 *)r14;
    (*r3)() slot(r4 = *(s32 *)(r14 + 12));
L06069458:
    r2 = 0;
    *(s32 *)r14 = r2;
    pop(pr);
    return slot(pop(r14));
}

