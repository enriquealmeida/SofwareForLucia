REM Copyright (c) 2003, 2018, Oracle and/or its affiliates. 
REM All rights reserved.
SET PATH=%PATH%;%PROD_HOME%\lib
"%ABSOLUTE_JRE_LOCATION%\bin\java" -classpath "%PROD_HOME%\jlib\OraInstaller.jar;%PROD_HOME%\jlib\OraInstallerNet.jar;%PROD_HOME%\jlib\xmlparserv2.jar;%PROD_HOME%\jlib\srvm.jar;%PROD_HOME%\jlib\emCfg.jar;%PROD_HOME%\jlib\share.jar;%PROD_HOME%\jlib\ojmisc.jar;%PROD_HOME%\jlib\xml.jar;%PROD_HOME%\jlib\OraCheckPoint.jar;%PROD_HOME%\jlib\OraPrereq.jar" oracle.sysman.oii.oiic.OiicRunConfig %PROD_HOME% %* 
exit /b %ERRORLEVEL%
