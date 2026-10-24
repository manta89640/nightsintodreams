#ifndef SBL_GFS_H
#define SBL_GFS_H

#include "sbl/types.h"

/* File system library (sega_gfs.h). Layouts are the ones the code at
   0x0606AB44-0x0606C318 uses. */

#define GFS_ERR_OK        0
#define GFS_ERR_CDRD      (-1)
#define GFS_ERR_CDNODISC  (-2)
#define GFS_ERR_CDROM     (-3)
#define GFS_ERR_DIRTBL    (-4)
#define GFS_ERR_OPENMAX   (-5)
#define GFS_ERR_DIR       (-6)
#define GFS_ERR_CDBFS     (-7)
#define GFS_ERR_NONAME    (-8)
#define GFS_ERR_NEXIST    (-9)
#define GFS_ERR_FID       (-10)
#define GFS_ERR_HNDL      (-11)
#define GFS_ERR_SEEK      (-12)
#define GFS_ERR_ORG       (-13)
#define GFS_ERR_NUM       (-14)
#define GFS_ERR_OFS       (-15)
#define GFS_ERR_FBUSY     (-16)
#define GFS_ERR_PARA      (-17)
#define GFS_ERR_BUSY      (-18)
#define GFS_ERR_NOHNDL    (-19)
#define GFS_ERR_PUINUSE   (-20)
#define GFS_ERR_ALIGN     (-21)
#define GFS_ERR_TMOUT     (-22)
#define GFS_ERR_CDOPEN    (-23)
#define GFS_ERR_BFUL      (-24)
#define GFS_ERR_FATAL     (-25)

#define GFS_OPEN_MAX      24
#define GFS_DIR_ID        0
#define GFS_DIR_NAME      1
#define GFS_SEEK_SET      0
#define GFS_SEEK_CUR      1
#define GFS_SEEK_END      2
#define GFS_FTYPE_CD      0
#define GFS_TMODE_STM     4
#define GFS_ATR_DIR       0x80
#define GFS_ATR_CDDA      0x40
#define GFS_ATR_END_TBL   0x01
#define GFS_SCT_SIZE      2048

/* ISO9660 directory record as kept by the CD library. */
typedef struct {
    Uint32 fad;
    Uint32 size;
    Uint8  unit;
    Uint8  gap;
    Uint8  fn;
    Uint8  atr;
} CdcFile;

typedef struct {
    Sint32 type;                /* GFS_DIR_ID or GFS_DIR_NAME */
    Sint32 ndir;
    void  *dir;
} GfsDirTbl;

typedef struct {
    GfsDirTbl dirtbl;
    Sint32    nfile;
} GfsDirMng;

typedef struct {
    Sint32  fid;
    CdcFile finfo;
    Sint32  sctsz;
    Sint32  nsct;
    Sint32  lstrm;              /* unused bytes of the last sector */
} GfsFinfo;

typedef struct {
    Sint32 ftype;               /* GFS_FTYPE_* */
    Sint32 src[11];
} GfsDtsrc;

typedef struct {
    GfsFinfo finfo;
    GfsDtsrc dtsrc;
    Sint32   gmode;
    Sint32   stat;
    Sint32   sct;
    Sint32   sctcnt;
    Sint32   sctmax;
} GfsFlow;

typedef struct {
    void  *data;
    Sint32 adlt;
    Sint32 len;
    Sint32 nsct;
    Bool   use;
} GfsDataPack;

typedef struct {
    void        *buf;
    Sint32       size;
    Sint32       wp;            /* bytes transferred */
    GfsDataPack *dps;
    GfsDataPack *dpd;
    Sint32       tsctmax;
    Sint32       tsct;
    Sint32       tsctcnt;
    Sint32       tbytcnt;
    void        *obj;
    void        *tfunc;
    Sint32       unit;
    Sint32       active;
    Sint32       stat;
    Sint32       mode;          /* GFS_TMODE_* */
} GfsTrans;

typedef struct {
    Sint32  used;
    Sint32  amode;              /* 0 idle, 1 NwFread, 2 NwCdRead */
    Sint32  astat;
    GfsFlow flow;
    GfsTrans trn;
} GfsFile;

typedef GfsFile *GfsHn;

typedef struct {
    Sint32 (*flowin)(GfsFlow *flow);
    void   (*stopin)(GfsFlow *flow, Bool flag);
    Sint32 (*seek)(GfsFlow *flow, Sint32 ofs);
    Sint32 (*tell)(GfsFlow *flow);
} GfsFileFunc;

typedef struct {
    GfsHn  access_file[GFS_OPEN_MAX];
    Sint32 nfile;
} GfsSvr;

typedef void (*GfsErrFunc)(void *obj, Sint32 ec);

typedef struct {
    GfsErrFunc func;
    void      *obj;
    Sint32     code;
} GfsErrStat;

