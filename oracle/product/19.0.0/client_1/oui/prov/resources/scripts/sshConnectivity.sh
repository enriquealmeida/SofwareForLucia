#!/bin/sh
#
# $Header: oui/prov/fixup/sshConnectivity.sh /main/6 2009/03/31 22:24:24 radhinar Exp $
#
# sshConnectivity.sh
#
# Copyright (c) 2005, 2009, Oracle and/or its affiliates. All rights reserved. 
#
#    NAME
#      sshConnectivity.sh - <one-line expansion of the name>
#
#    DESCRIPTION
#      <short description of component this file declares/defines>
#
#    NOTES
#      <other useful comments, qualifications, etc.>
#
#    MODIFIED   (MM/DD/YY)
#    ipall       06/02/06 - classpath for JARS required for obfuscated password
#    jgangwar    03/09/06 - support for windows oms
#    jgangwar    03/09/06 - support for windows oms
#    jgangwar    12/12/05 - Creation
#


ADVANCED=false
HOSTNAME=`hostname`
SHARED=false
#USR = remote user
USR=$USER
VERIFY=false
EXHAUSTIVE_VERIFY=false
HELP=false
PASSPHRASE=no
CONFIRM=no
PLAT_GRP=unix
DETAILED_HELP=false
SILENT_MODE=false
ARGS=$*
#echo $ARGS
numargs=$#
i=1
while [ $i -le $numargs ]
do
  j=$1 
  if [ $j = "-homeDir" ] 
  then
     HOMEDIR=$2
     echo $HOMEDIR
     shift 1
     i=`expr $i + 1`
     if  test -d "$HOMEDIR"
     then
	 echo "homeDir exits"
     else
	 echo "-homeDir directory doesnt exist."
		echo "Please specify the directory where the keys would be generated for the local user, i.e. /home/current_user"
		echo "The value of /home can be found from the registry key." 
		echo "HKEY_LOCAL_MACHINE\\Software\\Cygnus Solutions\\Cygwin\\mounts v2\\/home"
		exit 1
	fi
     ARGS="$ARGS -homeDir $HOMEDIR"
  elif [ $j = "-obPasswordfile" ]
  then
     OBPASSWORD_FILE=$2
     shift 1
     i=`expr $i + 1`
      if test -f "$OBPASSWORD_FILE"
      then
	  echo "Obfuscated password present"
      else
        echo "Please providethe obfuscated password in a file, with an entry obfuscated_password=<obfuscated password>"
	exit 1
      fi
      ARGS="$ARGS -obPasswordfile $OBPASSWORD_FILE"
  elif [ $j = "-hosts" ] 
  then
     HOSTS=$2
     shift 1
     i=`expr $i + 1`
  elif [ $j = "-user" ] 
  then
     USR=$2
     ARGS="$ARGS -user $USR"
     shift 1
     i=`expr $i + 1`
  elif [ $j = "-logfile" ]
  then
     LOG_FILE=$2
     shift 1
     i=`expr $i + 1`
  elif [ $j = "-detail" ]
  then
     DETAILED_HELP=true
  elif [ $j = "-silent" ]
  then
     SILENT_MODE=true
  elif [ $j = "-hostfile" ]
  then
     CLUSTER_CONFIGURATION_FILE=$2
     shift 1
     i=`expr $i + 1`
  elif [ $j = "-confirm" ] 
  then
     CONFIRM=yes
  elif [ $j = "-usePassphrase" ]
  then
     PASSPHRASE=yes
     ARGS="$ARGS -usePassphrase"
  elif [ $j = "-shared" ]
  then
     SHARED=true
     ARGS="$ARGS -shared"
  elif [ $j = "-exverify" ]
  then
     EXHAUSTIVE_VERIFY=true
  elif [ $j = "-verify" ]
  then
     VERIFY=true
  elif [ $j = "-advanced" ]
  then
     ADVANCED=true
     ARGS="$ARGS -advanced"
  elif [ $j = "-localPlatformGrp" ]
  then
     PLAT_GRP=$2
     shift 1
     i=`expr $i + 1`
  elif [ $j = "-help" ] 
  then
     HELP=true
  else
      VAR=`echo $j | cut -d '=' -f 1`
      if [ $VAR = "ORACLE_HOME" ] 
      then
          ORACLE_HOME=`echo $j | cut -d '=' -f 2`
      elif [ $VAR = "OUI_LOC" ] 
      then
          OUI_LOC=`echo $j | cut -d '=' -f 2`
      elif [ $VAR = "SSH_LOC" ] 
      then
          SSH_LOC=`echo $j | cut -d '=' -f 2`          
      elif [ $VAR = "JAVAHOME" ] 
      then
          JAVAHOME=`echo $j | cut -d '=' -f 2`
      fi
  fi
  
  i=`expr $i + 1`
  shift 1
