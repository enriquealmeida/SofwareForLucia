#!/bin/sh

######################################################################
# Copyright (c) 2004, 2015, Oracle and/or its affiliates. All rights reserved.
#
#  
######################################################################

CURRENT_PATH=`dirname $0`
HOME=$CURRENT_PATH/../../../..
$HOME/perl/bin/perl $CURRENT_PATH/OPatchAuto11.pl $@
exit $?
