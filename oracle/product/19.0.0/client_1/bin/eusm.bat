@ echo off
Rem Copyright (c) 2006, 2017, Oracle and/or its affiliates. 
Rem All rights reserved.
Rem
Rem    NAME
Rem      eusm - Batch script to run Enterprise User Security admin tool
Rem
Rem    DESCRIPTION
Rem      Runs the enterprise user security admin tool
Rem
Rem    REVISION HISTORY
Rem    MODIFIED   (MM/DD/YY)
Rem    srvakkal    10/27/17 - Correction of classpath
Rem    risgupta    09/28/17 - Bug 26734445 - Remove hardcoded reference
Rem    risgupta    08/07/17 - Bug 26539671 - Add classpath to support PKCS12 wallet

Rem External Directory Variables set by the Installer
SET OJDBC=ojdbc8.jar
SET RDBMSVER=19

"c:\app\oracle\product\19.0.0\client_1\jdk\jre\\bin\java" -classpath c:\app\oracle\product\19.0.0\client_1\jlib\oraclepki.jar;c:\app\oracle\product\19.0.0\client_1\jlib\osdt_cert.jar;c:\app\oracle\product\19.0.0\client_1\jlib\osdt_core.jar;"c:\app\oracle\product\19.0.0\client_1\jdk\jre\\lib\rt.jar;c:\app\oracle\product\19.0.0\client_1\jdbc\lib\%OJDBC%;c:\app\oracle\product\19.0.0\client_1\rdbms\jlib\eusm.jar;c:\app\oracle\product\19.0.0\client_1\jlib\ldapjclnt%RDBMSVER%.jar" oracle.security.eus.util.ESMdriver %*


