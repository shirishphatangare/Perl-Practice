use strict;
use warnings;

 
# We define the above (pragmas) to force us to write good code
# and to provide information on how to correct errors
 
# 'say' prints a line followed by a newline
use feature 'say';
 
# Use Perl version 5.16
use v5.16;


# ---------- CONDITIONALS ----------

# Perl considers undef, 0, 0.0, "", and "0" to be false
# Comparison operators for numbers
# ==, !=, <, <=, >, >=
# Boolean Operators: !, &&, || - not, and, or can also be used
 
# If, elsif, else statements
my $age = 80;
my $is_not_intoxicated = 1;
my $age_last_exam = 16;
 
# Simple if example
if($age < 16){
  say "You can't drive";
} elsif(!$is_not_intoxicated) { # 1 is true
  say "You can't drive";
} else {
  say "You can drive";
}
 
# Boolean Operators: !, &&, ||
if(($age >= 1) && ($age < 16)){
  say "You can't Drive";
} elsif(!$is_not_intoxicated){ # 1 is true
  say "You can't drive";
} elsif(($age >= 80) && (($age > 100) || (($age - $age_last_exam) > 5))){
  say "You can't drive";
} else {
  say "You can drive";
}


# not, and, or can also be used
if(($age >= 1) and ($age < 16)){
  say "You can't Drive";
} elsif(not $is_not_intoxicated){ # 1 is true
  say "You can't drive";
} elsif(($age >= 80) and (($age > 100) or (($age - $age_last_exam) > 5))){
  say "You can't drive";
} else {
  say "You can drive";
}
 
# Comparison operators for strings - eq, ne, lt, le, gt, ge
if('a' eq 'b'){
  say "a equals b";
} else {
  say "a doesn't equal b";
}
 
# unless is the opposite of if
unless(!$is_not_intoxicated){ # 1 is true
  say "Get Sober";
}
 
# Ternary operator returns different values depending on a condition
say (($age > 18) ? "Can Vote" : "Can't Vote");

