--
-- Copyright (c) 1998, 2013, Oracle and/or its affiliates. 
-- All rights reserved. 
--
-- NAME
--   helpdrop.sql
--
-- DESCRIPTION
--   Drops the SQL*Plus HELP table
--
-- USAGE
--   Connect as SYSTEM to run this script e.g.
--       sqlplus system/<system_password> @helpdrop.sql

alter session set "_ORACLE_SCRIPT"=true;
SET TERMOUT OFF

DROP TABLE SYSTEM.HELP;
DROP VIEW SYSTEM.HELP_TEMP_VIEW;

alter session set "_ORACLE_SCRIPT"=false;
EXIT
