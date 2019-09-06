#!/bin/bash

# create rootCA certificate
openssl genrsa -out rootCA.key 2048
openssl req -x509 -new -nodes -key rootCA.key -days 1024 -out rootCA.crt -subj "/C=DE/ST=Germany/L=Walldorf/O=SAP SE/OU=Tools/CN=rootCA"

# create server key and certificate
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr -subj "/C=DE/ST=Germany/L=Walldorf/O=SAP SE/OU=Tools/CN=localhost"
openssl x509 -req -in server.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out server.crt -days 500

# create client key and certificate
openssl genrsa -out client.key 2048
openssl req -new -key client.key -out client.csr -subj "/C=DE/ST=Germany/L=Walldorf/O=SAP SE/OU=Tools/CN=client"
openssl x509 -req -in client.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out client.crt -days 500
openssl pkcs12 -export -inkey client.key -in client.crt -name client -out client.p12