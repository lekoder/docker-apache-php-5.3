#!/bin/bash

NAME='koder/apache-php-5.3'

VERSION=`grep version package.json | sed -e 's/.*version.*"\(.*\)".*/\1/'`
REPO=${NAME}

echo -e "\033[0;32m*** Building docker image\033[0m"
docker build -t ${REPO}:${VERSION} .

echo -e "\033[0;32m*** Remember to push image to repository:\033[0m"
echo -e "\n\033[0;33mdocker push ${REPO}:${VERSION}\033[0m\n"
