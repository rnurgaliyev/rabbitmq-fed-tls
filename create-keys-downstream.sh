#!/bin/sh

cd tls-downstream

# Remove any existing stuff
rm -f * 2> /dev/null

# Create new rsa key and certificate request
openssl genrsa -out key.pem 2048
openssl req -new -key key.pem -out req.pem -outform pem -subj /CN=downstream/ -nodes

# Sign x509 certificate
cd ../tls-ca/
openssl ca -config ./openssl.conf -in ../tls-downstream/req.pem -out ../tls-downstream/cert.pem -notext -batch -extensions client_ca_extensions

# Copy CA certificate
cp ./cacert.pem ../tls-downstream/
