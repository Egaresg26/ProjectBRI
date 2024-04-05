@echo off
setlocal
set /p username=Masukkan username:
set /p password=Masukkan password:
call :autofill
exit /b

:autofill
echo @echo off > autofilled_login_input.bat
echo echo %username% >> autofilled_login_input.bat
echo echo %password% >> autofilled_login_input.bat
