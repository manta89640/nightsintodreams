/* shc-flags: -macsave=0 */
/* Functions marked NONMATCHING have the right structure, but the target keeps
 * loaded temporaries in r0/r1 (mov.l @(28,r5),r0; tst r0,r0) where SHC 5.0
 * uses r2/r3, and copies through r0 more often, so sizes, branches and pools
 * drift. Probably an older SHC built this module. */
#include "sbl/types.h"
#include "sbl/stm.h"

extern void *memset(void *dst, Sint32 c, Sint32 n);     /* memset */
extern void *memmove(void *dst, void *src, Sint32 n);    /* memcpy */
extern void stm_GetFadRange(StmKey *key, Sint32 *sfad, Sint32 *efad);
extern Sint32 stm_CdPause(StmGrp *grp);
extern Sint32 stm_CdPlayTo(StmGrp *grp, Sint32 fad);
extern void stm_WaitCsct(void);
extern Sint32 GFS_GetDirInfo(Sint32 fid, StmFinfo *finfo);
extern void GFS_Close(StmGfs *gfs);
extern void GFS_Seek(StmGfs *gfs, Sint32 ofs, Sint32 org);
extern void GFS_GetFileSize(StmGfs *gfs, Sint32 *a, Sint32 *nsct, Sint32 *b);
extern void GFS_NwCdRead(StmGfs *gfs, Sint32 nsct);
extern void GFS_NwGetStat(StmGfs *gfs, Sint32 *amode, Sint32 *ndata);
extern void GFS_NwExecOne(StmGfs *gfs);
extern void GFS_SetGmode(StmGfs *gfs, Sint32 gmode);
extern void *gfs_AllocHn(void);
extern StmGfs *gfs_InitHn(void *hn, StmFinfo *finfo, Sint32 fid);
extern void gfsTrn_Activate(Sint32 *tr);
extern void gfsTrn_Stop(StmGfs *gfs, Sint32 x);
extern void gfsTrn_SetFunc(StmGfs *gfs, Sint32 (*func)(void *), void *obj);
extern void gfsFlow_SetSct(StmKey *key, Sint32 nsct);
extern void gfsFlow_GetFinfo(StmKey *key, Sint32 a, Sint32 b, Sint32 c, Sint32 d, Sint32 e, Sint32 f, Sint32 *stat);
extern Sint32 gfsFlow_SctToFad(StmKey *key, Sint32 x);
extern void gfsFlow_GetCdStat(Sint32 *fad, Sint32 x);
extern void gfcd_Unlock(Sint32 bufno);
extern void gfcd_SetFilt(Sint32 fltno, Sint32 mode, StmSubh *subh, Sint32 a, Sint32 b);
extern void gfcd_SetCdCon(Sint32 fltno, Sint32 bufno);
extern void gfcd_SetFiltCon(Sint32 fltno, Sint32 trueno, Sint32 falseno);
extern Sint32 gfcd_WaitServer(void);
extern void gfcd_SetCallback(Sint32 a, Sint32 b);
extern void gfcd_WaitPause(void);
extern void STM_GrpCheckPassed(StmGrp *grp);
extern Sint32 gfcd_err;

StmMng *stm_mng;
Sint32 stm_06070C70[2];

static void stm_init_mng(Sint32 ngrp, Sint32 nstm, void *work);
static StmGrp *stm_alloc_grp(void);
static Stm *stm_alloc_stm(void);
Sint32 stm_get_end_fad(StmGrp *grp);
void stm_set_err_gfs(Sint32 code);
static Sint32 stm_add_stm(StmGrp *grp, Stm *stm, Uint8 flags);
static Sint32 stm_key_to_mode(StmSelKey *key);
static Sint32 stm_key_to_subh(StmSelKey *key, StmFinfo *finfo, StmSubh *subh);
static Stm *stm_init_stm(Stm *stm, StmGrp *grp, StmGfs *gfs, StmFinfo *finfo, StmSelKey *key, Uint8 flags);
static void stm_free_grp(StmGrp *grp);
Sint32 stm_remove_cd(Stm *stm);
static Sint32 stm_free_stm(Stm *stm);
void stm_update_cur(StmGrp *grp);
static void stm_close(Stm *stm);
static Sint32 stm_func_nop(void *obj);
static Stm *stm_open(StmGrp *grp, StmFinfo *finfo, Sint32 fid, StmSelKey *key, Uint8 flags);
static Stm *stm_open_fid(StmGrp *grp, Sint32 fid, StmSelKey *key, Uint8 flags);
static void stm_set_param_sub(Stm *stm, Sint32 n);
void stm_set_func_id(Sint32 id);
Sint32 stm_set_err(Sint32 code);
Sint32 stm_check_gfs_err(void);
void stm_call_err_func(void);

