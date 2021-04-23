#!/bin/sh 
BASE=`dirname $0`
arguments=$@
PASSWORD=
USER_LIST=
PERL_PATH=
for i in ${arguments}; do
    if [[ "$i" = -PASSWORD=*  ]]; then
           PASSWORD=`echo $i | sed 's/.[^=]*=//'`
	elif [[ "$i" = -USER_LIST=*  ]]; then
           USER_LIST=`echo $i | sed 's/.[^=]*=//'`
    elif [[ "$i" = -PERL_PATH=*  ]]; then
		   PERL_PATH=`echo $i | sed 's/.[^=]*=//'`
	fi
done
WHICH_SUDO=`$PERL_PATH/perl/bin/perl $BASE/ExportPath.pl`

args=`echo $USER_LIST | sed 's/,/ /g'`

for i in ${args}; do
	`$WHICH_SUDO -k`
	WHOAMI=`echo $PASSWORD | $WHICH_SUDO -S -u $i pwd &> /dev/null`
	RESULT=$?
	if [ $RESULT != 0 ]; then
        	echo "sudo permission for $i is not available for user on `hostname`"
	        exit 2;
	fi
done
