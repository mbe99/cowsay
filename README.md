# cowsay

## named Debian Container starten

```
$ docker run -it --name cowsay --hostname cowsay debian bash
root@cowsay:/#
root@cowsay:/# exit
exit
root@ubuntu-xenial:~#

```

    $ docker history debian

### reconnect Container - Install cowsaw und fortune im Container

```
root@ubuntu-xenial:~# docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                      PORTS               NAMES
0c03e21afcdf        debian              "bash"              23 minutes ago      Exited (0) 20 minutes ago                       cowsay
root@ubuntu-xenial:~# docker start 0c03e21afcdf
root@ubuntu-xenial:~# docker exec -it 0c03e21afcdf bash
root@cowsay:/# apt-get update
....
Fetched 7877 kB in 7s (1089 kB/s)
Reading package lists... Done

root@cowsay:/# apt-get install -y cowsay fortune
....
update-alternatives: using /usr/bin/file-rename to provide /usr/bin/rename (rename) in auto mode
Processing triggers for libc-bin (2.24-11+deb9u4) ...
root@cowsay:/#

```

### testen im Container
```` 
root@cowsay:/# /usr/games/fortune |/usr/games/cowsay
 ________________________________________
/ I don't know half of you half as well  \
| as I should like; and I like less than |
| half of you half as well as you        |
| deserve.                               |
|                                        |
\ -- J. R. R. Tolkien                    /
 ----------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
root@cowsay:/# exit
exit
root@ubuntu-xenial:~#

````

### Docker Image vom Container erstellen

````
root@ubuntu-xenial:~# docker commit cowsay cowsay:1-0
sha256:3394945165c33c08027a694632a9fad04b358764f33a83c8aa9015b25111d90b

root@ubuntu-xenial:~# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
cowsay              1-0                 3394945165c3        30 seconds ago      159MB
root@ubuntu-xenial:~#

````

### Image Veränderung Debian zu Cowsay

````
root@ubuntu-xenial:~# docker history debian
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
0af60a5c6dd0        12 days ago         /bin/sh -c #(nop)  CMD ["bash"]                 0B
<missing>           12 days ago         /bin/sh -c #(nop) ADD file:e4bdc12117ee95eaa…   101MB

root@ubuntu-xenial:~# docker history cowsay:1-0
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
3394945165c3        2 minutes ago       bash                                            58.7MB
0af60a5c6dd0        12 days ago         /bin/sh -c #(nop)  CMD ["bash"]                 0B
<missing>           12 days ago         /bin/sh -c #(nop) ADD file:e4bdc12117ee95eaa…   101MB
root@ubuntu-xenial:~#
````


## Image mit Dockerfile erstellen

```
vi Dockerfile
FROM debian:wheezy
RUN apt-get update && apt-get install -y cowsay fortune

# docker build -t cowsay:1-1 .

# # docker run cowsay:1-1 /usr/games/cowsay "muuh"
 ______
< muuh >
 ------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
root@ubuntu-xenial:~#


```

### um Entrypoint erweiteren
```` 
# vi Dockerfile
FROM debian:wheezy
RUN apt-get update && apt-get install -y cowsay fortune
ENTRYPOINT ["/usr/games/cowsay"]

# docker build -t cowsay:1-2 .

# docker run cowsay:1-2 "muuh"
 ______
< muuh >
 ------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
root@ubuntu-xenial:~#


````



