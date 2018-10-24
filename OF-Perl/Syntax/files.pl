# This code might not run, just understand the syntax
#creating path

use Path::Tiny;

my $dir  = path("/tmp");
my $file = path("foo.txt");

# navigating the files
my $subdir = $dir->child("foo");
my $file   = $subdir->child("bar.txt");

# Reading directories

for ( $dir->children ) { ... }

my $iter = $dir->iterator;
while ( my $next = $iter->() ) { ... }