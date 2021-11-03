#!/bin/bash

mysql -u root -pdocker --execute="ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'docker';"
