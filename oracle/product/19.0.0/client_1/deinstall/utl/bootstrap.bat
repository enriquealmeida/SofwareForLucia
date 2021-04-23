@echo off

REM %1 is bootstrap location
REM %2 is ORACLE_HOME location
%2\perl\bin\perl %2\deinstall\bootstrap.pl %1 %2

REM Copy startup.bat to %TEMP% because we remove %1 in cleanup_bootstrap.bat
REM which throws "The system cannot find the path specified." error.
REM The error is due to the nature of batch processing.
REM
COPY /Y %2\deinstall\utl\startup.bat %TEMP%

REM Copy cleanup_bootstrap.bat to %TEMP% for final cleanup purpose.
COPY /Y %2\deinstall\utl\cleanup_bootstrap.bat %TEMP%
