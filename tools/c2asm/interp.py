"""SH-2 interpreter for differential tests of the C backend.

Runs the original bytes of 0NIGHTS under the same rules as c2asm_rt (see
rt/c2asm_rt.h and rt/c2asm_rt.c): a 1 MB memory window, instructions and
PC-relative loads from the pristine image, stubs for code outside the
translated units, and an abort (Unsupported) wherever the C cannot follow:
a jump into translated code that is not an entry point, a return to an
unexpected PR, rte/sleep/trapa, MAC saturation, or the step limit.
"""
import bisect
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))
import sh2dis  # noqa: E402

M32 = 0xFFFFFFFF
SENTINEL = 0x0FFFFFF0


class Unsupported(Exception):
    pass


def s32(v):
    v &= M32
    return v - (1 << 32) if v >> 31 else v


def sext(v, bits):
    v &= (1 << bits) - 1
    return (v - (1 << bits)) & M32 if v >> (bits - 1) else v


def stub_effect(cpu, addr):
    """what an untranslated callee does (the same in c2asm_rt.c)"""
    r = cpu.r
    h = 2166136261
    for v in (addr, r[1], r[4], r[5], r[6], r[7]):
        h = ((h ^ v) * 16777619) & M32
    cpu.log.append((addr, h))
    r[0] = h
    r[2] = h ^ 0x5555


