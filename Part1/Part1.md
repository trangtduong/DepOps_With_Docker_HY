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