# Email::MIME - easy MIME message handling
# MIME::Lite - low-calorie MIME generator

# MIME::Lite is not recommended. There are a number of alternatives, like Email::MIME or MIME::Entity and Email::Sender, 
# which you should probably use instead. MIME::Lite continues to accrue weird bug reports, 
# and it is not receiving a large amount of refactoring due to the availability of better alternatives.

use strict;
use warnings;

use Email::MIME;
use Email::Sender::Simple qw(sendmail);
use POSIX qw(strftime);   
use File::Basename; 
use Try::Tiny; # to prevent error - Can't call method "catch" without a package or object reference 
use IO::All; 

my $from_address = 'from_address';
my $to_address = 'to_address';

log_info(sprintf('Sending Email to %s',$to_address));

my $subject = "Sending email via Perl Script";

# $_[0] is a sort of alias to the first argument passed to the enclosing subroutine. $_[1] is first arg 
# The array @_ is a local array, but its elements are aliases for the actual scalar parameters.
my $body = sprintf('<h1>Perl Email</h1><br><br> Sending email via Perl Script <br> Email::MIME and Email::Sender::Simple qw(sendmail) Perl modules are used');

my %attachments = ( 'doc_name'             => 'resources/contact_test.xls',
                    'doc_path'             => '/',
                    'doc_mime_type'        => 'application/vnd.ms-excel',
                    'doc_template_name'    => 'spreadsheet' );

my @filename_array = split /\//, $attachments{doc_name};
my $filename = $filename_array[1];

my @parts = (
	Email::MIME->create(
		attributes => {
		   content_type => "text/html", # Allows html tags in body
		   encoding     => "quoted-printable",
		   charset      => "US-ASCII",
		},
		body_str => $body,
	),
	
	Email::MIME->create(
    attributes  => {
        filename     => $filename,
        content_type => $attachments{doc_mime_type},
        disposition  => 'attachment',
        encoding     => 'base64',
        name         => $filename
    },
	 body => io($attachments{doc_name})->all,  
	)
);

my $msg = Email::MIME->create(
	header_str => [
	   From    => $from_address,
	   To      => $to_address,
	   Subject => $subject,
	],
	parts      => [ @parts ],
);

# send the message
try {
	sendmail($msg);
	log_info(sprintf("Successfully sent email.\n"));
} catch {
	log_info(sprintf("Email Send Failed \n"));
};




sub log_info {
    printf("%s INFO  %s - %s\n", strftime( "%Y-%m-%d %H:%M:%S", localtime ), basename( $0, ".pl" ), @_);
}

