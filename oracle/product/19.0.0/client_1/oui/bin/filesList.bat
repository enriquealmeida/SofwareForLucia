@echo off

set OUIHOME=%~DP0\..
set OUICLASSPATH="%OUIHOME%\jlib\OraInstaller.jar;%OUIHOME%\jlib\filesList.jar;%OUIHOME%\jlib\xmlparserv2.jar"

if "%SRCHOME%"=="" set SRCHOME=%OUIHOME%\..

if "%JAVAHOME%"=="" set JAVAHOME=%SRCHOME%\jdk

"%JAVAHOME%\bin\java" -mx512M -Dosp.running.on=JAVA -Dosp.properties.file="%OUIHOME%\bin\filesList.properties" -DSRCHOME="%SRCHOME%" -classpath %OUICLASSPATH%   FilesTool.BuildToolsFilesTool  %*

if %ERRORLEVEL% EQU 0 goto end
echo "Cannot run application." >> "%OUIHOME%\..\log\osp.err"
echo "Java version used is" >> "%OUIHOME%\..\log\osp.err"
%JAVAHOME%\bin\java -version 2>> "%OUIHOME%\..\log\osp.err"
goto end

:end

set OUIHOME=
set OUICLASSPATH=
