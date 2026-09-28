@echo off
setlocal
cd /d "%~dp0"
title OmnixEngine V1 - Computer Host
if exist "tools\omnix-windows-agent\start-agent.ps1" (
  powershell -NoProfile -ExecutionPolicy Bypass -File "tools\omnix-windows-agent\start-agent.ps1"
) else if exist "tools\omnix-computer-host\host.py" (
  python "tools\omnix-computer-host\host.py"
) else (
  echo ERROR: Computer Host not found.
  pause
)
endlocal
