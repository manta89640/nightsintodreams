#ifndef SBL_CDC_CMD_H
#define SBL_CDC_CMD_H

#include "sbl/types.h"

/* A CD block command or response: the four 16-bit registers CR1-CR4. */
typedef union {
    Uint8  b[8];
    Uint16 w[4];
    Sint32 l[2];
} CdcCmd;

typedef CdcCmd CdcRsp;

/* Clears a command. */
#define CDC_CMD_CLR(p) ((p)->l[0] = 0, (p)->l[1] = 0)

/*
 * The same with one or two dead stores to l[1], which SHC drops. They only give
 * the zero more uses, so that SHC 5 keeps it in a callee-saved register shared
 * with a zero HIRQ argument and ranks it against the other register candidates
 * the way the original object does.
 */
#define CDC_CMD_CLR1(p) ((p)->l[0] = 0, (p)->l[1] = 0, (p)->l[1] = 0)
#define CDC_CMD_CLR2(p) ((p)->l[0] = 0, (p)->l[1] = 0, (p)->l[1] = 0, (p)->l[1] = 0)

/* 24-bit fields (FAD, word counts) share their register pair with a byte. */
#define CDC_U24(x) ((x) & 0x00FFFFFF)

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
    Sint32 fad;
    Uint8  fn;
    Uint8  cn;
    Uint8  sm;
    Uint8  ci;
} CdcSct;

/* HIRQ bits */
#define CDC_HIRQ_DRDY 0x0002
#define CDC_HIRQ_ESEL 0x0040
#define CDC_HIRQ_EHST 0x0080
#define CDC_HIRQ_ECPY 0x0100
#define CDC_HIRQ_EFLS 0x0200

/* cdc_exec */
Sint32 cdc_ExecCmdRsp(Sint32 hirq, CdcCmd *cmd, CdcRsp *rsp);
Sint32 cdc_ExecCmd(Sint32 hirq, CdcCmd *cmd);
Sint32 cdc_ExecCmdSub(Sint32 hirq, CdcCmd *cmd, CdcRsp *rsp, Sint32 full);
Sint32 cdc_GetLastStat(CdcStat *stat);
void cdc_RspToStat(CdcRsp *rsp, CdcStat *stat);
void cdc_Wait(volatile Sint32 count);
extern CdcStat cdc_last_stat;

Sint32 CDC_DataEnd(Sint32 *cdwnum);

/* Low-level CD block access (other units). */
Uint32 func_060681CE(void);          /* reads HIRQ */
void func_060681E8(Sint32 hirq);     /* writes HIRQ (clears bits written as 0) */
void func_060681EE(void);
void func_06068200(Sint32 bits);
Sint32 func_0606821E(Sint32 nword, void *buf);
Sint32 func_06068276(Sint32 hirq, CdcCmd *cmd, CdcRsp *rsp);
Sint32 func_06068368(Sint32 hirq, Sint32 *stat);

#endif
