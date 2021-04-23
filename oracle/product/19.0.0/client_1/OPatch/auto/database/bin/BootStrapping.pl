BEGIN{
	use Cwd  qw(abs_path getcwd);
	use File::Basename qw(dirname basename);
	use POSIX qw(uname);
	my @uname = uname();
	my $PLATFORM="$uname[0]";
	if($PLATFORM eq 'AIX'){
		push @INC, dirname(abs_path($0));
	}
}
#Stick to perl version v5.x.x
use v5.8.8;
use strict;
use warnings;

use Sys::Hostname;
use File::Find;
use File::Copy;
use lib dirname(abs_path($0));
use module::CommandOptions qw(addOpt removeOpt removeAllOpt getArgumentCnt getArguments getOptValue optExists  isDescSession isActionSession isApplySession isRollbackSession isResumeSession processArgs);
use module::BootStrapCommandOptions qw();
use module::ClassPathLib qw(setBaseDir setDetectOH setCP setSrvmLibPath getLibPathForBootStrapping);
use module::DBUtilServices qw(getActiveUser getFileOwner getFileOwnerGroup changeFileOwner changeFilePermission copyRecursively createDirectory  removeDirectory openFile closeFile writeFile readFile copyRecursively readPropertiesFile touchFile writePropertiesFile);
use File::Path qw(mkpath);

#Dumping additional args which does not have mapping.
foreach my $key (@ARGV) {
  processArgs($key);
}

# Finding out host name
my $host = hostname();
$host = (split('\.', $host))[0];

my $DETECT_OH=getOptValue('detect_oh');
setDetectOH($DETECT_OH);

my $BASEDIR=$DETECT_OH."/OPatch";
my $OPATCHAUTODB_DIR=$BASEDIR."/auto/database";
my $OPATCHAUTO_DIR=$BASEDIR."/auto";
my $OPATCHAUTO_CORE_DIR=$OPATCHAUTO_DIR."/core";
setBaseDir($BASEDIR);

my $OPATCHAUTO_OWNER=getFileOwner($OPATCHAUTO_DIR);
my $OPATCHAUTO_GROUP=getFileOwnerGroup($OPATCHAUTO_DIR);

my $OPATCHAUTODB_LOG_DIR=$DETECT_OH."/cfgtoollogs/opatchautodb";
my $OPATCHAUTODB_DRIVER_LOG_DIR=$DETECT_OH."/cfgtoollogs/opatchautodb/driver";
my $OPATCHAUTO_LOG_DIR=$DETECT_OH."/cfgtoollogs/opatchauto";
my $OPLAN_LOG_DIR=$DETECT_OH."/cfgtoollogs/oplan";
my $DBTMP=$OPATCHAUTO_DIR."/dbtmp";
my %libraryPath=('SRVM_SO',"",'SRVM_HAS_SO',"",'SRVM_JARS',"",'SRVM_HAS_JAR',"",'SRVM_ASM_JAR',"",'ROOTCRS_PL',"",'ROOTHAS_PL',"",'AG_UTILS',"",'AG_COMMON',"");
my $CRSCONFIG_PARAM="";

my $DEBUG=getOptValue('DEBUGVAL');
my $operationType=getOptValue('operationtype');

createChangeFolderPermission( $DBTMP );
createChangeFolderPermission( $OPATCHAUTODB_LOG_DIR );
createChangeFolderPermission( $OPATCHAUTODB_DRIVER_LOG_DIR );
createChangeFolderPermission( $OPATCHAUTO_LOG_DIR );
createChangeFolderPermission( $OPLAN_LOG_DIR );

my $SESSION_ID="";
my $LAST_SESSION_ID="";
my $isActionSession=0;
my $isOper=0;

 my $DBSESSIONINFO=$OPATCHAUTO_DIR."/dbsessioninfo";
