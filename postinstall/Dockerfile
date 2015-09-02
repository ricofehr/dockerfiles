FROM drush/drush
MAINTAINER Eric Fehr Eric.fehr@publicis-modem.fr
LABEL description="Mainly from official drush docker image, add som extension for mysql"

# install some custom php extension
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y less libfreetype6-dev libjpeg62-turbo-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev libbz2-dev php-pear curl libpq-dev libcurl4-openssl-dev libldap2-dev libicu-dev libxml2-dev libmcrypt-dev \ 
	&& ln -fs /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/ \
	&& docker-php-ext-install mysql pdo pdo_mysql ldap curl intl xmlrpc \
	&& rm /usr/local/etc/php/conf.d/docker-php-ext-pdo.ini \
	&& rm /usr/local/etc/php/conf.d/docker-php-ext-curl.ini

# ensure drush can be executed by all
RUN mv /root/composer /opt
RUN ln -sf /opt/composer/vendor/drush/drush/drush.php /usr/local/bin/drush
RUN chown -R www-data: /opt/composer

# install wp
RUN cd /usr/local/bin && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar wp

# Memory Limit 
RUN echo "memory_limit=1024M" > /usr/local/etc/php/conf.d/memory-limit.ini
# Time Zone 
RUN echo "date.timezone=${PHP_TIMEZONE:-UTC}" > /usr/local/etc/php/conf.d/date_timezone.ini

# launch drush with www-data user
RUN usermod -u 1000 www-data
USER www-data
VOLUME /app
WORKDIR /app/devops/scripts

# launch postinstall.sh script
ENTRYPOINT ["./postinstall.sh"]
