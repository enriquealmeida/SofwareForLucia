#!/usr/local/bin/perl
# 
# $Header: install/tools/deinstall/bootstrap.pl.pp /st_install_19/1 2018/09/11 23:51:44 vansoni Exp $
#
# bootstrap.pl
# 
# Copyright (c) 2010, 2018, Oracle and/or its affiliates. All rights reserved.
#
#    NAME
#      bootstrap.pl - This script will first validate if the files required for deinstalling ORACLE_HOME is 
#                     present in ORACLE_HOME and bootstraps it to the location passed from shell/batch script.
#                     This script will be run only in cases when running the deinstall tool from installed ORACLE_HOME.
#
#
#    DESCRIPTION
#      <short description of component this file declares/defines>
#
#    NOTES
#      <other useful comments, qualifications, etc.>
#
#    MODIFIED   (MM/DD/YY)
#    vansoni     09/11/18 - XbranchMerge vansoni_dicdi-2581 from main
#    vansoni     09/09/18 - removing references of inventory/Scripts/ext
#    ambagraw    02/07/18 - Bug 27411182
#    poosrini    12/18/17 - use LIBMAJORVSN in place of DB_VERSION_FIRST_DIGIT
#    rtattuku    06/12/17 - Library version change from 12 to 18
#    lorajan     02/14/17 - Passing -bootstrap to do bootstrapping during the
#                           giclean
#    ambagraw    08/05/16 - Bug 18415566: trapping the error as soon copy fails
#                           for files from home to bootstrap location
#    supalava    05/06/16 - Fix oui bootstrap issue.
#    supalava    04/03/16 - Copy perl and jdk dirs from OH.
#    ambagraw    07/16/15 - Bug 21382334 : Including Check for invalid
#                           bootstarp tmp dir in case of deinstall tmpdir
#                           option
#    haagrawa    02/06/15 - making timestamp consistent with netdc timestamp
#                           (bug# 19557154)
#    ntarale     03/04/14 - Fix for bug-18219019.
#    gramamur    06/29/12 - XbranchMerge gramamur_bug-14252929 from
#                           st_install_12.1beta2
#    gramamur    06/29/12 - XbranchMerge gramamur_fix_bootstrappl from
#    gramamur    06/29/12 - Fix the hash issue at the beginning
#    gramamur    06/28/12 - XbranchMerge gramamur_libociei_copy_fix from
#                           st_install_12.1beta2
#    rmallego    06/28/12 - computing oracle_home as tool_dir in case of
#                           standalone deinstall
#    gramamur    06/28/12 - Making a fix from copy to cp in UNIX
#    gramamur    06/25/12 - XbranchMerge gramamur_missing_curly_brace from
#                           st_install_12.1beta2
#    gramamur    06/25/12 - Missing } (right curly brace) - accidentally deleted in prev. txn.
#    gramamur    06/21/12 - XbranchMerge gramamur_bug-14168607 from main
#    gramamur    06/20/12 - Copying the library ociei for UNIX and windows
#    vkoganol    05/08/11 - Correcting script name in error message
#    vkoganol    12/20/10 - XbranchMerge vkoganol_bug-10153797 from
#                           st_install_11.2.0
#    ssampath    06/10/10 - Recently PERL added some new directories. Fail the
#                           tool if the file and the directory does not exist
#                           in OH
#    ssampath    06/09/10 - Reuse old tmpdir location when -giclean is passed
#    ssampath    03/25/10 - XbranchMerge ssampath_bug-9342491 from
#                           st_install_11.2.0.1.0
#    ssampath    01/18/10 - Creation
# 
use Cwd;
use File::Basename;
use File::Path;
use File::Copy;
use File::Find;

$notRecommendedMessage = "It is not recommended to run the script directly.  Execute deinstall or deinstall.bat which executes this script with right set of arguments\n";

$homeVersion = shift;
my $giHomeCleanFound = 0;

if($homeVersion eq "")
{
   print "Deinstall tool version is one of the required arguments for this perl script. $notRecommendedMessage";
   exit 1;
}

if($homeVersion) {
   $ORACLE_HOME = shift @ARGV;
   if($ORACLE_HOME eq "")
   {
      print "The Oracle home directory is one of the required arguments for this perl script. $notRecommendedMessage";
      exit 1;
   }
}
else{
	$ORACLE_HOME = shift @ARGV;
}
$ID = exists($ENV{ID}) ? $ENV{ID} : '/usr/bin/id';
if ($^O =~ /.*AIX.*/i) {
	$LSL = exists($ENV{LSL}) ? $ENV{LSL} : '/bin/ls -lX';
} else {
	$LSL = exists($ENV{LSL}) ? $ENV{LSL} : '/bin/ls -l';
}

$isWindows = ($^O =~ /.*MSWin.*/) ? 1 : 0;
if ($isWindows)  {
 	$dirSep = '\\';
 	$pathSep = ';';
        $arch = $ENV{PROCESSOR_ARCHITECTURE};
	$bits = $ENV{PROCESSOR_ARCHITEW6432};
	$is32Bit = (($arch eq 'x86') && ($bit eq '')) ? 1 : 0;
} else {
 	$dirSep = '/';
 	$pathSep = ':';
}

