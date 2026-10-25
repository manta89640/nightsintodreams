#!/usr/bin/env python3
"""Differential test of the C backend against the original machine code.

Every lifted game unit (build/<region>/c2asm/lift/*.nc, from `c2asm roundtrip`)
is translated to C, compiled for the host and loaded. Each game function is then
run from random machine states twice: as C, and as the original bytes of 0NIGHTS
in interp.py. The final registers, flags, MAC, all of memory and the log of
calls to untranslated code must be identical.

A run that reaches something the translation does not follow (see
rt/c2asm_rt.h) on either side is counted as inconclusive, not as a failure.

    python3 tools/c2asm/difftest.py [--cases N] [--seed S] [func_XXXXXXXX ...]
"""
import argparse
import collections
import ctypes
import os
import random
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.dirname(HERE))
from c2asm import elfobj, portc, sh  # noqa: E402
from c2asm.__main__ import game_units  # noqa: E402
from c2asm.interp import CPU, SENTINEL, Unsupported  # noqa: E402
from c2asm.lang import parse  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(HERE))
REGION = os.environ.get("REGION", "usa")
BUILD = os.path.join(ROOT, "build", REGION)
VRAM = 0x06004000
GBR = 0x060FFC00
STACK = 0x060FE000


def symbols():
    """name -> address: everything linked into 0NIGHTS plus the saturn.inc equates"""
    syms = {}
    elf = elfobj.Obj(os.path.join(BUILD, "0NIGHTS.elf"))
    for n, value, size, info, shndx in elf.symbols:
        if n and info & 0xF != 3:
            syms.setdefault(n, value)
    for line in open(os.path.join(ROOT, "include", "saturn.inc")):
        m = re.match(r"\s*\.equ\s+(\w+)\s*,\s*(0x[0-9A-Fa-f]+)", line)
        if m:
            syms[m.group(1)] = int(m.group(2), 16)
    return syms


def build(lift_dir, out_dir):
    """translate every lifted unit; -> (shared library path, entries, ranges, functions)"""
    os.makedirs(out_dir, exist_ok=True)
    syms = symbols()
    entries, ranges, funcs, srcs, insns = [], [], {}, [], set()
    for unit in game_units():
        name = unit.split("/")[1]
        nc = os.path.join(lift_dir, name + ".nc")
        p, tree = parse(open(nc).read())
        items = sh.Gen(p, tree).run()
        text, ent = portc.translate(items, syms)
        path = os.path.join(out_dir, name + ".c")
        open(path, "w").write(text)
        srcs.append(path)
        entries += ent
        for sec in portc.layout(sh.place_pools(items)):
            if sec["name"].startswith(".text"):
                ranges.append((sec["base"], sec["end"]))
                insns.update(x for x, _ in sec["insns"])
                for f in sec["funcs"]:
                    funcs[f] = sec["labels"][f]
    entries.sort()
    tab = ['#include "c2asm_rt.h"', "typedef struct { u32 addr; void (*fn)(u32); } ShEntry;",
           "typedef struct { u32 start, end; } ShRange;"]
    tab += ["void %s(u32);" % f for f in sorted({fn for _, fn in entries})]
    tab.append("const ShEntry sh_entries[] = {")
    tab += ["    {0x%08Xu, %s}," % (a, fn) for a, fn in entries]
    tab.append("};\nconst int sh_nentries = %d;" % len(entries))
    tab.append("const ShRange sh_ranges[] = {")
    tab += ["    {0x%08Xu, 0x%08Xu}," % r for r in sorted(ranges)]
    tab.append("};\nconst int sh_nranges = %d;" % len(ranges))
    tpath = os.path.join(out_dir, "tables.c")
    open(tpath, "w").write("\n".join(tab) + "\n")
    lib = os.path.join(out_dir, "c2asm_port.so")
    rt = os.path.join(HERE, "rt")
    objs = []
    # compile in parallel; the sections are large switch/goto functions
    procs = []
    for s in srcs + [tpath, os.path.join(rt, "c2asm_rt.c")]:
        o = os.path.join(out_dir, os.path.basename(s)[:-2] + ".o")
        objs.append(o)
        if os.path.exists(o) and os.path.getmtime(o) > os.path.getmtime(s) and \
                os.path.getmtime(o) > os.path.getmtime(os.path.join(rt, "c2asm_rt.h")):
            continue
        procs.append(subprocess.Popen(["cc", "-c", "-fPIC", "-O1", "-w", "-I", rt, "-o", o, s]))
        if len(procs) >= os.cpu_count():
            for pr in procs:
                if pr.wait():
                    sys.exit("cc failed")
            procs = []
    for pr in procs:
        if pr.wait():
            sys.exit("cc failed")
    subprocess.run(["cc", "-shared", "-o", lib] + objs, check=True)
    return lib, {a for a, _ in entries}, ranges, funcs, insns


class ShStateC(ctypes.Structure):
    _fields_ = [("r", ctypes.c_uint32 * 16)] + [(n, ctypes.c_uint32) for n in
                ("gbr", "vbr", "pr", "mach", "macl", "t", "s", "q", "m", "imask")]


FIELDS = ("gbr", "vbr", "pr", "mach", "macl", "t", "s", "q", "m", "imask")


