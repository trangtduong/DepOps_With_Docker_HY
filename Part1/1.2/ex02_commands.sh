#!/bin/sh

docker container stop third_container
docker container rm first_containter second_container third_container
docker rmi nginx