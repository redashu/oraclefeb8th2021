# Day1 starting 

## understanding OS kernel 

<img src="kernel.png">


## vm vs container 

<img src="cont.png">

## container type 

<img src="ctype.png">

## Container Runtime engine 

<img src="cre.png">


## Docker products 

<img src="dpr.png">

## COnnecting to Remote Docker engine 

```
❯ docker  context  create   oracleDE  --docker  "host=tcp://3.210.139.97:2375"
oracleDE
Successfully created context "oracleDE"
❯ docker  context  ls
NAME                TYPE                DESCRIPTION                               DOCKER ENDPOINT               KUBERNETES ENDPOINT                        ORCHESTRATOR
ashude              moby                                                          tcp://3.84.170.96:2375                                                   
default *           moby                Current DOCKER_HOST based configuration   unix:///var/run/docker.sock   https://52.205.97.11:6443 (ashuproject1)   swarm
oracleDE            moby                                                          tcp://3.210.139.97:2375                                                  
❯ docker  context  use  oracleDE
oracleDE
❯ docker  context  ls
NAME                TYPE                DESCRIPTION                               DOCKER ENDPOINT               KUBERNETES ENDPOINT                        ORCHESTRATOR
ashude              moby                                                          tcp://3.84.170.96:2375                                                   
default             moby                Current DOCKER_HOST based configuration   unix:///var/run/docker.sock   https://52.205.97.11:6443 (ashuproject1)   swarm
oracleDE *          moby                                                          tcp://3.210.139.97:2375                                                  


```

## More options of Docker client 

<img src="dockercli.png">

## Container creation using container images

<img src="cont_create.png">

# Registry 

## public free registry 

