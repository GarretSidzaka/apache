FROM ubuntu:latest
MAINTAINER GarretSidzaka <GarretSidzaka@2enp.com>

VOLUME ["/var/www"]

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
      apache2

RUN a2enmod rewrite

EXPOSE 80
EXPOSE 443
