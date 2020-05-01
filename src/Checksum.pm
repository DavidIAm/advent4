package Checksum;

sub new {
  my ($name, $string) = @_;
  return bless parse($string), $name;
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
}

1;
