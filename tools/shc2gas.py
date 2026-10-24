#!/usr/bin/env python3
"""Translate Hitachi SHC assembler output (.src) into GNU as source.

    shc2gas.py in.src out.s

SHC prefixes C names with `_`; that one underscore is dropped so C names line up
with the names in symbols.txt. Static functions and variables are emitted by SHC
under anonymous `Lnnn` labels, with the C name only in a comment; those get their
C name back (as local symbols) so objdiff can pair them with the target.
"""
import re
import sys

REGISTERS = {"R%d" % i for i in range(16)} | {"PC", "GBR", "VBR", "SR", "PR", "MACH", "MACL"}
IDENT = re.compile(r"[A-Za-z_$][A-Za-z0-9_$]*")
NUMBER = re.compile(r"([HBDQO])'([0-9A-Fa-f]+)")
DATA_SIZES = {"L": (".long", 4), "W": (".short", 2), "B": (".byte", 1)}


def split_comment(line):
    """Split at the first `;` outside a string."""
    quoted = False
    for i, ch in enumerate(line):
        if ch == '"':
            quoted = not quoted
        elif ch == ";" and not quoted:
            return line[:i], line[i + 1:].strip()
    return line, ""


def number(m):
    base, digits = m.group(1).upper(), m.group(2)
    if base == "H":
        return "0x" + digits
    if base == "B":
        return "0b" + digits
    if base in "QO":
        return "0" + digits
    return digits


class Translator:
    def __init__(self, lines):
        self.lines = lines
        self.names = {}  # SHC label -> GNU as name
        self.functions = set()  # SHC labels that start a C function
        for line in lines:
            m = re.match(r"^(\w+):", line)
            if not m:
                continue
            label = m.group(1)
            _, comment = split_comment(line)
            cm = re.match(r"(function|static):\s*(\w+)", comment)
            if cm and cm.group(1) == "function":
                self.functions.add(label)
            if re.fullmatch(r"L\d+", label):
                self.names[label] = cm.group(2) if cm else ".L" + label[1:]

    def symbol(self, name):
        if name in self.names:
            return self.names[name]
        if name.upper() in REGISTERS:
            return name
        if name.startswith("_"):
            return name[1:]
        return name

    def operands(self, text):
        out = []
        pos = 0
        for m in re.finditer(r'"(?:[^"]|"")*"', text):
            out.append(self._expr(text[pos:m.start()]))
            out.append(self._string(m.group()))
            pos = m.end()
        out.append(self._expr(text[pos:]))
        return "".join(out)

    def _expr(self, text):
        text = NUMBER.sub(number, text)
        return IDENT.sub(lambda m: m.group() if text[max(0, m.start() - 2):m.start()] == "0x"
                         else self.symbol(m.group()), text)

    @staticmethod
    def _string(tok):
        # Hitachi doubles a quote inside a string; GNU as escapes it.
        body = tok[1:-1].replace('""', '"')
        return '"' + body.replace("\\", "\\\\").replace('"', '\\"') + '"'

    def directive(self, name, args):
        name = name.upper()
        if name in (".IMPORT", ".END", ".LINE", ".FILE", ".STACK"):
            return []
        if name == ".EXPORT":
            return ["\t.global " + ", ".join(self.symbol(a.strip()) for a in args.split(","))]
        if name == ".SECTION":
            parts = [p.strip() for p in args.split(",")]
            sect, kind = parts[0], parts[1].upper() if len(parts) > 1 else "CODE"
            align = 1
            for p in parts[2:]:
                if p.upper().startswith("ALIGN="):
                    align = int(p.split("=")[1])
            # Named like the target's `.text.<addr>` / `.data.<addr>` so objdiff, which
            # merges sections by base name, pairs them: P -> .text.P and so on.
            if kind == "CODE":
                name, flags = ".text." + sect, '"ax",@progbits'
            elif sect.upper() == "B":
                name, flags = ".bss." + sect, '"aw",@nobits'
            elif sect.upper() == "C":
                name, flags = ".rodata." + sect, '"a",@progbits'
            else:
                name, flags = ".data." + sect, '"aw",@progbits'
            return ["\t.section %s,%s" % (name, flags), "\t.p2align %d" % (align.bit_length() - 1)]
        m = re.fullmatch(r"\.DATA\.([LWB])", name)
        if m:
            return ["\t%s %s" % (DATA_SIZES[m.group(1)][0], self.operands(args))]
        m = re.fullmatch(r"\.DATAB\.([LWB])", name)
        if m:
            count, value = [a.strip() for a in self.operands(args).split(",", 1)]
            return ["\t.fill %s, %d, %s" % (count, DATA_SIZES[m.group(1)][1], value)]
        m = re.fullmatch(r"\.RES\.([LWB])", name)
        if m:
            return ["\t.space (%s) * %d" % (self.operands(args), DATA_SIZES[m.group(1)][1])]
        if name == ".SDATA":
            return ["\t.ascii " + self.operands(args)]
        if name == ".SDATAZ":
            return ["\t.asciz " + self.operands(args)]
        if name == ".ALIGN":
            return ["\t.balign %s" % self.operands(args)]
        raise ValueError("unsupported SHC directive %s" % name)

    def translate(self):
        # Functions get a type and an exact size (ending before any section
        # padding), as objdiff sizes them by symbol.
        out = []
        current = None

        def close():
            nonlocal current
            if current:
                out.append("\t.size %s, . - %s" % (current, current))
            current = None

        for raw in self.lines:
            code, _ = split_comment(raw.rstrip("\n"))
            if not code.strip():
                continue
            m = re.match(r"^(\w+):(.*)$", code)
            if m:
                if m.group(1) in self.functions:
                    close()
                    current = self.symbol(m.group(1))
                    out.append("\t.type %s, @function" % current)
                out.append("%s:" % self.symbol(m.group(1)))
                code = m.group(2)
                if not code.strip():
                    continue
            fields = code.strip().split(None, 1)
            op, args = fields[0], fields[1] if len(fields) > 1 else ""
            if op.startswith("."):
                if op.upper() in (".SECTION", ".END"):
                    close()
                out += self.directive(op, args)
            else:
                out.append("\t%s\t%s" % (op.lower(), self.operands(args)) if args else "\t" + op.lower())
        close()
        return "\n".join(out) + "\n"


def main():
    src, dst = sys.argv[1], sys.argv[2]
    lines = open(src, encoding="latin-1").readlines()
    text = Translator(lines).translate()
    with open(dst, "w") as f:
        f.write(text)


if __name__ == "__main__":
    main()
