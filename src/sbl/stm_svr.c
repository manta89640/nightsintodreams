/* shc-flags: -define=NONMATCHING */
#include "sbl/types.h"
#include "sbl/stm_svr.h"

/*
 * Stream server: execution groups, loops and the round-robin over a group's
 * streams that STM_ExecServer runs every call.
 *
 * None of this matches yet. The control flow is the same as the original's, but
 * the code was built with a compiler that differs from SHC 5.0 in register choice
 * (r0/r1 before r3/r2), prologue scheduling, delay-slot filling, tail merging of
 * identical `return` blocks and movt, so every function is under NONMATCHING.
 */

extern StmMng *D_06070C6C;
extern StmReq D_06070C70;
extern Sint32 D_06070C80;

extern void func_060693BA(Sint32 fno);
extern void func_060693C2(Sint32 err);
extern Sint32 func_060693D8(void);
extern void func_0606942E(void);
extern Sint32 func_0606D1BA(Sint32 *fad, Sint32 *stat);
extern Sint32 func_0606A748(void);
extern void func_0606A768(StmKey *key, Sint32 *start, Sint32 *end);
extern Sint32 func_0606AABE(void);
extern Sint32 func_0606AA9A(StmKey *key);
extern Sint32 func_0606A83A(StmGrp *grp);
extern void func_0606DDB4(Sint32 n);
extern void func_0606F106(void *func, void *obj);
extern void func_0606C462(StmGfs *gfs, Sint32 n);
extern Sint32 func_06068756(StmGrp *grp);
extern Sint32 func_0606DD84(void);
extern void func_0606DEE6(Sint32 a, Sint32 b);
extern Sint32 func_0606E6DA(void);
extern void func_0606879C(Sint32 err);
extern void func_0606AF62(StmGfs *gfs, Sint32 a, Sint32 b);
extern void func_06070276(Stm *stm);
extern void func_06068B94(StmGrp *grp);
extern void func_06068A9E(Stm *stm);
extern Sint32 func_0606A8DE(StmGrp *grp, Sint32 fad);
extern Sint32 func_0606A7B8(StmGrp *grp);
extern Sint32 func_0606DF9E(Sint32 fid, Sint32 a, Sint32 b, Sint32 *out, Sint32 c);
extern Sint32 func_0606C336(StmGfs *gfs);
extern Sint32 func_0607036E(Stm *stm);
extern Sint32 func_0606CBC6(Sint32 *tr);
extern void func_0606C4FC(StmGfs *gfs, Sint32 *out);
extern void func_0606C406(Sint32 *tr, Sint32 n);
extern Sint32 func_0606C448(Sint32 *tr);
extern void func_0606C5DC(StmGfs *gfs, Sint32 *out);
extern Sint32 func_0606A89C(StmGrp *grp);

#ifdef NONMATCHING

Bool STM_GrpHasNoCdKey(StmGrp *grp);
Bool STM_GrpIsAllEnd(StmGrp *grp);
void STM_GrpCdCallback(StmGrp *grp);
void STM_CheckCdStat(Sint32 stat);
Sint32 STM_ChgExecGrp(StmGrp *grp);
Sint32 STM_ExecServer(void);

/* NONMATCHING: register choice and return-block merging */
Bool STM_GrpHasNoCdKey(StmGrp *grp)
{
    Stm *stm;

    if (grp->loop != NULL) {
        return FALSE;
    }
    for (stm = grp->head; stm != NULL; stm = stm->next) {
        if (((stm->key->unk1C == 0) ? TRUE : FALSE) == TRUE) {
            return FALSE;
        }
    }
    return TRUE;
}

/* NONMATCHING: register choice and return-block merging */
Bool STM_GrpIsAllEnd(StmGrp *grp)
{
    Stm *stm;

    if (grp->loop != NULL) {
        return FALSE;
    }
    if (grp->head2 != NULL) {
        return FALSE;
    }
    for (stm = grp->head; stm != NULL; stm = stm->next) {
        if ((stm->flags & 2) == 0) {
            return FALSE;
        }
    }
    return TRUE;
}

