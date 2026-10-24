typedef struct { unsigned a : 3, b : 5, c : 8; } Bits;
typedef struct { int x, y; } Pair;
typedef int (*Fn)(int);
extern int ext_tbl[];
extern Fn g_fn;

int dense(int x)
{
    switch (x) {
    case 0: return 10; case 1: return 11; case 2: return 13; case 3: return 17;
    case 4: return 19; case 5: return 23; case 6: return 29; case 7: return 31;
    case 8: return 37; case 9: return 41; case 10: return 43; case 11: return 47;
    }
    return 0;
}

int bits(Bits *b) { b->b = 9; return b->a + b->c; }
Pair mk(int x) { Pair p; p.x = x; p.y = -x; return p; }
int call_ptr(int v) { return g_fn(v) + ext_tbl[v & 7]; }
float fmul(float a, float b) { return a * b + 1.5f; }
short narrow(unsigned char c, signed char s) { return (short)(c * s); }
int loop(int *p, int n) { int s = 0; while (n--) s ^= *p++; return s; }
