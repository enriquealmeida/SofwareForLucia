@ECHO OFF
REM
REM unconfigure.bat
REM
REM This .bat file unconfigures ODP.NET, Managed Driver
REM

if /i {%1} == {-h} goto :Usage
if /i {%1} == {-help} goto :Usage

REM determine if the configuration is on a 32-bit or 64-bit OS
set ODAC_CFG_PREFIX=Wow6432Node\
if (%PROCESSOR_ARCHITECTURE%) == (x86) if (%PROCESSOR_ARCHITEW6432%) == () set ODAC_CFG_PREFIX=

REM Remove the registry entry for enabling event logs
echo.
echo reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\Oracle Data Provider for .NET, Managed Driver" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\Oracle Data Provider for .NET, Managed Driver" /f


REM Delete the registry entry to remove managed assembly in the Add Reference Dialog box in VS.NET
echo.
echo reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\%ODAC_CFG_PREFIX%Microsoft\.NETFramework\v4.0.30319\AssemblyFoldersEx\Oracle.ManagedDataAccess" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\%ODAC_CFG_PREFIX%Microsoft\.NETFramework\v4.0.30319\AssemblyFoldersEx\Oracle.ManagedDataAccess" /f
echo.
echo reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\%ODAC_CFG_PREFIX%Microsoft\.NETFramework\v4.0.30319\AssemblyFoldersEx\Oracle.ManagedDataAccess.EntityFramework6" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\%ODAC_CFG_PREFIX%Microsoft\.NETFramework\v4.0.30319\AssemblyFoldersEx\Oracle.ManagedDataAccess.EntityFramework6" /f

goto :EOF

:Usage 
echo. 
echo Usage: 
echo   unconfigure.bat
echo. 
echo Example: 
echo   unconfigure.bat (unconfigure ODP.NET, Managed Driver) 
echo.
goto :EOF
