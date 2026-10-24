#include "sbl/types.h"
#include "sbl/int.h"

/* User handlers, called by the entry stubs that are installed in their place. */
void (*int_scu_func_tbl[INT_SCU_FUNC_NUM])(void);
/* One register-saving entry stub per vector (hand-written asm in the game area). */
extern void (* const int_scu_entry_tbl[INT_SCU_FUNC_NUM])(void);

#ifdef NONMATCHING
/* The target loads all three pool constants first and reads int_scu_entry_tbl[num]
   with `add r1,r5; mov.l @r5,r5`; SHC 5.0 loads them late and uses @(r0,r1). */
void INT_SetScuFunc(Sint32 num, void (*hdr)(void))
{
    int_scu_func_tbl[num] = hdr;
    SYS_SETUINT(num, int_scu_entry_tbl[num]);
}
#endif

#ifdef NONMATCHING
/* The target loads the pool constant before `mov r4,r0`. */
void (*INT_GetScuFunc(Sint32 num))(void)
{
    return int_scu_func_tbl[num];
}
#endif
