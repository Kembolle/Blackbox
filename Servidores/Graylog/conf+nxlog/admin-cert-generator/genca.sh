#!/bin/sh

SUBJ="/CN=ca/O=nxlog.org/C=HU/ST=state/L=location"
openssl req -x509 -nodes -newkey rsa:2048 -keyout agent-ca-key.pem -out agent-ca.pem -batch -subj "$SUBJ" -config gencert.cnf

