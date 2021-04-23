BEGIN{
 my @modules=('Sys::Hostname',' File::Basename','Cwd','File::Find','File::Copy','File::Path','Getopt::Long','File::stat','Pod::Usage');
  foreach my $moduleName (@modules) {
    my $moduleDefined=eval "use $moduleName; 1" ?1:0;
    if($moduleDefined==0){
       print("\n$moduleName  module not present/module is not accessible\n");
       exit(2);
    }
  }
  
  use POSIX qw(uname);
  use Cwd  qw(abs_path);
  use File::Basename qw(dirname basename);
  my @uname = uname();
  my $PLATFORM="$uname[0]";
  if($PLATFORM eq 'AIX'){
    push @INC, dirname(abs_path($0));
  }
}

#Stick to perl version v5.x.x
use v5.8.8;
use Sys::Hostname;
use lib dirname(abs_path($0));
use strict;
use warnings;
    
#Command line parsing module getting used.
use module::CommandOptions qw(addOpt removeOpt removeAllOpt getArgumentCnt getArguments getOptValue optExists  isDescSession isActionSession isApplySession isRollbackSession isResumeSession processArgs isValidArguments isReportSession);
use module::DBUtilServices qw(getActiveUser getFileOwner getJavaHomePath getJreMemoryOptions removeDirectory getFileOwner getFileOwnerGroup changeFileOwner changeFilePermission removeFile openFile closeFile writeFile readFile findFilePattern formatDuration readPropertiesFile);
use module::DBValidationUtil qw(validateUserLocalSession validateUserRemoteSession validateOPatchIsTriggeredFromOneOfOH isDirectoryExists);
use module::OPatchAutoCommandOptions qw();
use module::ClassPathLib qw(setBaseDir setDetectOH setCP setSrvmLibPath getBootStrapCP getTopologyCreatorCP getOpatchAutoCP);
use module::ExportPath qw(exportSudoPath);

#throws from SystemInfoGeneration if any option passed by user is invalid
my $_INVALIDOPTION_ERROR_ID=153;

#Dumping additional args which does not have mapping.
foreach my $key (@ARGV) {
  processArgs($key);
}

if (isValidArguments() == 0) {
  print("opatchauto returns with error code = 2\n");
  exit(2);
}

my $path=exportSudoPath();
 $ENV{'PATH'}=$path;

my $scriptDir=dirname(abs_path($0));
my $opatchAutoDBDir=dirname($scriptDir);
my  $opatchAutoDir=dirname($opatchAutoDBDir);
my $BASE=dirname($opatchAutoDir);
setBaseDir($BASE);
my $DETECT_OH=dirname($BASE);
setDetectOH($DETECT_OH);

#Checking whether OPATCH_DEBUG environment variable is set 
my  $_debugMode=0;
my $DEBUGVAL="false";
if(defined $ENV{'OPATCH_DEBUG'} && ($ENV{'OPATCH_DEBUG'} eq 'true' || $ENV{'OPATCH_DEBUG'} eq 'TRUE') && isDescSession()==0){
  $_debugMode=1;
  $DEBUGVAL="true";
  removeOpt('logLevel');
  addOpt('logLevel',"FINEST");
}

#Checking whether $OPATCH_SPACE_AUTO environment variable is set
my  $OPATCH_AUTO_MSG="opatchauto";
if(defined $ENV{'OPATCH_SPACE_AUTO'} && $ENV{'OPATCH_SPACE_AUTO'} eq 'true'){
	$OPATCH_AUTO_MSG="opatch auto";
}

#Setting oracle ocm services if it is set in environment
my $oracleOcmService="";
if(defined $ENV{'ORACLE_OCM_SERVICE'}){
	$oracleOcmService="-Docm.endpoint=".$ENV{'ORACLE_OCM_SERVICE'};
}

my $currentUser=getActiveUser();
my $currentHomeOwner=getFileOwner($DETECT_OH."/oraInst.loc");

my $remoteSession=0;
my $validateUser=0;

#Checking whether ORACLE_HOME environment variable is set
my  $ORACLE_HOME="";
if(defined $ENV{'ORACLE_HOME'}){
	$ORACLE_HOME=$ENV{'ORACLE_HOME'};
}

