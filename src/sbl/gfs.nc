/* sbl/gfs: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is gfs.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.0606AB44");

void GFS_Init(void)
{
    push(r14);
    r3 = 0;
    r2 = &gfs_scu_dma_busy;
    r1 = 1;
    push(r13);
    r13 = r4;
    push(pr);
    T = r13 >= r1;
    r15 += -4;
    *(s32 *)r15 = r5;
    *(s32 *)r2 = r3;
    if (T) slot(r14 = r6) {
        r0 = 24;
        if (!(r13 > r0)) goto L0606AB68;
    }
    goto L0606AC04 slot(r0 = -5);
    __nopool;
L0606AB68:
    r0 = *(s32 *)r15;
    if ((r0 & 3) != 0) {
        goto L0606AC04 slot(r0 = -21);
        __nopool;
    }
    if (!r14) goto L0606AB94;
    r4 = *(s32 *)r14;
    if (r4) {
        r0 = r4;
        if (r0 != 1) goto L0606AB90;
    }
    r2 = 2;
    r3 = *(s32 *)(r14 + 4);
    if (!(r3 >= r2)) goto L0606AB90;
    r0 = *(s32 *)(r14 + 8);
    if (r0) goto L0606AB94;
L0606AB90:
    goto L0606AC04 slot(r0 = -4);
    __nopool;
L0606AB94:
    r2 = &SYS_SETSCUIM;
    r3 = *(s32 *)r2;
    r4 = __w(0xF7FF);
    (*r3)() slot(r5 = 0);
    r3 = *(s32 *)r15;
    r2 = &gfs_mng;
    *(s32 *)r2 = r3;
    r3 = &gfs_InitMng;
    (*r3)() slot(r4 = r13);
    if (!r14) {
        goto L0606ABB4 slot(r4 = 1);
        __nopool;
    }
    r4 = 0;
L0606ABB4:
    r2 = &gfsFlow_InitCd;
    (*r2)();
    r4 = r0;
    if (!r4) {
        r3 = &gfs_mng;
        r0 = *(s32 *)r3;
        r1 = 0x00C4;
        r0 = *(s32 *)(r0 + r1);
        if ((r0 & 1) == 0) {
            r2 = &gfs_SetErr;
            r4 = -2;
            r15 += 4;
            pop(pr);
            pop(r13);
            return (*r2)() slot(pop(r14));
            __nopool;
        }
        __bsr gfs_ReadRootDir() slot(r4 = r14);
        r14 = r0;
        if (r14 >= 0) goto L0606ABF2;
        r4 = r14;
    }
    r15 += 4;
    r3 = &gfs_SetErr;
    pop(pr);
    pop(r13);
    return (*r3)() slot(pop(r14));
    __nopool;
L0606ABF2:
    r2 = &gfs_SetErr;
    (*r2)() slot(r4 = 0);
    r4 = r0;
    if (r4 < 0) {
        goto L0606AC04 slot(r0 = r4);
        __nopool;
    }
    r0 = r14;
L0606AC04:
    r15 += 4;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
}

void GFS_LoadDir(void)
{
    push(r14);
    r1 = r5;
    push(pr);
    T = !r1;
    r15 += -8;
    *(s32 *)r15 = r5;
    if (T) {
        r2 = &gfs_mng;
        r0 = 0x00A0;
        r3 = *(s32 *)r2;
        r0 = *(s32 *)(r0 + r3);
        if (r0) {
            r3 = &gfs_SetErr;
            (*r3)() slot(r4 = -7);
            r15 += 8;
            pop(pr);
            return slot(pop(r14));
            __nopool;
        }
        r2 = &gfs_CdChgDir;
        (*r2)();
        r4 = r0;
        if (r4 < 0) {
            r2 = &gfs_SetErr;
            (*r2)();
            r15 += 8;
            pop(pr);
            return slot(pop(r14));
            __nopool;
        }
        r0 = r4;
        r15 += 8;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    __bsr GFS_Open();
    r14 = r0;
    if (!r14) {
        r3 = &gfs_mng;
        r1 = 0x00C0;
        r0 = *(s32 *)r3;
        r0 = *(s32 *)(r0 + r1);
        r15 += 8;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r7 = 0;
    r6 = r15;
    r6 += 4;
    r5 = r7;
    __bsr GFS_GetFileSize() slot(r4 = r14);
    r6 = *(s32 *)(r15 + 4);
    r5 = *(s32 *)r15;
    r3 = &gfs_LoadDirTbl;
    (*r3)() slot(r4 = r14);
    *(s32 *)r15 = r0;
    __bsr GFS_Close() slot(r4 = r14);
    r0 = *(s32 *)r15;
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void GFS_SetDir(void)
{
    push(r14);
    T = !r4;
    r3 = &gfs_mng;
    push(pr);
    r14 = *(s32 *)r3;
    r2 = 0x0098;
    if (T) slot(r14 += r2) {
        r1 = *(s32 *)(r14 + 8);
        if (r1) {
            r4 = -7;
            pop(pr);
            r1 = &gfs_SetErr;
            return (*r1)() slot(pop(r14));
            __nopool;
        }
        r4 = 0;
        *(s32 *)(r14 + 8) = r4;
        *(s32 *)(r14 + 12) = r4;
        goto L0606ACF2 slot(*(s32 *)(r14 + 4) = r4);
        __nopool;
    }
    r1 = r14;
    r3 = &_quick_odd_mvn;
    r2 = r4;
    (*r3)() slot(r0 = 12);
    __bsr gfs_CountFiles();
    *(s32 *)(r14 + 12) = r0;
L0606ACF2:
    r4 = 0;
    pop(pr);
    r3 = &gfs_SetErr;
    return (*r3)() slot(pop(r14));
    __nopool;
}

void GFS_NameToId(void)
{
    push(r14);
    push(pr);
    r3 = &gfs_mng;
    r15 += -4;
    r2 = 0x0098;
    *(s32 *)r15 = r4;
    r14 = *(s32 *)r3;
    r14 += r2;
    r0 = *(s32 *)(r14 + 8);
    if (r0) {
        r0 = *(s32 *)r14;
        if (r0 == 1) goto L0606AD38;
    }
    goto L0606AD4A slot(r4 = -8);
L0606AD38:
    r6 = *(s32 *)(r14 + 4);
    r5 = *(s32 *)r15;
    r3 = &gfs_NameToIdx;
    (*r3)() slot(r4 = *(s32 *)(r14 + 8));
    r14 = r0;
    if (r14 >= 0) goto L0606AD54;
    r4 = -9;
L0606AD4A:
    r15 += 4;
    r3 = &gfs_SetErr;
    pop(pr);
    return (*r3)() slot(pop(r14));
    __nopool;
L0606AD54:
    r2 = &gfs_SetErr;
    (*r2)() slot(r4 = 0);
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

void GFS_IdToName(void)
{
    push(r14);
    push(pr);
    r3 = &gfs_mng;
    r15 += -4;
    r2 = 0x0098;
    r14 = *(s32 *)r3;
    r14 += r2;
    r0 = *(s32 *)(r14 + 8);
    if (r0) {
        r0 = *(s32 *)r14;
        if (r0 == 1) goto L0606AD9C;
    }
    __bsr gfs_SetErr() slot(r4 = -8);
    r0 = 0;
    r15 += 4;
    pop(pr);
    return slot(pop(r14));
    __nopool;
L0606AD9C:
    if (r4 >= 0) {
        r3 = *(s32 *)(r14 + 12);
        if (r3 > r4) goto L0606ADB4;
    }
    __bsr gfs_SetErr() slot(r4 = -9);
    r0 = 0;
    r15 += 4;
    pop(pr);
    return slot(pop(r14));
    __nopool;
L0606ADB4:
    r2 = &gfs_DirNameRec;
    (*r2)() slot(r5 = *(s32 *)(r14 + 8));
    *(s32 *)r15 = r0;
    __bsr gfs_SetErr() slot(r4 = 0);
    r4 = r0;
    if (r4 < 0) {
        r0 = 0;
        r15 += 4;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r0 = *(s32 *)r15;
    r0 += 12;
    r15 += 4;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void GFS_GetDirInfo(void)
{
    push(r14);
    push(pr);
    r3 = &gfs_mng;
    r15 += -4;
    r2 = 0x0098;
    *(s32 *)r15 = r5;
    r14 = *(s32 *)r3;
    r14 += r2;
    r0 = *(s32 *)(r14 + 8);
    if (!r0) goto L0606ADFC;
    if (r4 < 0) goto L0606ADFC;
    r0 = *(s32 *)(r14 + 12);
    if (!(r4 >= r0)) goto L0606AE06;
L0606ADFC:
    r4 = -10;
    r15 += 4;
    pop(pr);
    goto gfs_SetErr slot(pop(r14));
    __nopool;
L0606AE06:
    r0 = *(s32 *)r14;
    if (r0 == 1) {
        r3 = &gfs_DirNameRec;
        (*r3)() slot(r5 = *(s32 *)(r14 + 8));
        goto L0606AE1C;
        __nopool;
    }
    r3 = &gfs_DirIdRec;
    (*r3)() slot(r5 = *(s32 *)(r14 + 8));
L0606AE1C:
    r4 = *(s32 *)r15;
    r5 = r0;
    r3 = &memmove;
    (*r3)() slot(r6 = 12);
    r4 = 0;
    r15 += 4;
    pop(pr);
    goto gfs_SetErr slot(pop(r14));
}

void gfs_CloseAll(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(r11);
    push(pr);
    r12 = &gfs_mng;
    r3 = 0x0C60;
    r14 = *(s32 *)r12;
    r11 = &gfsTrn_SetFunc;
    r14 += r3;
    goto L0606AE86 slot(r13 = 0);
    __nopool;
L0606AE64:
    r0 = *(s32 *)r14;
    if (r0 == 1) {
        r4 = r14;
        r4 += 108;
        r0 = *(s32 *)(r4 + 56);
        if (r0 == 4) {
            r5 = &gfs_TrFuncNull;
            r6 = r14;
            (*r11)() slot(r4 = r14);
        }
        __bsr GFS_Close() slot(r4 = r14);
    }
    r2 = 0x00A8;
    r13 += 1;
    r14 += r2;
L0606AE86:
    r3 = *(s32 *)r12;
    r2 = *(s32 *)r3;
    if (!(r13 >= r2)) goto L0606AE64;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void GFS_Open(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(pr);
    r3 = &gfs_mng;
    r2 = 0x0098;
    r14 = *(s32 *)r3;
    r14 += r2;
    r0 = *(s32 *)(r14 + 8);
    if (!r0) goto L0606AEC4 slot(r13 = r4);
    if (r13 >= 0) {
        r0 = *(s32 *)(r14 + 12);
        if (!(r13 >= r0)) goto L0606AEC4;
    }
    __bsr gfs_SetErr() slot(r4 = -10);
    goto L0606AF20 slot(r0 = 0);
    __nopool;
L0606AEC4:
    __bsr gfs_AllocHn();
    r12 = r0;
    if (!r12) {
        __bsr gfs_SetErr() slot(r4 = -19);
        goto L0606AF20 slot(r0 = 0);
        __nopool;
    }
    r1 = *(s32 *)(r14 + 8);
    if (!r1) {
        goto L0606AEFC slot(r5 = 0);
        __nopool;
    }
    r0 = *(s32 *)r14;
    if (!r0) {
        r5 = *(s32 *)(r14 + 8);
        r3 = &gfs_DirIdRec;
        (*r3)() slot(r4 = r13);
        goto L0606AEFA;
        __nopool;
    }
    r5 = *(s32 *)(r14 + 8);
    r3 = &gfs_DirNameRec;
    (*r3)() slot(r4 = r13);
L0606AEFA:
    r5 = r0;
L0606AEFC:
    r6 = r13;
    __bsr gfs_InitHn() slot(r4 = r12);
    r14 = r0;
    if (!r14) {
        __bsr gfs_SetErr() slot(r4 = -10);
        goto L0606AF1E;
        __nopool;
    }
    __bsr gfs_SetErr() slot(r4 = 0);
    r4 = r0;
    if (r4 >= 0) goto L0606AF1E;
    goto L0606AF20 slot(r0 = 0);
    __nopool;
L0606AF1E:
    r0 = r14;
L0606AF20:
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
}

void GFS_Close(void)
{
    push(r14);
    r14 = r4;
    push(pr);
    if (r14) {
        r5 = 1;
        __bsr gfs_StopIn() slot(r4 = r14);
        r2 = &gfs_CloseHn;
        (*r2)() slot(r4 = r14);
    }
    r4 = 0;
    pop(pr);
    goto gfs_SetErr slot(pop(r14));
    __nopool;
}

void GFS_Seek(void)
{
    T = !r4;
    push(r14);
    r14 = r5;
    push(r13);
    push(r12);
    push(r11);
    push(pr);
    r15 += -8;
    if (T) slot(r12 = r6) {
        goto L0606AFC0 slot(r4 = -11);
        __nopool;
    }
    r13 = r4;
    r3 = &gfs_mng;
    r7 = 0;
    r11 = *(s32 *)r3;
    r6 = r15;
    r13 += 12;
    r5 = r13;
    r2 = *(s32 *)(r5 + 28);
    r11 += 4;
    r2 <<= 2;
    r2 <<= 2;
    r11 += r2;
    __bsr GFS_GetFileSize() slot(r5 = r7);
    r0 = r12;
    if (r0 == 1) {
        r2 = *(s32 *)(r11 + 12);
        (*r2)() slot(r4 = r13);
        goto L0606AFBA slot(r14 += r0);
        __nopool;
    }
    r0 = r12;
    if (r0 == 2) {
        r3 = *(s32 *)r15;
        goto L0606AFBA slot(r14 += r3);
        __nopool;
    }
    if (!r12) goto L0606AFBA;
    goto L0606AFC0 slot(r4 = -13);
    __nopool;
L0606AFBA:
    if (r14 >= 0) goto L0606AFC8;
    r4 = -12;
L0606AFC0:
    __bsr gfs_SetErr();
    goto L0606AFF0;
    __nopool;
L0606AFC8:
    r2 = *(s32 *)r15;
    if (r14 > r2) {
        __bsr gfs_SetErr() slot(r4 = -12);
        goto L0606AFF0;
        __nopool;
    }
    r5 = r14;
    r3 = *(s32 *)(r11 + 8);
    (*r3)() slot(r4 = r13);
    *(s32 *)(r15 + 4) = r0;
    __bsr gfs_SetErr() slot(r4 = 0);
    r4 = r0;
    if (r4 < 0) {
        goto L0606AFF0 slot(r0 = r4);
        __nopool;
    }
    r0 = *(s32 *)(r15 + 4);
L0606AFF0:
    r15 += 8;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void GFS_Tell(void)
{
    T = !r4;
    push(pr);
    r15 += -4;
    if (T) {
        r4 = -11;
        r15 += 4;
        goto gfs_SetErr slot(pop(pr));
        __nopool;
    }
    r4 += 12;
    r3 = &gfs_mng;
    r5 = r4;
    r2 = *(s32 *)r3;
    r5 += 28;
    r1 = *(s32 *)r5;
    r2 += 4;
    r1 <<= 2;
    r1 <<= 2;
    r1 += r2;
    r2 = r1;
    *(s32 *)r15 = r1;
    r1 = *(s32 *)(r2 + 12);
    (*r1)();
    *(s32 *)r15 = r0;
    __bsr gfs_SetErr() slot(r4 = 0);
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

void GFS_IsEof(void)
{
    push(r14);
    push(pr);
    r14 = r4;
    r15 += -8;
    if (!r14) {
        __bsr gfs_SetErr() slot(r4 = -11);
        r15 += 8;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    __bsr GFS_Tell() slot(r4 = r14);
    r7 = 0;
    *(s32 *)(r15 + 4) = r0;
    r6 = r15;
    r5 = r7;
    __bsr GFS_GetFileSize() slot(r4 = r14);
    __bsr gfs_SetErr() slot(r4 = 0);
    r3 = *(s32 *)r15;
    r2 = *(s32 *)(r15 + 4);
    if (r2 >= r3) {
        r0 = 1;
        r15 += 8;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r0 = 0;
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void GFS_ByteToSct(void)
{
    T = !r4;
    push(pr);
    r15 += -8;
    *(s32 *)(r15 + 4) = r5;
    if (T) {
        __bsr gfs_SetErr() slot(r4 = -11);
        r15 += 8;
        pop(pr);
        return;
        __nopool;
    }
    r7 = 0;
    r5 = r15;
    __bsr GFS_GetFileSize() slot(r6 = r7);
    r0 = *(s32 *)r15;
    if (!r0) {
        r15 += 8;
        pop(pr);
        return slot(r0 = 0);
        __nopool;
    }
    __bsr gfs_SetErr() slot(r4 = 0);
    r4 = r0;
    if (r4 < 0) {
        r15 += 8;
        pop(pr);
        return slot(r0 = r4);
        __nopool;
    }
    r3 = *(s32 *)r15;
    r1 = *(s32 *)(r15 + 4);
    r1 += r3;
    r0 = r3;
    r3 = &_divlu;
    (*r3)() slot(r1 += -1);
    r15 += 8;
    pop(pr);
    return;
    __nopool;
}

void GFS_GetFileSize(void)
{
    T = !r4;
    push(r14);
    push(pr);
    r15 += -20;
    *(s32 *)(r15 + 4) = r5;
    *(s32 *)(r15 + 12) = r6;
    *(s32 *)(r15 + 8) = r7;
    if (T) {
        __bsr gfs_SetErr() slot(r4 = -11);
        goto L0606B132;
        __nopool;
    }
    r3 = r4;
    r3 += 12;
    r14 = 0;
    *(s32 *)(r15 + 16) = r3;
    r2 = r15;
    r3 = &gfs_GetFinfo;
    r6 = r14;
    push(r2);
    push(r14);
    r1 = *(s32 *)(r15 + 16);
    push(r1);
    r2 = *(s32 *)(r15 + 24);
    push(r2);
    r7 = *(s32 *)(r15 + 20);
    r4 = *(s32 *)(r15 + 32);
    (*r3)() slot(r5 = r14);
    r15 += 16;
    r0 = *(s32 *)r15;
    if ((r0 & 8) == 0) goto L0606B132;
    r0 = *(s32 *)r15;
    if ((r0 & 16) == 0) goto L0606B132;
    r1 = *(s32 *)(r15 + 4);
    *(s32 *)r1 = r14;
L0606B132:
    __bsr gfs_SetErr() slot(r4 = 0);
    r15 += 20;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void GFS_GetFileInfo(void)
{
    T = !r4;
    push(r14);
    push(pr);
    r15 += -20;
    *(s32 *)(r15 + 12) = r6;
    *(s32 *)(r15 + 8) = r7;
    r14 = *(s32 *)(r15 + 28);
    if (T) {
        __bsr gfs_SetErr() slot(r4 = -11);
        goto L0606B1B0;
    }
    r3 = r4;
    r3 += 12;
    *(s32 *)(r15 + 16) = r3;
    r7 = 0;
    push(r14);
    r2 = *(s32 *)(r15 + 16);
    r3 = &gfs_GetFinfo;
    push(r2);
    r1 = r15;
    r1 += 12;
    push(r1);
    r2 = r15;
    r2 += 12;
    push(r2);
    r4 = *(s32 *)(r15 + 32);
    (*r3)() slot(r6 = r7);
    if (r14) slot(r15 += 16) {
        r2 = *(s32 *)r14;
        r3 = -7;
        r2 &= r3;
        *(s32 *)r14 = r2;
    }
    r0 = *(s32 *)(r15 + 8);
    if (!r0) goto L0606B1B0;
    r1 = *(s32 *)(r15 + 8);
    r3 = *(s32 *)r15;
    r3 += -1;
    r2 = *(s32 *)(r15 + 4);
    r3 <<= 8;
    r3 <<= 2;
    r3 <<= 1;
    r3 += r2;
    *(s32 *)r1 = r3;
L0606B1B0:
    __bsr gfs_SetErr() slot(r4 = 0);
    r15 += 20;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void GFS_GetNumCdbuf(void)
{
    if (!r4) {
        goto gfs_SetErr slot(r4 = -11);
        __nopool;
    }
    r2 = &gfsAcc_CountSctAll;
    goto *r2;
    __nopool;
}

void GFS_Load(void)
{
    push(r14);
    push(r13);
    push(pr);
    r15 += -8;
    *(s32 *)r15 = r5;
    *(s32 *)(r15 + 4) = r6;
    __bsr GFS_Open() slot(r13 = r7);
    r14 = r0;
    if (!r14) {
        r3 = &gfs_mng;
        r0 = *(s32 *)r3;
        r1 = 0x00C0;
        r0 = *(s32 *)(r0 + r1);
        goto L0606B252;
        __nopool;
    }
    r5 = *(s32 *)r15;
    r6 = 0;
    __bsr GFS_Seek() slot(r4 = r14);
    r4 = r0;
    if (r4 < 0) {
        r4 = -15;
        r15 += 8;
        pop(pr);
        pop(r13);
        goto gfs_SetErr slot(pop(r14));
        __nopool;
    }
    r5 = r14;
    r5 += 12;
    r6 = *(s32 *)(r5 + 16);
    r4 = r6;
    if (!r4) {
        r4 = 0x0914;
        r6 = 0x0800;
    }
    r0 = r13;
    r3 = *(s32 *)r15;
    T = r0 == -1;
    r5 = *(s32 *)(r5 + 20);
    if (T) slot(r5 -= r3) {
        macl = r5 * r4;
        r13 = macl;
    }
    r1 = r13;
    r3 = &_divlspnm;
    r1 += r4;
    r1 += -1;
    (*r3)() slot(r0 = r6);
    r4 = r0;
    if (r5 >= r4) slot(r7 = r13) {
        r5 = r4;
    }
    r6 = *(s32 *)(r15 + 4);
    __bsr GFS_Fread() slot(r4 = r14);
    r13 = r0;
    __bsr GFS_Close() slot(r4 = r14);
    if (r13 >= 0) {
        __bsr gfs_SetErr() slot(r4 = 0);
    }
    r0 = r13;
L0606B252:
    r15 += 8;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
}

void GFS_Fread(void)
{
    push(r14);
    r14 = r4;
    push(r13);
    T = !r14;
    push(pr);
    r15 += -8;
    if (T) {
        __bsr gfs_SetErr() slot(r4 = -11);
        goto L0606B2D8;
    }
    __bsr GFS_NwFread() slot(r4 = r14);
    r4 = r0;
    if (r4) {
        goto L0606B2D8 slot(r0 = r4);
    }
    r5 = 0x7FFFFFFF;
    __bsr GFS_SetReadPara() slot(r4 = r14);
    r13 = r0;
    __bsr gfs_WaitNw() slot(r4 = r14);
    r4 = r0;
    if (r4 < 0) {
        __bsr gfs_SetErr();
        *(s32 *)r15 = r0;
        goto L0606B2CC;
        __nopool;
    }
    r6 = r15;
    r5 = r15;
    r5 += 4;
    __bsr GFS_NwGetStat() slot(r4 = r14);
    __bsr gfs_SetErr() slot(r4 = 0);
    r4 = r0;
    if (r4 >= 0) goto L0606B2CC;
    goto L0606B2D8 slot(r0 = r4);
    __nopool;
L0606B2CC:
    if (r13 >= 0) {
        r5 = r13;
        __bsr GFS_SetReadPara() slot(r4 = r14);
    }
    r0 = *(s32 *)r15;
L0606B2D8:
    r15 += 8;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_WaitNw(void)
{
    r7 = 0;
    push(r14);
    r6 = r7;
    push(r13);
    r5 = r7;
    push(r12);
    r13 = r4;
    push(r11);
    r12 = r4;
    push(r10);
    r11 = r4;
    push(pr);
    r12 += 40;
    r15 += -4;
    r11 += 108;
    r3 = r15;
    push(r3);
    __bsr GFS_GetFileInfo() slot(r4 = r13);
    r15 += 4;
    r0 = *(s32 *)r15;
    if ((r0 & 64) != 0) {
        goto L0606B316 slot(r14 = -1);
        __nopool;
    }
    r14 = 0;
L0606B316:
    r10 = 0x000493E0;
L0606B318:
    __bsr GFS_NwExecOne() slot(r4 = r13);
    r4 = r0;
    if (!r4) goto L0606B358;
    if (r4 < 0) goto L0606B358;
    r0 = *(s32 *)(r11 + 52);
    if (r0 == 6) {
        r0 = *(s32 *)r12;
        if (r0) goto L0606B358;
        r3 = *(s32 *)(r12 + 44);
        r1 = &gfs_last_cd_fad;
        r2 = *(s32 *)r1;
        if (!(r2 >= r3)) goto L0606B358;
        r3 = &gfs_last_cd_stat;
        r0 = *(s32 *)r3;
        if (r0 != 2) goto L0606B358;
    }
    r0 = *(s32 *)(r11 + 8);
    if (r0) goto L0606B318;
    if (r14 < 0) goto L0606B318;
    r14 += 1;
    if (!(r14 > r10)) goto L0606B318;
    goto L0606B35A slot(r0 = -22);
    __nopool;
L0606B358:
    r0 = r4;
L0606B35A:
    r15 += 4;
    pop(pr);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void GFS_NwFread(void)
{
    push(r14);
    push(r13);
    r14 = r4;
    push(r12);
    T = !r14;
    push(r11);
    push(r10);
    push(r9);
    push(r8);
    push(pr);
    r15 += -20;
    *(s32 *)(r15 + 4) = r5;
    *(s32 *)(r15 + 8) = r6;
    *(s32 *)(r15 + 12) = r7;
    if (T) slot(r11 = 0) {
        goto L0606B430 slot(r4 = -11);
        __nopool;
    }
    r10 = r14;
    r10 += 12;
    r13 = r14;
    *(s32 *)(r15 + 16) = r10;
    r3 = r10;
    r8 = *(s32 *)(r3 + 20);
    r13 += 108;
    __bsr GFS_Tell() slot(r4 = r14);
    r3 = *(s32 *)(r15 + 4);
    r4 = r8;
    r4 -= r0;
    if (!(r4 >= r3)) {
        goto L0606B3B0 slot(r12 = r4);
        __nopool;
    }
    r12 = *(s32 *)(r15 + 4);
L0606B3B0:
    if (r12 < 0) {
        goto L0606B430 slot(r4 = -17);
        __nopool;
    }
    r0 = *(s32 *)(r14 + 4);
    if (!r0) slot(r9 = 1) {
        r5 = r12;
        __bsr gfs_SetupFlow() slot(r4 = r10);
        r11 = r9;
    }
    *(s32 *)(r14 + 4) = r9;
    r2 = r15;
    push(r2);
    r7 = 0;
    r6 = r7;
    r5 = r7;
    __bsr GFS_GetFileInfo() slot(r4 = r14);
    r15 += 4;
    r0 = *(s32 *)r15;
    if ((r0 & 64) != 0) {
        r3 = &gfsTrn_Request;
        r5 = 0;
        (*r3)() slot(r4 = r13);
        r2 = &gfsTrn_SetBuf;
        r7 = 1;
        r6 = 0;
        r5 = r6;
        (*r2)() slot(r4 = r13);
        goto L0606B420;
        __nopool;
    }
    r4 = *(s32 *)(r13 + 52);
    if (r4) {
        r0 = r4;
        if (r0 != 6) goto L0606B420;
    }
    r2 = &gfsTrn_Request;
    r5 = r12;
    (*r2)() slot(r4 = r13);
    r6 = *(s32 *)(r15 + 12);
    r7 = 1;
    r5 = *(s32 *)(r15 + 8);
    r3 = &gfsTrn_SetBuf;
    (*r3)() slot(r4 = r13);
    r2 = &gfsTrn_Activate;
    (*r2)() slot(r4 = r13);
    r11 = 1;
L0606B420:
    if (!r11) {
        goto L0606B430 slot(r4 = -16);
        __nopool;
    }
    __bsr gfs_AddSvr() slot(r4 = r14);
    *(s32 *)(r14 + 8) = r9;
    r4 = 0;
L0606B430:
    __bsr gfs_SetErr();
    r15 += 20;
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

void GFS_NwCdRead(void)
{
    push(r14);
    r14 = r4;
    push(r13);
    T = !r14;
    push(r8);
    push(pr);
    r15 += -8;
    *(s32 *)r15 = r5;
    if (T) {
        goto L0606B48A slot(r4 = -11);
    }
    r13 = r14;
    r13 += 12;
    *(s32 *)(r15 + 4) = r13;
    r1 = *(s32 *)(r14 + 4);
    if (!r1) goto L0606B496;
    r4 = -16;
L0606B48A:
    r15 += 8;
    pop(pr);
    pop(r8);
    pop(r13);
    goto gfs_SetErr slot(pop(r14));
L0606B496:
    r2 = *(s32 *)(r15 + 4);
    r8 = *(s32 *)(r2 + 20);
    __bsr GFS_Tell() slot(r4 = r14);
    r4 = r8;
    r3 = *(s32 *)r15;
    r4 -= r0;
    if (!(r4 >= r3)) {
        goto L0606B4AE slot(r5 = r4);
    }
    r5 = *(s32 *)r15;
L0606B4AE:
    __bsr gfs_SetupFlow() slot(r4 = r13);
    r3 = 2;
    *(s32 *)(r14 + 4) = r3;
    r2 = 1;
    *(s32 *)(r14 + 8) = r2;
    __bsr gfs_AddSvr() slot(r4 = r14);
    r4 = 0;
    r15 += 8;
    pop(pr);
    pop(r8);
    pop(r13);
    goto gfs_SetErr slot(pop(r14));
    __data {
        u8 0x7F, 0x08, 0x4F, 0x26, 0x68, 0xF6, 0x6D, 0xF6, 0x00, 0x0B, 0x6E, 0xF6;
    }
}

void GFS_NwIsComplete(void)
{
    push(pr);
    r1 = r4;
    r15 += -4;
    T = !r1;
    *(s32 *)r15 = r4;
    if (T) {
        __bsr gfs_SetErr() slot(r4 = -11);
        r15 += 4;
        pop(pr);
        return slot(r0 = 1);
    }
    __bsr gfs_SetErr() slot(r4 = 0);
    r4 = r0;
    if (r4 < 0) {
        r15 += 4;
        pop(pr);
        return slot(r0 = 1);
    }
    r0 = *(s32 *)r15;
    r1 = *(s32 *)(r0 + 8);
    if (!r1) {
        r15 += 4;
        pop(pr);
        return slot(r0 = 1);
    }
    r0 = 0;
    r15 += 4;
    pop(pr);
    return;
}

void GFS_NwStop(void)
{
    push(r14);
    r14 = r4;
    push(r13);
    T = !r14;
    push(pr);
    r15 += -4;
    if (T) {
        r4 = -11;
        r15 += 4;
        pop(pr);
        pop(r13);
        goto gfs_SetErr slot(pop(r14));
    }
    r13 = 0;
    *(s32 *)(r14 + 4) = r13;
    *(s32 *)(r14 + 8) = r13;
    __bsr gfs_DelSvr() slot(r4 = r14);
    __bsr gfs_GetGmode() slot(r4 = r14);
    if (!r0) slot(r4 = r14) {
        goto L0606B550 slot(r5 = r13);
    }
    r5 = 1;
L0606B550:
    __bsr gfs_StopIn();
    __bsr GFS_Tell() slot(r4 = r14);
    *(s32 *)r15 = r0;
    __bsr gfs_SetErr() slot(r4 = 0);
    r4 = r0;
    if (r4 < 0) {
        goto L0606B56A slot(r0 = r4);
    }
    r0 = *(s32 *)r15;
L0606B56A:
    r15 += 4;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
}

void GFS_NwGetStat(void)
{
    push(r14);
    r14 = r4;
    push(r13);
    T = !r14;
    push(pr);
    r15 += -8;
    if (T) slot(r13 = r6) {
        __bsr gfs_SetErr() slot(r4 = -11);
        goto L0606B5C8;
    }
    r3 = r14;
    r3 += 108;
    *(s32 *)(r15 + 4) = r3;
    r7 = 0;
    r2 = *(s32 *)(r14 + 4);
    r3 = r15;
    *(s32 *)r5 = r2;
    r6 = r7;
    push(r3);
    r5 = r7;
    __bsr GFS_GetFileInfo() slot(r4 = r14);
    r15 += 4;
    r0 = *(s32 *)r15;
    if ((r0 & 64) != 0) {
        r3 = 0;
        goto L0606B5C8 slot(*(s32 *)r13 = r3);
    }
    r0 = *(s32 *)(r14 + 4);
    if (r0 == 2) {
        r2 = &gfsAcc_CountSctAll;
        (*r2)() slot(r4 = r14);
        goto L0606B5C8 slot(*(s32 *)r13 = r0);
        __nopool;
    }
    r2 = *(s32 *)(r15 + 4);
    r3 = *(s32 *)(r2 + 8);
    *(s32 *)r13 = r3;
L0606B5C8:
    __bsr gfs_SetErr() slot(r4 = 0);
    r15 += 8;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_ChkCdStat(void)
{
    push(r14);
    push(pr);
    r14 = r4;
    r4 += 12;
    r5 = r4;
    r5 += 28;
    r0 = *(s32 *)r5;
    if (r0) goto L0606B5F8;
    r3 = &gfsFlow_PlayNoChg;
    (*r3)();
    if (r0 != 2) goto L0606B5F8 slot(r4 = r0);
    r3 = 1;
    *(s32 *)(r14 + 8) = r3;
L0606B5F8:
    r0 = *(s32 *)(r14 + 8);
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void GFS_NwExecOne(void)
{
    push(r14);
    r14 = r4;
    push(pr);
    T = !r14;
    r15 += -4;
    if (T) {
        __bsr gfs_SetErr() slot(r4 = -11);
        r15 += 4;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r0 = *(s32 *)(r14 + 8);
    if (!r0) goto L0606B6AE;
    r3 = &gfs_scu_dma_busy;
    r0 = *(s32 *)r3;
    if (r0 != 1) goto L0606B640;
    r5 = r15;
    r1 = &gfsTrn_Step;
    (*r1)() slot(r4 = r14);
    r3 = &gfs_scu_dma_busy;
    r0 = *(s32 *)r3;
    if (r0 != 1) goto L0606B640;
    r0 = *(s32 *)(r14 + 8);
    r15 += 4;
    pop(pr);
    return slot(pop(r14));
    __nopool;
L0606B640:
    r0 = *(s32 *)(r14 + 8);
    if (r0 == -1) {
        __bsr gfs_ChkCdStat() slot(r4 = r14);
        r15 += 4;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    __bsr gfs_ExecFlow() slot(r4 = r14);
    r4 = r0;
    if (r4 < 0) {
        r0 = r4;
        r15 += 4;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r0 = 92;
    r1 = *(s32 *)(r0 + r14);
    if (!r1) goto L0606B6AE;
    __bsr gfs_ExecTrans() slot(r4 = r14);
    if (r0 != 6) goto L0606B6AE slot(r4 = r0);
    __bsr gfs_ExecFlow() slot(r4 = r14);
    r4 = r0;
    if (r4 < 0) {
        r0 = r4;
        r15 += 4;
        pop(pr);
        return slot(pop(r14));
    }
    __bsr gfs_IsFlowEnd() slot(r4 = r14);
    if (!r0) goto L0606B6AE;
    r4 = 0;
    *(s32 *)(r14 + 4) = r4;
    *(s32 *)(r14 + 8) = r4;
    __bsr gfs_DelSvr() slot(r4 = r14);
L0606B6AE:
    __bsr gfs_SetErr() slot(r4 = 0);
    r4 = r0;
    if (r4 < 0) {
        r0 = r4;
        r15 += 4;
        pop(pr);
        return slot(pop(r14));
    }
    r0 = *(s32 *)(r14 + 8);
    r15 += 4;
    pop(pr);
    return slot(pop(r14));
}

void GFS_NwExecServer(void)
{
    push(r14);
    push(r13);
    push(r12);
    r12 = 0;
    push(pr);
    r15 += -4;
    r3 = &gfs_mng;
    *(s32 *)r15 = r4;
    r13 = *(s32 *)r3;
    r13 += 52;
    goto L0606B6FE slot(r14 = r12);
    __nopool;
L0606B6E4:
    r4 = r14;
    r4 <<= 2;
    r3 = r13;
    r4 += r3;
    __bsr GFS_NwExecOne() slot(r4 = *(s32 *)r4);
    r4 = r0;
    if (r4 < 0) goto L0606B706;
    if (!r4) {
        r14 += -1;
    }
    r14 += 1;
L0606B6FE:
    r0 = 96;
    r3 = *(s32 *)(r0 + r13);
    if (!(r14 >= r3)) goto L0606B6E4;
L0606B706:
    r0 = 96;
    r1 = *(s32 *)(r0 + r13);
    if (!r1) {
        r2 = *(s32 *)r15;
        *(s32 *)r2 = r12;
        goto L0606B728 slot(r4 = r12);
        __nopool;
    }
    r0 = r4;
    r2 = *(s32 *)r15;
    T = r0 == -20;
    r3 = *(s32 *)r13;
    *(s32 *)r2 = r3;
    if (!T) goto L0606B728;
    if (r14 <= 0) goto L0606B728;
    r4 = 1;
L0606B728:
    r0 = r4;
    r15 += 4;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void GFS_SetGmode(void)
{
    push(r14);
    push(pr);
    r14 = r4;
    r15 += -12;
    T = !r14;
    *(s32 *)(r15 + 4) = r5;
    if (T) {
        __bsr gfs_SetErr() slot(r4 = -11);
        r15 += 12;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r2 = r15;
    r7 = 0;
    push(r2);
    r6 = r7;
    r5 = r7;
    __bsr GFS_GetFileInfo() slot(r4 = r14);
    r15 += 4;
    r0 = *(s32 *)r15;
    if ((r0 & 64) != 0) {
        r0 = -17;
        r15 += 12;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r4 = r14;
    r4 += 12;
    r0 = 76;
    r3 = *(s32 *)(r0 + r4);
    *(s32 *)(r15 + 8) = r3;
    r0 = 76;
    r2 = *(s32 *)(r15 + 4);
    *(s32 *)(r0 + r4) = r2;
    __bsr gfs_SetErr() slot(r4 = 0);
    r4 = r0;
    if (r4 < 0) {
        r0 = r4;
        r15 += 12;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r0 = *(s32 *)(r15 + 8);
    r15 += 12;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void GFS_SetTmode(void)
{
    push(r14);
    push(pr);
    r14 = r4;
    r15 += -8;
    T = !r14;
    *(s32 *)(r15 + 4) = r5;
    if (T) {
        __bsr gfs_SetErr() slot(r4 = -11);
        r15 += 8;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r2 = r15;
    r7 = 0;
    push(r2);
    r6 = r7;
    r5 = r7;
    __bsr GFS_GetFileInfo() slot(r4 = r14);
    r15 += 4;
    r0 = *(s32 *)r15;
    if ((r0 & 64) != 0) {
        r0 = -17;
        r15 += 8;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r5 = *(s32 *)(r15 + 4);
    r4 = r14;
    r3 = &gfsTrn_SetMode;
    r4 += 12;
    r4 = r14;
    (*r3)() slot(r4 += 108);
    *(s32 *)(r15 + 4) = r0;
    __bsr gfs_SetErr() slot(r4 = 0);
    r4 = r0;
    if (r4 < 0) {
        r0 = r4;
        r15 += 8;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r0 = *(s32 *)(r15 + 4);
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void GFS_SetReadPara(void)
{
    push(r14);
    push(pr);
    r14 = r4;
    r15 += -12;
    T = !r14;
    *(s32 *)(r15 + 4) = r5;
    if (T) {
        __bsr gfs_SetErr() slot(r4 = -11);
        r15 += 12;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r2 = r15;
    r7 = 0;
    push(r2);
    r6 = r7;
    r5 = r7;
    __bsr GFS_GetFileInfo() slot(r4 = r14);
    r15 += 4;
    r0 = *(s32 *)r15;
    if ((r0 & 64) != 0) {
        r0 = -17;
        r15 += 12;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r4 = r14;
    r4 += 12;
    r0 = 92;
    r3 = *(s32 *)(r0 + r4);
    *(s32 *)(r15 + 8) = r3;
    r0 = 92;
    r2 = *(s32 *)(r15 + 4);
    *(s32 *)(r0 + r4) = r2;
    __bsr gfs_SetErr() slot(r4 = 0);
    r4 = r0;
    if (r4 < 0) {
        r0 = r4;
        r15 += 12;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r0 = *(s32 *)(r15 + 8);
    r15 += 12;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void GFS_SetTransPara(void)
{
    push(r14);
    push(pr);
    r14 = r4;
    r15 += -8;
    T = !r14;
    *(s32 *)(r15 + 4) = r5;
    if (T) {
        __bsr gfs_SetErr() slot(r4 = -11);
        r15 += 8;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r2 = r15;
    r7 = 0;
    push(r2);
    r6 = r7;
    r5 = r7;
    __bsr GFS_GetFileInfo() slot(r4 = r14);
    r15 += 4;
    r0 = *(s32 *)r15;
    if ((r0 & 64) != 0) {
        r0 = -17;
        r15 += 8;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r5 = *(s32 *)(r15 + 4);
    r4 = r14;
    r3 = &gfsTrn_SetTsize;
    (*r3)() slot(r4 += 108);
    *(s32 *)(r15 + 4) = r0;
    __bsr gfs_SetErr() slot(r4 = 0);
    r4 = r0;
    if (r4 < 0) {
        r0 = r4;
        r15 += 8;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r0 = *(s32 *)(r15 + 4);
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void GFS_SetTrFunc(void)
{
    push(r14);
    push(pr);
    r14 = r4;
    r15 += -4;
    T = !r14;
    *(s32 *)r15 = r5;
    if (T) {
        r4 = -11;
        r15 += 4;
        pop(pr);
        goto gfs_SetErr slot(pop(r14));
    }
    r7 = *(s16 *)&L0606B9F0;
    r5 = 0;
    r2 = *(s32 *)&L0606B9FC;
    r4 = r14;
    r6 = *(s32 *)&L0606B9F8;
    (*r2)() slot(r4 += 108);
    r5 = 4;
    r3 = *(s32 *)&L0606BA00;
    r4 = r14;
    (*r3)() slot(r4 += 108);
    r5 = *(s32 *)r15;
    r4 = r14;
    r3 = *(s32 *)&L0606BA04;
    r6 = r14;
    r15 += 4;
    pop(pr);
    return (*r3)() slot(pop(r14));
    __nopool;
}

void GFS_StartTrans(void)
{
    push(r14);
    T = !r4;
    push(r13);
    push(pr);
    r15 += -4;
    *(s32 *)r15 = r5;
    if (T) {
        __bsr gfs_SetErr() slot(r4 = -11);
        goto L0606B958 slot(r0 = 0);
        __nopool;
    }
    r5 = r4;
    r5 += 12;
    r13 = r5;
    r13 += 28;
    r0 = 120;
    r1 = *(s32 *)r13;
    if (!r1) slot(r14 = *(s32 *)(r0 + r4)) {
        r3 = *(s32 *)&L0606BA08;
        r5 = r13;
        (*r3)() slot(r4 = r14);
    }
    r2 = *(s32 *)r15;
    r3 = *(s32 *)(r14 + 4);
    *(s32 *)r2 = r3;
    r0 = *(s32 *)r14;
L0606B958:
    r15 += 4;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void GFS_CdMovePickup(void)
{
    push(r14);
    push(r13);
    r14 = r4;
    push(pr);
    if (!r14) {
        goto L0606B99C slot(r4 = -11);
        __nopool;
    }
    r13 = r14;
    r13 += 12;
    r4 = r13;
    r4 += 28;
    r0 = *(s32 *)r4;
    if (!r0) {
        __bsr GFS_Tell() slot(r4 = r14);
        r2 = *(s32 *)&L0606BA0C;
        r5 = r0;
        (*r2)() slot(r4 = r13);
        r4 = r0;
        if (r4) goto L0606B99C;
        r3 = *(s32 *)&L0606BA10;
        r0 = *(s16 *)&L0606B9F2;
        r2 = *(s32 *)r3;
        *(s32 *)(r0 + r2) = r14;
    }
    r4 = 0;
L0606B99C:
    pop(pr);
    pop(r13);
    goto gfs_SetErr slot(pop(r14));
    __nopool;
    __data {
        u8 0x4F, 0x26, 0x6D, 0xF6, 0x00, 0x0B, 0x6E, 0xF6;
    }
}

void GFS_SetErrFunc(void)
{
    r6 = *(s32 *)&L0606BA10;
    r3 = *(s32 *)r6;
    r0 = *(s16 *)&L0606B9F4;
    *(s32 *)(r0 + r3) = r4;
    r3 = *(s32 *)r6;
    r0 += 4;
    *(s32 *)(r0 + r3) = r5;
    goto gfs_SetErr slot(r4 = 0);
    __nopool;
}

void GFS_GetErrStat(void)
{
    r1 = r4;
    r0 = *(s16 *)&L0606B9F4;
    push(pr);
    r3 = *(s32 *)&L0606BA10;
    r2 = *(s32 *)r3;
    r3 = *(s32 *)&L0606BA14;
    r2 += r0;
    (*r3)() slot(r0 = 12);
    pop(pr);
    return;
    __nopool;
}

void gfs_ConvSesFad(void)
{
    r1 = *(s32 *)&L0606BA18;
    r0 = *(s8 *)r1;
    r0 = (u8)r0;
    T = r0 == 1;
    r0 = T;
    if (r0 == 1) {
        r3 = *(s32 *)&L0606BA1C;
        r2 = *(s8 *)r3;
        r2 = (u8)r2;
        r4 += r2;
    }
    return slot(r0 = r4);
    __data {
    L0606B9F0:
        u16 0x0800;
    L0606B9F2:
        u16 0x00A8;
    L0606B9F4:
        u16 0x00B8;
        u8 0x00, 0x00;
    L0606B9F8:
        u32 0x000FFFFF;
    L0606B9FC:
        u32 &gfsTrn_SetBuf;
    L0606BA00:
        u32 &gfsTrn_SetMode;
    L0606BA04:
        u32 &gfsTrn_SetFunc;
    L0606BA08:
        u32 &gfcf_StartTrans;
    L0606BA0C:
        u32 &gfsFlow_Seek;
    L0606BA10:
        u32 &gfs_mng;
    L0606BA14:
        u32 &_quick_odd_mvn;
    L0606BA18:
        u32 &BIOS_WORK_HI + 0x8CC;
    L0606BA1C:
        u32 &BIOS_WORK_HI + 0x8CD;
    }
}

void gfs_ReadRootDir(void)
{
    push(r14);
    push(r13);
    push(pr);
    r3 = &BIOS_WORK_HI + 0x8CC;
    r0 = *(s8 *)r3;
    r0 = (u8)r0;
    T = r0 == 1;
    r0 = T;
    if (r0 == 1) slot(r14 = r4) {
        if (r14) {
            r2 = &gfcd_Reserve;
            (*r2)() slot(r4 = 1);
        }
        r3 = &gfs_CdChgRootDir;
        (*r3)();
        r4 = r0;
        if (r4 < 0) {
            pop(pr);
            r4 = -7;
            pop(r13);
            goto gfs_SetErr slot(pop(r14));
            __nopool;
        }
        r13 = 0;
        r3 = &gfs_mng;
        r4 = *(s32 *)r3;
        r2 = 0x0098;
        r4 += r2;
        *(s32 *)(r4 + 8) = r13;
        *(s32 *)(r4 + 12) = r13;
        *(s32 *)(r4 + 4) = r13;
        __bsr GFS_SetDir() slot(r4 = r13);
        if (r14) {
            r3 = &gfcd_Reserve;
            (*r3)() slot(r4 = 0);
        }
        r2 = &BIOS_WORK_HI + 0x8CE;
        r4 = *(s16 *)r2;
        r4 = (u16)r4;
        __bsr GFS_LoadDir() slot(r5 = r14);
        goto L0606BAAA slot(r13 = r0);
        __nopool;
    }
    if (!r14) {
        r2 = &gfs_CdChgRootDir;
        (*r2)();
        r13 = r0;
        if (r13 >= 0) goto L0606BAAA;
        goto L0606BAA2 slot(r4 = -7);
        __nopool;
    }
    __bsr gfs_LoadRootDir() slot(r4 = r14);
    r13 = r0;
    if (r13 > 0) goto L0606BAAA;
    r4 = r13;
L0606BAA2:
    pop(pr);
    pop(r13);
    goto gfs_SetErr slot(pop(r14));
    __nopool;
L0606BAAA:
    __bsr GFS_SetDir() slot(r4 = r14);
    __bsr gfs_SetErr() slot(r4 = 0);
    r0 = r13;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_TrFuncNull(void)
{
    return slot(r0 = 0);
    __nopool;
}

void gfs_InitFuncTbl(void)
{
    r3 = &gfs_mng;
    r4 = *(s32 *)r3;
    r2 = &gfsFlow_Read;
    r4 += 4;
    r1 = &gfsFlow_StopRead;
    *(s32 *)r4 = r2;
    *(s32 *)(r4 + 4) = r1;
    r2 = &gfsFlow_SetSctPos;
    r1 = &gfsFlow_GetSctPos;
    *(s32 *)(r4 + 8) = r2;
    return slot(*(s32 *)(r4 + 12) = r1);
}

void gfs_InitMng(void)
{
    push(r14);
    push(r13);
    push(pr);
    r13 = r4;
    r14 = &gfs_mng;
    r3 = *(s32 *)r14;
    __bsr gfs_InitFuncTbl() slot(*(s32 *)r3 = r4);
    r3 = *(s32 *)r14;
    r4 = 0;
    r0 = 0x0094;
    T = r4 >= r13;
    *(s32 *)(r0 + r3) = r4;
    r0 += 32;
    r3 = *(s32 *)r14;
    r2 = r3;
    *(s32 *)(r0 + r2) = r4;
    r0 += -12;
    *(s32 *)(r0 + r3) = r4;
    r0 += 8;
    r3 = *(s32 *)r14;
    r2 = r3;
    *(s32 *)(r0 + r2) = r4;
    r0 += -4;
    *(s32 *)(r0 + r3) = r4;
    r0 += 12;
    r3 = *(s32 *)r14;
    *(s32 *)(r0 + r3) = r4;
    r3 = *(s32 *)r14;
    r0 += 12;
    *(s32 *)(r0 + r3) = r4;
    r5 = *(s32 *)r14;
    r3 = 0x0C60;
    r5 += r3;
    if (!T) slot(r6 = r4) {
        do {
            *(s32 *)r5 = r4;
            r6 += 1;
            r3 = 0x00A8;
        } while (!(r6 >= r13)) slot(r5 += r3);
    }
    r5 = *(s32 *)r14;
    r3 = 0x0438;
    r2 = 0x044C;
    r5 += r3;
    *(s32 *)r5 = r4;
    *(s32 *)(r5 + 12) = r4;
    *(s32 *)(r5 + 8) = r4;
    *(s32 *)(r5 + 4) = r4;
    *(s32 *)(r5 + 16) = r4;
    r5 = *(s32 *)r14;
    r5 += r2;
    *(s32 *)r5 = r4;
    *(s32 *)(r5 + 12) = r4;
    *(s32 *)(r5 + 8) = r4;
    *(s32 *)(r5 + 4) = r4;
    *(s32 *)(r5 + 16) = r4;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_CountFiles(void)
{
    push(r14);
    push(r13);
    push(r12);
    r13 = r4;
    push(r11);
    r12 = 1;
    push(r10);
    push(pr);
    r10 = &gfs_DirNameAtr;
    r11 = &gfs_DirIdAtr;
    goto L0606BBBA slot(r14 = 0);
    __nopool;
L0606BB94:
    r0 = *(s32 *)r13;
    if (!r0) {
        r5 = *(s32 *)(r13 + 8);
        (*r11)() slot(r4 = r14);
        goto L0606BBAA;
        __nopool;
    }
    r5 = *(s32 *)(r13 + 8);
    (*r10)() slot(r4 = r14);
L0606BBAA:
    r4 = r0;
    if ((r4 & r12) == 0) goto L0606BBB8;
    if (!r12) goto L0606BBB8;
    goto L0606BBC0;
    __nopool;
L0606BBB8:
    r14 += 1;
L0606BBBA:
    r3 = *(s32 *)(r13 + 4);
    if (!(r14 >= r3)) goto L0606BB94;
L0606BBC0:
    r1 = *(s32 *)(r13 + 4);
    if (r14 > r1) {
        goto L0606BBCE slot(r0 = 0);
        __nopool;
    }
    r0 = r14;
    r0 += 1;
L0606BBCE:
    pop(pr);
    pop(r10);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_AllocHn(void)
{
    r3 = &gfs_mng;
    r7 = 0;
    r4 = 0x0C60;
    r6 = *(s32 *)r3;
    r4 += r6;
    goto L0606BBF6 slot(r5 = r7);
    __nopool;
L0606BBEA:
    r0 = *(s32 *)r4;
    if (!r0) goto L0606BBFC;
    r2 = 0x00A8;
    r5 += 1;
    r4 += r2;
L0606BBF6:
    r3 = *(s32 *)r6;
    if (!(r5 >= r3)) goto L0606BBEA;
L0606BBFC:
    r1 = *(s32 *)r6;
    if (r5 == r1) {
        goto L0606BC0A slot(r4 = r7);
        __nopool;
    }
    r3 = 1;
    *(s32 *)r4 = r3;
L0606BC0A:
    return slot(r0 = r4);
    __nopool;
}

void gfs_FreeHn(void)
{
    r3 = 0;
    return slot(*(s32 *)r4 = r3);
}

void gfs_StopIn(void)
{
    push(r14);
    push(r13);
    push(r12);
    r13 = r4;
    r0 = 0x00B4;
    r14 = r13;
    push(r11);
    r14 += 12;
    push(pr);
    r15 += -8;
    r11 = &gfs_mng;
    *(s32 *)r15 = r5;
    r4 = *(s32 *)r11;
    r3 = *(s32 *)(r0 + r4);
    if (r3 == r13) slot(r12 = 0) {
        r5 = -1;
        r3 = &gfsTrn_Stop;
        r0 = 0x00B4;
        *(s32 *)(r0 + r4) = r12;
        (*r3)() slot(r4 = r13);
    }
    r5 = *(s32 *)r11;
    r0 = 0x00A8;
    r5 = *(s32 *)(r0 + r5);
    if (r5 != r13) slot(r4 = *(s32 *)(r14 + 28)) {
        if (!r4) goto L0606BC92;
        if (r5) goto L0606BC92;
    }
    r4 <<= 2;
    r3 = *(s32 *)r11;
    r4 <<= 2;
    r0 = 0x00A8;
    *(s32 *)(r0 + r3) = r12;
    r2 = *(s32 *)r11;
    r2 += 4;
    r4 += r2;
    r3 = r4;
    *(s32 *)(r15 + 4) = r4;
    r2 = *(s32 *)(r3 + 4);
    r5 = *(s32 *)r15;
    (*r2)() slot(r4 = r14);
    r0 = 80;
    *(s32 *)(r0 + r14) = r12;
    r0 = 88;
    *(s32 *)(r0 + r14) = r12;
L0606BC92:
    r15 += 8;
    pop(pr);
    pop(r11);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_SetErr(void)
{
    push(r14);
    push(r13);
    push(pr);
    r3 = &gfcd_err;
    r0 = *(s32 *)r3;
    if (r0 != -16) slot(r14 = r4) {
        if (r0 != -14) {
            if (r0 != -13) {
                if (r0 == 0) goto L0606BCCA;
                goto L0606BCCA;
                __nopool;
            }
            goto L0606BCCA slot(r14 = -23);
            __nopool;
        }
        goto L0606BCCA slot(r14 = -2);
        __nopool;
    }
    r14 = -25;
L0606BCCA:
    T = !r14;
    r3 = &gfs_mng;
    r13 = *(s32 *)r3;
    r2 = 0x00B8;
    r13 += r2;
    if (T) goto L0606BCE6 slot(*(s32 *)(r13 + 8) = r14);
    r1 = *(s32 *)r13;
    if (!r1) goto L0606BCE6;
    r5 = r14;
    r3 = *(s32 *)r13;
    (*r3)() slot(r4 = *(s32 *)(r13 + 4));
L0606BCE6:
    r0 = r14;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_FindSvr(void)
{
    r3 = &gfs_mng;
    r6 = *(s32 *)r3;
    r6 += 52;
    goto L0606BD0A slot(r5 = 0);
    __nopool;
L0606BCFA:
    r3 = r5;
    r3 <<= 2;
    r2 = r6;
    r3 += r2;
    r1 = *(s32 *)r3;
    if (r4 == r1) goto L0606BD12;
    r5 += 1;
L0606BD0A:
    r0 = 96;
    r3 = *(s32 *)(r0 + r6);
    if (!(r5 >= r3)) goto L0606BCFA;
L0606BD12:
    r0 = 96;
    r1 = *(s32 *)(r0 + r6);
    if (r5 == r1) {
        r5 = -1;
    }
    return slot(r0 = r5);
}

void gfs_AddSvr(void)
{
    push(pr);
    r15 += -4;
    *(s32 *)r15 = r4;
    __bsr gfs_FindSvr();
    if (r0 == -1) slot(r4 = r0) {
        r3 = &gfs_mng;
        r0 = 96;
        r4 = *(s32 *)r3;
        r4 += 52;
        r2 = *(s32 *)(r0 + r4);
        r1 = r4;
        r2 <<= 2;
        r2 += r1;
        r1 = *(s32 *)r15;
        r0 = 96;
        *(s32 *)r2 = r1;
        r2 = *(s32 *)(r0 + r4);
        r2 += 1;
        *(s32 *)(r0 + r4) = r2;
    }
    r15 += 4;
    pop(pr);
    return;
    __nopool;
}

void gfs_DelSvr(void)
{
    push(pr);
    if (!r4) goto L0606BDAE;
    __bsr gfs_FindSvr();
    if (r0 == -1) goto L0606BDAE slot(r4 = r0);
    r3 = &gfs_mng;
    r0 = 96;
    r5 = *(s32 *)r3;
    r5 += 52;
    r2 = *(s32 *)(r0 + r5);
    r2 += -1;
    *(s32 *)(r0 + r5) = r2;
    r6 = r2;
    if (!(r4 >= r6)) {
        do {
            r7 = r5;
            r3 = r4;
            r3 <<= 2;
            r3 += r7;
            r0 = r4;
            r0 += 1;
            r0 <<= 2;
            r4 += 1;
            r2 = *(s32 *)(r0 + r7);
            T = r4 >= r6;
            *(s32 *)r3 = r2;
        } while (!T);
    }
    r4 <<= 2;
    r2 = r5;
    r4 += r2;
    r3 = 0;
    *(s32 *)r4 = r3;
L0606BDAE:
    pop(pr);
    return;
    __nopool;
}

void gfs_InitHn(void)
{
    push(r14);
    r14 = r4;
    push(pr);
    T = !r14;
    r15 += -8;
    *(s32 *)r15 = r5;
    *(s32 *)(r15 + 4) = r6;
    if (T) {
        r0 = 0;
        r15 += 8;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r4 = r14;
    r3 = &gfsTrn_Init;
    (*r3)() slot(r4 += 108);
    r4 = r14;
    r3 = &gfsFlow_Init;
    r6 = *(s32 *)(r15 + 4);
    r5 = *(s32 *)r15;
    (*r3)() slot(r4 += 12);
    r4 = r0;
    if (!r4) {
        r0 = 0;
        r15 += 8;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r4 = 0;
    *(s32 *)(r14 + 4) = r4;
    r0 = r14;
    *(s32 *)(r14 + 8) = r4;
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void gfs_ReadPvd(void)
{
    push(r14);
    push(r13);
    push(r8);
    push(pr);
    r15 += -28;
    r2 = &gfcd_GetLastSesFad;
    r3 = r15;
    *(s32 *)r15 = r4;
    r3 += 16;
    (*r2)() slot(r8 = r3);
    r1 = 0x00A6;
    r3 = r15;
    r13 = 0x0800;
    r4 = 0;
    r0 += r1;
    r3 += 16;
    *(s32 *)r8 = r0;
    r2 = r15;
    *(s32 *)(r3 + 4) = r13;
    r0 = r4;
    r2 += 16;
    r3 = r15;
    *(s8 *)(r2 + 10) = r0;
    r3 += 16;
    *(s8 *)(r3 + 11) = r0;
    r3 = r15;
    r3 += 16;
    *(s8 *)(r3 + 8) = r0;
    r3 = r15;
    r3 += 16;
    *(s8 *)(r3 + 9) = r0;
    __bsr gfs_AllocHn();
    r4 = r0;
    r5 = r15;
    r5 += 16;
    __bsr gfs_InitHn() slot(r6 = 0);
    r14 = r0;
    if (!r14) {
        goto L0606BEAC slot(r0 = -1);
    }
    r6 = *(s32 *)r15;
    r5 = 1;
    r7 = r13;
    __bsr GFS_Fread() slot(r4 = r14);
    r4 = r0;
    if (r4 != r13) {
        goto L0606BEAC slot(r0 = -1);
    }
    r4 = r15;
    r4 += 4;
    __bsr GFS_GetErrStat();
    r13 = r15;
    r13 += 4;
    r13 = *(s32 *)(r13 + 8);
    if (r13) goto L0606BEA6;
    r5 = &gfs_iso_vd_id;
    r4 = *(s32 *)r15;
    r3 = &memcmp;
    (*r3)() slot(r6 = 6);
    if (!r0) goto L0606BEA6;
    r13 = -3;
L0606BEA6:
    __bsr GFS_Close() slot(r4 = r14);
    r0 = r13;
L0606BEAC:
    r15 += 28;
    pop(pr);
    pop(r8);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_GetRootRec(void)
{
    push(r14);
    push(r13);
    push(pr);
    r15 += -4;
    r3 = &gfs_mng;
    r13 = *(s32 *)r3;
    r0 = 0x00C4;
    r0 = *(s32 *)(r0 + r13);
    if ((r0 & 1) == 0) slot(r14 = r4) {
        goto L0606BF4A slot(r0 = -2);
        __nopool;
    }
    r4 = 0x0460;
    __bsr gfs_ReadPvd() slot(r4 += r13);
    r4 = r0;
    if (r4) {
        goto L0606BF4A slot(r0 = r4);
        __nopool;
    }
    r6 = 4;
    r3 = &gfs_mng;
    r13 = *(s32 *)r3;
    r2 = 0x009C;
    r1 = 0x0460;
    r3 = &memmove;
    r13 += r1;
    r13 += r2;
    r5 = r13;
    r5 += 6;
    (*r3)() slot(r4 = r14);
    r3 = 0x0096;
    r2 = *(s32 *)r14;
    r2 += r3;
    *(s32 *)r14 = r2;
    r0 = r2;
    r1 = 0x00A6;
    if (!(r0 >= r1)) {
        goto L0606BF4A slot(r0 = -3);
        __nopool;
    }
    r6 = 4;
    r3 = &memmove;
    r5 = r13;
    r4 = r15;
    (*r3)() slot(r5 += 14);
    r2 = *(s32 *)r15;
    if (r2 <= 0) {
        goto L0606BF4A slot(r0 = -3);
        __nopool;
    }
    r4 = 0x0800;
    r3 = r4;
    r1 = *(s32 *)r15;
    r3 += -1;
    r2 = &_divlspnm;
    r1 += r3;
    (*r2)() slot(r0 = r4);
    macl = r0 * r4;
    r4 = 0;
    r0 = macl;
    *(s32 *)(r14 + 4) = r0;
    r0 = r4;
    *(s8 *)(r14 + 10) = r0;
    r0 = 0x0080;
    *(s8 *)(r14 + 11) = r0;
    r0 = r4;
    *(s8 *)(r14 + 8) = r0;
    *(s8 *)(r14 + 9) = r0;
L0606BF4A:
    r15 += 4;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_LoadRootDir(void)
{
    push(r14);
    push(r13);
    push(pr);
    r15 += -16;
    *(s32 *)r15 = r4;
    r4 = r15;
    r4 += 4;
    __bsr gfs_GetRootRec();
    r13 = r0;
    if (r13) {
        goto L0606BFA4 slot(r14 = 0);
    }
    __bsr gfs_AllocHn();
    r4 = r0;
    r5 = r15;
    r5 += 4;
    __bsr gfs_InitHn() slot(r6 = 0);
    r14 = r0;
L0606BFA4:
    r3 = &gfs_mng;
    r0 = *(s32 *)r3;
    r1 = 0x00C4;
    r0 = *(s32 *)(r0 + r1);
    if ((r0 & 1) == 0) goto L0606BFB8;
    if (r14) goto L0606BFB8;
    goto L0606BFD4 slot(r0 = r13);
    __nopool;
L0606BFB8:
    r5 = *(s32 *)r15;
    r6 = r15;
    r3 = &gfs_LoadDirTbl;
    r6 += 4;
    r6 = *(s32 *)(r6 + 4);
    (*r3)() slot(r4 = r14);
    T = !r14;
    *(s32 *)r15 = r0;
    if (!T) {
        r3 = &GFS_Close;
        (*r3)() slot(r4 = r14);
    }
    r0 = *(s32 *)r15;
L0606BFD4:
    r15 += 16;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_ExecFlow(void)
{
    r0 = 80;
    push(r14);
    push(r13);
    push(r12);
    r13 = r4;
    push(pr);
    r13 += 12;
    r15 += -4;
    r0 = *(s32 *)(r0 + r13);
    if (r0 == 4) slot(r12 = r4) {
        r0 = 80;
        goto L0606C06A slot(r0 = *(s32 *)(r0 + r13));
        __nopool;
    }
    r14 = &gfs_mng;
    r4 = *(s32 *)r14;
    r0 = 0x00A8;
    r5 = *(s32 *)(r0 + r4);
    if (!r5) goto L0606C010;
    if (r5 == r12) goto L0606C010;
    goto L0606C06A slot(r0 = 7);
    __nopool;
L0606C010:
    r2 = *(s32 *)(r13 + 28);
    r3 = r4;
    r2 <<= 2;
    r2 <<= 2;
    r3 += 4;
    r2 += r3;
    *(s32 *)r15 = r2;
    r3 = r2;
    r2 = *(s32 *)r3;
    (*r2)() slot(r4 = r13);
    if (r0 == 1) slot(r5 = r0) {
        r2 = *(s32 *)r14;
        r0 = 0x00A8;
        goto L0606C058 slot(*(s32 *)(r0 + r2) = r12);
        __nopool;
    }
    r0 = r5;
    if (r0 != 4) goto L0606C058;
    r3 = *(s32 *)r14;
    r0 = 0x00A8;
    r2 = *(s32 *)(r0 + r3);
    if (r2 != r12) goto L0606C058;
    r2 = *(s32 *)r14;
    r4 = 0;
    r0 = 0x00A8;
    *(s32 *)(r0 + r2) = r4;
    r3 = *(s32 *)r14;
    r0 += 8;
    r2 = r3;
    *(s32 *)(r0 + r2) = r4;
    r0 += -4;
    *(s32 *)(r0 + r3) = r4;
L0606C058:
    r0 = 80;
    r4 = r12;
    *(s32 *)(r0 + r13) = r5;
    r15 += 4;
    pop(pr);
    pop(r12);
    pop(r13);
    goto gfs_SetAstat slot(pop(r14));
    __nopool;
L0606C06A:
    r15 += 4;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_ExecTrans(void)
{
    push(r14);
    push(r13);
    r14 = r4;
    r0 = 0x00B4;
    push(pr);
    r13 = &gfs_mng;
    r15 += -8;
    r4 = *(s32 *)r13;
    r4 = *(s32 *)(r0 + r4);
    if (r4 == r14) goto L0606C0A8;
    if (!r4) goto L0606C0A8;
    goto L0606C110 slot(r0 = 1);
L0606C0A8:
    r3 = r15;
    r7 = 0;
    push(r3);
    r6 = r7;
    r5 = r7;
    __bsr GFS_GetFileInfo() slot(r4 = r14);
    r15 += 4;
    r0 = *(s32 *)r15;
    if ((r0 & 64) != 0) {
        goto L0606C110 slot(r0 = 6);
    }
    r4 = r14;
    r3 = &gfsTrn_GetFree;
    (*r3)() slot(r4 += 108);
    r4 = r0;
    if (!r4) {
        r3 = &gfsTrn_Skip;
        (*r3)() slot(r4 = r14);
        goto L0606C0E4;
        __nopool;
    }
    r5 = r15;
    r3 = &gfsTrn_Exec;
    r5 += 4;
    (*r3)() slot(r4 = r14);
L0606C0E4:
    if (r0 == 6) slot(r4 = r0) {
        r3 = *(s32 *)r13;
        r0 = 0x00B4;
        r2 = *(s32 *)(r0 + r3);
        if (r2 != r14) goto L0606C10E;
        r1 = *(s32 *)r13;
        r3 = 0;
        r0 = 0x00B4;
        goto L0606C10E slot(*(s32 *)(r0 + r1) = r3);
        __nopool;
    }
    r1 = *(s32 *)r13;
    r0 = 0x00B4;
    r0 = *(s32 *)(r0 + r1);
    if (r0) goto L0606C10E;
    r3 = *(s32 *)r13;
    r0 = 0x00B4;
    *(s32 *)(r0 + r3) = r14;
L0606C10E:
    r0 = r4;
L0606C110:
    r15 += 8;
    pop(pr);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void gfs_GetSctFad(void)
{
    push(pr);
    r3 = &GFS_GetDirInfo;
    r15 += -16;
    *(s32 *)r15 = r5;
    r5 = r15;
    r5 += 4;
    (*r3)();
    r4 = r0;
    if (r4 < 0) {
        r15 += 16;
        pop(pr);
        return slot(r0 = r4);
        __nopool;
    }
    r4 = r15;
    r4 += 4;
    r0 = *(s8 *)(r4 + 8);
    r4 = (u8)r0;
    if (!r4) {
        r3 = *(s32 *)r15;
        r0 = r15;
        r0 += 4;
        r0 = *(s32 *)r0;
        r15 += 16;
        pop(pr);
        return slot(r0 += r3);
        __nopool;
    }
    r1 = *(s32 *)r15;
    r3 = &_divlspnm;
    (*r3)() slot(r0 = r4);
    r3 = r0;
    r2 = r15;
    r2 += 4;
    r0 = *(s8 *)(r2 + 9);
    r0 = (u8)r0;
    r0 += r4;
    macl = r3 * r0;
    r0 = r15;
    r3 = macl;
    r0 += 4;
    r0 = *(s32 *)r0;
    r0 += r3;
    r15 += 16;
    pop(pr);
    return;
    __nopool;
}

void gfs_SetupFlow(void)
{
    push(r14);
    r14 = r4;
    push(pr);
    r4 += 28;
    r0 = *(s32 *)r4;
    if (!r0) {
        r3 = &gfsFlow_SetSct;
        (*r3)() slot(r4 = r14);
        goto L0606C19E;
        __nopool;
    }
    r0 = 84;
    r3 = 0;
    *(s32 *)(r0 + r14) = r5;
    r0 = 88;
    *(s32 *)(r0 + r14) = r3;
L0606C19E:
    r2 = 0;
    r0 = 80;
    *(s32 *)(r0 + r14) = r2;
    pop(pr);
    return slot(pop(r14));
}

void gfs_GetFinfo(void)
{
    if (r5) {
        r3 = *(s32 *)r4;
        *(s32 *)r5 = r3;
    }
    if (r6) {
        r2 = *(s32 *)(r4 + 4);
        *(s32 *)r6 = r2;
    }
    if (r7) {
        r3 = *(s32 *)(r4 + 16);
        *(s32 *)r7 = r3;
    }
    r0 = *(s32 *)r15;
    if (r0) {
        r2 = *(s32 *)r15;
        r3 = *(s32 *)(r4 + 20);
        *(s32 *)r2 = r3;
    }
    r0 = *(s32 *)(r15 + 4);
    if (r0) {
        r2 = *(s32 *)(r15 + 4);
        r3 = *(s32 *)(r4 + 24);
        r1 = *(s32 *)(r4 + 16);
        r1 -= r3;
        *(s32 *)r2 = r1;
    }
    r0 = *(s32 *)(r15 + 8);
    if (r0) {
        r3 = *(s32 *)(r15 + 8);
        r0 = *(s8 *)(r4 + 14);
        r0 = (u8)r0;
        *(s32 *)r3 = r0;
    }
    r1 = *(s32 *)(r15 + 12);
    if (r1) {
        r3 = *(s32 *)(r15 + 12);
        r0 = *(s8 *)(r4 + 15);
        r0 = (u8)r0;
        *(s32 *)r3 = r0;
    }
    return;
}

void gfs_CloseHn(void)
{
    push(r14);
    r14 = r4;
    push(pr);
    T = !r14;
    r15 += -4;
    if (!T) {
        r4 = r14;
        r4 += 12;
        r3 = r4;
        r3 += 28;
        *(s32 *)r15 = r3;
        __bsr gfs_DelSvr() slot(r4 = r14);
        __bsr gfs_FreeHn() slot(r4 = r14);
        r4 = *(s32 *)r15;
        r3 = &gfcf_Close;
        r15 += 4;
        pop(pr);
        return (*r3)() slot(pop(r14));
        __nopool;
    }
    r15 += 4;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void gfs_GetGmode(void)
{
    r4 += 12;
    r0 = 76;
    return slot(r0 = *(s32 *)(r0 + r4));
    __nopool;
}

void gfs_IsFlowEnd(void)
{
    r3 = r4;
    r1 = &GFS_GetFileInfo;
    r7 = 0;
    push(r14);
    r3 += 12;
    push(pr);
    r14 = r4;
    r15 += -8;
    r2 = r15;
    *(s32 *)(r15 + 4) = r3;
    r6 = r7;
    push(r2);
    r5 = r7;
    (*r1)() slot(r4 = r14);
    r15 += 4;
    r1 = 80;
    r0 = *(s32 *)(r15 + 4);
    r0 = *(s32 *)(r0 + r1);
    if (r0 != 4) goto L0606C296;
    r2 = &gfsAcc_CountSctAll;
    (*r2)() slot(r4 = r14);
    if (r0) {
        r0 = *(s32 *)r15;
        if ((r0 & 64) == 0) goto L0606C296;
    }
    r0 = 1;
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
L0606C296:
    r0 = 0;
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void gfs_SetAstat(void)
{
    push(r14);
    r0 = r5;
    push(pr);
    if (r0 == 3) goto L0606C2EC slot(r14 = r4);
    if (r0 != 5) {
        if (r0 == 6) goto L0606C2DC;
        if (r0 == 7) goto L0606C2E4;
        if (r0 != 8) {
            if (r0 != 9) {
                goto L0606C300;
                __nopool;
            }
            r3 = -25;
            *(s32 *)(r14 + 8) = r3;
            goto L0606C2FA slot(r4 = r3);
            __nopool;
        }
        r3 = -1;
        *(s32 *)(r14 + 8) = r3;
        goto L0606C2FA slot(r4 = r3);
        __nopool;
    }
    r3 = -23;
    *(s32 *)(r14 + 8) = r3;
    goto L0606C2FA slot(r4 = r3);
    __nopool;
L0606C2DC:
    r3 = -2;
    *(s32 *)(r14 + 8) = r3;
    goto L0606C2FA slot(r4 = r3);
    __nopool;
L0606C2E4:
    r3 = -20;
    *(s32 *)(r14 + 8) = r3;
    goto L0606C2FA slot(r4 = r3);
    __nopool;
L0606C2EC:
    __bsr gfs_GetGmode() slot(r4 = r14);
    if (r0 != 1) goto L0606C304;
    r3 = -24;
    r4 = -24;
    *(s32 *)(r14 + 8) = r3;
L0606C2FA:
    pop(pr);
    goto gfs_SetErr slot(pop(r14));
    __nopool;
L0606C300:
    r2 = 1;
    *(s32 *)(r14 + 8) = r2;
L0606C304:
    r0 = 0;
    pop(pr);
    return slot(pop(r14));
}

