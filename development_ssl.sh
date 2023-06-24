sudo apt-get install openssl
mkdir -p ~/.ssl
$(cd ~/.ssl ;  openssl req -new -newkey rsa:2048 -sha1 -days 365 -nodes -x509 -keyout server.key -out server.crt)
echo "127.0.0.1 localhost.ssl" | sudo tee -a /etc/hosts
# Add https://localhost:3001 as exception in server certificates for your browser.

#thin start -p 3001 --ssl --ssl-key-file ~/.ssl/server.key --ssl-cert-file ~/.ssl/server.crt
