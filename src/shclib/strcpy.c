/* SHC compiles _builtin_strcpy into a call to its runtime routine __slow_strcpy. */
char *_builtin_strcpy(char *, const char *);

char *strcpy(char *s1, const char *s2)
{
    return _builtin_strcpy(s1, s2);
}
