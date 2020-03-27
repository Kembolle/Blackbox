#!/bin/sh

SUBJ="/CN=NXLog-WEF-CA/O=nxlog.org/C=HU/ST=state/L=location"
openssl req -x509 -nodes -newkey rsa:2048 -keyout ca-key.pem -out ca-cert.pem -batch -subj "$SUBJ" -config gencert.cnf
openssl x509 -outform der -in ca-cert.pem -out ca-cert.crt
