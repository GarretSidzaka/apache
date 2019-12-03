FROM ubuntu:latest
MAINTAINER GarretSidzaka <GarretSidzaka@2enp.com>

VOLUME ["/var/www"]

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
      apache2 \
      php7.0 \
      php7.0-cli \
      libapache2-mod-php7.0 \
      php-apcu \
      php-xdebug \
      php7.0-gd \
      php7.0-json \
      php7.0-ldap \
      php7.0-mbstring \
      php7.0-mysql \
      php7.0-pgsql \
      php7.0-sqlite3 \
      php7.0-xml \
      php7.0-xsl \
      php7.0-zip \
      php7.0-soap \
      php7.0-opcache \
      sudo mkdir /etc/apache2/ssl \
      sudo mkdir /etc/apache2/ssl/private \
      sudo chmod 755 /etc/apache2/ssl \
      sudo chmod 710 /etc/apache2/ssl/private \
      composer

COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

EXPOSE 80
EXPOSE 443
CMD ["/usr/local/bin/run"]
