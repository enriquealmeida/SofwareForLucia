BEGIN {
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
use Getopt::Long;
use module::DBUtilServices qw(getJavaHomePath getFileOwner getJreMemoryOptions);
use module::ClassPathLib qw(setBaseDir setCP setDetectOH setSrvmLibPath getTopologyCreatorCP);
use module::CommandOptions qw(getArguments optExists getOptValue processOpts);
use module::ExportPath qw(setLDLibPath);

GetOptions(
   'GRID_HOME=s'   		=> \&processOpts,
   'OBJECTLOC=s'    	=> \&processOpts,
   'ACTION=s'       => \&processOpts,
   'JVM_HANDLER=s'  	=> \&processOpts
  );

my $scriptDir=dirname(abs_path($0));
my $opatchAutoDBDir=dirname($scriptDir);
my  $opatchAutoDir=dirname($opatchAutoDBDir);
my $BASE=dirname($opatchAutoDir);
my $DETECT_OH=dirname($BASE);
setBaseDir($BASE);

my @uname = uname();
my $PLATFORM="$uname[0]";

my $CP=$DETECT_OH."/oui/jlib";
setCP($CP);
my $gridHome=getOptValue('GRID_HOME');
setSrvmLibPath($gridHome."/jlib",$gridHome."/jlib",$gridHome."/jlib");
setDetectOH($gridHome);
my $JAVA_HOME=getJavaHomePath($DETECT_OH,"");
my $JAVA=$JAVA_HOME."/bin/java";

$ouiLoc=$DETECT_OH."/oui";

my $JAVA_VM_OPTION="";
if(defined $ENV{'JAVA_VM_OPTION'}){
  $JAVA_VM_OPTION=$ENV{'JAVA_VM_OPTION'};
}

$args=getArguments();
my $jvm_handler=getOptValue('JVM_HANDLER');
my $opatchAutoCP=getTopologyCreatorCP();
setLDLibPath($gridHome);

my $JRE_MEMORY_OPTIONS="";
if($PLATFORM eq 'HP-UX'){
  if(defined $ENV{'OPATCH_JRE_MEMORY_OPTIONS'}){
    $JRE_MEMORY_OPTIONS=$ENV{'OPATCH_JRE_MEMORY_OPTIONS'};
  }elsif(defined $ENV{'JRE_MEMORY_OPTIONS'}){
    $JRE_MEMORY_OPTIONS=$ENV{'JRE_MEMORY_OPTIONS'};
  }
  $JRE_MEMORY_OPTIONS=getJreMemoryOptions($ouiLoc."/oraparam.ini",$JRE_MEMORY_OPTIONS,$JAVA);
}
my $jvmHandlerJava=$JAVA." ".$JAVA_VM_OPTION." ".$JRE_MEMORY_OPTIONS." -cp ".$opatchAutoCP." ".$jvm_handler." ".$args;
my $result=system($jvmHandlerJava);
$result = $result >> 8;
exit($result);
