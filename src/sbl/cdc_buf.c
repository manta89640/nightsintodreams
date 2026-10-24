#include "sbl/types.h"
#include "sbl/cdc_cmd.h"

static Sint32 cdc_ExecAfterEsel(CdcCmd *cmd, CdcRsp *rsp);

Sint32 CDC_GetBufSiz(Sint32 *totalsiz, Sint32 *bufnum, Sint32 *freesiz)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;
    CdcCmd *p;
    CdcRsp *q;

    p = &cmd;
    CDC_CMD_CLR1(p);
    p->b[0] = 0x50;
    q = &rsp;
    ret = cdc_ExecCmdRsp(0, p, q);
    *freesiz = q->w[1];
    *bufnum = q->b[4];
    *totalsiz = q->w[3];
    return ret;
}

Sint32 CDC_GetSctNum(Sint32 bufno, Sint32 *snum)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;
    CdcCmd *p;
    CdcRsp *q;

    p = &cmd;
    CDC_CMD_CLR2(p);
    p->b[0] = 0x51;
    p->b[4] = bufno;
    q = &rsp;
    ret = cdc_ExecCmdRsp(0, p, q);
    *snum = q->w[3];
    return ret;
}

Sint32 CDC_CalActSiz(Sint32 bufno, Sint32 spos, Sint32 snum)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->b[0] = 0x52;
    p->w[1] = spos;
    p->b[4] = bufno;
    p->w[3] = snum;
    return cdc_ExecCmd(CDC_HIRQ_ESEL, p);
}

Sint32 CDC_GetActSiz(Sint32 *actwnum)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;
    CdcCmd *p;
    CdcRsp *q;

    p = &cmd;
    CDC_CMD_CLR(p);
    p->b[0] = 0x53;
    q = &rsp;
    ret = cdc_ExecAfterEsel(p, q);
    *actwnum = CDC_U24(q->l[0]);
    return ret;
}

/*
 * Commands whose result is only valid once the selector has been set (ESEL).
 * NONMATCHING: the original leaves the delay slot of the first call empty, and
 * SHC 5 moves the spill of rsp into it. The dummy argument only takes the slot
 * (mov #0,r4 instead of nop) so that the function keeps its size and the rest
 * of the file still lines up with the literal pool.
 */
static Sint32 cdc_ExecAfterEsel(CdcCmd *cmd, CdcRsp *rsp)
{
    Uint32 hirq;
    Sint32 ret;

    hirq = ((Uint32 (*)(Sint32))func_060681CE)(0);
    if ((hirq & CDC_HIRQ_ESEL) == 0) {
        return -1;
    }
    ret = cdc_ExecCmdRsp(0, cmd, rsp);
    return ret;
}

Sint32 CDC_GetSctInfo(Sint32 bufno, Sint32 spos, CdcSct *sct)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;
    CdcCmd *p;
    CdcRsp *q;

    p = &cmd;
    CDC_CMD_CLR1(p);
    p->b[0] = 0x54;
    p->w[1] = spos;
    p->b[4] = bufno;
    q = &rsp;
    ret = cdc_ExecCmdRsp(0, p, q);
    sct->fad = CDC_U24(q->l[0]);
    sct->fn = q->b[4];
    sct->cn = q->b[5];
    sct->sm = q->b[6];
    sct->ci = q->b[7];
    return ret;
}

Sint32 CDC_ExeFadSearch(Sint32 bufno, Sint32 spos, Sint32 fad)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->b[0] = 0x55;
    p->w[1] = spos;
    p->l[1] = fad;
    p->b[4] = bufno;
    return cdc_ExecCmd(CDC_HIRQ_ESEL, p);
}

Sint32 CDC_GetFadSearch(Sint32 *bufno, Sint32 *spos, Sint32 *fad)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;
    CdcCmd *p;
    CdcRsp *q;

    p = &cmd;
    CDC_CMD_CLR(p);
    p->b[0] = 0x56;
    q = &rsp;
    ret = cdc_ExecAfterEsel(p, q);
    *spos = q->w[1];
    *bufno = q->b[4];
    *fad = CDC_U24(q->l[1]);
    return ret;
}
