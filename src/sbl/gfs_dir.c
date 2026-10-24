#include "sbl/types.h"
#include "sbl/gfs.h"

/*
 * GFS directory reading: loads a directory table from the ISO9660 records of an
 * open directory file, and the small table accessors the rest of GFS uses.
 *
 * NONMATCHING (all but the four table accessors): built by the older SHC that
 * also built the STM and GFS objects next to it (more values in r8-r14, empty
 * call delay slots, one epilogue per return), which SHC 5.0 does not reproduce.
 */

/* A directory table entry with its name (GFS_DIR_NAME tables). */
typedef struct GfsDirName {
    CdcFile dirrec;
    Sint8 fname[12];
} GfsDirName;

/* Sequential reader over the sectors of a directory file. */
typedef struct {
    GfsHn gfs;
    Uint8 *buf;         /* one sector */
    Sint32 pos;         /* read position in buf; -1: nothing read yet */
    Sint32 sct;         /* sectors read */
    Sint32 nsct;        /* sectors in the file */
} GfsDirRdr;

/* One directory record as parsed from the disc. */
typedef struct {
    Uint32 fad;
    Uint32 size;
    Uint8 len;          /* record length; 0: end of the directory */
    Uint8 atr;
    Uint8 unit;
    Uint8 gap;
    Sint8 fname[13];
    Uint8 fn;
} GfsDirRec;

#define GFS_FILT_DIR 23

extern Sint32 GFS_GetFileInfo(GfsHn gfs, Sint32 *fid, Sint32 *fn, Sint32 *fsize, Sint32 *atr);
extern Sint32 GFS_NwCdRead(GfsHn gfs, Sint32 nsct);
extern Sint32 GFS_Fread(GfsHn gfs, Sint32 nsct, void *buf, Sint32 bsize);
extern void gfcd_SetTimeout(Sint32 count);
extern Sint32 gfcd_ChgDir(Sint32 fid, Sint32 filtno, Sint32 *dirfid);
extern Sint32 gfcd_ExecServer(void);
extern Sint32 gfcd_WaitServer(void);

/* C library (shclib) */
extern void *memset(void *dst, Sint32 c, Sint32 n);          /* memset */
extern Sint32 strncmp(const Sint8 *a, const Sint8 *b, Sint32 n); /* strncmp */
extern Sint8 *strncpy(Sint8 *dst, const Sint8 *src, Sint32 n);  /* strncpy */
extern Sint8 *strcpy(Sint8 *dst, const Sint8 *src);

Sint32 gfs_CdChgDir(Sint32 fid);
static Sint32 gfs_ReadDirId(GfsHn gfs, CdcFile *dir, Sint32 ndir);
static Sint32 gfs_ReadDirName(GfsHn gfs, GfsDirName *dir, Sint32 ndir);
static void gfs_RdrInit(GfsDirRdr *rdr, GfsHn gfs);
static Sint32 gfs_RdrRead(GfsDirRdr *rdr, void *dst, Sint32 n);
static Sint8 gfs_RdrByte(GfsDirRdr *rdr, Sint32 *err);
static Sint16 gfs_RdrHalf(GfsDirRdr *rdr, Sint32 *err);
static Sint16 gfs_RdrHalf2(GfsDirRdr *rdr, Sint32 *err);
static Sint32 gfs_RdrWord2(GfsDirRdr *rdr, Sint32 *err);
static Sint32 gfs_RdrWord(GfsDirRdr *rdr, Sint32 *err);
static Uint8 gfs_RdrRecLen(GfsDirRdr *rdr, Sint32 *err);
static Sint32 gfs_RdrRec(GfsDirRdr *rdr, GfsDirRec *rec);
static void gfs_RecToDir(CdcFile *dir, GfsDirRec *rec);

/* Reads the directory open as gfs (if any) into dirtbl; returns the number of
 * entries. */
Sint32 gfs_LoadDirTbl(GfsHn gfs, GfsDirTbl *dirtbl, Sint32 nsct)
{
    Sint32 atr;
    Sint32 ret;

    if (gfs != NULL) {
        GFS_GetFileInfo(gfs, NULL, NULL, NULL, &atr);
        if ((atr & GFS_ATR_DIR) == 0) {
            return GFS_ERR_DIR;
        }
        ret = GFS_NwCdRead(gfs, nsct);
        if (ret != 0) {
            return ret;
        }
    }
    if (dirtbl->type == GFS_DIR_ID) {
        ret = gfs_ReadDirId(gfs, (CdcFile *)dirtbl->dir, dirtbl->ndir);
    } else {
        ret = gfs_ReadDirName(gfs, (GfsDirName *)dirtbl->dir, dirtbl->ndir);
    }
    return ret;
}

