#include "sbl/types.h"
#include "sbl/cdc_cmd.h"

/* NONMATCHING: the original leaves both call delay slots empty (nop); SHC 5
 * fills them with the argument setup. */
Sint32 CDC_DataReady(Sint32 dtype)
{
    Sint32 hstat;
    Sint32 cdwnum;
    Sint32 ret;
    Sint32 hirq;

    hirq = CDC_HIRQ_DRDY;
    if (dtype == 1) {
        hirq = CDC_HIRQ_EHST | CDC_HIRQ_DRDY;
    }
    ret = func_06068368(hirq, &hstat);
    if (dtype == 1 && ret == 0 && (hstat & CDC_HIRQ_EHST)) {
        ret = -4;
    }
    if (ret != 0) {
        CDC_DataEnd(&cdwnum);
    }
    func_060681E8(~CDC_HIRQ_DRDY);
    return ret;
}

Sint32 CDC_DataEnd(Sint32 *cdwnum)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;
    CdcCmd *p;
    CdcRsp *q;

    p = &cmd;
    CDC_CMD_CLR1(p);
    p->b[0] = 0x06;
    q = &rsp;
    ret = cdc_ExecCmdRsp(0, p, q);
    *cdwnum = CDC_U24(q->l[0]);
    func_060681E8(~CDC_HIRQ_DRDY);
    return ret;
}
