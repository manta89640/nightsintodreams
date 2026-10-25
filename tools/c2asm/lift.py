"""Lifter: generated GNU as (build/<region>/asm/game/*.s) -> c2asm dialect.

Every instruction becomes the statement the compiler maps back to it, so a lifted
unit recompiles to the same bytes. On top of that the lifter:

- turns PC-relative loads into `rN = <literal>` whenever asmsh's pool rules put
  the literal exactly where the original has it; everything else stays an
  explicit `rN = *(s32 *)&label` with the data kept in a `__data` block;
- adds `__nopool;` where the original skipped a pool point;
- merges a compare with the branch that tests it (`if (r1 > r2) goto L;`), and a
  literal function address with the call through it (`func_X();`).
"""
import re

DELAYED = {"bra", "bsr", "jmp", "jsr", "rts", "rte", "braf", "bsrf", "bt/s", "bf/s"}
UNCOND = {"bra", "jmp", "rts", "rte", "braf"}
REG = re.compile(r"^r(\d+)$")


class LiftError(Exception):
    pass


def split_ops(ops):
    out, depth, cur = [], 0, ""
    for c in ops:
        if c == "(":
            depth += 1
        elif c == ")":
            depth -= 1
        if c == "," and depth == 0:
            out.append(cur.strip())
            cur = ""
        else:
            cur += c
    if cur.strip():
        out.append(cur.strip())
    return out


def split_values(rest):
    """`.byte 1, 2` / `.long a + 4, b` operands (no strings here)."""
    return [v.strip() for v in rest.split(",") if v.strip()]


def asciz_len(text):
    from .sh import unescape
    return len(unescape(text[1:-1])) + 1


# ---------------------------------------------------------------- parsing

def parse_s(text):
    """-> [(section name, [entry])]. Entries:
    ("glabel", n) ("endlabel", n) ("object", n) ("label", n) ("ins", mn, [ops])
    ("atom", size, text) ("asciz", text)"""
    sections = []
    cur = None
    for raw in text.splitlines():
        s = raw.strip()
        if not s or s.startswith(".include") or s.startswith(".p2align"):
            continue
        if s.startswith(".section"):
            cur = []
            sections.append((s.split()[1].split(",")[0], cur))
            continue
        if cur is None:
            raise LiftError("content before the first .section: %r" % s)
        if s.endswith(":") and " " not in s:
            cur.append(("label", s[:-1]))
            continue
        head, _, rest = s.partition("\t") if "\t" in s else s.partition(" ")
        rest = rest.strip()
        if head in ("glabel", "endlabel", "dlabel"):
            cur.append(("object" if head == "dlabel" else head, rest))
        elif head in (".byte", ".short", ".long"):
            size = {".byte": 1, ".short": 2, ".long": 4}[head]
            for v in split_values(rest):
                cur.append(("atom", size, v))
        elif head == ".asciz":
            cur.append(("asciz", rest))
        elif head.startswith("."):
            raise LiftError("unhandled directive %r" % s)
        else:
            cur.append(("ins", head, split_ops(rest)))
    return sections


def entry_size(e):
    if e[0] == "ins":
        return 2
    if e[0] == "atom":
        return e[1]
    if e[0] == "asciz":
        return asciz_len(e[1])
    return 0


# ---------------------------------------------------------------- expressions

NAME = re.compile(r"0[xX][0-9a-fA-F]+|\d+|[A-Za-z_.][\w.]*")


def dialect_expr(text):
    """GNU expression text -> dialect: symbols and labels become &name."""
    def name(m):
        n = m.group()
        if re.fullmatch(r"0[xX][0-9a-fA-F]+|\d+", n):
            return n
        return "&" + (n[1:] if n.startswith(".L") else n)
    return NAME.sub(name, text)


def num(text):
    try:
        return int(text, 0)
    except ValueError:
        return None


