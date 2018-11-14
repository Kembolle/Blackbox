#!/usr/bin/python

import boto3
import nxlog

BUCKET = 'MYBUCKET'
SERVER = 'MYSERVER'
# 1000 Keys is the maximum allowed from the AWS API
MAXKEYS = 1000 

POLL_INTERVAL = 30

def save_key(key):
    fo = open('lastkey.log', 'wb', 0)
    fo.write(key)
    fo.close()

def load_key():
    try:
         fo = open('lastkey.log', 'rb', 0)
         key = fo.read()
         fo.close()
         return key
    except IOError:
         return ''

def read_data(module):
    nxlog.log_debug('Checking for new archives')
    #Insert credentials at ~/.aws/credentials
    client = boto3.client('s3')
    #You can hardcode but not advisable 
    #client = boto3.client('s3', aws_access_key_id='XXXXX', aws_secret_access_key='XXXXXXXX')
    lastkey = load_key()
    keycount = MAXKEYS

    while MAXKEYS == keycount:
         if lastkey == '':
              data = client.list_objects_v2(Bucket=BUCKET, Prefix=SERVER, MaxKeys=MAXKEYS);
         else:
              data = client.list_objects_v2(Bucket=BUCKET, Prefix=SERVER, MaxKeys=MAXKEYS, StartAfter=lastkey);

         keycount = data['KeyCount']

         if keycount > 0:
              for obj in data['Contents']:
                   lastkey = obj['Key']
                   raw = client.get_object(Bucket=BUCKET, Key=lastkey)
                   line = raw['Body'].read().decode('utf-8')
                   event = module.logdata_new()
                   event.set_field('raw_event', line)
                   event.post()
                   save_key(lastkey)

    module.set_read_timer(POLL_INTERVAL)
