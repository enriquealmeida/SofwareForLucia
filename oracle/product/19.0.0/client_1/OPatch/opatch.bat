@echo off
REM ######################################################################
REM #  Copyright (c) 2004, 2015, Oracle and/or its affiliates.  All rights reserved.
REM #
REM #  opatch  5/21/04   Create and support
REM #                          -jdk, -jre, -oh
REM #  opatch  6/21/04   Added support for OPATCH_DEBUG
REM #  opatch  7/15/04   use jdk to invoke opatch, otherwise use jre
REM #  opatch  7/16/04   Display the Java call for debug
REM #  opatch  7/19/04   Add ".\" to class path
REM #  opatch  8/05/04   change opatch to oracle.opatch package
REM #  opatch  8/23/04   Support OPATCH_PLATFORM_ID
REM #  opatch  8/27/04   add fallback schemes for jre/jdk
REM #  opatch  8/30/04   Print "OPatch Succeeded" if OK
REM #  opatch  9/01/04   Further changes for jre/jdk priorities
REM #  opatch  9/07/04   java not present in jdk/jre option, error out
REM #  opatch  12/15/04  Supply PATH variable to java
REM #  opatch  03/02/05  Introduce OPATCH_NO_FUSER to bypass fuser check
REM #  opatch  02/02/05  Minor bug in parsing -jdk option
REM #  opatch  03/08/05  Change the Opatch exit messages.
REM #  opatch  03/15/05  Pass in properties to OPatch
REM #  opatch  05/14/05  Add opatchprereq.jar and opatchutil.jar to CP 
REM #  opatch  07/18/05  Do not pass PATH env var to OPatch JVM
REM #  opatch  05/10/06  Return 0 as exit code, even for warnings.
REM #  opatch  06/15/06  Put OPatch/jlib/xmlparserv2.jar in classPath.
REM #  opatch  06/21/06  Look for jre 1.5 and then fall back to JDK.
REM #  opatch  08/01/06  Remove dependency on xmlparserv2.
REM #  opatch  08/17/06  Include opatchactions.jar in classpath
REM #  opatch  11/12/06  Check for JRE first, then JDK and then oraparam
REM #  opatch  01/04/08  Fix Bug sbmbhcb
REM #  opatch  02/27/08  Pass %BASE% (running directory of 'opatch') as a property
REM #                      to java invocation. This is needed to locate ocm.zip in
REM #                      OPatch.
REM #  opatch  03/04/08  Add OCM's emocmutl.jar to the classpath
REM #  opatch  05/14/08  CCR_INSTALL_DEFER_COLLECT=1 
REM #  opatch  09/09/09  No support for 'opatch auto'
REM #  opatch  06/23/09  Add opatchext.jar to OPatch classpath
REM #  opatch  09/15/09  Return exit code with /b switch
REM #  opatch  08/19/09  FMW Checks
REM #  opatch  09/09/09  Better messages for MW/OH consistency check
REM #  opatch  10/31/09  No mandatory MWH/OH
REM #  opatch  11/11/09  Pass Common Home Location to OPatch
REM #  opatch  12/24/09  Remove quotes from the Oracle Home
REM #  opatch  04/06/10  Fix issue with non-FMW OH installs in MWH
REM #  opatch  10/07/10  Add LDIF_PATH to support LDIF classpath temporary
REM #  opatch  10/15/10  Add opatchsdk.jar to classpath, remove unwanted jars
REM #  opatch  10/22/10  Add correct LDIF path to the classpath
REM #  opatch  10/22/10  Add emcfg.jar, ojmisc.jar
REM #  opatch  11/12/10  Add BIP classpath
REM #  opatch  12/13/10  Add JAXB jars to the classpath
REM #  opatch  04/07/11  Change OUI_location logic
REM #  opatch  12/01/12  Add domain config jar from oracle_common home for fmw12
REM #  opatch  04/19/13  Revert Support for JDK and JRE with white spaces
REM #  opatch  07/09/14  Fix error msg for invalid -oh
REM #  opatch  01/07/15  Remove OCM from opatch 13.3.x
REM #  opatch  09/03/15  Update the year of copyright
REM ######################################################################

setlocal enabledelayedexpansion

