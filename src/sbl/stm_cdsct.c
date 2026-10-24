/* Stream library: CD play and CD buffer sector helpers (one object in the
 * original link). See stm_cdplay.c for the `p = &ply` pattern. */
#include "sbl/types.h"
#include "sbl/stm_cd.h"

Sint32 stm_CdContinue(StmObj *obj)
{
    CdcPly ply;
    Sint32 ret;
    CdcPly *p;

    CDC_PLY_STYPE(&ply) = CDC_PTYPE_NOCHG;
    CDC_PLY_ETYPE(&ply) = CDC_PTYPE_NOCHG;
    CDC_PLY_PMODE(&ply) = CDC_PM_NOCHG;
    p = &ply;
    ret = gfcd_Play(p, obj->filt);
    if (ret != 0) {
        return -1;
    }
    return 0;
}

Sint32 stm_CdPlayFrom(StmObj *obj, Sint32 fad)
{
    CdcPly ply;
    Sint32 ret;
    CdcPly *p;

    CDC_PLY_STYPE(&ply) = CDC_PTYPE_FAD;
    CDC_PLY_SFAD(&ply) = fad;
    CDC_PLY_ETYPE(&ply) = CDC_PTYPE_NOCHG;
    CDC_PLY_PMODE(&ply) = 0;
    p = &ply;
    ret = gfcd_Play(p, obj->filt);
    if (ret == -13) {
        ret = -23;
    } else if (ret != 0) {
        ret = -1;
    } else {
        stm_mng->play_sfad = fad;
    }
    return ret;
}

/* NONMATCHING: `+ 1` again (see stm_CdPlayObj). Same size. */
Sint32 stm_CdPlayTo(StmObj *obj, Sint32 efad)
{
    CdcPly ply;
    Sint32 ret;
    CdcPly *p;

    CDC_PLY_STYPE(&ply) = CDC_PTYPE_FAD;
    CDC_PLY_SFAD(&ply) = stm_mng->play_sfad;
    CDC_PLY_ETYPE(&ply) = CDC_PTYPE_FAD;
    CDC_PLY_EFAS(&ply) = efad - stm_mng->play_sfad + 1;
    CDC_PLY_PMODE(&ply) = CDC_PM_NOCHG;
    p = &ply;
    ret = gfcd_Play(p, obj->filt);
    if (ret == -13) {
        ret = -23;
    } else if (ret != 0) {
        ret = -1;
    } else {
        stm_mng->play_efad = efad;
    }
    return ret;
}

/* NONMATCHING: the original puts `mov #0,r6` in the jsr delay slot and reloads obj
   before it; SHC 5 picks the reload. Same size. */
Bool stm_GetSctInfo(StmObj *obj, Sint32 spos, StmSctInfo *info)
{
    CdcSct sct;
    Sint32 num;

    num = gfcf_GetNumSct(obj, 0x7FFFFFFF, 0);
    if (spos >= num) {
        return FALSE;
    }
    gfcd_GetSctInfo(obj->bufno, spos, &sct);
    info->fad = CDC_SCT_FAD(&sct);
    info->fn = CDC_SCT_FN(&sct);
    info->cn = CDC_SCT_CN(&sct);
    info->sm = CDC_SCT_SM(&sct);
    info->ci = CDC_SCT_CI(&sct);
    return TRUE;
}

Uint32 stm_GetSctData(StmObj *obj, Sint32 spos)
{
    Uint32 nword;
    Sint32 a;

    gfcd_GetSctNum(obj->bufno, obj->sctpos + spos, 1, &a, (Sint32 *)&nword);
    gfcd_WaitServer();
    return nword >> 1;
}

void stm_DelSctData(StmObj *obj, Sint32 spos, Sint32 nsct)
{
    Sint32 num;

    num = gfcf_GetNumSct(obj, 0x7FFFFFFF, 0);
    if (spos + nsct > num) {
        nsct = num - spos;
    }
    if (nsct > 0) {
        gfcd_DelSct(obj->bufno, spos, nsct);
    }
}

Sint32 stm_GetSctNum(StmObj *obj)
{
    Sint32 nsct;
    Sint32 ret;
    Sint32 bufno;

    bufno = obj->bufno;
    do {
        ret = CDC_GetSctNum(bufno, &nsct);
    } while (ret != 0);
    return nsct;
}

/* NONMATCHING: the jsr delay slot again (see stm_GetCurFad); the #else version
   is the same size as the original. */
#ifdef NONMATCHING
Sint32 stm_GetFreeBufSiz(void)
{
    Sint32 freesiz;
    Sint32 totalsiz;
    Sint32 bufnum;
    Sint32 ret;

    do {
        ret = CDC_GetBufSiz(&totalsiz, &bufnum, &freesiz);
    } while (ret != 0);
    return freesiz;
}
#else
Sint32 stm_GetFreeBufSiz(void)
{
    Sint32 freesiz;
    Sint32 totalsiz;
    Sint32 bufnum;
    Sint32 ret;
    Sint32 siz;

    do {
        ret = CDC_GetBufSiz(&totalsiz, &bufnum, &freesiz);
        siz = freesiz;
    } while (ret != 0);
    return siz;
}
#endif

void stm_WaitCsct(void)
{
    Sint32 i;
    Sint32 hirq;

    CDC_ClrHirqReq(~CDC_HIRQ_CSCT);
    for (i = 0; i < 0x5F34; i++) {
        hirq = CDC_GetHirqReq();
        if (hirq & CDC_HIRQ_CSCT) {
            break;
        }
    }
}
