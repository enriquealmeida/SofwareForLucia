# $Header: opsm/cvutl/check_nodeadd.pl /main/8 2011/01/21 16:20:26 nvira Exp $
#
# check_nodeadd.pl
# 
# Copyright (c) 2010, 2011, Oracle and/or its affiliates. All rights reserved. 
#
#    NAME
#      check_nodeadd.pl - <one-line expansion of the name>
#
#    DESCRIPTION
#      check_nodeadd script to be used by EM
#
#    NOTES
#
#    MODIFIED   (MM/DD/YY)
#    nvira       01/19/11 - do nothing when -help is requested
#    agorla      11/23/10 - bug#10033106 - ingnore -silent option
#    spavan      09/08/10 - fix bug10033106
#    dsaggi      08/05/10 - parse the braces around nodes
#    nvira       08/04/10 - parse the braces around nodes
#    nvira       06/17/10 - fix exit status for error case
#    nvira       04/27/10 - add node script for EM integration
#    nvira       04/14/10 - nodeadd script to be used for EM integration
#    nvira       04/14/10 - Creation
# 

use strict;

use English;   # Sets $OSNAME, $OS_ERROR, $PERL_VERSION; see "perldoc perlvar"

use File::Basename;

my $dirname = dirname(__FILE__);

#
# File Separator
#
# Port specific definitions
# Unix is the default
#
my $fsep = "/";            # file separator
my $psep = ":";            # path separator
my $bin_ext = "";          # binary extention
if ($OSNAME eq "MSWin32") {
    $fsep = "\\";
    $psep = ";";
    $bin_ext = ".exe";
} 

my $stageType;
my $newNodes="";
my $newVirtualHostnames="";
my $i;
my $responseFile;
my $command;
my $help;

sub printUsageAndExit {
  print "\n";
  print "USAGE:\n";
  print "$0  {-pre|-post} <options>\n";
  print "\n";
  print "$0 -pre CLUSTER_NEW_NODES={<comma-separated-node-list>}\n";
  print "$0 -pre CLUSTER_NEW_NODES={<comma-separated-node-list>} CLUSTER_NEW_VIRTUAL_HOSTNAMES={<comma-separated-node-list>}\n";
  print "$0 -pre -responseFile <response-file-name>\n";
  print "$0 -post \n";
  print "\n";

  exit $_[0];
}

sub printError {
  print "ERROR:\n";
  print "$_[0]";
  print "\n";
  printUsageAndExit(1);
}

sub parseResponseFile {
  open FILE, "< $_[0]" or die $!;
  while (<FILE>) {
    chomp;
    if ( $_ =~ m/CLUSTER_NEW_NODES={(.*?)}/ ) {
      $newNodes = $1;
    }
    if ( $_ =~ m/CLUSTER_NEW_VIRTUAL_HOSTNAMES={(.*?)}/ ) {
      $newVirtualHostnames = $1;
   }
  }
}

if ( $#ARGV < 0 ) {
  printUsageAndExit(0);
}

for ( $i = 0 ; $i <= $#ARGV ; $i++ ) {
  if ( $ARGV[$i] eq "-pre" || $ARGV[$i] eq "-post" ) {
    $stageType = $ARGV[$i];
  }

  if ( $ARGV[$i] eq "-responseFile" ) {
    $i = $i + 1;
    if ( $i > $#ARGV ) {
      printError("A response file must be specified after -responseFile flag.");
    }

    $responseFile = $ARGV[$i];
  }

  if ( $ARGV[$i] eq "-help" ) {
    $help = "true";
  }

  if ( $ARGV[$i] =~ m/CLUSTER_NEW_NODES={(.*?)}/ ) {
    $newNodes = $1;
  }

  if ( $ARGV[$i] =~ m/CLUSTER_NEW_VIRTUAL_HOSTNAMES={(.*?)}/ ) {
    $newVirtualHostnames = $1;
  }
}

if ($help eq "true")
{
  # help is requested, do nothing so that the argument is passed to the addNode as is
  exit 0;
}

if ( $stageType ne "-pre" && $stageType ne "-post" ) {
  printError(
    "A valid context, either -pre or -post, must be specified.");
}

if ( $responseFile ne "" ) {
  parseResponseFile( $responseFile );
}

if ($stageType eq "-pre" && $newNodes eq "")
{
  printError("Value for CLUSTER_NEW_NODES not specified.");
}

if ($newVirtualHostnames ne "")
{
my @newVirtualHostname = split(',', $newVirtualHostnames);
my @newNode = split(',', $newNodes);

if ($#newNode ne $#newVirtualHostname)
{
  printError("CLUSTER_NEW_VIRTUAL_HOSTNAMES value does not match CLUSTER_NEW_NODES.");
}
  
}

$command = $dirname . $fsep .".." . $fsep . ".." . $fsep ."bin" . $fsep . "cluvfy";

$command ="$command stage";

$command ="$command $stageType nodeadd";

if ($stageType eq "-pre")
{
  $command = "$command -n $newNodes";
  
  if ($newVirtualHostnames ne "")
  {
    $command = "$command -vip $newVirtualHostnames";
  }
}
else
{
  $command = "$command -n all";
}

system ("$command");

my $exit_status = $? >> 8;
exit $exit_status;
