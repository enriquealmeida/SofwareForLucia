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
use strict;
use warnings;
use lib dirname(abs_path($0));
use module::DBUtilServices qw(getFileOwner getFileOwnerGroup changeFileOwner createDirectory);

my $originalOH = $ARGV[0];
my @dirPathLevels = getDirectoryPathLevels();
my $owner=getFileOwner($originalOH);
my $group=getFileOwnerGroup($originalOH);

foreach my $dirName (@dirPathLevels) {
  if (! -d $dirName) {
   createDirectory($dirName);
   changeFileOwner($owner,$group,$dirName);
  }
}
		
sub getDirectoryPathLevels
{
 my $tempPath="";
 my @tempDirArray;
 my @names = split m%/%, $ARGV[1];

 foreach my $i (0 .. $#names){
  if ( $i > 0){
      $tempPath= $tempPath."/". $names[$i];
      push(@tempDirArray, $tempPath );
  }
 }
 return @tempDirArray;
}