if(getOptValue('isActionSession')==1){
 $isActionSession=1;
 my $fh="";
 if(-e $DBSESSIONINFO."/lastsessioninfo_".$host.".txt"){
   $fh=openFile($DBSESSIONINFO."/lastsessioninfo_".$host.".txt",0);
   $LAST_SESSION_ID=readFile($fh);
   closeFile($fh);
 }else{
  $fh=openFile($DBSESSIONINFO."/lastsessioninfo_".$host.".txt",1);
  closeFile($fh);
 }
 
 $fh=openFile($DBSESSIONINFO."/sessioninfo.txt",0);
 $SESSION_ID=readFile($fh);
 closeFile($fh);
 if($DEBUG eq "true"){
   print("\nSESSION_ID: $SESSION_ID\n");
   print("\nLAST_SESSION_ID: $LAST_SESSION_ID\n");
 }
} elsif($operationType eq "apply" || $operationType eq "rollback") {
	$isOper=1;
}

my $OPATCHAUTO_TEMP="";
my $PATCHWORK="";
my $patchinginfoFile=$DBTMP."/patchinginfo_$host.properties";
if( -e $patchinginfoFile) {
  my %patchinginfo=readPropertiesFile($patchinginfoFile);
  if(exists $patchinginfo{'PATCHWORK_DIR'}){
	$PATCHWORK=$patchinginfo{'PATCHWORK_DIR'};
	$OPATCHAUTO_TEMP=dirname($PATCHWORK);
  }
}

my $PATCH_TRACKING_DATA=$DBSESSIONINFO;
my $SRVM_JLIB=$DETECT_OH."/jlib";
setSrvmLibPath($SRVM_JLIB, $SRVM_JLIB, $SRVM_JLIB);

my $args=getArguments();

if(defined getOptValue('sidb')){
	my $isSidb=getOptValue('sidb');
	if($isSidb eq "true"){
		exit(0);
	}
}
  
