#!/usr/bin/env bash
set -e

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

WINE_DIR="$BASE_DIR/wine/wine-11.1-amd64-wow64"
WINE_BIN="$WINE_DIR/bin/wine"
PREFIX="$BASE_DIR/prefix"
GAME="$BASE_DIR/phyrebird/STEP_P1.exe"
DXVK_DIR="$BASE_DIR/dxvk"

export WINEPREFIX="$PREFIX"
export WINEARCH=win64
export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEESYNC=1
export WINEFSYNC=1

# Ensure prefix exists
if [ ! -d "$PREFIX" ]; then
    echo "Creating Wine prefix..."
    "$WINE_BIN" wineboot -u
fi

# Install DXVK
echo "Installing DXVK..."

# Copy 64-bit DLLs
cp "$DXVK_DIR/x64/"*.dll "$PREFIX/drive_c/windows/system32/"

# Copy 32-bit DLLs
cp "$DXVK_DIR/x32/"*.dll "$PREFIX/drive_c/windows/syswow64/"

# Set DLL overrides automatically
"$WINE_BIN" reg add "HKCU\\Software\\Wine\\DllOverrides" /v dxgi /d native,builtin /f
"$WINE_BIN" reg add "HKCU\\Software\\Wine\\DllOverrides" /v d3d8 /d native,builtin /f
"$WINE_BIN" reg add "HKCU\\Software\\Wine\\DllOverrides" /v d3d9 /d native,builtin /f
"$WINE_BIN" reg add "HKCU\\Software\\Wine\\DllOverrides" /v d3d10core /d native,builtin /f
"$WINE_BIN" reg add "HKCU\\Software\\Wine\\DllOverrides" /v d3d11 /d native,builtin /f

exec "$WINE_BIN" "$GAME"
