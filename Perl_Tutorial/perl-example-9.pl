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
my $snapshot = 25022; 

my $db_handler = DBI->connect($dsn, $userid, $passwd) or die $DBI::errstr;
# Enable autocommit
$db_handler->{AutoCommit} = 'l';

# Parameters as values
#my $db_query = "INSERT INTO psirt_snapshot ( snapshot, snapshot_date ) VALUES ($snapshot, TO_DATE($date, 'YYYYMMDD'))";

# Parameters as placeholders
my $db_query = "INSERT INTO psirt_snapshot ( snapshot, snapshot_date ) VALUES ( ? , TO_DATE( ?, 'YYYYMMDD' ))";

my $db_statement = $db_handler->prepare($db_query); 

# execute for Parameters as values   
#$db_statement->execute() or die $DBI::errstr;

# execute for Parameters as placeholders
#$db_statement->execute($snapshot, $date) or die $DBI::errstr;

# parameters can also be passed using bind_param() function
$db_statement->bind_param(1,$snapshot);
$db_statement->bind_param(2,$date);
$db_statement->execute() or die $DBI::errstr;

$db_statement->finish();
# If autocommit is enabled then explicit commit is not required 
# $db_handler->commit or die $DBI::errstr;
$db_handler->disconnect(); 

