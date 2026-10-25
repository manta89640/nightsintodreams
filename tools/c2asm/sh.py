"""SH-2 backend: dialect statements -> instructions -> GNU as source.

Instruction selection is a fixed table (one statement, one instruction or a short
fixed sequence); nothing is reordered and no register is ever chosen by the
compiler. Literal pools follow Hitachi asmsh's automatic pool rules (Hitachi
SuperH RISC Engine Assembler manual, section 9):

- `rN = <literal>` that does not fit `mov #imm` becomes an extended instruction
  (`MOV.W #imm,Rn` / `MOV.L #imm,Rn`) whose literal goes to the next pool point;
- a pool point follows each unconditional branch (bra, jmp, rts, rte, braf) and its
  delay slot, unless the slot carries a label or `__nopool;` follows;
- in a pool, word literals come first, then H'0000 alignment, then longwords, and
  equal literals of the same size share a slot.
"""
from .lang import REGS, S32, SFX, Error, Struct, Type

UNCOND = ("bra", "jmp", "rts", "rte", "braf")


class Gen:
    """Statements -> items:
    ("section", name) ("func", name) ("end", name) ("label", gasname) ("object", name)
    ("i", text) instruction, ("lit", size, gas expr, reg) extended instruction,
    ("raw", text) data directive, ("nopool",)."""

    def __init__(self, p, tree):
        self.p = p
        self.tree = tree
        self.items = []
        self.n = 0
        self.locals = set()
        self.objects = set()
        self.collect_labels(tree)

    # -- labels: every `name:` in the file is local to the file
    def collect_labels(self, node):
        if isinstance(node, tuple):
            if node and node[0] == "label" and isinstance(node[1], str):
                if node[1] in self.locals:
                    raise Error("label %s defined twice" % node[1])
                self.locals.add(node[1])
            elif node and node[0] == "slotlabel":
                self.locals.add(node[1])
            elif node and node[0] == "object" and isinstance(node[1], str):
                self.objects.add(node[1])
            for x in node:
                self.collect_labels(x)
        elif isinstance(node, list):
            for x in node:
                self.collect_labels(x)

    def lab(self, name):
        return ".L" + name if name in self.locals else name

    def err(self, line, msg):
        raise Error("line %s: %s" % (line, msg))

    def emit(self, text):
        self.items.append(("i", text))

    def new_label(self, hint):
        self.n += 1
        name = "_%s_%d" % (hint, self.n)
        self.locals.add(name)
        return name

    # -- operands
    def reg_of(self, e):
        """(reg, Type) if e names a register (raw, alias, or a cast of one)."""
        if e[0] == "name":
            n = e[1]
            if n in self.aliases:
                return self.aliases[n]
            if n in REGS:
                return n, S32
        if e[0] == "cast" and not e[1].ptr and self.reg_of(e[2]):
            return self.reg_of(e[2])[0], e[1]
        if e[0] == "cast" and e[1].ptr and self.reg_of(e[2]):
            return self.reg_of(e[2])[0], e[1]
        return None

    def rname(self, e):
        r = self.reg_of(e)
        return r[0] if r else None

    def const(self, e):
        if e[0] == "num":
            return e[1]
        if e[0] == "neg":
            v = self.const(e[1])
            return None if v is None else -v
        if e[0] == "cast" and not e[1].ptr:
            v = self.const(e[2])
            if v is None:
                return None
            bits = 8 * e[1].size()
            v &= (1 << bits) - 1
            if e[1].signed() and v >> (bits - 1):
                v -= 1 << bits
            return v
        return None

    def gas_expr(self, e):
        """An assembler expression for a literal or data value."""
        k = e[0]
        if k == "num":
            return e[2]
        if k == "addr":
            return self.gas_expr(e[1])
        if k == "name":
            if e[1] in REGS or e[1] in self.p.gbr:
                raise Error("%s is not a constant" % e[1])
            return self.lab(e[1])
        if k == "bin" and e[1] in "+-":
            return "%s %s %s" % (self.gas_expr(e[2]), e[1], self.gas_expr(e[3]))
        if k == "neg":
            return "-" + self.gas_expr(e[1])
        if k == "cast" and not e[1].ptr:
            return self.gas_expr(e[2])
        raise Error("not an assembler constant")

    def is_symbolic(self, e):
        """&sym, a function name, or sym +/- constant (what MOV.L #sym,Rn takes)."""
        if e[0] == "addr":
            return True
        if e[0] == "name":
            return e[1] not in REGS and e[1] not in self.p.externs and e[1] not in self.p.gbr \
                and e[1] not in self.aliases and e[1] not in ("T", "sr", "gbr", "vbr", "mach", "macl", "pr")
        if e[0] == "bin" and e[1] in "+-":
            return self.is_symbolic(e[2]) and self.const(e[3]) is not None
        return False

    def mem(self, e):
        """Memory operand: (operand text, accessed Type, data register rule) or None.
        Rules: "r0" = data must be r0, "not r0", "pc" = PC-relative (loads only)."""
        if e[0] == "deref":
            inner, ty = e[1], None
            if inner[0] == "cast":
                ty, inner = inner[1], inner[2]
            if inner[0] in ("postinc", "predec"):
                r = self.reg_of(inner[1])
                if not r:
                    return None
                ty = ty or r[1]
                return "@%s%s%s" % ("-" if inner[0] == "predec" else "", r[0],
                                   "+" if inner[0] == "postinc" else ""), ty.deref(), inner[0]
            if inner[0] == "addr" and inner[1][0] == "name" and \
                    (inner[1][1] in self.locals or inner[1][1] in self.objects):
                if ty is None:
                    raise Error("PC-relative load needs a type: *(s32 *)&label")
                return self.lab(inner[1][1]), ty.deref(), "pc"
            if inner[0] == "bin" and inner[1] == "+":
                a, b = inner[2], inner[3]
                if a == ("name", "gbr"):
                    if b == ("name", "r0"):
                        return "@(r0,gbr)", (ty or Type("u8", 1)).deref(), "gbr_r0"
                    d = self.const(b)
                    if d is not None:
                        return "@(%d,gbr)" % d, ty.deref(), ("gbr", d)
                ra, rb, d = self.reg_of(a), self.reg_of(b), self.const(b)
                if ra and rb and ra[0] == "r0":
                    return "@(r0,%s)" % rb[0], (ty or rb[1]).deref(), None
                if ra and d is not None:
                    return "@(%d,%s)" % (d, ra[0]), (ty or ra[1]).deref(), ("disp", d)
            r = self.reg_of(inner)
            if r:
                return "@%s" % r[0], (ty or r[1]).deref(), None
            return None
        if e[0] == "arrow":
            r = self.reg_of(e[1])
            if r is None:
                raise Error("-> needs a register on the left")
            st = r[1].deref().base
            if not isinstance(st, Struct) or e[2] not in st.fields:
                raise Error("no field %s in %r" % (e[2], r[1]))
            off, fty = st.fields[e[2]]
            size = fty.size()
            if off > 15 * size or off % size:
                # out of @(disp,rN) range: the fixed expansion is mov #off,r0 + @(r0,rN)
                if off > 127:
                    raise Error("field %s at %d needs more than one instruction" % (e[2], off))
                self.pre = ["mov\t#%d,r0" % off]
                return "@(r0,%s)" % r[0], fty, "not r0"
            return "@(%d,%s)" % (off, r[0]), fty, ("disp", off)
        if e[0] == "name" and e[1] in self.p.gbr:
            off, ty = self.p.gbr[e[1]]
            return "@(%d,gbr)" % off, ty, ("gbr", off)
        return None

    @staticmethod
    def check_disp(rule, size, data_reg, line, gen):
        if isinstance(rule, tuple):
            kind, d = rule
            limit = (1020 if size == 4 else 255 * size) if kind == "gbr" else 15 * size
            if d < 0 or d > limit or d % size:
                gen.err(line, "displacement %d out of range for mov.%s" % (d, SFX[size]))
            if (kind == "gbr" or size < 4) and data_reg != "r0":
                gen.err(line, "this form only moves r0")
        elif rule == "not r0" and data_reg == "r0":
            gen.err(line, "r0 is the index register here")

    # -- statements
    def assign(self, s, single=False):
        _, op, lhs, rhs, line = s
        start = len(self.items)
        self.pre = []
        self._assign(op, lhs, rhs, line)
        if single and (len(self.items) - start != 1 or self.items[-1][0] != "i"):
            self.err(line, "a delay slot needs a statement that is exactly one instruction")

    SYS = {"sr": "ldc", "gbr": "ldc", "vbr": "ldc", "mach": "lds", "macl": "lds", "pr": "lds"}

    def _assign(self, op, lhs, rhs, line):
        L = self.emit
        d = self.reg_of(lhs)
        if lhs == ("name", "T") and op == "=":
            v = self.const(rhs)
            if v in (0, 1):
                return L("sett" if v else "clrt")
            if rhs[0] == "intr" and rhs[1] == "__tas":
                return L("tas.b\t@%s" % self.rname(rhs[2][0]))
            ins, sense = self.cond(rhs, line)
            if not sense:
                self.err(line, "T = <condition> must not need inverting (write the other form)")
            for i in ins:
                L(i)
            return
        if lhs[0] == "name" and lhs[1] in self.SYS and op == "=":
            sr = lhs[1]
            s = self.reg_of(rhs)
            if s and rhs[0] == "name":
                return L("%s\t%s,%s" % (self.SYS[sr], s[0], sr))
            m = self.mem(rhs)
            if m and m[2] == "postinc":
                return L("%s.l\t%s,%s" % (self.SYS[sr], m[0], sr))
            if sr == "macl" and rhs[0] == "bin" and rhs[1] == "*":
                a, b = rhs[2], rhs[3]
                if a[0] == "cast" and b[0] == "cast" and a[1].size() == 2 and b[1].size() == 2:
                    mn = "muls.w" if a[1].signed() else "mulu.w"
                    return L("%s\t%s,%s" % (mn, self.rname(b), self.rname(a)))
                if self.reg_of(a) and self.reg_of(b):
                    return L("mul.l\t%s,%s" % (self.rname(b), self.rname(a)))
            self.err(line, "no single instruction for this %s assignment" % sr)
        if lhs == ("name", "mac") and op in ("=", "+="):
            if op == "=" and self.const(rhs) == 0:
                return L("clrmac")
            if op == "=" and rhs[0] == "bin" and rhs[1] == "*" and rhs[2][0] == "cast" and rhs[2][1].size() == 8:
                mn = "dmuls.l" if rhs[2][1].signed() else "dmulu.l"
                return L("%s\t%s,%s" % (mn, self.rname(rhs[3]), self.rname(rhs[2][2])))
            self.err(line, "no single instruction for this mac assignment")
        if op != "=":
            return self.compound(op, lhs, rhs, d, line)
        if d:
            return self.to_reg(d, rhs, line)
        m = self.mem(lhs)
        if m:
            text, ty, rule = m
            size = ty.size()
            s = self.reg_of(rhs)
            if rule == "pc":
                self.err(line, "PC-relative stores do not exist")
            if rule == "postinc":
                self.err(line, "@rN+ is load-only")
            if rhs[0] == "name" and rhs[1] in ("sr", "gbr", "vbr", "mach", "macl", "pr"):
                if rule != "predec" or size != 4:
                    self.err(line, "system registers are only stored with *(s32 *)--rN")
                mn = "stc.l" if rhs[1] in ("sr", "gbr", "vbr") else "sts.l"
                return L("%s\t%s,%s" % (mn, rhs[1], text))
            if not s:
                self.err(line, "stores need a register on the right")
            self.check_disp(rule, size, s[0], line, self)
            for i in self.pre:
                L(i)
            return L("mov.%s\t%s,%s" % (SFX[size], s[0], text))
        self.err(line, "cannot assign to this")

    def to_reg(self, d, rhs, line):
        L = self.emit
        rd = d[0]
        s = self.reg_of(rhs)
        if s and rhs[0] == "name":
            return L("mov\t%s,%s" % (s[0], rd))
        if rhs == ("name", "T"):
            return L("movt\t%s" % rd)
        if rhs[0] == "name" and rhs[1] in ("sr", "gbr", "vbr", "mach", "macl", "pr"):
            return L("%s\t%s,%s" % ("stc" if rhs[1] in ("sr", "gbr", "vbr") else "sts", rhs[1], rd))
        if rhs[0] == "cast" and s and not rhs[1].ptr and rhs[1].size() in (1, 2):
            kind = ("exts" if rhs[1].signed() else "extu") + "." + SFX[rhs[1].size()]
            return L("%s\t%s,%s" % (kind, s[0], rd))
        if rhs[0] in ("neg", "not") and self.reg_of(rhs[1]):
            return L("%s\t%s,%s" % (rhs[0], self.rname(rhs[1]), rd))
        if rhs[0] == "bin" and rhs[1] == ">>" and rhs[2][0] == "cast" and not rhs[2][1].signed() \
                and self.rname(rhs[2]) == rd:
            k = self.const(rhs[3])
            names = {1: "", 2: "2", 8: "8", 16: "16"}
            if k not in names:
                self.err(line, "shlr by %s is not one instruction" % k)
            return L("shlr%s\t%s" % (names[k], rd))
        if rhs[0] == "bin" and rhs[1] == ">>" and self.rname(rhs[2]) == rd and self.const(rhs[3]) == 1:
            return L("shar\t%s" % rd)
        if rhs[0] == "intr":
            return self.value_intrinsic(rd, rhs, line)
        v = self.const(rhs)
        if v is not None:
            if -128 <= v <= 127:
                return L("mov\t#%d,%s" % (v, rd))
            size = 2 if -32768 <= v <= 32767 else 4
            return self.items.append(("lit", size, self.gas_expr(rhs), rd))
        if self.is_symbolic(rhs):
            return self.items.append(("lit", 4, self.gas_expr(rhs), rd))
        if rhs[0] == "name" and rhs[1] in self.p.externs:
            # extern scalar: the destination doubles as the address register
            ty = self.p.externs[rhs[1]]
            self.items.append(("lit", 4, rhs[1], rd))
            return L("mov.%s\t@%s,%s" % (SFX[ty.size()], rd, rd))
        m = self.mem(rhs)
        if m:
            text, ty, rule = m
            size = ty.size()
            if rule == "pc":
                if size == 1:
                    self.err(line, "there is no PC-relative byte load")
                return L("mov.%s\t%s,%s" % (SFX[size], text, rd))
            if rule == "predec":
                self.err(line, "@-rN is store-only")
            if rule == "gbr_r0":
                self.err(line, "@(r0,gbr) only takes and/or/xor/tst.b")
            if rule != "not r0":    # loading into the index register is fine
                self.check_disp(rule, size, rd, line, self)
            for i in self.pre:
                L(i)
            return L("mov.%s\t%s,%s" % (SFX[size], text, rd))
        self.err(line, "no single instruction for this assignment")

    def value_intrinsic(self, rd, e, line):
        name, args = e[1], e[2]
        regs = [self.rname(a) for a in args]
        L = self.emit
        if name in ("__w", "__l"):
            return self.items.append(("lit", 2 if name == "__w" else 4, self.gas_expr(args[0]), rd))
        if name == "__mova":
            if rd != "r0":
                self.err(line, "mova only loads r0")
            return L("mova\t%s,r0" % self.gas_expr(args[0]))
        if name in ("__addc", "__subc", "__addv", "__subv"):
            if regs[0] != rd:
                self.err(line, "%s(rn, rm) must assign to rn" % name)
            return L("%s\t%s,%s" % (name[2:], regs[1], rd))
        if name in ("__negc", "__swapb", "__swapw"):
            mn = {"__negc": "negc", "__swapb": "swap.b", "__swapw": "swap.w"}[name]
            return L("%s\t%s,%s" % (mn, regs[0], rd))
        if name == "__xtrct":
            if regs[1] != rd:
                self.err(line, "__xtrct(rm, rn) must assign to rn")
            return L("xtrct\t%s,%s" % (regs[0], rd))
        if name in ("__shal", "__rotl", "__rotr", "__rotcl", "__rotcr"):
            if regs[0] != rd:
                self.err(line, "%s(rn) must assign to rn" % name)
            return L("%s\t%s" % (name[2:], rd))
        self.err(line, "unknown intrinsic %s" % name)

    def compound(self, op, lhs, rhs, d, line):
        L = self.emit
        if not d:
            m = self.mem(lhs)
            v = self.const(rhs)
            if m and m[2] == "gbr_r0" and op in ("&=", "|=", "^=") and v is not None:
                mn = {"&=": "and.b", "|=": "or.b", "^=": "xor.b"}[op]
                return L("%s\t#%d,@(r0,gbr)" % (mn, v & 0xFF))
            self.err(line, "compound assignment needs a register on the left")
        v = self.const(rhs)
        s = self.reg_of(rhs)
        if op in ("+=", "-=") and v is not None:
            v = v if op == "+=" else -v
            if not -128 <= v <= 127:
                self.err(line, "add #imm is limited to -128..127")
            return L("add\t#%d,%s" % (v, d[0]))
        if op == "<<=" and v is not None:
            names = {1: "", 2: "2", 8: "8", 16: "16"}
            if v not in names:
                self.err(line, "shift by %d is not one instruction" % v)
            return L("shll%s\t%s" % (names[v], d[0]))
        if op == ">>=" and v is not None:
            if d[1].signed():
                if v != 1:
                    self.err(line, "arithmetic shift right is only by 1")
                return L("shar\t%s" % d[0])
            names = {1: "", 2: "2", 8: "8", 16: "16"}
            if v not in names:
                self.err(line, "shift by %d is not one instruction" % v)
            return L("shlr%s\t%s" % (names[v], d[0]))
        mn = {"+=": "add", "-=": "sub", "&=": "and", "|=": "or", "^=": "xor"}.get(op)
        if mn and s:
            return L("%s\t%s,%s" % (mn, s[0], d[0]))
        if mn in ("and", "or", "xor") and v is not None and d[0] == "r0":
            if not 0 <= v <= 255:
                self.err(line, "%s #imm is limited to 0..255" % mn)
            return L("%s\t#%d,r0" % (mn, v))
        self.err(line, "no single instruction for %s" % op)

    def unsigned(self, e):
        r = self.reg_of(e)
        return bool(r) and not r[1].signed()

    def cond(self, c, line):
        """-> (instructions, sense): T == sense means the condition holds."""
        if c == ("name", "T"):
            return [], True
        if c[0] == "lnot":
            r = self.reg_of(c[1])
            if r and c[1][0] == "name":
                return ["tst\t%s,%s" % (r[0], r[0])], True
            ins, sense = self.cond(c[1], line)
            return ins, not sense
        if c[0] == "intr" and c[1] == "__cmpstr":
            return ["cmp/str\t%s,%s" % (self.rname(c[2][1]), self.rname(c[2][0]))], True
        if c[0] != "bin":
            r = self.reg_of(c)
            if r:
                return ["tst\t%s,%s" % (r[0], r[0])], False
            self.err(line, "unsupported condition")
        op, a, b = c[1], c[2], c[3]
        vb = self.const(b)
        if op in ("==", "!="):
            eq = op == "=="
            if a[0] == "bin" and a[1] == "&" and vb == 0:
                x, y = self.reg_of(a[2]), self.reg_of(a[3])
                vy = self.const(a[3])
                if x and y:
                    return ["tst\t%s,%s" % (y[0], x[0])], eq
                if x and x[0] == "r0" and vy is not None:
                    return ["tst\t#%d,r0" % vy], eq
                m = self.mem(a[2])
                if m and m[2] == "gbr_r0" and vy is not None:
                    return ["tst.b\t#%d,@(r0,gbr)" % vy], eq
            if a[0] == "predec" and vb == 0:
                return ["dt\t%s" % self.rname(a[1])], eq
            ra, rb = self.reg_of(a), self.reg_of(b)
            if ra and ra[0] == "r0" and vb is not None:
                return ["cmp/eq\t#%d,r0" % vb], eq
            if ra and vb == 0:
                self.err(line, "write !%s (tst) instead of %s == 0" % (ra[0], ra[0]))
            if ra and rb:
                return ["cmp/eq\t%s,%s" % (rb[0], ra[0])], eq
            self.err(line, "unsupported comparison")
        ra, rb = self.reg_of(a), self.reg_of(b)
        if ra and vb == 0 and not self.unsigned(a):
            return {">": (["cmp/pl\t%s" % ra[0]], True), ">=": (["cmp/pz\t%s" % ra[0]], True),
                    "<=": (["cmp/pl\t%s" % ra[0]], False), "<": (["cmp/pz\t%s" % ra[0]], False)}[op]
        if ra and rb:
            uns = self.unsigned(a) or self.unsigned(b)
            gt, ge = ("cmp/hi", "cmp/hs") if uns else ("cmp/gt", "cmp/ge")
            return {">": (["%s\t%s,%s" % (gt, rb[0], ra[0])], True),
                    ">=": (["%s\t%s,%s" % (ge, rb[0], ra[0])], True),
                    "<": (["%s\t%s,%s" % (gt, ra[0], rb[0])], True),
                    "<=": (["%s\t%s,%s" % (ge, ra[0], rb[0])], True)}[op]
        self.err(line, "unsupported comparison")

    def branch(self, sense, target, slot, line):
        mn = "bt" if sense else "bf"
        if slot is not None:
            self.emit("%s/s\t%s" % (mn, self.lab(target)))
            self.slot_stmt(slot, line)
        else:
            self.emit("%s\t%s" % (mn, self.lab(target)))

    def delayed(self, text, slot, line):
        self.emit(text)
        if slot is None:
            self.emit("nop")
        else:
            self.slot_stmt(slot, line)

    def slot_stmt(self, s, line):
        if s[0] == "slotlabel":
            self.items.append(("label", self.lab(s[1])))
            s = s[2]
        start = len(self.items)
        if s[0] == "assign":
            self.assign(s, single=True)
        else:
            self.stmt(s)
        if len(self.items) - start != 1 or self.items[-1][0] != "i":
            self.err(line, "a delay slot needs a statement that is exactly one instruction")

    def call(self, c, slot, tail, line):
        if c[0] == "bsr":
            return self.delayed("%s\t%s" % ("bra" if tail else "bsr", self.lab(c[1])), slot, line)
        reg = c[1] if c[0] == "reg" else "r0"
        if c[0] == "sym":
            self.items.append(("lit", 4, self.lab(c[1]), "r0"))
        self.delayed("%s\t@%s" % ("jmp" if tail else "jsr", reg), slot, line)

    @staticmethod
    def ends_flow(b):
        if b[0] == "block":
            return bool(b[1]) and Gen.ends_flow(b[1][-1])
        return b[0] in ("return", "goto")

    PUSH = {"pr": "sts.l", "mach": "sts.l", "macl": "sts.l", "gbr": "stc.l", "sr": "stc.l", "vbr": "stc.l"}
    POP = {"pr": "lds.l", "mach": "lds.l", "macl": "lds.l", "gbr": "ldc.l", "sr": "ldc.l", "vbr": "ldc.l"}

    def intrinsic(self, s):
        _, name, args, slot, line = s
        regs = [self.rname(a) for a in args]
        L = self.emit
        simple = {"__nop": "nop", "__sleep": "sleep", "__div0u": "div0u"}
        if name in simple:
            return L(simple[name])
        if name == "__trapa":
            return L("trapa\t#%d" % self.const(args[0]))
        if name in ("__div0s", "__div1"):
            return L("%s\t%s,%s" % (name[2:], regs[0], regs[1]))
        if name in ("__macl", "__macw"):
            return L("mac.%s\t@%s+,@%s+" % (name[-1], regs[0], regs[1]))
        if name == "__rte":
            return self.delayed("rte", slot, line)
        if name in ("__braf", "__bsrf"):
            return self.delayed("%s\t%s" % (name[2:], regs[0]), slot, line)
        self.err(line, "unknown intrinsic %s" % name)

    def data(self, items):
        for it in items:
            if it[0] == "label":
                self.items.append(("label", self.lab(it[1])))
            elif it[0] == "object":
                self.items.append(("object", it[1]))
            elif it[0] == "asciz":
                self.items.append(("raw", ".asciz %s" % it[1]))
            else:
                d = {1: ".byte", 2: ".short", 4: ".long"}[it[1]]
                self.items.append(("raw", "%s %s" % (d, ", ".join(self.gas_expr(v) for v in it[2]))))

    def stmt(self, s):
        k = s[0]
        if k == "block":
            for x in s[1]:
                self.stmt(x)
        elif k == "decl":
            pass
        elif k == "label":
            self.items.append(("label", self.lab(s[1])))
        elif k == "object":
            self.items.append(("object", s[1]))
        elif k == "data":
            self.data(s[1])
        elif k == "assign":
            self.assign(s)
        elif k == "goto":
            if isinstance(s[1], tuple):
                self.delayed("jmp\t@%s" % self.p.resolve(s[1][1]), s[2], s[3])
            else:
                self.delayed("bra\t%s" % self.lab(s[1]), s[2], s[3])
        elif k == "return":
            if s[1] is None:
                self.delayed("rts", s[2], s[3])
            else:
                self.call(s[1], s[2], True, s[3])
        elif k == "call":
            self.call(s[1], s[2], False, s[3])
        elif k in ("push", "pop"):
            r = s[1]
            if k == "push":
                self.emit("%s\t%s,@-r15" % (self.PUSH[r], r) if r in self.PUSH else "mov.l\t%s,@-r15" % r)
            else:
                self.emit("%s\t@r15+,%s" % (self.POP[r], r) if r in self.POP else "mov.l\t@r15+,%s" % r)
        elif k == "nopool":
            self.items.append(("nopool",))
        elif k == "intrinsic":
            self.intrinsic(s)
        elif k == "if":
            _, c, slot, then, other, line = s
            ins, sense = self.cond(c, line)
            for i in ins:
                self.emit(i)
            body = then[1]
            if len(body) == 1 and body[0][0] == "goto" and not isinstance(body[0][1], tuple) \
                    and body[0][2] is None and other is None:
                return self.branch(sense, body[0][1], slot, line)
            l_else = self.new_label("else" if other else "endif")
            self.branch(not sense, l_else, slot, line)
            self.stmt(then)
            if other is not None:
                l_end = self.new_label("endif")
                if not self.ends_flow(then):
                    self.delayed("bra\t%s" % self.lab(l_end), None, line)
                self.items.append(("label", self.lab(l_else)))
                self.stmt(other)
                self.items.append(("label", self.lab(l_end)))
            else:
                self.items.append(("label", self.lab(l_else)))
        elif k == "while":
            _, c, body, line = s
            top, end = self.new_label("while"), self.new_label("wend")
            self.items.append(("label", self.lab(top)))
            ins, sense = self.cond(c, line)
            for i in ins:
                self.emit(i)
            self.branch(not sense, end, None, line)
            self.stmt(body)
            self.delayed("bra\t%s" % self.lab(top), None, line)
            self.items.append(("label", self.lab(end)))
        elif k == "do":
            _, body, c, slot, line = s
            top = self.new_label("do")
            self.items.append(("label", self.lab(top)))
            self.stmt(body)
            ins, sense = self.cond(c, line)
            for i in ins:
                self.emit(i)
            self.branch(sense, top, slot, line)
        else:
            raise Error("unhandled statement %s" % k)

    def run(self):
        self.aliases = {}
        for it in self.tree[1]:
            if it[0] == "section":
                self.items.append(it)
            elif it[0] == "data":
                self.data(it[1])
            elif it[0] == "func":
                _, name, body, line = it
                self.aliases = self.p.alias_by_func[name]
                self.items.append(("func", name))
                self.stmt(body)
                self.items.append(("end", name))
                self.aliases = {}
        return self.items