if($isOper==1  || ($isActionSession==1 && $SESSION_ID ne $LAST_SESSION_ID)){
  my $fh=openFile($DBSESSIONINFO."/lastsessioninfo_".$host.".txt",1);
  writeFile($fh,$SESSION_ID);
  closeFile($fh);
  
  #removeDirectory($OPATCHAUTO_TEMP); => This will be taken care as part of PatchPatchReader invocation
  createDirectory($PATCH_TRACKING_DATA);
  createDirectory($PATCHWORK."/crs/install");
  createDirectory($PATCHWORK."/xag");
  
  my $bootClassPath="";
  my $PATCH_PATH="";
  if(defined getOptValue('patch_path')) {
	$PATCH_PATH=getOptValue('patch_path');
  }
  if($DEBUG eq "true"){
    print("\nPatchPath: $PATCH_PATH\n");
  }
  
  my $GRID_HOME_PATH="";
  my $PATCH_WITH="";
  my %hash=readPropertiesFile($PATCHWORK."/bootstrap.properties");
  my $size=keys %hash;
  if($size>0){
	  if($hash{'BOOTSTRAP_PATH'}) {
	     $PATCH_WITH=$hash{'BOOTSTRAP_PATH'};
		 if($DEBUG eq "true"){
		    print("\nPatch With::$PATCH_WITH\n");
		 }
	  }
	  if($hash{'GRID_HOME_PATH'}) {
	     $GRID_HOME_PATH=$hash{'GRID_HOME_PATH'};
		 if($DEBUG eq "true"){
		    print("\nHome path::$GRID_HOME_PATH\n");
		 }
	  }
	  if(getOptValue('isActionSession')==1 && $hash{'COMMAND'}) {
	    $operationType=$hash{'COMMAND'};
        if($DEBUG eq "true"){
           print("\noperationType: $operationType\n");
        }
	  }
  }

 my $ROOT_CRS_TMP="";
 $SRVM_JLIB=$GRID_HOME_PATH."/jlib";
 my $LD_LIB_TMP=$GRID_HOME_PATH."/lib";

 if($PATCH_WITH eq "patch"){
      if($DEBUG eq "true"){
        print("\nwork with Patch\n");
      }
      
      if($operationType eq "apply"){
		  my $pwd = getcwd();
		  if (-d $PATCH_PATH){
            chdir($PATCH_PATH);
		  }
          find ( \&findInPatchPath, $PATCH_PATH );
          if($DEBUG eq "true"){
           print("\nSRVM JARS: $libraryPath{'SRVM_JARS'} $libraryPath{'SRVM_HAS_JAR'} $libraryPath{'SRVM_ASM_JAR'}\n");
           print("\nRootCrs: $libraryPath{'ROOTCRS_PL'}\n");
           print("\nRootHas: $libraryPath{'ROOTHAS_PL'}\n");
           print("\nSO files: $libraryPath{'SRVM_SO'} $libraryPath{'SRVM_HAS_SO'}\n");
	   print("\nXAG files: $libraryPath{'AG_UTILS'} $libraryPath{'AG_COMMON'}\n");
         }
         if(length $libraryPath{'AG_UTILS'} > 0){
          my $AGUTILS_DIR=dirname($libraryPath{'AG_UTILS'});
          copyRecursively($AGUTILS_DIR,$PATCHWORK."/xag");
         }elsif(length $libraryPath{'AG_COMMON'} > 0){
          my $AGCOMMON_DIR=dirname($libraryPath{'AG_COMMON'});
          copyRecursively($AGCOMMON_DIR,$PATCHWORK."/xag");
         }else{
          copyRecursively($GRID_HOME_PATH."/xag",$PATCHWORK."/xag");
         }
         if(length $libraryPath{'ROOTCRS_PL'} > 0){
          my $ROOTCRS_DIR=dirname($libraryPath{'ROOTCRS_PL'});
          copyRecursively($ROOTCRS_DIR,$PATCHWORK."/crs/install");
         }elsif(length $libraryPath{'ROOTHAS_PL'} > 0){
          my $ROOTHAS_DIR=dirname($libraryPath{'ROOTHAS_PL'});
          copyRecursively($ROOTHAS_DIR,$PATCHWORK."/crs/install");
         }else{
          copyRecursively($GRID_HOME_PATH."/crs/install",$PATCHWORK."/crs/install");
         }
		 chdir($GRID_HOME_PATH."/crs/install/");
         find ( \&findConfigParamInGrid, $GRID_HOME_PATH."/crs/install/" );
         if(length $CRSCONFIG_PARAM > 0){
            print("\n boot strap copying crsconfig_params\n");
            copy($GRID_HOME_PATH."/crs/install/crsconfig_params",$PATCHWORK."/crs/install");
         }
         chdir($pwd);
		 my $SRVM_LIB="";
		 my $SRVM_HAS_LIB="";
		 my $SRVM_ASM_LIB="";
		 my $updateBootStrap=0;
         my $NLIB_FILE_PATH="";
		 my %hash=readPropertiesFile($PATCHWORK."/bootstrap.properties");
         if(length  $libraryPath{'SRVM_SO'} > 0){
			$NLIB_FILE_PATH=dirname(abs_path($libraryPath{'SRVM_SO'}));
         }elsif(length $NLIB_FILE_PATH == 0 && length  $libraryPath{'SRVM_HAS_SO'} > 0){
			$NLIB_FILE_PATH=dirname(abs_path($libraryPath{'SRVM_HAS_SO'}));
         }
		 if(length $NLIB_FILE_PATH > 0) {
			$hash{"NLIB_FILE_PATH"} = $NLIB_FILE_PATH;
			$updateBootStrap=1;
		 }	
		 if(length  $libraryPath{'SRVM_JARS'} > 0){
		  $SRVM_LIB=dirname(abs_path($libraryPath{'SRVM_JARS'}));
		  $hash{"SRVM_LIB"} = $SRVM_LIB;
		  $updateBootStrap=1;
         }
         if(length  $libraryPath{'SRVM_HAS_JAR'} > 0){
		  $SRVM_HAS_LIB=dirname(abs_path($libraryPath{'SRVM_HAS_JAR'}));
		  $hash{"SRVM_HAS_LIB"} = $SRVM_HAS_LIB;
		  $updateBootStrap=1;
         }
         if(length  $libraryPath{'SRVM_ASM_JAR'} > 0){
          $SRVM_ASM_LIB=dirname(abs_path($libraryPath{'SRVM_ASM_JAR'}));
		  $hash{"SRVM_ASM_LIB"} = $SRVM_ASM_LIB;
		  $updateBootStrap=1;
         }
		 	 
		 if($updateBootStrap==1) {
			writePropertiesFile(\%hash, $PATCHWORK."/bootstrap.properties");
	     }
     }elsif($operationType eq "rollback"){
	       copyLibFromGridHome($GRID_HOME_PATH);
     }
  }elsif($PATCH_WITH eq "gihome"){
    if($DEBUG eq "true"){
        print("\n work with grid home files\n");
        print("\nGRID_HOME_PATH: $GRID_HOME_PATH \n");
    }
	copyLibFromGridHome($GRID_HOME_PATH);
  }
  changeFileOwner($OPATCHAUTO_OWNER,$OPATCHAUTO_GROUP,$OPATCHAUTO_TEMP);
  changeFilePermission($OPATCHAUTO_TEMP,"0775");
  changeFileOwner($OPATCHAUTO_OWNER,$OPATCHAUTO_GROUP,$DETECT_OH."/OPatch/auto/dbsessioninfo/lastsessioninfo_".$host.".txt");
}

