# Part 1

## 1.1: Getting started
```
$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS                      PORTS     NAMES
798c3156338a   nginx     "/docker-entrypoint.…"   20 seconds ago   Up 19 seconds               80/tcp    third_container
61ff9f3be127   nginx     "/docker-entrypoint.…"   20 seconds ago   Exited (0) 18 seconds ago             second_container
fca4659c350e   nginx     "/docker-entrypoint.…"   21 seconds ago   Exited (0) 18 seconds ago             first_containter

```

## 1.2: Cleanup
```
$ docker ps -as
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES     SIZE
$ docker images
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE

```

## 1.3: Secret message
Secret message is: 'You can find the source code here: https://github.com/docker-hy'

Commands:
```
docker run -d --rm -it --name uh_ubuntu devopsdockeruh/simple-web-service:ubuntu
docker exec -it uh_ubuntu bash
tail -f ./text.log
```
## 1.4: Missing dependencies
Command:
```
$ docker run -it ubuntu:latest sh -c 'apt update; apt install curl -y; echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website;'
```

Test inputting helsinki.fi into the application.
```
Input website:
helsinki.fi
Searching..
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="https://www.helsinki.fi/">here</a>.</p>
</body></html>
```

## 1.5: Sizes of images
The size of application using ubuntu is 83MB.
The size of application using alpine is 15.7MB.
the secret messange functionality is the same.

```
$ docker images
REPOSITORY                          TAG       IMAGE ID       CREATED        SIZE
devopsdockeruh/simple-web-service   ubuntu    4e3362e907d5   4 months ago   83MB
devopsdockeruh/simple-web-service   alpine    fd312adc88e0   4 months ago   15.7MB
$ docker run -d --rm -it --name uh_alpine devopsdockeruh/simple-web-service:alpine
d689b28be71c264ab6cc66c825b763404bbb72e3ec572a44fb3366680c149548
$ docker exec -it uh_alpine sh
/usr/src/app # tail -f ./text.log
2021-07-18 15:26:48 +0000 UTC
2021-07-18 15:26:50 +0000 UTC
2021-07-18 15:26:52 +0000 UTC
2021-07-18 15:26:54 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
```

## 1.6: Hello Docker Hub
The input is "basics".

```
$ docker run -it devopsdockeruh/pull_exercise
Unable to find image 'devopsdockeruh/pull_exercise:latest' locally
latest: Pulling from devopsdockeruh/pull_exercise
8e402f1a9c57: Pull complete 
5e2195587d10: Pull complete 
6f595b2fc66d: Pull complete 
165f32bf4e94: Pull complete 
67c4f504c224: Pull complete 
Digest: sha256:7c0635934049afb9ca0481fb6a58b16100f990a0d62c8665b9cfb5c9ada8a99f
Status: Downloaded newer image for devopsdockeruh/pull_exercise:latest
Give me the password: basics
You found the correct password. Secret message is:
"This is the secret message"
```

## 1.7: Two line Dockerfile
**Dockerfile**
```
FROM devopsdockeruh/simple-web-service:alpine
CMD server
```
Command to build image web-server:
```
$ docker build . -t web-server
[+] Building 0.2s (5/5) FINISHED                                                                                                                                                           
 => [internal] load build definition from Dockerfile                                                                                                                                  0.2s
 => => transferring dockerfile: 98B                                                                                                                                                   0.0s
 => [internal] load .dockerignore                                                                                                                                                     0.1s
 => => transferring context: 2B                                                                                                                                                       0.0s
 => [internal] load metadata for docker.io/devopsdockeruh/simple-web-service:alpine                                                                                                   0.0s
 => [1/1] FROM docker.io/devopsdockeruh/simple-web-service:alpine                                                                                                                     0.1s
 => exporting to image                                                                                                                                                                0.0s
 => => exporting layers                                                                                                                                                               0.0s
 => => writing image sha256:978fbf315695ef5a3ec2e77ee411c4dcd9aa9b867fbc7ea3d26962545fda0585                                                                                          0.0s
 => => naming to docker.io/library/web-server                                                                                                                                         0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
```
Running the built 'web-server' image:
```
$ docker run web-server
[GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.

[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
 - using env:   export GIN_MODE=release
 - using code:  gin.SetMode(gin.ReleaseMode)

[GIN-debug] GET    /*path                    --> server.Start.func1 (3 handlers)
[GIN-debug] Listening and serving HTTP on :8080
```

