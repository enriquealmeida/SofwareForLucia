@echo off

REM This script is used to execute deinstall.pl from either bootstrap location
REM or from standalone unzip location
REM
@setlocal
REM Initializing the variable SILENT
set SILENT=0
if %1.==. (
   GOTO DONE
)
set VERSION=%1
SHIFT

if %1.==. (
   GOTO DONE
)
set STARTUP_PATH=%1
SHIFT

if %1.==. (
   GOTO DONE
)
if %VERSION% == 0 (
   set toolPath=%1
   SHIFT
) else (
   set toolPath=%STARTUP_PATH%
)

set REST=

:LOOP
if %1.==. (
   GOTO :CONTINUE
)
if (%1)==(-silent) (
   set SILENT=1
)
set REST=%REST% %1
SHIFT
GOTO LOOP
:CONTINUE

if %VERSION% == 1 (
      set deinstallCmd=%STARTUP_PATH%\perl\bin\perl %STARTUP_PATH%\deinstall.pl 0 %VERSION% %STARTUP_PATH% %toolPath% %REST%
) else (
      set deinstallCmd=%toolPath%\perl\bin\perl %toolPath%\deinstall.pl 0 %VERSION% %STARTUP_PATH% %toolPath% %REST%

      REM set PATH accordingly to load required dll's
      set PATH=%toolPath%\bin;!PATH!
)


REM unset PERL5LIB
set PERL5LIB=

%deinstallCmd%

REM Call cleanup_bootstrap.bat
REM
if %VERSION% == 1 (
   if %SILENT% == 0 (
   REM call cleanup_bootstrap.bat.  It is copied under %TEMP%
   CMD /C call %TEMP%\cleanup_bootstrap.bat %STARTUP_PATH% %STARTUP_PATH%_new
   )
)

GOTO DONE

:DONE
endlocal
