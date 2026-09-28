@echo off
setlocal EnableExtensions EnableDelayedExpansion
title OmnixEngine V1 - OmniStep
cd /d "%~dp0"

:menu
cls
echo ==========================================
echo        OMNIXENGINE V1 - OMNISTEP
echo ==========================================
echo.
echo [1] Check repository
echo [2] Update repository
echo [3] Install / update Haxe libraries
echo [4] Build Windows
echo [5] Run Windows build
echo [6] Check Omnix Windows Agent
echo [7] Start Omnix Computer Host
echo [8] Open repository
echo [9] Exit
echo.
set /p "choice=Select an action: "

if "%choice%"=="1" goto check
if "%choice%"=="2" goto update
if "%choice%"=="3" goto libs
if "%choice%"=="4" goto build
if "%choice%"=="5" goto run
if "%choice%"=="6" goto agentcheck
if "%choice%"=="7" goto agentstart
if "%choice%"=="8" goto openrepo
if "%choice%"=="9" goto end
goto menu

:check
cls
echo === Repository check ===
where git >nul 2>&1
if errorlevel 1 (
  echo ERROR: Git was not found in PATH.
) else (
  git status
)
echo.
pause
goto menu

:update
cls
echo === Repository update ===
where git >nul 2>&1
if errorlevel 1 (
  echo ERROR: Git was not found in PATH.
  pause
  goto menu
)
echo.
echo Pulling the latest OmnixEngine changes...
git pull --ff-only
if errorlevel 1 (
  echo.
  echo UPDATE FAILED. No automatic merge was attempted.
) else (
  echo.
  echo UPDATE COMPLETE.
)
echo.
pause
goto menu

:libs
cls
echo === Haxe library update ===
where haxelib >nul 2>&1
if errorlevel 1 (
  echo ERROR: haxelib was not found in PATH.
  pause
  goto menu
)
echo.
echo Installing/updating libraries declared by Project.xml...
haxelib install lime
haxelib install openfl
haxelib install flixel
haxelib install flixel-addons
haxelib install tjson
haxelib install hscript-iris
echo.
echo Library step finished. Check any errors above.
echo.
pause
goto menu

:build
cls
echo === OmnixEngine Windows build ===
where lime >nul 2>&1
if errorlevel 1 (
  echo ERROR: lime was not found in PATH.
  echo Try: haxelib run lime setup
  pause
  goto menu
)
echo.
echo Running: lime test windows
echo.
lime test windows
echo.
if errorlevel 1 (
  echo BUILD FAILED.
) else (
  echo BUILD COMMAND FINISHED SUCCESSFULLY.
)
echo.
pause
goto menu

:run
cls
echo === Run Windows build ===
if exist "exporteleasewindowsinOmnixEngine.exe" (
  start "" "exporteleasewindowsinOmnixEngine.exe"
) else if exist "exportwindowsinOmnixEngine.exe" (
  start "" "exportwindowsinOmnixEngine.exe"
) else (
  echo OmnixEngine.exe was not found.
  echo Build the project first with option 4.
)
echo.
pause
goto menu

:agentcheck
cls
echo === Omnix Windows Agent check ===
if exist "tools\omnix-windows-agent\check-environment.ps1" (
  powershell -NoProfile -ExecutionPolicy Bypass -File "tools\omnix-windows-agent\check-environment.ps1"
) else (
  echo Agent check script was not found.
)
echo.
pause
goto menu

:agentstart
cls
echo === Omnix Computer Host ===
if exist "tools\omnix-windows-agent\start-agent.ps1" (
  powershell -NoProfile -ExecutionPolicy Bypass -File "tools\omnix-windows-agent\start-agent.ps1"
) else if exist "tools\omnix-computer-host\host.py" (
  python "tools\omnix-computer-host\host.py"
) else (
  echo Computer host was not found.
)
echo.
pause
goto menu

:openrepo
start "" "https://github.com/gracusneongreen/OmnixEngine_V1"
goto menu

:end
endlocal
exit /b 0
