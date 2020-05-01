#!perl
# run with cat input | sum.pl

use lib "src";
use Checksum;
use List::Util qw/reduce/;

print reduce { $a + $b } 
  map { $_->{sector} } 
  grep { $_->isValid } 
  map { Checksum->new($_) } 
  map { chomp; $_ } 
  <>;

print "\n";

