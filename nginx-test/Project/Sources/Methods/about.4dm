//%attributes = {"invisible":true}
/*

key.pem,cert.pem was created with the following parameters

openssl
 req -x509
 -newkey rsa:4096
 -keyout key.pem
 -out cert.pem
 -sha256
 -days 3650
 -nodes
 -subj "/C=JP/ST=Tokyo/L=Shibuya/O=4D/OU=Miyako/CN=localhost"

*/