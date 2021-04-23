#!/usr/local/bin/perl
# 
# $Header: install/tools/deinstall/deinstall.pl.pp /main/74 2018/04/01 05:23:43 rtattuku Exp $
#
# deinstall.pl
# 
# Copyright (c) 2009, 2018, Oracle and/or its affiliates. All rights reserved.
#
#    NAME
#      deinstall.pl - <one-line expansion of the name>
#
#    DESCRIPTION
#      <short description of component this file declares/defines>
#
#    NOTES
#      <other useful comments, qualifications, etc.>
#
#    MODIFIED   (MM/DD/YY)
#    ambagraw    02/07/18 - Bug 27411182
#    vesegu      01/19/18 - LIB RENAME19
#    vesegu      01/19/18 - LIB RNM19
#    poosrini    12/18/17 - use LIBMAJORVSN in place of DB_VERSION_FIRST_DIGIT
#    rtattuku    06/12/17 - Library version change from 12 to 18
#    lorajan     02/14/17 - Passing -bootstrap to do bootstrapping during the
#                           giclean
#    supalava    07/12/16 - Bug 23747519 fix - Return exitcode from java
#                           process.
#    ambagraw    05/11/16 - setting LD_LIBRARY_PATH_64 for Solaris
#    supalava    03/23/16 - Bug 21695190 fix - Add RATFA.jar in classpath
#    supalava    09/07/15 - lrg 18419953 fix - delete perl folder in
#                           deinstall.pl to handle siha/crs silent deinstall.
#    supalava    08/10/15 - Bug 21603568 fix.
#    ambagraw    07/29/15 - Bug 21485879 : Removing PERL Directory from
#                           deinstall BOOTSTRAP area
#    ambagraw    07/08/15 - Windows specific issue: Preventing Perl folder to
#                           delete during deinstall phase(Bug# 21269102)
#    ambagraw    06/30/15 - Persisting response folder under BOOTSTRAP_DIR
#                           after deinstall in all the scenarios (Bug# 21117406)
#    haagrawa    05/22/15 - changing method call of deleteTempFromLocal() 
#			    (Lrg 15955046)
#    supalava    05/05/15 - Add cli option to skip home deletion.
#    davjimen    04/29/15 - wait for a key press in windows when showing help
#    haagrawa    03/10/15 - deleting /tmp/deinstall folder from local node
#                           (Bug# 18250031)
#    haagrawa    02/02/15 - making timestamp consistent with netdc timestamp
#                           (bug# 19557154)
#    supalava    10/13/14 - Bug 19811461 fix - Allow -X java options
#    haagrawa    05/11/14 - Fix Bug# 18709440
#    supalava    03/13/14 - Skip deconfig jvm call from rootdeinstall.
#    ntarale     03/04/14 - fix for Bug-18219019.
#    haagrawa    02/24/14 - fix for bug# 18294850
#    supalava    02/03/14 - Bug 18073728 fix. DC tool version and home version
#                           should be same.
#    supalava    01/16/14 - Add remote debug option.
#    supalava    01/09/14 - Bug 17856190 fix.Delete srvmhas.jar from
#                           scratchpath before deinstall clean phase.
#    supalava    12/10/13 - Bug 17931467 fix - handle unset SRVM_TRACE condition
#    davjimen    11/20/13 - rollback bug 14410504 fix, make -home mandatory on
#                           shiphome deinstall
#    haagrawa    11/08/13 - disabling auto abbreviation(fix for bug# 17654463)
#    haagrawa    10/21/13 - moddifying -help option message,bug# 17629465
#    supalava    09/30/13 - Bug 17499791 fix. Save default response file.
#    davjimen    08/26/13 - add support to pass java options to jvm
#    davjimen    08/30/12 - do not error out if -home was not passed but -paramfile
#                           was passed, as it may contain the ORACLE_HOME
#    shiremat    07/26/12 - unsetting ORACLE_HOME and ORACLE_BASE env variables
#                           in case if they are set by user
#    shiremat    07/11/12 - adding ext/lib to LD_LIB_PATH
#    gramamur    06/06/12 - Updating the install libraries in the classpath from install/jlib
#    gramamur    05/23/12 - Updating the install libraries required for detecting
#                           rim and auto nodes
#    gramamur    04/05/12 - Hiding the flag cleanupOBase from help and
#                           supporting the flag cleanupOracleBase also as
#                           undocumented feature
#    gramamur    04/03/12 - Refactoring the main class 
#                           from clusterDeconfig to Deinstall
#    huliliu     06/02/11 - add -cleanupOBase option
#    huliliu     05/23/11 - special handle for -help options bug 12552180
#    vkoganol    05/08/11 - Correcting script name in error message
#    huliliu     05/01/11 - only remove OH and OB from env for Windows, not for
#                           all the platforms -bug 12415406
#    huliliu     04/27/11 - for windows system, do not do setLdLibraryPath()
#                           -bug 12387663
#    vkoganol    04/18/11 - XbranchMerge
#                           vkoganol_correct_ld_lib_path_for_linux64_in_deinstall_pl
#                           from st_install_11.2.0
#    bkghosh     04/08/11 - In 12g ldapjclnt11.jar has got renamed to
#                           ldapjclnt12.jar. Renaming ldapjclnt11.jar to
#                           ldapjclnt12.jar for the classpath
#    bkghosh     03/08/11 - Fix for bug#11811102..Updating the classpath
#    vkoganol    03/02/11 - setting LD_LIBRARY_PATH to oui/lib/linux64 for
#                           linux64 inline with OUI changes
#    bkghosh     02/21/11 - XbranchMerge bkghosh_bug-9509840_2_main from main
#    bkghosh     02/13/11 - Adding orai18n-mapping to classpath
#    bkghosh     01/26/11 - XbranchMerge bkghosh_bug-11687496 from
#                           st_install_11.2.0
#    bkghosh     01/26/11 - Fix for bug-11687496
#    bkghosh     01/18/11 - XbranchMerge bkghosh_bug-9871334 from
#                           st_install_11.2.0
#    bkghosh     01/18/11 - XbranchMerge bkghosh_bug-10089962 from
#                           st_install_11.2.0
#    bkghosh     01/17/11 - Fix for bug#9871334
#    bkghosh     01/17/11 - Fix for bug # 10089962
#    vkoganol    12/15/10 - XbranchMerge vkoganol_bug-9952954 from
#                           st_install_11.2.0
#    vkoganol    12/10/10 - Adding support for command line opion to provide log
#                           directory
#    ssampath    08/26/10 - XbranchMerge ssampath_bug-10035934 from
#                           st_install_11.2.0
#    ssampath    07/14/10 - Fix for lrg 4771029
#    ssampath    06/04/10 - Fix for bug 9470771.
#    prsubram    12/09/09 - XbranchMerge prsubram_bug-9106829 from main
#    ssampath    03/01/10 - XbranchMerge ssampath_bug-9257960 from
#                           st_install_11.2.0.1.0
#    ssampath    01/18/10 - Decouple bootstrapping logic to bootstrap.pl
#    mwidjaja    01/14/10 - XbranchMerge mwidjaja_bug-9269768 from
#                           st_install_11.2.0.1.0
#    mwidjaja    01/14/10 - Fix help message for params
#    ssampath    01/11/10 - XbranchMerge ssampath_bug-9265533 from
#                           st_install_11.2.0.1.0
#    ssampath    01/10/10 - Add -DBOOTSTRAP_DIR to java command
#    prsubram    01/08/10 - Removing the hardcoded string in the usage() method
#    prsubram    01/07/10 - Correcting the help msg for windows
#    prsubram    12/08/09 - Removing setting of OH as an env var
#    prsubram    10/19/09 - XbranchMerge prsubram_bug-9002203 from
#                           st_install_11.2.0.1.0
#    prsubram    10/15/09 - Adding OCM deconfig jar to classpath
#    ssampath    08/24/09 - XbranchMerge ssampath_cleanup_deinstall_scripts
#                           from main
#    ssampath    08/20/09 - Comment debug statements
#    dchriste    03/12/09 - New deinstall perl script to generically replace 
#                           both deinstall script and deinstall.bat 
#    dchriste    03/12/09 - Creation 
# 

