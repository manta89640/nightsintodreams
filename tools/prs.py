#!/usr/bin/env python3
"""Sega PRS (LZ77 variant) decompressor. Usage: prs.py in.prs [out.bin]"""
import sys


def decompress(src):
    out = bytearray()
    pos = 0
    cmd = 0
    left = 0

    def bit():
        nonlocal pos, cmd, left
        if left == 0:
            cmd = src[pos]
            pos += 1
            left = 8
        b = cmd & 1
        cmd >>= 1
        left -= 1
        return b

    while True:
        if bit():
            out.append(src[pos])
            pos += 1
            continue
        if bit():
            word = src[pos] | (src[pos + 1] << 8)
            pos += 2
            if word == 0:
                break
            offset = (word >> 3) - 0x2000
            size = word & 7
            if size == 0:
                size = src[pos] + 1
                pos += 1
            else:
                size += 2
        else:
            size = ((bit() << 1) | bit()) + 2
            offset = src[pos] - 0x100
            pos += 1
        start = len(out) + offset
        if start < 0:
            raise ValueError("PRS back-reference before start of output at input 0x%x" % pos)
        for i in range(size):
            out.append(out[start + i])
    return bytes(out)


if __name__ == "__main__":
    data = decompress(open(sys.argv[1], "rb").read())
    if len(sys.argv) > 2:
        open(sys.argv[2], "wb").write(data)
    else:
        sys.stdout.buffer.write(data)
