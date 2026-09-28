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
echo [1] Doctor / preflight
echo [2] Update repository
echo [3] Install / update Haxe libraries
echo [4] Compile Windows
echo [5] Clean + compile Windows
echo [6] Run Windows build
echo [7] Check Omnix Windows Agent
echo [8] Start Omnix Computer Host
echo [9] Open repository
echo [0] Exit
echo.
set /p "choice=Select an action: "

if "%choice%"=="1" goto doctor
if "%choice%"=="2" goto update
if "%choice%"=="3" goto libs
if "%choice%"=="4" goto build
if "%choice%"=="5" goto cleanbuild
if "%choice%"=="6" goto run
if "%choice%"=="7" goto agentcheck
if "%choice%"=="8" goto agentstart
if "%choice%"=="9" goto openrepo
if "%choice%"=="0" goto end
goto menu

:doctor
cls
call "%~dp0OmniDoctor.bat"
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
git pull --ff-only
if errorlevel 1 (
  echo UPDATE FAILED.
) else (
  echo UPDATE COMPLETE.
)
pause
goto menu

:libs
cls
echo === Haxe library setup ===
where haxelib >nul 2>&1
if errorlevel 1 (
  echo ERROR: haxelib was not found in PATH.
  pause
  goto menu
)
echo Running Lime setup...
haxelib run lime setup
if errorlevel 1 (
  echo Lime setup reported an error.
  pause
  goto menu
)
echo Installing libraries declared by Project.xml...
haxelib install lime
haxelib install openfl
haxelib install flixel
haxelib install flixel-addons
haxelib install tjson
haxelib install hscript-iris
echo.
echo Library step finished. Review errors above.
pause
goto menu

:build
cls
echo === OMNIXENGINE WINDOWS COMPILE ===
call "%~dp0OmniBuild.bat"
goto menu

:cleanbuild
cls
echo === OMNIXENGINE CLEAN + COMPILE ===
call "%~dp0OmniClean.bat"
if errorlevel 1 (
  echo Clean step reported an error.
  pause
  goto menu
)
call "%~dp0OmniBuild.bat"
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
  echo Compile first with option 4.
)
echo.
pause
goto menu

:agentcheck
cls
if exist "toolsomnix-windows-agentcheck-environment.ps1" (
  powershell -NoProfile -ExecutionPolicy Bypass -File "toolsomnix-windows-agentcheck-environment.ps1"
) else (
  echo Agent check script was not found.
)
pause
goto menu

:agentstart
cls
if exist "toolsomnix-windows-agentstart-agent.ps1" (
  powershell -NoProfile -ExecutionPolicy Bypass -File "toolsomnix-windows-agentstart-agent.ps1"
) else if exist "toolsomnix-computer-hosthost.py" (
  python "toolsomnix-computer-hosthost.py"
) else (
  echo Computer host was not found.
)
pause
goto menu

:openrepo
start "" "https://github.com/gracusneongreen/OmnixEngine_V1"
goto menu

:end
endlocal
exit /b 0
