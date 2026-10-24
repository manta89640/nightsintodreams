#include "sbl/types.h"
#include "sbl/cdc_cmd.h"

Sint32 CDC_SetSctLen(Sint32 getslen, Sint32 putslen)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->b[0] = 0x60;
    p->b[1] = getslen;
    p->b[2] = putslen;
    return cdc_ExecCmd(CDC_HIRQ_ESEL, p);
}

Sint32 CDC_GetSctData(Sint32 bufno, Sint32 spos, Sint32 snum)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->b[0] = 0x61;
    p->w[1] = spos;
    p->b[4] = bufno;
    p->w[3] = snum;
    return cdc_ExecCmd(CDC_HIRQ_EHST, p);
}

Sint32 CDC_DelSctData(Sint32 bufno, Sint32 spos, Sint32 snum)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->b[0] = 0x62;
    p->w[1] = spos;
    p->b[4] = bufno;
    p->w[3] = snum;
    return cdc_ExecCmd(CDC_HIRQ_EHST, p);
}

Sint32 CDC_GetdelSctData(Sint32 bufno, Sint32 spos, Sint32 snum)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->b[0] = 0x63;
    p->w[1] = spos;
    p->b[4] = bufno;
    p->w[3] = snum;
    return cdc_ExecCmd(CDC_HIRQ_EHST, p);
}

Sint32 CDC_PutSctData(Sint32 filtno, Sint32 snum)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->b[0] = 0x64;
    p->b[4] = filtno;
    p->w[3] = snum;
    return cdc_ExecCmd(CDC_HIRQ_EHST, p);
}

Sint32 CDC_CopySctData(Sint32 srcbn, Sint32 spos, Sint32 snum, Sint32 dstfln)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->b[0] = 0x65;
    p->b[1] = dstfln;
    p->w[1] = spos;
    p->b[4] = srcbn;
    p->w[3] = snum;
    return cdc_ExecCmd(CDC_HIRQ_ECPY, p);
}

Sint32 CDC_MoveSctData(Sint32 srcbn, Sint32 spos, Sint32 snum, Sint32 dstfln)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->b[0] = 0x66;
    p->b[1] = dstfln;
    p->w[1] = spos;
    p->b[4] = srcbn;
    p->w[3] = snum;
    return cdc_ExecCmd(CDC_HIRQ_ECPY, p);
}

Sint32 CDC_GetCopyErr(Sint32 *cpyerr)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;
    CdcCmd *p;
    CdcRsp *q;

    p = &cmd;
    CDC_CMD_CLR1(p);
    p->b[0] = 0x67;
    q = &rsp;
    ret = cdc_ExecCmdRsp(0, p, q);
    *cpyerr = q->b[1];
    return ret;
}
