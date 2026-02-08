#!/usr/bin/env bash
set -e

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

WINE_DIR="$BASE_DIR/wine/wine-11.1-amd64-wow64"
WINE_BIN="$WINE_DIR/bin/wine"
PREFIX="$BASE_DIR/prefix"
GAME="$BASE_DIR/phyrebird/STEP_P1.exe"

export WINEPREFIX="$PREFIX"
export WINEARCH=win64
export WINEDLLOVERRIDES="mscoree,mshtml="

exec "$WINE_BIN" "$GAME"
