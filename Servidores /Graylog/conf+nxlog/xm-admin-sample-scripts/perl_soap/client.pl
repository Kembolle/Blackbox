#!/usr/bin/perl

use warnings;
use SOAP::Lite;
use Switch;

# Do not use "verify_hostname => 0" in a production environment
my $soap = SOAP::Lite->proxy(
    "https://localhost:7070",
    timeout  => 1,
    ssl_opts => [
        verify_hostname => 0,
        SSL_ca_file     => 'keys/ca.pem',
        SSL_cert_file   => 'keys/client-cert.pem',
        SSL_key_file    => 'keys/client-key.pem'
    ]
)->outputxml("true");

my ( $command, $param ) = @ARGV;

if ( not defined $command ) {
    print "$0 needs a command such as serverInfo\n";
    exit 1;
}
else {
    if (   ( not $command =~ m/server/ )
        && ( $command ne 'getLog' )
        && ( not defined $param ) )
    {
        print "This command requires a parameter.\n";
        exit 1;
    }
}

my $result;

switch ($command) {
    case ('serverInfo')    { $result = $soap->serverInfo(); }
    case ('serverStart')   { $result = $soap->serverStart(); }
    case ('serverStop')    { $result = $soap->serverStop(); }
    case ('serverRestart') { $result = $soap->serverRestart(); }
    case ('getLog') {
        $result = $soap->getLog( SOAP::Data->name('size')->value(-1) );
    }
    case ('moduleInfo') {
        $result = $soap->moduleInfo( SOAP::Data->name('name')->value($param) );
    }
    case ('getFile') {
        $result = $soap->getFile(
            SOAP::Data->name('filetype')->value("conf"),
            SOAP::Data->name('filename')->value($param)
        );
    }
    else { print "Unknown command $command\n"; }
}

print $result . "\n";
