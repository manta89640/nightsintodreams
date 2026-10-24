#!/usr/bin/env python3
"""Disassemble an SH-2 image into GNU as source that rebuilds it byte for byte.

    split.py config/usa/0NIGHTS.toml              write build/<region>/asm/<unit>.s, linker
                                                  script, units.mk and objdiff.json
    split.py config/usa/0NIGHTS.toml --discover   (re)generate the function list in symbols.txt
    split.py config/usa/0NIGHTS.toml --units      propose unit boundaries in units.txt

The config names the image, its load address, its expected SHA-1, the symbol and
unit files, and the progress categories. Every unit is generated into build/; a
unit that has been reviewed lives in src/<unit>.s and is linked in its place.
"""
import argparse
import bisect
import csv
import hashlib
import io
import json
import os
import re
import struct
import sys

try:
    import tomllib
except ImportError:  # Python < 3.11
    sys.exit("Python 3.11+ is required (tomllib)")

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import sh2analyze  # noqa: E402
from sh2analyze import CODE, DATA, POOL_L, POOL_W  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

SYM_RE = re.compile(r"^\s*(\w+)\s*=\s*(0x[0-9A-Fa-f]+)\s*;\s*(?://\s*(.*))?$")


def write_if_changed(path, text):
    """Leave unchanged files alone so make doesn't rebuild their objects."""
    if os.path.exists(path) and open(path).read() == text:
        return
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w") as f:
        f.write(text)


def load_symbols(path):
    """symbols.txt: `name = 0xADDR; // type:func size:0x10` (splat style)."""
    syms = {}
    if not os.path.exists(path):
        return syms
    for line in open(path):
        m = SYM_RE.match(line)
        if not m:
            continue
        attrs = dict(kv.split(":", 1) for kv in (m.group(3) or "").split() if ":" in kv)
        syms[int(m.group(2), 16)] = (m.group(1), attrs)
    return syms


def load_equates(path):
    """include/*.inc: `.equ NAME, 0xADDR  ! size:N`. Returns (exact names, regions)."""
    names, regions = {}, []
    for line in open(path):
        m = re.match(r"\s*\.equ\s+(\w+)\s*,\s*(0x[0-9A-Fa-f]+)(?:\s*!\s*size:(0x[0-9A-Fa-f]+))?", line)
        if not m:
            continue
        addr = int(m.group(2), 16)
        names.setdefault(addr, m.group(1))
        if m.group(3):
            regions.append((addr, addr + int(m.group(3), 16), m.group(1)))
    return names, regions


