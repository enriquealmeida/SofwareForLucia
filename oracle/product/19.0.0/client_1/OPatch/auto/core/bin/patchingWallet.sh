#!/bin/sh
#
# Copyright (c) 2014, 2015, Oracle and/or its affiliates. All rights reserved.
mypwd="`pwd`"
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

"${OPATCHAUTO_JAVA_HOME}/bin/java" ${OPATCHAUTO_JVM_ARGS} -cp  "${OPATCHAUTO_CLASSPATH}" com.oracle.glcm.patch.wallet.WalletTool "$@" 
