#!/usr/bin/perl

#The shebang line is the first line of code in a Perl script and usually looks like this: #!/usr/bin/perl
#The shebang line is the path to the Perl binary, and allows programmers to invoke Perl scripts directly instead of passing the script filename as an argument to Perl itself.
#However, the shebang line is not mandatory, and reduces the portability of Perl scripts (by requiring execute permissions and maintaining the shebang). It also obfuscates which 
#version of Perl is being called when a script is executed, which can make debugging more difficult.

#By not including the shebang line, programmers can write one-less line of code and retain modularity by separating the behaviour of the script from the executing programme.
#perl perl-example-1.pl #this works fine

# Without shebang line in Perl script
#$ ./perl-example-1.pl
#Unable to initialize device PRN

# With shebang line in Perl script
#$ ./perl-example-1.pl
#Hello World!

# Wrong path of Perl interpreter in shebang line
#$ ./perl-example-1.pl
#bash: ./perl-example-1.pl: /usr1/bin/perl^M: bad interpreter: No such file or directory

#
# Hello World Program in Perl
#
print "Hello World!\n";

#----------Commenting-----------------
# 1) Use # to comment a single line
# 2) To comment a block of code use =head and =cut (POD - Plain Old Documentation)
# Not only 'head', any string can be used but at the end 'cut' only should be used

=head
This is 
a multi-line
comment
=cut

# 3) Another way for multi-line comment in perl
<<EOF
This is 
a multi-line
comment
EOF



#How to install CPAN Perl modules 

#1) Manual - Download tar.gz file for specific Perl module from https://www.cpan.org/

#tar -xvzf <*.tar.gz>
#cd directory
#perl MakeFile.pl
#make
#make test
#make install

#2) Use CPAN command prompt to install PERL modules

#If cpan is not there use - yum install cpan