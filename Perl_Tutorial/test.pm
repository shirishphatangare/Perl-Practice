# Package or module in perl --

# Namespace uniquely identifies variables or objects
# Package/module is a combination of sub-routines, variables, objects which has its own namespace.
# Using Package/module has great advantage in code reusability.
# For a Package/module, File extension must be '.pm'
# First line of a package must be the package name -  package<Package Name>
# File name and Package name must be the same.
# At the end of Package 1; must be there to evaluate the code to true

# Using Package inside a script --

# 1) Use <Package name>
# 2) require <Package Name>

# use vs require --

# use is evaluated at compile-time, require at run-time.
# In use, fully qualified name has to be mentioned in order to call a function or variable name, whereas in require it is not required. 

# Some Examples of use and require -- 

# use Email::Sender::Simple qw(sendmail); # sendmail is a subroutine name
# Email/Sender folder in @INC has module Simple.pm which has first line - package Email::Sender::Simple;
# Simple.pm script has sendmail subroutine exported as below -

# exports => {
#     sendmail        => Sub::Exporter::Util::curry_class('send'),
#     try_to_sendmail => Sub::Exporter::Util::curry_class('try_to_send'),
# }

# sendmail can be used directly as shown below
# sendmail($msg);

# use Email::MIME; -- Email folder in @INC has MIME.pm which has create function 
# create function in MIME can be accessed as below -
# Email::MIME->create(.......

# require( "/npe/globals/perl/is_prod.pm" );
# is_prod.pm has subroutine - sub is_prod {... which is accessed directly as below
# if ( ! is_prod() ) {....

# require( "/npe/globals/perl/error.pm" );

# Exporting functions and variables from a perl Package/module --

# Functions and variables from a package can be exported by using Exporter module and inheriting it.
# 1) use Exporter;
# Exporter module exports variables and functions to it's user namespace.
# 2) Scope of the variable must be "our" in order to export variable globally.
# 3) our @ISA = qw(Exporter);
# IS A relationship means the package is getting inherited from Exporter module. Properties of Exporter module can be used within the package.
# 4) our @EXPORT = qw(function and variable names separated with spaces)
# 5) our @EXPORT_OK = qw(function and variable names separated with spaces) --> Exported on demand


# Search paths to find a module --

# If the package and script using a package are within the same directory, PERL can easily find the package. 
# However, if the package is in a different directory, then follow the below steps --

# a) Update @INC - @INC is a special array which stores the search paths of a module. If module is not in this array, push the module path in @INC inside a BEGIN block (use BEGIN and END blocks).
# b) Add module path in env variable PERL5LIB and Export PERL5LIB
# c) use lib <path of the package>

# Create a package test.pm - Note that file name and package name must be same

package test; # file name is test.pm

use strict;
use warnings;

use Exporter; # Exporter module exports variables and functions to it's user namespace.

our @ISA = qw(Exporter); # Make test module a child of Exporter module

# Export sub addSkills and hash %skillsExp
our @EXPORT = qw(addSkills %skillsExp);  # 
our @EXPORT_OK = qw(getSkillsExp); # Fully qualified name is required when called in another script - Both for function and a variable - Both for use and require cases



our %skillsExp = (Perl => 5);# Scope of the variable must be "our" in order to export variable globally.

sub addSkills {
	my ($skill, $exp) = @_;
	$skillsExp{$skill} = $exp;
	print "key-value pair added in hash\n";
}

sub getSkillsExp {
	foreach (keys %skillsExp) {
		print $_, "=>", $skillsExp{$_}, "\n";
	}
}


1; # Evaluate code to true