use Cwd;
use File::Basename;
use File::Path;
use File::Copy;
use File::Find;
use Getopt::Long;

$isWindows = ($^O =~ /.*MSWin.*/) ? 1 : 0;
$notRecommendedMessage = "It is not recommended to run the script directly.  Execute deinstall or deinstall.bat which executes this script with the right set of arguments\n";

$helpflag = shift;
$homeVersion = shift;
my $javaOptions;

if($helpflag)
{
usage(0);
}

if($homeVersion eq "")
{
   print "Deinstall tool version is one of the required arguments for this perl script. $notRecommendedMessage";
   exit 1;
}

$tmp = shift;
if($tmp eq "")
{
   print "Temporary directory is one of the required arguments for this perl script. $notRecommendedMessage";
   exit 1;
}

$bootstrapDir = shift;
if($bootstrapDir eq "")
{
   print "The deinstall tool standalone or bootstrapped directory is one of the required arguments for this perl script. $notRecommendedMessage";
   print "$notRecommendedMessage";
   exit 1;
}

if(!$isWindows) {
   $archFlag = shift;
   if($archFlag ne "-d64")
   {
      $archFlag = "";
   }
}

if($homeVersion) {
   $ORACLE_HOME = shift @ARGV;
   if($ORACLE_HOME eq "")
   {
      print "The Oracle home directory is one of the required arguments for this perl script. $notRecommendedMessage";
      exit 1;
   }
}

$CHMOD = exists($ENV{CHMOD}) ? $ENV{CHMOD} : '/bin/chmod';
$ID = exists($ENV{ID}) ? $ENV{ID} : '/usr/bin/id';
if ($^O =~ /.*AIX.*/i) {
	$LSL = exists($ENV{LSL}) ? $ENV{LSL} : '/bin/ls -lX';
} else {
        $LSL = exists($ENV{LSL}) ? $ENV{LSL} : '/bin/ls -l';
}

