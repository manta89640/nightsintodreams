/* shc-flags: -macsave=0 -division=peripheral */
/* GFS API layer (one object in the original link).
 *
 * NONMATCHING (whole module): this library was built with an older SHC than the
 * 5.0 in compile/, and the C below is behavior-equivalent but only a few
 * functions come out byte-identical. What SHC 5.0 does differently here:
 *  - it merges equal return paths and turns `return a < b` style code into movt;
 *    the original keeps a separate epilogue per return and branches;
 *  - it evaluates a call before the other operand of `x - f()` and the right side
 *    of `p->a = f()` before the left; the original goes left to right (so values
 *    like flow->finfo.nsct sit in a callee-saved register across the call);
 *  - temporaries get other registers (the original favours r0/r1 for tested values)
 *    and loads/stores are scheduled differently, including jsr delay slots;
 *  - it drops dead stores of locals that the original keeps on the stack;
 *  - it folds a constant divisor of 2048 into shifts after the divide call.
 * Signed divisions call _divlsp (-division=peripheral), which is func_060508A8 in
 * the target; _divlu is func_060506E0 and _quick_odd_mvn is func_060508D0. */
#include "sbl/types.h"
#include "sbl/gfs.h"

Sint32 gfs_SetErr(Sint32 code);
Sint32 gfs_ReadRootDir(GfsDirTbl *dirtbl);
void gfs_InitMng(Sint32 openmax);
Sint32 gfs_CountFiles(GfsDirTbl *dirtbl);
GfsHn gfs_AllocHn(void);
void gfs_FreeHn(GfsHn gfs);
void gfs_StopIn(GfsHn gfs, Bool flag);
Sint32 gfs_FindSvr(GfsHn gfs);
void gfs_AddSvr(GfsHn gfs);
void gfs_DelSvr(GfsHn gfs);
GfsHn gfs_InitHn(GfsHn gfs, CdcFile *dirrec, Sint32 fid);
Sint32 gfs_ReadPvd(Uint8 *buf);
Sint32 gfs_GetRootRec(CdcFile *rec);
Sint32 gfs_LoadRootDir(GfsDirTbl *dirtbl);
Sint32 gfs_ExecFlow(GfsHn gfs);
Sint32 gfs_ExecTrans(GfsHn gfs);
void gfs_SetupFlow(GfsFlow *flow, Sint32 nsct);
void gfs_GetFinfo(GfsFinfo *finfo, Sint32 *fid, Sint32 *fad, Sint32 *sctsz,
                  Sint32 *nsct, Sint32 *lstsz, Sint32 *fn, Sint32 *atr);
void gfs_CloseHn(GfsHn gfs);
Sint32 gfs_GetGmode(GfsHn gfs);
Bool gfs_IsFlowEnd(GfsHn gfs);
Sint32 gfs_SetAstat(GfsHn gfs, Sint32 stat);
Sint32 gfs_WaitNw(GfsHn gfs);
Sint32 gfs_ChkCdStat(GfsHn gfs);
Sint32 gfs_TrFuncNull(void *obj);
void gfs_InitFuncTbl(void);

void GFS_Close(GfsHn gfs);
GfsHn GFS_Open(Sint32 fid);
Sint32 GFS_Tell(GfsHn gfs);
void GFS_GetFileSize(GfsHn gfs, Sint32 *sctsz, Sint32 *nsct, Sint32 *lstsz);
void GFS_GetFileInfo(GfsHn gfs, Sint32 *fid, Sint32 *fn, Sint32 *fsize, Sint32 *atr);
Sint32 GFS_Fread(GfsHn gfs, Sint32 nsct, void *buf, Sint32 bsize);
Sint32 GFS_NwFread(GfsHn gfs, Sint32 nsct, void *buf, Sint32 bsize);
void GFS_NwGetStat(GfsHn gfs, Sint32 *amode, Sint32 *ndata);
Sint32 GFS_NwExecOne(GfsHn gfs);
Sint32 GFS_SetReadPara(GfsHn gfs, Sint32 bsize);
Sint32 GFS_SetDir(GfsDirTbl *dirtbl);
Sint32 GFS_LoadDir(Sint32 fid, GfsDirTbl *dirtbl);
void GFS_GetErrStat(GfsErrStat *stat);

Sint32 GFS_Init(Sint32 open_max, void *work, GfsDirTbl *dirtbl)
{
    Sint32 ret;
    Sint32 nfile;

    D_06070C80 = 0;
    if (open_max < 1 || open_max > GFS_OPEN_MAX) {
        return GFS_ERR_OPENMAX;
    }
    if ((Uint32)work & 3) {
        return GFS_ERR_ALIGN;
    }
    if (dirtbl != NULL) {
        if ((dirtbl->type != GFS_DIR_ID && dirtbl->type != GFS_DIR_NAME)
            || dirtbl->ndir < 2 || dirtbl->dir == NULL) {
            return GFS_ERR_DIRTBL;
        }
    }
    GFS_CHGSCUIM(~0x800, 0);
    D_06070C78 = work;
    gfs_InitMng(open_max);
    ret = func_0606CC64((dirtbl == NULL) ? TRUE : FALSE);
    if (ret != 0) {
        return gfs_SetErr(ret);
    }
    if (!(D_06070C78->flags & 1)) {
        return gfs_SetErr(GFS_ERR_CDNODISC);
    }
    nfile = gfs_ReadRootDir(dirtbl);
    if (nfile < 0) {
        return gfs_SetErr(nfile);
    }
    ret = gfs_SetErr(GFS_ERR_OK);
    if (ret < 0) {
        return ret;
    }
    return nfile;
}

