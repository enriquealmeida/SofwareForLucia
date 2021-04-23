#!/bin/sh
# Copyright (c) 2006, Oracle. All rights reserved.  
#
#    NAME
#      sshUserSetupNT.sh - <one-line expansion of the name>
#
#    DESCRIPTION
#     This script should be used to setup ssh user equivalence between NT (local) and NT/Linux (remote) machines.
#     ./sshUserSetupNT.sh or ./sshUserSetupNT.sh -help for usage.
#
#    NOTES
#      <other useful comments, qualifications, etc.>
#
# Created jgangwar
# Modified 02/18/2006 jgangwar
#          04/04/2006 jgangwar

#echo Parsing command line arguments
numargs=$#

ADVANCED=false
HOSTNAME=`hostname`
CONFIRM=no
SHARED=false
i=1
USR=$USER

if  test -z "$TEMP"
then
  LOGFILE="sshUserSetup_`date +%F-%H-%M-%S`.log"
else
  LOGFILE="$TEMP/sshUserSetup_`date +%F-%H-%M-%S`.log"
fi

VERIFY=false
EXHAUSTIVE_VERIFY=false
HELP=false
PASSPHRASE=no
RERUN_SSHKEYGEN=no
NO_PROMPT_PASSPHRASE=no

while [ $i -le $numargs ]
do
  j=$1 
  if [ $j = "-hosts" ] 
  then
     HOSTS=$2
     shift 1
     i=`expr $i + 1`
  fi
  if [ $j = "-user" ] 
  then
     USR=$2
     shift 1
     i=`expr $i + 1`
   fi
  if [ $j = "-asUser" ] 
  then
     ASUSR=$2
     shift 1
     i=`expr $i + 1`
   fi
  if [ $j = "-asUserGrp" ] 
  then
     ASUSRGRP=$2
     shift 1
     i=`expr $i + 1`
   fi
  if [ $j = "-sshLocalDir" ] 
  then
     SSHLOCALDIR=$2
     shift 1
     i=`expr $i + 1`
   fi
  if [ $j = "-homeDir" ] 
  then
     HOMEDIR=$2
     shift 1
     i=`expr $i + 1`
   fi
  if [ $j = "-logfile" ] 
  then
     LOGFILE=$2
     shift 1
     i=`expr $i + 1`
   fi
  if [ $j = "-confirm" ] 
  then
     CONFIRM=yes
   fi
  if [ $j = "-hostfile" ] 
  then
     CLUSTER_CONFIGURATION_FILE=$2
     shift 1
     i=`expr $i + 1`
   fi
  if [ $j = "-usePassphrase" ] 
  then
     PASSPHRASE=yes
   fi
  if [ $j = "-noPromptPassphrase" ] 
  then
     NO_PROMPT_PASSPHRASE=yes
   fi
  if [ $j = "-shared" ] 
  then
     SHARED=true
   fi
  if [ $j = "-localUser" ] 
  then
     USER=$2
     shift 1
     i=`expr $i + 1`
   fi
  if [ $j = "-exverify" ] 
  then
     EXHAUSTIVE_VERIFY=true
   fi
  if [ $j = "-verify" ] 
  then
     VERIFY=true
   fi
  if [ $j = "-advanced" ] 
  then
     ADVANCED=true
   fi
  if [ $j = "-help" ] 
  then
     HELP=true
   fi
  i=`expr $i + 1`
  shift 1
done

if test -z $USR 
then
  USR="$USER"
fi

