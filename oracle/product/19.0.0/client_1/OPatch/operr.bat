@echo off
REM ######################################################################
REM #  Usage: operr.bat <error code> [-f <message file>] [-jre <jre location>] [-jdk <jdk location>][-oh <oracle home>]
REM #  operr.bat is located in the $ORACLE_HOME/OPatch didectory.
REM #  opatch  04/08/13 Create and support -f, -jre, -jdk,-oh
REM ######################################################################

setlocal enabledelayedexpansion

REM # Set the base path
set BASE=%~DP0%

REM # Get ORACLE_HOME from environment variable "ORACLE_HOME"
set OH=%ORACLE_HOME%

REM # If -oh is specified, use it to over-ride env. var. ORACLE_HOME
set getOH=0

REM # If -jre or -jdk are specified, use it to launch operr,
REM #   with -jdk > -jre.  And we expect there is a "bin/java" underneath
REM #   the value supplied
set getJRE=0
set getJDK=0
set JDK=
set JRE=

set PARAMS=%*

:FORLOOP

if "%1" == "" goto DONELOOP

if NOT "%getOH%" == "1" goto CHECK1
set OH=%1
set getOH=0

:CHECK1
if NOT "%getJRE%" == "1" goto CHECK2
set JRE=%1
set getJRE=0

:CHECK2
if NOT "%getJDK%" == "1" goto CHECK3
set JDK=%1
set getJDK=0

:CHECK3
if NOT "%1" == "-oh" goto CHECK4
set getOH=1

:CHECK4
if NOT "%1" == "-jre" goto CHECK5
set getJRE=1

:CHECK5
if NOT "%1" == "-jdk" goto FORCHECK
set getJDK=1

:FORCHECK
shift
goto FORLOOP

:DONELOOP

if "%OH%" == ""  goto NOORACLEHOME

@REM Remove quotes
set OH=%OH:"=%
if EXIST %OH%\NUL (
   goto INVOKEJAVA 
)
  
:NOORACLEHOME 
   echo The Oracle Home %OH% could not be located. Please give proper Oracle Home.
   echo OPERR returns with error code = 1
   set %ERRORLEVEL% = 1 
   goto OPERRDONE

:INVOKEJAVA

REM # Use ORACLE_HOME to set Java CLASS_PATH
REM # default location
set JAVA=

REM # Use JDK if supplied
if NOT "%JAVA%" == "" goto CHECKJRE
if "%JDK%" == "" goto CHECKJRE
REM if NOT EXIST %JDK%\bin\java.exe goto CHECKJRE
set JAVA=%JDK%\bin\java.exe
set JAVA_HOME=%JDK%
REM if EXIST %JAVA% goto JAVATEST
goto JAVATEST
REM set JAVA=

:CHECKJRE
REM # Use JRE if supplied
if NOT "%JAVA%" == "" goto CHECKOHJRE
if "%JRE%" == "" goto CHECKOHJRE
REM if NOT EXIST %JRE%\bin\java.exe goto CHECKOHJRE
set JAVA=%JRE%\bin\java.exe
set JAVA_HOME=%JRE%
REM if EXIST %JAVA% goto JAVATEST
goto JAVATEST
REM set JAVA=

:CHECKOHJRE
REM # Use OH\jre\*, it should be 1.5 or above
if NOT "%JAVA%" == "" goto CHECKOHJDK
set JRE_HIGH=
if NOT EXIST %OH%\jre goto CHECKOHJDK
for /F "usebackq tokens=1" %%A in (`dir /ON /B %OH%\jre`) do set JRE_HIGH=%%A
if "%JRE_HIGH%" == "" goto CHECKOHJDK
set JRE_HIGH_FIRST=
set JRE_HIGH_SECOND=
for /F "tokens=1,2 delims=." %%A in ("%JRE_HIGH%") do set JRE_HIGH_FIRST=%%A
for /F "tokens=1,2 delims=." %%A in ("%JRE_HIGH%") do set JRE_HIGH_SECOND=%%B
if "%JRE_HIGH_FIRST%" LSS "1" goto CHECKOHJDK
if "%JRE_HIGH_SECOND%" LSS "5" goto CHECKOHJDK
set JAVA=%OH%\jre\%JRE_HIGH%\bin\java.exe
set JAVA_HOME=%OH%\jre\%JRE_HIGH%
if EXIST %JAVA% goto JAVATEST
set JAVA=

:CHECKOHJDK
REM # Check for jdk location inside OH
if NOT "%JAVA%" == "" goto CHECKJDK6
if NOT EXIST %OH%\jdk\bin\java.exe goto CHECKJDK6
set JAVA=%OH%\jdk\bin\java.exe
set JAVA_HOME=%OH%\jdk
if EXIST %JAVA% goto JAVATEST
set JAVA=

:CHECKJDK6
REM # Check for jdk6 from one level up of OH
if NOT "%JAVA%" == "" goto JAVATEST
if NOT EXIST %OH%\..\jdk6\bin\java.exe goto JAVATEST
set JAVA=%OH%\..\jdk6\bin\java.exe
set JAVA_HOME=%OH%\..\jdk6
if EXIST %JAVA% goto JAVATEST
set JAVA=

REM # Java executable exists and has execute permission, exit otherwise
:JAVATEST
if NOT "%JAVA%" == "" goto JAVATEST1
echo Java could not be located. OPPERR cannot proceed!
set ERRORLEVEL=1
goto OPERRDONE

:JAVATEST1
if EXIST %JAVA% goto HANDLE_BASE_DIR
echo %JAVA% could not be located. OPERR cannot proceed!
set ERRORLEVEL=1
goto OPERRDONE

:HANDLE_BASE_DIR
if "%BASE%" == "" goto HANDLE_OH_DIR
set LAST_CHAR=%BASE:~-1,1%
set TEMP_BASE=%BASE%
if "%LAST_CHAR%" == "\" set BASE=%TEMP_BASE:~0,-1%

:HANDLE_OH_DIR
if "%OH%" == "" goto CALLOPERRNODEBUG
set LAST_CHAR=%OH:~-1,1%
set TEMP_OH=%OH%
if "%LAST_CHAR%" == "\" set OH=%TEMP_OH:~0,-1%

:CALLOPERRNODEBUG
   %JAVA% -cp "%BASE%\jlib\oracle.opatch.classpath.jar;" oracle/opatch/diag/OPatchErrorUtil %PARAMS%    

:OPERRDONE
set RESULT=%ERRORLEVEL%
goto EXIT

:EXIT
exit /b %RESULT%
