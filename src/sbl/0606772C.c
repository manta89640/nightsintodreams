#include "sbl/types.h"
#include "sbl/stm_api.h"

/*
 * STM (stream) API calls. None of them is called by the game.
 *
 * NONMATCHING: the C below is the same code as the target except for choices that
 * SHC 5.0 makes differently from the (probably older) compiler that built SBL 2.10.
 * The one-line notes name which ones remain, by these letters:
 *   r0     the first temporary after a call is r0/r1 in the target (SHC 5.0: r2/r3),
 *          e.g. `mov.l @r15,r0; tst r0,r0` for the NULL check
 *   slot   the target leaves a jsr delay slot empty (nop) where SHC 5.0 moves an
 *          argument spill (`mov.l r5,@(4,r15)`) or `mov r15,rn`/`add #n,rn` into it
 *   sched  the target loads pool constants and copies arguments earlier
 *   regs   the target keeps more locals and constants in r8-r14
 *   tail   the target leaves a dead epilogue after the final tail call
 * No SHC 5.0 option (-size/-speed/-macsave=0/-cpu/-debug/-noinline) changes these.
 */

extern void func_060693BA(Sint32 id);
extern Bool func_060693C2(Sint32 code);
extern Sint32 func_060693D8(void);
extern void func_0606942E(void);
extern void func_0606879C(Sint32 code);

extern void func_0606CE0C(StmCdc *cdc, Sint32 *fid, Sint32 *fad, Sint32 *a, Sint32 *fasnum,
                          Sint32 b, Sint32 c, Sint32 d);
extern void func_0606DEA0(Sint32 x, Sint32 *flag, Uint8 *key);
extern void func_0606E33A(Sint32 x, Sint32 filt, Sint32 y);
extern Sint32 func_0606E6DA(void);
extern void func_0606E202(Sint32 dst, Sint32 src, Sint32 a, Sint32 b);
extern void func_0606C462(StmTrn *trn, Sint32 x);
extern void func_0606AA54(StmCdc *cdc, Sint32 a, Sint32 b);
extern void func_0606AF62(StmTrn *trn, Sint32 a, Sint32 b);
extern Sint32 func_0606C318(StmTrn *trn, Sint32 n, Uint32 *size);
extern Sint32 func_0606D5A8(StmCdc *cdc, Sint32 a, Sint32 b);
extern Sint32 func_0606AA20(StmCdc *cdc, Sint32 i);
extern void func_0606C456(void *p);
extern void func_0606C45C(void *p);
extern void func_0606C450(void *p, Sint32 a);
extern void func_0606C3F6(void *p, Sint32 mode);
extern Sint32 func_0606A9A2(StmCdc *cdc, Sint32 n, Sint32 *info);
extern Sint32 func_06069E3C(Stm *stm);
extern void func_0606D1BA(Sint32 *fad, Sint32 x);
extern void *memcpy(void *dst, const void *src, Uint32 n);

extern StmMngr *stm_mngr;

#ifdef NONMATCHING
/* r0. */
Sint32 stm_get_num_stm(StmGrp *grp)
{
    Sint32 n = 0;
    Stm *stm;
    Sint32 err;

    func_060693BA(0x303);
    if (grp == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return STM_ERR_NULL;
    }
    for (stm = grp->head; stm != NULL; stm = stm->next) {
        n++;
    }
    err = func_060693D8();
    if (err < 0) {
        return err;
    }
    return n;
}
#endif

#ifdef NONMATCHING
/* r0; the target also sets the NULL return value in each bra delay slot. */
Stm *stm_get_stm(StmGrp *grp, Sint32 nst)
{
    Sint32 i;
    Stm *stm;
    Sint32 err;

    func_060693BA(0x304);
    if (grp == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return NULL;
    }
    if (nst < 0) {
        func_060693C2(STM_ERR_RANGE);
        func_0606942E();
        return NULL;
    }
    for (i = 0, stm = grp->head; i < nst && stm != NULL; i++) {
        stm = stm->next;
    }
    err = func_060693D8();
    if (err < 0) {
        return NULL;
    }
    return stm;
}
#endif