if ($isWindows)  {
 	$dirSep = '\\';
 	$pathSep = ';';
	if($homeVersion) {
		$ENV{PATH}=$bootstrapDir.$dirSep.'bin;'.'C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem';
	} else {
		#If its not home version then we need to take care of adding ext\bin also in path.
		$ENV{PATH}=$bootstrapDir.$dirSep.'bin;'.$bootstrapDir.$dirSep.'ext'.$dirSep.'bin;'.'C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem';
	}

} else {
 	$dirSep = '/';
 	$pathSep = ':';
}
# Check if this script is run as root on Linux.  If so, then error out.
# This is fix for bug 5024086.
if (! $isWindows) {
	my $id = `$ID`;
	$id =~ /.*?\((\w+)\).*/;
	$user = $1;
	#print "\n\$user = $user\n";
	if ($user eq 'root') {
		print "\nERROR: You must not be logged in as root to run the deinstall tool.\n";
		print "       Log in as Oracle user and rerun the deinstall tool.\n";
		exit 1;
	}
}

$cmdLineArgs = parseArgs();

#foreach $key (keys %$cmdLineArgs) {
	#print " $key";
	#if (defined $cmdLineArgs->{$key}) {
		#print " ", $cmdLineArgs->{$key};
	#}
#}

#Different error conditions

$EMPTY_JRE_LOC = 1; 
$INCORRECT_JRE_LOC = 2;
$INCORRECT_JRE_VER = 3;
$MISSING_JRE_ARG = 4;
$ROOT_USER = 5;
$MISSING_OH_LOC = 6;
$OH_LOC_EMPTY = 7;
$NOT_VALID_DIR_OH = 8;
$toolArgs = '';

# Default -help option to false
$userHelp = 0; # DJC appears not to be used

if ($homeVersion) {
	if (exists($cmdLineArgs->{home})) {
		print "\nERROR: -home must not be set for a deinstall running from within an ORACLE_HOME.\n";
		print "       Deinstall of the current home is assumed.\n";
		exit 1;
	} else {
		$cmdLineArgs->{home} = $ORACLE_HOME;
	}

	if (exists($cmdLineArgs->{help})) 
	{
	   usage(0);
        }
	$jreHome = $bootstrapDir.$dirSep."jdk".$dirSep."jre";
} else {
	if (!exists($cmdLineArgs->{home})) {
		# bug 17809862 - make -home mandatory on shiphome deinstall, 
		# commenting out following code as it introduces bugs.
			# if paramfile is passed it could contain the ORACLE_HOME, before
			# error out, check if paramfile parameter was not passed.
			#if(!exists($cmdLineArgs->{paramfile})) {
		print "\nTool is being run outside the Oracle Home, -home needs to be set.\n";
		usage($MISSING_OH_LOC);
	}
	if ( -d $bootstrapDir.$dirSep."jdk"..$dirSep."jre" ){
		$jreHome = $bootstrapDir.$dirSep."jdk".$dirSep."jre";
	}
	else{
		$jreHome = $bootstrapDir.$dirSep."jre";
	}
	processArgs();
}

$perlHome = $bootstrapDir.$dirSep.'perl';

# Remove -tmpdir before setting up toolArgs which gets passed onto Java code
delete($cmdLineArgs->{tmpdir});

#Enable Java Remote Debug Option
$debugString = '';
$debugPort = '';
$DEFAULT_DEBUG_PORT = '8001';
if (exists($cmdLineArgs->{'remotedebug'})) {
    if (exists($cmdLineArgs->{'remotedebugport'})) {
	$debugPort = $cmdLineArgs->{'remotedebugport'};
    } else {
	$debugPort = $DEFAULT_DEBUG_PORT;
    }
    $debugString = " -Xdebug -Xrunjdwp:transport=dt_socket,address=".$debugPort.",server=y,suspend=y ";
}

#Remove -remotedebug -remotedebugport before setting up toolArgs which gets passed onto Java code
if (exists($cmdLineArgs->{'remotedebug'})){
    delete($cmdLineArgs->{remotedebug});
}
if (exists($cmdLineArgs->{'remotedebugport'})){
    delete($cmdLineArgs->{remotedebugport});
}

foreach $key (keys %$cmdLineArgs) {
    $toolArgs .= '-'. $key . ' ';
    if ($cmdLineArgs->{$key}) {
        $toolArgs .= $cmdLineArgs->{$key} . ' ';
    }
} 

#print "\n\$toolArgs = $toolArgs\n";
#print "\n\$bootstrapDir = $bootstrapDir\n";
$ouiDir = $bootstrapDir.$dirSep."oui".$dirSep."jlib";
$jlibDir = $bootstrapDir.$dirSep."jlib";
$instJlibDir = $bootstrapDir.$dirSep."install".$dirSep."jlib";
$libDir = $bootstrapDir.$dirSep."lib".$dirSep."linux";
$binDir = $bootstrapDir.$dirSep."bin";
$templateDir = $bootstrapDir.$dirSep."templates";
$deinstallDir = $bootstrapDir;
$deinstallJlib = $deinstallDir.$dirSep."jlib";
$extjlibDir = $bootstrapDir.$dirSep."ext".$dirSep."jlib";
$tfajlibDir = $bootstrapDir.$dirSep."suptools".$dirSep."tfa".$dirSep."release".$dirSep."tfa_home".$dirSep."jlib";

# unset ORACLE_HOME and ORACLE_BASE env variables if they
# are set so as to resolve the issue in bug 14266135.

