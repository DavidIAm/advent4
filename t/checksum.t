#!perl

use lib 'src';
use Checksum;
use Test::More tests  => 11;

# five most common

my $checksum = Checksum->new("aaaaa-bbb-z-y-x-123[abxyz]");
is($checksum->{checksum}, "abxyz");
is($checksum->{sector}, 123);
is($checksum->{encrypted}, "aaaaa-bbb-z-y-x");

is(Checksum::fiveMostCommonLetters('abcdefghi'), "abcde", "get five most common");
is(Checksum::fiveMostCommonLetters('a-b|c8dEef'), "abcde", "ignore non lower-case letter");
is(Checksum::fiveMostCommonLetters('a-cb|8dEef'), "abcde", "sort appropriately");
is(Checksum::fiveMostCommonLetters('a-ccb|8dEef'), "cabde", "ignore duplicate");

# validate

ok(Checksum->new("aaaaa-bbb-z-y-x-123[abxyz]")->isValid, "example one");
ok(Checksum->new("a-b-c-d-e-f-g-h-987[abcde]")->isValid, "example two");
ok(Checksum->new("not-a-real-room-404[oarel]")->isValid, "example three");
ok(!Checksum->new("totally-real-room-200[decoy]")->isValid, "example four");