Sint32 GFS_LoadDir(Sint32 fid, GfsDirTbl *dirtbl)
{
    GfsHn gfs;
    Sint32 nsct;
    Sint32 ret;

    if (dirtbl == NULL) {
        if (D_06070C78->curdir.dirtbl.dir != NULL) {
            return gfs_SetErr(GFS_ERR_CDBFS);
        }
        ret = func_060704F6();
        if (ret < 0) {
            return gfs_SetErr(ret);
        }
        return ret;
    }
    gfs = GFS_Open(fid);
    if (gfs == NULL) {
        return D_06070C78->error.code;
    }
    GFS_GetFileSize(gfs, NULL, &nsct, NULL);
    ret = func_060703F4(gfs, dirtbl, nsct);
    GFS_Close(gfs);
    return ret;
}

Sint32 GFS_SetDir(GfsDirTbl *dirtbl)
{
    GfsDirMng *dir = &D_06070C78->curdir;

    if (dirtbl == NULL) {
        if (dir->dirtbl.dir != NULL) {
            return gfs_SetErr(GFS_ERR_CDBFS);
        }
        dir->dirtbl.dir = NULL;
        dir->nfile = 0;
        dir->dirtbl.ndir = 0;
    } else {
        dir->dirtbl = *dirtbl;
        dir->nfile = gfs_CountFiles(dirtbl);
    }
    return gfs_SetErr(GFS_ERR_OK);
}

Sint32 GFS_NameToId(Sint8 *fname)
{
    GfsDirMng *dir = &D_06070C78->curdir;
    Sint32 fid;
    Sint32 ret;

    if (dir->dirtbl.dir == NULL || dir->dirtbl.type != GFS_DIR_NAME) {
        return gfs_SetErr(GFS_ERR_NONAME);
    }
    fid = func_0607045A(dir->dirtbl.dir, fname, dir->dirtbl.ndir);
    if (fid < 0) {
        return gfs_SetErr(GFS_ERR_NEXIST);
    }
    ret = gfs_SetErr(GFS_ERR_OK);
    if (ret < 0) {
        return ret;
    }
    return fid;
}

Sint8 *GFS_IdToName(Sint32 fid)
{
    GfsDirMng *dir = &D_06070C78->curdir;
    Uint8 *rec;

    if (dir->dirtbl.dir == NULL || dir->dirtbl.type != GFS_DIR_NAME) {
        gfs_SetErr(GFS_ERR_NONAME);
        return NULL;
    }
    if (fid < 0 || fid >= dir->nfile) {
        gfs_SetErr(GFS_ERR_NEXIST);
        return NULL;
    }
    rec = func_060704BC(fid, dir->dirtbl.dir);
    if (gfs_SetErr(GFS_ERR_OK) < 0) {
        return NULL;
    }
    return (Sint8 *)(rec + sizeof(CdcFile));
}

Sint32 GFS_GetDirInfo(Sint32 fid, CdcFile *dirrec)
{
    GfsDirMng *dir = &D_06070C78->curdir;
    void *src;

    if (dir->dirtbl.dir == NULL || fid < 0 || fid >= dir->nfile) {
        return gfs_SetErr(GFS_ERR_FID);
    }
    if (dir->dirtbl.type == GFS_DIR_NAME) {
        src = func_060704BC(fid, dir->dirtbl.dir);
    } else {
        src = func_060704AE(fid, dir->dirtbl.dir);
    }
    func_06050850(dirrec, src, sizeof(CdcFile));
    return gfs_SetErr(GFS_ERR_OK);
}

/* Closes every open file (not called by the game). */
void gfs_CloseAll(void)
{
    GfsHn gfs;
    GfsTrans *trn;
    Sint32 i;

    gfs = D_06070C78->file;
    for (i = 0; i < D_06070C78->openmax; i++) {
        if (gfs->used == 1) {
            trn = GFS_FILE_TRN(gfs);
            if (trn->mode == GFS_TMODE_STM) {
                func_0606CC50(gfs, gfs_TrFuncNull, gfs);
            }
            GFS_Close(gfs);
        }
        gfs++;
    }
}

GfsHn GFS_Open(Sint32 fid)
{
    GfsDirMng *dir = &D_06070C78->curdir;
    GfsHn gfs;
    void *rec;

    if (dir->dirtbl.dir != NULL && (fid < 0 || fid >= dir->nfile)) {
        gfs_SetErr(GFS_ERR_FID);
        return NULL;
    }
    gfs = gfs_AllocHn();
    if (gfs == NULL) {
        gfs_SetErr(GFS_ERR_NOHNDL);
        return NULL;
    }
    if (dir->dirtbl.dir == NULL) {
        rec = NULL;
    } else if (dir->dirtbl.type == GFS_DIR_ID) {
        rec = func_060704AE(fid, dir->dirtbl.dir);
    } else {
        rec = func_060704BC(fid, dir->dirtbl.dir);
    }
    gfs = gfs_InitHn(gfs, rec, fid);
    if (gfs == NULL) {
        gfs_SetErr(GFS_ERR_FID);
    } else if (gfs_SetErr(GFS_ERR_OK) < 0) {
        return NULL;
    }
    return gfs;
}

void GFS_Close(GfsHn gfs)
{
    if (gfs != NULL) {
        gfs_StopIn(gfs, TRUE);
        func_0606C218(gfs);
    }
    gfs_SetErr(GFS_ERR_OK);
}

