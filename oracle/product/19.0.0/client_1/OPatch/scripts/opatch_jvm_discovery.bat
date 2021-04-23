@echo off
REM ######################################################################
REM REM Copyright (c) 2014, 2024, Oracle and/or its affiliates. 
REM REM All rights reserved. 
REM REM 
REM REM opatch     09/02/13   Creation
REM REM ######################################################################


REM # Use ORACLE_HOME to set Java CLASS_PATH
REM # default location
set JAVA=
set SET_JAVA_HOME=%JAVA_HOME%
REM # Use JDK if supplied
if NOT "%JAVA%" == "" goto CHECKJRE
if "%JDK%" == "" goto CHECKJRE
REM if NOT EXIST %JDK%\bin\java.exe goto CHECKJRE
set JAVA=%JDK%\bin\java.exe
set JAVA_HOME=%JDK%
REM if EXIST %JAVA% goto JVMDISCOVERYDONE
goto JVMDISCOVERYDONE
REM set JAVA=

:CHECKJRE
REM # Use JRE if supplied
if NOT "%JAVA%" == "" goto CHECKOPATCHSHIPPEDJRE 
if "%JRE%" == "" goto CHECKOPATCHSHIPPEDJRE
REM if NOT EXIST %JRE%\bin\java.exe goto CHECKGETPROPERTY
set JAVA="%JRE%\bin\java.exe"
set JAVA_HOME="%JRE%"
REM if EXIST %JAVA% goto JVMDISCOVERYDONE
goto JVMDISCOVERYDONE
REM set JAVA=

:CHECKOPATCHSHIPPEDJRE
set JAVA=
set JAVA_HOME=%SET_JAVA_HOME%
if NOT EXIST %OH%\OPatch\jre\bin\java.exe goto CHECKGETPROPERTY
set JAVA=%OH%\OPatch\jre\bin\java.exe
set JAVA_HOME=%OH%\jre
if EXIST %JAVA% goto JVMDISCOVERYDONE
set JAVA=
set JAVA_HOME=%SET_JAVA_HOME%


:CHECKGETPROPERTY
REM # Looking for java home using getProperty.cmd
if NOT "%JAVA%" == "" goto CHECKGETVARIABLE 
if NOT EXIST "%~dp0\..\..\bin\getProperty.cmd" goto CHECKGETVARIABLE
if "%DEBUGVAL%" == "true" echo "Looking for java home using %~dp0\..\..\bin\getProperty.cmd"
call %~dp0\..\..\bin\getProperty.cmd LCM_JAVA_HOME
set JAVA=%JAVA_HOME%\bin\java.exe
if EXIST %JAVA% goto JVMDISCOVERYDONE
set JAVA=
set JAVA_HOME=%SET_JAVA_HOME%

:CHECKGETVARIABLE
REM # Looking for java home using getVariable.cmd
if NOT "%JAVA%" == "" goto CHECKSETHOMEDIRS
if NOT EXIST %FINAL_OUI_LOCATION%\bin\getVariable.cmd goto CHECKSETHOMEDIRS
if "%DEBUGVAL%" == "true" echo "Looking for java home using %FINAL_OUI_LOCATION%\bin\getVariable.sh"
call %FINAL_OUI_LOCATION%\bin\getVariable.cmd JAVA_HOME
set JAVA=%JAVA_HOME%\bin\java.exe
if EXIST %JAVA% goto JVMDISCOVERYDONE
set JAVA=
set JAVA_HOME=%SET_JAVA_HOME%

:CHECKSETHOMEDIRS
if NOT "%JAVA%" == "" goto FMW12CENT
if NOT EXIST %C_ORACLE_HOME%\oracle_common\common\bin\setHomeDirs.cmd goto FMW12CENT
call "%C_ORACLE_HOME%\oracle_common\common\bin\setHomeDirs.cmd" > nul
set JAVA=%JAVA_HOME%\bin\java.exe
if EXIST %JAVA% goto JVMDISCOVERYDONE
set JAVA=
set JAVA_HOME=%SET_JAVA_HOME%

:FMW12CENT
if NOT "%JAVA%" == "" goto CHECKOHJRE
if NOT EXIST %C_ORACLE_HOME%\common\bin\setHomeDirs.cmd goto CHECKOHJRE
call "%C_ORACLE_HOME%\common\bin\setHomeDirs.cmd" > nul
set JAVA=%JAVA_HOME%\bin\java.exe
if EXIST %JAVA% goto JVMDISCOVERYDONE
set JAVA=
set JAVA_HOME=%SET_JAVA_HOME%

:CHECKOHJRE
REM # Use OH\jre\*, it should be 1.6 or above
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
if "%JRE_HIGH_SECOND%" LSS "6" goto CHECKOHJDK
set JAVA=%OH%\jre\%JRE_HIGH%\bin\java.exe
set JAVA_HOME=%OH%\jre\%JRE_HIGH%
if EXIST %JAVA% goto JVMDISCOVERYDONE
set JAVA=
set JAVA_HOME=%SET_JAVA_HOME%

