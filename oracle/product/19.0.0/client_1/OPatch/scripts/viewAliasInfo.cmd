@ECHO OFF
SETLOCAL

:: Help detect
SET ALLARGS=%*

:: Set JAXB_VERSION
SET JAXB_VERSION=2.3.0

:: Set classpath
SET SCRIPTPATH=%~dp0
FOR %%i IN ("%SCRIPTPATH%\..\modules") DO SET MODULES_DIR=%%~fsi
SET OPATCH_COMMON_API_CLASSPATH=%MODULES_DIR%\features\oracle.glcm.opatch.common.api.classpath.jar;%MODULES_DIR%\internal\features\lib_jaxb_%JAXB_VERSION%.jar

:: Set java command
SET ORACLE_HOME=%SCRIPTPATH%\..\..\
SET JAVA_HOME=
CALL %ORACLE_HOME%\oui\bin\getProperty.cmd JAVA_HOME JAVA_HOME 
SET JAVA=%JAVA_HOME%\bin\java.exe

:: Run ViewAliasInfo utility
%JAVA% -cp %OPATCH_COMMON_API_CLASSPATH% -DORACLE_HOME=%ORACLE_HOME% oracle.glcm.opatch.common.utils.ViewAliasInfo %ALLARGS%
SET RETURN_CODE=%ERRORLEVEL%