REM # Set the base path
set BASE=%~DP0%
set SCRIPTPATH=%~DP0%~NX0

set FIRST=%1

REM # No support for 'opatch auto'
if "%1" == "auto" goto AUTOERROR 

REM # Get ORACLE_HOME from environment variable "ORACLE_HOME"
set OH=%ORACLE_HOME%

REM # Get OPATCH_JRE_MEMORY_OPTIONS from environment variable "OPATCH_JRE_MEMORY_OPTIONS"
set JRE_MEMORY_OPTIONS=%OPATCH_JRE_MEMORY_OPTIONS%

REM # Get Middleware Home from environment variable "MW_HOME"
set MWH=%MW_HOME%

REM # Check for OPATCH_DEBUG env variable
set DEBUG=%OPATCH_DEBUG%

set DEBUGVAL=false
if "%DEBUG%" == "TRUE" (set DEBUGVAL=true) else if "%DEBUG%" == "true" (set DEBUGVAL=true)

REM # Set CCR_INSTALL_DEFER_COLLECT=1
set CCR_INSTALL_DEFER_COLLECT=1

REM # Look for OPATCH_PLATFORM_ID
set PLATFORM=%OPATCH_PLATFORM_ID%

REM # Look for ORACLE_OCM_SERVICE
set OCM_SERVICE=
if NOT "%ORACLE_OCM_SERVICE%" == "" set OCM_SERVICE=-Docm.endpoint=%ORACLE_OCM_SERVICE%

REM # Preserve the PATH environment variable
set PATHENV=%PATH%

REM # If -oh is specified, use it to over-ride env. var. ORACLE_HOME
set getOH=0

REM # Look for OPATCH_NO_FUSER env. variable
set NO_FUSER=%OPATCH_NO_FUSER%

REM # All the OPatch properties to be passed in to Java
REM # Format for properties is abc=xyz
set PROPERTIES=

REM # If -jre or -jdk are specified, use it to launch opatch,
REM #   with -jdk > -jre.  And we expect there is a "bin/java" underneath
REM #   the value supplied
set getJRE=0
set getJDK=0
set getOUI=0
set getCustomLogDir=0

set JDK=
set JRE=
set OUI_LOCATION=
set FINAL_OUI_LOCATION=
set CUSTOM_LOG_DIR=

REM # If -mw_home is specified, use it for the next of the session 
REM # after verification of its integrity
set getMWHOME=0

REM # Get the opatch version from version.txt
set OPATCH_VERSION=
set IS_VERSION_133=0

REM # If -ocmrf is specified for opatch version 13.3.x, print out deprecated warning.
set OCMRF_OPTION=0

set PARAMS=%*


:FORLOOP

if "%1" == "" goto DONELOOP

if NOT "%getMWHOME%" == "1" goto CHECK1
set MWH=%1
set getMWHOME=0

:CHECK1
if NOT "%getOH%" == "1" goto CHECK2 
set OH=%1
set getOH=0

:CHECK2
if NOT "%getJRE%" == "1" goto CHECK3 
set JRE=%1
set getJRE=0

:CHECK3
if NOT "%getJDK%" == "1" goto CHECK4
set JDK=%1
set getJDK=0

:CHECK4
if NOT "%getOUI%" == "1" goto CHECKLOG
set OUI_LOCATION=%1
set FINAL_OUI_LOCATION=%1
set getOUI=0

:CHECKLOG
if NOT "%getCustomLogDir%" == "1" goto CHECKFMW2
set CUSTOM_LOG_DIR=%1
set getCustomLogDir=0

:CHECKFMW2
if NOT "%1" == "-mw_home" goto CHECK5
set getMWHOME=1

:CHECK5
if NOT "%1" == "-oh" goto CHECK6
set getOH=1

:CHECK6
if NOT "%1" == "-jre" goto CHECK7
set getJRE=1

:CHECK7
if NOT "%1" == "-jdk" goto CHECK8
set getJDK=1

:CHECK8
if NOT "%1" == "-oui_loc" goto CHECK9
set getOUI=1

:CHECK9
if NOT "%1" == "-ocmrf" goto CHECK10
set OCMRF_OPTION=1