if(isDescSession()==0){
   if(isApplySession()==1 || isRollbackSession()==1){
     $remoteSession=optExists('remote');
     $validateUser=1;
   }elsif(isResumeSession()==1){
      $validateUser=1;
      my $patchingMode="";
      my $filename = $opatchAutoDir."/dbtmp/patchingmode.txt";
     if(-e $filename){
      if (open(my $fh, $filename)) {
        $patchingMode = <$fh>; 
        close $fh;
      }else {
        warn "Could not open file '$filename' $!";
      }
      if($patchingMode eq "remote"){
        $remoteSession=1;
      }
    }
   }elsif(isReportSession()==1){ 
	 $validateUser=1;
   }
}
#Validating user if its local session then it has to be root/home owner.
#If its using -remote option then it can only be home owner.
if($validateUser==1){
  if($currentUser eq 'root' && optExists('sdb')==1){
    print("\nSharded database patching is not supported as 'root' user. Please run as '$currentHomeOwner' user.\n");
	print("opatchauto returns with error code = 2\n");
	exit(2);
  }
  if(isReportSession()==1 && validateUserRemoteSession($currentUser,$currentHomeOwner)==1){
    print("\nOPatchauto reporting is not supported as 'root' user. Please run as '$currentHomeOwner' user.\n");
	print("opatchauto returns with error code = 2\n");
	exit(2);
  }
  if($remoteSession==1 && validateUserRemoteSession($currentUser,$currentHomeOwner)==1){
   print("\nMulti node patching not supported as '$currentUser'. Please run as '$currentHomeOwner' user.\n");
    print("opatchauto returns with error code = 2\n");
   exit(2);
  }elsif(validateUserLocalSession($currentUser,$currentHomeOwner)==1){
   print("\nCannot run as '$currentUser'. Please run as 'root' user.\n");
    print("opatchauto returns with error code = 2\n");
   exit(2);
  }
}

if(isReportSession()==1 && isDescSession()==0){
	if(optExists('oh')==1){
		print("\n -oh is not a valid argument for opatchauto report. Please run opatchauto report -help.\n");
		print("opatchauto returns with error code = 2\n");
		exit(2);
	}
	addOpt('oh',$DETECT_OH);
}
if(optExists('oh')==1){
  my $ohOptStr=getOptValue('oh');

  my $valid=validateOPatchIsTriggeredFromOneOfOH($DETECT_OH,$ohOptStr);
  my @ohList = split(/,/, $ohOptStr);
  if(isDescSession()==0 && $valid==1){
   print("\nopatchauto must run from one of the homes specified\n");
   print("opatchauto returns with error code = 2\n");
   exit(2);
  }
  $ORACLE_HOME=$ohList[0];
}elsif(length $ORACLE_HOME > 0 && $ORACLE_HOME ne $DETECT_OH){
   my $valid=validateOPatchIsTriggeredFromOneOfOH($DETECT_OH,$ORACLE_HOME);
   if(isDescSession()==0 && $valid==1){
    print("\nopatchauto must run from one of the homes specified\n");
    print("opatchauto returns with error code = 2\n");
    exit(2);
   }
   if($ORACLE_HOME =~ /^ *$/){
     $ORACLE_HOME=$DETECT_OH;
   }
}else{
     $ORACLE_HOME=$DETECT_OH;
}
  if(!isDirectoryExists( $ORACLE_HOME)){
    print("\nThe Oracle Home $ORACLE_HOME does not exist. Please give a proper home and retry\n");
    print("opatchauto returns with error code = 2\n");
    exit(2);
  }
  if(!isDirectoryExists( $ORACLE_HOME."/oui") && isDescSession()==0){
    print("\nThe Oracle Home $ORACLE_HOME is not an OUI based home. Please give a proper home and retry\n");
    print("opatchauto returns with error code = 2\n");
    exit(2);
  }

 my @uname = uname();
 my $PLATFORM="$uname[0]";
 my $OLRLOC="";
 my $LD_LIBRARY_PATH="";
 if($PLATFORM eq 'Linux'){
   $OLRLOC="/etc/oracle/olr.loc";
   my $ld_lib_path=getEnv('LD_LIBRARY_PATH');
   $LD_LIBRARY_PATH=$ORACLE_HOME."/lib:".$ORACLE_HOME."/srvm/lib";
  if(length $ld_lib_path > 0){
     $LD_LIBRARY_PATH=$LD_LIBRARY_PATH.":".$ld_lib_path;
   }
   my $unameSize=@uname;
   my $ARCH=$uname[$unameSize-1];
   if($ARCH eq "ppc64" || $ARCH eq "s390x"){
       $LD_LIBRARY_PATH=$ORACLE_HOME."/lib32:".$ORACLE_HOME."/srvm/lib32:".$LD_LIBRARY_PATH
   }
   $ENV{'LD_LIBRARY_PATH'} = $LD_LIBRARY_PATH;
 }elsif($PLATFORM eq 'HP-UX'){
   $OLRLOC="/var/opt/oracle/olr.loc";
   $LD_LIBRARY_PATH=$ORACLE_HOME."/lib:".$ORACLE_HOME."/srvm/lib";
   $ENV{'LD_LIBRARY_PATH'}=$LD_LIBRARY_PATH;
   $ENV{'SHLIB_PATH'}="";
 }elsif($PLATFORM eq 'AIX'){
  my $libPath=getEnv('LIBPATH');
  $OLRLOC="/etc/oracle/olr.loc";
  my $LIBPATH=$ORACLE_HOME."/lib:".$ORACLE_HOME."/srvm/lib";
  if(length $libPath > 0){
    $LIBPATH=$LIBPATH.":".$libPath;
  }
  $LD_LIBRARY_PATH=$ORACLE_HOME."/lib:".$ORACLE_HOME."/srvm/lib:".$LIBPATH;
  $ENV{'LIBPATH'}=$LIBPATH;
  $ENV{'OBJECT_MODE'}="32_64";
 }elsif($PLATFORM eq 'SunOS'){
  $OLRLOC="/var/opt/oracle/olr.loc";
  my $ld_lib_path_64=getEnv('LD_LIBRARY_PATH_64');
  my $LD_LIBRARY_PATH_64=$ORACLE_HOME."/lib:".$ORACLE_HOME."/srvm/lib";
  if(length $ld_lib_path_64 > 0){
    $LD_LIBRARY_PATH_64=$LD_LIBRARY_PATH_64.":".$ld_lib_path_64;
  }
  $ENV{'LD_LIBRARY_PATH_64'} = $LD_LIBRARY_PATH_64;
  $LD_LIBRARY_PATH=$ORACLE_HOME."/lib:".$ORACLE_HOME."/srvm/lib:".$LD_LIBRARY_PATH;
  $ENV{'LD_LIBRARY_PATH'}=$LD_LIBRARY_PATH;
 }else{
  print("\nERROR: $PLATFORM is not supported. opatchauto cannot proceed!\n");
  print("opatchauto returns with error code = 2\n");
  exit(2);
 }
 
 my $crsHome="";
