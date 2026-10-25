"""Portable C backend.

Translates the instruction stream the SH-2 backend produces for a dialect file
(after literal pools are placed, so every address is known) into C that runs on
any host: one C function per text section, with every label as an entry point,
registers in `sh` (see tools/c2asm/rt/c2asm_rt.h) and memory behind big-endian
accessors. Branches, delay slots, T/M/Q and MAC follow the SH-2 exactly.

Addresses of symbols come from a table the caller supplies (name -> address);
the section base comes from its `.text.XXXXXXXX` name.
"""
import re

from . import sh
from .lang import parse
from .lift import split_ops

REG = re.compile(r"^r(\d+)$")
NAME = re.compile(r"0[xX][0-9a-fA-F]+|\d+|[A-Za-z_.][\w.]*")


class CError(Exception):
    pass


def layout(items):
    """-> list of sections: dict(name, base, insns [(addr, text)], labels {name: addr},
    data {addr: (size, text)}, end)"""
    secs = []
    cur = None
    addr = 0
    for it in items:
        k = it[0]
        if k == "section":
            m = re.search(r"([0-9A-Fa-f]{8})$", it[1])
            base = int(m.group(1), 16) if m else 0
            cur = {"name": it[1], "base": base, "insns": [], "labels": {}, "data": {}, "funcs": []}
            secs.append(cur)
            addr = base
            continue
        if k in ("label", "object"):
            cur["labels"][it[1]] = addr
        elif k == "func":
            cur["labels"][it[1]] = addr
            cur["funcs"].append(it[1])
        elif k == "i":
            cur["insns"].append((addr, it[1]))
            addr += 2
        elif k == "raw":
            d, _, rest = it[1].partition(" ")
            if d == ".asciz":
                addr += sh.raw_size(it[1])
            else:
                size = {".byte": 1, ".short": 2, ".long": 4}[d]
                for v in sh.split_values(rest):
                    cur["data"][addr] = (size, v.strip())
                    addr += size
        if cur is not None:
            cur["end"] = addr
    return secs