/* Index of the entry called fname, or -1. */
Sint32 gfs_NameToIdx(GfsDirName *dir, Sint8 *fname, Sint32 ndir)
{
    Sint32 i;

    for (i = 0; i < ndir; i++) {
        if (strncmp(fname, dir->fname, 12) == 0) {
            return i;
        }
        if (dir->dirrec.atr & GFS_ATR_END_TBL) {
            break;
        }
        dir++;
    }
    return -1;
}

CdcFile *gfs_DirIdRec(Sint32 i, CdcFile *dir)
{
    return &dir[i];
}

GfsDirName *gfs_DirNameRec(Sint32 i, GfsDirName *dir)
{
    return &dir[i];
}

Uint8 gfs_DirIdAtr(Sint32 i, CdcFile *dir)
{
    return dir[i].atr;
}

Uint8 gfs_DirNameAtr(Sint32 i, GfsDirName *dir)
{
    return dir[i].dirrec.atr;
}

Sint32 gfs_CdChgRootDir(void)
{
    return gfs_CdChgDir(-1);
}

/* Makes fid the current directory of the CD block; returns the directory's
 * first file id. */
Sint32 gfs_CdChgDir(Sint32 fid)
{
    Sint32 dirfid;
    Sint32 ret;

    gfcd_SetTimeout(0x30000);
    do {
        ret = gfcd_ChgDir(fid, GFS_FILT_DIR, &dirfid);
        if (ret == -5) {
            return GFS_ERR_CDBFS;
        }
        ret = gfcd_ExecServer();
        if (ret == -12) {
            return GFS_ERR_TMOUT;
        }
        if (ret == -16) {
            return GFS_ERR_FATAL;
        }
    } while (ret != 0);
    ret = gfcd_WaitServer();
    if (ret == -16) {
        return GFS_ERR_FATAL;
    }
    if (ret != 0) {
        return GFS_ERR_CDRD;
    }
    return dirfid;
}

static Sint32 gfs_ReadDirId(GfsHn gfs, CdcFile *dir, Sint32 ndir)
{
    GfsDirRec rec;
    GfsDirRdr rdr;
    Sint32 n;
    Sint32 ret;

    gfs_RdrInit(&rdr, gfs);
    for (n = 0; ndir > 0; ndir--) {
        ret = gfs_RdrRec(&rdr, &rec);
        if (ret != 0) {
            return ret;
        }
        if (rec.len == 0) {
            break;
        }
        gfs_RecToDir(dir, &rec);
        dir++;
        n++;
    }
    dir[-1].atr |= GFS_ATR_END_TBL;
    return n;
}

/* Like gfs_ReadDirId, with names. After the "." and ".." entries a record
 * with the same name as the previous one (another extent of the same file)
 * leaves its entry unfilled. */
static Sint32 gfs_ReadDirName(GfsHn gfs, GfsDirName *dir, Sint32 ndir)
{
    GfsDirRec rec;
    GfsDirRdr rdr;
    Sint32 n;
    Sint32 ret;

    gfs_RdrInit(&rdr, gfs);
    for (n = 0; ndir > 0; ndir--) {
        ret = gfs_RdrRec(&rdr, &rec);
        if (ret != 0) {
            return ret;
        }
        if (rec.len == 0) {
            break;
        }
        if (n <= 2 || strncmp(dir[-1].fname, rec.fname, 12) != 0) {
            gfs_RecToDir(&dir->dirrec, &rec);
            strncpy(dir->fname, rec.fname, 12);
        }
        dir++;
        n++;
    }
    dir[-1].dirrec.atr |= GFS_ATR_END_TBL;
    return n;
}

static void gfs_RdrInit(GfsDirRdr *rdr, GfsHn gfs)
{
    rdr->gfs = gfs;
    rdr->buf = (Uint8 *)D_06070C78 + 0x460;
    rdr->pos = -1;
    rdr->nsct = gfs->flow.finfo.nsct;
    rdr->sct = 0;
}

