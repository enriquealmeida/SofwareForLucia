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
    eval 'exec %ORACLE_HOME%\perl\bin\perl.exe -S $0 ${1+"$@"}'
	if $running_under_some_shell;
#!/usr/bin/perl -w

use strict;

use Test::Harness;
use Test::Harness::Util qw( all_in blibdirs shuffle );

use Getopt::Long;
use Pod::Usage 1.12;
use File::Spec;

use vars qw( $VERSION );
$VERSION = '2.64';

my $shuffle = 0;
my $dry = 0;
my $blib = 0;
my $lib = 0;
my $recurse = 0;
my @includes = ();
my @switches = ();

# Allow cuddling the paths with the -I
@ARGV = map { /^(-I)(.+)/ ? ($1,$2) : $_ } @ARGV;

# Stick any default switches at the beginning, so they can be overridden
# by the command line switches.
unshift @ARGV, split( ' ', $ENV{PROVE_SWITCHES} ) if defined $ENV{PROVE_SWITCHES};

Getopt::Long::Configure( 'no_ignore_case' );
Getopt::Long::Configure( 'bundling' );
GetOptions(
    'b|blib'        => \$blib,
    'd|debug'       => \$Test::Harness::debug,
    'D|dry'         => \$dry,
    'h|help|?'      => sub {pod2usage({-verbose => 1}); exit},
    'H|man'         => sub {pod2usage({-verbose => 2}); exit},
    'I=s@'          => \@includes,
    'l|lib'         => \$lib,
    'perl=s'        => \$ENV{HARNESS_PERL},
    'r|recurse'     => \$recurse,
    's|shuffle'     => \$shuffle,
    't'             => sub { unshift @switches, '-t' }, # Always want -t up front
    'T'             => sub { unshift @switches, '-T' }, # Always want -T up front
    'w'             => sub { push @switches, '-w' },
    'W'             => sub { push @switches, '-W' },
    'strap=s'       => \$ENV{HARNESS_STRAP_CLASS},
    'timer'         => \$Test::Harness::Timer,
    'v|verbose'     => \$Test::Harness::verbose,
    'V|version'     => sub { print_version(); exit; },
) or exit 1;

$ENV{TEST_VERBOSE} = 1 if $Test::Harness::verbose;

# Handle blib includes
if ( $blib ) {
    my @blibdirs = blibdirs();
    if ( @blibdirs ) {
        unshift @includes, @blibdirs;
    }
    else {
        warn "No blib directories found.\n";
    }
}

# Handle lib includes
if ( $lib ) {
    unshift @includes, 'lib';
}

# Build up TH switches
push( @switches, map { /\s/ && !/^".*"$/ ? qq["-I$_"] : "-I$_" } @includes );
$Test::Harness::Switches = join( ' ', @switches );
print "# \$Test::Harness::Switches: $Test::Harness::Switches\n" if $Test::Harness::debug;

@ARGV = File::Spec->curdir unless @ARGV;
my @argv_globbed;
my @tests;
if ( $] >= 5.006001 ) {
    require File::Glob;
    @argv_globbed = map { File::Glob::bsd_glob($_) } @ARGV;
}
else {
    @argv_globbed = map { glob } @ARGV;
}

for ( @argv_globbed ) {
    push( @tests, -d $_ ? all_in( { recurse => $recurse, start => $_ } ) : $_ )
}

if ( @tests ) {
    shuffle(@tests) if $shuffle;
    if ( $dry ) {
        print join( "\n", @tests, '' );
    }
    else {
        print "# ", scalar @tests, " tests to run\n" if $Test::Harness::debug;
        runtests(@tests);
    }
}

sub print_version {
    printf( "prove v%s, using Test::Harness v%s and Perl v%vd\n",
        $VERSION, $Test::Harness::VERSION, $^V );
}

__END__

=head1 NAME

prove -- A command-line tool for running tests against Test::Harness

=head1 SYNOPSIS

prove [options] [files/directories]

