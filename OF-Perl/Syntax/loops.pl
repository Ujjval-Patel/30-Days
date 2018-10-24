#moving over array

my @array = ('a', 'b', 'c', 1, 2, 3);

foreach $i (@array)
{
    print $i;
}
print "\n";

#moving over hash

## !!!!!!!  order of hash is not preserved
my %has = (a => 1, b => 2, c => 3);

foreach $i (keys %has)
{
    print $has{$i};
}

print "\n";

my $i = 0;

while ($i < 4) {
    print $i;
    $i++;
}
# prints '0123'

print "\n";

#something new

foreach my $i (@array) {
    next if $i > 3; # don't print anything for $i > 3
    print $i;
}