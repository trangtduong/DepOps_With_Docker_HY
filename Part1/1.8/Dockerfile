FROM ubuntu:18.04

WORKDIR /urs/src/app

COPY server.sh .

RUN apt update; apt install curl -y

RUN chmod +x server.sh

CMD ./server.sh
