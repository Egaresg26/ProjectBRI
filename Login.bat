@echo off
echo Masukkan username:
set /p username=
echo Masukkan password:
set /p password=
echo %username% > userpass.txt
echo %password% >> userpass.txt