if [ $HELP = "true" ]
then
echo ""
echo "Usage $0 -user <user name> [-asUser <user for which setup need to be done on the local machine, eg, SYSTEM> [-asUserGrp <group, which the user specified in asUser belongs to>] -sshLocalDir <windows style full path of dir where keys should be generated on the local machine for asUser> -homeDir <windows style full path of the home directory of the current user>] [ -hosts \"<space separated hostlist>\" | -hostfile <absolute path of cluster configuration file> ] [ -advanced ]  [ -verify] [ -exverify ] [ -logfile <desired absolute path of logfile> ] [-confirm] [-shared [-localUser <user which is running this script>]] [-help] [-usePassphrase] [-noPromptPassphrase]"
echo ""
echo "NOTE: Please specify the paths in double quotes."
echo ""
echo "Examples:"
echo "$0 -user john -asUser SYSTEM -asUserGrp root -sshLocalDir \"C:\\cygwin\\.ssh\" -homeDir \"C:\\Documents and Settings\\smith\" -hosts host.example.com"
echo ""
echo "$0 -user john -asUser SYSTEM -asUserGrp root -sshLocalDir \"C:\\cygwin\\.ssh\" -homeDir \"C:\\cygwin\\home\\smith\" -hosts host.example.com"
echo ""
echo "This script is used to setup SSH connectivity from the host on which it is run to the specified remote hosts. After this script is run, the user can use  SSH to run commands on the remote hosts or copy files between the local host and the remote hosts without being prompted for passwords or confirmations.  The list of remote hosts and the user name on the remote host is specified as a command line parameter to the script. "
echo ""
echo "-user : User on remote hosts. "
echo ""
echo "-asUser : User, on local machine, for which ssh equivalence need to be set, eg, SYSTEM"
echo "This argument is mandatory for the agentpush application and its value should be SYSTEM."
echo ""
echo "-asUserGrp : Group, which the user specified in asUser belongs to, eg: SYSTEM belongs to the group root."
echo ""
echo "-sshLocalDir : Directory where keys should be generated on the local machine for asUser. The path should be a windows style absolute path. Specify the path in double quotes. Example: -sshLocalDir \"C:\\cygwin\\.ssh\". The value \"C:\\cygwin\" can be found from the registry \"HKEY_LOCAL_MACHINE\\Software\\Cygnus Solutions\\Cygwin\\mounts v2\\/\"."
echo ""
echo "-homeDir : Windows style full path of home directory of the current user."
echo "The value of /home can be found from the registry \"HKEY_LOCAL_MACHINE\\Software\\Cygnus Solutions\\Cygwin\\mounts v2\\/home\". Example: If /home points to \"C:\\Documents And Settings\\smith\", then -homeDir is \"C:\\Documents And Settings\\smith\". "
echo "If this registry key is not present, then get the value of the registry key \"HKEY_LOCAL_MACHINE\\Software\\Cygnus Solutions\\Cygwin\\mounts v2\\/\" and append \"home\\<localuser>\" to it. Example: If / points to \"C:\\cygwin\", then -homeDir is \"C:\\cygwin\\home\\smith\". "
echo "Specify the path in double quotes. "
echo "Make sure that value of /home from registry key is same as \$HOME."
echo ""
echo "-hosts : Space separated remote hosts list. "
echo ""
echo "-hostfile : The user can specify the host names either through the -hosts option or by specifying the absolute path of a cluster configuration file. A sample host file contents are below: "
echo
echo  "   host1 host1int 10.1.0.0 host1v  -"
echo  "   host2 host2int 10.1.0.1 host2v  -"
echo 
echo " The first column in each row of the host file will be used as the host name."
echo 
echo "-usePassphrase : The user wants to set up passphrase to encrypt the private key on the local host. " 
echo ""
echo "-noPromptPassphrase : The user does not want to be prompted for passphrase related questions. This is for users who want the default behavior to be followed."
echo ""
echo "-localUser : User which is running this script. This parameter is not required if the environment variable \"\$USER\" is set."
echo ""
echo "-shared : In case the user on the remote host has its home directory NFS mounted or shared across the local and remote hosts, this script should be used with -shared option. "
echo " It is possible for the user to determine whether a user's home directory is shared or non-shared. Let us say we want to determine that user user1's home directory is shared across hosts A, B and C."
echo " Follow the following steps:"
echo "    1. On host A, touch ~user1/checkSharedHome.tmp"
echo "    2. On hosts B and C, ls -al ~user1/checkSharedHome.tmp" 
echo "    3. If the file is present on hosts B and C in ~user1 directory and"
echo "       is identical on all hosts A, B, C, it means that the user's home "
echo "       directory is shared."
echo "    4. On host A, rm -f ~user1/checkSharedHome.tmp"
echo " In case the user accidentally passes -shared option for non-shared homes or viceversa,SSH connectivity would only be set up for a subset of the hosts. The user would have to re-run the setyp script with the correct option to rectify this problem."
echo ""
echo "-advanced :  Specifying the -advanced option on the command line would result in SSH  connectivity being setup among the remote hosts which means that SSH can be used to run commands on one remote host from the other remote host or copy files between the remote hosts without being prompted for passwords or confirmations."
echo ""
echo "-confirm: The script would remove write permissions on the remote hosts for the user home directory and ~/.ssh directory for "group" and "others". This is an SSH requirement. The user would be explicitly informed about this by the script and prompted to continue. In case the user presses no, the script would exit. In case the user does not want to be prompted, he can use -confirm option."
echo  "As a part of the setup, the script would use SSH to create files within ~/.ssh directory of the remote node and to setup the requisite permissions. The script also uses SCP to copy the local host public key to the remote hosts so that the remote hosts trust the local host for SSH. At the time, the script performs these steps, SSH connectivity has not been completely setup  hence the script would prompt the user for the remote host password.  "
echo "For each remote host, for remote users with non-shared homes this would be done once for SSH and  once for SCP. If the number of remote hosts are x, the user would be prompted  2x times for passwords. For remote users with shared homes, the user would be prompted only twice, once each for SCP and SSH.  For security reasons, the script does not save passwords and reuse it. Also, for security reasons, the script does not accept passwords redirected from a file. The user has to key in the confirmations and passwords at the prompts. "
echo ""
echo "-verify : -verify option means that the user just wants to verify whether SSH has been set up. In this case, the script would not setup SSH but would only check whether SSH connectivity has been setup from the local host to the remote hosts. The script would run the date command on each remote host using SSH. In case the user is prompted for a password or sees a warning message for a particular host, it means SSH connectivity has not been setup correctly for that host.  In case the -verify option is not specified, the script would setup SSH and then do the verification as well. "
echo ""
echo "-exverify : In case the user speciies the -exverify option, an exhaustive verification for all hosts would be done. In that case, the following would be checked: "
echo "   1. SSH connectivity from local host to all remote hosts. "
echo "   2. SSH connectivity from each remote host to itself and other remote hosts.  "
echo The -exverify option can be used in conjunction with the -verify option as well to do an exhaustive verification once the setup has been done.  
echo "Taking some examples: Let us say local host is Z, remote hosts are A,B and C. Local user is smith. Remote users are john(non-shared), pat(shared)."
echo "$0 -user john -hosts "A B C" -advanced -exverify -confirm"
echo "Script would set up connectivity from Z -> A, Z -> B, Z -> C, A -> A, A -> B, A -> C, B -> A, B -> B, B -> C, C -> A, C -> B, C -> C."
echo "Since user has given -exverify option, all these scenario would be verified too."
echo
echo "Now the user runs : $0 -user john -hosts "A B C" -verify"
echo "Since -verify option is given, no SSH setup would be done, only verification of existing setup. Also, since -exverify or -advanced options are not given, script would only verify connectivity from Z -> A, Z -> B, Z -> C"

