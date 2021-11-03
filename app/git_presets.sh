#!/bin/bash

cd /usr/local/apache2/htdocs/app && git init . && git pull https://github.com/howmarketing/sequelize-typescript.git master && ls -lh && echo "MY DIR ${PWD}"
