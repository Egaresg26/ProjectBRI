@echo off
echo Pilih opsi:
echo 1. Tampilkan informasi memori
echo 2. Tampilkan informasi sistem

set /p choice=Masukkan pilihan (1 atau 2): 

if "%choice%"=="1" (
    echo.
    echo Informasi Memori:
    echo ==================
    systeminfo | find "Total Physical Memory"
    echo.
) else if "%choice%"=="2" (
    echo.
    echo Informasi Sistem:
    echo ==================
    systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Manufacturer" /C:"System Model"
    echo.
) else (
    echo Pilihan tidak valid.
)

pause