def literal_rhs(size, text):
    """The `rN = ...` right-hand side whose default size selection gives this literal."""
    v = num(text)
    if size == 2:
        if v is not None and (-32768 <= v <= -129 or 128 <= v <= 32767):
            return text
        return "__w(%s)" % dialect_expr(text)
    if v is not None:
        return "__l(%s)" % text if -32768 <= v <= 32767 else text
    if re.fullmatch(r"[A-Za-z_.][\w.]*(\s*[-+]\s*(0[xX][0-9a-fA-F]+|\d+))?", text):
        return dialect_expr(text)
    return "__l(%s)" % dialect_expr(text)


# ---------------------------------------------------------------- instructions

def lab(n):
    return n[1:] if n.startswith(".L") else n


def lift_insn(mn, ops, lit=None):
    """-> (statement text, cond) for one non-branch instruction. cond is the
    (true, false) condition texts when the instruction only sets T."""
    def r(i):
        return ops[i]
    sx = {"b": "s8", "w": "s16", "l": "s32"}
    if mn in ("mov.b", "mov.w", "mov.l"):
        t = sx[mn[-1]]
        src, dst = ops
        if lit is not None:
            return "%s = %s;" % (dst, lit), None
        if not src.startswith("@") and not REG.match(src):
            # PC-relative load from an explicit label
            return "%s = *(%s *)&%s;" % (dst, t, lab(src)), None
        if REG.match(src):
            if dst == "@-r15" and mn == "mov.l":
                return "push(%s);" % src, None
            return "*(%s *)%s = %s;" % (t, mem_expr(dst), src), None
        if src == "@r15+" and mn == "mov.l":
            return "pop(%s);" % dst, None
        return "%s = *(%s *)%s;" % (dst, t, mem_expr(src)), None
    if mn == "mov":
        return "%s = %s;" % (ops[1], ops[0].lstrip("#")), None
    if mn == "mova":
        return "r0 = __mova(&%s);" % lab(ops[0]), None
    if mn in ("stc", "sts"):
        return "%s = %s;" % (ops[1], ops[0]), None
    if mn in ("ldc", "lds"):
        return "%s = %s;" % (ops[1], ops[0]), None
    if mn in ("stc.l", "sts.l"):
        if ops[1] == "@-r15":
            return "push(%s);" % ops[0], None
        return "*(s32 *)%s = %s;" % (mem_expr(ops[1]), ops[0]), None
    if mn in ("ldc.l", "lds.l"):
        if ops[0] == "@r15+":
            return "pop(%s);" % ops[1], None
        return "%s = *(s32 *)%s;" % (ops[1], mem_expr(ops[0])), None
    if mn == "movt":
        return "%s = T;" % r(0), None
    if mn in ("shll", "shll2", "shll8", "shll16"):
        return "%s <<= %s;" % (r(0), mn[4:] or "1"), None
    if mn in ("shlr", "shlr2", "shlr8", "shlr16"):
        return "%s = (u32)%s >> %s;" % (r(0), r(0), mn[4:] or "1"), None
    if mn == "shar":
        return "%s >>= 1;" % r(0), None
    if mn in ("shal", "rotl", "rotr", "rotcl", "rotcr"):
        return "%s = __%s(%s);" % (r(0), mn, r(0)), None
    if mn in ("add", "sub", "and", "or", "xor"):
        op = {"add": "+=", "sub": "-=", "and": "&=", "or": "|=", "xor": "^="}[mn]
        return "%s %s %s;" % (ops[1], op, ops[0].lstrip("#")), None
    if mn in ("addc", "subc", "addv", "subv"):
        return "%s = __%s(%s, %s);" % (ops[1], mn, ops[1], ops[0]), None
    if mn in ("negc", "swap.b", "swap.w"):
        name = {"negc": "negc", "swap.b": "swapb", "swap.w": "swapw"}[mn]
        return "%s = __%s(%s);" % (ops[1], name, ops[0]), None
    if mn == "xtrct":
        return "%s = __xtrct(%s, %s);" % (ops[1], ops[0], ops[1]), None
    if mn in ("neg", "not"):
        return "%s = %s%s;" % (ops[1], "-" if mn == "neg" else "~", ops[0]), None
    if mn in ("exts.b", "exts.w", "extu.b", "extu.w"):
        t = ("s" if mn[3] == "s" else "u") + ("8" if mn[-1] == "b" else "16")
        return "%s = (%s)%s;" % (ops[1], t, ops[0]), None
    if mn in ("mul.l",):
        return "macl = %s * %s;" % (ops[1], ops[0]), None
    if mn in ("muls.w", "mulu.w"):
        t = "s16" if mn == "muls.w" else "u16"
        return "macl = (%s)%s * (%s)%s;" % (t, ops[1], t, ops[0]), None
    if mn in ("dmuls.l", "dmulu.l"):
        t = "s64" if mn == "dmuls.l" else "u64"
        return "mac = (%s)%s * %s;" % (t, ops[1], ops[0]), None
    if mn in ("mac.l", "mac.w"):
        return "__mac%s(%s, %s);" % (mn[-1], ops[0][1:-1], ops[1][1:-1]), None
    if mn in ("div0s", "div1"):
        return "__%s(%s, %s);" % (mn, ops[0], ops[1]), None
    simple = {"nop": "__nop();", "sleep": "__sleep();", "div0u": "__div0u();", "clrmac": "mac = 0;",
              "clrt": "T = 0;", "sett": "T = 1;"}
    if mn in simple:
        return simple[mn], None
    if mn == "trapa":
        return "__trapa(%s);" % ops[0].lstrip("#"), None
    if mn in ("and.b", "or.b", "xor.b"):
        op = {"and.b": "&=", "or.b": "|=", "xor.b": "^="}[mn]
        return "*(u8 *)(gbr + r0) %s %s;" % (op, ops[0].lstrip("#")), None
    # T-setting instructions
    cond = t_cond(mn, ops)
    if cond is not None:
        return "T = %s;" % cond[0], cond
    raise LiftError("no dialect form for %s %s" % (mn, ",".join(ops)))


