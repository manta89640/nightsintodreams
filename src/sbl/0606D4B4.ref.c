/* shc-flags: -define=NONMATCHING */
/* GFS file access through the CD block (the CD part of a file handle). */
/* This module was built by an older SHC than the 5.0 in compile/: it keeps one
 * code path per return, prefers r0 for temporaries and keeps local addresses
 * in callee-saved registers. The C below is complete; functions that SHC 5.0
 * cannot reproduce are under NONMATCHING with what still differs. */

#include "sbl/types.h"
#include "sbl/gfcd.h"

#define PICKUP ((GfcfPickup *)(gfs_mng + 0x438))

Sint32 gfcf_Flush(GfcfCdb *cdb);
Sint32 gfcf_Tell(GfcfCdb *cdb);
Sint32 gfcf_GetBufSct(GfcfCdb *cdb);
Sint32 gfcf_Seek(GfcfFile *gf, Sint32 ofs, Sint32 whence);

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return; the original keeps local addresses and constants in callee-saved registers */
Sint32 gfcf_Open(GfcfFile *gf)
{
    GfcfCdb *cdb;
    Sint32 fltno;
    Sint32 bufno;
    CdcSubh subh;

    cdb = &gf->cdb;
    cdb->unk0 = 0;
    cdb->fmode = 1;
    subh.fn = gf->fn;
    subh.cn = 0;
    subh.smmsk = 0;
    subh.smval = 0;
    subh.cimsk = 0;
    subh.cival = 0;
    cdb->subh = subh;
    cdb->lockid = -1;
    cdb->sct_ofs = 0;
    cdb->sct_top = 0;
    cdb->unk44 = 0;
    cdb->unk40 = 0;
    if (gfcd_AllocBuf(&bufno) != 0) {
        return 0;
    }
    cdb->bufno = bufno;
    if (gfcd_AllocFilt(&fltno) != 0) {
        gfcd_FreeBuf(bufno);
        return 0;
    }
    cdb->fltno = fltno;
    if (gfcd_SetFilt(fltno, cdb->fmode, &subh, 0, 0) != 0) {
        return 0;
    }
    if (gfcd_SetFiltCon(fltno, bufno, 0xFF) != 0) {
        return 0;
    }
    if (gfcd_WaitServer() != 0) {
        return 0;
    }
    if (gfcf_Flush(cdb) != 0) {
        return 0;
    }
    return 1;
}
#endif

#ifdef NONMATCHING /* the original allocates the frame before spilling cdb */
void gfcf_Close(GfcfCdb *cdb)
{
    gfcd_FreeBuf(cdb->bufno);
    gfcd_FreeFilt(cdb->fltno);
}
#endif

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return; the original keeps local addresses and constants in callee-saved registers */
Sint32 gfcf_GetNumSct(GfcfFile *gf, Sint32 snum, Sint32 *nword)
{
    GfcfCdb *cdb;
    Sint32 nsct;
    Sint32 ret;
    Sint32 a;
    Sint32 b;
    Sint32 c;

    cdb = &gf->cdb;
    ret = gfcd_GetSctNum(cdb->bufno, cdb->sct_ofs, snum, &nsct, nword);
    if (ret != 0) {
        return 0;
    }
    if (gfcd_WaitServer() != 0) {
        return 0;
    }
    if (nword != NULL) {
        gfsFlow_GetFinfo(gf, 0, 0, &b, &c, &a, 0, 0);
        if (gfcf_Tell(cdb) + nsct >= c && a != 0 && nsct > 0) {
            *nword -= b - a;
        }
    }
    return nsct;
}
#endif

Sint32 gfcf_Dummy0(void)
{
    return 0;
}

#ifdef NONMATCHING /* the original falls through to the tail call and returns ret without a move */
Sint32 gfcf_SetFilt(GfcfCdb *cdb, Sint32 fmode, CdcSubh *subh)
{
    Sint32 ret;

    cdb->fmode = fmode;
    cdb->subh = *subh;
    ret = gfcd_SetFilt(cdb->fltno, fmode, subh, 0, 0);
    if (ret != 0) {
        return ret;
    }
    return gfcd_WaitServer();
}
#endif

#ifdef NONMATCHING /* same instructions, only pool and branch displacements differ */
Sint32 gfcf_Flush(GfcfCdb *cdb)
{
    gfcd_DelSct(cdb->bufno, 0, -1);
    return gfcd_WaitServer();
}
#endif

