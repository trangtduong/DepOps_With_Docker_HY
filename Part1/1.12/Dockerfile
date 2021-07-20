FROM ubuntu:latest

EXPOSE 5000

WORKDIR /urs/src/app

COPY . .

RUN apt update && apt install curl -y
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN apt install nodejs -y
RUN npm install && npm run build && npm install -g serve

CMD serve -s -l 5000 build
