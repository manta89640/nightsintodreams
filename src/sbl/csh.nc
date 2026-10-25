/* sbl/csh: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is csh.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.060683E8");

void CSH_Init(void)
{
    push(r12);
    r2 = 0;
    r5 = __w(0xFE92);
    r12 = 64;
    push(r11);
    r6 = r2;
    push(r10);
    push(r9);
    r0 = *(s8 *)r5;
    r9 = 63;
    r10 = 0x0100;
    r0 &= 254;
    r11 = 0x60000000;
    *(s8 *)r5 = r0;
L06068404:
    r3 = *(s8 *)r5;
    r7 = r11;
    r3 = (u8)r3;
    r3 &= r9;
    r3 |= r6;
    r1 = r12;
    *(s8 *)r5 = r3;
    do {
        T = --r1 == 0;
        *(s32 *)r7 = r2;
    } while (!T) slot(r7 += 16);
    r6 += 64;
    if (!((u32)r6 >= (u32)r10)) goto L06068404;
    r0 = *(s8 *)r5;
    r0 &= 247;
    r0 |= r4;
    *(s8 *)r5 = r0;
    r0 = *(s8 *)r5;
    r0 &= 253;
    *(s8 *)r5 = r0;
    r0 = *(s8 *)r5;
    r0 &= 251;
    *(s8 *)r5 = r0;
    r0 = *(s8 *)r5;
    r0 &= 254;
    r0 |= 1;
    *(s8 *)r5 = r0;
    pop(r9);
    pop(r10);
    pop(r11);
    return slot(pop(r12));
    __nopool;
}

void CSH_AllClr(void)
{
    r1 = 0;
    push(r12);
    r5 = r1;
    r4 = __w(0xFE92);
    push(r11);
    push(r10);
    r11 = 63;
    r12 = 0x0100;
    r10 = 64;
    r2 = 0x60000000;
    r0 = *(s8 *)r4;
    r0 &= 254;
    *(s8 *)r4 = r0;
L06068460:
    r3 = *(s8 *)r4;
    r6 = r2;
    r3 = (u8)r3;
    r3 &= r11;
    r3 |= r5;
    r7 = r10;
    *(s8 *)r4 = r3;
    do {
        T = --r7 == 0;
        *(s32 *)r6 = r1;
    } while (!T) slot(r6 += 16);
    r5 += 64;
    if (!((u32)r5 >= (u32)r12)) goto L06068460;
    r0 = *(s8 *)r4;
    r0 &= 254;
    r0 |= 1;
    *(s8 *)r4 = r0;
    pop(r10);
    pop(r11);
    return slot(pop(r12));
    __nopool;
}

void CSH_Purge(void)
{
    r3 = 0x1FFFFFFF;
    r1 = -16;
    r2 = 0x40000000;
    r6 = 0;
    r4 &= r3;
    r4 |= r2;
    r5 += r4;
    r5 += -16;
    r4 &= r1;
    do {
        T = (u32)r4 >= (u32)r5;
        *(s32 *)r4 = r6;
    } while (!T) slot(r4 += 16);
    return;
}

