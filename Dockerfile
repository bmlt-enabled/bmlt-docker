FROM ubuntu:16.04

RUN apt-get update \
  && apt-get install -yqq apache2 php libapache2-mod-php php-mcrypt php-mysql git

WORKDIR /opt

ARG BMLT_VERSION=2.8.12

RUN git clone https://bitbucket.org/bmlt/bmlt-root-server.git \
  && cd bmlt-root-server \
  && git checkout -b ${BMLT_VERSION} ${BMLT_VERSION} \
  && mv ./* /var/www/html/ \
  && chown -R www-data: /var/www/html

CMD ["apachectl", "-D", "FOREGROUND"]