Sint32 GFS_Seek(GfsHn gfs, Sint32 ofs, Sint32 org)
{
    GfsFlow *flow;
    GfsFileFunc *ftbl;
    Sint32 nsct;
    Sint32 ret;
    Sint32 err;

    if (gfs == NULL) {
        return gfs_SetErr(GFS_ERR_HNDL);
    }
    flow = GFS_FILE_FLOW(gfs);
    ftbl = &D_06070C78->functbl[flow->dtsrc.ftype];
    GFS_GetFileSize(gfs, NULL, &nsct, NULL);
    if (org == GFS_SEEK_CUR) {
        ofs += ftbl->tell(flow);
    } else if (org == GFS_SEEK_END) {
        ofs += nsct;
    } else if (org != GFS_SEEK_SET) {
        return gfs_SetErr(GFS_ERR_ORG);
    }
    if (ofs < 0) {
        return gfs_SetErr(GFS_ERR_SEEK);
    }
    if (ofs > nsct) {
        return gfs_SetErr(GFS_ERR_SEEK);
    }
    ret = ftbl->seek(flow, ofs);
    err = gfs_SetErr(GFS_ERR_OK);
    if (err < 0) {
        return err;
    }
    return ret;
}

Sint32 GFS_Tell(GfsHn gfs)
{
    GfsFlow *flow;
    GfsDtsrc *dtsrc;
    GfsFileFunc *ftbl;
    Sint32 ret;
    Sint32 err;

    if (gfs == NULL) {
        return gfs_SetErr(GFS_ERR_HNDL);
    }
    flow = GFS_FILE_FLOW(gfs);
    dtsrc = GFS_FLW_DTSRC(flow);
    ftbl = &D_06070C78->functbl[dtsrc->ftype];
    ret = ftbl->tell(flow);
    err = gfs_SetErr(GFS_ERR_OK);
    if (err < 0) {
        return err;
    }
    return ret;
}

Bool GFS_IsEof(GfsHn gfs)
{
    Sint32 nsct;
    Sint32 pos;

    if (gfs == NULL) {
        return gfs_SetErr(GFS_ERR_HNDL);
    }
    pos = GFS_Tell(gfs);
    GFS_GetFileSize(gfs, NULL, &nsct, NULL);
    gfs_SetErr(GFS_ERR_OK);
    if (pos >= nsct) {
        return TRUE;
    }
    return FALSE;
}

Sint32 GFS_ByteToSct(GfsHn gfs, Sint32 nbyte)
{
    Uint32 sctsz;
    Sint32 err;

    if (gfs == NULL) {
        return gfs_SetErr(GFS_ERR_HNDL);
    }
    GFS_GetFileSize(gfs, (Sint32 *)&sctsz, NULL, NULL);
    if (sctsz == 0) {
        return 0;
    }
    err = gfs_SetErr(GFS_ERR_OK);
    if (err < 0) {
        return err;
    }
    return (nbyte + sctsz - 1) / sctsz;
}

void GFS_GetFileSize(GfsHn gfs, Sint32 *sctsz, Sint32 *nsct, Sint32 *lstsz)
{
    GfsFlow *flow;
    Sint32 atr;

    if (gfs == NULL) {
        gfs_SetErr(GFS_ERR_HNDL);
    } else {
        flow = GFS_FILE_FLOW(gfs);
        gfs_GetFinfo(&flow->finfo, NULL, NULL, sctsz, nsct, lstsz, NULL, &atr);
        if ((atr & 8) && (atr & 16)) {
            *sctsz = 0;
        }
    }
    gfs_SetErr(GFS_ERR_OK);
}

void GFS_GetFileInfo(GfsHn gfs, Sint32 *fid, Sint32 *fn, Sint32 *fsize, Sint32 *atr)
{
    GfsFlow *flow;
    Sint32 nsct;
    Sint32 lstsz;

    if (gfs == NULL) {
        gfs_SetErr(GFS_ERR_HNDL);
    } else {
        flow = GFS_FILE_FLOW(gfs);
        gfs_GetFinfo(&flow->finfo, fid, NULL, NULL, &nsct, &lstsz, fn, atr);
        if (atr != NULL) {
            *atr &= ~6;
        }
        if (fsize != NULL) {
            *fsize = (nsct - 1) * GFS_SCT_SIZE + lstsz;
        }
    }
    gfs_SetErr(GFS_ERR_OK);
}

Sint32 GFS_GetNumCdbuf(GfsHn gfs)
{
    if (gfs == NULL) {
        return gfs_SetErr(GFS_ERR_HNDL);
    }
    return func_0606C336(gfs);
}

Sint32 GFS_Load(Sint32 fid, Sint32 ofs, void *buf, Sint32 bsize)
{
    GfsHn gfs;
    GfsFlow *flow;
    Sint32 sctsz;
    Sint32 dsize;
    Sint32 nsct;
    Sint32 need;
    Sint32 ret;

    gfs = GFS_Open(fid);
    if (gfs == NULL) {
        return D_06070C78->error.code;
    }
    if (GFS_Seek(gfs, ofs, GFS_SEEK_SET) < 0) {
        return gfs_SetErr(GFS_ERR_OFS);
    }
    flow = GFS_FILE_FLOW(gfs);
    sctsz = dsize = flow->finfo.sctsz;
    if (sctsz == 0) {
        sctsz = 2324;
        dsize = 2048;
    }
    nsct = flow->finfo.nsct - ofs;
    if (bsize == -1) {
        bsize = sctsz * nsct;
    }
    need = (bsize + sctsz - 1) / dsize;
    if (nsct >= need) {
        nsct = need;
    }
    ret = GFS_Fread(gfs, nsct, buf, bsize);
    GFS_Close(gfs);
    if (ret >= 0) {
        gfs_SetErr(GFS_ERR_OK);
    }
    return ret;
}

