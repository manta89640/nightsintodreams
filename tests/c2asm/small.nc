/* Small functions from four units. Sections start where the function does,
 * or 2 bytes earlier when it starts at 2 mod 4 (the test only compares the
 * functions themselves). */

typedef struct Obj {
    u8 unk0[26];
    s16 unk26;              /* 26 */
} Obj;

__gbr(120) s32 g_120;
__gbr(124) s16 g_124;       /* frames left on a countdown */
__gbr(224) u16 g_tvmd;      /* shadow of VDP2_TVMD */

__section(".text.0600CA4C");
__data { u16 0; }

/* Count g_124 down, moving g_120 by -48 each step. Returns r0 = 1. */
void func_0600CA4E(void)
{
    r0 = g_124;
    if (r0 > 0) {
        r0 += -1;
        g_124 = r0;
        r0 = g_120;
        r0 += -48;
        g_120 = r0;
    }
    return slot(r0 = 1);
}

__section(".text.060359EC");

/* Copy r6 longwords from r7 to r2. The loop label is the entry. */
void func_060359EC(void)
{
    do {
        r0 = *(u32 *)r7++;
        *(u32 *)r2 = r0;
    } while (--r6 != 0) slot(r2 += 4);
    return;
}

__section(".text.06039170");

/* Make func_0603917C the handler of object r1 from the next frame (the
 * handler word sits just before the object body). */
void func_06039170(void)
{
    r0 = func_0603917C;
    *(u32 *)--r1 = r0;
    return slot(r1 += 4);
}

__section(".text.060389D4");

void func_060389D4(void)
{
    register Obj *obj asm("r1");

    r0 = (s16)0x8000;
    return slot(obj->unk26 = r0);
}

__section(".text.0602B948");
__data { u16 0; }

/* Clear DISP (bit 15) in the TVMD shadow and write it to VDP2. */
void func_0602B94A(void)
{
    r0 = g_tvmd;
    r1 = 0x7FFF;
    r0 &= r1;
    r1 = &VDP2_TVMD;
    g_tvmd = r0;
    return slot(*(u16 *)r1 = r0);
}
