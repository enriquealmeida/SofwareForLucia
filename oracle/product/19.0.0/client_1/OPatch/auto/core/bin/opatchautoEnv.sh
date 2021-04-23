#!/bin/sh

mypwd="`pwd`"

# Determine the location of this script...
# Note: this will not work if the script is sourced (. ./opatchauto.sh)
SCRIPTNAME=$0
case ${SCRIPTNAME} in
/*)  SCRIPTPATH=`dirname "${SCRIPTNAME}"` ;;
  *)  SCRIPTPATH=`dirname "${mypwd}/${SCRIPTNAME}"` ;;
esac

PLATFORMNAME=`uname`;
if [ "$PLATFORMNAME" = "AIX" ] ; then
   OBJECT_MODE="32_64"
   export OBJECT_MODE
fi


ORACLE_HOME=`cd "${SCRIPTPATH}/../../../.." ; pwd`

if [ "${OPATCHAUTO_JAVA_HOME}" = "" ] ; then 
  if [ -f "${ORACLE_HOME}/oui/bin/getVariable.sh" ] ; then
    OPATCHAUTO_JAVA_HOME=`"${ORACLE_HOME}/oui/bin/getVariable.sh" JAVA_HOME`
  fi
fi

if [ "${OPATCHAUTO_JAVA_HOME}" != "" ] ; then 
  if [ ! -d "${OPATCHAUTO_JAVA_HOME}" ] ; then
    echo "The JAVA_HOME '${OPATCHAUTO_JAVA_HOME}' did not exist."
    OPATCHAUTO_JAVA_HOME=""
  fi
fi

if [ "${OPATCHAUTO_JAVA_HOME}" = "" ] ; then 
  if [ -d "${ORACLE_HOME}/OPatch/jre" ] ; then
   OPATCHAUTO_JAVA_HOME="${ORACLE_HOME}/OPatch/jre"
  elif [ -f "${ORACLE_HOME}/jdk/bin/java" ] ; then
    OPATCHAUTO_JAVA_HOME="${ORACLE_HOME}/jdk"
  else
    OPATCHAUTO_JAVA_HOME="${JAVA_HOME}"
  fi
fi

if [ "${OPATCHAUTO_JAVA_HOME}" = "" ] ; then 
  echo "Unable to determine JAVA_HOME for opatchauto. Please set JAVA_HOME in your environment."
  return 1
fi

if [ "${OPATCHAUTO_JVM_D64}" = "" ] ; then 
  case `uname -s` in
  HP-UX)
    if [ -f "${ORACLE_HOME}/oui/bin/getVariable.sh" ] ; then
      OPATCHAUTO_JVM_D64=`"${ORACLE_HOME}/oui/bin/getVariable.sh" JVM_64`
    fi
    
    if [ "${OPATCHAUTO_JVM_D64}" = "" ] ; then 
      arch=`uname -m`
      if [ "${arch}" = "ia64" ] && [ -d "${OPATCHAUTO_JAVA_HOME}/jre/lib/IA64N" ]; then
         OPATCHAUTO_JVM_D64="-d64"
      fi
    fi
  ;;
  SunOS)
    if [ -f "${ORACLE_HOME}/oui/bin/getVariable.sh" ] ; then
      OPATCHAUTO_JVM_D64=`"${ORACLE_HOME}/oui/bin/getVariable.sh" JVM_64`
    fi

    if [ "${OPATCHAUTO_JVM_D64}" = "" ] ; then 
      arch=`uname -m`
      if [ "${arch}" = "i86pc" ] && [ -d "${OPATCHAUTO_JAVA_HOME}/jre/lib/amd64" ]; then
        OPATCHAUTO_JVM_D64="-d64"
      elif [ "${arch}" = "sparcv9" ] && [ -d "${OPATCHAUTO_JAVA_HOME}/jre/lib/sparcv9" ]; then
        OPATCHAUTO_JVM_D64="-d64"
      fi
    fi
  ;;
  *)
    OPATCHAUTO_JVM_D64=""
  esac
fi

if [ ! "${OPATCHAUTO_JVM_D64}" = "" ] ; then 
  if [ "${OPATCHAUTO_JVM_ARGS}" = "" ] ; then 
    OPATCHAUTO_JVM_ARGS="${OPATCHAUTO_JVM_D64}"
  else
    OPATCHAUTO_JVM_ARGS="${OPATCHAUTO_JVM_D64} ${OPATCHAUTO_JVM_ARGS}"
  fi
fi

OPATCHAUTO_JAVA_HOME=`cd "${OPATCHAUTO_JAVA_HOME}" ; pwd`
OPATCHAUTO_MODULES_DIR=`cd "${SCRIPTPATH}/../modules" ; pwd`
OPATCH_COMMON_API_MODULES_DIR="${ORACLE_HOME}/OPatch/modules"
OPATCHAUTO_CORE_DIR="${ORACLE_HOME}/OPatch/auto/core"
OUI_MODULES_DIR="${ORACLE_HOME}/oui/modules"
OPATCH_MODULES_DIR="${ORACLE_HOME}/OPatch/jlib"
ORACLE_COMMON_MODULES_DIR="${ORACLE_HOME}/oracle_common/modules"
OPATCH_MODULES_LEGACY_DIR="${ORACLE_HOME}/OPatch/modules"

OPATCH_AUTO_WALLET_NON_NG_CLASSPATH="${OPATCH_MODULES_LEGACY_DIR}/features/orapki.lib.jar:${OPATCHAUTO_CORE_DIR}/modules/legacyoui/legacyoui.classpath.jar:${OPATCH_COMMON_API_MODULES_DIR}/features/oracle.glcm.opatchauto.core.wallet.classpath.jar"

OPATCH_AUTO_WALLET_NG_CLASSPATH="${ORACLE_COMMON_MODULES_DIR}/features/orapki.lib.jar:${ORACLE_COMMON_MODULES_DIR}/features/orapki.lib_12.1.3.jar:${ORACLE_COMMON_MODULES_DIR}/features/glcm_encryption_lib.jar:${OPATCH_COMMON_API_MODULES_DIR}/features/oracle.glcm.opatchauto.core.wallet.classpath.jar"

if [ -d "${ORACLE_HOME}/oracle_common" ] ; then
 OPATCH_AUTO_WALLET_CLASSPATH="${OPATCH_AUTO_WALLET_NG_CLASSPATH}"
else
 OPATCH_AUTO_WALLET_CLASSPATH="${OPATCH_AUTO_WALLET_NON_NG_CLASSPATH}"
fi

OPATCHAUTO_CLASSPATH="${OPATCHAUTO_MODULES_DIR}/features/oracle.glcm.opatchauto.core.classpath.jar:${OPATCH_COMMON_API_MODULES_DIR}/features/oracle.glcm.opatch.common.api.classpath.jar:${OPATCHAUTO_MODULES_DIR}/features/oracle.glcm.opatchauto.core.binary.classpath.jar:${OUI_MODULES_DIR}/installer-launch.jar:${OPATCH_AUTO_WALLET_CLASSPATH}:${OPATCH_MODULES_DIR}/oracle.opatch.classpath.jar"

export ORACLE_HOME OPATCHAUTO_JAVA_HOME OPATCHAUTO_MODULES_DIR OPATCH_COMMON_API_MODULES_DIR OUI_MODULES_DIR OPATCH_MODULES_DIR ORACLE_COMMON_MODULES_DIR OPATCHAUTO_CLASSPATH OPATCHAUTO_JVM_D64 OPATCHAUTO_JVM_ARGS
