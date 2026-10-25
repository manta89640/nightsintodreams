/* Runtime for C emitted by tools/c2asm: calls, returns, stubs and aborts.
 * The rules match tools/c2asm/interp.py, which runs the original bytes. */
#include <setjmp.h>
#include <string.h>
#include "c2asm_rt.h"

typedef struct {
    u32 addr;
    void (*fn)(u32);
} ShEntry;

typedef struct {
    u32 start, end;
} ShRange;

/* generated with the translated units */
extern const ShEntry sh_entries[];
extern const int sh_nentries;
extern const ShRange sh_ranges[];
extern const int sh_nranges;

ShState sh;
u8 sh_mem[1 << 20];
const u8 *sh_image;
u32 sh_image_base, sh_image_size;
long sh_steps, sh_step_limit = 200000;

u32 sh_log[2 * 4096];
int sh_nlog;
int sh_abort_code;

static jmp_buf sh_abort;
static u32 stack[512];
static int sp;

static const ShEntry *find(u32 a)
{
    int lo = 0, hi = sh_nentries - 1;
    while (lo <= hi) {
        int mid = (lo + hi) / 2;
        if (sh_entries[mid].addr == a)
            return &sh_entries[mid];
        if (sh_entries[mid].addr < a)
            lo = mid + 1;
        else
            hi = mid - 1;
    }
    return 0;
}

static int in_code(u32 a)
{
    for (int i = 0; i < sh_nranges; i++)
        if (a >= sh_ranges[i].start && a < sh_ranges[i].end)
            return 1;
    return 0;
}

void sh_unsupported(u32 pc)
{
    (void)pc;
    longjmp(sh_abort, 1);
}

/* what an untranslated callee does (the same in interp.py) */
static void stub(u32 addr)
{
    u32 h = 2166136261u;
    u32 v[6] = {addr, R(1), R(4), R(5), R(6), R(7)};
    for (int i = 0; i < 6; i++)
        h = (h ^ v[i]) * 16777619u;
    if (sh_nlog < 4096) {
        sh_log[2 * sh_nlog] = addr;
        sh_log[2 * sh_nlog + 1] = h;
        sh_nlog++;
    }
    R(0) = h;
    R(2) = h ^ 0x5555;
}

void sh_return(u32 pr)
{
    if (sp <= 0 || stack[--sp] != pr)
        sh_unsupported(2);
}

void sh_call(u32 a, u32 ret)
{
    const ShEntry *e;
    if (sh.pr != ret)
        sh_unsupported(3);
    e = find(a);
    if (e) {
        if (sp >= 512)
            sh_unsupported(4);
        stack[sp++] = ret;
        e->fn(a);
        return;
    }
    if (in_code(a))
        sh_unsupported(5);
    stub(a);
}

void sh_jump(u32 a)
{
    const ShEntry *e = find(a);
    if (e) {
        e->fn(a);
        return;
    }
    if (in_code(a))
        sh_unsupported(6);
    stub(a);
    sh_return(sh.pr);
}

/* Run from `entry` with PR = sentinel. Returns 0 when it returned normally,
 * 1 when it hit something the translation does not follow. */
int sh_run(u32 entry, u32 sentinel)
{
    sp = 0;
    sh_nlog = 0;
    sh_steps = 0;
    if (setjmp(sh_abort))
        return 1;
    sh.pr = sentinel;
    if (!find(entry))
        return 1;
    sh_call(entry, sentinel);
    return sp != 0;
}