done

PATH_SEP="/"
if [ $PLAT_GRP = "win" ]
then
   PATH_SEP="\\"
   echo
   echo "All paths should be windows style full path."
   echo
fi

ERROR=false
if [ "$ORACLE_HOME" = "" ]; then
    echo ORACLE_HOME variable is not set.
    if [ "$SSH_LOC" = "" ]; then
        echo Set the SSH_LOC variable before invoking the script. Point it to the directory which contains ssh and remoteinterfaces jars.
        ERROR=true
    fi
    
    if [ "$OUI_LOC" = "" ]; then
        echo Set the OUI_LOC variable to OUI home before invoking the script.
        ERROR=true
    fi
    if [ "$ERROR" = "true" ]; then
        echo You may set the ORACLE_HOME variable for the default values of SSH_LOC and OUI_LOC.
        exit
    fi
else
    if [ "$SSH_LOC" = "" ]; then
        SSH_LOC="$ORACLE_HOME$PATH_SEP""sysman"$PATH_SEP"prov"$PATH_SEP"agentpush"$PATH_SEP"jlib"
    fi
#    echo Using ssh jars from $SSH_LOC

    if [ "$OUI_LOC" = "" ]; then
        OUI_LOC=$ORACLE_HOME$PATH_SEP"oui"
        JAR_LOC=$ORACLE_HOME$PATH_SEP"oui"$PATH_SEP"jlib"
    fi
#    echo Setting OUI_LOC to $OUI_LOC
#    echo Using jars from $JAR_LOC
fi

if [ "$PROP_LOC" = "" ]; then
        PROP_LOC="$ORACLE_HOME$PATH_SEP""sysman"$PATH_SEP"prov"$PATH_SEP"resources"
fi

if [ "$JAR_LOC" = "" ]; then
    JAR_LOC=$OUI_LOC$PATH_SEP"jlib"
fi

echo -e  "\033[1mThis script will setup SSH Equivalence from the host '`hostname`' to specified remote hosts. \033[0m"

if [ ! -z "$HOSTS" ];
then
echo
echo The following envrionment would be used
echo ORACLE_HOME = $ORACLE_HOME
echo JAR_LOC = $JAR_LOC
echo SSH_LOC = $SSH_LOC
echo OUI_LOC = $OUI_LOC
echo PROP_LOC = $PROP_LOC
fi
#echo JAVAHOME = $JAVAHOME

if [ "$JAVAHOME" = "" ]; then
    JAVAHOME=$ORACLE_HOME$PATH_SEP"jdk"
fi
JAVA_EXE=$JAVAHOME$PATH_SEP"bin"$PATH_SEP"java"
if [ -f "$JAVA_EXE" ]; then
if [ ! -z "$HOSTS" ];
then
    echo JAVAHOME =  $JAVAHOME
fi
else
    echo Set JAVAHOME variable to jdk1.4.2 before invoking the script
    exit
fi

if [ $PLAT_GRP = "win" ]
then
    CMD="$JAVAHOME\\bin\\java -cp \".;$SSH_LOC\\ssh.jar;$SSH_LOC\\jsch.jar;$SSH_LOC\\remoteinterfaces.jar;$JAR_LOC\\OraInstaller.jar;$JAR_LOC\\OraInstallerNet.jar;$JAR_LOC\\xmlparserv2.jar;$JAR_LOC\\emCfg.jar;$JAR_LOC\\ojmisc.jar\" -Doracle.installer.oui_loc=$OUI_LOC -Doracle.sysman.prov.PathsPropertiesLoc=$PROP_LOC oracle.sysman.prov.ssh.SSHConnectivity"
    PLATFORM="Windows"
else
    CMD="$JAVAHOME/bin/java -cp .:$SSH_LOC/ssh.jar:$SSH_LOC/jsch.jar:$SSH_LOC/remoteinterfaces.jar:$JAR_LOC/OraInstaller.jar:$JAR_LOC/OraInstallerNet.jar:$JAR_LOC/xmlparserv2.jar:$JAR_LOC/emCfg.jar:$JAR_LOC/ojmisc.jar -Doracle.installer.oui_loc=$OUI_LOC -Doracle.sysman.prov.PathsPropertiesLoc=$PROP_LOC oracle.sysman.prov.ssh.SSHConnectivity"
