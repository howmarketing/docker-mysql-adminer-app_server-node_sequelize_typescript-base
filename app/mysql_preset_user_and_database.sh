#!/bin/bash


echo "We have to start mysql, so service start mysql"
service mysql start

echo "Now, we need to create our user that will be used in this project, so, let`s create him... CREATE USER `docker`@`%` IDENTIFIED BY 'docker_pass'; "
sleep 5

echo "- *** WARNING *** -"
echo "We will drop existent user called docker. If u do NOT wat that please"
echo "You have from now, 15 seconds to abort that pressing CTRL + C "
sleep 15

echo "DROP DATABASE `docker_sequelize_typescript_sample`;"

mysql -u root  <<MY_QUERY
DROP DATABASE `docker_sequelize_typescript_sample`;

REVOKE ALL PRIVILEGES, GRANT OPTION FROM `docker`@`%`;
DROP USER IF EXISTS `docker`;
DROP USER `docker`@`%`;
MY_QUERY

echo "CREATING DATABASE `docker_sequelize_typescript_sample` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -u root  <<MY_QUERY
CREATE DATABASE `docker_sequelize_typescript_sample` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
SELECT User,Host FROM mysql.user;
MY_QUERY


echo "CREATE USER `docker`@`%` IDENTIFIED BY 'docker_pass';"
mysql -u root  <<MY_QUERY
CREATE USER `docker`@`%` IDENTIFIED BY 'docker_pass';
SELECT User,Host FROM mysql.user;
MY_QUERY

mysql -u root  <<MY_QUERY
GRANT ALL PRIVILEGES ON docker.* TO `docker`@`%`;
FLUSH PRIVILEGES;
SHOW GRANTS FOR `docker`@`%`;
MY_QUERY


echo "Setting sql_mode to all by ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"
mysql -u root  <<MY_QUERY
SET         sql_mode="ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION";
SET GLOBAL  sql_mode="ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION";
SET SESSION sql_mode="ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION";

SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;
SELECT @@sql_mode;
MY_QUERY