class Translator:
    def __init__(self, secs, symaddr):
        self.secs = secs
        self.sym = dict(symaddr)
        for s in secs:
            for n, a in s["labels"].items():
                self.sym[n] = a

    def value(self, text):
        """assembler expression -> C expression (symbols resolved)"""
        def name(m):
            n = m.group()
            if n[0].isdigit():
                return n + "u"
            if n not in self.sym:
                raise CError("no address for symbol %s" % n)
            return "0x%08Xu" % self.sym[n]
        return "(u32)(" + NAME.sub(name, text) + ")"

    def literal(self, sec, label, size):
        """C value of a PC-relative load from `label`"""
        a = self.sym[label]
        if a in sec["data"] and sec["data"][a][0] == size:
            v = self.value(sec["data"][a][1])
        else:
            v = "LDP%d(0x%08Xu)" % (8 * size, a)
        return "(u32)(s16)%s" % v if size == 2 else v

    def ea(self, op, size):
        """-> (setup code, address expression)"""
        m = re.fullmatch(r"@r(\d+)", op)
        if m:
            return "", "R(%s)" % m.group(1)
        m = re.fullmatch(r"@-r(\d+)", op)
        if m:
            return "R(%s) -= %d; " % (m.group(1), size), "R(%s)" % m.group(1)
        m = re.fullmatch(r"@\((\d+),r(\d+)\)", op)
        if m:
            return "", "(R(%s) + %s)" % (m.group(2), m.group(1))
        m = re.fullmatch(r"@\(r0,r(\d+)\)", op)
        if m:
            return "", "(R(0) + R(%s))" % m.group(1)
        m = re.fullmatch(r"@\((\d+),gbr\)", op)
        if m:
            return "", "(sh.gbr + %s)" % m.group(1)
        raise CError("operand %s" % op)

    def insn(self, sec, pc, text):
        """C for one non-branch instruction"""
        mn, _, rest = text.partition("\t")
        ops = split_ops(rest)

        def R(i):
            return "R(%s)" % ops[i][1:]
        sz = {"b": 1, "w": 2, "l": 4}
        if mn in ("mov.b", "mov.w", "mov.l"):
            size = sz[mn[-1]]
            src, dst = ops
            if REG.match(src):
                setup, addr = self.ea(dst, size)
                return "{ u32 sh_v = %s; %sST%d(%s, sh_v); }" % (R(0), setup, 8 * size, addr)
            if not src.startswith("@"):
                return "%s = %s;" % (R(1), self.literal(sec, src, size))
            post = re.fullmatch(r"@r(\d+)\+", src)
            ext = "(u32)(s%d)" % (8 * size) if size < 4 else ""
            if post:
                m = post.group(1)
                inc = "" if "r" + m == dst else " R(%s) += %d;" % (m, size)
                return "{ u32 sh_v = %sLD%d(R(%s));%s %s = sh_v; }" % (ext, 8 * size, m, inc, R(1))
            setup, addr = self.ea(src, size)
            return "%s%s = %sLD%d(%s);" % (setup, R(1), ext, 8 * size, addr)
        if mn == "mov":
            if ops[0].startswith("#"):
                return "%s = (u32)%s;" % (R(1), ops[0][1:])
            return "%s = %s;" % (R(1), R(0))
        if mn == "mova":
            return "R(0) = 0x%08Xu;" % self.sym[ops[0]]
        if mn in ("stc", "sts"):
            return "%s = %s;" % (R(1), self.sysreg(ops[0]))
        if mn in ("ldc", "lds"):
            return self.set_sysreg(ops[1], R(0)) + ";"
        if mn in ("stc.l", "sts.l"):
            n = ops[1][3:]
            return "R(%s) -= 4; ST32(R(%s), %s);" % (n, n, self.sysreg(ops[0]))
        if mn in ("ldc.l", "lds.l"):
            n = ops[0][2:-1]
            return "{ u32 sh_v = LD32(R(%s)); R(%s) += 4; %s; }" % (n, n, self.set_sysreg(ops[1], "sh_v"))
        if mn == "movt":
            return "%s = sh.t;" % R(0)
        if mn in ("add", "sub", "and", "or", "xor"):
            op = {"add": "+", "sub": "-", "and": "&", "or": "|", "xor": "^"}[mn]
            if ops[0].startswith("#"):
                return "%s %s= (u32)%s;" % (R(1), op, ops[0][1:])
            return "%s %s= %s;" % (R(1), op, R(0))
        if mn in ("and.b", "or.b", "xor.b"):
            op = {"and.b": "&", "or.b": "|", "xor.b": "^"}[mn]
            return "{ u32 sh_a = sh.gbr + R(0); ST8(sh_a, LD8(sh_a) %s %s); }" % (op, ops[0][1:])
        if mn == "tst.b":
            return "sh.t = (LD8(sh.gbr + R(0)) & %s) == 0;" % ops[0][1:]
        helpers = {"addc": "sh_addc", "subc": "sh_subc", "addv": "sh_addv", "subv": "sh_subv",
                   "div1": "sh_div1"}
        if mn in helpers:
            return "%s(&%s, %s);" % (helpers[mn], R(1), R(0))
        if mn == "negc":
            return "%s = sh_negc(%s);" % (R(1), R(0))
        if mn == "neg":
            return "%s = 0u - %s;" % (R(1), R(0))
        if mn == "not":
            return "%s = ~%s;" % (R(1), R(0))
        if mn in ("exts.b", "exts.w", "extu.b", "extu.w"):
            t = ("s" if mn[3] == "s" else "u") + ("8" if mn[-1] == "b" else "16")
            return "%s = (u32)(%s)%s;" % (R(1), t, R(0))
        if mn == "swap.b":
            return "%s = (%s & 0xFFFF0000u) | ((%s & 0xFFu) << 8) | ((%s >> 8) & 0xFFu);" % (
                R(1), R(0), R(0), R(0))
        if mn == "swap.w":
            return "%s = (%s << 16) | (%s >> 16);" % (R(1), R(0), R(0))
        if mn == "xtrct":
            return "%s = (%s << 16) | (%s >> 16);" % (R(1), R(0), R(1))
        if mn == "tst":
            if ops[0].startswith("#"):
                return "sh.t = (R(0) & %s) == 0;" % ops[0][1:]
            return "sh.t = (%s & %s) == 0;" % (R(1), R(0))
        if mn == "cmp/eq":
            if ops[0].startswith("#"):
                return "sh.t = R(0) == (u32)%s;" % ops[0][1:]
            return "sh.t = %s == %s;" % (R(1), R(0))
        rel = {"cmp/gt": "(s32)%s > (s32)%s", "cmp/ge": "(s32)%s >= (s32)%s", "cmp/hi": "%s > %s",
               "cmp/hs": "%s >= %s"}
        if mn in rel:
            return "sh.t = %s;" % (rel[mn] % (R(1), R(0)))
        if mn == "cmp/pl":
            return "sh.t = (s32)%s > 0;" % R(0)
        if mn == "cmp/pz":
            return "sh.t = (s32)%s >= 0;" % R(0)
        if mn == "cmp/str":
            return "sh.t = sh_cmpstr(%s, %s);" % (R(1), R(0))
        if mn == "dt":
            return "sh.t = --%s == 0;" % R(0)
        if mn == "tas.b":
            n = ops[0][2:]
            return "{ u32 sh_v = LD8(R(%s)); sh.t = sh_v == 0; ST8(R(%s), sh_v | 0x80); }" % (n, n)
        if mn in ("shll", "shal"):
            return "sh.t = %s >> 31; %s <<= 1;" % (R(0), R(0))
        if mn == "shlr":
            return "sh.t = %s & 1; %s >>= 1;" % (R(0), R(0))
        if mn == "shar":
            return "sh.t = %s & 1; %s = (u32)((s32)%s >> 1);" % (R(0), R(0), R(0))
        if mn in ("shll2", "shll8", "shll16"):
            return "%s <<= %s;" % (R(0), mn[4:])
        if mn in ("shlr2", "shlr8", "shlr16"):
            return "%s >>= %s;" % (R(0), mn[4:])
        if mn == "rotl":
            return "sh.t = %s >> 31; %s = (%s << 1) | sh.t;" % (R(0), R(0), R(0))
        if mn == "rotr":
            return "sh.t = %s & 1; %s = (%s >> 1) | (sh.t << 31);" % (R(0), R(0), R(0))
        if mn == "rotcl":
            return "{ u32 sh_c = %s >> 31; %s = (%s << 1) | sh.t; sh.t = sh_c; }" % (R(0), R(0), R(0))
        if mn == "rotcr":
            return "{ u32 sh_c = %s & 1; %s = (%s >> 1) | (sh.t << 31); sh.t = sh_c; }" % (R(0), R(0), R(0))
        if mn == "mul.l":
            return "sh.macl = %s * %s;" % (R(1), R(0))
        if mn == "muls.w":
            return "sh.macl = (u32)((s32)(s16)%s * (s32)(s16)%s);" % (R(1), R(0))
        if mn == "mulu.w":
            return "sh.macl = (u32)(u16)%s * (u32)(u16)%s;" % (R(1), R(0))
        if mn in ("dmuls.l", "dmulu.l"):
            t = "(s64)(s32)" if mn == "dmuls.l" else "(u64)"
            return "sh_setmac((u64)(%s%s * %s%s));" % (t, R(1), t, R(0))
        if mn == "mac.l":
            return "sh_macl(%s, %s);" % (ops[0][2:-1], ops[1][2:-1])
        if mn == "mac.w":
            return "sh_macw(%s, %s);" % (ops[0][2:-1], ops[1][2:-1])
        if mn == "clrmac":
            return "sh.mach = sh.macl = 0;"
        if mn == "div0s":
            return "sh.q = %s >> 31; sh.m = %s >> 31; sh.t = sh.q != sh.m;" % (R(1), R(0))
        if mn == "div0u":
            return "sh.m = sh.q = sh.t = 0;"
        if mn == "clrt":
            return "sh.t = 0;"
        if mn == "sett":
            return "sh.t = 1;"
        if mn == "nop":
            return ";"
        if mn in ("sleep", "trapa"):
            return "sh_unsupported(0x%08Xu);" % pc
        raise CError("no C for %s" % text)

    @staticmethod
    def sysreg(r):
        return {"sr": "sh_getsr()", "gbr": "sh.gbr", "vbr": "sh.vbr", "mach": "sh.mach",
                "macl": "sh.macl", "pr": "sh.pr"}[r]

    @staticmethod
    def set_sysreg(r, v):
        if r == "sr":
            return "sh_setsr(%s)" % v
        return "sh.%s = %s" % (r, v)

    def section(self, sec):
        out = []
        fname = "sec_%08X" % sec["base"]
        entries = sorted(set(sec["labels"].values()) & {a for a, _ in sec["insns"]})
        out.append("void %s(u32 entry)\n{" % fname)
        out.append("dispatch:")
        out.append("    switch (entry) {")
        for a in entries:
            out.append("    case 0x%08Xu: goto L%08X;" % (a, a))
        out.append("    default: sh_unsupported(entry); return;")
        out.append("    }")
        insns = sec["insns"]
        targets = set(entries)
        i = 0
        while i < len(insns):
            pc, text = insns[i]
            if pc in targets:
                out.append("L%08X: STEP();" % pc)
            mn, _, rest = text.partition("\t")
            ops = split_ops(rest)
            if mn in lift_delayed():
                if i + 1 >= len(insns) or insns[i + 1][0] != pc + 2:
                    raise CError("delay slot of %08X missing" % pc)
                slot_pc, slot_text = insns[i + 1]
                slot = self.insn(sec, slot_pc, slot_text)
                if slot_pc in targets:
                    # a label on the delay slot: entering there runs the slot, then falls through
                    out.append("    goto S%08X;" % pc)
                    out.append("L%08X: STEP(); %s goto F%08X;" % (slot_pc, slot, pc + 4))
                    out.append("S%08X:" % pc)
                out.append("    " + self.branch(sec, pc, mn, ops, slot))
                if slot_pc in targets:
                    out.append("F%08X:;" % (pc + 4))
                i += 2
                if i < len(insns) and insns[i][0] != pc + 4:
                    out.append("    sh_unsupported(0x%08Xu);" % (pc + 4))
                continue
            if mn in ("bt", "bf"):
                out.append("    " + self.cond_branch(sec, pc, mn, ops))
            else:
                out.append("    " + self.insn(sec, pc, text))
            i += 1
            if i < len(insns) and insns[i][0] != pc + 2:
                # execution would run on into bytes the source holds as data
                out.append("    sh_unsupported(0x%08Xu);" % (pc + 2))
        # falling off the end of the section: continue at the next address
        out.append("    sh_jump(0x%08Xu); return;" % sec["end"])
        out.append("}")
        return out

    def target(self, sec, label):
        a = self.sym[label]
        if sec["base"] <= a < sec["end"]:
            return "goto L%08X;" % a, a
        return None, a

    def branch(self, sec, pc, mn, ops, slot):
        ret = pc + 4
        if mn in ("bt/s", "bf/s"):
            local, a = self.target(sec, ops[0])
            cond = "sh.t" if mn == "bt/s" else "!sh.t"
            go = local or "{ sh_jump(0x%08Xu); return; }" % a
            return "{ int sh_c = %s; %s if (sh_c) %s }" % (cond, slot, go)
        if mn == "bra":
            local, a = self.target(sec, ops[0])
            return "{ %s %s }" % (slot, local or "sh_jump(0x%08Xu); return;" % a)
        if mn == "bsr":
            a = self.sym[ops[0]]
            return "{ sh.pr = 0x%08Xu; %s sh_call(0x%08Xu, 0x%08Xu); }" % (ret, slot, a, ret)
        if mn == "jsr":
            return "{ u32 sh_a = R(%s); sh.pr = 0x%08Xu; %s sh_call(sh_a, 0x%08Xu); }" % (
                ops[0][2:], ret, slot, ret)
        if mn == "bsrf":
            return "{ u32 sh_a = 0x%08Xu + R(%s); sh.pr = 0x%08Xu; %s sh_call(sh_a, 0x%08Xu); }" % (
                ret, ops[0][1:], ret, slot, ret)
        if mn in ("jmp", "braf"):
            a = "R(%s)" % ops[0][2:] if mn == "jmp" else "0x%08Xu + R(%s)" % (ret, ops[0][1:])
            return ("{ u32 sh_a = %s; %s if (sh_a >= 0x%08Xu && sh_a < 0x%08Xu) { entry = sh_a; goto dispatch; } "
                    "sh_jump(sh_a); return; }" % (a, slot, sec["base"], sec["end"]))
        if mn == "rts":
            return "{ u32 sh_a = sh.pr; %s sh_return(sh_a); return; }" % slot
        if mn == "rte":
            return "{ %s sh_unsupported(0x%08Xu); return; }" % (slot, pc)
        if mn in ("bt", "bf"):
            raise CError("bt/bf are not delayed")
        raise CError(mn)

    def cond_branch(self, sec, pc, mn, ops):
        local, a = self.target(sec, ops[0])
        cond = "sh.t" if mn == "bt" else "!sh.t"
        return "if (%s) %s" % (cond, local or "{ sh_jump(0x%08Xu); return; }" % a)


def lift_delayed():
    return {"bra", "bsr", "jmp", "jsr", "rts", "rte", "braf", "bsrf", "bt/s", "bf/s"}


def translate(items, symaddr):
    secs = layout(sh.place_pools(items))
    tr = Translator(secs, symaddr)
    out = ['#include "c2asm_rt.h"', ""]
    entries = []
    for sec in secs:
        if not sec["name"].startswith(".text"):
            continue
        out += tr.section(sec)
        out.append("")
        for a in sorted(set(sec["labels"].values()) & {x for x, _ in sec["insns"]}):
            entries.append((a, "sec_%08X" % sec["base"]))
    return "\n".join(out) + "\n", entries


def compile_source(src, symaddr=None):
    p, tree = parse(src)
    text, _ = translate(sh.Gen(p, tree).run(), symaddr or {})
    return text