Sint32 GFS_Fread(GfsHn gfs, Sint32 nsct, void *buf, Sint32 bsize)
{
    Sint32 ndata;
    Sint32 amode;
    Sint32 ret;
    Sint32 old;

    if (gfs == NULL) {
        return gfs_SetErr(GFS_ERR_HNDL);
    }
    ret = GFS_NwFread(gfs, nsct, buf, bsize);
    if (ret != 0) {
        return ret;
    }
    old = GFS_SetReadPara(gfs, 0x7FFFFFFF);
    ret = gfs_WaitNw(gfs);
    if (ret < 0) {
        ndata = gfs_SetErr(ret);
    } else {
        GFS_NwGetStat(gfs, &amode, &ndata);
        ret = gfs_SetErr(GFS_ERR_OK);
        if (ret < 0) {
            return ret;
        }
    }
    if (old >= 0) {
        GFS_SetReadPara(gfs, old);
    }
    return ndata;
}

/* Runs the server until the read on gfs is done. */
Sint32 gfs_WaitNw(GfsHn gfs)
{
    GfsDtsrc *dtsrc;
    GfsTrans *trn;
    Sint32 atr;
    Sint32 cnt;
    Sint32 ret;

    dtsrc = &gfs->flow.dtsrc;
    trn = &gfs->trn;
    GFS_GetFileInfo(gfs, NULL, NULL, NULL, &atr);
    if (atr & GFS_ATR_CDDA) {
        cnt = -1;
    } else {
        cnt = 0;
    }
    for (;;) {
        ret = GFS_NwExecOne(gfs);
        if (ret == 0 || ret < 0) {
            break;
        }
        if (trn->stat == 6) {
            if (dtsrc->ftype != GFS_FTYPE_CD || D_06070C94 < dtsrc->src[10]
                || D_06070C90 != 2) {
                break;
            }
        }
        if (trn->wp == 0 && cnt >= 0) {
            cnt++;
            if (cnt > 300000) {
                return GFS_ERR_TMOUT;
            }
        }
    }
    return ret;
}

Sint32 GFS_NwFread(GfsHn gfs, Sint32 nsct, void *buf, Sint32 bsize)
{
    GfsFlow *flow;
    GfsTrans *trn;
    Sint32 rest;
    Sint32 n;
    Sint32 ec;
    Sint32 atr;
    Sint32 total;
    Bool started = FALSE;

    if (gfs == NULL) {
        ec = GFS_ERR_HNDL;
    } else {
        flow = GFS_FILE_FLOW(gfs);
        trn = GFS_FILE_TRN(gfs);
        total = flow->finfo.nsct;
        rest = total - GFS_Tell(gfs);
        if (rest < nsct) {
            n = rest;
        } else {
            n = nsct;
        }
        if (n < 0) {
            ec = GFS_ERR_PARA;
        } else {
            if (gfs->amode == 0) {
                gfs_SetupFlow(flow, n);
                started = TRUE;
            }
            gfs->amode = 1;
            GFS_GetFileInfo(gfs, NULL, NULL, NULL, &atr);
            if (atr & GFS_ATR_CDDA) {
                func_0606C406(trn, 0);
                func_0606CC44(trn, NULL, 0, 1);
            } else if (trn->stat == 0 || trn->stat == 6) {
                func_0606C406(trn, n);
                func_0606CC44(trn, buf, bsize, 1);
                func_0606C456(trn);
                started = TRUE;
            }
            if (!started) {
                ec = GFS_ERR_FBUSY;
            } else {
                gfs_AddSvr(gfs);
                gfs->astat = 1;
                ec = GFS_ERR_OK;
            }
        }
    }
    return gfs_SetErr(ec);
}

Sint32 GFS_NwCdRead(GfsHn gfs, Sint32 nsct)
{
    GfsFlow *flow;
    Sint32 total;
    Sint32 rest;
    Sint32 n;

    if (gfs == NULL) {
        return gfs_SetErr(GFS_ERR_HNDL);
    }
    flow = GFS_FILE_FLOW(gfs);
    if (gfs->amode != 0) {
        return gfs_SetErr(GFS_ERR_FBUSY);
    }
    total = flow->finfo.nsct;
    rest = total - GFS_Tell(gfs);
    if (rest < nsct) {
        n = rest;
    } else {
        n = nsct;
    }
    gfs_SetupFlow(flow, n);
    gfs->amode = 2;
    gfs->astat = 1;
    gfs_AddSvr(gfs);
    return gfs_SetErr(GFS_ERR_OK);
}

Bool GFS_NwIsComplete(GfsHn gfs)
{
    if (gfs == NULL) {
        gfs_SetErr(GFS_ERR_HNDL);
        return TRUE;
    }
    if (gfs_SetErr(GFS_ERR_OK) < 0) {
        return TRUE;
    }
    if (gfs->astat == 0) {
        return TRUE;
    }
    return FALSE;
}

Sint32 GFS_NwStop(GfsHn gfs)
{
    Sint32 pos;
    Sint32 err;

    if (gfs == NULL) {
        return gfs_SetErr(GFS_ERR_HNDL);
    }
    gfs->amode = 0;
    gfs->astat = 0;
    gfs_DelSvr(gfs);
    gfs_StopIn(gfs, (gfs_GetGmode(gfs) != 0) ? TRUE : FALSE);
    pos = GFS_Tell(gfs);
    err = gfs_SetErr(GFS_ERR_OK);
    if (err < 0) {
        return err;
    }
    return pos;
}

void GFS_NwGetStat(GfsHn gfs, Sint32 *amode, Sint32 *ndata)
{
    GfsTrans *trn;
    Sint32 atr;

    if (gfs == NULL) {
        gfs_SetErr(GFS_ERR_HNDL);
    } else {
        trn = GFS_FILE_TRN(gfs);
        *amode = gfs->amode;
        GFS_GetFileInfo(gfs, NULL, NULL, NULL, &atr);
        if (atr & GFS_ATR_CDDA) {
            *ndata = 0;
        } else if (gfs->amode == 2) {
            *ndata = func_0606C336(gfs);
        } else {
            *ndata = trn->wp;
        }
    }
    gfs_SetErr(GFS_ERR_OK);
}

