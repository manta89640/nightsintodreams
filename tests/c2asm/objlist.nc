/*
 * Object lists (unit game/0600D1A0, all six functions of its .text).
 *
 * Every object is a 16-byte node header followed by its body. Handlers run
 * with r1 = body; the handler for the next frame lives at body - 4.
 * Free nodes are chained from D_060FFFE0; D_060FFFE4 counts live objects.
 * A node whose next is <= 0 is the last in its list: -next is the offset of the
 * list's tail slot from D_060FFFA4.
 */

typedef struct Node {
    struct Node *next;      /* 0 */
    struct Node *prev;      /* 4 */
    u32 unk8;               /* 8 */
    void *handler;          /* 12 */
} Node;

typedef struct List {
    Node *head;             /* 0 */
    Node *tail;             /* 4 */
} List;

extern Node *D_060FFFE0;    /* free list */
extern s32 D_060FFFE4;      /* live object count */
extern List D_060FFFA0, D_060FFFA4, D_060FFFA8, D_060FFFB0, D_060FFFB8,
            D_060FFFC0, D_060FFFC8, D_060FFFD0, D_060FFFD8;

__section(".text.0600D1A0");

/* Unlink the object whose body is r1 and put its node on the free list.
 * Out: r2 = the following node, or -1 at the end of the list. */
void func_0600D1A0(void)
{
    register Node *node asm("r1");
    register Node *next asm("r2");
    register Node *prev asm("r3");

    r1 += -16;
    next = node->next;
    prev = node->prev;
    if (next > 0) {
        next->prev = prev;
        prev->next = next;
        r4 = &D_060FFFE0;
        r3 = *(u32 *)r4;
        *(u32 *)r4 = r1;
        node->next = r3;
        r1 += 16;
        r4 = &D_060FFFE4;
        r0 = *(s32 *)r4;
        r0 += -1;
        return slot(*(s32 *)r4 = r0);
    }
    prev->next = next;
    r2 = -r2;
    r4 = &D_060FFFA4;
    r2 += r4;
    *(u32 *)r2 = r3;
    r4 = &D_060FFFE0;
    r3 = *(u32 *)r4;
    *(u32 *)r4 = r1;
    node->next = r3;
    r1 += 16;
    r4 = &D_060FFFE4;
    r0 = *(s32 *)r4;
    r0 += -1;
    r2 = -1;
    return slot(*(s32 *)r4 = r0);
}

/* Run the handler of every object in the list at r2. A handler may delete
 * its own object (then r1 comes back as the following node's body). */
void func_0600D1F8(void)
{
    register Node *node asm("r1");

    push(pr);
    r1 = *(u32 *)r2;
loop:
    if (r1 <= 0)
        goto done;
    r0 = node->handler;
    r1 += 16;
    push(r1);
    (*r0)();
    pop(r0);
    if (r1 != r0)
        goto replaced;
next:
    r1 += -16;
    r0 = D_060FFFE0;
    if (r1 == r0)
        r1 = node->prev;
    goto loop slot(r1 = node->next);
done:
    pop(pr);
    return;
replaced:
    r1 = r0;
    goto next;
}

/* Delete every object in the list at r5. */
void func_0600D230(void)
{
    push(pr);
    r1 = *(u32 *)r5;
    while (r1 > 0) {
        r1 += 16;
        __bsr func_0600D1A0();
        r1 = r2;
    }
    pop(pr);
    return;
}

void func_0600D24A(void)
{
    push(pr);
    r5 = &D_060FFFA0;
    __bsr func_0600D230();
    r5 = &D_060FFFA8;
    __bsr func_0600D230();
    r5 = &D_060FFFB0;
    __bsr func_0600D230();
    r5 = &D_060FFFB8;
    __bsr func_0600D230();
    r5 = &D_060FFFC0;
    __bsr func_0600D230();
    r5 = &D_060FFFC8;
    __bsr func_0600D230();
    pop(pr);
    return;
}

void func_0600D290(void)
{
    push(pr);
    r5 = &D_060FFFD0;
    __bsr func_0600D230();
    pop(pr);
    r5 = &D_060FFFD8;
    return __bsr func_0600D230();
}

/* Move the object whose body is r1 to the end of list r4. */
void func_0600D2A8(void)
{
    register Node *node asm("r1");
    register Node *next asm("r2");
    register Node *prev asm("r3");
    register List *list asm("r4");
    register Node *tail asm("r8");
    register Node *after asm("r0");

    r1 += -16;
    next = node->next;
    prev = node->prev;
    if (next <= 0)
        goto last;
    next->prev = prev;
    prev->next = next;
append:
    tail = list->tail;
    node->prev = tail;
    after = tail->next;
    if (after > 0) slot(node->next = after) {
        after->prev = node;
    }
    tail->next = node;
    list->tail = node;
    return;
last:
    prev->next = next;
    r2 = -r2;
    r0 = &D_060FFFA4;
    r2 += r0;
    *(u32 *)r2 = r3;
    goto append;
}
