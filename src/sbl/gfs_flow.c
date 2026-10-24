/* shc-flags: -macsave=0 -define=NONMATCHING */
#include "sbl/types.h"
#include "sbl/gfs_trn.h"

/* GFS read flow: file info and keeping the CD reading the sectors a file needs. */

#define GFS_SCT_BYTES 0x800

#define GFS_ATR_CDDA  0x40
#define GFS_ATR_FORM2 0x10
#define GFS_ATR_FORM1 0x08

/* CD play/seek position (as in the CDC library) */
typedef struct {
    Sint32 ptype;
    Sint32 fad;
} GfsCdPos;

typedef struct {
    GfsCdPos start;
    GfsCdPos end;
    Uint8 pmode;
} GfsCdPly;

typedef struct {
    Uint8 status;
    Uint8 flgrep;
    Uint8 ctladr;
    Uint8 tno;
    Uint8 idx;
    Sint32 fad;
} GfsCdStat;

extern Sint32 D_06070C90;       /* last CD state (gfsFlow_GetCdStat) */
extern Sint32 D_06070C94;       /* last CD pickup FAD */
extern Sint32 gfcd_err;       /* CD error, 0 if none */

extern Sint32 gfcf_Open(GfsFlow *flow);
extern Sint32 gfcf_GetNumSct(GfsFlow *flow, Sint32 max, Sint32 flag);
extern void gfcf_Flush(GfsDtsrc *dtsrc);
extern Sint32 gfcf_Tell(GfsDtsrc *dtsrc);
extern Sint32 gfcf_Seek(GfsFlow *flow, Sint32 n, Sint32 flag);
extern Sint32 gfcf_CdSeek(GfsDtsrc *dtsrc, void *pos);
extern Sint32 gfcf_SetCdCon(GfsDtsrc *dtsrc);
extern Sint32 gfcf_Lock(GfsDtsrc *dtsrc);
extern Sint32 gfcf_IsLocked(GfsDtsrc *dtsrc);
extern void gfcf_Unlock(GfsDtsrc *dtsrc);
extern Sint32 gfcd_Init(void *cd, Uint32 arg);
extern Sint32 gfcd_Play(GfsCdPly *ply, Sint32 arg);
extern Sint32 gfcd_GetStat(GfsCdStat *stat);
extern Sint32 gfcd_GetFileInfo(Sint32 fid, GfsDirRec *rec);
extern Sint32 gfcd_GetFreeSiz(void);
extern void gfcd_WaitPause(void);

Sint32 gfsFlow_SctToFad(GfsFlow *flow, Sint32 sct);
Sint32 gfsFlow_GetCdStat(Sint32 *fad, Sint32 *flag);
static Sint32 gfsFlow_SctSize(Sint32 atr);
static Sint32 gfsFlow_CheckCd(GfsFlow *flow, Sint32 cdstat, Sint32 *ret);
static Sint32 gfsFlow_SetRange(GfsFlow *flow, Sint32 *nsct, Sint32 *ret);