if (-e $OLRLOC){
 open my $fh, '<', $OLRLOC or die "Could not open '$OLRLOC' $!\n";
 while (my $line = <$fh>){
  if($line=~s/crs_home=//){
    $crsHome=$line;
    last;
  }
 } 
 close $fh;
}
my $isOper=isApplySession() || isRollbackSession();
if(isDescSession()==0 && $isOper==1){
  if(optExists('database')==1){
    if(findFilePattern($ORACLE_HOME."/bin/","crsctl")==1){
       print("\nopatchauto cannot run from Grid Home when patching database home. Please retry it inside database home\n");
       print("opatchauto returns with error code = 2\n");
       exit(2);
    }
  }elsif(optExists('oh')==0){
   if(optExists('sdb')==0 && optExists('dg')==0 && optExists('shardgroup')==0 && optExists('shardspace')==0){
     if(findFilePattern($ORACLE_HOME."/bin/","crsctl")==0 && optExists('sidb')==0){
        print("\nopatchauto must run from Grid Home with current arguments. Please retry it inside Grid Home\n");
        print("opatchauto returns with error code = 2\n");
       exit(2);
     }
   }elsif($crsHome ne "" && $ORACLE_HOME ne $crsHome ){
	if(optExists('sdb')==0 && optExists('dg')==0 && optExists('shardgroup')==0 && optExists('shardspace')==0){
      print("\nThe running Oracle Home is not a valid Grid Home. Please check it and retry\n");
      print("opatchauto returns with error code = 2\n");
      exit(2);
	}
   }
  }
}

my $ouiLoc=getOptValue('oui');

if(optExists('oui')==0 || ! -d getOptValue('oui')){
  $ouiLoc=$ORACLE_HOME."/oui";
  if(! -d $ouiLoc){
   $ouiLoc="";
  }
}
my $userSuppliedInventory = getOptValue('invPtrLoc');
if(optExists('invPtrLoc')==1 && optExists('sdb')==1){
 print("\nERROR: Supplied inventory $userSuppliedInventory will not be used in case of -sdb execution.\n\n");
 print("opatchauto returns with error code = 10\n\n");
 exit(10);
}
if(optExists('invPtrLoc')==1 && optExists('remote')==1){
  print("\nERROR: Supplied inventory $userSuppliedInventory will not be used in case of multi node execution.\n");
  print("Central inventory will be used in case of multi node execution.\n");
  print("opatchauto returns with error code = 2\n");
  exit(2);
}

if(-e $ORACLE_HOME."/oraInst.loc" && optExists('remote')==0 && optExists('invPtrLoc')==0 && isDescSession()==0 && $isOper==1){
  addOpt('invPtrLoc',$ORACLE_HOME."/oraInst.loc");
}

my $jreOpt="";
if(optExists('jre')==1){
 $jreOpt=getOptValue('jre');
}
my $JAVA_HOME=getJavaHomePath($DETECT_OH,$jreOpt);
my $JAVA=$JAVA_HOME."/bin/java";
removeOpt('jre');

