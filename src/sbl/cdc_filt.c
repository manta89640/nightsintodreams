#include "sbl/types.h"
#include "sbl/cdc_cmd.h"

Sint32 CDC_SetFiltRange(Sint32 filtno, Sint32 fad, Sint32 fasnum)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->l[0] = fad;
    p->b[0] = 0x40;
    p->l[1] = fasnum;
    p->b[4] = filtno;
    return cdc_ExecCmd(CDC_HIRQ_ESEL, p);
}

Sint32 CDC_GetFiltRange(Sint32 filtno, Sint32 *fad, Sint32 *fasnum)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;
    CdcCmd *p;
    CdcRsp *q;

    p = &cmd;
    CDC_CMD_CLR1(p);
    p->b[0] = 0x41;
    p->b[4] = filtno;
    q = &rsp;
    ret = cdc_ExecCmdRsp(0, p, q);
    *fad = CDC_U24(q->l[0]);
    *fasnum = CDC_U24(q->l[1]);
    return ret;
}

Sint32 CDC_SetFiltSubh(Sint32 filtno, CdcSubh *subh)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->b[0] = 0x42;
    p->b[1] = subh->cn;
    p->b[2] = subh->smmsk;
    p->b[3] = subh->cimsk;
    p->b[4] = filtno;
    p->b[5] = subh->fn;
    p->b[6] = subh->smval;
    p->b[7] = subh->cival;
    return cdc_ExecCmd(CDC_HIRQ_ESEL, p);
}

Sint32 CDC_GetFiltSubh(Sint32 filtno, CdcSubh *subh)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;
    CdcCmd *p;
    CdcRsp *q;

    p = &cmd;
    CDC_CMD_CLR1(p);
    p->b[0] = 0x43;
    p->b[4] = filtno;
    q = &rsp;
    ret = cdc_ExecCmdRsp(0, p, q);
    subh->cn = q->b[1];
    subh->smmsk = q->b[2];
    subh->cimsk = q->b[3];
    subh->fn = q->b[5];
    subh->smval = q->b[6];
    subh->cival = q->b[7];
    return ret;
}

Sint32 CDC_SetFiltMode(Sint32 filtno, Sint32 fmode)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->b[0] = 0x44;
    p->b[1] = fmode;
    p->b[4] = filtno;
    return cdc_ExecCmd(CDC_HIRQ_ESEL, p);
}

Sint32 CDC_GetFiltMode(Sint32 filtno, Sint32 *fmode)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;
    CdcCmd *p;
    CdcRsp *q;

    p = &cmd;
    CDC_CMD_CLR2(p);
    p->b[0] = 0x45;
    p->b[4] = filtno;
    q = &rsp;
    ret = cdc_ExecCmdRsp(0, p, q);
    *fmode = q->b[1];
    return ret;
}

Sint32 CDC_SetFiltCon(Sint32 filtno, Sint32 cflag, Sint32 bufno, Sint32 flnout)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->b[0] = 0x46;
    p->b[1] = cflag;
    p->b[2] = bufno;
    p->b[3] = flnout;
    p->b[4] = filtno;
    return cdc_ExecCmd(CDC_HIRQ_ESEL, p);
}

Sint32 CDC_GetFiltCon(Sint32 filtno, Sint32 *bufno, Sint32 *flnout)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;
    CdcCmd *p;
    CdcRsp *q;

    p = &cmd;
    CDC_CMD_CLR1(p);
    p->b[0] = 0x47;
    p->b[4] = filtno;
    q = &rsp;
    ret = cdc_ExecCmdRsp(0, p, q);
    *bufno = q->b[2];
    *flnout = q->b[3];
    return ret;
}

Sint32 CDC_ResetSelector(Sint32 rflag, Sint32 bufno)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->b[0] = 0x48;
    p->b[1] = rflag;
    p->b[4] = bufno;
    return cdc_ExecCmd(CDC_HIRQ_ESEL, p);
}
