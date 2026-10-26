[CmdletBinding()]
param(
    [Parameter(Position = 0)][string]$Source = "basic"
)

$TargetLabel = "CIRCUITPY"

$sourcePath = Join-Path -Path $PSScriptRoot -ChildPath $Source
if (-not (Test-Path -Path $sourcePath)) {
    Write-Error "Source directory not found: '$sourcePath'"
    exit 1
}

$targetVolume = Get-Volume -FileSystemLabel $TargetLabel -ErrorAction SilentlyContinue

if (-not $targetVolume -or -not $targetVolume.DriveLetter) {
    Write-Error "$TargetLabel drive not found. Is your device plugged in?"
    exit 1
}

$destinationPath = "$($targetVolume.DriveLetter):\"

Write-Host "Syncing files..." -ForegroundColor Cyan
Write-Host "  From: $sourcePath"
Write-Host "  To:   $destinationPath"

# Robocopy flags: /E (recursive incl empty), /NJH (no job header), /NJS (no job summary), /NDL (no dir list), /NP (no progress)
$robocopyArgs = @(
    $sourcePath,
    $destinationPath,
    "/E",
    "/NJH",
    "/NJS",
    "/NDL",
    "/NP"
)

& robocopy @robocopyArgs

if ($LASTEXITCODE -ge 8) {
    Write-Error "Robocopy failed with exit code $LASTEXITCODE."
    exit 1
}

Write-Host "Sync completed successfully." -ForegroundColor Green
exit 0