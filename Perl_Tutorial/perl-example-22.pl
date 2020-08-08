# This script is using Animal::Cat

use strict;
use warnings;

use lib 'lib'; # Animal folder is inside directory 'lib'
use Animal::Cat; # Cat.pm inside Animal folder
use Data::Dumper;

use feature 'say';

# Create a new Cat object
my $kitty = new Animal::Cat("Kitty","Richard");

print ref($kitty), "\n";
#Dumper($kitty);

# Calling Cat subroutines on $kitty object
say $kitty->getName();

say $kitty->setName("Lucy");

say $kitty->getName();

say $kitty->getSound();



# Animal::Lion inherites Animal::Cat
use Animal::Lion;

# Create a new Lion object
my $king = new Animal::Lion("Gopu","Tom");

print ref($king), "\n";
#Dumper($king);

# Calling inherited Cat subroutines on $king object
say $king->getName();

say $king->setName("Shera");

say $king->getName();

# getSound() subroutine is overriden in Animal::Lion to change the sound
say $king->getSound();