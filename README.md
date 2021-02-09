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
 
