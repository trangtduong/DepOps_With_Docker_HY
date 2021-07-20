FROM ubuntu

EXPOSE 8080

WORKDIR /urs/src/app

COPY . .

RUN apt-get update && apt-get upgrade && apt install curl gcc -y

RUN curl -L -0 https://golang.org/dl/go1.16.6.linux-amd64.tar.gz --output go1.16.6.linux-amd64.tar.gz 
RUN tar -xzvf go1.16.6.linux-amd64.tar.gz -C /usr/local/
ENV PATH=$PATH:/usr/local/go/bin

RUN go build
RUN go test ./...
CMD ./server
