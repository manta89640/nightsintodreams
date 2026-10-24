#include "sbl/types.h"

/*
 * STM transfer buffer calls (STM_SetTrBuf and the calls after it).
 *
 * NONMATCHING (whole file): like the other STM objects (see sbl/0606772C), this
 * was built by an older SHC that keeps more values in r8-r14, leaves call delay
 * slots empty and loads constants earlier; the C is complete but SHC 5.0 does
 * not reproduce the register allocation and scheduling.
 */

/* Just the parts of the stream objects (sbl/stm.h) these calls use. */
typedef struct {
    Uint8 unk00[8];
    Sint32 sctsz;       /* bytes in a sector of the stream */
    Uint8 unk0C[4];
    Sint32 form2;       /* nonzero: Form 2 data */
    Uint8 unk14[4];
    Sint32 skip;        /* bytes to skip at the start of the data */
    Sint32 unk1C;
} StmTrCdc;

/* GfsDataPack (sbl/gfs_trn.h) */
typedef struct {
    Uint32 *data;
    Sint32 adlt;
} StmTrPack;

/* The start of GfsTrans (sbl/gfs_trn.h) */
typedef struct {
    void *buf;
    Sint32 size;
    Uint32 wp;
    StmTrPack *dps;
} StmGfsTrn;

typedef struct {
    Uint8 unk00[108];
    StmGfsTrn trn;      /* GFS transfer control (gfsTrn_*) */
} StmTrTrn;

typedef Sint32 (*StmTrFunc)(void *obj, void *stm, Sint32 nsct);

typedef struct StmTr {
    void *grp;
    struct StmTr *alt;  /* stream actually used by the calls */
    Uint8 unk08[8];
    StmTrTrn *trn;
    StmTrCdc *cdc;
    StmTrFunc trfunc;
    void *trobj;
} StmTr;

#define STM_UNIT_BYTE  1
#define STM_UNIT_WORD  2
#define STM_UNIT_FORM1 0x800
#define STM_UNIT_FORM2 0x914

#define STM_ERR_NULL  (-11)
#define STM_ERR_RANGE (-14)
#define STM_ERR_MODE  (-17)

extern void func_060693BA(Sint32 id);
extern Bool func_060693C2(Sint32 code);
extern Sint32 func_060693D8(void);
extern void func_0606942E(void);

extern void gfsTrn_SetBuf(void *trn, void *buf, Sint32 size, Sint32 unit);
extern void gfsTrn_SetMode(void *trn, Sint32 mode);
extern void gfsTrn_SetFunc(StmTrTrn *trn, void *func, void *obj);
extern Sint32 gfsTrn_GetNsct(void *trn);
extern void gfsTrn_Request(void *trn, Sint32 nsct);
extern void gfsTrn_GetBuf(void *trn, void **buf, Sint32 *size, Sint32 *unit);
extern Uint32 gfsTrn_GetWp(void *trn);
extern Sint32 gfsTrn_GetFree(void *trn);
extern void gfcf_StartTrans(StmTrPack *dps, Sint32 *stat);

/* Transfer function handed to GFS: calls the stream's own one. */
Sint32 stm_CallTrFunc(StmTr *stm, Sint32 nsct)
{
    return stm->trfunc(stm->trobj, stm, nsct);
}

void STM_SetTrFunc(StmTr *stm, StmTrFunc func, void *obj)
{
    func_060693BA(0x317);
    if (stm == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return;
    }
    stm = stm->alt;
    stm->trfunc = func;
    if (func == NULL) {
        gfsTrn_SetBuf(&stm->trn->trn, NULL, 0, STM_UNIT_FORM1);
        gfsTrn_SetMode(&stm->trn->trn, 3);
        gfsTrn_SetFunc(stm->trn, NULL, NULL);
        stm->trobj = NULL;
    } else {
        gfsTrn_SetBuf(&stm->trn->trn, NULL, 0x000FFFFF, STM_UNIT_FORM1);
        gfsTrn_SetMode(&stm->trn->trn, 4);
        gfsTrn_SetFunc(stm->trn, (void *)stm_CallTrFunc, stm);
        stm->trobj = obj;
    }
    func_060693D8();
}

