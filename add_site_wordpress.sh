#!/bin/bash

clear
echo "127.0.0.1 $1 www.$1" >> /etc/hosts
echo "Added: $1 to hosts file"

cd "/tmp"
wget "https://wordpress.org/latest.zip"
unzip latest.zip
mv wordpress "$HOME/Sites/$1"
rm latest.zip

echo "<VirtualHost *:80>" >> /etc/apache2/extra/httpd-vhosts.conf
echo "ServerName $1" >> /etc/apache2/extra/httpd-vhosts.conf
echo "ServerAlias www.$1" >> /etc/apache2/extra/httpd-vhosts.conf
echo "DocumentRoot \"$HOME/Sites/$1\"" >> /etc/apache2/extra/httpd-vhosts.conf
echo "<Directory \"$HOME/Sites/$1\">" >> /etc/apache2/extra/httpd-vhosts.conf
echo "AllowOverride all" >> /etc/apache2/extra/httpd-vhosts.conf
echo "Require all granted" >> /etc/apache2/extra/httpd-vhosts.conf
echo "Order allow,deny" >> /etc/apache2/extra/httpd-vhosts.conf
echo "Allow from all" >> /etc/apache2/extra/httpd-vhosts.conf
echo "</Directory>" >> /etc/apache2/extra/httpd-vhosts.conf
echo "</VirtualHost>" >> /etc/apache2/extra/httpd-vhosts.conf

echo "Restarting apache"
/usr/sbin/apachectl restart
echo "Apache restarted"