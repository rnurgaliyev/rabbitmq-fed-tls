#!/bin/sh

cd tls-ca

# Remove any existing stuff
rm -fR certs 2> /dev/null
rm -fR private 2> /dev/null
rm -f *.cer *.pem index* serial*  2> /dev/null

# Create directories
mkdir certs
mkdir private
chmod 700 private

# Create database and version file
touch index.txt
echo "01" > serial

# Generate self-signed x509 certificate
openssl req -x509 -config ./openssl.conf -newkey rsa:2048 -days 365 -subj /CN=rabbitca/ -out cacert.pem -outform pem -nodes