sub copyLibFromGridHome{
   my $GRID_HOME_PATH = $_[0]; 
   print("\nGRID_HOME_PATH: $GRID_HOME_PATH \n");
   copyRecursively($GRID_HOME_PATH."/crs/install",$PATCHWORK."/crs/install");
   copyRecursively($GRID_HOME_PATH."/xag",$PATCHWORK."/xag");
}

sub findConfigParamInGrid{
   my $file_name =  $File::Find::name;
   if( -f $file_name && $file_name =~ /crsconfig_params/ ){
     $CRSCONFIG_PARAM=$File::Find::name;
     return;
   }
}

sub findInPatchPath {
    my $file_name =  $File::Find::name;
    my $libsrvmSOFile="files/oui/lib/libsrvm";
    my $libsrvmHasSOFile="files/oui/lib/libsrvmhas";
    my $srvm="files/jlib/srvm.jar";
    my $srvmHas="files/jlib/srvmhas.jar";
    my $srvmasm="files/jlib/srvmasm";
    
    if ( -f $file_name && $file_name =~ m/$libsrvmSOFile/ ) {
     $libraryPath{'SRVM_SO'}= $File::Find::name;
    }elsif( -f $file_name && $file_name =~ m/$libsrvmHasSOFile/ ){
      $libraryPath{'SRVM_HAS_SO'}= $File::Find::name;
    }elsif( -f $file_name && $file_name =~ /$srvm/ ){
      $libraryPath{'SRVM_JARS'}= $File::Find::name;
    }elsif( -f $file_name && $file_name =~ /$srvmHas/ ){
      $libraryPath{'SRVM_HAS_JAR'}= $File::Find::name;
    }elsif( -f $file_name && $file_name =~ /$srvmasm/ ){
      $libraryPath{'SRVM_ASM_JAR'}= $File::Find::name;
    }elsif( -f $file_name && $file_name =~ /rootcrs.pl/ ){
      $libraryPath{'ROOTCRS_PL'}= $File::Find::name;
    }elsif( -f $file_name && $file_name =~ /roothas.pl/ ){
      $libraryPath{'ROOTHAS_PL'}= $File::Find::name;
    }elsif( -f $file_name && $file_name =~ /agutils.pm/ ){
      $libraryPath{'AG_UTILS'}= $File::Find::name;
    }elsif( -f $file_name && $file_name =~ /agcommon.pm/ ){
      $libraryPath{'AG_COMMON'}= $File::Find::name;
    }
}

sub createChangeFolderPermission {
	my $folder = shift;
	createDirectory($folder);
	touchFile ($folder."/tempFile.txt", $folder);
	unlink $folder."/tempFile.txt";
	changeFileOwner($OPATCHAUTO_OWNER,$OPATCHAUTO_GROUP,$folder);
	changeFilePermission($folder,"0775");
}
