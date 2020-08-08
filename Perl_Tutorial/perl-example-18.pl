# References can be created to scalars, arrays, hashes and subroutines.
# Reference Declaration - By using a Backslash (\) before a variable.
# Dereferencing - 
	#Scalar - $$
	#Array - @$
	#Hash - %$
	#Subroutine - &$ 

use strict;
use warnings;

# We define the above (pragmas) to force us to write good code
# and to provide information on how to correct errors
 
# 'say' prints a line followed by a newline
use feature 'say';

# Use Perl version 5.16
use v5.16;

my $banner = "Chemical";
my @games = (12,'Temple',34,56.4);
my %pairs = ("Yahoo" => 101, "Google" => 102, "Gmail" => 103, "Cnn" => 104, "Facebook" => 105);

# Print References
my $scalarRef = \$banner;
print "$scalarRef\n";

my $arrayRef = \@games;
print "$arrayRef\n";

my $hashRef = \%pairs;
print "$hashRef\n";

# Dereferencing

print "$$scalarRef\n";
print "@$arrayRef\n";
print %$hashRef, "\n";

print "@$arrayRef[0]\n";
print "$arrayRef->[0]\n";
print "@games[0]\n";

print %$hashRef{Yahoo}, "\n";
print $hashRef->{Yahoo}, "\n";
print $$hashRef{Yahoo}, "\n";
print %pairs{Yahoo}, "\n";
print $pairs{Yahoo}, "\n";


# Creating anonymous array and hash

# $games and $pairs are storing references for anonymous array and anonymous hash respectively
my $games = [12,'Temple',34,56.4]; # Using []
my $pairs = {"Yahoo" => 101, "Google" => 102, "Gmail" => 103, "Cnn" => 104, "Facebook" => 105}; # Using {}

print "@$games\n";
print %$pairs, "\n";

print "$games->[0]\n";
print "$pairs->{Yahoo}\n";

# For reference to subroutine
sub val { print "val" };
my $valsub = \&val;

print "$valsub\n";
print &$valsub,"\n";

# anonymous subroutine
# $sub_ref is a reference to anonymous subroutine
my $sub_ref = sub { print "val" }; # Notice subroutine name is not there for anonymous subroutine
print "$sub_ref\n";
print &$sub_ref,"\n";