Sint32 gfs_ChkCdStat(GfsHn gfs)
{
    GfsFlow *flow = GFS_FILE_FLOW(gfs);
    GfsDtsrc *dtsrc = GFS_FLW_DTSRC(flow);
    Sint32 stat;

    if (dtsrc->ftype == GFS_FTYPE_CD) {
        stat = func_0606D074();
        if (stat == 2) {
            gfs->astat = 1;
        }
    }
    return gfs->astat;
}

Sint32 GFS_NwExecOne(GfsHn gfs)
{
    Sint32 stat;
    Sint32 ret;

    if (gfs == NULL) {
        return gfs_SetErr(GFS_ERR_HNDL);
    }
    if (gfs->astat != 0) {
        if (D_06070C80 == 1) {
            func_0606C5DC(gfs, &stat);
            if (D_06070C80 == 1) {
                return gfs->astat;
            }
        }
        if (gfs->astat == -1) {
            return gfs_ChkCdStat(gfs);
        }
        ret = gfs_ExecFlow(gfs);
        if (ret < 0) {
            return ret;
        }
        if (gfs->flow.stat != 0) {
            ret = gfs_ExecTrans(gfs);
            if (ret == 6) {
                ret = gfs_ExecFlow(gfs);
                if (ret < 0) {
                    return ret;
                }
                if (gfs_IsFlowEnd(gfs)) {
                    gfs->amode = 0;
                    gfs->astat = 0;
                    gfs_DelSvr(gfs);
                }
            }
        }
    }
    ret = gfs_SetErr(GFS_ERR_OK);
    if (ret < 0) {
        return ret;
    }
    return gfs->astat;
}

Sint32 GFS_NwExecServer(GfsHn *now_gfs)
{
    GfsSvr *svr;
    Sint32 i;
    Sint32 stat;

    svr = &D_06070C78->svr;
    for (i = 0; i < svr->nfile; i++) {
        stat = GFS_NwExecOne(svr->access_file[i]);
        if (stat < 0) {
            break;
        }
        if (stat == 0) {
            i--;
        }
    }
    if (svr->nfile == 0) {
        *now_gfs = NULL;
        stat = 0;
    } else {
        *now_gfs = svr->access_file[0];
        if (stat == GFS_ERR_PUINUSE && i > 0) {
            stat = 1;
        }
    }
    return stat;
}

Sint32 GFS_SetGmode(GfsHn gfs, Sint32 gmode)
{
    GfsFlow *flow;
    Sint32 atr;
    Sint32 old;
    Sint32 err;

    if (gfs == NULL) {
        return gfs_SetErr(GFS_ERR_HNDL);
    }
    GFS_GetFileInfo(gfs, NULL, NULL, NULL, &atr);
    if (atr & GFS_ATR_CDDA) {
        return GFS_ERR_PARA;
    }
    flow = GFS_FILE_FLOW(gfs);
    old = flow->gmode;
    flow->gmode = gmode;
    err = gfs_SetErr(GFS_ERR_OK);
    if (err < 0) {
        return err;
    }
    return old;
}

Sint32 GFS_SetTmode(GfsHn gfs, Sint32 tmode)
{
    GfsFlow *flow;
    Sint32 atr;
    Sint32 err;

    if (gfs == NULL) {
        return gfs_SetErr(GFS_ERR_HNDL);
    }
    GFS_GetFileInfo(gfs, NULL, NULL, NULL, &atr);
    if (atr & GFS_ATR_CDDA) {
        return GFS_ERR_PARA;
    }
    flow = GFS_FILE_FLOW(gfs);
    tmode = func_0606C3F6(GFS_FILE_TRN(gfs), tmode);
    err = gfs_SetErr(GFS_ERR_OK);
    if (err < 0) {
        return err;
    }
    return tmode;
}

Sint32 GFS_SetReadPara(GfsHn gfs, Sint32 bsize)
{
    GfsFlow *flow;
    Sint32 atr;
    Sint32 old;
    Sint32 err;

    if (gfs == NULL) {
        return gfs_SetErr(GFS_ERR_HNDL);
    }
    GFS_GetFileInfo(gfs, NULL, NULL, NULL, &atr);
    if (atr & GFS_ATR_CDDA) {
        return GFS_ERR_PARA;
    }
    flow = GFS_FILE_FLOW(gfs);
    old = flow->sctmax;
    flow->sctmax = bsize;
    err = gfs_SetErr(GFS_ERR_OK);
    if (err < 0) {
        return err;
    }
    return old;
}

Sint32 GFS_SetTransPara(GfsHn gfs, Sint32 tsize)
{
    Sint32 atr;
    Sint32 err;

    if (gfs == NULL) {
        return gfs_SetErr(GFS_ERR_HNDL);
    }
    GFS_GetFileInfo(gfs, NULL, NULL, NULL, &atr);
    if (atr & GFS_ATR_CDDA) {
        return GFS_ERR_PARA;
    }
    tsize = func_0606C450(GFS_FILE_TRN(gfs), tsize);
    err = gfs_SetErr(GFS_ERR_OK);
    if (err < 0) {
        return err;
    }
    return tsize;
}

Sint32 GFS_SetTrFunc(GfsHn gfs, Sint32 (*func)(void *obj))
{
    if (gfs == NULL) {
        return gfs_SetErr(GFS_ERR_HNDL);
    }
    func_0606CC44(GFS_FILE_TRN(gfs), NULL, 0xFFFFF, GFS_SCT_SIZE);
    func_0606C3F6(GFS_FILE_TRN(gfs), GFS_TMODE_STM);
    return func_0606CC50(gfs, func, gfs);
}

