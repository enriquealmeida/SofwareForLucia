#!../../perl/bin/perl
# 
# $Header: install/utl/clone/bin/clone.pl /main/38 2018/06/15 11:32:13 davjimen Exp $
#
# clone.pl
# 
# Copyright (c) 2004, 2018, Oracle and/or its affiliates. All rights reserved.
#
#    NAME
#      clone.pl - 
#
#    DESCRIPTION
#     Script that performs the cloning operation on the current home. This script should
#     be called at the target of the cloning operation. 
#
#    NOTES
#      <other useful comments, qualifications, etc.>
#
#    MODIFIED   (MM/DD/YY)
#    davjimen  06/15/18 - fix exit code from relaunch
#    davjimen  04/06/18 - unify common launch code
#    davjimen  10/13/17 - fix oracle home regex for windows
#    davjimen  10/02/17 - remove multiple slashes in a row for home path
#    ambagraw  10/20/16 - Bug 24654752: Unsetting ORA_CRS_HOME Environment
#                         variable
#    davjimen  08/30/16 - add the nocleanUpOnExit flag so that OUI keeps the
#                         logs on failure
#    lorajan   07/27/15 - Showing the clone's runInstaller command only if user
#                         passes debug flag
#    haagrawa  04/23/14 - setting oracle_home_user to built-in account(Bug#
#                         18423354)
#    lorajan   02/21/14 - Fix bug 18136660. For AIX if the clone process is in silent mode, default 
#                         response to rootpre.sh to 'y' and proceeding the cloning process
#    supalava  12/06/13 - Project 47201 - SYSRAC Changes.
#    pkuruvad  07/12/12 - change ORACLE_SERVICE_USER to ORACLE_HOME_USER
#    xiaofwan  06/07/12 - Fix bug 13828228 by switching to java to display the
#                         OUI's help
#    jaikrish  10/16/11 - Windows Security changes.
#    wyou      06/22/11 - modification for separation of duty project
#    gramamur  04/14/11 - Update the location of Installer's oraparam.ini
#    huliliu   03/15/11 - add validation on -O'"CLUSTER_NODE={node1,node2}'"
#                         format, -bug 11781857
#    pvallam   12/27/10 - XbranchMerge pvallam_bug-10094341_11203 from
#                         st_install_11.2.0
#    pvallam   12/03/10 - adding support for skiprootpre property
#    scravind  08/20/10 - XbranchMerge scravind_bug-10045398 from
#                         st_install_11.2.0
#    scravind  08/20/10 - Doing the changes to prompt for rootpre on
#                         solarisamd64 Vendor cluster for the bug 10045398
#    scravind  08/20/10 - XbranchMerge scravind_bug-10045398 from
#                         st_install_11.2.0
#    scravind  03/29/10 - XbranchMerge scravind_bug-9499881 from
#                         st_install_11.2.0.1.0
#    svaggu    08/02/09 - Fix for Bug 8339964
#    wyou      02/25/09 - use the relative path for shebang instead of using
#                         instantiation
#    xiaofwan  02/18/09 - Fix bug 8259748 by enabling -defaultHomeName
#    wyou      01/13/09 - change the header into instantiation
#    xiaofwan  11/12/07 - Combine clone.pl with db.clone.pl
#    xiaofwan  04/24/07 - Fix bug 6005641 by accepting ORACLE_BASE as a
#                         mandatory parameter
#    poosrini  12/11/06 - Added -nowait to OUI cmd line
#    rlemos    06/10/05 - Fix issue with validation checks 
#    rlemos    05/04/05 - Updates to create the targets.xml.tmp file 
#    rlemos    03/22/05 - rlemos_checkin_cloning_scripts
#    rlemos    03/22/05 - Creation
#
use strict;
use warnings;
use English qw(-no_match_vars); 
use File::Path;
use File::Spec::Functions;
use Cwd qw(realpath);
use Getopt::Long qw(:config pass_through);
package Config;

