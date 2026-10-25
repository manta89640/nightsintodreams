/* Runtime for C emitted by tools/c2asm (portc.py).
 *
 * The SH-2 state lives in `sh`; memory is a 1 MB window (High Work RAM, where
 * 0NIGHTS runs; other addresses alias into it) behind big-endian accessors.
 * sh_image is the pristine program, which PC-relative loads read.
 *
 * Calls go through sh_call(), which looks the address up in the table of
 * translated entry points. Addresses outside translated code are stubs
 * (sh_stub); addresses inside it that are not entry points, unbalanced
 * returns, rte/sleep/trapa and runaway loops abort the run (sh_unsupported).
 */
#ifndef C2ASM_RT_H
#define C2ASM_RT_H
#include <stdint.h>

typedef uint8_t u8;
typedef int8_t s8;
typedef uint16_t u16;
typedef int16_t s16;
typedef uint32_t u32;
typedef int32_t s32;
typedef uint64_t u64;
typedef int64_t s64;

typedef struct {
    u32 r[16];
    u32 gbr, vbr, pr, mach, macl;
    u32 t, s, q, m, imask;
} ShState;

extern ShState sh;
extern u8 sh_mem[1 << 20];
extern const u8 *sh_image;
extern u32 sh_image_base, sh_image_size;
extern long sh_steps, sh_step_limit;

void sh_call(u32 addr, u32 ret);
void sh_jump(u32 addr);
void sh_return(u32 pr);
void sh_unsupported(u32 pc);

#define R(n) sh.r[n]
#define A(a) ((u32)(a) & 0xFFFFFu)
#define STEP() do { if (++sh_steps > sh_step_limit) sh_unsupported(0); } while (0)

static inline u32 LD8(u32 a) { return sh_mem[A(a)]; }
static inline u32 LD16(u32 a) { return (u32)sh_mem[A(a)] << 8 | sh_mem[A(a + 1)]; }
static inline u32 LD32(u32 a) { return LD16(a) << 16 | LD16(a + 2); }
static inline void ST8(u32 a, u32 v) { sh_mem[A(a)] = (u8)v; }
static inline void ST16(u32 a, u32 v) { ST8(a, v >> 8); ST8(a + 1, v); }
static inline void ST32(u32 a, u32 v) { ST16(a, v >> 16); ST16(a + 2, v); }

static inline u32 LDP16(u32 a)
{
    u32 o = a - sh_image_base;
    return (u32)sh_image[o] << 8 | sh_image[o + 1];
}
static inline u32 LDP32(u32 a) { return LDP16(a) << 16 | LDP16(a + 2); }

static inline u32 sh_getsr(void)
{
    return sh.m << 9 | sh.q << 8 | sh.imask << 4 | sh.s << 1 | sh.t;
}

static inline void sh_setsr(u32 v)
{
    sh.m = v >> 9 & 1; sh.q = v >> 8 & 1; sh.imask = v >> 4 & 15; sh.s = v >> 1 & 1; sh.t = v & 1;
}

static inline void sh_setmac(u64 v) { sh.mach = (u32)(v >> 32); sh.macl = (u32)v; }

static inline void sh_addc(u32 *n, u32 m)
{
    u32 t1 = *n + m, t0 = *n;
    *n = t1 + sh.t;
    sh.t = t0 > t1 || t1 > *n;
}

static inline void sh_subc(u32 *n, u32 m)
{
    u32 t1 = *n - m, t0 = *n;
    *n = t1 - sh.t;
    sh.t = t0 < t1 || t1 < *n;
}

static inline void sh_addv(u32 *n, u32 m)
{
    s64 v = (s64)(s32)*n + (s32)m;
    *n += m;
    sh.t = v != (s32)v;
}

static inline void sh_subv(u32 *n, u32 m)
{
    s64 v = (s64)(s32)*n - (s32)m;
    *n -= m;
    sh.t = v != (s32)v;
}

static inline u32 sh_negc(u32 m)
{
    u32 t = 0u - m, n = t - sh.t;
    sh.t = 0 < t || t < n;
    return n;
}

static inline u32 sh_cmpstr(u32 n, u32 m)
{
    u32 x = n ^ m;
    return !(x & 0xFF000000u) || !(x & 0xFF0000u) || !(x & 0xFF00u) || !(x & 0xFFu);
}

/* DIV1 as in the SH-2 programming manual */
static inline void sh_div1(u32 *n, u32 m)
{
    u32 old_q = sh.q, t0 = 0, t1;
    sh.q = *n >> 31;
    *n = *n << 1 | sh.t;
    t0 = *n;
    if (old_q == sh.m) {        /* subtract */
        *n -= m;
        t1 = *n > t0;
    } else {                    /* add */
        *n += m;
        t1 = *n < t0;
    }
    sh.q = sh.m ? !(sh.q ^ t1) : sh.q ^ t1;
    sh.t = sh.q == sh.m;
}

static inline void sh_macl(int m, int n)
{
    s32 a = (s32)LD32(R(n)); R(n) += 4;
    s32 b = (s32)LD32(R(m)); R(m) += 4;
    if (sh.s) sh_unsupported(1);
    u64 mac = (u64)sh.mach << 32 | sh.macl;
    sh_setmac(mac + (u64)((s64)a * b));
}

static inline void sh_macw(int m, int n)
{
    s32 a = (s16)LD16(R(n)); R(n) += 2;
    s32 b = (s16)LD16(R(m)); R(m) += 2;
    if (sh.s) sh_unsupported(1);
    u64 mac = (u64)sh.mach << 32 | sh.macl;
    sh_setmac(mac + (u64)(s64)(a * b));
}

#endif
