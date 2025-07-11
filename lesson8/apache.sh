#!/bin/bash

if [[ "$HOSTNAME" == "server" && ! -e /etc/ssl/private/som.local.key ]]; then 
   sudo apt install apache2 -y
  sudo apt install openssl -y

  sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/som.local.key -out /etc/ssl/certs/som.local.crt \
    -subj "/C=RU/ST=NSK/L=NSK/O=Test/CN=som.local"

    sudo cp /etc/ssl/certs/som.local.crt /usr/local/share/ca-certificates/
    #sudo update-ca-certificates
    sudo cp /usr/local/share/ca-certificates/som.local.crt /vagrant/ssl

  echo "127.0.0.1 som.local www.som.local" | sudo tee -a /etc/hosts

  sudo tee /etc/apache2/sites-available/som.local.conf > /dev/null <<EOF
<VirtualHost *:80>
    ServerName som.local
    ServerAlias www.som.local
    Redirect / https://som.local/
</VirtualHost>

<VirtualHost *:443>
    ServerName som.local
    DocumentRoot /opt/apache/www

    SSLEngine on
    SSLCertificateFile /etc/ssl/certs/som.local.crt
    SSLCertificateKeyFile /etc/ssl/private/som.local.key
    <Directory /opt/apache/www>
            Options Indexes FollowSymLinks
            AllowOverride None
            Require all granted
    </Directory>
</VirtualHost>
EOF

  sudo mkdir -p /opt/apache/www
  sudo tee /opt/apache/www/index.html > /dev/null <<EOF
  <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>somssite</title>
</head>
<body>
    <h1>Hello from Apach2 HTTPS </h1>

</body>
</html>
EOF
  sudo chown -R www-data:www-data /opt/apache/www
  sudo chmod -R 755 /opt/apache/www
  sudo a2dissite 000-default.conf
  sudo a2enmod ssl
  sudo a2ensite som.local.conf
  sudo systemctl restart apache2
fi


if [[ "$HOSTNAME" == "client" && ! -e /usr/local/share/ca-certificates/som.local.crt ]]; then
 echo "192.168.1.1 som.local www.som.local" | sudo tee -a /etc/hosts
 sudo cp /vagrant/ssl/som.local.crt /usr/local/share/ca-certificates/
 sudo update-ca-certificates
fi


