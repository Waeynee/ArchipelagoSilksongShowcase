#!/usr/bin/env bash
# Generiert einen Seed aus silksong.apworld.
#   Nutzung:  ./generate.sh [/pfad/zu/Archipelago]   (Default: /tmp/Archipelago)
# Braucht eine vorhandene Archipelago-Installation mit venv (.venv).
set -euo pipefail
AP="${1:-/tmp/Archipelago}"
HERE="$(cd "$(dirname "$0")" && pwd)"
[ -x "$AP/.venv/bin/python" ] || { echo "Kein Archipelago-venv unter $AP/.venv"; exit 1; }

# Welt einspielen: Dev-Symlink unangetastet lassen, sonst apworld als echten Ordner entpacken.
if [ -L "$AP/worlds/silksong" ]; then
  echo "worlds/silksong ist ein Symlink (Dev) -> nutze ihn unveraendert."
else
  rm -rf "$AP/worlds/silksong"
  unzip -o -q "$HERE/silksong.apworld" -d "$AP/worlds"
fi

mkdir -p "$AP/Players" "$AP/output"
cp "$HERE/silksong_test.yaml" "$AP/Players/"
cd "$AP"
SKIP_REQUIREMENTS_UPDATE=1 .venv/bin/python Generate.py --player_files_path Players --outputpath output
SEED="$(ls -t "$AP/output/"*.zip 2>/dev/null | head -1)"
echo "Fertiger Seed: $SEED"
