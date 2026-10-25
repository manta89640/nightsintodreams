#ifndef SBL_GFCD_H
#define SBL_GFCD_H

/* GFS CD-block layer: the CD part of a GFS file handle (gfcf_*), the command
 * queues that drive the CD block (gfcd_*), and the CDC types they use. */

#include "sbl/types.h"

/* ---- CDC (SBL sega_cdc.h layout) ---- */

/* A CD block command or response: the four 16-bit registers CR1-CR4. */
typedef union {
    Uint8  b[8];
    Uint16 w[4];
    Uint32 l[2];
} CdcCmd;

typedef CdcCmd CdcRsp;

#define CDC_CMD_CLR(cmd) ((cmd).l[0] = 0, (cmd).l[1] = 0)

typedef struct {
    Uint8  flgrep;
    Uint8  ctladr;
    Uint8  trkno;
    Uint8  idxno;
    Sint32 fad;
} CdcRep;

typedef struct {
    Uint8  status;
    CdcRep report;
} CdcStat;

typedef struct {
    Uint8 fn;
    Uint8 cn;
    Uint8 smmsk;
    Uint8 smval;
    Uint8 cimsk;
    Uint8 cival;
} CdcSubh;

typedef struct {
    Sint32 ptype;
    Sint32 pbody;
} CdcPos;

typedef struct {
    Sint32 fad;
    Sint32 size;
    Uint8  unit;
    Uint8  gap;
    Uint8  fn;
    Uint8  atr;
} CdcFile;

typedef struct {
    Uint8 hflag;
    Uint8 ver;
    Uint8 mpver;
    Uint8 drv;
    Uint8 rev;
} CdcHw;

#define CDC_STAT(stat)      ((stat)->status & 0x0F)
#define CDC_ST_PAUSE        1
#define CDC_ST_STANDBY      2
#define CDC_ST_OPEN         6
#define CDC_ST_NODISC       7
#define CDC_ST_ERROR        9
#define CDC_ST_FATAL        10

/* Session info word: first track in the top byte, FAD in the low 24 bits. */
#define CDC_SES_TRK(ses)    (*(Uint8 *)(ses))
#define CDC_SES_FAD(ses)    (*(Uint32 *)(ses) & 0x00FFFFFF)

#define CDC_HIRQ_CSCT       0x0004
#define CDC_HIRQ_BFUL       0x0008
#define CDC_HIRQ_PEND       0x0010
#define CDC_HIRQ_DCHG       0x0020
#define CDC_HIRQ_ESEL       0x0040
#define CDC_HIRQ_EHST       0x0080
#define CDC_HIRQ_ECPY       0x0100
#define CDC_HIRQ_EFLS       0x0200
#define CDC_HIRQ_SCDQ       0x0400

/* CDC API in units not merged yet; aliases for the names in the target asm. */
#define CDC_TgetToc         CDC_TgetToc
#define CDC_GetSes          CDC_GetSes
#define CDC_CdInit          CDC_CdInit
#define CDC_DataReady       CDC_DataReady
#define CDC_DataEnd         CDC_DataEnd
#define CDC_CdSetCon        CDC_CdSetCon
#define CDC_SetFiltRange    CDC_SetFiltRange
#define CDC_SetFiltSubh     CDC_SetFiltSubh
#define CDC_GetFiltSubh     CDC_GetFiltSubh
#define CDC_SetFiltMode     CDC_SetFiltMode
#define CDC_GetFiltMode     CDC_GetFiltMode
#define CDC_SetFiltCon      CDC_SetFiltCon
#define CDC_ResetSelector   CDC_ResetSelector
#define CDC_GetBufSiz       CDC_GetBufSiz
#define CDC_GetSctNum       CDC_GetSctNum
#define CDC_CalActSiz       CDC_CalActSiz
#define CDC_GetActSiz       CDC_GetActSiz
#define CDC_GetSctInfo      CDC_GetSctInfo
#define CDC_SetSctLen       CDC_SetSctLen
#define CDC_GetSctData      CDC_GetSctData
#define CDC_DelSctData      CDC_DelSctData
#define CDC_MoveSctData     CDC_MoveSctData
#define CDC_ChgDir          CDC_ChgDir
#define CDC_ReadDir         CDC_ReadDir
#define CDC_GetFileScope    CDC_GetFileScope
#define CDC_TgetFileInfo    CDC_TgetFileInfo
#define CDC_AbortFile       CDC_AbortFile
#define cdc_ExecCmdRsp      cdc_ExecCmdRsp
#define cdc_ExecCmdSub      cdc_ExecCmdSub
#define cdc_GetLastStat     cdc_GetLastStat
#define cdc_RspToStat       cdc_RspToStat
#define CDC_CdPlay          CDC_CdPlay
#define CDC_CdSeek          CDC_CdSeek

