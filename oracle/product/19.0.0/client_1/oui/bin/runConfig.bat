REM Copyright (c) 2003, 2018, Oracle and/or its affiliates. 
REM All rights reserved.
SET PATH=%PATH%;c:\app\oracle\product\19.0.0\client_1\oui\lib
"C:\app\oracle\product\19.0.0\client_1\jdk\jre\bin\java" -classpath "c:\app\oracle\product\19.0.0\client_1\oui\jlib\OraInstaller.jar;c:\app\oracle\product\19.0.0\client_1\oui\jlib\OraInstallerNet.jar;c:\app\oracle\product\19.0.0\client_1\oui\jlib\xmlparserv2.jar;c:\app\oracle\product\19.0.0\client_1\oui\jlib\srvm.jar;c:\app\oracle\product\19.0.0\client_1\oui\jlib\emCfg.jar;c:\app\oracle\product\19.0.0\client_1\oui\jlib\share.jar;c:\app\oracle\product\19.0.0\client_1\oui\jlib\ojmisc.jar;c:\app\oracle\product\19.0.0\client_1\oui\jlib\xml.jar;c:\app\oracle\product\19.0.0\client_1\oui\jlib\OraCheckPoint.jar;c:\app\oracle\product\19.0.0\client_1\oui\jlib\OraPrereq.jar" oracle.sysman.oii.oiic.OiicRunConfig c:\app\oracle\product\19.0.0\client_1\oui %* 
exit /b %ERRORLEVEL%