echo "Now the user runs : $0 -user john -hosts "A B C" -verify -advanced"
echo "Since -verify option is given, no SSH setup would be done, only verification of existing setup. Also, since  -advanced options is given, script would verify connectivity from Z -> A, Z -> B, Z -> C, A-> A, A->B, A->C, A->D"

echo "Now the user runs:"
echo "$0 -user pat -hosts "A B C" -confirm -shared"
echo "Script would set up connectivity between  Z->A, Z->B, Z->C only since advanced option is not given."
echo "All these scenarios would be verified too."

exit
fi

if test -z "$HOSTS"
then
   if test -n "$CLUSTER_CONFIGURATION_FILE" && test -f "$CLUSTER_CONFIGURATION_FILE"
   then
      HOSTS=`awk '$1 !~ /^#/ { str = str " " $1 } END { print str }' $CLUSTER_CONFIGURATION_FILE` 
   elif ! test -f "$CLUSTER_CONFIGURATION_FILE"
   then
     echo ""
     echo "Please specify a valid and existing cluster configuration file."
   fi
fi

if  test -z "$HOSTS" || test -z $USR
then
echo "Either user name or host information is missing"
echo ""
echo "Usage $0 -user <user name> [-asUser <user for which setup need to be done on the local machine, eg, SYSTEM> [-asUserGrp <group, which the user specified in asUser belongs to>] -sshLocalDir <windows style full path of dir where keys should be generated on the local machine for asUser> -homeDir <windows style full path of the home directory of the current user>] [ -hosts \"<space separated hostlist>\" | -hostfile <absolute path of cluster configuration file> ] [ -advanced ]  [ -verify] [ -exverify ] [ -logfile <desired absolute path of logfile> ] [-confirm] [-shared [-localUser <user which is running this script>]] [-help] [-usePassphrase] [-noPromptPassphrase]"
echo ""
echo "NOTE: Please specify the paths in double quotes."
echo ""
echo "Examples:"
echo "$0 -user john -asUser SYSTEM -asUserGrp root -sshLocalDir \"C:\\cygwin\\.ssh\" -homeDir \"C:\\Documents and Settings\\smith\" -hosts host.example.com"
echo ""
echo "$0 -user john -asUser SYSTEM -asUserGrp root -sshLocalDir \"C:\\cygwin\\.ssh\" -homeDir \"C:\\cygwin\\home\\smith\" -hosts host.example.com"
echo ""
exit 1
fi

if ! test -z "$ASUSR" 
then
	if test -z "$SSHLOCALDIR"
	then
		echo "-sshLocalDir option has not been specified."
		echo "Please specify the directory where keys should be generated for the user $ASUSR, i.e. /.ssh"
		echo "The value of / can be found from the registry key." 
		echo "HKEY_LOCAL_MACHINE\\Software\\Cygnus Solutions\\Cygwin\\mounts v2\\/"
		exit 1
	fi
	
	if  test -z "$HOMEDIR"
	then
		echo "-homeDir option has not been specified."
		echo "Please specify the directory where the keys would be generated for the local user, i.e. /home/current_user"
		echo "The value of /home can be found from the registry key." 
		echo "HKEY_LOCAL_MACHINE\\Software\\Cygnus Solutions\\Cygwin\\mounts v2\\/home"
		exit 1
	fi
fi


if  test -z "$HOMEDIR"
then
HOMEDIR=$HOME
echo "Setting HOMEDIR to $HOMEDIR"
fi

echo The output of this script is also logged into "$LOGFILE" | tee -a "$LOGFILE"

echo Hosts are $HOSTS | tee -a "$LOGFILE"
echo user is  $USR | tee -a "$LOGFILE"
SSH="/usr/bin/ssh"
SCP="/usr/bin/scp"
SSH_KEYGEN="/usr/bin/ssh-keygen"
BITS=1024
ENCR="rsa"

deadhosts=""
alivehosts=""
echo Checking if the remote hosts are reachable | tee -a "$LOGFILE"
for host in $HOSTS
do
  ping $host -n 5 -w 5
  exitcode=`echo $?`
  if [ $exitcode = 0 ]
  then
     alivehosts="$alivehosts $host"
  else
     deadhosts="$deadhosts $host"
  fi
done

