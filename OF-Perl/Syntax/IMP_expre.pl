#match operator
print "hello" if $string =~ m/cowboys/;
print "hello" if $string =~  /cowboys/;  # same but shorter
print "hello" if $string =~  /cowboys/i; # same but case insensitive

#substitution operator

my $string = "cowboys and aliens";
$string =~ s/cowboys/martians/;
print $string; 
# prints "martians and aliens"

#re-using expression 

# !!!!!!  NICE

my $xls_regexp = qr/\.xls$/i;

for my $filename ( filesnames() ) {
    print "hello" if $filename =~ $xls_regexp;
}