my $JRE_MEMORY_OPTIONS="";
if(defined $ENV{'OPATCH_JRE_MEMORY_OPTIONS'}){
 $JRE_MEMORY_OPTIONS=$ENV{'OPATCH_JRE_MEMORY_OPTIONS'};
} elsif(defined $ENV{'JRE_MEMORY_OPTIONS'}){
 $JRE_MEMORY_OPTIONS=$ENV{'JRE_MEMORY_OPTIONS'};
}
$JRE_MEMORY_OPTIONS=getJreMemoryOptions($ouiLoc."/oraparam.ini",$JRE_MEMORY_OPTIONS,$JAVA);

my $CLASSPATH="";
if(length($ouiLoc) >0){
 $CLASSPATH=$ouiLoc."/jlib";
}else{
  $CLASSPATH=$DETECT_OH."/oui/jlib";
}
setCP($CLASSPATH);

my $result = 0;
my $SRVM_JLIB=$DETECT_OH."/jlib";
setSrvmLibPath($SRVM_JLIB, $SRVM_JLIB, $SRVM_JLIB);
my $orginalArgs=getArguments();
if(optExists('help')==1 && optExists('sdb')==1){
 my $sdbHelpCP=getBootStrapCP();
 my $sdbHelpJavaInvocation=$JAVA." "." -cp ".$sdbHelpCP."  com.oracle.glcm.patch.auto.db.utils.PrintHelp  ".$orginalArgs;
 $result = system($sdbHelpJavaInvocation);
 $result = $result >> 8;
 exit($result);
}

my $JAVA_VM_OPTION="";
if(defined $ENV{'JAVA_VM_OPTION'}){
  $JAVA_VM_OPTION=$ENV{'JAVA_VM_OPTION'};
}

my $host = hostname();
$host = (split('\.', $host))[0];

if(optExists('help')==0 && isResumeSession()==1){
my $resumefilename = $opatchAutoDir."/dbsessioninfo/localSessionInfoFile_".$host.".txt";
  if (optExists('session')==1){
    print("\nERROR: The argument specified is invalid: -session\n");
    removeAllOpt();
    addOpt('resume',"arg");
    addOpt('help',"switch");
  }else{  
    my $sessionId="";;
	my $fh;
    
    if (open($fh, $resumefilename)) {
     $sessionId = <$fh>;
	 chomp $sessionId;
	 close $fh;	 
	 
	 # reading the parentid from rootSessionInfoFile.txt and if it matches with the patrent id sent via command line, 
	 # then identifies the correct session id of the current session.
	 # the current session id is saved in the format <parent session id>:<current session id>
	 my $rootSI = $opatchAutoDir."/dbsessioninfo/rootSessionInfoFile.txt";
	 my $root_fh;
	 my $parentSessionId;
	 if (optExists('parentid')==1)
	 {
	   my $parent_found = 0;
	   $parentSessionId=getOptValue('parentid');
	   my $analyzeSearchText = "ANALYZE:".$parentSessionId;
	   my $deploySearchText = "DEPLOY:".$parentSessionId;
	   if(-e $rootSI)
	   {
	     if (open( $root_fh, $rootSI)) {		   
		   while (<$root_fh>) {
		     if (/^$analyzeSearchText:(\S+)/ || /^$deploySearchText:(\S+)/) {
			   $sessionId = $1;
			   $parent_found = 1;
			 }
		   }		   
		   close $root_fh;
		   if (! $parent_found)
		   {
		     print ("\n\nERROR: The parent session ID $parentSessionId is invalid.\n");
			 print("opatchauto cannot operate resume.\n\n");
	         exit(2);
		   }
		 }
		 else {
		   print("\n\nERROR: Parent session information is not accessible.\n");
		   print("opatchauto cannot operate resume.\n\n");
		   exit(2);
		 }
	     
	   }
	   else{
	     print("\n\nERROR: Parent session information is not available.\n");
		 print("opatchauto cannot operate resume.\n\n");
		 exit(2);
	   }
	 }
	 else {
	   if(-e $rootSI)
	   {
	     # Check if this local session has got a parent. If so, redirect to the root session.
		 if (open( $root_fh, $rootSI)) {
		   # First read the root session, host, home info. Thereafter the key:value entries are found
		   my $root_id = <$root_fh>;
		   chomp $root_id;
		   my $root_host = <$root_fh>;
		   chomp $root_host;
		   my $root_home = <$root_fh>;
		   chomp $root_home;
		   while (<$root_fh>) {
		     if (/:$sessionId$/) {
			   print("\n\nERROR: Patching for this home was initiated from a different host.\n");
			   print("Run opatchauto resume from home $root_home on host $root_host.\n\n");
		       print("opatchauto stopped.\n\n");
		       exit(2);
			 }
		   }		   
		   close $root_fh;
		 }
	   }
	 }
	 
	 if ($sessionId eq "")
	 {
	   print("\n\nERROR: Required session information is not available.\n");
	   print("opatchauto cannot operate resume.\n\n");
	   exit(2);
	 }
	 if (optExists('parentid')==1)
	 {
	   removeOpt('parentid');
	 }
	 addOpt('session',$sessionId);
	 
    }else { # Even in SDB resume cases, if a session was not already initiated from this home, SDB runs apply/rollback instead of resume
      print("\n\nERROR: Previous session information is not available for resuming opatchauto.\n");
      print("opatchauto cannot operate resume.\n\n");
      exit(2);
   }  
    
  }
}
$orginalArgs=getArguments();
my $isActionSession=isActionSession();
my $operationType="";
if(isApplySession()==1){
 $operationType="apply";
}elsif(isRollbackSession()==1){
 $operationType="rollback";
}

