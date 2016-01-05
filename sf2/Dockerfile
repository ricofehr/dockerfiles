FROM nginx:latest
MAINTAINER Eric Fehr Eric.fehr@publicis-modem.fr
LABEL description="Custom sf2 container"

RUN sed -i "s/user  nginx;/user  www-data;/" /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/
COPY 00-fpmupstream.conf /etc/nginx/conf.d/
COPY docker-entrypoint.sh /tmp/

# Enable non-free and contrib packages
RUN /bin/sed -i "s;jessie main;jessie main contrib non-free;" /etc/apt/sources.list

# Install some other php5 extensions
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y --force-yes
RUN DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y --force-yes
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php5-intl php5-mcrypt php5-mysql php5-xsl php5-gd php5-ldap php5-xsl php5-xmlrpc php5-tidy php5-mhash php5-imap php5-fpm php5-curl
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-client libcurl4-openssl-dev libldap2-dev \
        libicu-dev libxml2-dev libfreetype6-dev \
        libjpeg62-turbo-dev libmcrypt-dev libpng12-dev \
        libbz2-dev php-pear curl git sudo \
        && rm -r /var/lib/apt/lists/* \
        && ln -fs /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/

# some custom php.ini conf
COPY php.ini /etc/php5/fpm/
COPY php.ini_cli /etc/php5/cli/php.ini

# Ensure that php can write sessions into the container
RUN chmod 777 /var/lib/php5

# Fix permission for macos volume share ?
RUN usermod -u 1000 www-data

ENTRYPOINT [ "/tmp/./docker-entrypoint.sh" ]
