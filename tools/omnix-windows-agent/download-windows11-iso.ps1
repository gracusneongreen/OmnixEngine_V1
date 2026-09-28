# Opens the official Microsoft Windows 11 ISO download page.
$ErrorActionPreference = "Stop"
$Url = "https://www.microsoft.com/software-download/windows11"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$IsoDir = Join-Path $Root "iso"
New-Item -ItemType Directory -Force -Path $IsoDir | Out-Null
Write-Host "Opening official Microsoft Windows 11 download page..."
Start-Process $Url
Write-Host "Select the official Windows 11 x64 ISO and save it into:"
Write-Host $IsoDir
Write-Host "Then run .\detect-iso.ps1"