/* NONMATCHING: register choice and scheduling */
void STM_GrpCdCallback(StmGrp *grp)
{
    grp->flags |= 4;
    if (grp->func != NULL) {
        if (grp->unk1C == NULL) {
            if (func_0606AABE() < grp->unk20) {
                grp->flags |= 8;
            }
        } else {
            if (func_0606AA9A(grp->unk1C->key) >= grp->unk20) {
                grp->flags |= 8;
            }
        }
    }
}

/* NONMATCHING: register choice and scheduling */
void STM_CheckCdStat(Sint32 stat)
{
    Sint32 err;
    StmGrp *grp;

    err = 0;
    if (stat == 3) {
        err = -23;
    } else if (stat == 4) {
        grp = D_06070C6C->curgrp;
        if (grp == NULL || STM_GrpHasNoCdKey(grp) == FALSE) {
            err = -2;
        }
    } else if (stat == 6) {
        err = -25;
    } else if (stat == 5) {
        err = -1;
    }
    if (err != 0) {
        func_060693C2(err);
    }
}

/* NONMATCHING: register choice, scheduling and pool placement */
Sint32 STM_ChgExecGrp(StmGrp *grp)
{
    StmGrp *old;
    Stm *stm;
    Sint32 stat;
    Sint32 err;
    Sint32 st;
    Sint32 fad;
    Sint32 lim;
    Uint16 flags;

    if (D_06070C6C->curgrp == grp) {
        return TRUE;
    }
    old = D_06070C6C->curgrp;
    if (old != NULL) {
        stat = func_0606D1BA(&st, 0);
        STM_CheckCdStat(stat);
        flags = old->flags;
        if (((flags & 2) ? TRUE : FALSE) == TRUE && (flags & 16) == 0) {
            err = func_0606A83A(old);
            if (err != 0) {
                func_060693C2(err);
            }
            old->flags |= 16;
        }
        if (old->unk34 >= 0) {
            func_0606DDB4(old->unk34);
            old->unk34 = -1;
            func_0606F106(0, 0);
        }
        if (old->stat != STM_EXEC_COMPLETED) {
            old->stat = STM_EXEC_DOING;
        }
        /* The old group can only be left once the drive has stopped. */
        if (stat == 0) {
            stm = old->cur;
            if (stm != NULL) {
                func_0606C462(stm->gfs, -1);
                stm->gfs->unkA0 = 0;
            }
            if (((old->flags & 16) ? TRUE : FALSE) == TRUE) {
                lim = func_06068756(old);
                fad = func_0606A748();
                if (old->fad <= lim) {
                    old->fad = fad;
                }
            }
            old->flags &= 0xFFC9;
            old = NULL;
        }
    }
    if (old != NULL) {
        return FALSE;
    }
    if (grp != NULL) {
        if (grp->unk34 < 0) {
            st = func_0606DD84();
            if (st >= 0) {
                grp->unk34 = st;
            }
            func_0606F106(STM_GrpCdCallback, grp);
        }
        if (grp->unk34 >= 0) {
            func_0606DEE6((grp->head2 != NULL) ? grp->head2->key->unk28 : 0xFF, grp->unk34);
            err = func_0606E6DA();
            if (err != 0) {
                func_0606879C(err);
            }
            grp->flags &= 0xFFD9;
        } else {
            func_060693C2(-20);
        }
    }
    D_06070C6C->curgrp = grp;
    return TRUE;
}

/* NONMATCHING: scheduling */
/* Queues the group change; STM_ExecServer runs it until it succeeds. */
Bool STM_ReqExecGrp(StmGrp *grp)
{
    if (D_06070C70.func != NULL) {
        return FALSE;
    }
    func_060693BA(0x329);
    D_06070C70.func = (Sint32 (*)(void *))STM_ChgExecGrp;
    D_06070C70.obj = grp;
    func_060693D8();
    return TRUE;
}