#Renaming .dbls to .dlls and making them available in deinstall\bin path
processRequiredBootStrapFiles ();

# Check that user running this script is owner of Oracle Home.
$homeInventory = $ORACLE_HOME.$dirSep.'inventory';
if (! $isWindows) {
        my $id = `$ID`;
        $id =~ /.*?\((\w+)\).*/;
        $user = $1;
	#print "\n\$user = $user\n";
	if (-d $ORACLE_HOME) {
		if (-d $homeInventory) {
			my @lsCmdOutput = `$LSL $ORACLE_HOME/`;
			my $inventoryOwner;
			foreach $lineOut (@lsCmdOutput) {
				chomp($lineOut);
				$lineOut =~ s/^\s+//;
				$lineOut =~ s/\s+$//;
				if ($lineOut =~ /.+?\s+[0-9]+\s+(.+?)\s+.*inventory/) {
					$inventoryOwner = $1;
					#print "owner = $inventoryOwner\n";
				}
			}
			if ($user ne $inventoryOwner) {
				print "You must be the owner of this Oracle Home to deinstall/deconfigure it.\n";
				exit 1;
			}
		} else {
			print "The home inventory does not exist on this Oracle Home: $ORACLE_HOME\n";
			print "Please create '$homeInventory' as original user and rerun this script.\n";
			exit 1;
		}
	} else {
		# bug 17809862 - make -home mandatory on shiphome deinstall,
		# commenting out following code as it introduces bugs.
			# if paramfile is passed it could contain the ORACLE_HOME, before
			# error out, check if paramfile parameter was not passed.
			#if(!exists($cmdLineArgs->{paramfile})) {
		print "The Oracle Home '$ORACLE_HOME' does not exist.\n";
		print "Please re-create the Oracle Home as original user and rerun this script.\n";
		exit 1;
	}
}
$perlBin = $perlHome.$dirSep.'bin';
$perlLib = $perlHome.$dirSep.'lib';
#$ENV{ORACLE_HOME} = $ORACLE_HOME;
#print "\nORACLE_HOME environment variable set to $ORACLE_HOME\n";
$oracleBin = $ORACLE_HOME.$dirSep.'bin'.$dirSep.'oracle';
if (-f $oracleBin) {
	$noOracleBin = 'false';
} else {
	$noOracleBin = 'true';
}
#print "\n\$noOracleBin = $noOracleBin\n";

setClassPath();
if (! $isWindows){
   setLdLibraryPath();
}
# set SRVM tracing
#Fix for bug 17931467 - Unsetting SRVM_TRACE should not enable SRVM_TRACING
$trace = '';
if (defined($ENV{SRVM_TRACE})) {
    if ($ENV{SRVM_TRACE} ne '') {
        $trace = '-DTRACING.ENABLED=true -DTRACING.LEVEL=2';
    }	
}

$logdir='';
if (exists($cmdLineArgs->{'logdir'})) {
  if ($cmdLineArgs->{'logdir'}) {
    $logdir = $cmdLineArgs->{'logdir'};
  } 
}

$timeStamp=processTimeStamp();
setEnv();


#run the tool
#$toolCmd = $jreHome.$dirSep.'bin'.$dirSep.'java -DNOHOME='.$noOracleBin.' -Dpid='.$$.' -Doracle.installer.jre_loc='.$jreHome.' -DHOME_OPT='.$homeOpt.' -Doracle.installer.oui_loc='.$bootstrapDir.$dirSep.'oui '.$trace.' -classpath '.$classPath.' oracle.install.db.deinstall.wrapper.Deinstall '.$toolArgs;


if (!exists($cmdLineArgs->{giclean})){
    $toolCmd = $jreHome.$dirSep.'bin'.$dirSep.'java '.$archFlag.$debugString." @javaOptions -DNOHOME=".$noOracleBin.' -Dpid='.$$.' -Doracle.installer.jre_loc='.$jreHome.' -DLOGDIR='.$logdir.' -Djava.io.tmpdir='.$tmp.' -DBOOTSTRAP_DIR='.$bootstrapDir.' -DUSER='.$user.' -DHOME_OPT='.(($homeVersion) ? 0 : 1).' -Doracle.installer.oui_loc='.$bootstrapDir.$dirSep.'oui '.$trace.' -Doracle.installer.timeStamp='.$timeStamp.' -classpath '.$classPath.'  oracle.install.db.deinstall.wrapper.Deinstall -deConfig '.$toolArgs;
#print "\n\$toolCmd = $toolCmd\n";

chdir($tmp);
system($toolCmd);
}

$deinstallArgs=' -silent -paramfile '.$bootstrapDir.$dirSep.'response'.$dirSep.'deinstall_'.$timeStamp.'.rsp ';

