@echo off
setlocal
cd /d "%~dp0"
title OmnixEngine V1 - AI
echo === OMNIXENGINE V1 AI ===
echo Default LM Studio endpoint: http://127.0.0.1:1234/v1
echo.
powershell -NoProfile -Command "try { Invoke-RestMethod -Uri 'http://127.0.0.1:1234/v1/models' -TimeoutSec 3 | ConvertTo-Json -Depth 5 } catch { Write-Host '[OFFLINE] LM Studio API is not reachable.' }"
echo.
echo Start your OpenAI-compatible local provider, then launch OmnixEngine.
pause
endlocal
