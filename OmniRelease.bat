@echo off
setlocal
cd /d "%~dp0"
title OmnixEngine V1 - Release
echo === OMNIXENGINE V1 RELEASE ===
call "%~dp0OmniDoctor.bat"
if errorlevel 1 exit /b 1
call "%~dp0OmniBuild.bat"
if errorlevel 1 exit /b 1
echo.
echo Release build completed. Package the generated export directory manually after verification.
pause
endlocal
