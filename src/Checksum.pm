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
  my %letters = ();
  foreach $letter ( grep { /[a-z]/ } split //, $encrypted ) {
    $letters{$letter} ++;
  }
  my @letters = sort { $letters{$b} <=> $letters{$a} || $a cmp $b } keys %letters;
  return join '', splice @letters, 0, 5;
}

sub isValid {
  my ($self) = @_;
  return $self->{checksum} eq fiveMostCommonLetters($self->{encrypted});
}

1;
