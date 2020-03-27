#!/bin/sh

if test x$1 != x; then
    SERVERNAME=$1;
else
    SERVERNAME="nxlogserver.domain.corp"
fi

ISSUERCA=`openssl x509 -in ca-cert.pem -noout -sha1 -fingerprint |sed s/^SHA1\ Fingerprint=//|sed s/://g`

SERVERSUBJ="/CN=$SERVERNAME/O=nxlog.org/C=HU/ST=state/L=location"
CERTDIR=.

openssl req -new -newkey rsa:2048 -nodes -keyout server-key.pem -out req.pem -batch -subj "$SERVERSUBJ" -config gencert.cnf
openssl x509 -req -days 1024 -in req.pem -CA ca-cert.pem -CAkey ca-key.pem -out server-cert.pem -set_serial 01 -extensions server_cert -extfile gencert.cnf
rm -f req.pem

openssl x509 -outform der -in server-cert.pem -out server-cert.crt

echo "##################################################################################"
echo
echo "Use the following for the Subscription Manager string:"
echo "Server=HTTPS://$SERVERNAME:5985/wsman/,Refresh=14400,IssuerCA=$ISSUERCA"
