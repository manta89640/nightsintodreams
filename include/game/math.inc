/*
 * Fixed-point math, the matrix stack and shading (units game/06007B94,
 * game/0600C9C8, game/0600CF6C).
 *
 * Numbers are 16.16 fixed point unless noted; `dmuls.l a,b / sts mach,rH /
 * sts macl,rL / xtrct rH,rL` is the 16.16 multiply. Angles are 16 bits for a
 * full turn (0x4000 = 90 degrees). sin_table holds 2.14 values (0x4000 = 1.0);
 * callers shift them left by 2 to get 16.16.
 */

! 3x4 matrix: rotation rows m0x, m1x, m2x, translation in the 4th column
.equ MTX_M00,           0
.equ MTX_M01,           4
.equ MTX_M02,           8
.equ MTX_TX,            12
.equ MTX_M10,           16
.equ MTX_M11,           20
.equ MTX_M12,           24
.equ MTX_TY,            28
.equ MTX_M20,           32
.equ MTX_M21,           36
.equ MTX_M22,           40
.equ MTX_TZ,            44
.equ MTX_SIZE,          48
.equ MTX_STACK_DEPTH,   20      ! matrices in mtx_stack

! Vector of three 16.16 values
.equ VEC_X,             0
.equ VEC_Y,             4
.equ VEC_Z,             8
.equ VEC_SIZE,          12

/*
 * SH7604 division unit, at 0xFFFFFF00 (mov #-128,rN / shll rN). Writing
 * DIVU_DVDNTL starts the 64/32 division of DVDNTH:DVDNTL by DVSR; reading
 * DIVU_QUOT waits for the quotient.
 */
.equ DIVU_DVSR,         0
.equ DIVU_DVDNT,        4       ! writing it starts a 32/32 division
.equ DIVU_DVCR,         8
.equ DIVU_VCRDIV,       12
.equ DIVU_DVDNTH,       16
.equ DIVU_DVDNTL,       20
.equ DIVU_REM,          24
.equ DIVU_QUOT,         28

! The light (light_set_dir)
.equ LIGHT_RAMP,        0       ! 64 colours from dark to lit
.equ LIGHT_DIR,         4       ! vector
.equ LIGHT_SIZE,        16

! A polygon model (poly_draw_model, light_shade_model)
.equ MODEL_POINTS,      0       ! vectors
.equ MODEL_NUM_POINTS,  4
.equ MODEL_POLYGONS,    8       ! 4 vertex references per polygon
.equ MODEL_NUM_POLYGONS, 12
.equ MODEL_UNK16,       16
.equ MODEL_NORMALS,     20      ! one vector per point

! rand_state
.equ RAND_VALUE,        0
.equ RAND_SEED,         4