class Splitter:
    def __init__(self, cfg_path):
        self.cfg_path = cfg_path
        cfg = tomllib.load(open(cfg_path, "rb"))
        self.cfg = cfg
        base = os.path.dirname(cfg_path)
        self.name = cfg["name"]
        self.region = cfg["region"]
        self.vram = cfg["vram"]
        self.image_path = os.path.join(ROOT, cfg["image"])
        self.data = open(self.image_path, "rb").read()
        if hashlib.sha1(self.data).hexdigest() != cfg["sha1"]:
            sys.exit("%s does not match the expected SHA-1" % self.image_path)
        self.cfg_dir = base
        self.symbols_path = os.path.join(base, cfg["symbols"])
        self.symbols = load_symbols(self.symbols_path)
        # symbols/<anything>.txt override symbols.txt, so units can be named in parallel.
        sym_dir = os.path.join(base, "symbols")
        if os.path.isdir(sym_dir):
            for f in sorted(os.listdir(sym_dir)):
                if f.endswith(".txt"):
                    self.symbols.update(load_symbols(os.path.join(sym_dir, f)))
        self.equates, self.regions = {}, []
        for inc in cfg.get("equates", []):
            names, regions = load_equates(os.path.join(ROOT, inc))
            self.equates.update(names)
            self.regions += regions
        # Smallest region first, so a register block wins over the area containing it.
        self.regions.sort(key=lambda r: r[1] - r[0])
        self.img = sh2analyze.Image(self.data, self.vram)
        self.out_dir = os.path.join(ROOT, "build", self.region, "asm")
        # Addresses outside the image that are still linked symbols (BSS, heap,
        # overlay space): references to them become relocations, as compiled C would.
        self.extern_ranges = [tuple(r) for r in cfg.get("extern_ranges", [])]

    # ---- analysis -------------------------------------------------------

    def analyze(self, extra_seeds=()):
        funcs = [a for a, (_, attrs) in self.symbols.items() if attrs.get("type") == "func"]
        seeds = [self.vram] + sorted(set(funcs) | set(extra_seeds))
        self.an = sh2analyze.Analysis(self.img).run(seeds)
        self.kinds = self.an.classify()
        return self.an

    def discover(self, ghidra_csv=None):
        """Write symbols.txt with every discovered function, keeping existing names."""
        seeds = []
        if ghidra_csv and os.path.exists(ghidra_csv):
            for row in csv.DictReader(open(ghidra_csv)):
                a = int(row["address"], 16)
                if self.img.contains(a, 2):
                    seeds.append(a)
        an = self.analyze(seeds)
        for f in an.functions:
            if f not in self.symbols:
                self.symbols[f] = ("func_%08X" % f, {"type": "func"})
            else:
                self.symbols[f][1].setdefault("type", "func")
        self.write_symbols()
        print("%d functions in %s" % (len(an.functions), self.symbols_path))

    def write_symbols(self):
        header = []
        if os.path.exists(self.symbols_path):
            for line in open(self.symbols_path):
                if line.startswith("//"):
                    header.append(line)
                else:
                    break
        with open(self.symbols_path, "w") as f:
            f.writelines(header)
            for addr in sorted(self.symbols):
                name, attrs = self.symbols[addr]
                tail = " ".join("%s:%s" % kv for kv in sorted(attrs.items()))
                f.write("%s = 0x%08X;%s\n" % (name, addr, " // " + tail if tail else ""))

    # ---- labelling ------------------------------------------------------

    def _in_extern(self, v):
        return any(lo <= v < hi for lo, hi in self.extern_ranges)

    def _region(self, v):
        for lo, hi, name in self.regions:
            if lo <= v < hi:
                return name, v - lo
        return None

    def _address_pools(self):
        """Pool words whose loaded value is used as an address: dereferenced (`@rN`)
        or passed as an argument (r4-r7) to a call before rN is overwritten."""
        out = set()
        for pc, insn in self.an.insns.items():
            if insn.kind != "pool_l":
                continue
            reg = insn.ops.rsplit(",", 1)[1]
            is_arg = reg in ("r4", "r5", "r6", "r7")
            prev = self.an.insns.get(pc - 2)
            if is_arg and prev is not None and prev.kind == "call":
                out.add(insn.target)
                continue
            for k in range(1, 8):
                nxt = self.an.insns.get(pc + 2 * k)
                if nxt is None:
                    break
                ops = nxt.ops.replace(" ", "")
                if re.search(r"@(\(\w+,)?%s\b" % reg, ops) or (is_arg and nxt.kind == "call"):
                    out.add(insn.target)
                    break
                if ops.endswith("," + reg) or nxt.kind in ("call", "jump", "ret", "branch"):
                    break
        return out

    def _find_strings(self):
        """NUL-terminated printable ASCII runs of 4+ characters in data."""
        self.strings = {}
        self.string_bytes = set()
        data, base = self.data, self.vram
        a = base
        while a < self.img.end:
            if self.kinds.get(a & ~1) != DATA:
                a += 1
                continue
            b = a
            while b < self.img.end and (0x20 <= data[b - base] < 0x7F or data[b - base] in (0x09, 0x0A)) \
                    and self.kinds.get(b & ~1) == DATA:
                b += 1
            if b - a >= 4 and b < self.img.end and data[b - base] == 0 and \
                    (a == base or data[a - base - 1] == 0 or a & 3 == 0):
                self.strings[a] = b + 1 - a
                self.string_bytes.update(range(a, b + 1))
                a = b + 1
            else:
                a = max(a + 1, b)

    @staticmethod
    def _confident_address(v):
        """Ranges where a 32-bit value is almost never a plain number: A/B-bus
        hardware, High Work RAM and its cache-through mirror, and SMPC."""
        return 0x05000000 <= v < 0x06100000 or 0x25000000 <= v < 0x26100000 or 0x20100000 <= v < 0x20100080

    def _pointer(self, v, at=None):
        """Symbolic form of a 32-bit constant, or None to keep it numeric."""
        if v in getattr(self, "end_alias", {}):
            base = self.end_alias[v]
            return "%s + 0x%X" % (self.labels[base], v - base)
        if at is not None and not self.string_bytes.isdisjoint(range(at, at + 4)):
            return None
        # Low WRAM looks like 16.16 fixed point 32.0-48.0, and on-chip/cache areas
        # look like negative numbers: only trust them when the code uses them as addresses.
        if not self._confident_address(v) and at not in self.addr_pools:
            return None
        if v in self.equates:
            return self.equates[v]
        if self.img.contains(v):
            # An odd address inside code can't be a real pointer.
            if v & 1 and self.kinds.get(v & ~1) == CODE:
                return None
            self.refs.add((at, v))
            return self.label_for(v, data_ref=True)
        # Cache-through (0x2xxxxxxx) alias of a RAM address: same symbol + 0x20000000.
        for addr, alias in ((v, ""), (v - 0x20000000, " + 0x20000000")):
            if self._in_extern(addr):
                name = self.symbols.get(addr, ("D_%08X" % addr, {}))[0]
                self.externs[addr] = name
                return name + alias
            if alias and self.img.contains(addr):
                self.refs.add((at, addr))
                return self.label_for(addr, data_ref=True) + alias
        r = self._region(v)
        if r:
            return "%s + 0x%X" % r
        return None

    def label_for(self, addr, data_ref=False):
        if addr in self.labels:
            return self.labels[addr]
        if addr in self.symbols:
            name = self.symbols[addr][0]
        elif addr in self.an.functions:
            name = "func_%08X" % addr
        elif data_ref and self.kinds.get(addr & ~1) == DATA:
            name = "D_%08X" % addr
        else:
            name = ".L%08X" % addr
        self.labels[addr] = name
        return name

    def _collect_labels(self):
        self.labels = {}
        self.externs = {}
        self.refs = set()  # (word address, image address it points to)
        self.addr_pools = self._address_pools()
        self._find_strings()
        for a in sorted(self.symbols):
            if self.img.contains(a):
                self.label_for(a)
        for f in self.an.functions:
            self.label_for(f)
        for a, insn in self.an.insns.items():
            if insn.target is not None and self.img.contains(insn.target):
                self.label_for(insn.target)
        for table, (size, targets, dispatch) in self.an.jump_tables.items():
            self.label_for(table)
            for t in targets:
                self.label_for(t)
            self.label_for(dispatch + 4)
        # Every aligned word that points into the image gets a label at its target.
        for addr in range(self.vram, self.img.end - 3, 4):
            if self.kinds.get(addr) == CODE:
                continue
            self._pointer(self.img.u32(addr), at=addr)

    # ---- layout ---------------------------------------------------------

    def _function_ends(self):
        """A function runs to the furthest instruction or pool it reaches (so dead
        code in the middle stays inside it), capped by the next function, plus any
        trailing `nop` padding."""
        starts = sorted(self.an.functions)
        owned = self.an.owned_end()
        ordered = starts + [self.img.end]
        ends = {}
        for i, f in enumerate(starts):
            limit = ordered[i + 1]
            a = min(max(owned.get(f, f + 2), f + 2), limit)
            while a < limit and self.kinds.get(a) == DATA and self.img.u16(a) == 0x0009:
                a += 2
            ends[f] = a
        return ends

    def prepare(self):
        """Labels, function extents, and the text/data section layout of the image."""
        self._collect_labels()
        self.ends = self._function_ends()
        self.jt_entries = {}
        self.spans = [(min(a, i.target), max(a, i.target)) for a, i in self.an.insns.items()
                      if i.target is not None]
        for table, (size, targets, dispatch) in self.an.jump_tables.items():
            for i, t in enumerate(targets):
                self.jt_entries[table + i * size] = (size, t, dispatch)
                self.spans.append((min(dispatch, t, table), max(dispatch, t, table + i * size)))
        self._build_crossing_map()
        self.runs = self._split_sections(self.vram, self.img.end)
        # Tables left in a text run after a function (switch tables, PC-relative
        # data) belong to that function, as they would in SHC's output.
        starts = sorted(self.ends)
        for kind, rs, re_ in self.runs:
            if kind != "text":
                continue
            inside = [f for f in starts if rs <= f < re_]
            for i, f in enumerate(inside):
                self.ends[f] = inside[i + 1] if i + 1 < len(inside) else re_
        # A pointer to the end of a data table can land on the alignment halfword
        # pulled into the next text run. Write it as table + size instead, so the
        # halfword needs no symbol of its own (and isn't counted as a function).
        self.end_alias = {}
        code_targets = {i.target for i in self.an.insns.values() if i.target is not None}
        code_targets.update(t for _, ts, d in self.an.jump_tables.values() for t in ts)
        for i, (kind, rs, re_) in enumerate(self.runs):
            if kind == "text" and i and self.runs[i - 1][0] == "data" and rs in self.labels \
                    and rs not in self.an.functions and rs not in self.symbols and rs not in code_targets:
                base = self.runs[i - 1][1]
                self.label_for(base, data_ref=True)
                self.end_alias[rs] = base
                del self.labels[rs]
                self.refs = {(at, t) for at, t in self.refs if t != rs}

    def _build_crossing_map(self):
        """crossed[i] > 0 if a PC-relative reference spans halfword address vram+2i,
        i.e. the image can't be cut into separate files there."""
        n = (self.img.end - self.vram) // 2 + 2
        diff = [0] * (n + 1)
        for lo, hi in self.spans:
            i, j = (lo + 2 - self.vram) // 2, (hi - self.vram) // 2
            if i <= j:
                diff[i] += 1
                diff[j + 1] -= 1
        self.crossed = []
        acc = 0
        for d in diff[:n]:
            acc += d
            self.crossed.append(acc)

    def _can_cut(self, a):
        """True if a new file can start at a: 4-aligned, no PC-relative reference
        across it, not inside a function, string or jump-table entry."""
        if a % 4 or not self.img.contains(a) or self.crossed[(a - self.vram) // 2]:
            return False
        if a in self.string_bytes and a not in self.strings:
            return False
        i = bisect.bisect_right(self.func_starts, a) - 1
        if i >= 0 and self.func_starts[i] < a < self.ends[self.func_starts[i]]:
            return False
        return True

    def _split_sections(self, start, end):
        """Split [start, end) into text and data runs. Data stays in text if it is
        inside a function's extent or reached PC-relatively (pools, mova tables),
        because GNU as can't resolve those displacements across sections. Text runs
        start 4-aligned so assemble-time `mov.l @(disp,pc)` math stays valid."""
        text = set()
        for f, e in self.ends.items():
            if start <= f < end:
                text.update(range(f, e, 2))
        pcrel = set()
        for insn in self.an.insns.values():
            if insn.kind in ("pool_w", "pool_l", "mova"):
                pcrel.add(insn.target & ~1)
        pcrel.update(a & ~1 for a in self.jt_entries)

        runs = []
        a = start
        while a < end:
            is_text = self.kinds.get(a, DATA) != DATA or a in text
            b = a
            while b < end and (self.kinds.get(b, DATA) != DATA or b in text) == is_text:
                b += 2
            runs.append(["text" if is_text else "data", a, min(b, end)])
            a = b
        for r in runs:
            if r[0] == "data" and (r[2] - r[1] < 4 or any(x in pcrel for x in range(r[1], r[2], 2))
                                   or self.crossed[(r[1] - self.vram) // 2]
                                   or self.crossed[(r[2] - 2 - self.vram) // 2 + 1]):
                r[0] = "text"
        merged = []
        for r in runs:
            if merged and merged[-1][0] == r[0]:
                merged[-1][2] = r[2]
            else:
                merged.append(r)
        # Keep both edges of a data run 4-aligned: text needs it for pool
        # displacements, data for `.long`. The odd halfword joins the text run.
        for i in range(len(merged)):
            if merged[i][0] != "data":
                continue
            if merged[i][1] % 4 == 2 and i > 0:
                merged[i][1] += 2
                merged[i - 1][2] += 2
            if merged[i][2] % 4 == 2 and i + 1 < len(merged):
                merged[i][2] -= 2
                merged[i + 1][1] -= 2
        # A data run can shrink to nothing; rejoin the text runs around it.
        out = []
        for r in merged:
            if r[2] <= r[1]:
                continue
            if out and out[-1][0] == r[0]:
                out[-1][2] = r[2]
            else:
                out.append(r)
        return [tuple(r) for r in out]

    # ---- units ----------------------------------------------------------

    def _category(self, addr):
        cat = None
        for c in sorted(self.cfg.get("category", []), key=lambda c: c["start"]):
            if c["start"] <= addr:
                cat = c["id"]
        return cat or "main"

    def _unit_category(self, name, start):
        """A unit's category is its name prefix (game/, sbl/, ...) when that is a
        configured category, else the category its address falls in."""
        prefix = name.split("/")[0]
        if any(c["id"] == prefix for c in self.cfg.get("category", [])):
            return prefix
        return self._category(start)

    def _units(self):
        """[(name, start, end)] from units.txt, or the whole image as one unit."""
        path = os.path.join(self.cfg_dir, self.cfg.get("units", "units.txt"))
        units = []
        if os.path.exists(path):
            for line in open(path):
                line = line.split("//")[0].strip()
                if line:
                    addr, name, *flags = line.split()
                    units.append((int(addr, 16), name, set(flags)))
        if not units:
            units = [(self.vram, self.name, set())]
        units.sort()
        if units[0][0] != self.vram:
            sys.exit("the first unit must start at 0x%08X" % self.vram)
        self.unit_flags = {n: f for _, n, f in units}
        return [(n, a, units[i + 1][0] if i + 1 < len(units) else self.img.end)
                for i, (a, n, _) in enumerate(units)]

    def propose_units(self, target=0x1000):
        """Write units.txt. Cuts go where a code run follows data (likely module
        boundaries), at category starts, and then wherever a unit grows past
        `target` bytes, at the next clean cut point."""
        self.prepare()
        self.func_starts = sorted(self.an.functions)
        cands = set(f for f in self.func_starts if self._can_cut(f))
        for kind, rs, re_ in self.runs:
            if self._can_cut(rs):
                cands.add(rs)
            if kind == "data":
                cands.update(a for a in range(rs + 0x100 - rs % 0x100, re_, 0x100) if self._can_cut(a))
        cuts = {self.vram}
        for i, (kind, rs, re_) in enumerate(self.runs):
            if kind == "text" and i and self.runs[i - 1][0] == "data" and rs in cands:
                cuts.add(rs)
        for c in self.cfg.get("category", []):
            if not self._can_cut(c["start"]):
                sys.exit("category %s start 0x%08X is not a clean cut point" % (c["id"], c["start"]))
            cuts.add(c["start"])
        ordered = sorted(cands | cuts)
        final = []
        bounds = sorted(cuts) + [self.img.end]
        for lo, hi in zip(bounds, bounds[1:]):
            final.append(lo)
            last = lo
            for c in ordered:
                if lo < c < hi and c - last >= target and hi - c >= target // 4:
                    final.append(c)
                    last = c
        path = os.path.join(self.cfg_dir, self.cfg.get("units", "units.txt"))
        with open(path, "w") as f:
            f.write("// Translation units of %s: start address and name. Every start must be a\n"
                    "// point no PC-relative reference crosses; split.py checks this.\n" % self.name)
            for a in final:
                f.write("0x%08X %s/%08X\n" % (a, self._category(a), a))
        print("%d units in %s" % (len(final), path))

    # ---- emission -------------------------------------------------------

    def _src_path(self, unit):
        for ext in (".s", ".c"):
            p = os.path.join(ROOT, "src", unit + ext)
            if os.path.exists(p):
                return p
        return None

    def emit(self):
        self.prepare()
        self.func_starts = sorted(self.an.functions)
        units = self._units()
        for name, start, end in units[1:]:
            if not self._can_cut(start):
                sys.exit("unit %s starts at 0x%08X, which is not a clean cut point" % (name, start))
        starts = [u[1] for u in units]
        unit_of = lambda a: bisect.bisect_right(starts, a) - 1  # noqa: E731

        # A local label referenced from another unit must become global.
        for at, target in self.refs:
            if at is not None and unit_of(at) != unit_of(target) and self.labels.get(target, "").startswith(".L"):
                self.labels[target] = "lbl_%08X" % target
        globals_ = {a for a, n in self.labels.items() if not n.startswith(".L")}

        self.unit_objs = []
        for name, start, end in units:
            path = os.path.join(self.out_dir, name + ".s")
            out = io.StringIO()
            out.write('\t.include "macro.inc"\n')
            for inc in self.cfg.get("equates", []):
                out.write('\t.include "%s"\n' % os.path.basename(inc))
            for kind, rs, re_ in self.runs:
                rs, re_ = max(rs, start), min(re_, end)
                if rs >= re_:
                    continue
                flags = '"ax",@progbits' if kind == "text" else '"aw",@progbits'
                align = 2 if rs % 4 == 0 else (1 if rs % 2 == 0 else 0)
                out.write("\n\t.section .%s.%08X,%s\n\t.p2align %d\n" % (kind, rs, flags, align))
                self._emit_range(out, rs, re_, self.ends, globals_, self.jt_entries)
            write_if_changed(path, out.getvalue())
            src = self._src_path(name)
            # Hand-maintained asm is always linked; C only once the unit is marked complete.
            complete = bool(src) and (src.endswith(".s") or "complete" in self.unit_flags.get(name, ()))
            self.unit_objs.append((name, start, src, complete))
        self._emit_linker_script()
        self._emit_build_files()
        print("wrote %d units, %d functions, %d labels to %s"
              % (len(units), len(self.an.functions), len(self.labels), self.out_dir))

    def _emit_label(self, out, addr, globals_, ends):
        name = self.labels.get(addr)
        if name is None:
            return
        if addr in self.an.functions:
            out.write("\n\tglabel %s\n" % name)
        elif addr in globals_:
            out.write("\tdlabel %s\n" % name)
        else:
            out.write("%s:\n" % name)

    def _emit_range(self, out, start, end, ends, globals_, jt_entries):
        open_funcs = []
        a = start
        pending = []

        def flush():
            for i in range(0, len(pending), 16):
                out.write("\t.byte " + ", ".join("0x%02X" % b for b in pending[i:i + 16]) + "\n")
            pending.clear()

        while a < end:
            for f in [f for f in open_funcs if ends[f] == a]:
                flush()
                out.write("\tendlabel %s\n" % self.labels[f])
                open_funcs.remove(f)
            if a in self.labels:
                flush()
                self._emit_label(out, a, globals_, ends)
                if a in self.an.functions:
                    open_funcs.append(a)
            k = self.kinds.get(a & ~1, DATA)
            if a & 1 == 0 and k == CODE:
                flush()
                insn = self.an.insns[a]
                lbl = self.labels.get(insn.target) if insn.target is not None else None
                if insn.target is not None and lbl is None:
                    sys.exit("unlabelled target %08X at %08X" % (insn.target, a))
                out.write("\t%s\n" % insn.text(lbl))
                a += 2
                continue
            if a in self.strings and not self._label_within(a + 1, a + self.strings[a]):
                flush()
                text = self.data[a - self.vram:a - self.vram + self.strings[a] - 1].decode("ascii")
                text = text.replace("\\", "\\\\").replace('"', '\\"').replace("\t", "\\t").replace("\n", "\\n")
                out.write('\t.asciz "%s"\n' % text)
                a += self.strings[a]
                continue
            if a in jt_entries and not self._label_within(a + 1, a + jt_entries[a][0]):
                flush()
                size, t, dispatch = jt_entries[a]
                if size == 2:
                    out.write("\t.short %s - %s\n" % (self.labels[t], self.labels[dispatch + 4]))
                else:
                    out.write("\t.long %s\n" % self.labels[t])
                a += size
                continue
            if a & 3 == 0 and a + 4 <= end and not self._label_within(a + 1, a + 4) \
                    and all(self.kinds.get(x, DATA) != CODE for x in (a, a + 2)):
                v = self.img.u32(a)
                sym = self._pointer(v, at=a)
                if sym is not None:
                    flush()
                    out.write("\t.long %s\n" % sym)
                    a += 4
                    continue
                if k == POOL_L:
                    flush()
                    out.write("\t.long 0x%08X\n" % v)
                    a += 4
                    continue
            if a & 1 == 0 and k == POOL_W and a + 2 <= end and not self._label_within(a + 1, a + 2):
                flush()
                out.write("\t.short 0x%04X\n" % self.img.u16(a))
                a += 2
                continue
            pending.append(self.data[a - self.vram])
            a += 1
        flush()
        for f in open_funcs:
            out.write("\tendlabel %s\n" % self.labels[f])

    def _label_within(self, lo, hi):
        return any(x in self.labels for x in range(lo, hi))

    def _emit_linker_script(self):
        path = os.path.join(ROOT, "build", self.region, self.name + ".ld")
        with open(path, "w") as ld:
            ld.write("ENTRY(_start)\n")
            for v in sorted(self.externs):
                ld.write("%s = 0x%08X;\n" % (self.externs[v], v))
            ld.write("SECTIONS\n{\n\t. = 0x%08X;\n\t.text : {\n" % self.vram)
            # One pattern list per object keeps its sections in file (address) order.
            for name, _, src, complete in self.unit_objs:
                kind = "src" if complete else "asm"
                ld.write("\t\tbuild/%s/%s/%s.o(.text.* .data.*)\n" % (self.region, kind, name))
            ld.write("\t}\n\t/DISCARD/ : { *(*) }\n}\n")

    def _emit_build_files(self):
        """build/<region>/units.mk for make, and objdiff.json at the repo root."""
        with open(os.path.join(ROOT, "build", self.region, "units.mk"), "w") as mk:
            mk.write("UNITS := %s\n" % " ".join(n for n, _, _, _ in self.unit_objs))
            mk.write("SRC_UNITS := %s\n" % " ".join(n for n, _, src, _ in self.unit_objs if src))
            mk.write("LINKED_UNITS := %s\n" % " ".join(n for n, _, _, c in self.unit_objs if c))
        cats = self.cfg.get("category", [])
        units = []
        for name, start, src, complete in self.unit_objs:
            unit = {"name": name, "target_path": "build/%s/asm/%s.o" % (self.region, name)}
            meta = {"complete": complete, "progress_categories": [self._unit_category(name, start)]}
            if src:
                unit["base_path"] = "build/%s/src/%s.o" % (self.region, name)
                meta["source_path"] = os.path.relpath(src, ROOT)
            unit["metadata"] = meta
            units.append(unit)
        project = {
            "$schema": "https://raw.githubusercontent.com/encounter/objdiff/main/config.schema.json",
            "custom_make": "make",
            "build_target": False,
            "build_base": True,
            "watch_patterns": ["*.c", "*.h", "*.s", "*.inc"],
            "progress_categories": [{"id": c["id"], "name": c["name"]} for c in cats],
            "units": units,
        }
        with open(os.path.join(ROOT, "objdiff.json"), "w") as f:
            json.dump(project, f, indent=2)
            f.write("\n")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("config")
    ap.add_argument("--discover", action="store_true", help="regenerate the function list")
    ap.add_argument("--units", action="store_true", help="propose unit boundaries in units.txt")
    ap.add_argument("--ghidra", default=os.path.join(ROOT, "build", "functions.csv"),
                    help="extra function starts exported by tools/ghidra/ExportFunctions.java")
    args = ap.parse_args()
    sp = Splitter(args.config)
    if args.discover:
        sp.discover(args.ghidra)
        return
    sp.analyze()
    if args.units:
        sp.propose_units()
        return
    sp.emit()


if __name__ == "__main__":
    main()
