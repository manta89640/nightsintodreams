#!/usr/bin/env python3
"""Check tools/shc2gas.py against Hitachi's own toolchain.

Every tests/shc/*.c is compiled with SHC twice: once to an object linked by the
Hitachi linker (lnk + cnvs), once to assembly translated by shc2gas.py and built
with GNU as/ld. The two binaries must be identical. Needs SHC in compile/ and wine;
skipped otherwise.
"""
import glob
import os
import re
import shutil
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
import shc  # noqa: E402

BIN = os.path.join(ROOT, "toolchain", "bin")
BASE = 0x06010000


def externs(src_text):
    return sorted(set(re.findall(r"^\s*\.IMPORT\s+(\S+)", src_text, re.M)))


def main():
    if not shc.available():
        print("SHC not found in compile/; skipping")
        return
    bad = 0
    files = sorted(glob.glob(os.path.join(ROOT, "tests", "shc", "*.c")))
    for c in files:
        with tempfile.TemporaryDirectory(dir=os.path.join(ROOT, "build")) as tmp:
            name = os.path.splitext(os.path.basename(c))[0]
            shutil.copy(c, tmp)
            src = shc.compile_c(os.path.join(tmp, name + ".c"), asm=True)
            obj = shc.compile_c(os.path.join(tmp, name + ".c"), asm=False)
            imports = externs(open(src, encoding="latin-1").read())
            # Give every external a distinct address so relocations are checked too.
            addrs = {s: 0x06090000 + 0x100 * i for i, s in enumerate(imports)}
            ref = shc.link_reference(obj, BASE, addrs)

            gas = os.path.join(tmp, name + ".s")
            subprocess.run([sys.executable, os.path.join(ROOT, "tools", "shc2gas.py"), src, gas], check=True)
            o = os.path.join(tmp, name + ".o")
            subprocess.run([os.path.join(BIN, "sh-elf-as"), "--isa=sh2", "-big", "-o", o, gas], check=True)
            ld = os.path.join(tmp, name + ".ld")
            with open(ld, "w") as f:
                for s, a in addrs.items():
                    f.write("%s = 0x%08X;\n" % (s[1:], a))
                f.write("SECTIONS { . = 0x%08X; P : { *(.text.P) } C : { *(.rodata.C) } D : { *(.data.D) }"
                        " B : { *(.bss.B) } /DISCARD/ : { *(*) } }\n" % BASE)
            elf = os.path.join(tmp, name + ".elf")
            subprocess.run([os.path.join(BIN, "sh-elf-ld"), "--no-warn-rwx-segments", "-T", ld, "-o", elf, o],
                           check=True)
            out = os.path.join(tmp, name + ".bin")
            subprocess.run([os.path.join(BIN, "sh-elf-objcopy"), "-O", "binary", "-R", "B", elf, out], check=True)
            got = open(out, "rb").read()
            if got != ref:
                bad += 1
                diff = next((i for i in range(min(len(got), len(ref))) if got[i] != ref[i]), min(len(got), len(ref)))
                print("MISMATCH %s: %d vs %d bytes, first difference at +0x%X" % (name, len(got), len(ref), diff))
            else:
                print("ok %s (%d bytes)" % (name, len(got)))
    sys.exit(1 if bad else 0)


if __name__ == "__main__":
    main()