=head1 OPTIONS

    -b, --blib      Adds blib/lib to the path for your tests, a la "use blib"
    -d, --debug     Includes extra debugging information
    -D, --dry       Dry run: Show the tests to run, but don't run them
    -h, --help      Display this help
    -H, --man       Longer manpage for prove
    -I              Add libraries to @INC, as Perl's -I
    -l, --lib       Add lib to the path for your tests
        --perl      Sets the name of the Perl executable to use
    -r, --recurse   Recursively descend into directories
    -s, --shuffle   Run the tests in a random order
        --strap     Define strap class to use
    -T              Enable tainting checks
    -t              Enable tainting warnings
        --timer     Print elapsed time after each test file
    -v, --verbose   Display standard output of test scripts while running them
    -V, --version   Display version info

Single-character options may be stacked.  Default options may be set by
specifying the PROVE_SWITCHES environment variable.

=head1 OVERVIEW

F<prove> is a command-line interface to the test-running functionality
of C<Test::Harness>.  With no arguments, it will run all tests in the
current directory.

Shell metacharacters may be used with command lines options and will be exanded 
via C<File::Glob::bsd_glob>.

=head1 PROVE VS. "MAKE TEST"

F<prove> has a number of advantages over C<make test> when doing development.

=over 4

=item * F<prove> is designed as a development tool

Perl users typically run the test harness through a makefile via
C<make test>.  That's fine for module distributions, but it's
suboptimal for a test/code/debug development cycle.

=item * F<prove> is granular 

F<prove> lets your run against only the files you want to check.
Running C<prove t/live/ t/master.t> checks every F<*.t> in F<t/live>,
plus F<t/master.t>.

=item * F<prove> has an easy verbose mode

F<prove> has a C<-v> option to see the raw output from the tests.
To do this with C<make test>, you must set C<HARNESS_VERBOSE=1> in
the environment.

=item * F<prove> can run under taint mode

F<prove>'s C<-T> runs your tests under C<perl -T>, and C<-t> runs them
under C<perl -t>.

=item * F<prove> can shuffle tests

You can use F<prove>'s C<--shuffle> option to try to excite problems
that don't show up when tests are run in the same order every time.

=item * F<prove> doesn't rely on a make tool

Not everyone wants to write a makefile, or use L<ExtUtils::MakeMaker>
to do so.  F<prove> has no external dependencies.

=item * Not everything is a module

More and more users are using Perl's testing tools outside the
context of a module distribution, and may not even use a makefile
at all.

=back

=head1 COMMAND LINE OPTIONS

=head2 -b, --blib

Adds blib/lib to the path for your tests, a la "use blib".

=head2 -d, --debug

Include debug information about how F<prove> is being run.  This
option doesn't show the output from the test scripts.  That's handled
by -v,--verbose.

=head2 -D, --dry

Dry run: Show the tests to run, but don't run them.

=head2 -I

Add libraries to @INC, as Perl's -I.

=head2 -l, --lib

Add C<lib> to @INC.  Equivalent to C<-Ilib>.

=head2 --perl

Sets the C<HARNESS_PERL> environment variable, which controls what
Perl executable will run the tests.

=head2 -r, --recurse

Descends into subdirectories of any directories specified, looking for tests.

=head2 -s, --shuffle

Sometimes tests are accidentally dependent on tests that have been
run before.  This switch will shuffle the tests to be run prior to
running them, thus ensuring that hidden dependencies in the test
order are likely to be revealed.  The author hopes the run the
algorithm on the preceding sentence to see if he can produce something
slightly less awkward.

=head2 --strap

Sets the HARNESS_STRAP_CLASS variable to set which Test::Harness::Straps
variable to use in running the tests.

=head2 -t

Runs test programs under perl's -t taint warning mode.

=head2 -T

Runs test programs under perl's -T taint mode.

=head2 --timer

Print elapsed time after each test file

=head2 -v, --verbose

Display standard output of test scripts while running them.  Also sets
TEST_VERBOSE in case your tests rely on them.

=head2 -V, --version

Display version info.

=head1 BUGS

Please use the CPAN bug ticketing system at L<http://rt.cpan.org/>.
You can also mail bugs, fixes and enhancements to 
C<< <bug-test-harness@rt.cpan.org> >>.

=head1 TODO

=over 4

=item *

Shuffled tests must be recreatable

=back

=head1 AUTHORS

Andy Lester C<< <andy at petdance.com> >>

=head1 COPYRIGHT

Copyright 2004-2006 by Andy Lester C<< <andy at petdance.com> >>.

This program is free software; you can redistribute it and/or 
modify it under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>.

=cut

__END__
:endofperl
