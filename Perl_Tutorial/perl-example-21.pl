# This script is using module test.pm which is in the same directory

use strict;
use warnings;
#use test;
require test;


use lib q{.}; # Useful when package is in another directory. Here '.' indicates same directory

my $skill = $ARGV[0];
my $exp = $ARGV[1];

# call sub from test.pm
#addSkills($skill, $exp); # use case
test::addSkills($skill, $exp);  # require case

# print exported global variable %skillsExp
#print $skillsExp{$skill}, "\n";   # use case  
print $test::skillsExp{$skill}, "\n";   # require case

#test::getSkillsExp();   # use case  
test::getSkillsExp();   # require case
