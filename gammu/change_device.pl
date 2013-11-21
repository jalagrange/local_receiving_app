open(INFILE, $ARGV[0]);
@file = <INFILE>;
close(INFLIE);

foreach $line (@file)
{
  $line =~ s/^device =.*$/device = $ARGV[1]/;
}

open(OUTFILE, ">", $ARGV[0]);
foreach $line (@file)
{
  print OUTFILE $line;
}
close(OUTFILE);
