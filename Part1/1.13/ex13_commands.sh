#!/bin/sh

docker build . -t backend
docker run -dit -p 8080:8080 backend
curl localhost:8080/ping