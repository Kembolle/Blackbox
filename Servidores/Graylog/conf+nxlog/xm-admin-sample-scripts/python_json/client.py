#!/usr/bin/python

import socket
import ssl
import sys

HOST, PORT = '127.0.0.1', 7070
CA = 'keys/ca.pem'
CERT = 'keys/client-cert.pem'
KEY = 'keys/client-key.pem'

if len(sys.argv) < 2:
    print sys.argv[0], "requires at least one argument"
    exit(1)

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.settimeout(1)
wrappedSocket = ssl.wrap_socket(sock, KEY, CERT, ca_certs=CA)

if sys.argv[1] == "serverInfo":
    json = '{ "msg": { "command": "serverInfo" } }'
elif sys.argv[1] == "serverStop":
    json = '{ "msg": { "command": "serverStop" } }'
elif sys.argv[1] == "serverStart":
    json = '{ "msg": { "command": "serverStart" } }'
elif sys.argv[1] == "serverRestart":
    json = '{ "msg": { "command": "serverRestart" } }'
elif sys.argv[1] == "getFile":
    json = '{ "msg": { "command": "getFile", "params": \
    { "filetype": "conf", "filename": "log4ensics.conf" } } }'
elif sys.argv[1] == "moduleInfo":
    json = '{ "msg": { "command": "serverInfo" } }'
else:
    print "Unknown command ", sys.argv[1]


headers = ["POST / HTTP/1.1",
           "Content-Type: application/json",
           "Content-Length: " + str(len(json)),
           "", json]

wrappedSocket.connect((HOST, PORT))
wrappedSocket.send("\r\n".join(headers))
print wrappedSocket.recv(2048)

wrappedSocket.close()