/* NONMATCHING: scheduling */
Bool STM_SetExecGrpWait(StmGrp *grp)
{
    Bool ret;

    ret = STM_ReqExecGrp(grp);
    if (ret == FALSE) {
        return FALSE;
    }
    while (STM_ExecServer() != STM_EXEC_TSKEND) {
    }
    return TRUE;
}

/* NONMATCHING: register choice */
Bool STM_IsGfsActive(Stm *stm)
{
    Bool ret;

    if (stm->gfs->unk78 != 0) {
        ret = TRUE;
    } else {
        ret = FALSE;
    }
    return ret;
}

/* NONMATCHING: scheduling and pool placement */
Bool STM_IsStmActive(Stm *hn)
{
    Bool ret;

    func_060693BA(0x328);
    if (hn == NULL) {
        func_060693C2(-11);
        func_0606942E();
        return FALSE;
    }
    ret = STM_IsGfsActive(hn->stm);
    func_060693D8();
    return ret;
}

/* NONMATCHING: prologue scheduling */
void STM_GrpClearReached(StmGrp *grp)
{
    Stm *stm;
    Sint32 fad;
    Sint32 start;
    Sint32 end;

    fad = grp->fad;
    for (stm = grp->head; stm != NULL; stm = stm->next) {
        func_0606A768(stm->key, &start, &end);
        if (start > fad) {
            stm->gfs->unk08 = 0;
            stm->flags &= 0xFE;
        }
    }
}

/* NONMATCHING: pool placement */
void STM_GrpResetStms(StmGrp *grp)
{
    Stm *stm;

    for (stm = grp->head; stm != NULL; stm = stm->next) {
        func_0606AF62(stm->gfs, 0, 0);
        func_06070276(stm);
    }
}

/* NONMATCHING: register choice and pool placement */
void STM_GrpClearEndFlags(StmGrp *grp)
{
    Stm *stm;

    for (stm = grp->head; stm != NULL; stm = stm->next) {
        stm->flags &= 0xEF;
        stm->flags &= 0xDF;
        if (((stm->flags & 2) ? TRUE : FALSE) == TRUE) {
            func_0606AF62(stm->gfs, 0, 0);
        }
    }
}

/* NONMATCHING: register choice and scheduling */
/* lstm == -1 restarts the loop at the first stream not yet finished. */
static Bool STM_SetLoopSub(StmGrp *grp, Stm *lstm, Sint32 lpmax)
{
    Bool ret;
    Stm *stm;

    ret = TRUE;
    if (grp->stat == STM_EXEC_COMPLETED) {
        STM_GrpResetStms(grp);
        STM_GrpClearEndFlags(grp);
    }
    if (lstm == (Stm *)-1) {
        for (stm = grp->head; stm != NULL; stm = stm->next) {
            if ((stm->flags & 8) == 0 && (stm->flags & 2) == 0) {
                break;
            }
        }
        grp->loop = stm;
        grp->flags &= 0xFFFE;
    } else if (lstm != NULL && (lstm->flags & 2) != 0) {
        ret = FALSE;
    } else {
        if (lstm != NULL) {
            lstm = lstm->stm;
        }
        grp->loop = lstm;
        grp->flags |= 1;
    }
    grp->lpmax = lpmax;
    grp->lpcnt = 0;
    return ret;
}

/* NONMATCHING: scheduling and pool placement */
Bool STM_SetLoop(StmGrp *grp, Stm *lstm, Sint32 lpmax)
{
    Bool ret;

    func_060693BA(0x332);
    if (grp == NULL) {
        func_060693C2(-11);
        func_0606942E();
        return FALSE;
    }
    if (lpmax < 0) {
        func_060693C2(-14);
        func_0606942E();
        return FALSE;
    }
    ret = STM_SetLoopSub(grp, lstm, lpmax);
    func_060693D8();
    return ret;
}

