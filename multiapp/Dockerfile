FROM oraclelinux:8.3
MAINTAINER ashutoshh@linux.com
ENV x=app 
# this is the way to define ENV variable in docker image
# x will be permanent variable 
# during container creation time we can change the value of x
RUN dnf install httpd -y
RUN mkdir /myapps /myapps/web1  /myapps/web2 /myapps/web3 
COPY app1  /myapps/web1/
COPY app2  /myapps/web2/
COPY app3  /myapps/web3/
COPY docker-entrypoint.sh /myapps/docker-entrypoint.sh
WORKDIR /myapps
RUN chmod +x docker-entrypoint.sh 
# COPY & ADD both can take data from local machine 
# add can also take data from URL 
EXPOSE 80
ENTRYPOINT ["./docker-entrypoint.sh"] 
# so we can't use systemctl bcz in container systemd is not allowed by default
