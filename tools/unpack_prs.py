#!/usr/bin/env python3
"""Decompress every *.PRS in a directory. Usage: unpack_prs.py <files_dir> <out_dir>"""
import glob
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))
import prs  # noqa: E402


def main():
    src, dst = sys.argv[1], sys.argv[2]
    os.makedirs(dst, exist_ok=True)
    count = 0
    for path in sorted(glob.glob(os.path.join(src, "*.PRS"))):
        name = os.path.splitext(os.path.basename(path))[0] + ".BIN"
        open(os.path.join(dst, name), "wb").write(prs.decompress(open(path, "rb").read()))
        count += 1
    print("decompressed %d PRS files to %s" % (count, dst))


if __name__ == "__main__":
    main()