:CHECK10
if NOT "%1" == "-customLogDir" goto FORCHECK
set getCustomLogDir=1

:FORCHECK
shift
goto FORLOOP

:DONELOOP

REM # Get the opatch version from version.txt
:GET_VERSION
set VERSION_133=OPATCH_VERSION:13.3
set version_txt_file=%BASE%\version.txt
findstr /B "%VERSION_133%" "%version_txt_file%" >nul && set IS_VERSION_133=1

REM # The option 'ocmrf' is deprecated in opatch version 13.3.x
:OCMRF_OPTION
if %OCMRF_OPTION%==1 (
   if %IS_VERSION_133%==1 (
      echo ----------------------------------------------------------------------------
      echo WARNING: the option `-ocmrf` is deprecated and no longer needed.  OPatch no
      echo longer checks for OCM configuration. It will be removed in a future release.
      echo ----------------------------------------------------------------------------
    )
)

if "%OH%" == "" goto CHECKFMW3
@REM Remove quotes

set OH=%OH:"=%
for /l %%i in (1,1,260) do if "!OH:~-1!"==" " set OH=!OH:~0,-1!
if NOT EXIST %OH%\NUL (
   echo The Oracle Home %OH% could not be located. Please give proper Oracle Home.
   echo OPatch returns with error code = 1
   goto EXIT
) 

if NOT "%FMW_COMPONENT_HOME%" == "" goto SETMWHOME
if NOT EXIST %OH%\common\bin\setHomeDirs.cmd goto CHECKSUBDIR
if NOT EXIST %OH%\common\bin\setWlstEnv.cmd goto CHECKSUBDIR
set C_ORACLE_HOME=%OH%
set FMW_COMPONENT_HOME=%OH%
goto SETMWHOME

:CHECKSUBDIR
set SCRIPT_FILE_EXIST=1
for /D %%I in (%OH%\..\*) do (
	if NOT EXIST %%I\common\bin\setHomeDirs.cmd set SCRIPT_FILE_EXIST=0
	if NOT EXIST %%I\common\bin\setWlstEnv.cmd set SCRIPT_FILE_EXIST=0
	if !SCRIPT_FILE_EXIST! == 1 set FMW_COMPONENT_HOME=%%I
	if !SCRIPT_FILE_EXIST! == 1 goto CHECKCOMPONENTHOME
	set SCRIPT_FILE_EXIST=1
)


:CHECKCOMPONENTHOME
if NOT "%FMW_COMPONENT_HOME%" == "" goto SETMWHOME
if "%DEBUGVAL%" == "true" (
	echo OPatch was not able to set FMW_COMPONENT_HOME by itself.
)

set C_ORACLE_HOME=%OH%

:SETMWHOME
if NOT "%FMW_COMPONENT_HOME%" == "" set C_ORACLE_HOME=%FMW_COMPONENT_HOME%
@REM Calculate Middleware Home simply by moving up IFF User set Oracle Home
for %%? in ("%C_ORACLE_HOME%\..") do set C_MW_HOME=%%~f?
goto CHECKFMW4

:CHECKFMW3
@REM Determine the location of this script...
FOR %%i IN ("%SCRIPTPATH%") DO SET SCRIPTPATH=%%~fsi

@REM Calculate the ORACLE_HOME relative to this script...
FOR %%i IN ("%SCRIPTPATH%\..\..") DO SET C_ORACLE_HOME=%%~fsi

@REM Set the MW_HOME relative to the ORACLE_HOME...
FOR %%i IN ("%C_ORACLE_HOME%\..") DO SET C_MW_HOME=%%~fsi

if "%DEBUGVAL%" == "true" echo ORACLE_HOME is NOT set at OPatch invocation

:CHECKFMW4
if "%MWH%" == "" goto CHECKFMW5
for %%a in (%MWH%.) do set MWH=%%~dpfa

:CHECKFMW5
@REM Check the Middleare home is FMW12C
if NOT EXIST %C_ORACLE_HOME%\inventory\registry.xml goto FMW12CEND
set MW_HOME=%C_ORACLE_HOME%
if NOT EXIST %C_ORACLE_HOME%\oracle_common\common\bin\setHomeDirs.cmd goto FMW12CEND
set MWH=%MW_HOME%
goto CHECKFMW7

