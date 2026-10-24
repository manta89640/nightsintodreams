#!/usr/bin/env python3
"""Check extracted files against config/<region>/files.sha1.

Usage: verify.py <checksum_file> <base_dir>
"""
import hashlib
import os
import sys


def main():
    sums, base = sys.argv[1], sys.argv[2]
    bad = 0
    total = 0
    for line in open(sums):
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        digest, name = line.split(None, 1)
        total += 1
        path = os.path.join(base, name)
        if not os.path.exists(path):
            print("MISSING  " + name)
            bad += 1
            continue
        if hashlib.sha1(open(path, "rb").read()).hexdigest() != digest:
            print("MISMATCH " + name)
            bad += 1
    if bad:
        sys.exit("%d of %d files failed verification" % (bad, total))
    print("all %d files OK" % total)


if __name__ == "__main__":
    main()