/* NONMATCHING */
static void stm_init_mng(Sint32 ngrp, Sint32 nstm, void *work)
{
    Sint32 grpsize;

    stm_mng = (StmMng *)work;
    grpsize = ngrp * sizeof(StmGrp);
    memset(stm_mng, 0, grpsize + nstm * sizeof(Stm) + sizeof(StmMng));
    stm_mng->grp = (StmGrp *)(stm_mng + 1);
    stm_mng->ngrp = ngrp;
    stm_mng->stm = (Stm *)((Uint8 *)stm_mng->grp + grpsize);
    stm_mng->nstm = nstm;
    stm_mng->unk14 = -1;
    stm_mng->unk18 = -1;
    stm_mng->busy = 0;
    stm_06070C70[0] = 0;
    stm_06070C70[1] = 0;
    stm_mng->err.code = 0;
    stm_mng->err.fid = 0x300;
    stm_mng->err.func = NULL;
    stm_mng->err.obj = NULL;
}

/* NONMATCHING */
static StmGrp *stm_alloc_grp(void)
{
    Sint32 i;
    StmGrp *grp;

    grp = stm_mng->grp;
    for (i = 0; i < stm_mng->ngrp; i++) {
        if (grp->used == 0) {
            grp->head = NULL;
            grp->head2 = NULL;
            grp->loop = NULL;
            grp->unk0C = NULL;
            grp->cur = NULL;
            grp->fad = STM_FAD_START;
            grp->stat = 0x101;
            grp->unk1C = 0;
            grp->unk20 = 0;
            grp->func = NULL;
            grp->obj = NULL;
            grp->lpmax = STM_INFINITE;
            grp->lpcnt = 0;
            grp->unk34 = -1;
            grp->flags = 0;
            grp->used = 1;
            return grp;
        }
        grp++;
    }
    return NULL;
}

/* NONMATCHING */
static Stm *stm_alloc_stm(void)
{
    Sint32 i;
    Stm *stm;

    stm = stm_mng->stm;
    for (i = 0; i < stm_mng->nstm; i++) {
        if (stm->used == 0) {
            return stm;
        }
        stm++;
    }
    return NULL;
}

/* End FAD of the group's last CD stream (or the first FAD of the disc). */
/* NONMATCHING */
Sint32 stm_get_end_fad(StmGrp *grp)
{
    Stm *stm;
    Sint32 sfad;
    Sint32 efad;

    stm = grp->unk0C;
    if (stm == NULL) {
        return STM_FAD_START;
    }
    stm_GetFadRange(stm->key, &sfad, &efad);
    return efad;
}

/* Records a GFS error code as the matching STM error. */
/* NONMATCHING */
void stm_set_err_gfs(Sint32 code)
{
    switch (code) {
    case -12:
        code = STM_ERR_FATAL;
        break;
    case -13:
    case -2:
        code = STM_ERR_CDNODISC;
        break;
    case -15:
    case -14:
        code = STM_ERR_CDOPEN;
        break;
    case -16:
        code = STM_ERR_TMOUT;
        break;
    case -11:
    case -10:
        code = STM_ERR_CDRD;
        break;
    default:
        code = 0;
        break;
    }
    stm_set_err(code);
}

/* Links a new stream into the group's lists. head is kept sorted by start
 * FAD; streams read from the CD block are also appended to head2 and get a
 * CD block filter connected behind the previous one. */