def t_cond(mn, ops):
    """(condition, negated condition) for instructions that only set T."""
    if mn == "tst":
        if ops[0].startswith("#"):
            c = "(r0 & %s)" % ops[0][1:]
            return c + " == 0", c + " != 0"
        if ops[0] == ops[1]:
            return "!%s" % ops[0], ops[0]
        c = "(%s & %s)" % (ops[1], ops[0])
        return c + " == 0", c + " != 0"
    if mn == "tst.b":
        c = "(*(u8 *)(gbr + r0) & %s)" % ops[0].lstrip("#")
        return c + " == 0", c + " != 0"
    if mn == "dt":
        return "--%s == 0" % ops[0], "--%s != 0" % ops[0]
    if mn == "cmp/eq":
        a, b = ops[1], ops[0].lstrip("#")
        return "%s == %s" % (a, b), "%s != %s" % (a, b)
    rel = {"cmp/gt": "%s > %s", "cmp/ge": "%s >= %s", "cmp/hi": "(u32)%s > (u32)%s",
           "cmp/hs": "(u32)%s >= (u32)%s"}
    if mn in rel:
        c = rel[mn] % (ops[1], ops[0])
        return c, "!(%s)" % c
    if mn == "cmp/pl":
        return "%s > 0" % ops[0], "%s <= 0" % ops[0]
    if mn == "cmp/pz":
        return "%s >= 0" % ops[0], "%s < 0" % ops[0]
    if mn == "cmp/str":
        c = "__cmpstr(%s, %s)" % (ops[1], ops[0])
        return c, "!" + c
    if mn == "tas.b":
        c = "__tas(%s)" % ops[0][1:]
        return c, "!" + c
    return None


def mem_expr(op):
    """@rN / @rN+ / @-rN / @(d,rN) / @(r0,rN) / @(d,gbr) -> dialect address."""
    m = re.fullmatch(r"@(r\d+)", op)
    if m:
        return m.group(1)
    m = re.fullmatch(r"@(r\d+)\+", op)
    if m:
        return m.group(1) + "++"
    m = re.fullmatch(r"@-(r\d+)", op)
    if m:
        return "--" + m.group(1)
    m = re.fullmatch(r"@\((-?\d+),(r\d+|gbr)\)", op)
    if m:
        return "(%s + %s)" % (m.group(2), m.group(1))
    m = re.fullmatch(r"@\(r0,(r\d+|gbr)\)", op)
    if m:
        return "(%s + r0)" % m.group(1) if m.group(1) == "gbr" else "(r0 + %s)" % m.group(1)
    raise LiftError("operand %r" % op)


