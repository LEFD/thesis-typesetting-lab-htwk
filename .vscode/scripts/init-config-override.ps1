#Requires -Version 5.1
# Erstellt config-override.typ aus der Vorlage, falls noch nicht vorhanden.
# Windows-Variante; das POSIX-Pendant ist init-config-override.sh.
# Aufgerufen von .vscode/tasks.json (folderOpen) und von export-pdf.ps1.
$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)

$override = Join-Path $root 'config-override.typ'
$example  = Join-Path $root 'config-override.example.typ'

if (-not (Test-Path -LiteralPath $override)) {
    Copy-Item -LiteralPath $example -Destination $override
    Write-Host 'config-override.typ aus Vorlage erstellt.'
}
else {
    Write-Host 'config-override.typ existiert bereits.'
}
