# Start Omnix Computer Host inside the Windows 11 VM.
$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$VenvPython = Join-Path $Root ".venv\Scripts\python.exe"
$HostScript = Join-Path $Root "..\omnix-computer-host\host.py"

if (-not (Test-Path $VenvPython)) {
    throw "Environment is not prepared. Run setup-agent.ps1 first."
}

if (-not (Test-Path $HostScript)) {
    throw "Omnix Computer Host was not found at $HostScript."
}

Write-Host "Starting Omnix Computer Host on 127.0.0.1:8765..."
& $VenvPython $HostScript
