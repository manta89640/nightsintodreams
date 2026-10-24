#!/usr/bin/env python3
"""Extract a Sega Saturn cue/bin dump into its component parts.

Outputs (under the chosen output directory):
  IP.BIN        - the 32 KiB system area (boot header + security/area code)
  files/        - every file in the ISO9660 filesystem on the data track
  tracks/       - CDDA tracks as .wav (data tracks are covered by files/)
  manifest.txt  - file listing with LBA, size and SHA-1

Only reads the user's own dump; nothing is downloaded or redistributed.
"""
import argparse
import hashlib
import os
import re
import struct
import sys
import wave

RAW = 2352
USER = 2048


def parse_cue(path):
    tracks = []
    cur_file = None
    base = os.path.dirname(path)
    for line in open(path, encoding="latin-1"):
        line = line.strip()
        m = re.match(r'FILE "(.+)" BINARY', line)
        if m:
            cur_file = os.path.join(base, m.group(1))
            continue
        m = re.match(r"TRACK (\d+) (\S+)", line)
        if m:
            tracks.append({"num": int(m.group(1)), "mode": m.group(2), "file": cur_file})
    return tracks


class Disc:
    """Disc-wide LBA reader spanning every data track in the cue sheet.

    Each FILE in a per-track cue starts with its pregap, so the absolute LBA of
    sector 0 of a file is the sum of the sector counts of the preceding files.
    """

    def __init__(self, tracks):
        self.spans = []  # (first_lba, sector_count, file handle, mode)
        lba = 0
        for t in tracks:
            count = os.path.getsize(t["file"]) // RAW
            fh = open(t["file"], "rb") if t["mode"] != "AUDIO" else None
            self.spans.append((lba, count, fh, t["mode"], t["num"]))
            lba += count
        self.form2_sectors = 0

    def raw(self, lba):
        for first, count, fh, mode, _ in self.spans:
            if first <= lba < first + count:
                if fh is None:
                    raise ValueError("LBA %d is inside an audio track" % lba)
                fh.seek((lba - first) * RAW)
                return fh.read(RAW), mode
        raise ValueError("LBA %d is past the end of the disc" % lba)

    def audio_track_at(self, lba):
        """Track number if lba lies in a CDDA track, else None."""
        for first, count, fh, mode, num in self.spans:
            if first <= lba < first + count:
                return num if mode == "AUDIO" else None
        return None

    def sector(self, lba):
        raw, mode = self.raw(lba)
        if mode == "MODE1/2352":
            return raw[16:16 + USER]
        # Mode 2 XA: subheader at 16..23, submode bit 5 set means Form 2 (2324 bytes)
        if raw[18] & 0x20:
            self.form2_sectors += 1
            return raw[24:24 + 2324]
        return raw[24:24 + USER]

    def read(self, lba, size):
        out = bytearray()
        while len(out) < size:
            out += self.sector(lba)
            lba += 1
        return bytes(out[:size])


def walk_iso(trk, lba, size, prefix=""):
    data = trk.read(lba, size)
    pos = 0
    while pos < len(data):
        rec_len = data[pos]
        if rec_len == 0:
            # records never straddle sectors; skip to next sector
            pos = (pos // USER + 1) * USER
            continue
        rec = data[pos:pos + rec_len]
        ext_lba = struct.unpack_from("<I", rec, 2)[0]
        ext_size = struct.unpack_from("<I", rec, 10)[0]
        flags = rec[25]
        name_len = rec[32]
        name = rec[33:33 + name_len]
        pos += rec_len
        if name in (b"\x00", b"\x01"):
            continue
        name = name.decode("ascii").split(";")[0]
        full = prefix + name
        if flags & 2:
            yield from walk_iso(trk, ext_lba, ext_size, full + "/")
        else:
            yield full, ext_lba, ext_size


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("cue")
    ap.add_argument("out")
    ap.add_argument("--no-audio", action="store_true", help="skip converting CDDA tracks to WAV")
    args = ap.parse_args()

    tracks = parse_cue(args.cue)
    if not tracks or not tracks[0]["mode"].startswith("MODE"):
        sys.exit("first track is not a data track")
    os.makedirs(args.out, exist_ok=True)
    manifest = []

    trk = Disc(tracks)
    ip = trk.read(0, 16 * USER)
    if not ip.startswith(b"SEGA SEGASATURN "):
        sys.exit("track 1 does not start with a Saturn system ID")
    open(os.path.join(args.out, "IP.BIN"), "wb").write(ip)
    manifest.append(("IP.BIN", 0, len(ip), hashlib.sha1(ip).hexdigest()))

    pvd = trk.sector(16)
    if pvd[1:6] != b"CD001":
        sys.exit("no ISO9660 primary volume descriptor")
    root = pvd[156:156 + 34]
    root_lba = struct.unpack_from("<I", root, 2)[0]
    root_size = struct.unpack_from("<I", root, 10)[0]

    for name, lba, size in walk_iso(trk, root_lba, root_size):
        audio = trk.audio_track_at(lba)
        if audio is not None:
            # Directory entries that alias CDDA tracks (e.g. the *.SFD boss themes);
            # the audio itself is written out with the tracks below.
            manifest.append(("files/" + name, lba, size, "-> tracks/track%02d.wav" % audio))
            continue
        data = trk.read(lba, size)
        dst = os.path.join(args.out, "files", name)
        os.makedirs(os.path.dirname(dst), exist_ok=True)
        open(dst, "wb").write(data)
        manifest.append(("files/" + name, lba, size, hashlib.sha1(data).hexdigest()))

    if trk.form2_sectors:
        print("note: %d Mode 2 Form 2 sectors were read at 2324 bytes each" % trk.form2_sectors)

    os.makedirs(os.path.join(args.out, "tracks"), exist_ok=True)
    for t in tracks[1:]:
        # data tracks are already covered by the ISO filesystem
        if t["mode"] != "AUDIO" or args.no_audio:
            continue
        raw = open(t["file"], "rb").read()
        name = "track%02d.wav" % t["num"]
        w = wave.open(os.path.join(args.out, "tracks", name), "wb")
        w.setnchannels(2)
        w.setsampwidth(2)
        w.setframerate(44100)
        w.writeframes(raw)  # CDDA is little-endian 16-bit stereo already
        w.close()
        manifest.append(("tracks/" + name, 0, len(raw), hashlib.sha1(raw).hexdigest()))

    with open(os.path.join(args.out, "manifest.txt"), "w") as m:
        for name, lba, size, sha in manifest:
            m.write("%-32s lba=%-7d size=%-9d %s\n" % (name, lba, size, sha))
    print("extracted %d entries to %s" % (len(manifest), args.out))


if __name__ == "__main__":
    main()
