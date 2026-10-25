#include <machine.h>
#include "sbl/types.h"
#include "sbl/cdc_cmd.h"

CdcStat cdc_last_stat;

Sint32 cdc_ExecCmdRsp(Sint32 hirq, CdcCmd *cmd, CdcRsp *rsp)
{
    return cdc_ExecCmdSub(hirq, cmd, rsp, 0);
}

/* NONMATCHING: the original sets up r6 before the bsr and r7 in its delay slot. */
Sint32 cdc_ExecCmd(Sint32 hirq, CdcCmd *cmd)
{
    CdcRsp rsp;

    return cdc_ExecCmdSub(hirq, cmd, &rsp, 1);
}

/* Issues a command and records the status it returns: the whole response when
 * full is set, otherwise only the status byte.
 * NONMATCHING: the original swaps r13/r14 (rsp/ret), keeps one epilogue (bra to
 * it on error) and loads &cdc_last_stat before the test. */
Sint32 cdc_ExecCmdSub(Sint32 hirq, CdcCmd *cmd, CdcRsp *rsp, Sint32 full)
{
    Sint32 ret;
    Sint32 imask;

    ret = cdc_exec_cmd(hirq, cmd, rsp);
    if (ret != 0) {
        return ret;
    }
    imask = get_imask();
    set_imask(15);
    if (full) {
        cdc_RspToStat(rsp, &cdc_last_stat);
    } else {
        cdc_last_stat.status = rsp->b[0];
    }
    set_imask(imask);
    return ret;
}

/* NONMATCHING: only the literal pool layout differs (follows cdc_ExecCmdSub). */
Sint32 cdc_GetLastStat(CdcStat *stat)
{
    Sint32 imask;

    imask = get_imask();
    set_imask(15);
    *stat = cdc_last_stat;
    set_imask(imask);
    return 0;
}

/* NONMATCHING: SHC 5 loads the FAD mask at the top, the original just before
 * its use. */
void cdc_RspToStat(CdcRsp *rsp, CdcStat *stat)
{
    stat->status = rsp->b[0];
    stat->report.flgrep = rsp->b[1];
    stat->report.ctladr = rsp->b[2];
    stat->report.trkno = rsp->b[3];
    stat->report.idxno = rsp->b[4];
    stat->report.fad = CDC_U24(rsp->l[1]);
}

/* NONMATCHING: the original leaves the delay slot of the first bra empty. */
void cdc_Wait(volatile Sint32 count)
{
    while (count > 0) {
        count--;
    }
}