:FMW12CEND
if NOT EXIST %C_MW_HOME%\registry.dat goto CHECKFMW9

:CHECKFMW7
if "%MWH%" == "" set MWH=%C_MW_HOME% 
if "%OH%" == "" set OH=%C_ORACLE_HOME%
goto GETOUI1

:CHECKFMW9
REM # If Oracle Home not set, error out
if NOT "%OH%" == "" goto GETOUI1
if NOT EXIST %C_ORACLE_HOME%\oui (
   echo The Oracle Home %C_ORACLE_HOME% is not OUI based home. Please give proper Oracle Home.
   echo OPatch returns with error code = 1
   set ERRORLEVEL = 1
   goto EXIT
)
set OH=%C_ORACLE_HOME%

:GETOUI1
if EXIST %OUI_LOCATION% goto INVOKEJAVA
set OUI_LOCATION_TEMP=%OH%\oui
set FINAL_OUI_LOCATION=%OH%\oui

if EXIST %OUI_LOCATION_TEMP% goto INVOKEJAVA

set FINAL_OUI_LOCATION=

@REM Determine the location of this script...
SET SCRIPTPATH=%BASE%
FOR %%i IN ("%SCRIPTPATH%") DO SET SCRIPTPATH=%%~fsi

@REM Calculate the ORACLE_HOME relative to this script...
FOR %%i IN ("%SCRIPTPATH%\..") DO SET C_ORACLE_HOME=%%~fsi

set OUI_LOCATION=%C_ORACLE_HOME%\oui
set FINAL_OUI_LOCATION=%C_ORACLE_HOME%\oui

if EXIST %OUI_LOCATION% goto INVOKEJAVA

set OUI_LOCATION=
set FINAL_OUI_LOCATION=

:INVOKEJAVA
call %BASE%\scripts\opatch_jvm_discovery.bat

REM # Java executable exists and has execute permission, exit otherwise
:JAVATEST
if NOT "%JAVA%" == "" goto JAVATEST1
echo Java could not be located. OPatch cannot proceed!
set ERRORLEVEL=1
goto OPATCHDONE

:JAVATEST1
if EXIST %JAVA% goto CALLOPATCH
echo %JAVA% could not be located. OPatch cannot proceed!
set ERRORLEVEL=1
goto OPATCHDONE


REM echo.
REM echo.
REM echo Path to Java binary    %JAVA%
REM echo Classpath for java     %CP%
REM echo Oracle Home to be used %OH%
REM echo.
REM echo.

:CALLOPATCH
if NOT "%OUI_LOCATION%" == "" set OUI=%OUI_LOCATION%

if "%OUI_LOCATION%" == "" set OUI=%OH%\oui

if EXIST "%OOP_TEMP_OH%" set OUI=%OOP_TEMP_OH%\oui

set FUSION_TRUST_OPTION=
if NOT "%WL_HOME%" == "" (
   if EXIST %WL_HOME%\server\lib\fusion_trust.jks set FUSION_TRUST_OPTION=-Dweblogic.security.SSL.trustedCAKeyStore=%WL_HOME%\server\lib\fusion_trust.jks
)

:HANDLE_BASE_DIR
if "%BASE%" == "" goto HANDLE_OH_DIR
set LAST_CHAR=%BASE:~-1,1%
set TEMP_BASE=%BASE%
if "%LAST_CHAR%" == "\" set BASE=%TEMP_BASE:~0,-1%

:HANDLE_OH_DIR
if "%OH%" == "" goto HANDLE_MWH_DIR
set LAST_CHAR=%OH:~-1,1%
set TEMP_OH=%OH%
if "%LAST_CHAR%" == "\" set OH=%TEMP_OH:~0,-1%

:HANDLE_MWH_DIR
if "%MWH%" == "" goto HANDLE_WL_HOME_DIR
set LAST_CHAR=%MWH:~-1,1%
set TEMP_MWH=%MWH%
if "%LAST_CHAR%" == "\" set MWH=%TEMP_MWH:~0,-1%