/* Copies the next n bytes of the directory to dst (zeros without a file). */
static Sint32 gfs_RdrRead(GfsDirRdr *rdr, void *dst, Sint32 n)
{
    Sint32 pos;
    Uint32 len;
    Sint32 ret;

    if (rdr->gfs == NULL) {
        memset(dst, 0, n);
        return 0;
    }
    if (rdr->pos == -1 || rdr->pos >= GFS_SCT_SIZE) {
        ret = GFS_Fread(rdr->gfs, 1, rdr->buf, GFS_SCT_SIZE);
        if (ret != GFS_SCT_SIZE) {
            if (ret < 0) {
                return ret;
            }
            return GFS_ERR_CDRD;
        }
        rdr->pos = 0;
    }
    pos = rdr->pos;
    len = GFS_SCT_SIZE - pos;
    if (len >= (Uint32)n) {
        len = n;
    }
    memmove(dst, rdr->buf + pos, len);
    rdr->pos += len;
    if (len < (Uint32)n) {
        n -= len;
        ret = GFS_Fread(rdr->gfs, 1, rdr->buf, GFS_SCT_SIZE);
        if (ret != GFS_SCT_SIZE) {
            if (ret < 0) {
                return ret;
            }
            return GFS_ERR_CDRD;
        }
        memmove((Uint8 *)dst + len, rdr->buf, n);
        rdr->pos = n;
    }
    return 0;
}

static Sint8 gfs_RdrByte(GfsDirRdr *rdr, Sint32 *err)
{
    Sint8 c;

    *err = gfs_RdrRead(rdr, &c, 1);
    return c;
}

static Sint16 gfs_RdrHalf(GfsDirRdr *rdr, Sint32 *err)
{
    Sint16 h;

    *err = gfs_RdrRead(rdr, &h, 2);
    return h;
}

/* Both-endian 16-bit field: returns the big-endian half. */
static Sint16 gfs_RdrHalf2(GfsDirRdr *rdr, Sint32 *err)
{
    Sint16 be;
    Sint16 le;

    *err = gfs_RdrRead(rdr, &le, 2);
    if (*err != 0) {
        return 0;
    }
    *err = gfs_RdrRead(rdr, &be, 2);
    if (*err != 0) {
        return 0;
    }
    return be;
}

/* Both-endian 32-bit field: returns the big-endian half. */
static Sint32 gfs_RdrWord2(GfsDirRdr *rdr, Sint32 *err)
{
    Sint32 be;
    Sint32 le;

    *err = gfs_RdrRead(rdr, &le, 4);
    if (*err != 0) {
        return 0;
    }
    *err = gfs_RdrRead(rdr, &be, 4);
    if (*err != 0) {
        return 0;
    }
    return be;
}

static Sint32 gfs_RdrWord(GfsDirRdr *rdr, Sint32 *err)
{
    Sint32 w;

    *err = gfs_RdrRead(rdr, &w, 4);
    return w;
}

/* Length of the next record; a zero length pads to the end of the sector, so
 * the next sector is read (0 at the end of the directory). */
static Uint8 gfs_RdrRecLen(GfsDirRdr *rdr, Sint32 *err)
{
    Uint8 len;
    Sint32 ret;

    len = gfs_RdrByte(rdr, err);
    if (*err != 0) {
        return 0;
    }
    if (len != 0) {
        return len;
    }
    if (++rdr->sct >= rdr->nsct) {
        return len;
    }
    ret = GFS_Fread(rdr->gfs, 1, rdr->buf, GFS_SCT_SIZE);
    if (ret != GFS_SCT_SIZE) {
        if (ret > 0) {
            *err = GFS_ERR_CDRD;
        } else {
            *err = ret;
        }
        return 0;
    }
    rdr->pos = 0;
    len = gfs_RdrByte(rdr, err);
    if (*err != 0) {
        return 0;
    }
    return len;
}

/* Parses one ISO9660 directory record. The name is cut to 8.3 and loses its
 * ";1" version; the CD-ROM XA system use field gives the attributes and the
 * file number. */
