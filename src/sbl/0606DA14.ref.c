/* shc-flags: -define=NONMATCHING */
/* GFS CD-block layer: partition, filter and lock bookkeeping, and the queued
 * CD block requests that gfcd_ExecServer advances. */
/* This module was built by an older SHC than the 5.0 in compile/: it keeps one
 * code path per return, prefers r0 for temporaries and keeps local addresses
 * in callee-saved registers. The C below is complete; functions that SHC 5.0
 * cannot reproduce are under NONMATCHING with what still differs. */

#include "sbl/types.h"
#include "sbl/gfcd.h"

#define WORK gfcd_work

/* The disc TOC is kept in the GFS work area. */
#define GFS_TOC ((Uint32 *)(gfs_mng + 0x460))

void gfcd_ResetWork(void);
void gfcd_UpdStat(void);
Sint32 gfcd_TestHirq(Sint32 mask);
Sint32 gfcd_ExecServer(void);
void gfcd_SetTimeout(Sint32 timeout);
Sint32 gfcd_DelDone(Sint32 bufno);
Sint32 gfcd_IsIdle(Sint32 req);
Sint32 gfcd_Exec(Sint32 req, Sint32 *ncmd);
Sint32 gfcd_ExecFilt(Sint32 *ncmd);
Sint32 gfcd_ExecCdCon(Sint32 *ncmd);
Sint32 gfcd_ExecGetSct(Sint32 *ncmd);
Sint32 gfcd_ExecTrans(Sint32 *ncmd);
Sint32 gfcd_ExecDel(Sint32 *ncmd);
Sint32 gfcd_ExecMove(Sint32 *ncmd);
Sint32 gfcd_ExecChgDir(Sint32 *ncmd);
Sint32 gfcd_ExecCon(Sint32 *ncmd);
Sint32 gfcd_WaitScdq(void);

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
/* Reserves (or releases) partition 23 and filter 23 for the library. */
void gfcd_Reserve(Sint32 flag)
{
    if (flag) {
        WORK->buf_used[23] = 1;
        WORK->flt_used[23] = 1;
    } else {
        WORK->buf_used[23] = 0;
        WORK->flt_used[23] = 0;
    }
}
#endif

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return; register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_Init(GfcdWork *work, Sint32 flag)
{
    Sint32 ret;
    Uint32 ses;
    CdcStat stat;
    Sint32 i;
    Sint32 cnt;
    Sint32 done;
    Uint32 *toc;

    WORK = work;
    gfcd_play = 0;
    gfcd_err = 0;
    gfcd_ResetWork();
    gfcd_Reserve(flag);
    gfcd_GetStat(&stat);
    if (gfcd_err != 0) {
        return gfcd_err;
    }
    if (CDC_STAT(&stat) == CDC_ST_ERROR) {
        return -10;
    }
    CDC_AbortFile();
    ret = CDC_CdInit(0, 0, 4, 15);
    if (ret != 0) {
        return -2;
    }
    for (i = 0; ; i++) {
        ret = CDC_SetSctLen(0, -1);
        if (ret == 0) {
            break;
        }
        if (ret != -1 || i > 0x30000) {
            return -2;
        }
    }
    WORK->timeout = 0x30000;
    while (!gfcd_TestHirq(CDC_HIRQ_ESEL)) {
        if (--WORK->timeout == 0) {
            return -2;
        }
    }
    WORK->timeout = 0;
    CDC_ClrHirqReq(~(CDC_HIRQ_PEND | CDC_HIRQ_BFUL));
    cnt = 0;
    done = 0;
    while (!done) {
        if (gfcd_TestHirq(CDC_HIRQ_SCDQ)) {
            CDC_ClrHirqReq(~CDC_HIRQ_SCDQ);
            if (++cnt > 600) {
                return -2;
            }
            gfcd_GetStat(&stat);
            if (gfcd_err != 0) {
                return gfcd_err;
            }
            switch (CDC_STAT(&stat)) {
            case CDC_ST_PAUSE:
            case CDC_ST_STANDBY:
                done = 1;
                break;
            case CDC_ST_ERROR:
                return -10;
            }
        }
    }
    CDC_DataEnd(&ret);
    toc = GFS_TOC;
    ret = CDC_TgetToc(toc);
    if (ret != 0) {
        return -2;
    }
    CDC_GetSes(0, &ses);
    CDC_GetSes(CDC_SES_TRK(&ses), &ses);
    /* the first track of the last session must be a data track */
    if ((toc[CDC_SES_TRK(&ses) - 1] & 0x40000000) == 0) {
        return -15;
    }
    ret = CDC_ResetSelector(0xFC, 0xFF);
    WORK->timeout = 0x30000;
    while (!gfcd_TestHirq(CDC_HIRQ_ESEL)) {
        if (--WORK->timeout == 0) {
            return -2;
        }
    }
    WORK->timeout = 0;
    gfcd_GetStat(&WORK->stat);
    return gfcd_err;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_AllocFilt(Sint32 *fltno)
{
    Sint32 i;

    for (i = 0; i < 24; i++) {
        if (WORK->flt_used[i] == 0) {
            WORK->flt_used[i] = 1;
            *fltno = i;
            return 0;
        }
    }
    *fltno = -1;
    return -3;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_FreeFilt(Sint32 fltno)
{
    if (fltno < 0 || fltno >= 24) {
        return -6;
    }
    if (WORK->flt_used[fltno] != 1) {
        return -7;
    }
    WORK->flt_used[fltno] = 0;
    return 0;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_AllocBuf(Sint32 *bufno)
{
    Sint32 i;

    for (i = 0; i < 24; i++) {
        if (WORK->buf_used[i] == 0) {
            WORK->buf_used[i] = 1;
            *bufno = i;
            return 0;
        }
    }
    *bufno = -1;
    return -4;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_FreeBuf(Sint32 bufno)
{
    Sint32 ret;

    if (gfcd_err == -16) {
        gfcd_err = 0;
    }
    if (bufno < 0 || bufno >= 24) {
        return -6;
    }
    if (WORK->buf_used[bufno] != 1) {
        return -7;
    }
    gfcd_DelSct(bufno, 0, -1);
    gfcd_SetTimeout(0x30000);
    do {
        ret = gfcd_ExecServer();
        if (ret == 3) {
            return -12;
        }
        if (ret == 2) {
            return -16;
        }
    } while (gfcd_DelDone(bufno) != 1);
    gfcd_SetTimeout(0);
    WORK->buf_used[bufno] = 0;
    return 0;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Uint32 gfcd_GetLastSesFad(void)
{
    Uint32 ses;

    CDC_GetSes(0, &ses);
    CDC_GetSes(CDC_SES_TRK(&ses), &ses);
    return CDC_SES_FAD(&ses);
}
#endif

#ifdef NONMATCHING /* same instructions, only pool and branch displacements differ */
Sint32 gfcd_Lock(void)
{
    if (WORK->locked == 1) {
        return -5;
    }
    WORK->locked = 1;
    WORK->lockid++;
    if (WORK->lockid < 0) {
        WORK->lockid = 0;
    }
    return WORK->lockid;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_Unlock(Sint32 id)
{
    if (WORK->locked == 0) {
        return -7;
    }
    if (WORK->lockid != id) {
        return -9;
    }
    WORK->locked = 0;
    return 0;
}
#endif

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return */
Sint32 gfcd_IsLocked(Sint32 id)
{
    if (WORK->locked == 0) {
        return 0;
    }
    if (WORK->lockid == id) {
        return 1;
    }
    return 0;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_SetFilt(Sint32 fltno, Sint32 fmode, CdcSubh *subh, Sint32 fad, Sint32 snum)
{
    GfcdWork *w;
    Sint32 n;
    Sint32 ncmd;

    w = WORK;
    n = w->nfilt;
    if (w->flt_used[fltno] != 1) {
        return -7;
    }
    if (n >= 24) {
        return -8;
    }
    if (w->filt_st == 0) {
        w->filt_st = 1;
    }
    WORK->filt[n].fltno = fltno;
    WORK->filt[n].fmode = fmode;
    WORK->filt[n].subh = *subh;
    WORK->filt[n].fad = fad;
    WORK->filt[n].snum = snum;
    WORK->nfilt++;
    gfcd_ExecFilt(&ncmd);
    return 0;
}
#endif

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return */
Sint32 gfcd_GetFilt(Sint32 fltno, Sint32 *fmode, CdcSubh *subh)
{
    Sint32 ret;

    ret = CDC_GetFiltMode(fltno, fmode);
    if (ret != 0) {
        return -10;
    }
    ret = CDC_GetFiltSubh(fltno, subh);
    if (ret != 0) {
        return -10;
    }
    gfcd_UpdStat();
    return 0;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_SetCdCon(Sint32 fltno, Sint32 id)
{
    GfcdWork *w;
    Sint32 ncmd;

    if (fltno != 0xFF && WORK->flt_used[fltno] != 1) {
        return -7;
    }
    w = WORK;
    if (w->lockid != id) {
        return -9;
    }
    w->cdcon_st = 1;
    WORK->cdcon_flt = fltno;
    gfcd_ExecCdCon(&ncmd);
    return 0;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_Play(void *ply, Sint32 id)
{
    CdcStat stat;

    if (WORK->lockid != id) {
        return -9;
    }
    gfcd_GetStat(&stat);
    if (gfcd_err != 0) {
        return gfcd_err;
    }
    CDC_ClrHirqReq(~(CDC_HIRQ_PEND | CDC_HIRQ_CSCT));
    CDC_CdPlay(ply);
    gfcd_play = 1;
    return 0;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_GetSctNum(Sint32 bufno, Sint32 spos, Sint32 snum, Sint32 *nsct, Sint32 *nword)
{
    Sint32 ncmd;

    if (WORK->get_st != 0) {
        return -1;
    }
    WORK->get_st = 1;
    WORK->get_buf = bufno;
    WORK->get_spos = spos;
    WORK->get_snum = snum;
    WORK->get_unk = 0;
    WORK->get_nsct = nsct;
    WORK->get_nword = nword;
    gfcd_ExecGetSct(&ncmd);
    return 0;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_StartTrans(Sint32 bufno, Sint32 spos, Sint32 snum)
{
    Sint32 ncmd;

    if (WORK->trn_st != 0) {
        return -1;
    }
    if (WORK->trn_buf != -1) {
        return -5;
    }
    WORK->trn_buf = bufno;
    WORK->trn_st = 1;
    WORK->trn_bufno = bufno;
    WORK->trn_spos = spos;
    WORK->trn_snum = snum;
    gfcd_ExecTrans(&ncmd);
    return 0;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_EndTrans(Sint32 *cdwnum)
{
    Sint32 ret;

    if (WORK->trn_buf == -1) {
        return -7;
    }
    ret = CDC_DataEnd(cdwnum);
    WORK->trn_buf = -1;
    if (ret != 0) {
        return -10;
    }
    gfcd_UpdStat();
    return 0;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_DelSct(Sint32 bufno, Sint32 spos, Sint32 snum)
{
    Sint32 ncmd;

    if (WORK->del_st != 0) {
        return -1;
    }
    if (WORK->trn_buf == bufno) {
        return -5;
    }
    WORK->del_st = 1;
    WORK->del_buf = bufno;
    WORK->del_spos = spos;
    WORK->del_snum = snum;
    gfcd_ExecDel(&ncmd);
    return 0;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
/* 1 once no delete is pending on partition bufno. */
Sint32 gfcd_DelDone(Sint32 bufno)
{
    if (WORK->del_st != 0 && WORK->del_buf == bufno) {
        return 0;
    }
    return 1;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
/* Status for the library: the periodic status, or a fresh one right after a
 * play command; errors from the drive end up in gfcd_err. */
Sint32 gfcd_GetStat(CdcStat *stat)
{
    Sint32 ret;
    Uint32 hirq;
    CdcPos pos;

    if (gfcd_play == 1) {
        ret = -8;
        gfcd_play = 0;
    } else {
        ret = CDC_GetPeriStat(stat);
    }
    if (ret != 0) {
        CDC_GetCurStat(stat);
    }
    hirq = CDC_GetHirqReq();
    if (hirq & CDC_HIRQ_DCHG) {
        gfcd_err = -13;
    } else {
        switch (CDC_STAT(stat)) {
        case CDC_ST_OPEN:
            gfcd_err = -13;
            break;
        case CDC_ST_NODISC:
            gfcd_err = -14;
            break;
        case CDC_ST_FATAL:
            gfcd_err = -16;
            pos.ptype = 0;
            CDC_CdSeek(&pos);
            gfcd_WaitScdq();
            gfcd_WaitScdq();
            break;
        }
    }
    return hirq;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_Seek(CdcPos *pos, Sint32 id)
{
    CdcStat stat;

    if (WORK->lockid != id) {
        return -9;
    }
    gfcd_GetStat(&stat);
    if (gfcd_err != 0) {
        return gfcd_err;
    }
    CDC_CdSeek(pos);
    return 0;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_MoveSct(Sint32 fltno, Sint32 dst, Sint32 spos, Sint32 snum)
{
    GfcdWork *w;
    Uint8 *flt;
    Sint32 ncmd;

    w = WORK;
    flt = w->flt_used;
    if (flt[fltno] == 0 || flt[dst] == 0) {
        return -7;
    }
    if (w->mov_st != 0) {
        return -1;
    }
    w->mov_st = 1;
    WORK->mov_flt = fltno;
    WORK->mov_dst = dst;
    WORK->mov_spos = spos;
    WORK->mov_snum = snum;
    gfcd_ExecMove(&ncmd);
    return 0;
}
#endif

#ifdef NONMATCHING /* SHC 5.0 returns the flag with movt */
Sint32 gfcd_MoveDone(void)
{
    if (WORK->mov_st != 0) {
        return 0;
    }
    return 1;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_GetSctInfo(Sint32 bufno, Sint32 sp, void *sct)
{
    Sint32 ret;

    if (bufno < 0 || bufno >= 24) {
        return -6;
    }
    if (WORK->buf_used[bufno] == 0) {
        return -7;
    }
    ret = CDC_GetSctInfo(bufno, sp, sct);
    if (ret != 0) {
        return -10;
    }
    gfcd_UpdStat();
    return 0;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_ChgDir(Sint32 fid, Sint32 fltno, Sint32 *nfile)
{
    GfcdWork *w;
    Sint32 ncmd;

    w = WORK;
    if (w->flt_used[fltno] != 1 || w->buf_used[fltno] != 1) {
        return -5;
    }
    if (w->dir_st != 0) {
        return -1;
    }
    if (fid == -1) {
        w->dir_st = 3;
    } else {
        w->dir_st = 1;
    }
    WORK->dir_fid = fid;
    WORK->dir_flt = fltno;
    WORK->dir_nfile = nfile;
    gfcd_ExecChgDir(&ncmd);
    return 0;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_SetFiltCon(Sint32 fltno, Sint32 bufno, Sint32 flnout)
{
    GfcdWork *w;
    Sint32 n;
    Sint32 ncmd;

    w = WORK;
    n = w->ncon;
    if (!(fltno == 0xFF || fltno == -2 || (fltno >= 0 && fltno < 24))
        || !(bufno >= 0 && bufno < 24)
        || !(flnout == 0xFF || flnout == -2 || (flnout >= 0 && flnout < 24))) {
        return -6;
    }
    if (!(fltno == 0xFF || fltno == -2 || w->flt_used[fltno] == 1)
        || !(flnout == 0xFF || flnout == -2 || w->flt_used[flnout] == 1)
        || w->buf_used[bufno] != 1) {
        return -7;
    }
    if (n >= 24) {
        return -8;
    }
    if (w->con_st == 0) {
        w->con_st = 1;
    }
    WORK->con[n].fltno = fltno;
    WORK->con[n].bufno = bufno;
    WORK->con[n].flnout = flnout;
    WORK->ncon++;
    gfcd_ExecCon(&ncmd);
    return 0;
}
#endif

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return */
Sint32 gfcd_GetFileInfo(Sint32 fid, CdcFile *file)
{
    Sint32 first;
    Sint32 num;
    Sint32 drend;
    Sint32 ret;

    ret = CDC_GetFileScope(&first, &num, &drend);
    if (ret != 0) {
        return -11;
    }
    if (fid < first || fid >= first + num) {
        ret = CDC_ReadDir(23, fid);
        if (ret != 0) {
            return -11;
        }
        while (!gfcd_TestHirq(CDC_HIRQ_EFLS)) {
        }
        ret = CDC_GetFileScope(&first, &num, &drend);
        /* sic: && where || was meant, so this only fails on ret */
        if (ret != 0 || (fid < first && fid >= first + num)) {
            return -11;
        }
    }
    ret = CDC_TgetFileInfo(fid, file);
    if (ret != 0) {
        return -11;
    }
    if (file->atr & 0x02) {
        file->atr |= 0x80;
    }
    if (drend != 0 && first + num - 1 == fid) {
        file->atr |= 0x01;
    }
    gfcd_UpdStat();
    return 0;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_GetFreeSiz(void)
{
    Sint32 freesiz;
    Sint32 totalsiz;
    Sint32 bufnum;
    Sint32 ret;

    ret = CDC_GetBufSiz(&totalsiz, &bufnum, &freesiz);
    if (ret != 0) {
        return -10;
    }
    gfcd_UpdStat();
    return freesiz;
}
#endif

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return */
/* Advances every pending request by one step. Returns 0 when idle, 1 while
 * busy, 2 on a drive error and 3 on timeout. */
Sint32 gfcd_ExecServer(void)
{
    Sint32 ncmd;
    Sint32 total;
    Sint32 i;
    Sint32 ret;

    ncmd = 0;
    total = 0;
    if (WORK->timeout != 0) {
        if (--WORK->timeout <= 0) {
            gfcd_ResetWork();
            return 3;
        }
    }
    gfcd_GetStat(&WORK->stat);
    if (gfcd_err != 0) {
        return 2;
    }
    if (gfcd_TestHirq(CDC_HIRQ_SCDQ) == 1) {
        CDC_ClrHirqReq(~CDC_HIRQ_SCDQ);
        if (WORK->func != NULL) {
            WORK->func(WORK->arg);
        }
    }
    for (i = 0; i < 8; i++) {
        if (gfcd_IsIdle(i) == 0) {
            ret = gfcd_Exec(i, &ncmd);
            if (ret < 0) {
                return ret;
            }
            total += ret;
            if (ncmd > 30) {
                return 1;
            }
        }
    }
    if (total > 0) {
        return 1;
    }
    return 0;
}
#endif

#ifdef NONMATCHING /* SHC 5.0 returns the flag with movt; the original shares one load for all cases */
Sint32 gfcd_IsIdle(Sint32 req)
{
    GfcdWork *w;
    Sint32 st;

    w = WORK;
    switch (req) {
    case 0:
        st = w->filt_st;
        break;
    case 1:
        st = w->cdcon_st;
        break;
    case 2:
        st = w->get_st;
        break;
    case 3:
        st = w->trn_st;
        break;
    case 4:
        st = w->del_st;
        break;
    case 5:
        st = w->mov_st;
        break;
    case 6:
        st = w->con_st;
        break;
    case 7:
        st = w->dir_st;
        break;
    }
    if (st == 0) {
        return 1;
    }
    return 0;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_Exec(Sint32 req, Sint32 *ncmd)
{
    switch (req) {
    case 0:
        return gfcd_ExecFilt(ncmd);
    case 1:
        return gfcd_ExecCdCon(ncmd);
    case 2:
        return gfcd_ExecGetSct(ncmd);
    case 3:
        return gfcd_ExecTrans(ncmd);
    case 4:
        return gfcd_ExecDel(ncmd);
    case 5:
        return gfcd_ExecMove(ncmd);
    case 6:
        return gfcd_ExecCon(ncmd);
    case 7:
        return gfcd_ExecChgDir(ncmd);
    }
}
#endif

#ifdef NONMATCHING /* same instructions, only pool and branch displacements differ */
void gfcd_SetTimeout(Sint32 timeout)
{
    WORK->timeout = timeout;
}
#endif

#ifdef NONMATCHING /* same instructions, only pool and branch displacements differ */
Sint32 gfcd_WaitServer(void)
{
    Sint32 ret;

    gfcd_SetTimeout(0x30000);
    do {
        ret = gfcd_ExecServer();
    } while (ret == 1);
    gfcd_SetTimeout(0);
    return ret;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_ExecFilt(Sint32 *ncmd)
{
    Sint32 i;
    Sint32 j;
    GfcdFiltCmd *e;
    Sint32 ret;

    for (i = 0; i < WORK->nfilt; i++) {
        if (WORK->filt_st == 1) {
            e = &WORK->filt[i];
            ret = CDC_SetFiltMode(e->fltno, e->fmode);
            if (ret != 0) {
                break;
            }
            gfcd_UpdStat();
            (*ncmd)++;
            WORK->filt_st = 2;
        }
        if (WORK->filt_st == 2) {
            e = &WORK->filt[i];
            ret = CDC_SetFiltSubh(e->fltno, &e->subh);
            if (ret != 0) {
                break;
            }
            gfcd_UpdStat();
            (*ncmd)++;
            if (WORK->filt[i].snum != 0) {
                WORK->filt_st = 3;
            } else {
                WORK->filt_st = 1;
            }
        }
        if (WORK->filt_st == 3) {
            e = &WORK->filt[i];
            ret = CDC_SetFiltRange(e->fltno, e->fad, e->snum);
            if (ret != 0) {
                break;
            }
            gfcd_UpdStat();
            (*ncmd)++;
            WORK->filt_st = 1;
        }
    }
    if (i >= WORK->nfilt) {
        WORK->nfilt = 0;
    } else {
        for (j = 0; i < WORK->nfilt; i++, j++) {
            WORK->filt[j] = WORK->filt[i];
        }
        WORK->nfilt = j;
    }
    if (gfcd_TestHirq(CDC_HIRQ_ESEL) && WORK->nfilt == 0) {
        WORK->filt_st = 0;
    }
    return WORK->nfilt;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_ExecCdCon(Sint32 *ncmd)
{
    GfcdWork *w;
    Sint32 ret;

    w = WORK;
    if (w->cdcon_st == 1) {
        ret = CDC_CdSetCon(w->cdcon_flt);
        (*ncmd)++;
        if (ret == 0) {
            WORK->cdcon_st = 2;
        }
        gfcd_UpdStat();
    }
    if (WORK->cdcon_st == 2) {
        if (gfcd_TestHirq(CDC_HIRQ_ESEL)) {
            WORK->cdcon_st = 0;
        }
    }
    return WORK->cdcon_st;
}
#endif

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return */
Sint32 gfcd_ExecGetSct(Sint32 *ncmd)
{
    GfcdWork *w;
    Sint32 nsct;
    Sint32 nword;
    Sint32 ret;

    w = WORK;
    if (w->get_st == 1) {
        CDC_GetSctNum(w->get_buf, &nsct);
        gfcd_UpdStat();
        (*ncmd)++;
        nsct -= WORK->get_spos;
        nsct = (nsct < WORK->get_snum) ? nsct : WORK->get_snum;
        *WORK->get_nsct = nsct;
        if (WORK->get_nword == NULL) {
            WORK->get_st = 0;
            return 0;
        }
        if (nsct <= 0) {
            WORK->get_st = 0;
            *WORK->get_nword = 0;
            return 0;
        }
        WORK->get_st = 2;
    }
    if (WORK->get_st == 2) {
        if (WORK->trn_buf != -1) {
            return 2;
        }
        WORK->trn_buf = WORK->get_buf;
        ret = CDC_CalActSiz(WORK->get_buf, WORK->get_spos, *WORK->get_nsct);
        if (ret != 0) {
            return 2;
        }
        gfcd_UpdStat();
        (*ncmd)++;
        WORK->get_st = 3;
    }
    if (WORK->get_st == 3) {
        ret = CDC_GetActSiz(&nword);
        if (ret != 0) {
            return 1;
        }
        gfcd_UpdStat();
        (*ncmd)++;
        WORK->get_st = 0;
        *WORK->get_nword = nword * 2;
        WORK->trn_buf = -1;
        return 0;
    }
    return 1;
}
#endif

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return */
Sint32 gfcd_ExecTrans(Sint32 *ncmd)
{
    GfcdWork *w;
    Sint32 ret;

    w = WORK;
    if (w->trn_st == 1) {
        ret = CDC_GetSctData(w->trn_bufno, w->trn_spos, w->trn_snum);
        if (ret != 0) {
            return 1;
        }
        gfcd_UpdStat();
        (*ncmd)++;
        WORK->trn_st = 2;
    }
    if (WORK->trn_st == 2) {
        ret = CDC_DataReady(0);
        if (ret == 0) {
            WORK->trn_st = 0;
            return 0;
        }
    }
    return 1;
}
#endif

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return */
Sint32 gfcd_ExecDel(Sint32 *ncmd)
{
    GfcdWork *w;
    Sint32 busy;
    Sint32 ret;

    w = WORK;
    busy = 1;
    if (w->del_st == 1) {
        if (w->del_spos == 0 && w->del_snum == -1) {
            /* the whole partition: reset it instead */
            ret = CDC_ResetSelector(0, w->del_buf);
            if (ret != 0) {
                return 1;
            }
            gfcd_UpdStat();
            (*ncmd)++;
            WORK->del_st = 4;
        } else if (w->del_snum == 0) {
            busy = 0;
        } else {
            w->del_st = 2;
        }
    }
    if (WORK->del_st == 2) {
        ret = CDC_DelSctData(WORK->del_buf, WORK->del_spos, WORK->del_snum);
        (*ncmd)++;
        if (ret == 0) {
            WORK->del_st = 3;
            gfcd_UpdStat();
        }
    }
    if (WORK->del_st == 3) {
        if (gfcd_TestHirq(CDC_HIRQ_EHST)) {
            busy = 0;
        }
    }
    if (WORK->del_st == 4) {
        if (gfcd_TestHirq(CDC_HIRQ_ESEL)) {
            busy = 0;
        }
    }
    if (busy == 1) {
        return 1;
    }
    CDC_ClrHirqReq(~CDC_HIRQ_BFUL);
    WORK->del_st = 0;
    return 0;
}
#endif

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return */
Sint32 gfcd_ExecMove(Sint32 *ncmd)
{
    GfcdWork *w;
    Sint32 ret;

    w = WORK;
    if (w->mov_st == 1) {
        CDC_GetFiltMode(w->mov_flt, &w->mov_fmode);
        (*ncmd)++;
        gfcd_UpdStat();
        ret = CDC_SetFiltMode(WORK->mov_flt, 0);
        if (ret != 0) {
            return 1;
        }
        gfcd_UpdStat();
        (*ncmd)++;
        WORK->mov_st = 2;
    }
    if (WORK->mov_st == 2) {
        ret = CDC_MoveSctData(WORK->mov_dst, WORK->mov_spos, WORK->mov_snum, WORK->mov_flt);
        if (ret != 0) {
            return 1;
        }
        gfcd_UpdStat();
        (*ncmd)++;
        WORK->mov_st = 3;
    }
    if (WORK->mov_st == 3) {
        if (gfcd_TestHirq(CDC_HIRQ_ECPY)) {
            WORK->mov_st = 4;
        }
    }
    if (WORK->mov_st == 4) {
        ret = CDC_SetFiltMode(WORK->mov_flt, WORK->mov_fmode);
        if (ret != 0) {
            return 1;
        }
        (*ncmd)++;
        WORK->mov_st = 5;
    }
    if (WORK->mov_st == 5) {
        if (gfcd_TestHirq(CDC_HIRQ_ESEL) == 1) {
            WORK->mov_st = 0;
        }
    }
    return WORK->mov_st;
}
#endif

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return; register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_ExecChgDir(Sint32 *ncmd)
{
    Sint32 first;
    Sint32 num;
    Sint32 drend;
    CdcStat stat;
    Sint32 ret;

    if (WORK->dir_st == 1) {
        ret = CDC_GetFileScope(&first, &num, &drend);
        if (ret != 0) {
            WORK->dir_st = 0;
            *WORK->dir_nfile = -1;
            return -11;
        }
        (*ncmd)++;
        if (WORK->dir_fid == 0 || WORK->dir_fid == 1
            || (first <= WORK->dir_fid && WORK->dir_fid < first + num)) {
            WORK->dir_st = 3;
        } else {
            ret = CDC_ReadDir(23, WORK->dir_fid);
            if (ret != 0) {
                WORK->dir_st = 0;
                *WORK->dir_nfile = -1;
                return -11;
            }
            (*ncmd)++;
            WORK->dir_st = 2;
        }
    }
    if (WORK->dir_st == 2) {
        if (gfcd_TestHirq(CDC_HIRQ_EFLS)) {
            ret = CDC_GetFileScope(&first, &num, &drend);
            /* sic: && where || was meant, as in gfcd_GetFileInfo */
            if (ret != 0 || (WORK->dir_fid < first && WORK->dir_fid >= first + num)) {
                WORK->dir_st = 0;
                *WORK->dir_nfile = -1;
                return -11;
            }
            WORK->dir_st = 3;
        }
    }
    if (WORK->dir_st == 3) {
        gfcd_GetStat(&stat);
        if (gfcd_err != 0) {
            return gfcd_err;
        }
        ret = CDC_ChgDir(WORK->dir_flt, WORK->dir_fid);
        if (ret != 0) {
            return 1;
        }
        gfcd_UpdStat();
        (*ncmd)++;
        WORK->dir_st = 4;
    }
    if (WORK->dir_st == 4) {
        if (gfcd_TestHirq(CDC_HIRQ_EFLS)) {
            WORK->dir_st = 0;
            ret = CDC_GetFileScope(&first, &num, &drend);
            if (ret != 0) {
                WORK->dir_st = 0;
                *WORK->dir_nfile = -1;
                return -11;
            }
            *WORK->dir_nfile = num;
        }
    }
    return WORK->dir_st;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_ExecCon(Sint32 *ncmd)
{
    Sint32 i;
    Sint32 j;
    Sint32 cflag;
    Sint32 bufno;
    Sint32 flnout;
    Sint32 ret;

    for (i = 0; i < WORK->ncon; i++) {
        if (WORK->con[i].bufno == -2) {
            cflag = 0;
            bufno = 0xFF;
        } else {
            cflag = 1;
            bufno = WORK->con[i].bufno;
        }
        if (WORK->con[i].flnout == -2) {
            flnout = 0xFF;
        } else {
            cflag |= 2;
            flnout = WORK->con[i].flnout;
        }
        ret = CDC_SetFiltCon(WORK->con[i].fltno, cflag, bufno, flnout);
        if (ret != 0) {
            break;
        }
        gfcd_UpdStat();
        (*ncmd)++;
    }
    if (i >= WORK->ncon) {
        WORK->ncon = 0;
    } else {
        for (j = 0; i < WORK->ncon; i++, j++) {
            WORK->con[j].fltno = WORK->con[i].fltno;
            WORK->con[j].bufno = WORK->con[i].bufno;
            WORK->con[j].flnout = WORK->con[i].flnout;
        }
        WORK->ncon = j;
    }
    if (gfcd_TestHirq(CDC_HIRQ_ESEL) && WORK->ncon == 0) {
        WORK->con_st = 0;
    }
    return WORK->ncon;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_TestHirq(Sint32 mask)
{
    Uint32 hirq;

    hirq = CDC_GetHirqReq();
    if (mask & hirq) {
        return 1;
    }
    return 0;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
/* Frees every partition and filter except 23 and clears all requests. */
void gfcd_ResetWork(void)
{
    Sint32 i;

    for (i = 0; i < 23; i++) {
        WORK->buf_used[i] = 0;
        WORK->flt_used[i] = 0;
    }
    WORK->locked = 0;
    WORK->trn_buf = -1;
    WORK->lockid = -1;
    WORK->timeout = 0;
    WORK->func = NULL;
    WORK->arg = NULL;
    WORK->nfilt = 0;
    WORK->filt_st = 0;
    WORK->cdcon_st = 0;
    WORK->get_st = 0;
    WORK->trn_st = 0;
    WORK->del_st = 0;
    WORK->mov_st = 0;
    WORK->dir_st = 0;
    WORK->ncon = 0;
    WORK->con_st = 0;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
void gfcd_UpdStat(void)
{
    CdcStat stat;

    CDC_GetLastStat(&stat);
    WORK->stat.status = stat.status;
}
#endif

#ifdef NONMATCHING /* same instructions, only pool and branch displacements differ */
void gfcd_SetCallback(void (*func)(void *), void *arg)
{
    WORK->func = func;
    WORK->arg = arg;
}
#endif

#ifdef NONMATCHING /* same instructions, only pool and branch displacements differ */
Sint32 gfcd_TestScdq(void)
{
    if (CDC_GetHirqReq() & CDC_HIRQ_SCDQ) {
        return 1;
    }
    return 0;
}
#endif

#ifdef NONMATCHING /* same instructions, only pool and branch displacements differ */
void gfcd_ClrScdq(void)
{
    CDC_ClrHirqReq(~CDC_HIRQ_SCDQ);
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
Sint32 gfcd_WaitScdq(void)
{
    Sint32 i;

    for (i = 0; i < 0x5F34; i++) {
        if (gfcd_TestScdq() == 1) {
            gfcd_ClrScdq();
            return 0;
        }
    }
    return 1;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
void gfcd_WaitPause(void)
{
    CdcStat stat;
    Sint32 i;

    for (i = 0; i < 0x69CB5; i++) {
        gfcd_GetStat(&stat);
        if (CDC_STAT(&stat) == CDC_ST_PAUSE || CDC_STAT(&stat) == CDC_ST_STANDBY
            || gfcd_err != 0) {
            break;
        }
    }
}
#endif
