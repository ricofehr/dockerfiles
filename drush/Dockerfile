FROM drush/drush
MAINTAINER Eric Fehr Eric.fehr@publicis-modem.fr
LABEL description="Mainly from official drush docker image, add som extension for mysql"

# install some custom php extension
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-client libcurl4-openssl-dev libldap2-dev libicu-dev libxml2-dev \
	&& ln -fs /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/ \
	&& docker-php-ext-install pdo pdo_mysql ldap curl intl xmlrpc \
	&& rm /usr/local/etc/php/conf.d/docker-php-ext-pdo.ini \
	&& rm /usr/local/etc/php/conf.d/docker-php-ext-curl.ini

# ensure drush can be executed by all
RUN mv /root/composer /opt
RUN ln -sf /opt/composer/vendor/drush/drush/drush.php /usr/local/bin/drush
RUN chown -R www-data: /opt/composer
# launch drush with www-data user
RUN usermod -u 1000 www-data
USER www-data
WORKDIR /app