if test -z "$deadhosts"
then
   echo Remote host reachability check succeeded.  | tee -a "$LOGFILE"
   echo The following hosts are reachable: $alivehosts.  | tee -a "$LOGFILE"
   echo The following hosts are not reachable: $deadhosts.  | tee -a "$LOGFILE"
   echo All hosts are reachable. Proceeding further...  | tee -a "$LOGFILE"
else
   echo Remote host reachability check failed.  | tee -a "$LOGFILE"
   echo The following hosts are reachable: $alivehosts.  | tee -a "$LOGFILE"
   echo The following hosts are not reachable: $deadhosts.  | tee -a "$LOGFILE"
   echo Please ensure that all the hosts are up and re-run the script.  | tee -a "$LOGFILE"
   echo Exiting now...  | tee -a "$LOGFILE"
   exit 1
fi

firsthost=`echo $HOSTS | awk '{print $1}; END { }'`
echo firsthost $firsthost
numhosts=`echo $HOSTS | awk '{ }; END {print NF}'`
echo numhosts $numhosts

if [ $VERIFY = "true" ]
then
   echo Since user has specified -verify option, SSH setup would not be done. Only, existing SSH setup would be verified. | tee -a "$LOGFILE"
   continue
else
echo The script will setup SSH connectivity from the host ''`hostname`'' to all  | tee -a "$LOGFILE" 
echo the remote hosts. After the script is executed, the user can use SSH to run  | tee -a "$LOGFILE" 
echo commands on the remote hosts or copy files between this host ''`hostname`'' | tee -a "$LOGFILE" 
echo and the remote hosts without being prompted for passwords or confirmations. | tee -a "$LOGFILE" 
echo  | tee -a "$LOGFILE" 
echo NOTE 1: | tee -a "$LOGFILE" 
echo As part of the setup procedure, this script will use 'ssh' and 'scp' to copy | tee -a "$LOGFILE" 
echo files between the local host and the remote hosts. Since the script does not  | tee -a "$LOGFILE" 
echo store passwords, you may be prompted for the passwords during the execution of  | tee -a "$LOGFILE" 
echo the script whenever 'ssh' or 'scp' is invoked. | tee -a "$LOGFILE" 
echo  | tee -a "$LOGFILE" 
echo NOTE 2: | tee -a "$LOGFILE" 
echo "AS PER SSH REQUIREMENTS, THIS SCRIPT WILL SECURE THE USER HOME DIRECTORY" | tee -a "$LOGFILE" 
echo AND THE .ssh DIRECTORY BY REVOKING GROUP AND WORLD WRITE PRIVILEDGES TO THESE  | tee -a "$LOGFILE" 
echo "directories." | tee -a "$LOGFILE" 
echo  | tee -a "$LOGFILE" 
echo "Do you want to continue and let the script make the above mentioned changes: yes/no?" | tee -a "$LOGFILE" 

if [ "$CONFIRM" = "no" ] 
then 
  read CONFIRM 
else
  echo "Confirmation provided on the command line" | tee -a "$LOGFILE"
fi 
   
echo  | tee -a "$LOGFILE" 
echo The user chose ''$CONFIRM'' | tee -a "$LOGFILE" 
 
if [ "$CONFIRM" = "no" ] 
then 
  echo "SSH setup is not done." | tee -a "$LOGFILE" 
  exit 1 
