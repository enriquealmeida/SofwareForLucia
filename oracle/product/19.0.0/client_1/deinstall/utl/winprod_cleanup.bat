@echo off
Rem
Rem Copyright (c) 2009, 2018, Oracle and/or its affiliates. 
Rem All rights reserved.
Rem
Rem    NAME
Rem      winprod_cleanup.bat - script to cleanup/ungac winprod components.
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem      <other useful comments, qualifications, etc.>
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    vansoni     06/04/18 - Bug-27139275 Fix,unregistration of dll for
Rem                           oledbolap component
Rem    poosrini    12/18/17 - use LIBMAJORVSN in place of
Rem                           DB_VERSION_FIRST_DIGIT
Rem    rtattuku    06/12/17 - Library version change from 12 to 18
Rem    ambagraw    02/13/17 - Bug 25095761: Deinstall logs error to deinstall
Rem                           config logs
Rem    ambagraw    02/25/16 - Bug 22809384 : WINPROD VERSION NEED UPDATE
Rem    ambagraw    02/19/16 - Bug 22761546 - DEINSTALL CHANGES POST INSTALL
Rem                           WINPROD REDUCE TIME CHANGES
Rem    ambagraw    11/08/15 - Bug 21982046 : ASPWEB ASSEMBLIES ARE NOT REMOVED
Rem                           FROM GAC AFTER DEINSTALL
Rem    lorajan     05/14/15 - Adding dll corresponding to
Rem                           oracle.aspnet_2,oracle.ntoledb.odp_net_2
Rem                           components in ASP_NET_dllNames and
Rem                           NTOLEDB_ODP_NET_dllNames. Fixing the bug
Rem                           #20716373.
Rem    haagrawa    03/17/14 - Backport haagrawa_bug-18364264 from main
Rem    haagrawa    03/11/14 - removing
Rem                           Policy.4.121.Oracle.ManagedDataAccess.dll from
Rem                           NTOLEDB_ODP_NET_dllNames as a fix for bug#
Rem                           18364264
Rem    haagrawa    01/20/13 - Bug# 18050209,adding dll corresponding to oracle.aspnet_2,oracle.ntoledb.odp_net_2
Rem 			      components in ASP_NET_dllNames and NTOLEDB_ODP_NET_dllName.
Rem    lorajan     11/29/13 - Bug 17855670 - Making the Oracle.ManagedDataAccessDTC ungacing generic
Rem    ntarale     11/06/13 - Bug 17625057 - Removing registry entry ODP.NET.MANAGED.
Rem    supalava    05/29/13 - XbranchMerge supalava_bug-16751770 from
Rem                           st_install_11.2.0
Rem    haagrawa    01/09/13 - XbranchMerge haagrawa_bug_16028080-new from
Rem                           st_install_12.1.0.1
Rem    pkuruvad    08/02/12 - retrieve ARCHFLAG from java to be used for ungac
Rem    pvallam     06/26/12 - removing reg entries of winprod
Rem    pkuruvad    04/13/12 - changing versions of winprod components
Rem    ntarale     12/29/11 - Bug-13462520 updated ODP/ODE/ASP vesrsions from 2.112.3.0/4.112.3.0
Rem 			      to 2.121.0.1/4.121.0.1 respectively.
Rem    gramamur    12/02/11 - XbranchMerge gramamur_bug-12895705 from
Rem                           st_install_11.2.0
Rem    gramamur    11/13/11 - Bug 12895705 - Removing regisry entries asp.net and odp.net
Rem    davjimen    05/31/11 - XbranchMerge davjimen_bug-12606174 from main
Rem    davjimen    05/31/11 - Bug 12606174 update ODP/ODE/ASP version to
Rem                           2.112.3.0
Rem    bkghosh     12/15/10 - XbranchMerge bkghosh_bug-10356859 from
Rem                           st_install_11.2.0
Rem    bkghosh     12/07/10 - bug-10356859 : deconfiguring ODP PerfCounter
Rem    jaikrish    01/12/10 - check for registry key existence before deleting (Bug#10354341)
Rem    pvallam     10/11/10 - deconfiguring 4.x components
Rem    bkghosh     10/06/10 - bug-9440539 : Fix for the garbage message in
Rem                           command window
Rem    ssampath    04/12/10 - Call msiexec to remove ODP.NET Help GUID based on
Rem                           registry key existence
Rem    ssampath    03/30/10 - XbranchMerge ssampath_bug-9462515 from
Rem                           st_install_11.2.0.1.0
Rem    ssampath    03/30/10 - XbranchMerge ssampath_bug-9444790 from
Rem                           st_install_11.2.0.1.0
Rem    ssampath    03/04/10 - Any cleanup to be done only when .NET framework
Rem                           is installed.
Rem    ssampath    01/21/10 - Add full path to msiexec
Rem    ssampath    01/04/10 - Do minor fixes.
Rem    ssampath    12/24/09 - Call regsvr32.exe in silent mode
Rem    ssampath    12/24/09 - Creation

if %1.==. (
   CALL :MISSING DEINSTALL_TOOL_PATH
   GOTO END
)

if %2.==. (
   CALL :MISSING ORACLE_HOME_PATH
   GOTO END
)

if %3.==. (
   CALL :MISSING ORACLE_HOME_NAME
   GOTO END
)

if %4.==. (
   set COMPS=all
) ELSE (
   set COMPS=%4
)

if %5.==. (
   CALL :MISSING ARCHFLAG
   GOTO END
)

REM TOOLHOME should be set to either deinstall tool unzip location or the 
REM bootstrap location
set TOOLHOME=%1

REM ORACLE_HOME_PATH to be passed to oramts_deinst.exe
set ORA_HOME_PATH=%2

REM ORACLE_HOME_NAME to be passed to oramts_deinst.exe
set ORA_HOME_NAME=%3

REM set ARCHFLAG to be passed for ungacing the dll's
set ARCHFLAG=%5

REM set REG_EXE, REGSVR32_EXE, MSIEXEC
set REG_EXE=%SystemRoot%\system32\reg.exe
set REGSVR32_EXE=%SystemRoot%\system32\regsvr32.exe

set ORAMTS_DEINST_EXEPATH=%TOOLHOME%\bin

IF NOT EXIST %ORAMTS_DEINST_EXEPATH%\oramtsctl.exe (
   CALL :FNF %ORAMTS_DEINST_EXEPATH%\oramtsctl.exe
   GOTO END
)


IF NOT EXIST %ORAMTS_DEINST_EXEPATH%\oramts_deinst.exe (
   CALL :FNF %ORAMTS_DEINST_EXEPATH%\oramts_deinst.exe
   GOTO END
)

setlocal
set ASP_NET_dllNames=Oracle.Web Policy.2.111.Oracle.Web Policy.2.112.Oracle.Web Oracle.Web.resources Policy.4.112.Oracle.Web Policy.2.121.Oracle.Web Policy.4.121.Oracle.Web Policy.2.122.Oracle.Web Policy.4.122.Oracle.Web
set CLRINTG_ODE_NET_dllNames=Oracle.Database.extensions
set NTOLEDB_ODP_NET_dllNames=Oracle.DataAccess Policy.2.102.Oracle.DataAccess Policy.2.111.Oracle.DataAccess Policy.2.112.Oracle.DataAccess Policy.4.112.Oracle.DataAccess Oracle.DataAccess.resources Policy.2.121.Oracle.DataAccess Policy.4.121.Oracle.DataAccess Policy.2.122.Oracle.DataAccess Policy.4.122.Oracle.DataAccess Policy.4.122.Oracle.ManagedDataAccess
set ALL_dllNames=%ASP_NET_dllNames% %CLRINTG_ODE_NET_dllNames% %NTOLEDB_ODP_NET_dllNames% 
set HYBRID_BASE=HKLM\Software\Wow6432Node
set GENERIC_BASE=HKLM\Software

REM Version # should be updated for every release.
set version=2.122.19.1

REM Version # should be updated for every release.
set versiondotnet4=4.122.19.1

REM Framework version (Currently used only in aspnet_2)
REM NOTE:  Needs to be updated for every release. 
set framework_version=v2.0.50727
set framework_version_4=v4.0.30319

set language=de es fr it ja ko pt-BR zh-CHS zh-CHT neutral

REM set ntoledb_odpnet_2 dynamic help GUID
REM NOTE:  Needs to be updated for every release. 

REM DLL's to unregister using regsvr32.exe
REM
set ntoledbDllToUnregister=oraoledb19.dll
set AllDllsToUnregister=%ntoledbDllToUnregister%

REM DLL's to unregister using regsvr32.exe
REM
set ntoledbolapDllToUnregister=OraOLEDBOLAP.dll
set AllDllsToUnregister=%ntoledbolapDllToUnregister%

REM set ARCH flag
REM set ARCHFLAG=x86

if not "%PROCESSOR_ARCHITECTURE%" == "x86" (
REM	set ARCHFLAG=AMD64
)
REM If ARCHITECTURE==64bit
REM Query for ORACLE_HOME value under HYBRID_BASE\\Software\Oracle\KEY_<HOME_NAME>
REM If the ORA_HOME_PATH == value of ORACLE_HOME returned above then we are 
REM removing 32bit OH on 64bit platform
REM set HYBRID=true and use it below for appropriate registry cleanup action

set HYBRID="false"

if not "%PROCESSOR_ARCHITECTURE%" == "x86" (
   %REG_EXE% QUERY %HYBRID_BASE%\Oracle\KEY_%ORA_HOME_NAME% > nul 2>&1
   REM *** If any new code is required, add it AFTER the ErrorLevel check
   IF %ErrorLevel%==0 (
      set OH_REG_VALUE=%REG_EXE% QUERY "%GENERIC_BASE%\Oracle\KEY_%ORA_HOME_NAME%" /v ORACLE_HOME 
      REM Check whether OH_REG_VALUE has ORA_HOME_NAME
      REM If so, then set OH_REG_VALUE to ORA_HOME_PATH
      echo %OH_REG_VALUE%|findstr /i %ORA_HOME_NAME% > nul:
      IF %ErrorLevel%==0 (
          set OH_REG_VALUE=%ORA_HOME_PATH%  
      )
   )
)

REM calling TRIM_OH_VALUES to trim the trailing spaces for the variables OH_REG_VALUE and ORA_HOME_PATH
CALL :TRIM_OH_VALUES

if /I (%OH_REG_VALUE%) == (%ORA_HOME_PATH%) (
   set HYBRID="true"
)

if  %HYBRID% == "true" (
   REM reset ARCHFLAG here because it would have been set to AMD64 above
   REM but we are removing 32bit ORACLE_HOME on 64bit machine.

REM   set ARCHFLAG=x86
)

set ASP_NET_DLL="false"

if (%COMPS%)==("all") (
   set dllNames=%ALL_dllNames%
   set DllsToUnregister=%AllDllsToUnregister%
   CALL :ASP_NET_CLEANUP
   CALL :ODP_NET_CLEANUP
   CALL :ORA_MTS_CLEANUP
)

REM Check if HKLM\System\CurrentControlSet\Services\Oracle11\Performance\KEY_%ORA_HOME_NAME% is present 
%REG_EXE% QUERY "HKLM\System\CurrentControlSet\Services\Oracle11\Performance\KEY_%ORA_HOME_NAME%" > nul 2>&1

IF %ErrorLevel%==0 (
   ECHO "Removing key HKLM\System\CurrentControlSet\Services\Oracle11\Performance\KEY_%ORA_HOME_NAME%"
   %REG_EXE% delete HKLM\System\CurrentControlSet\Services\Oracle11\Performance\KEY_%ORA_HOME_NAME% /f
)

REM Check if HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Application\Oracle Services for MTS is present 
%REG_EXE% QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Application\Oracle Services for MTS" > nul 2>&1

IF %ErrorLevel%==0 (
   ECHO "Removing key HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Application\Oracle Services for MTS"
   %REG_EXE% delete "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application\Oracle Services for MTS" /f
)

REM Check if HKLM\Software\Microsoft\.NETFramework\Policy\v2.0 is present.
%REG_EXE% QUERY "HKLM\Software\Microsoft\.NETFramework\Policy\v2.0" /v 50727 > nul 2>&1

REM If not present, no need to run oraprovcfg.  But, we still need to run others
REM *** If any new code is required, add it AFTER the ErrorLevel check
IF %ErrorLevel%==1 (
   set RUNORAPROV="false"
)

IF %ErrorLevel%==0 (
   set RUNORAPROV="true"
)

REM Check if HKLM\Software\Microsoft\.NETFramework\Policy\v4.0 is present.
%REG_EXE% QUERY "HKLM\Software\Microsoft\.NETFramework\Policy\v4.0" > nul 2>&1

IF %ErrorLevel%==1 (
   set RUNORAPROV4="false"
)

IF %ErrorLevel%==0 (
   set RUNORAPROV4="true"
)

if (%COMPS%)==("asp.net") (
   ECHO "Deconfiguring ASP.NET Component..."
   set dllNames=%ASP_NET_dllNames%
   CALL :ASP_NET_CLEANUP
)

if (%COMPS%)==("ode.net") (
   ECHO "Deconfiguring ODE.NET Component..."
   set dllNames=%CLRINTG_ODE_NET_dllNames%
)

if (%COMPS%)==("odp.net") (
   ECHO "Deconfiguring ODP.NET Component..."
   set dllNames=%NTOLEDB_ODP_NET_dllNames%
   ECHO "Calling ODP_NET_CLEANUP"
   CALL :ODP_NET_CLEANUP
)

if (%COMPS%)==("oramts") (
   ECHO "Deconfiguring ORAMTS Component..."
   CALL :ORA_MTS_CLEANUP
)

if (%COMPS%)==("ntoledb") (
   ECHO "Deconfiguring NTOLEDB Component..."
   set DllsToUnregister=%ntoledbDllToUnregister%
)

if (%COMPS%)==("oledbolap") (
   ECHO "Deconfiguring NTOLEDBOLAP Component..."
   set DllsToUnregister=%ntoledbolapDllToUnregister%
)

REM Need to Change directory to OH\bin before calling regsvr32.exe
REM Otherwise regsvr32.exe does not unregister dll's
REM Reset back to %TOOLHOME% after regsvr32.exe loop below.
CD /D %ORA_HOME_PATH%\bin

REM unregister dlls
REM
for %%d in (%DllsToUnregister%) do (
   %REGSVR32_EXE% /u /s %%d
)

REM Change directory back to %TOOLHOME%
CD /D %TOOLHOME%

endlocal
GOTO END

REM Define all GOTO handlers and SUBS below
:ASP_NET_CLEANUP

REM Remove registry keys
REM NOTE: use /f for force option
REM
if %HYBRID% == "true" (
%REG_EXE% QUERY %HYBRID_BASE%\Microsoft\.NETFramework\%framework_version%\AssemblyFoldersEX\Oracle.Web  > nul 2>&1
IF %ErrorLevel%==0 (
   %REG_EXE% delete %HYBRID_BASE%\Microsoft\.NETFramework\%framework_version%\AssemblyFoldersEX\Oracle.Web /f
)
%REG_EXE% QUERY %HYBRID_BASE%\Microsoft\.NETFramework\%framework_version_4%\AssemblyFoldersEX\Oracle.Web  > nul 2>&1
IF %ErrorLevel%==0 (
   %REG_EXE% delete %HYBRID_BASE%\Microsoft\.NETFramework\%framework_version_4%\AssemblyFoldersEX\Oracle.Web /f
)

) ELSE (
%REG_EXE% QUERY %GENERIC_BASE%\Microsoft\.NETFramework\%framework_version%\AssemblyFoldersEX\Oracle.Web  > nul 2>&1
IF %ErrorLevel%==0 (
   %REG_EXE% delete %GENERIC_BASE%\Microsoft\.NETFramework\%framework_version%\AssemblyFoldersEX\Oracle.Web /f
)
%REG_EXE% QUERY %GENERIC_BASE%\Microsoft\.NETFramework\%framework_version_4%\AssemblyFoldersEX\Oracle.Web  > nul 2>&1
IF %ErrorLevel%==0 (
   %REG_EXE% delete %GENERIC_BASE%\Microsoft\.NETFramework\%framework_version_4%\AssemblyFoldersEX\Oracle.Web /f
)
)

GOTO :eof  REM This is something like 'return' from subroutine

:ODP_NET_CLEANUP
CALL %ORA_HOME_PATH%\ODP.NET\RemoveProjectFiles.bat

REM Check if odp.net has version and version4 subkeys if yes delete it.
REM Remove registry keys
REM NOTE: use /f for force option
REM

%REG_EXE% QUERY HKLM\Software\Oracle\ODP.NET\%version%  > nul 2>&1
    IF %ErrorLevel%==0 (
     %REG_EXE% delete HKLM\Software\Oracle\ODP.NET\%version% /f
   )

%REG_EXE% QUERY HKLM\Software\Oracle\ODP.NET\%versiondotnet4% > nul 2>&1
    IF %ErrorLevel%==0 (
     %REG_EXE% delete HKLM\Software\Oracle\ODP.NET\%versiondotnet4% /f
   )

%REG_EXE% QUERY HKLM\Software\Oracle\ODP.NET.Managed\%versiondotnet4% > nul 2>&1
    IF %ErrorLevel%==0 (
     %REG_EXE% delete HKLM\Software\Oracle\ODP.NET.Managed\%versiondotnet4% /f
   )

if %HYBRID% == "true" (
%REG_EXE% QUERY %HYBRID_BASE%\Microsoft\.NETFramework\%framework_version%\AssemblyFoldersEX\ODP.Net > nul 2>&1
IF %ErrorLevel%==0 (
   %REG_EXE% delete %HYBRID_BASE%\Microsoft\.NETFramework\%framework_version%\AssemblyFoldersEX\ODP.Net /f
)
%REG_EXE% QUERY %HYBRID_BASE%\Microsoft\.NETFramework\%framework_version_4%\AssemblyFoldersEX\ODP.Net > nul 2>&1
IF %ErrorLevel%==0 (
   %REG_EXE% delete %HYBRID_BASE%\Microsoft\.NETFramework\%framework_version_4%\AssemblyFoldersEX\ODP.Net /f
)
%REG_EXE% QUERY %HYBRID_BASE%\Microsoft\.NETFramework\%framework_version_4%\AssemblyFoldersEX\Oracle.DataAccess.EntityFramework6 > nul 2>&1
IF %ErrorLevel%==0 (
   %REG_EXE% delete %HYBRID_BASE%\Microsoft\.NETFramework\%framework_version_4%\AssemblyFoldersEX\Oracle.DataAccess.EntityFramework6 /f
)
) ELSE (
%REG_EXE% QUERY %GENERIC_BASE%\Microsoft\.NETFramework\%framework_version%\AssemblyFoldersEX\ODP.Net > nul 2>&1
IF %ErrorLevel%==0 ( 
   %REG_EXE% delete %GENERIC_BASE%\Microsoft\.NETFramework\%framework_version%\AssemblyFoldersEX\ODP.Net /f
)
%REG_EXE% QUERY %GENERIC_BASE%\Microsoft\.NETFramework\%framework_version_4%\AssemblyFoldersEX\ODP.Net > nul 2>&1
IF %ErrorLevel%==0 ( 
   %REG_EXE% delete %GENERIC_BASE%\Microsoft\.NETFramework\%framework_version_4%\AssemblyFoldersEX\ODP.Net /f
)
%REG_EXE% QUERY %GENERIC_BASE%\Microsoft\.NETFramework\%framework_version_4%\AssemblyFoldersEX\Oracle.DataAccess.EntityFramework6 > nul 2>&1
IF %ErrorLevel%==0 (
   %REG_EXE% delete %GENERIC_BASE%\Microsoft\.NETFramework\%framework_version_4%\AssemblyFoldersEX\Oracle.DataAccess.EntityFramework6 /f
)
)

REM Remove the registry entry for enabling event logs
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\Oracle Data Provider for .NET, Managed Driver" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\Oracle Data Provider for .NET, Unmanaged Driver" /f

REM Delete the registry entry to remove managed assembly in the Add Reference Dialog box in VS.NET
if %HYBRID% == "true" (
   %REG_EXE% delete %HYBRID_BASE%\Microsoft\.NETFramework\%framework_version_4%\AssemblyFoldersEX\Oracle.ManagedDataAccess /f
   %REG_EXE% delete %HYBRID_BASE%\Microsoft\.NETFramework\%framework_version_4%\AssemblyFoldersEX\Oracle.ManagedDataAccess.EntityFramework6 /f
) ELSE (
   %REG_EXE% delete %GENERIC_BASE%\Microsoft\.NETFramework\%framework_version_4%\AssemblyFoldersEX\Oracle.ManagedDataAccess /f
   %REG_EXE% delete %GENERIC_BASE%\Microsoft\.NETFramework\%framework_version_4%\AssemblyFoldersEX\Oracle.ManagedDataAccess.EntityFramework6 /f
)

GOTO :eof  REM This is something like 'return' from subroutine

:ORA_MTS_CLEANUP

REM
REM oramtsctl.exe to get rid of OracleMTSRecoveryService and
REM HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application
REM \oraclemts registry entries.
%ORAMTS_DEINST_EXEPATH%\oramtsctl.exe -delete > nul

REM oramts_deinst.exe to get rid of OracleMTSRecoveryService registry entries.
%ORAMTS_DEINST_EXEPATH%\oramts_deinst.exe %ORA_HOME_NAME% %ORA_HOME_PATH%

GOTO :eof  REM This is something like 'return' from subroutine

REM  File Not Found handle
:FNF
echo Unable to locate %1
GOTO :eof  REM This is something like 'return' from subroutine

REM  This batch file not called with right arguments
:MISSINGPATH
echo You need to specify %1 when calling this batch script
GOTO END

:END

:TRIM_OH_VALUES
REM This will trim the spaces for the variables
REM OH_REG_VALUE and ORA_HOME_PATH

REM Trimming OH_REG_VALUE
FOR /f %%m IN ('echo %OH_REG_VALUE%') DO SET OH_REG_VALUE=%%m

REM Trimming ORA_HOME_PATH
FOR /f %%n IN ('echo %ORA_HOME_PATH%') DO SET ORA_HOME_PATH=%%n