:HANDLE_WL_HOME_DIR
if "%WL_HOME%" == "" goto HANDLE_COMMON_COMPONENT_HOME_DIR
set LAST_CHAR=%WL_HOME:~-1,1%
set TEMP_WL_HOME=%WL_HOME%
if "%LAST_CHAR%" == "\" set WL_HOME=%TEMP_WL_HOME:~0,-1%

:HANDLE_COMMON_COMPONENT_HOME_DIR
if "%COMMON_COMPONENT_HOME%" == "" goto HANDLE_OUI_LOCATION_DIR
set LAST_CHAR=%COMMON_COMPONENT_HOME:~-1,1%
set TEMP_COMMON_COMPONENT_HOME=%COMMON_COMPONENT_HOME%
if "%LAST_CHAR%" == "\" set COMMON_COMPONENT_HOME=%TEMP_COMMON_COMPONENT_HOME:~0,-1%

:HANDLE_OUI_LOCATION_DIR
if "%OUI_LOCATION%" == "" goto HANDLE_FMW_COMPONENT_HOME_DIR
set LAST_CHAR=%OUI_LOATION:~-1,1%
set TEMP_OUI_LOCATION=%OUI_LOCATION%
if "%LAST_CHAR%" == "\" set OUI_LOCATION=%TEMP_OUI_LOCATION:~0,-1%

:HANDLE_FMW_COMPONENT_HOME_DIR
if "%FMW_COMPONENT_HOME%" == "" goto IS_NEXT_GEN_OUI
set LAST_CHAR=%FMW_COMPONENT_HOME:~-1,1%
set TEMP_FMW_COMPONENT_HOME=%FMW_COMPONENT_HOME%
if "%LAST_CHAR%" == "\" set FMW_COMPONENT_HOME=%TEMP_FMW_COMPONENT_HOME:~0,-1%

REM # This is legacy OUI classpath and jars
:IS_NEXT_GEN_OUI
if EXIST %OUI%\modules goto NEXT_GEN_OUI_LIB_SET
set CP=%OUI%\lib
set OUI_JARS="%CP%\OraInstaller.jar;%CP%\OraPrereq.jar;%CP%\share.jar;%CP%\orai18n-mapping.jar;%CP%\xmlparserv2.jar;%CP%\emCfg.jar;%CP%\ojmisc.jar"

REM # Set OPatch classpath for legacy OUI home
:OPATCH_CLASSPATH_SET
set OPATCH_CLASSPATH="%BASE%\ocm\lib\emocmclnt.jar;%CP%\emCfg.jar;%OUI_JARS%;%BASE%\jlib\opatch.jar;%BASE%\oplan\jlib\automation.jar;%BASE%\oplan\jlib\apache-commons\commons-cli-1.0.jar;%BASE%\jlib\opatchsdk.jar;%BASE%\oplan\jlib\jaxb\activation.jar;%BASE%\oplan\jlib\jaxb\jaxb-api.jar;%BASE%\oplan\jlib\jaxb\jaxb-impl.jar;%BASE%\oplan\jlib\jaxb\jsr173_1.0_api.jar;%BASE%\oplan\jlib\OsysModel.jar;%BASE%\oplan\jlib\osysmodel-utils.jar;%BASE%\oplan\jlib\CRSProductDriver.jar;%BASE%\jlib\oracle.opatch.classpath.jar;%BASE%\oplan\jlib\oracle.oplan.classpath.jar"
goto ECHOOPATCHDEBUG

REM # This is nextgen-based OUI classpath and jars
:NEXT_GEN_OUI_LIB_SET
set CP=%OUI%\modules
set OUI_JARS=%CP%\installer-launch.jar

REM # Set OPatch classpath for nextgen-based OUI home
:OPATCH_CLASSPATH_SET_NEXTGEN_HOME
set OPATCH_CLASSPATH="%OUI_JARS%;%BASE%\jlib\oracle.opatch.classpath.jar;%BASE%\auto\core\modules\features\oracle.glcm.oplan.core.classpath.jar;%BASE%\auto\core\modules\features\oracle.glcm.osys.core.classpath.jar"

:ECHOOPATCHDEBUG

REM # get java version
for /f "tokens=3" %%g in ('"%JAVA% -version 2>&1 | findstr /i version"') do (
    set JAVAVER=%%g
)
set JAVAVER=%JAVAVER:"=%

