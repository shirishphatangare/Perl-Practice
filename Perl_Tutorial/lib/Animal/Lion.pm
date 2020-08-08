# package is iteself a class in perl

package Animal::Lion;

use strict;
use warnings;

# Inherit constructor, subroutines and properties of Animal::Cat
our @ISA = qw(Animal::Cat);

sub getSound {
	my ($self) = @_; # object ref is passed as a parameter when a subroutine is called on an object.
	return $self->{name}, " says GURR!\n";
}

1;