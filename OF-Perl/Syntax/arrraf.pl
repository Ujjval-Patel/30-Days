my @ar = (1,2,3,4); # array

my $arref1 = \@ar;  # array reference 

my $arref2 = ['a','b','c','d'];  # array reference 

print $ar[0];

# Dereference + access element 1

print $arref1 -> [1];
print $arref2 -> [1];

# A array reference inside a array reference
my $ar_in_ar = [a ,b , c,['india','canada','USA']];

# How to dereference array references

my @a1=@{ $ar_in_ar }; # i think it's typecasting statinc variable array into dynamic arrat
my @a2=@$ar_in_ar;  # does the same work
my @a3=@{$ar_in_ar->[3]}; # takes that 1D array of india , can,usa
