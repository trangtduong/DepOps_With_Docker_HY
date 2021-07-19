#!/bin/sh

# To publish a port, run the container with -p <host-port>:<container-port>
docker container run -dit -p 8080:8080 --name web-server devopsdockeruh/simple-web-service sh -c 'server'
curl localhost:8080
