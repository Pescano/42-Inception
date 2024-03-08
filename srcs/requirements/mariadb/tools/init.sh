#!/bin/bash

service mysql start;
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MARIA_DB_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MARIA_DB_USER}\`@'localhost' IDENTIFIED BY '${MARIA_DB_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MARIA_DB_NAME}\`.* TO \`${MARIA_DB_USER}\`@'%' IDENTIFIED BY '${MARIA_DB_PASS}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIA_DB_ROOT_PASS}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$MARIA_DB_ROOT_PASS shutdown
exec mysqld_safe

