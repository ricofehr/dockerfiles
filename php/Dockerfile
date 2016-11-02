FROM php:7.0-cli
MAINTAINER Eric Fehr ricofehr@nextdeploy.io
LABEL description="Php with some other cmds"

RUN DEBIAN_FRONTEND=noninteractive apt-get update

# Install Git
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git-core

RUN groupmod -g 1000 www-data
RUN usermod -u 1000 www-data
RUN mkdir -p /var/www
RUN chown www-data: /var/www

USER www-data