else 
  if [ $NO_PROMPT_PASSPHRASE = "yes" ]
  then
    echo "User chose to skip passphrase related questions."  | tee -a "$LOGFILE"
  else
    #typeset -i PASSPHRASE_PROMPT
    if [ $SHARED = "true" ]
    then
	  PASSPHRASE_PROMPT=2*${numhosts}+1
    else
	  PASSPHRASE_PROMPT=2*${numhosts} 
    fi
    echo "Please specify if you want to specify a passphrase for the private key this script will create for the local host. Passphrase is used to encrypt the private key and makes SSH much more secure. Type 'yes' or 'no' and then press enter. In case you press 'yes', you would need to enter the passphrase whenever the script executes ssh or scp. " | tee -a "$LOGFILE"
    echo "The estimated number of times the user would be prompted for a passphrase is $PASSPHRASE_PROMPT. In addition, if the private-public files are also newly created, the user would have to specify the passphrase on one additional occasion. " | tee -a "$LOGFILE"
    echo "Enter 'yes' or 'no'." | tee -a "$LOGFILE"
    if [ $PASSPHRASE = "no" ]
    then
      read PASSPHRASE
    else
      echo "Confirmation provided on the command line" | tee -a "$LOGFILE"
    fi 

    echo  | tee -a "$LOGFILE" 
    echo The user chose ''$PASSPHRASE'' | tee -a "$LOGFILE" 

    if [ "$PASSPHRASE" = "yes" ] 
    then 
       RERUN_SSHKEYGEN="yes"
       #Checking for existence of identity file
       if test -f  "$HOMEDIR\.ssh\identity.pub" && test -f  "$HOMEDIR\.ssh\identity" 
       then
	     echo "The files containing the client public and private keys already exist on the local host. The current private key may or may not have a passphrase associated with it. In case you remember the passphrase and do not want to re-run ssh-keygen, press 'no' and enter. If you press 'no', the script will not attempt to create any new public/private key pairs. If you press 'yes', the script will remove the old private/public key files existing and create new ones prompting the user to enter the passphrase. If you enter 'yes', any previous SSH user setups would be reset. If you press 'change', the script will associate a new passphrase with the old keys." | tee -a "$LOGFILE"
	     echo "Press 'yes', 'no' or 'change'" | tee -a "$LOGFILE"
             read RERUN_SSHKEYGEN 
             echo The user chose ''$RERUN_SSHKEYGEN'' | tee -a "$LOGFILE" 
       fi 
     else
       if test -f  "$HOMEDIR\.ssh\identity.pub" && test -f  "$HOMEDIR\.ssh\identity" 
       then
         echo "The files containing the client public and private keys already exist on the local host. The current private key may have a passphrase associated with it. In case you find using passphrase inconvenient, although it is more secure, you can change to it empty through this script. Press 'change' if you want the script to change the passphrase for you. Press 'no' if you want to use your old passphrase, if you had one."
         read RERUN_SSHKEYGEN 
         echo The user chose ''$RERUN_SSHKEYGEN'' | tee -a "$LOGFILE" 
       fi
     fi
  fi
  echo Creating .ssh directory on local host, if not present already | tee -a "$LOGFILE"
  
  mkdir -p "$HOMEDIR\.ssh" | tee -a "$LOGFILE"
  chmod -R 755 "$HOMEDIR\.ssh" | tee -a "$LOGFILE"

  if test -f  "$HOMEDIR\.ssh\authorized_keys"
  then
      mv -f "$HOMEDIR\.ssh\authorized_keys"  "$HOMEDIR\.ssh\authorized_keys.tmp" | tee -a "$LOGFILE"
  fi

  if test -f  "$HOMEDIR\.ssh\known_hosts"
  then
      mv -f "$HOMEDIR\.ssh\known_hosts" "$HOMEDIR\.ssh\known_hosts.tmp" | tee -a "$LOGFILE"
  fi

  echo Creating config file on local host | tee -a "$LOGFILE"
  echo "If a config file exists already at $HOMEDIR\\.ssh\\config, it would be backed up to $HOMEDIR\\.ssh\\config.backup."
  echo "Host *" > "$HOMEDIR\.ssh\config.tmp" | tee -a "$LOGFILE"
  echo "ForwardX11 no" >> "$HOMEDIR\.ssh\config.tmp" | tee -a "$LOGFILE"
  if test -f "$HOMEDIR\.ssh\config" 
  then
    cp -f "$HOMEDIR\.ssh\config" "$HOMEDIR\.ssh\config.backup"
    chmod 644 "$HOMEDIR\.ssh\config" 
  fi
  mv -f "$HOMEDIR\.ssh\config.tmp" "$HOMEDIR\.ssh\config"  | tee -a "$LOGFILE"
  chmod 644 "$HOMEDIR\.ssh\config"

  if [ $RERUN_SSHKEYGEN = "yes" ]
  then
    echo Removing old private/public keys on local host | tee -a "$LOGFILE"
    if test -f "$HOMEDIR\.ssh\identity"
    then
        rm -f "$HOMEDIR\.ssh\identity" | tee -a "$LOGFILE"
    fi
    if test -f "$HOMEDIR\.ssh\identity.pub"
    then
        rm -f "$HOMEDIR\.ssh\identity.pub" | tee -a "$LOGFILE"
    fi
    echo Running SSH keygen on local host | tee -a "$LOGFILE"
    $SSH_KEYGEN -t $ENCR -b $BITS -f "$HOMEDIR\.ssh\identity"   | tee -a "$LOGFILE"
  
  elif [ $RERUN_SSHKEYGEN = "change" ]
  then
      echo Running SSH Keygen on local host to change the passphrase associated with the existing private key | tee -a "$LOGFILE"
      chmod 600 "$HOMEDIR\.ssh\identity" 
      chmod 644 "$HOMEDIR\.ssh\identity.pub" 
      chmod 644 "$HOMEDIR\.ssh\authorized_keys" 
      $SSH_KEYGEN -p -t $ENCR -b $BITS -f "$HOMEDIR\.ssh\identity" | tee -a "$LOGFILE"
      
  elif test -f  "$HOMEDIR\.ssh\identity.pub" && test -f  "$HOMEDIR\.ssh\identity" 
  then
      continue
      
  else
      echo Removing old private/public keys on local host | tee -a "$LOGFILE"
      if test -f "$HOMEDIR\.ssh\identity"
      then
          rm -f "$HOMEDIR\.ssh\identity" | tee -a "$LOGFILE"
      fi
      if test -f "$HOMEDIR\.ssh\identity.pub"
      then
          rm -f "$HOMEDIR\.ssh\identity.pub" | tee -a "$LOGFILE"
      fi
      echo Running SSH keygen on local host with empty passphrase | tee -a "$LOGFILE"
      $SSH_KEYGEN -t $ENCR -b $BITS -f "$HOMEDIR\.ssh\identity" -N ''  | tee -a "$LOGFILE"
  fi

  chmod 600 "$HOMEDIR\.ssh\identity"
  chmod 644 "$HOMEDIR\.ssh\identity.pub"
  if test -f "$HOMEDIR\.ssh\authorized_keys"
  then 
  chmod 644 "$HOMEDIR\.ssh\authorized_keys"
  fi
  chmod 644 "$HOMEDIR\.ssh\config"
  chmod 755 "$HOMEDIR\.ssh"