Sint32 CDC_TgetToc(Uint32 *toc);
Sint32 CDC_GetSes(Sint32 sesno, Uint32 *ses);
Sint32 CDC_CdInit(Sint32 iflag, Sint32 stnby, Sint32 ecc, Sint32 retry);
Sint32 CDC_DataReady(Sint32 dtype);
Sint32 CDC_DataEnd(Sint32 *cdwnum);
Sint32 CDC_CdSetCon(Sint32 filtno);
Sint32 CDC_SetFiltRange(Sint32 filtno, Sint32 fad, Sint32 fasnum);
Sint32 CDC_SetFiltSubh(Sint32 filtno, CdcSubh *subh);
Sint32 CDC_GetFiltSubh(Sint32 filtno, CdcSubh *subh);
Sint32 CDC_SetFiltMode(Sint32 filtno, Sint32 fmode);
Sint32 CDC_GetFiltMode(Sint32 filtno, Sint32 *fmode);
Sint32 CDC_SetFiltCon(Sint32 filtno, Sint32 cflag, Sint32 bufno, Sint32 flnout);
Sint32 CDC_ResetSelector(Sint32 rflag, Sint32 bufno);
Sint32 CDC_GetBufSiz(Sint32 *totalsiz, Sint32 *bufnum, Sint32 *freesiz);
Sint32 CDC_GetSctNum(Sint32 bufno, Sint32 *snum);
Sint32 CDC_CalActSiz(Sint32 bufno, Sint32 spos, Sint32 snum);
Sint32 CDC_GetActSiz(Sint32 *actwnum);
Sint32 CDC_GetSctInfo(Sint32 bufno, Sint32 sp, void *sct);
Sint32 CDC_SetSctLen(Sint32 getslen, Sint32 putslen);
Sint32 CDC_GetSctData(Sint32 bufno, Sint32 spos, Sint32 snum);
Sint32 CDC_DelSctData(Sint32 bufno, Sint32 spos, Sint32 snum);
Sint32 CDC_MoveSctData(Sint32 dst, Sint32 src, Sint32 spos, Sint32 snum);
Sint32 CDC_ChgDir(Sint32 filtno, Sint32 fid);
Sint32 CDC_ReadDir(Sint32 filtno, Sint32 fid);
Sint32 CDC_GetFileScope(Sint32 *fid, Sint32 *infnum, Sint32 *drend);
Sint32 CDC_TgetFileInfo(Sint32 fid, CdcFile *file);
Sint32 CDC_AbortFile(void);
Sint32 cdc_ExecCmdRsp(Sint32 hirq, CdcCmd *cmd, CdcRsp *rsp);
Sint32 cdc_ExecCmdSub(Sint32 hirq, CdcCmd *cmd, CdcRsp *rsp, Sint32 full);
Sint32 cdc_GetLastStat(CdcStat *stat);
void cdc_RspToStat(CdcRsp *rsp, CdcStat *stat);
Sint32 CDC_CdPlay(void *ply);
Sint32 CDC_CdSeek(CdcPos *pos);

Sint32 CDC_GetCurStat(CdcStat *stat);
Sint32 CDC_GetLastStat(CdcStat *stat);
Sint32 CDC_GetPeriStat(CdcStat *stat);

/* CD block register access (unit sbl/060680CC). */
Uint32 CDC_GetDataPtr(void);
Uint32 CDC_GetHirqReq(void);             /* reads HIRQ */
void CDC_ClrHirqReq(Sint32 mask);        /* clears the HIRQ bits that are 0 in mask */
void cdc_read_cr(CdcRsp *rsp);        /* reads CR1-CR4 */

/* ---- GFS ---- */

/* CD part of a GFS file handle (at +28 in the handle). */
typedef struct {
    Sint32 unk0;
    Sint32 bufno;       /* buffer partition */
    Sint32 unk8;
    Sint32 fltno;       /* filter feeding it */
    CdcSubh subh;       /* filter subheader condition */
    Sint32 fmode;       /* filter mode */
    Sint32 lockid;      /* gfcd_Lock id, -1 if not locked */
    Sint32 sct_top;     /* sector number of the first sector in the partition */
    Sint32 sct_ofs;     /* current position relative to sct_top */
    Sint32 unk40;
    Sint32 unk44;
} GfcfCdb;