/* NONMATCHING */
static Sint32 stm_add_stm(StmGrp *grp, Stm *stm, Uint8 flags)
{
    Sint32 fad;
    Sint32 cur_sfad;
    Sint32 cur_efad;
    Sint32 sfad;
    Sint32 efad;
    StmKey *key;
    Stm **link;
    Stm *last;
    Sint32 ret;

    stm_GetFadRange(stm->key, &sfad, &efad);
    link = &grp->head;
    while (*link != NULL) {
        stm_GetFadRange((*link)->key, &cur_sfad, &cur_efad);
        if (sfad <= cur_sfad) {
            break;
        }
        link = &(*link)->next;
    }
    stm->next = *link;
    *link = stm;
    if (stm->key->unk1C == 0) {
        fad = stm_get_end_fad(grp);
        if (efad > fad) {
            grp->unk0C = stm;
        }
        last = NULL;
        link = &grp->head2;
        while (*link != NULL) {
            last = *link;
            link = &last->next2;
        }
        key = stm->key;
        gfcd_SetFiltCon(key->unk28, key->unk20, 0xFF);
        if (last != NULL) {
            key = last->key;
            gfcd_SetFiltCon(key->unk28, key->unk20, stm->key->unk20);
        } else if (grp->unk34 >= 0) {
            gfcd_SetCdCon(stm->key->unk28, grp->unk34);
        }
        *link = stm;
        stm->next2 = NULL;
        ret = gfcd_WaitServer();
        if (ret != 0) {
            stm_set_err_gfs(ret);
            return FALSE;
        }
    }
    if ((grp->flags & 0x01) == 0 && (flags & 0x02) == 0 && grp->head == stm) {
        grp->loop = stm;
    }
    return TRUE;
}

static Sint32 stm_key_to_mode(StmSelKey *key)
{
    Sint32 mode;

    mode = 0x40;
    if (key->fn != -1) {
        mode = 0x41;
    }
    if (key->cn != -1) {
        mode |= 0x02;
    }
    if (key->smmsk != -1) {
        mode |= 0x04;
    }
    if (key->cimsk != -1) {
        mode |= 0x08;
    }
    return mode;
}

/* NONMATCHING */
static Sint32 stm_key_to_subh(StmSelKey *key, StmFinfo *finfo, StmSubh *subh)
{
    subh->fn = key->fn;
    subh->cn = key->cn;
    subh->smmsk = key->smmsk;
    subh->smval = key->smval;
    subh->cimsk = key->cimsk;
    subh->cival = key->cival;
    return stm_key_to_mode(key);
}

/* NONMATCHING */
static Stm *stm_init_stm(Stm *stm, StmGrp *grp, StmGfs *gfs, StmFinfo *finfo, StmSelKey *key, Uint8 flags)
{
    Sint32 cur;
    Sint32 sfad;
    Sint32 efad;
    StmSubh subh;
    StmKey *gkey;
    StmKey *skey;
    Sint32 mode;
    Sint32 ret;

    gkey = (StmKey *)&gfs->pad0C;
    skey = gkey;
    skey->unk14 = gfsFlow_SctToFad(gkey, skey->unk14);
    skey->unk18 = 0;
    stm->grp = grp;
    stm->stm = stm;
    stm->gfs = gfs;
    stm->key = skey;
    stm->unk18 = 0;
    stm->unk1C = 0;
    stm->flags = flags;
    stm_GetFadRange(skey, &sfad, &efad);
    if (((grp->flags & 0x02) ? 1 : 0) == 1 && sfad >= grp->fad) {
        stm->flags |= 0x01;
    }
    stm->used = 1;
    gfs->unkA0 = 6;
    stm->unk28 = STM_FAD_START;
    if (stm->key->unk1C == 0) {
        mode = stm_key_to_subh(key, finfo, &subh);
        gfcd_SetFilt(gkey->unk28, mode, &subh, skey->unk04, skey->unk14);
        ret = gfcd_WaitServer();
        if (ret != 0) {
            stm_set_err_gfs(ret);
            return NULL;
        }
        gfsFlow_SetSct(gkey, STM_INFINITE);
    }
    if (!stm_add_stm(grp, stm, flags)) {
        return NULL;
    }
    if (((grp->flags & 0x02) ? 1 : 0) == 1 && (grp->flags & 0x20) == 0 && grp->unk0C == stm) {
        gfsFlow_GetCdStat(&cur, 0);
        if (cur < stm_mng->unk18 - 10) {
            ret = stm_CdPlayTo(grp, efad);
            if (ret != 0) {
                stm_set_err(ret);
            }
        }
    }
    return stm;
}

