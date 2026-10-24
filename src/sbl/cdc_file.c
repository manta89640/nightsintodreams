#include "sbl/types.h"
#include "sbl/cdc_cmd.h"

Sint32 CDC_ChgDir(Sint32 filtno, Sint32 fid)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->b[0] = 0x70;
    p->l[1] = fid;
    p->b[4] = filtno;
    return cdc_ExecCmd(CDC_HIRQ_EFLS, p);
}

Sint32 CDC_ReadDir(Sint32 filtno, Sint32 fid)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->b[0] = 0x71;
    p->l[1] = fid;
    p->b[4] = filtno;
    return cdc_ExecCmd(CDC_HIRQ_EFLS, p);
}

Sint32 CDC_GetFileScope(Sint32 *fid, Sint32 *infnum, Bool *drend)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;
    CdcCmd *p;
    CdcRsp *q;

    p = &cmd;
    CDC_CMD_CLR1(p);
    p->b[0] = 0x72;
    q = &rsp;
    ret = cdc_ExecCmdRsp(0, p, q);
    *infnum = q->w[1];
    *drend = q->b[4];
    *fid = CDC_U24(q->l[1]);
    return ret;
}

/* NONMATCHING: same last-call scheduling difference as CDC_TgetToc. */
Sint32 CDC_TgetFileInfo(Sint32 fid, void *file)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;
    CdcCmd *p;
    CdcRsp *q;
    Sint32 nword;

    p = &cmd;
    CDC_CMD_CLR1(p);
    p->b[0] = 0x73;
    p->l[1] = fid;
    p->b[4] = 0;
    q = &rsp;
    ret = cdc_ExecCmdRsp(0, p, q);
    if (ret != 0) {
        return ret;
    }
    nword = CDC_U24(q->l[0]);
    return cdc_get_data_words(nword, file);
}

Sint32 CDC_ReadFile(Sint32 filtno, Sint32 fid, Sint32 offset)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->l[0] = offset;
    p->b[0] = 0x74;
    p->l[1] = fid;
    p->b[4] = filtno;
    return cdc_ExecCmd(CDC_HIRQ_EFLS, p);
}

Sint32 CDC_AbortFile(void)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR(p);
    p->b[0] = 0x75;
    cdc_add_hirq_stat(CDC_HIRQ_EFLS);
    return cdc_ExecCmd(CDC_HIRQ_EFLS, p);
}
