@echo off
:input
set /p input="Ketikkan 'quit' untuk berhenti: "
if /i "%input%"=="quit" (
    echo Anda telah keluar.
    exit /b 0
) else (
    goto input
)
