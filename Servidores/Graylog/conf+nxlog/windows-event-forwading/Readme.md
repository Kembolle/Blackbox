Unfortunately Windows Event Forwarding is a little tricky to set up with NXLog's im_wseventing module.
These scripts are to help with certificate generation using the openssl tool.
The `gencert.cnf` configuration file contains the needed X509 extensions so that the certificates will be generated properly.

* `genca.sh` - generate the CA certificate and private key.
* `gencert-client.sh` - generate the client certificate signed by the CA cert to be imported into the Windows' certificate store. This generates a `client.pfx` that can can be used for the import. It will ask for a password for the pfx file.
* `gencert-server.sh` - generate the server certificate and private key to be used by the im_wseventing module. Use the FQDN of the host as the first argument, e.g. `./gencert-server.sh nxlogserver.domain.corp`

You may want to edit these files to suit your needs.

Make sure to check what was generated with
```
$ openssl x509 -text -in server-cert.pem
$ openssl x509 -text -in client-cert.pem

```

For more details on the actual WEF setup see the [im_wseventing documentation](https://nxlog.co/documentation/nxlog-user-guide/#im_wseventing).

Use at your own risk.
