/* sbl/gfs_dir: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is gfs_dir.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.060703F4");

void gfs_LoadDirTbl(void)
{
    push(r14);
    r14 = r4;
    push(r13);
    T = !r14;
    push(pr);
    r15 += -8;
    *(s32 *)(r15 + 4) = r6;
    if (T) goto L06070434 slot(r13 = r5);
    r3 = r15;
    r2 = *(s32 *)&L06070600;
    r7 = 0;
    push(r3);
    r6 = r7;
    r5 = r7;
    (*r2)() slot(r4 = r14);
    r15 += 4;
    r0 = *(s32 *)r15;
    if ((r0 & 128) == 0) {
        goto L06070450 slot(r0 = -6);
        __nopool;
    }
    r5 = *(s32 *)(r15 + 4);
    r3 = *(s32 *)&L06070604;
    (*r3)() slot(r4 = r14);
    r4 = r0;
    if (!r4) goto L06070434;
    goto L06070450 slot(r0 = r4);
    __nopool;
L06070434:
    r2 = *(s32 *)r13;
    if (!r2) {
        r6 = *(s32 *)(r13 + 4);
        r5 = *(s32 *)(r13 + 8);
        __bsr gfs_ReadDirId() slot(r4 = r14);
        goto L0607044E;
        __nopool;
    }
    r6 = *(s32 *)(r13 + 4);
    r5 = *(s32 *)(r13 + 8);
    __bsr gfs_ReadDirName() slot(r4 = r14);
L0607044E:
    r4 = r0;
L06070450:
    r15 += 8;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_NameToIdx(void)
{
    push(r14);
    push(r13);
    r13 = r4;
    push(r12);
    r4 = 0;
    push(r11);
    r14 = r4;
    push(r10);
    r11 = r6;
    push(pr);
    T = r4 >= r11;
    r10 = *(s32 *)&L06070608;
    r15 += -4;
    *(s32 *)r15 = r5;
    if (T) goto L0607049C slot(r12 = 1);
L0607047A:
    r6 = 12;
    r4 = *(s32 *)r15;
    r5 = r13;
    (*r10)() slot(r5 += 12);
    if (!r0) {
        goto L0607049E slot(r0 = r14);
        __nopool;
    }
    r0 = *(s8 *)(r13 + 11);
    r0 = (u8)r0;
    if ((r0 & r12) != 0) goto L0607049C;
    r14 += 1;
    if (!(r14 >= r11)) goto L0607047A slot(r13 += 24);
L0607049C:
    r0 = -1;
L0607049E:
    r15 += 4;
    pop(pr);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_DirIdRec(void)
{
    r0 = r4;
    r3 = r4;
    r0 <<= 1;
    r0 += r3;
    r0 <<= 2;
    return slot(r0 += r5);
    __nopool;
}

void gfs_DirNameRec(void)
{
    r0 = r4;
    r3 = r4;
    r0 <<= 1;
    r0 += r3;
    r0 <<= 2;
    r0 <<= 1;
    return slot(r0 += r5);
    __nopool;
}

void gfs_DirIdAtr(void)
{
    r0 = r4;
    r3 = r4;
    r0 <<= 1;
    r0 += r3;
    r0 <<= 2;
    r0 += r5;
    r0 = *(s8 *)(r0 + 11);
    return slot(r0 = (u8)r0);
    __nopool;
}

void gfs_DirNameAtr(void)
{
    r0 = r4;
    r3 = r4;
    r0 <<= 1;
    r0 += r3;
    r0 <<= 2;
    r0 <<= 1;
    r0 += r5;
    r0 = *(s8 *)(r0 + 11);
    return slot(r0 = (u8)r0);
    __nopool;
}

void gfs_CdChgRootDir(void)
{
    goto gfs_CdChgDir slot(r4 = -1);
    __nopool;
}

void gfs_CdChgDir(void)
{
    push(r14);
    push(r13);
    push(pr);
    r3 = *(s32 *)&L06070610;
    r15 += -8;
    *(s32 *)(r15 + 4) = r4;
    r4 = *(s32 *)&L0607060C;
    (*r3)();
    r13 = *(s32 *)&L06070614;
    r14 = *(s32 *)&L06070618;
L0607050C:
    r4 = *(s32 *)(r15 + 4);
    r6 = r15;
    (*r13)() slot(r5 = 23);
    if (r0 == -5) slot(r4 = r0) {
        goto L06070554 slot(r0 = -7);
        __nopool;
    }
    (*r14)();
    if (r0 == -12) slot(r4 = r0) {
        goto L06070554 slot(r0 = -22);
        __nopool;
    }
    r0 = r4;
    if (r0 == -16) {
        goto L06070554 slot(r0 = -25);
        __nopool;
    }
    if (r4) goto L0607050C;
    r3 = *(s32 *)&L0607061C;
    (*r3)();
    if (r0 == -16) slot(r4 = r0) {
        goto L06070554 slot(r0 = -25);
        __nopool;
    }
    if (r4) {
        goto L06070554 slot(r0 = -1);
        __nopool;
    }
    r0 = *(s32 *)r15;
L06070554:
    r15 += 8;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_ReadDirId(void)
{
    push(r14);
    push(r13);
    r14 = r5;
    push(r12);
    r5 = r4;
    push(pr);
    r15 += -52;
    *(s32 *)r15 = r4;
    r4 = r15;
    r4 += 32;
    __bsr gfs_RdrInit() slot(r13 = r6);
    r4 = 0;
    if (!(r13 > r4)) goto L060705B0 slot(r12 = r4);
L0607057E:
    r5 = r15;
    r5 += 4;
    r4 = r15;
    r4 += 32;
    __bsr gfs_RdrRec();
    r4 = r0;
    if (r4) {
        goto L060705BA slot(r0 = r4);
        __nopool;
    }
    r3 = r15;
    r3 += 4;
    r0 = *(s8 *)(r3 + 8);
    if (!r0) goto L060705B0;
    r5 = r15;
    r5 += 4;
    __bsr gfs_RecToDir() slot(r4 = r14);
    r14 += 12;
    r13 += -1;
    if (r13 > 0) goto L0607057E slot(r12 += 1);
L060705B0:
    r14 += -12;
    r0 = *(s8 *)(r14 + 11);
    r0 |= 1;
    *(s8 *)(r14 + 11) = r0;
    r0 = r12;
L060705BA:
    r15 += 52;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_ReadDirName(void)
{
    push(r14);
    push(r13);
    r14 = r5;
    push(r12);
    r5 = r4;
    push(r11);
    push(r10);
    push(pr);
    r15 += -52;
    *(s32 *)r15 = r4;
    r4 = r15;
    r4 += 32;
    __bsr gfs_RdrInit() slot(r12 = r6);
    r11 = 2;
    r10 = *(s32 *)&L06070620;
    goto L06070662 slot(r13 = 0);
    __nopool;
L060705EA:
    r5 = r15;
    r5 += 4;
    r4 = r15;
    r4 += 32;
    __bsr gfs_RdrRec();
    r4 = r0;
    if (!r4) goto L06070624;
    goto L06070670 slot(r0 = r4);
    __data {
    L06070600:
        u32 &GFS_GetFileInfo;
    L06070604:
        u32 &GFS_NwCdRead;
    L06070608:
        u32 &strncmp;
    L0607060C:
        u32 0x00030000;
    L06070610:
        u32 &gfcd_SetTimeout;
    L06070614:
        u32 &gfcd_ChgDir;
    L06070618:
        u32 &gfcd_ExecServer;
    L0607061C:
        u32 &gfcd_WaitServer;
    L06070620:
        u32 &strncpy;
    }
L06070624:
    r3 = r15;
    r3 += 4;
    r0 = *(s8 *)(r3 + 8);
    if (!r0) goto L06070666;
    if (r13 > r11) {
        r6 = 12;
        r3 = &strncmp;
        r5 = r15;
        r5 += 4;
        r5 += 12;
        r4 = r14;
        (*r3)() slot(r4 += -12);
        if (!r0) goto L0607065C;
    }
    r5 = r15;
    r5 += 4;
    __bsr gfs_RecToDir() slot(r4 = r14);
    r6 = 12;
    r5 = r15;
    r5 += 4;
    r5 += 12;
    r4 = r14;
    (*r10)() slot(r4 += 12);
L0607065C:
    r14 += 24;
    r13 += 1;
    r12 += -1;
L06070662:
    if (r12 > 0) goto L060705EA;
L06070666:
    r14 += -24;
    r0 = *(s8 *)(r14 + 11);
    r0 |= 1;
    *(s8 *)(r14 + 11) = r0;
    r0 = r13;
L06070670:
    r15 += 52;
    pop(pr);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_RdrInit(void)
{
    *(s32 *)r4 = r5;
    r6 = r5;
    r2 = &gfs_mng;
    r6 += 12;
    r1 = 0x0460;
    r3 = *(s32 *)r2;
    r1 += r3;
    r3 = -1;
    *(s32 *)(r4 + 4) = r1;
    *(s32 *)(r4 + 8) = r3;
    r1 = *(s32 *)(r6 + 20);
    r3 = 0;
    *(s32 *)(r4 + 16) = r1;
    return slot(*(s32 *)(r4 + 12) = r3);
    __nopool;
}

void gfs_RdrRead(void)
{
    push(r14);
    push(r13);
    r14 = r4;
    push(r12);
    push(r11);
    push(r10);
    r10 = r5;
    push(pr);
    r15 += -4;
    r0 = *(s32 *)r14;
    if (!r0) slot(r13 = r6) {
        r3 = &memset;
        r6 = r13;
        r5 = 0;
        (*r3)() slot(r4 = r10);
        goto L06070766 slot(r0 = 0);
        __nopool;
    }
    r11 = 0x0800;
    r0 = *(s32 *)(r14 + 8);
    if (r0 != -1) slot(r4 = r0) {
        r3 = 0x0800;
        if (!(r4 >= r3)) goto L060706F8;
    }
    r7 = r11;
    r6 = *(s32 *)(r14 + 4);
    r5 = 1;
    r3 = &GFS_Fread;
    (*r3)() slot(r4 = *(s32 *)r14);
    r4 = r0;
    if (r4 != r11) {
        if (r4 < 0) {
            goto L06070766 slot(r0 = r4);
            __nopool;
        }
        goto L06070766 slot(r0 = -1);
        __nopool;
    }
    r2 = 0;
    *(s32 *)(r14 + 8) = r2;
L060706F8:
    r4 = *(s32 *)(r14 + 8);
    *(s32 *)r15 = r4;
    r4 = -r4;
    r4 += r11;
    if (!((u32)r4 >= (u32)r13)) {
        goto L0607071E slot(r12 = r4);
    }
    r12 = r13;
L0607071E:
    r6 = r12;
    r3 = *(s32 *)r15;
    r5 = *(s32 *)(r14 + 4);
    r5 += r3;
    r3 = &memmove;
    (*r3)() slot(r4 = r10);
    r2 = *(s32 *)(r14 + 8);
    T = (u32)r12 >= (u32)r13;
    r2 += r12;
    if (!T) slot(*(s32 *)(r14 + 8) = r2) {
        r13 -= r12;
        r6 = *(s32 *)(r14 + 4);
        r5 = 1;
        r2 = &GFS_Fread;
        r7 = r11;
        (*r2)() slot(r4 = *(s32 *)r14);
        r4 = r0;
        if (r4 != r11) {
            if (r4 < 0) {
                goto L06070766 slot(r0 = r4);
                __nopool;
            }
            goto L06070766 slot(r0 = -1);
            __nopool;
        }
        r6 = r13;
        r5 = *(s32 *)(r14 + 4);
        r4 = r12;
        r3 = &memmove;
        (*r3)() slot(r4 += r10);
        *(s32 *)(r14 + 8) = r13;
    }
    r0 = 0;
L06070766:
    r15 += 4;
    pop(pr);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_RdrByte(void)
{
    push(r8);
    push(pr);
    r8 = r5;
    r15 += -8;
    *(s32 *)(r15 + 4) = r5;
    r5 = r15;
    __bsr gfs_RdrRead() slot(r6 = 1);
    *(s32 *)r8 = r0;
    r0 = *(s8 *)r15;
    r15 += 8;
    pop(pr);
    return slot(pop(r8));
    __nopool;
}

void gfs_RdrHalf(void)
{
    push(r8);
    push(pr);
    r8 = r5;
    r15 += -8;
    *(s32 *)(r15 + 4) = r5;
    r5 = r15;
    __bsr gfs_RdrRead() slot(r6 = 2);
    *(s32 *)r8 = r0;
    r0 = *(s16 *)r15;
    r15 += 8;
    pop(pr);
    return slot(pop(r8));
    __nopool;
}

void gfs_RdrHalf2(void)
{
    push(r14);
    push(pr);
    r14 = r5;
    r15 += -12;
    r5 = r15;
    *(s32 *)(r15 + 4) = r4;
    r5 += 8;
    __bsr gfs_RdrRead() slot(r6 = 2);
    r1 = r0;
    if (r1) slot(*(s32 *)r14 = r0) {
        r0 = 0;
        r15 += 12;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r5 = r15;
    r4 = *(s32 *)(r15 + 4);
    __bsr gfs_RdrRead() slot(r6 = 2);
    r1 = r0;
    if (r1) slot(*(s32 *)r14 = r0) {
        r0 = 0;
        r15 += 12;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r0 = *(s16 *)r15;
    r15 += 12;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void gfs_RdrWord2(void)
{
    push(r14);
    push(pr);
    r14 = r5;
    r15 += -12;
    r5 = r15;
    *(s32 *)(r15 + 4) = r4;
    r5 += 8;
    __bsr gfs_RdrRead() slot(r6 = 4);
    r1 = r0;
    if (r1) slot(*(s32 *)r14 = r0) {
        r0 = 0;
        r15 += 12;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r5 = r15;
    r4 = *(s32 *)(r15 + 4);
    __bsr gfs_RdrRead() slot(r6 = 4);
    r1 = r0;
    if (r1) slot(*(s32 *)r14 = r0) {
        r0 = 0;
        r15 += 12;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r0 = *(s32 *)r15;
    r15 += 12;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void gfs_RdrWord(void)
{
    push(r8);
    push(pr);
    r8 = r5;
    r15 += -8;
    *(s32 *)(r15 + 4) = r5;
    r5 = r15;
    __bsr gfs_RdrRead() slot(r6 = 4);
    *(s32 *)r8 = r0;
    r0 = *(s32 *)r15;
    r15 += 8;
    pop(pr);
    return slot(pop(r8));
    __nopool;
}

void gfs_RdrRecLen(void)
{
    push(r14);
    push(r13);
    r14 = r4;
    push(pr);
    __bsr gfs_RdrByte() slot(r13 = r5);
    r4 = (u8)r0;
    r0 = *(s32 *)r13;
    if (r0) {
        goto L060708D2 slot(r0 = 0);
        __nopool;
    }
    if (r4) {
        goto L060708D2 slot(r0 = r4);
        __nopool;
    }
    r3 = *(s32 *)(r14 + 12);
    r3 += 1;
    r1 = r3;
    *(s32 *)(r14 + 12) = r3;
    r2 = *(s32 *)(r14 + 16);
    if (r1 >= r2) {
        goto L060708D2 slot(r0 = r4);
    }
    r7 = 0x0800;
    r5 = 1;
    r2 = &GFS_Fread;
    r6 = *(s32 *)(r14 + 4);
    (*r2)() slot(r4 = *(s32 *)r14);
    r3 = 0x0800;
    r4 = r0;
    if (r4 == r3) goto L060708BA;
    if (r4 > 0) slot(r0 = 0) {
        r2 = -1;
        goto L060708B6 slot(*(s32 *)r13 = r2);
        __nopool;
    }
    *(s32 *)r13 = r4;
L060708B6:
    goto L060708D2;
    __nopool;
L060708BA:
    r3 = 0;
    *(s32 *)(r14 + 8) = r3;
    r5 = r13;
    __bsr gfs_RdrByte() slot(r4 = r14);
    r4 = (u8)r0;
    r0 = *(s32 *)r13;
    if (r0) {
        goto L060708D2 slot(r0 = 0);
        __nopool;
    }
    r0 = r4;
L060708D2:
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_RdrRec(void)
{
    push(r14);
    push(r13);
    r14 = r4;
    push(r12);
    r12 = r5;
    push(r11);
    push(r10);
    push(r9);
    push(r8);
    push(pr);
    r15 += -12;
    r0 = *(s32 *)r14;
    if (!r0) slot(r9 = 0) {
        r0 = r9;
        *(s8 *)(r12 + 8) = r0;
        goto L06070BF6 slot(r0 = 0);
        __nopool;
    }
    r5 = r15;
    __bsr gfs_RdrRecLen() slot(r4 = r14);
    *(s8 *)(r12 + 8) = r0;
    r1 = *(s32 *)r15;
    if (r1) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
        __nopool;
    }
    r0 = *(s8 *)(r12 + 8);
    if (!r0) {
        goto L06070BF6 slot(r0 = 0);
        __nopool;
    }
    r5 = r15;
    __bsr gfs_RdrByte() slot(r4 = r14);
    r0 = *(s32 *)r15;
    if (r0) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
        __nopool;
    }
    r5 = r15;
    __bsr gfs_RdrWord2() slot(r4 = r14);
    r2 = 0x0096;
    r0 += r2;
    *(s32 *)r12 = r0;
    r1 = *(s32 *)r15;
    if (r1) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
        __nopool;
    }
    r5 = r15;
    __bsr gfs_RdrWord2() slot(r4 = r14);
    *(s32 *)(r12 + 4) = r0;
    r1 = *(s32 *)r15;
    if (r1) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
        __nopool;
    }
    r13 = r9;
    r11 = 7;
L06070960:
    r5 = r15;
    __bsr gfs_RdrByte() slot(r4 = r14);
    r0 = *(s32 *)r15;
    if (r0) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
    }
    r13 += 1;
    if (!(r13 >= r11)) goto L06070960;
    r5 = r15;
    __bsr gfs_RdrByte() slot(r4 = r14);
    *(s8 *)(r15 + 8) = r0;
    r2 = *(s32 *)r15;
    if (r2) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
    }
    r5 = r15;
    __bsr gfs_RdrByte() slot(r4 = r14);
    *(s8 *)(r12 + 10) = r0;
    r1 = *(s32 *)r15;
    if (r1) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
    }
    r5 = r15;
    __bsr gfs_RdrByte() slot(r4 = r14);
    *(s8 *)(r12 + 11) = r0;
    r1 = *(s32 *)r15;
    if (r1) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
    }
    r5 = r15;
    __bsr gfs_RdrHalf2() slot(r4 = r14);
    r0 = *(s32 *)r15;
    if (r0) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
    }
    r5 = r15;
    __bsr gfs_RdrByte() slot(r4 = r14);
    r4 = r0;
    r1 = *(s32 *)r15;
    if (r1) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
    }
    r11 = (u8)r4;
    r3 = r11;
    r3 += 33;
    r10 = r12;
    *(s32 *)(r15 + 4) = r3;
    r13 = r9;
    r10 += 12;
    goto L06070A20 slot(r8 = 8);
L060709F6:
    r5 = r15;
    __bsr gfs_RdrByte() slot(r4 = r14);
    r4 = r0;
    r0 = *(s32 *)r15;
    if (r0) slot(r13 += 1) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
    }
    r0 = (s8)r4;
    if (r0 == 59) goto L06070A2E;
    r0 = (s8)r4;
    *(s8 *)r10 = r4;
    if (r0 != 46) goto L06070A20 slot(r10 += 1);
    goto L06070A2E slot(r8 = r10);
L06070A20:
    if (r11 > r8) {
        goto L06070A2A slot(r3 = r8);
    }
    r3 = r11;
L06070A2A:
    if (!(r13 >= r3)) goto L060709F6;
L06070A2E:
    r0 = (s8)r4;
    if (r0 != 59) goto L06070A54;
    if (r13 >= r11) goto L06070AE2;
L06070A38:
    r5 = r15;
    __bsr gfs_RdrByte() slot(r4 = r14);
    r0 = *(s32 *)r15;
    if (r0) slot(r13 += 1) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
    }
    if (!(r13 >= r11)) goto L06070A38;
    goto L06070AE2;
L06070A54:
    r0 = (s8)r4;
    if (r0 == 46) goto L06070AE2;
    if (r13 >= r11) goto L06070AE2;
L06070A5E:
    r5 = r15;
    __bsr gfs_RdrByte() slot(r4 = r14);
    r4 = r0;
    r0 = *(s32 *)r15;
    if (r0) slot(r13 += 1) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
    }
    r0 = (s8)r4;
    if (r0 == 46) {
        *(s8 *)r10 = r4;
        r10 += 1;
        goto L06070AE2 slot(r8 = r10);
    }
    if (!(r13 >= r11)) goto L06070A5E;
    goto L06070AE2;
L06070A8A:
    r5 = r15;
    __bsr gfs_RdrByte() slot(r4 = r14);
    r4 = r0;
    r0 = *(s32 *)r15;
    if (r0) slot(r13 += 1) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
    }
    r0 = (s8)r4;
    if (r0 != 59) goto L06070AC6;
    if (r13 >= r11) goto L06070AE6;
L06070AAA:
    r5 = r15;
    __bsr gfs_RdrByte() slot(r4 = r14);
    r0 = *(s32 *)r15;
    if (r0) slot(r13 += 1) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
    }
    if (!(r13 >= r11)) goto L06070AAA;
    goto L06070AE6;
L06070AC6:
    r3 = r10;
    r3 -= r8;
    r2 = 3;
    if (r3 > r2) goto L06070AE2;
    r3 = r12;
    r3 += 12;
    r1 = r10;
    r1 -= r3;
    r2 = 12;
    if (r1 >= r2) goto L06070AE2;
    *(s8 *)r10 = r4;
    r10 += 1;
L06070AE2:
    if (!(r13 >= r11)) goto L06070A8A;
L06070AE6:
    r3 = r12;
    r3 += 12;
    r2 = r10;
    r2 -= r3;
    r1 = 12;
    if (!(r2 >= r1)) slot(r0 = r11) {
        *(s8 *)r10 = r9;
    }
    r0 += 1;
    if ((r0 & 1) != 0) {
        r5 = r15;
        __bsr gfs_RdrByte() slot(r4 = r14);
        r0 = *(s32 *)r15;
        if (r0) {
            r0 = *(s32 *)r15;
            goto L06070BF6;
        }
        r3 = *(s32 *)(r15 + 4);
        r3 += 1;
        *(s32 *)(r15 + 4) = r3;
    }
    r0 = *(s8 *)(r12 + 12);
    if (!r0) {
        r1 = &gfs_dir_dot;
        r0 = r12;
        r3 = &_slow_strcpy;
        (*r3)() slot(r0 += 12);
        goto L06070B3A;
        __nopool;
    }
    r0 = *(s8 *)(r12 + 12);
    if (r0 != 1) goto L06070B3A;
    r1 = &gfs_dir_dotdot;
    r0 = r12;
    r2 = &_slow_strcpy;
    (*r2)() slot(r0 += 12);
L06070B3A:
    r0 = *(s8 *)(r12 + 8);
    r3 = *(s32 *)(r15 + 4);
    r0 = (u8)r0;
    if (r3 >= r0) goto L06070BCE;
    r5 = r15;
    __bsr gfs_RdrWord() slot(r4 = r14);
    r0 = *(s32 *)r15;
    if (r0) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
        __nopool;
    }
    r5 = r15;
    __bsr gfs_RdrByte() slot(r4 = r14);
    r0 &= 248;
    *(s8 *)(r12 + 9) = r0;
    r1 = *(s32 *)r15;
    if (r1) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
        __nopool;
    }
    r5 = r15;
    __bsr gfs_RdrByte() slot(r4 = r14);
    r0 = *(s32 *)r15;
    if (r0) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
        __nopool;
    }
    r5 = r15;
    __bsr gfs_RdrHalf() slot(r4 = r14);
    r0 = *(s32 *)r15;
    if (r0) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
        __nopool;
    }
    r5 = r15;
    __bsr gfs_RdrByte() slot(r4 = r14);
    r1 = 25;
    r1 += r12;
    *(s8 *)r1 = r0;
    r2 = *(s32 *)r15;
    if (r2) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
        __nopool;
    }
    r13 = *(s32 *)(r15 + 4);
    goto L06070BC2 slot(r13 += 9);
    __nopool;
L06070BAE:
    r5 = r15;
    __bsr gfs_RdrByte() slot(r4 = r14);
    r0 = *(s32 *)r15;
    if (r0) {
        r0 = *(s32 *)r15;
        goto L06070BF6;
        __nopool;
    }
    r13 += 1;
L06070BC2:
    r0 = *(s8 *)(r12 + 8);
    r0 = (u8)r0;
    if (!(r13 >= r0)) goto L06070BAE;
    goto L06070BF4;
    __nopool;
L06070BCE:
    r0 = *(s8 *)(r15 + 8);
    r0 = (u8)r0;
    if ((r0 & 2) != 0) {
        r0 = 0x0080;
    } else {
        r0 = 0;
    }
    *(s8 *)(r12 + 9) = r0;
    r0 = 25;
    *(s8 *)(r0 + r12) = r9;
L06070BF4:
    r0 = 0;
L06070BF6:
    r15 += 12;
    pop(pr);
    pop(r8);
    pop(r9);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
}

void gfs_RecToDir(void)
{
    r0 = 25;
    r3 = *(s32 *)r5;
    *(s32 *)r4 = r3;
    r2 = *(s32 *)(r5 + 4);
    *(s32 *)(r4 + 4) = r2;
    r0 = *(s8 *)(r0 + r5);
    *(s8 *)(r4 + 10) = r0;
    r0 = *(s8 *)(r5 + 9);
    *(s8 *)(r4 + 11) = r0;
    r0 = *(s8 *)(r5 + 10);
    *(s8 *)(r4 + 8) = r0;
    r0 = *(s8 *)(r5 + 11);
    return slot(*(s8 *)(r4 + 9) = r0);
    __data {
        u8 0x00, 0x00;
    }
}