/* NONMATCHING: register choice and scheduling */
void STM_GrpMarkReached(StmGrp *grp)
{
    Stm *stm;
    Sint32 fad;
    Sint32 start;
    Sint32 end;

    fad = grp->fad;
    for (stm = grp->head; stm != NULL; stm = stm->next) {
        func_0606A768(stm->key, &start, &end);
        if ((start >= fad && (stm->flags & 8) == 0)
                || ((stm->flags & 2) ? TRUE : FALSE) == TRUE) {
            stm->flags |= 1;
            stm->gfs->unk08 = 1;
        }
    }
}

/* NONMATCHING: loop rotation and scheduling */
void STM_GrpCheckPassed(StmGrp *grp)
{
    Stm *stm;
    Sint32 fad;
    Sint32 lpcnt;
    Sint32 start;
    Sint32 end;

    fad = grp->fad;
    for (stm = grp->head2; stm != NULL; stm = stm->next2) {
        func_0606A768(stm->key, &start, &end);
        if (end < fad && ((stm->flags & 1) ? TRUE : FALSE) == TRUE
                && ((stm->flags & 4) ? TRUE : FALSE) == TRUE) {
            stm->flags |= 8;
            func_06068A9E(stm);
            if (grp->loop == stm) {
                lpcnt = grp->lpcnt;
                STM_SetLoopSub(grp, (Stm *)-1, grp->lpmax);
                grp->lpcnt = lpcnt;
            }
            if (grp->unk0C == stm) {
                func_06068B94(grp);
            }
        }
    }
}

/* NONMATCHING: loop rotation and delay-slot filling */
/* Start of the next stream after fad, or -1 if fad is inside one. */
static Sint32 STM_GrpNextStart(StmGrp *grp, Sint32 fad)
{
    Stm *stm;
    Sint32 start;
    Sint32 end;

    if (fad < grp->fad) {
        fad = grp->fad;
    }
    for (stm = grp->head; stm != NULL; stm = stm->next) {
        if ((stm->flags & 8) == 0) {
            func_0606A768(stm->key, &start, &end);
            if (start <= fad && end >= fad) {
                break;
            }
            if (start > fad) {
                return start;
            }
        }
    }
    return -1;
}

/* NONMATCHING: scheduling */
/* Not static: the original calls it instead of inlining it. */
Sint32 STM_GrpLoopStart(StmGrp *grp)
{
    Sint32 start;
    Sint32 end;

    func_0606A768(grp->loop->key, &start, &end);
    return start;
}

/* NONMATCHING: register choice and scheduling */
/* Decides where the pickup goes next: *pos gets a seek target or -1. */
static Bool STM_GrpNextPickup(StmGrp *grp, Sint32 fad, Sint32 end, Sint32 mode,
                              Sint32 *pos, Sint32 *flag)
{
    Bool ret;
    Sint32 n;

    ret = FALSE;
    if (grp->lpmax == grp->lpcnt) {
        if (grp->fad > end) {
            *pos = -1;
            *flag = 0;
            return TRUE;
        }
        if (mode == 0) {
            STM_CheckCdStat(func_0606D1BA(0, 0));
            if (fad > D_06070C6C->unk18) {
                grp->fad = func_0606A748();
                grp->lpcnt--;
            }
        }
    } else if ((grp->fad > end && (grp->flags & 2) == 0) || grp->head2 == NULL) {
        if (grp->loop == NULL) {
            *pos = -1;
            *flag = 0;
            return TRUE;
        }
        grp->fad = STM_GrpLoopStart(grp);
        STM_GrpClearEndFlags(grp);
    }
    if ((grp->flags & 2) == 0) {
        if (grp->unk34 >= 0) {
            n = STM_GrpNextStart(grp, grp->fad);
            *pos = n;
            if (n >= 0) {
                grp->fad = *pos;
            }
            *flag = 1;
            grp->stat = STM_EXEC_PAUSE;
            *pos = -1;
        } else {
            *pos = -1;
            *flag = 0;
        }
    } else if (((grp->flags & 4) ? TRUE : FALSE) == TRUE) {
        if (fad <= end) {
            STM_CheckCdStat(func_0606D1BA(0, 0));
            if (mode == 0 && fad > D_06070C6C->unk18) {
                grp->fad = fad;
                grp->flags &= 0xFFD9;
                *pos = -1;
                *flag = 0;
            } else {
                grp->fad = fad;
                if ((grp->flags & 32) == 0) {
                    n = STM_GrpNextStart(grp, fad);
                    *pos = n;
                    if (n >= 0) {
                        grp->flags |= 32;
                    }
                } else {
                    if (mode != 2) {
                        grp->flags &= 0xFFDF;
                    }
                    *pos = -1;
                }
                *flag = 0;
            }
        } else if (mode == 0) {
            grp->fad = fad;
            grp->flags &= 0xFFD9;
            STM_GrpCheckPassed(grp);
            if (STM_GrpIsAllEnd(grp) == FALSE) {
                grp->lpcnt++;
            }
            *flag = 0;
            *pos = -1;
            if (grp->loop == NULL || grp->lpcnt >= grp->lpmax) {
                ret = TRUE;
            }
        } else {
            *pos = -1;
            *flag = 0;
        }
    } else {
        *pos = -1;
        *flag = 0;
    }
    return ret;
}