$toolCmd = $jreHome.$dirSep.'bin'.$dirSep.'java '.$archFlag.$debugString." @javaOptions -DNOHOME=".$noOracleBin.' -Dpid='.$$.' -Doracle.installer.jre_loc='.$jreHome.' -DLOGDIR='.$logdir.' -Djava.io.tmpdir='.$tmp.' -DBOOTSTRAP_DIR='.$bootstrapDir.' -DUSER='.$user.' -DHOME_OPT='.(($homeVersion) ? 0 : 1).' -Doracle.installer.oui_loc='.$bootstrapDir.$dirSep.'oui '.$trace.' -Doracle.installer.timeStamp='.$timeStamp.' -classpath '.$classPath.' oracle.install.db.deinstall.wrapper.Deinstall '.$deinstallArgs.$toolArgs;
#print "\n\$toolCmd = $toolCmd\n";

   if ($? == 0) {

my $b_callDeinstall=0;

# The second oui, install deinstall logic will only be called 
# if the exit code of previous deconfig was successful. And
# if user is not running deinstall tool in -config mode.

# For silent crs deinstall on unix platforms we don't need to 
# call deinstall again as rootdeinstall.sh takes care of calling
# it again./scratch/12.1.0/grid/crs3

if (! $isWindows)
{
	if (-d $ORACLE_HOME.$dirSep."inventory".$dirSep."Components21".$dirSep."oracle.crs")
	{
		if (exists($cmdLineArgs->{silent}))
		{
			$b_callDeinstall=1;
		}

	}

}

if (exists($cmdLineArgs->{checkonly}))
{
	$b_callDeinstall=1;
	deleteTempFromLocal();

}

	if ($b_callDeinstall == 1) {
	 #printf "\nSkipping second sys call";
	} else {
		#Fix for bug 17856190. Remove srvmhas.jar from the classpath
		$srvmhasjar = $jlibDir.$dirSep.'srvmhas.jar';
		unlink($srvmhasjar);

		system($toolCmd);
		if(!exists($cmdLineArgs->{bootstrap})){
			deleteTempFromLocal();
		}
	}
  } else {
       # printf "child exited with value %d\n", $? >> 8;
	deleteTempFromLocal();
  }

exit ($? >> 8);

############################################################################################## End of main logic - Beginning subroutine section ##############################

sub usage {
	my $exitStatus = shift;
	if($exitStatus !~ /^-?\d/) {
	   $exitStatus = 0;
	}
	my $ext = sh;
	if ($isWindows)  {
	$ext = "bat";
        } 
	($cmdName, $dirs, $suffix)  = fileparse($0, qr/\.[^.]*/);
	if ($homeVersion) {
		print "\n$cmdName\n";
	} else {
		print "\n$cmdName -home <Complete path of Oracle home>\n";
	}
	print "               [ -silent <-checkonly | -paramfile <complete path of input parameter properties file>> ]\n";
	print "               [ -checkonly ]\n";
	print "               [ -local ]\n";
	print "               [ -paramfile <complete path of input parameter properties file> ]\n";
	print "               [ -params <name1=value[ name2=value name3=value ...]> ]\n";
	print "               [ -o <complete path of directory for saving files> ]\n";
	print "               [ -tmpdir <complete path of temporary directory to use> ]\n";
        print "               [ -logdir <complete path of log directory to use> ]\n";
	print "               [ -skipLocalHomeDeletion : To retain the oracle home on local node. Supported only for GI or SIHA Home. ]\n";
	print "               [ -skipRemoteHomeDeletion : To retain the oracle home on remote node(s). Supported only for GI or SIHA Home. ]\n"; 	
	print "               [ -help : Display this help message. ]\n";
	
	# bug 19479809 - wait for the user to press enter if its shiphome version, windows
	# and the silent flag has not been set.  
	if(!$homeVersion && $isWindows && !exists($cmdLineArgs->{silent})) {
		# check the args from ARGV in case the parseArgs function has not yet been called
		my $isSilent=0; # set as false
		foreach(@ARGV) {
			if(uc($_) eq uc("-silent")) {
				$isSilent=1; # set as true
				last;
			}
		}
		if(!$isSilent) {
			print "Please press Enter to exit ...";
			<STDIN>;
		}
	}
	
	exit $exitStatus;
}

sub parseArgs() {
   #adding following as a fix for Bug# 18709440 
   my %knownOptions = (
      "-paramfile" => "<complete path of input parameter properties file>",
      "-params" => "<name1=value[ name2=value name3=value ...]>",
      "-o" => "<complete path of directory for saving files>",
      "-tmpdir" => "<complete path of temporary directory to use>",
      "-logdir" => "<complete path of log directory to use>"
   ); 

   my %toolOptions;
   my $param = "";
   # set property to pass unknown options to @ARGV
   # fix for bug# 17654463,disabling auto abbreviation 
   Getopt::Long::Configure('no_auto_abbrev','pass_through');
   GetOptions( \%toolOptions,
                'home=s',
                'silent',
                'checkonly',
			'deConfig',
                'cleanupOBase',
                'cleanupOracleBase',
                'local',
                'giclean',
		'bootstrap',
                'paramfile=s',
                'params=s{1,}' => \@paramsArr,
                'o=s',
                'tmpdir=s',
		'logdir=s',
                'remotedebug',
		'remotedebugport=s',
		'ignoreVersionCheck',
		'skipLocalHomeDeletion',
		'skipRemoteHomeDeletion',
                'help' => \&usage) || exit(1);

   # bug 17343907 - deinstall should support passing java options to JVM
   # verify that the unknown options in @ARGV are java system properties
   # they should begin with "-D"
   $javaOptionsSize = @ARGV;
   for($count = 0; $count < $javaOptionsSize; $count++) {
      $javaOption = $ARGV[$count];
      if(substr($javaOption, 0, 2) eq "-D" || substr($javaOption, 0, 2) eq "-X"){
         push(@javaOptions, $javaOption);
      } else {
             # checks if the option exists in our knownOptions hashmap (lc is to convert to lowercase)(Bug# 18709440)
             if(exists $knownOptions{lc $javaOption}) {
               print "The option ", lc($javaOption), " requires: $knownOptions{lc $javaOption}\n";
               exit(1);
             } else {
       	        print("Unknown option: $javaOption\n");
       	        usage(0);
       	        exit(1);
       	     }
      }
   }
   
   if ( @paramsArr > 0 )
   {
	  #On Windows the params that are passed with -params needs to be enclosed in double quotes
	  #taking care of enclosing it in double quotes.
	  if ($isWindows) {
		   @paramsArr = map {qq|"$_"|} @paramsArr;
	  }

      $toolOptions{params} = join(" ",@paramsArr);
   }

   return \%toolOptions;
}

