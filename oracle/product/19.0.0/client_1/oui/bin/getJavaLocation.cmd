@ECHO OFF
SET SCRIPT_PATH=%~dp0

IF NOT "%GLCM_HOME%" == "" (

	for /f "delims=" %%i in ('"%GLCM_HOME%"\bin\getProperty.cmd RUNTIME_JAVA_HOME') do (
			SET JAVA_HOME_VAL=%%i									
			
	)	
) 

IF "%JAVA_HOME_VAL%" == "" (	
	
	for /f "delims=" %%i in ('"%SCRIPT_PATH%"\getProperty.cmd JAVA_HOME') do (			
			SET JAVA_HOME_VAL=%%i			
			
	)
	
)

IF "%JAVA_HOME_VAL%" == "" (	
	SET JAVA_HOME_VAL=%SCRIPT_PATH%\\..\\..\\jdk
)

ECHO %JAVA_HOME_VAL%

EXIT /b 0
