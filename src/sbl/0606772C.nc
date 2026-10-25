/* sbl/0606772C: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is 0606772C.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.0606772C");

void stm_get_num_stm(void)
{
    push(r14);
    push(pr);
    r3 = &stm_set_func_id;
    r15 += -4;
    *(s32 *)r15 = r4;
    r4 = 0x0303;
    (*r3)() slot(r14 = 0);
    r0 = *(s32 *)r15;
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        (*r2)();
        r0 = -11;
        r15 += 4;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r4 = *(s32 *)r15;
    goto L06067762 slot(r4 = *(s32 *)r4);
    __nopool;
L0606775E:
    r14 += 1;
    r4 = *(s32 *)(r4 + 8);
L06067762:
    if (r4) goto L0606775E;
    r3 = &stm_check_gfs_err;
    (*r3)();
    r4 = r0;
    if (r4 < 0) {
        r0 = r4;
        r15 += 4;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r0 = r14;
    r15 += 4;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void stm_get_stm(void)
{
    push(r14);
    push(r13);
    push(pr);
    r3 = &stm_set_func_id;
    r15 += -4;
    *(s32 *)r15 = r4;
    r4 = 0x0304;
    (*r3)() slot(r13 = r5);
    r0 = *(s32 *)r15;
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        (*r2)();
        goto L060677E8 slot(r0 = 0);
        __nopool;
    }
    if (r13 < 0) {
        r2 = &stm_set_err;
        (*r2)() slot(r4 = -14);
        r3 = &stm_call_err_func;
        (*r3)();
        goto L060677E8 slot(r0 = 0);
        __nopool;
    }
    r4 = 0;
    r14 = *(s32 *)r15;
    goto L060677CE slot(r14 = *(s32 *)r14);
    __nopool;
L060677CA:
    r4 += 1;
    r14 = *(s32 *)(r14 + 8);
L060677CE:
    if (!(r4 >= r13)) {
        if (r14) goto L060677CA;
    }
    r3 = &stm_check_gfs_err;
    (*r3)();
    r4 = r0;
    if (r4 < 0) {
        goto L060677E8 slot(r0 = 0);
        __nopool;
    }
    r0 = r14;
L060677E8:
    r15 += 4;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void stm_set_link(void)
{
    push(r14);
    push(r13);
    r14 = r4;
    r3 = &stm_set_func_id;
    push(pr);
    r4 = 0x0305;
    r15 += -8;
    *(s32 *)r15 = r6;
    *(s32 *)(r15 + 4) = r7;
    (*r3)() slot(r13 = r5);
    if (!r14) {
        goto L06067830 slot(r4 = -11);
    }
    r3 = *(s32 *)r15;
    if (r3 >= 0) goto L06067842;
    r4 = -14;
L06067830:
    r3 = &stm_set_err;
    (*r3)();
    r15 += 8;
    r2 = &stm_call_err_func;
    pop(pr);
    pop(r13);
    return (*r2)() slot(pop(r14));
    __nopool;
L06067842:
    if (r13) {
        r13 = *(s32 *)(r13 + 4);
    }
    *(s32 *)(r14 + 28) = r13;
    r3 = *(s32 *)r15;
    *(s32 *)(r14 + 32) = r3;
    r2 = *(s32 *)(r15 + 4);
    *(s32 *)(r14 + 36) = r2;
    r3 = *(s32 *)(r15 + 20);
    r2 = &stm_check_gfs_err;
    *(s32 *)(r14 + 40) = r3;
    r15 += 8;
    pop(pr);
    pop(r13);
    return (*r2)() slot(pop(r14));
    __nopool;
    __data {
        u8 0x7F, 0x08, 0x4F, 0x26, 0x6D, 0xF6, 0x00, 0x0B, 0x6E, 0xF6;
    }
}

void stm_get_info(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(r11);
    push(r10);
    push(pr);
    r3 = &stm_set_func_id;
    r15 += -28;
    *(s32 *)(r15 + 12) = r4;
    *(s32 *)(r15 + 8) = r6;
    *(s32 *)(r15 + 4) = r7;
    r14 = *(s32 *)(r15 + 52);
    r4 = 0x0311;
    (*r3)() slot(r11 = r5);
    r0 = *(s32 *)(r15 + 12);
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        (*r2)();
        goto L06067980 slot(r0 = 0);
        __nopool;
    }
    r12 = *(s32 *)(r15 + 12);
    r10 = 0;
    r3 = &gfsFlow_GetFinfo;
    r5 = r11;
    r12 = *(s32 *)(r12 + 4);
    push(r10);
    push(r10);
    push(r10);
    r2 = *(s32 *)(r15 + 20);
    r2 += 4;
    push(r2);
    r7 = r15;
    r6 = *(s32 *)(r15 + 24);
    r7 += 32;
    (*r3)() slot(r4 = *(s32 *)(r12 + 20));
    r2 = 0x3FFFFFFF;
    r15 += 16;
    r3 = *(s32 *)r11;
    if (r3 == r2) slot(r13 = -1) {
        *(s32 *)r11 = r13;
    }
    r3 = *(s32 *)(r12 + 20);
    r0 = *(s32 *)(r3 + 28);
    if (!r0) {
        r6 = r15;
        r1 = *(s32 *)(r15 + 4);
        r5 = r15;
        r3 = *(s32 *)(r12 + 20);
        r6 += 20;
        r2 = *(s32 *)(r3 + 32);
        *(s32 *)r1 = r2;
        r4 = *(s32 *)(r12 + 20);
        r3 = &gfcd_GetFilt;
        (*r3)() slot(r4 = *(s32 *)(r4 + 40));
        r2 = r15;
        r2 += 20;
        r3 = *(s8 *)r2;
        r0 = r15;
        r3 = (u8)r3;
        r0 += 20;
        *(s16 *)r14 = r3;
        r0 = *(s8 *)(r0 + 1);
        r0 = (u8)r0;
        *(s16 *)(r14 + 2) = r0;
        r0 = r15;
        r0 += 20;
        r0 = *(s8 *)(r0 + 2);
        r0 = (u8)r0;
        *(s16 *)(r14 + 4) = r0;
        r0 = r15;
        r0 += 20;
        r0 = *(s8 *)(r0 + 3);
        r0 = (u8)r0;
        *(s16 *)(r14 + 6) = r0;
        r0 = r15;
        r0 += 20;
        r0 = *(s8 *)(r0 + 4);
        r0 = (u8)r0;
        *(s16 *)(r14 + 8) = r0;
        r0 = r15;
        r0 += 20;
        r0 = *(s8 *)(r0 + 5);
        r0 = (u8)r0;
        goto L0606794E slot(*(s16 *)(r14 + 10) = r0);
    }
    *(s32 *)r15 = r10;
    r3 = *(s32 *)(r15 + 4);
    *(s32 *)r3 = r13;
L0606794E:
    r0 = *(s32 *)r15;
    if ((r0 & 1) == 0) {
        *(s16 *)r14 = r13;
    }
    r0 = *(s32 *)r15;
    if ((r0 & 2) == 0) {
        r0 = r13;
        *(s16 *)(r14 + 2) = r0;
    }
    r0 = *(s32 *)r15;
    if ((r0 & 4) == 0) {
        r0 = r13;
        *(s16 *)(r14 + 6) = r0;
        *(s16 *)(r14 + 4) = r0;
    }
    r0 = *(s32 *)r15;
    if ((r0 & 8) == 0) {
        r0 = r13;
        *(s16 *)(r14 + 10) = r0;
        *(s16 *)(r14 + 8) = r0;
    }
    r3 = &stm_check_gfs_err;
    (*r3)();
    r0 = *(s32 *)r12;
L06067980:
    r15 += 28;
    pop(pr);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void stm_connect_filt(void)
{
    push(r14);
    push(r13);
    push(pr);
    r15 += -8;
    r3 = &stm_set_func_id;
    *(s32 *)(r15 + 4) = r4;
    *(s32 *)r15 = r5;
    r4 = 0x0337;
    (*r3)();
    r0 = *(s32 *)(r15 + 4);
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        r15 += 8;
        pop(pr);
        pop(r13);
        return (*r2)() slot(pop(r14));
        __nopool;
    }
    r13 = *(s32 *)(r15 + 4);
    r1 = *(s32 *)r15;
    if (!r1) slot(r13 = *(s32 *)(r13 + 4)) {
        r14 = 0x00FF;
        goto L060679D4;
        __nopool;
    }
    r5 = *(s32 *)r15;
    r5 = *(s32 *)(r5 + 4);
    r14 = *(s32 *)(r5 + 20);
    r14 = *(s32 *)(r14 + 32);
L060679D4:
    r3 = *(s32 *)(r13 + 20);
    r6 = -2;
    *(s32 *)(r3 + 32) = r14;
    r5 = r14;
    r4 = *(s32 *)(r13 + 20);
    r3 = &gfcd_SetFiltCon;
    (*r3)() slot(r4 = *(s32 *)(r4 + 40));
    r2 = &gfcd_WaitServer;
    (*r2)();
    r4 = r0;
    if (r4) {
        r3 = &stm_set_err_gfs;
        (*r3)();
        r15 += 8;
        r2 = &stm_call_err_func;
        pop(pr);
        pop(r13);
        return (*r2)() slot(pop(r14));
        __nopool;
    }
    r15 += 8;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void stm_move_sct(void)
{
    push(r14);
    push(r13);
    push(pr);
    r15 += -16;
    r3 = &stm_set_func_id;
    *(s32 *)r15 = r4;
    *(s32 *)(r15 + 8) = r5;
    *(s32 *)(r15 + 12) = r6;
    *(s32 *)(r15 + 4) = r7;
    r4 = 0x0338;
    (*r3)();
    r13 = &stm_call_err_func;
    r0 = *(s32 *)r15;
    if (r0) {
        r1 = *(s32 *)(r15 + 4);
        if (r1) goto L06067A60;
    }
    r3 = &stm_set_err;
    (*r3)() slot(r4 = -11);
    goto L06067A72;
L06067A60:
    r2 = *(s32 *)(r15 + 8);
    if (r2 >= 0) {
        r1 = *(s32 *)(r15 + 12);
        if (r1 >= 0) goto L06067A7A;
    }
    r2 = &stm_set_err;
    (*r2)() slot(r4 = -14);
L06067A72:
    (*r13)();
    goto L06067AB4;
    __nopool;
L06067A7A:
    r3 = *(s32 *)r15;
    r2 = *(s32 *)(r3 + 4);
    *(s32 *)r15 = r2;
    r14 = *(s32 *)(r15 + 4);
    r5 = r2;
    r3 = &gfcd_MoveSct;
    r14 = *(s32 *)(r14 + 4);
    r7 = *(s32 *)(r15 + 12);
    r6 = *(s32 *)(r15 + 8);
    r5 = *(s32 *)(r5 + 20);
    r5 = *(s32 *)(r5 + 32);
    r4 = *(s32 *)(r14 + 20);
    (*r3)() slot(r4 = *(s32 *)(r4 + 32));
    r0 = 44;
    r3 = 0x00DF;
    r2 = *(s8 *)(r0 + r14);
    r1 = &gfcd_WaitServer;
    r2 &= r3;
    (*r1)() slot(*(s8 *)(r0 + r14) = r2);
    r4 = r0;
    if (!r4) goto L06067AB4;
    r3 = &stm_set_err_gfs;
    (*r3)();
    (*r13)();
L06067AB4:
    r15 += 16;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void stm_delete_sct(void)
{
    push(r14);
    push(r13);
    push(pr);
    r3 = &stm_set_func_id;
    r15 += -12;
    *(s32 *)(r15 + 8) = r4;
    *(s32 *)r15 = r5;
    *(s32 *)(r15 + 4) = r6;
    r4 = 0x0339;
    (*r3)();
    r13 = &stm_call_err_func;
    r0 = *(s32 *)(r15 + 8);
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        goto L06067AF8;
        __nopool;
    }
    r2 = *(s32 *)r15;
    if (r2 >= 0) {
        r1 = *(s32 *)(r15 + 4);
        if (r1 >= 0) goto L06067B00;
    }
    r2 = &stm_set_err;
    (*r2)() slot(r4 = -14);
L06067AF8:
    (*r13)();
    goto L06067B56;
    __nopool;
L06067B00:
    r14 = *(s32 *)(r15 + 8);
    r5 = 0;
    r3 = &gfsTrn_Stop;
    r14 = *(s32 *)(r14 + 4);
    (*r3)() slot(r4 = *(s32 *)(r14 + 16));
    r2 = *(s32 *)(r14 + 16);
    r3 = 0;
    r0 = 0x00A0;
    *(s32 *)(r0 + r2) = r3;
    r2 = *(s32 *)(r14 + 20);
    r1 = *(s32 *)(r2 + 28);
    if (!r1) {
        r6 = *(s32 *)(r15 + 4);
        r5 = *(s32 *)r15;
        r3 = &stm_DelSctData;
        (*r3)() slot(r4 = *(s32 *)(r14 + 20));
        r2 = &gfcd_WaitServer;
        (*r2)();
        r4 = r0;
        if (!r4) goto L06067B56;
        r3 = &stm_set_err_gfs;
        (*r3)();
        (*r13)();
        goto L06067B56;
        __nopool;
    }
    r3 = &GFS_Seek;
    r6 = 0;
    r5 = r6;
    (*r3)() slot(r4 = *(s32 *)(r14 + 16));
    r15 += 12;
    r2 = &stm_check_gfs_err;
    pop(pr);
    pop(r13);
    return (*r2)() slot(pop(r14));
    __nopool;
L06067B56:
    r15 += 12;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
}

void stm_get_data_size(void)
{
    push(pr);
    r15 += -12;
    r3 = &stm_set_func_id;
    *(s32 *)r15 = r4;
    *(s32 *)(r15 + 8) = r5;
    r4 = 0x0312;
    (*r3)();
    r0 = *(s32 *)r15;
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        (*r2)();
        r15 += 12;
        pop(pr);
        return slot(r0 = -11);
        __nopool;
    }
    r3 = *(s32 *)(r15 + 8);
    if (r3 < 0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -14);
        r2 = &stm_call_err_func;
        (*r2)();
        r15 += 12;
        pop(pr);
        return slot(r0 = -14);
        __nopool;
    }
    r3 = *(s32 *)r15;
    r6 = r15;
    r2 = *(s32 *)(r3 + 4);
    r6 += 4;
    *(s32 *)r15 = r2;
    r4 = r2;
    r3 = &gfsAcc_CountSct;
    r5 = *(s32 *)(r15 + 8);
    (*r3)() slot(r4 = *(s32 *)(r4 + 16));
    r2 = &stm_check_gfs_err;
    (*r2)();
    r4 = r0;
    if (r4 < 0) {
        r15 += 12;
        pop(pr);
        return slot(r0 = r4);
        __nopool;
    }
    r0 = *(s32 *)(r15 + 4);
    r0 = (u32)r0 >> 1;
    r15 += 12;
    pop(pr);
    return;
    __nopool;
}

void stm_get_num_sct(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(r11);
    push(r10);
    r11 = 0;
    r3 = &stm_set_func_id;
    push(r9);
    push(pr);
    r15 += -8;
    *(s32 *)(r15 + 4) = r4;
    *(s32 *)r15 = r11;
    r4 = 0x0313;
    (*r3)() slot(r13 = r5);
    r0 = *(s32 *)(r15 + 4);
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        (*r2)();
        goto L06067CF8 slot(r0 = -11);
        __nopool;
    }
    if (r13 < 0) {
        r2 = &stm_set_err;
        (*r2)() slot(r4 = -14);
        r3 = &stm_call_err_func;
        (*r3)();
        goto L06067CF8 slot(r0 = -14);
        __nopool;
    }
    r12 = *(s32 *)(r15 + 4);
    if (!r13) slot(r12 = *(s32 *)(r12 + 4)) {
        goto L06067CF8 slot(r0 = 0);
        __nopool;
    }
    r3 = *(s32 *)(r12 + 20);
    r0 = *(s32 *)(r3 + 28);
    if (r0) {
        r11 = &gfsAcc_CountSct;
        goto L06067CC2 slot(r14 = 1);
        __nopool;
    }
    r6 = 0;
    r5 = 0x7FFFFFFF;
    r3 = &gfcf_GetNumSct;
    (*r3)() slot(r4 = *(s32 *)(r12 + 20));
    r9 = &stm_GetSctData;
    r10 = r0;
    if (r11 >= r10) goto L06067CE6 slot(r14 = r11);
L06067C7E:
    r5 = r14;
    (*r9)() slot(r4 = *(s32 *)(r12 + 20));
    r3 = *(s32 *)r15;
    r3 += r0;
    *(s32 *)r15 = r3;
    if (r3 >= r13) {
        goto L06067CE6 slot(r14 += 1);
    }
    r14 += 1;
    if (!(r14 >= r10)) goto L06067C7E;
    goto L06067CE6;
L06067CC2:
    r6 = r15;
    r5 = r14;
    (*r11)() slot(r4 = *(s32 *)(r12 + 16));
    r4 = r0;
    r1 = *(s32 *)r15;
    r2 = &_divlu;
    (*r2)() slot(r0 = 2);
    *(s32 *)r15 = r0;
    if (r0 >= r13) goto L06067CE6;
    if (r14 > r4) {
        goto L06067CE6 slot(r14 += -1);
        __nopool;
    }
    goto L06067CC2 slot(r14 += 1);
    __nopool;
L06067CE6:
    r2 = &stm_check_gfs_err;
    (*r2)();
    r4 = r0;
    if (r4 < 0) {
        goto L06067CF8 slot(r0 = r4);
        __nopool;
    }
    r0 = r14;
L06067CF8:
    r15 += 8;
    pop(pr);
    pop(r9);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void stm_set_alternative(void)
{
    push(r14);
    push(pr);
    r15 += -4;
    r3 = &stm_set_func_id;
    *(s32 *)r15 = r4;
    r4 = 0x0314;
    (*r3)() slot(r14 = r5);
    r0 = *(s32 *)r15;
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        (*r2)();
        r0 = 0;
        r15 += 4;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r0 = 45;
    r3 = *(s8 *)(r0 + r14);
    if (!r3) {
        r0 = 0;
        r15 += 4;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r3 = &stm_mng;
    r5 = 0;
    r6 = *(s32 *)r3;
    goto L06067D74 slot(r4 = *(s32 *)(r6 + 8));
    __nopool;
L06067D52:
    r0 = 45;
    r0 = *(s8 *)(r0 + r4);
    r0 = (u8)r0;
    if (r0 != 1) goto L06067D70;
    if (r4 == r14) goto L06067D70;
    r3 = *(s32 *)(r4 + 4);
    if (r3 != r14) goto L06067D70;
    r0 = 0;
    r15 += 4;
    pop(pr);
    return slot(pop(r14));
    __nopool;
L06067D70:
    r5 += 1;
    r4 += 48;
L06067D74:
    r3 = *(s32 *)(r6 + 12);
    if (!(r5 >= r3)) goto L06067D52;
    r1 = *(s32 *)r15;
    r3 = &stm_check_gfs_err;
    (*r3)() slot(*(s32 *)(r1 + 4) = r14);
    r0 = 1;
    r15 += 4;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void stm_reset_alternative(void)
{
    push(r14);
    r14 = r4;
    r3 = &stm_set_func_id;
    push(pr);
    r4 = 0x0315;
    (*r3)();
    if (!r14) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        pop(pr);
        r2 = &stm_call_err_func;
        return (*r2)() slot(pop(r14));
        __nopool;
    }
    *(s32 *)(r14 + 4) = r14;
    pop(pr);
    r3 = &stm_check_gfs_err;
    return (*r3)() slot(pop(r14));
}

void stm_set_trn_mode(void)
{
    push(r14);
    push(pr);
    r3 = &stm_set_func_id;
    r15 += -8;
    *(s32 *)r15 = r4;
    *(s32 *)(r15 + 4) = r5;
    r4 = 0x0319;
    (*r3)();
    r0 = *(s32 *)r15;
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r15 += 8;
        r2 = &stm_call_err_func;
        pop(pr);
        return (*r2)() slot(pop(r14));
        __nopool;
    }
    r14 = *(s32 *)r15;
    r3 = 0x0300;
    r2 = *(s32 *)(r15 + 4);
    if (r2 == r3) slot(r14 = *(s32 *)(r14 + 4)) {
        r4 = *(s32 *)(r14 + 16);
        r2 = &gfsTrn_Activate;
        (*r2)() slot(r4 += 108);
        goto L06067E1C;
        __nopool;
    }
    r4 = *(s32 *)(r14 + 16);
    r2 = &gfsTrn_Deactivate;
    (*r2)() slot(r4 += 108);
L06067E1C:
    r3 = &stm_check_gfs_err;
    r15 += 8;
    pop(pr);
    return (*r3)() slot(pop(r14));
    __nopool;
}

void stm_set_trn_size(void)
{
    push(pr);
    r3 = &stm_set_func_id;
    r15 += -8;
    *(s32 *)r15 = r4;
    *(s32 *)(r15 + 4) = r5;
    r4 = 0x0320;
    (*r3)();
    r0 = *(s32 *)r15;
    if (!r0) {
        goto L06067E48 slot(r4 = -11);
        __nopool;
    }
    r3 = *(s32 *)(r15 + 4);
    if (r3 >= 0) goto L06067E56;
    r4 = -14;
L06067E48:
    r3 = &stm_set_err;
    (*r3)();
    r15 += 8;
    r2 = &stm_call_err_func;
    return (*r2)() slot(pop(pr));
    __nopool;
L06067E56:
    r3 = *(s32 *)r15;
    r2 = *(s32 *)(r3 + 4);
    *(s32 *)r15 = r2;
    r5 = *(s32 *)(r15 + 4);
    r4 = r2;
    r3 = &gfsTrn_SetTsize;
    r4 = *(s32 *)(r4 + 16);
    (*r3)() slot(r4 += 108);
    r2 = &stm_check_gfs_err;
    r15 += 8;
    return (*r2)() slot(pop(pr));
    __nopool;
    __data {
        u8 0x7F, 0x08, 0x4F, 0x26, 0x00, 0x0B, 0x00, 0x09;
    }
}

void stm_set_trn_type(void)
{
    push(r14);
    push(pr);
    r3 = &stm_set_func_id;
    r15 += -4;
    *(s32 *)r15 = r4;
    r4 = 0x0322;
    (*r3)() slot(r14 = r5);
    r0 = *(s32 *)r15;
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        r15 += 4;
        pop(pr);
        return (*r2)() slot(pop(r14));
        __nopool;
    }
    if (!r14) goto L06067EC4;
    r0 = r14;
    if (r0 == 1) goto L06067EC4;
    r0 = r14;
    if (r0 == 2) goto L06067EC4;
    r0 = r14;
    if (r0 == 3) goto L06067EC4;
    r2 = &stm_set_err;
    (*r2)() slot(r4 = -17);
    r15 += 4;
    r3 = &stm_call_err_func;
    pop(pr);
    return (*r3)() slot(pop(r14));
    __nopool;
L06067EC4:
    r2 = *(s32 *)r15;
    r5 = r14;
    r3 = *(s32 *)(r2 + 4);
    *(s32 *)r15 = r3;
    r4 = r3;
    r4 = *(s32 *)(r4 + 16);
    r3 = &gfsTrn_SetMode;
    (*r3)() slot(r4 += 108);
    r15 += 4;
    r2 = &stm_check_gfs_err;
    pop(pr);
    return (*r2)() slot(pop(r14));
}

void stm_get_sct_info(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(r11);
    push(r10);
    r11 = r5;
    r3 = &stm_set_func_id;
    push(pr);
    r15 += -4;
    *(s32 *)r15 = r4;
    r4 = 0x0325;
    (*r3)() slot(r14 = r6);
    r0 = *(s32 *)r15;
    if (!r0) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        (*r2)();
        goto L06067F8E slot(r0 = 0);
        __nopool;
    }
    if (r11 < 0) {
        r2 = &stm_set_err;
        (*r2)() slot(r4 = -14);
        r3 = &stm_call_err_func;
        (*r3)();
        goto L06067F8E slot(r0 = 0);
        __nopool;
    }
    r12 = *(s32 *)r15;
    r12 = *(s32 *)(r12 + 4);
    r3 = *(s32 *)(r12 + 20);
    r0 = *(s32 *)(r3 + 28);
    if (!r0) {
        r3 = &stm_GetSctInfo;
        r6 = r14;
        r5 = r11;
        (*r3)() slot(r4 = *(s32 *)(r12 + 20));
        goto L06067F86 slot(r10 = r0);
        __nopool;
    }
    r13 = 0;
    r3 = &STM_GetNumSct;
    (*r3)() slot(r4 = r12);
    if (!(r11 >= r0)) {
        r0 = r13;
        r3 = 0x7FFFFFFF;
        *(s32 *)r14 = r3;
        *(s32 *)(r14 + 4) = r13;
        *(s32 *)(r14 + 8) = r13;
        *(s8 *)(r14 + 12) = r0;
        *(s8 *)(r14 + 13) = r0;
        goto L06067F86 slot(r10 = 1);
        __nopool;
    }
    r10 = r13;
L06067F86:
    r2 = &stm_check_gfs_err;
    (*r2)();
    r0 = r10;
L06067F8E:
    r15 += 4;
    pop(pr);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void stm_get_loop_cnt(void)
{
    push(pr);
    r3 = &stm_set_func_id;
    r15 += -4;
    *(s32 *)r15 = r4;
    r4 = 0x0333;
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
    r0 = *(s32 *)(r0 + 48);
    r15 += 4;
    pop(pr);
    return;
    __nopool;
}

void stm_get_exec_stat(void)
{
    push(r14);
    push(pr);
    r14 = r4;
    r3 = &stm_set_func_id;
    r15 += -8;
    r4 = 0x0334;
    *(s32 *)(r15 + 4) = r5;
    (*r3)();
    if (!r14) {
        r3 = &stm_set_err;
        (*r3)() slot(r4 = -11);
        r2 = &stm_call_err_func;
        (*r2)();
        r0 = -11;
        r15 += 8;
        pop(pr);
        return slot(pop(r14));
    }
    r2 = &stm_mng;
    r3 = *(s32 *)r2;
    r1 = *(s32 *)(r3 + 16);
    if (r1 != r14) goto L06068076;
    r0 = 56;
    r4 = *(s16 *)(r0 + r14);
    r0 = 2;
    r4 = (u16)r4;
    if ((r0 & r4) != 0) {
        goto L06068050 slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
L06068050:
    if (r0 != 1) goto L06068076;
    r0 = 4;
    if ((r0 & r4) != 0) {
        goto L06068060 slot(r0 = 1);
        __nopool;
    }
    r0 = 0;
L06068060:
    if (r0 != 1) goto L06068076;
    r3 = &gfsFlow_GetCdStat;
    r4 = r15;
    (*r3)() slot(r5 = 0);
    r2 = *(s32 *)r15;
    if (r2 < 0) goto L06068076;
    r1 = *(s32 *)r15;
    *(s32 *)(r14 + 20) = r1;
L06068076:
    r3 = *(s32 *)(r15 + 4);
    r2 = *(s32 *)(r14 + 20);
    *(s32 *)r3 = r2;
    r3 = &stm_check_gfs_err;
    (*r3)();
    r4 = r0;
    if (r4 < 0) {
        r0 = r4;
        r15 += 8;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r0 = *(s32 *)(r14 + 24);
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void STM_SetErrFunc(void)
{
    r6 = &stm_mng;
    r2 = 0;
    r3 = *(s32 *)r6;
    *(s32 *)(r3 + 28) = r2;
    r3 = *(s32 *)r6;
    *(s32 *)(r3 + 36) = r4;
    r2 = *(s32 *)r6;
    return slot(*(s32 *)(r2 + 40) = r5);
    __nopool;
}

void STM_GetErrStat(void)
{
    r6 = 16;
    r3 = &stm_mng;
    r5 = *(s32 *)r3;
    r2 = &memmove;
    goto *r2 slot(r5 += 28);
}

