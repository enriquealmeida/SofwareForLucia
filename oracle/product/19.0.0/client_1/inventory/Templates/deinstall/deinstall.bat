@echo off

Rem $Header: install/utl/scripts/db/deinstall.bat /main/18 2018/04/01 05:23:43 rtattuku Exp $
Rem
Rem Copyright (c) 2005, 2018, Oracle and/or its affiliates. 
Rem All rights reserved.
Rem
Rem    NAME
Rem      deinstall.bat - wrapper script that calls deinstall tool.
Rem
Rem    DESCRIPTION
Rem      This script will determine the tool directory, cd to it and call the 
Rem      deinstall.pl script
Rem
Rem    NOTES
Rem      <other useful comments, qualifications, etc.>
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    vesegu      01/19/18 - LIB RENAME19
Rem    vesegu      01/19/18 - LIB RENAME19
Rem    ambagraw    07/29/15 - Bug 21485879 : Removing PERL Directory from
Rem                           deinstall BOOTSTRAP area
Rem    davjimen    03/31/15 - check if the bin/oracle.key file exists
Rem    gramamur    06/19/12 - Renaming the required dll for shiphome based
Rem                           deinstall
Rem    gramamur    06/01/12 - Changing the delimeter to $ for instantiation
Rem    huliliu     07/15/11 - for bug 12759288, for standalone deinstall tool
Rem                           -help commandath should be corrected
Rem    huliliu     05/23/11 - add special handle for -help option bug 12552180
Rem                           for windows
Rem    huliliu     05/19/11 - change current dir so that deinstall can remove
Rem                           the OH/deinstall dir when running built-in
Rem                           deinstall tool -bug 12552504
Rem    ssampath    09/23/10 - XbranchMerge ssampath_bug-10134082 from
Rem                           st_install_11.2.0
Rem    ssampath    09/21/10 - unset PERL5LIB
Rem    ssampath    03/18/10 - XbranchMerge ssampath_bug-9054252 from
Rem                           st_install_11.2.0.1.0
Rem    ssampath    03/01/10 - XbranchMerge ssampath_bug-9257960 from
Rem                           st_install_11.2.0.1.0
Rem    ssampath    01/18/10 - Pass bootstrap location to bootstrap.pl and
Rem                           deinstall.pl
Rem    vkoganol    10/14/09 - using deleyedexpansion feature to fix bug8988606.
Rem                           Alternate approach use goto
Rem    ssampath    08/20/09 - Comment debug statements
Rem    prsubram    08/17/09 - XbranchMerge
Rem                           prsubram_deinstall_txn_for_including_pl_file from
Rem                           main
Rem    dchriste    03/17/09 - Creation Windows version for new perl deinstall.
Rem    aime        11/15/06 - change PATH.
Rem    dchriste    03/17/09 - Creation Windows version for new perl deinstall.
Rem

@setlocal
@setlocal enabledelayedexpansion

REM unset PERL5LIB
set PERL5LIB=

set TOOL_ARGS=%*

set INSTALLED_VERSION_FLAG=$setInstallFlag$

if (%INSTALLED_VERSION_FLAG%)==(true) (
      set ORACLE_HOME=$ORACLE_HOME$
      set oracleHomeVersion=1
      set TOOL_ARGS=$ORACLE_HOME$ %TOOL_ARGS%
) else (
      set oracleHomeVersion=0
)

@set toolPath=%~dp0
REM echo toolPath = $toolPath$

REM if the option is help, set the help flag on and pass it to deinstall.pl
if (%1)==(-help) (
if %oracleHomeVersion% == 1 (
      if exist %ORACLE_HOME%\bin\oracle.key (
            set calldeinstallpl=%ORACLE_HOME%\perl\bin\perl.exe %ORACLE_HOME%\deinstall\deinstall.pl 1 %oracleHomeVersion%
      ) else (
            ECHO "ERROR: This Oracle home does not seem to be registered."
	    ECHO "Deinstall tool cannot proceed."
	    exit 1
      )
) else (
      set calldeinstallpl=%toolPath%\perl\bin\perl.exe %toolPath%\deinstall.pl 1 %oracleHomeVersion%
)
GOTO END
)

if %oracleHomeVersion% == 1 (
      if exist %ORACLE_HOME%\bin\oracle.key (
            REM %ORACLE_HOME% will get instantiated to the value of "installed" home location
            ECHO Checking for required files and bootstrapping ...
            ECHO Please wait ...
            set cmdToRun=%ORACLE_HOME%\perl\bin\perl.exe %ORACLE_HOME%\deinstall\bootstrap.pl %oracleHomeVersion% %ORACLE_HOME% %TOOL_ARGS%
      ) else (
            ECHO "ERROR: This Oracle home does not seem to be registered."
	    ECHO "Deinstall tool cannot proceed."
	    exit 1
      )
) else (
      set cmdToRun=echo %toolPath%
)

for /f "tokens=*" %%a in ('%cmdToRun%') do set TEMP_LOC=%%a

REM : Setting deinstallCmd to deinstall.pl with arguments.
set deinstallCmd="%TEMP_LOC%\perl\bin\perl" "%TEMP_LOC%\deinstall.pl" 0 %oracleHomeVersion% %TEMP_LOC% %TEMP_LOC% %TOOL_ARGS%
set rmdirperlCmd=rmdir /S /Q "%TEMP_LOC%\perl"

if %oracleHomeVersion% == 1 (
   if exist %ORACLE_HOME%\deinstall\utl\cleanup_bootstrap.bat (
      copy %ORACLE_HOME%\deinstall\utl\cleanup_bootstrap.bat %TEMP%
   ) else (
      ECHO "Unable to locate cleanup_bootstrap.bat under %ORACLE_HOME%\utl. Use standalone tool to cleanup the ORACLE_HOME"
      exit 1
   )
 )

cd %TEMP%

Rem The following files need to be renamed as follows to work properly in case of shiphome based deinstall
rem if EXIST %TEMP%\\deinstall_bootstrap\\bin\\oci.dll.dbl ren %TEMP%\\deinstall_bootstrap\\bin\\oci.dll.dbl oci.dll
rem if EXIST %TEMP%\\deinstall_bootstrap\\bin\\oravsn19_ee.dll.dbl ren %TEMP%\\deinstall_bootstrap\\bin\\oravsn19_ee.dll.dbl oravsn19.dll
rem if EXIST %TEMP%\\deinstall_bootstrap\\bin\\ORANCRYPT19D.DLL ren %TEMP%\\deinstall_bootstrap\\bin\\ORANCRYPT19D.DLL ORANCRYPT19.DLL


Rem Running deinstall_startup.bat from temp folder so that there are no file locks from OH
echo %deinstallCmd% > "%TEMP%\deinstall_startup.bat"
echo %rmdirperlCmd% >> "%TEMP%\deinstall_startup.bat"
"%TEMP%\deinstall_startup.bat"



GOTO EOF

:END
%calldeinstallpl%

:EOF
