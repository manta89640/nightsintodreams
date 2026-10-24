#ifndef SBL_INT_H
#define SBL_INT_H

#include "sbl/types.h"

#define INT_SCU_FUNC_NUM 256

/* BIOS: set an interrupt vector's handler. */
#define SYS_SETUINT(num, hdr) ((**(void (**)(Uint32, void *))0x06000300)((num), (void *)(hdr)))

void INT_SetScuFunc(Sint32 num, void (*hdr)(void));
void (*INT_GetScuFunc(Sint32 num))(void);

#endif