sub processArgs() {
	if (exists($cmdLineArgs->{help})) {
	   usage(0);
	}
	

	#Validation for logdir path provided through command line
        if(exists($cmdLineArgs->{'logdir'})){
	  $logdir=$cmdLineArgs->{'logdir'};
          unless($logdir)
          {
	    print "\nInvalid log directory path\n";
	    exit 1;
	  }
	  if(!-e $logdir)
	  {
	    mkdir $logdir  or die "\nCan't create directory : ".$logdir."\n";
	  }
	  else
	  {
	    if(!-d $logdir)
	    {
	      print "\nPath provided for log directory is not a directory\n";
              exit 1; 
	    }
	    else
	    {
	      if(!-w $logdir)
	      {
	        print "\nLog directory is not writable\n";
		exit 1;
	      }
	    }
	  }
	}

	if (exists($cmdLineArgs->{home})) {
		if ($cmdLineArgs->{home}) {
			$ORACLE_HOME = $cmdLineArgs->{home};
		} else {
			print "\nSpecify the complete path of the Oracle home you want to remove.\n";
			usage($MISSING_OH_LOC);
		}
	}
	unless (-d $ORACLE_HOME) {
		if (-f $ORACLE_HOME || -l $ORACLE_HOME) {
			print "\nThe path specified for Oracle_Home $ORACLE_HOME is not a valid directory. Make sure to specify a valid Oracle home path.\n";
			usage($NOT_VALID_DIR_OH);
		} else {
			# bug 17809862 - make -home mandatory on shiphome deinstall, 
			# commenting out following code as it introduces bugs
				# if paramfile is passed it could contain the ORACLE_HOME, before
				# error out, check if paramfile parameter was not passed.
				#if(!exists($cmdLineArgs->{paramfile})) {
			print "\nThe path specified for Oracle_Home $ORACLE_HOME does not exist. In order to proceed, create an empty Oracle home directory and rerun the tool.\n";
			usage($OH_LOC_EMPTY);
		}
	}
	#print "\n\$ORACLE_HOME = $ORACLE_HOME\n";
}

sub setEnv() {
	$ENV{ORACLE_HOME}=$ORACLE_HOME;
	#$ENV{ORACLE_BASE}=$ORACLE_BASE;
}

sub setLdLibraryPath() {
	#print "...before LD_LIBRARY_PATH = ", $ENV{LD_LIBRARY_PATH},"\n";
         $LD_LIBRARY_PATH = $libDir.$pathSep.$bootstrapDir.$dirSep.'ext'.$dirSep.'lib'.$pathSep.$bootstrapDir.$dirSep.'lib'.$pathSep.$bootstrapDir.$dirSep.'oui'.$dirSep.'lib'.$dirSep;
        if ($^O =~ /.*SunOS.*/) {
                $LD_LIBRARY_PATH .= 'solaris';
        } elsif ($^O =~ /.*HPUX.*/i) {
                $LD_LIBRARY_PATH .= 'hpunix';
        } elsif ($^O =~ /.*AIX.*/i) {
                $LD_LIBRARY_PATH .= 'aix';
        } else {
		$GETCONF = exists($ENV{GETCONF}) ? $ENV{GETCONF} : '/usr/bin/getconf';
                if (`$GETCONF LONG_BIT` =~ '64') {
                        $LD_LIBRARY_PATH .= 'linux64';
                }
                else {
                        $LD_LIBRARY_PATH .= 'linux';
                }
        }
	$LD_LIBRARY_PATH .= $pathSep.$bootstrapDir.$dirSep.'bin';

	$LD_LIBRARY_PATH .= $pathSep.$ENV{LD_LIBRARY_PATH} if (exists($ENV{LD_LIBRARY_PATH}));
	$ENV{LD_LIBRARY_PATH} = $LD_LIBRARY_PATH;
	#print "...after LD_LIBRARY_PATH = ", $ENV{LD_LIBRARY_PATH},"\n";

	# Apart from LD_LIBRARY_PATH, LIBPATH (on AIX) and SHLIB_PATH (On HP-UX)
	# need to be set
        if ($^O =~ /.*HPUX.*/i) {
           $SHLIB_PATH = $LD_LIBRARY_PATH;
           $SHLIB_PATH .= $pathSep.$ENV{SHLIB_PATH} if (exists($ENV{SHLIB_PATH}));
           $ENV{SHLIB_PATH} = $SHLIB_PATH;
	}

        if ($^O =~ /.*AIX.*/i) {
           $LIBPATH = $LD_LIBRARY_PATH;
           $LIBPATH .= $pathSep.$ENV{LIBPATH} if (exists($ENV{LIBPATH}));
           $ENV{LIBPATH} = $LIBPATH;
	}

        if ( $^O =~ /.*SunOS.*/){
           $ENV{LD_LIBRARY_PATH_64} = $LD_LIBRARY_PATH;
        }
}

