@echo off
setlocal
cd /d "%~dp0"
title OmnixEngine V1 - Doctor
echo === OMNIXENGINE V1 DOCTOR ===
echo.
for %%T in (git python haxelib lime) do (
  where %%T >nul 2>&1
  if errorlevel 1 (echo [MISSING] %%T) else (echo [OK] %%T)
)
if exist "Project.xml" (echo [OK] Project.xml) else (echo [MISSING] Project.xml)
if exist "tools\omnix-computer-host\host.py" (echo [OK] Computer Host) else (echo [MISSING] Computer Host)
if exist "config\omnix-ai.json" (echo [OK] AI config) else (echo [MISSING] AI config)
echo.
echo Checking Computer Host health...
powershell -NoProfile -Command "try { Invoke-RestMethod -Uri 'http://127.0.0.1:8765/health' | ConvertTo-Json -Depth 5 } catch { Write-Host '[OFFLINE] Computer Host' }"
echo.
pause
endlocal
