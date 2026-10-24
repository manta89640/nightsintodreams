#ifndef SBL_STM_H
#define SBL_STM_H

#include "sbl/types.h"

/* Layouts as far as sbl/06067644, sbl/060676D4 and sbl/0606772C use them. */

/* SBL DMA_Cpu parameter blocks (field order from func_060684BC/func_06068504). */
typedef struct {
    Uint32 pr;
    Uint32 dme;
    Uint32 msk;
} DmaCpuComPrm;

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
} DmaCpuPrm;

typedef struct {
    Uint32 ae;
    Uint32 nmif;
} DmaCpuComStatus;

/* Subheader key; -1 (STM_KEY_NONE) where a field is not used. */
typedef struct {
    Sint16 fn;
    Sint16 cn;
    Sint16 smmsk;
    Sint16 smval;
    Sint16 cimsk;
    Sint16 cival;
} StmKey;

typedef void (*StmErrFunc)(void *obj, Sint32 code);

typedef struct {
    Sint32 code;
    Sint32 func_id;     /* id of the STM call that was running, set on entry */
    StmErrFunc func;
    void *obj;
} StmErrStat;

/* A stream's CD block side. */
typedef struct {
    Uint8 unk00[28];
    Sint32 unk1C;       /* nonzero: stream is read from memory, not from a filter */
    Sint32 filt;        /* filter number; 0xFF = not connected */
    Uint8 unk24[4];
    Sint32 unk28;
} StmCdc;

/* A stream's transfer side. */
typedef struct {
    Uint8 unk00[108];
    Uint8 unk6C[52];
    Sint32 unkA0;
} StmTrn;

typedef struct Stm {
    struct StmGrp *grp;
    struct Stm *alt;    /* stream actually used by the calls below (itself by default) */
    struct Stm *next;   /* next stream of the group */
    Uint8 unk0C[4];
    StmTrn *trn;
    StmCdc *cdc;
    Uint8 unk18[4];
    struct Stm *link;
    Sint32 link_cnt;
    void *link_func;
    void *link_obj;
    Uint8 flag;
    Uint8 used;
    Uint8 unk2E[2];
} Stm;

typedef struct StmGrp {
    Stm *head;
    Uint8 unk04[16];
    Sint32 fad;
    Sint32 unk18;
    Uint8 unk1C[20];
    Sint32 loop_cnt;
    Uint8 unk34[4];
    Uint16 flag;
} StmGrp;

typedef struct {
    Uint8 unk00[8];
    Stm *stm;           /* stream table */
    Sint32 nstm;
    StmGrp *exec_grp;
    Uint8 unk14[8];
    StmErrStat err;
} StmMngr;

/* Error codes passed to func_060693C2 (descriptive names). */
#define STM_ERR_NULL    (-11)
#define STM_ERR_RANGE   (-14)
#define STM_ERR_MODE    (-17)

#endif
