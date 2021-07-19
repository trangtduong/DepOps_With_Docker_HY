#!/bin/sh

docker run -d --rm -it --name uh_ubuntu devopsdockeruh/simple-web-service:ubuntu
docker exec -it uh_ubuntu bash
tail -f ./text.log

# Secret message is: 'You can find the source code here: https://github.com/docker-hy'