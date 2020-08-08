# Special variables, Special Arrays and Special constants in Perl

use strict;
use warnings;

# We define the above (pragmas) to force us to write good code
# and to provide information on how to correct errors
 
# 'say' prints a line followed by a newline
use feature 'say';

# Use Perl version 5.16
use v5.16;

if($#ARGV < 1){
	print "Usage: perl $0 <param1> <param2> \n";
	die;
}

my $skill = $ARGV[0]; # argument 1 for script
my $exp = $ARGV[1];   # argument 2 for script

print "Argument 1 - $skill\n";
print "Argument 2 - $exp\n";

print "Total number of arguments - $#ARGV\n"; # $#ARGV actually gives the last index of an array i.e. '1' in this case 
print "Special Arguments Array - @ARGV\n";

# %ENV is a special hash which stores all the environment variables as key=>value pairs

foreach ( keys %ENV ) {
	print "$_ => $ENV{$_}\n";
}

# special Constants

print "__FILE__: ",__FILE__,"\n"; # Current File name
print "__LINE__: ",__LINE__,"\n"; # This line number
print "__PACKAGE__: ",__PACKAGE__,"\n"; # Package name of this script

# __END__ defines the end of the Perl code in the file. 
# Any text that appears after __END__ is ignored by the Perl compiler. 
# Perl programmers often put module documentation after an __END__ token. 

# @INC or %INC stores perl module paths

#STDERR: It is the special file handle for standard error in any package.
#STDIN: The special file handle for standard input in any package.
#STDOUT: The special file handle for standard output in any package.


#$%, $FORMAT_PAGE_NUMBER: This variable finds the currently selected output channel and the current page number.
#$=, $FORMAT_LINES_PER_PAGE: This variable returns the current page length i.e. the lines which are printable of the currently selected output channel.
#$-, $FORMAT_LINES_LEFT: Returns the number of lines left on the page of the currently selected output channel.
#$~, $FORMAT_NAME: The name of the current report format for the currently selected output channel.
#$., $NR : Contains the line number of the filehandle last updated.
#$[ : This variable stores the index of the first element in an array, and of the first character in a substring.



