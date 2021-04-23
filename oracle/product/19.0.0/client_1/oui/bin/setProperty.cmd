@ECHO OFF

SETLOCAL

IF [%1] == [] (
        GOTO USAGE
) ELSE (
        SET VARIABLE_NAME=%1
)

IF /i "%VARIABLE_NAME%" == "-help" (GOTO USAGE)

@REM Copy args without parsing explicitly using %1 etc.
@REM because cmd parser turns equals sign, comma and possibly others
@REM into white space
@REM See http://support.microsoft.com/kb/35938 : equals sign considered white space
SET ALLARGS=%*

@REM Get drive letter and directory path
SET SCRIPT_PATH=%~dp0

@REM Get fully-qualified short name
FOR %%i in ("%SCRIPT_PATH%") DO SET SCRIPT_PATH=%%~fsi

@REM determine the default Java Home location:
@REM 1) if "getProperty JAVA_HOME" provides a value, use it
@REM 2) else if JAVA_HOME_LOCATION is valid, use it
@REM 3) else use env variable JAVA_HOME
@REM Later, this default may be overridden by -javaLoc option

IF EXIST "%SCRIPT_PATH%\getProperty.cmd" (
  CALL %SCRIPT_PATH%\getProperty.cmd JAVA_HOME JRELOC
)

IF NOT EXIST "%JRELOC%" (
  SET JRELOC=%JAVA_HOME%
)

:PARSEARGS
@REM Expand arg1 and arg2 and remove any surrounding quotation marks
SET ARG1=%~1
SET ARG2=%~2

IF "%ARG1%" == "" (
	GOTO RUN
)

@REM Look for -javaLoc
IF /i "%ARG1%" == "-javaLoc" (
	SET JRELOC=%ARG2%
	SHIFT
	SHIFT
	GOTO PARSEARGS
)

SHIFT
GOTO PARSEARGS

:RUN
IF NOT EXIST "%JRELOC%" (
	ECHO ERROR: Cannot determine the Java Home
	ECHO ERROR: Specify proper value to the -javaLoc option or set JAVA_HOME environment variable
	GOTO DOEXIT
)


@REM change to OH/oui/bin
PUSHD %SCRIPT_PATH%

IF NOT EXIST "%JRELOC%\bin\java.exe" (
	ECHO ERROR: Java Home "%JRELOC%" does not contain bin\java.exe
	GOTO DOEXIT
)

IF EXIST ..\jlib\OraInstaller.jar (
	SET JAR=..\jlib\OraInstaller.jar
	SET OHOME=%SCRIPT_PATH%\..\..
) ELSE (
	ECHO ERROR: Cannot locate the OUI runtime.  Exiting
	GOTO DOEXIT
)

SET MAIN_CLASS=oracle.sysman.oui.property.SetProperty
@REM last -oracleHome option overrides any previous settings
"%JRELOC%\bin\java.exe" %JVM_ARGS% -classpath %JAR% %MAIN_CLASS% %ALLARGS% -oracleHome %OHOME%
SET RETURN_CODE=%ERRORLEVEL%

POPD

ENDLOCAL & SET RETURN_CODE=%RETURN_CODE%
EXIT /b %RETURN_CODE%


:DOEXIT
ENDLOCAL
EXIT /b 1

:USAGE

ECHO Usage: %0  [-javaLoc ^<Path to JDK/JRE Home Directory^>] -name ^<VARIABLE NAME^> -value ^<VARIABLE VALUE^> [ -logDir ^<Path to log directory^>]
ECHO Note: '-javaLoc' is used to specify the java to be used to run this utility. JVM options should be specified using the 'JVM_ARGS' environment variable

ENDLOCAL
EXIT /b 1