:CHECKOHJDK
REM # Check for jdk location inside OH
if NOT "%JAVA%" == "" goto CHECKJDK6
if NOT EXIST %OH%\jdk\bin\java.exe goto CHECKJDK6
set JAVA=%OH%\jdk\bin\java.exe
set JAVA_HOME=%OH%\jdk
FOR /f "tokens=3" %%g in ('%JAVA% -version 2^>^&1^| findstr /i "version"') do (
	SET "JAVA_VERSION=%%g"
)
REM #Check if JAVA version is at least 1.6
REM #If not retrieve JRE shipped with OPatch
if %JAVA_VERSION% LSS "1.6" goto CHECKJDK6
if EXIST %JAVA% goto JVMDISCOVERYDONE
set JAVA=
set JAVA_HOME=%SET_JAVA_HOME%


:CHECKJDK6
REM # Check for jdk6 from one level up of OH
if NOT "%JAVA%" == "" goto CHECKORAPARAM
if NOT EXIST %OH%\..\jdk6\bin\java.exe goto CHECKORAPARAM
set JAVA=%OH%\..\jdk6\bin\java.exe
set JAVA_HOME=%OH%\..\jdk6
if EXIST %JAVA% goto JVMDISCOVERYDONE
set JAVA=
set JAVA_HOME=%SET_JAVA_HOME%

:CHECKORAPARAM
REM # Last option is to look inside oraparam.ini for JRE_LOCATION
if EXIST "%JAVA%" goto CHECKUPLEVELJRE
if NOT EXIST %FINAL_OUI_LOCATION%\oraparam.ini goto CHECKUPLEVELJRE
if "%DEBUGVAL%" == "true" echo "Looking for java in %FINAL_OUI_LOCATION%\oraparam.ini"
set JRE_LOCATION=
for /F "usebackq tokens=2 delims==" %%A in (`findstr "JRE_LOCATION=" %FINAL_OUI_LOCATION%\oraparam.ini`) do set JRE_LOCATION=%%A
if "%JRE_LOCATION%" == "" goto CHECKUPLEVELJRE
set ABS_PATH=
for /F "eol=\ tokens=1" %%A in ("%JRE_LOCATION%") do set ABS_PATH=%%A
if "%ABS_PATH%" == "" goto JAVAABSPATH
for /F "tokens=1,2 delims=:" %%B in ("%JRE_LOCATION%") do set ABS_PATH=%%B
if NOT "%ABS_PATH%" == "%JRE_LOCATION%" goto JAVAABSPATH
set JAVA=%FINAL_OUI_LOCATION%\bin\%JRE_LOCATION%\bin\java.exe
if EXIST %JAVA% goto JVMDISCOVERYDONE
set JAVA=

:JAVAABSPATH
set JAVA=%JRE_LOCATION%\bin\java.exe
if EXIST %JAVA% goto JVMDISCOVERYDONE
set JAVA=

:CHECKJDK6
if NOT EXIST %ORACLE_HOME%/jdk6 goto CHECKUPLEVELJRE
if 

:CHECKUPLEVELJRE
@REM Determine the location of this script...
SET SCRIPTPATH=%BASE%
FOR %%i IN ("%SCRIPTPATH%") DO SET SCRIPTPATH=%%~fsi

@REM Calculate the ORACLE_HOME relative to this script...
FOR %%i IN ("%SCRIPTPATH%\..") DO SET C_ORACLE_HOME=%%~fsi

if NOT "%JAVA%" == "" goto CHECKUPLEVELJDK
set JRE_HIGH=
if NOT EXIST %C_ORACLE_HOME%\jre goto CHECKUPLEVELJDK
for /F "usebackq tokens=1" %%A in (`dir /ON /B %C_ORACLE_HOME%\jre`) do set JRE_HIGH=%%A
if "%JRE_HIGH%" == "" goto CHECKUPLEVELJDK
set JRE_HIGH_FIRST=
set JRE_HIGH_SECOND=
for /F "tokens=1,2 delims=." %%A in ("%JRE_HIGH%") do set JRE_HIGH_FIRST=%%A
for /F "tokens=1,2 delims=." %%A in ("%JRE_HIGH%") do set JRE_HIGH_SECOND=%%B
if "%JRE_HIGH_FIRST%" LSS "1" goto CHECKUPLEVELJDK
if "%JRE_HIGH_SECOND%" LSS "6" goto CHECKUPLEVELJDK
set JAVA=%C_ORACLE_HOME%\jre\%JRE_HIGH%\bin\java.exe
set JAVA_HOME=%C_ORACLE_HOME%\jre\%JRE_HIGH%
if EXIST %JAVA% goto JVMDISCOVERYDONE
set JAVA=
set JAVA_HOME=%SET_JAVA_HOME%

:CHECKUPLEVELJDK
if NOT "%JAVA%" == "" goto JVMDISCOVERYDONE
if NOT EXIST %C_ORACLE_HOME%\jdk\bin\java.exe goto JVMDISCOVERYDONE
set JAVA=%C_ORACLE_HOME%\jdk\bin\java.exe
set JAVA_HOME=%C_ORACLE_HOME%\jdk


:JVMDISCOVERYDONE
