@echo off
rem This batch script opens a file with just the filename instead of full path

rem Check if a file parameter was provided
if "%~1"=="" (
    echo No file specified.
    echo Usage: OpenInEmacs.bat filename.ext
    exit /b 1
)

rem Get just the filename with extension from the full path
set filename=%~nx1

"C:\Users/murlocks/.local/scripts/emacs-wsl-launcher/dist/OpenInEmacs.exe" "%filename%"
