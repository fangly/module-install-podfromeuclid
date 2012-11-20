package MyModule;

use Getopt::Euclid qw(:minimal_keys :defer);

our $VERSION = '0.99';

=head1 NAME

MyModule - This is my module

=head1 REQUIRED ARGUMENTS

=over

=item  -s[ize]=<h>x<w>

Specify size of simulation

=for Euclid:
    h.type:    int > 0
    h.default: 24
    w.type:    int >= 10
    w.default: 80

=back

=head1 OPTIONS

=over

=item  -l[[en][gth]] <l>

Length of simulation. The default is l.default

=for Euclid:
    l.type:    num
    l.default: 1.2

=head1 AUTHOR

Jane Doe

=head1 LICENSE

Perl

=head2 VERSION

0.99

=cut


1;
