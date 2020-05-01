package Checksum;
  use Data::Dumper;

sub new {
  my ($name, $string) = @_;
  bless parse($string), $name;
}

sub parse {
  my ($string) = @_;
  my ($encrypted, $sector, $checksum) = $string =~ /([a-z-]+)-(\d+)\[([a-z]+)\]/;
  return {
    encrypted => $encrypted,
    sector => $sector,
    checksum => $checksum,
  };
}

sub fiveMostCommonLetters {
  my ($encrypted) = @_;
  my @letters = split //, $encrypted;
  return join '', splice @letters, 0, 5;
}

1;
