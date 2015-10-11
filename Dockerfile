FROM ubuntu:latest

MAINTAINER llernestal <lars.lernestal@gmail.com>

RUN apt-get update && apt-get install -y apache2
RUN a2enmod proxy proxy_fcgi rewrite

COPY sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf

COPY envvars /etc/apache2/envvars

COPY build.sh /build.sh
RUN chmod 0755 /build.sh
RUN /build.sh

EXPOSE 80

VOLUME ["/var/log/php-fpm"]

COPY start.sh /start.sh
RUN chmod 0755 /start.sh
CMD ["bash", "/start.sh"]
