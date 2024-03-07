#!/bin/bash

service mysql start 

echo "CREATE DATABASE IF NOT EXISTS \`${MARIA_DB_NAME}\`;" > msql_db.sql
echo "CREATE USER IF NOT EXISTS \`${MARIA_DB_USER}\`@'localhost' IDENTIFIED BY '${MARIA_DB_PASS}';" >> msql_db.sql
echo "GRANT ALL PRIVILEGES ON \`${MARIA_DB_NAME}\`.* TO \`${MARIA_DB_USER}\`@'%' IDENTIFIED BY '${MARIA_DB_PASS}';" >> msql_db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIA_DB_ROOT_PASS}';" >> msql_db.sql
echo "FLUSH PRIVILEGES;" >> msql_db.sql

mysql < msql_db.sql