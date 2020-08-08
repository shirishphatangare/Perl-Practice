use strict;
use warnings;

 
# We define the above (pragmas) to force us to write good code
# and to provide information on how to correct errors
 
# 'say' prints a line followed by a newline
use feature 'say';

# Use Perl version 5.16
use v5.16;


# ---------- STRINGS ----------
my $long_string = "Random Long String";
 
say "Length of String ", length $long_string;
 
# index returns the location of a String
printf("Long is at %d \n", index $long_string, "Long");
 
# rindex returns the last occurance
printf("Last g is at %d \n", rindex $long_string, "g");
 
# Concatenate strings with .
$long_string = $long_string . ' isn\'t that long';

# Concatenate strings with . and q{}
$long_string = $long_string . q{ isn\'t that long};
 
# substr receives a string, the starting index and the
# number of characters to retreive
 
say "Index 7 through 10 ", substr $long_string, 7, 4;
 
my $animal = "animals";
 
# chop deletes and returns the last Character
printf("Last character is %s \n", chop $animal);
 
# chomp deletes the last newline and returns string without newline
my $no_newline = "No Newline\n";
chomp $no_newline;
print $no_newline;
print "\n";
 
# Uppercase and lowercase functions
printf("Uppercase : %s \n", uc $long_string);
printf("Lowercase : %s \n", lc $long_string);
printf("1st Uppercase : %s \n", ucfirst $long_string);
 
# s/// takes a list of characters on the left and replaces them with characters on the right
# Replace spaces with comma space
# g = Replace all occurances
# i = ignore case
$long_string =~ s/ /, /g;
say $long_string;
 
# x can repeat a string
my $two_times = "What I said is " x 2;
say $two_times;
 
# Create a range of letters in an array
my @abcs = ('a' .. 'z');
 
# Combine values in an array and define separation with join
print join(", ", @abcs), "\n";
 
# Increment letters with ++
my $letter = 'c';
say "Next Letter ", ++$letter;

