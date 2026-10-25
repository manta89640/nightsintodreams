#!/usr/bin/env python3
"""Compile every src/**/<unit>.ref.c with SHC and report how close it is to the original.

    refcheck.py [unit ...]

A .ref.c is the readable C kept next to a unit whose matching source is in the
c2asm dialect, because SHC 5.0 can't reproduce the original compiler for all of
it. This keeps that C compiling and shows, per function, whether it still matches.
"""
import glob
import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
import fncmp  # noqa: E402

REGION = os.environ.get("REGION", "usa")
BIN = os.path.join(ROOT, "toolchain", "bin")


def check(unit):
    src = os.path.join(ROOT, "src", unit + ".ref.c")
    out = os.path.join(ROOT, "build", REGION, "ref", unit)
    os.makedirs(os.path.dirname(out), exist_ok=True)
    subprocess.run([sys.executable, os.path.join(ROOT, "tools", "shc.py"), "cc", src, out + ".s"], check=True)
    subprocess.run([os.path.join(BIN, "sh-elf-as"), "--isa=sh2", "-big", "-I", os.path.join(ROOT, "include"),
                    "-o", out + ".o", out + ".s"], check=True)
    target = fncmp.functions(os.path.join(ROOT, "build", REGION, "asm", unit + ".o"))
    base = fncmp.functions(out + ".o")
    matched = sum(1 for n in target if n in base and target[n] == base[n])
    return matched, len(target), sum(1 for n in target if n in base)


def main():
    units = sys.argv[1:] or sorted(os.path.relpath(p, os.path.join(ROOT, "src"))[:-len(".ref.c")]
                                   for p in glob.glob(os.path.join(ROOT, "src", "**", "*.ref.c"), recursive=True))
    subprocess.run(["make", "--no-print-directory", "-C", ROOT] +
                   ["build/%s/asm/%s.o" % (REGION, u) for u in units], check=True, capture_output=True)
    total = [0, 0, 0]
    for u in units:
        m, n, written = check(u)
        total = [total[0] + m, total[1] + n, total[2] + written]
        print("%-20s %3d/%-3d functions match as C (%d written)" % (u, m, n, written))
    print("reference C: %d/%d functions match, %d written" % tuple(total))


if __name__ == "__main__":
    main()
