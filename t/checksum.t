#!perl

use lib 'src';
use Checksum;
use Test::More tests  => 6;

# five most common

my $checksum = Checksum->new("aaaaa-bbb-z-y-x-123[abxyz]");
is($checksum->{checksum}, "abxyz");
is($checksum->{sector}, 123);
is($checksum->{encrypted}, "aaaaa-bbb-z-y-x");

is(Checksum->fiveMostCommonLetters('abcdef'), "abcde", "get five most common");
is(Checksum->fiveMostCommonLetters('a-b|c8dEef'), "abcde", "ignore non lower-case letter");
is(Checksum->fiveMostCommonLetters('a-cb|8dEef'), "abcde", "sort appropriately");