def branch_stmt(mn, ops, slot, follows_sym=None):
    """Statement text for a branch/call; slot is the slot statement text or None."""
    sl = " slot(%s)" % slot.rstrip(";") if slot is not None else ""
    if mn in ("bt", "bf", "bt/s", "bf/s"):
        c = "T" if mn[1] == "t" else "!T"
        if mn.endswith("/s") and slot is None:
            sl = " slot(__nop())"
        return "if (%s) goto %s%s;" % (c, lab(ops[0]), sl)
    if mn == "bra":
        return "goto %s%s;" % (lab(ops[0]), sl)
    if mn == "bsr":
        return "__bsr %s()%s;" % (lab(ops[0]), sl)
    if mn == "jsr":
        if follows_sym:
            return "%s()%s;" % (follows_sym, sl)
        return "(*%s)()%s;" % (ops[0][1:], sl)
    if mn == "jmp":
        if follows_sym:
            return "return %s()%s;" % (follows_sym, sl)
        return "goto *%s%s;" % (ops[0][1:], sl)
    if mn == "rts":
        return "return%s;" % sl
    if mn == "rte":
        return "__rte()%s;" % sl
    if mn in ("braf", "bsrf"):
        return "__%s(%s)%s;" % (mn, ops[0], sl)
    raise LiftError(mn)


# ---------------------------------------------------------------- pools

def pool_ref(e):
    """label of a PC-relative mov.w/mov.l, else None"""
    if e[0] == "ins" and e[1] in ("mov.w", "mov.l") and len(e[2]) == 2:
        src = e[2][0]
        if not src.startswith("@") and not src.startswith("#") and not REG.match(src):
            return src
    return None


def decide_pools(entries, offs):
    """-> (auto: {entry index: literal rhs}, removed entry indices, nopool entry indices)."""
    label_at = {}
    for i, e in enumerate(entries):
        if e[0] in ("label", "object"):
            label_at[e[1]] = offs[i]
    atom_at = {}
    for i, e in enumerate(entries):
        if e[0] in ("atom", "asciz") and offs[i] not in atom_at:
            atom_at[offs[i]] = i
    labels_on = {}       # offset -> label entries
    for i, e in enumerate(entries):
        if e[0] in ("label", "object"):
            labels_on.setdefault(offs[i], []).append(i)
    # who refers to each label
    loads = {}
    other = set()
    for i, e in enumerate(entries):
        lr = pool_ref(e)
        if lr:
            loads.setdefault(lr, []).append(i)
            continue
        texts = []
        if e[0] == "ins":
            texts = e[2]
        elif e[0] == "atom":
            texts = [e[2]]
        for t in texts:
            for n in NAME.findall(t):
                if not n[0].isdigit():
                    other.add(n)
    code_offs = {offs[i] for i, e in enumerate(entries) if e[0] == "ins"}

    auto, removed, nopool = {}, set(), set()
    pending = []          # entry indices of candidate auto loads
    i = 0
    n = len(entries)
    while i < n:
        e = entries[i]
        lr = pool_ref(e)
        if lr and lr in label_at and lr not in other and entries_in_slot(entries, i) is False:
            pending.append(i)
        if e[0] == "ins" and e[1] in UNCOND:
            j = i + 1
            labelled = False
            while j < n and entries[j][0] in ("label", "object"):
                labelled = True
                j += 1
            if j < n and entries[j][0] == "ins" and not labelled:
                point = offs[j] + 2
                if pending:
                    ok = try_pool(entries, offs, point, pending, label_at, atom_at, labels_on, loads, code_offs)
                    if ok is None:
                        nopool.add(j)
                    else:
                        good, rem = ok
                        auto.update(good)
                        removed |= rem
                        pending = []
            i = j if j < n and entries[j][0] == "ins" else i + 1
            continue
        i += 1
    return auto, removed, nopool


