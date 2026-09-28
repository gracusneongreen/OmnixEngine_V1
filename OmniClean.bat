@echo off
setlocal
cd /d "%~dp0"
title OmnixEngine V1 - Clean
echo === OMNIXENGINE V1 CLEAN ===
echo This removes generated build/cache directories only.
if exist "export" rmdir /s /q "export"
if exist ".haxelib" rmdir /s /q ".haxelib"
if exist "build" rmdir /s /q "build"
echo.
echo Clean finished.
pause
endlocal