typedef struct {
    Sint32      openmax;
    GfsFileFunc functbl[3];
    GfsSvr      svr;
    GfsDirMng   curdir;
    GfsHn       pickup;
    Sint32      sfad;
    Sint32      efad;
    GfsHn       trans;
    GfsErrStat  error;
    Uint32      flags;          /* bit 0: disc is a CD-ROM */
    Sint32      timer;
    Uint8       cdb[0x36C];     /* CD block state, used by the CD layer */
    GfsDataPack srcpk;
    GfsDataPack dstpk;
    Uint8       sect_buf[GFS_SCT_SIZE];
    GfsFile     file[1];
} GfsMng;

/* SBL reaches into these structures through accessor macros; SHC does not fold
   `&a->b` into the member offsets that follow, so the C has to keep them. */
#define GFS_FILE_FLOW(gfs)  (&(gfs)->flow)
#define GFS_FILE_TRN(gfs)   (&(gfs)->trn)
#define GFS_FLW_DTSRC(flow) (&(flow)->dtsrc)

#define CDC_FILE_FAD(f)     ((f)->fad)
#define CDC_FILE_SIZE(f)    ((f)->size)
#define CDC_FILE_UNIT(f)    ((f)->unit)
#define CDC_FILE_GAP(f)     ((f)->gap)
#define CDC_FILE_FN(f)      ((f)->fn)
#define CDC_FILE_ATR(f)     ((f)->atr)

/* System BIOS work area: CD session information. */
#define GFS_BIOS_SESMODE    (*(volatile Uint8 *)0x06000CCC)
#define GFS_BIOS_SESFAD     (*(volatile Uint8 *)0x06000CCD)
#define GFS_BIOS_SESFID     (*(volatile Uint16 *)0x06000CCE)
#define GFS_IS_MULTISES()   (GFS_BIOS_SESMODE == 1)

/* SYS_CHGSCUIM (vector at SYS_SETSCUIM in saturn.inc). */
#define GFS_CHGSCUIM(and_, or_) \
    ((**(void (**)(Uint32, Uint32))0x06000344)((and_), (or_)))

extern GfsMng *D_06070C78;
extern Sint32 D_06070C80;
extern Sint32 D_06070C90;
extern Sint32 D_06070C94;
extern Sint32 D_06070C98;
extern Sint8  D_0607110C[];

/* Outside this unit (CD layer, directory reader, C library). */
Sint32 func_0606CC64(Bool nodir);
Sint32 func_060704F6(void);
Sint32 func_060703F4(GfsHn gfs, GfsDirTbl *dirtbl, Sint32 nsct);
Sint32 func_0607045A(void *dir, Sint8 *fname, Sint32 ndir);
void  *func_060704BC(Sint32 fid, void *dir);
void  *func_060704AE(Sint32 fid, void *dir);
Uint32 func_060704CC(Sint32 fid, void *dir);
Uint32 func_060704DE(Sint32 fid, void *dir);
Sint32 func_060704F2(void);
void  *func_06050850(void *dst, void *src, Sint32 n);
Sint32 func_060509F0(void *a, void *b, Sint32 n);
Sint32 func_0606CC50(GfsHn gfs, Sint32 (*func)(void *obj), void *obj);
void   func_0606CC44(GfsTrans *trn, void *buf, Sint32 size, Sint32 unit);
void   func_0606C218(GfsHn gfs);
Sint32 func_0606C336(GfsHn gfs);
void   func_0606C406(GfsTrans *trn, Sint32 nsct);
void   func_0606C456(GfsTrans *trn);
Sint32 func_0606D074(void);
Sint32 func_0606C5DC(GfsHn gfs, Sint32 *stat);
Sint32 func_0606C3F6(GfsTrans *trn, Sint32 tmode);
Sint32 func_0606C450(GfsTrans *trn, Sint32 tsize);
void   func_0606D8D4(GfsDataPack *dps, GfsDtsrc *dtsrc);
Sint32 func_0606D0D8(GfsFlow *flow, Sint32 pos);
void   func_0606DA14(Bool flag);
Sint32 func_0606CE76(GfsFlow *flow);
void   func_0606CFDC(GfsFlow *flow, Bool flag);
Sint32 D_0606D0D2(GfsFlow *flow, Sint32 ofs);
Sint32 func_0606D0C6(GfsFlow *flow);
void   func_0606C462(GfsHn gfs, Sint32 n);
void   func_0606C3C0(GfsTrans *trn);
Sint32 func_0606CCEE(GfsFlow *flow, CdcFile *dirrec, Sint32 fid);
Sint32 func_0606DD5E(void);
Sint32 func_0606CBC6(GfsTrans *trn);
Sint32 func_0606C56E(GfsHn gfs);
Sint32 func_0606C4FC(GfsHn gfs, Sint32 *stat);
void   func_0606CDD6(GfsFlow *flow, Sint32 nsct);
void   func_0606D590(GfsDtsrc *dtsrc);

#endif
