#!/bin/sh
docker pull devopsdockeruh/simple-web-service:ubuntu
docker pull devopsdockeruh/simple-web-service:alpine
docker images
docker run -d --rm -it --name uh_alpine devopsdockeruh/simple-web-service:alpine
docker exec -it uh_alpine sh
