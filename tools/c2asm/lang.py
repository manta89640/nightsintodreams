"""The c2asm dialect: lexer, types and parser.

The dialect is C syntax over the SH-2 register file. Every statement stands for
one fixed instruction (or a short fixed sequence), so the source decides the
instruction stream exactly. See docs/c2asm.md for the language.

The parser produces plain tuples; the code generators in sh.py and portc.py
pattern-match on them.
"""
import re

REGS = {"r%d" % i for i in range(16)}
INT_TYPES = {"s8": 1, "u8": 1, "s16": 2, "u16": 2, "s32": 4, "u32": 4, "s64": 8, "u64": 8,
             "void": 0, "char": 1}
SFX = {1: "b", 2: "w", 4: "l"}


class Error(Exception):
    pass


# ---------------------------------------------------------------- lexer

TOK = re.compile(r"""
    (?P<ws>\s+|//[^\n]*|/\*.*?\*/)
  | (?P<num>0[xX][0-9a-fA-F]+|\d+)
  | (?P<id>[A-Za-z_]\w*)
  | (?P<str>"(?:\\.|[^"\\])*")
  | (?P<op><<=|>>=|->|\+\+|--|\+=|-=|&=|\|=|\^=|==|!=|<=|>=|<<|>>|&&|\|\||[{}()\[\];,=<>+\-*&|^~!:?])
""", re.S | re.X)


def lex(src):
    out, pos, line = [], 0, 1
    while pos < len(src):
        m = TOK.match(src, pos)
        if not m:
            raise Error("line %d: unexpected character %r" % (line, src[pos]))
        kind = m.lastgroup
        text = m.group()
        if kind != "ws":
            out.append((kind, text, line))
        line += text.count("\n")
        pos = m.end()
    out.append(("eof", "", line))
    return out


# ---------------------------------------------------------------- types

class Struct:
    def __init__(self, name):
        self.name, self.fields, self.size = name, {}, 0


class Type:
    def __init__(self, base, ptr=0):
        self.base, self.ptr = base, ptr   # base: int type name or Struct

    def size(self):
        if self.ptr:
            return 4
        if isinstance(self.base, Struct):
            return self.base.size
        return INT_TYPES[self.base]

    def deref(self):
        if not self.ptr:
            raise Error("dereferencing a non-pointer (%r)" % self)
        return Type(self.base, self.ptr - 1)

    def signed(self):
        """Pointers compare as signed, the way the game tests list ends (`cmp/pl`)."""
        if self.ptr:
            return True
        return isinstance(self.base, str) and self.base[0] in "sc"

    def cname(self):
        b = self.base.name if isinstance(self.base, Struct) else self.base
        return b + " " + "*" * self.ptr if self.ptr else b

    def __repr__(self):
        return self.cname()


S32 = Type("s32")   # a raw register is a signed 32-bit integer


# ---------------------------------------------------------------- AST
#
# file      ("file", [top items])
# top item  ("section", name) | ("func", name, body, line) | ("data", items)
# statement ("block", [stmts]) | ("label", name) | ("object", name)
#           ("assign", op, lhs, rhs, line) | ("call", callee, slot, line)
#           ("goto", target, slot, line)          target: name or ("reg", rN)
#           ("return", callee|None, slot, line)
#           ("if", cond, slot, then, else|None, line)
#           ("while", cond, body, line) | ("do", body, cond, slot, line)
#           ("push", reg) | ("pop", reg) | ("nopool",) | ("data", items)
#           ("intrinsic", name, args, slot, line) | ("decl",)
# callee    ("sym", name) | ("bsr", name) | ("reg", rN)
# slot      None | statement, optionally ("slotlabel", name, statement)
# data item ("label", name) | ("object", name) | ("values", size, [text]) | ("asciz", text)


