@echo off
setlocal EnableExtensions
title OmnixEngine V1 - Win11 Agent
cd /d "%~dp0"

:menu
cls
echo ==========================================
echo       OMNIXENGINE V1 - WIN11 AGENT
echo ==========================================
echo.
echo [1] Check environment
echo [2] Setup agent environment
echo [3] Start Computer Host
echo [4] Open agent workspace
echo [5] Open agent configuration
echo [6] Check host health
echo [7] Exit
echo.
set /p "choice=Select an action: "

if "%choice%"=="1" goto check
if "%choice%"=="2" goto setup
if "%choice%"=="3" goto start
if "%choice%"=="4" goto workspace
if "%choice%"=="5" goto config
if "%choice%"=="6" goto health
if "%choice%"=="7" goto end
goto menu

:check
cls
echo === Checking Windows 11 Agent environment ===
if exist "tools\omnix-windows-agent\check-environment.ps1" (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "tools\omnix-windows-agent\check-environment.ps1"
) else (
    echo ERROR: check-environment.ps1 was not found.
)
echo.
pause
goto menu

:setup
cls
echo === Setting up Omnix Windows Agent ===
if exist "tools\omnix-windows-agent\setup-agent.ps1" (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "tools\omnix-windows-agent\setup-agent.ps1"
) else (
    echo ERROR: setup-agent.ps1 was not found.
)
echo.
pause
goto menu

:start
cls
echo === Starting Omnix Computer Host ===
echo.
echo The host will listen on 127.0.0.1:8765.
echo Keep this window open while the agent is using the computer.
echo.
if exist "tools\omnix-windows-agent\start-agent.ps1" (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "tools\omnix-windows-agent\start-agent.ps1"
) else if exist "tools\omnix-computer-host\host.py" (
    python "tools\omnix-computer-host\host.py"
) else (
    echo ERROR: Computer Host was not found.
)
echo.
pause
goto menu

:workspace
if not exist "tools\omnix-windows-agent\workspace" mkdir "tools\omnix-windows-agent\workspace"
start "" explorer.exe "%~dp0tools\omnix-windows-agent\workspace"
goto menu

:config
if exist "tools\omnix-windows-agent\config\agent-environment.json" (
    start "" notepad.exe "tools\omnix-windows-agent\config\agent-environment.json"
) else (
    echo ERROR: agent-environment.json was not found.
    pause
)
goto menu

:health
cls
echo === Computer Host health ===
where curl.exe >nul 2>&1
if errorlevel 1 (
    echo curl.exe was not found. Trying PowerShell instead...
    powershell.exe -NoProfile -Command "try { Invoke-RestMethod -Uri 'http://127.0.0.1:8765/health' | ConvertTo-Json -Depth 5 } catch { Write-Host 'Host is not reachable.' }"
) else (
    curl.exe -s http://127.0.0.1:8765/health
    echo.
)
echo.
pause
goto menu

:end
endlocal
exit /b 0
