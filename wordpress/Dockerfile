FROM wordpress:latest
MAINTAINER Eric Fehr Eric.fehr@publicis-modem.fr
LABEL description="add some others php extension than wordpress original image"

# install some custom php extension
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libpq-dev libcurl4-openssl-dev libldap2-dev libicu-dev libxml2-dev libmcrypt-dev \
	&& rm -rf /var/lib/apt/lists/* \
	&& ln -fs /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/ \
	&& docker-php-ext-install mbstring \ 
        && docker-php-ext-install curl ldap mcrypt xmlrpc

# Suppose current host user has uid 1000, it keep well permission on volume share
RUN usermod -u 1000 www-data

WORKDIR /var/www/html
VOLUME /var/www/html