class CPU:
    def __init__(self, mem, image, image_base, entries, ranges, limit=200000, insns=None):
        self.mem = mem
        self.image, self.image_base = image, image_base
        self.entries = entries              # set of translated entry addresses
        self.ranges = sorted(ranges)        # [(start, end)] of translated sections
        self.starts = [a for a, _ in self.ranges]
        self.r = [0] * 16
        self.gbr = self.vbr = self.pr = self.mach = self.macl = 0
        self.t = self.s = self.q = self.m = self.imask = 0
        self.log = []
        self.limit = limit
        self.insns = insns      # instruction addresses of translated code (None: no check)
        self.cache = {}

    # memory
    def rd(self, a, n):
        a &= 0xFFFFF
        if a + n <= 0x100000:
            return int.from_bytes(self.mem[a:a + n], "big")
        v = 0
        for k in range(n):      # wraps byte by byte, like the C accessors
            v = v << 8 | self.mem[(a + k) & 0xFFFFF]
        return v

    def wr(self, a, n, v):
        a &= 0xFFFFF
        b = (v & ((1 << 8 * n) - 1)).to_bytes(n, "big")
        if a + n <= 0x100000:
            self.mem[a:a + n] = b
        else:
            for k in range(n):
                self.mem[(a + k) & 0xFFFFF] = b[k]

    def img(self, a, n):
        o = a - self.image_base
        return int.from_bytes(self.image[o:o + n], "big")

    def in_code(self, a):
        i = bisect.bisect_right(self.starts, a) - 1
        return i >= 0 and a < self.ranges[i][1]

    def section_end(self, a):
        i = bisect.bisect_right(self.starts, a) - 1
        return self.ranges[i][1] if i >= 0 and a < self.ranges[i][1] else None

    def decode(self, pc):
        i = self.cache.get(pc)
        if i is None:
            if self.insns is not None and pc not in self.insns and self.in_code(pc):
                raise Unsupported("executes bytes the source holds as data: %08X" % pc)
            i = sh2dis.decode(self.img(pc, 2), pc)
            if i is None:
                raise Unsupported("bad opcode at %08X" % pc)
            self.cache[pc] = i
        return i

    def getsr(self):
        return self.m << 9 | self.q << 8 | self.imask << 4 | self.s << 1 | self.t

    def setsr(self, v):
        self.m, self.q, self.imask, self.s, self.t = v >> 9 & 1, v >> 8 & 1, v >> 4 & 15, v >> 1 & 1, v & 1

    # control flow, mirroring sh_call / sh_jump / sh_return
    def run(self, entry):
        self.stack = [SENTINEL]
        self.pr = SENTINEL
        self.pc = entry
        self.steps = 0
        if entry not in self.entries:
            raise Unsupported("entry")
        while True:
            pc = self.pc
            end = self.section_end(pc)
            i = self.decode(pc)
            self.steps += 1
            if self.steps > self.limit:
                raise Unsupported("step limit")
            if i.delay:
                target = self.transfer(i, pc)
                slot = self.decode(pc + 2)
                if slot.delay or slot.mnemonic in ("bt", "bf"):
                    raise Unsupported("branch in a delay slot")
                self.exec(slot, pc + 2)
                if self.after(i, target, pc):
                    return
            elif i.mnemonic in ("bt", "bf"):
                taken = self.t == (i.mnemonic == "bt")
                self.pc = i.target if taken else pc + 2
                if taken:
                    self.goto(i.target, pc)
            else:
                self.exec(i, pc)
                self.pc = pc + 2
            if self.pc == end:
                # fell off the end of a translated section
                if self.jump(self.pc):
                    return

    def goto(self, target, pc):
        end = self.section_end(pc)
        start = self.starts[bisect.bisect_right(self.starts, pc) - 1]
        if not (start <= target < end):
            self.pc = target
            if target not in self.entries:
                raise Unsupported("branch out of section")

    def jump(self, target):
        """transfer without a return address: True if the run is over"""
        if target in self.entries:
            self.pc = target
            return False
        if self.in_code(target):
            raise Unsupported("jump into code that is not an entry point: %08X" % target)
        stub_effect(self, target)
        return self.ret(self.pr)

    def call(self, target, ret):
        if self.pr != ret:
            raise Unsupported("delay slot changed PR")
        if target in self.entries:
            self.stack.append(ret)
            self.pc = target
            return
        if self.in_code(target):
            raise Unsupported("call into code that is not an entry point: %08X" % target)
        stub_effect(self, target)
        if self.pr != ret:
            raise Unsupported("stub return")
        self.pc = ret

    def ret(self, pr):
        expected = self.stack.pop()
        if pr != expected:
            raise Unsupported("return to an unexpected address")
        if not self.stack:
            return True
        self.pc = pr
        return False

    def transfer(self, i, pc):
        mn = i.mnemonic
        if mn in ("bt/s", "bf/s"):
            return i.target if self.t == (mn == "bt/s") else None
        if mn == "rts":
            return self.pr
        if mn == "rte":
            raise Unsupported("rte")
        if mn in ("bsr", "jsr", "bsrf"):
            self.pr = pc + 4     # set before the delay slot runs
        if mn in ("bra", "bsr"):
            return i.target
        n = int(i.ops.strip("@r"))
        if mn in ("jmp", "jsr"):
            return self.r[n]
        return (pc + 4 + self.r[n]) & M32

    def after(self, i, target, pc):
        mn = i.mnemonic
        ret = pc + 4
        if mn in ("bt/s", "bf/s"):
            if target is None:
                self.pc = ret
            else:
                self.pc = target
                self.goto(target, pc)
            return False
        if mn == "bra":
            self.pc = target
            end = self.section_end(pc)
            start = self.starts[bisect.bisect_right(self.starts, pc) - 1]
            if not (start <= target < end):
                return self.jump(target)
            return False
        if mn in ("bsr", "jsr", "bsrf"):
            self.call(target, ret)
            return False
        if mn in ("jmp", "braf"):
            end = self.section_end(pc)
            start = self.starts[bisect.bisect_right(self.starts, pc) - 1]
            if start <= target < end:
                if target not in self.entries:
                    raise Unsupported("computed jump to a non-entry")
                self.pc = target
                return False
            return self.jump(target)
        if mn == "rts":
            return self.ret(target)
        raise Unsupported(mn)

    # operands
    def ea(self, op, size):
        r = self.r
        if op.startswith("@-r"):
            n = int(op[3:])
            r[n] = (r[n] - size) & M32
            return r[n]
        if op.startswith("@(r0,"):
            if op == "@(r0,gbr)":
                return (r[0] + self.gbr) & M32
            return (r[0] + r[int(op[6:-1])]) & M32
        if op.startswith("@("):
            d, base = op[2:-1].split(",")
            return ((self.gbr if base == "gbr" else r[int(base[1:])]) + int(d)) & M32
        return r[int(op[2:])]

    def exec(self, i, pc):
        mn = i.mnemonic
        r = self.r
        ops = i.ops
        if mn == "nop":
            return
        if i.kind in ("pool_w", "pool_l"):
            size = 2 if i.kind == "pool_w" else 4
            r[int(ops.split(",r")[-1])] = sext(self.img(i.target, size), 8 * size)
            return
        if mn == "mova":
            r[0] = i.target
            return
        if "(" in ops:
            parts = [p for p in __import__("re").findall(r"@\([^)]*\)|[^,]+", ops)]
        else:
            parts = ops.split(",") if ops else []
        if mn in ("mov.b", "mov.w", "mov.l"):
            size = {"b": 1, "w": 2, "l": 4}[mn[-1]]
            src, dst = parts
            if src[0] == "r":
                v = r[int(src[1:])]
                self.wr(self.ea(dst, size), size, v)
                return
            n = int(dst[1:])
            if src.endswith("+"):
                m = int(src[2:-1])
                v = sext(self.rd(r[m], size), 8 * size)
                if m != n:
                    r[m] = (r[m] + size) & M32
                r[n] = v
                return
            r[n] = sext(self.rd(self.ea(src, size), size), 8 * size)
            return
        if mn == "mov":
            if parts[0][0] == "#":
                r[int(parts[1][1:])] = int(parts[0][1:]) & M32
            else:
                r[int(parts[1][1:])] = r[int(parts[0][1:])]
            return
        if mn in ("stc", "sts"):
            r[int(parts[1][1:])] = self.sysreg(parts[0])
            return
        if mn in ("ldc", "lds"):
            self.setsys(parts[1], r[int(parts[0][1:])])
            return
        if mn in ("stc.l", "sts.l"):
            n = int(parts[1][3:])
            r[n] = (r[n] - 4) & M32
            self.wr(r[n], 4, self.sysreg(parts[0]))
            return
        if mn in ("ldc.l", "lds.l"):
            n = int(parts[0][2:-1])
            v = self.rd(r[n], 4)
            r[n] = (r[n] + 4) & M32
            self.setsys(parts[1], v)
            return
        if mn in ("and.b", "or.b", "xor.b", "tst.b"):
            a = (self.gbr + r[0]) & M32
            v = self.rd(a, 1)
            imm = int(parts[0][1:])
            if mn == "tst.b":
                self.t = int(v & imm == 0)
            else:
                self.wr(a, 1, {"and.b": v & imm, "or.b": v | imm, "xor.b": v ^ imm}[mn])
            return
        if mn == "tas.b":
            a = r[int(parts[0][2:])]
            v = self.rd(a, 1)
            self.t = int(v == 0)
            self.wr(a, 1, v | 0x80)
            return
        if mn in ("mac.l", "mac.w"):
            m, n = int(parts[0][2:-1]), int(parts[1][2:-1])
            size = 4 if mn == "mac.l" else 2
            a = sext(self.rd(r[n], size), 8 * size)
            r[n] = (r[n] + size) & M32
            b = sext(self.rd(r[m], size), 8 * size)
            r[m] = (r[m] + size) & M32
            if self.s:
                raise Unsupported("MAC saturation")
            mac = (self.mach << 32 | self.macl) + s32(a) * s32(b)
            mac &= (1 << 64) - 1
            self.mach, self.macl = mac >> 32, mac & M32
            return
        simple = {"clrt": ("t", 0), "sett": ("t", 1)}
        if mn in simple:
            self.t = simple[mn][1]
            return
        if mn == "clrmac":
            self.mach = self.macl = 0
            return
        if mn == "div0u":
            self.m = self.q = self.t = 0
            return
        if mn in ("sleep", "trapa", "rte"):
            raise Unsupported(mn)
        imm = parts and parts[0][0] == "#"
        if len(parts) == 2:
            n = int(parts[1][1:])
            a = int(parts[0][1:]) & M32 if imm else r[int(parts[0][1:])]
            b = r[n]
            if mn == "add":
                r[n] = (b + (sext(a, 8) if imm else a)) & M32
            elif mn == "sub":
                r[n] = (b - a) & M32
            elif mn == "and":
                r[n] = b & a
            elif mn == "or":
                r[n] = b | a
            elif mn == "xor":
                r[n] = b ^ a
            elif mn == "tst":
                self.t = int(b & a == 0)
            elif mn == "cmp/eq":
                self.t = int(b == (a if not imm else sext(a, 8)))
            elif mn == "cmp/gt":
                self.t = int(s32(b) > s32(a))
            elif mn == "cmp/ge":
                self.t = int(s32(b) >= s32(a))
            elif mn == "cmp/hi":
                self.t = int(b > a)
            elif mn == "cmp/hs":
                self.t = int(b >= a)
            elif mn == "cmp/str":
                x = a ^ b
                self.t = int(any((x >> s) & 0xFF == 0 for s in (0, 8, 16, 24)))
            elif mn == "addc":
                t1 = (b + a) & M32
                v = (t1 + self.t) & M32
                self.t = int(b > t1 or t1 > v)
                r[n] = v
            elif mn == "subc":
                t1 = (b - a) & M32
                v = (t1 - self.t) & M32
                self.t = int(b < t1 or t1 < v)
                r[n] = v
            elif mn == "addv":
                v = s32(b) + s32(a)
                self.t = int(not -2 ** 31 <= v < 2 ** 31)
                r[n] = v & M32
            elif mn == "subv":
                v = s32(b) - s32(a)
                self.t = int(not -2 ** 31 <= v < 2 ** 31)
                r[n] = v & M32
            elif mn == "negc":
                t = (-a) & M32
                v = (t - self.t) & M32
                self.t = int(0 < t or t < v)
                r[n] = v
            elif mn == "neg":
                r[n] = (-a) & M32
            elif mn == "not":
                r[n] = ~a & M32
            elif mn in ("exts.b", "exts.w"):
                r[n] = sext(a, 8 if mn[-1] == "b" else 16)
            elif mn in ("extu.b", "extu.w"):
                r[n] = a & (0xFF if mn[-1] == "b" else 0xFFFF)
            elif mn == "swap.b":
                r[n] = (a & 0xFFFF0000) | ((a & 0xFF) << 8) | ((a >> 8) & 0xFF)
            elif mn == "swap.w":
                r[n] = ((a << 16) | (a >> 16)) & M32
            elif mn == "xtrct":
                r[n] = ((a << 16) | (b >> 16)) & M32
            elif mn == "mul.l":
                self.macl = (a * b) & M32
            elif mn == "muls.w":
                self.macl = (s32(sext(b, 16)) * s32(sext(a, 16))) & M32
            elif mn == "mulu.w":
                self.macl = ((b & 0xFFFF) * (a & 0xFFFF)) & M32
            elif mn in ("dmuls.l", "dmulu.l"):
                v = s32(b) * s32(a) if mn == "dmuls.l" else b * a
                v &= (1 << 64) - 1
                self.mach, self.macl = v >> 32, v & M32
            elif mn == "div0s":
                self.q, self.m = b >> 31, a >> 31
                self.t = int(self.q != self.m)
            elif mn == "div1":
                old_q = self.q
                self.q = b >> 31
                b = ((b << 1) | self.t) & M32
                t0 = b
                if old_q == self.m:
                    b = (b - a) & M32
                    t1 = int(b > t0)
                else:
                    b = (b + a) & M32
                    t1 = int(b < t0)
                self.q = int(not (self.q ^ t1)) if self.m else self.q ^ t1
                self.t = int(self.q == self.m)
                r[n] = b
            else:
                raise Unsupported("unhandled %s" % i.text())
            return
        if len(parts) == 1 and parts[0][0] == "r":
            n = int(parts[0][1:])
            v = r[n]
            if mn == "dt":
                r[n] = (v - 1) & M32
                self.t = int(r[n] == 0)
            elif mn == "cmp/pl":
                self.t = int(s32(v) > 0)
            elif mn == "cmp/pz":
                self.t = int(s32(v) >= 0)
            elif mn == "movt":
                r[n] = self.t
            elif mn in ("shll", "shal"):
                self.t, r[n] = v >> 31, (v << 1) & M32
            elif mn == "shlr":
                self.t, r[n] = v & 1, v >> 1
            elif mn == "shar":
                self.t, r[n] = v & 1, (s32(v) >> 1) & M32
            elif mn == "rotl":
                self.t = v >> 31
                r[n] = ((v << 1) | self.t) & M32
            elif mn == "rotr":
                self.t = v & 1
                r[n] = (v >> 1) | (self.t << 31)
            elif mn == "rotcl":
                c = v >> 31
                r[n] = ((v << 1) | self.t) & M32
                self.t = c
            elif mn == "rotcr":
                c = v & 1
                r[n] = (v >> 1) | (self.t << 31)
                self.t = c
            elif mn in ("shll2", "shll8", "shll16"):
                r[n] = (v << int(mn[4:])) & M32
            elif mn in ("shlr2", "shlr8", "shlr16"):
                r[n] = v >> int(mn[4:])
            else:
                raise Unsupported("unhandled %s" % i.text())
            return
        raise Unsupported("unhandled %s" % i.text())

    def sysreg(self, name):
        if name == "sr":
            return self.getsr()
        return getattr(self, name)

    def setsys(self, name, v):
        if name == "sr":
            self.setsr(v)
        else:
            setattr(self, name, v & M32)
