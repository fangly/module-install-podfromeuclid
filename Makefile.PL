use strict;
use lib 'lib';
use inc::Module::Install;
use Config;

name     'Module-Install-PodFromEuclid';
author   'Florent Angly <florent.angly@gmail.com>';
all_from 'lib/Module/Install/PodFromEuclid.pm';

###auto_license holder => 'Florent Angly';

build_requires 'Test::More'    => 0.47; # in Perl 5.6.2
build_requires 'File::Temp'    => 0;    # in Perl 5.6.1

requires 'Module::Install'  => 1.00;
requires 'Getopt::Euclid'   => '0.3.4';

###readme_from;    # Self hosting!
###githubmeta;

###clean_files 'dist have_make LICENSE';

###if ( $Config{make} and can_run( $Config{make} ) ) {
###  print "I can run '", $Config{make}, "' good\n";
###  open HAVEMAKE, '>have_make' or die "$!\n";
###  print HAVEMAKE "meep\n";
###  close HAVEMAKE;
###}
###makemaker_args(dist => { PREOP => "$^X ./tools/git-log.pl > ./Changes" });

WriteAll();
