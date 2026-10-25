/* sbl/gfs_flow: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is gfs_flow.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.0606CC64");

void gfsFlow_InitCd(void)
{
    push(r14);
    r2 = -2;
    r0 = 0x00C4;
    push(pr);
    r14 = &gfs_mng;
    r15 += -4;
    *(s32 *)r15 = r4;
    r3 = *(s32 *)r14;
    r1 = *(s32 *)(r0 + r3);
    r1 &= r2;
    *(s32 *)(r0 + r3) = r1;
    r5 = *(s32 *)r15;
    r4 = *(s32 *)r14;
    r3 = 0x00CC;
    r1 = &gfcd_Init;
    (*r1)() slot(r4 += r3);
    r4 = r0;
    if (!r4) {
        r3 = *(s32 *)r14;
        r2 = 1;
        r0 = 0x00C4;
        r1 = *(s32 *)(r0 + r3);
        r1 |= r2;
        *(s32 *)(r0 + r3) = r1;
    }
    r0 = r4;
    if (r0 != -16) {
        if (r0 != -15) {
            if (r0 != -14) {
                if (r0 != -13) {
                    if (r0 != 0) {
                        goto L0606CCE4;
                        __nopool;
                    }
                    r0 = 0;
                    r15 += 4;
                    pop(pr);
                    return slot(pop(r14));
                    __nopool;
                }
                r0 = -23;
                r15 += 4;
                pop(pr);
                return slot(pop(r14));
                __nopool;
            }
            r0 = -2;
            r15 += 4;
            pop(pr);
            return slot(pop(r14));
            __nopool;
        }
        r0 = -3;
        r15 += 4;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r0 = -25;
    r15 += 4;
    pop(pr);
    return slot(pop(r14));
    __nopool;
L0606CCE4:
    r0 = -1;
    r15 += 4;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void gfsFlow_Init(void)
{
    push(r14);
    push(r13);
    r13 = r5;
    push(r12);
    T = !r13;
    push(r11);
    r12 = r4;
    push(r10);
    push(r9);
    push(pr);
    r9 = r6;
    r10 = 0x0800;
    if (T) slot(r14 = r4) {
        r5 = r14;
        r3 = &gfcd_GetFileInfo;
        r5 += 4;
        *(s32 *)r14 = r9;
        (*r3)() slot(r4 = r9);
        if (r0) {
            goto L0606CDC6 slot(r0 = 0);
            __nopool;
        }
        goto L0606CD52 slot(r11 = *(s32 *)(r14 + 8));
        __nopool;
    }
    r0 = *(s8 *)(r13 + 11);
    r0 = (u8)r0;
    if ((r0 & 128) != 0) slot(r11 = *(s32 *)(r13 + 4)) {
        r1 = 0x07FF;
        r1 += r11;
        r3 = &_divlspnm;
        (*r3)() slot(r0 = r10);
        macl = r0 * r10;
        r11 = macl;
    }
    *(s32 *)r14 = r9;
    r2 = *(s32 *)r13;
    *(s32 *)(r14 + 4) = r2;
    *(s32 *)(r14 + 8) = r11;
    r0 = *(s8 *)(r13 + 8);
    *(s8 *)(r14 + 12) = r0;
    r0 = *(s8 *)(r13 + 9);
    *(s8 *)(r14 + 13) = r0;
    r0 = *(s8 *)(r13 + 10);
    *(s8 *)(r14 + 14) = r0;
    r0 = *(s8 *)(r13 + 11);
    *(s8 *)(r14 + 15) = r0;
L0606CD52:
    r0 = *(s8 *)(r13 + 11);
    __bsr gfsFlow_SctSize() slot(r4 = (u8)r0);
    *(s32 *)(r14 + 16) = r0;
    r2 = 0x07FF;
    r2 += r11;
    r2 = (u32)r2 >> 8;
    r2 = (u32)r2 >> 2;
    r2 = (u32)r2 >> 1;
    *(s32 *)(r14 + 20) = r2;
    r0 = *(s32 *)(r14 + 16);
    if (!r0) slot(r13 = 0) {
        goto L0606CDA0 slot(*(s32 *)(r14 + 24) = r13);
    }
    r2 = &_modlspnm;
    r1 = r11;
    (*r2)() slot(r0 = r10);
    r3 = &_modlspnm;
    r1 = r10;
    r1 -= r0;
    (*r3)() slot(r0 = r10);
    *(s32 *)(r14 + 24) = r0;
L0606CDA0:
    r2 = &gfcf_Open;
    (*r2)() slot(r4 = r12);
    if (!r0) {
        goto L0606CDC6 slot(r0 = 0);
        __nopool;
    }
    r0 = 76;
    r3 = 0x7FFFFFFF;
    *(s32 *)(r0 + r12) = r13;
    r0 = 80;
    *(s32 *)(r0 + r12) = r13;
    r0 = 88;
    *(s32 *)(r0 + r12) = r13;
    r0 = 84;
    *(s32 *)(r0 + r12) = r13;
    r0 = 92;
    *(s32 *)(r0 + r12) = r3;
    r0 = 1;
L0606CDC6:
    pop(pr);
    pop(r9);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfsFlow_SetSct(void)
{
    r0 = 84;
    r3 = &gfcf_GetNumSct;
    r6 = 0;
    push(r14);
    r14 = r4;
    push(r13);
    r13 = r5;
    push(pr);
    *(s32 *)(r0 + r14) = r5;
    r5 = 0x7FFFFFFF;
    (*r3)() slot(r4 = r14);
    r4 = r0;
    if (r4 < 0) {
        r4 = 0;
    }
    if (!(r4 >= r13)) slot(r0 = 88) {
        goto L0606CE02 slot(r3 = r4);
        __nopool;
    }
    r3 = r13;
L0606CE02:
    *(s32 *)(r0 + r14) = r3;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfsFlow_GetFinfo(void)
{
    push(r14);
    T = !r5;
    r14 = *(s32 *)(r15 + 8);
    if (!T) {
        r3 = *(s32 *)r4;
        *(s32 *)r5 = r3;
    }
    if (r6) {
        r2 = *(s32 *)(r4 + 4);
        *(s32 *)r6 = r2;
    }
    r0 = *(s32 *)(r15 + 12);
    if (r0) {
        r3 = *(s32 *)(r15 + 12);
        r0 = *(s8 *)(r4 + 14);
        r0 = (u8)r0;
        *(s32 *)r3 = r0;
    }
    if (r7) {
        r3 = *(s32 *)(r4 + 16);
        *(s32 *)r7 = r3;
    }
    r0 = *(s32 *)(r15 + 4);
    if (r0) {
        r2 = *(s32 *)(r15 + 4);
        r3 = *(s32 *)(r4 + 20);
        *(s32 *)r2 = r3;
    }
    r0 = *(s32 *)(r15 + 16);
    if (r0) {
        r2 = *(s32 *)(r15 + 16);
        r0 = *(s8 *)(r4 + 15);
        r0 = (u8)r0;
        *(s32 *)r2 = r0;
    }
    if (!r14) goto L0606CE72;
    r0 = *(s8 *)(r4 + 15);
    r3 = 8;
    r5 = (u8)r0;
    if ((r3 & r5) == 0) goto L0606CE6A;
    r1 = 16;
    if ((r1 & r5) == 0) goto L0606CE6A;
    r2 = 0;
    goto L0606CE72 slot(*(s32 *)r14 = r2);
    __nopool;
L0606CE6A:
    r3 = *(s32 *)(r4 + 24);
    r1 = *(s32 *)(r4 + 16);
    r1 -= r3;
    *(s32 *)r14 = r1;
L0606CE72:
    return slot(pop(r14));
    __nopool;
}

void gfsFlow_Read(void)
{
    push(r14);
    push(r13);
    r14 = r4;
    push(r12);
    r13 = r4;
    push(r11);
    push(pr);
    r15 += -36;
    r5 = r15;
    r5 += 12;
    r4 = r15;
    r4 += 4;
    __bsr gfsFlow_GetCdStat() slot(r14 += 28);
    r12 = r0;
    r2 = &gfs_last_cd_stat;
    r6 = r15;
    r1 = &gfs_last_cd_fad;
    r5 = r12;
    *(s32 *)r2 = r0;
    r3 = *(s32 *)(r15 + 4);
    *(s32 *)r1 = r3;
    __bsr gfsFlow_CheckCd() slot(r4 = r13);
    if (!r0) {
        r0 = *(s32 *)r15;
        goto L0606CFCE;
        __nopool;
    }
    r11 = &gfs_mng;
    r3 = &gfcf_IsLocked;
    (*r3)() slot(r4 = r14);
    if (!r0) {
        r6 = r15;
        r5 = r15;
        r5 += 8;
        __bsr gfsFlow_SetRange() slot(r4 = r13);
        if (!r0) {
            r0 = *(s32 *)r15;
            goto L0606CFCE;
            __nopool;
        }
        r3 = &gfcf_Lock;
        (*r3)() slot(r4 = r14);
        if (!r0) {
            goto L0606CFCE slot(r0 = 8);
            __nopool;
        }
        r3 = &gfcf_SetCdCon;
        (*r3)() slot(r4 = r14);
        if (!r0) {
            goto L0606CFCE slot(r0 = 8);
            __nopool;
        }
        r4 = 1;
        r3 = r15;
        r3 += 16;
        r2 = r15;
        *(s32 *)r3 = r4;
        r0 = 16;
        r3 = *(s32 *)(r14 + 40);
        r2 += 16;
        *(s32 *)(r2 + 4) = r3;
        r2 = r15;
        r2 += 16;
        r3 = r15;
        *(s32 *)(r2 + 8) = r4;
        r3 += 16;
        r1 = *(s32 *)(r14 + 44);
        r4 = r15;
        r2 = r15;
        r2 += 16;
        r2 = *(s32 *)(r2 + 4);
        r4 += 16;
        r1 -= r2;
        r2 = 0;
        *(s32 *)(r3 + 12) = r1;
        r3 = r15;
        r3 += 16;
        *(s8 *)(r0 + r3) = r2;
        r3 = &gfcd_Play;
        (*r3)() slot(r5 = *(s32 *)(r14 + 28));
        T = !r0;
        *(s32 *)r15 = r0;
        if (!T) {
            goto L0606CFCE slot(r0 = 8);
        }
        r3 = *(s32 *)(r15 + 8);
        r0 = 88;
        r1 = 0x00AC;
        r2 = *(s32 *)(r0 + r13);
        r2 += r3;
        r3 = r15;
        *(s32 *)(r0 + r13) = r2;
        r3 += 16;
        r0 = *(s32 *)r11;
        r2 = *(s32 *)(r3 + 4);
        r1 += r0;
        *(s32 *)r1 = r2;
        r3 = *(s32 *)r11;
        r2 = *(s32 *)(r14 + 44);
        r0 = 0x00B0;
        *(s32 *)(r0 + r3) = r2;
        goto L0606CFCE slot(r0 = 1);
        __nopool;
    }
    r3 = *(s32 *)(r14 + 44);
    r2 = *(s32 *)(r15 + 4);
    if (!(r2 >= r3)) goto L0606CFCC;
    r0 = *(s32 *)(r15 + 12);
    if ((r0 & 4) == 0) {
        if (r12) goto L0606CFCC;
    }
    r2 = &gfcf_Unlock;
    (*r2)() slot(r4 = r14);
    r0 = 88;
    r3 = *(s32 *)(r0 + r13);
    r0 = 84;
    r2 = *(s32 *)(r0 + r13);
    if (r2 != r3) goto L0606CFC8;
    r1 = &gfs_mng;
    r3 = *(s32 *)r1;
    r2 = *(s32 *)(r15 + 4);
    r0 = 0x00B0;
    r3 = *(s32 *)(r0 + r3);
    if (r3 > r2) goto L0606CFC8;
    r0 = r12;
    if (r0 == 2) goto L0606CFC8;
    r3 = *(s32 *)r11;
    r2 = r3;
    r0 = 0x00B0;
    r1 = *(s32 *)(r0 + r2);
    r0 += -4;
    *(s32 *)(r0 + r3) = r1;
    goto L0606CFCE slot(r0 = 4);
    __nopool;
L0606CFC8:
    goto L0606CFCE slot(r0 = 2);
    __nopool;
L0606CFCC:
    r0 = 2;
L0606CFCE:
    r15 += 36;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfsFlow_StopRead(void)
{
    push(r14);
    r1 = 0;
    r0 = 0x00B0;
    push(r13);
    push(pr);
    r13 = r4;
    r14 = &gfs_mng;
    r15 += -16;
    *(s32 *)(r15 + 4) = r5;
    r13 += 28;
    r3 = *(s32 *)r14;
    r5 = r15;
    r2 = r3;
    r5 += 8;
    *(s32 *)(r0 + r2) = r1;
    r0 += -4;
    *(s32 *)(r0 + r3) = r1;
    r2 = 3;
    r3 = r15;
    r3 += 8;
    *(s32 *)r3 = r2;
    r3 = &gfcf_CdSeek;
    (*r3)() slot(r4 = r13);
    r0 = *(s32 *)(r15 + 4);
    if (r0) {
        r3 = &gfcd_WaitPause;
        (*r3)();
    }
    r2 = &gfcf_Flush;
    (*r2)() slot(r4 = r13);
    r3 = &gfcf_IsLocked;
    (*r3)() slot(r4 = r13);
    if (!r0) goto L0606D04C;
    r3 = &gfcf_Unlock;
    (*r3)() slot(r4 = r13);
    r4 = r15;
    __bsr gfsFlow_GetCdStat() slot(r5 = 0);
    r3 = *(s32 *)r14;
    r2 = *(s32 *)r15;
    r0 = 0x00B0;
    r1 = *(s32 *)(r0 + r3);
    if (r1 > r2) goto L0606D04C;
    r3 = *(s32 *)r14;
    r2 = r3;
    r0 = 0x00B0;
    r1 = *(s32 *)(r0 + r2);
    r0 += -4;
    *(s32 *)(r0 + r3) = r1;
L0606D04C:
    r15 += 16;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
}

void gfsFlow_PlayNoChg(void)
{
    push(r14);
    r14 = r4;
    r3 = &gfcf_IsLocked;
    r14 += 28;
    push(pr);
    r15 += -20;
    (*r3)() slot(r4 = r14);
    if (r0) {
        r4 = 3;
        r3 = r15;
        *(s32 *)r3 = r4;
        r2 = r15;
        *(s32 *)(r2 + 8) = r4;
        r3 = r15;
        r2 = 0x00FF;
        r0 = 16;
        *(s8 *)(r0 + r3) = r2;
        r4 = r15;
        r3 = &gfcd_Play;
        (*r3)() slot(r5 = *(s32 *)(r14 + 28));
        r4 = r0;
        if (!r4) goto L0606D0BC;
        r0 = 8;
        r15 += 20;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r0 = 8;
    r15 += 20;
    pop(pr);
    return slot(pop(r14));
    __nopool;
L0606D0BC:
    r0 = 2;
    r15 += 20;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void gfsFlow_GetSctPos(void)
{
    r15 += -4;
    r3 = &gfcf_Tell;
    *(s32 *)r15 = r4;
    r4 += 28;
    goto *r3 slot(r15 += 4);
    __nopool;
}

void gfsFlow_SetSctPos(void)
{
    r3 = &gfcf_Seek;
    goto *r3 slot(r6 = 0);
    __nopool;
}

void gfsFlow_Seek(void)
{
    push(r14);
    r14 = r4;
    push(r13);
    r13 = r14;
    push(r8);
    push(pr);
    r15 += -12;
    *(s32 *)r15 = r5;
    r5 = 0;
    __bsr gfsFlow_GetCdStat() slot(r4 = r5);
    if (r0) {
        goto L0606D156 slot(r0 = -20);
        __nopool;
    }
    r4 = r14;
    r3 = &gfcf_Lock;
    (*r3)() slot(r4 += 28);
    if (!r0) {
        goto L0606D156 slot(r0 = -20);
        __nopool;
    }
    r3 = r15;
    r3 += 4;
    r2 = 1;
    *(s32 *)r3 = r2;
    r3 = r15;
    r5 = *(s32 *)r15;
    r3 += 4;
    r8 = r3;
    r8 += 4;
    __bsr gfsFlow_SctToFad() slot(r4 = r13);
    r2 = *(s32 *)(r13 + 4);
    r5 = r15;
    r3 = &gfcf_CdSeek;
    r4 = r14;
    r0 += r2;
    r5 += 4;
    *(s32 *)r8 = r0;
    (*r3)() slot(r4 += 28);
    if (r0 != -13) {
        if (r0 != -9) {
            if (r0 != 0) {
                goto L0606D14A;
                __nopool;
            }
            goto L0606D14C slot(r13 = 0);
            __nopool;
        }
        goto L0606D14C slot(r13 = -20);
        __nopool;
    }
    goto L0606D14C slot(r13 = -23);
    __nopool;
L0606D14A:
    r13 = -1;
L0606D14C:
    r2 = &gfcf_Unlock;
    r4 = r14;
    (*r2)() slot(r4 += 28);
    r0 = r13;
L0606D156:
    r15 += 12;
    pop(pr);
    pop(r8);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfsFlow_SctToFad(void)
{
    push(pr);
    r0 = *(s8 *)(r4 + 12);
    if (!r0) {
        pop(pr);
        return slot(r0 = r5);
    }
    r0 = *(s8 *)(r4 + 12);
    r1 = r5;
    r3 = &_divlspnm;
    r6 = (u8)r0;
    (*r3)() slot(r0 = r6);
    r2 = &_modlspnm;
    r3 = r0;
    r0 = *(s8 *)(r4 + 13);
    r1 = r5;
    r0 = (u8)r0;
    r0 += r6;
    macl = r3 * r0;
    r0 = macl;
    r3 = r0;
    (*r2)() slot(r0 = r6);
    r0 += r3;
    pop(pr);
    return;
    __nopool;
}

void gfsFlow_GetCdStat(void)
{
    push(pr);
    r3 = &gfcd_GetStat;
    r15 += -20;
    *(s32 *)r15 = r4;
    r4 = r15;
    *(s32 *)(r15 + 4) = r5;
    r4 += 8;
    (*r3)();
    r1 = *(s32 *)(r15 + 4);
    r4 = r0;
    if (r1) {
        r3 = *(s32 *)(r15 + 4);
        *(s32 *)r3 = r4;
    }
    r1 = *(s32 *)r15;
    if (r1) {
        r2 = r15;
        r3 = *(s32 *)r15;
        r2 += 8;
        r1 = *(s32 *)(r2 + 8);
        *(s32 *)r3 = r1;
    }
    r3 = &gfcd_err;
    r4 = *(s32 *)r3;
    if (r4) goto L0606D246;
    r0 = r15;
    r0 += 8;
    r0 = *(s8 *)r0;
    r0 = (u8)r0;
    r0 &= 15;
    if (r0 != 0) {
        if (r0 == 1) goto L0606D226;
        if (r0 == 2) goto L0606D226;
        if (r0 == 3) goto L0606D22E;
        if (r0 == 4) goto L0606D236;
        if (r0 == 5) goto L0606D23E;
        if (r0 == 8) goto L0606D22E;
        if (r0 == 9) goto L0606D270;
        goto L0606D270;
        __nopool;
    }
    r15 += 20;
    pop(pr);
    return slot(r0 = 2);
    __nopool;
L0606D226:
    r15 += 20;
    pop(pr);
    return slot(r0 = 0);
    __nopool;
L0606D22E:
    r15 += 20;
    pop(pr);
    return slot(r0 = 1);
    __nopool;
L0606D236:
    r15 += 20;
    pop(pr);
    return slot(r0 = 2);
    __nopool;
L0606D23E:
    r15 += 20;
    pop(pr);
    return slot(r0 = 1);
    __nopool;
L0606D246:
    r0 = r4;
    if (r0 == -13) {
        r15 += 20;
        pop(pr);
        return slot(r0 = 3);
        __nopool;
    }
    r0 = r4;
    if (r0 == -14) {
        r15 += 20;
        pop(pr);
        return slot(r0 = 4);
        __nopool;
    }
    r0 = r4;
    if (r0 != -16) goto L0606D270;
    r15 += 20;
    pop(pr);
    return slot(r0 = 6);
    __nopool;
L0606D270:
    r0 = 5;
    r15 += 20;
    pop(pr);
    return;
    __nopool;
}

void gfsFlow_SctSize(void)
{
    r3 = 64;
    if ((r3 & r4) != 0) {
        r4 = 0x0930;
        goto L0606D2B6;
    }
    r5 = 8;
    r2 = 16;
    if ((r2 & r4) != 0) slot(r5 &= r4) {
        if (r5) {
            goto L0606D2B6 slot(r4 = 0);
        }
        r4 = 0x0914;
        goto L0606D2B6;
        __nopool;
    }
    r6 = 0x0800;
    T = !r5;
    r4 = r6;
L0606D2B6:
    return slot(r0 = r4);
    __nopool;
}

void gfsFlow_CheckCd(void)
{
    r3 = r4;
    push(r14);
    r0 = r5;
    push(r13);
    r3 += 28;
    push(pr);
    r13 = r4;
    r15 += -4;
    T = r0 == 0;
    *(s32 *)r15 = r3;
    if (!T) slot(r14 = r6) {
        if (r0 == 1) goto L0606D326;
        if (r0 != 2) {
            if (r0 == 3) goto L0606D306;
            if (r0 == 4) goto L0606D30E;
            if (r0 == 6) goto L0606D316;
            goto L0606D31E;
            __nopool;
        }
        r0 = 80;
        r3 = *(s32 *)(r0 + r13);
        *(s32 *)r14 = r3;
        goto L0606D358 slot(r0 = 0);
        __nopool;
    }
    r2 = &gfcd_GetFreeSiz;
    (*r2)();
    if (r0) goto L0606D326;
    r3 = 3;
    *(s32 *)r14 = r3;
    goto L0606D358 slot(r0 = 0);
    __nopool;
L0606D306:
    r1 = 5;
    *(s32 *)r14 = r1;
    goto L0606D358 slot(r0 = 0);
    __nopool;
L0606D30E:
    r3 = 6;
    *(s32 *)r14 = r3;
    goto L0606D358 slot(r0 = 0);
    __nopool;
L0606D316:
    r2 = 9;
    *(s32 *)r14 = r2;
    goto L0606D358 slot(r0 = 0);
    __nopool;
L0606D31E:
    r3 = 8;
    *(s32 *)r14 = r3;
    goto L0606D358 slot(r0 = 0);
    __nopool;
L0606D326:
    r0 = 76;
    r0 = *(s32 *)(r0 + r13);
    if (r0 == 1) goto L0606D352;
    r0 = 80;
    r1 = *(s32 *)(r0 + r13);
    if (r1) goto L0606D352;
    r4 = *(s32 *)r15;
    r3 = &gfcf_Flush;
    (*r3)();
    r5 = 0;
    r4 = &gfs_mng;
    r0 = 88;
    *(s32 *)(r0 + r13) = r5;
    r0 += 88;
    r3 = *(s32 *)r4;
    r2 = r3;
    *(s32 *)(r0 + r2) = r5;
    r0 += -4;
    *(s32 *)(r0 + r3) = r5;
L0606D352:
    r4 = 1;
    *(s32 *)r14 = r4;
    r0 = r4;
L0606D358:
    r15 += 4;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
}

void gfsFlow_SetRange(void)
{
    push(r14);
    r0 = 88;
    push(r13);
    r14 = r4;
    push(r12);
    r13 = r4;
    push(r11);
    r11 = r5;
    push(r10);
    r10 = r4;
    push(r9);
    r9 = r6;
    push(r8);
    push(pr);
    r3 = *(s32 *)(r0 + r14);
    r0 = 84;
    r2 = *(s32 *)(r0 + r14);
    r0 = 92;
    r2 -= r3;
    r5 = r2;
    *(s32 *)r11 = r2;
    r4 = *(s32 *)(r0 + r14);
    if (!(r5 >= r4)) slot(r13 += 28) {
        goto L0606D3AC slot(r3 = r5);
    }
    r3 = r4;
L0606D3AC:
    *(s32 *)r11 = r3;
    r3 = &gfcf_Tell;
    (*r3)() slot(r4 = r13);
    r5 = r0;
    __bsr gfsFlow_SctToFad() slot(r4 = r10);
    r8 = *(s32 *)(r10 + 4);
    r12 = &gfs_mng;
    r8 += r0;
    r0 = 76;
    r0 = *(s32 *)(r0 + r14);
    if (r0 == 1) {
        r5 = 0x7FFFFFFF;
        r6 = 0;
        r2 = &gfcf_GetNumSct;
        (*r2)() slot(r4 = r14);
        r4 = r0;
        if (r4 < 0) {
            r4 = 0;
        }
        if (r4 <= 0) goto L0606D3FA;
        r2 = &gfs_mng;
        r0 = 0x00AC;
        r3 = *(s32 *)r2;
        r1 = *(s32 *)(r0 + r3);
        if (r8 >= r1) goto L0606D3FA;
        r2 = *(s32 *)r12;
        r0 = 0x00AC;
        r3 = *(s32 *)(r0 + r2);
        r3 -= r8;
        r4 -= r3;
        goto L0606D3FA;
        __nopool;
    }
    r4 = 0;
L0606D3FA:
    r2 = *(s32 *)r11;
    if (!(r4 >= r2)) goto L0606D436;
    r3 = *(s32 *)r11;
    r0 = 88;
    r2 = *(s32 *)(r0 + r14);
    r2 += r3;
    *(s32 *)(r0 + r14) = r2;
    r1 = r2;
    r0 = 84;
    r0 = *(s32 *)(r0 + r14);
    if (r0 == r1) {
        r0 = 0x00B0;
        r2 = 4;
        *(s32 *)r9 = r2;
        r3 = *(s32 *)r12;
        r2 = r3;
        r1 = *(s32 *)(r0 + r2);
        r0 += -4;
        *(s32 *)(r0 + r3) = r1;
        goto L0606D432;
        __nopool;
    }
    r0 = 0x00AC;
    r2 = 2;
    *(s32 *)r9 = r2;
    r3 = *(s32 *)r12;
    *(s32 *)(r0 + r3) = r8;
L0606D432:
    goto L0606D4A2 slot(r0 = 0);
    __nopool;
L0606D436:
    r3 = *(s32 *)r11;
    r2 = &gfcf_Tell;
    r3 -= r4;
    *(s32 *)r11 = r3;
    *(s32 *)(r13 + 40) = r8;
    (*r2)() slot(r4 = r13);
    r5 = *(s32 *)r11;
    r5 += r0;
    __bsr gfsFlow_SctToFad() slot(r4 = r10);
    r2 = *(s32 *)(r10 + 4);
    r0 += r2;
    *(s32 *)(r13 + 44) = r0;
    r4 = *(s32 *)r12;
    r0 = 0x00AC;
    r4 = *(s32 *)(r0 + r4);
    r5 = *(s32 *)(r13 + 40);
    if (r4 > r5) goto L0606D4A0;
    r2 = *(s32 *)r12;
    r0 = 0x00B0;
    r3 = *(s32 *)(r0 + r2);
    if (r5 >= r3) goto L0606D4A0;
    r1 = *(s32 *)(r13 + 44);
    if (r4 >= r1) goto L0606D4A0;
    r2 = *(s32 *)r12;
    r0 = 0x00B0;
    r3 = *(s32 *)(r0 + r2);
    r1 = *(s32 *)(r13 + 44);
    if (r1 > r3) goto L0606D4A0;
    r3 = *(s32 *)r12;
    r2 = *(s32 *)(r13 + 40);
    r0 = 0x00AC;
    *(s32 *)(r0 + r3) = r2;
    r3 = 1;
    *(s32 *)r9 = r3;
    goto L0606D4A2 slot(r0 = 0);
L0606D4A0:
    r0 = 1;
L0606D4A2:
    pop(pr);
    pop(r8);
    pop(r9);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
}

