#!/usr/bin/env python3
"""SH-2 instruction decoder producing GNU as syntax.

decode(word, pc) returns an Insn, or None for encodings that are not valid SH-2.
PC-relative operands are resolved to absolute addresses (Insn.target) so callers can
substitute labels; Insn.text() renders them as "." relative expressions by default.
"""
from dataclasses import dataclass
from typing import Optional


@dataclass
class Insn:
    mnemonic: str
    ops: str = ""          # operands, with "{t}" where the target goes
    target: Optional[int] = None
    kind: str = ""         # "", "branch", "call", "jump", "ret", "pool_w", "pool_l", "mova"
    delay: bool = False    # has a delay slot
    cond: bool = False     # conditional branch (falls through)
    pc: int = 0

    def text(self, label=None):
        if self.target is not None:
            t = label if label is not None else ".%+d" % (self.target - self.pc)
            ops = self.ops.replace("{t}", t)
        else:
            ops = self.ops
        return self.mnemonic + ("\t" + ops if ops else "")


def _s8(x):
    return x - 0x100 if x & 0x80 else x


def _s12(x):
    return x - 0x1000 if x & 0x800 else x


ZERO_OPS = {
    0x0008: "clrt", 0x0009: "nop", 0x000B: "rts", 0x0018: "sett",
    0x0019: "div0u", 0x001B: "sleep", 0x0028: "clrmac", 0x002B: "rte",
}

N_ONLY = {
    # (high nibble, low byte) -> (mnemonic, operand template with {n})
    (0x0, 0x02): ("stc", "sr,r{n}"), (0x0, 0x12): ("stc", "gbr,r{n}"), (0x0, 0x22): ("stc", "vbr,r{n}"),
    (0x0, 0x0A): ("sts", "mach,r{n}"), (0x0, 0x1A): ("sts", "macl,r{n}"), (0x0, 0x2A): ("sts", "pr,r{n}"),
    (0x0, 0x29): ("movt", "r{n}"),
    (0x4, 0x00): ("shll", "r{n}"), (0x4, 0x01): ("shlr", "r{n}"),
    (0x4, 0x02): ("sts.l", "mach,@-r{n}"), (0x4, 0x03): ("stc.l", "sr,@-r{n}"),
    (0x4, 0x04): ("rotl", "r{n}"), (0x4, 0x05): ("rotr", "r{n}"),
    (0x4, 0x06): ("lds.l", "@r{n}+,mach"), (0x4, 0x07): ("ldc.l", "@r{n}+,sr"),
    (0x4, 0x08): ("shll2", "r{n}"), (0x4, 0x09): ("shlr2", "r{n}"),
    (0x4, 0x0A): ("lds", "r{n},mach"), (0x4, 0x0E): ("ldc", "r{n},sr"),
    (0x4, 0x10): ("dt", "r{n}"), (0x4, 0x11): ("cmp/pz", "r{n}"),
    (0x4, 0x12): ("sts.l", "macl,@-r{n}"), (0x4, 0x13): ("stc.l", "gbr,@-r{n}"),
    (0x4, 0x15): ("cmp/pl", "r{n}"),
    (0x4, 0x16): ("lds.l", "@r{n}+,macl"), (0x4, 0x17): ("ldc.l", "@r{n}+,gbr"),
    (0x4, 0x18): ("shll8", "r{n}"), (0x4, 0x19): ("shlr8", "r{n}"),
    (0x4, 0x1A): ("lds", "r{n},macl"), (0x4, 0x1B): ("tas.b", "@r{n}"), (0x4, 0x1E): ("ldc", "r{n},gbr"),
    (0x4, 0x20): ("shal", "r{n}"), (0x4, 0x21): ("shar", "r{n}"),
    (0x4, 0x22): ("sts.l", "pr,@-r{n}"), (0x4, 0x23): ("stc.l", "vbr,@-r{n}"),
    (0x4, 0x24): ("rotcl", "r{n}"), (0x4, 0x25): ("rotcr", "r{n}"),
    (0x4, 0x26): ("lds.l", "@r{n}+,pr"), (0x4, 0x27): ("ldc.l", "@r{n}+,vbr"),
    (0x4, 0x28): ("shll16", "r{n}"), (0x4, 0x29): ("shlr16", "r{n}"),
    (0x4, 0x2A): ("lds", "r{n},pr"), (0x4, 0x2E): ("ldc", "r{n},vbr"),
}