# Renaming .dbls and _ee files to .dlls before starting deinstall.
sub processRequiredBootStrapFiles () {
	$ohBin = $ORACLE_HOME.$dirSep.'bin';
	$deinstallBin = $deinstallDir.$dirSep.'bin';
	if ($isWindows)  {
	
	#Copying oci.dll files 	
	if (-e $ohBin.$dirSep.'oci.dll') {
           system("copy $ohBin\\oci.dll $deinstallBin");
      }
	elsif (-e $ohBin.$dirSep.'oci.dll.dbl') {
           system("copy $ohBin\\oci.dll.dbl $deinstallBin\\oci.dll");
      }
      elsif (-e $deinstallBin.$dirSep.'oci.dll.dbl') {
           system("copy $deinstallBin\\oci.dll.dbl $deinstallBin\\oci.dll");
      }
     
	#Copying oravsn dll files
	if (-e $ohBin.$dirSep.'oravsn19.dll') {
           system("copy $ohBin\\oravsn19.dll $deinstallBin");
      }
	elsif (-e $ohBin.$dirSep.'oravsn19_ee.dll.dbl') {
           system("copy $ohBin\\oravsn19_ee.dll.dbl $deinstallBin\\oravsn19.dll");
      }
      elsif (-e $deinstallBin.$dirSep.'oravsn19_ee.dll.dbl') {
           system("copy $deinstallBin\\oravsn19_ee.dll.dbl $deinstallBin\\oravsn19.dll");
      }

	#Copying ORANCRYPT dll
	if (-e $ohBin.$dirSep.'ORANCRYPT19.dll') {
           system("copy $ohBin\\ORANCRYPT19.dll $deinstallBin");
      }
	elsif (-e $ohBin.$dirSep.'ORANCRYPT19D.dll') {
           system("copy $ohBin\\ORANCRYPT19D.dll $deinstallBin\\ORANCRYPT19.dll");
      }
      elsif (-e $deinstallBin.$dirSep.'ORANCRYPT19D.dll') {
           system("copy $deinstallBin\\ORANCRYPT19D.dll $deinstallBin\\ORANCRYPT19.dll");
      }


	}
}

