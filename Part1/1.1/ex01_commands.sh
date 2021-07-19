#!/bin/sh

# Start 3 containers from image that does not automatically exit, such as nginx, detached.
docker container run -d --name first_containter nginx
docker container run -d --name second_container nginx
docker container run -d --name third_container nginx

# Stop 2 of the containers leaving 1 up.
docker container stop first_containter
docker container stop second_container

# Submit the output for docker ps -a which shows 2 stopped containers and one running.
docker ps -a
