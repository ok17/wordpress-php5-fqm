#! /bin/sh

/etc/init.d/nginx start
/etc/init.d/php5-fpm start

while true
do
  sleep 10
done