$bootstrapDir = processTmp();

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

eval { mkpath($bootstrapDir); 1} or die "ERROR: Unable to make boot strap directory $bootstrapDir: $!\n" if(! -d $bootstrapDir);
if($homeVersion) {
   validateOwner();
   filesListCheck();
   my $dest = $bootstrapDir;


   # copy contents of ext\bin and ext\jlib to deinstall bootstrap and also moving contents of deinstall folder one level up.
   my @sourceDirs = ($dest.$dirSep.'deinstall',$ORACLE_HOME.$dirSep.'oui',$ORACLE_HOME.$dirSep.'perl',$ORACLE_HOME.$dirSep.'jdk');
   if($giHomeCleanFound == 0)
   {
   
   if ( $^O eq "MSWin32" ) {
      system("xcopy /y/s/i/e/q $sourceDirs[0] $dest") == 0 or die "Bootstrap Failed.";
      system("xcopy /y/s/i/e/q $sourceDirs[1] $dest\\oui") == 0 or die "Bootstrap Failed.";
      system("xcopy /y/s/i/e/q $sourceDirs[2] $dest\\perl") == 0 or die "Bootstrap Failed.";
      system("xcopy /y/s/i/e/q $sourceDirs[3] $dest\\jdk") == 0 or die "Bootstrap Failed.";	

   }
   else {
      system("mv $sourceDirs[0] $dest/deinstall.back") == 0 or die "Bootstrap Failed.";
      system("cp -rf $dest/deinstall.back/* $dest") == 0 or die "Bootstrap Failed.";
      system("rm -rf $dest/deinstall.back") == 0 or die "Bootstrap Failed.";
      system("cp -rf $sourceDirs[1] $dest/oui") == 0 or die "Bootstrap Failed.";
      system("cp -rf $sourceDirs[2] $dest/perl") == 0 or die "Bootstrap Failed.";
      system("cp -rf $sourceDirs[3] $dest/jdk") == 0 or die "Bootstrap Failed.";	   

   }
   }
}
  $libFile1 = "";
  $libFile2 = "";
  # additional generic bootstrap files for GI home deinstall
  $installExclFile = $ORACLE_HOME.$dirSep."crs".$dirSep."install".$dirSep."install.excl";
  if (-e $installExclFile ) {
    if(! -d "$bootstrapDir/crs/install"){
      createSubDirs("$bootstrapDir/crs/install");
    }
    if($isWindows){
       system("copy $installExclFile $bootstrapDir\\crs\\install");
    }
    else{
       system("cp $installExclFile $bootstrapDir/crs/install");
    }
  }
  if($isWindows) {
	# This logis should be for home based deinstall only. This will be taken care by oraparam.ini in shiphome based deinstall.
      if($homeVersion) {

	$libFile1 = $ORACLE_HOME.$dirSep."instantclient".$dirSep."oraociei19.dll";
      if (-e $libFile1) {
           system("copy $libFile1 $bootstrapDir\\bin");
      }
      else
      {
          # print "\nSome library files seem to be missing from $ORACLE_HOME.  Hence, you cannot continue deinstall from this Oracle Home.";
          # exit 1;
      } 
	}
    }
   else
   {
      $libFile1 = $ORACLE_HOME.$dirSep."instantclient".$dirSep."libociei.so";
      $libFile2 = $ORACLE_HOME.$dirSep."instantclient".$dirSep."libociei.sl";
      $libFile3 = $ORACLE_HOME.$dirSep."lib".$dirSep."libociei.so";
      $libFile4 = $ORACLE_HOME.$dirSep."lib".$dirSep."libociei.sl";
      $oraInstFile = $ORACLE_HOME.$dirSep."oraInst.loc";
      # additional unix bootstrap files for GI home deinstall
      $mttransFile = $ORACLE_HOME.$dirSep."srvm".$dirSep."admin".$dirSep."mttrans";
      $ractransFile = $ORACLE_HOME.$dirSep."srvm".$dirSep."admin".$dirSep."ractrans";
      if (-e $libFile1) {
           system("cp $libFile1 $bootstrapDir/lib") == 0 or die "Bootstrap Failed.";
      }
      elsif (-e $libFile2) {
           system("cp $libFile2 $bootstrapDir/lib") == 0 or die "Bootstrap Failed.";
     }
     elsif (-e $libFile3) {
           system("cp $libFile3 $ORACLE_HOME/lib") == 0 or die "Bootstrap Failed.";
     }
     elsif (-e $libFile4) {
           system("cp $libFile4 $ORACLE_HOME/lib") == 0 or die "Bootstrap Failed.";
     }
     else
     {
           #print "\nSome library files seem to be missing from $ORACLE_HOME.  Hence, you cannot continue deinstall from this Oracle Home.";
           #exit 1;
     }      
     if (-e $oraInstFile ) {
           system("cp $oraInstFile $bootstrapDir") == 0 or die "Bootstrap Failed.";
     }
     if (-e $mttransFile ) {
           if(! -d "$bootstrapDir/srvm/admin"){
               createSubDirs("$bootstrapDir/srvm/admin");
           }
           system("cp $mttransFile $bootstrapDir/srvm/admin");
     }
     if (-e $ractransFile ) {
           if(! -d "$bootstrapDir/srvm/admin"){
               createSubDirs("$bootstrapDir/srvm/admin");
           }
           system("cp $ractransFile $bootstrapDir/srvm/admin");
     }
  }