BEGIN {
	
	my $isWindows = ($^O =~ /.*MSWin.*/) ? 1 : 0;
	my $sep = $isWindows ? "\\" : "/";
	my $perlBinary = $isWindows ? "perl.exe" : "perl";
	my $root_directory = File::Spec->rel2abs(File::Basename::dirname ( $0 ));
	#print "root_directory: $root_directory\n";
	my $skipHomeCheckArg = "-skipHomeCheck";
	my $skipHomeCheck = 0;
	if(!$isWindows) {
		# Remove multiple slashes in a row from oracle home
		my $homeArgOld="";
		my $homeArgNew="";
		for my $arg (@ARGV) {
			if( $arg =~ /^(ORACLE_HOME=(.*))$/ ) {
				$homeArgOld = $1;
				my $homePath = $2;
				$homePath =~ s/[\/]+/\//g;
				$homeArgNew = "ORACLE_HOME=$homePath";
				last;
			}
		}
		s/^$homeArgOld$/$homeArgNew/g for @ARGV;
	}
	
	# Parse the args to get the ORACLE_HOME
	my $newOHArg = "";
	my $ORACLE_HOME = "";
	my @newArgs;
	for my $arg (@ARGV) {
		if( $arg =~ /^(ORACLE_HOME=(.*))$/ ) {
			$ORACLE_HOME = $2;
			push(@newArgs, $arg);
		} elsif ( $arg eq $skipHomeCheckArg) {
			$skipHomeCheck = 1;
		} else {
			push(@newArgs, $arg);
		}
	}

	# Following logic will compare the auto detected OH, and the OH provided in the command line.
	# In case the OH from the command line is not textually the same as the detected one, we will
	# relaunch the clone.pl using the OH from the command line. For this we also ensure that the
	# OH from the command line is the same directory as the auto detected OH.
	# Also, if the OH was not specified in the command line, we will relaunch the clone.pl and
	# append the OH argument to the command line.
	# Another possibility is that the clone.pl was not executed using the perl binary from this
	# OH, in such case, we will again relaunch the clone.pl using the perl from this OH.
	if (!$skipHomeCheck) {
		my $detectedOH = File::Spec->rel2abs(Cwd::realpath("$root_directory/../.."));
		#print "detectedOH: $detectedOH\n";
		my $relaunch = 0;
		if("$ORACLE_HOME" ne "") {
			# Case where the OH was specified in the command line
			if("$detectedOH" ne "$ORACLE_HOME") {
				# Case where the command line OH is not textually equals to the auto detected
				#print "ORACLE_HOME: $ORACLE_HOME\n";
				# Check if the OH from the cmdline and the detected OH are the same directory
				my $cmdOHAbs = File::Spec->rel2abs(Cwd::realpath($ORACLE_HOME));
				#print "cmdOHAbs: $cmdOHAbs\n";
				if("$detectedOH" ne "$cmdOHAbs") {
					print "The detected Oracle home $detectedOH is not the same as the provided Oracle home $ORACLE_HOME.\n";
					exit 1;
				}
				# We will relaunch the clone.pl using the OH from the command line
				$relaunch = 1;
				# Adding the -skipHomeCheck argument, so that this logic doesn't get into an infinite loop
				push(@newArgs, $skipHomeCheckArg);
			}
		} else {
			# Case where the OH was NOT specified in the command line
			$ORACLE_HOME = $detectedOH;
			$newOHArg = "ORACLE_HOME=$ORACLE_HOME";
			push(@newArgs, $newOHArg);
			# We will relaunch the clone.pl using the auto detected OH, and we also add it
			# into the command line arguments.
			$relaunch = 1;
			# Adding the -skipHomeCheck argument, so that this logic doesn't get into an infinite loop
			push(@newArgs, $skipHomeCheckArg);
		}

		my $homePerl = $ORACLE_HOME.$sep.'perl'.$sep.'bin'.$sep.$perlBinary;
		#print "homePerl: $homePerl\n";
		#print "currentPerl: $^X\n";

		# If relaunch has been enabled or if clone.pl was not executed with the perl from the home, reconstruct the clone
		# command using the perl from the home, the selected OH, and the new arguments.
		if($relaunch or ("$^X" ne "$homePerl")) {
			my $command = $homePerl." ".$ORACLE_HOME.$sep."clone".$sep."bin".$sep."clone.pl ".join(' ', @newArgs);
			my $exitCode = 0;
			if($isWindows) {
				open(WCMD, "$command |");
				while(<WCMD>) {
					print STDOUT $_;
				}
				close(WCMD);
				$exitCode=$?;
			} else {
				$exitCode=system($command);
			}
			# bug 28193620 - shift right exit code
			exit($exitCode >> 8);
		}
	}
	# Add the OH/perl/lib and OH/bin libraries
	push @INC, "$ORACLE_HOME/perl/lib";
	push @INC, "$ORACLE_HOME/bin";
}
use parent qw(CommonSetup);