fi
#echo  | tee -a $LOGFILE 
#echo $CMD  
#echo  | tee -a $LOGFILE 
if [ $HELP = "true" ]
then
#   $CMD -help $0
HELPCMD="$JAVAHOME/bin/java -cp .:$SSH_LOC/ssh.jar:$SSH_LOC/jsch.jar:$SSH_LOC/remoteinterfaces.jar:$JAR_LOC/OraInstaller.jar:$JAR_LOC/OraInstallerNet.jar:$JAR_LOC/xmlparserv2.jar -Doracle.installer.oui_loc=$OUI_LOC oracle.sysman.prov.ssh.SSHConnectivity"
$HELPCMD -help $0
   exit
fi

if [ $DETAILED_HELP = "true" ]
then
HELPCMD="$JAVAHOME/bin/java -cp .:$SSH_LOC/ssh.jar:$SSH_LOC/jsch.jar:$SSH_LOC/remoteinterfaces.jar:$JAR_LOC/OraInstaller.jar:$JAR_LOC/OraInstallerNet.jar:$JAR_LOC/xmlparserv2.jar -Doracle.installer.oui_loc=$OUI_LOC oracle.sysman.prov.ssh.SSHConnectivity"
$HELPCMD -detail $0
   exit
fi

if test -z "$HOSTS"
then
   if test -n "$CLUSTER_CONFIGURATION_FILE"
   then
       if test -f "$CLUSTER_CONFIGURATION_FILE"
      then
          HOSTS=`awk '$1 !~ /^#/ { str = str " " $1 } END { print str }' $CLUSTER_CONFIGURATION_FILE` 
      else
          echo "Please specify a valid and existing cluster configuration file."
      fi
   fi
fi

if  test -z "$HOSTS"
then
#echo "Host information is missing"
echo 
echo "Usage: $0 -user <username> -hosts <space separated hostlist> | -hostfile <absolute path of cluster configuration file>  [-asUser <user for which setup need to be done on the local machine, eg, SYSTEM> [-asUserGrp <group, which the user specified in asUser belongs to>] -sshLocalDir <windows style full path of dir where keys should be generated on the local machine for asUser>] -homeDir <windows style full path of the home directory of the current user>] [ -advanced ] [-usePassphrase] [-logfile <absolute path of logfile> ] [-confirm] [-shared] [-verify] [-exverify] [-remotePlatform <platform id (linux:46, solaris:453, msplats:912>] [-obPasswordfile <obfuscated password file>] [-localPlatformGrp <unix,win>] [-help] [-detail]"

echo
echo "Usage Examples:"

echo -e "\033[1mLocal Platform = Unix\033[0m"
echo $0 -user pat -hosts shell.isp.com 
echo $0 -user pat -hosts \"shell.isp.com shell1.isp.com\"
echo $0 -user pat -hosts shell.isp.com  -remotePlatform 453 

echo
echo -e "\033[1mLocal Platform = Windows\033[0m"
echo $0 -user pat -asUser SYSTEM -asUserGrp root -sshLocalDir \"C:\\cygwin\\.ssh\"  -localPlatformGrp win -hosts shell.isp.com
echo $0 -user pat -asUser SYSTEM -asUserGrp root -sshLocalDir \"C:\\cygwin\\.ssh\" -localPlatformGrp win -hosts "shell.isp.com  shell1.isp.com" 
echo NOTE: Please specify the paths in double quotes when Local Platform is Windows.

echo 
echo  -e "\033[1mTo get Help\033[0m"
echo $0 -help "| more"
echo $0 -detail "| more"
exit 1
fi

if  test -z "$TEMP"
then
  LOGFILE=sshUserSetup_`date +%F-%H-%M-%S`.log
  SSHLOG=`pwd`/SSHSetup
else
  LOGFILE=$TEMP/sshUserSetup_`date +%F-%H-%M-%S`.log
  SSHLOG=$TEMP/SSHSetup
fi

if test -z "$LOG_FILE"
then
 LOG_FILE=$SSHLOG
fi

#echo  The output is Logged in $LOG_FILE
#echo 
#echo The output of this script is also logged into $LOGFILE
#echo  | tee -a $LOGFILE 
echo Hosts are $HOSTS >> $LOGFILE
echo user is  $USR >>  $LOGFILE

