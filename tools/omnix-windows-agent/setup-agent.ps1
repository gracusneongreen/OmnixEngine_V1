# Omnix Windows 11 Agent Environment V1
# Run inside the Windows 11 VM as Administrator.
$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$HostDir = Join-Path $Root "..\omnix-computer-host"
$Venv = Join-Path $Root ".venv"

Write-Host "=== OMNIX WINDOWS 11 AGENT ENVIRONMENT V1 ==="

if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    throw "Python was not found. Install Python in the Windows VM first."
}

if (-not (Test-Path $Venv)) {
    python -m venv $Venv
}

& (Join-Path $Venv "Scripts\python.exe") -m pip install --upgrade pip
& (Join-Path $Venv "Scripts\python.exe") -m pip install -r (Join-Path $HostDir "requirements.txt")

New-Item -ItemType Directory -Force -Path (Join-Path $Root "workspace") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $Root "logs") | Out-Null

Write-Host "Omnix Computer Host dependencies installed."
Write-Host "Next: .\start-agent.ps1"
