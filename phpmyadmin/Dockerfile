FROM php:5.5-apache
MAINTAINER Eric Fehr Eric.fehr@publicis-modem.fr
LABEL description="Php container with phpmyadmin webapps"

# install some custom php extension
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libpng12-dev libjpeg-dev libpq-dev libcurl4-openssl-dev libldap2-dev libicu-dev libxml2-dev libmcrypt-dev wget  \
	&& rm -rf /var/lib/apt/lists/* \
	&& ln -fs /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/ \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd mbstring mysql mysqli \ 
        && docker-php-ext-install curl ldap mcrypt xmlrpc

RUN cd /var/www/html && wget "https://files.phpmyadmin.net/phpMyAdmin/4.4.14.1/phpMyAdmin-4.4.14.1-english.tar.gz" \
	&& tar xvfz phpMyAdmin-4.4.14.1-english.tar.gz && mv phpMyAdmin-4.4.14.1-english/* . \
    && rm -rf phpMyAdmin-4.4.14.1-english

COPY config.inc.php /var/www/html/config.inc.php
COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
