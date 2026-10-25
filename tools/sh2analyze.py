#!/usr/bin/env python3
"""Code/data discovery for a raw big-endian SH-2 image.

Recursive descent from known entry points, plus function pointers found anywhere
in the image. The result says, for every halfword, whether it is an instruction,
a literal-pool constant, or data.
"""
import struct

import sh2dis

CODE, POOL_W, POOL_L, DATA = 1, 2, 3, 0


class Image:
    def __init__(self, data, vram):
        self.data = data
        self.vram = vram
        self.end = vram + len(data)

    def contains(self, addr, size=1):
        return self.vram <= addr and addr + size <= self.end

    def u16(self, addr):
        return struct.unpack_from(">H", self.data, addr - self.vram)[0]

    def u32(self, addr):
        return struct.unpack_from(">I", self.data, addr - self.vram)[0]


class Analysis:
    def __init__(self, image):
        self.img = image
        self.insns = {}        # addr -> Insn
        self.walked = set()    # insns followed as a path (a delay slot alone is not)
        self.data = set()      # halfwords declared as data (symbols with type:data)
        self.pools = {}        # addr -> 2 or 4
        self.functions = set()
        self.jump_tables = {}  # table addr -> (entry size, [targets], dispatch pc)
        self.owner = {}        # insn or pool addr -> function that first reached it

    def _trace(self, start, speculative=False):
        """Follow control flow from start. Returns (insns, pools, calls) without
        committing. A speculative trace returns None if it hits an invalid opcode,
        known data, or overlaps its own literal pool."""
        img = self.img
        insns, pools, calls, walked = {}, {}, set(), set()

        def note_pool(insn):
            if insn.kind in ("pool_w", "pool_l") and img.contains(insn.target, 4):
                size = 2 if insn.kind == "pool_w" else 4
                pools[insn.target] = max(size, pools.get(insn.target, 0))

        work = [start]
        while work:
            pc = work.pop()
            while True:
                # A delay slot that is also a branch target still has to be followed
                # past: execution entering there continues after it.
                if pc in walked or pc in self.walked:
                    break
                if not img.contains(pc, 2) or pc & 1 or pc in self.pools or pc in pools or pc in self.data:
                    if speculative:
                        return None
                    break
                insn = sh2dis.decode(img.u16(pc), pc)
                if insn is None:
                    if speculative:
                        return None
                    break
                insns[pc] = insn
                walked.add(pc)
                note_pool(insn)
                if insn.mnemonic in ("braf", "jmp"):
                    work += self._jump_table(pc, insns)
                if insn.mnemonic in ("jsr", "jmp"):
                    rel = self._offset_table(pc, insns)
                    if insn.mnemonic == "jsr":
                        calls.update(rel)
                    else:
                        work += rel
                if insn.kind in ("branch", "jump") and insn.target is not None:
                    work.append(insn.target)
                elif insn.kind == "call" and insn.target is not None:
                    calls.add(insn.target)
                if not insn.delay:
                    pc += 2
                    continue
                slot = pc + 2
                if img.contains(slot, 2) and slot not in insns and slot not in self.insns:
                    sinsn = sh2dis.decode(img.u16(slot), slot)
                    if sinsn is None or sinsn.delay:
                        if speculative:
                            return None
                    else:
                        insns[slot] = sinsn
                        note_pool(sinsn)
                if insn.kind in ("ret", "jump"):
                    break
                pc += 4
        if speculative and any(a in insns for p, size in pools.items() for a in range(p, p + size, 2)):
            return None
        return insns, pools, calls, walked

    def _jump_table(self, pc, insns):
        """Switch dispatch: `mova T,r0` then `mov.w @(r0,rX),r0; braf r0` (16-bit
        offsets from braf+4) or `mov.l @(r0,rX),r0; jmp @r0` (absolute). The table
        length comes from the preceding `mov #N,rY; cmp/hs rY,r0` bound check."""
        prev = [insns.get(pc - 2 * k) for k in range(1, 9)]
        if not prev[0] or not prev[1]:
            return []
        load, mova = prev[0], prev[1]
        if mova.mnemonic != "mova":
            return []
        wide = load.mnemonic == "mov.l" and load.ops.startswith("@(r0,")
        if not (wide or (load.mnemonic == "mov.w" and load.ops.startswith("@(r0,"))):
            return []
        count = None
        for k, i in enumerate(prev[2:], 2):
            if i and i.mnemonic == "cmp/hs" and k + 1 < len(prev):
                bound = prev[k + 1]
                if bound and bound.mnemonic == "mov" and bound.ops.startswith("#"):
                    count = int(bound.ops[1:].split(",")[0])
                break
        if count is None:
            return []
        table = mova.target
        size = 4 if wide else 2
        out = []
        for e in range(count):
            a = table + e * size
            if not self.img.contains(a, size):
                break
            if wide:
                t = self.img.u32(a)
            else:
                v = self.img.u16(a)
                t = pc + 4 + (v - 0x10000 if v & 0x8000 else v)
            out.append(t)
        self.jump_tables[table] = (size, out, pc)
        return out

    def _offset_table(self, pc, insns):
        """Call/jump through a table of 16-bit offsets from its own start:
        `mov.l #T,rB ... mov.w @(r0,rB),rT; add rB,rT; jsr @rT` (or jmp). The
        handlers follow the table, so it ends where the nearest one begins.
        Returns the handler addresses; every entry is recorded in jump_tables
        (with dispatch = T - 4, so entries are emitted as `target - T`)."""
        jump = insns[pc]
        add, load = insns.get(pc - 2), insns.get(pc - 4)
        rt = jump.ops[1:]
        if not add or not load or add.mnemonic != "add" or load.mnemonic != "mov.w":
            return []
        rb, dst = add.ops.split(",")
        if dst != rt or rb == rt or load.ops != "@(r0,%s),%s" % (rb, rt):
            return []
        table = None
        for a in range(pc - 6, pc - 40, -2):
            i = insns.get(a)
            if i is None:
                return []
            if i.kind == "pool_l" and i.ops.endswith("," + rb) and self.img.contains(i.target, 4):
                table = self.img.u32(i.target)
                break
            if i.ops.endswith("," + rb) or i.ops == rb:
                return []
        if table is None or not self.img.contains(table, 2) or table & 1:
            return []
        entries, first = [], None
        for k in range(64):
            a = table + 2 * k
            if first is not None and a >= first or not self.img.contains(a, 2):
                break
            v = self.img.u16(a)
            t = table + (v - 0x10000 if v & 0x8000 else v)
            entries.append(t)
            if t >= a + 2 and not t & 1 and self.img.contains(t, 2):
                first = t if first is None else min(first, t)
        end = table + 2 * len(entries)
        handlers = [t for t in entries if not (table <= t < end) and not t & 1 and self.img.contains(t, 2)]
        if not handlers:
            return []
        self.jump_tables[table] = (2, entries, table - 4)
        return handlers

    def _commit(self, result, func):
        insns, pools, calls, walked = result
        self.insns.update(insns)
        self.walked |= walked
        for a in insns:
            self.owner.setdefault(a, func)
        for p, s in pools.items():
            self.pools[p] = max(s, self.pools.get(p, 0))
            self.owner.setdefault(p, func)
        return calls

    def add_function(self, addr, speculative=False):
        if addr in self.functions:
            return True
        if addr in self.data:
            return False
        res = self._trace(addr, speculative)
        if res is None:
            return False
        self.functions.add(addr)
        pending = list(self._commit(res, addr))
        while pending:
            f = pending.pop()
            if f in self.functions or not self.img.contains(f, 2):
                continue
            r = self._trace(f, speculative=False)
            self.functions.add(f)
            pending += list(self._commit(r, f))
        return True

    def pool_call_targets(self):
        """Addresses loaded from pools and then used by jsr/jmp."""
        out = set()
        for a, insn in self.insns.items():
            if insn.kind == "pool_l" and self.img.contains(insn.target, 4):
                v = self.img.u32(insn.target)
                if self.img.contains(v, 2) and not v & 1:
                    out.add(v)
        return out

    def _looks_like_start(self, addr):
        """SHC prologues, or an address straight after the end of other code."""
        insn = sh2dis.decode(self.img.u16(addr), addr)
        if insn is None:
            return False
        text = insn.mnemonic + " " + insn.ops
        if text.startswith(("sts.l pr,@-r15", "sts.l macl,@-r15", "sts.l mach,@-r15")):
            return True
        if insn.mnemonic == "mov.l" and insn.ops.endswith(",@-r15"):
            return True
        if insn.mnemonic == "add" and insn.ops.endswith(",r15") and insn.ops.startswith("#-"):
            return True
        before = addr - 2
        if before in self.pools or (before - 2) in self.pools:
            return True
        prev = self.insns.get(addr - 4)
        return prev is not None and prev.kind in ("ret", "jump") and prev.delay

    @staticmethod
    def _plausible(res):
        """A speculative trace counts as a function if it returns, or is long enough
        and leaves by a tail jump/branch (SHC shares epilogues between functions)."""
        if res is None:
            return False
        insns = res[0].values()
        if any(i.kind == "ret" for i in insns):
            return True
        return len(res[0]) >= 4 and any(i.kind == "jump" for i in insns)

    def _image_pointers(self):
        """addr -> list of word addresses holding a pointer to it."""
        out = {}
        for off in range(0, len(self.img.data) - 3, 4):
            v = struct.unpack_from(">I", self.img.data, off)[0]
            if self.img.contains(v, 2) and not v & 1:
                out.setdefault(v, []).append(self.img.vram + off)
        return out

    def _in_function_table(self, holders):
        """A pointer sitting next to another pointer to a known function is an
        entry in a function table (task lists, callbacks, state machines)."""
        for h in holders:
            if h in self.pools:
                return True
            for n in (h - 4, h + 4):
                if self.img.contains(n, 4) and self.img.u32(n) in self.functions:
                    return True
        return False

    def run(self, entries, data=()):
        """entries: known function starts; data: (address, size) ranges that are
        data even though something points at them or they decode as code"""
        for a, size in data:
            self.data.update(range(a, a + size, 2))
        for e in entries:
            self.add_function(e)
        pointers = self._image_pointers()
        changed = True
        while changed:
            changed = False
            pool_targets = self.pool_call_targets()
            for v in sorted(set(pointers) | pool_targets):
                if v in self.functions or v in self.insns or v in self.pools or v in self.data:
                    continue
                trusted = v in pool_targets or self._in_function_table(pointers.get(v, ()))
                if not trusted and not self._looks_like_start(v):
                    continue
                res = self._trace(v, speculative=True)
                if not self._plausible(res):
                    continue
                self.functions.add(v)
                for f in self._commit(res, v):
                    if f not in self.functions:
                        self.add_function(f)
                changed = True
            if not changed:
                changed = self._fill_gaps()
        return self

    def _fill_gaps(self):
        """Code nothing points at (dead, or only reached through computed calls):
        accept an SHC prologue in unclassified bytes if its trace is plausible."""
        found = False
        for addr in range(self.img.vram, self.img.end - 2, 2):
            if addr in self.insns or addr in self.pools or addr - 2 in self.pools:
                continue
            w = self.img.u16(addr)
            if w != 0x4F22 and (w & 0xFF0F) != 0x2F06:
                continue
            if not self._looks_like_start(addr):
                continue
            res = self._trace(addr, speculative=True)
            if not self._plausible(res):
                continue
            self.functions.add(addr)
            for f in self._commit(res, addr):
                self.add_function(f)
            found = True
        return found

    def owned_end(self):
        """Per function, the end of the furthest instruction or pool it reached."""
        ends = {}
        for a, f in self.owner.items():
            size = self.pools.get(a, 2) if a not in self.insns else 2
            ends[f] = max(ends.get(f, f), a + size)
        return ends

    def classify(self):
        """Per-halfword map: CODE, POOL_W, POOL_L, or DATA."""
        kinds = {}
        for a in range(self.img.vram, self.img.end, 2):
            kinds[a] = DATA
        for a in self.insns:
            kinds[a] = CODE
        for p, s in self.pools.items():
            if kinds.get(p) == CODE:
                continue
            if s == 4:
                kinds[p] = POOL_L
                if p + 2 in kinds and kinds[p + 2] != CODE:
                    kinds[p + 2] = POOL_L
            else:
                kinds[p] = POOL_W
        return kinds


if __name__ == "__main__":
    import sys

    data = open(sys.argv[1], "rb").read()
    vram = int(sys.argv[2], 0)
    a = Analysis(Image(data, vram)).run([vram])
    kinds = a.classify()
    code = sum(2 for k in kinds.values() if k == CODE)
    pool = sum(2 for k in kinds.values() if k in (POOL_W, POOL_L))
    print("functions %d, code %d bytes, pool %d bytes, data %d bytes"
          % (len(a.functions), code, pool, len(data) - code - pool))
    # Contiguous regions, to see where code ends and data begins.
    region, start = None, vram
    for addr in range(vram, vram + len(data), 2):
        k = "code" if kinds[addr] != DATA else "data"
        if k != region:
            if region and addr - start >= 0x400:
                print("  %08X-%08X %s (%d)" % (start, addr, region, addr - start))
            region, start = k, addr
    print("  %08X-%08X %s (%d)" % (start, vram + len(data), region, vram + len(data) - start))
