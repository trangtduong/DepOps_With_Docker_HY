#!/bin/sh

docker build . -t spring
docker run -dit -p 8080:8080 spring
curl localhost:8080