if [ $SHARED = "true" ]
then
  if ! test -z $USER && $USR = $USER 
  then
#No remote operations required
    echo Remote user is same as local user | tee -a "$LOGFILE"
    REMOTEHOSTS=""
    chmod 755 "$HOMEDIR" "$HOMEDIR\.ssh" | tee -a "$LOGFILE"
  else    
    REMOTEHOSTS="${firsthost}"
  fi
else
  REMOTEHOSTS="$HOSTS"
fi

for host in $REMOTEHOSTS
do
     echo Creating .ssh directory and setting permissions on remote host $host | tee -a "$LOGFILE"
     echo "THE SCRIPT WOULD ALSO BE REVOKING WRITE PERMISSIONS FOR "group" AND "others" ON THE HOME DIRECTORY FOR $USR. THIS IS AN SSH REQUIREMENT." | tee -a "$LOGFILE"
     echo The script would create ~$USR/.ssh/config file on remote host $host. If a config file exists already at ~$USR/.ssh/config, it would be backed up to ~$USR/.ssh/config.backup. | tee -a "$LOGFILE"
     echo The user may be prompted for a password here since the script would be running SSH on host $host. | tee -a "$LOGFILE"
     $SSH -o StrictHostKeyChecking=no -x -l $USR $host "/bin/sh -c \"  mkdir -p /home/$USR\""  | tee -a "$LOGFILE"
     $SSH -o StrictHostKeyChecking=no -x -l $USR $host "/bin/sh -c \"  mkdir -p .ssh ; chmod og-w . .ssh;   touch .ssh/authorized_keys .ssh/known_hosts;  chmod 644 .ssh/authorized_keys  .ssh/known_hosts; cp  .ssh/authorized_keys .ssh/authorized_keys.tmp ;  cp .ssh/known_hosts .ssh/known_hosts.tmp; echo \\"Host *\\" > .ssh/config.tmp; echo \\"ForwardX11 no\\" >> .ssh/config.tmp; if test -f  .ssh/config ; then cp -f .ssh/config .ssh/config.backup; fi ; mv -f .ssh/config.tmp .ssh/config\""  | tee -a "$LOGFILE"
     echo Done with creating .ssh directory and setting permissions on remote host $host. | tee -a "$LOGFILE"
done

for host in $REMOTEHOSTS
do
  echo Copying local host public key to the remote host $host | tee -a "$LOGFILE"
  echo The user may be prompted for a password or passphrase here since the script would be using SCP for host $host. | tee -a "$LOGFILE"

  $SCP "$HOME/.ssh/identity.pub"  $USR@$host:.ssh/authorized_keys | tee -a "$LOGFILE"
  echo Done copying local host public key to the remote host $host | tee -a "$LOGFILE"
done

cat "$HOMEDIR\.ssh\identity.pub" >> "$HOMEDIR\.ssh\authorized_keys" | tee -a "$LOGFILE"

for host in $HOSTS
do
  if [ $ADVANCED = "true" ] 
  then
    echo Creating keys on remote host $host if they do not exist already. This is required to setup SSH on host $host. | tee -a "$LOGFILE"
    if [ $SHARED = "true" ]
    then
      IDENTITY_FILE_NAME=identity_$host
      COALESCE_IDENTITY_FILES_COMMAND="cat "$HOMEDIR\.ssh\${IDENTITY_FILE_NAME}.pub" >> "$HOMEDIR\.ssh\authorized_keys""
      echo $COALESCE_IDENTITY_FILES_COMMAND
    else
      IDENTITY_FILE_NAME=identity
    fi

   $SSH  -o StrictHostKeyChecking=no -x -l $USR $host " /bin/sh -c \"if test -f  .ssh/${IDENTITY_FILE_NAME}.pub && test -f  .ssh/${IDENTITY_FILE_NAME}; then echo; else rm -f .ssh/${IDENTITY_FILE_NAME} ;  rm -f .ssh/${IDENTITY_FILE_NAME}.pub ;  $SSH_KEYGEN -t $ENCR -b $BITS -f .ssh/${IDENTITY_FILE_NAME} -N '' ; fi; ${COALESCE_IDENTITY_FILES_COMMAND} \"" | tee -a "$LOGFILE"
  else 
#At least get the host keys from all hosts for shared case - advanced option not set
    if test  $SHARED = "true" && test $ADVANCED = "false"
    then
      if [ $PASSPHRASE = "yes" ]
      then
	 echo "The script will fetch the host keys from all hosts. The user may be prompted for a passphrase here in case the private key has been encrypted with a passphrase." | tee -a "$LOGFILE"
      fi
      $SSH  -o StrictHostKeyChecking=no -x -l $USR $host "/bin/sh -c true"
    fi
  fi
done

for host in $REMOTEHOSTS
do
  if test $ADVANCED = "true" && test $SHARED = "false"  
  then
      $SCP $USR@$host:.ssh/identity.pub "$HOME/.ssh/identity.pub.$host" | tee -a "$LOGFILE"
      cat "$HOMEDIR\.ssh\identity.pub.$host" >> "$HOMEDIR\.ssh\authorized_keys" | tee -a "$LOGFILE"
      rm -f "$HOMEDIR\.ssh\identity.pub.$host" | tee -a "$LOGFILE"
    fi
