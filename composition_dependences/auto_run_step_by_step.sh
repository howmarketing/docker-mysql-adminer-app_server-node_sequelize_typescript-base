#!/bin/bash/

echo "Start docker pose upping images already setting up for mysql and server using apache as virtualization network and nodejs"

sudo docker-compose up -d

echo "See docker containers running in 10s"
sleep 10

docker ps

echo "In 10 seconds - exec bash script file updating mysql password authenticat to mysql_native_password for global connection as root user"

sleep 10

sudo docker exec -it composition_dependences_mysqlsrv_1 bash /var/lib/mysql/mysql_set_native_password.sh

echo "Start mysql service to be able to connect through mysql cli library dependences"

sudo docker exec -it composition_dependences_server_app_1 bash service mysql start

echo "Exec git shell script seting up git init and remote to app base repository"

sudo docker exec -it composition_dependences_server_app_1 bash /usr/local/apache2/htdocs/app/git_presets.sh 
