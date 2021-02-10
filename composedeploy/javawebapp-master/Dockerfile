FROM tomcat
MAINTAINER  ashutoshh@linux.com
WORKDIR /usr/local/tomcat/webapps/
RUN mkdir ashuapp
WORKDIR ashuapp
# above directory is the document root of apache tomcat web server 
ADD myapp . 
RUN chmod 755 . -R
EXPOSE 8080
#  CMD or entrypoint bcz standard tomcat img is already have that
# inshort if u don't use cmd / entrypoint so FROM img -- parent process will be 
# your image also 