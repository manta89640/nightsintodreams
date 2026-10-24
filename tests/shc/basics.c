typedef struct { int a, b, c, d, e, f; } Big;
static int s_count;
int g_init = 0x1234;
const short g_tbl[4] = { 1, -2, 300, -40000 & 0xFFFF };
const char *g_msg = "Hello\tWorld\n";
unsigned char g_bytes[3] = { 1, 2, 3 };
extern Big g_big;
extern void ext(int);
static int helper(int x) { return x * 3; }
int sw(int x, int y) {
    switch (x) {
    case 0: return y;
    case 1: return y + 1;
    case 2: return helper(y);
    case 3: return y / 7;
    case 4: return y % 10;
    case 5: return (unsigned)y / 3u;
    case 6: return y * y;
    default: return -1;
    }
}
void copy(Big *d) { *d = g_big; s_count++; ext(g_tbl[2]); }
int big_const(void) { return 0x12345678 + g_init; }