my $patchinfoLocation=$opatchAutoDir."/dbtmp/patchinginfo_$host.properties";
  
my $PATCH_TRACKING_DATA="";
my $PATCH_WITH="";
my $ROOT_CRS_TMP="";
my $XAG_TMP="";
my $HOME_PATH=$DETECT_OH;
my $PATCHWORK="";
if(optExists('help')==1 || isDescSession()==0){
   my $Args_Edited=$orginalArgs;
   $Args_Edited="\"".$Args_Edited."\"";
   my $JRE_MEMORY_OPTIONS_EDITED=$JRE_MEMORY_OPTIONS;
   $JRE_MEMORY_OPTIONS_EDITED=~s/\ /#/g;
   $ENV{'ORACLE_HOME'} = $DETECT_OH;
   
   if($_debugMode==1){
      print("\nOriginal::$orginalArgs\n");
      print("\nEdited::$Args_Edited\n");
   }
   
  my $bootStrapCompleted=0;
  if(optExists('bootStrapCompleted')==1){
  	$bootStrapCompleted=1;
	removeOpt('bootStrapCompleted');
	$orginalArgs=getArguments();
  } elsif(isResumeSession()==1) {
	my $perlExecPath="$^X";
	my $perlBinPath=dirname($perlExecPath);
	my $perlPath=dirname($perlBinPath);
	my $perlHome=dirname($perlPath);
    my $OPATCHAUTO_PERL_PATH=$ORACLE_HOME."/perl/bin/perl";	
	my $patchinginfoFile=$opatchAutoDir."/dbtmp/patchinginfo_$host.properties";
	if( -e $patchinginfoFile) {
	  my %patchinginfo=readPropertiesFile($patchinginfoFile);
	  if(exists $patchinginfo{'PATCHWORK_DIR'}){
		$PATCHWORK=$patchinginfo{'PATCHWORK_DIR'};
		my $bootstrapfile=$PATCHWORK."/bootstrap.properties";
		if( -e $bootstrapfile) {
			my %hash=readPropertiesFile($bootstrapfile);
			my $size=keys %hash;
			if($size>0){
				if(exists $hash{'IS_PERL_PATCH'}) {
					my $IS_PERL_PATCH=$hash{'IS_PERL_PATCH'};
					if(exists $hash{'PERL_PATH'}) {
					   $OPATCHAUTO_PERL_PATH=$hash{'PERL_PATH'};
					   $ENV{'OPATCHAUTO_PERL_PATH'}=$OPATCHAUTO_PERL_PATH;
					}
					if("true" eq $IS_PERL_PATCH) {		
					  removeOpt('session');
					  $orginalArgs=getArguments();
					  my $newArgs=$orginalArgs." -bootStrapCompleted";      		
					  my @myArgs=split(' ',$newArgs);
					  if($_debugMode==1){
						print("\nRestarting patching with new perl path::$OPATCHAUTO_PERL_PATH\n");
					  }
					  exec("$OPATCHAUTO_PERL_PATH",$0,@myArgs);			     			
				    }
				}
			}
    	    	
    	}
	  }
	}
  }
  
   if($bootStrapCompleted==0) {
  	print "\nOPatchauto session is initiated at ".localtime()."\n";
   }
  if($currentUser eq 'root' && optExists('wallet')==1){
	removeOpt('wallet');
	print("\nNote: -wallet is not required to execute opatchauto as root user.\n");
  }
  
  if(optExists('sdb')==0 && optExists('sidbonly')==0 && optExists('dg')==0 && optExists('shardgroup')==0 && optExists('shardspace')==0 && isReportSession()==0 && $bootStrapCompleted==0 && optExists('help')==0){
     if(($isOper==1  || $isActionSession==1)){
       my $bootStrapperCP=getBootStrapCP();
       my $additionalArgs=" -isActionSession=".$isActionSession." -DEBUGVAL=".$DEBUGVAL." -operationType=".$operationType." -ARGS ".$Args_Edited;
       my $bootStrapperJavaInvocation=$JAVA." ".$JAVA_VM_OPTION." ".$JRE_MEMORY_OPTIONS." -DOPatch.ORACLE_HOME=".$DETECT_OH." -DOPatch.PATCH_INFO_LOCATION=".$patchinfoLocation." -DOPatchauto.HOSTNAME=".$host." -cp ".$bootStrapperCP." com.oracle.glcm.patch.auto.db.util.BootstrapHandler ".$additionalArgs;
       if($_debugMode==1){
        print("\n$bootStrapperJavaInvocation\n");
       }
       $result = system($bootStrapperJavaInvocation);
       $result = $result >> 8;
       if($result!=0 && $result!=$_INVALIDOPTION_ERROR_ID){
	     displayEndTime();
         print("\n$OPATCH_AUTO_MSG bootstrapping failed with error code $result.\n");
         exit($result);
       }
    }
  } elsif(optExists('sdb')==1 || optExists('sidbonly')==1 || optExists('dg')==1 || optExists('shardgroup')==1 || optExists('shardspace')==1) {
		my $OPATCHAUTO_PERL_PATH=$ORACLE_HOME."/perl/bin/perl";
		$ENV{'OPATCHAUTO_PERL_PATH'}=$OPATCHAUTO_PERL_PATH;
  }
  
  my %hash=readPropertiesFile($patchinfoLocation);
   if(exists $hash{'DEFAULT_OOP'}){
	  if(isReportSession()==0 && isResumeSession()==0 && $hash{'DEFAULT_OOP'} eq 'true' && (optExists('outofplace')==0 && optExists('switch-clone')==0 && optExists('prepare-clone')==0 && optExists('inplace')==0 && optExists('help')==0)){
		 addOpt('outofplace',"switch");
		 $orginalArgs=getArguments();
 		}
   } 
   if(exists $hash{'PATCHWORK_DIR'}){
		$PATCHWORK=$hash{'PATCHWORK_DIR'};
   }

   my $NLIB_FILE_PATH="";
   my $SRVM_LIB_PATH="";
   my $SRVM_HAS_LIB_PATH="";
   my $SRVM_ASM_LIB_PATH="";
   $PATCH_TRACKING_DATA=$opatchAutoDir."/dbsessioninfo";
   my $LD_LIB_TMP=$DETECT_OH."/lib";
   if($result==0){
       if(optExists('sdb')==0 && optExists('topology')==0){
	   %hash=readPropertiesFile($PATCHWORK."/bootstrap.properties");
	   my $size=keys %hash;
	    if($size>0){
		  if($hash{'BOOTSTRAP_PATH'}) {
		     $PATCH_WITH=$hash{'BOOTSTRAP_PATH'};
		  }
		  if($hash{'GRID_HOME_PATH'}) {
		     $HOME_PATH=$hash{'GRID_HOME_PATH'};
		  }
		  if($hash{'ORACLE_BASE'}) {
		     $ENV{'ORACLE_BASE'}=$hash{'ORACLE_BASE'};
		  }
		  
		   if($bootStrapCompleted==0){	 
		      my $OPATCHAUTO_PERL_PATH=$ORACLE_HOME."/perl/bin/perl";	
			  if($hash{'IS_PERL_PATCH'}) {
				my $IS_PERL_PATCH=$hash{'IS_PERL_PATCH'};
				if($hash{'PERL_PATH'}) {
					 $OPATCHAUTO_PERL_PATH=$hash{'PERL_PATH'};
					 $ENV{'OPATCHAUTO_PERL_PATH'}=$OPATCHAUTO_PERL_PATH;
				}
				if("true" eq $IS_PERL_PATCH) {		
					my $newArgs=$orginalArgs." -bootStrapCompleted";      		
					my @myArgs=split(' ',$newArgs);
					if($_debugMode==1){
						print("\nRestarting patching with new perl path::$OPATCHAUTO_PERL_PATH\n");
					}
					exec("$OPATCHAUTO_PERL_PATH",$0,@myArgs);			     			
				}
			  } else {
				$ENV{'OPATCHAUTO_PERL_PATH'}=$OPATCHAUTO_PERL_PATH;
			  }
		   }
		  
		  if($hash{'NLIB_FILE_PATH'}) {
		     $NLIB_FILE_PATH=$hash{'NLIB_FILE_PATH'};
		  }
		  if($hash{'SRVM_LIB'}) {
		     $SRVM_LIB_PATH=$hash{'SRVM_LIB'};
		  }
		  if($hash{'SRVM_HAS_LIB'}) {
		     $SRVM_HAS_LIB_PATH=$hash{'SRVM_HAS_LIB'};
		  }
		  if($hash{'SRVM_ASM_LIB'}) {
		     $SRVM_ASM_LIB_PATH=$hash{'SRVM_ASM_LIB'};
		  }
		  if($_debugMode==1){
            print("\nPatch With::$PATCH_WITH\n");
		    print("\nHome path::$HOME_PATH\n");
		    print("\nOracle base::$ENV{'ORACLE_BASE'}\n");
         }
		 if(length $NLIB_FILE_PATH > 0){
			$LD_LIB_TMP=$NLIB_FILE_PATH.":".$HOME_PATH."/lib";
		 }else {
			$LD_LIB_TMP=$HOME_PATH."/lib";
		 }
		 if(length $SRVM_LIB_PATH <= 0){
			$SRVM_LIB_PATH=$HOME_PATH."/jlib";
		 }
		 if(length $SRVM_HAS_LIB_PATH <= 0){
			$SRVM_HAS_LIB_PATH=$HOME_PATH."/jlib";
		 }
		 if(length $SRVM_ASM_LIB_PATH <= 0){
			$SRVM_ASM_LIB_PATH=$HOME_PATH."/jlib";
		 }
        	 $ROOT_CRS_TMP=$PATCHWORK."/crs/install";
		$XAG_TMP=$PATCHWORK."/xag";
		
		 setSrvmLibPath($SRVM_LIB_PATH, $SRVM_HAS_LIB_PATH, $SRVM_ASM_LIB_PATH);
		}
       }
       if($_debugMode==1){
          print("\nSRVM_LIB_PATH: $SRVM_LIB_PATH\n");
		  print("\nSRVM_HAS_LIB_PATH: $SRVM_HAS_LIB_PATH\n");
		  print("\nSRVM_ASM_LIB_PATH: $SRVM_ASM_LIB_PATH\n");
          print("\nROOT_CRS_TMP: $ROOT_CRS_TMP\n");
	print("\nXAG_TMP: $XAG_TMP\n");
          print("\nLD_LIB_TMP: $LD_LIB_TMP\n");
        }
	 if($PLATFORM eq 'Linux'){ 
	   $LD_LIBRARY_PATH=$LD_LIB_TMP.":".$ENV{'LD_LIBRARY_PATH'};
	   $ENV{'LD_LIBRARY_PATH'} = $LD_LIBRARY_PATH;
	 }elsif($PLATFORM eq 'HP-UX'){
	   $LD_LIBRARY_PATH=$LD_LIB_TMP.":".$ENV{'LD_LIBRARY_PATH'};
	   $ENV{'LD_LIBRARY_PATH'} = $LD_LIBRARY_PATH;
	 }elsif($PLATFORM eq 'AIX'){
	  my $LIBPATH=$LD_LIB_TMP.":".$ENV{'LIBPATH'};
	  $ENV{'LIBPATH'} = $LIBPATH;
	 }elsif($PLATFORM eq 'SunOS'){
	   my $LD_LIBRARY_PATH_64=$LD_LIB_TMP.":".$ENV{'LD_LIBRARY_PATH_64'};
	   $ENV{'LD_LIBRARY_PATH_64'} = $LD_LIBRARY_PATH_64;
	   my $LD_LIBRARY_PATH=$LD_LIB_TMP.":".$ENV{'LD_LIBRARY_PATH'};
	   $ENV{'LD_LIBRARY_PATH'} = $LD_LIBRARY_PATH;
	 }else{
	  print("\nERROR: $PLATFORM is not supported. opatchauto cannot proceed!\n");
	  exit(2);
	 }
	 my $topologyForSwitch=1;
	 if(optExists('switch-clone')==1 && isApplySession()==1){
		$topologyForSwitch=0;
		my $OPATCHAUTO_PERL_PATH=$ORACLE_HOME."/perl/bin/perl";
		$ENV{'OPATCHAUTO_PERL_PATH'}=$OPATCHAUTO_PERL_PATH;
	 }
	  if(optExists('sdb')==0 && optExists('shardgroup')==0 && optExists('shardspace')==0 && optExists('dg')==0 && optExists('topology')==0 && isDescSession==0 && $topologyForSwitch==1 && ($isOper == 1 || isReportSession()==1)){
		  my $topologyCreatorCP=getTopologyCreatorCP();
		  my $additionalArgs=" -DOPatch.OUI_LOCATION=".$ouiLoc." -DOPatch.ORACLE_HOME=".$DETECT_OH." ".$oracleOcmService;
		  my $topologyCreatorJavaInvocation=$JAVA." ".$JAVA_VM_OPTION." ".$JRE_MEMORY_OPTIONS." -cp ".$topologyCreatorCP." ".$additionalArgs." com.oracle.glcm.patch.auto.db.integration.model.productsupport.topology.TopologyCreator ".$orginalArgs;
		  if($_debugMode==1){
		   print("\n$topologyCreatorJavaInvocation\n");
		  }
		  $result = system($topologyCreatorJavaInvocation);
		  $result = $result >> 8;
		  
		  if($_debugMode==1){
			print("\nResult: $result\n");
		  }
		  if($result!=0){
		   displayEndTime();
		   print("\nTopology creation failed.\n");
		   exit($result);
		  }
	  }
	}
}
my $TEST_REBOOT_PATCHING = "";
if(defined $ENV{'TEST_REBOOT_PATCHING'}){
   $TEST_REBOOT_PATCHING=$ENV{'TEST_REBOOT_PATCHING'};
}