class Parser:
    def __init__(self, toks):
        self.t, self.i = toks, 0
        self.structs = {}
        self.gbr = {}          # name -> (offset, Type)
        self.externs = {}      # name -> Type
        self.aliases = {}      # name -> (reg, Type), per function
        self.alias_by_func = {}
        self.items = []

    def peek(self, k=0):
        return self.t[self.i + k]

    def next(self):
        tok = self.t[self.i]
        self.i += 1
        return tok

    def accept(self, text):
        if self.peek()[1] == text:
            self.i += 1
            return True
        return False

    def expect(self, text):
        tok = self.next()
        if tok[1] != text:
            raise Error("line %d: expected %r, got %r" % (tok[2], text, tok[1]))
        return tok

    def ident(self):
        tok = self.next()
        if tok[0] != "id":
            raise Error("line %d: expected a name, got %r" % (tok[2], tok[1]))
        return tok[1]

    def is_type(self, k=0):
        tok = self.peek(k)
        return tok[1] in INT_TYPES or tok[1] in self.structs or tok[1] == "struct"

    def base_type(self):
        if self.accept("struct"):
            name = self.ident()
            return self.structs.setdefault(name, Struct(name))
        name = self.ident()
        if name in INT_TYPES:
            return name
        if name in self.structs:
            return self.structs[name]
        raise Error("unknown type %s" % name)

    def type_(self):
        self.accept("const")
        base = self.base_type()
        ptr = 0
        while self.accept("*"):
            ptr += 1
        return Type(base, ptr)

    # -- top level
    def parse(self):
        while self.peek()[0] != "eof":
            tok = self.peek()
            if self.accept("typedef"):
                self.struct_def(typedef=True)
            elif tok[1] == "struct" and self.peek(2)[1] == "{":
                self.struct_def()
            elif self.accept("__gbr"):
                self.expect("(")
                off = int(self.next()[1], 0)
                self.expect(")")
                ty = self.type_()
                self.gbr[self.ident()] = (off, ty)
                self.expect(";")
            elif self.accept("extern"):
                base = self.base_type()
                while True:
                    ptr = 0
                    while self.accept("*"):
                        ptr += 1
                    self.externs[self.ident()] = Type(base, ptr)
                    if not self.accept(","):
                        break
                self.expect(";")
            elif self.accept("__section"):
                self.expect("(")
                name = self.next()[1].strip('"')
                self.expect(")")
                self.expect(";")
                self.items.append(("section", name))
            elif tok[1] == "__data":
                self.items.append(self.data_block())
            elif tok[1] == "void":
                self.func()
            else:
                raise Error("line %d: unexpected %r" % (tok[2], tok[1]))
        return ("file", self.items)

    def struct_def(self, typedef=False):
        self.expect("struct")
        tag = self.ident() if self.peek()[0] == "id" else None
        st = self.structs.setdefault(tag, Struct(tag)) if tag else Struct(None)
        self.expect("{")
        off = 0
        while not self.accept("}"):
            ty = self.type_()
            name = self.ident()
            count = 1
            if self.accept("["):
                count = int(self.next()[1], 0)
                self.expect("]")
            self.expect(";")
            align = min(ty.size(), 4) or 1
            off = (off + align - 1) // align * align
            st.fields[name] = (off, ty)
            off += ty.size() * count
        st.size = (off + 3) // 4 * 4
        if typedef:
            name = self.ident()
            st.name = st.name or name
            self.structs[name] = st
        self.expect(";")

    def func(self):
        self.expect("void")
        name = self.ident()
        line = self.peek()[2]
        self.expect("(")
        self.accept("void")
        self.expect(")")
        self.aliases = {}
        body = self.block()
        self.alias_by_func[name] = dict(self.aliases)
        self.items.append(("func", name, body, line))

    # -- data
    DATA_SIZES = {"s8": 1, "u8": 1, "s16": 2, "u16": 2, "s32": 4, "u32": 4}

    def data_block(self):
        self.expect("__data")
        self.expect("{")
        items = []
        while not self.accept("}"):
            tok = self.peek()
            if tok[1] == "object":
                self.next()
                items.append(("object", self.ident()))
                self.expect(":")
            elif tok[0] == "id" and self.peek(1)[1] == ":":
                self.next()
                self.next()
                items.append(("label", tok[1]))
            elif tok[1] == "char":
                self.next()
                items.append(("asciz", self.next()[1]))
                self.expect(";")
            elif tok[1] in self.DATA_SIZES:
                self.next()
                size = self.DATA_SIZES[tok[1]]
                vals = [self.data_value()]
                while self.accept(","):
                    vals.append(self.data_value())
                self.expect(";")
                items.append(("values", size, vals))
            else:
                raise Error("line %d: unexpected %r in __data" % (tok[2], tok[1]))
        return ("data", items)

    def data_value(self):
        """An assembler expression: `0x12`, `-3`, `&sym`, `&sym + 4`, `&a - &b`."""
        return self.expr()

    # -- statements
    def block(self):
        self.expect("{")
        out = []
        while not self.accept("}"):
            out.append(self.stmt())
        return ("block", out)

    def body(self):
        return self.block() if self.peek()[1] == "{" else ("block", [self.stmt()])

    def slot(self):
        if not self.accept("slot"):
            return None
        self.expect("(")
        label = None
        if self.peek()[0] == "id" and self.peek(1)[1] == ":":
            label = self.next()[1]
            self.next()
        s = self.simple_stmt()
        self.expect(")")
        return ("slotlabel", label, s) if label else s

    def simple_stmt(self):
        """A statement that can sit in a delay slot: assignment, push/pop, intrinsic."""
        tok = self.peek()
        line = tok[2]
        if tok[1] in ("push", "pop"):
            self.next()
            self.expect("(")
            reg = self.next()[1]
            self.expect(")")
            return (tok[1], reg)
        if tok[1].startswith("__") and self.peek(1)[1] == "(" and tok[1] not in ("__w", "__l", "__mova") \
                and not self.is_value_intrinsic(tok[1]):
            name = self.next()[1]
            args = self.args()
            return ("intrinsic", name, args, None, line)
        return self.assignment()

    VALUE_INTRINSICS = {"__w", "__l", "__mova", "__addc", "__subc", "__addv", "__subv", "__negc",
                        "__swapb", "__swapw", "__xtrct", "__shal", "__rotl", "__rotr", "__rotcl",
                        "__rotcr", "__cmpstr", "__tas"}

    def is_value_intrinsic(self, name):
        return name in self.VALUE_INTRINSICS

    def args(self):
        self.expect("(")
        out = []
        if not self.accept(")"):
            out.append(self.expr())
            while self.accept(","):
                out.append(self.expr())
            self.expect(")")
        return out

    def assignment(self):
        line = self.peek()[2]
        lhs = self.expr()
        tok = self.next()
        if tok[1] in ("=", "+=", "-=", "&=", "|=", "^=", "<<=", ">>="):
            rhs = self.expr()
            return ("assign", tok[1], lhs, rhs, line)
        raise Error("line %d: expected an assignment, got %r" % (line, tok[1]))

    def stmt(self):
        tok = self.peek()
        line = tok[2]
        if tok[1] == "register":
            self.next()
            ty = self.type_()
            name = self.ident()
            self.expect("asm")
            self.expect("(")
            reg = self.next()[1].strip('"')
            self.expect(")")
            self.expect(";")
            self.aliases[name] = (reg, ty)
            return ("decl",)
        if tok[1] == "object":
            self.next()
            name = self.ident()
            self.expect(":")
            return ("object", name)
        if tok[0] == "id" and self.peek(1)[1] == ":":
            self.next()
            self.next()
            return ("label", tok[1])
        if tok[1] == "__data":
            return self.data_block()
        if self.accept("goto"):
            if self.accept("*"):
                target = ("reg", self.ident())
            else:
                target = self.ident()
            s = self.slot()
            self.expect(";")
            return ("goto", target, s, line)
        if self.accept("return"):
            call = None
            if self.peek()[1] not in (";", "slot"):
                call = self.callee()
            s = self.slot()
            self.expect(";")
            return ("return", call, s, line)
        if tok[1] in ("push", "pop"):
            s = self.simple_stmt()
            self.expect(";")
            return s
        if self.accept("__nopool"):
            self.expect(";")
            return ("nopool",)
        if self.accept("if"):
            self.expect("(")
            c = self.expr()
            self.expect(")")
            s = self.slot()
            if self.peek()[1] == "goto":
                self.next()
                target = self.ident()
                s2 = self.slot()
                self.expect(";")
                return ("if", c, s2 if s2 is not None else s, ("block", [("goto", target, None, line)]), None,
                        line)
            then = self.body()
            other = self.body() if self.accept("else") else None
            return ("if", c, s, then, other, line)
        if self.accept("while"):
            self.expect("(")
            c = self.expr()
            self.expect(")")
            return ("while", c, self.body(), line)
        if self.accept("do"):
            b = self.body()
            self.expect("while")
            self.expect("(")
            c = self.expr()
            self.expect(")")
            s = self.slot()
            self.expect(";")
            return ("do", b, c, s, line)
        if tok[1] == "__bsr" or (tok[0] == "id" and self.peek(1)[1] == "(" and not tok[1].startswith("__")) or \
                (tok[1] == "(" and self.peek(1)[1] == "*" and self.peek(3)[1] == ")" and self.peek(4)[1] == "("):
            call = self.callee()
            s = self.slot()
            self.expect(";")
            return ("call", call, s, line)
        if tok[1].startswith("__") and self.peek(1)[1] == "(" and not self.is_value_intrinsic(tok[1]):
            name = self.next()[1]
            args = self.args()
            s = self.slot()
            self.expect(";")
            return ("intrinsic", name, args, s, line)
        s = self.assignment()
        self.expect(";")
        return s

    def callee(self):
        if self.accept("__bsr"):
            name = self.ident()
            self.expect("(")
            self.expect(")")
            return ("bsr", name)
        if self.accept("("):
            self.expect("*")
            reg = self.resolve(self.ident())
            self.expect(")")
            self.expect("(")
            self.expect(")")
            return ("reg", reg)
        name = self.ident()
        self.expect("(")
        self.expect(")")
        return ("sym", name)

    # -- expressions (precedence climbing, C order)
    BIN = [("||",), ("&&",), ("|",), ("^",), ("&",), ("==", "!="), ("<", ">", "<=", ">="),
           ("<<", ">>"), ("+", "-"), ("*",)]

    def expr(self, level=0):
        if level == len(self.BIN):
            return self.unary()
        e = self.expr(level + 1)
        while self.peek()[1] in self.BIN[level]:
            op = self.next()[1]
            e = ("bin", op, e, self.expr(level + 1))
        return e

    def unary(self):
        tok = self.peek()
        if tok[1] in ("-", "~", "!", "*", "&"):
            self.next()
            e = self.unary()
            if tok[1] == "-" and e[0] == "num":
                return ("num", -e[1], "-" + e[2])
            return {"-": "neg", "~": "not", "!": "lnot", "*": "deref", "&": "addr"}[tok[1]], e
        if tok[1] in ("--", "++"):
            self.next()
            return ("predec" if tok[1] == "--" else "preinc", self.unary())
        if tok[1] == "(" and self.is_type(1):
            self.next()
            ty = self.type_()
            self.expect(")")
            return ("cast", ty, self.unary())
        return self.postfix()

    def postfix(self):
        e = self.primary()
        while True:
            if self.accept("->"):
                e = ("arrow", e, self.ident())
            elif self.accept("++"):
                e = ("postinc", e)
            else:
                return e

    def primary(self):
        tok = self.next()
        if tok[0] == "num":
            return ("num", int(tok[1], 0), tok[1])
        if tok[1] == "(":
            e = self.expr()
            self.expect(")")
            return e
        if tok[0] == "id":
            if self.peek()[1] == "(" and tok[1].startswith("__"):
                return ("intr", tok[1], self.args())
            return ("name", tok[1])
        raise Error("line %d: unexpected %r" % (tok[2], tok[1]))

    def resolve(self, name):
        if name in REGS:
            return name
        if name in self.aliases:
            return self.aliases[name][0]
        raise Error("%s is not a register" % name)


def parse(src):
    p = Parser(lex(src))
    tree = p.parse()
    return p, tree