static Sint32 gfs_RdrRec(GfsDirRdr *rdr, GfsDirRec *rec)
{
    Sint32 err;
    Sint32 used;
    Uint8 flags;
    Sint32 namelen;
    Sint32 i;
    Sint8 c;
    Sint8 *p;
    Sint8 *ext;
    Sint32 lim;

    if (rdr->gfs == NULL) {
        rec->len = 0;
        return 0;
    }
    rec->len = gfs_RdrRecLen(rdr, &err);
    if (err != 0) {
        return err;
    }
    if (rec->len == 0) {
        return 0;
    }
    gfs_RdrByte(rdr, &err);                     /* extended attribute length */
    if (err != 0) {
        return err;
    }
    rec->fad = gfs_RdrWord2(rdr, &err) + 150;   /* LBA to FAD */
    if (err != 0) {
        return err;
    }
    rec->size = gfs_RdrWord2(rdr, &err);
    if (err != 0) {
        return err;
    }
    for (i = 0; i < 7; i++) {                   /* recording date */
        gfs_RdrByte(rdr, &err);
        if (err != 0) {
            return err;
        }
    }
    flags = gfs_RdrByte(rdr, &err);
    if (err != 0) {
        return err;
    }
    rec->unit = gfs_RdrByte(rdr, &err);
    if (err != 0) {
        return err;
    }
    rec->gap = gfs_RdrByte(rdr, &err);
    if (err != 0) {
        return err;
    }
    gfs_RdrHalf2(rdr, &err);                    /* volume sequence number */
    if (err != 0) {
        return err;
    }
    namelen = (Uint8)gfs_RdrByte(rdr, &err);
    if (err != 0) {
        return err;
    }
    used = namelen + 33;

    /* base name: up to 8 characters, up to the '.' or the ';' */
    p = rec->fname;
    i = 0;
    lim = 8;
    while (i < ((namelen > lim) ? lim : namelen)) {
        c = gfs_RdrByte(rdr, &err);
        i++;
        if (err != 0) {
            return err;
        }
        if (c == ';') {
            break;
        }
        *p++ = c;
        if (c == '.') {
            break;
        }
    }
    ext = p;
    if (c == ';') {
        while (i < namelen) {
            gfs_RdrByte(rdr, &err);
            i++;
            if (err != 0) {
                return err;
            }
        }
    } else if (c != '.') {
        /* skip the rest of a long base name */
        while (i < namelen) {
            c = gfs_RdrByte(rdr, &err);
            i++;
            if (err != 0) {
                return err;
            }
            if (c == '.') {
                *p++ = c;
                ext = p;
                break;
            }
        }
    }
    /* extension: up to 3 characters */
    while (i < namelen) {
        c = gfs_RdrByte(rdr, &err);
        i++;
        if (err != 0) {
            return err;
        }
        if (c == ';') {
            while (i < namelen) {
                gfs_RdrByte(rdr, &err);
                i++;
                if (err != 0) {
                    return err;
                }
            }
            break;
        }
        if (p - ext <= 3 && p - rec->fname < 12) {
            *p++ = c;
        }
    }
    if (p - rec->fname < 12) {
        *p = 0;
    }
    if (((namelen + 1) & 1) != 0) {             /* padding to an even length */
        gfs_RdrByte(rdr, &err);
        if (err != 0) {
            return err;
        }
        used++;
    }
    if (rec->fname[0] == 0) {
        strcpy(rec->fname, ".");
    } else if (rec->fname[0] == 1) {
        strcpy(rec->fname, "..");
    }
    if (used < rec->len) {
        /* CD-ROM XA system use: owner ids, attributes, signature, file number */
        gfs_RdrWord(rdr, &err);
        if (err != 0) {
            return err;
        }
        rec->atr = gfs_RdrByte(rdr, &err) & 0xF8;
        if (err != 0) {
            return err;
        }
        gfs_RdrByte(rdr, &err);
        if (err != 0) {
            return err;
        }
        gfs_RdrHalf(rdr, &err);
        if (err != 0) {
            return err;
        }
        rec->fn = gfs_RdrByte(rdr, &err);
        if (err != 0) {
            return err;
        }
        for (i = used + 9; i < rec->len; i++) {
            gfs_RdrByte(rdr, &err);
            if (err != 0) {
                return err;
            }
        }
    } else {
        rec->atr = (flags & 2) ? GFS_ATR_DIR : 0;
        rec->fn = 0;
    }
    return 0;
}

static void gfs_RecToDir(CdcFile *dir, GfsDirRec *rec)
{
    dir->fad = rec->fad;
    dir->size = rec->size;
    dir->fn = rec->fn;
    dir->atr = rec->atr;
    dir->unit = rec->unit;
    dir->gap = rec->gap;
}
