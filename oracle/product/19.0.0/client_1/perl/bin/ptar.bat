@rem = '--*-Perl-*--
@echo off
if "%OS%" == "Windows_NT" goto WinNT
perl -x -S "%0" %1 %2 %3 %4 %5 %6 %7 %8 %9
goto endofperl
:WinNT
perl -x -S %0 %*
if NOT "%COMSPEC%" == "%SystemRoot%\system32\cmd.exe" goto endofperl
if %errorlevel% == 9009 echo You do not have Perl in your PATH.
if errorlevel 1 goto script_failed_so_exit_with_non_zero_val 2>nul
goto endofperl
@rem ';
#!perl
#line 15
    eval 'exec c:\app\oracle\product\19.0.0\client_1\perl\bin\perl.exe -S $0 ${1+"$@"}'
	if $running_under_some_shell;
#!/usr/bin/perl
use strict;

use Getopt::Std;
use Archive::Tar;
use File::Find;

my $opts = {};
getopts('dcvzthxf:I', $opts) or die usage();

### show the help message ###
die usage() if $opts->{h};

### enable debugging (undocumented feature)
local $Archive::Tar::DEBUG                  = 1 if $opts->{d};

### enable insecure extracting.
local $Archive::Tar::INSECURE_EXTRACT_MODE  = 1 if $opts->{I};

### sanity checks ###
unless ( 1 == grep { defined $opts->{$_} } qw[x t c] ) {
    die "You need exactly one of 'x', 't' or 'c' options: " . usage();
}

my $compress    = $opts->{z} ? 1 : 0;
my $verbose     = $opts->{v} ? 1 : 0;
my $file        = $opts->{f} ? $opts->{f} : 'default.tar';
my $tar         = Archive::Tar->new();


if( $opts->{c} ) {
    my @files;
    find( sub { push @files, $File::Find::name;
                print $File::Find::name.$/ if $verbose }, @ARGV );

    Archive::Tar->create_archive( $file, $compress, @files );
    exit;
}

my $tar = Archive::Tar->new($file, $compress);

if( $opts->{t} ) {
    print map { $_->full_path . $/ } $tar->get_files;

} elsif( $opts->{x} ) {
    print map { $_->full_path . $/ } $tar->get_files
        if $verbose;
    Archive::Tar->extract_archive($file, $compress);
}



sub usage {
    qq[
Usage:  ptar -c [-v] [-z] [-f ARCHIVE_FILE] FILE FILE ...
        ptar -x [-v] [-z] [-f ARCHIVE_FILE]
        ptar -t [-z] [-f ARCHIVE_FILE]
        ptar -h

    ptar is a small, tar look-alike program that uses the perl module
    Archive::Tar to extract, create and list tar archives.

Options:
    x   Extract from ARCHIVE_FILE
    c   Create ARCHIVE_FILE from FILE
    t   List the contents of ARCHIVE_FILE
    f   Name of the ARCHIVE_FILE to use. Default is './default.tar'
    z   Read/Write zlib compressed ARCHIVE_FILE (not always available)
    v   Print filenames as they are added or extraced from ARCHIVE_FILE
    h   Prints this help message
    I   Enable 'Insecure Extract Mode', which allows archives to extract
        files outside the current working directory. (Not advised).

See Also:
    tar(1)
    Archive::Tar

    \n]
}

=head1 NAME

ptar - a tar-like program written in perl

=head1 DESCRIPTION

ptar is a small, tar look-alike program that uses the perl module
Archive::Tar to extract, create and list tar archives.

=head1 SYNOPSIS

    ptar -c [-v] [-z] [-f ARCHIVE_FILE] FILE FILE ...
    ptar -x [-v] [-z] [-f ARCHIVE_FILE]
    ptar -t [-z] [-f ARCHIVE_FILE]
    ptar -h

=head1 OPTIONS

    x   Extract from ARCHIVE_FILE
    c   Create ARCHIVE_FILE from FILE
    t   List the contents of ARCHIVE_FILE
    f   Name of the ARCHIVE_FILE to use. Default is './default.tar'
    z   Read/Write zlib compressed ARCHIVE_FILE (not always available)
    v   Print filenames as they are added or extraced from ARCHIVE_FILE
    h   Prints this help message

=head1 SEE ALSO

tar(1), L<Archive::Tar>.

=cut

__END__
:endofperl
