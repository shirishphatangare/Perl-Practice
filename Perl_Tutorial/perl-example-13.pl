# The Spreadsheet::ParseExcel module can be used to read information from Excel 95-2003 format files (xls format).
# Spreadsheet::XLSX - Perl extension for reading MS Excel 2007 files (XLSX format)
# Use Spreadsheet::XLSX module to read an excel file and write data to a text file.

use strict;
use warnings;

use Spreadsheet::XLSX;
use POSIX qw(strftime);   
use File::Basename; 

# Read an excel file and write to a text file row-by-row
my $SOURCE_EXCEL_FILE = "resources/source.xlsx";
my $TARGET_TEXT_FILE = "resources/target.txt";

log_info(sprintf("Converting an excel file %s to a text file %s ", $SOURCE_EXCEL_FILE, $TARGET_TEXT_FILE));

# Open target text file in create mode
open (TARGET_TEXT_FILE_HANDLE, '>', $TARGET_TEXT_FILE) or die "Could not open $TARGET_TEXT_FILE\n";
my $excel = Spreadsheet::XLSX -> new ($SOURCE_EXCEL_FILE);

# Traverse through worksheet by worksheet
foreach my $worksheet(@{$excel -> {Worksheet}}) {
	printf("WorkSheet: %s\n", $worksheet->{Name});
	# The local OR operator evaluates the second operand only if the first one is false. So, the MaxRow will get the value of the MinRow if MaxRow is 0
	$worksheet -> {MaxRow} ||= $worksheet -> {MinRow}; 
	# Traverse through row by row
	foreach my $row ($worksheet -> {MinRow} .. $worksheet -> {MaxRow}) { # Using range operator ( .. )
		$worksheet -> {MaxCol} ||= $worksheet -> {MinCol};
		my $row_content = ''; 
		# Traverse through all cols in a row
		foreach my $col ($worksheet -> {MinCol}  ..  $worksheet -> {MaxCol}) { # Using range operator ( .. )
			my $cell = $worksheet -> {Cells} [$row] [$col]; # Access cell using row-col matrix
			my $cell_content = '';
			if ($cell) {
				$cell_content = $cell -> {Val}; # Retrieve value of a cell
			}
			$row_content = $row_content . $cell_content . "\t"; # Create a tab separated row 
		}

		## Clean the data 
		# s/// takes a list of characters on the left and replaces them with characters on the right
		# Replace spaces with comma space
		# g = Replace all occurances
		# i = ignore case
		
		$row_content =~ s/\r|\n//g;  ## Remove CRLF if it's there
		$row_content =~ s/^"//g;  ## Remove double quotes from beginning of record
		$row_content =~ s/"$//g;  ## Remove double quotes from end of record
		$row_content =~ s/"\t/\t/g;  ## Remove double quotes from end of field. Leave the tab(s) alone.
		$row_content =~ s/\t"/\t/g;  ## Remove double quotes from begin of field. Leave the tab(s) alone.
		$row_content =~ s/""/"/g;  ## Replace double double quotes with single double quotes

		## Record the data
		print TARGET_TEXT_FILE_HANDLE sprintf("%s\n",$row_content);
	}
}
close TARGET_TEXT_FILE_HANDLE;

log_info(sprintf("Successfully Converted an excel file %s to a text file %s ", $SOURCE_EXCEL_FILE, $TARGET_TEXT_FILE)); 


sub log_info {
    printf("%s INFO  %s - %s\n", strftime( "%Y-%m-%d %H:%M:%S", localtime ), basename( $0, ".pl" ), @_); # $0 contains the full name of the program being run, as given to the shell
}