@echo off
chcp 65001 >nul
title Run DMM Application
color 0A

echo ===============================================
echo    RUNNING DMM APPLICATION
echo ===============================================
echo.

:: Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python not found!
    echo Please install Python from: https://python.org
    echo.
    pause
    exit /b 1
)

:: Check if DMM.py exists
if not exist "DMM.py" (
    echo [ERROR] DMM.py file not found!
    echo Make sure DMM.py is in the same folder as this batch file.
    echo.
    pause
    exit /b 1
)

echo [INFO] Checking Python version...
python --version
echo.

echo [INFO] Starting DMM application...
echo.

:: Run the Python application
python DMM.py

if errorlevel 1 (
    echo.
    echo [ERROR] DMM application exited with an error.
    echo.
    pause
    exit /b 1
)

echo.
echo ===============================================
echo    APPLICATION CLOSED.
echo ===============================================
echo.
pause