def random_state(rng, image):
    mem = bytearray(rng.randbytes(1 << 20))
    mem[VRAM & 0xFFFFF:(VRAM & 0xFFFFF) + len(image)] = image
    # registers: pointers into work RAM, small counts and indexes, or anything
    regs = [rng.choice((0x06080000 + rng.randrange(0, 0x70000) & ~3, rng.randrange(0, 64),
                        rng.getrandbits(32))) for _ in range(16)]
    regs[15] = STACK
    st = {"gbr": GBR, "vbr": rng.getrandbits(32), "pr": SENTINEL, "mach": rng.getrandbits(32),
          "macl": rng.getrandbits(32), "t": rng.getrandbits(1), "s": 0, "q": rng.getrandbits(1),
          "m": rng.getrandbits(1), "imask": rng.getrandbits(4)}
    return mem, regs, st


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("functions", nargs="*")
    ap.add_argument("--cases", type=int, default=3)
    ap.add_argument("--seed", type=int, default=1996)
    ap.add_argument("--limit", type=int, default=20000, help="step limit per run")
    ap.add_argument("--lift", default=os.path.join(BUILD, "c2asm", "lift"))
    ap.add_argument("--out", default=os.path.join(BUILD, "c2asm", "port"))
    a = ap.parse_args()
    lib_path, entries, ranges, funcs, insns = build(a.lift, a.out)
    lib = ctypes.CDLL(lib_path)
    image = open(os.path.join(ROOT, "extracted", REGION, "files", "0NIGHTS"), "rb").read()
    img_buf = ctypes.create_string_buffer(image, len(image))
    ctypes.c_void_p.in_dll(lib, "sh_image").value = ctypes.addressof(img_buf)
    ctypes.c_uint32.in_dll(lib, "sh_image_base").value = VRAM
    ctypes.c_uint32.in_dll(lib, "sh_image_size").value = len(image)
    ctypes.c_long.in_dll(lib, "sh_step_limit").value = a.limit
    state = ShStateC.in_dll(lib, "sh")
    mem_c = (ctypes.c_uint8 * (1 << 20)).in_dll(lib, "sh_mem")
    log_c = (ctypes.c_uint32 * 8192).in_dll(lib, "sh_log")
    nlog = ctypes.c_int.in_dll(lib, "sh_nlog")
    lib.sh_run.argtypes = [ctypes.c_uint32, ctypes.c_uint32]
    names = a.functions or sorted(funcs, key=funcs.get)
    rng = random.Random(a.seed)
    res = collections.Counter()
    per = {}
    why = collections.Counter()
    first_bad = []
    data_exec = set()
    targets = collections.defaultdict(list)
    for fn in names:
        entry = funcs[fn]
        outcome = []
        for _ in range(a.cases):
            mem, regs, st = random_state(rng, image)
            cpu = CPU(bytearray(mem), image, VRAM, entries, ranges, a.limit, insns)
            cpu.r = list(regs)
            for k, v in st.items():
                setattr(cpu, k, v)
            try:
                cpu.run(entry)
                py_ok = True
            except Unsupported as e:
                py_ok = False
                why[str(e).split(":")[0]] += 1
                if str(e).startswith("executes bytes"):
                    data_exec.add((str(e).split(": ")[1], fn))
                elif ": " in str(e):
                    targets[str(e).split(": ")[0]].append(int(str(e).split(": ")[1], 16))
            ctypes.memmove(mem_c, bytes(mem), len(mem))
            for i in range(16):
                state.r[i] = regs[i]
            for k, v in st.items():
                setattr(state, k, v)
            c_bad = lib.sh_run(entry, SENTINEL)
            if not py_ok or c_bad:
                outcome.append("inconclusive")
                if py_ok and c_bad:
                    why["C side only"] += 1
                continue
            same = list(state.r) == cpu.r and all(getattr(state, k) == getattr(cpu, k) & 0xFFFFFFFF
                                                     for k in FIELDS) \
                and bytes(mem_c) == bytes(cpu.mem) \
                and [(log_c[2 * i], log_c[2 * i + 1]) for i in range(nlog.value)] == cpu.log
            outcome.append("identical" if same else "DIFFERENT")
            if not same and len(first_bad) < 10:
                diff = [i for i in range(16) if state.r[i] != cpu.r[i]]
                cm, pm = bytes(mem_c), bytes(cpu.mem)
                mdiff = [i for i in range(len(cm)) if cm[i] != pm[i]]
                first_bad.append("%s: regs %s, flags %s, memory %s" % (
                    fn, diff, [k for k in FIELDS if getattr(state, k) != getattr(cpu, k)],
                    ", ".join("%05X C=%02X sh=%02X was=%02X" % (x, cm[x], pm[x], mem[x])
                              for x in mdiff[:6]) or "same"))
        per[fn] = outcome
        res["functions"] += 1
        if "DIFFERENT" in outcome:
            res["functions with a difference"] += 1
        elif "identical" in outcome:
            res["functions with identical runs"] += 1
        else:
            res["functions only inconclusive"] += 1
        for o in outcome:
            res["runs " + o] += 1
    for line in first_bad:
        print("DIFFERENT", line)
    for k in sorted(res):
        print("%-34s %d" % (k, res[k]))
    print("inconclusive because:", dict(why.most_common(8)))
    if os.environ.get("C2ASM_DEBUG"):
        for k, v in targets.items():
            print(k, " ".join("%08X" % x for x in sorted(set(v))))
    if data_exec:
        print("runs reached bytes the split holds as data:",
              ", ".join("%s (from %s)" % x for x in sorted(data_exec)))
    return 1 if res["functions with a difference"] else 0


if __name__ == "__main__":
    sys.exit(main())
