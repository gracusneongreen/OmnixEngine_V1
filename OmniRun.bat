@echo off
setlocal
cd /d "%~dp0"
title OmnixEngine V1 - Run
if exist "export\release\windows\bin\OmnixEngine.exe" (
  start "" "export\release\windows\bin\OmnixEngine.exe"
) else if exist "export\windows\bin\OmnixEngine.exe" (
  start "" "export\windows\bin\OmnixEngine.exe"
) else (
  echo ERROR: OmnixEngine.exe not found. Run OmniBuild.bat first.
  pause
)
endlocal
