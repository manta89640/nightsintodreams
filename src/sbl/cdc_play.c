#include "sbl/types.h"
#include "sbl/cdc.h"

void cdc_pos_to_cmd(CdcPos *pos, Uint8 *p);

/* NONMATCHING: keeps the shared 0 in a callee-saved register and reuses it as the first argument; SHC 5.0 rematerializes it */
Sint32 CDC_CdPlay(CdcPly *ply)
{
    Uint8 cmd[8];

    ((Uint32 *)cmd)[0] = 0;
    ((Uint32 *)cmd)[1] = 0;
    cmd[0] = 0x10;
    cdc_pos_to_cmd(&ply->start, &cmd[1]);
    cmd[4] = ply->pmode;
    cdc_pos_to_cmd(&ply->end, &cmd[5]);
    return func_0606FCDC(0, cmd);
}

/* Encodes a position as the three parameter bytes of a play/seek command. */
/* NONMATCHING: the shared 0 lands in r1 (SHC 5.0: r2) and the FAD byte loads are scheduled differently */
void cdc_pos_to_cmd(CdcPos *pos, Uint8 *p)
{
    switch (pos->ptype) {
    case CDC_PTYPE_TNO:
        p[0] = 0;
        p[1] = pos->pbody.trkidx.tno;
        p[2] = pos->pbody.trkidx.idx;
        return;
    case CDC_PTYPE_FAD:
        p[0] = ((Uint8 *)&pos->pbody.fad)[1] | 0x80;
        p[1] = ((Uint8 *)&pos->pbody.fad)[2];
        p[2] = ((Uint8 *)&pos->pbody.fad)[3];
        return;
    case CDC_PTYPE_NOCHG:
        p[0] = 0xFF;
        p[1] = 0xFF;
        p[2] = 0xFF;
        return;
    case CDC_PTYPE_DFL:
    default:
        p[0] = 0;
        p[1] = 0;
        p[2] = 0;
        return;
    }
}

/* NONMATCHING: keeps the shared 0 in a callee-saved register and reuses it as the first argument; SHC 5.0 rematerializes it */
Sint32 CDC_CdSeek(CdcPos *pos)
{
    Uint8 cmd[8];

    ((Uint32 *)cmd)[0] = 0;
    ((Uint32 *)cmd)[1] = 0;
    cmd[0] = 0x11;
    cdc_pos_to_cmd(pos, &cmd[1]);
    return func_0606FCDC(0, cmd);
}

/* NONMATCHING: keeps the shared 0 in a callee-saved register and reuses it as the first argument; SHC 5.0 rematerializes it */
Sint32 CDC_CdScan(Sint32 scnmode)
{
    Uint8 cmd[8];

    ((Uint32 *)cmd)[0] = 0;
    ((Uint32 *)cmd)[1] = 0;
    cmd[0] = 0x12;
    cmd[1] = scnmode;
    return func_0606FCDC(0, cmd);
}
