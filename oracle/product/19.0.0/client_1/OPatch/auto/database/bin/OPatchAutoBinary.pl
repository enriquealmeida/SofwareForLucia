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

use module::CommandOptions qw(removeOpt getArguments getOptValue optExists  isDescSession  isApplySession isRollbackSession isQuerySession processArgs);
use module::DBUtilServices qw(getJavaHomePath getJreMemoryOptions readPropertiesFile removeFile);
use module::OPatchAutoBinaryCommandOptions qw();
use module::ClassPathLib qw(setBaseDir setCP getOPatchAutoBinaryCP getBootStrapCP setSrvmLibPath);

#Dumping additional args which does not have mapping.
foreach my $key (@ARGV) {
  processArgs($key);
}

my $scriptDir=dirname(abs_path($0));
my $opatchAutoDBDir=dirname($scriptDir);
my  $opatchAutoDir=dirname($opatchAutoDBDir);
my $BASE=dirname($opatchAutoDir);
my $DETECT_OH=dirname($BASE);
setBaseDir($BASE);

my $orginalArgs=getArguments();

my $OH="";
if(optExists('oh') == 1){
 $OH=getOptValue('oh');
}elsif(defined $ENV{'ORACLE_HOME'}){
 $OH=$ENV{'ORACLE_HOME'};
}

my $host = hostname();
$host = (split('\.', $host))[0];

if(optExists('version') == 0 && optExists('help') == 0 && (isApplySession()==0 && isRollbackSession()==0 && isQuerySession()==0)){
 print("\nERROR : Select either apply or rollback session.\n");
 exit(2);
}

if(optExists('version') == 0 && optExists('help') == 0 && length $OH == 0 ){
 print("\n ERROR : Provide a valid value for Oracle Home using '-oh' option\n");
 exit(3);
}

my $CP=$DETECT_OH."/oui/jlib";
setCP($CP);

my $jreOpt="";
if(optExists('jre')==1){
 $jreOpt=getOptValue('jre');
}


my $JAVA_HOME=getJavaHomePath($DETECT_OH,$jreOpt);
my $JAVA=$JAVA_HOME."/bin/java";
removeOpt('jre');

my $ouiLoc=getOptValue('oui');
if(optExists('oui')==0 || ! -d getOptValue('oui')){
  $ouiLoc=$DETECT_OH."/oui";
  if(! -d $ouiLoc){
   $ouiLoc="";
  }
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

if(isQuerySession()==1){
  $args=getArguments(); 
  my $systemPropsutil="-DOPatchauto.ORACLE_HOME=".$OH." -DOPatch.ORACLE_HOME=".$OH;
  my $opatchAutoBinaryUtilCP=getOPatchAutoBinaryCP();
  my $opatchAutoCoreUtil=$JAVA." ".$JAVA_VM_OPTION." ".$JRE_MEMORY_OPTIONS." -cp ".$opatchAutoBinaryUtilCP." ".$systemPropsutil." oracle/opatchauto/core/OpatchAutoCoreUtility ".$args;

  my $result=system($opatchAutoCoreUtil);
  $result = $result >> 8;
  exit($result);
}

my $bootStrapCompleted=0;
if(defined $ENV{'OPATCHAUTO_PERL_PATH'} && optExists('bootStrapCompleted')==0) {
    my $newArgs=$orginalArgs." -bootStrapCompleted";      		
	my @myArgs=split(' ',$newArgs);
	my $PERL_PATH=$ENV{'OPATCHAUTO_PERL_PATH'};
	exec("$PERL_PATH",$0,@myArgs);
}
if(defined $ENV{'OPATCHAUTO_PERL_PATH'} || optExists('bootStrapCompleted')==1){
  	$bootStrapCompleted=1;
  	if(optExists('bootStrapCompleted')==1) {
		removeOpt('bootStrapCompleted');
		$args=getArguments(); 
	}
 }

my $args=getArguments();
if($bootStrapCompleted==0 && optExists('version') == 0 && optExists('help') == 0){	 
		my $operationType="";
		if(isApplySession()==1){
			 $operationType="apply";
		}elsif(isRollbackSession()==1){
 			$operationType="rollback";
		}		   
		   my $Args_Edited=$args;
   		   $args_Edited="\"".$Args_Edited."\"";   		   
   		   
		   my $patchinfoLocation=$opatchAutoDir."/dbtmp/patchinginfo_$host.properties";
		   my $classPath=getBootStrapCP();			
	       my $perlAdditionalArgs="-operationType=".$operationType." -OH=".$ORACLE_HOME." -ARGS ".$args_Edited;
	       my $bootStrapperJavaInvocation=$JAVA." ".$JAVA_VM_OPTION." ".$JRE_MEMORY_OPTIONS." -DOPatch.ORACLE_HOME=".$DETECT_OH." -DOPatch.PATCH_INFO_LOCATION=".$patchinfoLocation." -cp ".$classPath." com.oracle.glcm.patch.auto.db.util.BootstrapHandler ".$perlAdditionalArgs;
	       
	       my $result = system($bootStrapperJavaInvocation);
	       $result = $result >> 8;
	       if($result!=0 && $result!=$_INVALIDOPTION_ERROR_ID){
	         print("\n$OPATCH_AUTO_MSG perl patching initializaion failed with error code $result.\n");
	         exit($result);
	       }
	       
	       if($result==0){
		    my $patchinginfoFile=$opatchAutoDir."/dbtmp/patchinginfo_$host.properties";
			if( -e $patchinginfoFile) {
				my %patchinginfo=readPropertiesFile($patchinginfoFile);
				if(exists $patchinginfo{'PATCHWORK_DIR'}){
					$PATCHWORK=$patchinginfo{'PATCHWORK_DIR'};		   
					my %hash=readPropertiesFile($PATCHWORK."/bootstrap.properties");
					my $size=keys %hash;
					if($size>0){
						if($hash{'IS_PERL_PATCH'}) {
							my $OPATCHAUTO_PERL_PATH=$OH."/perl/bin/perl";
							my $PERL_PATCH=$hash{'IS_PERL_PATCH'};
							if($hash{'PERL_PATH'}) {
							  $OPATCHAUTO_PERL_PATH=$hash{'PERL_PATH'};
							  $ENV{'OPATCHAUTO_PERL_PATH'}=$OPATCHAUTO_PERL_PATH;
							}
							if("true" eq $PERL_PATCH) {			     		
							  my $newArgs=$args." -bootStrapCompleted";      		
							  my @myArgs=split(' ',$newArgs);
							 exec("$OPATCHAUTO_PERL_PATH",$0,@myArgs);						
						    }
						} else {
							$ENV{'OPATCHAUTO_PERL_PATH'}=$OPATCHAUTO_PERL_PATH;
						}
					}
				}
		 	 }
		   }	       
}


my $systemProps="-DOPatchauto.ORACLE_HOME=".$OH." -DOPatch.ORACLE_HOME=".$OH;
my $opatchAutoBinaryCP=getOPatchAutoBinaryCP();
my $opatchAutoBinaryJava=$JAVA." ".$JAVA_VM_OPTION." ".$JRE_MEMORY_OPTIONS." -cp ".$opatchAutoBinaryCP." ".$systemProps." oracle/opatchauto/core/OPatchAutoCore ".$args;

my $result=system($opatchAutoBinaryJava);
$result = $result >> 8;

exit($result);