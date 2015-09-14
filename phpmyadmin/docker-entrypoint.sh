#!/bin/bash
set -e

BLOWFISH="${RANDOM}${RANDOM}"
CONFIGFILE="/var/www/html/config.inc.php"

# set blowfish secret
sed -i "s;%%BLOWFISH%%;${BLOWFISH};" $CONFIGFILE
# if not mysql linked container, echo the target in host file, else add user/password into config file
if [ -n "$DB_HOST" ]; then
	echo "$DB_HOST mysql" >> /etc/hosts
fi

exec "apache2-foreground"
