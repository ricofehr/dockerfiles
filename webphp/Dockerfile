FROM php:5.5-apache
MAINTAINER Eric Fehr Eric.fehr@publicis-modem.fr
LABEL description="Php container with local share into /var/www/html folder"

# install some custom php extension
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libpng12-dev libjpeg-dev libpq-dev libcurl4-openssl-dev libldap2-dev libicu-dev libxml2-dev libmcrypt-dev \
	&& rm -rf /var/lib/apt/lists/* \
	&& ln -fs /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/ \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd mbstring pdo pdo_mysql \ 
        && docker-php-ext-install curl ldap mcrypt xmlrpc

# Suppose current host user has uid 1000, it keep well permission on volume share
RUN usermod -u 1000 www-data

WORKDIR /var/www/html
VOLUME /var/www/html
