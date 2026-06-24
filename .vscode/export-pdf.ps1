#Requires -Version 5.1
<#
    Exportiert main.typ nach
        .export/<yyyy-mm-dd> <arbeit-typ> <vorname> <nachname>.pdf

    Das Datum ist der Tag des Exports. Typ/Vor-/Nachname werden aus
    config-override.typ (Vorrang) bzw. config.typ gelesen.

    Aufgerufen vom VS-Code-Task "Arbeit als PDF exportieren" (Strg+Umschalt+B).
#>

$ErrorActionPreference = 'Stop'

# Projektwurzel = Ordner oberhalb von .vscode
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

# config-override.typ bei Bedarf aus der Vorlage erstellen (Sicherheitsnetz,
# falls der automatische VS-Code-Task nicht gelaufen ist).
& (Join-Path $PSScriptRoot 'init-config-override.ps1')

function Get-CfgValue {
    param([Parameter(Mandatory)][string]$Key)
    # config-override.typ hat Vorrang vor config.typ (defaults + overrides).
    foreach ($file in @('config-override.typ', 'config.typ')) {
        $path = Join-Path $root $file
        if (-not (Test-Path -LiteralPath $path)) { continue }
        $text = Get-Content -Raw -LiteralPath $path
        $pattern = '(?m)^\s*' + [regex]::Escape($Key) + '\s*:\s*"([^"]*)"'
        $m = [regex]::Match($text, $pattern)
        if ($m.Success) { return $m.Groups[1].Value }
    }
    return $null
}

$typ      = Get-CfgValue 'arbeit-typ'
$vorname  = Get-CfgValue 'vorname'
$nachname = Get-CfgValue 'nachname'   # entspricht dem im Template genutzten Feld cfg.nachname
$date     = Get-Date -Format 'yyyy-MM-dd'

$parts = @($date, $typ, $vorname, $nachname) | Where-Object { $_ }
$name  = ($parts -join ' ')
# Unter Windows unzulaessige Dateinamenszeichen ersetzen (z. B. das "/" in "Beleg-/Bachelor-/Masterarbeit").
$name  = [regex]::Replace($name, '[\\/:*?"<>|]', '-').Trim()

$outDir = Join-Path $root '.export'
New-Item -ItemType Directory -Force -Path $outDir | Out-Null
$outPdf = Join-Path $outDir "$name.pdf"

# Typst-Compiler finden: bevorzugt `typst` im PATH, sonst die mit der
# Tinymist-Erweiterung mitgelieferte tinymist.exe.
$compiler = (Get-Command typst -ErrorAction SilentlyContinue).Source
if (-not $compiler) {
    $glob = Join-Path $env:USERPROFILE '.vscode\extensions\myriad-dreamin.tinymist-*\out\tinymist.exe'
    $compiler = Get-ChildItem -Path $glob -ErrorAction SilentlyContinue |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 1 -ExpandProperty FullName
}
if (-not $compiler) {
    throw "Kein Typst-Compiler gefunden: weder 'typst' im PATH noch eine tinymist.exe der Erweiterung."
}

Write-Host "Compiler: $compiler"
Write-Host "Ausgabe: $outPdf"
& $compiler compile 'main.typ' $outPdf --root $root
if ($LASTEXITCODE -ne 0) { throw "Kompilierung fehlgeschlagen (Exit-Code $LASTEXITCODE)." }
Write-Host "Fertig."
