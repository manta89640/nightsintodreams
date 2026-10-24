#!/usr/bin/env python3
"""Run the Hitachi SHC toolchain (from compile/, under wine).

    shc.py cc in.c out.s [shc options...]   compile C to GNU as source (via shc2gas)

Default options are FLAGS below. A source file can add its own on a first-line
comment, `/* shc-flags: -size */`, and options on the command line come last.
"""
import os
import re
import shutil
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SHC_DIR = os.environ.get("SHC_DIR", os.path.join(ROOT, "compile"))
BIN = os.path.join(ROOT, "toolchain", "bin")

# The flags that match the SBL code in 0NIGHTS (see docs/disc-layout.md).
FLAGS = ["-cpu=sh2", "-optimize=1", "-rtnext"]


def available():
    return os.path.exists(os.path.join(SHC_DIR, "shc.exe")) and shutil.which("wine") is not None


def winpath(path):
    return "Z:" + os.path.abspath(path).replace("/", "\\")


def _run(tool, args, cwd, inc=None):
    # SHC limits its command line and environment strings (about 128 and 100
    # characters), so it always runs in a short temp dir with relative paths.
    env = dict(os.environ, WINEDEBUG="-all", MVK_CONFIG_LOG_LEVEL="0",
               SHC_LIB=winpath(os.path.realpath(SHC_DIR)), SHC_TMP=winpath(cwd),
               SHC_INC=winpath(inc or cwd))
    res = subprocess.run(["wine", os.path.join(SHC_DIR, tool)] + args, cwd=cwd, env=env,
                         capture_output=True, text=True, errors="replace")
    out = "\n".join(l for l in res.stdout.splitlines() if "(E)" in l or "(F)" in l or "(W)" in l
                    or "ERROR" in l.upper() and "0 ERROR" not in l.upper())
    return res, out


def short_tempdir():
    return tempfile.mkdtemp(prefix="shc", dir="/tmp" if os.path.isdir("/tmp") else None)


def compile_c(c_path, asm, flags=()):
    """Compile with SHC. Returns the .src (asm=True) or .obj path next to the input."""
    base = os.path.splitext(os.path.basename(c_path))[0]
    out_name = base + (".src" if asm else ".obj")
    out = os.path.join(os.path.dirname(os.path.abspath(c_path)), out_name)
    if os.path.exists(out):
        os.remove(out)
    tmp = short_tempdir()
    try:
        shutil.copy(c_path, os.path.join(tmp, "in.c"))
        shutil.copytree(os.path.join(ROOT, "include"), os.path.join(tmp, "inc"))
        args = FLAGS + list(flags) + ["-nolistfile", "-objectfile=" + out_name]
        if asm:
            args.append("-code=asmcode")
        res, errors = _run("shc.exe", args + ["in.c"], tmp, inc=os.path.join(tmp, "inc"))
        if not os.path.exists(os.path.join(tmp, out_name)):
            sys.exit("SHC failed on %s:\n%s" % (c_path, errors or res.stdout))
        if errors:
            print(errors, file=sys.stderr)
        shutil.copy(os.path.join(tmp, out_name), out)
    finally:
        shutil.rmtree(tmp, ignore_errors=True)
    return out


def link_reference(obj, base, defines):
    """Link one SHC object with the Hitachi linker at `base` (sections P, C, D, B) and
    return the loaded bytes. `defines` gives addresses for external symbols."""
    cwd = short_tempdir()
    try:
        shutil.copy(obj, os.path.join(cwd, "in.obj"))
        with open(os.path.join(cwd, "ref.sub"), "w") as f:
            f.write("INPUT in.obj\nOUTPUT ref.abs\n")
            for sym, addr in defines.items():
                f.write("DEFINE %s(%08X)\n" % (sym, addr))
            f.write("START P,C,D,B(%08X)\nFORM A\nEXIT\n" % base)
        res, _ = _run("lnk.exe", ["-subcommand=ref.sub"], cwd)
        if not os.path.exists(os.path.join(cwd, "ref.abs")):
            sys.exit("lnk failed:\n" + res.stdout)
        _run("cnvs.exe", ["ref.abs", "ref.mot"], cwd)
        out = os.path.join(cwd, "ref.bin")
        subprocess.run([os.path.join(BIN, "sh-elf-objcopy"), "-I", "srec", "-O", "binary",
                        os.path.join(cwd, "ref.mot"), out], check=True)
        return open(out, "rb").read()
    finally:
        shutil.rmtree(cwd, ignore_errors=True)


def main():
    if len(sys.argv) < 4 or sys.argv[1] != "cc":
        sys.exit(__doc__)
    c_path, out_s, extra = sys.argv[2], sys.argv[3], sys.argv[4:]
    if not available():
        sys.exit("SHC not found: put the Hitachi SHC 5.0 tools in %s (and install wine)" % SHC_DIR)
    os.makedirs(os.path.dirname(os.path.abspath(out_s)), exist_ok=True)
    # Compile from a private copy so parallel builds don't share SHC temp files.
    first = open(c_path, encoding="latin-1").readline()
    m = re.match(r"\s*/\*\s*shc-flags:(.*?)\*/", first)
    file_flags = m.group(1).split() if m else []
    with tempfile.TemporaryDirectory(dir=os.path.dirname(os.path.abspath(out_s))) as tmp:
        local = os.path.join(tmp, os.path.basename(c_path))
        shutil.copy(c_path, local)
        src = compile_c(local, asm=True, flags=file_flags + list(extra))
        subprocess.run([sys.executable, os.path.join(ROOT, "tools", "shc2gas.py"), src, out_s], check=True)


if __name__ == "__main__":
    main()
