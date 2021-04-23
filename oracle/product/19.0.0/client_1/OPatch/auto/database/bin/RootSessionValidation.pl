use strict;
use warnings;
use English;
use File::Spec::Functions;
use Getopt::Long;
use v5.8.8;
use File::Basename qw(dirname basename);
use Cwd  qw(abs_path);
use lib dirname(abs_path($0));

my $scriptDir=dirname(abs_path($0));
my $opatchAutoDBDir=dirname($scriptDir);
my $opatchAutoDir=dirname($opatchAutoDBDir);
my $BASE=dirname($opatchAutoDir);
my $DETECT_OH=dirname($BASE);

my $parentid;
my $fh;
my $rootSessionId;
GetOptions('parentid=s'           => \$parentid);
my $filename = $DETECT_OH."/OPatch/auto/dbsessioninfo/rootSessionInfoFile.txt";
if (open($fh, $filename)) {
	$rootSessionId = <$fh>;
    chomp $rootSessionId;
	close $fh;
	if ($rootSessionId ne $parentid) {
		print("Error: Root session id mismatch.");
		exit(1);
	}
}
exit(0);