/* NONMATCHING: register choice and scheduling */
static Sint32 STM_GrpSeek(StmGrp *grp, Sint32 pos, Sint32 end, Sint32 flag)
{
    Sint32 err;

    err = 0;
    if (pos >= 0) {
        err = func_0606A8DE(grp, pos);
        grp->fad = pos;
    } else if (grp->fad <= end && flag == 1 && (grp->flags & 2) == 0) {
        STM_GrpMarkReached(grp);
        err = func_0606A7B8(grp);
        if (err == 0) {
            grp->flags |= 2;
        }
    }
    return err;
}

/* NONMATCHING: register choice */
static Bool STM_GrpExecPickup(StmGrp *grp, Sint32 fad, Sint32 end, Sint32 mode)
{
    Bool ret;
    Sint32 err;
    Sint32 pos;
    Sint32 flag;

    if (STM_GrpIsAllEnd(grp) == TRUE) {
        if ((grp->stat == STM_EXEC_DOING || (grp->flags & 64) != 0)
                && grp->head != NULL && grp->lpcnt < grp->lpmax) {
            STM_GrpMarkReached(grp);
            STM_GrpClearEndFlags(grp);
            grp->fad = STM_INFINITE;
            grp->stat = STM_EXEC_PAUSE;
            grp->flags &= 0xFFBF;
        }
        return TRUE;
    }
    ret = STM_GrpNextPickup(grp, fad, end, mode, &pos, &flag);
    err = STM_GrpSeek(grp, pos, end, flag);
    if (err != 0) {
        func_060693C2(err);
    }
    return ret;
}

/* NONMATCHING: register choice and return-block merging */
static Sint32 STM_GetNumSct(Stm *stm)
{
    Sint32 err;
    Sint32 n;

    if (stm->key->unk1C == 0) {
        err = func_0606DF9E(stm->key->fid, 0, STM_INFINITE, &n, 0);
        if (err != 0) {
            func_0606879C(err);
            return 0;
        }
        err = func_0606E6DA();
        if (err != 0) {
            func_0606879C(err);
            return 0;
        }
    } else {
        n = func_0606C336(stm->gfs);
    }
    return n;
}

/* NONMATCHING: scheduling and return-block merging */
Sint32 STM_GetNumSctHn(Stm *hn)
{
    Sint32 ret;
    Sint32 err;

    func_060693BA(0x324);
    if (hn == NULL) {
        func_060693C2(-11);
        func_0606942E();
        return -11;
    }
    ret = STM_GetNumSct(hn->stm);
    err = func_060693D8();
    if (err < 0) {
        return err;
    }
    return ret;
}

