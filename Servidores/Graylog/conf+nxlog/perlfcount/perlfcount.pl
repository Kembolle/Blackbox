use strict;
use warnings;
use Sys::Hostname;
use JSON;
use Sys::Statistics::Linux; #http://search.cpan.org/dist/Sys-Statistics-Linux/lib/Sys/Statistics/Linux.pm
use FindBin;
use lib "$FindBin::Bin/../../../../src/modules/extension/perl";
#use Log::Nxlog;

use constant false => 0;
use constant true  => 1;


sub read_data
{
	my %settings = get_settings ();
	my %options = (
		sysinfo   => 0,
		cpustats  => 0,
		procstats => 0,
		memstats  => 0,
		pgswstats => 0,
		netstats  => 0,
		sockstats => 0,
		diskstats => 0,
		diskusage => 0,
		loadavg   => 0,
		filestats => 0,
		processes => 0 
	);

	while ( my ( $key, $value ) = each %options )
	{
		$options { $key } =	whichever ( $settings { $key } { sources }, "parse", true );
	}

	my %result = ();
	my $sys_statistics_linux = Sys::Statistics::Linux -> new ( \%options );
	sleep ( 1 );
	my $statistics = $sys_statistics_linux -> get;
	$sys_statistics_linux -> settime ( '%Y-%m-%d %H:%M:%S' );
	$result { 'EventTime' } = $sys_statistics_linux -> gettime;

	my $raw_event_string = $result { 'EventTime' } . " INFO Host " ;

	my $event = Log::Nxlog::logdata_new ();

	if ( whichever ( \%options, "", true ) )
	{
		while ( my ( $module, $values ) = each % { $statistics } )
		{
			while ( my ( $source, $value ) = each % { $values } )
			{
				if ( $settings { $module } { sources } { $source } { parse } )
				{
					my $name = $settings { $module } { sources } { $source } { name };
					$result { $module . "\\" . $name } = $value;
	
					my $property_name = "${module}_${name}";

					if ( $value ^ $value ) {
						Log::Nxlog::set_field_string ( $event, $property_name, $value );
					} else {
						Log::Nxlog::set_field_string ( $event, $property_name, "$value" );
					}

					$raw_event_string = $raw_event_string . " $property_name=$value;" 
				}
			}
		}
	}
	else
	{
		$result { 'error' } = 'There is no input specified';
	}

# 	Below is redundant
#	my $json = canonical_json_string ( \%result );
	Log::Nxlog::set_field_string ( $event, 'raw_event', $raw_event_string );
	Log::Nxlog::add_input_data ( $event );
	Log::Nxlog::set_read_timer ( 5 );
}

sub canonical_json_string
{
	my $string = JSON -> new -> utf8 -> canonical -> encode ( $_[ 0 ] );
	return $string;
}

sub whichever
{
	my ( $sources, $param, $value ) = @_;
	$param = defined $param ? $param : "parse";
	$value = defined $value ? $value : true;
	if ( $param ne '' )
	{
		for my $source ( values %{ $sources } )
		{
			my %_hash_source = %{ $source } ;

			if ( $_hash_source{ $param } eq $value )
			{
				return true;
			}
		}
	}
	else
	{
		while ( my ( $source_key, $source_value ) = each % { $sources } )
		{
			if ( $source_value eq $value )
			{
				return true;
			}
		}
	}
	return false;
}

