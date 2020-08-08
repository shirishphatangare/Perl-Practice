use strict;
use warnings;

use DBI;
use Data::Dumper;
use POSIX qw(strftime);
$| = 1; # forces a flush after every write or print, so the output appears as soon as it's generated rather than being buffered. $| is special perl variable whose default value is 0

my $driver = "Oracle";
my $database = "db_name";
my $dsn = "DBI:$driver:$database";
my $userid = "db_user";
my $passwd = "db_pass";

my $date = strftime( "%Y%m%d", localtime ); 
my $new_snapshot = 25099; 
my $old_snapshot = 25022; 


my $db_handler = DBI->connect($dsn, $userid, $passwd) or die $DBI::errstr;
# Enable autocommit
$db_handler->{AutoCommit} = 'l';

# Parameters as values
#my $db_query = "UPDATE psirt_snapshot set snapshot = $new_snapshot where snapshot = $old_snapshot";

# Parameters as placeholders
my $db_query = "UPDATE psirt_snapshot set snapshot = ? where snapshot = ?";

my $db_statement = $db_handler->prepare($db_query); 

# execute for Parameters as values   
#$db_statement->execute() or die $DBI::errstr;

# execute for Parameters as placeholders
$db_statement->execute($new_snapshot,$old_snapshot) or die $DBI::errstr;

# parameters can also be passed using bind_param() function
#$db_statement->bind_param(1,$new_snapshot);
#$db_statement->bind_param(2,$old_snapshot);
#$db_statement->execute() or die $DBI::errstr;

$db_statement->finish();
# If autocommit is enabled then explicit commit is not required 
# $db_handler->commit or die $DBI::errstr;
$db_handler->disconnect(); 

