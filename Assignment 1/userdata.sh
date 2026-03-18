#!/bin/bash
set -e

DB_NAME="wordpress"
DB_USER="wpuser"
DB_PASS="ChangeMeStrongPass123!"

dnf update -y
dnf install -y httpd php php-mysqlnd php-fpm wget tar mariadb105 mariadb105-server

systemctl enable --now httpd
systemctl enable --now mariadb

mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost'; FLUSH PRIVILEGES;"

cd /var/www/html
wget -q https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* .
rm -rf wordpress latest.tar.gz

cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/${DB_NAME}/" wp-config.php
sed -i "s/username_here/${DB_USER}/" wp-config.php
sed -i "s/password_here/${DB_PASS}/" wp-config.php

chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html

systemctl restart php-fpm
systemctl restart httpd