def place_pools(items):
    """Replace ("lit", ...) items by PC-relative loads plus pools (rules above)."""
    out, pending, addr = [], [], 0
    n = [0]

    def flush(around=False):
        nonlocal addr, pending
        if around:
            out.append(["i", "bra\t.Lpool_end_%d" % n[0]])
            out.append(["i", "nop"])
            addr += 4
        names = {}
        for size in (2, 4):
            group = []
            for p in pending:
                if p["size"] == size and p["expr"] not in group:
                    group.append(p["expr"])
            if not group:
                continue
            if size == 4 and addr % 4:
                out.append(("raw", ".short 0x0000"))
                addr += 2
            for g in group:
                n[0] += 1
                lab = ".Lpool_%d" % n[0]
                names[(size, g)] = lab
                out.append(("label", lab))
                out.append(("raw", "%s %s" % (".short" if size == 2 else ".long", g)))
                addr += size
        for p in pending:
            p["ref"][1] = "mov.%s\t%s,%s" % (SFX[p["size"]], names[(p["size"], p["expr"])], p["reg"])
        if around:
            out.append(("label", ".Lpool_end_%d" % n[0]))
        pending = []

    i = 0
    while i < len(items):
        it = items[i]
        k = it[0]
        if k == "section":
            if pending:
                flush(around=True)
            out.append(it)
            addr = 0
        elif k == "lit":
            ref = ["i", None]
            pending.append({"size": it[1], "expr": it[2], "reg": it[3], "ref": ref})
            out.append(ref)
            addr += 2
        elif k == "i":
            out.append(["i", it[1]])
            addr += 2
            if it[1].split("\t")[0] in UNCOND:
                # the delay slot: a label on it, or `__nopool;` after it, means no pool here
                j = i + 1
                labelled = False
                while j < len(items) and items[j][0] in ("label", "object"):
                    out.append(items[j])
                    labelled = True
                    j += 1
                if j < len(items) and items[j][0] == "lit":
                    raise Error("an extended instruction (literal load) cannot sit in a delay slot")
                if j < len(items) and items[j][0] == "i":
                    out.append(["i", items[j][1]])
                    addr += 2
                    i = j
                    nxt = items[i + 1] if i + 1 < len(items) else ("eof",)
                    if pending and not labelled and nxt[0] != "nopool":
                        flush()
                else:
                    i = j - 1
        elif k == "raw":
            out.append(it)
            addr += raw_size(it[1])
        elif k == "nopool":
            pass
        else:
            out.append(it)
        i += 1
    if pending:
        flush(around=True)
    return out


