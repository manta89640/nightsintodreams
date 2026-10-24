#ifndef SBL_MACHINE_H
#define SBL_MACHINE_H

/* SHC intrinsics, as declared by the compiler's <machine.h>. */
extern int _builtin_get_imask(void);
extern void _builtin_set_imask(int mask);

#define get_imask() _builtin_get_imask()
#define set_imask(mask) _builtin_set_imask(mask)

#endif
