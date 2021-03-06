@echo off

if %1.==. (
   GOTO END
)

if %2.==. (
   GOTO END
)

@setlocal
set SOURCE_PATH=%1
set DESTINATION_PATH=%2

IF NOT EXIST %DESTINATION_PATH% MD %DESTINATION_PATH%

IF EXIST %SOURCE_PATH%\logs MOVE %SOURCE_PATH%\logs %DESTINATION_PATH%
IF EXIST %SOURCE_PATH%\response MOVE %SOURCE_PATH%\response %DESTINATION_PATH%

RD /S /Q %SOURCE_PATH%
MOVE %DESTINATION_PATH% %SOURCE_PATH%

@endlocal

:END
