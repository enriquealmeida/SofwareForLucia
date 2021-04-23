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

use module::DBUtilServices qw(getJavaHomePath getJreMemoryOptions);
use module::ClassPathLib qw(setBaseDir setCP getOpatchAutoCP);

my $scriptDir=dirname(abs_path($0));
my $opatchAutoDBDir=dirname($scriptDir);
my  $opatchAutoDir=dirname($opatchAutoDBDir);
my $BASE=dirname($opatchAutoDir);
my $DETECT_OH=dirname($BASE);
setBaseDir($BASE);


my $CP=$DETECT_OH."/oui/jlib";
setCP($CP);

my $JAVA_HOME=getJavaHomePath($DETECT_OH,"");
my $JAVA=$JAVA_HOME."/bin/java";

$ouiLoc=$DETECT_OH."/oui";

my $JRE_MEMORY_OPTIONS="";
if(defined $ENV{'JRE_MEMORY_OPTIONS'}){
 $JRE_MEMORY_OPTIONS=$ENV{'JRE_MEMORY_OPTIONS'};
}
$JRE_MEMORY_OPTIONS=getJreMemoryOptions($ouiLoc."/oraparam.ini",$JRE_MEMORY_OPTIONS,$JAVA);

my $JAVA_VM_OPTION="";
if(defined $ENV{'JAVA_VM_OPTION'}){
  $JAVA_VM_OPTION=$ENV{'JAVA_VM_OPTION'};
}

$args= "@ARGV";

my $opatchAutoCP=getOpatchAutoCP();
my $patchLevelFinderJava=$JAVA." ".$JAVA_VM_OPTION." ".$JRE_MEMORY_OPTIONS." -cp ".$opatchAutoCP." com/oracle/glcm/patch/auto/db/product/patchlevel/SshRemoteConnectionHandler ".$args;
my $result=system($patchLevelFinderJava);
$result = $result >> 8;
exit($result);
