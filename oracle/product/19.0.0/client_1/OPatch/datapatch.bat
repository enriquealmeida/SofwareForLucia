@ECHO off
REM datapatch.bat
REM
REM Copyright (c) 2012, 2016, Oracle and/or its affiliates. 
REM All rights reserved.
REM
REM    NAME
REM      datapatch - <one-line expansion of the name>
REM
REM    DESCRIPTION
REM      <short description of component this file declares/defines>
REM
REM    NOTES
REM      <other useful comments, qualifications, etc.>
REM
REM    MODIFIED   (MM/DD/YY)
REM    opatch    09/03/15 - : Update the copyright year
REM    opatch      07/13/12 - : Creation

REM Determine the location of this script
SET SCRIPTPATH=%~DP0

REM And call sqlpatch.bat accordingly
%SCRIPTPATH%\..\sqlpatch\sqlpatch.bat %*

