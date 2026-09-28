# Basic environment diagnostics for the Omnix Windows 11 Agent VM.
$ErrorActionPreference = "Continue"

Write-Host "=== OMNIX ENVIRONMENT CHECK ==="
Write-Host "OS:"
Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber

Write-Host "Python:"
python --version

Write-Host "Network:"
Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.IPAddress -notlike "127.*"} | Select-Object IPAddress, InterfaceAlias

Write-Host "Computer Host:"
try {
    Invoke-WebRequest -UseBasicParsing http://127.0.0.1:8765/health -TimeoutSec 3 | Select-Object StatusCode, Content
} catch {
    Write-Host "Host is not running yet."
}

$workspace = Join-Path (Split-Path -Parent $MyInvocation.MyCommand.Path) "workspace"
New-Item -ItemType Directory -Force -Path $workspace | Out-Null
Write-Host "Workspace: $workspace"
