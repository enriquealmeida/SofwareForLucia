#!/bin/bash

# Copyright (c) 2010, 2014, Oracle and/or its affiliates. All rights reserved.

################################################################################

BASE="$(dirname "$0")"
FILE="$(basename "$0")"
OPLAN_PATH=$BASE/$FILE
if [ `uname` == "SunOS" ]; 
then 
  USER_ID=`/usr/xpg4/bin/id -un`
else
  USER_ID=`id -un`
fi
if  [ -n "${ORACLE_HOME:+x}" ];
then
  JAVA=$ORACLE_HOME/OPatch/jre/bin/java
  if [ ! -e "$JAVA" ];
  then
      JAVA=$ORACLE_HOME/jdk/bin/java
  fi
else
  echo "Please set the ORACLE_HOME environment variable to the location of the Grid Infrastructure (GI) Home"
  exit 2
fi

# Setup all OUI jars and JRE options
set_oui_env_vars() {
    CP="$ORACLE_HOME/oui/jlib"
    
    OUI_JARS="$CP/OraInstaller.jar:$CP/OraPrereq.jar:$CP/share.jar:$CP/orai18n-mapping.jar:$CP/xmlparserv2.jar"
    CLASS_PATH="$CLASS_PATH:$OUI_JARS"
    export CLASS_PATH
    
    # JRE_MEMORY_OPTIONS
    if [ -z "${JRE_MEMORY_OPTIONS}" ]; then
       JRE_MEMORY_OPTIONS=""
       # stuff like "-d64" and memory size options are present in this file specific to platform
       if [ -r $ORACLE_HOME/oui/oraparam.ini ]; then
          JRE_MEMORY_OPTIONS=`grep "JRE_MEMORY_OPTIONS=" $ORACLE_HOME/oui/oraparam.ini | sed 's/JRE_MEMORY_OPTIONS=\"//' | sed 's/\"//'`
          JRE_MEMORY_OPTIONS=`echo $JRE_MEMORY_OPTIONS | sed 's/\"//g'`
          export JRE_MEMORY_OPTIONS
       fi
    fi
    
}

set_opatch_env_vars() {

    CP="$ORACLE_HOME/OPatch/jlib"
    OPATCH_JARS="$CP/oracle.opatch.classpath.jar"
    if [ ! -e "$OPATCH_JARS" ];
    then
        CP="$ORACLE_HOME/../opatch/OPatch/jlib"
        OPATCH_JARS="$CP/oracle.opatch.classpath.jar"
    fi
		
    CLASS_PATH="$CLASS_PATH:$OPATCH_JARS"
    export CLASS_PATH
}

# Setup all SRVM jars and the LD_LIBRARY_PATH for successful usage.
set_srvm_env_vars() {

    # SRVM API jars
    SP="$ORACLE_HOME/jlib"
    SRVM_CLASS_PATH="$SP/srvm.jar:$SP/srvmasm.jar:$SP/srvmhas.jar:$SP/netcfg.jar"
    CLASS_PATH="$CLASS_PATH:$SRVM_CLASS_PATH"
    export CLASS_PATH

    # Below was copied from srvctl command and modified

    # Set the shared library path for JNI shared libraries
    # A few platforms use an environment variable other than LD_LIBRARY_PATH
    PLATFORM=`uname`
    
    case $PLATFORM in
    HP-UX)
       LD_LIBRARY_PATH=$ORACLE_HOME/lib:$ORACLE_HOME/srvm/lib
       export LD_LIBRARY_PATH
       SHLIB_PATH=
       export SHLIB_PATH
       ;;
    AIX)
       LIBPATH=$ORACLE_HOME/lib:$ORACLE_HOME/srvm/lib:$LIBPATH
       export LIBPATH
       ;;
    Linux)
       LD_LIBRARY_PATH=$ORACLE_HOME/lib:$ORACLE_HOME/srvm/lib:$LD_LIBRARY_PATH
       # Linux ( ppc64 || s390x ) => LD_LIBRARY_PATH lib32
       ARCH=`uname -m`;
       if [ "$ARCH" = "ppc64" -o "$ARCH" = "s390x" ]
       then
         LD_LIBRARY_PATH=$ORACLE_HOME/lib32:$ORACLE_HOME/srvm/lib32:$LD_LIBRARY_PATH
       fi
       export LD_LIBRARY_PATH
       ;;
    SunOS)
        LD_LIBRARY_PATH_64=$ORACLE_HOME/lib:$ORACLE_HOME/srvm/lib:$LD_LIBRARY_PATH_64
        export LD_LIBRARY_PATH_64
        LD_LIBRARY_PATH=$ORACLE_HOME/lib:$ORACLE_HOME/srvm/lib:$LD_LIBRARY_PATH
        export LD_LIBRARY_PATH
        ;;
    OSF1) LD_LIBRARY_PATH=$ORACLE_HOME/lib:$ORACLE_HOME/srvm/lib:$LD_LIBRARY_PATH
          export LD_LIBRARY_PATH
          ;;
    Darwin)
          DYLD_LIBRARY_PATH=$ORACLE_HOME/lib:$ORACLE_HOME/srvm/lib:$DYLD_LIBRARY_PATH
          export DYLD_LIBRARY_PATH
          ;;
    *)    if [ -d $ORACLE_HOME/lib32 ];
          then
            LD_LIBRARY_PATH=$ORACLE_HOME/lib32:$ORACLE_HOME/srvm/lib32:$LD_LIBRARY_PATH
          else
            LD_LIBRARY_PATH=$ORACLE_HOME/lib:$ORACLE_HOME/srvm/lib:$LD_LIBRARY_PATH
          fi
          export LD_LIBRARY_PATH
          ;;
    esac
}


OPLAN_JARS="$BASE/../../core/modules/features/oracle.glcm.oplan.core.classpath.jar:$BASE/../../core/modules/features/oracle.glcm.osys.core.classpath.jar:$BASE/../../database/modules/oplan_db.jar"

echo "from oplan $OPLAN_JARS"


set_srvm_env_vars
set_oui_env_vars
set_opatch_env_vars

CMD="$JAVA ${JRE_OPTIONS} ${JRE_MEMORY_OPTIONS} -cp ${OPLAN_JARS}:${CLASS_PATH} oracle.oplan.sdk.oplan.OPlan -XOPlanLocation=$OPLAN_PATH -XUserInvokingOplan=$USER_ID -XIntgFactoryClass=oracle.oplan.db.intg.DBOPlanIntgFactory $@" 


#echo $CMD
#echo $LD_LIBRARY_PATH

$CMD



