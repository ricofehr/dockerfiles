FROM teamrock/symfony2:nginx
MAINTAINER Eric Fehr Eric.fehr@publicis-modem.fr
LABEL description="Mainly from the teamrock2 dockerfile, add only some custom cmd"

# Install some other php5 extensions
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php5-ldap php5-xsl php5-xmlrpc php5-tidy php5-mhash php5-imap

# Ensure that php can write sessions into the container
RUN chmod 777 /var/lib/php5

# Fix permission for macos volume share ?
RUN usermod -u 1000 www-data

ENTRYPOINT [ "/bin/bash", "/tmp/run.sh" ]
