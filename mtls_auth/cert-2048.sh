# Generate the CA Key and Certificate
openssl req -x509 -sha256 -newkey rsa:2048 -keyout ca.key -out ca.crt -days 356 -nodes -subj '/CN=Fern Cert Authority'
# Generate the Server Key, and Certificate and Sign with the CA Certificate
openssl req -new -newkey rsa:2048 -keyout server.key -out server.csr -nodes -subj '/CN=mstakx.com'
openssl x509 -req -sha256 -days 365 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt
# Generate the Client Key, and Certificate and Sign with the CA Certificate
openssl req -new -newkey rsa:2048 -keyout client.key -out client.csr -nodes -subj '/CN=Fern'
openssl x509 -req -sha256 -days 365 -in client.csr -CA ca.crt -CAkey ca.key -set_serial 02 -out client.crt
