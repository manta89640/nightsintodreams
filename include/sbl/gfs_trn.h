#ifndef SBL_GFS_TRN_H
#define SBL_GFS_TRN_H

#include "sbl/types.h"

/* GFS internals used by the gfs_acc, gfs_trn and gfs_flow objects. Field names
 * follow what the code does with them; layouts are from the offsets the code uses. */

/* CD directory record (as in the CDC library's CdcFile). */
typedef struct {
    Sint32 fad;
    Sint32 size;
    Uint8 unit;
    Uint8 gap;
    Uint8 fn;
    Uint8 atr;
} GfsDirRec;

typedef struct {
    Sint32 fid;
    GfsDirRec rec;
    Sint32 sctsz;               /* bytes per sector for this file */
    Sint32 nsct;                /* file size in 2048-byte sectors */
    Sint32 lstrm;               /* unused bytes in the last sector */
} GfsFinfo;

/* Where the data comes from; `type` selects the access functions. */
typedef struct {
    Sint32 type;
    Sint32 w04[6];
    Sint32 w1c;
    Sint32 w20[2];
    Sint32 sfad;                /* start FAD of the current read */
    Sint32 efad;                /* end FAD of the current read */
} GfsDtsrc;

typedef struct {
    GfsFinfo finfo;
    GfsDtsrc dtsrc;
    Sint32 gmode;
    Sint32 stat;
    Sint32 sct;                 /* sectors requested */
    Sint32 sctcnt;              /* sectors read so far */
    Sint32 sctmax;
} GfsFlow;

/* A block of sectors or bytes, as handed between the data source and the
 * destination buffer. */
typedef struct {
    Uint8 *data;
    Sint32 adlt;                /* address step, in words, for the transfer */
    Sint32 len;                 /* bytes */
    Sint32 nsct;
    Bool used;
} GfsDataPack;

typedef Sint32 (*GfsTrnFunc)(void *obj, Sint32 nsct);

typedef struct {
    Uint8 *buf;
    Sint32 size;                /* buffer size, in units */
    Uint32 wp;                  /* write offset into buf, in bytes */
    GfsDataPack *dps;           /* source pack */
    GfsDataPack *dpd;           /* destination pack */
    Sint32 tsize;               /* sectors per read */
    Sint32 nsct;                /* sectors to transfer */
    Sint32 sctcnt;              /* sectors transferred */
    Sint32 asize;               /* bytes of dps already transferred */
    void *aobj;
    GfsTrnFunc tfunc;
    Sint32 unit;
    Bool active;
    Sint32 stat;
    Sint32 mode;
} GfsTrans;

typedef struct {
    Bool used;
    Sint32 amode;
    Sint32 astat;
    GfsFlow flow;
    GfsTrans trans;
} GfsFile;

/* The library work area that D_06070C78 points to. */
typedef struct {
    Uint8 pad000[0xAC];
    Sint32 rdsfad;              /* 0xAC: FAD range the CD is reading into its buffer */
    Sint32 rdefad;              /* 0xB0 */
    Uint8 pad0B4[0xC4 - 0xB4];
    Uint32 flags;               /* 0xC4: bit 0 set once the CD was set up */
    Sint32 tmcnt;               /* 0xC8: timeout counter */
    Uint8 cd[0x44C - 0xCC];     /* 0xCC */
    GfsDataPack dpd;            /* 0x44C: the one destination pack */
} GfsWork;

extern GfsWork *D_06070C78;

/* Data-source access functions: one row of four per source type. Each column
 * is its own symbol in the target, so each is declared as a 16-byte-stride array. */
typedef struct {
    Sint32 (*fn)();
    void *pad[3];
} GfsAccSlot;

typedef struct {
    GfsDataPack *(*fn)();
    void *pad[3];
} GfsAccPackSlot;

typedef struct {
    void (*fn)();
    void *pad[3];
} GfsAccVoidSlot;

extern GfsAccSlot D_06071114[];
extern GfsAccPackSlot D_06071118[];
extern GfsAccSlot D_0607111C[];
extern GfsAccVoidSlot D_06071120[];

/* Transfer functions: one row (prepare, transfer, wait) per transfer mode. */
typedef struct {
    Sint32 (*fn)();
    void *pad[2];
} GfsTrnSlot;

extern GfsTrnSlot D_06071144[];
extern GfsTrnSlot D_06071148[];
extern GfsTrnSlot D_0607114C[];

#define GFS_TMODE_SCU   0
#define GFS_TMODE_SDMA0 1
#define GFS_TMODE_SDMA1 2
#define GFS_TMODE_CPU   3
#define GFS_TMODE_STM   4

#endif