NM_OPS = {
    # (high nibble, low nibble) -> (mnemonic, template with {m},{n})
    (0x0, 0x4): ("mov.b", "r{m},@(r0,r{n})"), (0x0, 0x5): ("mov.w", "r{m},@(r0,r{n})"),
    (0x0, 0x6): ("mov.l", "r{m},@(r0,r{n})"), (0x0, 0x7): ("mul.l", "r{m},r{n}"),
    (0x0, 0xC): ("mov.b", "@(r0,r{m}),r{n}"), (0x0, 0xD): ("mov.w", "@(r0,r{m}),r{n}"),
    (0x0, 0xE): ("mov.l", "@(r0,r{m}),r{n}"), (0x0, 0xF): ("mac.l", "@r{m}+,@r{n}+"),
    (0x2, 0x0): ("mov.b", "r{m},@r{n}"), (0x2, 0x1): ("mov.w", "r{m},@r{n}"), (0x2, 0x2): ("mov.l", "r{m},@r{n}"),
    (0x2, 0x4): ("mov.b", "r{m},@-r{n}"), (0x2, 0x5): ("mov.w", "r{m},@-r{n}"), (0x2, 0x6): ("mov.l", "r{m},@-r{n}"),
    (0x2, 0x7): ("div0s", "r{m},r{n}"), (0x2, 0x8): ("tst", "r{m},r{n}"), (0x2, 0x9): ("and", "r{m},r{n}"),
    (0x2, 0xA): ("xor", "r{m},r{n}"), (0x2, 0xB): ("or", "r{m},r{n}"), (0x2, 0xC): ("cmp/str", "r{m},r{n}"),
    (0x2, 0xD): ("xtrct", "r{m},r{n}"), (0x2, 0xE): ("mulu.w", "r{m},r{n}"), (0x2, 0xF): ("muls.w", "r{m},r{n}"),
    (0x3, 0x0): ("cmp/eq", "r{m},r{n}"), (0x3, 0x2): ("cmp/hs", "r{m},r{n}"), (0x3, 0x3): ("cmp/ge", "r{m},r{n}"),
    (0x3, 0x4): ("div1", "r{m},r{n}"), (0x3, 0x5): ("dmulu.l", "r{m},r{n}"), (0x3, 0x6): ("cmp/hi", "r{m},r{n}"),
    (0x3, 0x7): ("cmp/gt", "r{m},r{n}"), (0x3, 0x8): ("sub", "r{m},r{n}"), (0x3, 0xA): ("subc", "r{m},r{n}"),
    (0x3, 0xB): ("subv", "r{m},r{n}"), (0x3, 0xC): ("add", "r{m},r{n}"), (0x3, 0xD): ("dmuls.l", "r{m},r{n}"),
    (0x3, 0xE): ("addc", "r{m},r{n}"), (0x3, 0xF): ("addv", "r{m},r{n}"),
    (0x4, 0xF): ("mac.w", "@r{m}+,@r{n}+"),
    (0x6, 0x0): ("mov.b", "@r{m},r{n}"), (0x6, 0x1): ("mov.w", "@r{m},r{n}"), (0x6, 0x2): ("mov.l", "@r{m},r{n}"),
    (0x6, 0x3): ("mov", "r{m},r{n}"), (0x6, 0x4): ("mov.b", "@r{m}+,r{n}"), (0x6, 0x5): ("mov.w", "@r{m}+,r{n}"),
    (0x6, 0x6): ("mov.l", "@r{m}+,r{n}"), (0x6, 0x7): ("not", "r{m},r{n}"), (0x6, 0x8): ("swap.b", "r{m},r{n}"),
    (0x6, 0x9): ("swap.w", "r{m},r{n}"), (0x6, 0xA): ("negc", "r{m},r{n}"), (0x6, 0xB): ("neg", "r{m},r{n}"),
    (0x6, 0xC): ("extu.b", "r{m},r{n}"), (0x6, 0xD): ("extu.w", "r{m},r{n}"), (0x6, 0xE): ("exts.b", "r{m},r{n}"),
    (0x6, 0xF): ("exts.w", "r{m},r{n}"),
}

IMM8_R0 = {
    0x88: ("cmp/eq", "#{i},r0", True), 0xC8: ("tst", "#{u},r0", False), 0xC9: ("and", "#{u},r0", False),
    0xCA: ("xor", "#{u},r0", False), 0xCB: ("or", "#{u},r0", False), 0xC3: ("trapa", "#{u}", False),
    0xCC: ("tst.b", "#{u},@(r0,gbr)", False), 0xCD: ("and.b", "#{u},@(r0,gbr)", False),
    0xCE: ("xor.b", "#{u},@(r0,gbr)", False), 0xCF: ("or.b", "#{u},@(r0,gbr)", False),
}

GBR_DISP = {
    0xC0: ("mov.b", "r0,@({d},gbr)", 1), 0xC1: ("mov.w", "r0,@({d},gbr)", 2), 0xC2: ("mov.l", "r0,@({d},gbr)", 4),
    0xC4: ("mov.b", "@({d},gbr),r0", 1), 0xC5: ("mov.w", "@({d},gbr),r0", 2), 0xC6: ("mov.l", "@({d},gbr),r0", 4),
}

