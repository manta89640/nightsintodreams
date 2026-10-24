#ifndef SBL_STM_CD_H
#define SBL_STM_CD_H

#include "sbl/types.h"

/* CDC library types (sega_cdc.h). */
#ifndef SBL_CDC_TYPES
#define SBL_CDC_TYPES
typedef struct {
    Sint32 ptype;               /* CDC_PTYPE_* */
    union {
        Sint32 fad;
        struct {
            Uint8 tno;
            Uint8 idx;
        } trkidx;
    } pbody;
} CdcPos;

typedef struct {
    CdcPos start;
    CdcPos end;
    Uint8  pmode;
} CdcPly;

typedef struct {
    Uint8 flgrep;
    Uint8 ctladr;
    Uint8 tno;
    Uint8 idx;
    Sint32 fad;
} CdcRep;

typedef struct {
    Uint8  status;
    CdcRep report;
} CdcStat;

typedef struct {
    Sint32 fad;
    Uint8  fn;
    Uint8  cn;
    Uint8  sm;
    Uint8  ci;
} CdcSct;

/* SBL accesses these structs through macros like these, which keeps SHC from
   folding `&local` into an @(disp,r15) operand. */
#define CDC_POS_PTYPE(pos)  ((pos)->ptype)
#define CDC_PLY_STYPE(ply)  ((ply)->start.ptype)
#define CDC_PLY_SFAD(ply)   ((ply)->start.pbody.fad)
#define CDC_PLY_ETYPE(ply)  ((ply)->end.ptype)
#define CDC_PLY_EFAS(ply)   ((ply)->end.pbody.fad)
#define CDC_PLY_PMODE(ply)  ((ply)->pmode)
#define CDC_STAT_FAD(stat)  ((stat)->report.fad)
#define CDC_SCT_FAD(sct)    ((sct)->fad)
#define CDC_SCT_FN(sct)     ((sct)->fn)
#define CDC_SCT_CN(sct)     ((sct)->cn)
#define CDC_SCT_SM(sct)     ((sct)->sm)
#define CDC_SCT_CI(sct)     ((sct)->ci)
#endif

#define CDC_PTYPE_FAD   1
#define CDC_PTYPE_NOCHG 3
#define CDC_PM_NOCHG    0xFF
#define CDC_HIRQ_CSCT   0x0004

/* Sector header as handed back to STM (fn/cn widened to words). */
typedef struct {
    Sint32 fad;
    Sint32 fn;
    Sint32 cn;
    Uint8  sm;
    Uint8  ci;
} StmSctInfo;

typedef struct {
    Sint32 unk00[5];
    void  *fh;                  /* 0x14: file the stream reads */
} StmFileRef;

/* The parts of an STM stream object these helpers use. */
typedef struct {
    Sint32      unk00[3];
    StmFileRef *file;           /* 0x0C */
    Sint32      unk10;
    Sint32      fad;            /* 0x14: next FAD to play */
    Sint32      unk18[2];
    Sint32      bufno;          /* 0x20: CD buffer partition */
    Sint32      unk24[4];
    Sint32      filt;           /* 0x34: CD filter */
    Sint32      unk38[2];
    Sint32      sctpos;         /* 0x40: first sector of the stream in the buffer */
} StmObj;

typedef struct {
    Sint32 unk00[5];
    Sint32 play_sfad;           /* 0x14 */
    Sint32 play_efad;           /* 0x18 */
} StmMng;

extern StmMng *stm_mng;

Sint32 CDC_GetCurStat(CdcStat *stat);
Sint32 gfsFlow_GetFinfo(void *fh, Sint32 *fid, Sint32 *fad, Sint32 *sctsz, Sint32 *nsct,
                     Sint32 *lstsz, Sint32 *fn, Sint32 *atr);
Sint32 gfcd_Play(CdcPly *ply, Sint32 filt);
Sint32 gfcd_Seek(CdcPos *pos, Sint32 filt);
Sint32 gfcf_GetNumSct(StmObj *obj, Sint32 nsct, Sint32 flag);
Sint32 gfcd_GetSctInfo(Sint32 bufno, Sint32 sctpos, CdcSct *sct);
Sint32 gfcd_GetSctNum(Sint32 bufno, Sint32 sctpos, Sint32 nsct, Sint32 *a, Sint32 *nword);
void   gfcd_WaitServer(void);
void   gfcd_DelSct(Sint32 bufno, Sint32 sctpos, Sint32 nsct);
Sint32 CDC_GetSctNum(Sint32 bufno, Sint32 *nsct);
Sint32 CDC_GetBufSiz(Sint32 *totalsiz, Sint32 *bufnum, Sint32 *freesiz);
Uint16 CDC_GetHirqReq(void);
void   CDC_ClrHirqReq(Sint32 bitpat);

#endif
