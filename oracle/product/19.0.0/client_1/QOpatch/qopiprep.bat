@echo off 
cd %ORACLE_HOME%
set PATH=%PATH%;C:\WINDOWS\system32;C:\WINDOWS;C:\PERL\BIN;

REM Option: "-retry 0" avoids retries in case of locked inventory.

REM Option: "-invPtrLoc" is required for non-central-inventory
REM locations. $OPATCH_PREP_LSINV_OPTS which may set by users
REM in the environment to configure special OPatch options
REM ("-jdk" is another good candidate that may require configuration!).

REM Option: "-all" gives information on all Oracle Homes
REM installed in the central inventory.  With that information, the
REM patches of non-RDBMS homes could be fetched.

set "randnum=%random%"

FOR /F  %%i IN ('%ORACLE_HOME%\bin\orabasehome.exe') do set logloc=%%i\rdbms\log
%ORACLE_HOME%\OPatch\opatch lsinventory -customLogDir %LOGLOC% -xml %LOGLOC%\xml_file_%ORACLE_SID%_%randnum%.xml -retry 0 >> %LOGLOC%\stout_%ORACLE_SID%_%randnum%.txt & echo UIJSVTBOEIZBEFFQBL >> %LOGLOC%\xml_file_%ORACLE_SID%_%randnum%.xml & type %LOGLOC%\xml_file_%ORACLE_SID%_%randnum%.xml & del %LOGLOC%\xml_file_%ORACLE_SID%_%randnum%.xml & del %LOGLOC%\stout_%ORACLE_SID%_%randnum%.txt
