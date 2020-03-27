#!/usr/bin/perl
use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Request::Common;
use JSON;
use Switch;

my $ua = LWP::UserAgent->new(
    ssl_opts => {
        SSL_ca_file   => './keys/ca.pem',
        SSL_cert_file => './keys/client-cert.pem',
        SSL_key_file  => './keys/client-key.pem'
    }
);
$ua->timeout(1);
my $req = POST 'https://127.0.0.1:7070';

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

my $json;

switch ($command) {
    case ('serverInfo') {
        $json = encode_json( { "msg" => { "command" => "serverInfo" } } );
        $req->header(
            'Content-Type'   => 'application/json',
            'Content-Length' => length($json)
        );
    }
    case ('serverStart') {
        $json = encode_json( { "msg" => { "command" => "serverStart" } } );
        $req->header(
            'Content-Type'   => 'application/json',
            'Content-Length' => length($json)
        );
    }
    case ('serverStop') {
        $json = encode_json( { "msg" => { "command" => "serverStop" } } );
        $req->header(
            'Content-Type'   => 'application/json',
            'Content-Length' => length($json)
        );
    }
    case ('serverRestart') {
        $json = encode_json( { "msg" => { "command" => "serverRestart" } } );
        $req->header(
            'Content-Type'   => 'application/json',
            'Content-Length' => length($json)
        );
    }
    case ('getLog') {
        $json = encode_json(
            {
                "msg" => { "command" => "getLog", "params" => { "size" => -1 } }
            }
        );
        $req->header(
            'Content-Type'   => 'application/json',
            'Content-Length' => length($json)
        );
    }
    case ('moduleInfo') {
        $json = encode_json(
            {
                "msg" => {
                    "command" => "moduleInfo",
                    "params"  => { "name" => $param }
                }
            }
        );
        $req->header(
            'Content-Type'   => 'application/json',
            'Content-Length' => length($json)
        );
    }
    case ('getFile') {
        $json = encode_json(
            {
                "msg" => {
                    "command" => "getFile",
                    "params"  => { "filetype" => "conf", "filename" => $param }
                }
            }
        );
        $req->header(
            'Content-Type'   => 'application/json',
            'Content-Length' => length($json)
        );
    }
    else { print "Unknown command $command\n"; }
}

$req->content($json);
my $res = $ua->request($req);

if ( $res->is_success ) {
    print $res->decoded_content;
}
else {
    print $res->status_line . "\n";
}
exit 0;
