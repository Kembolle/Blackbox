import sys
import nxlog
from kafka import KafkaProducer


def write_data(event):
    topic = 'nxlog'
    servers = 'localhost:9093'
    compression = 'gzip' 
    
    try:
        producer = KafkaProducer(bootstrap_servers=servers, compression_type=compression,
                          security_protocol='SSL',
                          ssl_check_hostname=True,
                          ssl_cafile='CARoot.pem',
                          ssl_certfile='certificate.pem',
                          ssl_keyfile='key.pem')
    except:
        print("Unable to connect:", sys.exc_info()[0])
        raise


    msg = ' - '.join ([event.get_field('EventReceivedTime'), event.get_field('raw_event')]) 
    producer.send(topic, bytes(msg))
    producer.flush()

