@echo off
REM ######################################################################
REM Copyright (c) 2014, 2024, Oracle and/or its affiliates. 
REM All rights reserved.
REM 
REM opatch     09/02/13   Creation
REM ######################################################################

@REM Check if this is really a FMW home - WebTier and some others create fake
@REM Middleware homes. If TRUE Middleware Home, we are guaranteed of the
@REM presence of registry.dat
@REM Note: A TRUE Middleware Home can be established ONLY by the WebLogic installer

set FMW_ERROR=0

@REM Check the Middleare home is FMW12C
if NOT EXIST %C_ORACLE_HOME%\inventory\registry.xml goto FMW12CEND
set MW_HOME=%C_ORACLE_HOME%
set SET_MW_HOME=%MW_HOME%
if NOT EXIST %C_ORACLE_HOME%\oracle_common\common\bin\setHomeDirs.cmd goto FMW12CEND
call "%C_ORACLE_HOME%\oracle_common\common\bin\setHomeDirs.cmd"
set MWH=%MW_HOME%
goto CHECKFMW6

:FMW12CEND
if NOT EXIST %C_MW_HOME%\registry.dat goto WLSDONE

@REM Invoking the setHomeDirs.sh script to set the WebLogic environment
@REM Set the MW_HOME env variable temporarily for the following scripts
set SET_MW_HOME=%MW_HOME%
set MW_HOME=%C_MW_HOME%

if NOT EXIST %C_ORACLE_HOME%\common\bin\setHomeDirs.cmd goto CHECKFMW6
call "%C_ORACLE_HOME%\common\bin\setHomeDirs.cmd"

:CHECKFMW6
if "%DEBUGVAL%" == "true" echo WL_HOME is set by setHomeDirs.cmd script to %WL_HOME%

if "%WL_HOME%" == "" goto CHECKFMW6A

if NOT EXIST %WL_HOME%\NUL goto CHECKFMW6A

if NOT EXIST %WL_HOME%\common\bin\commEnv.cmd goto CHECKFMW6B

call %WL_HOME%\common\bin\commEnv.cmd
set TEMP_ORACLE_HOME=%ORACLE_HOME%
set ORACLE_HOME=%C_ORACLE_HOME%
IF EXIST %C_ORACLE_HOME%\common\bin\setWlstEnv.cmd CALL %C_ORACLE_HOME%\common\bin\setWlstEnv.cmd
set CURRENT_HOME=%COMMON_COMPONENTS_HOME%
IF EXIST %COMMON_COMPONENTS_HOME%\common\bin\setWlstEnvExtns.cmd CALL %COMMON_COMPONENTS_HOME%\common\bin\setWlstEnvExtns.cmd
set CURRENT_HOME=
set ORACLE_HOME=%TEMP_ORACLE_HOME%
goto CHECKFMW7 

:CHECKFMW6A
set FMW_ERROR=-1
if "%DEBUGVAL%" == "true" (
   echo "OPatch was not able to set weblogic home. The Fusion Middleware home seems to be corrupted"
   echo OPatch will proceed only if JVM launcher found
)
goto CHECKFMW7

:CHECKFMW6B
set FMW_ERROR=-2
if "%DEBUGVAL%" == "true" (
   echo "Fusion Middleware Home maybe corrupted (Common Env Script missing or Not executable)"
   echo OPatch will proceed only if JVM launcher found
)
goto CHECKFMW7

:CHECKFMW7
set MW_HOME=%SET_MW_HOME%

if "%MWH%" == "" set MWH=%C_MW_HOME% 
if "%OH%" == "" set OH=%C_ORACLE_HOME%

@REM We will use the JDK used by WebLogic unless user knows better and wants to override
if NOT "%JDK%" == "" goto CHECKFMW8
if NOT "%JRE%" == "" goto CHECKFMW8

set JDK=%JAVA_HOME%

:CHECKFMW8
REM set JRE_MEMORY_OPTIONS=%MEM_ARGS% %JVM_D64%
set JAVA_VM_OPTION=

if "%JAVA_VENDOR%" == "Oracle" goto WLSDONE
if "%JAVA_VENDOR%" == "HP" goto WLSDONE
if "%JAVA_VENDOR%" == "Sun" goto WLSDONE

set JAVA_VM_OPTION=-client

:WLSDONE
