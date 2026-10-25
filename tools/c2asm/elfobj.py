"""Minimal ELF32 big-endian reader for comparing relocatable objects.

Two objects match when every allocated section has the same bytes, the same
relocations (offset, type, symbol, addend) and the global symbols agree (name,
section, value, size, type), which is what objdiff checks per function.
"""
import struct


class Obj:
    def __init__(self, path):
        d = open(path, "rb").read()
        if d[:4] != b"\x7fELF" or d[4] != 1 or d[5] != 2:
            raise ValueError("%s: not an ELF32 big-endian object" % path)
        shoff, = struct.unpack_from(">I", d, 0x20)
        shentsize, shnum, shstrndx = struct.unpack_from(">HHH", d, 0x2E)
        shdrs = [struct.unpack_from(">IIIIIIIIII", d, shoff + i * shentsize) for i in range(shnum)]
        strtab = shdrs[shstrndx]

        def cstr(off, base):
            end = d.index(b"\0", base + off)
            return d[base + off:end].decode()
        self.names = [cstr(h[0], strtab[4]) for h in shdrs]
        self.sections = {}
        self.symbols = []
        self.relocs = {}
        symtab = None
        for i, h in enumerate(shdrs):
            if h[1] == 2:   # SHT_SYMTAB
                symtab = (i, h)
        syms = []
        if symtab:
            i, h = symtab
            strh = shdrs[h[6]]
            for k in range(h[5] // 16):
                name, value, size, info, other, shndx = struct.unpack_from(">IIIBBH", d, h[4] + 16 * k)
                n = cstr(name, strh[4]) if name else ""
                if info & 0xF == 3 and shndx < len(self.names):   # STT_SECTION
                    n = self.names[shndx]
                syms.append((n, value, size, info, shndx))
        self.symbols = syms
        for i, h in enumerate(shdrs):
            name = self.names[i]
            if h[1] in (1, 8) and h[2] & 2:   # PROGBITS/NOBITS, SHF_ALLOC
                self.sections[name] = d[h[4]:h[4] + h[5]] if h[1] == 1 else b"\0" * h[5]
            if h[1] == 4:   # SHT_RELA
                target = self.names[h[7]]
                rel = []
                for k in range(h[5] // 12):
                    off, info, addend = struct.unpack_from(">IIi", d, h[4] + 12 * k)
                    sym = syms[info >> 8]
                    rel.append((off, info & 0xFF, sym[0], addend))
                self.relocs[target] = sorted(rel)

    def globals(self):
        out = set()
        for n, value, size, info, shndx in self.symbols:
            if info >> 4 in (1, 2) and n:   # GLOBAL / WEAK
                sec = self.names[shndx] if 0 < shndx < len(self.names) else shndx
                out.add((n, sec, value, size, info & 0xF))
        return out


def compare(a_path, b_path):
    """-> list of differences (empty if the objects match)"""
    a, b = Obj(a_path), Obj(b_path)
    diffs = []
    for name in sorted(set(a.sections) | set(b.sections)):
        sa, sb = a.sections.get(name), b.sections.get(name)
        if sa is None or sb is None:
            if (sa or sb):
                diffs.append("section %s only in one object" % name)
            continue
        if sa != sb:
            k = next((i for i in range(min(len(sa), len(sb))) if sa[i] != sb[i]), min(len(sa), len(sb)))
            diffs.append("section %s differs at +0x%X (sizes %d/%d)" % (name, k, len(sa), len(sb)))
        ra, rb = a.relocs.get(name, []), b.relocs.get(name, [])
        if ra != rb:
            k = next((i for i in range(min(len(ra), len(rb))) if ra[i] != rb[i]), None)
            diffs.append("relocations of %s differ%s" % (
                name, "" if k is None else " first at %r vs %r" % (ra[k], rb[k])))
    ga, gb = a.globals(), b.globals()
    if ga != gb:
        diffs.append("global symbols differ: %s" % sorted(ga ^ gb)[:4])
    return diffs
