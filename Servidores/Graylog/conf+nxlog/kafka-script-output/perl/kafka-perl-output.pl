use strict;
use warnings;

use Log::Nxlog;
use Scalar::Util qw( blessed);
use Try::Tiny;

use Kafka::Connection;
use Kafka::Producer;

sub write_data
{

my $broker = 'localhost';
my $port = 9092;
my @brokers = ('localhost:9092', '192.168.88.35:19092');
my $broker_list = \@brokers;
my $topic = 'nxlog';
my $partition = 0;
my $key = 'nxlog';
my $compression = 1; # NONE = 0, GZIP = 1, SNAPPY = 2, LZ4 = 3

   my ($event) = @_;
   my $rawevt = Log::Nxlog::get_field($event, 'raw_event');

my ( $connection, $producer );
    try {

        #$connection = Kafka::Connection->new( host => 'localhost' );
        $connection = Kafka::Connection->new( broker_list => $broker_list );

        $producer = Kafka::Producer->new( Connection => $connection );

        my $response = $producer->send($topic, $partition, $rawevt, $key, $compression);
    } catch {
        my $error = $_;
        if ( blessed( $error ) && $error->isa( 'Kafka::Exception' ) ) {
            warn 'Error: (', $error->code, ') ',  $error->message, "\n";
        } else {
            die $error;
        }
    };
# Closes the producer and cleans up
undef $producer;
$connection->close;
undef $connection;
}