def entries_in_slot(entries, i):
    """True if entry i is the delay slot of the previous instruction."""
    j = i - 1
    while j >= 0 and entries[j][0] in ("label", "object"):
        j -= 1
    return j >= 0 and entries[j][0] == "ins" and entries[j][1] in DELAYED


def try_pool(entries, offs, point, pending, label_at, atom_at, labels_on, loads, code_offs):
    """Pool point at `point` with candidate loads `pending`. Returns None if nothing is
    due here (the original skipped this point), else ({index: rhs}, removed indices).
    Loads that cannot be reproduced are left explicit."""
    if point in code_offs:
        due = []
    else:
        # the data block at the pool point
        end = point
        while end in atom_at:
            end += entry_size(entries[atom_at[end]])
        due = [p for p in pending if point <= label_at[pool_ref(entries[p])] < end]
    if not due:
        return None
    # asmsh flushes everything pending here; loads due later stay explicit
    lits = []   # (size, text) in pool order
    for size in (2, 4):
        for p in due:
            t = entries[atom_at.get(label_at[pool_ref(entries[p])], -1)] if \
                label_at[pool_ref(entries[p])] in atom_at else None
            if t is None or t[0] != "atom":
                return {}, set()
            key = (size, t[2])
            if (2 if entries[p][1] == "mov.w" else 4) == size and key not in lits:
                lits.append(key)
    addr = point
    place = {}
    pad = None
    for size in (2, 4):
        group = [k for k in lits if k[0] == size]
        if size == 4 and group and addr % 4:
            pad = addr
            addr += 2
        for k in group:
            place[k] = addr
            addr += size
    removed = set()
    # every due load must land on its own label, and every pool word must be one of ours
    for p in due:
        e = entries[p]
        size = 2 if e[1] == "mov.w" else 4
        tgt = label_at[pool_ref(e)]
        atom = entries[atom_at[tgt]]
        if atom[1] != size or place.get((size, atom[2])) != tgt:
            return {}, set()
    due_set = set(due)
    for (size, text), a in place.items():
        ai = atom_at.get(a)
        if ai is None or entries[ai][1] != size or entries[ai][2] != text:
            return {}, set()
        removed.add(ai)
        for li in labels_on.get(a, []):
            name = entries[li][1]
            if entries[li][0] != "label" or not set(loads.get(name, [])) <= due_set:
                return {}, set()
            removed.add(li)
    if pad is not None:
        a = pad
        while a < pad + 2:
            ai = atom_at.get(a)
            if ai is None or num(entries[ai][2]) != 0 or labels_on.get(a):
                return {}, set()
            removed.add(ai)
            a += entries[ai][1]
        if a != pad + 2:
            return {}, set()
    good = {}
    for p in due:
        e = entries[p]
        size = 2 if e[1] == "mov.w" else 4
        good[p] = literal_rhs(size, entries[atom_at[label_at[pool_ref(e)]]][2])
    return good, removed


# ---------------------------------------------------------------- output

# ---------------------------------------------------------------- structure
#
# Records of a function body: ("s", text) ("label", name) ("object", name)
# ("data", lines) ("ifgoto", taken, not_taken, target, slot) and, after
# structure(), ("if", cond, slot, then, else) ("do", body, cond, slot).
# A rewrite is only made where sh.Gen lays the block out exactly as the
# original: `if` = branch over the body, if/else = `bra` with a nop slot over the
# else part, do-while = a backward conditional branch to a label used once.

def ends_flow(recs):
    return bool(recs) and recs[-1][0] == "s" and re.match(r"(return|goto)\b", recs[-1][1]) is not None


def structure(recs, refs, stats):
    out = []
    i = 0
    while i < len(recs):
        r = recs[i]
        if r[0] == "ifgoto":
            done = forward_if(recs, i, refs, stats)
            if done:
                out.append(done[0])
                i = done[1]
                continue
        if r[0] == "label" and refs.get(r[1]) == 1:
            done = do_while(recs, i, refs, stats)
            if done:
                out.append(done[0])
                i = done[1]
                continue
        out.append(r)
        i += 1
    return out


def find_label(recs, start, name):
    for j in range(start, len(recs)):
        if recs[j][0] == "label" and recs[j][1] == name:
            return j
    return None


