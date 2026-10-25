"""c2asm command line.

    python3 tools/c2asm compile SRC.nc -o OUT.s        dialect -> GNU as
    python3 tools/c2asm emit-c SRC.nc -o OUT.c         dialect -> portable C
    python3 tools/c2asm lift UNIT.s -o OUT.nc          generated asm -> dialect
    python3 tools/c2asm roundtrip [UNIT ...]           lift + compile every game unit and
                                                       compare objects with the targets
"""
import argparse
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.dirname(HERE))

from c2asm import elfobj, lift, sh  # noqa: E402
from c2asm.lang import Error  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(HERE))
BIN = os.path.join(ROOT, "toolchain", "bin")
REGION = os.environ.get("REGION", "usa")


def game_units():
    """the game units the current split links (build/<region>/units.mk)"""
    for line in open(os.path.join(ROOT, "build", REGION, "units.mk")):
        if line.startswith("UNITS :="):
            return [u for u in line.split()[2:] if u.startswith("game/")]
    raise SystemExit("no UNITS in units.mk; run make check first")


def read_source(path):
    """A dialect file, run through the C preprocessor if it uses #include/#define,
    so units can share headers in include/. Files without directives are read as
    is, which keeps parser error line numbers exact."""
    text = open(path).read()
    if not any(l.lstrip().startswith("#") for l in text.splitlines()):
        return text
    res = subprocess.run(["cc", "-E", "-P", "-x", "c", "-I", os.path.join(ROOT, "include"), path],
                         capture_output=True, text=True)
    if res.returncode:
        raise SystemExit(res.stderr)
    return res.stdout


def assemble(src, obj):
    subprocess.run([os.path.join(BIN, "sh-elf-as"), "--isa=sh2", "-big", "-I", os.path.join(ROOT, "include"),
                    "-o", obj, src], check=True, capture_output=True, text=True)


def function_matches(target, ours):
    """per global function: does its byte range and its relocations match?"""
    a, b = elfobj.Obj(target), elfobj.Obj(ours)
    res = {}
    for n, sec, value, size, typ in a.globals():
        if typ != 2:   # STT_FUNC
            continue
        sa, sb = a.sections.get(sec, b""), b.sections.get(sec, b"")
        same = sa[value:value + size] == sb[value:value + size]
        ra = [r for r in a.relocs.get(sec, []) if value <= r[0] < value + size]
        rb = [r for r in b.relocs.get(sec, []) if value <= r[0] < value + size]
        res[n] = (same and ra == rb, size)
    return res


def roundtrip(units, out_dir, verbose=False):
    os.makedirs(out_dir, exist_ok=True)
    tot = {"units": 0, "units_ok": 0, "funcs": 0, "funcs_ok": 0, "bytes": 0, "bytes_ok": 0,
           "auto": 0, "explicit": 0, "nopool": 0, "insns": 0, "if": 0, "else": 0, "do": 0}
    failures = []
    for s in units:
        name = os.path.splitext(os.path.basename(s))[0]
        target = os.path.splitext(s)[0] + ".o"
        tot["units"] += 1
        nc = os.path.join(out_dir, name + ".nc")
        gas = os.path.join(out_dir, name + ".s")
        obj = os.path.join(out_dir, name + ".o")
        try:
            text, stats = lift.lift(open(s).read())
            open(nc, "w").write(text)
            for k in ("auto", "explicit", "nopool", "insns", "if", "else", "do"):
                tot[k] += stats[k]
            open(gas, "w").write(sh.compile_source(text))
            assemble(gas, obj)
        except (lift.LiftError, Error, subprocess.CalledProcessError) as e:
            msg = getattr(e, "stderr", None) or str(e)
            failures.append((name, "error: " + msg.strip().splitlines()[-1] if msg.strip() else str(e)))
            fm = {n: (False, size) for n, (ok, size) in function_matches(target, target).items()}
        else:
            diffs = elfobj.compare(target, obj)
            if not diffs:
                tot["units_ok"] += 1
            else:
                failures.append((name, diffs[0]))
            fm = function_matches(target, obj)
        for n, (ok, size) in fm.items():
            tot["funcs"] += 1
            tot["bytes"] += size
            if ok:
                tot["funcs_ok"] += 1
                tot["bytes_ok"] += size
    return tot, failures


def main():
    ap = argparse.ArgumentParser(prog="c2asm", description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    for c in ("compile", "emit-c", "lift"):
        p = sub.add_parser(c)
        p.add_argument("src")
        p.add_argument("-o", "--out", required=True)
    p = sub.add_parser("roundtrip")
    p.add_argument("units", nargs="*", help="unit names (default: every game unit)")
    p.add_argument("--out", default=os.path.join(ROOT, "build", REGION, "c2asm", "lift"))
    p.add_argument("-v", "--verbose", action="store_true")
    a = ap.parse_args()
    try:
        if a.cmd == "compile":
            open(a.out, "w").write(sh.compile_source(read_source(a.src)))
        elif a.cmd == "emit-c":
            from c2asm import portc
            from c2asm.difftest import symbols    # addresses from build/<region>/0NIGHTS.elf
            open(a.out, "w").write(portc.compile_source(read_source(a.src), symbols()))
        elif a.cmd == "lift":
            text, _ = lift.lift(open(a.src).read())
            open(a.out, "w").write(text)
        else:
            asm = os.path.join(ROOT, "build", REGION, "asm", "game")
            units = [os.path.join(asm, u.split("/")[-1] + ".s") for u in a.units or game_units()]
            tot, failures = roundtrip(units, a.out, a.verbose)
            for name, why in failures[:40] if not a.verbose else failures:
                print("%-10s %s" % (name, why))
            pct = lambda x, y: 100.0 * x / y if y else 0.0  # noqa: E731
            print("units %d/%d (%.1f%%), functions %d/%d (%.1f%%), function bytes %d/%d (%.1f%%)" % (
                tot["units_ok"], tot["units"], pct(tot["units_ok"], tot["units"]),
                tot["funcs_ok"], tot["funcs"], pct(tot["funcs_ok"], tot["funcs"]),
                tot["bytes_ok"], tot["bytes"], pct(tot["bytes_ok"], tot["bytes"])))
            print("literals: %d from asmsh pools, %d explicit; %d __nopool; %d instructions" % (
                tot["auto"], tot["explicit"], tot["nopool"], tot["insns"]))
            print("structured: %d if, %d if/else, %d do-while" % (tot["if"], tot["else"], tot["do"]))
            return 0 if tot["units_ok"] == tot["units"] else 1
    except (Error, lift.LiftError) as e:
        sys.exit("%s: %s" % (a.src, e))
    return 0


if __name__ == "__main__":
    sys.exit(main())
