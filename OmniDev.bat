@echo off
setlocal
cd /d "%~dp0"
title OmnixEngine V1 - Developer Mode
echo === OMNIXENGINE V1 DEV MODE ===
echo Repository: %CD%
echo.
git status
echo.
echo [1] Build
echo [2] Doctor
echo [3] Open source
echo [4] Exit
set /p "choice=Select: "
if "%choice%"=="1" call "%~dp0OmniBuild.bat"
if "%choice%"=="2" call "%~dp0OmniDoctor.bat"
if "%choice%"=="3" start "" explorer.exe "%~dp0source"
endlocal
