#include "sbl/types.h"
#include "sbl/cdc_cmd.h"

Sint32 CDC_CdSetCon(Sint32 filtno)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->b[0] = 0x30;
    p->b[4] = filtno;
    return cdc_ExecCmd(CDC_HIRQ_ESEL, p);
}

Sint32 CDC_CdGetCon(Sint32 *filtno)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;
    CdcCmd *p;
    CdcRsp *q;

    p = &cmd;
    CDC_CMD_CLR1(p);
    p->b[0] = 0x31;
    q = &rsp;
    ret = cdc_ExecCmdRsp(0, p, q);
    *filtno = q->b[4];
    return ret;
}

Sint32 CDC_CdGetLastBuf(Sint32 *bufno)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;
    CdcCmd *p;
    CdcRsp *q;

    p = &cmd;
    CDC_CMD_CLR1(p);
    p->b[0] = 0x32;
    q = &rsp;
    ret = cdc_ExecCmdRsp(0, p, q);
    *bufno = q->b[4];
    return ret;
}
