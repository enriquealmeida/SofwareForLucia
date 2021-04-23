@ECHO OFF

SETLOCAL

@REM Get drive letter and directory path
SET SCRIPT_PATH=%~dp0

@REM Get fully-qualified short name
FOR %%i in ("%SCRIPT_PATH%") DO SET SCRIPT_PATH=%%~fsi

@REM Parse arguments
IF [%1] == [] (
	GOTO USAGE
) ELSE (
	SET VARIABLE_NAME=%1
)

IF /i "%VARIABLE_NAME%" == "-help" (GOTO USAGE)

IF NOT [%2] == [] (
  SET DEST_VAR=%2
) ELSE (
  SET DEST_VAR=%1
)

@REM Get properties file directory path
SET PROPERTIES_FILE=%SCRIPT_PATH%..\.globalEnv.properties

@REM search variable
FOR /F "tokens=1,2 delims== skip=2" %%A IN (%PROPERTIES_FILE%) DO (
	IF "%%A" == "%VARIABLE_NAME%" (
		SET PROPERTY_VALUE=%%B
		GOTO BREAK
	)
)

ECHO Unable to locate property "%VARIABLE_NAME%" in properties file %PROPERTIES_FILE%
ENDLOCAL
EXIT /b 0

:BREAK

@REM Removing special characters
SET PROPERTY_VALUE=%PROPERTY_VALUE:/=\%
SET PROPERTY_VALUE=%PROPERTY_VALUE:\\\\=\%
SET PROPERTY_VALUE=%PROPERTY_VALUE:\\=\%
SET PROPERTY_VALUE=%PROPERTY_VALUE:\:=:%

@REM Set variable
FOR /F "delims=" %%I IN ('ECHO "%DEST_VAR%=%PROPERTY_VALUE%"') DO (
	ENDLOCAL & SET %%I
)

ENDLOCAL
EXIT /b 0

:USAGE

ECHO Usage: %0  ^<VARIABLE_NAME^> [^<DEST_VARIABLE^>]
ECHO DEST_VARIABLE will be set to the value of VARIABLE_NAME if explicitly specified

ENDLOCAL
EXIT /b 1