void *GFS_StartTrans(GfsHn gfs, Sint32 *dadr)
{
    GfsFlow *flow;
    GfsDtsrc *dtsrc;
    GfsDataPack *dps;

    if (gfs == NULL) {
        gfs_SetErr(GFS_ERR_HNDL);
        return NULL;
    }
    flow = GFS_FILE_FLOW(gfs);
    dtsrc = GFS_FLW_DTSRC(flow);
    dps = gfs->trn.dps;
    if (dtsrc->ftype == GFS_FTYPE_CD) {
        func_0606D8D4(dps, dtsrc);
    }
    *dadr = dps->adlt;
    return dps->data;
}

Sint32 GFS_CdMovePickup(GfsHn gfs)
{
    GfsFlow *flow;
    GfsDtsrc *dtsrc;
    Sint32 ret;

    if (gfs == NULL) {
        ret = GFS_ERR_HNDL;
    } else {
        flow = GFS_FILE_FLOW(gfs);
        dtsrc = GFS_FLW_DTSRC(flow);
        if (dtsrc->ftype == GFS_FTYPE_CD) {
            ret = func_0606D0D8(flow, GFS_Tell(gfs));
            if (ret != 0) {
                return gfs_SetErr(ret);
            }
            D_06070C78->pickup = gfs;
        }
        ret = GFS_ERR_OK;
    }
    return gfs_SetErr(ret);
}

void GFS_SetErrFunc(GfsErrFunc func, void *obj)
{
    D_06070C78->error.func = func;
    D_06070C78->error.obj = obj;
    gfs_SetErr(GFS_ERR_OK);
}

void GFS_GetErrStat(GfsErrStat *stat)
{
    *stat = D_06070C78->error;
}

/* FAD of a sector of the disc, moved by the session offset on multi-session discs
   (not called by the game). */
Sint32 gfs_ConvSesFad(Sint32 fad)
{
    if (GFS_IS_MULTISES() == TRUE) {
        fad += GFS_BIOS_SESFAD;
    }
    return fad;
}

/* Reads the root directory into dirtbl and makes it current. */
Sint32 gfs_ReadRootDir(GfsDirTbl *dirtbl)
{
    GfsDirMng *dir;
    Sint32 nfile;

    if (GFS_IS_MULTISES() == TRUE) {
        if (dirtbl != NULL) {
            func_0606DA14(TRUE);
        }
        if (func_060704F2() < 0) {
            return gfs_SetErr(GFS_ERR_CDBFS);
        }
        nfile = 0;
        dir = &D_06070C78->curdir;
        dir->dirtbl.dir = NULL;
        dir->nfile = nfile;
        dir->dirtbl.ndir = nfile;
        GFS_SetDir(NULL);
        if (dirtbl != NULL) {
            func_0606DA14(FALSE);
        }
        nfile = GFS_LoadDir(GFS_BIOS_SESFID, dirtbl);
    } else if (dirtbl == NULL) {
        nfile = func_060704F2();
        if (nfile < 0) {
            return gfs_SetErr(GFS_ERR_CDBFS);
        }
    } else {
        nfile = gfs_LoadRootDir(dirtbl);
        if (nfile <= 0) {
            return gfs_SetErr(nfile);
        }
    }
    GFS_SetDir(dirtbl);
    gfs_SetErr(GFS_ERR_OK);
    return nfile;
}

Sint32 gfs_TrFuncNull(void *obj)
{
    return 0;
}

void gfs_InitFuncTbl(void)
{
    GfsFileFunc *ftbl = &D_06070C78->functbl[GFS_FTYPE_CD];

    ftbl->flowin = func_0606CE76;
    ftbl->stopin = func_0606CFDC;
    ftbl->seek = D_0606D0D2;
    ftbl->tell = func_0606D0C6;
}

void gfs_InitMng(Sint32 openmax)
{
    GfsHn gfs;
    GfsDataPack *dpk;
    Sint32 i;

    D_06070C78->openmax = openmax;
    gfs_InitFuncTbl();
    D_06070C78->svr.nfile = 0;
    D_06070C78->pickup = D_06070C78->trans = NULL;
    D_06070C78->sfad = D_06070C78->efad = 0;
    D_06070C78->error.func = NULL;
    D_06070C78->flags = 0;
    gfs = D_06070C78->file;
    for (i = 0; i < openmax; i++) {
        gfs->used = 0;
        gfs++;
    }
    dpk = &D_06070C78->srcpk;
    dpk->data = NULL;
    dpk->adlt = dpk->len = dpk->nsct = 0;
    dpk->use = FALSE;
    dpk = &D_06070C78->dstpk;
    dpk->data = NULL;
    dpk->adlt = dpk->len = dpk->nsct = 0;
    dpk->use = FALSE;
}

/* Number of entries in a directory table, up to the end-of-table entry. */
Sint32 gfs_CountFiles(GfsDirTbl *dirtbl)
{
    Sint32 i;
    Uint32 atr;
    Uint32 end = GFS_ATR_END_TBL;

    for (i = 0; i < dirtbl->ndir; i++) {
        if (dirtbl->type == GFS_DIR_ID) {
            atr = func_060704CC(i, dirtbl->dir);
        } else {
            atr = func_060704DE(i, dirtbl->dir);
        }
        if ((atr & end) && end) {
            break;
        }
    }
    if (i > dirtbl->ndir) {
        return 0;
    }
    return i + 1;
}

GfsHn gfs_AllocHn(void)
{
    GfsMng *mng = D_06070C78;
    GfsHn gfs;
    Sint32 i;

    gfs = mng->file;
    for (i = 0; i < mng->openmax; i++) {
        if (gfs->used == 0) {
            break;
        }
        gfs++;
    }
    if (i == mng->openmax) {
        gfs = NULL;
    } else {
        gfs->used = 1;
    }
    return gfs;
}

void gfs_FreeHn(GfsHn gfs)
{
    gfs->used = 0;
}

