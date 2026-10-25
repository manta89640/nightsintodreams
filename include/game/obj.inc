/*
 * Object system (units game/0600CF6C and game/0600D1A0).
 *
 * Every object lives in a 96-byte node from a pool of 384 (obj_pool): a
 * 16-byte node header followed by an 80-byte body. Handlers run with
 * r1 = body (node + OBJ_BODY), so the header fields sit at negative offsets
 * from r1 (OBJ_HANDLER etc.). A handler picks the next frame's handler with
 *
 *     mov.l   #next_handler,r0 / mov.l r0,@-r1 / add #4,r1
 *
 * Lists are circular through their list head, which doubles as a node: the
 * first node's prev is the head, and the last node's next is a terminator
 * <= 0, the negated offset of the list from obj_list_core (0, -8, ..., -56),
 * so `cmp/pl` tells a real node from the end of the list.
 *
 * A frame runs obj_list_core, _manager, _stage, _effect and _pause in that
 * order, once with GBR_DRAW_PASS = 0 (update) and once with 1 (draw). While
 * paused only obj_list_pause runs. During loading the VBlank handlers run
 * obj_list_load_task and draw obj_list_load_scene.
 */

! Node header, from the node
.equ NODE_NEXT,         0       ! following node, or the list terminator (<= 0)
.equ NODE_PREV,         4       ! preceding node, or the list head
.equ NODE_SPAWN_SLOT,   8       ! layout spawn record, or 0
.equ NODE_HANDLER,      12      ! called each frame with r1 = body
.equ NODE_SIZE,         96

! List head
.equ LIST_HEAD,         0
.equ LIST_TAIL,         4
.equ LIST_SIZE,         8

! Node header, from the body (r1)
.equ OBJ_BODY,          16      ! node + OBJ_BODY = body
.equ OBJ_SPAWN_SLOT,    -8
.equ OBJ_HANDLER,       -4
.equ OBJ_POOL_COUNT,    384

/*
 * The object body. Fields 14..63 mean the same for most object types; the
 * OBJ_WORKnn fields are type-dependent. A unit that owns an object type
 * names them for that type in its own .equ block (e.g. FADE_LEVEL = 0).
 * Positions and velocities are 16.16 world units; 2D objects keep their
 * screen position in the high words of OBJ_X and OBJ_Y.
 */
.equ OBJ_WORK0,         0
.equ OBJ_WORK2,         2
.equ OBJ_WORK4,         4
.equ OBJ_WORK6,         6
.equ OBJ_WORK8,         8
.equ OBJ_PLAYER,        9       ! b: player index of per-player objects
.equ OBJ_WORK10,        10
.equ OBJ_WORK12,        12
.equ OBJ_WORK13,        13
.equ OBJ_ANIM_INDEX,    14      ! b: spr_anim_step position in the script
.equ OBJ_ANIM_TIMER,    15      ! b: frames left on the current frame
.equ OBJ_WORK16,        16
.equ OBJ_COLOR,         18      ! w: VDP1 colour bank (CMDCOLR)
.equ OBJ_FRAME,         20      ! w: sprite frame, indexes OBJ_GFX
.equ OBJ_ROT_X,         22      ! w: angle; sprites: scale (8.8)
.equ OBJ_ROT_Y,         24      ! w: angle; sprites: y scale
.equ OBJ_ROT_Z,         26      ! w: angle; sprites: 2D rotation
.equ OBJ_GOURAUD,       28      ! w: VDP1 gouraud table (CMDGRDA)
.equ OBJ_DRAW_FLAGS,    30      ! b: OBJ_DRAW_*
.equ OBJ_COURSE,        31      ! b: mare/course the object belongs to
.equ OBJ_VEL_X,         32
.equ OBJ_VEL_Y,         36
.equ OBJ_VEL_Z,         40
.equ OBJ_GFX,           44      ! sprite set, model or text
.equ OBJ_X,             48
.equ OBJ_Y,             52
.equ OBJ_Z,             56
.equ OBJ_COURSE_POS,    60      ! distance along the course
.equ OBJ_WORK64,        64
.equ OBJ_WORK68,        68
.equ OBJ_WORK72,        72
.equ OBJ_WORK76,        76
.equ OBJ_BODY_SIZE,     80

.equ OBJ_DRAW_PARITY,   0x01
.equ OBJ_DRAW_HIDDEN,   0x20
.equ OBJ_DRAW_DISTORT,  0x40
.equ OBJ_DRAW_CULLED,   0x80

! Level layout spawn record (NODE_SPAWN_SLOT points here)
.equ SPAWN_FLAGS,       0
.equ SPAWN_STATUS,      1       ! b: SPAWN_IDLE etc.
.equ SPAWN_RANGE_BITS,  2       ! w
.equ SPAWN_IDLE,        0       ! may (re)spawn
.equ SPAWN_ALIVE,       1
.equ SPAWN_CONSUMED,    2       ! collected or destroyed: never respawns
.equ SPAWN_REMOVED,     -2      ! expired: never respawns; other negatives: pending
