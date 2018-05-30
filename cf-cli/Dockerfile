# CloudFoundry cf-cli container
FROM ubuntu:16.04
MAINTAINER Eric Fehr ricofehr@nextdeploy.io
LABEL description="cf-cli binary on ubuntu"

# Upgrade system
RUN /bin/sed -i "s;xenial main;xenial main contrib non-free;" /etc/apt/sources.list
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y --force-yes
RUN DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y --force-yes

# Install prerequisites
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget curl git sudo apt-transport-https

# Prepare apt repository
RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add -
RUN echo "deb https://packages.cloudfoundry.org/debian stable main" | sudo tee /etc/apt/sources.list.d/cloudfoundry-cli.list

# Install cli binary
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y --force-yes
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y cf-cli

# Install autopilot plugin
RUN DEBIAN_FRONTEND=noninteractive wget -q https://github.com/contraband/autopilot/releases/download/0.0.6/autopilot-linux
RUN DEBIAN_FRONTEND=noninteractive cf install-plugin -f autopilot-linux

# Install bgd plugin
RUN DEBIAN_FRONTEND=noninteractive cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org
RUN DEBIAN_FRONTEND=noninteractive cf install-plugin -f blue-green-deploy -r CF-Community

# launch cf-cli with www-data user
RUN mkdir -p /var/www
RUN chown www-data: /var/www
RUN usermod -u 1000 www-data
USER www-data
WORKDIR /app

# launch cf cli
CMD ["cf"]
