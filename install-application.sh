#!/bin/bash

if [ -f bower.json ]
then
    echo "Installing bower dependencies"
    bower install --allow-root --config.interactive=false
fi

if [ -f package.json ]
then
    echo "Installing npm dependencies"
    npm install
fi
	   
if [ -f composer.json ]
then
    echo "Installing composer dependencies"
    curl -sS https://getcomposer.org/installer | php
    php composer.phar install
fi

if [ -f php.ini ]
then
    echo "Installing custom php.ini"
    mkdir -p /etc/php5/apache2/conf.d
    mv php.ini /etc/php5/apache2/conf.d/99-application.ini
fi

if [ -f ssmtp.conf ]
then
    echo "Installing ssmtp.conf"
    cp ssmtp.conf /etc/ssmtp/
fi