def plain(body):
    """a block can be structured if what is left in it is plain statements"""
    return all(b[0] not in ("label", "object", "data") for b in walk(body))


def walk(recs):
    for r in recs:
        yield r
        if r[0] == "if":
            yield from walk(r[3])
            yield from walk(r[4] or [])
        elif r[0] == "do":
            yield from walk(r[1])


def forward_if(recs, i, refs, stats):
    _, taken, other, target, slot = recs[i]
    if refs.get(target) != 1:
        return None
    j = find_label(recs, i + 1, target)
    if j is None or j == i + 1:
        return None
    then = recs[i + 1:j]
    # if/else: the then part ends in `goto M;` and M follows the else part
    last = then[-1]
    m = re.fullmatch(r"goto (\w+);", last[1]) if last[0] == "s" else None
    if m and refs.get(m.group(1)) == 1 and not ends_flow(then[:-1]) and len(then) > 1:
        k = find_label(recs, j + 1, m.group(1))
        if k is not None and k > j + 1:
            t = structure(then[:-1], refs, stats)
            e = structure(recs[j + 1:k], refs, stats)
            if plain(t) and plain(e):
                stats["else"] += 1
                return ("if", other, slot, t, e), k + 1
    t = structure(then, refs, stats)
    if not plain(t):
        return None
    if len(t) == 1 and t[0][0] == "s" and re.fullmatch(r"goto \w+;", t[0][1]):
        return None     # sh.Gen would turn `if (c) { goto X; }` into one branch
    stats["if"] += 1
    return ("if", other, slot, t, None), j + 1


def do_while(recs, i, refs, stats):
    name = recs[i][1]
    for j in range(i + 1, len(recs)):
        r = recs[j]
        if r[0] == "ifgoto" and r[3] == name:
            if j == i + 1:
                return None
            body = structure(recs[i + 1:j], refs, stats)
            if not plain(body):
                return None
            stats["do"] += 1
            return ("do", body, r[1], r[4]), j + 1
        if r[0] in ("label", "object", "data"):
            return None
    return None


def slot_text(slot):
    return " slot(%s)" % slot.rstrip(";") if slot else ""


def render(recs, depth, lines):
    ind = "    " * depth
    for r in recs:
        k = r[0]
        if k == "s":
            lines.append(ind + r[1])
        elif k == "label":
            lines.append("    " * (depth - 1) + "%s:" % r[1])
        elif k == "object":
            lines.append("    " * (depth - 1) + "object %s:" % r[1])
        elif k == "data":
            lines += [ind + x for x in r[1]]
        elif k == "ifgoto":
            lines.append(ind + "if (%s) goto %s%s;" % (r[1], r[3], slot_text(r[4])))
        elif k == "if":
            lines.append(ind + "if (%s)%s {" % (r[1], slot_text(r[2])))
            render(r[3], depth + 1, lines)
            if r[4]:
                lines.append(ind + "} else {")
                render(r[4], depth + 1, lines)
            lines.append(ind + "}")
        elif k == "do":
            lines.append(ind + "do {")
            render(r[1], depth + 1, lines)
            lines.append(ind + "} while (%s)%s;" % (r[2], slot_text(r[3])))


def label_refs(sections):
    """how often each label is referred to (branches, loads, data), dialect names"""
    refs = {}
    for _, entries in sections:
        for e in entries:
            texts = e[2] if e[0] == "ins" else [e[2]] if e[0] == "atom" else []
            for t in texts:
                for n in NAME.findall(t):
                    if not n[0].isdigit():
                        refs[lab(n)] = refs.get(lab(n), 0) + 1
    return refs


def lift(text, structure=True):
    out = ["/* Lifted by tools/c2asm from the generated assembly. */", ""]
    stats = {"insns": 0, "auto": 0, "explicit": 0, "nopool": 0, "if": 0, "else": 0, "do": 0}
    sections = parse_s(text)
    refs = label_refs(sections)
    for name, entries in sections:
        offs, a = [], 0
        for e in entries:
            offs.append(a)
            a += entry_size(e)
        auto, removed, nopool = decide_pools(entries, offs) if name.startswith(".text") else ({}, set(), set())
        out.append('__section("%s");' % name)
        out.append("")
        body = Body(entries, auto, removed, nopool, stats, refs if structure else None)
        out += body.emit()
    return "\n".join(out) + "\n", stats


