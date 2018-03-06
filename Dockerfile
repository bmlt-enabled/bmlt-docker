FROM ubuntu:16.04

RUN apt-get update \
  && apt-get install -yqq apache2 php libapache2-mod-php php-mcrypt php-mysql git

WORKDIR /opt

ARG BMLT_VERSION=2.10.0

RUN git clone https://bitbucket.org/bmlt/bmlt-root-server.git \
  && cd bmlt-root-server \
  && git checkout -b ${BMLT_VERSION} ${BMLT_VERSION} \
  && mv ./* /var/www/html/ \
  && chown -R www-data: /var/www/html \
  && echo "nameserver 8.8.8.8" >> /etc/resolv.conf

COPY conf/auto-config.inc.php /var/www/html

RUN chmod 0644 /var/www/html/auto-config.inc.php

CMD ["apachectl", "-D", "FOREGROUND"]
