@echo off
title Spellcast Solver Launcher

echo ========================================================
echo               Spellcast Solver Launcher
echo ========================================================
echo.

:: Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not installed or not added to PATH.
    echo Please install Python 3.10 or newer from python.org
    pause
    exit /b
)

:: Check if .venv exists
if not exist .venv\Scripts\activate.bat (
    echo [INFO] First time setup: Creating virtual environment...
    python -m venv .venv
)

:: Activate the virtual environment
echo [INFO] Activating virtual environment...
call .venv\Scripts\activate.bat

:: Install/Upgrade dependencies
echo [INFO] Checking dependencies...
pip install -r requirements.txt

:: Run the application
echo [INFO] Launching Spellcast Solver...
python solver/main.py

:: If the program exits with an error, pause to let the user see it
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] The application crashed or an error occurred.
    pause
)
