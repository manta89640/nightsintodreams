#ifndef _MACHINE
#define _MACHINE

/* The SHC intrinsics that <machine.h> provides (SHC's own header is not part of
 * compile/). The compiler expands the _builtin_ names inline. */

extern void _builtin_set_imask(int mask);
extern int _builtin_get_imask(void);
extern void _builtin_set_cr(int cr);
extern int _builtin_get_cr(void);

#define set_imask(mask) _builtin_set_imask(mask)
#define get_imask()     _builtin_get_imask()
#define set_cr(cr)      _builtin_set_cr(cr)
#define get_cr()        _builtin_get_cr()

#endif
