
use strict;
use warnings;

 
# We define the above (pragmas) to force us to write good code
# and to provide information on how to correct errors
 
# 'say' prints a line followed by a newline
use feature 'say';
 
# Use Perl version 5.16
use v5.16;


# ---------- FILE IO ----------
my $emp_file = 'resources/employees.txt';
 
# $fh is the file handle which is used to access the file
# < means we are opening the file for reading
# $! Provides an error message
open my $fh, '<', $emp_file
  or die "Can't open file : $!";
 
# While there are lines keep reading
while(my $info = <$fh>){
  # Delete newline at the end of each line
  chomp($info);
  if ($info){
	  my ($emp_name, $job, $id) = split /:/, $info;
	  print "$emp_name is a $job and has the id $id \n";
  }
}
 
# Close the file
# Warn() function raises a warning message
# die() function - Warn() function + exit
close $fh or die "Couldn't Close File : $!";
 
# Open the file for appending
open $fh, '>>', $emp_file
  or die "Can't open file : $!";
 
# Append to the file
print $fh "Mark:Salesman:124\n";
 
# Close the file
close $fh or die "Couldn't Close File : $!";
 
# Open file to read and write it
open $fh, '+<', $emp_file
  or die "Can't open file : $!";
  
# While there are lines keep reading
while(my $info = <$fh>){
  # Delete newline at the end of each line
  chomp($info);
 
  if ($info){
	  my ($emp_name, $job, $id) = split /:/, $info;
	  print "$emp_name is a $job and has the id $id \n";
  }
}
 
# Seek to the beginning
seek $fh, 0, 0;
 
# Insert item
print $fh "Phil:Cricketer:125\n"; # few characters missing of exisitng line why ??

# Seek to the beginning
seek $fh, 0, 0;

# While there are lines keep reading
while(my $info = <$fh>){
  # Delete newline at the end of each line
  chomp($info);
 
  if ($info){
	  my ($emp_name, $job, $id) = split /:/, $info;
	  print "$emp_name is a $job and has the id $id \n";
  }
}
 
# Close the file
close $fh or die "Couldn't Close File : $!";

#----Directories-----

#1) Display all files in a directory
# glob(<Directory Path>) OR opendir()

#2) Create a new directory
# mkdir(<Directory Name>)

#3) Remove a directory
# rmdir(<Directory Name>)

#4) Change a directory
# chdir(<Directory Name>)




















  
