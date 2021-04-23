package module::ExportPath;

#Stick to perl version v5.x.x
use v5.8.8;
use Cwd  qw(abs_path);
use Cwd ;
use File::Basename qw(dirname);
use Exporter qw(import);
use POSIX qw(uname);

our @EXPORT_OK = qw(exportSudoPath setLDLibPath);

my $scriptDir=dirname(abs_path($0));

sub exportSudoPath{
  my $home = cwd();
  my $propertyFileName=$scriptDir."/opatchauto.properties";
  my %properties;
  if(-e $propertyFileName){
    open(F,$propertyFileName);
   while (<F>){
     ($name,$val)=m/(\w+)\s*=(.+)/;
     $properties{$name}=$val;
     last;
   }
   close(F);
   my $path="";
   if(defined $ENV{'PATH'}){
    $path=$properties{'PATH'}.":".$ENV{'PATH'};
   }else{
    $path=$properties{'PATH'};
   }
   $ENV{'PATH'} =$path;
  }
  my $etcProfileFilePath="/etc/profile";
  my $etcEnvFilePath="/etc/environment";
  if(isSudoCommandFound()==0){
     if(-e $etcProfileFilePath){
        system("source $etcProfileFilePath");
       if(isSudoCommandFound()==0){
         if(-e $etcEnvFilePath){
          system("source $etcEnvFilePath");
          if(isSudoCommandFound()==0){
           exit(100);
          }
        }
      }
    }
  }
  return  $ENV{'PATH'};
}

sub isSudoCommandFound{
  my $sudoPath=`which sudo`;
  chomp $sudoPath;
  $sudoPath=abs_path($sudoPath);
  if(-e $sudoPath){
    return 1;
  }
  return 0;
}

sub setLDLibPath {
  my $home = shift;
  my @uname = uname();
  my $OS = "$uname[0]";
  
  if ( $OS eq "Linux")
    {
		$ENV{LD_LIBRARY_PATH} = "$home/lib:$home/srvm/lib:" . $ENV{LD_LIBRARY_PATH};
        
		# Linux ( ppc64 || s390x ) => LD_LIBRARY_PATH lib32		
		my $unameSize=@uname;
		my $ARCH=$uname[$unameSize-1];
		if($ARCH eq "ppc64" || $ARCH eq "s390x"){
          $ENV{LD_LIBRARY_PATH} = "$home/lib32:$home/srvm/lib32:" . $ENV{LD_LIBRARY_PATH};
		}		
        
		if ($ARCH =~ /x86_64/)
		{
		  $ENV{LD_LIBRARY_PATH} = "$home/oui/lib/linux64:" . $ENV{LD_LIBRARY_PATH};
		}
    }
    elsif ($OS eq "HP-UX")
    {
	    $ENV{LD_LIBRARY_PATH} = "$home/lib:$home/srvm/lib:" . $ENV{LD_LIBRARY_PATH};
		$ENV{SHLIB_PATH} = "";
    }
    elsif ($OS eq "AIX" )
    {
	    $ENV{LD_LIBRARY_PATH} = "$home/lib:$home/srvm/lib:" . $ENV{LIBPATH};
		$ENV{LIBPATH} = "$home/lib:$home/srvm/lib:" . $ENV{LIBPATH};
        $ENV{OBJECT_MODE} = "32_64";
    }
    elsif ( $OS eq "SunOS" )
    {
	    $ENV{LD_LIBRARY_PATH_64} = "$home/lib:$home/srvm/lib:" . $ENV{LD_LIBRARY_PATH_64};
		$ENV{LD_LIBRARY_PATH} = "$home/lib:$home/srvm/lib:" . $ENV{LD_LIBRARY_PATH};
    }
}