#include "sbl/types.h"
#include "sbl/gfs_trn.h"

/* Calls into the access functions of the file's data source. */

Sint32 gfsAcc_CountSct(GfsFile *gfs, Sint32 max, Sint32 flag)
{
    GfsFlow *flow = &gfs->flow;
    Sint32 type = flow->dtsrc.type;

    return gfs_acc_func_tbl[type].count_sct(flow, max, flag);
}

Sint32 gfsAcc_CountSctAll(GfsFile *gfs)
{
    GfsFlow *flow = &gfs->flow;
    Sint32 type = flow->dtsrc.type;

    return gfs_acc_func_tbl[type].count_sct(flow, 0xFFFF, 0);
}

GfsDataPack *gfsAcc_GetPack(GfsFile *gfs, Sint32 nsct)
{
    GfsFlow *flow = &gfs->flow;
    Sint32 type = flow->dtsrc.type;

    return gfs_acc_func_tbl[type].get_pack(flow, nsct);
}

Sint32 gfsAcc_PreparePack(GfsDataPack *dp, GfsFlow *flow)
{
    Sint32 type = flow->dtsrc.type;

    return gfs_acc_func_tbl[type].prepare_pack(dp, &flow->dtsrc);
}

void gfsAcc_ReleasePack(GfsFile *gfs, GfsDataPack *dp, Sint32 nsct)
{
    GfsFlow *flow = &gfs->flow;
    Sint32 type = flow->dtsrc.type;

    gfs_acc_func_tbl[type].release_pack(flow, dp, nsct);
}

Sint32 gfsAcc_ReturnTrue(void)
{
    return TRUE;
}