# The value of TEMP location is printed to STDOUT which will be 
# captured by shell script.
print $bootstrapDir;

sub validateOwner() {
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
		print "The Oracle Home '$ORACLE_HOME' does not exist.\n";
		print "Please re-create the Oracle Home as original user and rerun this script.\n";
		exit 1;
	}
   }
}

# This fn will take care of making the files required by deinstall in bootstrap deinstall location.
sub filesListCheck() {
	my $filePath;
	my $command;

	if($giHomeCleanFound == 0)
	{
	chdir($bootstrapDir) or die "ERROR: Cannot change to directory $bootstrapDir: $!\n";
	
	my $fileName = $ORACLE_HOME.$dirSep."deinstall".$dirSep."bootstrap_files.lst";

	open(FILE, "<$fileName") or die "ERROR: Unable to open bootstrap_files.lst: $!\n";
	my @files = ();
	while (my $file = <FILE>) {
		chomp($file);
		push(@files, $file) unless ($file =~ /\w+\.dll/ && (! $isWindows)); # if non-windows, skip .dlls
	}
	close(FILE);
	foreach $file (@files) {
		$file =~ s/\//\\/g if ($isWindows);
		#print "\nProcessing file $file\n";
		my $compFile = 'oui'.$dirSep.'bin'.$dirSep.'ouica.properties';
		next if ($file eq $compFile); # drop extraneous oui/bin/ouica.properties
		next if ($file =~ /.+_tmp.*/);
                next if ($file eq 'bin'.$dirSep.'ODBTREEVIEW.OCX' && !$is32Bit);
                next if ($file eq 'bin'.$dirSep.'OO4OADDIN.DLL' && !$is32Bit);
                next if ($file eq 'bin'.$dirSep.'OO4OCODEWIZ.DLL' && !$is32Bit);
		my ($fileName, $fileDir, $fileExt) = fileparse($file, '\..*');
		# Correctly rename for EM template files which have been instantiated under different names
		if ($file =~ /\w+\.template$/) {
			my @fnArr = split(/\./, $fileExt);
			$fileName .= ".".$fnArr[1];
			$file = length($fileDir) > 0 ? $fileDir.$fileName : $fileName;
		}
		push(@filesToCopy, $file);
		if (! -f $ORACLE_HOME.$dirSep.$file && ! -d $ORACLE_HOME.$dirSep.$file) {
			#print "Warning : Cannot find $file in the ORACLE_HOME $ORACLE_HOME.  \n";

		} else {
                  createSubDirs($fileDir);
			my $from = $ORACLE_HOME.$dirSep.$file;
			my $to = $bootstrapDir.$dirSep.$fileDir;
                       
                        if ($isWindows)  {
			   copy($from, $to);
                        } else {
                          system("cp -rf $from $to") == 0 or die "Bootstrap Failed.";
                        }
                        #print "\nCopied file $from to $to\n";
		}
	}
	}
}

sub createSubDirs {
    my ($input) = @_;
    my $intrPath = "";

    #Loop through the sections
    foreach(split/\Q$dirSep\E/,$input) {
        #Add to path
        $intrPath .= $_ . $dirSep;

	#print "Create path $intrPath\n";
	mkdir($intrPath) or die "ERROR: Unable to create directory $intrPath: $!\n" if(! -d $intrPath);
    }
}

sub processTmp() {
   my $tmpSearch = '-tmpdir';
   my $giCleanSearch = '-giclean';
   my $giCleanFound = 0;
   my $bootStrapSearch = '-bootstrap';
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
   my $dteTimeStamp = sprintf("%d-%02d-%02d_%02d-%02d-%02d%s", $year, $month, $mDay, $hour, $min, $sec, $amPm);
   my $defaultTmp = "/tmp";
   my $tmp = "";

   while ( $arg = shift @ARGV) {
      if(lc($arg) eq $giCleanSearch) {
         $giCleanFound = 1;
	   $giHomeCleanFound = 1;
      }
      if(lc($arg) eq $bootStrapSearch) {
	$giCleanFound = 0 ; 
	$giHomeCleanFound = 0 ; 
      }
      if(lc($arg) eq $tmpSearch) {
         $tmp = shift @ARGV;
         break ;
      }
   }

   if($isWindows) {
      $defaultTmp = $ENV{SystemDrive}.$dirSep.'temp';
   }

   my $scratchArea = $tmp ? $tmp :
                     ($ENV{TEMP} ? $ENV{TEMP} : $defaultTmp);

   if($giCleanFound)
   {
      return $scratchArea;
   }
   else
   {
      return $scratchArea.$dirSep.'deinstall'.$dteTimeStamp;
   }
}
HomeCleanFound 
