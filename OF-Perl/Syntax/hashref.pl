# copy-pasted almost same as arrref

=begin comment
Key things to remember
Mastering this topic requires some memorization and a lot of practice. Key things to remember:

[ ... ] creates a array reference
{ ... } creates a hash reference
@$var or @{ ... } dereferences a array
%$var or %{ ... } dereferences a hash
=cut
my %hash = (a => 1, b => 2, c => 3);        # hash
my $hashref1 = \%hash;                      # hash reference
my $hashref2 = {x => 11, y => 12, z => 13}; # hash reference

# Access hash value 
print $hash{a};       # prints 1

# Dereference + access hash value 
print $hashref1->{a}; # prints 1
print $hashref2->{x}; # prints 11

# A hash reference inside a hash reference
my $hashes_in_hashes = { 
    a => 1,
    b => 2,
    c => { x => 1, y => 2 },
};

# How to dereference hash references
my %hash1 = %{ $hashes_in_hashes };      # (a => 1, b => 2, c => {x => 1, y => 2})
my %hash2 = %$hashes_in_hashes;          # same but less typing
my %hash3 = %{ $hashes_in_hashes->{c} }; # (x => 1, y => 2)