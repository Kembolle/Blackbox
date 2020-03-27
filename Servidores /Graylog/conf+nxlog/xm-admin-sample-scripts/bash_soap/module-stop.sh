#!/bin/sh

. ./client_param.sh

ncat -w 1 --ssl --ssl-cert keys/client-cert.pem --ssl-key keys/client-key.pem $HOST $PORT << __EOF__
POST / HTTP/1.1
Content-Type: text/xml;charset=UTF-8
SOAPAction: ""

<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
 <SOAP-ENV:Header/>
 <SOAP-ENV:Body>
  <adm:moduleStop xmlns:adm="http://log4ensics.com/2010/AdminInterface">
    <name>xm_soapadmin</name>
  </adm:moduleStop>
 </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
__EOF__

