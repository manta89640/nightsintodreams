#include "sbl/types.h"
#include "sbl/gfs_trn.h"

/* Calls into the access functions of the file's data source. */

Sint32 gfsAcc_CountSct(GfsFile *gfs, Sint32 max, Sint32 flag)
{
    GfsFlow *flow = &gfs->flow;
    Sint32 type = flow->dtsrc.type;

    return D_06071114[type].fn(flow, max, flag);
}

Sint32 gfsAcc_CountSctAll(GfsFile *gfs)
{
    GfsFlow *flow = &gfs->flow;
    Sint32 type = flow->dtsrc.type;

    return D_06071114[type].fn(flow, 0xFFFF, 0);
}

GfsDataPack *gfsAcc_GetPack(GfsFile *gfs, Sint32 nsct)
{
    GfsFlow *flow = &gfs->flow;
    Sint32 type = flow->dtsrc.type;

    return D_06071118[type].fn(flow, nsct);
}

Sint32 gfsAcc_PreparePack(GfsDataPack *dp, GfsFlow *flow)
{
    Sint32 type = flow->dtsrc.type;

    return D_0607111C[type].fn(dp, &flow->dtsrc);
}

void gfsAcc_ReleasePack(GfsFile *gfs, GfsDataPack *dp, Sint32 nsct)
{
    GfsFlow *flow = &gfs->flow;
    Sint32 type = flow->dtsrc.type;

    D_06071120[type].fn(flow, dp, nsct);
}

Sint32 gfsAcc_ReturnTrue(void)
{
    return TRUE;
}
