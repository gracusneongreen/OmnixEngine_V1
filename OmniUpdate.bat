@echo off
setlocal
cd /d "%~dp0"
title OmnixEngine V1 - Update
echo === OMNIXENGINE V1 UPDATE ===
where git >nul 2>&1 || (echo ERROR: Git not found.&pause&exit /b 1)
git pull --ff-only
if errorlevel 1 echo UPDATE FAILED.
if exist "Project.xml" where haxelib >nul 2>&1 && haxelib install lime
echo.
pause
endlocal
