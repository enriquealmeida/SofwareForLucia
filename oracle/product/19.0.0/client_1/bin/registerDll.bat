@echo off
cd c:\app\oracle\product\19.0.0\client_1\bin
set PATH=c:\app\oracle\product\19.0.0\client_1\bin;%PATH%
call C:\WINDOWS\system32\regsvr32.exe /s %1
exit /B %ERRORLEVEL%