#ifdef NONMATCHING
/* sched, tail. */
void stm_set_link(Stm *stm, Stm *link, Sint32 cnt, void *func, void *obj)
{
    func_060693BA(0x305);
    if (stm == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return;
    }
    if (cnt < 0) {
        func_060693C2(STM_ERR_RANGE);
        func_0606942E();
        return;
    }
    if (link != NULL) {
        link = link->alt;
    }
    stm->link = link;
    stm->link_cnt = cnt;
    stm->link_func = func;
    stm->link_obj = obj;
    func_060693D8();
}
#endif

#ifdef NONMATCHING
/* regs (fid, s, key, 0 and -1 in r10-r14), so the frame layout differs too. */
/* Returns the stream's group and its file id, frame range, filter and key. */
StmGrp *stm_get_info(Stm *stm, Sint32 *fid, Sint32 *range, Sint32 *bn, StmKey *key)
{
    Sint32 flag;
    Sint32 unused;
    Uint8 buf[6];
    Stm *s;

    func_060693BA(0x311);
    if (stm == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return NULL;
    }
    s = stm->alt;
    func_0606CE0C(s->cdc, fid, range, &unused, range + 1, 0, 0, 0);
    if (*fid == 0x3FFFFFFF) {
        *fid = -1;
    }
    if (s->cdc->unk1C == 0) {
        *bn = s->cdc->filt;
        func_0606DEA0(s->cdc->unk28, &flag, buf);
        key->fn = buf[0];
        key->cn = buf[1];
        key->smmsk = buf[2];
        key->smval = buf[3];
        key->cimsk = buf[4];
        key->cival = buf[5];
    } else {
        flag = 0;
        *bn = -1;
    }
    /* flag says which key fields the filter really uses */
    if (!(flag & 1)) {
        key->fn = -1;
    }
    if (!(flag & 2)) {
        key->cn = -1;
    }
    if (!(flag & 4)) {
        key->smmsk = key->smval = -1;
    }
    if (!(flag & 8)) {
        key->cimsk = key->cival = -1;
    }
    func_060693D8();
    return s->grp;
}
#endif

#ifdef NONMATCHING
/* regs (s in r13, filt in r14), tail. */
/* Connect the stream's filter output to con's filter, or disconnect it (con NULL). */
void stm_connect_filt(Stm *stm, Stm *con)
{
    Stm *s;
    Sint32 filt;
    Sint32 err;

    func_060693BA(0x337);
    if (stm == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return;
    }
    s = stm->alt;
    if (con == NULL) {
        filt = 0xFF;
    } else {
        filt = con->alt->cdc->filt;
    }
    s->cdc->filt = filt;
    func_0606E33A(s->cdc->unk28, filt, -2);
    err = func_0606E6DA();
    if (err != 0) {
        func_0606879C(err);
        func_0606942E();
    }
}
#endif

#ifdef NONMATCHING
/* slot, r0. */
void stm_move_sct(Stm *stm, Sint32 spos, Sint32 snum, Stm *dst)
{
    Stm *d;
    Sint32 err;

    func_060693BA(0x338);
    if (stm == NULL || dst == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return;
    }
    if (spos < 0 || snum < 0) {
        func_060693C2(STM_ERR_RANGE);
        func_0606942E();
        return;
    }
    stm = stm->alt;
    d = dst->alt;
    func_0606E202(d->cdc->filt, stm->cdc->filt, spos, snum);
    d->flag &= ~0x20;
    err = func_0606E6DA();
    if (err != 0) {
        func_0606879C(err);
        func_0606942E();
    }
}
#endif

