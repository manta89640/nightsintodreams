#include "sbl/types.h"

#define CSH_CCR (*(volatile Uint8 *)0xFFFFFE92)
#define CSH_ADDR_ARRAY 0x60000000
#define CSH_PURGE_AREA 0x40000000

/* Clears all four ways of the address array (and so invalidates the cache)
 * and sets the way mode. */
/* NONMATCHING: target keeps the way in r6 and the stored 0 in r2 (SHC 5.0: r0 and r1) */
void CSH_Init(Uint16 sw)
{
    Uint32 way;
    Sint32 i;
    volatile Uint32 *p;

    CSH_CCR &= ~0x01;
    for (way = 0; way < 0x100; way += 0x40) {
        CSH_CCR = (CSH_CCR & 0x3F) | way;
        p = (volatile Uint32 *)CSH_ADDR_ARRAY;
        for (i = 0; i < 64; i++) {
            *p = 0;
            p += 4;
        }
    }
    CSH_CCR = (CSH_CCR & ~0x08) | sw;
    CSH_CCR &= ~0x02;
    CSH_CCR &= ~0x04;
    CSH_CCR = (CSH_CCR & ~0x01) | 0x01;
}

/* NONMATCHING: target keeps the way in r5 and the stored 0 in r1, allocated differently by SHC 5.0 */
void CSH_AllClr(void)
{
    Uint32 way;
    Sint32 i;
    volatile Uint32 *p;

    CSH_CCR &= ~0x01;
    for (way = 0; way < 0x100; way += 0x40) {
        CSH_CCR = (CSH_CCR & 0x3F) | way;
        p = (volatile Uint32 *)CSH_ADDR_ARRAY;
        for (i = 0; i < 64; i++) {
            *p = 0;
            p += 4;
        }
    }
    CSH_CCR = (CSH_CCR & ~0x01) | 0x01;
}

/* NONMATCHING: target rotates the loop (compares before the store, end - 16 kept in the size register) */
void CSH_Purge(void *adrs, Uint32 P_size)
{
    Uint32 p;
    Uint32 end;

    p = ((Uint32)adrs & 0x1FFFFFFF) | CSH_PURGE_AREA;
    end = p + P_size;
    p &= ~0x0F;
    do {
        *(volatile Uint32 *)p = 0;
        p += 16;
    } while (p < end);
}
