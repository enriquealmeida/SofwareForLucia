Rem
Rem $Header: sqlplus/admin/pupdel.sql /main/1 2017/03/15 23:24:42 msavanur Exp $
Rem
Rem pupdel.sql
Rem
Rem Copyright (c) 2017, Oracle and/or its affiliates. All rights reserved.
Rem
Rem    NAME
Rem      pupdel.sql
Rem
Rem    DESCRIPTION
Rem      This script creates a trigger to delete user record from table 
Rem      created from pupbld.sql when the user is dropped.
Rem
Rem    NOTES
Rem      Should be run as SYS to create this trigger.
Rem      This script should be run after pupbld.sql.
Rem
Rem    BEGIN SQL_FILE_METADATA
Rem    SQL_SOURCE_FILE: sqlplus/admin/pupdel.sql
Rem    SQL_SHIPPED_FILE:
Rem    SQL_PHASE:
Rem    SQL_STARTUP_MODE: NORMAL
Rem    SQL_IGNORABLE_ERRORS: NONE
Rem    SQL_CALLING_FILE:
Rem    END SQL_FILE_METADATA
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    msavanur    02/28/17 - Created
Rem

@@?/rdbms/admin/sqlsessstart.sql

-- Remove entry of user from PUP after user is dropped (25475334)
-- Need to connect as SYSDBA to create this Trigger
CREATE OR REPLACE TRIGGER DELETE_ENTRIES
AFTER DROP ON DATABASE
BEGIN
  IF (ORA_DICT_OBJ_TYPE = 'USER') THEN
    DELETE FROM SYSTEM.SQLPLUS_PRODUCT_PROFILE
    WHERE USERID = ORA_DICT_OBJ_NAME;
  END IF;

 EXCEPTION WHEN OTHERS THEN
  IF (SQLCODE = -4043) OR (SQLCODE = -1031) THEN
     NULL;
  ELSE
     RAISE;
  END IF;
END;
/

@?/rdbms/admin/sqlsessend.sql
