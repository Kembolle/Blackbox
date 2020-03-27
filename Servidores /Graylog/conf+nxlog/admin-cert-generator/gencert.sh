#!/bin/sh

SUBJ="/CN=agent-name.exmaple.com/O=nxlog.org/C=HU/ST=state/L=location"
CERTDIR=.

openssl req -new -newkey rsa:2048 -nodes -keyout agent-key.pem -out req.pem -batch -subj "$SUBJ" -config gencert.cnf
openssl x509 -req -days 1 -in req.pem -CA agent-ca.pem -CAkey agent-ca-key.pem -out agent-cert.pem -set_serial 01
rm -f req.pem