my $opatchAutoSystemProps=" -DOPatch.ORACLE_HOME=".$DETECT_OH." -DOPatchAuto.HOME=".$DETECT_OH." -DOPatch.DEBUG=".$DEBUGVAL." -DOPatchauto.TEST_REBOOT_PATCHING=".$TEST_REBOOT_PATCHING." -DOPatch.RUNNING_DIR=".$BASE." -DOPatch.OUI_LOCATION=".$ouiLoc." -DOPatchauto.GI_INFO_LOC=".$DETECT_OH." -DOPatchauto.PATCH_WITH_FILES_FROM_LOC=".$PATCH_WITH." -DOPatch.PATCH_INFO_LOCATION=".$patchinfoLocation." -DOPatchauto.ROOTCRS_PL_FILE_TEMP_LOC=".$ROOT_CRS_TMP."  -DOPatchauto.XAG_FILE_TEMP_LOC=".$XAG_TMP." -DOPatchauto.GI_HOME_PATH=".$HOME_PATH."  -DOPatchauto.HOSTNAME=".$host." -DPATCHWORK_PATH=".$PATCHWORK." -Dopatchauto.tracking.sessions.dir=".$PATCH_TRACKING_DATA." ".${oracleOcmService};
my $opatchAutoCP=getOpatchAutoCP();
my $opatchAutoJavaInvocation=$JAVA." ".$JAVA_VM_OPTION." ".$JRE_MEMORY_OPTIONS." -cp ".$opatchAutoCP." ".$opatchAutoSystemProps." com.oracle.glcm.patch.auto.OPatchAuto  ".$orginalArgs;
if($_debugMode==1){
       print("\n$opatchAutoJavaInvocation\n");
}
$result = system($opatchAutoJavaInvocation);
$result = $result >> 8;