COND_BRANCH = {0x89: ("bt", False), 0x8B: ("bf", False), 0x8D: ("bt/s", True), 0x8F: ("bf/s", True)}


def decode(w, pc=0):
    hi = w >> 12
    n = (w >> 8) & 0xF
    m = (w >> 4) & 0xF
    lo = w & 0xF
    lob = w & 0xFF

    if w in ZERO_OPS:
        mn = ZERO_OPS[w]
        if mn == "rts":
            return Insn(mn, kind="ret", delay=True, pc=pc)
        if mn == "rte":
            return Insn(mn, kind="ret", delay=True, pc=pc)
        return Insn(mn, pc=pc)

    if (hi, lob) in N_ONLY and hi in (0x0, 0x4):
        mn, t = N_ONLY[(hi, lob)]
        return Insn(mn, t.format(n=n), pc=pc)

    if hi == 0x0 and lob in (0x03, 0x23):
        return Insn("bsrf" if lob == 0x03 else "braf", "r%d" % n,
                    kind="call" if lob == 0x03 else "jump", delay=True, pc=pc)
    if hi == 0x4 and lob in (0x0B, 0x2B):
        return Insn("jsr" if lob == 0x0B else "jmp", "@r%d" % n,
                    kind="call" if lob == 0x0B else "jump", delay=True, pc=pc)

    if (hi, lo) in NM_OPS:
        mn, t = NM_OPS[(hi, lo)]
        return Insn(mn, t.format(m=m, n=n), pc=pc)

    if hi == 0x1:
        return Insn("mov.l", "r%d,@(%d,r%d)" % (m, lo * 4, n), pc=pc)
    if hi == 0x5:
        return Insn("mov.l", "@(%d,r%d),r%d" % (lo * 4, m, n), pc=pc)
    if hi == 0x7:
        return Insn("add", "#%d,r%d" % (_s8(lob), n), pc=pc)
    if hi == 0xE:
        return Insn("mov", "#%d,r%d" % (_s8(lob), n), pc=pc)

    if hi == 0x8:
        if n == 0x0:
            return Insn("mov.b", "r0,@(%d,r%d)" % (lo, m), pc=pc)
        if n == 0x1:
            return Insn("mov.w", "r0,@(%d,r%d)" % (lo * 2, m), pc=pc)
        if n == 0x4:
            return Insn("mov.b", "@(%d,r%d),r0" % (lo, m), pc=pc)
        if n == 0x5:
            return Insn("mov.w", "@(%d,r%d),r0" % (lo * 2, m), pc=pc)
        op = 0x80 | n
        if op == 0x88:
            return Insn("cmp/eq", "#%d,r0" % _s8(lob), pc=pc)
        if op in COND_BRANCH:
            mn, delay = COND_BRANCH[op]
            return Insn(mn, "{t}", target=pc + 4 + _s8(lob) * 2, kind="branch",
                        delay=delay, cond=True, pc=pc)
        return None

    if hi == 0x9:
        return Insn("mov.w", "{t},r%d" % n, target=pc + 4 + lob * 2, kind="pool_w", pc=pc)
    if hi == 0xD:
        return Insn("mov.l", "{t},r%d" % n, target=(pc & ~3) + 4 + lob * 4, kind="pool_l", pc=pc)
    if hi == 0xA:
        return Insn("bra", "{t}", target=pc + 4 + _s12(w & 0xFFF) * 2, kind="jump", delay=True, pc=pc)
    if hi == 0xB:
        return Insn("bsr", "{t}", target=pc + 4 + _s12(w & 0xFFF) * 2, kind="call", delay=True, pc=pc)

    if hi == 0xC:
        op = w >> 8
        if op == 0xC7:
            return Insn("mova", "{t},r0", target=(pc & ~3) + 4 + lob * 4, kind="mova", pc=pc)
        if op in GBR_DISP:
            mn, t, scale = GBR_DISP[op]
            return Insn(mn, t.format(d=lob * scale), pc=pc)
        if op in IMM8_R0:
            mn, t, signed = IMM8_R0[op]
            return Insn(mn, t.format(i=_s8(lob), u=lob), pc=pc)
        return None

    return None


if __name__ == "__main__":
    import struct
    import sys

    data = open(sys.argv[1], "rb").read()
    base = int(sys.argv[2], 0) if len(sys.argv) > 2 else 0
    start = int(sys.argv[3], 0) - base if len(sys.argv) > 3 else 0
    count = int(sys.argv[4], 0) if len(sys.argv) > 4 else 64
    for off in range(start, min(len(data), start + count * 2), 2):
        w = struct.unpack_from(">H", data, off)[0]
        i = decode(w, base + off)
        text = i.text(label="0x%08X" % i.target if i and i.target is not None else None) if i else ".word 0x%04X" % w
        print("%08X: %04X  %s" % (base + off, w, text))
