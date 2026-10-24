#ifndef SBL_STM_SVR_H
#define SBL_STM_SVR_H

#include "sbl/types.h"

/* Layouts as far as the stream server (sbl/stm_svr) uses them. */

/* Execution status returned by the server. */
#define STM_EXEC_COMPLETED  0x100
#define STM_EXEC_DOING      0x101
#define STM_EXEC_PAUSE      0x102
#define STM_EXEC_WAIT       0x103
#define STM_EXEC_TSKEND     0x104

#define STM_FAD_START       150         /* first FAD of the disc */
#define STM_INFINITE        0x7FFFFFFF

/* The file's GFS handle. */
typedef struct {
    Sint32 unk00;
    Sint32 unk04;
    Sint32 unk08;
    Uint8  pad0C[0x6C - 0x0C];
    Sint32 tr;                          /* 0x6C: transfer state, passed by address */
    Uint8  pad70[0x78 - 0x70];
    Sint32 unk78;
    Uint8  pad7C[0x9C - 0x7C];
    Sint32 unk9C;
    Sint32 unkA0;
} StmGfs;

/* What a stream reads: a file or a FAD range. */
typedef struct {
    Uint8  pad00[0x1C];
    Sint32 unk1C;                       /* 0x1C: nonzero for a FAD range */
    Sint32 fid;                         /* 0x20 */
    Uint8  pad24[0x28 - 0x24];
    Sint32 unk28;
} StmKey;

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
    Uint8  pad1C[0x28 - 0x1C];
    Sint32 unk28;                       /* 0x28: sector limit or STM_INFINITE */
    Uint8  flags;                       /* 0x2C */
};

struct StmGrp {
    Stm    *head;                       /* 0x00 */
    Stm    *head2;                      /* 0x04 */
    Stm    *loop;                       /* 0x08: loop start stream */
    Stm    *unk0C;
    Stm    *cur;                        /* 0x10: stream being read */
    Sint32 fad;                         /* 0x14: pickup position */
    Sint32 stat;                        /* 0x18: STM_EXEC_* */
    Stm    *unk1C;
    Sint32 unk20;
    void   (*func)(void *obj);          /* 0x24 */
    void   *obj;                        /* 0x28 */
    Sint32 lpmax;                       /* 0x2C */
    Sint32 lpcnt;                       /* 0x30 */
    Sint32 unk34;                       /* 0x34: negative when unset */
    Uint16 flags;                       /* 0x38 */
};

typedef struct {
    Uint8  pad00[0x10];
    StmGrp *curgrp;                     /* 0x10 */
    Uint8  pad14[0x18 - 0x14];
    Sint32 unk18;
    Sint32 unk1C;
    Sint32 stat;                        /* 0x20 */
    Uint8  pad24[0x2C - 0x24];
    Sint32 busy;                        /* 0x2C */
} StmMng;

/* A deferred server request, run by STM_ExecServer until it returns TRUE. */
typedef struct {
    Sint32 (*func)(void *obj);
    void   *obj;
} StmReq;

#endif
