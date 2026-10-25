#!/usr/bin/env python3
"""Rename a symbol everywhere: symbol files, src/ (C, dialect, asm) and include/.

    rename.py OLD NEW            rename an existing symbol
    rename.py 0x0600D1A0 NEW     name an address (adds it to symbols.txt if unnamed)

Run `make check` afterwards: a source that still uses the old name fails to link.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
REGION = os.environ.get("REGION", "usa")
CFG = os.path.join(ROOT, "config", REGION)
SYM_RE = re.compile(r"^(\s*)(\w+)(\s*=\s*)(0x[0-9A-Fa-f]+)(.*)$")
SOURCES = ("src/**/*.c", "src/**/*.nc", "src/**/*.s", "include/**/*.h", "include/**/*.nch")


def symbol_files():
    return [os.path.join(CFG, "symbols.txt")] + sorted(glob.glob(os.path.join(CFG, "symbols", "*.txt")))


def defined_names():
    names = {}
    for f in symbol_files():
        for line in open(f):
            m = SYM_RE.match(line)
            if m:
                names[m.group(2)] = int(m.group(4), 16)
    return names


def main():
    if len(sys.argv) != 3:
        sys.exit(__doc__)
    old, new = sys.argv[1], sys.argv[2]
    if not re.fullmatch(r"[A-Za-z_]\w*", new):
        sys.exit("%s is not a valid identifier" % new)
    names = defined_names()
    if new in names:
        sys.exit("%s is already used for 0x%08X" % (new, names[new]))

    if re.fullmatch(r"0x[0-9A-Fa-f]+", old):
        addr = int(old, 16)
        owner = [n for n, a in names.items() if a == addr]
        if owner:
            old = owner[0]
        else:
            # Unnamed so far: the generated asm calls it func_/D_<addr>.
            with open(symbol_files()[0], "a") as f:
                f.write("%s = 0x%08X;\n" % (new, addr))
            old = None
            for prefix in ("func_", "D_", "lbl_"):
                cand = "%s%08X" % (prefix, addr)
                if any(re.search(r"\b%s\b" % cand, open(p, errors="replace").read())
                       for pat in SOURCES for p in glob.glob(os.path.join(ROOT, pat), recursive=True)):
                    old = cand
            if old is None:
                print("added %s = 0x%08X" % (new, addr))
                return

    word = re.compile(r"\b%s\b" % re.escape(old))
    changed = []
    for f in symbol_files():
        text = open(f).read()
        out = []
        for line in text.splitlines(keepends=True):
            m = SYM_RE.match(line)
            if m and m.group(2) == old:
                line = m.group(1) + new + m.group(3) + m.group(4) + m.group(5) + ("\n" if line.endswith("\n") else "")
            out.append(line)
        if "".join(out) != text:
            open(f, "w").write("".join(out))
            changed.append(f)
    for pat in SOURCES:
        for p in glob.glob(os.path.join(ROOT, pat), recursive=True):
            text = open(p, encoding="latin-1").read()
            new_text = word.sub(new, text)
            if new_text != text:
                open(p, "w", encoding="latin-1").write(new_text)
                changed.append(p)
    for p in changed:
        print("updated " + os.path.relpath(p, ROOT))
    if not changed:
        print("%s not found anywhere" % old)


if __name__ == "__main__":
    main()
