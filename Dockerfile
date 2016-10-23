FROM ubuntu:14.04
MAINTAINER Osamu Kashimura <osamu.kashimura.17@gmail.com>

RUN apt-get clean && \
    apt-get update && \
    apt-get install -y software-properties-common && \
    locale-gen en_US.UTF-8 && export LANG=C.UTF-8 && \
    add-apt-repository ppa:ondrej/php5-5.6 && \
    apt-get update && \
    apt-get install -y php5 php5-dev php-pear php5-mysql && \
    apt-get install -y php5-gd php5-curl git php5-fpm php5-xdebug && \
    apt-get install -y nginx

RUN mkdir -p /var/cache/nginx/proxy_cache
ADD docker/data/www.conf /etc/php5/fpm/pool.d/
ADD docker/data/php.ini /etc/php5/fpm/
ADD docker/data/start.sh /etc/
RUN chmod 755 /etc/start.sh

CMD ["/etc/start.sh"]