def raw_size(text):
    d, _, rest = text.partition(" ")
    if d == ".asciz":
        return len(unescape(rest.strip()[1:-1])) + 1
    count = len(split_values(rest))
    return count * {".byte": 1, ".short": 2, ".long": 4}[d]


def split_values(rest):
    return [v for v in rest.split(",") if v.strip()]


def unescape(s):
    out, i = [], 0
    while i < len(s):
        c = s[i]
        if c == "\\" and i + 1 < len(s):
            nxt = s[i + 1]
            if nxt in "01234567":
                j = i + 1
                while j < len(s) and j < i + 4 and s[j] in "01234567":
                    j += 1
                out.append(chr(int(s[i + 1:j], 8)))
                i = j
                continue
            if nxt == "x":
                j = i + 2
                while j < len(s) and s[j] in "0123456789abcdefABCDEF":
                    j += 1
                out.append(chr(int(s[i + 2:j], 16) & 0xFF))
                i = j
                continue
            out.append({"n": "\n", "t": "\t", "r": "\r", "\\": "\\", '"': '"', "b": "\b", "f": "\f"}.get(nxt, nxt))
            i += 2
            continue
        out.append(c)
        i += 1
    return "".join(out)


def emit_gas(items):
    lines = ['\t.include "macro.inc"', '\t.include "saturn.inc"']
    for it in place_pools(items):
        k = it[0]
        if k == "section":
            flags = '"ax",@progbits' if it[1].startswith(".text") else '"aw",@progbits'
            lines += ["", "\t.section %s,%s" % (it[1], flags), "\t.p2align 2", ""]
        elif k == "func":
            lines.append("\tglabel %s" % it[1])
        elif k == "end":
            lines.append("\tendlabel %s" % it[1])
        elif k == "label":
            lines.append("%s:" % it[1])
        elif k == "object":
            lines.append("\tdlabel %s" % it[1])
        elif k in ("i", "raw"):
            lines.append("\t" + it[1])
    return "\n".join(lines) + "\n"


def compile_source(src):
    from .lang import parse
    p, tree = parse(src)
    return emit_gas(Gen(p, tree).run())
