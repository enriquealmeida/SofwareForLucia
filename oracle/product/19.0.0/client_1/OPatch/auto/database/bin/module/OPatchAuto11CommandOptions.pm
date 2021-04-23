package module::OPatchAuto11CommandOptions;

use strict;
use warnings;
use Pod::Usage;
use Getopt::Long qw(GetOptions);
use Exporter qw(import);
use File::Basename qw(dirname basename);
use Cwd  qw(abs_path);
use lib dirname(abs_path($0));
Getopt::Long::Configure(qw{no_auto_abbrev no_ignore_case_always pass_through});

use module::CommandOptions qw(processOpts processSwitch processArgs optExists getOptValue);
our @EXPORT_OK = qw();

# the return code to give when the incorrect parameters are passed
my $usage_rc = 1;

GetOptions(
   'rollback'   => \&processArgs,
   'ocmrf=s'    => \&processOpts,
   'patchdir=s'    => \&processPatch,
   'patchn=s'    => \&processPatch,
   'oh=s'    => \&processOhOpt,
   'och=s'    => \&processOhOpt,
   'norestart'  => \&processSwitch,
   'report' => \&translateSwitch,
   'resume'  => \&processResumeOpt,
   'help|h'  => \&processSwitch
  ) or pod2usage($usage_rc);
  
# Check validity of args
pod2usage(-msg => "Invalid extra options passed: @ARGV",
          -exitval => $usage_rc) if (@ARGV);
  
sub translateSwitch{
  my $option=$_[0];
  if($option eq "report"){
    processSwitch("analyze");
  }
}

sub processOhOpt{
 my $opt=$_[0];
 if( ($opt eq "och" && optExists('oh')==1) || ($opt eq "oh" && optExists('och')==1)){
  print("\n Invalid arguments. -och and -oh cannot be given together.");
  exit(2);
 }
 
 processOpts('oh',$_[1]);
 if($opt eq "och" ){
   validateOchOpt();
 }
}

sub validateOchOpt{
  my $oh = getOptValue('oh');
  my $crsCtlFilePath=$oh."/bin/crsctl.bin";
  if(! -e $crsCtlFilePath){
    print("\n -och supports only grid home.");
    exit(2);
  }
}

sub processResumeOpt{
  print("\n Unknown option $_[0]");
  print("\n For help invoke 'opatch auto -h'");
  exit(2);
}

my $patchDir="";
my $patchN="";
our $patchLoc="";
sub processPatch{
  my $opt=$_[0];
  if($opt eq "patchn" && defined $patchDir > 0){
   $patchLoc=$patchDir."/".$_[1];
   processOpts("patchLoc",$patchLoc);
  }elsif($opt eq "patchdir" && defined $patchN > 0){
   $patchLoc=$_[1]."/".$patchN;
   processOpts("patchLoc",$patchLoc);
  }elsif($opt eq "patchn"){
   $patchN=$_[1];
  }else{
   $patchDir=$_[1];
  }
}
1;