BEGIN{
my @modules=('Sys::Hostname',' File::Basename','Cwd','File::Find','File::Copy','File::Path','Getopt::Long','File::stat','Pod::Usage');
  foreach my $moduleName (@modules) {
    my $moduleDefined=eval "use $moduleName; 1" ?1:0;
    if($moduleDefined==0){
       print("\n$moduleName  module not present/module is not accessible\n");
       exit(2);
    }
  }
  
  
  use Cwd  qw(abs_path);
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
use lib dirname(abs_path($0));

use module::CommandOptions qw(addOpt removeOpt getArguments getOptValue optExists  isDescSession  isApplySession isRollbackSession isResumeSession processArgs);
use module::DBUtilServices qw(getActiveUser getFileOwner getJavaHomePath getJreMemoryOptions);
use module::DBValidationUtil qw(isDirectoryExists validateOPatchIsTriggeredFromOneOfOH);
use module::OPatchAutoCommandOptions qw();
use module::ClassPathLib qw(setBaseDir setDetectOH setCP setSrvmLibPath getOPatchautoRHPCP);

#Dumping additional args which does not have mapping.
foreach my $key (@ARGV) {
  processArgs($key);
}

my $scriptDir=dirname(abs_path($0));
my $opatchAutoDBDir=dirname($scriptDir);
my  $opatchAutoDir=dirname($opatchAutoDBDir);
my $BASE=dirname($opatchAutoDir);
setBaseDir($BASE);
my $DETECT_OH=dirname($BASE);
setDetectOH($DETECT_OH);
my $SRVM_JLIB=$DETECT_OH."/jlib";
setSrvmLibPath($SRVM_JLIB, $SRVM_JLIB, $SRVM_JLIB);

my $currentUser=getActiveUser();
my $currentHomeOwner=getFileOwner($DETECT_OH."/oraInst.loc");

if($currentUser eq 'root'){
    print("\nOPatchauto RHP patching is not supported as 'root' user. Please run as '$currentHomeOwner' user.\n");
	print("opatchauto returns with error code = 2\n");
	exit(2);
}

my $isOper=isApplySession() || isRollbackSession();
my $ORACLE_HOME="";
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
   if($valid==1){
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


if(optExists('version') == 0 && optExists('help') == 0 && (isApplySession()==0 && isRollbackSession()==0 && isResumeSession==0)){
 print("\nERROR : Select either apply rollback or resume session.\n");
 exit(2);
}

if(optExists('version') == 0 && optExists('help') == 0 && length $ORACLE_HOME == 0 ){
 print("\n ERROR : Provide a valid value for Oracle Home using '-oh' option\n");
 exit(3);
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


my $CP=$DETECT_OH."/oui/jlib";
setCP($CP);

$ENV{'ORACLE_HOME'} = $DETECT_OH;

if(-e $ORACLE_HOME."/oraInst.loc" && optExists('invPtrLoc')==0 && isDescSession()==0 && $isOper==1){
  addOpt('invPtrLoc',$ORACLE_HOME."/oraInst.loc");
}

my $jreOpt="";
if(optExists('jre')==1){
 $jreOpt=getOptValue('jre');
}


my $JAVA_HOME=getJavaHomePath($DETECT_OH,$jreOpt);
my $JAVA=$JAVA_HOME."/bin/java";
removeOpt('jre');

my $ouiLoc=$DETECT_OH."/oui";
if(! -d $ouiLoc){
   $ouiLoc="";
}

my $JRE_MEMORY_OPTIONS="";
if(defined $ENV{'JRE_MEMORY_OPTIONS'}){
 $JRE_MEMORY_OPTIONS=$ENV{'JRE_MEMORY_OPTIONS'};
}
$JRE_MEMORY_OPTIONS=getJreMemoryOptions($ouiLoc."/oraparam.ini",$JRE_MEMORY_OPTIONS,$JAVA);

my $JAVA_VM_OPTION="";
if(defined $ENV{'JAVA_VM_OPTION'}){
  $JAVA_VM_OPTION=$ENV{'JAVA_VM_OPTION'};
}

my $args=getArguments();
my $systemProps="-DOPatchAuto.HOME=".$DETECT_OH." -DOPatch.ORACLE_HOME=".$DETECT_OH." -DOPatch.OUI_LOCATION=".$ouiLoc;
;
my $opatchAutoRHPCP=getOPatchautoRHPCP();
my $opatchAutoRHPJava=$JAVA." ".$JAVA_VM_OPTION." ".$JRE_MEMORY_OPTIONS." -cp ".$opatchAutoRHPCP." ".$systemProps." com.oracle.glcm.patch.auto.rhp.OPatchAutoRHP ".$args;

my $result=system($opatchAutoRHPJava);
$result = $result >> 8;
exit($result);

sub getEnv{
 my $envName=$_[0];
 my $envVal="";
 if(defined $ENV{$envName}){
	 $envVal=$ENV{$envName};
 }
 return $envVal;
}