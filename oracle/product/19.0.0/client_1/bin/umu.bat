Rem    risgupta    03/26/18 - Bug 27637921 - Update classpath to support SEPS
Rem    risgupta    09/28/17 - Bug 26734447 - Remove hardcoded reference

@echo off
SET OJDBC=ojdbc8.jar

"c:\app\oracle\product\19.0.0\client_1\jdk\jre\\bin\java" -DORACLE_HOME="c:\app\oracle\product\19.0.0\client_1" -classpath "c:\app\oracle\product\19.0.0\client_1\jdk\jre\\lib\rt.jar;c:\app\oracle\product\19.0.0\client_1\jdk\jre\\lib\i18n.jar;c:\app\oracle\product\19.0.0\client_1\jdk\jre\\lib\jsse.jar;c:\app\oracle\product\19.0.0\client_1\jdbc\lib\%OJDBC%;c:\app\oracle\product\19.0.0\client_1\jlib\verifier8.jar;c:\app\oracle\product\19.0.0\client_1\jlib\jssl-1_1.jar;c:\app\oracle\product\19.0.0\client_1\jlib\ldapjclnt19.jar;c:\app\oracle\product\19.0.0\client_1\jlib\oraclepki.jar;c:\app\oracle\product\19.0.0\client_1\jlib\osdt_core.jar;c:\app\oracle\product\19.0.0\client_1\rdbms\jlib\usermigrate-1_0.jar;c:\app\oracle\product\19.0.0\client_1\jlib\osdt_cert.jar" oracle.security.rdbms.server.UserMigrate.umu.UserMigrate %*