/* NONMATCHING: register choice and branch layout */
static Sint32 STM_GetStmStat(Stm *stm, Sint32 start, Sint32 end, Sint32 nsct)
{
    Sint32 fad;
    Sint32 lim;
    Sint32 st;

    fad = stm->grp->fad;
    if (((stm->flags & 8) ? TRUE : FALSE) == TRUE && nsct == 0) {
        return STM_EXEC_COMPLETED;
    }
    if (fad <= end && stm->key->unk1C == 0) {
        if (((stm->flags & 1) ? TRUE : FALSE) == TRUE
                || ((stm->flags & 4) ? TRUE : FALSE) == FALSE) {
            STM_CheckCdStat(func_0606D1BA(0, &st));
            if ((st & 8) == 0) {
                return STM_EXEC_PAUSE;
            }
            if (nsct == 0) {
                return STM_EXEC_WAIT;
            }
        } else {
            return 32;
        }
    } else if (((stm->flags & 1) ? TRUE : FALSE) == TRUE && nsct == 0) {
        return STM_EXEC_COMPLETED;
    }
    if (stm->unk28 == STM_INFINITE) {
        lim = func_06068756(stm->grp);
    } else {
        lim = stm->unk28;
    }
    if (stm->gfs->unk9C == 0 || (fad >= start && fad < lim) || func_0607036E(stm) == TRUE) {
        return STM_EXEC_WAIT;
    }
    return STM_EXEC_PAUSE;
}

/* NONMATCHING: register choice */
static Sint32 STM_TransStmSub(Stm *stm)
{
    StmGfs *gfs;
    Sint32 n;

    gfs = stm->gfs;
    if ((stm->unk18 != 0 || gfs->tr != 0) && func_0606CBC6(&gfs->tr) > 0) {
        func_0606C4FC(gfs, &n);
    } else {
        n = 0;
    }
    return n;
}

/* NONMATCHING: register choice */
static void STM_GrpCallFunc(StmGrp *grp)
{
    if (grp->func != NULL && (grp->flags & 8) != 0) {
        grp->func(grp->obj);
        grp->flags &= 0xFFF7;
    }
}

/* NONMATCHING: register choice, stack layout and loop rotation */
/* One pass over the group's streams starting after grp->cur, at most twice round. */
static Bool STM_ExecStmRound(StmGrp *grp, Stm *stm, Uint8 mode, Bool *hit, Sint32 *stat)
{
    Stm *cur;
    Stm *start;
    Bool ret;
    Bool done;
    Bool first;
    Sint32 i;
    Sint32 a;
    Sint32 b;
    Sint32 nsct;
    Sint32 lim;
    Uint8 flags;

    done = FALSE;
    *hit = FALSE;
    cur = grp->cur;
    ret = TRUE;
    if ((cur->key->unk1C == 0) ? TRUE : FALSE) {
        func_0606A768(cur->key, &a, &b);
    } else {
        a = b = STM_FAD_START;
    }
    flags = cur->flags;
    if (cur->unk28 == STM_INFINITE) {
        lim = func_06068756(grp);
    } else {
        lim = cur->unk28;
    }
    if ((flags & 16) == 0 && grp->fad > a && grp->fad >= lim) {
        cur->flags |= 16;
    }
    if ((flags & 32) == 0 && grp->fad > b && grp->fad >= lim) {
        cur->flags |= 32;
    }
    if ((flags & 32) == 0 && (cur->flags & 32) != 0) {
        func_0606C406(&cur->gfs->tr, func_0606C336(cur->gfs));
    } else if ((flags & 16) == 0 && (cur->flags & 16) != 0) {
        func_0606C406(&cur->gfs->tr, STM_INFINITE);
    }
    STM_TransStmSub(cur);
    if (STM_IsGfsActive(cur) == TRUE) {
        *hit = TRUE;
        *stat = STM_GetStmStat(cur, a, b, 1);
        return FALSE;
    }
    start = cur;
    for (i = 0; i < 2 && done != TRUE; i++) {
        first = (i == 0);
        do {
            cur = cur->next;
            if (cur == NULL) {
                cur = grp->head;
            }
            if (cur == stm) {
                *hit = TRUE;
            }
            nsct = func_0606C336(cur->gfs);
            if (cur->key->unk1C == 0) {
                func_0606A768(cur->key, &a, &b);
            } else {
                a = b = STM_FAD_START;
            }
            *stat = STM_GetStmStat(cur, a, b, nsct);
            if (nsct > 0 || mode == 2 || mode == 1) {
                if ((first && *stat == STM_EXEC_PAUSE) || (i == 1 && *stat == STM_EXEC_WAIT)) {
                    done = TRUE;
                    ret = FALSE;
                    break;
                }
            }
            if (*stat == STM_EXEC_PAUSE || *stat == STM_EXEC_WAIT) {
                ret = FALSE;
            }
        } while (cur != start);
    }
    grp->cur = cur;
    if (done == FALSE && ret == FALSE) {
        *stat = STM_EXEC_PAUSE;
    }
    return ret;
}