sub new {
  my ($class) = @_;

  my $self = $class->SUPER::new(
    "TYPE" => "Clone",
    "PRODUCT_DESCRIPTION" => "Oracle software",
    "PRODUCT_JAR_NAME" => "instcommon.jar",
    "SETUP_SCRIPTS" => "clone/bin/clone.pl,clone\\bin\\clone.pl",
    "LOG_DIR_PREFIX" => "CloneActions",
    "MAIN_CLASS" => "oracle.install.ivw.common.util.OracleCloner",
  );
  bless $self, $class;
  return $self;
}

my $isWindows = ($^O =~ /.*MSWin.*/) ? 1 : 0;
my $sep = $isWindows ? "\\" : "/";

# Remove -skipHomeCheck arg and nowait arg
my $skipHomeCheckArg = "";
my $nowaitArg = "";
Getopt::Long::GetOptions('skipHomeCheck:s' => \$skipHomeCheckArg,
			 'nowait:s' => \$nowaitArg);

# Set the ORACLE_HOME
my $ORACLE_HOME="";
for my $arg (@ARGV) {
	if( $arg =~ /^(ORACLE_HOME=(.*))$/ ) {
		$ORACLE_HOME = $2;
		last;
	}
}
$ENV{ORACLE_HOME}=$ORACLE_HOME;

# Explicitly unsetting the following ENV variables
delete $ENV{'ORACLE_HOME_NAME'};
delete $ENV{'ORACLE_BASE'};
delete $ENV{'OSDBA_GROUP'};
delete $ENV{'OSOPER_GROUP'};
delete $ENV{'OSBACKUPDBA_GROUP'};
delete $ENV{'OSDGDBA_GROUP'};
delete $ENV{'OSKMDBA_GROUP'};
delete $ENV{'OSASM_GROUP'};
delete $ENV{'OSRACDBA_GROUP'};
delete $ENV{'ORA_CRS_HOME'};

# Update path environment variable
update_path_environment_variable($isWindows, $ORACLE_HOME);

my $config = new Config();

$config->main();

sub checkPatchActions() {
	# Nothing to do here
}

sub changeDestinationHome() {
	# Nothing to do here
}

sub createTempDirectory() {
	# Nothing to do here
}

sub setWizardCmd() {
	my $self = shift;
	my $mainClass = shift;
	my $javaCmd = $self->SUPER::setWizardCmd($self->{"MAIN_CLASS"});

	my @extraArgs = ("-clone", "-waitForCompletion", "-nocleanUpOnExit", "-silent");
	my @requiredExtraArgs;
	my @javaCmdArgs = split(/ /, $javaCmd);
	for my $extraArg (@extraArgs) {
		my $found = "false";
		for my $javaCmdArg (@javaCmdArgs) {
			if(lc("$extraArg") eq lc("$javaCmdArg")) {
				$found = "true";
				last;
			}
		}
		if("$found" eq "false") {
			push(@requiredExtraArgs, $extraArg);
		}
	}

	# java cmd to launch
	return $javaCmd." ".join(' ', @requiredExtraArgs);
}

#############################################################################
# NAME   : update_path_environment_variable
# PURPOSE: Updates the path environment variable
# INPUTS : NONE
# OUTPUTS: NONE
#
#############################################################################
sub update_path_environment_variable {
	my $isWindows = shift;
	my $oracleHome = shift;

	my $PATH=$ENV{'PATH'};
	my $newPath;
	if($isWindows) {
		$newPath = $oracleHome.'\\bin;'.$oracleHome.'\\oui\\lib\\win32;'.$oracleHome.'\\oui\\lib\\win64';
		if($PATH) {
			$newPath .= ';'.$PATH;
		}
	} else {
		$newPath = '/bin:/usr/bin:/usr/ccs/bin';
		if ($PATH){
			$newPath .= ':'.$PATH;
		}
	}
	$ENV{'PATH'} = $newPath;
}
