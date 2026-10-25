/* shc-flags: -macsave=0 -define=NONMATCHING */
#include "sbl/types.h"
#include "sbl/gfs_trn.h"

/* GFS data transfer: moves sectors from the data source (gfs_acc) into the
 * file's destination buffer with the SCU DMA, a CPU DMA channel or the CPU. */

/* Addresses the SCU DMA can't reach: low work RAM and the A-bus. */
#define GFS_SCU_UNREACHABLE(a) \
    (((a) >= 0x00200000 && (a) < 0x00300000) || ((a) >= 0x02000000 && (a) < 0x05900000))

#define GFS_MIN(a, b) ((a) < (b) ? (a) : (b))

#define GFS_TSTAT_SRC    0   /* waiting for source data */
#define GFS_TSTAT_DST    1   /* waiting for destination space */
#define GFS_TSTAT_PREP   2
#define GFS_TSTAT_TRANS  3
#define GFS_TSTAT_WAIT   4
#define GFS_TSTAT_DONE1  5   /* one pack transferred */
#define GFS_TSTAT_END    6
#define GFS_TSTAT_STOP   7

typedef struct {
    Uint32 dxr;
    Uint32 dxw;
    Uint32 dxc;
    Uint32 dxad_r;
    Uint32 dxad_w;
    Uint32 dxmod;
    Uint32 dxrup;
    Uint32 dxwup;
    Uint32 dxft;
    Uint32 msk;
} GfsScuPrm;

typedef struct {
    Uint32 pr;
    Uint32 dme;
    Uint32 msk;
} GfsCpuComPrm;

typedef struct {
    Uint32 sar;
    Uint32 dar;
    Uint32 tcr;
    Uint32 dm;
    Uint32 sm;
    Uint32 ts;
    Uint32 ar;
    Uint32 ie;
    Uint32 drcr;
    Uint32 msk;
} GfsCpuPrm;

/* What a CPU DMA transfer leaves for the CPU: the last size % 4 bytes. */
typedef struct {
    Sint32 rem;
    Uint32 *src;
    Uint32 *dst;
} GfsDmaTail;

extern Sint32 gfs_scu_dma_busy;       /* SCU DMA in progress */
extern GfsDmaTail gfs_cpu_dma_tail;

extern GfsDataPack *gfsAcc_GetPack(GfsFile *gfs, Sint32 nsct);
extern Sint32 gfsAcc_PreparePack(GfsDataPack *dp, GfsFlow *flow);
extern void gfsAcc_ReleasePack(GfsFile *gfs, GfsDataPack *dp, Sint32 nsct);

extern void CSH_Purge(void *adr, Uint32 size);
extern void DMA_CpuSetComPrm(GfsCpuComPrm *prm);
extern void DMA_CpuSetPrm(GfsCpuPrm *prm, Uint32 ch);
extern void DMA_CpuStart(Uint32 ch);
extern void DMA_CpuStop(Uint32 ch);
extern Sint32 DMA_CpuGetStatus(Uint32 ch);
extern void DMA_ScuSetPrm(GfsScuPrm *prm, Uint32 ch);
extern void DMA_ScuStart(Uint32 ch);
extern void DMA_ScuGetStatus(Uint32 *stat, Uint32 ch);

Sint32 gfsTrn_SetMode(GfsTrans *trans, Sint32 mode);
void gfsTrn_SetUnit(GfsTrans *trans, Sint32 unit);
Sint32 gfsTrn_Step(GfsFile *gfs, Sint32 *done);
static void gfsTrn_GetSrcPack(GfsFile *gfs);
static void gfsTrn_GetDstPack(GfsTrans *trans);
static void gfsTrn_SdmaTrans(Sint32 ch, Uint32 *dst, Sint32 dinc, Uint32 *src, Sint32 sinc, Uint32 size);
static Sint32 gfsTrn_PrepPack(GfsTrans *trans);
static Sint32 gfsTrn_TransPack(GfsFile *gfs);
static Sint32 gfsTrn_WaitPack(GfsTrans *trans);
static void gfsTrn_CopyTail(Sint32 n, Uint8 *dst, Uint32 *src);
Sint32 gfsTrn_GetFree(GfsTrans *trans);
static GfsDataPack *gfsTrn_AllocDstPack(GfsTrans *trans, Sint32 len);
static void gfsTrn_FreeDstPack(GfsTrans *trans, GfsDataPack *dp);