class Body:
    def __init__(self, entries, auto, removed, nopool, stats, refs):
        self.e, self.auto, self.removed, self.nopool, self.stats = entries, auto, removed, nopool, stats
        self.refs = refs
        self.lines = []
        self.infn = False
        self.recs = []      # statements of the current function, see structure()
        self.data = []      # pending data block items

    def flush_data(self):
        if not self.data:
            return
        lines = self.data_lines()
        if self.infn:
            self.recs.append(("data", lines))
        else:
            self.lines += lines
        self.data = []

    def data_lines(self):
        ind = ""
        lines = []
        lines.append(ind + "__data {")
        cur = None
        for item in self.data:
            if item[0] in ("label", "object"):
                if cur:
                    lines.append(ind + "    " + cur[1] + ";")
                    cur = None
                lines.append(ind + ("object %s:" % item[1] if item[0] == "object" else "%s:" % lab(item[1])))
            elif item[0] == "asciz":
                if cur:
                    lines.append(ind + "    " + cur[1] + ";")
                    cur = None
                lines.append(ind + "    char %s;" % item[1])
            else:
                size, v = item[1], dialect_expr(item[2])
                t = {1: "u8", 2: "u16", 4: "u32"}[size]
                if cur and cur[0] == size and cur[2] < (16 if size == 1 else 8):
                    cur = (size, cur[1] + ", " + v, cur[2] + 1)
                else:
                    if cur:
                        lines.append(ind + "    " + cur[1] + ";")
                    cur = (size, "%s %s" % (t, v), 1)
        if cur:
            lines.append(ind + "    " + cur[1] + ";")
        lines.append(ind + "}")
        return lines

    def next_kind(self, i):
        """kind of the next non-label, non-removed entry after i"""
        j = i + 1
        while j < len(self.e) and (self.e[j][0] in ("label", "object") or j in self.removed):
            j += 1
        return self.e[j][0] if j < len(self.e) else None

    def stmt(self, text):
        self.flush_data()
        self.recs.append(("s", text))

    def ifgoto(self, taken, not_taken, target, slot):
        """`if (taken) goto target [slot(...)];` -- kept apart so structure() can
        turn it into an if block or a do-while loop"""
        self.flush_data()
        self.recs.append(("ifgoto", taken, not_taken, target, slot))

    def emit(self):
        e = self.e
        i = 0
        n = len(e)
        while i < n:
            if i in self.removed:
                i += 1
                continue
            k = e[i][0]
            if k == "glabel":
                self.flush_data()
                self.lines.append("void %s(void)" % e[i][1])
                self.lines.append("{")
                self.infn = True
                self.recs = []
            elif k == "endlabel":
                self.flush_data()
                recs = structure(self.recs, self.refs, self.stats) if self.refs is not None else self.recs
                render(recs, 1, self.lines)
                self.lines.append("}")
                self.lines.append("")
                self.infn = False
            elif k in ("label", "object"):
                if self.next_kind(i) in ("atom", "asciz"):
                    self.data.append(e[i])
                else:
                    self.flush_data()
                    rec = ("object", e[i][1]) if k == "object" else ("label", lab(e[i][1]))
                    if self.infn:
                        self.recs.append(rec)
                    else:
                        self.lines.append("object %s:" % rec[1] if k == "object" else "%s:" % rec[1])
            elif k in ("atom", "asciz"):
                self.data.append(e[i])
            else:
                if not self.infn:
                    raise LiftError("instruction outside a function")
                i = self.insn(i)
                continue
            i += 1
        self.flush_data()
        return self.lines

    def lit(self, i):
        if i in self.auto:
            self.stats["auto"] += 1
            return self.auto[i]
        if pool_ref(self.e[i]):
            self.stats["explicit"] += 1
        return None

    def insn(self, i):
        """emit the statement starting at entry i; returns the next index"""
        e = self.e
        mn, ops = e[i][1], e[i][2]
        self.stats["insns"] += 1
        if mn in DELAYED:
            j = i + 1
            slot_labels = []
            while j < len(e) and e[j][0] in ("label", "object"):
                slot_labels.append(e[j])
                j += 1
            if j >= len(e) or e[j][0] != "ins":
                raise LiftError("delay slot of %s is not an instruction" % mn)
            if e[j][1] in DELAYED:
                raise LiftError("branch in a delay slot")
            if slot_labels and (len(slot_labels) > 1 or slot_labels[0][0] != "label"):
                raise LiftError("delay slot with several labels")
            self.stats["insns"] += 1
            sl, _ = lift_insn(e[j][1], e[j][2], self.lit(j))
            if e[j][1] == "nop" and not mn.endswith("/s") and not slot_labels:
                sl = None
            elif slot_labels:
                sl = "%s: %s" % (lab(slot_labels[0][1]), sl)
            elif e[j][1] == "nop" and mn.endswith("/s"):
                sl = None
            if mn in ("bt/s", "bf/s"):
                taken, other = ("T", "!T") if mn == "bt/s" else ("!T", "T")
                self.ifgoto(taken, other, lab(ops[0]), sl or "__nop();")
            else:
                text = branch_stmt(mn, ops, sl, self.call_sugar(i))
                if text.startswith("goto *") and self.tail_call(ops[0][1:], sl):
                    text = "return (*%s)()%s" % (ops[0][1:], text[len("goto *") + len(ops[0][1:]):])
                self.stmt(text)
            if j in self.nopool:
                self.stmt("__nopool;")
                self.stats["nopool"] += 1
            return j + 1
        if mn in ("bt", "bf"):
            taken, other = ("T", "!T") if mn == "bt" else ("!T", "T")
            self.ifgoto(taken, other, lab(ops[0]), None)
            return i + 1
        # merge `T = cond;` with the conditional branch right after it
        text, cond = lift_insn(mn, ops, self.lit(i))
        if cond is not None and i + 1 < len(e) and e[i + 1][0] == "ins" and e[i + 1][1] in ("bt", "bf"):
            b = e[i + 1]
            self.stats["insns"] += 1
            taken, other = cond if b[1] == "bt" else cond[::-1]
            self.ifgoto(taken, other, lab(b[2][0]), None)
            return i + 2
        if cond is not None and i + 2 < len(e) and e[i + 1][0] == "ins" and e[i + 1][1] in ("bt/s", "bf/s") \
                and e[i + 2][0] == "ins" and e[i + 2][1] not in DELAYED:
            b, s = e[i + 1], e[i + 2]
            self.stats["insns"] += 2
            taken, other = cond if b[1] == "bt/s" else cond[::-1]
            sl, _ = lift_insn(s[1], s[2], self.lit(i + 2))
            self.ifgoto(taken, other, lab(b[2][0]), sl)
            return i + 3
        if self.merged_call(i):
            return i + 1
        self.stmt(text)
        return i + 1

    def tail_call(self, reg, slot):
        """jmp @reg reads as a tail call when PR was just restored or reg was just
        loaded with a function address (rather than a switch target)"""
        if slot and slot.startswith("pop(pr)"):
            return True
        for r in reversed(self.recs[-3:]):
            if r[0] != "s":
                return False
            if r[1] == "pop(pr);" or re.match(r"%s = &func_\w+;" % reg, r[1]):
                return True
        return False

    def merged_call(self, i):
        """an auto `r0 = &func` directly before jsr/jmp @r0 is folded into the call"""
        e = self.e
        if i not in self.auto or e[i][2][1] != "r0" or i + 1 >= len(e):
            return False
        nxt = e[i + 1]
        if nxt[0] == "ins" and nxt[1] in ("jsr", "jmp") and nxt[2][0] == "@r0" \
                and re.fullmatch(r"&[A-Za-z_]\w*", self.auto[i]):
            self.stats["auto"] += 1
            self.sugar = self.auto[i][1:]
            return True
        return False

    def call_sugar(self, i):
        s = getattr(self, "sugar", None)
        self.sugar = None
        return s
