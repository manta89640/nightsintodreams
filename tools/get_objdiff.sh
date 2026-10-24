#!/bin/sh
# Download objdiff-cli into toolchain/bin.
set -e
VERSION=${OBJDIFF_VERSION:-v3.8.3}
ROOT=$(cd "$(dirname "$0")/.." && pwd)
case "$(uname -s)-$(uname -m)" in
    Darwin-arm64) ASSET=objdiff-cli-macos-arm64 ;;
    Darwin-x86_64) ASSET=objdiff-cli-macos-x86_64 ;;
    Linux-x86_64) ASSET=objdiff-cli-linux-x86_64 ;;
    Linux-aarch64) ASSET=objdiff-cli-linux-aarch64 ;;
    *) echo "no objdiff-cli build for $(uname -s)-$(uname -m)"; exit 1 ;;
esac
mkdir -p "$ROOT/toolchain/bin"
curl -fL -o "$ROOT/toolchain/bin/objdiff-cli" \
    "https://github.com/encounter/objdiff/releases/download/$VERSION/$ASSET"
chmod +x "$ROOT/toolchain/bin/objdiff-cli"
"$ROOT/toolchain/bin/objdiff-cli" --version
