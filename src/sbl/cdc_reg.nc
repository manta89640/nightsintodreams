/* sbl/cdc_reg: matching source in the c2asm dialect (docs/c2asm.md), lifted from the
 * original. The readable C for this object is cdc_reg.ref.c; SHC 5.0 cannot
 * reproduce the 1996 compiler's output for all of it (see its NONMATCHING notes). */

__section(".text.060681C8");

void CDC_GetDataPtr(void)
{
    r0 = &CD_DATATRNS;
    return;
    __nopool;
}

void CDC_GetHirqReq(void)
{
    r3 = &CD_HIRQREQ;
    r0 = *(s16 *)r3;
    return slot(r0 = (u16)r0);
    __nopool;
}

void CDC_ClrHirqReq(void)
{
    r0 = 1;
    r5 = &cdc_hirq_stat;
    r1 = &CD_HIRQREQ;
    r2 = *(s16 *)r5;
    r3 = *(s16 *)r1;
    r2 |= r3;
    *(s16 *)r5 = r2;
    goto cdc_set_hirq_req slot(r4 |= r0);
    __nopool;
}

void cdc_set_hirq_req(void)
{
    r3 = &CD_HIRQREQ;
    return slot(*(s16 *)r3 = r4);
    __nopool;
}

void cdc_init_hirq(void)
{
    push(pr);
    r4 = 0x0BE1;
    __bsr cdc_set_hirq_req();
    r2 = 0x0BE1;
    r3 = &cdc_hirq_stat;
    pop(pr);
    return slot(*(s16 *)r3 = r2);
    __nopool;
}

void cdc_add_hirq_stat(void)
{
    r5 = &cdc_hirq_stat;
    r3 = *(s16 *)r5;
    r3 |= r4;
    return slot(*(s16 *)r5 = r3);
    __nopool;
}

void cdc_get_hirq_msk(void)
{
    r2 = &CD_HIRQMSK;
    r0 = *(s16 *)r2;
    return slot(r0 = (u16)r0);
    __nopool;
}

void cdc_set_hirq_msk(void)
{
    r3 = &CD_HIRQMSK;
    return slot(*(s16 *)r3 = r4);
    __nopool;
}

void cdc_get_25810028_ptr(void)
{
    r0 = 0x25810028;
    return;
    __nopool;
}

void cdc_get_data_words(void)
{
    push(r14);
    push(pr);
    r14 = r4;
    r3 = &CDC_DataReady;
    r15 += -8;
    *(s32 *)(r15 + 4) = r5;
    (*r3)() slot(r4 = 0);
    r4 = r0;
    if (r4) {
        r0 = r4;
        r15 += 8;
        pop(pr);
        return slot(pop(r14));
        __nopool;
    }
    r7 = 0;
    r6 = &CD_DATA;
    T = r7 >= r14;
    r4 = *(s32 *)(r15 + 4);
    if (!T) slot(r5 = r7) {
        do {
            r5 += 1;
            r2 = *(s16 *)r6;
            T = r5 >= r14;
            *(s16 *)r4 = r2;
        } while (!T) slot(r4 += 2);
    }
    r4 = r15;
    r2 = &CDC_DataEnd;
    (*r2)();
    r4 = r0;
    if (r4) goto L0606826C;
    r3 = *(s32 *)r15;
    if (r14 == r3) goto L0606826C;
    r4 = -7;
L0606826C:
    r0 = r4;
    r15 += 8;
    pop(pr);
    return slot(pop(r14));
    __nopool;
}

void cdc_exec_cmd(void)
{
    r0 = sr;
    r3 = __w(0xFF0F);
    r0 = (u32)r0 >> 2;
    push(pr);
    r0 = (u32)r0 >> 2;
    r15 += -4;
    r0 &= 15;
    *(s32 *)r15 = r0;
    r0 = sr;
    r0 &= r3;
    r0 |= 240;
    sr = r0;
    __bsr cdc_exec_cmd_body();
    r4 = r0;
    r2 = __w(0xFF0F);
    r3 = sr;
    r0 = *(s32 *)r15;
    r3 &= r2;
    r0 &= 15;
    r0 <<= 2;
    r0 <<= 2;
    r0 |= r3;
    sr = r0;
    r15 += 4;
    pop(pr);
    return slot(r0 = r4);
    __nopool;
}

