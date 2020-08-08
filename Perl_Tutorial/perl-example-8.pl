use strict;
use warnings;

use DBI;
use Data::Dumper;
$| = 1; # forces a flush after every write or print, so the output appears as soon as it's generated rather than being buffered. $| is special perl variable whose default value is 0


my $driver = "Oracle";
my $database = "db_name";
my $dsn = "DBI:$driver:$database";
my $userid = "db_user";
my $passwd = "db_pass";

my $db_handler = DBI->connect($dsn, $userid, $passwd) or die $DBI::errstr;
$db_handler->{AutoCommit} = 'l';

my $db_query = "SELECT snapshot FROM psirt_snapshot ORDER BY snapshot DESC";
my $db_statement = $db_handler->prepare($db_query);    
$db_statement->execute() or die $DBI::errstr;

# Using fetchrow_hashref() function	
while (my $results = $db_statement->fetchrow_hashref()) { 
# Data Dumper helps to see the structure of the reference, and figure out how to get at the data 
# print Dumper ($results) ;  

# Both prints below work 
# print "$$results{SNAPSHOT}\n"; 
 print "$results->{SNAPSHOT}\n"
}

# Using fetchrow_array() function	
#while (my $results = $db_statement->fetchrow_array()) { 
#        print "$results\n";
#    }	

$db_statement->finish();
# If aucommit is enabled then explicit commit is not required 
# $db_handler->commit or die $DBI::errstr;
$db_handler->disconnect(); 

