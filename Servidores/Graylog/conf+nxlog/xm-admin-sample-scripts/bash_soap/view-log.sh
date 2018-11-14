#!/bin/sh

. ./client_param.sh

ncat -w 1 --ssl --ssl-cert keys/client-cert.pem --ssl-key keys/client-key.pem $HOST $PORT > nxlog.log << __EOF__ && sed -i 's/&#xA;/\n/g' nxlog.log
POST / HTTP/1.1
Content-Type: text/xml;charset=UTF-8
SOAPAction: ""

<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
 <SOAP-ENV:Header/>
 <SOAP-ENV:Body>
  <adm:getLog xmlns:adm="http://log4ensics.com/2010/AdminInterface">
   <size>-1</size>
  </adm:getLog>
 </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
__EOF__ 