static void stm_free_grp(StmGrp *grp)
{
    grp->head = NULL;
    grp->head2 = NULL;
    grp->used = 0;
}

/* Takes a stream out of grp->head2 and reconnects the CD block filters. */
/* NONMATCHING */
Sint32 stm_remove_cd(Stm *stm)
{
    StmGrp *grp;
    Stm *prev;
    Stm **link;
    Sint32 conn;
    StmKey *key;
    Sint32 ret;

    if (stm->key->unk1C != 0) {
        return TRUE;
    }
    grp = stm->grp;
    prev = NULL;
    link = &grp->head2;
    while (*link != NULL && *link != stm) {
        prev = *link;
        link = &prev->next2;
    }
    if (*link == NULL) {
        return TRUE;
    }
    *link = stm->next2;
    if (stm->next2 == NULL) {
        conn = 0xFF;
    } else {
        conn = (*link)->key->unk28;
    }
    if (prev == NULL) {
        gfcd_SetCdCon(conn, grp->unk34);
    } else {
        key = prev->key;
        gfcd_SetFiltCon(key->unk28, key->unk20, conn);
    }
    ret = gfcd_WaitServer();
    if (ret != 0) {
        stm_set_err_gfs(ret);
        return FALSE;
    }
    return TRUE;
}

/* NONMATCHING */
static Sint32 stm_free_stm(Stm *stm)
{
    Sint32 ret;
    Stm **link;

    ret = TRUE;
    if (stm->used == TRUE) {
        stm->used = FALSE;
        if (stm->grp == NULL) {
            return;     /* no value: the original returns whatever is in r0 */
        }
        link = &stm->grp->head;
        while (*link != NULL && *link != stm) {
            link = &(*link)->next;
        }
        if (*link != NULL) {
            *link = stm->next;
        }
        ret = stm_remove_cd(stm);
        stm->grp = NULL;
    }
    return ret;
}

/* Makes the CD stream with the latest end FAD the group's current one. */
/* NONMATCHING */
void stm_update_cur(StmGrp *grp)
{
    Stm *stm;
    Stm *best;
    Sint32 best_fad;
    Sint32 sfad;
    Sint32 efad;

    best = NULL;
    best_fad = STM_FAD_START;
    for (stm = grp->head2; stm != NULL; stm = stm->next2) {
        if (stm->key->unk1C == 0) {
            stm_GetFadRange(stm->key, &sfad, &efad);
            if (efad > best_fad) {
                best = stm;
                best_fad = efad;
            }
        }
    }
    grp->unk0C = best;
}

/* NONMATCHING */
Bool STM_Init(Sint32 ngrp, Sint32 nstm, void *work)
{
    if (work == NULL) {
        return FALSE;
    }
    stm_init_mng(ngrp, nstm, work);
    return TRUE;
}

/* NONMATCHING */
StmGrp *STM_OpenGrp(void)
{
    StmGrp *grp;

    stm_set_func_id(0x301);
    grp = stm_alloc_grp();
    if (grp == NULL) {
        return NULL;
    }
    if (stm_check_gfs_err() < 0) {
        return NULL;
    }
    return grp;
}

