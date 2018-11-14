#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use lib $FindBin::Bin;
use Log::Nxlog;
use MongoDB;
use Try::Tiny;

my $counter;
my $client;
my $collection;
my $cur;
my $count;
my $logfile;

sub read_data_int
{
   $counter //= 1;
   # Connect to the server
   $client //= MongoDB::MongoClient->new(host => 'localhost:27017');

   # Select the database and collection
   $collection //= $client->ns('zips.zips');
   # Sort all existing documents by _id.
   $cur = $collection->find()->sort({_id => 1});

   # Do this only the first time around. Make our cursor immortal.
   if ($counter == 1) {
   $cur->immortal(1);
   }
   $counter++;

   # If any new document exist, process them.
   while ($cur->has_next()) {
       my $event = Log::Nxlog::logdata_new();
       my $obj = $cur->next;
       my $line = "ID: " . $obj->{"_id"} . " City: " . $obj->{"city"} . " Loc: " . $obj->{"loc"}[0] . "," . $obj->{"loc"}[1] . " Pop: " . $obj->{"pop"} . " State: " . $obj->{"state"};
       Log::Nxlog::set_field_string($event, 'raw_event', $line);
       Log::Nxlog::add_input_data($event);
       # Once the document is processed, delete it.
       my $result = $collection->delete_one( { _id => $obj->{"_id"} } );
       #print $logfile "Extracted document with _id: " . $obj->{"_id"} . " Deleting returned: " . $result->deleted_count . "\n";
    }
}

sub read_data
{
   # Use a try/catch block in order to resume when mongodb is unreachable.
   #open ($logfile, '>>', '/tmp/perl-input.log') or die "Could not open log file";
   try {
     read_data_int();
     # Adjust this timer for how often to look for new documents.
     Log::Nxlog::set_read_timer(1);
     } catch {
     #print $logfile "Error thrown: $_ Will retry in 10 seconds.";
     # Adjust this timer for how often to try to reconnect.
     Log::Nxlog::set_read_timer(10);
  };
}