Sint32 gfcf_Tell(GfcfCdb *cdb)
{
    return cdb->sct_top + cdb->sct_ofs;
}

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return */
Sint32 gfcf_GetBufSct(GfcfCdb *cdb)
{
    Sint32 nsct;
    Sint32 ret;

    ret = gfcd_GetSctNum(cdb->bufno, 0, 0xFFFF, &nsct, NULL);
    if (ret != 0) {
        return -1;
    }
    if (gfcd_WaitServer() != 0) {
        return -1;
    }
    if (nsct < 0) {
        nsct = 0;
    }
    return nsct;
}
#endif

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return */
Sint32 gfcf_Seek(GfcfFile *gf, Sint32 ofs, Sint32 whence)
{
    GfcfCdb *cdb;
    Sint32 n;

    cdb = &gf->cdb;
    if (ofs < 0) {
        ofs = 0;
    }
    if (whence == 1) {
        n = ofs;
        ofs = gfcf_Tell(cdb) + n;
    } else {
        if (gfcf_Tell(cdb) == ofs) {
            return ofs;
        }
        n = gfcf_GetBufSct(cdb);
        if (n < 0) {
            return -1;
        }
    }
    if (gf->rdmode == 0) {
        if (cdb->sct_top <= ofs && ofs < gfcf_Tell(cdb)) {
            n = ofs - cdb->sct_top;
        }
        if (n > 0) {
            gfcd_DelSct(cdb->bufno, 0, n);
            if (gfcd_WaitServer() != 0) {
                return -1;
            }
        }
        cdb->sct_top = ofs;
        cdb->sct_ofs = 0;
    } else if (gf->rdmode == 1) {
        if (whence == 1) {
            n = gfcf_GetBufSct(cdb);
            if (n < 0) {
                return -1;
            }
        }
        if (ofs < cdb->sct_top || ofs > cdb->sct_top + n + 1) {
            if (gfcf_Flush(cdb) != 0) {
                return -1;
            }
            cdb->sct_top = ofs;
        }
        cdb->sct_ofs = ofs - cdb->sct_top;
    }
    return gfcf_Tell(cdb);
}
#endif

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return; the original keeps local addresses and constants in callee-saved registers */
GfcfPickup *gfcf_StartPickup(GfcfFile *gf, Sint32 snum)
{
    GfcfPickup *pk;
    GfcfCdb *cdb;
    Sint32 nsct;
    Sint32 nword;
    Sint32 a;
    Sint32 b;
    Sint32 c;

    pk = PICKUP;
    cdb = &gf->cdb;
    if (pk->active != 0) {
        return NULL;
    }
    if (gfcd_GetSctNum(cdb->bufno, cdb->sct_ofs, snum, &nsct, &nword) != 0) {
        return NULL;
    }
    if (gfcd_WaitServer() != 0) {
        return NULL;
    }
    if (nword <= 0) {
        return NULL;
    }
    gfsFlow_GetFinfo(gf, 0, 0, &b, &c, &a, 0, 0);
    if (gfcf_Tell(cdb) + nsct >= c && a != 0 && nsct > 0) {
        nword -= b - a;
    }
    pk->tick = CDC_GetDataPtr();
    pk->unk4 = 0;
    pk->nword = nword;
    pk->nsct = nsct;
    pk->active = 1;
    return pk;
}
#endif

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return */
Sint32 gfcf_StartTrans(GfcfPickup *pk, GfcfCdb *cdb)
{
    Sint32 ret;

    ret = gfcd_StartTrans(cdb->bufno, cdb->sct_ofs, pk->nsct);
    if (ret != 0) {
        return 0;
    }
    if (gfcd_WaitServer() != 0) {
        return 0;
    }
    return 1;
}
#endif

#ifdef NONMATCHING /* same instructions, only pool and branch displacements differ (the pool after it) */
Sint32 gfcf_Dummy1(void)
{
    return 0;
}
#endif

#ifdef NONMATCHING /* the original puts cdwnum above the spilled parameters in the frame */
void gfcf_EndPickup(GfcfFile *gf, GfcfPickup *pk, Sint32 nsct)
{
    Sint32 cdwnum;

    gfcd_EndTrans(&cdwnum);
    if (nsct == -1) {
        nsct = pk->nsct;
    }
    gfcf_Seek(gf, nsct, 1);
    pk->active = 0;
}
#endif

#ifdef NONMATCHING /* same instructions, only pool and branch displacements differ */
Sint32 gfcf_CdSeek(GfcfCdb *cdb, CdcPos *pos)
{
    return gfcd_Seek(pos, cdb->lockid);
}
#endif

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return */
Sint32 gfcf_SetCdCon(GfcfCdb *cdb)
{
    Sint32 ret;

    ret = gfcd_SetCdCon(cdb->fltno, cdb->lockid);
    if (ret != 0) {
        return 0;
    }
    ret = gfcd_WaitServer();
    if (ret != 0) {
        return 0;
    }
    return 1;
}
#endif

#ifdef NONMATCHING /* the original spills cdb before the call instead of in its delay slot */
Sint32 gfcf_Lock(GfcfCdb *cdb)
{
    Sint32 id;

    id = gfcd_Lock();
    if (id < 0) {
        return 0;
    }
    cdb->lockid = id;
    return 1;
}
#endif

#ifdef NONMATCHING /* same instructions, only pool and branch displacements differ (alignment-dependent scheduling) */
Sint32 gfcf_IsLocked(GfcfCdb *cdb)
{
    return gfcd_IsLocked(cdb->lockid);
}
#endif

#ifdef NONMATCHING /* same instructions, only pool and branch displacements differ (alignment-dependent scheduling) */
Sint32 gfcf_Unlock(GfcfCdb *cdb)
{
    return gfcd_Unlock(cdb->lockid);
}
#endif