/* NONMATCHING */
static void stm_close(Stm *stm)
{
    StmGrp *grp;
    Stm *s;
    Sint32 stat;
    Sint32 cur;
    Sint32 sfad;
    Sint32 efad;
    Sint32 ret;

    grp = stm->grp;
    if (stm->used == 1) {
        if (grp->loop == stm) {
            for (s = grp->head; s != NULL; s = s->next) {
                if (s != stm && (s->flags & 0x02) == 0) {
                    break;
                }
            }
            grp->loop = s;
            grp->flags &= 0xFFFE;
        }
        if (grp->cur == stm) {
            gfsTrn_Stop(stm->gfs, -1);
            stm->gfs->unkA0 = 0;
            grp->cur = stm->next;
            if (stm->next == NULL) {
                grp->cur = grp->head;
            }
            if (grp->cur == stm) {
                grp->cur = NULL;
            }
        }
        stm->key->unk20 = stm->key->unk28;
        stm_free_stm(stm);
        gfsFlow_GetFinfo(stm->key, 0, 0, 0, 0, 0, 0, &stat);
        if (((grp->flags & 0x02) ? 1 : 0) == 1 && (stat & 0x40) == 0) {
            stm_GetFadRange(stm->key, &sfad, &efad);
            gfsFlow_GetCdStat(&cur, 0);
            if (sfad - 10 < cur && cur <= efad) {
                stm_WaitCsct();
            }
        }
        GFS_Close(stm->gfs);
    }
    if (grp->unk0C == stm) {
        stm_update_cur(grp);
        if (grp->unk0C != NULL && ((grp->flags & 0x02) ? 1 : 0) == 1) {
            stm_GetFadRange(grp->unk0C->key, &sfad, &efad);
            if (efad - stm_mng->unk14 >= 0) {
                ret = stm_CdPlayTo(grp, efad);
            } else {
                ret = stm_CdPause(grp);
                STM_GrpCheckPassed(grp);
                grp->lpcnt++;
                grp->fad = STM_FAD_START;
                grp->flags &= 0xFFD9;
            }
            if (ret != 0) {
                stm_set_err(ret);
            }
        }
    }
    if (grp->head2 == NULL && ((grp->flags & 0x02) ? 1 : 0) == 1) {
        ret = stm_CdPause(grp);
        if (ret != 0) {
            stm_set_err(ret);
        } else {
            STM_GrpCheckPassed(grp);
            grp->lpcnt++;
            grp->fad = STM_FAD_START;
            grp->flags &= 0xFFD9;
        }
    }
}

/* NONMATCHING */
void STM_CloseGrp(StmGrp *grp)
{
    stm_set_func_id(0x302);
    if (grp == NULL) {
        stm_set_err(STM_ERR_HANDLE);
        stm_call_err_func();
        return;
    }
    while (grp->head != NULL) {
        stm_close(grp->head);
    }
    if (grp->unk34 >= 0) {
        stm_mng->curgrp = NULL;
        gfcd_Unlock(grp->unk34);
        grp->unk34 = -1;
        gfcd_SetCallback(0, 0);
        gfcd_WaitPause();
    }
    stm_free_grp(grp);
    if ((stm_mng->err.code ? 1 : 0) == 1) {
        stm_call_err_func();
    }
    stm_check_gfs_err();
}

static Sint32 stm_func_nop(void *obj)
{
    return 0;
}

/* Closes every open group. */
/* NONMATCHING */
void stm_close_all(void)
{
    Sint32 i;
    StmGrp *grp;
    Stm *stm;

    grp = stm_mng->grp;
    for (i = 0; i < stm_mng->ngrp; i++) {
        if (grp->used == 1) {
            for (stm = grp->head; stm != NULL; stm = stm->next) {
                if (stm->unk18 != 0) {
                    gfsTrn_SetFunc(stm->gfs, stm_func_nop, stm);
                }
            }
            STM_CloseGrp(grp);
        }
        grp++;
    }
    stm_check_gfs_err();
}

