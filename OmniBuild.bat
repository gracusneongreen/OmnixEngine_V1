@echo off
setlocal
cd /d "%~dp0"
title OmnixEngine V1 - Build
echo === OMNIXENGINE V1 BUILD ===
where lime >nul 2>&1 || (echo ERROR: Lime not found.&pause&exit /b 1)
lime test windows
if errorlevel 1 (echo BUILD FAILED.) else (echo BUILD FINISHED.)
pause
endlocal
