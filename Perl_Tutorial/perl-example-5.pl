
use strict;
use warnings;

 
# We define the above (pragmas) to force us to write good code
# and to provide information on how to correct errors
 
# 'say' prints a line followed by a newline
use feature 'say';

# Use a Perl version of switch called given when
# To use given+when without warnings, one need the following -
use feature 'switch';
no if $] >= 5.018, warnings => qw( experimental::smartmatch );
 
# Use Perl version 5.16
use v5.16;

# ---------- LOOPING ----------

# For loop
for(my $i = 0; $i < 10; $i++){
  say $i;
}
 
# Print odds with the While loop
my $i = 1;
 
while ($i < 10){
  if($i % 2 == 0){
    $i++;
 
    # next skips back to the beginning of the loop - works like continue in C
    next;
  }
 
  # Last exits out of the loop - - works like break in C
  if($i == 7){ last; }
 
  say $i;
  $i++;
}
 
# The Do while loop is used when you must loop once
my $lucky_num = 7;
my $guess;

do {
  say "Guess a Number Between 1 and 10";
 
  # This is how you get user input
  $guess = <STDIN>;
} while $guess != $lucky_num;
 
say "You guessed 7";
 
# Given When is Perl Switch statement
my $age_old = 18;

given ($age_old) {
  when($_ > 16) {
    say "Drive";
 
    # Will continue with the next cases
    continue;
  }
  when($_ > 17) {say "Go Vote";}
  default {say "Nothing Special";}
}
 