#echo  | tee -a $LOGFILE 
#Check if the nodes are reachable
$CMD -areNodesAlive -hosts "$HOSTS" -logfile "$LOG_FILE"
exitval=$?

if [ $exitval != 0 ] 
then
  echo Remote host reachability check failed.
  echo Please ensure that all the hosts are up and re-run the script.  | tee -a $LOGFILE
  echo Exiting now...  | tee -a $LOGFILE
  exit 1
else
  echo Remote host reachability check succeeded.  | tee -a $LOGFILE
  echo All hosts are reachable. Proceeding further...  | tee -a $LOGFILE
fi
echo  | tee -a $LOGFILE 
firsthost=`echo $HOSTS | awk '{print $1}; END { }'`
echo firsthost $firsthost >> $LOGFILE
numhosts=`echo $HOSTS | awk '{ }; END {print NF}'`
echo numhosts $numhosts >> $LOGFILE
echo  | tee -a $LOGFILE 
if [ $VERIFY = "true" ]
then
   echo Since user has specified -verify option, SSH setup would not be done. Only, existing SSH setup would be verified. | tee -a $LOGFILE
else
#  echo  | tee -a $LOGFILE 
  echo NOTE : | tee -a $LOGFILE 
  echo As part of the setup procedure, this script will use 'ssh' and 'scp' to copy | tee -a $LOGFILE 
  echo files between the local host and the remote hosts. You may be prompted for   | tee -a $LOGFILE 
  echo the password during the execution of the script. | tee -a $LOGFILE 
  echo "AS PER SSH REQUIREMENTS, THIS SCRIPT WILL SECURE THE USER HOME DIRECTORY" | tee -a $LOGFILE 
  echo AND THE .ssh DIRECTORY BY REVOKING GROUP AND WORLD WRITE PRIVILEDGES TO THESE  | tee -a $LOGFILE 
  echo "directories." | tee -a $LOGFILE 
  echo  | tee -a $LOGFILE 
  if [ "$SILENT_MODE" = "true" ]
  then
    CONFIRM=yes
  else
  echo "Do you want to continue and let the script make the above mentioned changes (yes/no)?" | tee -a $LOGFILE 
  fi

  if [ "$CONFIRM" = "no" ] 
  then 
    read CONFIRM 
  else
    if [ "$SILENT_MODE" = "false" ]
    then
    echo "Confirmation provided on the command line" | tee -a $LOGFILE
    echo  | tee -a $LOGFILE 
    echo The user chose ''$CONFIRM'' | tee -a $LOGFILE 
    fi
  fi 

  
   
  if [ "$CONFIRM" = "no" ] 
  then 
    echo "SSH setup is not done." | tee -a $LOGFILE 
    exit 1 
  else 
    $CMD $ARGS -hosts "$HOSTS" -logfile "$LOG_FILE"
    EXITCODE=$?
    if [ $EXITCODE != 0 ]
    then
        exit
    fi
  fi
fi

echo 
SSH="/usr/bin/ssh"
BITS=1024
ENCR="rsa"
PATH_SEPARATOR=/

calculateOS()
{
    if test -z "$PLATFORM"
    then
        platform=`uname -s`
    else
        platform=$PLATFORM
    fi
    
    case "$platform"
    in
       "SunOS")    SSH="/usr/local/bin/ssh";;
       "Windows")  PATH_SEPARATOR="\\";;
    esac

    echo "Local Platform:- $platform " | tee -a $LOGFILE
}

calculateOS

