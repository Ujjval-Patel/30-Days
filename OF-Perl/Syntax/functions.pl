sub rawr{
    print "RAWR!";
}
rawr();

sub para{
    my ($dino , $how) = @_;
    print "$dino sayl rawr $how\n";
}

para(
    dino=>"ujjval",
    how=>"loudly"
);

# rawr("Stegasaurus", "loudly"); also works

# returning values

sub choc
{
    return "cookies and cream!\n";
}

my $flavour= choc();
print "$flavour\n"

# you know how to work with array!!