BEGIN{
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
use strict;
use warnings;
    

#Command line parsing module getting used.
use module::ExportPath qw(exportSudoPath);

exportSudoPath();
my $sudoPath=`which sudo`;
print("$sudoPath");