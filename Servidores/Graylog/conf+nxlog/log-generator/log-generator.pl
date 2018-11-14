#!/usr/bin/perl -w

use warnings;
use strict;
use Data::Dumper;
use Time::HiRes qw(usleep);
use POSIX qw(strftime);
use Carp;

local $| = 1;

#######################################################################################
# CONF

my $conf = 
{
    'delay' => 1000,
    'hostnames' => 20,
    'usernames' => 40,
    'modulenames' => 10,
    'ipaddresses' => 250,
    'entropychange' => 10000,
    'datadir' => "./",
};


#######################################################################################

for ( my $i = 0; $i <= $#ARGV; $i++ )
{
    if ( $ARGV[$i] =~ /^-{1,2}([^=]+)=(.+)/ )
    {
	$conf->{$1} = $2;
    }
    elsif ( $ARGV[$i] =~ /^-{1,2}(.+)/ )
    {
	$conf->{$1} = $ARGV[$i + 1];
	$i++;
    }
    else 
    {
	print STDERR "invalid argument: $ARGV[$i]\n";
	exit 1;
    }
}

my $variables = {};
my @usernames;
my @hostnames;
my @wordlist;
my @templatelines;
my @ip4addresses;
my @winservices;

my @nxlogmodulenames;
my @nxlogmoduletypes = (
    'im_tcp', 'im_udp', 'im_ssl', 'im_uds','im_checkpoint','im_odbc', 'im_file', 
    'im_kern','im_android', 'im_hpaudit', 'im_mark', 'im_dbi', 'im_internal', 'im_exec', 
    'im_http', 'im_testgen', 'im_mseventlog', 'im_msvistalog', 
);

my @syslogfacilities = (
    "USER", "SYSLOG", "DAEMON", "KERN", "MAIL", "AUTH", "LPR", "NEWS", "UCP", "CRON", "AUTHPRIV",
    "FTP",  "NTP",  "AUDIT",  "FACALERT", "CRON2", "LOCAL0", "LOCAL1", "LOCAL2", "LOCAL3",
    "LOCAL4", "LOCAL5", "LOCAL6", "LOCAL7"
    );

my @syslogseverities = (
    "INFO", "ERR","ERROR", "NOTICE", "ALERT", "CRIT", "CRITICAL", "DEBUG", "EMERG", "EMERGENT",
    "PANIC", "NONE", "WARNING", "WARN",
    );
my @severities = (
    "DEBUG", "INFO", "WARNING", "ERROR", "PANIC", 
    );

my @interfacenames = (
    "in", "out", "inbound", "outbound", "dmz", "eth0", "eth1", "eth2", "eth3", "eth4", "eth5",
    "ppp0", "ppp1", "ppp2", "ppp3", "ppp4", "tun0", "tun1", "tun2", "tun3", "inet", "inet1",
    "inet2", "inet3", 
    );

my @devicenames = (
    "USBLP1", "USBLP2", "USBLP3", "USBLP4", "USBLP5", "USBLP6", "USBLP7", "USBLP8", "USBLP9",
    "ljet01", "ljet02",  "ljet03", "ljet04", "ljet05", "ljet06", "ljet07", "ljet08", "ljet09",
    "ipp01",  "ipp02", "ipp03", "ipp04", "ipp05", "ipp06", "ipp07", "ipp08", "ipp09",
    );

my %templates = (
    "cisco_acs" => "template_cisco_acs.json",
    "cisco_pix" => "template_cisco_pix_asa.json",
    "randtext" => "template_randtext.json",
    "access_log" => "template_access_log.json",
    "windows" => "template_windows.json",
    "login_failure" => "template_login_failure.json",
    "print_cups" => "template_print_cups.json",
    );

# Random x usernames from the dictionary
my @userlist;
open(INPUT, $conf->{datadir} . '/' . "usernames.txt") || croak($!);
foreach my $line ( <INPUT> )
{
    chomp($line);
    push(@userlist, $line);
}
for ( my $i = 0; $i < $conf->{usernames} ; $i++ )
{
    push(@usernames, $userlist[int(rand($#userlist + 1))]);
}

# Words
open(INPUT, $conf->{datadir} . '/' . "wordlist.txt") || croak($!);
foreach my $line ( <INPUT> )
{
    chomp($line);
    push(@wordlist, $line);
}
close(INPUT);

# Services
open(INPUT, $conf->{datadir} . '/' . "winservices.txt") || croak($!);
foreach my $line ( <INPUT> )
{
    chomp($line);
    push(@winservices, $line);
}
close(INPUT);

#random x hostnames from the dictionary
my @hostlist;
open(INPUT, $conf->{datadir} . '/' . "hosts.txt") || croak($!);
foreach my $line ( <INPUT> )
{
    chomp($line);
    push(@hostlist, $line);
}
for ( my $i = 0; $i < $conf->{hostnames} ; $i++ )
{
    push(@hostnames, $hostlist[int(rand($#hostlist + 1))]);
}



close(INPUT);

# generate x random module names
for ( my $i = 0; $i < $conf->{modulenames} ; $i++ )
{
    my $num = int(rand(10));
    my $name = "mod_test" . $num;
    push(@nxlogmodulenames, $name);
}

foreach my $template ( keys(%templates) )
{
    open(INPUT, $conf->{datadir} . '/' . $templates{$template}) || croak("$templates{$template}: " . $!);
    foreach my $line ( <INPUT> )
    {
	chomp($line);
	next if ( $line =~ /^\s*$/ );
	push(@templatelines, $line);
    }
    close(INPUT);
}

# generate IPs
for ( my $i = 0; $i < $conf->{ipaddresses}; $i++ )
{
    my $ip = '';
    for ( my $j = 0; $j < 4; $j++ )
    {
	if ( $j > 0 )
	{
	    $ip .= '.';
	    $ip .= int(rand(254));
	}
	else
	{
	    $ip .= 1 + int(rand(254));
	}
    }
    push(@ip4addresses, $ip);
}


# main

my $evtcnt = 0;
for ( ; ; )
{
    my $tempnum = int(rand($#templatelines + 1));
    my $template = $templatelines[$tempnum];
    $variables = {};
    while ( $template =~ /\@([^@]+)\@/ )
    {
	next if ( $template =~ /^\#/ );
	my $value = get_variable($1);
	$template =~ s/\@([^@]+)\@/$value/;
    }
    if ( $template =~ /^\s*$/ )
    {
	croak ("empty output for $templatelines[$tempnum]");
    }
    print "$template\n";
    $evtcnt++;
    if ( $evtcnt > $conf->{entropychange} )
    { # after every millionth event record change the entropy
	$usernames[int(rand($#usernames + 1))] = $userlist[int(rand($#userlist + 1))];
	$hostnames[int(rand($#hostnames + 1))] = $hostlist[int(rand($#hostlist + 1))];
    }
    usleep($conf->{delay});
}


# subs

sub get_variable
{
    my ( $varname ) = @_;

    my $retval;
    if ( defined($variables->{$varname}) )
    {
	return $variables->{$varname};
    }

    if ( $varname eq 'IP4ADDRESS' )
    {
	$retval = $ip4addresses[int(rand($#ip4addresses + 1))];
    }
    elsif ( $varname eq 'TIMESTAMP-ISO' )
    {
	my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time());
	$retval = sprintf("%d-%02d-%02d %02d:%02d:%02d", ($year + 1900), ($mon + 1), $mday, $hour, $min, $sec);
    }
    elsif ( $varname eq 'TIMESTAMP-SYSLOG' )
    {
	$retval = strftime("%b %d %H:%M:%S", localtime(time()));
    }
    elsif ( $varname eq 'TIMESTAMP-SYSLOG-CISCO' )
    {
	$retval = strftime("%b %d %Y %H:%M:%S", localtime(time()));
    }
    elsif ( $varname eq 'TIMESTAMP-APACHE' ) #14/Mar/2010:06:29:43
    {
	$retval = strftime("%d/%b/%y:%H:%M:%S", localtime(time()));
    }
    elsif ( $varname eq 'NXLOGMODULENAME' )
    {
	$retval = $nxlogmodulenames[int(rand($#nxlogmodulenames + 1))];
    }
    elsif ( $varname eq 'NXLOGMODULETYPE' )
    {
	$retval = $nxlogmoduletypes[int(rand($#nxlogmoduletypes + 1))];
    }
    elsif ( $varname eq 'SYSLOGFACILITYVALUE' )
    {
	$retval = int(rand($#syslogfacilities + 1));
    }
    elsif ( $varname eq 'SYSLOGFACILITY' )
    {
	my $fac = $variables->{'SYSLOGFACILITYVALUE'};
	if ( ! defined($fac) )
	{
	    $fac = int(rand($#syslogfacilities + 1));
	}
	$retval = $syslogfacilities[$fac];
    }
    elsif ( $varname eq 'SYSLOGSEVERITYVALUE' )
    {
	$retval = int(rand($#syslogseverities + 1));
    }
    elsif ( $varname eq 'SYSLOGSEVERITY' )
    {
	my $sev = $variables->{'SYSLOGSEVERITYVALUE'};
	if ( ! defined($sev) )
	{
	    $sev = int(rand($#syslogseverities + 1));
	}
	$retval = $syslogseverities[$sev];
     }
    elsif ( $varname eq 'SEVERITYVALUE' )
    {
	$retval = int(rand($#severities + 1));
    }
    elsif ( $varname eq 'SEVERITY' )
    {
	my $sev = $variables->{'SEVERITYVALUE'};
	if ( ! defined($sev) )
	{
	    $sev = int(rand($#severities + 1));
	}
	$retval = $severities[$sev];
    }
    elsif ( $varname eq 'HOSTNAME' )
    {
	$retval = $hostnames[int(rand($#hostnames + 1))];
    }
    elsif ( $varname eq 'USERNAME' )
    {
	$retval = $usernames[int(rand($#usernames + 1))];
    }
    elsif ( $varname eq 'SERVERNAME' )
    {
	$retval = 'srv' . $hostnames[int(rand($#hostnames + 1))];
    }
    elsif ( $varname eq 'SHORTINT' )
    {
	$retval = int(rand(256));
    }
    elsif ( $varname eq 'LONGINT' )
    {
	$retval = int(rand(1000000000));
    }
    elsif ( $varname eq 'CATEGORYNAME' )
    {
	$retval = "FIXME";
    }
    elsif ( $varname eq 'PORTNUMBER' )
    {
	$retval = int(rand(65535));
    }
    elsif ( $varname eq 'URL' )
    {
	$retval = generate_URL();
    }
    elsif ( $varname eq 'PATH' )
    {
	$retval = generate_PATH();
    }
    elsif ( $varname eq 'TEXT' )
    {
	$retval = generate_TEXT();
    }
    elsif ( $varname eq 'INTERFACENAME' )
    {
	$retval = $interfacenames[int(rand($#interfacenames + 1))];
    }
    elsif ( $varname eq 'DEVICENAME' )
    {
	$retval = $devicenames[int(rand($#devicenames + 1))];
    }
    elsif ( $varname eq 'WINSERVICE' )
    {
	$retval = $winservices[int(rand($#winservices + 1))];
    }
    elsif ( $varname eq 'WORD' )
    {
	$retval = $wordlist[int(rand($#wordlist + 1))];
    }
    elsif ( $varname eq 'GUID' )
    {
	$retval = sprintf("%08x-%04x-%04x-%04x-%08x", 
			  int(rand(99999999)), int(rand(9999)), int(rand(9999)),
			  int(rand(9999)), int(rand(99999999)));
    }

    $variables->{$varname} = $retval;

    if ( (! defined $retval) || ($retval eq '') )
    {
	croak("undefined/empty $varname");
    }

    return $retval;
}


sub generate_TEXT
{
    my $wordnum = 5 + int(rand(30));
    my $retval = "$wordnum ";

    for ( my $i = 0; $i < $wordnum; $i++ )
    {
	if ( ($i > 0) && ($i % 3 > 0) )
	{
	    
	    $retval .= ' ';
	}
	$retval .= $wordlist[int(rand($#wordlist + 1))];
    }

    return $retval;
}


sub generate_URL
{
    my $wordnum = 1 + int(rand(6));
    my $retval = "http://";

    for ( my $i = 0; $i < $wordnum; $i++ )
    {
	if ( $i > 0 )
	{
	    $retval .= '/';
	}

	$retval .= $wordlist[int(rand($#wordlist + 1))];
	if ( $i == 0 )
	{
	    $retval .= '.com';
	}
    }

    return $retval;
}



sub generate_PATH
{
    my $wordnum = 1 + int(rand(5));
    my $retval = "/";

    for ( my $i = 0; $i < $wordnum; $i++ )
    {
	if ( $i > 0 )
	{
	    $retval .= '/';
	}

	$retval .= $wordlist[int(rand($#wordlist + 1))];
    }

    return $retval;
}
