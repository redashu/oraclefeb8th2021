#!/bin/bash

if  [  "$x" == "app1" ]
then
 cp -rf /myapps/web1/*  /var/www/html/
 httpd -DFOREGROUND 

elif  [ "$x" == "app2" ]
then
 cp -rf /myapps/web2/*  /var/www/html/
 httpd -DFOREGROUND

elif  [ "$x" == "app3" ]
then
 cp -rf /myapps/web3/*  /var/www/html/
 httpd -DFOREGROUND

else 
echo "Hello 404, Wrong page please check your ENV var " >/var/www/html/index.html
httpd -DFOREGROUND

fi 
