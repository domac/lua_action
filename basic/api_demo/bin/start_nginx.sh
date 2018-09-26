#!/usr/bin/bash

OPENRESTY_PATH="/usr/local/openresty"

process_check=`ps -ef|grep "nginx"|grep -v "grep"|wc -l`

if [ $process_check -gt 1 ]
then
    echo "nginx reload ... ..."
    $OPENRESTY_PATH/nginx/sbin/nginx -c /etc/nginx/nginx.conf -s reload
else 
    echo "nginx start ... ..."
    $OPENRESTY_PATH/nginx/sbin/nginx -c /etc/nginx/nginx.conf
fi

process_check=`ps -ef|grep "nginx"|grep -v "grep"|wc -l`

if [ $process_check -gt 1 ]
then
    echo "nginx start success"
else 
    echo "nginx start fail"
fi