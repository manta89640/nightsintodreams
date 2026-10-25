#!/usr/bin/env python3
"""Tests for tools/c2asm.

1. Every SH-2 opcode (all of them that are not PC-relative, plus each
   PC-relative form for every register) is lifted to the dialect, compiled back
   and assembled; the object must equal the one assembled from the original.
2. tests/c2asm/*.nc (hand-written dialect) must compile to the bytes of the
   functions in 0NIGHTS. Needs extracted/usa/files/0NIGHTS; skipped otherwise.
3. Every game unit in build/usa/asm/game must lift and recompile to an identical
   object, and 0NIGHTS linked from the lifted objects must keep its SHA-1.
   Needs `make check` to have run; skipped otherwise.
4. The C translation of every lifted function, run once from a random state, must
   end in the same state as the original bytes in the SH-2 interpreter
   (tools/c2asm/difftest.py). Needs (3) and a host C compiler.
"""
import glob
import hashlib
import os
import re
import subprocess
import sys
import tempfile
import tomllib

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
import sh2dis  # noqa: E402
from c2asm import elfobj, lift, sh  # noqa: E402
from c2asm.__main__ import game_units, roundtrip  # noqa: E402

BIN = os.path.join(ROOT, "toolchain", "bin")
IMAGE = os.path.join(ROOT, "extracted", "usa", "files", "0NIGHTS")
VRAM = 0x06004000
HEADER = '\t.include "macro.inc"\n\t.include "saturn.inc"\n'


def assemble(src_text, obj, tmp):
    path = obj[:-2] + ".s"
    open(path, "w").write(src_text)
    subprocess.run([os.path.join(BIN, "sh-elf-as"), "--isa=sh2", "-big", "-I", os.path.join(ROOT, "include"),
                    "-o", obj, path], check=True)


def opcode_source():
    lines = [HEADER, '\t.section .text.06010000,"ax",@progbits', "\t.p2align 2", "\tglabel test_ops"]
    for w in range(0x10000):
        i = sh2dis.decode(w, 0x06010000)
        if i is None or i.target is not None:
            continue
        lines.append("\t" + i.text())
        if i.delay:
            lines.append("\tnop")
    lines.append("\tendlabel test_ops")
    # PC-relative forms, for every register
    lines += ['\t.section .text.06020000,"ax",@progbits', "\t.p2align 2", "\tglabel test_pcrel"]
    body = []
    for n in range(16):
        body += ["mov.w\t.Lw,r%d" % n, "mov.l\t.Ll,r%d" % n]
    body += ["mova\t.Ll,r0", "bt\t.Lt", "bf\t.Lt", "bt/s\t.Lt", "add\t#1,r1", "bf/s\t.Lt", "nop",
             "bra\t.Lt", "mov\t#2,r2", "bsr\t.Lt", "nop"]
    lines += ["\t" + b for b in body]
    lines += [".Lt:", "\trts", "\tnop"]
    count = len(body) + 2
    if count % 2:
        lines.append("\t.short 0x0000")
    lines += [".Lw:", "\t.short 0x1234", "\t.short 0x0000", ".Ll:", "\t.long test_ops + 8",
              "\tendlabel test_pcrel"]
    return "\n".join(lines) + "\n"


def test_opcodes():
    with tempfile.TemporaryDirectory(dir=os.path.join(ROOT, "build")) as tmp:
        orig = opcode_source()
        assemble(orig, os.path.join(tmp, "orig.o"), tmp)
        text, stats = lift.lift(orig)
        open(os.path.join(tmp, "ops.nc"), "w").write(text)
        assemble(sh.compile_source(text), os.path.join(tmp, "ours.o"), tmp)
        diffs = elfobj.compare(os.path.join(tmp, "orig.o"), os.path.join(tmp, "ours.o"))
        assert not diffs, diffs
        print("opcodes: %d instructions lift and recompile identically" % stats["insns"])