echo                                                                          | tee -a $LOGFILE
echo ------------------------------------------------------------------------ | tee -a $LOGFILE
echo Verifying SSH setup | tee -a $LOGFILE
echo =================== | tee -a $LOGFILE
echo The script will now run the 'date' command on the remote nodes using ssh | tee -a $LOGFILE
echo to verify if ssh is setup correctly. IF THE SETUP IS CORRECTLY SETUP,  | tee -a $LOGFILE
echo THERE SHOULD BE NO OUTPUT OTHER THAN THE DATE AND SSH SHOULD NOT ASK FOR | tee -a $LOGFILE
echo PASSWORDS. If you see any output other than date or are prompted for the | tee -a $LOGFILE
echo password, ssh is not setup correctly and you will need to resolve the  | tee -a $LOGFILE
echo issue and set up ssh again. | tee -a $LOGFILE
echo The possible causes for failure could be:  | tee -a $LOGFILE
echo   1. The server settings in /etc/ssh/sshd_config file do not allow ssh | tee -a $LOGFILE
echo      for user $USR. | tee -a $LOGFILE
echo   2. The server may have disabled public key based authentication.
echo   3. The client public key on the server may be outdated.
echo   4. ~$USR or  ~$USR/.ssh on the remote host may not be owned by $USR.  | tee -a $LOGFILE
echo   5. User may not have passed -shared option for shared remote users or | tee -a $LOGFILE
echo     may be passing the -shared option for non-shared remote users.  | tee -a $LOGFILE
echo   6. If there is output in addition to the date, but no password is asked, | tee -a $LOGFILE
echo   it may be a security alert shown as part of company policy. Append the | tee -a $LOGFILE
echo   "additional text to the <OMS HOME>/sysman/prov/resources/ignoreMessages.txt file." | tee -a $LOGFILE
echo ------------------------------------------------------------------------ | tee -a $LOGFILE
#read -t 30 dummy
  for host in $HOSTS
  do
    echo --$host:-- | tee -a $LOGFILE

     echo Running $SSH -x -l $USR $host date to verify SSH connectivity has been setup from local host to $host.  | tee -a $LOGFILE
     echo "IF YOU SEE ANY OTHER OUTPUT BESIDES THE OUTPUT OF THE DATE COMMAND OR IF YOU ARE PROMPTED FOR A PASSWORD HERE, IT MEANS SSH SETUP HAS NOT BEEN SUCCESSFUL. Please note that being prompted for a passphrase may be OK but being prompted for a password is ERROR." | tee -a $LOGFILE
     if [ $PASSPHRASE = "yes" ]
     then
       echo "The script will run SSH on the remote machine $host. The user may be prompted for a passphrase here in case the private key has been encrypted with a passphrase." | tee -a $LOGFILE
     fi
     $SSH -l $USR $host "/bin/sh -c date"  | tee -a $LOGFILE
echo ------------------------------------------------------------------------ | tee -a $LOGFILE
  done

if [ $EXHAUSTIVE_VERIFY = "true" ]
then
   for clienthost in $HOSTS
   do

      if [ $SHARED = "true" ]
      then
         REMOTESSH="$SSH -i .ssh/identity_${clienthost}"
      else
         REMOTESSH=$SSH
      fi

      for serverhost in  $HOSTS
      do
         echo ------------------------------------------------------------------------ | tee -a $LOGFILE
         echo Verifying SSH connectivity has been setup from $clienthost to $serverhost  | tee -a $LOGFILE
         echo ------------------------------------------------------------------------ | tee -a $LOGFILE
         echo "IF YOU SEE ANY OTHER OUTPUT BESIDES THE OUTPUT OF THE DATE COMMAND OR IF YOU ARE PROMPTED FOR A PASSWORD HERE, IT MEANS SSH SETUP HAS NOT BEEN SUCCESSFUL."  | tee -a $LOGFILE
         $SSH -l $USR $clienthost "$REMOTESSH $serverhost \"/bin/sh -c date\""  | tee -a $LOGFILE
         echo ------------------------------------------------------------------------ | tee -a $LOGFILE
      done
       echo -Verification from $clienthost complete- | tee -a $LOGFILE
   done
else
   if [ $ADVANCED = "true" ]
   then
      if [ $SHARED = "true" ]
      then
         REMOTESSH="$SSH -i .ssh/identity_${firsthost}"
      else
         REMOTESSH=$SSH
      fi
     for host in $HOSTS
     do
         echo ------------------------------------------------------------------------ | tee -a $LOGFILE
        echo Verifying SSH connectivity has been setup from $firsthost to $host  | tee -a $LOGFILE
        echo "IF YOU SEE ANY OTHER OUTPUT BESIDES THE OUTPUT OF THE DATE COMMAND OR IF YOU ARE PROMPTED FOR A PASSWORD HERE, IT MEANS SSH SETUP HAS NOT BEEN SUCCESSFUL." | tee -a $LOGFILE
       $SSH -l $USR $firsthost "/bin/sh -c \"$REMOTESSH $host \\"/bin/sh -c date\\"\"" | tee -a $LOGFILE
         echo ------------------------------------------------------------------------ | tee -a $LOGFILE
    done
    echo -Verification from $clienthost complete- | tee -a $LOGFILE
  fi
fi
echo "SSH verification complete." | tee -a $LOGFILE