/* Stops the transfer and the CD read of gfs. */
void gfs_StopIn(GfsHn gfs, Bool flag)
{
    GfsFlow *flow = GFS_FILE_FLOW(gfs);
    GfsFileFunc *ftbl;
    GfsHn pickup;
    Sint32 ftype;

    if (D_06070C78->trans == gfs) {
        D_06070C78->trans = NULL;
        func_0606C462(gfs, -1);
    }
    pickup = D_06070C78->pickup;
    ftype = flow->dtsrc.ftype;
    if (pickup == gfs || (ftype != GFS_FTYPE_CD && pickup == NULL)) {
        D_06070C78->pickup = NULL;
        ftbl = &D_06070C78->functbl[ftype];
        ftbl->stopin(flow, flag);
        flow->stat = 0;
        flow->sctcnt = 0;
    }
}

Sint32 gfs_SetErr(Sint32 code)
{
    GfsErrStat *err;

    switch (D_06070C98) {
    case -16:
        code = GFS_ERR_FATAL;
        break;
    case -14:
        code = GFS_ERR_CDNODISC;
        break;
    case -13:
        code = GFS_ERR_CDOPEN;
        break;
    case 0:
        break;
    default:
        break;
    }
    err = &D_06070C78->error;
    err->code = code;
    if (code != GFS_ERR_OK && err->func != NULL) {
        err->func(err->obj, code);
    }
    return code;
}

Sint32 gfs_FindSvr(GfsHn gfs)
{
    GfsSvr *svr = &D_06070C78->svr;
    Sint32 i;

    for (i = 0; i < svr->nfile; i++) {
        if (svr->access_file[i] == gfs) {
            break;
        }
    }
    if (i == svr->nfile) {
        i = -1;
    }
    return i;
}

void gfs_AddSvr(GfsHn gfs)
{
    GfsSvr *svr;
    Sint32 i;

    i = gfs_FindSvr(gfs);
    if (i == -1) {
        svr = &D_06070C78->svr;
        svr->access_file[svr->nfile] = gfs;
        svr->nfile++;
    }
}

void gfs_DelSvr(GfsHn gfs)
{
    GfsSvr *svr;
    Sint32 i;
    Sint32 n;

    if (gfs == NULL) {
        return;
    }
    i = gfs_FindSvr(gfs);
    if (i == -1) {
        return;
    }
    svr = &D_06070C78->svr;
    n = --svr->nfile;
    for (; i < n; i++) {
        svr->access_file[i] = svr->access_file[i + 1];
    }
    svr->access_file[i] = NULL;
}

GfsHn gfs_InitHn(GfsHn gfs, CdcFile *dirrec, Sint32 fid)
{
    if (gfs == NULL) {
        return NULL;
    }
    func_0606C3C0(GFS_FILE_TRN(gfs));
    if (func_0606CCEE(GFS_FILE_FLOW(gfs), dirrec, fid) == 0) {
        return NULL;
    }
    gfs->amode = 0;
    gfs->astat = 0;
    return gfs;
}

/* Reads the primary volume descriptor (sector 16) into buf and checks it. */
Sint32 gfs_ReadPvd(Uint8 *buf)
{
    GfsHn gfs;
    CdcFile rec;
    GfsErrStat stat;
    Sint32 ret;

    CDC_FILE_FAD(&rec) = func_0606DD5E() + 166;
    CDC_FILE_SIZE(&rec) = GFS_SCT_SIZE;
    CDC_FILE_FN(&rec) = 0;
    CDC_FILE_ATR(&rec) = 0;
    CDC_FILE_UNIT(&rec) = 0;
    CDC_FILE_GAP(&rec) = 0;
    gfs = gfs_InitHn(gfs_AllocHn(), &rec, 0);
    if (gfs == NULL) {
        return -1;
    }
    if (GFS_Fread(gfs, 1, buf, GFS_SCT_SIZE) != GFS_SCT_SIZE) {
        return -1;
    }
    GFS_GetErrStat(&stat);
    ret = (&stat)->code;
    if (ret == GFS_ERR_OK) {
        if (func_060509F0(buf, D_0607110C, 6) != 0) {
            ret = GFS_ERR_CDROM;
        }
    }
    GFS_Close(gfs);
    return ret;
}

/* Directory record of the root directory, from the volume descriptor. */
Sint32 gfs_GetRootRec(CdcFile *rec)
{
    Uint8 *drec;
    Sint32 size;
    Sint32 ret;

    if (!(D_06070C78->flags & 1)) {
        return GFS_ERR_CDNODISC;
    }
    ret = gfs_ReadPvd(D_06070C78->sect_buf);
    if (ret != 0) {
        return ret;
    }
    drec = D_06070C78->sect_buf + 0x9C;
    func_06050850(rec, drec + 6, 4);
    rec->fad += 150;
    if ((Sint32)rec->fad < 166) {
        return GFS_ERR_CDROM;
    }
    func_06050850(&size, drec + 14, 4);
    if (size <= 0) {
        return GFS_ERR_CDROM;
    }
    rec->size = ((size + GFS_SCT_SIZE - 1) / GFS_SCT_SIZE) * GFS_SCT_SIZE;
    rec->fn = 0;
    rec->atr = GFS_ATR_DIR;
    rec->unit = 0;
    rec->gap = 0;
    return GFS_ERR_OK;
}

Sint32 gfs_LoadRootDir(GfsDirTbl *dirtbl)
{
    CdcFile rec;
    GfsHn gfs;
    Sint32 ret;
    Sint32 nfile;

    ret = gfs_GetRootRec(&rec);
    if (ret != 0) {
        gfs = NULL;
    } else {
        gfs = gfs_InitHn(gfs_AllocHn(), &rec, 0);
    }
    if ((D_06070C78->flags & 1) && gfs == NULL) {
        return ret;
    }
    nfile = func_060703F4(gfs, dirtbl, CDC_FILE_SIZE(&rec));
    if (gfs != NULL) {
        GFS_Close(gfs);
    }
    return nfile;
}

