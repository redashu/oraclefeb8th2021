# COmpose start 

<img src="compose.png">

# Docker compose version history 

[version](https://docs.docker.com/compose/compose-file/)

## INstall docker compose 

[compose]('https://docs.docker.com/compose/install/')

# COMpose examples 

## Example 1 

```
version: "3.8" # compose file version
services: # to define one or more container applications
 ashuapp1: # name of app 
  image: alpine # image 
  container_name: ashuc1 # name of container 
  command: ping 127.0.0.1 # parent process
  restart: always  # restart policy 
  
```

## RUnning compose file

```
❯ docker-compose up  -d
Creating network "composedeploy_default" with the default driver
Creating ashuc1 ... done
❯ docker-compose ps
 Name       Command       State   Ports
---------------------------------------
ashuc1   ping 127.0.0.1   Up      

```
## more instruction 

```
❯ docker-compose   stop
Stopping ashuc1 ... done
❯ docker-compose   start
Starting ashuapp1 ... done
❯ docker-compose   kill
Killing ashuc1 ... done
❯ docker-compose   ps
 Name       Command        State     Ports
------------------------------------------
ashuc1   ping 127.0.0.1   Exit 137        
❯ docker-compose   start
Starting ashuapp1 ... done

```

## Example 2 

```
version: "3.8" # compose file version
services: # to define one or more container applications
 ashuapp1: # name of app 
  image: alpine # image 
  container_name: ashuc1 # name of container 
  command: ping 127.0.0.1 # parent process
  restart: always  # restart policy 

 ashuapp2: # second app
  image: nginx
  container_name: ashuc2
  ports:
   - "1122:80" # - means array in YAML 
  restart: always # best practise to use (optional)

# docker run -d --name ashuc2 -p 1122:80 --restart always nginx 

```

## more commands 

```
6907  docker-compose up -d
 6908  docker-compose ps 
 6909  docker-compose kill 
 6910  docker-compose start  ashuapp1 
 6911  docker-compose ps
 6912  docker-compose kill ashuapp1
 6913  docker-compose start
 6914  docker-compose ps
 6915  docker-compose logs ashuapp1
 6916  docker-compose logs ashuapp2
❯ docker-compose down
Stopping ashuc2 ... done
Stopping ashuc1 ... done
Removing ashuc2 ... done
Removing ashuc1 ... done
Removing network composedeploy_default


```