GfsTrans *gfsTrn_Init(GfsTrans *trans)
{
    trans->buf = NULL;
    trans->size = 0;
    trans->wp = 0;
    trans->dps = NULL;
    trans->dpd = NULL;
    trans->tsize = 1;
    trans->nsct = 0;
    trans->sctcnt = 0;
    trans->asize = 0;
    gfsTrn_SetUnit(trans, 1);
    trans->stat = GFS_TSTAT_SRC;
    gfsTrn_SetMode(trans, GFS_TMODE_CPU);
    return trans;
}

Sint32 gfsTrn_SetMode(GfsTrans *trans, Sint32 mode)
{
    Sint32 old = trans->mode;

    trans->mode = mode;
    trans->aobj = NULL;
    trans->tfunc = NULL;
    return old;
}

void gfsTrn_SetUnit(GfsTrans *trans, Sint32 unit)
{
    trans->unit = unit;
}

#ifdef NONMATCHING
/* NONMATCHING: target divides by 4 with __divlu and multiplies with mul.l (4 kept in r5); SHC 5.0 uses shifts */
void gfsTrn_Request(GfsTrans *trans, Sint32 nsct)
{
    Sint32 mode;

    trans->nsct = nsct;
    trans->sctcnt = 0;
    if (trans->stat == GFS_TSTAT_END) {
        trans->stat = GFS_TSTAT_SRC;
        mode = trans->mode;
        if (mode == GFS_TMODE_SDMA0 || mode == GFS_TMODE_SDMA1 || mode == GFS_TMODE_CPU) {
            /* DMA and CPU transfers move whole words */
            trans->wp += 3;
            trans->wp = trans->wp / sizeof(Uint32) * sizeof(Uint32);
        }
    }
}
#endif

Sint32 gfsTrn_GetNsct(GfsTrans *trans)
{
    return trans->nsct;
}

Sint32 gfsTrn_GetSctcnt(GfsTrans *trans)
{
    return trans->sctcnt;
}

Sint32 gfsTrn_SetTsize(GfsTrans *trans, Sint32 tsize)
{
    Sint32 old = trans->tsize;

    trans->tsize = tsize;
    return old;
}

void gfsTrn_Activate(GfsTrans *trans)
{
    trans->active = TRUE;
}

void gfsTrn_Deactivate(GfsTrans *trans)
{
    trans->active = FALSE;
}