void cdc_exec_cmd_body(void)
{
    push(r14);
    push(r13);
    push(r12);
    push(pr);
    r12 = r4;
    r14 = &cdc_hirq_stat;
    r15 += -12;
    r1 = &CD_HIRQREQ;
    *(s32 *)(r15 + 8) = r5;
    *(s32 *)r15 = r6;
    r3 = *(s16 *)r1;
    r2 = *(s16 *)r14;
    r2 |= r3;
    *(s16 *)r14 = r2;
    r4 = *(s16 *)r14;
    r4 = (u16)r4;
    r3 = r4;
    r3 &= r12;
    if (r3 != r12) {
        goto L0606835C slot(r0 = -1);
        __nopool;
    }
    r13 = 1;
    if ((r4 & r13) == 0) {
        goto L0606835C slot(r0 = -2);
    }
    r4 = r12;
    r4 |= r13;
    __bsr cdc_set_hirq_req() slot(r4 = ~r4);
    r3 = *(s32 *)&L060683D0;
    r2 = *(s16 *)r14;
    r2 &= r3;
    *(s16 *)r14 = r2;
    r4 = *(s32 *)(r15 + 8);
    __bsr cdc_write_cr();
    r5 = r15;
    r5 += 4;
    __bsr cdc_wait_hirq() slot(r4 = r13);
    r13 = r0;
    if (r13) {
        goto L0606835C slot(r0 = r13);
        __nopool;
    }
    r4 = *(s32 *)r15;
    __bsr cdc_read_cr();
    r4 = *(s32 *)r15;
    r3 = *(s16 *)&L060683CA;
    r4 = *(s8 *)r4;
    r4 = (u8)r4;
    if (r4 == r3) {
        goto L0606834E slot(r13 = -5);
        __nopool;
    }
    r2 = *(s16 *)&L060683CC;
    if ((r4 & r2) == 0) goto L0606834E;
    r13 = -6;
L0606834E:
    if (r13) goto L0606835C slot(r0 = r13);
    r3 = *(s16 *)r14;
    r12 = ~r12;
    r3 &= r12;
    *(s16 *)r14 = r3;
L0606835C:
    r15 += 12;
    pop(pr);
    pop(r12);
    pop(r13);
    return slot(pop(r14));
    __nopool;
}

void cdc_wait_hirq(void)
{
    push(r14);
    r14 = 0;
    r1 = *(s32 *)&L060683D8;
    r7 = r14;
    push(r12);
    r12 = -3;
    push(r11);
    r11 = *(s32 *)&L060683D4;
L06068378:
    r6 = *(s16 *)r11;
    r3 = r4;
    r6 = (u16)r6;
    if ((r3 & r6) != 0) {
        r12 = r14;
        goto L0606838E slot(*(s32 *)r5 = r6);
        __nopool;
    }
    r7 += 1;
    if (!(r7 >= r1)) goto L06068378;
L0606838E:
    r0 = r12;
    pop(r11);
    pop(r12);
    return slot(pop(r14));
    __nopool;
}

void cdc_write_cr(void)
{
    r3 = *(s16 *)r4;
    r2 = *(s32 *)&L060683DC;
    r1 = *(s32 *)&L060683E0;
    *(s16 *)r2 = r3;
    r0 = *(s16 *)(r4 + 2);
    r2 += 12;
    r3 = *(s32 *)&L060683E4;
    *(s16 *)r1 = r0;
    r0 = *(s16 *)(r4 + 4);
    *(s16 *)r3 = r0;
    r0 = *(s16 *)(r4 + 6);
    return slot(*(s16 *)r2 = r0);
    __nopool;
}

void cdc_read_cr(void)
{
    r1 = *(s32 *)&L060683DC;
    r2 = *(s32 *)&L060683E0;
    r3 = *(s16 *)r1;
    *(s16 *)r4 = r3;
    r0 = *(s16 *)r2;
    r3 = *(s32 *)&L060683E4;
    *(s16 *)(r4 + 2) = r0;
    r0 = *(s16 *)r3;
    *(s16 *)(r4 + 4) = r0;
    r0 = *(s16 *)(r1 + 12);
    return slot(*(s16 *)(r4 + 6) = r0);
    __data {
    L060683CA:
        u16 0x00FF;
    L060683CC:
        u16 0x0080;
        u8 0x00, 0x00;
    L060683D0:
        u32 0x0000FFFE;
    L060683D4:
        u32 &CD_HIRQREQ;
    L060683D8:
        u32 0x00240000;
    L060683DC:
        u32 &CD_CR1;
    L060683E0:
        u32 &CD_CR2;
    L060683E4:
        u32 &CD_CR3;
    }
}

