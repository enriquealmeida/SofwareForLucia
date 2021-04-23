--
-- Copyright (c) 1988, 2017, Oracle and/or its affiliates. All rights reserved.
--
-- NAME
--   pupbld.sql
--
-- DESCRIPTION
--   Script to install the SQL*Plus PRODUCT_USER_PROFILE tables.  These
--   tables allow SQL*Plus to disable commands per user.  The tables
--   are used only by SQL*Plus and do not affect other client tools
--   that access the database.  Refer to the SQL*Plus manual for table
--   usage information.
--
--   This script should be run on every database that SQL*Plus connects
--   to, even if the tables are not used to restrict commands.

-- USAGE
--   sqlplus system/<system_password> @pupbld
--
--   Connect as SYSTEM before running this script
Rem
Rem BEGIN SQL_FILE_METADATA
Rem SQL_SOURCE_FILE: sqlplus/admin/pupbld.sql
Rem SQL_SHIPPED_FILE: sqlplus/admin/pupbld.sql
Rem SQL_PHASE: PUPBLD
Rem SQL_STARTUP_MODE: NORMAL
Rem SQL_IGNORABLE_ERRORS: NONE
Rem SQL_CALLING_FILE: NONE
Rem END SQL_FILE_METADATA
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem     msavanur   02/13/2017 - Remove user from PUP after drop user (25475334)
Rem     msavanur   02/02/2017 - Get information for CURRENT USER (25475326 )
Rem     msavanur   01/31/2017 - Replace SELECT with READ to public (25390622)
Rem     msavanur   12/09/2015 - update userid to 128 (22161199)
Rem     surman     01/09/2014 - 13922626: Update SQL metadata
Rem     lnim       03/13/2013 - set _ORACLE_SCRIPT (16473679)
Rem

@@?/rdbms/admin/sqlsessstart.sql

-- If PRODUCT_USER_PROFILE exists, use its values and drop it

DROP SYNONYM PRODUCT_USER_PROFILE;

BEGIN
  EXECUTE IMMEDIATE 'CREATE TABLE SQLPLUS_PRODUCT_PROFILE
(
  PRODUCT        VARCHAR2 (30) NOT NULL,
  USERID         VARCHAR2 (128),
  ATTRIBUTE      VARCHAR2 (240),
  SCOPE          VARCHAR2 (240),
  NUMERIC_VALUE  DECIMAL (15,2),
  CHAR_VALUE     VARCHAR2 (240),
  DATE_VALUE     DATE,
  LONG_VALUE     LONG
)';

  EXCEPTION WHEN OTHERS THEN
  IF (SQLCODE = -955) THEN
-- The USERID column needs to be upgraded to varchar2(128) since preexisting
-- databases would have the column at varchar2(30)
      EXECUTE IMMEDIATE 'ALTER TABLE SQLPLUS_PRODUCT_PROFILE MODIFY
                                         (USERID VARCHAR2 (128))';
  ELSE
     RAISE;
  END IF;
END;
/

-- Create the view PRODUCT_PRIVS and grant access to that
DROP VIEW PRODUCT_PRIVS;
CREATE VIEW PRODUCT_PRIVS AS
  SELECT PRODUCT, USERID, ATTRIBUTE, SCOPE,
         NUMERIC_VALUE, CHAR_VALUE, DATE_VALUE, LONG_VALUE
  FROM SQLPLUS_PRODUCT_PROFILE
  WHERE USERID = 'PUBLIC' OR 
        USERID LIKE SYS_CONTEXT('USERENV','CURRENT_USER');

-- REPLACE SELECT WITH READ TO PUBLIC ON PRODUCT_PRIVS IN UPGRADE (25390622)
GRANT READ ON PRODUCT_PRIVS TO PUBLIC;
DROP PUBLIC SYNONYM PRODUCT_PROFILE;
CREATE PUBLIC SYNONYM PRODUCT_PROFILE FOR SYSTEM.PRODUCT_PRIVS;
DROP SYNONYM PRODUCT_USER_PROFILE;
CREATE SYNONYM PRODUCT_USER_PROFILE FOR SYSTEM.SQLPLUS_PRODUCT_PROFILE;
DROP PUBLIC SYNONYM PRODUCT_USER_PROFILE;
CREATE PUBLIC SYNONYM PRODUCT_USER_PROFILE FOR SYSTEM.PRODUCT_PRIVS;

-- End of pupbld.sql

@?/rdbms/admin/sqlsessend.sql
