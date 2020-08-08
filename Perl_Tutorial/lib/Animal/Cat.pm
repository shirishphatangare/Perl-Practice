# package is iteself a class in perl

package Animal::Cat;

use strict;
use warnings;


# Constructor - name is 'new' here but it can be anything
sub new {
	my $className = shift; # Get the class Name- Class name is passed to constructor by default everytime an object is created.
	
	# Create an array reference or a hash reference to read Constructor parameters
	my $self = {
		name => shift,
		owner => shift
	};
	
	# bless function to relate an $self to the class $className
	# bless function creates an object reference by blessing a reference to the package's class
	bless $self, $className;
	return $self; 
}


sub getName {
	my ($self) = @_; # object ref is passed as a parameter when a subroutine is called on an object.
	return $self->{name};
}


sub setName {
	my ($self, $name) = @_;
	$self->{name} = $name if defined $name;
	return $self->{name};
}

sub getSound {
	my ($self) = @_; # object ref is passed as a parameter when a subroutine is called on an object.
	return $self->{name}, " says MEOW!\n";
}

1;