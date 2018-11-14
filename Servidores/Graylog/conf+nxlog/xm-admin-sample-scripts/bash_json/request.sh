#!/bin/sh

IP=127.0.0.1
PORT=7070
USESSL="--secure-protocol=TLSv1_2 --ca-certificate=keys/ca.pem --certificate=keys/client-cert.pem --private-key=keys/client-key.pem"

wget -q https://$IP:$PORT $USESSL --output-document - --header='Content-Type: application/json' --post-file $1
