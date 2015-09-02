FROM php:5.6-cli
MAINTAINER Eric Fehr Eric.fehr@publicis-modem.fr
LABEL description="container for execute wp cmd inside wordpress documentroot"

# install some custom php extension
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y less libfreetype6-dev libjpeg62-turbo-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev libbz2-dev php-pear curl libpq-dev libcurl4-openssl-dev libldap2-dev libicu-dev libxml2-dev libmcrypt-dev \
	&& rm -rf /var/lib/apt/lists/* \
	&& ln -fs /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/ \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install gd mbstring mysql \ 
        && docker-php-ext-install curl ldap mcrypt xmlrpc

RUN cd /usr/local/bin && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar wp

# Suppose current host user has uid 1000, it keep well permission on volume share
RUN usermod -u 1000 www-data

WORKDIR /app
VOLUME /app

RUN chown -R www-data: /app
USER www-data
ENTRYPOINT ["wp"]
