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