## 1.8: Image for script
**Dockerfile**
```
FROM ubuntu:18.04

WORKDIR /urs/src/app

COPY server.sh .

RUN apt update; apt install curl -y

RUN chmod +x server.sh

CMD ./server.sh

```
**Commands**
```
$ docker build . -t curler
[+] Building 1.0s (10/10) FINISHED
[...]
$ docker run -it curler
Input website:
helsinki.fi
Searching..
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="https://www.helsinki.fi/">here</a>.</p>
</body></html>
```

## 1.9: Volumes
```
$ touch text.log
$ docker container run -d -v "$(pwd)/text.log:/usr/src/app/text.log" devopsdockeruh/simple-web-service
66d41cacb032752a439c20fc4f099382dc4fd5f1995abeb99abbd0e27f7bb983
$ cat text.log
2021-07-19 11:23:41 +0000 UTC
2021-07-19 11:23:43 +0000 UTC
2021-07-19 11:23:45 +0000 UTC
2021-07-19 11:23:47 +0000 UTC
2021-07-19 11:23:49 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
```

## 1.10: Ports open
```
$ docker container run -dit -p 8080:8080 --name web-server devopsdockeruh/simple-web-service sh -c 'server'
1d586a88a5e1fd0f50b8193bc40c1ef25a2051eb180361d2e0fd39167f0f4873
$ curl localhost:8080
{"message":"You connected to the following path: /","path":"/"}
```

## 1.11: Spring
**Dockerfile**
```
FROM openjdk:8

EXPOSE 8080

WORKDIR /usr/src/app

COPY ./spring-src .

RUN ./mvnw package
CMD java -jar ./target/docker-example-1.1.3.jar

```

```
$ docker build . -t spring
[+] Building 1.1s (9/9) FINISHED                                                                                                                                                           
[...]                                                                                                                               0.0s
Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
$ docker run -dit -p 8080:8080 spring
90d72afb78b6ed21aa085ce822959cd079a8f1fd2c838108e9a97125550f6ca7
$ curl localhost:8080
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">        <title>Spring</title>
        <meta charset="UTF-8" />

    </head>
    <body style="width: fit-content; padding-top: 3em; margin: auto;">
        <form action="/press" method="post">
            <button class="btn btn-info btn-outline-dark" type="submit">Press here</button>
        </form>
        <p style="width: fit-content; margin: auto;"></p>
    </body>
</html>

```

## 1.12: Hello, frontend!
**Dockerfile**
```
FROM ubuntu:latest

EXPOSE 5000

WORKDIR /urs/src/app

COPY . .

RUN apt update && apt install curl -y
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN apt install nodejs -y
RUN npm install && npm run build && npm install -g serve

CMD serve -s -l 5000 build

```
```
$ docker build . -t frontend
[+] Building 215.1s (12/12) FINISHED  
[...]
$ docker run -dp 5000:5000 frontend
a97da19a411b0675564a540c04021b3659a30a6d06df163db60482f4f9cbf80b
```
**Message in http://localhost:5000:**
Part 1
Exercise 1.12: Congratulations! You configured your ports correctly!

## 1.13: Hello, backend!
**Dockerfile**
```FROM ubuntu

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
```

```
$ docker build . -t backend
[+] Building 117.3s (13/13) FINISHED                                                                     [...]                     
Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
$ docker run -dit -p 8080:8080 backend
735bd850281d5cae18df95bfe615f046eebd56d051a668c3be2c88547747d31b
$ curl localhost:8080/ping
pong
```