/* NONMATCHING: pool placement */
static void STM_GrpResetGfs(StmGrp *grp)
{
    Stm *stm;

    for (stm = grp->head; stm != NULL; stm = stm->next) {
        func_0606AF62(stm->gfs, 0, 0);
    }
}

/* NONMATCHING: register choice and scheduling */
static Bool STM_GrpExecStms(StmGrp *grp, Uint8 mode)
{
    Stm *stm;
    Bool ret;
    Sint32 stat;
    Bool hit;

    if (grp->cur == NULL) {
        grp->cur = grp->head;
    }
    stm = grp->cur;
    do {
        ret = STM_ExecStmRound(grp, stm, mode, &hit, &stat);
    } while (hit == FALSE);
    if (stat == STM_EXEC_WAIT || grp->stat == STM_EXEC_WAIT) {
        grp->stat = stat;
    } else if (STM_GrpIsAllEnd(grp) == TRUE) {
        if (grp->lpcnt < grp->lpmax) {
            ret = FALSE;
            if (stat == STM_EXEC_COMPLETED) {
                grp->lpcnt++;
                grp->flags |= 64;
            }
        } else {
            grp->fad = STM_FAD_START;
            ret = TRUE;
            grp->flags |= 64;
        }
    }
    return ret;
}

/* NONMATCHING: register choice and scheduling */
Sint32 STM_ExecServer(void)
{
    StmGrp *grp;
    Sint32 ret;
    Sint32 stat;
    Sint32 fad;
    Sint32 n;
    Sint32 err;
    Bool ok1;
    Bool ok2;

    if (D_06070C70.func != NULL) {
        ret = D_06070C70.func(D_06070C70.obj);
        if (ret == TRUE) {
            D_06070C70.func = NULL;
            return STM_EXEC_TSKEND;
        }
        return D_06070C6C->stat;
    }
    func_060693BA(0x330);
    grp = D_06070C6C->curgrp;
    if (grp == NULL || grp->head == NULL) {
        ret = STM_EXEC_DOING;
    } else {
        /* busy guards against re-entry from the transfer functions. */
        if (D_06070C6C->busy == 0) {
            D_06070C6C->busy = 1;
            if (D_06070C80 == 1) {
                func_0606C5DC(grp->cur->gfs, &n);
                if (D_06070C80 == 1) {
                    D_06070C6C->busy = 0;
                    ret = func_060693D8();
                    if (ret < 0) {
                        return ret;
                    }
                    return grp->stat;
                }
            }
            STM_GrpCallFunc(grp);
            stat = func_0606D1BA(&fad, 0);
            STM_CheckCdStat(stat);
            if (((D_06070C6C->unk1C != 0) ? TRUE : FALSE) == TRUE) {
                func_0606942E();
            } else {
                ok1 = STM_GrpExecPickup(grp, fad, func_06068756(grp), stat);
                ok2 = STM_GrpExecStms(grp, stat);
                if (ok1 == TRUE && ok2 == TRUE) {
                    grp->stat = STM_EXEC_COMPLETED;
                    STM_GrpResetGfs(grp);
                }
            }
            D_06070C6C->busy = 0;
        }
        err = func_060693D8();
        if (err < 0) {
            ret = err;
        } else {
            ret = grp->stat;
        }
    }
    return ret;
}

