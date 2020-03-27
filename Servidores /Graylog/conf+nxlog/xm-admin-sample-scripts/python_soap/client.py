#!/usr/bin/python

import sys
from pysimplesoap.client import SoapClient

if len(sys.argv) < 2:
    print sys.argv[0], "requires at least one argument"
    exit(1)


CA = 'keys/ca.pem'
CERT = 'keys/client-cert.pem'
KEY = 'keys/client-key.pem'
LOC = "https://127.0.0.1:7070"
NMSP = "http://log4ensics.com/2010/AdminInterface"

client = SoapClient(location=LOC, ns="adm",
                    namespace=NMSP, cacert=CA, cert=CERT, key_file=KEY)

info = None

if sys.argv[1] == "serverInfo":
    result = client.serverInfo()
    info = result.serverInfoReply
elif sys.argv[1] == "serverStop":
    result = client.serverStop()
    info = result.serverStartReply
elif sys.argv[1] == "serverStart":
    result = client.serverStart()
    info = result.serverStartReply
elif sys.argv[1] == "serverRestart":
    result = client.serverRestart()
    info = result.serverStartReply
elif sys.argv[1] == "getFile":
    result = client.getFile(filetype="conf", filename="log4ensics.conf")
    info = result.getFileReply
elif sys.argv[1] == "moduleInfo":
    result = client.moduleInfo(name=sys.argv[2])
    info = result.moduleInfoReply
else:
    print "Unknown command ", sys.argv[1]

if info:
    for key in dir(info):
        print('{}: {}'.format(key, getattr(info, key)))