#ifdef NONMATCHING
/* NONMATCHING: target loads dps/dpd into r0 for the NULL tests; SHC 5.0 uses r2/r3 */
/* Finish the pack in flight (with a timeout), then drop both packs. */
void gfsTrn_Stop(GfsFile *gfs, Sint32 nsct)
{
    GfsTrans *trans = &gfs->trans;
    Sint32 done;
    Sint32 stat;

    gfs_mng->tmcnt = 0;
    while ((stat = trans->stat) != GFS_TSTAT_SRC && stat != GFS_TSTAT_END && stat != GFS_TSTAT_STOP) {
        gfsTrn_Step(gfs, &done);
        if (++gfs_mng->tmcnt > 0x600000) {
            break;
        }
    }
    if (trans->dps != NULL) {
        gfsAcc_ReleasePack(gfs, trans->dps, nsct);
        trans->sctcnt += trans->dps->nsct;
        trans->dps = NULL;
    }
    if (trans->dpd != NULL) {
        gfsTrn_FreeDstPack(trans, trans->dpd);
        trans->dpd = NULL;
    }
    trans->stat = GFS_TSTAT_END;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: target copies mode to r5, keeps the 1 in r6 and keeps a redundant 0 < n test */
Sint32 gfsTrn_Exec(GfsFile *gfs, Sint32 *done)
{
    GfsTrans *trans = &gfs->trans;
    Sint32 n;
    Sint32 i;
    Sint32 stat;

    switch (trans->mode) {
    case GFS_TMODE_SCU:
    case GFS_TMODE_SDMA0:
    case GFS_TMODE_SDMA1:
        if (trans->stat != GFS_TSTAT_SRC) {
            n = 2;
        } else {
            n = 1;
        }
        break;
    case GFS_TMODE_CPU:
    case GFS_TMODE_STM:
    default:
        n = 1;
        break;
    }
    stat = 0;
    for (i = 0; i < n; i++) {
        stat = gfsTrn_Step(gfs, done);
        if (stat == GFS_TSTAT_STOP) {
            break;
        }
        if (stat != GFS_TSTAT_SRC && stat != GFS_TSTAT_END) {
            break;
        }
    }
    return stat;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: target tests active/dps in r1/r0 (SHC 5.0: r3/r2) and does not merge the two stat returns */
/* Take source packs and release them without transferring anything. */
Sint32 gfsTrn_Skip(GfsFile *gfs)
{
    GfsTrans *trans = &gfs->trans;

    if (trans->nsct <= 0) {
        return GFS_TSTAT_END;
    }
    if (!trans->active) {
        return trans->stat;
    }
    switch (trans->stat) {
    case GFS_TSTAT_SRC:
        gfsTrn_GetSrcPack(gfs);
        if (trans->dps == NULL) {
            break;
        }
        trans->stat = GFS_TSTAT_DONE1;
    case GFS_TSTAT_DONE1:
        gfsAcc_ReleasePack(gfs, trans->dps, -1);
        trans->sctcnt += trans->dps->nsct;
        trans->dps = NULL;
        if (trans->sctcnt >= trans->nsct) {
            trans->stat = GFS_TSTAT_END;
        } else {
            trans->stat = GFS_TSTAT_SRC;
        }
        break;
    }
    return trans->stat;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: target tests active/dps in r1/r0 (SHC 5.0: r3/r2) and does not merge the early returns */
Sint32 gfsTrn_Step(GfsFile *gfs, Sint32 *done)
{
    GfsTrans *trans = &gfs->trans;
    Sint32 fin = 0;

    if (trans->nsct <= 0) {
        *done = fin;
        return GFS_TSTAT_END;
    }
    if (!trans->active) {
        *done = fin;
        return trans->stat;
    }
    switch (trans->stat) {
    case GFS_TSTAT_SRC:
        gfsTrn_GetSrcPack(gfs);
        if (trans->dps == NULL) {
            break;
        }
        trans->stat = GFS_TSTAT_DST;
    case GFS_TSTAT_DST:
        gfsTrn_GetDstPack(trans);
        if (trans->dpd == NULL) {
            break;
        }
        trans->stat = GFS_TSTAT_PREP;
    case GFS_TSTAT_PREP:
        if (!gfsTrn_PrepPack(trans)) {
            break;
        }
        trans->stat = GFS_TSTAT_TRANS;
    case GFS_TSTAT_TRANS:
        if (!gfsTrn_TransPack(gfs)) {
            break;
        }
        trans->stat = GFS_TSTAT_WAIT;
    case GFS_TSTAT_WAIT:
        if (gfsTrn_WaitPack(trans) > 0) {
            break;
        }
        fin = 1;
        trans->stat = GFS_TSTAT_DONE1;
    case GFS_TSTAT_DONE1:
        if (trans->dps->len == trans->asize) {
            gfsAcc_ReleasePack(gfs, trans->dps, -1);
            trans->sctcnt += trans->dps->nsct;
            trans->dps = NULL;
        }
        gfsTrn_FreeDstPack(trans, trans->dpd);
        trans->dpd = NULL;
        if (trans->sctcnt >= trans->nsct) {
            trans->stat = GFS_TSTAT_END;
        } else {
            trans->stat = GFS_TSTAT_SRC;
        }
        break;
    }
    *done = fin;
    return trans->stat;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: prologue scheduling and temporaries differ (register allocation) */
static void gfsTrn_GetSrcPack(GfsFile *gfs)
{
    GfsTrans *trans = &gfs->trans;
    Sint32 n;
    Sint32 m;
    Sint32 rem;

    rem = trans->nsct - trans->sctcnt;
    n = GFS_MIN(rem, trans->tsize);
    if (trans->unit > 1) {
        if (trans->dps != NULL) {
            n = (trans->dps->len - trans->asize) / trans->unit;
        }
        m = gfsTrn_GetFree(trans) / trans->unit;
        if (n >= m) {
            n = m;
        }
    }
    if (trans->dps == NULL) {
        if ((trans->dps = gfsAcc_GetPack(gfs, n)) != NULL) {
            trans->asize = 0;
        }
    }
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: target keeps dps->len - asize in r13; SHC 5.0 also uses r8 */
static void gfsTrn_GetDstPack(GfsTrans *trans)
{
    Sint32 len;

    if (trans->unit > 1) {
        len = trans->dps->len;
    } else {
        len = GFS_MIN(trans->dps->len - trans->asize, gfsTrn_GetFree(trans));
    }
    trans->dpd = gfsTrn_AllocDstPack(trans, len);
}
#endif

Sint32 gfsTrn_ScuPrep(void)
{
    return TRUE;
}

#ifdef NONMATCHING
/* NONMATCHING: delay slots of the if/else stores filled differently; mid-function pool placement differs */
void gfsTrn_ScuTrans(Uint32 *dst, Sint32 dinc, Uint32 *src, Sint32 sinc, Uint32 size)
{
    GfsScuPrm prm;
    Uint32 adr;

    if (dst == NULL) {
        return;
    }
    prm.dxr = (Uint32)src;
    prm.dxw = (Uint32)dst;
    prm.dxc = size;
    if (sinc == 0) {
        prm.dxad_r = 0;
    } else {
        prm.dxad_r = 0x100;
    }
    if (dinc == 0) {
        prm.dxad_w = 0;
    } else {
        adr = (Uint32)dst & 0x0FFFFFFF;
        if (adr >= 0x05A00000 && adr < 0x05FE0000) {
            prm.dxad_w = 1;     /* B-bus: 2-byte steps */
        } else {
            prm.dxad_w = 2;
        }
    }
    prm.dxmod = 0;
    prm.dxrup = 0;
    prm.dxwup = 0;
    prm.dxft = 7;
    prm.msk = 3;
    gfs_scu_dma_busy = 1;
    DMA_ScuSetPrm(&prm, 0);
    DMA_ScuStart(0);
    CSH_Purge(dst, size);
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: instructions before the call are scheduled differently */
Sint32 gfsTrn_ScuWait(void)
{
    Uint32 stat;

    DMA_ScuGetStatus(&stat, 0);
    if (stat == 1) {
        return TRUE;
    }
    gfs_scu_dma_busy = 0;
    return FALSE;
}
#endif

static Sint32 gfsTrn_SdmaPrep(Sint32 ch)
{
    return TRUE;
}

#ifdef NONMATCHING
/* NONMATCHING: target spills n, reads sinc from the stack, puts prm before com and leaves jsr delay slots empty */
static void gfsTrn_SdmaTrans(Sint32 ch, Uint32 *dst, Sint32 dinc, Uint32 *src, Sint32 sinc, Uint32 size)
{
    Sint32 n;
    GfsCpuPrm prm;
    GfsCpuComPrm com;

    n = size >> 2;
    if (n > 0) {
        DMA_CpuStop(ch);
        com.pr = 0;
        com.dme = 1;
        com.msk = 15;
        DMA_CpuSetComPrm(&com);
        prm.sar = (Uint32)src;
        prm.dar = (Uint32)dst;
        prm.tcr = n;
        if (dinc > 0) {
            prm.dm = 1;
        } else if (dinc < 0) {
            prm.dm = 2;
        } else {
            prm.dm = 0;
        }
        if (sinc > 0) {
            prm.sm = 1;
        } else if (sinc < 0) {
            prm.sm = 2;
        } else {
            prm.sm = 0;
        }
        prm.ts = 0x800;
        prm.ar = 0x200;
        prm.ie = 0;
        prm.msk = 0x2FF;
        DMA_CpuSetPrm(&prm, ch);
        DMA_CpuStart(ch);
        CSH_Purge(dst, size);
    }
    gfs_cpu_dma_tail.rem = size & 3;
    gfs_cpu_dma_tail.dst = dst + n * dinc;
    gfs_cpu_dma_tail.src = src + n * sinc;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: target reloads &gfs_cpu_dma_tail three times instead of keeping it in r14; empty jsr delay slot */
static Sint32 gfsTrn_SdmaWait(Sint32 ch)
{
    if (DMA_CpuGetStatus(ch) == 0) {
        return TRUE;
    }
    gfsTrn_CopyTail(gfs_cpu_dma_tail.rem, (Uint8 *)gfs_cpu_dma_tail.dst, gfs_cpu_dma_tail.src);
    return FALSE;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: code matches; the bra displacement depends on gfsTrn_SdmaTrans/SdmaWait */
Sint32 gfsTrn_Sdma0Prep(void)
{
    return gfsTrn_SdmaPrep(0);
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: code matches; the bsr displacement depends on gfsTrn_SdmaWait */
void gfsTrn_Sdma0Trans(Uint32 *dst, Sint32 dinc, Uint32 *src, Sint32 sinc, Uint32 size)
{
    gfsTrn_SdmaTrans(0, dst, dinc, src, sinc, size);
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: code matches; the bra displacement depends on the code before it */
Sint32 gfsTrn_Sdma0Wait(void)
{
    return gfsTrn_SdmaWait(0);
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: code matches; the bra displacement depends on gfsTrn_SdmaTrans/SdmaWait */
Sint32 gfsTrn_Sdma1Prep(void)
{
    return gfsTrn_SdmaPrep(1);
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: code matches; the bsr displacement depends on gfsTrn_SdmaWait */
void gfsTrn_Sdma1Trans(Uint32 *dst, Sint32 dinc, Uint32 *src, Sint32 sinc, Uint32 size)
{
    gfsTrn_SdmaTrans(1, dst, dinc, src, sinc, size);
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: code matches; the bra displacement depends on the code before it */
Sint32 gfsTrn_Sdma1Wait(void)
{
    return gfsTrn_SdmaWait(1);
}
#endif

Sint32 gfsTrn_CpuPrep(void)
{
    return TRUE;
}

#ifdef NONMATCHING
/* NONMATCHING: target keeps src in r13 and the scaled steps in r5/r7 */
void gfsTrn_CpuTrans(Uint32 *dst, Sint32 dinc, Uint32 *src, Sint32 sinc, Uint32 size)
{
    Sint32 i;
    Sint32 n;

    if (dst == NULL) {
        return;
    }
    n = size >> 2;
    for (i = 0; i < n; i++) {
        *dst = *src;
        dst += dinc;
        src += sinc;
    }
    gfsTrn_CopyTail(size & 3, (Uint8 *)dst, src);
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: code matches; SHC 5.0 does not dump the literal pool after it */
Sint32 gfsTrn_CpuWait(void)
{
    return FALSE;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: SHC 5.0 inverts the last case test to fall into its body; target also sign-extends the table offset (exts.b) */
static Sint32 gfsTrn_PrepPack(GfsTrans *trans)
{
    Sint32 mode = trans->mode;
    GfsDataPack *dpd = trans->dpd;
    Uint32 adr = (Uint32)dpd->data;

    switch (mode) {
    case GFS_TMODE_STM:
        return TRUE;
    case GFS_TMODE_SCU:
        adr &= 0x0FFFFFFF;
        if (GFS_SCU_UNREACHABLE(adr)) {
            mode = GFS_TMODE_CPU;
        }
        break;
    }
    return gfs_trn_func_tbl[mode].prepare();
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: target sign-extends the table offset (exts.b), keeps mode in r13 and branches around the SCU check */
static Sint32 gfsTrn_TransPack(GfsFile *gfs)
{
    GfsTrans *trans = &gfs->trans;
    GfsDataPack *dps = trans->dps;
    GfsDataPack *dpd = trans->dpd;
    Sint32 n;
    Sint32 mode;
    Uint8 *src;
    Uint8 *dst;
    Sint32 dinc;
    Sint32 size;
    Uint32 adr;

    if (trans->mode == GFS_TMODE_STM) {
        n = trans->tfunc(trans->aobj, dps->nsct);
        if (n < 0) {
            dps->len = n;
            return FALSE;
        }
        dps->nsct = n;
        dpd->nsct = n;
        n *= trans->unit;
        dps->len = n;
        dpd->len = n;
        trans->asize = n;
        return TRUE;
    }
    if (trans->asize == 0) {
        if (!gfsAcc_PreparePack(dps, &gfs->flow)) {
            return FALSE;
        }
    }
    src = dps->data + trans->asize * dps->adlt;
    dst = dpd->data;
    dinc = dpd->adlt;
    size = dpd->len;
    mode = trans->mode;
    if (mode == GFS_TMODE_SCU) {
        adr = (Uint32)dst & 0x0FFFFFFF;
        if (GFS_SCU_UNREACHABLE(adr)) {
            mode = GFS_TMODE_CPU;
        }
    }
    gfs_trn_func_tbl[mode].transfer(dst, dinc, src, dps->adlt, size);
    trans->asize += size;
    return TRUE;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: SHC 5.0 inverts the last case test to fall into its body; target also sign-extends the table offset (exts.b) */
static Sint32 gfsTrn_WaitPack(GfsTrans *trans)
{
    Sint32 mode = trans->mode;
    Uint32 adr = (Uint32)trans->dpd->data;

    switch (mode) {
    case GFS_TMODE_STM:
        if (trans->dpd->nsct >= 0) {
            return FALSE;
        }
        return TRUE;
    case GFS_TMODE_SCU:
        adr &= 0x0FFFFFFF;
        if (GFS_SCU_UNREACHABLE(adr)) {
            mode = GFS_TMODE_CPU;
        }
        break;
    }
    return gfs_trn_func_tbl[mode].wait();
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: target keeps a separate dst pointer and a redundant i < n test */
static void gfsTrn_CopyTail(Sint32 n, Uint8 *dst, Uint32 *src)
{
    Uint32 tail;
    Sint32 i;

    if (n > 0) {
        tail = *src;
        for (i = 0; i < n; i++) {
            *dst++ = ((Uint8 *)&tail)[i];
        }
    }
}
#endif

Sint32 gfsTrn_GetWp(GfsTrans *trans)
{
    return trans->wp;
}

#ifdef NONMATCHING
/* NONMATCHING: code matches; SHC 5.0 does not dump the literal pool after it */
Sint32 gfsTrn_GetFree(GfsTrans *trans)
{
    return trans->size * trans->unit - trans->wp;
}
#endif

#ifdef NONMATCHING
/* NONMATCHING: target loads dp->used into r0 for the test; SHC 5.0 uses r1 */
static GfsDataPack *gfsTrn_AllocDstPack(GfsTrans *trans, Sint32 len)
{
    GfsDataPack *dp = &gfs_mng->dpd;

    if (dp->used) {
        return NULL;
    }
    dp->data = trans->buf + trans->wp;
    dp->adlt = 1;
    dp->len = len;
    dp->used = TRUE;
    return dp;
}
#endif

static void gfsTrn_FreeDstPack(GfsTrans *trans, GfsDataPack *dp)
{
    Sint32 mode = trans->mode;

    if (mode != GFS_TMODE_STM) {
        trans->wp += dp->len;
    }
    dp->used = FALSE;
}

void gfsTrn_GetBuf(GfsTrans *trans, Uint8 **buf, Sint32 *size, Sint32 *unit)
{
    *buf = trans->buf;
    *size = trans->size;
    *unit = trans->unit;
}

void gfsTrn_SetBuf(GfsTrans *trans, Uint8 *buf, Sint32 size, Sint32 unit)
{
    trans->buf = buf;
    trans->size = size;
    trans->unit = unit;
    trans->wp = 0;
}

#ifdef NONMATCHING
/* NONMATCHING: code matches; the end-of-file literal pool holds different constants */
void gfsTrn_SetFunc(GfsFile *gfs, GfsTrnFunc func, void *obj)
{
    GfsTrans *trans = &gfs->trans;

    trans->aobj = obj;
    trans->tfunc = func;
    trans->mode = GFS_TMODE_STM;
}
#endif
