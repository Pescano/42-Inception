#!/bin/bash

service mariadb start

mysql -e "create database if not exists $MARIA_DB_NAME;"
mysql -e "create user if not exists '$MARIA_DB_USER'@'%' identified by '$MARIA_DB_PASS';"
mysql -e "grant all privileges on *.* TO '$MARIA_DB_USER'@'%' with grant option;"
mysql -e "flush privileges;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIA_DB_ROOT_PASS';"
pkill -f mysqld

mysqld