sub setClassPath() {
	# component specific deconfig JARs
	$toolJar = 'deinstall_wrapper.jar';
	$installDeconfigJar = 'deinstall_core.jar';
        $instJar = $instJlibDir.$dirSep.'instcommon.jar';
        $instCommonJar = $instJlibDir.$dirSep.'installcommons_1.0.0b.jar';
	$xmlParserJar = 'xmlparserv2.jar';
	$crsDeconfigJar = $jlibDir.$dirSep.'crsdc.jar';
	$ouiDeconfigJar = $ouiDir.$dirSep.'OraInstaller.jar';
	$ouiCheckpointJar = $ouiDir.$dirSep.'OraCheckPoint.jar';
    	$ocmDeconfigJar = $jlibDir.$dirSep.'deconfigCCR.jar';
	$tfaJar = $tfajlibDir.$dirSep."RATFA.jar";

	# other JARs for components
	$ouiPrereqJar = $ouiDir.$dirSep.'OraPrereq.jar';
	$ouiPrereqChecksJar = $ouiDir.$dirSep.'OraPrereqChecks.jar';
	$shareJar = $ouiDir.$dirSep.'share.jar';
	$ewtJar = $jlibDir.$dirSep.'ewt3.jar';
	$helpJar = $jlibDir.$dirSep.'help4.jar';

	# Dependent JARs for components
	$srvmJar = $jlibDir.$dirSep.'srvm.jar';
	$srvmHasJar = $jlibDir.$dirSep.'srvmhas.jar';
	$srvmAsmJar = $jlibDir.$dirSep.'srvmasm.jar';
	$vipCaJar = $jlibDir.$dirSep.'vipca.jar';
	$cvuJar = $jlibDir.$dirSep.'cvu.jar';
	$netCaJar = $bootstrapDir.$dirSep.'assistants'.$dirSep.'netca'.$dirSep.'jlib'.$dirSep.'netca.jar';
	$netCamJar = $jlibDir.$dirSep.'netcam.jar';
	$netCfgJar = $jlibDir.$dirSep.'netcfg.jar';
	$ldapJar = $jlibDir.$dirSep.'ldapjclnt19.jar';
	$dbcaJar = $jlibDir.$dirSep.'dbca.jar';
	$dbuaJar = $jlibDir.$dirSep.'dbma.jar';
	$utilJar = $bootstrapDir.$dirSep.'assistants'.$dirSep.'jlib'.$dirSep.'assistantsCommon.jar';
	$emCoreJar = $jlibDir.$dirSep.'emCORE.jar';
	$emConfigJar = $jlibDir.$dirSep.'emConfigInstall.jar';
	$emCaJar = $jlibDir.$dirSep.'emca.jar';
	$httpClientJar = $ouiDir.$dirSep.'http_client.jar';
	$oraMappingJar = $ouiDir.$dirSep.'orai18n-mapping.jar';
	$ouisrvmJar = $ouiDir.$dirSep.'srvm.jar';
	$extcvuJar = $extjlibDir.$dirSep.'cvu.jar';


	
	# set the classpaths
	$toolClassPath = $deinstallJlib.$dirSep.$toolJar.$pathSep.$instJar.$pathSep.$instCommonJar;
	$installClassPath = $deinstallJlib.$dirSep.$installDeconfigJar;

	$xmlParserClassPath = $ouiDir.$dirSep.$xmlParserJar; # DJC - Not in the original windows .bat file
	$crsClassPath = $crsDeconfigJar.$pathSep.$vipCaJar.$pathSep.$cvuJar.$pathSep.$oraMappingJar;
	$commonDepClassPath = $srvmJar.$pathSep.$srvmHasJar;
	$ouiClassPath = $ouiDeconfigJar.$pathSep.$ouiCheckpointJar.$pathSep.$ouiPrereqJar.$pathSep.$shareJar.':'.$ewtJar.$pathSep.$helpJar.$pathSep.$xmlParserClassPath;
	$assistantsClassPath = $utilJar.$pathSep.$dbcaJar.$pathSep.$dbuaJar.$pathSep.$ouiPrereqChecksJar.$pathSep.$srvmAsmJar;
	$netCaClassPath = $netCaJar.$pathSep.$netCamJar.$pathSep.$netCfgJar.$pathSep.$ldapJar;
	$emCpClassPath = $srvmAsmJar.$pathSep.$xmlParserClassPath.$pathSep.$utilJar.$pathSep.$shareJar.$pathSep.$emConfigJar.$pathSep.$emCoreJar.$pathSep.$emCaJar.$pathSep.$httpClientJar;
    	$ocmClassPath = $ocmDeconfigJar;

	# main classpath
	$classPath = $toolClassPath.$pathSep.$crsClassPath.$pathSep.$commonDepClassPath.$pathSep.$installClassPath.$pathSep.$ouiClassPath.$pathSep.$assistantsClassPath.$pathSep.$netCaClassPath.$pathSep.$emCpClassPath.$pathSep.$ocmClassPath.$pathSep.$ouisrvmJar.$pathSep.$extcvuJar.$pathSep.$tfaJar;
	#print "\n... classPath = $classPath\n";
}


sub processTimeStamp() {
   my ($sec, $min, $hr, $mDay, $mon, $yr, $wDay, $yDay, $dst) = localtime;
   my $year = $yr + 1900;
   my $month = $mon + 1;
   my $seconds = ($hr * 60 * 60) + ($min * 60) + $sec;
   my $noonSeconds = (12 * 60 * 60);
   my $amPm = ($seconds > $noonSeconds) ? 'PM' : 'AM';
   my $hour = ($seconds > $noonSeconds) ? ($hr - 12) : $hr;
   #Bug# 19557154,timestamp format should be same as returning by API OiixUtilityOps.getSessionTimeStamp()
   #OiixUtilityOps.getSessionTimeStamp() API is using 12 hour format (not 24 hour format) and that too in 1 to 12 cycle whereas we are using 12 hour format but in 00- to 12 cycle.
   #  OiixUtilityOps.getSessionTimeStamp()	-	Our output
   #		12-1					0-1
   #		1-2 					1-2
   #		2-3					2-3
   #		3-4					3-4
   #		4-5					4-5
   #		5-6					5-6
   #		6-7					6-7
   #		7-8					7-8
   #		8-9					8-9
   #		9-10					9-10
   #		10-11					10-11
   #		11-12					11-0
   # Hence whenever $hour is 0,convert it to 12.
   if($hour == 0){
        $hour = 12;
   }
   my $dteTimeStamp = sprintf("%d-%02d-%02d_%02d-%02d-%02d-%s", $year, $month, $mDay, $hour, $min, $sec, $amPm);

	return $dteTimeStamp;
}

sub deleteTempFromLocal() {
   opendir ( DIR, $bootstrapDir ) || die "Error in opening dir $bootstrapDir\n";
   # This opendir will give all the list of all directories and files in $bootstrapDir including "." and ".." (So grep is used)
   my @files = grep { !/^\.\.?$/ }  readdir DIR;
   closedir DIR;
   $dir = $bootstrapDir;
	
   for my $f (@files){
                
    # The below check i.e. (Preventing perl folder to delete) is specific to Windows Platform
    # Because of Windows based platform architecture during deinstall it is holding a lock on perl folder and reports a error message 
                  
                 # Lrg 18419953 fix - in case of crs/siha silent deinstall only rootdeinstall.sh should remove perl dir   
                 if($isWindows){
		    if($f eq "perl"){
                       next;
                    }
                 } 

		if($f ne "response" and $f ne "logs"){        	
                 rmtree("$dir/$f");
        	}
    }
}