/* NONMATCHING: register choice and scheduling */
void STM_MovePickup(Stm *hn, Sint32 off)
{
    Stm *stm;
    StmGrp *grp;
    Sint32 err;
    Sint32 start;
    Sint32 end;

    func_060693BA(0x331);
    if (hn == NULL) {
        func_060693C2(-11);
        func_0606942E();
        return;
    }
    stm = hn->stm;
    grp = stm->grp;
    if (D_06070C6C->curgrp == grp) {
        if (((grp->flags & 2) ? TRUE : FALSE) == TRUE) {
            err = func_0606A83A(stm->grp);
            if (err != 0) {
                func_060693C2(err);
            }
            grp->stat = STM_EXEC_DOING;
        }
        STM_CheckCdStat(func_0606D1BA(&start, 0));
        if (((D_06070C6C->unk1C != 0) ? TRUE : FALSE) == TRUE) {
            func_0606942E();
            return;
        }
        if (start >= 0) {
            grp->fad = start;
        }
        grp->flags &= 0xFFD9;
    }
    STM_GrpCheckPassed(grp);
    STM_GrpClearReached(grp);
    func_0606A768(stm->key, &start, &end);
    grp->fad = start + off;
    func_060693D8();
}

/* NONMATCHING: pool placement */
Sint32 STM_GetExecGrpPos(void)
{
    Sint32 ret;
    Sint32 err;

    ret = func_0606A89C(D_06070C6C->curgrp);
    err = func_060693D8();
    if (err < 0) {
        ret = err;
    }
    return ret;
}

/* NONMATCHING: register choice and scheduling */
Bool STM_IsComplete(Stm *hn)
{
    Stm *stm;
    Sint32 nsct;
    Sint32 stat;
    Sint32 start;
    Sint32 end;

    func_060693BA(0x335);
    if (hn == NULL) {
        func_060693C2(-11);
        func_0606942E();
        return FALSE;
    }
    stm = hn->stm;
    nsct = STM_GetNumSct(stm);
    func_0606A768(stm->key, &start, &end);
    stat = STM_GetStmStat(stm, start, end, nsct);
    func_060693D8();
    if (stat == STM_EXEC_COMPLETED) {
        return TRUE;
    }
    if (stat == STM_EXEC_WAIT && stm->gfs->unk9C == 0) {
        return TRUE;
    }
    return FALSE;
}

/* NONMATCHING: register choice and scheduling */
/* Transfers what the stream has buffered, with the transfer limit lifted. */
Sint32 STM_TransStm(Stm *hn)
{
    Stm *stm;
    Sint32 *tr;
    Sint32 old;
    Sint32 n;

    func_060693BA(0x336);
    if (hn == NULL) {
        func_060693C2(-11);
        func_0606942E();
        return 0;
    }
    if (D_06070C6C->busy == 0) {
        D_06070C6C->busy = 1;
        stm = hn->stm;
        if (D_06070C80 == 1) {
            func_0606C5DC(stm->gfs, &n);
            if (D_06070C80 == 1) {
                D_06070C6C->busy = 0;
                return n;
            }
        }
        tr = &stm->gfs->tr;
        old = func_0606C448(tr);
        func_0606C406(tr, STM_INFINITE);
        n = STM_TransStmSub(stm);
        func_0606C406(tr, old);
        D_06070C6C->busy = 0;
    } else {
        n = 0;
    }
    func_060693D8();
    return n;
}

#endif /* NONMATCHING */
