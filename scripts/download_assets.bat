@echo off
setlocal
set SCRIPT_DIR=%~dp0
set PS1=%SCRIPT_DIR%download_assets.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File "%PS1%"
endlocal