sub get_settings
{
	my %settings;
	#http://search.cpan.org/dist/Sys-Statistics-Linux/lib/Sys/Statistics/Linux/SysInfo.pm
	$settings { "sysinfo" } { sources } { hostname }   { parse } = true;
	$settings { "sysinfo" } { sources } { hostname }   { name } = "hostname";
	$settings { "sysinfo" } { sources } { domain }     { parse } = false;
	$settings { "sysinfo" } { sources } { domain }     { name } = "domain";
	$settings { "sysinfo" } { sources } { kernel }     { parse } = false;
	$settings { "sysinfo" } { sources } { kernel }     { name } = "kernel";
	$settings { "sysinfo" } { sources } { release }    { parse } = false;
	$settings { "sysinfo" } { sources } { release }    { name } = "release";
	$settings { "sysinfo" } { sources } { version }    { parse } = false;
	$settings { "sysinfo" } { sources } { version }    { name } = "version";
	$settings { "sysinfo" } { sources } { memtotal }   { parse } = true;
	$settings { "sysinfo" } { sources } { memtotal }   { name } = "memtotal";
	$settings { "sysinfo" } { sources } { swaptotal }  { parse } = true;
	$settings { "sysinfo" } { sources } { swaptotal }  { name } = "swaptotal";
	$settings { "sysinfo" } { sources } { uptime }     { parse } = true;
	$settings { "sysinfo" } { sources } { uptime }     { name } = "uptime";
	$settings { "sysinfo" } { sources } { idletime }   { parse } = false;
	$settings { "sysinfo" } { sources } { idletime }   { name } = "idletime";
	$settings { "sysinfo" } { sources } { pcpucount }  { parse } = false;
	$settings { "sysinfo" } { sources } { pcpucount }  { name } = "pcpucount";
	$settings { "sysinfo" } { sources } { tcpucount }  { parse } = false;
	$settings { "sysinfo" } { sources } { tcpucount }  { name } = "tcpucount";
	$settings { "sysinfo" } { sources } { interfaces } { parse } = false;
	$settings { "sysinfo" } { sources } { interfaces } { name } = "interfaces";
	$settings { "sysinfo" } { sources } { arch }       { parse } = false;
	$settings { "sysinfo" } { sources } { arch }       { name } = "arch";
	$settings { "sysinfo" } { sources } { countcpus }  { parse } = false;
	$settings { "sysinfo" } { sources } { countcpus }  { name } = "countcpus";
	#http://search.cpan.org/dist/Sys-Statistics-Linux/lib/Sys/Statistics/Linux/CpuStats.pm
	$settings { "cpustats" } { sources } { user }    { parse } = false;
	$settings { "cpustats" } { sources } { user }    { name } = "user";
	$settings { "cpustats" } { sources } { nice }    { parse } = false;
	$settings { "cpustats" } { sources } { nice }    { name } = "nice";
	$settings { "cpustats" } { sources } { system }  { parse } = false;
	$settings { "cpustats" } { sources } { system }  { name } = "system";
	$settings { "cpustats" } { sources } { idle }    { parse } = true;
	$settings { "cpustats" } { sources } { idle }    { name } = "idle";
	$settings { "cpustats" } { sources } { total }   { parse } = true;
	$settings { "cpustats" } { sources } { total }   { name } = "total";
	$settings { "cpustats" } { sources } { iowait }  { parse } = true;
	$settings { "cpustats" } { sources } { iowait }  { name } = "iowait";
	$settings { "cpustats" } { sources } { irq }     { parse } = false;
	$settings { "cpustats" } { sources } { irq }     { name } = "irq";
	$settings { "cpustats" } { sources } { softirq } { parse } = false;
	$settings { "cpustats" } { sources } { softirq } { name } = "softirq";
	$settings { "cpustats" } { sources } { steal }   { parse } = false;
	$settings { "cpustats" } { sources } { steal }   { name } = "steal";
	#http://search.cpan.org/dist/Sys-Statistics-Linux/lib/Sys/Statistics/Linux/ProcStats.pm
	$settings { "procstats" } { sources } { new }      { parse } = false;
	$settings { "procstats" } { sources } { new }      { name } = "new";
	$settings { "procstats" } { sources } { runqueue } { parse } = false;
	$settings { "procstats" } { sources } { runqueue } { name } = "runqueue";
	$settings { "procstats" } { sources } { count }    { parse } = false;
	$settings { "procstats" } { sources } { count }    { name } = "count";
	$settings { "procstats" } { sources } { blocked }  { parse } = false;
	$settings { "procstats" } { sources } { blocked }  { name } = "blocked";
	$settings { "procstats" } { sources } { running }  { parse } = true;
	$settings { "procstats" } { sources } { running }  { name } = "running";
	#http://search.cpan.org/dist/Sys-Statistics-Linux/lib/Sys/Statistics/Linux/MemStats.pm
	$settings { "memstats" } { sources } { memused }      { parse } = true;
	$settings { "memstats" } { sources } { memused }      { name } = "memused";
	$settings { "memstats" } { sources } { memfree }      { parse } = true;
	$settings { "memstats" } { sources } { memfree }      { name } = "memfree";
	$settings { "memstats" } { sources } { memusedper }   { parse } = true;
	$settings { "memstats" } { sources } { memusedper }   { name } = "memusedper";
	$settings { "memstats" } { sources } { memtotal }     { parse } = true;
	$settings { "memstats" } { sources } { memtotal }     { name } = "memtotal";
	$settings { "memstats" } { sources } { buffers }      { parse } = false;
	$settings { "memstats" } { sources } { buffers }      { name } = "buffers";
	$settings { "memstats" } { sources } { cached }       { parse } = false;
	$settings { "memstats" } { sources } { cached }       { name } = "cached";
	$settings { "memstats" } { sources } { realfree }     { parse } = true;
	$settings { "memstats" } { sources } { realfree }     { name } = "realfree";
	$settings { "memstats" } { sources } { realfreeper }  { parse } = true;
	$settings { "memstats" } { sources } { realfreeper }  { name } = "realfreeper";
	$settings { "memstats" } { sources } { swapused }     { parse } = true;
	$settings { "memstats" } { sources } { swapused }     { name } = "swapused";
	$settings { "memstats" } { sources } { swapfree }     { parse } = true;
	$settings { "memstats" } { sources } { swapfree }     { name } = "swapfree";
	$settings { "memstats" } { sources } { swapusedper }  { parse } = true;
	$settings { "memstats" } { sources } { swapusedper }  { name } = "swapusedper";
	$settings { "memstats" } { sources } { swaptotal }    { parse } = true;
	$settings { "memstats" } { sources } { swaptotal }    { name } = "swaptotal";
	$settings { "memstats" } { sources } { swapcached }   { parse } = false;
	$settings { "memstats" } { sources } { swapcached }   { name } = "swapcached";
	$settings { "memstats" } { sources } { active }       { parse } = false;
	$settings { "memstats" } { sources } { active }       { name } = "active";
	$settings { "memstats" } { sources } { inactive }     { parse } = false;
	$settings { "memstats" } { sources } { inactive }     { name } = "inactive";
	$settings { "memstats" } { sources } { slab }         { parse } = false;
	$settings { "memstats" } { sources } { slab }         { name } = "slab";
	$settings { "memstats" } { sources } { dirty }        { parse } = false;
	$settings { "memstats" } { sources } { dirty }        { name } = "dirty";
	$settings { "memstats" } { sources } { mapped }       { parse } = false;
	$settings { "memstats" } { sources } { mapped }       { name } = "mapped";
	$settings { "memstats" } { sources } { writeback }    { parse } = false;
	$settings { "memstats" } { sources } { writeback }    { name } = "writeback";
	$settings { "memstats" } { sources } { committed_as } { parse } = false;
	$settings { "memstats" } { sources } { committed_as } { name } = "committed_as";
	$settings { "memstats" } { sources } { commitlimit }  { parse } = false;
	$settings { "memstats" } { sources } { commitlimit }  { name } = "commitlimit";
	#http://search.cpan.org/dist/Sys-Statistics-Linux/lib/Sys/Statistics/Linux/PgSwStats.pm
	$settings { "pgswstats" } { sources } { pgpgin }     { parse } = false;
	$settings { "pgswstats" } { sources } { pgpgin }     { name } = "pgpgin";
	$settings { "pgswstats" } { sources } { pgpgout }    { parse } = false;
	$settings { "pgswstats" } { sources } { pgpgout }    { name } = "pgpgout";
	$settings { "pgswstats" } { sources } { pswpin }     { parse } = false;
	$settings { "pgswstats" } { sources } { pswpin }     { name } = "pswpin";
	$settings { "pgswstats" } { sources } { pswpout }    { parse } = false;
	$settings { "pgswstats" } { sources } { pswpout }    { name } = "pswpout";
	$settings { "pgswstats" } { sources } { pgfault }    { parse } = true;
	$settings { "pgswstats" } { sources } { pgfault }    { name } = "pgfault";
	$settings { "pgswstats" } { sources } { pgmajfault } { parse } = true;
	$settings { "pgswstats" } { sources } { pgmajfault } { name } = "pgmajfault";
	#http://search.cpan.org/dist/Sys-Statistics-Linux/lib/Sys/Statistics/Linux/NetStats.pm
	$settings { "netstats" } { sources } { rxbyt }   { parse } = true;
	$settings { "netstats" } { sources } { rxbyt }   { name } = "rxbyt";
	$settings { "netstats" } { sources } { rxpcks }  { parse } = false;
	$settings { "netstats" } { sources } { rxpcks }  { name } = "rxpcks";
	$settings { "netstats" } { sources } { rxerrs }  { parse } = false;
	$settings { "netstats" } { sources } { rxerrs }  { name } = "rxerrs";
	$settings { "netstats" } { sources } { rxdrop }  { parse } = false;
	$settings { "netstats" } { sources } { rxdrop }  { name } = "rxdrop";
	$settings { "netstats" } { sources } { rxfifo }  { parse } = false;
	$settings { "netstats" } { sources } { rxfifo }  { name } = "rxfifo";
	$settings { "netstats" } { sources } { rxframe } { parse } = false;
	$settings { "netstats" } { sources } { rxframe } { name } = "rxframe";
	$settings { "netstats" } { sources } { rxcompr } { parse } = false;
	$settings { "netstats" } { sources } { rxcompr } { name } = "rxcompr";
	$settings { "netstats" } { sources } { rxmulti } { parse } = false;
	$settings { "netstats" } { sources } { rxmulti } { name } = "rxmulti";
	$settings { "netstats" } { sources } { txbyt }   { parse } = true;
	$settings { "netstats" } { sources } { txbyt }   { name } = "txbyt";
	$settings { "netstats" } { sources } { txpcks }  { parse } = false;
	$settings { "netstats" } { sources } { txpcks }  { name } = "txpcks";
	$settings { "netstats" } { sources } { txerrs }  { parse } = false;
	$settings { "netstats" } { sources } { txerrs }  { name } = "txerrs";
	$settings { "netstats" } { sources } { txdrop }  { parse } = false;
	$settings { "netstats" } { sources } { txdrop }  { name } = "txdrop";
	$settings { "netstats" } { sources } { txfifo }  { parse } = false;
	$settings { "netstats" } { sources } { txfifo }  { name } = "txfifo";
	$settings { "netstats" } { sources } { txcolls } { parse } = false;
	$settings { "netstats" } { sources } { txcolls } { name } = "txcolls";
	$settings { "netstats" } { sources } { txcarr }  { parse } = false;
	$settings { "netstats" } { sources } { txcarr }  { name } = "txcarr";
	$settings { "netstats" } { sources } { txcompr } { parse } = false;
	$settings { "netstats" } { sources } { txcompr } { name } = "txcompr";
	$settings { "netstats" } { sources } { ttpcks }  { parse } = false;
	$settings { "netstats" } { sources } { ttpcks }  { name } = "ttpcks";
	$settings { "netstats" } { sources } { ttbyt }   { parse } = false;
	$settings { "netstats" } { sources } { ttbyt }   { name } = "ttbyt";
	#http://search.cpan.org/dist/Sys-Statistics-Linux/lib/Sys/Statistics/Linux/SockStats.pm
	$settings { "sockstats" } { sources } { used }   { parse } = true;
	$settings { "sockstats" } { sources } { used }   { name } = "used";
	$settings { "sockstats" } { sources } { tcp }    { parse } = false;
	$settings { "sockstats" } { sources } { tcp }    { name } = "tcp";
	$settings { "sockstats" } { sources } { udp }    { parse } = false;
	$settings { "sockstats" } { sources } { udp }    { name } = "udp";
	$settings { "sockstats" } { sources } { raw }    { parse } = false;
	$settings { "sockstats" } { sources } { raw }    { name } = "raw";
	$settings { "sockstats" } { sources } { ipfrag } { parse } = false;
	$settings { "sockstats" } { sources } { ipfrag } { name } = "ipfrag";
	#http://search.cpan.org/dist/Sys-Statistics-Linux/lib/Sys/Statistics/Linux/DiskStats.pm
	$settings { "diskstats" } { sources } { major }  { parse } = false;
	$settings { "diskstats" } { sources } { major }  { name } = "major";
	$settings { "diskstats" } { sources } { minor }  { parse } = false;
	$settings { "diskstats" } { sources } { minor }  { name } = "minor";
	$settings { "diskstats" } { sources } { rdreq }  { parse } = false;
	$settings { "diskstats" } { sources } { rdreq }  { name } = "rdreq";
	$settings { "diskstats" } { sources } { rdbyt }  { parse } = true;
	$settings { "diskstats" } { sources } { rdbyt }  { name } = "rdbyt";
	$settings { "diskstats" } { sources } { wrtreq } { parse } = false;
	$settings { "diskstats" } { sources } { wrtreq } { name } = "wrtreq";
	$settings { "diskstats" } { sources } { wrtbyt } { parse } = true;
	$settings { "diskstats" } { sources } { wrtbyt } { name } = "wrtbyt";
	$settings { "diskstats" } { sources } { ttreq }  { parse } = false;
	$settings { "diskstats" } { sources } { ttreq }  { name } = "ttreq";
	$settings { "diskstats" } { sources } { ttbyt }  { parse } = false;
	$settings { "diskstats" } { sources } { ttbyt }  { name } = "ttbyt";
	#http://search.cpan.org/dist/Sys-Statistics-Linux/lib/Sys/Statistics/Linux/DiskUsage.pm
	$settings { "diskusage" } { sources } { total }      { parse } = true;
	$settings { "diskusage" } { sources } { total }      { name } = "total";
	$settings { "diskusage" } { sources } { usage }      { parse } = true;
	$settings { "diskusage" } { sources } { usage }      { name } = "usage";
	$settings { "diskusage" } { sources } { free }       { parse } = true;
	$settings { "diskusage" } { sources } { free }       { name } = "free";
	$settings { "diskusage" } { sources } { usageper }   { parse } = true;
	$settings { "diskusage" } { sources } { usageper }   { name } = "usageper";
	$settings { "diskusage" } { sources } { mountpoint } { parse } = true;
	$settings { "diskusage" } { sources } { mountpoint } { name } = "mountpoint";
	#http://search.cpan.org/dist/Sys-Statistics-Linux/lib/Sys/Statistics/Linux/LoadAVG.pm
	$settings { "loadavg" } { sources } { avg_1 }  { parse } = true;
	$settings { "loadavg" } { sources } { avg_1 }  { name } = "avg_1";
	$settings { "loadavg" } { sources } { avg_5 }  { parse } = true;
	$settings { "loadavg" } { sources } { avg_5 }  { name } = "avg_5";
	$settings { "loadavg" } { sources } { avg_15 } { parse } = true;
	$settings { "loadavg" } { sources } { avg_15 } { name } = "avg_15";
	#http://search.cpan.org/~bloonix/Sys-Statistics-Linux-0.66/lib/Sys/Statistics/Linux/FileStats.pm
	$settings { "filestats" } { sources } { fhalloc }   { parse } = true;
	$settings { "filestats" } { sources } { fhalloc }   { name } = "fhalloc";
	$settings { "filestats" } { sources } { fhfree }    { parse } = true;
	$settings { "filestats" } { sources } { fhfree }    { name } = "fhfree";
	$settings { "filestats" } { sources } { fhmax }     { parse } = true;
	$settings { "filestats" } { sources } { fhmax }     { name } = "fhmax";
	$settings { "filestats" } { sources } { inalloc }   { parse } = true;
	$settings { "filestats" } { sources } { inalloc }   { name } = "inalloc";
	$settings { "filestats" } { sources } { infree }    { parse } = true;
	$settings { "filestats" } { sources } { infree }    { name } = "infree";
	$settings { "filestats" } { sources } { inmax }     { parse } = true;
	$settings { "filestats" } { sources } { inmax }     { name } = "inmax";
	$settings { "filestats" } { sources } { dentries }  { parse } = false;
	$settings { "filestats" } { sources } { dentries }  { name } = "dentries";
	$settings { "filestats" } { sources } { unused }    { parse } = false;
	$settings { "filestats" } { sources } { unused }    { name } = "unused";
	$settings { "filestats" } { sources } { agelimit }  { parse } = false;
	$settings { "filestats" } { sources } { agelimit }  { name } = "agelimit";
	$settings { "filestats" } { sources } { wantpages } { parse } = false;
	$settings { "filestats" } { sources } { wantpages } { name } = "wantpages";
	#http://search.cpan.org/dist/Sys-Statistics-Linux/lib/Sys/Statistics/Linux/Processes.pm
	$settings { "processes" } { sources } { ppid }                  { parse } = false;
	$settings { "processes" } { sources } { ppid }                  { name } = "ppid";
	$settings { "processes" } { sources } { nlwp }                  { parse } = false;
	$settings { "processes" } { sources } { nlwp }                  { name } = "nlwp";
	$settings { "processes" } { sources } { owner }                 { parse } = false;
	$settings { "processes" } { sources } { owner }                 { name } = "owner";
	$settings { "processes" } { sources } { pgrp }                  { parse } = false;
	$settings { "processes" } { sources } { pgrp }                  { name } = "pgrp";
	$settings { "processes" } { sources } { state }                 { parse } = false;
	$settings { "processes" } { sources } { state }                 { name } = "state";
	$settings { "processes" } { sources } { session }               { parse } = false;
	$settings { "processes" } { sources } { session }               { name } = "session";
	$settings { "processes" } { sources } { ttynr }                 { parse } = false;
	$settings { "processes" } { sources } { ttynr }                 { name } = "ttynr";
	$settings { "processes" } { sources } { minflt }                { parse } = false;
	$settings { "processes" } { sources } { minflt }                { name } = "minflt";
	$settings { "processes" } { sources } { cminflt }               { parse } = false;
	$settings { "processes" } { sources } { cminflt }               { name } = "cminflt";
	$settings { "processes" } { sources } { mayflt }                { parse } = false;
	$settings { "processes" } { sources } { mayflt }                { name } = "mayflt";
	$settings { "processes" } { sources } { cmayflt }               { parse } = false;
	$settings { "processes" } { sources } { cmayflt }               { name } = "cmayflt";
	$settings { "processes" } { sources } { stime }                 { parse } = false;
	$settings { "processes" } { sources } { stime }                 { name } = "stime";
	$settings { "processes" } { sources } { utime }                 { parse } = false;
	$settings { "processes" } { sources } { utime }                 { name } = "utime";
	$settings { "processes" } { sources } { ttime }                 { parse } = false;
	$settings { "processes" } { sources } { ttime }                 { name } = "ttime";
	$settings { "processes" } { sources } { cstime }                { parse } = false;
	$settings { "processes" } { sources } { cstime }                { name } = "cstime";
	$settings { "processes" } { sources } { cutime }                { parse } = false;
	$settings { "processes" } { sources } { cutime }                { name } = "cutime";
	$settings { "processes" } { sources } { prior }                 { parse } = false;
	$settings { "processes" } { sources } { prior }                 { name } = "prior";
	$settings { "processes" } { sources } { nice }                  { parse } = false;
	$settings { "processes" } { sources } { nice }                  { name } = "nice";
	$settings { "processes" } { sources } { sttime }                { parse } = false;
	$settings { "processes" } { sources } { sttime }                { name } = "sttime";
	$settings { "processes" } { sources } { actime }                { parse } = false;
	$settings { "processes" } { sources } { actime }                { name } = "actime";
	$settings { "processes" } { sources } { vsize }                 { parse } = false;
	$settings { "processes" } { sources } { vsize }                 { name } = "vsize";
	$settings { "processes" } { sources } { nswap }                 { parse } = false;
	$settings { "processes" } { sources } { nswap }                 { name } = "nswap";
	$settings { "processes" } { sources } { cnswap }                { parse } = false;
	$settings { "processes" } { sources } { cnswap }                { name } = "cnswap";
	$settings { "processes" } { sources } { cpu }                   { parse } = false;
	$settings { "processes" } { sources } { cpu }                   { name } = "cpu";
	$settings { "processes" } { sources } { wchan }                 { parse } = false;
	$settings { "processes" } { sources } { wchan }                 { name } = "wchan";
	$settings { "processes" } { sources } { fd }                    { parse } = false;
	$settings { "processes" } { sources } { fd }                    { name } = "fd";
	$settings { "processes" } { sources } { cmd }                   { parse } = false;
	$settings { "processes" } { sources } { cmd }                   { name } = "cmd";
	$settings { "processes" } { sources } { cmdline }               { parse } = false;
	$settings { "processes" } { sources } { cmdline }               { name } = "cmdline";
	$settings { "processes" } { sources } { size }                  { parse } = false;
	$settings { "processes" } { sources } { size }                  { name } = "size";
	$settings { "processes" } { sources } { resident }              { parse } = false;
	$settings { "processes" } { sources } { resident }              { name } = "resident";
	$settings { "processes" } { sources } { share }                 { parse } = false;
	$settings { "processes" } { sources } { share }                 { name } = "share";
	$settings { "processes" } { sources } { trs }                   { parse } = false;
	$settings { "processes" } { sources } { trs }                   { name } = "trs";
	$settings { "processes" } { sources } { drs }                   { parse } = false;
	$settings { "processes" } { sources } { drs }                   { name } = "drs";
	$settings { "processes" } { sources } { lrs }                   { parse } = false;
	$settings { "processes" } { sources } { lrs }                   { name } = "lrs";
	$settings { "processes" } { sources } { dtp }                   { parse } = false;
	$settings { "processes" } { sources } { dtp }                   { name } = "dtp";
	$settings { "processes" } { sources } { rchar }                 { parse } = false;
	$settings { "processes" } { sources } { rchar }                 { name } = "rchar";
	$settings { "processes" } { sources } { wchar }                 { parse } = false;
	$settings { "processes" } { sources } { wchar }                 { name } = "wchar";
	$settings { "processes" } { sources } { syscr }                 { parse } = false;
	$settings { "processes" } { sources } { syscr }                 { name } = "syscr";
	$settings { "processes" } { sources } { syscw }                 { parse } = false;
	$settings { "processes" } { sources } { syscw }                 { name } = "syscw";
	$settings { "processes" } { sources } { read_bytes }            { parse } = false;
	$settings { "processes" } { sources } { read_bytes }            { name } = "read_bytes";
	$settings { "processes" } { sources } { write_bytes }           { parse } = false;
	$settings { "processes" } { sources } { write_bytes }           { name } = "write_bytes";
	$settings { "processes" } { sources } { cancelled_write_bytes } { parse } = false;
	$settings { "processes" } { sources } { cancelled_write_bytes } { name } = "cancelled_write_bytes";
	return %settings;
	#return \%settings; #return hash reference has much better performance
}
