use strict;
use warnings;

 
# We define the above (pragmas) to force us to write good code
# and to provide information on how to correct errors

# 1) use strict 
# Forces script to declare the scope of a variable 
# Identifies barewords

# 2) use warnings
# Missing semicolon
# Wrong syntax
# Deprecated function
# Declare a variable with same name again
 
# 'say' prints a line followed by a newline
use feature 'say';
 
# Use Perl version 5.16
use v5.16;

# ---------- SCALARS ----------
# There are 3 data types in Perl Scalars, Arrays and Hashes
 
# Use the my function to declare a variable
# The Sigil $ says we are defining a scalar or single value
# The variable must start with a letter or _ and then numbers there after
# A variable receives the default value of undef


my $name = 'Derek';
 
# You can assign multiple values like this and scalars can
# contain strings or numbers
 
my ($age, $street) = (40, '123 Main St');
 
# If you use " for strings you can include things like - newlines with \n and variables
# Backslash quotes(\") to use them in strings
 
my $my_info = "$name lives on \"$street\"\n";
say $my_info;
 
# You can avoid escaping quotes with q{} for single quotes and qq{} for double quotes
my $var = 10;
print(q(This is a single quoted string without interpolation, $var));
print "\n";

$my_info = qq{$name lives on "$street"\n};
print $my_info;

# q{} too allows you select the delimiters of your string, but it works as a single quote ' works: It does NOT interpolate variables.

my $first_name = 'foo';
print qq(The "name" is "$first_name"\n);
#print qq(The )name( is "$first_name"\n); # Bareword found Error
print qq{The )name( is "$first_name"\n};
print qq[The )name} is "$first_name"\n];
print q[The )name} is "$first_name"\n];
print "\n";

# The qw operator stands for quote word because it considers each word of the given string as it is quoted
# This qw() uses parentheses so it seems like it is a function but it is not. It uses different types of delimiters which are shown below


my @String = qw/Ram is a boy/;
print "@String\n";
@String = qw{Geeks for Geeks};
print "@String\n";
@String = qw[Geeks for Geeks];
@String = qw'Geeks for Geeks';
@String = qw"Geeks for Geeks";
print "@String\n";
@String = qw!Geeks for Geeks!;
print "@String\n";
@String = qw@Geeks for Geeks@;
print "@String\n";

# backquote is a punctuation mark (`)
# qx is a alternative to using back-quotes to execute system commands.

my @output = qx(hostname);
print "@output\n";

@output = qx!hostname!;
print "@output\n";


# You can define a long string over multiple lines like this - i.e. retain formatting
 
my $bunch_of_info = <<"END";
This is a
bunch of information
on multiple lines
END
 
# say ends the line with a newline
say $bunch_of_info;
 
# The largest integer you can hold
my $big_int = 18446744073709551615;
 
# You can type formatted strings by defining the data type after %
# %c : Character
# %s : string
# %d : Decimal
# %u : Unsigned integer
# %f : Floating Point (Decimal Notation)
# %e : Floating Point (Scientific Notation)
printf("%u \n", $big_int + 1);
 
# You can trust 16 digits of precision for floats on most machines
my $big_float = .1000000000000001;
 
# You can define the decimal precision amount
printf("%.16f \n", $big_float + .1000000000000001);
 
# Switch values of scalars
my $first = 1;
my $second = 2;
($first, $second) = ($second, $first);
say "$first $second";

# ---Eval function ---
# Eval function evaluates EXPR at execution time as if EXPR were a separate Perl script.
# An eval EXPR statement is evaluated separately each time the function is called.
# Eval function is used to evaluate a code or an expression and trap the error (in case of failure). Error is trapped in $@.

# Create a string containing Perl code i.e Expression
my $code = 
q|
    my $text = "Hello";
    print "$text\n";
    
    # Deliberately introduce an error.
    jljlk
|;

# Evaluate an expression
my $result = eval($code);

# unless successful in eval'ing the
# code, eval() returns undef and
# the error is found in $@.
unless($result) {
    print $@;
}

print "$result\n"; # prints 1 i.e. true in case of successful evaluation of expression. In case of failure it returns undef 

# In Perl, 0/undef is equivalent of boolean false and non-zero value is equivalent of boolean true
# In Perl, when a subroutine returns 0 or undef, it means a failure, and some other true value means success.

 
