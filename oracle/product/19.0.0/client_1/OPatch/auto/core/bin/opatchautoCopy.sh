#!/bin/sh

mypwd="`pwd`"

# Determine the location of this script...
# Note: this will not work if the script is sourced (. ./opatchauto.sh)
SCRIPTNAME=$0
case ${SCRIPTNAME} in
/*)  SCRIPTPATH=`dirname "${SCRIPTNAME}"` ;;
  *)  SCRIPTPATH=`dirname "${mypwd}/${SCRIPTNAME}"` ;;
esac

. "${SCRIPTPATH}/opatchautoEnv.sh"
RETURNCODE=$?
if [ "${RETURNCODE}" != "0" ]; then
  exit ${RETURNCODE}
fi

"${OPATCHAUTO_JAVA_HOME}/bin/java" ${OPATCHAUTO_JVM_ARGS} -cp "${OPATCHAUTO_CLASSPATH}" -DOPatchAuto.HOME="${ORACLE_HOME}" com.oracle.glcm.patch.auto.ClasspathCopier "$@"