[docker Hub](https://hub.docker.com/)

--

[IBM/Redhat](https://quay.io/)


--
 [Fedora](https://registry.fedoraproject.org/)
 
 
 ## Docker search 
 
 ```
 6325  docker  search  python 
 6326  docker  search  mysql
 6327  history
 6328  docker  search  dockerashu
 6329  docker  search  ashutoshh


```

## Docker images storage in Docker ENgine Host 

```
[root@ip-172-31-93-149 ~]# cd /var/lib/docker/
[root@ip-172-31-93-149 docker]# ls
builder  buildkit  containers  image  network  overlay2  plugins  runtimes  swarm  tmp  trust  volumes
[root@ip-172-31-93-149 docker]# cd  image
[root@ip-172-31-93-149 image]# ls
overlay2
[root@ip-172-31-93-149 image]# cd  overlay2/
[root@ip-172-31-93-149 overlay2]# ls
distribution  imagedb  layerdb  repositories.json
[root@ip-172-31-93-149 overlay2]# cd  imagedb/
[root@ip-172-31-93-149 imagedb]# ls
content  metadata
[root@ip-172-31-93-149 imagedb]# cd content/
[root@ip-172-31-93-149 content]# ls
sha256
[root@ip-172-31-93-149 content]# cd sha256/
[root@ip-172-31-93-149 sha256]# ls
22667f53682a2920948d19c7133ab1c9c3f745805c14125859d20cede07f11f9
d23bdf5b1b1b1afce5f1d0fd33e7ed8afbc084b594b9ccf742a5b27080d8a4a8
e32be9a6f71fb552055421fdeebbd6e4075055865d26f7d362cb7a24dd46d735
e50c909a8df2b7c8b92a6e8730e210ebe98e5082871e66edd8ef4d90838cbd25

```

# Container parent process 

<img src="pp.png">

## First ever container 

```
❯ docker  images
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
python       latest    e32be9a6f71f   6 days ago    885MB
busybox      latest    22667f53682a   6 days ago    1.23MB
alpine       latest    e50c909a8df2   10 days ago   5.61MB
java         latest    d23bdf5b1b1b   4 years ago   643MB
❯ 
❯ docker  run    alpine:latest   ping 127.0.0.1
PING 127.0.0.1 (127.0.0.1): 56 data bytes
64 bytes from 127.0.0.1: seq=0 ttl=255 time=0.041 ms
64 bytes from 127.0.0.1: seq=1 ttl=255 time=0.066 ms
64 bytes from 127.0.0.1: seq=2 ttl=255 time=0.043 ms
64 bytes from 127.0.0.1: seq=3 ttl=255 time=0.044 ms
64 bytes from 127.0.0.1: seq=4 ttl=255 time=0.044 ms
64 bytes from 127.0.0.1: seq=5 ttl=255 time=0.045 ms
64 bytes from 127.0.0.1: seq=6 ttl=255 time=0.044 ms
64 bytes from 127.0.0.1: seq=7 ttl=255 time=0.043 ms
^C64 bytes from 127.0.0.1: seq=8 ttl=255 time=0.063 ms

--- 127.0.0.1 ping statistics ---
9 packets transmitted, 9 packets received, 0% packet loss
round-trip min/avg/max = 0.041/0.048/0.066 ms
❯ docker  ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
❯ docker  ps -a
CONTAINER ID   IMAGE           COMMAND            CREATED          STATUS                      PORTS     NAMES
514b58522e78   alpine:latest   "ping 127.0.0.1"   56 seconds ago   Exited (0) 46 seconds ago             jovial_banach

```


## Best practise to create container 

```
❯ docker  run --name  ashuc1  -d   alpine   ping 127.0.0.1
c6e15a538aa40c6f7265212e844fa025d50f3ebd66fe2bf8866b9f495de73783
❯ 
❯ docker  ps
CONTAINER ID   IMAGE           COMMAND            CREATED              STATUS              PORTS     NAMES
c6e15a538aa4   alpine          "ping 127.0.0.1"   4 seconds ago        Up 3 seconds                  ashuc1

```

## Few more docker client instruction for container 

```
6370  docker  run --name  ashuc1  -d   alpine   ping 127.0.0.1 
 6371  docker  ps
 6372  history
 6373  docker  ps
 6374  docker  logs   ashuc1  
 6375  docker  logs  -f  ashuc1  
 6376  history
 6377  docker  ps
 6378  docker  stop  ashuc1
 6379  docker  ps 
 6380  docker  ps  -a
 6381  docker  start  ashuc1
 6382  docker  ps 
 6383  history
 6384  docker  ps 
 6385  docker  kill  ashuc1
 6386  docker  ps 
 6387  docker  start  ashuc1
 6388  docker  ps

```

## child process for container 

```
docker  exec  -d  ashuc1  ping www.google.com   

```

## accessing container shell

```
❯ docker  exec   -it  ashuc1   sh
/ # 
/ # 
/ # uname 
Linux
/ # uname -r
4.14.214-160.339.amzn2.x86_64
/ # cat  /etc/os-release 
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.13.1
PRETTY_NAME="Alpine Linux v3.13"
HOME_URL="https://alpinelinux.org/"
BUG_REPORT_URL="https://bugs.alpinelinux.org/"
/ # exit


```
## removing container persistently 

```
6397  docker  exec   -it  ashuc1   sh 
❯ docker kill ashuc1
ashuc1
❯ docker  rm  ashuc1
ashuc1
❯ docker  ps -a
CONTAINER ID   IMAGE           COMMAND            CREATED          STATUS                      PORTS     NAMES
58e5379f8496   alpine:latest   "ping 127.0.0.1"   10 minutes ago   Exited (0) 10 minutes ago             blissful_leavitt
8c1451dfd81b   alpine          "ping 127.0.0.1"   15 minutes ago   Up 4 minutes                          vinodalphine
be826cb462c2   alpine:latest   "ping 127.0.0.1"   20 minutes ago   Up 20 minutes                         interesting_swartz
514b58522e78   alpine:latest   "ping 127.0.0.1"   22 minutes ago   Exited (0) 22 minutes ago             jovial_banach


```


