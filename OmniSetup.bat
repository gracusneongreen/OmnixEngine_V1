@echo off
setlocal
cd /d "%~dp0"
title OmnixEngine V1 - Setup
echo === OMNIXENGINE V1 SETUP ===
where git >nul 2>&1 || echo WARNING: Git not found.
where python >nul 2>&1 || echo WARNING: Python not found.
where haxelib >nul 2>&1 || echo WARNING: Haxelib not found.
if exist "tools\omnix-windows-agent\setup-agent.ps1" powershell -NoProfile -ExecutionPolicy Bypass -File "tools\omnix-windows-agent\setup-agent.ps1"
echo.
echo Setup finished. Review warnings/errors above.
pause
endlocal
