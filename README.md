# Docker day1 REcap 

<img src="cre.png">

## Container namespace & cgroups

<img src="cg.png">

## Remote tcp allow 

```
[root@ip-172-31-93-149 ~]# cat  /etc/sysconfig/docker
# The max number of open files for the daemon itself, and all
# running containers.  The default value of 1048576 mirrors the value
# used by the systemd service unit.
DAEMON_MAXFILES=1048576

# Additional startup options for the Docker daemon, for example:
# OPTIONS="--ip-forward=true --iptables=true"
# By default we limit the number of open files per container
OPTIONS="--default-ulimit nofile=1024:4096 -H tcp://0.0.0.0:2375"

# How many seconds the sysvinit script waits for the pidfile to appear
# when starting the daemon.
DAEMON_PIDFILE_TIMEOUT=10


```

==

```
 6  systemctl daemon-reload 
    7  systemctl restart docker  
    
 ```
 # To remove all non running containers
 
 ```
 ❯ docker  rm  $(docker  ps -aq)
659b34920e2d
689cb14c5d72
1ababee8144d
aebf596da3c2
d155d9067fdf
954744efcdb7
3062504b51ac
11728f488948
0d5d7bcf6e9e
d1d787c08d67
99c27aef1ad1
aeb44a40ccd8

```

## Demo of Cgroups

```
6587  docker  run  -d --name  ashuc2  --memory 200m   busybox ping 127.0.0.1 
 6588  docker  ps
 6589  docker update  ashuc1  --memory 300m 
 6590  docker update  ashuc1  --help
 6591  docker update  ashuc1  --memory-swap  300m 
 6592  docker update  ashuc1  --memory-swap  200m 
 6593  docker update  ashuc1  --memory-swap  200m --force 
 6594  docker  ps
 6595  docker  pause  ashuc1 
 6596  docker  ps
 6597  docker  unpause  ashuc1 
 6598  docker  ps
❯ docker  run  -d --name  ashuc33  --memory 200m  --cpu-shares=30  busybox ping 127.0.0.1

```

## load & save 

```
❯ docker  save -o  hello.tar  alpine:latest
❯ ls
DevopsSRE                 beginner-html-site-styled helmprom                  techienest
OracleUStime_b1           cg.png                    or.token
PHD                       cre.png                   oraclecloud.key
backup                    hello.tar                 pythonapp
❯ docker rm $(docker ps -aq) -f
34f64cb08e06
3efb26c04b62
c804e5f43458
d7ef2b28a35c
❯ docker rmi alpine
Untagged: alpine:latest
Untagged: alpine@sha256:08d6ca16c60fe7490c03d10dc339d9fd8ea67c6466dea8d558526b1330a85930
❯ 
❯ docker load -i  hello.tar
Loaded image: alpine:latest

```

## Removal 

```
6607  docker rm $(docker ps -aq) -f
 6608  docker rmi alpine 
 6609  docker load -i  hello.tar
 6610  history
 6611  docker  images
 6612  docker rmi  $(docker images -q) -f
 
```

# Image registry 

<img src="reg.png">

## SYstemD support in Container 

```
[root@5cfcc08626f5 /]# systemctl start httpd
System has not been booted with systemd as init system (PID 1). Can't operate.
Failed to connect to bus: Host is down

```
## MUlti app docker images

```
6707  docker  build  -t   dockerashu/ows:v002   .  
 6708  docker rm $(docker ps -aq) -f
 6709  docker  run --name ashuc2 -e  x=app1   -d -p 1100:80  dockerashu/ows:v002  
 6710  docker  exec -it ashuc2  bash 
 6711  history
 6712  docker  run --name ashuc2 -e  x=app2   -d -p 1133:80  dockerashu/ows:v002  
 6713  docker  run --name ashuc3 -e  x=app2   -d -p 1133:80  dockerashu/ows:v002  
 6714  docker  run --name ashuc4 -e  x=app3   -d -p 1144:80  dockerashu/ows:v002

```

