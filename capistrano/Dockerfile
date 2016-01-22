FROM debian:jessie
MAINTAINER Eric Fehr ricofehr@nextdeploy.io
LABEL description="Capistrano image with symfony and drupal module"

ENV HOME /root

# install ruby
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y --force-yes && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes ruby ruby-dev make ssh && \
    DEBIAN_FRONTEND=noninteractive apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install capistrano
RUN gem install --no-rdoc --no-ri capistrano -v 3.4.0

# install plugins
RUN gem install --no-rdoc --no-ri capdrupal -v 2.0.0
RUN gem install --no-rdoc --no-ri capistrano-symfony -v 1.0.0.rc1

WORKDIR /app
VOLUME /app

ENTRYPOINT [ "cap" ]