done

for host in $REMOTEHOSTS
do
   if [ $ADVANCED = "true" ]
   then
      if [ $SHARED != "true" ]
      then
         echo Updating authorized_keys file on remote host $host | tee -a "$LOGFILE"
         $SCP "$HOME/.ssh/authorized_keys"  $USR@$host:.ssh/authorized_keys | tee -a "$LOGFILE"
      fi 
     echo Updating known_hosts file on remote host $host | tee -a "$LOGFILE"
     $SCP "$HOME/.ssh/known_hosts" $USR@$host:.ssh/known_hosts | tee -a "$LOGFILE"
   fi
   if [ $PASSPHRASE = "yes" ]
   then
	 echo "The script will run SSH on the remote machine $host. The user may be prompted for a passphrase here in case the private key has been encrypted with a passphrase." | tee -a "$LOGFILE"
   fi
     $SSH -x -l $USR $host "/bin/sh -c \"cat .ssh/authorized_keys.tmp >> .ssh/authorized_keys; cat .ssh/known_hosts.tmp >> .ssh/known_hosts; rm -f  .ssh/known_hosts.tmp  .ssh/authorized_keys.tmp\"" | tee -a "$LOGFILE"
done

cat  "$HOMEDIR\.ssh\known_hosts.tmp" >> "$HOMEDIR\.ssh\known_hosts" | tee -a "$LOGFILE"
cat  "$HOMEDIR\.ssh\authorized_keys.tmp" >> "$HOMEDIR\.ssh\authorized_keys" | tee -a "$LOGFILE"
rm -f  "$HOMEDIR\.ssh\known_hosts.tmp" "$HOMEDIR\.ssh\authorized_keys.tmp" | tee -a "$LOGFILE"
echo SSH setup is complete. | tee -a "$LOGFILE"
fi
fi

echo                                                                          | tee -a "$LOGFILE"
echo ------------------------------------------------------------------------ | tee -a "$LOGFILE"
echo Verifying SSH setup | tee -a "$LOGFILE"
echo =================== | tee -a "$LOGFILE"
echo The script will now run the \'date\' command on the remote nodes using ssh | tee -a "$LOGFILE"
echo to verify if ssh is setup correctly. IF THE SETUP IS CORRECTLY SETUP,  | tee -a "$LOGFILE"
echo THERE SHOULD BE NO OUTPUT OTHER THAN THE DATE AND SSH SHOULD NOT ASK FOR | tee -a "$LOGFILE"
echo PASSWORDS. If you see any output other than date or are prompted for the | tee -a "$LOGFILE"
echo password, ssh is not setup correctly and you will need to resolve the  | tee -a "$LOGFILE"
echo issue and set up ssh again. | tee -a "$LOGFILE"
echo The possible causes for failure could be:  | tee -a "$LOGFILE"
echo   1. The server settings in /etc/ssh/sshd_config file do not allow ssh | tee -a "$LOGFILE"
echo      for user $USR. | tee -a "$LOGFILE"
echo   2. The server may have disabled public key based authentication.
echo   3. The client public key on the server may be outdated.
echo   4. ~$USR or  ~$USR/.ssh on the remote host may not be owned by $USR.  | tee -a "$LOGFILE"
echo   5. User may not have passed -shared option for shared remote users or | tee -a "$LOGFILE"
echo     may be passing the -shared option for non-shared remote users.  | tee -a "$LOGFILE"
echo   6. If there is output in addition to the date, but no password is asked, | tee -a "$LOGFILE"
echo   it may be a security alert shown as part of company policy. Append the | tee -a "$LOGFILE"
echo   "additional text to the <OMS HOME>/sysman/prov/resources/ignoreMessages.txt file." | tee -a "$LOGFILE"
echo ------------------------------------------------------------------------ | tee -a "$LOGFILE"
#read -t 30 dummy
  for host in $HOSTS
  do
    echo --$host:-- | tee -a "$LOGFILE"

     echo Running $SSH -x -l $USR $host date to verify SSH connectivity has been setup from local host to $host.  | tee -a "$LOGFILE"
     echo "IF YOU SEE ANY OTHER OUTPUT BESIDES THE OUTPUT OF THE DATE COMMAND OR IF YOU ARE PROMPTED FOR A PASSWORD HERE, IT MEANS SSH SETUP HAS NOT BEEN SUCCESSFUL. Please note that being prompted for a passphrase may be OK but being prompted for a password is ERROR." | tee -a "$LOGFILE"
     if [ $PASSPHRASE = "yes" ]
     then
       echo "The script will run SSH on the remote machine $host. The user may be prompted for a passphrase here in case the private key has been encrypted with a passphrase." | tee -a "$LOGFILE"
     fi
     $SSH -l $USR $host "/bin/sh -c date"  | tee -a "$LOGFILE"
