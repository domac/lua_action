#!/usr/bin/bash

OPENRESTY_PATH="/usr/local/openresty"

process_check=`ps -ef|grep "nginx"|grep -v "grep"|wc -l`

if [ $process_check -gt 1 ]
then 
    echo "stop nginx ... ..."
    $OPENRESTY_PATH/nginx/sbin/nginx -c /etc/nginx/nginx.conf -s quit
else 
    echo "nginx has been stopped"
fi