@echo off
chcp 65001 >nul
title Cài đặt dependencies tự động
color 0A

echo ===============================================
echo    CÀI ĐẶT TỰ ĐỘNG THƯ VIỆN PYTHON
echo ===============================================
echo.

:: Kiểm tra xem Python đã được cài đặt chưa
python --version >nul 2>&1
if errorlevel 1 (
    echo [LỖI] Python không được tìm thấy!
    echo Vui lòng cài đặt Python từ: https://python.org
    echo.
    pause
    exit /b 1
)

:: Kiểm tra xem pip có tồn tại không
python -m pip --version >nul 2>&1
if errorlevel 1 (
    echo [LỖI] pip không được cài đặt!
    echo Vui lòng cài đặt pip cho Python.
    echo.
    pause
    exit /b 1
)

:: Kiểm tra file requirements.txt
if not exist "requirements.txt" (
    echo [LỖI] Không tìm thấy file requirements.txt!
    echo Đảm bảo file requirements.txt ở cùng thư mục với file batch.
    echo.
    pause
    exit /b 1
)

echo [THÔNG TIN] Đang kiểm tra phiên bản Python...
python --version
echo.

echo [THÔNG TIN] Đang kiểm tra phiên bản pip...
python -m pip --version
echo.

echo [THỰC THI] Đang cài đặt các thư viện từ requirements.txt...
echo.

:: Cài đặt các dependencies
python -m pip install -r requirements.txt

if errorlevel 1 (
    echo.
    echo [LỖI] Cài đặt thất bại! Vui lòng kiểm tra kết nối internet.
    echo.
    pause
    exit /b 1
)

echo.
echo ===============================================
echo    CÀI ĐẶT THÀNH CÔNG!
echo ===============================================
echo.
echo Các thư viện đã được cài đặt thành công.
echo Bạn có thể chạy chương trình Python của mình.
echo.
pause
