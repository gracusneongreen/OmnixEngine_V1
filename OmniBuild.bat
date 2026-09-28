@echo off
setlocal EnableExtensions
cd /d "%~dp0"
title OmnixEngine V1 - Build

echo ==========================================
echo        OMNIXENGINE V1 - WINDOWS BUILD
echo ==========================================
echo.

where lime >nul 2>&1
if errorlevel 1 (
  echo ERROR: Lime was not found in PATH.
  echo Run OmniStep option 3 first.
  pause
  endlocal
  exit /b 1
)

if not exist "Project.xml" (
  echo ERROR: Project.xml was not found.
  pause
  endlocal
  exit /b 1
)

echo Running: lime test windows
echo.
lime test windows
set "BUILD_EXIT=%ERRORLEVEL%"
echo.

if not "%BUILD_EXIT%"=="0" (
  echo ==========================================
  echo BUILD FAILED - exit code %BUILD_EXIT%
  echo ==========================================
) else (
  echo ==========================================
  echo BUILD FINISHED SUCCESSFULLY
  echo ==========================================
  echo Check exporteleasewindowsin for the executable.
)

echo.
pause
endlocal
exit /b %BUILD_EXIT%
