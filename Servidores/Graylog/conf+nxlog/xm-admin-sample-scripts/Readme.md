You can find sample scrips for the xm_admin module using bash, perl or python
for both the SOAP and JSON part of the module in the appropriate directories. 
Those scripts are by no means completa, but just a starting point for someone
to experiment with the xm_admin module. In all cases there are more than one 
ways to do the same thing and more than one library or program than can 
perform a similar task. You may use a different way to achieve the same goal
and those scripts are just one possible way. 

All scripts use SSL to connect to nxlog and the configuration used is the 
following:

```
<Extension agent_admin>
        Module  xm_admin
        Listen localhost
        SocketType SSL
        CAFile %CERTDIR%/ca.pem
        CertFile %CERTDIR%/server-cert.pem
        CertKeyFile %CERTDIR%/server-key.pem
        KeyPass secret
        Port 7070
        <ACL conf>
                Directory %CONFDIR%
                AllowRead TRUE
                AllowWrite FALSE
        </ACL>
        <ACL tmp>   
                Directory /opt/nxsec/var/lib/nxlog/tmp
                AllowRead TRUE
                AllowWrite TRUE
        </ACL>
</Extension>
```


It is relative easy to use TCP instead of SSL, by mostly stripping away the
SSL related parts from the scripts. Each set of scripts expects a `keys` 
directory where the certificates and keys reside. To create your own set of
self signed keys follow this procedure:

* Create the root certificates 


```
openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key ca.key -sha256 -days 1024 -out ca.pem
```


* Create the client certificates

```
genrsa -out client-key.pem 2048
openssl req -new -key client-key.pem -out client-key.csr
openssl x509 -req -in client-key.csr -CA ca.pem -CAkey ca.key -CAcreateserial -out client-key.pem -days 500 -sha256
```


Similarly create the server certificates. In both cases the important
question to answer appropriately is the Common Name with the FQDN or 
the IP of your system.  
