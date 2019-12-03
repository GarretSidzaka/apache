FROM ubuntu:latest
MAINTAINER GarretSidzaka <GarretSidzaka@2enp.com>

VOLUME ["/var/www"]

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
      apache2 \
      php \
      libapache2-mod-php \
      php-common \
      php-mbstring \
      php-xmlrpc \
      php-soap \
      php-gd \
      php-xml \
      php-intl \
      php-mysql \
      php-cli \
      php-zip \
      php-curl \
      composer && \
    mkdir /etc/apache2/ssl && \
    mkdir /etc/apache2/ssl/private && \
    chmod 755 /etc/apache2/ssl && \
    chmod 710 /etc/apache2/ssl/private

COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

EXPOSE 80
EXPOSE 443
CMD ["/usr/local/bin/run"]