echo ------------------------------------------------------------------------ | tee -a "$LOGFILE"
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
         echo ------------------------------------------------------------------------ | tee -a "$LOGFILE"
         echo Verifying SSH connectivity has been setup from $clienthost to $serverhost  | tee -a "$LOGFILE"
         echo ------------------------------------------------------------------------ | tee -a "$LOGFILE"
         echo "IF YOU SEE ANY OTHER OUTPUT BESIDES THE OUTPUT OF THE DATE COMMAND OR IF YOU ARE PROMPTED FOR A PASSWORD HERE, IT MEANS SSH SETUP HAS NOT BEEN SUCCESSFUL."  | tee -a "$LOGFILE"
         $SSH -l $USR $clienthost "$REMOTESSH $serverhost \"/bin/sh -c date\""  | tee -a "$LOGFILE"
         echo ------------------------------------------------------------------------ | tee -a "$LOGFILE"
      done  
       echo -Verification from $clienthost complete- | tee -a "$LOGFILE"
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
         echo ------------------------------------------------------------------------ | tee -a "$LOGFILE"
        echo Verifying SSH connectivity has been setup from $firsthost to $host  | tee -a "$LOGFILE"
        echo "IF YOU SEE ANY OTHER OUTPUT BESIDES THE OUTPUT OF THE DATE COMMAND OR IF YOU ARE PROMPTED FOR A PASSWORD HERE, IT MEANS SSH SETUP HAS NOT BEEN SUCCESSFUL." | tee -a "$LOGFILE"
       $SSH -l $USR $firsthost "/bin/sh -c \"$REMOTESSH $host \\"/bin/sh -c date\\"\"" | tee -a "$LOGFILE"
         echo ------------------------------------------------------------------------ | tee -a "$LOGFILE"
    done
    echo -Verification from $clienthost complete- | tee -a "$LOGFILE"
  fi
fi
echo "SSH verification complete." | tee -a "$LOGFILE"

if ! test -z $ASUSR
then
  echo "Setting up ssh euivalence for user $ASUSR"
  cd /
  if test -d "$SSHLOCALDIR" 
  then
    chmod -R 777 "$SSHLOCALDIR" | tee -a "$LOGFILE"
    rm -rf "$SSHLOCALDIR" | tee -a "$LOGFILE"
  fi
  
  mkdir -p "$SSHLOCALDIR" | tee -a "$LOGFILE"
  chmod -R 777 "$SSHLOCALDIR" | tee -a "$LOGFILE"
  chmod -R 777 "$HOMEDIR\.ssh" | tee -a "$LOGFILE"
  echo "Copying files from $HOMEDIR\.ssh to $SSHLOCALDIR"
    
  cp "$HOMEDIR\.ssh\identity" "$SSHLOCALDIR\identity" | tee -a "$LOGFILE"
  cp "$HOMEDIR\.ssh\identity.pub" "$SSHLOCALDIR\identity.pub" | tee -a "$LOGFILE"
  cp "$HOMEDIR\.ssh\authorized_keys" "$SSHLOCALDIR\authorized_keys" | tee -a "$LOGFILE"
  cp "$HOMEDIR\.ssh\known_hosts" "$SSHLOCALDIR\known_hosts" | tee -a "$LOGFILE"
  cp "$HOMEDIR\.ssh\config" "$SSHLOCALDIR\config" | tee -a "$LOGFILE"

  chmod 600 "$SSHLOCALDIR\identity" | tee -a "$LOGFILE"
  chmod 644 "$SSHLOCALDIR\identity.pub" | tee -a "$LOGFILE"
  chmod 644 "$SSHLOCALDIR\authorized_keys" | tee -a "$LOGFILE"
  chmod 644 "$SSHLOCALDIR\known_hosts" | tee -a "$LOGFILE"
  chmod 644 "$SSHLOCALDIR\config" | tee -a "$LOGFILE"
  chmod 755 "$SSHLOCALDIR" | tee -a "$LOGFILE"
  chown -R $ASUSR "$SSHLOCALDIR"  | tee -a "$LOGFILE"

  if [ ! $? -eq 0 ] 
  then	  
  echo "If the command \"chown -R $ASUSR $SSHLOCALDIR\" fails, please change the user/group permissions as follows : "
  echo "  - Give $ASUSR full control on $SSHLOCALDIR."
  echo "  - Give $ASUSR read, write priviledge on identity, identity.pub, authorized_keys, known_hosts, config."
  echo "  - Give Everyone read, execute priviledge on $SSHLOCALDIR."
  echo "  - Give Everyone read priviledge on identity.pub, authorized_keys, known_hosts, config."
  echo "  - Remove all other users and groups from the list of users who can access these files."
  fi
  
  if ! test -z $ASUSRGRP
  then
    chgrp -R $ASUSRGRP "$SSHLOCALDIR" | tee -a "$LOGFILE"
  fi

  chmod 600 "$HOMEDIR\.ssh\identity" | tee -a "$LOGFILE" 
  chmod 644 "$HOMEDIR\.ssh\identity.pub" | tee -a "$LOGFILE" 
  chmod 644 "$HOMEDIR\.ssh\authorized_keys" | tee -a "$LOGFILE"
  chmod 644 "$HOMEDIR\.ssh\config" | tee -a "$LOGFILE"
  chmod 755 "$HOMEDIR\.ssh" | tee -a "$LOGFILE"

  echo "Done."
fi

