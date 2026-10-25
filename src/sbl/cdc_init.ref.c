#include "sbl/types.h"
#include "sbl/cdc_cmd.h"

/* NONMATCHING: the original loads toc for the last call before the pool load
 * and puts the and in the delay slot; SHC 5 does it the other way round. */
Sint32 CDC_TgetToc(Uint32 *toc)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;
    CdcCmd *p;
    CdcRsp *q;
    Sint32 nword;

    p = &cmd;
    CDC_CMD_CLR1(p);
    p->b[0] = 0x02;
    q = &rsp;
    ret = cdc_ExecCmdRsp(0, p, q);
    if (ret != 0) {
        return ret;
    }
    nword = CDC_U24(q->l[0]);
    return cdc_get_data_words(nword, toc);
}

Sint32 CDC_GetSes(Sint32 sesno, Uint32 *ses)
{
    CdcCmd cmd;
    CdcRsp rsp;
    Sint32 ret;
    CdcCmd *p;
    CdcRsp *q;

    p = &cmd;
    CDC_CMD_CLR2(p);
    p->b[0] = 0x03;
    p->b[1] = sesno;
    q = &rsp;
    ret = cdc_ExecCmdRsp(0, p, q);
    *ses = q->l[1];
    return ret;
}

/* NONMATCHING: two pool loads use r2 where the original uses r3. */
Sint32 CDC_CdInit(Sint32 iflag, Sint32 stnby, Sint32 ecc, Sint32 retry)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;
    Sint32 ret;

    CDC_CMD_CLR(p);
    p->b[0] = 0x04;
    p->b[1] = iflag;
    p->w[1] = stnby;
    p->b[6] = ecc;
    p->b[7] = retry;
    if ((iflag & 0x81) == 1) {
        /* soft reset */
        cdc_Wait(10500);
        cdc_add_hirq_stat(0x41);
        ret = cdc_ExecCmd(CDC_HIRQ_ESEL, p);
        if (ret == 0) {
            cdc_init_hirq();
        }
    } else {
        ret = cdc_ExecCmd(0, p);
    }
    return ret;
}

Sint32 CDC_CdOpen(void)
{
    CdcCmd cmd;
    CdcCmd *p = &cmd;

    CDC_CMD_CLR1(p);
    p->b[0] = 0x05;
    return cdc_ExecCmd(0, p);
}