/* NONMATCHING */
static Stm *stm_open(StmGrp *grp, StmFinfo *finfo, Sint32 fid, StmSelKey *key, Uint8 flags)
{
    Stm *stm;
    void *hn;
    StmGfs *gfs;
    Stm *ret;
    Sint32 amode;
    Sint32 ndata;
    Sint32 nsct;

    stm = stm_alloc_stm();
    if (stm == NULL) {
        stm_set_err(STM_ERR_NOHNDL);
        stm_call_err_func();
        return NULL;
    }
    hn = gfs_AllocHn();
    if (hn == NULL) {
        stm_free_stm(stm);
        stm_set_err(STM_ERR_NOHNDL);
        stm_call_err_func();
        return NULL;
    }
    gfs = gfs_InitHn(hn, finfo, fid);
    ret = stm_init_stm(stm, grp, gfs, finfo, key, flags);
    if (ret == NULL) {
        stm_call_err_func();
        return NULL;
    }
    if (flags & 0x02) {
        GFS_SetGmode(gfs, 1);
    }
    if (stm->key->unk1C != 0) {
        GFS_GetFileSize(gfs, NULL, &nsct, NULL);
        GFS_NwCdRead(gfs, nsct);
        do {
            GFS_NwExecOne(gfs);
            GFS_NwGetStat(gfs, &amode, &ndata);
        } while (ndata < nsct);
    }
    ret->gfs->unk04 = 1;
    ret->gfs->unk08 = 1;
    gfsTrn_Activate(&gfs->tr);
    return ret;
}

/* NONMATCHING */
static Stm *stm_open_fid(StmGrp *grp, Sint32 fid, StmSelKey *key, Uint8 flags)
{
    StmFinfo finfo;
    StmSelKey selkey;
    Sint32 ret;

    ret = GFS_GetDirInfo(fid, &finfo);
    if (ret != 0) {
        stm_set_err(ret);
        stm_call_err_func();
        return NULL;
    }
    memmove(&selkey, key, sizeof(StmSelKey));
    (&selkey)->fn = (&finfo)->fn;
    return stm_open(grp, &finfo, fid, &selkey, flags);
}

/* NONMATCHING */
Stm *STM_OpenFid(StmGrp *grp, Sint32 fid, StmSelKey *key, Sint32 rmode)
{
    Uint8 flags;
    Stm *stm;

    stm_set_func_id(0x306);
    if (grp == NULL) {
        stm_set_err(STM_ERR_HANDLE);
        stm_call_err_func();
        return NULL;
    }
    if (rmode == 0) {
        flags = 0x04;
    } else if (rmode == 1) {
        flags = 0x00;
    } else {
        stm_set_err(STM_ERR_RMODE);
        stm_call_err_func();
        return NULL;
    }
    stm = stm_open_fid(grp, fid, key, flags);
    if (stm_check_gfs_err() < 0) {
        return NULL;
    }
    return stm;
}

/* NONMATCHING */
Stm *STM_OpenFrange(StmGrp *grp, StmFrange *frange, StmSelKey *key, Sint32 rmode)
{
    StmFinfo finfo;
    Uint8 flags;
    Stm *stm;

    stm_set_func_id(0x307);
    if (grp == NULL) {
        stm_set_err(STM_ERR_HANDLE);
        stm_call_err_func();
        return NULL;
    }
    if (frange->fad < STM_FAD_START || frange->nsct < 0) {
        stm_set_err(STM_ERR_RANGE);
        stm_call_err_func();
        return NULL;
    }
    (&finfo)->fad = frange->fad;
    (&finfo)->size = frange->nsct << 11;
    (&finfo)->fn = key->fn;
    (&finfo)->atr = 0;
    (&finfo)->unit = 1;
    (&finfo)->gap = 0;
    if (rmode == 0) {
        flags = 0x04;
    } else if (rmode == 1) {
        flags = 0x00;
    } else {
        stm_set_err(STM_ERR_RMODE);
        stm_call_err_func();
        return NULL;
    }
    stm = stm_open(grp, &finfo, 0x3FFFFFFF, key, flags);
    if (stm_check_gfs_err() < 0) {
        return NULL;
    }
    return stm;
}

/* NONMATCHING */
static void stm_set_param_sub(Stm *stm, Sint32 n)
{
    if (stm->flags & 0x02) {
        GFS_Seek(stm->gfs, 0, 0);
    }
    stm->gfs->unkA0 = 0;
    stm->unk28 = n;
}

