# Spreadsheet::WriteExcel - The Excel file produced by this module is compatible with Excel 97, 2000, 2002, 2003 and 2007 xls format.
# Excel::Writer::XLSX - Create a new Excel file in the Excel 2007+ XLSX format.
# All new features will go into Excel::Writer::XLSX and Spreadsheet::WriteExcel will be in maintenance mode only.

# Use Excel::Writer::XLSX module to create an excel file and write data to it from a text file.

use strict;
use warnings;

use Excel::Writer::XLSX;  
use POSIX qw(strftime);   
use File::Basename;                              
 
my $workbook = Excel::Writer::XLSX->new( 'resources/perl.xlsx' );    

my $worksheet1 = $workbook->add_worksheet("New-WS1");                   
$worksheet1->write( 'A1', 'Hi Excel!' );    # Write in cell Ath Column and 1st row

my $worksheet2 = $workbook->add_worksheet("New-WS2");                   
$worksheet2->write( 'B3', 'First Excel Sheet!' );   # Write in cell Bth Column and 3rd row                
 
$workbook->close(); 

# Read tab separated text file contents and write them to an excel sheet row-by-row

my $SOURCE_TEXT_FILE = "resources/source.txt";
my $TARGET_EXCEL_FILE = "resources/target.xlsx";

log_info(sprintf("Converting a text file %s to an excel sheet %s ", $SOURCE_TEXT_FILE, $TARGET_EXCEL_FILE));

# Open SOURCE_TEXT_FILE in read mode
open (SOURCE_TEXT_FILE_HANDLE, $SOURCE_TEXT_FILE) or die "Could not open $SOURCE_TEXT_FILE\n";
# Below statement will also work to open file for reading
#open (SOURCE_TEXT_FILE_HANDLE, '<', $SOURCE_TEXT_FILE) or die "Could not open $SOURCE_TEXT_FILE\n";

my $workbook_new  = Excel::Writer::XLSX->new($TARGET_EXCEL_FILE);
my $worksheet_new = $workbook_new->add_worksheet('WS');
	
my $row = 0;
# Iterate text file line by line
#while (my $tmp = <SOURCE_TEXT_FILE_HANDLE>) { OR
while (<SOURCE_TEXT_FILE_HANDLE>) {
	chomp $_; #  remove the last trailing newline from the input string.
	
	# Split on single tab
	my @Fld = split('\t', $_); # $_ special perl variable for a default parameter, in case no parameter is explicitly used.
 
	my $col = 0;
	foreach my $token (@Fld) {
		$worksheet_new->write($row, $col, $token);
		$col++;
	}
	$row++;
}

log_info(sprintf("Successfully created an excel sheet %s ", $TARGET_EXCEL_FILE));

# File::Basename functions
#fileparse - split a pathname into pieces
#($name,$path,$suffix) = fileparse($fullname,@suffixlist);

#basename - extract just the filename from a path
#$basename = basename($fullname,@suffixlist);

#dirname - extract just the directory from a path
#$dirname = dirname($fullname);


my $fullname = $0;
printf("Full name of script is -  %s \n", $fullname);
(my $name, my $path, my $suffix) = fileparse($fullname,".pl");
printf("Name - %s, PATH - %s, SUFFIX - %s \n",$name,$path,$suffix);
my $dirname = dirname($fullname);
printf("Directory name is - %s \n",$dirname);

sub log_info {
    printf("%s INFO  %s - %s\n", strftime( "%Y-%m-%d %H:%M:%S", localtime ), basename( $0, ".pl" ), @_); # $0 contains the full name of the program being run, as given to the shell
}


