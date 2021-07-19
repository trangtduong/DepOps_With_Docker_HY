#!/bin/sh

docker run -it ubuntu:latest sh -c 'apt update; apt install curl -y; echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website;'

# Test inputting helsinki.fi into the application.