def link_at_names(gas_text, tmp, name):
    """Assemble and link a compiled fixture: each .text.XXXXXXXX section at its
    address, func_/D_ symbols at theirs. -> {function: (address, bytes)}"""
    defined = set(re.findall(r"glabel (\w+)", gas_text))
    # a 12-bit bsr/bra to an outside function has no relocation in GNU as: define
    # the target relative to the section that branches to it
    out, sec = [], None
    sets = {}
    for line in gas_text.splitlines():
        out.append(line)
        m = re.match(r"\t\.section (\.text\.([0-9A-F]{8}))", line)
        if m:
            sec = m.group(2)
        if line == "\t.p2align 2" and sec:
            out.append(".Lbase_%s:" % sec)
            out.append("@SETS_%s@" % sec)
        m = re.match(r"\t(?:bsr|bra)\t(func_([0-9A-F]{8}))$", line)
        if m and m.group(1) not in defined:
            sets.setdefault(sec, set()).add(m.group(1))
    text = "\n".join(out) + "\n"
    for s in set(re.findall(r"@SETS_(\w+)@", text)):
        lines = "\n".join("\t.set %s, .Lbase_%s %+d" % (n, s, int(n[5:], 16) - int(s, 16))
                          for n in sorted(sets.get(s, ())))
        text = text.replace("@SETS_%s@" % s, lines)
    obj = os.path.join(tmp, name + ".o")
    assemble(text, obj, tmp)
    o = elfobj.Obj(obj)
    undef = set(re.findall(r"\b((?:func|D)_[0-9A-F]{8})\b", text)) - defined - \
        {n for v in sets.values() for n in v}
    ld = os.path.join(tmp, name + ".ld")
    with open(ld, "w") as f:
        f.write("SECTIONS {\n")
        for s in o.sections:
            if s.startswith(".text."):
                f.write("  %s 0x%s : { *(%s) }\n" % (s, s[6:], s))
        f.write("  /DISCARD/ : { *(*) }\n}\n")
    elf = os.path.join(tmp, name + ".elf")
    subprocess.run([os.path.join(BIN, "sh-elf-ld"), "-EB", "--no-warn-rwx-segments", "-T", ld, "-e", "0",
                    "-o", elf, obj] + ["--defsym=%s=0x%s" % (n, n[-8:]) for n in sorted(undef)], check=True)
    e = elfobj.Obj(elf)
    funcs = {}
    for n, sec, value, size, typ in e.globals():
        if typ == 2:
            base = int(sec[6:], 16)
            data = e.sections[sec]
            funcs[n] = (value, data[value - base:value - base + size])
    return funcs


def test_fixtures():
    if not os.path.exists(IMAGE):
        print("fixtures: no %s; skipping" % os.path.relpath(IMAGE, ROOT))
        return
    image = open(IMAGE, "rb").read()
    n = 0
    with tempfile.TemporaryDirectory(dir=os.path.join(ROOT, "build")) as tmp:
        for path in sorted(glob.glob(os.path.join(ROOT, "tests", "c2asm", "*.nc"))):
            name = os.path.splitext(os.path.basename(path))[0]
            funcs = link_at_names(sh.compile_source(open(path).read()), tmp, name)
            for fn, (addr, data) in sorted(funcs.items()):
                want = image[addr - VRAM:addr - VRAM + len(data)]
                assert fn == "func_%08X" % addr, (fn, hex(addr))
                assert data == want, "%s: %s does not match 0NIGHTS" % (name, fn)
                n += 1
    print("fixtures: %d hand-written functions match 0NIGHTS" % n)


def test_roundtrip():
    if not os.path.exists(os.path.join(ROOT, "build", "usa", "units.mk")):
        print("roundtrip: no build/usa/units.mk (run make check); skipping")
        return
    out = os.path.join(ROOT, "build", "usa", "c2asm", "lift")
    asm = os.path.join(ROOT, "build", "usa", "asm", "game")
    units = game_units()
    tot, failures = roundtrip([os.path.join(asm, u.split("/")[1] + ".s") for u in units], out)
    assert not failures, failures[:5]
    # link the lifted objects in place of the generated ones
    ld = open(os.path.join(ROOT, "build", "usa", "0NIGHTS.ld")).read()
    ld = re.sub(r"build/usa/asm/(game/[0-9A-F]+)\.o", lambda m: "build/usa/c2asm/lift/%s.o" % m.group(1)[5:], ld)
    path = os.path.join(ROOT, "build", "usa", "c2asm", "0NIGHTS_lift.ld")
    open(path, "w").write(ld)
    elf = path[:-3] + ".elf"
    binf = path[:-3]
    subprocess.run([os.path.join(BIN, "sh-elf-ld"), "-T", path, "-o", elf], check=True, cwd=ROOT)
    subprocess.run([os.path.join(BIN, "sh-elf-objcopy"), "-O", "binary", elf, binf], check=True)
    cfg = tomllib.load(open(os.path.join(ROOT, "config", "usa", "0NIGHTS.toml"), "rb"))
    assert hashlib.sha1(open(binf, "rb").read()).hexdigest() == cfg["sha1"], "lifted 0NIGHTS SHA-1 differs"
    print("roundtrip: %d game units, %d functions (%d bytes) lift and recompile identically; "
          "0NIGHTS from the lifted units matches its SHA-1" % (tot["units"], tot["funcs"], tot["bytes"]))


def test_difftest():
    if not os.path.exists(os.path.join(ROOT, "build", "usa", "c2asm", "lift")) or not os.path.exists(IMAGE):
        print("difftest: nothing lifted; skipping")
        return
    r = subprocess.run([sys.executable, os.path.join(ROOT, "tools", "c2asm", "difftest.py"), "--cases", "1"],
                       capture_output=True, text=True)
    summary = dict(re.findall(r"^(functions[\w ]*?|runs \w+)\s+(\d+)$", r.stdout, re.M))
    assert r.returncode == 0, r.stdout[-2000:] + r.stderr[-2000:]
    print("difftest: %s of %s functions run identically as C and as SH-2 code, none differ" % (
        summary.get("functions with identical runs"), summary.get("functions")))


def main():
    test_opcodes()
    test_fixtures()
    test_roundtrip()
    test_difftest()


if __name__ == "__main__":
    main()
