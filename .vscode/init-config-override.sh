#!/bin/sh
# Erstellt config-override.typ aus der Vorlage, falls noch nicht vorhanden.
# Plattformunabhängig (POSIX sh) – für Linux/macOS bzw. Systeme ohne PowerShell.
# Aufgerufen von .vscode/tasks.json (folderOpen).
set -eu

# Projektwurzel = Ordner oberhalb dieses Skripts (.vscode)
root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

override="$root/config-override.typ"
example="$root/config-override.example.typ"

if [ ! -f "$override" ]; then
    cp -- "$example" "$override"
    echo "config-override.typ aus Vorlage erstellt."
else
    echo "config-override.typ existiert bereits."
fi