#ifdef NONMATCHING
/* NONMATCHING: target gives every case its own epilogue and branches around the case bodies */
Sint32 gfsFlow_InitCd(Sint32 arg)
{
    Sint32 ret;

    D_06070C78->flags &= ~1;
    ret = gfcd_Init(D_06070C78->cd, arg);
    if (ret == 0) {
        D_06070C78->flags |= 1;
    }
    switch (ret) {
    case 0:
        return 0;
    case -13:
        return -23;
    case -14:
        return -2;
    case -15:
        return -3;
    case -16:
        return -25;
    default:
        return -1;
    }
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: target multiplies by 0x800 with mul.l and does not merge the two return FALSE paths */
Sint32 gfsFlow_Init(GfsFlow *flow, GfsDirRec *rec, Sint32 fid)
{
    GfsFinfo *finfo = &flow->finfo;
    Sint32 size;

    if (rec == NULL) {
        finfo->fid = fid;
        if (gfcd_GetFileInfo(fid, &finfo->rec) != 0) {
            return FALSE;
        }
        size = finfo->rec.size;
    } else {
        size = rec->size;
        if (rec->atr & 0x80) {
            /* directories are whole sectors */
            size = (size + GFS_SCT_BYTES - 1) / GFS_SCT_BYTES * GFS_SCT_BYTES;
        }
        finfo->fid = fid;
        finfo->rec.fad = rec->fad;
        finfo->rec.size = size;
        finfo->rec.unit = rec->unit;
        finfo->rec.gap = rec->gap;
        finfo->rec.fn = rec->fn;
        finfo->rec.atr = rec->atr;
    }
    /* reads rec->atr even when rec is NULL, as the original does */
    finfo->sctsz = gfsFlow_SctSize(rec->atr);
    finfo->nsct = (Uint32)(size + GFS_SCT_BYTES - 1) >> 11;
    if (finfo->sctsz == 0) {
        finfo->lstrm = 0;
    } else {
        finfo->lstrm = (GFS_SCT_BYTES - size % GFS_SCT_BYTES) % GFS_SCT_BYTES;
    }
    if (!gfcf_Open(flow)) {
        return FALSE;
    }
    flow->gmode = 0;
    flow->stat = 0;
    flow->sctcnt = 0;
    flow->sct = 0;
    flow->sctmax = 0x7FFFFFFF;
    return TRUE;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: code matches; its literal pool is placed inside gfsFlow_Read in the target */
void gfsFlow_SetSct(GfsFlow *flow, Sint32 sct)
{
    Sint32 n;

    flow->sct = sct;
    n = gfcf_GetNumSct(flow, 0x7FFFFFFF, 0);
    if (n < 0) {
        n = 0;
    }
    flow->sctcnt = (n < sct) ? n : sct;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: target loads the stacked pointer args into r0 for the NULL tests; SHC 5.0 uses r3 */
void gfsFlow_GetFinfo(GfsFinfo *finfo, Sint32 *fid, Sint32 *fad, Sint32 *sctsz,
                      Sint32 *nsct, Sint32 *lsize, Sint32 *fn, Sint32 *atr)
{
    if (fid != NULL) {
        *fid = finfo->fid;
    }
    if (fad != NULL) {
        *fad = finfo->rec.fad;
    }
    if (fn != NULL) {
        *fn = finfo->rec.fn;
    }
    if (sctsz != NULL) {
        *sctsz = finfo->sctsz;
    }
    if (nsct != NULL) {
        *nsct = finfo->nsct;
    }
    if (atr != NULL) {
        *atr = finfo->rec.atr;
    }
    if (lsize != NULL) {
        if ((finfo->rec.atr & GFS_ATR_FORM1) && (finfo->rec.atr & GFS_ATR_FORM2)) {
            *lsize = 0;
        } else {
            *lsize = finfo->sctsz - finfo->lstrm;
        }
    }
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: local struct addressed through mov r15,rN copies; register allocation and return merging differ */
Sint32 gfsFlow_Read(GfsFlow *flow)
{
    GfsDtsrc *dtsrc = &flow->dtsrc;
    Sint32 ret;
    Sint32 fad;
    Sint32 nsct;
    Sint32 flag;
    GfsCdPly ply;
    Sint32 cdstat;

    cdstat = gfsFlow_GetCdStat(&fad, &flag);
    D_06070C90 = cdstat;
    D_06070C94 = fad;
    if (!gfsFlow_CheckCd(flow, cdstat, &ret)) {
        return ret;
    }
    if (!gfcf_IsLocked(dtsrc)) {
        if (!gfsFlow_SetRange(flow, &nsct, &ret)) {
            return ret;
        }
        if (!gfcf_Lock(dtsrc)) {
            return 8;
        }
        if (!gfcf_SetCdCon(dtsrc)) {
            return 8;
        }
        ply.start.ptype = 1;
        ply.start.fad = dtsrc->sfad;
        ply.end.ptype = 1;
        ply.end.fad = dtsrc->efad - ply.start.fad;
        ply.pmode = 0;
        if ((ret = gfcd_Play(&ply, dtsrc->w1c)) != 0) {
            return 8;
        }
        flow->sctcnt += nsct;
        D_06070C78->rdsfad = ply.start.fad;
        D_06070C78->rdefad = dtsrc->efad;
        return 1;
    }
    if (fad >= dtsrc->efad && ((flag & 4) || cdstat == 0)) {
        gfcf_Unlock(dtsrc);
        if (flow->sctcnt == flow->sct && D_06070C78->rdefad <= fad && cdstat != 2) {
            D_06070C78->rdsfad = D_06070C78->rdefad;
            return 4;
        }
        return 2;
    }
    return 2;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: local struct addressed through mov r15,rN copies; register allocation differs */
void gfsFlow_StopRead(GfsFlow *flow, Sint32 flag)
{
    GfsDtsrc *dtsrc = &flow->dtsrc;
    GfsCdPos pos;
    Sint32 fad;

    D_06070C78->rdefad = 0;
    D_06070C78->rdsfad = 0;
    pos.ptype = 3;
    gfcf_CdSeek(dtsrc, &pos);
    if (flag) {
        gfcd_WaitPause();
    }
    gfcf_Flush(dtsrc);
    if (gfcf_IsLocked(dtsrc)) {
        gfcf_Unlock(dtsrc);
        gfsFlow_GetCdStat(&fad, NULL);
        if (D_06070C78->rdefad <= fad) {
            D_06070C78->rdsfad = D_06070C78->rdefad;
        }
    }
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: local struct addressed through mov r15,rN copies; the return 8 paths are not merged */
Sint32 gfsFlow_PlayNoChg(GfsFlow *flow)
{
    GfsDtsrc *dtsrc = &flow->dtsrc;
    GfsCdPly ply;

    if (gfcf_IsLocked(dtsrc)) {
        ply.start.ptype = 3;
        ply.end.ptype = 3;
        ply.pmode = 0xFF;
        if (gfcd_Play(&ply, dtsrc->w1c) != 0) {
            return 8;
        }
        return 2;
    }
    return 8;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: code matches apart from scheduling; literal pool placement differs */
Sint32 gfsFlow_GetSctPos(GfsFlow *flow)
{
    return gfcf_Tell(&flow->dtsrc);
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: code matches; literal pool placement differs */
Sint32 gfsFlow_SetSctPos(GfsFlow *flow, Sint32 sct)
{
    return gfcf_Seek(flow, sct, 0);
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: local struct addressed through mov r15,rN copies; return paths are not merged */
Sint32 gfsFlow_Seek(GfsFlow *flow, Sint32 sct)
{
    GfsCdPos pos;
    Sint32 ret;

    if (gfsFlow_GetCdStat(NULL, NULL) != 0) {
        return -20;
    }
    if (!gfcf_Lock(&flow->dtsrc)) {
        return -20;
    }
    pos.ptype = 1;
    pos.fad = gfsFlow_SctToFad(flow, sct) + flow->finfo.rec.fad;
    switch (gfcf_CdSeek(&flow->dtsrc, &pos)) {
    case 0:
        ret = 0;
        break;
    case -9:
        ret = -20;
        break;
    case -13:
        ret = -23;
        break;
    default:
        ret = -1;
        break;
    }
    gfcf_Unlock(&flow->dtsrc);
    return ret;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: code matches; the target dumps a literal pool inside it */
/* Sectors of file data to a FAD offset, skipping the gap sectors of an
 * interleaved file. */
Sint32 gfsFlow_SctToFad(GfsFlow *flow, Sint32 sct)
{
    Sint32 unit;

    if (flow->finfo.rec.unit == 0) {
        return sct;
    }
    unit = flow->finfo.rec.unit;
    return sct / unit * (flow->finfo.rec.gap + unit) + sct % unit;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: switch and return layout and register use differ */
/* Returns 0 paused/standby, 1 reading, 2 busy/scanning, 3-6 for errors, 5 other. */
Sint32 gfsFlow_GetCdStat(Sint32 *fad, Sint32 *flag)
{
    GfsCdStat stat;
    Sint32 ret;

    ret = gfcd_GetStat(&stat);
    if (flag != NULL) {
        *flag = ret;
    }
    if (fad != NULL) {
        *fad = stat.fad;
    }
    if (gfcd_err == 0) {
        switch (stat.status & 0xF) {
        case 0:
            return 2;
        case 1:
        case 2:
            return 0;
        case 3:
        case 8:
            return 1;
        case 4:
            return 2;
        case 5:
            return 1;
        case 9:
            break;
        }
    } else if (gfcd_err == -13) {
        return 3;
    } else if (gfcd_err == -14) {
        return 4;
    } else if (gfcd_err == -16) {
        return 6;
    }
    return 5;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: code matches; the target dumps a literal pool inside it */
static Sint32 gfsFlow_SctSize(Sint32 atr)
{
    Sint32 size;

    if (atr & GFS_ATR_CDDA) {
        size = 2352;
    } else if (atr & GFS_ATR_FORM2) {
        if (atr & GFS_ATR_FORM1) {
            size = 0;
        } else {
            size = 2324;
        }
    } else {
        if (atr & GFS_ATR_FORM1) {
            size = 2048;
        } else {
            size = 2048;
        }
    }
    return size;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: switch layout and register use differ */
static Sint32 gfsFlow_CheckCd(GfsFlow *flow, Sint32 cdstat, Sint32 *ret)
{
    GfsDtsrc *dtsrc = &flow->dtsrc;

    switch (cdstat) {
    case 2:
        *ret = flow->stat;
        return FALSE;
    case 0:
        if (gfcd_GetFreeSiz() == 0) {
            *ret = 3;
            return FALSE;
        }
        break;
    case 3:
        *ret = 5;
        return FALSE;
    case 4:
        *ret = 6;
        return FALSE;
    case 6:
        *ret = 9;
        return FALSE;
    default:
        *ret = 8;
        return FALSE;
    case 1:
        break;
    }
    if (flow->gmode != 1 && flow->stat == 0) {
        gfcf_Flush(dtsrc);
        flow->sctcnt = 0;
        D_06070C78->rdefad = 0;
        D_06070C78->rdsfad = 0;
    }
    *ret = 1;
    return TRUE;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: target reloads &D_06070C78 instead of keeping it in r12; register use differs */
static Sint32 gfsFlow_SetRange(GfsFlow *flow, Sint32 *nsct, Sint32 *ret)
{
    GfsDtsrc *dtsrc = &flow->dtsrc;
    Sint32 sfad;
    Sint32 n;

    *nsct = flow->sct - flow->sctcnt;
    *nsct = (*nsct < flow->sctmax) ? *nsct : flow->sctmax;
    sfad = flow->finfo.rec.fad + gfsFlow_SctToFad(flow, gfcf_Tell(dtsrc));
    if (flow->gmode == 1) {
        n = gfcf_GetNumSct(flow, 0x7FFFFFFF, 0);
        if (n < 0) {
            n = 0;
        }
        if (n > 0 && sfad < D_06070C78->rdsfad) {
            n -= D_06070C78->rdsfad - sfad;
        }
    } else {
        n = 0;
    }
    if (n >= *nsct) {
        flow->sctcnt += *nsct;
        if (flow->sctcnt == flow->sct) {
            *ret = 4;
            D_06070C78->rdsfad = D_06070C78->rdefad;
        } else {
            *ret = 2;
            D_06070C78->rdsfad = sfad;
        }
        return FALSE;
    }
    *nsct -= n;
    dtsrc->sfad = sfad;
    dtsrc->efad = gfsFlow_SctToFad(flow, *nsct + gfcf_Tell(dtsrc)) + flow->finfo.rec.fad;
    if (D_06070C78->rdsfad <= dtsrc->sfad && dtsrc->sfad < D_06070C78->rdefad
        && D_06070C78->rdsfad < dtsrc->efad && dtsrc->efad <= D_06070C78->rdefad) {
        D_06070C78->rdsfad = dtsrc->sfad;
        *ret = 1;
        return FALSE;
    }
    return TRUE;
}
#endif
