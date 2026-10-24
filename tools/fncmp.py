#!/usr/bin/env python3
"""Compare the functions of a unit's base object (built from src/) with the target.

    fncmp.py sbl/0606C318              summary: which functions match
    fncmp.py sbl/0606C318 func_0606C33C   side-by-side diff of one function

Builds both objects with make first. Instructions are compared with their bytes,
and relocations by symbol name and addend, which is what objdiff checks as well.
"""
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OBJDUMP = os.path.join(ROOT, "toolchain", "bin", "sh-elf-objdump")
REGION = os.environ.get("REGION", "usa")

INSN = re.compile(r"^\s*([0-9a-f]+):\s+((?:[0-9a-f]{2} )+)\s*(.*)$")
RELOC = re.compile(r"^\s*([0-9a-f]+):\s+(R_SH_\w+)\s+(.*)$")
LABEL = re.compile(r"^([0-9a-f]+) <(.+)>:$")


def sizes(obj):
    out = subprocess.run([OBJDUMP, "-t", obj], capture_output=True, text=True, check=True).stdout
    res = {}
    for line in out.splitlines():
        parts = line.split()
        if len(parts) >= 5 and re.fullmatch(r"[0-9a-f]{8}", parts[-2]):
            res[parts[-1]] = int(parts[-2], 16)
    return res


def functions(obj):
    """name -> list of (offset, text) for every code symbol in obj, cut at its size."""
    size = sizes(obj)
    out = subprocess.run([OBJDUMP, "-dr", "-z", obj], capture_output=True, text=True, check=True).stdout
    funcs, cur, base = {}, None, 0
    for line in out.splitlines():
        m = LABEL.match(line)
        if m:
            name = m.group(2)
            if name.startswith(".L"):
                continue
            cur, base = name, int(m.group(1), 16)
            funcs[cur] = []
            continue
        if line.startswith("Disassembly of section"):
            cur = None
            continue
        if cur is None:
            continue
        m = RELOC.match(line)
        if m:
            funcs[cur].append((int(m.group(1), 16) - base, "reloc %s %s" % (m.group(2), m.group(3).strip())))
            continue
        m = INSN.match(line)
        if m:
            text = re.sub(r"\s+", " ", m.group(3).split("!")[0]).strip()
            # PC-relative operands print as absolute offsets; the raw bytes already
            # pin the displacement, so compare those and show the mnemonic.
            funcs[cur].append((int(m.group(1), 16) - base, "%s| %s" % (m.group(2).strip(), text)))
    for name, rows in funcs.items():
        if size.get(name):
            funcs[name] = [r for r in rows if r[0] < size[name]]
    return funcs


def build(unit):
    objs = ["build/%s/asm/%s.o" % (REGION, unit), "build/%s/src/%s.o" % (REGION, unit)]
    res = subprocess.run(["make", "--no-print-directory"] + objs, cwd=ROOT, capture_output=True, text=True)
    if res.returncode:
        sys.exit(res.stdout + res.stderr)
    return [os.path.join(ROOT, o) for o in objs]


def side_by_side(name, t, b):
    width = 44
    rows = max(len(t), len(b))
    print("%-*s   %s" % (width, "target " + name, "base"))
    for i in range(rows):
        lt = t[i][1] if i < len(t) else ""
        lb = b[i][1] if i < len(b) else ""
        mark = "  " if lt == lb else "!!"
        print("%-*s %s %s" % (width, lt[:width], mark, lb[:width]))


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    unit = sys.argv[1]
    target_obj, base_obj = build(unit)
    target, base = functions(target_obj), functions(base_obj)
    if len(sys.argv) > 2:
        for name in sys.argv[2:]:
            if name not in target:
                print("%s is not a function in the target" % name)
                continue
            side_by_side(name, target[name], base.get(name, []))
        return
    matched = 0
    for name in target:
        if name not in base:
            continue
        ok = target[name] == base[name]
        matched += ok
        if not ok:
            diffs = sum(1 for x, y in zip(target[name], base[name]) if x != y) + abs(len(target[name]) - len(base[name]))
            print("DIFF   %-28s %d line(s) differ" % (name, diffs))
        else:
            print("match  %s" % name)
    extra = [n for n in base if n not in target]
    for n in extra:
        print("EXTRA  %s (in base only; misnamed or static without a name?)" % n)
    todo = [n for n in target if n not in base]
    print("%s: %d/%d functions match, %d not written yet" % (unit, matched, len(target), len(todo)))


if __name__ == "__main__":
    main()
