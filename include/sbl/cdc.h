#ifndef SBL_CDC_H
#define SBL_CDC_H

#include "sbl/types.h"

/* CD block registers. */
#define CDC_HIRQREQ  (*(volatile Uint16 *)0x25890008)
#define CDC_HIRQMSK  (*(volatile Uint16 *)0x2589000C)
#define CDC_CR1      (*(volatile Uint16 *)0x25890018)
#define CDC_CR2      (*(volatile Uint16 *)0x2589001C)
#define CDC_CR3      (*(volatile Uint16 *)0x25890020)
#define CDC_CR4      (*(volatile Uint16 *)0x25890024)
#define CDC_DATA     (*(volatile Uint16 *)0x25898000)
#define CDC_DATATRNS ((Uint32 *)0x25818000)

/* HIRQ bits */
#define CDC_HIRQ_CMOK 0x0001

/* Position types (CdcPos.ptype) */
#define CDC_PTYPE_DFL   0
#define CDC_PTYPE_FAD   1
#define CDC_PTYPE_TNO   2
#define CDC_PTYPE_NOCHG 3

/* Error codes */
#define CDC_ERR_OK       0
#define CDC_ERR_CMDBUSY  (-1)
#define CDC_ERR_CMDNG    (-2)
#define CDC_ERR_TMOUT    (-3)
#define CDC_ERR_REJECT   (-5)
#define CDC_ERR_WAIT     (-6)
#define CDC_ERR_TRNS     (-7)

typedef struct {
    Sint32 ptype;
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
    Uint8 pmode;
} CdcPly;

/* The four command/response registers CR1-CR4. */
typedef struct {
    Uint16 cr[4];
} CdcCmdReg;

/* Issues a command and reads back the status (in another unit). */
extern Sint32 cdc_ExecCmd(Sint32 hirq, Uint8 *cmd);

#endif
