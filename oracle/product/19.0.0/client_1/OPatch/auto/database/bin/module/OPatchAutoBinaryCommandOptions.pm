package module::OPatchAutoBinaryCommandOptions;

use strict;
use warnings;

use Getopt::Long qw(GetOptions);
use Exporter qw(import);
use File::Basename qw(dirname basename);
use Cwd  qw(abs_path);
use lib dirname(abs_path($0));
Getopt::Long::Configure(qw{no_auto_abbrev no_ignore_case_always pass_through});

use module::CommandOptions qw(processOpts processSwitch processArgs);
our @EXPORT_OK = qw();

GetOptions(
   '<>'      => \&processArgs,
   'jre=s'   => \&processOpts,
   'analyze' => \&processSwitch,
   'oh=s'    => \&processOpts,
   'target_type=s'    => \&processOpts,
   'invPtrLoc=s'    => \&processOpts,
   'customLogDir=s'    => \&processOpts,
   'help|h'  => \&processSwitch,
   'version'  => \&processSwitch,
   'binary'  => \&processSwitch,
   'bootStrapCompleted'  => \&processSwitch,
   'filebusypatching'  => \&processSwitch,
   'force_conflict'  => \&processSwitch,
   'skip_conflict'  => \&processSwitch,
   'no_relink'  => \&processSwitch
  );
  
