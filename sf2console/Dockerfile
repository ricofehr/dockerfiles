FROM php:5.6-cli
MAINTAINER Eric Fehr Eric.fehr@publicis-modem.fr
LABEL description="Launch symfony2 console script"

# install some custom php extension
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        mysql-client libcurl4-openssl-dev libldap2-dev \
        libicu-dev libxml2-dev libfreetype6-dev \
        libjpeg62-turbo-dev libmcrypt-dev libpng12-dev \
        libbz2-dev php-pear curl git \
        && rm -r /var/lib/apt/lists/* \
	&& ln -fs /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/ \
	&& docker-php-ext-install pdo pdo_mysql ldap curl intl xmlrpc \
	&&  docker-php-ext-install mcrypt zip bz2 mbstring \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install gd

# Memory Limit 
RUN echo "memory_limit=1024M" > /usr/local/etc/php/conf.d/memory-limit.ini
# Time Zone 
RUN echo "date.timezone=${PHP_TIMEZONE:-UTC}" > /usr/local/etc/php/conf.d/date_timezone.ini

# launch console with www-data user
RUN usermod -u 1000 www-data
USER www-data
VOLUME ["/app"]
WORKDIR /app
ENTRYPOINT ["php", "app/console"]
