FROM ubuntu:16.04

RUN apt-get update \
  && apt-get install -yqq apache2 php libapache2-mod-php php-mcrypt php-mysql git

WORKDIR /opt

ADD entrypoint.sh /opt

RUN git clone https://bitbucket.org/bmlt/bmlt-root-server.git \
  && cd bmlt-root-server \
  && git checkout -b 2.8.11 2.8.11 \
  && mv ./* /var/www/html/ \
  && cd /var/www/html

CMD ["apachectl", "-D", "FOREGROUND"]
