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
use module::ClassPathLib qw(setBaseDir setCP getLibPathForDriver getOpatchAutoCP);
use module::CommandOptions qw(getArguments optExists getOptValue processOpts);
use module::ExportPath qw(setLDLibPath);

GetOptions(
   'GRID_HOME=s'   		=> \&processOpts,
   'oh=s'   			=> \&processOpts,
   'CLUSTERNODES=s'    	=> \&processOpts,
   'OBJECTLOC=s'    	=> \&processOpts,
   'CRS_ACTION=s'       => \&processOpts,
   'RESPONSEOBJECTLOC=s'    	=> \&processOpts,
   'JVM_HANDLER=s'  	=> \&processOpts,
   'filepath=s'  		=> \&processOpts,
   'PATCHSIZE=s'  		=> \&processOpts,
   'CLONEHOMEMAP=s'  	=> \&processOpts
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

my $JAVA_HOME=getJavaHomePath($DETECT_OH,"");
my $JAVA=$JAVA_HOME."/bin/java";

$ouiLoc=$DETECT_OH."/oui";

my $JAVA_VM_OPTION="";
if(defined $ENV{'JAVA_VM_OPTION'}){
  $JAVA_VM_OPTION=$ENV{'JAVA_VM_OPTION'};
}
$ENV{'ORACLE_HOME'} = $DETECT_OH;
$args=getArguments();

if (optExists('JVM_HANDLER')==1) {
	my $jvm_handler=getOptValue('JVM_HANDLER');
	my $libPathForDriverCP=getLibPathForDriver();
	my $opatchAutoCP=getOpatchAutoCP();
	if (optExists('GRID_HOME')==1) {	
	  setLDLibPath(getOptValue('GRID_HOME'));
	}
	
	my $JRE_MEMORY_OPTIONS="";
	if($PLATFORM eq 'HP-UX'){
	  if(defined $ENV{'OPATCH_JRE_MEMORY_OPTIONS'}){
	    $JRE_MEMORY_OPTIONS=$ENV{'OPATCH_JRE_MEMORY_OPTIONS'};
	  }elsif(defined $ENV{'JRE_MEMORY_OPTIONS'}){
	    $JRE_MEMORY_OPTIONS=$ENV{'JRE_MEMORY_OPTIONS'};
	  }
	  $JRE_MEMORY_OPTIONS=getJreMemoryOptions($ouiLoc."/oraparam.ini",$JRE_MEMORY_OPTIONS,$JAVA);
	}
	my $jvmHandlerJava=$JAVA." ".$JAVA_VM_OPTION." ".$JRE_MEMORY_OPTIONS." -cp ".$libPathForDriverCP.$opatchAutoCP." ".$jvm_handler." ".$args;
	my $result=system($jvmHandlerJava);
	$result = $result >> 8;
	exit($result);
} else {
	my $filepath=getOptValue('filepath');	
	if (optExists('filepath')==0)
	 {
	   print("\n\nERROR: Filepath is not provided. Unable to identify file owner.\n");
	   exit(1);
	 } elsif (! -e $filepath) {
	 	print("\n\nERROR: File does not exist. Unable to identify file owner.\n");
	    exit(2);
	 }
	my $FILE_OWNER=getFileOwner($filepath);
	print($FILE_OWNER);
}
