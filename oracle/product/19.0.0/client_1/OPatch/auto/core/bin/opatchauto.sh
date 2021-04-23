#!/bin/sh 

######################################################################
# Copyright (c) 2004, 2015, Oracle and/or its affiliates. All rights reserved.
#
#  
#  shkatti   12/09/15  Bug Fix #22328273   - OPATCHAUTO COMMANDS RETURNING OPATCH/AUTO/DATABASE/BIN/OPATCHAUTODBSCR.S ERRORS    
######################################################################
PWD=`pwd`
SCRIPTNAME=$0
case ${SCRIPTNAME} in
    /*) SCRIPTPATH=`dirname ${SCRIPTNAME}`;;
    *) SCRIPTPATH=`dirname ${PWD}/${SCRIPTNAME}`;;
esac
PERLLIBPATH=$SCRIPTPATH/../../dbsessioninfo/perllibpath.txt

if [  -f $PERLLIBPATH ]; then
        HOME=`cat $PERLLIBPATH`
else
	HOME=$SCRIPTPATH/../../../../
fi
# If it is a binary session, redirect to opatchautobinary
for arg in "$@"; do
    if [ "$arg" = "-binary" ]; then
        $HOME/perl/bin/perl $SCRIPTPATH/../../database/bin/OPatchAutoBinary.pl $@
        RESULT=$?
		if [ $RESULT = 0 ]; then
            $HOME/perl/bin/perl $BASE/auto/database/bin/CleanUp.pl "$@"
		fi
		exit $RESULT
    fi
done

# If it is a RHP session, redirect to opatchautoRHP
for arg in "$@"; do
    if [ "$arg" = "-rhp" ]; then
        $HOME/perl/bin/perl $SCRIPTPATH/../../database/bin/OPatchAutoRHP.pl $@
        exit $?
    fi
done

$HOME/perl/bin/perl $SCRIPTPATH/../../database/bin/OPatchAutoDB.pl $@
RESULT=$?
if [ $RESULT = 0 ]; then
	$HOME/perl/bin/perl $BASE/auto/database/bin/CleanUp.pl "$@"
fi
exit $RESULT
