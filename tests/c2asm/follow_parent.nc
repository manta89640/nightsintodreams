/* Per-frame handler that keeps an object glued to its parent
 * (installed by func_06039170). Field names are placeholders. */

typedef struct Obj {
    u8 unk0[4];
    u8 kind;                /* 4 */
    u8 unk5[19];
    s16 unk24;              /* 24 */
    u8 unk26[22];
    s32 x;                  /* 48 */
    s32 y;                  /* 52 */
    s32 z;                  /* 56 */
    u8 unk60[4];
    struct Obj *parent;     /* 64 */
    u8 unk68[48];
    u32 flags;              /* 116 */
} Obj;

__gbr(100) s16 g_100;
__gbr(110) u8 g_110;
__gbr(194) s16 g_194;

__section(".text.0603917C");

void func_0603917C(void)
{
    register Obj *obj asm("r1");
    register Obj *parent asm("r4");
    register Obj *grand asm("r2");

    push(pr);
    parent = obj->parent;
    r0 = parent->kind;
    if (r0 != 7)
        goto gone;
    grand = parent->parent;
    r0 = grand->flags;
    if ((r0 & 4) != 0)
        goto follow;
gone:
    r9 = func_0600D1A0;             /* delete this object */
    return (*r9)() slot(pop(pr));
follow:
    r5 = parent->y;
    obj->y = r5;
    r0 = g_194;
    obj->unk24 = r0;
    r2 = 1;
    __bsr func_06038A00() slot(r2 <<= 16);
    r5 = parent->x;
    r0 = parent->z;
    r5 += r2;
    r0 += r3;
    obj->x = r5;
    obj->z = r0;
    r0 = g_110;
    if (r0)
        goto draw;
    pop(pr);
    return;
draw:
    func_0600CA24();
    r4 = obj->x;
    r5 = obj->y;
    func_0600CBDA() slot(r6 = obj->z);
    r0 = 0x100;
    r2 = func_06037024;
    (*r2)() slot(g_100 = r0);
    return func_0600CA4E() slot(pop(pr));
}
