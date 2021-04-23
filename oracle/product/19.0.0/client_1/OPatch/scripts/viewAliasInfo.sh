#!/bin/sh


# Set classpath
mypwd="`pwd`"

# Determine the location of this script...
SCRIPTNAME=$0
case ${SCRIPTNAME} in
/*)  SCRIPTPATH=`dirname "${SCRIPTNAME}"` ;;
 *)  SCRIPTPATH=`dirname "${mypwd}/${SCRIPTNAME}"` ;;
esac

# Set JAXB_version
JAXB_VERSION="2.3.0"

MODULES_DIR=`cd ${SCRIPTPATH}/../modules ; pwd`
OPATCH_COMMON_API_CLASSPATH="${MODULES_DIR}/features/oracle.glcm.opatch.common.api.classpath.jar:${MODULES_DIR}/internal/features/lib_jaxb_${JAXB_VERSION}.jar"

# Set java command
ORACLE_HOME="${SCRIPTPATH}/../../"
JAVA_HOME=
JAVA_HOME=`$ORACLE_HOME/oui/bin/getProperty.sh JAVA_HOME`
JAVA=${JAVA_HOME}/bin/java

# Run the utility to check config patch inventory
$JAVA -cp $OPATCH_COMMON_API_CLASSPATH -DORACLE_HOME=$ORACLE_HOME oracle.glcm.opatch.common.utils.ViewAliasInfo "$@"
