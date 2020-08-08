
use strict;
use warnings;

# 'say' prints a line followed by a newline
use feature 'say';
 
# Use Perl version 5.16
use v5.16;

# ---------- HASHES ----------
# Hashes use keys to access values
 
my %employees = (
  "Sue" => 35,
  "Paul" => 43,
  "Sam" => 39
);
 
# Use $ to access the hash value
# Note you don't have to use quotes for the key - quote can be given though
printf("Sue is %d \n", $employees{Sue});

# If $employees_ref has hash reference then value can be accessed in below 2 ways
# make reference of the hash variable
my $employees_ref = \%employees;
printf("Paul is %d \n", $employees_ref->{Paul}); #1
printf("Sam is %d \n", $$employees_ref{Sam});  #2

# similarly making reference of array variable  
# $reference_array = \@array; 
 
# Add a new key value to a hash
$employees{Frank} = 44;

# Iterate over hash and print keys and values
while (my ($k,$v)=each %employees){print "$k $v\n"}
 
# Delete a key / value
delete $employees{Frank};
 
# Iterate over hash and print keys and values
while (my ($k,$v)=each %employees){print "$k $v\n"}
 
# You can slice data from a hash
my @ages = @employees{"Sue", "Sam"};
say join(", ",@ages);
 
# Convert a hash into an array
my @hash_array = %employees;
say join(", ",@hash_array);
 
# Check if Sam exists and print out using the Ternary Operator
say ((exists $employees{Sam}) ? "Sam is here" : "No Sam");
 
# Cycle through keys with keys
for my $key (keys %employees){
  if ($employees{$key} == 35){
    say "Hi Sue";
  }
}


 