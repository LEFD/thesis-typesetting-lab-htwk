#!/bin/sh
# Exportiert main.typ nach
#     .export/<yyyy-mm-dd> <arbeit-typ> <vorname> <nachname>.pdf
#
# Das Datum ist der Tag des Exports. Typ/Vor-/Nachname werden aus
# config-override.typ (Vorrang) bzw. config.typ gelesen.
#
# POSIX-Pendant zu export-pdf.ps1, für Linux/macOS bzw. Systeme ohne PowerShell.
# Aufgerufen vom VS-Code-Task "Arbeit als PDF exportieren".
set -eu

# Projektwurzel = Ordner oberhalb dieses Skripts (.vscode)
scriptdir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
root=$(CDPATH= cd -- "$scriptdir/.." && pwd)
cd "$root"

# config-override.typ bei Bedarf aus der Vorlage erstellen (Sicherheitsnetz,
# falls der automatische VS-Code-Task nicht gelaufen ist).
sh "$scriptdir/init-config-override.sh"

# Wert eines Schlüssels lesen: config-override.typ hat Vorrang vor config.typ.
# Auskommentierte Zeilen (// key: …) werden ignoriert.
get_cfg() {
    key=$1
    for f in "$root/config-override.typ" "$root/config.typ"; do
        [ -f "$f" ] || continue
        val=$(sed -nE "s/^[[:space:]]*${key}[[:space:]]*:[[:space:]]*\"([^\"]*)\".*/\1/p" "$f" | head -n1)
        if [ -n "$val" ]; then
            printf '%s' "$val"
            return 0
        fi
    done
    # Schlüssel nicht gefunden: leeren Wert zurückgeben, ohne abzubrechen.
    return 0
}

typ=$(get_cfg 'arbeit-typ')
vorname=$(get_cfg 'vorname')
nachname=$(get_cfg 'nachname')
date=$(date +%Y-%m-%d)

# Dateiname aus vorhandenen Teilen zusammensetzen (leere Felder auslassen).
name=$date
[ -n "$typ" ]      && name="$name $typ"
[ -n "$vorname" ]  && name="$name $vorname"
[ -n "$nachname" ] && name="$name $nachname"

# Unter Windows unzulaessige Dateinamenszeichen ersetzen (z. B. das "/" in
# "Beleg-/Bachelor-/Masterarbeit"), damit der Name plattformuebergreifend passt.
name=$(printf '%s' "$name" | sed -E 's#[\\/:*?"<>|]#-#g; s/^[[:space:]]+//; s/[[:space:]]+$//')

outDir="$root/.export"
mkdir -p "$outDir"
outPdf="$outDir/$name.pdf"

# Typst-Compiler finden: bevorzugt `typst` im PATH, sonst die mit der
# Tinymist-Erweiterung mitgelieferte tinymist-Binary.
compiler=$(command -v typst 2>/dev/null || true)
if [ -z "$compiler" ]; then
    compiler=$(ls -t \
        "$HOME"/.vscode/extensions/myriad-dreamin.tinymist-*/out/tinymist \
        "$HOME"/.vscode-server/extensions/myriad-dreamin.tinymist-*/out/tinymist \
        "$HOME"/.vscode-oss/extensions/myriad-dreamin.tinymist-*/out/tinymist \
        2>/dev/null | head -n1 || true)
fi
if [ -z "$compiler" ]; then
    echo "Kein Typst-Compiler gefunden: weder 'typst' im PATH noch eine tinymist-Binary der Erweiterung." >&2
    exit 1
fi

echo "Compiler: $compiler"
echo "Ausgabe: $outPdf"
if ! "$compiler" compile 'main.typ' "$outPdf" --root "$root"; then
    echo "Kompilierung fehlgeschlagen." >&2
    exit 1
fi
echo "Fertig."