if(isDescSession()==0){
  displayEndTime();
}

if($result >= 5 && $result <= 7){
 print("\n $OPATCH_AUTO_MSG stopped on request.\n");
 $result=0;
}elsif( $result == 8){
 print("\n $OPATCH_AUTO_MSG completed with warnings.\n");
 $result=0;
}elsif( $result == 4){
 print("\n $OPATCH_AUTO_MSG analysis reports error(s).\n");
 $result=0;
}elsif( $result != 0){
  my $OPATCHAUTO_OWNER=getFileOwner($opatchAutoDir);
  my $OPATCHAUTO_GROUP=getFileOwnerGroup($opatchAutoDir);
  my $mode="local";
  if($remoteSession == 1){
   $mode="remote";
  }
  removeFile($opatchAutoDir."/dbtmp/patchingmode.txt");
  my $fh=openFile($opatchAutoDir."/dbtmp/patchingmode.txt",1);
  writeFile($fh,$mode);
  closeFile($fh);
  changeFileOwner($OPATCHAUTO_OWNER,$OPATCHAUTO_GROUP,$opatchAutoDir."/dbtmp/patchingmode.txt");
  changeFilePermission($opatchAutoDir."/dbtmp/patchingmode.txt","0775");  
  print("\n $OPATCH_AUTO_MSG failed with error code $result\n");
}else{
 removeFile($opatchAutoDir."/dbtmp/patchingmode.txt");
 if($isActionSession==1) {
	 removeFile($opatchAutoDir."/dbtmp/patchinginfo_$host.properties");
 }
}
exit($result);
print("\n");

sub displayEndTime{
  my $DUR=time-$^T;
  print "\nOPatchauto session completed at ".localtime()."\n";
  print "Time taken to complete the session ".formatDuration($DUR)."\n";
}

sub getEnv{
 my $envName=$_[0];
 my $envVal="";
 if(defined $ENV{$envName}){
     $envVal=$ENV{$envName};
  }
  return $envVal;
}