Sint32 gfs_ExecFlow(GfsHn gfs)
{
    GfsFlow *flow = GFS_FILE_FLOW(gfs);
    GfsFileFunc *ftbl;
    GfsMng *mng;
    Sint32 stat;

    if (flow->stat == 4) {
        return flow->stat;
    }
    mng = D_06070C78;
    if (mng->pickup != NULL && mng->pickup != gfs) {
        return 7;
    }
    ftbl = &mng->functbl[flow->dtsrc.ftype];
    stat = ftbl->flowin(flow);
    if (stat == 1) {
        D_06070C78->pickup = gfs;
    } else if (stat == 4) {
        if (D_06070C78->pickup == gfs) {
            D_06070C78->pickup = NULL;
            D_06070C78->efad = 0;
            D_06070C78->sfad = 0;
        }
    }
    flow->stat = stat;
    return gfs_SetAstat(gfs, stat);
}

Sint32 gfs_ExecTrans(GfsHn gfs)
{
    GfsHn trans;
    Sint32 atr;
    Sint32 stat;
    Sint32 tmp;

    trans = D_06070C78->trans;
    if (trans != gfs && trans != NULL) {
        return 1;
    }
    GFS_GetFileInfo(gfs, NULL, NULL, NULL, &atr);
    if (atr & GFS_ATR_CDDA) {
        return 6;
    }
    if (func_0606CBC6(GFS_FILE_TRN(gfs)) == 0) {
        stat = func_0606C56E(gfs);
    } else {
        stat = func_0606C4FC(gfs, &tmp);
    }
    if (stat == 6) {
        if (D_06070C78->trans == gfs) {
            D_06070C78->trans = NULL;
        }
    } else if (D_06070C78->trans == NULL) {
        D_06070C78->trans = gfs;
    }
    return stat;
}

/* FAD of sector spos of file fid, for interleaved files (not called by the game). */
Sint32 gfs_GetSctFad(Sint32 fid, Sint32 spos)
{
    CdcFile rec;
    Sint32 ret;
    Sint32 unit;

    ret = GFS_GetDirInfo(fid, &rec);
    if (ret < 0) {
        return ret;
    }
    unit = CDC_FILE_UNIT(&rec);
    if (unit == 0) {
        return CDC_FILE_FAD(&rec) + spos;
    }
    return CDC_FILE_FAD(&rec) + (spos / unit) * (CDC_FILE_GAP(&rec) + unit);
}

void gfs_SetupFlow(GfsFlow *flow, Sint32 nsct)
{
    GfsDtsrc *dtsrc = GFS_FLW_DTSRC(flow);

    if (dtsrc->ftype == GFS_FTYPE_CD) {
        func_0606CDD6(flow, nsct);
    } else {
        flow->sct = nsct;
        flow->sctcnt = 0;
    }
    flow->stat = 0;
}

void gfs_GetFinfo(GfsFinfo *finfo, Sint32 *fid, Sint32 *fad, Sint32 *sctsz,
                  Sint32 *nsct, Sint32 *lstsz, Sint32 *fn, Sint32 *atr)
{
    if (fid != NULL) {
        *fid = finfo->fid;
    }
    if (fad != NULL) {
        *fad = finfo->finfo.fad;
    }
    if (sctsz != NULL) {
        *sctsz = finfo->sctsz;
    }
    if (nsct != NULL) {
        *nsct = finfo->nsct;
    }
    if (lstsz != NULL) {
        *lstsz = finfo->sctsz - finfo->lstrm;
    }
    if (fn != NULL) {
        *fn = finfo->finfo.fn;
    }
    if (atr != NULL) {
        *atr = finfo->finfo.atr;
    }
}

void gfs_CloseHn(GfsHn gfs)
{
    GfsDtsrc *dtsrc;

    if (gfs != NULL) {
        dtsrc = GFS_FLW_DTSRC(GFS_FILE_FLOW(gfs));
        gfs_DelSvr(gfs);
        gfs_FreeHn(gfs);
        func_0606D590(dtsrc);
    }
}

Sint32 gfs_GetGmode(GfsHn gfs)
{
    GfsFlow *flow = GFS_FILE_FLOW(gfs);

    return flow->gmode;
}

Bool gfs_IsFlowEnd(GfsHn gfs)
{
    GfsFlow *flow = GFS_FILE_FLOW(gfs);
    Sint32 atr;

    GFS_GetFileInfo(gfs, NULL, NULL, NULL, &atr);
    if (flow->stat == 4) {
        if (func_0606C336(gfs) == 0 || (atr & GFS_ATR_CDDA)) {
            return TRUE;
        }
    }
    return FALSE;
}

/* Turns a flow status into the access status of gfs. */
Sint32 gfs_SetAstat(GfsHn gfs, Sint32 stat)
{
    Sint32 ec;

    switch (stat) {
    case 3:
        if (gfs_GetGmode(gfs) == 1) {
            gfs->astat = GFS_ERR_BFUL;
            return gfs_SetErr(GFS_ERR_BFUL);
        }
        return 0;
    case 5:
        gfs->astat = ec = GFS_ERR_CDOPEN;
        break;
    case 6:
        gfs->astat = ec = GFS_ERR_CDNODISC;
        break;
    case 7:
        gfs->astat = ec = GFS_ERR_PUINUSE;
        break;
    case 8:
        gfs->astat = ec = GFS_ERR_CDRD;
        break;
    case 9:
        gfs->astat = ec = GFS_ERR_FATAL;
        break;
    default:
        gfs->astat = 1;
        return 0;
    }
    return gfs_SetErr(ec);
}
