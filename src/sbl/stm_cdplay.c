/* Stream library: CD play helpers (one object in the original link).
 * `p = &ply` before a call makes SHC 5 compute the address before the other
 * arguments, which is the order the original compiler used. */
#include "sbl/types.h"
#include "sbl/stm_cd.h"

/* NONMATCHING: SHC 5 moves `mov r15,r4` into the jsr delay slot; the original
   compiler never schedules an SP copy there and leaves a nop. The #else version
   is the same size, so the functions after it keep their alignment. */
#ifdef NONMATCHING
Sint32 stm_GetCurFad(void)
{
    CdcStat stat;
    Sint32 ret;

    do {
        ret = func_0606F1E0(&stat);
    } while (ret != 0);
    return CDC_STAT_FAD(&stat);
}
#else
Sint32 stm_GetCurFad(void)
{
    CdcStat stat;
    Sint32 ret;
    Sint32 fad;

    do {
        ret = func_0606F1E0(&stat);
        fad = CDC_STAT_FAD(&stat);
    } while (ret != 0);
    return fad;
}
#endif

void stm_GetFadRange(void *fh, Sint32 *sfad, Sint32 *efad)
{
    Sint32 nsct;
    Sint32 atr;
    void *null = NULL;          /* the original keeps the 0 in r14 */

    func_0606CE0C(fh, null, sfad, null, &nsct, null, null, &atr);
    if ((atr & 6) == 0) {
        *efad = *sfad + nsct - 1;
    } else {
        *sfad = 0x7FFFFFFF;
        *efad = 0x7FFFFFFF;
    }
}

/* NONMATCHING: the original reuses the register holding CDC_PTYPE_FAD for the `+ 1`
   (add r4,r2); SHC 5 emits add #1. Same size. */
Sint32 stm_CdPlayObj(StmObj *obj)
{
    Sint32 ret = 0;
    Sint32 efad;
    Sint32 sfad;
    CdcPly ply;
    Sint32 fad;
    CdcPly *p;

    fad = obj->fad;
    stm_GetFadRange(obj->file->fh, &sfad, &efad);
    if (efad >= fad) {
        CDC_PLY_STYPE(&ply) = CDC_PTYPE_FAD;
        CDC_PLY_SFAD(&ply) = fad;
        CDC_PLY_ETYPE(&ply) = CDC_PTYPE_FAD;
        CDC_PLY_EFAS(&ply) = efad - fad + 1;
        CDC_PLY_PMODE(&ply) = 0;
        p = &ply;
        ret = func_0606DF32(p, obj->filt);
        if (ret == -13) {
            ret = -23;
        } else if (ret != 0) {
            ret = -1;
        } else {
            D_06070C6C->play_sfad = fad;
            D_06070C6C->play_efad = efad;
        }
    }
    return ret;
}

Sint32 stm_CdPause(StmObj *obj)
{
    CdcPos pos;
    Sint32 ret;
    CdcPos *p;

    CDC_POS_PTYPE(&pos) = CDC_PTYPE_NOCHG;
    p = &pos;
    ret = func_0606E19A(p, obj->filt);
    if (ret == -13) {
        return -23;
    } else if (ret != 0) {
        return -1;
    }
    D_06070C6C->play_sfad = -1;
    D_06070C6C->play_efad = -1;
    return ret;
}
