typedef unsigned long size_t;

void *memset(void *s, int c, size_t n)
{
    char *p = s;
    size_t i;

    for (i = 0; i < n; i++)
        *p++ = c;
    return s;
}
