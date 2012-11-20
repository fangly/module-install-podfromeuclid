use strict;
use warnings;
use Test::More;
use File::Spec;
use File::Copy;
use File::Temp    qw[tempdir];
use Capture::Tiny qw[capture_merged];
use Config;

{
   my $make = $Config{make};
   mkdir 'dist';
   my $tmpdir = tempdir(DIR => 'dist', CLEANUP => 1);
   mkdir File::Spec->catdir($tmpdir, 'script');

   my $ori  = File::Spec->catfile('t', 'data', 'my_script.pl');
   my $dest = File::Spec->catfile($tmpdir, 'script', 'my_script.pl');
   copy($ori, $dest) or die "Copy failed: $!";

   chdir $tmpdir or die "$!\n";

   open MFPL, '>Makefile.PL' or die "$!\n";
   print MFPL <<EOF;
use strict;
use inc::Module::Install;
name 'My-Script';
version '0.01';
author 'John Doe';
abstract 'Check out my cool script';
license 'perl';
pod_from 'script/my_script.pl';
WriteAll;
EOF
   close MFPL;

   my $merged = capture_merged { system "$^X Makefile.PL" };
   diag("$merged");
   my @tests = (
      'inc/Module/Install/PodFromEuclid',
   );
   for my $inc (@tests) {
      ok -f $_, "Exists: '$_'";
   }

   ok -f File::Spec->catfile($tmpdir, 'script', 'my_script.pod'), 'POD file exists';

   my $distclean = capture_merged { system "$make distclean" };
   diag("$distclean");

   ok -f File::Spec->catfile($tmpdir, 'script', 'my_script.pod'), 'POD file exists';

}

done_testing;
