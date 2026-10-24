/* Start of the CDC command object; it continues in sbl/0606F348. */
/* This module was built by an older SHC than the 5.0 in compile/: it keeps one
 * code path per return, prefers r0 for temporaries and keeps local addresses
 * in callee-saved registers. The C below is complete; functions that SHC 5.0
 * cannot reproduce are under NONMATCHING with what still differs. */

#include <machine.h>
#include "sbl/types.h"
#include "sbl/gfcd.h"

Sint32 cdc_GetPeriRsp(CdcRsp *rsp);

#ifdef NONMATCHING /* the original keeps local addresses and constants in callee-saved registers */
Sint32 CDC_GetCurStat(CdcStat *stat)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;

    CDC_CMD_CLR(cmd);
    cmd.b[0] = 0x00;
    ret = cdc_ExecCmdSub(0, &cmd, &rsp, 1);
    cdc_RspToStat(&rsp, stat);
    return ret;
}
#endif

#ifdef NONMATCHING /* same instructions, only pool and branch displacements differ */
Sint32 CDC_GetLastStat(CdcStat *stat)
{
    return cdc_GetLastStat(stat);
}
#endif

#ifdef NONMATCHING /* SHC 5.0 merges the duplicate return paths, the original keeps one per return; the original keeps local addresses and constants in callee-saved registers */
Sint32 CDC_GetPeriStat(CdcStat *stat)
{
    CdcRsp rsp;
    Sint32 ret;

    ret = cdc_GetPeriRsp(&rsp);
    if (ret != 0) {
        return ret;
    }
    cdc_RspToStat(&rsp, stat);
    /* a rejected command, or a response that is not the periodic one */
    if (stat->status == 0xFF || (stat->status & 0x20) == 0) {
        ret = -8;
    }
    return ret;
}
#endif

#ifdef NONMATCHING /* register allocation and scheduling differ (the original prefers r0 temporaries) */
/* Reads CR1-CR4 twice with interrupts masked until both reads agree. */
Sint32 cdc_GetPeriRsp(CdcRsp *rsp)
{
    CdcRsp tmp;
    Sint32 i;
    Sint32 ret;
    Sint32 imask;

    ret = -3;
    for (i = 0; i < 100; i++) {
        imask = get_imask();
        set_imask(15);
        func_060683B2(rsp);
        func_060683B2(&tmp);
        set_imask(imask);
        if (rsp->l[0] == tmp.l[0] && rsp->l[1] == tmp.l[1]) {
            ret = 0;
            break;
        }
    }
    return ret;
}
#endif

#ifdef NONMATCHING /* the original keeps local addresses and constants in callee-saved registers */
Sint32 CDC_GetHwInfo(CdcHw *hw)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;

    CDC_CMD_CLR(cmd);
    cmd.b[0] = 0x01;
    ret = cdc_ExecCmdRsp(0, &cmd, &rsp);
    hw->hflag = rsp.b[2];
    hw->ver = rsp.b[3];
    hw->mpver = rsp.b[5];
    hw->drv = rsp.b[6];
    hw->rev = rsp.b[7];
    return ret;
}
#endif