typedef struct {
    Uint8 unk0[14];
    Sint8 fn;           /* file number for the subheader filter */
    Uint8 unk15[13];
    GfcfCdb cdb;
    Sint32 rdmode;      /* 0: sectors are deleted as they are passed, 1: kept */
} GfcfFile;

/* Transfer state in the GFS work area (gfs_mng + 0x438). */
typedef struct {
    Uint32 tick;
    Sint32 unk4;
    Sint32 nword;
    Sint32 nsct;
    Sint32 active;
} GfcfPickup;

extern Uint8 *gfs_mng;       /* GFS work area */

Sint32 gfsFlow_GetFinfo(GfcfFile *gf, Sint32 a, Sint32 b, Sint32 *c, Sint32 *d, Sint32 *e, Sint32 f, Sint32 g);

/* One queued filter setup (CDC_SetFiltMode / SetFiltSubh / SetFiltRange). */
typedef struct {
    Uint8 fltno;
    Uint8 fmode;
    CdcSubh subh;
    Sint32 fad;
    Sint32 snum;
} GfcdFiltCmd;

/* One queued filter connection (CDC_SetFiltCon). */
typedef struct {
    Sint32 fltno;
    Sint32 bufno;
    Sint32 flnout;
} GfcdConCmd;

/* CD-block work area (gfcd_work). Each asynchronous request has a state word
 * (0: idle, otherwise the step it is at) and is advanced by gfcd_ExecServer. */
typedef struct {
    Uint8 buf_used[24];
    Uint8 flt_used[24];
    Sint32 locked;
    Sint32 trn_buf;             /* partition being transferred, -1 if none */
    Sint32 lockid;
    Sint32 timeout;             /* gfcd_ExecServer calls left before giving up */
    CdcStat stat;               /* +0x40 */
    void (*func)(void *);       /* +0x4C called on SCDQ */
    void *arg;
    Sint32 nfilt;               /* +0x54 */
    Sint32 filt_st;
    GfcdFiltCmd filt[24];       /* +0x5C */
    Sint32 ncon;                /* +0x1DC */
    Sint32 con_st;
    GfcdConCmd con[24];         /* +0x1E4 */
    Sint32 cdcon_st;            /* +0x304 */
    Sint32 cdcon_flt;
    Sint32 get_st;              /* +0x30C */
    Sint32 get_buf;
    Sint32 get_spos;
    Sint32 get_snum;
    Sint32 get_unk;
    Sint32 *get_nsct;
    Sint32 *get_nword;
    Sint32 trn_st;              /* +0x328 */
    Sint32 trn_bufno;
    Sint32 trn_spos;
    Sint32 trn_snum;
    Sint32 del_st;              /* +0x338 */
    Sint32 del_buf;
    Sint32 del_spos;
    Sint32 del_snum;
    Sint32 mov_st;              /* +0x348 */
    Sint32 mov_flt;
    Sint32 mov_dst;
    Sint32 mov_spos;
    Sint32 mov_snum;
    Sint32 mov_fmode;
    Sint32 dir_st;              /* +0x360 */
    Sint16 dir_fid;
    Sint16 dir_flt;
    Sint32 *dir_nfile;
} GfcdWork;

extern GfcdWork *gfcd_work;
extern Sint32 gfcd_err;
extern Sint32 gfcd_play;

Sint32 gfcd_AllocBuf(Sint32 *bufno);
Sint32 gfcd_AllocFilt(Sint32 *fltno);
Sint32 gfcd_FreeFilt(Sint32 fltno);
Sint32 gfcd_FreeBuf(Sint32 bufno);
Sint32 gfcd_Lock(void);
Sint32 gfcd_Unlock(Sint32 id);
Sint32 gfcd_IsLocked(Sint32 id);
Sint32 gfcd_SetFilt(Sint32 fltno, Sint32 fmode, CdcSubh *subh, Sint32 fad, Sint32 snum);
Sint32 gfcd_SetCdCon(Sint32 fltno, Sint32 id);
Sint32 gfcd_GetSctNum(Sint32 bufno, Sint32 spos, Sint32 snum, Sint32 *nsct, Sint32 *nword);
Sint32 gfcd_StartTrans(Sint32 bufno, Sint32 spos, Sint32 snum);
Sint32 gfcd_EndTrans(Sint32 *cdwnum);
Sint32 gfcd_DelSct(Sint32 bufno, Sint32 spos, Sint32 snum);
Sint32 gfcd_GetStat(CdcStat *stat);
Sint32 gfcd_Seek(CdcPos *pos, Sint32 id);
Sint32 gfcd_SetFiltCon(Sint32 fltno, Sint32 bufno, Sint32 flnout);
Sint32 gfcd_WaitServer(void);

#endif
