FROM ruby:2.2
MAINTAINER Eric Fehr ericfehr@gmail.com
LABEL description="Install ruby gems and launch rails cmd"

# see update.sh for why all "apt-get install"s have to stay as one long line
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y sudo nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

# see http://guides.rubyonrails.org/command_line.html#rails-dbconsole
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libmysqlclient-dev mysql-client postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*


# create /var/www
RUN mkdir -p /var/www && chown www-data: /var/www

# launch with www-data user
RUN useradd -u 1000 -s /bin/bash -d /home/modem -m modem 

USER modem
ENV GEM_HOME /home/modem/.gems
ENV BUNDLE_APP_CONFIG=/app/.bundle

VOLUME /app
WORKDIR /

RUN gem install bundler

# copy rails script
COPY docker-entrypoint.sh /entrypoint.sh

# launch rails.sh script
ENTRYPOINT ["./entrypoint.sh"]
