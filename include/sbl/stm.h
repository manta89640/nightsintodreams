#ifndef SBL_STM_H
#define SBL_STM_H

#include "sbl/types.h"

/* Stream system (STM) work area, as far as sbl/stm_grp uses it. */

#define STM_FAD_START   150             /* first FAD of the disc */
#define STM_INFINITE    0x7FFFFFFF

/* STM error codes */
#define STM_ERR_CDRD    (-1)
#define STM_ERR_CDOPEN  (-2)
#define STM_ERR_HANDLE  (-11)
#define STM_ERR_RANGE   (-14)
#define STM_ERR_RMODE   (-17)
#define STM_ERR_NOHNDL  (-19)
#define STM_ERR_FATAL   (-22)
#define STM_ERR_CDNODISC (-23)
#define STM_ERR_TMOUT   (-25)

/* GFS file handle (opaque here; owned by the GFS library). */
typedef struct {
    Sint32 unk00;
    Sint32 unk04;
    Sint32 unk08;
    Uint8  pad0C[0x6C - 0x0C];
    Sint32 tr;                          /* 0x6C */
    Uint8  pad70[0xA0 - 0x70];
    Sint32 unkA0;                       /* 0xA0 */
} StmGfs;

/* The part of a GFS handle at +0x0C that a stream keeps a pointer to. */
typedef struct {
    Sint32 unk00;
    Sint32 unk04;
    Uint8  pad08[0x14 - 0x08];
    Sint32 unk14;
    Sint32 unk18;
    Sint32 unk1C;                       /* nonzero: not read from the CD block */
    Sint32 unk20;
    Uint8  pad24[0x28 - 0x24];
    Sint32 unk28;
} StmKey;

/* Selection key given to STM_OpenFid etc.: -1 means "don't care". */
typedef struct {
    Sint16 fn;
    Sint16 cn;
    Sint16 smmsk;
    Sint16 smval;
    Sint16 cimsk;
    Sint16 cival;
} StmSelKey;

typedef struct {
    Uint8 fn;
    Uint8 cn;
    Uint8 smmsk;
    Uint8 smval;
    Uint8 cimsk;
    Uint8 cival;
} StmSubh;

/* Directory record of a file (GFS_GetDirInfo) */
typedef struct {
    Sint32 fad;
    Sint32 size;
    Uint8  unit;
    Uint8  gap;
    Uint8  fn;
    Uint8  atr;
} StmFinfo;

typedef struct {
    Sint32 fad;
    Sint32 nsct;
} StmFrange;

typedef struct StmGrp StmGrp;
typedef struct Stm Stm;

struct Stm {
    StmGrp *grp;                        /* 0x00 */
    Stm    *stm;                        /* 0x04: the stream a handle stands for */
    Stm    *next;                       /* 0x08: next in grp->head */
    Stm    *next2;                      /* 0x0C: next in grp->head2 */
    StmGfs *gfs;                        /* 0x10 */
    StmKey *key;                        /* 0x14 */
    Sint32 unk18;
    Sint32 unk1C;
    Uint8  pad20[0x28 - 0x20];
    Sint32 unk28;                       /* 0x28 */
    Uint8  flags;                       /* 0x2C */
    Uint8  used;                        /* 0x2D */
};

struct StmGrp {
    Stm    *head;                       /* 0x00: streams sorted by start FAD */
    Stm    *head2;                      /* 0x04: streams read from the CD block */
    Stm    *loop;                       /* 0x08 */
    Stm    *unk0C;                      /* 0x0C */
    Stm    *cur;                        /* 0x10 */
    Sint32 fad;                         /* 0x14 */
    Sint32 stat;                        /* 0x18 */
    Sint32 unk1C;
    Sint32 unk20;
    void   (*func)(void *obj);          /* 0x24 */
    void   *obj;                        /* 0x28 */
    Sint32 lpmax;                       /* 0x2C */
    Sint32 lpcnt;                       /* 0x30 */
    Sint32 unk34;                       /* 0x34: negative when unset */
    Uint16 flags;                       /* 0x38 */
    Uint8  used;                        /* 0x3A */
};

typedef struct {
    Sint32 code;
    Sint32 fid;                         /* ID of the function that raised it */
    void   (*func)(void *obj, Sint32 code);
    void   *obj;
} StmErrStat;

typedef struct {
    StmGrp *grp;                        /* 0x00 */
    Sint32 ngrp;
    Stm    *stm;                        /* 0x08 */
    Sint32 nstm;
    StmGrp *curgrp;                     /* 0x10 */
    Sint32 unk14;
    Sint32 unk18;
    StmErrStat err;                     /* 0x1C */
    Sint32 busy;                        /* 0x2C */
} StmMng;

#endif
