#!/bin/sh

if test x$1 != x; then
    CLIENTNAME=$1;
else
    CLIENTNAME="winclient.domain.corp"
fi

CLIENTSUBJ="/CN=$CLIENTNAME/O=nxlog.org/C=HU/ST=state/L=location"
CERTDIR=.

openssl req -new -newkey rsa:2048 -nodes -keyout client-key.pem -out req.pem -batch -subj "$CLIENTSUBJ" -config gencert.cnf
openssl x509 -req -days 1024 -in req.pem -CA ca-cert.pem -CAkey ca-key.pem -out client-cert.pem -set_serial 01 -extensions client_cert -extfile gencert.cnf
rm -f req.pem

openssl pkcs12 -export -out client.pfx -inkey client-key.pem -in client-cert.pem -certfile ca-cert.pem