/* Returns the data to transfer and its address step. */
Uint32 *STM_StartTrans(StmTr *stm, Sint32 *adlt)
{
    StmTrPack *dps;

    func_060693BA(0x318);
    if (stm == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return NULL;
    }
    stm = stm->alt;
    dps = stm->trn->trn.dps;
    if (stm->cdc->unk1C == 0) {
        gfcf_StartTrans(dps, &stm->cdc->unk1C);
    }
    *adlt = dps->adlt;
    func_060693D8();
    return dps->data;
}

/* Word units become byte units; the first sector's data starts where the
 * stream's start offset ends up inside a 2048-byte sector. */
void stm_SetTrBuf(StmTr *stm, void *buf, Sint32 nunit, Sint32 unitsize)
{
    StmTrCdc *cdc;

    if (unitsize == STM_UNIT_WORD) {
        nunit += nunit;
        unitsize = STM_UNIT_BYTE;
    }
    cdc = stm->cdc;
    if (unitsize == STM_UNIT_BYTE || cdc->form2 != 0) {
        cdc->skip = (0x800 - cdc->sctsz % 0x800) % 0x800;
    } else {
        cdc->skip = 0;
    }
    gfsTrn_SetBuf(&stm->trn->trn, buf, nunit, unitsize);
}

void STM_SetTrBuf(StmTr *stm, void *buf, Sint32 nunit, Sint32 unitsize)
{
    Sint32 err;

    func_060693BA(0x316);
    if (stm == NULL) {
        err = STM_ERR_NULL;
    } else if (nunit < 0) {
        err = STM_ERR_RANGE;
    } else if (unitsize == STM_UNIT_BYTE || unitsize == STM_UNIT_WORD ||
               unitsize == STM_UNIT_FORM1 || unitsize == STM_UNIT_FORM2) {
        stm_SetTrBuf(stm->alt, buf, nunit, unitsize);
        func_060693D8();
        return;
    } else {
        err = STM_ERR_MODE;
    }
    func_060693C2(err);
    func_0606942E();
}

/* Drops what is in the transfer buffer and starts filling it again. */
void stm_ResetTrBuf(StmTr *stm)
{
    void *trn = &stm->trn->trn;
    void *buf;
    Sint32 size;
    Sint32 unit;

    gfsTrn_Request(trn, gfsTrn_GetNsct(trn));
    if (stm->trn->trn.buf != NULL) {
        gfsTrn_GetBuf(trn, &buf, &size, &unit);
        gfsTrn_SetBuf(trn, buf, size, unit);
    }
}

void STM_ResetTrBuf(StmTr *stm)
{
    func_060693BA(0x323);
    if (stm == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return;
    }
    stm_ResetTrBuf(stm->alt);
    func_060693D8();
}

/* Words in the transfer buffer. */
Sint32 STM_GetLenTrBuf(StmTr *stm)
{
    Uint32 len;
    Sint32 err;

    func_060693BA(0x326);
    if (stm == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return -1;
    }
    stm = stm->alt;
    len = gfsTrn_GetWp(&stm->trn->trn);
    err = func_060693D8();
    if (err < 0) {
        return err;
    }
    return len >> 1;
}

Bool stm_IsTrBufFull(StmTr *stm)
{
    if (gfsTrn_GetFree(&stm->trn->trn) == 0) {
        return TRUE;
    }
    return FALSE;
}

Bool STM_IsTrBufFull(StmTr *stm)
{
    Bool full;

    func_060693BA(0x327);
    if (stm == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return FALSE;
    }
    full = stm_IsTrBufFull(stm->alt);
    func_060693D8();
    return full;
}
