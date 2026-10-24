#!/bin/sh
# Create a headless Ghidra project with the main executable and the decompressed
# per-dream overlays. The project lives in build/ and is never committed.
set -e
ROOT=$(cd "$(dirname "$0")/../.." && pwd)
HEADLESS=${GHIDRA_HEADLESS:-$(dirname "$(readlink -f "$(command -v ghidraRun)")")/../libexec/support/analyzeHeadless}
PROJ="$ROOT/build/ghidra"
mkdir -p "$PROJ"

# 0NIGHTS is the 1st Read file; IP.BIN says it loads and starts at 0x06004000 (High Work RAM).
"$HEADLESS" "$PROJ" nights \
    -import "$ROOT/extracted/usa/files/0NIGHTS" \
    -processor "SuperH:BE:32:SH-2" -cspec default \
    -loader BinaryLoader -loader-baseAddr 0x06004000 \
    -scriptPath "$ROOT/tools/ghidra" \
    -preScript SaturnSetup.java \
    -postScript ExportFunctions.java "$ROOT/build/functions.csv" \
    -overwrite
