#Stick to perl version v5.x.x
use v5.8.8;
use File::Basename qw(dirname basename);
use Cwd;
my @args=@ARGV;
my $argCnt=@args;

if($argCnt !=3 ){
 print("\nSupplied number of arguments should be equal to 3\n");
 exit(-1); 
}

if($args[0] eq 'zip'){
  zip($args[1],$args[2]);
}elsif($args[0] eq 'unzip'){
   unzip($args[1],$args[2]);
}else{
  print("\nInvalid operation:: $args[0]\n");
  exit(2);
}

sub zip{
  my $cwd = cwd();
  my $zipCmdPath=findPath('zip');
  my $srcPath=$_[0];
  my $zipFilePath=$_[1];
  my $parentFolderPath=dirname($srcPath);
  my $folderName=basename($srcPath);
  if(-d $srcPath){
   chdir($parentFolderPath);
   my $status=system($zipCmdPath,"-r",$zipFilePath,$folderName);
   chdir($cwd);
   exit($status);
  }else{
   print("\n $srcPath not found.\n");
   exit(2);
  }
}

sub unzip{
  my $cwd = cwd();
  my $unzipCmdPath=findPath('unzip');
  my $zipFilePath=$_[0];
  my $destPath=$_[1];
  if(-f $zipFilePath){
    my $status=system($unzipCmdPath,"-q",$zipFilePath,"-d",$destPath);
    exit($status);
  }else{
   print("\n $zipFilePath not found.\n");
   exit(2);
  }
}

sub findPath{
 my $cmdName=$_[0];
 my $cmdPath="";
 
  if(-e "/bin/".$cmdName){
     $cmdPath="/bin/".$cmdName;
  }elsif (-e "/usr/bin/".$cmdName){
   $cmdPath="/usr/bin/".$cmdName;
  }elsif (-e "/usr/local/bin/".$cmdName){
   $cmdPath="/usr/local/bin/".$cmdName;
  }else{
   my $status=system("which",$cmdName);
   if($status==0){
    $cmdPath=$cmdName;
   }
  }
  
  if(length $cmdPath <= 0){
   print("\n $cmdName  Command Not Found...\n");
   exit(2);
  }
  
  return $cmdPath;
}