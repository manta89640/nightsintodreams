#!/bin/sh
# Build GNU binutils for sh-elf (SH-2, big-endian) into toolchain/.
set -e
VERSION=${BINUTILS_VERSION:-2.47}
ROOT=$(cd "$(dirname "$0")/.." && pwd)
PREFIX="$ROOT/toolchain"
WORK="$ROOT/build/binutils"
mkdir -p "$WORK" "$PREFIX"
cd "$WORK"
[ -f "binutils-$VERSION.tar.xz" ] || curl -fLO "https://ftp.gnu.org/gnu/binutils/binutils-$VERSION.tar.xz"
[ -d "binutils-$VERSION" ] || tar xf "binutils-$VERSION.tar.xz"
mkdir -p obj && cd obj
"../binutils-$VERSION/configure" --target=sh-elf --prefix="$PREFIX" \
    --disable-nls --disable-werror --disable-gdb --disable-sim --disable-gprofng
make -j"$(sysctl -n hw.ncpu 2>/dev/null || nproc)"
make install
"$PREFIX/bin/sh-elf-as" --version | head -n 1
