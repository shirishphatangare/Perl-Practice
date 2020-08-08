# Regular Expressions in Perl

use strict;
use warnings;

# We define the above (pragmas) to force us to write good code
# and to provide information on how to correct errors
 
# 'say' prints a line followed by a newline
use feature 'say';

# Use Perl version 5.16
#use v5.16;

# Pattern Matching using Regular Expressions - /<pattern>/ OR m/<pattern>/ OR m{<pattern>} OR m!<pattern>! - Any delimiter can be used with m
# =~ and !~ are binding operators
my $string = "com.T.tutorialspoint.perl 5.812345 TTT //";

# A regex consisting of a word matches any string that contains that word
# use 'i' for Case insensitive matching -  m/<pattern>/i
if ($string =~ /perl/) {
	print "Pattern matched with String\n";
}

# $string do not contain word python
if ($string !~ /python/) {
	print "Pattern not matched with String\n";
}

# m// can also be used for pattern matching
if ($string =~ m/\/\//) { # trying to match pattern '//' in $string
	print "Pattern matched with String\n";
}

# When using m any delimiter can be used like m{} OR m!! etc.
if ($string =~ m!//!) { # Notice escape sequence not required for '//' when using '!' as delimiter for m
	print "Pattern matched with String\n";
}

# Write regex to match below entries in test.txt file
#com.W.tutorialspoint.C# 5.812345 AAA // *
#com.X.tutorialspoint.C++ 6.815345 BBB // =
print "-----------------------\n";
open (FHR, "<resources/test.txt") or die "can not open file $!";
while (<FHR>){
	chomp $_;
	if ( $_ =~ m{^com\..\.\w{14}\.C(.*)[5-6]\.81[2 5]\d{3}\s(AAA|BBB)\s//\s[* =]} ){
		print "$_\n";
	}
}
close (FHR);

# Substitute regular ecpression
# s/<Matched Pattern>/<Replaced Pattern>/ - Only first occurance is replaced
# s/<Matched Pattern>/<Replaced Pattern>/g - All occurances are replaced globally with 'g' flag
print "-----------------------\n";
print "Substitute regular ecpression\n";

open (FHR, "<resources/test.txt") or die "can not open file $!";

while (<FHR>){
	chomp $_;
	$_ =~ s/com/org/;
	print "$_\n";
}

close (FHR);

# Notice jorg.D.tutorialspoint.redHat 0.812345 III // = com com - only first com is replaced. Use $_ =~ s/com/org/g; to replace all com

# Transliterate Regular Expression - tr/a-z/A-Z/
print "-----------------------\n";
print "Transliterate Regular Expression\n";
open (FHR, "<resources/test.txt") or die "can not open file $!";

while (<FHR>){
	chomp $_;
	$_ =~ tr/LDAP.*HHH/ldap.*hhh/; # All occurances are translated by default - no 'g' flag here
	print "$_\n";
}

close (FHR);
