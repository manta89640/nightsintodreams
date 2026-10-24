#!/usr/bin/env python3
"""Exhaustive round-trip test of tools/sh2dis.py against GNU as and objdump.

Every one of the 65536 opcodes is decoded. Valid instructions are reassembled with
sh-elf-as --isa=sh2 and must produce the same word. Words we reject must also be
rejected (or decoded as non-SH-2) by sh-elf-objdump.
"""
import os
import struct
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
import sh2dis  # noqa: E402

BIN = os.path.join(ROOT, "toolchain", "bin")


def main():
    lines = []
    valid = []
    invalid = []
    # Pad so every PC-relative target stays inside the section.
    pad = 0x2000
    for w in range(0x10000):
        pc = pad + len(valid) * 2
        insn = sh2dis.decode(w, pc)
        if insn is None:
            invalid.append(w)
            continue
        valid.append(w)
        lines.append("\t" + insn.text())
    with tempfile.TemporaryDirectory() as tmp:
        src = os.path.join(tmp, "t.s")
        obj = os.path.join(tmp, "t.o")
        raw = os.path.join(tmp, "t.bin")
        with open(src, "w") as f:
            f.write("\t.text\n\t.space 0x%x\n" % pad)
            f.write("\n".join(lines) + "\n\t.space 0x%x\n" % pad)
        subprocess.run([os.path.join(BIN, "sh-elf-as"), "--isa=sh2", "-big", "-o", obj, src], check=True)
        subprocess.run([os.path.join(BIN, "sh-elf-objcopy"), "-O", "binary", "-j", ".text", obj, raw], check=True)
        out = open(raw, "rb").read()[pad:pad + len(valid) * 2]
        bad = 0
        for i, w in enumerate(valid):
            got = struct.unpack_from(">H", out, i * 2)[0]
            if got != w:
                bad += 1
                if bad <= 20:
                    print("MISMATCH %04X -> %r -> %04X" % (w, lines[i].strip(), got))

        # Cross-check rejected words with objdump in SH-2 mode.
        rej = os.path.join(tmp, "rej.bin")
        open(rej, "wb").write(b"".join(struct.pack(">H", w) for w in invalid))
        dump = subprocess.run([os.path.join(BIN, "sh-elf-objdump"), "-D", "-b", "binary", "-m", "sh2", "-EB", rej],
                              check=True, capture_output=True, text=True).stdout
        accepted = []
        for line in dump.splitlines():
            parts = line.split("\t")
            if len(parts) >= 3 and parts[0].strip().endswith(":") and not parts[2].startswith(".word"):
                accepted.append(line.strip())
        for line in accepted[:20]:
            print("OBJDUMP ACCEPTS REJECTED WORD: " + line)

    print("%d valid, %d invalid, %d reassembly mismatches, %d rejected words objdump decodes"
          % (len(valid), len(invalid), bad, len(accepted)))
    sys.exit(1 if bad or accepted else 0)


if __name__ == "__main__":
    main()