#ifdef NONMATCHING
/* sched, slot. */
void stm_delete_sct(Stm *stm, Sint32 spos, Sint32 snum)
{
    Stm *s;
    Sint32 err;

    func_060693BA(0x339);
    if (stm == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return;
    }
    if (spos < 0 || snum < 0) {
        func_060693C2(STM_ERR_RANGE);
        func_0606942E();
        return;
    }
    s = stm->alt;
    func_0606C462(s->trn, 0);
    s->trn->unkA0 = 0;
    if (s->cdc->unk1C == 0) {
        func_0606AA54(s->cdc, spos, snum);
        err = func_0606E6DA();
        if (err != 0) {
            func_0606879C(err);
            func_0606942E();
        }
    } else {
        func_0606AF62(s->trn, 0, 0);
        func_060693D8();
    }
}
#endif

#ifdef NONMATCHING
/* slot, r0. */
/* Size of the first nsct sectors, in 16-bit words. */
Sint32 stm_get_data_size(Stm *stm, Sint32 nsct)
{
    Uint32 size;
    Sint32 err;

    func_060693BA(0x312);
    if (stm == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return STM_ERR_NULL;
    }
    if (nsct < 0) {
        func_060693C2(STM_ERR_RANGE);
        func_0606942E();
        return STM_ERR_RANGE;
    }
    stm = stm->alt;
    func_0606C318(stm->trn, nsct, &size);
    err = func_060693D8();
    if (err < 0) {
        return err;
    }
    return size >> 1;
}
#endif

#ifdef NONMATCHING
/* regs; the target divides by 2 by calling func_060506E0 (__divlu), SHC 5.0 shifts. */
/* Number of sectors needed to hold nwords 16-bit words. */
Sint32 stm_get_num_sct(Stm *stm, Sint32 nwords)
{
    Sint32 size = 0;
    Sint32 i;
    Sint32 n;
    Sint32 num;
    Stm *s;
    Sint32 err;

    func_060693BA(0x313);
    if (stm == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return STM_ERR_NULL;
    }
    if (nwords < 0) {
        func_060693C2(STM_ERR_RANGE);
        func_0606942E();
        return STM_ERR_RANGE;
    }
    s = stm->alt;
    if (nwords == 0) {
        return 0;
    }
    if (s->cdc->unk1C != 0) {
        for (i = 1; ; i++) {
            n = func_0606C318(s->trn, i, (Uint32 *)&size);
            size = (Uint32)size / 2;
            if (size >= nwords) {
                break;
            }
            if (i > n) {
                i--;
                break;
            }
        }
    } else {
        num = func_0606D5A8(s->cdc, 0x7FFFFFFF, 0);
        for (i = 0; i < num; i++) {
            size += func_0606AA20(s->cdc, i);
            if (size >= nwords) {
                i++;
                break;
            }
        }
    }
    err = func_060693D8();
    if (err < 0) {
        return err;
    }
    return i;
}
#endif

#ifdef NONMATCHING
/* sched, r0. */
/* Make stm read through altr; fails if altr is unused or already another stream's alternative. */
Bool stm_set_alternative(Stm *stm, Stm *altr)
{
    Sint32 i;
    Stm *p;

    func_060693BA(0x314);
    if (stm == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return FALSE;
    }
    if (altr->used == 0) {
        return FALSE;
    }
    for (i = 0, p = stm_mngr->stm; i < stm_mngr->nstm; i++, p++) {
        if (p->used == 1 && p != altr && p->alt == altr) {
            return FALSE;
        }
    }
    stm->alt = altr;
    func_060693D8();
    return TRUE;
}
#endif

#ifdef NONMATCHING
/* sched. */
void stm_reset_alternative(Stm *stm)
{
    func_060693BA(0x315);
    if (stm == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return;
    }
    stm->alt = stm;
    func_060693D8();
}
#endif

#ifdef NONMATCHING
/* slot, r0. */
void stm_set_trn_mode(Stm *stm, Sint32 mode)
{
    Stm *s;

    func_060693BA(0x319);
    if (stm == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return;
    }
    s = stm->alt;
    if (mode == 0x300) {
        func_0606C456(s->trn->unk6C);
    } else {
        func_0606C45C(s->trn->unk6C);
    }
    func_060693D8();
}
#endif

