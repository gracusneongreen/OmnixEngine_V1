$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$IsoDir = Join-Path $Root "iso"
New-Item -ItemType Directory -Force -Path $IsoDir | Out-Null
$iso = Get-ChildItem -Path $IsoDir -Filter *.iso -File | Sort-Object LastWriteTime -Descending | Select-Object -First 1
if (-not $iso) {
    Write-Host "No Windows ISO found in $IsoDir"
    exit 1
}
Write-Host "Found ISO: $($iso.FullName)"
Write-Host "Size: $([math]::Round($iso.Length / 1GB, 2)) GB"
Write-Host "SHA256:"
Get-FileHash $iso.FullName -Algorithm SHA256 | Format-List
Write-Host "ISO is ready for VM creation."
