#include "sbl/types.h"
#include "sbl/cdc.h"
#include "sbl/machine.h"

extern Sint32 func_0606F478(Sint32 x);    /* waits for data ready */
extern Sint32 func_0606F4C2(Sint32 *n);   /* ends the transfer, returns its size */

/* HIRQ bits seen since they were last consumed (CDC_ClrHirqReq clears the
 * register, so the pending bits are kept here). */
Uint16 cdc_hirq_stat;

/* NONMATCHING: pool offset only (the pool sits inside cdc_exec_cmd_body) */
Uint32 *CDC_GetDataPtr(void)
{
    return CDC_DATATRNS;
}

/* NONMATCHING: pool offset only (the pool sits inside cdc_exec_cmd_body) */
Uint16 CDC_GetHirqReq(void)
{
    return CDC_HIRQREQ;
}

void cdc_set_hirq_req(Uint16 bitpat);

/* NONMATCHING: target puts 1 in r0 and ORs it in the bra delay slot; SHC 5.0 spills bitpat to the stack */
void CDC_ClrHirqReq(Uint16 bitpat)
{
    cdc_hirq_stat |= CDC_HIRQREQ;
    cdc_set_hirq_req(bitpat | CDC_HIRQ_CMOK);
}

/* NONMATCHING: pool offset only (the pool sits inside cdc_exec_cmd_body) */
void cdc_set_hirq_req(Uint16 bitpat)
{
    CDC_HIRQREQ = bitpat;
}

/* NONMATCHING: pool offset only (the pool sits inside cdc_exec_cmd_body) */
void cdc_init_hirq(void)
{
    cdc_set_hirq_req(0x0BE1);
    cdc_hirq_stat = 0x0BE1;
}

/* NONMATCHING: pool offset only (the pool sits inside cdc_exec_cmd_body) */
void cdc_add_hirq_stat(Uint16 bitpat)
{
    cdc_hirq_stat |= bitpat;
}

/* NONMATCHING: pool offset only (the pool sits inside cdc_exec_cmd_body) */
Uint16 cdc_get_hirq_msk(void)
{
    return CDC_HIRQMSK;
}

/* NONMATCHING: pool offset only (the pool sits inside cdc_exec_cmd_body) */
void cdc_set_hirq_msk(Uint16 bitpat)
{
    CDC_HIRQMSK = bitpat;
}

/* NONMATCHING: pool offset only (the pool sits inside cdc_exec_cmd_body) */
void *cdc_get_25810028_ptr(void)
{
    return (void *)0x25810028;
}

/* Reads n words of a response (e.g. the TOC) from the data port. */
/* NONMATCHING: target duplicates the early-return epilogue and rotates the copy loop (counter copy, i >= n precheck) */
Sint32 cdc_get_data_words(Sint32 n, Uint16 *buf)
{
    Sint32 ret;
    Sint32 i;
    Sint32 got;

    ret = func_0606F478(0);
    if (ret != 0) {
        return ret;
    }
    for (i = 0; i < n; i++) {
        buf[i] = CDC_DATA;
    }
    ret = func_0606F4C2(&got);
    if (ret == 0 && got != n) {
        ret = CDC_ERR_TRNS;
    }
    return ret;
}

Sint32 cdc_exec_cmd_body(Uint32 hirq, CdcCmdReg *cmd, CdcCmdReg *resp);

/* Issues a command with interrupts masked; hirq are the HIRQ bits that must
 * be set before it may be issued (they are consumed on success). */
Sint32 cdc_exec_cmd(Uint32 hirq, CdcCmdReg *cmd, CdcCmdReg *resp)
{
    Sint32 imask;
    Sint32 ret;

    imask = get_imask();
    set_imask(15);
    ret = cdc_exec_cmd_body(hirq, cmd, resp);
    set_imask(imask);
    return ret;
}

Sint32 cdc_wait_hirq(Uint32 hirq, Uint32 *stat);
void cdc_write_cr(CdcCmdReg *cmd);
void cdc_read_cr(CdcCmdReg *resp);

/* NONMATCHING: target keeps CMOK (1) in callee-saved r13 across the calls and the status in r4, not on the stack */
Sint32 cdc_exec_cmd_body(Uint32 hirq, CdcCmdReg *cmd, CdcCmdReg *resp)
{
    Uint32 stat;
    Sint32 ret;
    Uint32 st;

    cdc_hirq_stat |= CDC_HIRQREQ;
    stat = cdc_hirq_stat;
    if ((stat & hirq) != hirq) {
        return CDC_ERR_CMDBUSY;
    }
    if (!(stat & CDC_HIRQ_CMOK)) {
        return CDC_ERR_CMDNG;
    }
    cdc_set_hirq_req(~(hirq | CDC_HIRQ_CMOK));
    cdc_hirq_stat &= 0xFFFE;
    cdc_write_cr(cmd);
    ret = cdc_wait_hirq(CDC_HIRQ_CMOK, &stat);
    if (ret != 0) {
        return ret;
    }
    cdc_read_cr(resp);
    st = *(Uint8 *)resp;
    if (st == 0xFF) {
        ret = CDC_ERR_REJECT;
    } else if (st & 0x80) {
        ret = CDC_ERR_WAIT;
    }
    if (ret == 0) {
        cdc_hirq_stat &= ~hirq;
    }
    return ret;
}

/* NONMATCHING: target hoists &HIRQREQ into callee-saved r11 (SHC 5.0: r1) and the limit into r1 (SHC 5.0: r0) */
Sint32 cdc_wait_hirq(Uint32 hirq, Uint32 *stat)
{
    Sint32 i;
    Sint32 ret;
    Uint32 req;

    ret = CDC_ERR_TMOUT;
    for (i = 0; i < 0x240000; i++) {
        req = CDC_HIRQREQ;
        if (hirq & req) {
            ret = 0;
            *stat = req;
            break;
        }
    }
    return ret;
}

/* NONMATCHING: CR address loads are scheduled differently, and the pool offset */
void cdc_write_cr(CdcCmdReg *cmd)
{
    CDC_CR1 = cmd->cr[0];
    CDC_CR2 = cmd->cr[1];
    CDC_CR3 = cmd->cr[2];
    CDC_CR4 = cmd->cr[3];
}

/* NONMATCHING: CR address loads are scheduled differently, and the pool offset */
void cdc_read_cr(CdcCmdReg *resp)
{
    resp->cr[0] = CDC_CR1;
    resp->cr[1] = CDC_CR2;
    resp->cr[2] = CDC_CR3;
    resp->cr[3] = CDC_CR4;
}
