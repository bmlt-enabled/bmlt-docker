FROM ubuntu:16.04

RUN apt-get update \
  && apt-get install -yqq apache2 php libapache2-mod-php php-mcrypt php-mysql git php-dom

WORKDIR /opt

RUN echo "nameserver 8.8.8.8" >> /etc/resolv.conf \
  && git clone -b master https://github.com/littlegreenviper/bmlt-root-server.git \
  && cd bmlt-root-server \
  && mv ./* /var/www/html/ \
  && chown -R www-data: /var/www/html

COPY conf/auto-config.inc.php /var/www/html

RUN chmod 0644 /var/www/html/auto-config.inc.php

CMD ["apachectl", "-D", "FOREGROUND"]
