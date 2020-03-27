#!/usr/bin/python
import nxlog
import boto3
from botocore.exceptions import ClientError
from datetime import datetime

BUCKET = 'MYBUCKET'
SERVER = 'MYSERVER'

lastdt = datetime.now()

def counter(rdtime, v=[0]):
        global lastdt
        if lastdt < rdtime:
             lastdt = rdtime
             v[0]=0
        v[0]+=1
        return v[0]

def write_data(event):
    nxlog.log_debug('Python alerter received event')


    raw = event.get_field('raw_event')
    rtime = event.get_field('EventReceivedTime')
    dt = datetime.strptime(rtime, "%Y-%m-%d %H:%M:%S")
    key = SERVER + '/' + rtime.replace(' ', '/').replace(':', '.',3) + '.' + str(counter(dt))


    #Insert credentials at ~/.aws/credentials
    client = boto3.client('s3')
    #You can hardcode but not advisable 
    #client = boto3.client('s3', aws_access_key_id='XXXXX', aws_secret_access_key='XXXXXXXX')
    try:
        client.put_object(Body=raw, Bucket=BUCKET, Key=key)
    except ClientError as e:
	nxlog.log_error("Error: {0}".format(e))