/* NONMATCHING */
void stm_set_param(Stm *stm, Sint32 n)
{
    Sint32 err;

    stm_set_func_id(0x321);
    if (stm == NULL) {
        err = STM_ERR_HANDLE;
    } else if (n < 0) {
        err = STM_ERR_RANGE;
    } else {
        stm_set_param_sub(stm->stm, n);
        stm_check_gfs_err();
        return;
    }
    stm_set_err(err);
    stm_call_err_func();
}

/* NONMATCHING */
Stm *STM_OpenResp(StmGrp *grp, Sint32 fid, StmSelKey *key, Sint32 n)
{
    Stm *stm;

    stm_set_func_id(0x308);
    if (grp == NULL) {
        stm_set_err(STM_ERR_HANDLE);
        stm_call_err_func();
        return NULL;
    }
    if (n < 0) {
        stm_set_err(STM_ERR_RANGE);
        stm_call_err_func();
        return NULL;
    }
    stm = stm_open_fid(grp, fid, key, 0x06);
    if (stm == NULL) {
        return NULL;
    }
    stm_set_param_sub(stm, n);
    if (stm_check_gfs_err() < 0) {
        return NULL;
    }
    return stm;
}

/* NONMATCHING */
void STM_Close(Stm *stm)
{
    stm_set_func_id(0x309);
    if (stm == NULL) {
        stm_set_err(STM_ERR_HANDLE);
        stm_call_err_func();
    }
    stm_close(stm->stm);
    if ((stm_mng->err.code ? 1 : 0) == 1) {
        stm_call_err_func();
    }
    stm_check_gfs_err();
}

/* NONMATCHING */
void STM_SetKey(Stm *stm, StmSelKey *key)
{
    StmKey *skey;
    StmSubh subh;
    Sint32 mode;
    Sint32 ret;

    stm_set_func_id(0x310);
    if (stm == NULL) {
        stm_set_err(STM_ERR_HANDLE);
        stm_call_err_func();
        return;
    }
    stm = stm->stm;
    if (stm->key->unk1C != 0) {
        return;
    }
    (&subh)->fn = key->fn;
    (&subh)->cn = key->cn;
    (&subh)->smmsk = key->smmsk;
    (&subh)->smval = key->smval;
    (&subh)->cimsk = key->cimsk;
    (&subh)->cival = key->cival;
    mode = stm_key_to_mode(key);
    skey = stm->key;
    gfcd_SetFilt(skey->unk28, mode, &subh, skey->unk04, skey->unk14);
    ret = gfcd_WaitServer();
    if (ret != 0) {
        stm_set_err_gfs(ret);
        stm_call_err_func();
    }
}

/* NONMATCHING */
void stm_set_func_id(Sint32 id)
{
    stm_mng->err.fid = id;
}

/* NONMATCHING */
Sint32 stm_set_err(Sint32 code)
{
    if (stm_mng->err.code == 0) {
        stm_mng->err.code = code;
        return TRUE;
    }
    return FALSE;
}

/* Converts the GFS library's last error into an STM error and reports it. */
/* NONMATCHING */
Sint32 stm_check_gfs_err(void)
{
    Sint32 code;

    switch (gfcd_err) {
    case 0:
        return 0;
    case -13:
        code = STM_ERR_CDNODISC;
        break;
    case -14:
        code = STM_ERR_CDOPEN;
        break;
    case -16:
        code = STM_ERR_TMOUT;
        break;
    default:
        return 0;
    }
    if (stm_set_err(code) == 1) {
        stm_call_err_func();
        return code;
    }
    return 0;
}

/* NONMATCHING */
void stm_call_err_func(void)
{
    StmMng *mng;
    StmErrStat *err;

    mng = stm_mng;
    err = &mng->err;
    if (err->func != NULL && ((mng->err.code ? 1 : 0) == 1)) {
        err->func(err->obj, err->code);
    }
    err->code = 0;
}