for /f "delims=. tokens=1" %%v in ("%JAVAVER%") do (
    set JAVAFIRSTCHAR=%%v
)
if NOT "%JAVAFIRSTCHAR%" == "1" (
    set OTHEROPT=--illegal-access=deny
)

if "%DEBUGVAL%" == "true" (
   echo %JAVA% %OTHEROPT% %JAVA_VM_OPTION% %JRE_MEMORY_OPTIONS% -cp %OPATCH_CLASSPATH%;.\;. -DOPatch.ORACLE_HOME=%OH% -DOPatch.DEBUG=%DEBUGVAL% -DOPatch.RUNNING_DIR=%BASE%  -DOPatch.MW_HOME=%MWH% -DOPatch.WL_HOME=%WL_HOME% -DOPatch.COMMON_COMPONENTS_HOME=%COMMON_COMPONENTS_HOME% -DOPatch.OUI_LOCATION=%OUI_LOCATION% -DOPatch.FMW_COMPONENT_HOME=%FMW_COMPONENT_HOME% -DOPatch.WEBLOGIC_CLASSPATH=%WEBLOGIC_CLASSPATH% -DOPatch.OPATCH_CLASSPATH=%CLASSPATH% %FUSION_TRUST_OPTION% %OCM_SERVICE% oracle/opatch/OPatch %PARAMS%
)

:CALLOPATCHNODEBUG
   %JAVA% %OTHEROPT% %JAVA_VM_OPTION% %JRE_MEMORY_OPTIONS% -cp "%OPATCH_CLASSPATH%;.\;." -DOPatch.ORACLE_HOME="%OH%" -DOPatch.DEBUG="%DEBUGVAL%" -DOPatch.RUNNING_DIR="%BASE%" -DOPatch.MW_HOME="%MWH%" -DOPatch.WL_HOME="%WL_HOME%" -DOPatch.COMMON_COMPONENTS_HOME="%COMMON_COMPONENTS_HOME%" -DOPatch.OUI_LOCATION="%OUI_LOCATION%" -DOPatch.FMW_COMPONENT_HOME="%FMW_COMPONENT_HOME%" -DOPatch.WEBLOGIC_CLASSPATH="%WEBLOGIC_CLASSPATH%" -DOPatch.OPATCH_CLASSPATH="%CLASSPATH%" %FUSION_TRUST_OPTION% %OCM_SERVICE% oracle/opatch/OPatch %PARAMS% 

:OPATCHDONE
set RESULT=%ERRORLEVEL%
if NOT "%OH%" == "" set OOP_TEMP_FILE=%OH%\cfgtoollogs\opatch\oop_temp.bat
if NOT "%CUSTOM_LOG_DIR%" == "" set OOP_TEMP_FILE=%CUSTOM_LOG_DIR%\opatch\oop_temp.bat
if EXIST %OOP_TEMP_FILE% goto CALLOOP
if "%FIRST%" == "lspatches" goto EXIT
if %ERRORLEVEL% == 0 goto SUCCEXIT
if %ERRORLEVEL% LSS 5 goto FAILEXIT
if %ERRORLEVEL% GTR 7 goto WARNEXIT
echo.
echo OPatch stopped on request.
set RESULT=0
goto EXIT

:CALLOOP
CALL %OOP_TEMP_FILE%
del %OOP_TEMP_FILE%
if NOT "%OOP_RESTART_CMD%" == "" %OOP_RESTART_CMD%

:WARNEXIT
if %ERRORLEVEL% GTR 8 goto FAILEXIT
echo.
echo OPatch completed with warnings.
set RESULT=0
goto EXIT

:FAILEXIT
echo.
echo OPatch failed with error code = %RESULT%
goto EXIT

:SUCCEXIT
echo.
echo OPatch succeeded.
goto EXIT

:AUTOERROR
echo.
echo 'opatch auto' is not available on Windows.
goto EXIT

:EXIT
if EXIST "%OOP_TEMP_OH%" (
   for /R %OOP_TEMP_OH% %%f in (*) do (
      if NOT "%%f" == "%OOP_TEMP_OH%\OPatch\opatch.bat" del /s /q "%%f" 1>nul 2>&1
   )
)
exit /b %RESULT%

