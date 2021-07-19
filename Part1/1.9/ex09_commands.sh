#!/bin/sh

# create the file text.log
touch text.log

# start the container with bind mount so that the logs are created into host machine's filesystem
docker container run -d -v "$(pwd)/text.log:/usr/src/app/text.log" devopsdockeruh/simple-web-service

# print text.log
cat text.log
