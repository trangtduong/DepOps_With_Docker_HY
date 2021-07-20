#!/bin/sh

docker build . -t frontend
docker run -dp 5000:5000 frontend