#ifdef NONMATCHING
/* sched, slot, tail. */
void stm_set_trn_size(Stm *stm, Sint32 size)
{
    func_060693BA(0x320);
    if (stm == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return;
    }
    if (size < 0) {
        func_060693C2(STM_ERR_RANGE);
        func_0606942E();
        return;
    }
    stm = stm->alt;
    func_0606C450(stm->trn->unk6C, size);
    func_060693D8();
}
#endif

#ifdef NONMATCHING
/* r0; SHC 5.0 also merges the two error exits, the target does not. */
void stm_set_trn_type(Stm *stm, Sint32 type)
{
    func_060693BA(0x322);
    if (stm == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return;
    }
    if (type != 0 && type != 1 && type != 2 && type != 3) {
        func_060693C2(STM_ERR_MODE);
        func_0606942E();
        return;
    }
    stm = stm->alt;
    func_0606C3F6(stm->trn->unk6C, type);
    func_060693D8();
}
#endif

#ifdef NONMATCHING
/* sched, r0. */
/* Info of the stream's n-th sector; a memory stream reports a dummy entry. */
Sint32 stm_get_sct_info(Stm *stm, Sint32 n, Sint32 *info)
{
    Stm *s;
    Sint32 ret;

    func_060693BA(0x325);
    if (stm == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return 0;
    }
    if (n < 0) {
        func_060693C2(STM_ERR_RANGE);
        func_0606942E();
        return 0;
    }
    s = stm->alt;
    if (s->cdc->unk1C == 0) {
        ret = func_0606A9A2(s->cdc, n, info);
    } else if (n < func_06069E3C(s)) {
        info[0] = 0x7FFFFFFF;
        info[1] = 0;
        info[2] = 0;
        ((Uint8 *)info)[12] = 0;
        ((Uint8 *)info)[13] = 0;
        ret = 1;
    } else {
        ret = 0;
    }
    func_060693D8();
    return ret;
}
#endif

#ifdef NONMATCHING
/* r0. */
Sint32 stm_get_loop_cnt(StmGrp *grp)
{
    Sint32 err;

    func_060693BA(0x333);
    if (grp == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return STM_ERR_NULL;
    }
    err = func_060693D8();
    if (err < 0) {
        return err;
    }
    return grp->loop_cnt;
}
#endif

#ifdef NONMATCHING
/* slot. */
/* Current FAD of the group (refreshed if it is the one being served); returns grp->unk18. */
Sint32 stm_get_exec_stat(StmGrp *grp, Sint32 *fad)
{
    Sint32 cur;
    Uint16 flag;
    Sint32 err;

    func_060693BA(0x334);
    if (grp == NULL) {
        func_060693C2(STM_ERR_NULL);
        func_0606942E();
        return STM_ERR_NULL;
    }
    if (stm_mngr->exec_grp == grp) {
        flag = grp->flag;
        if (((flag & 2) ? 1 : 0) == 1 && ((flag & 4) ? 1 : 0) == 1) {
            func_0606D1BA(&cur, 0);
            if (cur >= 0) {
                grp->fad = cur;
            }
        }
    }
    *fad = grp->fad;
    err = func_060693D8();
    if (err < 0) {
        return err;
    }
    return grp->unk18;
}
#endif

#ifdef NONMATCHING
/* sched (the stm_mngr pool load comes before `mov #0,r2`). */
void STM_SetErrFunc(StmErrFunc func, void *obj)
{
    stm_mngr->err.code = 0;
    stm_mngr->err.func = func;
    stm_mngr->err.obj = obj;
}
#endif

#ifdef NONMATCHING
/* sched. */
void STM_GetErrStat(StmErrStat *stat)
{
    memcpy(stat, &stm_mngr->err, sizeof(StmErrStat));
}
#endif
