@echo off
set CUR_DIR=%~DP0%
cd c:\app\oracle\product\19.0.0\client_1\\oui\\bin
.\setup.exe -noconsole -detachhome ORACLE_HOME=c:\app\oracle\product\19.0.0\client_1 ORACLE_HOME_NAME=OraClient19Home1_32bit %*
.\setup.exe -noconsole -attachhome ORACLE_HOME=c:\app\oracle\product\19.0.0\client_1  ORACLE_HOME_NAME=OraClient19Home1_32bit %*
if NOT ERRORLEVEL 0  goto fail
goto success
:fail
echo 'AttachHome Failed'
goto end
:success
echo 'AttachHome Successful'
:end
echo "Please see Logs for further details"
cd %CUR_DIR%
